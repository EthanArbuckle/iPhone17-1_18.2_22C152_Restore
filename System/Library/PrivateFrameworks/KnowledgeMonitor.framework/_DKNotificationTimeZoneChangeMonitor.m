@interface _DKNotificationTimeZoneChangeMonitor
+ (id)eventStream;
+ (id)log;
- (_DKNotificationTimeZoneChangeMonitor)init;
- (void)_updateWithTimeZone:(id)a3 timestamp:(double)a4;
- (void)activate;
- (void)deactivate;
- (void)dealloc;
- (void)enqueueTimeZoneUpdate;
- (void)receiveNotificationEvent:(id)a3;
- (void)start;
- (void)stop;
@end

@implementation _DKNotificationTimeZoneChangeMonitor

- (void)receiveNotificationEvent:(id)a3
{
  id v4 = a3;
  v5 = (void *)os_transaction_create();
  v6 = (void *)MEMORY[0x22A629AA0]();
  if (self->_enabled)
  {
    v7 = [v4 objectForKeyedSubscript:@"Notification"];
    int v8 = [v7 isEqual:@"SignificantTimeChangeNotification"];

    if (v8)
    {
      v9 = [(id)objc_opt_class() log];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl(&dword_225002000, v9, OS_LOG_TYPE_DEFAULT, "Received notification event for time zone changed!", v10, 2u);
      }

      [(_DKNotificationTimeZoneChangeMonitor *)self enqueueTimeZoneUpdate];
    }
  }
}

+ (id)log
{
  if (log_onceToken_3 != -1) {
    dispatch_once(&log_onceToken_3, &__block_literal_global_12);
  }
  v2 = (void *)log_log_3;
  return v2;
}

- (_DKNotificationTimeZoneChangeMonitor)init
{
  v7.receiver = self;
  v7.super_class = (Class)_DKNotificationTimeZoneChangeMonitor;
  v2 = [(_DKMonitor *)&v7 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("_DKNotificationTimeZoneChangeMonitor.donations", v3);
    donationQueue = v2->_donationQueue;
    v2->_donationQueue = (OS_dispatch_queue *)v4;
  }
  return v2;
}

- (void)dealloc
{
  [(_DKNotificationTimeZoneChangeMonitor *)self deactivate];
  v3.receiver = self;
  v3.super_class = (Class)_DKNotificationTimeZoneChangeMonitor;
  [(_DKMonitor *)&v3 dealloc];
}

+ (id)eventStream
{
  return @"TimeZone";
}

- (void)start
{
  v3.receiver = self;
  v3.super_class = (Class)_DKNotificationTimeZoneChangeMonitor;
  if ([(_DKMonitor *)&v3 instantMonitorNeedsActivation]) {
    [(_DKNotificationTimeZoneChangeMonitor *)self activate];
  }
}

- (void)activate
{
  objc_super v3 = [(id)objc_opt_class() log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_225002000, v3, OS_LOG_TYPE_DEFAULT, "activate", buf, 2u);
  }

  dispatch_suspend((dispatch_object_t)self->_donationQueue);
  self->_resumed = 0;
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  v5 = [MEMORY[0x263EFFA18] systemTimeZone];
  id v6 = objc_alloc(MEMORY[0x263F2A0C0]);
  objc_super v7 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v5, "secondsFromGMT"));
  int v8 = [v5 name];
  v9 = (void *)[v6 initWithSecondsFromGMT:v7 name:v8];

  donationQueue = self->_donationQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __48___DKNotificationTimeZoneChangeMonitor_activate__block_invoke;
  block[3] = &unk_264714A00;
  block[4] = self;
  id v14 = v9;
  CFAbsoluteTime v15 = Current;
  id v11 = v9;
  dispatch_async(donationQueue, block);
  self->_enabled = 1;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __48___DKNotificationTimeZoneChangeMonitor_activate__block_invoke_24;
  v12[3] = &unk_264714788;
  v12[4] = self;
  [MEMORY[0x263F61E30] runBlockWhenDeviceIsClassCUnlocked:v12];
}

- (void)stop
{
  v3.receiver = self;
  v3.super_class = (Class)_DKNotificationTimeZoneChangeMonitor;
  if ([(_DKMonitor *)&v3 instantMonitorNeedsDeactivation]) {
    [(_DKNotificationTimeZoneChangeMonitor *)self deactivate];
  }
}

- (void)deactivate
{
  self->_enabled = 0;
  if (!self->_resumed)
  {
    self->_cancel = 1;
    dispatch_resume((dispatch_object_t)self->_donationQueue);
  }
  donationQueue = self->_donationQueue;
  dispatch_barrier_sync(donationQueue, &__block_literal_global_28);
}

- (void)_updateWithTimeZone:(id)a3 timestamp:(double)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = (BMDeviceTimeZone *)a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_donationQueue);
  objc_super v7 = [(id)objc_opt_class() log];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138412546;
    CFAbsoluteTime v15 = v6;
    __int16 v16 = 2048;
    double v17 = a4;
    _os_log_impl(&dword_225002000, v7, OS_LOG_TYPE_DEFAULT, "Writing timezone event %@ at %f", (uint8_t *)&v14, 0x16u);
  }

  timeZone = self->_timeZone;
  self->_timeZone = v6;
  v9 = v6;

  self->_lastUpdate = a4;
  v10 = BiomeLibrary();
  id v11 = [v10 Device];
  v12 = [v11 TimeZone];
  v13 = [v12 source];
  [v13 sendEvent:v9 timestamp:a4];
}

- (void)enqueueTimeZoneUpdate
{
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  dispatch_queue_t v4 = [MEMORY[0x263EFFA18] systemTimeZone];
  id v5 = objc_alloc(MEMORY[0x263F2A0C0]);
  id v6 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "secondsFromGMT"));
  objc_super v7 = [v4 name];
  int v8 = (void *)[v5 initWithSecondsFromGMT:v6 name:v7];

  donationQueue = self->_donationQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __61___DKNotificationTimeZoneChangeMonitor_enqueueTimeZoneUpdate__block_invoke;
  block[3] = &unk_264714A00;
  block[4] = self;
  id v12 = v8;
  CFAbsoluteTime v13 = Current;
  id v10 = v8;
  dispatch_async(donationQueue, block);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_donationQueue, 0);
  objc_storeStrong((id *)&self->_timeZone, 0);
}

@end