@interface MPSignpost
+ (MPSignpost)sharedInstance;
+ (id)keypadToContactsSwitchLog;
- (BOOL)signpostIntervalDidBegin;
- (MPSignpost)init;
- (double)keypadToContactsSwitchStartTime;
- (void)contactsTabViewAppeared;
- (void)keypadTabSwitchStarted;
- (void)reportKeytabToContactsTransistionEvent:(double)a3;
- (void)setKeypadToContactsSwitchStartTime:(double)a3;
- (void)setSignpostIntervalDidBegin:(BOOL)a3;
@end

@implementation MPSignpost

+ (id)keypadToContactsSwitchLog
{
  if (keypadToContactsSwitchLog_onceToken != -1) {
    dispatch_once(&keypadToContactsSwitchLog_onceToken, &__block_literal_global_14);
  }
  v2 = (void *)keypadToContactsSwitchLog_keypadToContactsSwitchLog;

  return v2;
}

void __39__MPSignpost_keypadToContactsSwitchLog__block_invoke(id a1)
{
  os_log_t v1 = os_log_create("com.apple.MobilePhone", "keypad_to_contacts_tab_switch");
  uint64_t v2 = keypadToContactsSwitchLog_keypadToContactsSwitchLog;
  keypadToContactsSwitchLog_keypadToContactsSwitchLog = (uint64_t)v1;

  _objc_release_x1(v1, v2);
}

+ (MPSignpost)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __28__MPSignpost_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_1 != -1) {
    dispatch_once(&sharedInstance_onceToken_1, block);
  }
  uint64_t v2 = (void *)sharedInstance_sharedSignpost;

  return (MPSignpost *)v2;
}

uint64_t __28__MPSignpost_sharedInstance__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  uint64_t v2 = sharedInstance_sharedSignpost;
  sharedInstance_sharedSignpost = (uint64_t)v1;

  return _objc_release_x1(v1, v2);
}

- (MPSignpost)init
{
  v3.receiver = self;
  v3.super_class = (Class)MPSignpost;
  result = [(MPSignpost *)&v3 init];
  if (result) {
    result->_signpostIntervalDidBegin = 0;
  }
  return result;
}

- (void)keypadTabSwitchStarted
{
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  id v3 = objc_alloc_init((Class)NSDate);
  [v3 timeIntervalSince1970];
  -[MPSignpost setKeypadToContactsSwitchStartTime:](self, "setKeypadToContactsSwitchStartTime:");

  v4 = [(id)objc_opt_class() keypadToContactsSwitchLog];
  if (os_signpost_enabled(v4))
  {
    [(MPSignpost *)self keypadToContactsSwitchStartTime];
    uint64_t v6 = v5;
    [(MPSignpost *)self keypadToContactsSwitchStartTime];
    int v8 = 134218240;
    uint64_t v9 = v6;
    __int16 v10 = 2050;
    uint64_t v11 = v7;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v4, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "keypad_to_contacts_tab_switch_started", "%{signpost.description:begin_time}f keypadTappedAt=%{signpost.telemetry:number1,public}f seconds enableTelemetry=YES ", (uint8_t *)&v8, 0x16u);
  }

  [(MPSignpost *)self setSignpostIntervalDidBegin:1];
}

- (void)contactsTabViewAppeared
{
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  if ([(MPSignpost *)self signpostIntervalDidBegin])
  {
    id v3 = objc_alloc_init((Class)NSDate);
    [v3 timeIntervalSince1970];
    double v5 = v4;

    [(MPSignpost *)self reportKeytabToContactsTransistionEvent:v5];
    uint64_t v6 = [(id)objc_opt_class() keypadToContactsSwitchLog];
    if (os_signpost_enabled(v6))
    {
      [(MPSignpost *)self keypadToContactsSwitchStartTime];
      int v8 = 134218240;
      double v9 = v5;
      __int16 v10 = 2048;
      uint64_t v11 = v7;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "keypad_to_contacts_tab_switch_ended", "%{signpost.description:end_time}f %{signpost.description:begin_time}f enableTelemetry=YES ", (uint8_t *)&v8, 0x16u);
    }

    [(MPSignpost *)self setSignpostIntervalDidBegin:0];
  }
}

- (void)reportKeytabToContactsTransistionEvent:(double)a3
{
  if ([(MPSignpost *)self signpostIntervalDidBegin])
  {
    [(MPSignpost *)self keypadToContactsSwitchStartTime];
    double v6 = v5;
    uint64_t v7 = [(id)objc_opt_class() keypadToContactsSwitchLog];
    if (os_signpost_enabled(v7))
    {
      int v8 = 134218240;
      double v9 = a3 - v6;
      __int16 v10 = 2048;
      double v11 = a3 - v6;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v7, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "keypad_to_contacts_tab_switch", "%{signpost.description:event_time}f tabSwitchDuration=%f enableTelemetry=YES ", (uint8_t *)&v8, 0x16u);
    }
  }
}

- (BOOL)signpostIntervalDidBegin
{
  return self->_signpostIntervalDidBegin;
}

- (void)setSignpostIntervalDidBegin:(BOOL)a3
{
  self->_signpostIntervalDidBegin = a3;
}

- (double)keypadToContactsSwitchStartTime
{
  return self->_keypadToContactsSwitchStartTime;
}

- (void)setKeypadToContactsSwitchStartTime:(double)a3
{
  self->_keypadToContactsSwitchStartTime = a3;
}

@end