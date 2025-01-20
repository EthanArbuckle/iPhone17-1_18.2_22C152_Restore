@interface CSPreventSystemSleepPowerAssertion
- (CSPreventSystemSleepPowerAssertion)initWithTimeOut:(double)a3;
- (void)_acquireAssertionForType:(__CFString *)a3 withTimeout:(double)a4 assertionId:(unsigned int *)a5 details:(__CFString *)a6;
- (void)_releaseAssertionForAssertionId:(unsigned int *)a3 details:(__CFString *)a4;
- (void)dealloc;
- (void)invalidate;
@end

@implementation CSPreventSystemSleepPowerAssertion

- (void)_releaseAssertionForAssertionId:(unsigned int *)a3 details:(__CFString *)a4
{
  if (*a3)
  {
    IOReturn v6 = IOPMAssertionRelease(*a3);
    v7 = CSLogContextFacilityCoreSpeech;
    if (v6)
    {
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      {
        int v8 = 136315395;
        v9 = "-[CSPreventSystemSleepPowerAssertion _releaseAssertionForAssertionId:details:]";
        __int16 v10 = 2113;
        v11 = a4;
        _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%s Failed to released power assertion for %{private}@", (uint8_t *)&v8, 0x16u);
      }
    }
    else if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136315395;
      v9 = "-[CSPreventSystemSleepPowerAssertion _releaseAssertionForAssertionId:details:]";
      __int16 v10 = 2113;
      v11 = a4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s Successfully released power assertion for %{private}@", (uint8_t *)&v8, 0x16u);
    }
    *a3 = 0;
  }
}

- (void)_acquireAssertionForType:(__CFString *)a3 withTimeout:(double)a4 assertionId:(unsigned int *)a5 details:(__CFString *)a6
{
  *a5 = 0;
  if (a4 == 0.0) {
    IOReturn v10 = IOPMAssertionCreateWithName(a3, 0xFFu, @"com.apple.corespeech.powerassertion", a5);
  }
  else {
    IOReturn v10 = IOPMAssertionCreateWithDescription(a3, @"com.apple.corespeech.powerassertion", a6, 0, 0, a4, @"TimeoutActionRelease", a5);
  }
  if (*a5) {
    BOOL v11 = v10 == 0;
  }
  else {
    BOOL v11 = 0;
  }
  if (v11)
  {
    IOReturn v13 = IOPMAssertionSetProperty(*a5, @"AllowsDeviceRestart", kCFBooleanTrue);
    v14 = CSLogContextFacilityCoreSpeech;
    if (v13)
    {
      IOReturn v15 = v13;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      {
        int v20 = 136315395;
        v21 = "-[CSPreventSystemSleepPowerAssertion _acquireAssertionForType:withTimeout:assertionId:details:]";
        __int16 v22 = 1025;
        LODWORD(v23) = v15;
        _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%s IOPMAssertionSetProperty failed : %{private}d", (uint8_t *)&v20, 0x12u);
        v14 = CSLogContextFacilityCoreSpeech;
      }
    }
    BOOL v16 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
    if (a4 == 0.0)
    {
      if (!v16) {
        return;
      }
      int v20 = 136315395;
      v21 = "-[CSPreventSystemSleepPowerAssertion _acquireAssertionForType:withTimeout:assertionId:details:]";
      __int16 v22 = 2113;
      v23 = a6;
      v17 = "%s Taking power assertion %{private}@";
      v18 = v14;
      uint32_t v19 = 22;
    }
    else
    {
      if (!v16) {
        return;
      }
      int v20 = 136315651;
      v21 = "-[CSPreventSystemSleepPowerAssertion _acquireAssertionForType:withTimeout:assertionId:details:]";
      __int16 v22 = 2113;
      v23 = a6;
      __int16 v24 = 2049;
      double v25 = a4;
      v17 = "%s Taking power assertion %{private}@ for a max of %{private}f seconds";
      v18 = v14;
      uint32_t v19 = 32;
    }
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, v17, (uint8_t *)&v20, v19);
  }
  else
  {
    v12 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      int v20 = 136315138;
      v21 = "-[CSPreventSystemSleepPowerAssertion _acquireAssertionForType:withTimeout:assertionId:details:]";
      _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%s Could not take power assertion", (uint8_t *)&v20, 0xCu);
    }
    [(CSPreventSystemSleepPowerAssertion *)self _releaseAssertionForAssertionId:a5 details:a6];
  }
}

- (void)invalidate
{
  p_preventUserIdleSystemSleepAssertionId = &self->_preventUserIdleSystemSleepAssertionId;
  if (self->_preventUserIdleSystemSleepAssertionId)
  {
    v4 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315138;
      v7 = "-[CSPreventSystemSleepPowerAssertion invalidate]";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s UserIdleSystemSleepAssertion", (uint8_t *)&v6, 0xCu);
    }
    [(CSPreventSystemSleepPowerAssertion *)self _releaseAssertionForAssertionId:p_preventUserIdleSystemSleepAssertionId details:@"PreventUserIdleSystemSleep"];
  }
  if (CSIsOSX() && self->_preventSystemSleepAssertionId)
  {
    v5 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315138;
      v7 = "-[CSPreventSystemSleepPowerAssertion invalidate]";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s SystemSleepAssertion", (uint8_t *)&v6, 0xCu);
    }
    [(CSPreventSystemSleepPowerAssertion *)self _releaseAssertionForAssertionId:&self->_preventSystemSleepAssertionId details:@"PreventSystemSleep"];
  }
}

- (void)dealloc
{
  [(CSPreventSystemSleepPowerAssertion *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)CSPreventSystemSleepPowerAssertion;
  [(CSPreventSystemSleepPowerAssertion *)&v3 dealloc];
}

- (CSPreventSystemSleepPowerAssertion)initWithTimeOut:(double)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CSPreventSystemSleepPowerAssertion;
  v4 = [(CSPreventSystemSleepPowerAssertion *)&v7 init];
  v5 = v4;
  if (v4)
  {
    v4->_timeoutInterval = a3;
    v4->_preventUserIdleSystemSleepAssertionId = 0;
    [(CSPreventSystemSleepPowerAssertion *)v4 _acquireAssertionForType:@"PreventUserIdleSystemSleep" withTimeout:&v4->_preventUserIdleSystemSleepAssertionId assertionId:@"PreventUserIdleSystemSleep" details:a3];
    if (CSIsOSX())
    {
      v5->_preventSystemSleepAssertionId = 0;
      [(CSPreventSystemSleepPowerAssertion *)v5 _acquireAssertionForType:@"PreventSystemSleep" withTimeout:&v5->_preventSystemSleepAssertionId assertionId:@"PreventSystemSleep" details:v5->_timeoutInterval];
    }
  }
  return v5;
}

@end