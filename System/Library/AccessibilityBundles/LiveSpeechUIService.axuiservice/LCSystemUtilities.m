@interface LCSystemUtilities
+ (BOOL)liveCaptionsSupported;
+ (void)registerLiveCaptionsPID;
- (BSInvalidatable)disableIdleTimerAssertion;
- (void)idleSleepTimerDisabled:(BOOL)a3;
- (void)setDisableIdleTimerAssertion:(id)a3;
@end

@implementation LCSystemUtilities

+ (BOOL)liveCaptionsSupported
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2020000000;
  v2 = (uint64_t (*)(const __CFString *))off_DB540;
  v8 = off_DB540;
  if (!off_DB540)
  {
    v3 = (void *)sub_6714();
    v6[3] = (uint64_t)dlsym(v3, "AXHasCapability");
    off_DB540 = (_UNKNOWN *)v6[3];
    v2 = (uint64_t (*)(const __CFString *))v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v2) {
    sub_A581C();
  }
  return v2(@"LiveTranscription");
}

+ (void)registerLiveCaptionsPID
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2050000000;
  v2 = (void *)qword_DB550;
  uint64_t v9 = qword_DB550;
  if (!qword_DB550)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_6888;
    v5[3] = &unk_CEE88;
    v5[4] = &v6;
    sub_6888((uint64_t)v5);
    v2 = (void *)v7[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v6, 8);
  v4 = [v3 server];
  [v4 registerLiveCaptionsPID:getpid()];
}

- (void)idleSleepTimerDisabled:(BOOL)a3
{
  disableIdleTimerAssertion = self->_disableIdleTimerAssertion;
  if (a3)
  {
    if (disableIdleTimerAssertion) {
      return;
    }
    uint64_t v14 = 0;
    v15 = &v14;
    uint64_t v16 = 0x2050000000;
    uint64_t v5 = (void *)qword_DB558;
    uint64_t v17 = qword_DB558;
    if (!qword_DB558)
    {
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_68E0;
      v13[3] = &unk_CEE88;
      v13[4] = &v14;
      sub_68E0((uint64_t)v13);
      uint64_t v5 = (void *)v15[3];
    }
    id v6 = v5;
    _Block_object_dispose(&v14, 8);
    uint64_t v7 = [v6 sharedInstance];
    uint64_t v8 = [v7 acquireAssertionToDisableIdleTimerWithReason:@"LiveCaptions"];
    uint64_t v9 = self->_disableIdleTimerAssertion;
    self->_disableIdleTimerAssertion = v8;

    v10 = LCLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v13[0]) = 0;
      _os_log_impl(&def_5ED54, v10, OS_LOG_TYPE_DEFAULT, "Idle sleep assertion is acquired", (uint8_t *)v13, 2u);
    }
  }
  else
  {
    if (disableIdleTimerAssertion)
    {
      v11 = LCLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v13[0]) = 0;
        _os_log_impl(&def_5ED54, v11, OS_LOG_TYPE_DEFAULT, "Idle sleep assertion is invalidated", (uint8_t *)v13, 2u);
      }

      v12 = self->_disableIdleTimerAssertion;
    }
    else
    {
      v12 = 0;
    }
    [(BSInvalidatable *)v12 invalidate];
    v10 = self->_disableIdleTimerAssertion;
    self->_disableIdleTimerAssertion = 0;
  }
}

- (BSInvalidatable)disableIdleTimerAssertion
{
  return self->_disableIdleTimerAssertion;
}

- (void)setDisableIdleTimerAssertion:(id)a3
{
}

- (void).cxx_destruct
{
}

@end