@interface _DKComplicationMonitor
+ (id)entitlements;
- (void)asyncUpdateCurrentActiveComplicationsContext;
- (void)fetchActiveComplications:(id)a3;
- (void)start;
- (void)stop;
@end

@implementation _DKComplicationMonitor

+ (id)entitlements
{
  return &unk_26D86D728;
}

- (void)start
{
  if ([(_DKMonitor *)self instantMonitorNeedsActivation])
  {
    objc_initWeak(&location, self);
    v3 = [(_DKMonitor *)self queue];
    v4 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x263EF8400], 0, 0, v3);
    timer = self->_timer;
    self->_timer = v4;

    v6 = self->_timer;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __31___DKComplicationMonitor_start__block_invoke;
    block[3] = &unk_264714918;
    objc_copyWeak(&v18, &location);
    dispatch_block_t v7 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_INHERIT_QOS_CLASS, QOS_CLASS_UTILITY, 0, block);
    dispatch_source_set_event_handler(v6, v7);

    dispatch_resume((dispatch_object_t)self->_timer);
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __31___DKComplicationMonitor_start__block_invoke_2;
    v15[3] = &unk_264714940;
    objc_copyWeak(&v16, &location);
    v8 = (void *)MEMORY[0x22A629CE0](v15);
    v9 = [(_DKMonitor *)self queue];
    notify_register_dispatch("com.apple.ClockKit.activeComplicationsChangedNotification", self->_tokens, v9, v8);

    v10 = [(_DKMonitor *)self queue];
    notify_register_dispatch("com.apple.sockpuppet.complications.updated", &self->_tokens[1], v10, v8);

    v11 = [MEMORY[0x263F57730] sharedInstance];
    v12 = [v11 getPairedDevices];

    if ([v12 count])
    {
      v13 = [(_DKMonitor *)self lastUpdate];

      if (!v13)
      {
        v14[0] = MEMORY[0x263EF8330];
        v14[1] = 3221225472;
        v14[2] = __31___DKComplicationMonitor_start__block_invoke_3;
        v14[3] = &unk_264714788;
        v14[4] = self;
        [MEMORY[0x263F61E30] runBlockWhenDeviceIsClassCUnlocked:v14];
      }
    }

    objc_destroyWeak(&v16);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
}

- (void)stop
{
  if ([(_DKMonitor *)self instantMonitorNeedsDeactivation])
  {
    notify_cancel(self->_tokens[0]);
    self->_tokens[0] = -1;
    notify_cancel(self->_tokens[1]);
    self->_tokens[1] = -1;
    timer = self->_timer;
    dispatch_source_cancel(timer);
  }
}

- (void)fetchActiveComplications:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x263F57730] sharedInstance];
  v6 = [v5 getActivePairedDevice];

  if (v6)
  {
    NRWatchOSVersionForRemoteDevice();
    int IsGreaterThanOrEqual = NRVersionIsGreaterThanOrEqual();
    if (IsGreaterThanOrEqual) {
      v8 = @"CLKActiveComplications";
    }
    else {
      v8 = @"activeComplications";
    }
    if (IsGreaterThanOrEqual) {
      v9 = @"com.apple.ClockKit.activeComplications";
    }
    else {
      v9 = @"com.apple.sockpuppet.activeComplications";
    }
    v10 = (void *)[objc_alloc(MEMORY[0x263F57520]) initWithDomain:v9 pairedDevice:v6];
    id v11 = (id)[v10 synchronize];
    v12 = [v10 objectForKey:v8];

    v19[0] = 0;
    v19[1] = v19;
    v19[2] = 0x3032000000;
    v19[3] = __Block_byref_object_copy__0;
    v19[4] = __Block_byref_object_dispose__0;
    id v20 = (id)objc_opt_new();
    v13 = [MEMORY[0x263F24EB0] sharedDeviceConnection];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __51___DKComplicationMonitor_fetchActiveComplications___block_invoke;
    v15[3] = &unk_264714968;
    void v15[4] = self;
    id v18 = v19;
    id v14 = v12;
    id v16 = v14;
    id v17 = v4;
    [v13 enumerateInstalledApplicationsOnPairedDevice:v6 withBlock:v15];

    _Block_object_dispose(v19, 8);
  }
  else
  {
    (*((void (**)(id, void))v4 + 2))(v4, MEMORY[0x263EFFA68]);
  }
}

- (void)asyncUpdateCurrentActiveComplicationsContext
{
  dispatch_suspend((dispatch_object_t)self->_timer);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __70___DKComplicationMonitor_asyncUpdateCurrentActiveComplicationsContext__block_invoke;
  v3[3] = &unk_264714990;
  v3[4] = self;
  [(_DKComplicationMonitor *)self fetchActiveComplications:v3];
}

- (void).cxx_destruct
{
}

@end