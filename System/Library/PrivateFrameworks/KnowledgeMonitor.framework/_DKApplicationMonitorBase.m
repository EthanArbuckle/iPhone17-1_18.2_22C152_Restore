@interface _DKApplicationMonitorBase
+ (id)entitlements;
+ (id)eventStream;
- (BMSource)appInFocusSource;
- (BOOL)lookupApplication:(id)a3 shortVersionString:(id *)a4 exactBundleVersion:(id *)a5;
- (_DKApplicationMonitorBase)init;
- (id)_eventWithTimestamp:(id)a3 bundleIdentifier:(id)a4 launchReason:(id)a5 shortVersionString:(id)a6 exactBundleVersion:(id)a7;
- (void)dealloc;
- (void)obtainCurrentValue;
- (void)platformSpecificStart;
- (void)platformSpecificStop;
- (void)setAppInFocusSource:(id)a3;
- (void)start;
- (void)stop;
- (void)synchronouslyReflectCurrentValue;
- (void)updateBiomeAppInFocusWithStopEventAtTimestamp:(id)a3 reason:(id)a4;
- (void)updateBiomeWithAppInFocusStartEvent:(id)a3;
- (void)updateContextStoreWithFocalApplication:(id)a3 launchReason:(id)a4;
@end

@implementation _DKApplicationMonitorBase

- (id)_eventWithTimestamp:(id)a3 bundleIdentifier:(id)a4 launchReason:(id)a5 shortVersionString:(id)a6 exactBundleVersion:(id)a7
{
  id v10 = a5;
  id v11 = a6;
  id v12 = a7;
  v13 = [MEMORY[0x263F35058] withBundle:a4];
  v14 = objc_opt_new();
  if ([v10 length])
  {
    v15 = [MEMORY[0x263F35028] launchReason];
    [v14 setObject:v10 forKeyedSubscript:v15];
  }
  if ([v11 length])
  {
    v16 = [MEMORY[0x263F35028] shortVersionString];
    [v14 setObject:v11 forKeyedSubscript:v16];
  }
  if ([v12 length])
  {
    v17 = [MEMORY[0x263F35028] exactBundleVersion];
    [v14 setObject:v12 forKeyedSubscript:v17];
  }
  v18 = (void *)MEMORY[0x263F35088];
  v19 = [MEMORY[0x263F35148] appInFocusStream];
  v20 = [MEMORY[0x263EFF910] date];
  v21 = [MEMORY[0x263EFF910] distantFuture];
  v22 = (void *)[v14 copy];
  v23 = [v18 eventWithStream:v19 startDate:v20 endDate:v21 value:v13 metadata:v22];

  return v23;
}

- (void)updateContextStoreWithFocalApplication:(id)a3 launchReason:(id)a4
{
  v18[2] = *MEMORY[0x263EF8340];
  v6 = (__CFString *)a3;
  v7 = (__CFString *)a4;
  if (!v6
    || [(__CFString *)v6 isEqualToString:@"com.apple.springboard.home-screen"])
  {

    v6 = &stru_26D866630;
  }
  p_lastFocalApplicationForContext = &self->_lastFocalApplicationForContext;
  if (([(NSString *)*p_lastFocalApplicationForContext isEqual:v6] & 1) == 0)
  {
    v9 = [MEMORY[0x263F351B8] userContext];
    id v10 = [MEMORY[0x263F351D0] keyPathForForegroundApp];
    [v9 setObject:v6 forKeyedSubscript:v10];

    objc_storeStrong((id *)p_lastFocalApplicationForContext, v6);
    id v11 = [MEMORY[0x263F351D0] appBundleIdKey];
    v17[0] = v11;
    v18[0] = v6;
    id v12 = [MEMORY[0x263F351D0] appLaunchReasonKey];
    v13 = &stru_26D866630;
    v17[1] = v12;
    if (v7) {
      v13 = v7;
    }
    v18[1] = v13;
    v14 = [NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:2];

    v15 = [MEMORY[0x263F351B8] userContext];
    v16 = [MEMORY[0x263F351D0] keyPathForAppDataDictionary];
    [v15 setObject:v14 forKeyedSubscript:v16];
  }
}

- (BOOL)lookupApplication:(id)a3 shortVersionString:(id *)a4 exactBundleVersion:(id *)a5
{
  id v8 = a3;
  if ([v8 length])
  {
    if ([v8 hasPrefix:@"/"])
    {
      v9 = [NSURL fileURLWithPath:v8];
      id v16 = 0;
      id v10 = (void *)[objc_alloc(MEMORY[0x263F01878]) initWithURL:v9 allowPlaceholder:1 error:&v16];
      id v11 = v16;
    }
    else
    {
      id v15 = 0;
      id v10 = (void *)[objc_alloc(MEMORY[0x263F01878]) initWithBundleIdentifier:v8 allowPlaceholder:1 error:&v15];
      id v11 = v15;
    }
    BOOL v12 = v11 == 0;
    if (v11)
    {
      v13 = [(_DKMonitor *)self log];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[_DKApplicationMonitorBase lookupApplication:shortVersionString:exactBundleVersion:]((uint64_t)v8, (uint64_t)v11, v13);
      }
    }
    else
    {
      if (a4)
      {
        *a4 = [v10 shortVersionString];
      }
      if (a5)
      {
        *a5 = [v10 exactBundleVersion];
      }
    }
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (void)updateBiomeWithAppInFocusStartEvent:(id)a3
{
  id v4 = a3;
  id v7 = [v4 absoluteTimestamp];
  if (self->_currentAppInFocusEvent) {
    [(_DKApplicationMonitorBase *)self updateBiomeAppInFocusWithStopEventAtTimestamp:v7 reason:0];
  }
  v5 = [(_DKApplicationMonitorBase *)self appInFocusSource];
  [v7 timeIntervalSinceReferenceDate];
  objc_msgSend(v5, "sendEvent:timestamp:", v4);

  currentAppInFocusEvent = self->_currentAppInFocusEvent;
  self->_currentAppInFocusEvent = (BMAppInFocus *)v4;
}

- (BMSource)appInFocusSource
{
  return (BMSource *)objc_getProperty(self, a2, 160, 1);
}

- (void)updateBiomeAppInFocusWithStopEventAtTimestamp:(id)a3 reason:(id)a4
{
  id v24 = a3;
  id v6 = a4;
  currentAppInFocusEvent = self->_currentAppInFocusEvent;
  if (currentAppInFocusEvent)
  {
    id v8 = currentAppInFocusEvent;
    id v20 = objc_alloc(MEMORY[0x263F29FA8]);
    if ([v6 length]) {
      id v9 = v6;
    }
    else {
      id v9 = 0;
    }
    id v19 = v9;
    unsigned int v18 = [(BMAppInFocus *)v8 launchType];
    v23 = [(BMAppInFocus *)v8 bundleID];
    v22 = [(BMAppInFocus *)v8 parentBundleID];
    v21 = [(BMAppInFocus *)v8 extensionHostID];
    id v10 = [(BMAppInFocus *)v8 shortVersionString];
    id v11 = [(BMAppInFocus *)v8 exactVersionString];
    int v12 = [(BMAppInFocus *)v8 hasDyldPlatform];
    if (v12)
    {
      v13 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMAppInFocus dyldPlatform](v8, "dyldPlatform"));
    }
    else
    {
      v13 = 0;
    }
    if ([(BMAppInFocus *)v8 hasIsNativeArchitecture])
    {
      v14 = objc_msgSend(NSNumber, "numberWithBool:", -[BMAppInFocus isNativeArchitecture](v8, "isNativeArchitecture"));
      id v15 = (void *)[v20 initWithLaunchReason:v19 launchType:v18 starting:MEMORY[0x263EFFA80] absoluteTimestamp:v24 duration:0 bundleID:v23 parentBundleID:v22 extensionHostID:v21 shortVersionString:v10 exactVersionString:v11 dyldPlatform:v13 isNativeArchitecture:v14];

      if (!v12) {
        goto LABEL_13;
      }
    }
    else
    {
      id v15 = (void *)[v20 initWithLaunchReason:v19 launchType:v18 starting:MEMORY[0x263EFFA80] absoluteTimestamp:v24 duration:0 bundleID:v23 parentBundleID:v22 extensionHostID:v21 shortVersionString:v10 exactVersionString:v11 dyldPlatform:v13 isNativeArchitecture:0];
      if (!v12)
      {
LABEL_13:

        id v16 = [(_DKApplicationMonitorBase *)self appInFocusSource];
        [v24 timeIntervalSinceReferenceDate];
        objc_msgSend(v16, "sendEvent:timestamp:", v15);

        v17 = self->_currentAppInFocusEvent;
        self->_currentAppInFocusEvent = 0;

        goto LABEL_14;
      }
    }

    goto LABEL_13;
  }
LABEL_14:
}

- (void)lookupApplication:(uint64_t)a1 shortVersionString:(uint64_t)a2 exactBundleVersion:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_225002000, log, OS_LOG_TYPE_ERROR, "Unable to query LSApplicationRecord for bundleIdentifier:%{public}@ error:%@", (uint8_t *)&v3, 0x16u);
}

- (void)synchronouslyReflectCurrentValue
{
  int v3 = [(_DKMonitor *)self currentEvent];

  if (!v3)
  {
    [(_DKApplicationMonitorBase *)self obtainCurrentValue];
  }
}

- (_DKApplicationMonitorBase)init
{
  v11.receiver = self;
  v11.super_class = (Class)_DKApplicationMonitorBase;
  v2 = [(_DKMonitor *)&v11 init];
  if (v2)
  {
    objc_initWeak(&location, v2);
    int v3 = (void *)MEMORY[0x263F61E30];
    uint64_t v5 = MEMORY[0x263EF8330];
    uint64_t v6 = 3221225472;
    uint64_t v7 = __33___DKApplicationMonitorBase_init__block_invoke;
    id v8 = &unk_264714918;
    objc_copyWeak(&v9, &location);
    [v3 runBlockWhenDeviceIsClassCUnlocked:&v5];
    -[_DKMonitor setFilter:](v2, "setFilter:", &__block_literal_global_8, v5, v6, v7, v8);
    [(_DKMonitor *)v2 setEventComparator:&__block_literal_global_5];
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (void)dealloc
{
  [(_DKApplicationMonitorBase *)self deactivate];
  v3.receiver = self;
  v3.super_class = (Class)_DKApplicationMonitorBase;
  [(_DKMonitor *)&v3 dealloc];
}

+ (id)eventStream
{
  return @"FocalApp";
}

+ (id)entitlements
{
  return 0;
}

- (void)start
{
  if ([(_DKMonitor *)self instantMonitorNeedsActivation])
  {
    [(_DKApplicationMonitorBase *)self platformSpecificStart];
    [(_DKApplicationMonitorBase *)self obtainCurrentValue];
  }
}

- (void)stop
{
  if ([(_DKMonitor *)self instantMonitorNeedsDeactivation])
  {
    [(_DKApplicationMonitorBase *)self deactivate];
  }
}

- (void)setAppInFocusSource:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appInFocusSource, 0);
  objc_storeStrong((id *)&self->_currentAppInFocusEvent, 0);
  objc_storeStrong((id *)&self->_lastFocalApplicationForContext, 0);
}

- (void)obtainCurrentValue
{
  NSClassFromString(&cfstr_Dkapplicationm.isa);
  uint64_t v2 = OUTLINED_FUNCTION_0_4();
  MEMORY[0x270EF2BB8](v2);
}

- (void)platformSpecificStart
{
  NSClassFromString(&cfstr_Dkapplicationm.isa);
  uint64_t v2 = OUTLINED_FUNCTION_0_4();
  MEMORY[0x270EF2BB8](v2);
}

- (void)platformSpecificStop
{
  NSClassFromString(&cfstr_Dkapplicationm.isa);
  uint64_t v2 = OUTLINED_FUNCTION_0_4();
  MEMORY[0x270EF2BB8](v2);
}

@end