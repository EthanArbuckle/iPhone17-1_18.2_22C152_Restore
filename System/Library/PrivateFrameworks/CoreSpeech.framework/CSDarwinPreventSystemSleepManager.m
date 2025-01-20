@interface CSDarwinPreventSystemSleepManager
- (CSDarwinPreventSystemSleepManager)initWithTimeout:(double)a3;
- (CSDarwinPreventSystemSleepManager)initWithTimeout:(double)a3 preferences:(id)a4;
- (CSFPreferences)preferences;
- (CSPreventSystemSleepPowerAssertion)preventSystemSleepPowerAssertion;
- (double)assertionTimeoutInterval;
- (int64_t)currentState;
- (void)_acquirePreventSystemSleepAssertionWithTimeout:(id)a3;
- (void)acquireAssertion;
- (void)acquireAssertionForActiveUser;
- (void)acquireAssertionForIdleUser;
- (void)dealloc;
- (void)releasePreventSystemSleepAssertion;
- (void)setCurrentState:(int64_t)a3;
- (void)setPreferences:(id)a3;
- (void)setPreventSystemSleepPowerAssertion:(id)a3;
@end

@implementation CSDarwinPreventSystemSleepManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferences, 0);
  objc_storeStrong((id *)&self->_preventSystemSleepPowerAssertion, 0);
}

- (void)setPreferences:(id)a3
{
}

- (CSFPreferences)preferences
{
  return self->_preferences;
}

- (void)setCurrentState:(int64_t)a3
{
  self->_currentState = a3;
}

- (int64_t)currentState
{
  return self->_currentState;
}

- (void)setPreventSystemSleepPowerAssertion:(id)a3
{
}

- (CSPreventSystemSleepPowerAssertion)preventSystemSleepPowerAssertion
{
  return self->_preventSystemSleepPowerAssertion;
}

- (double)assertionTimeoutInterval
{
  return self->_assertionTimeoutInterval;
}

- (void)dealloc
{
  [(CSDarwinPreventSystemSleepManager *)self releasePreventSystemSleepAssertion];
  v3.receiver = self;
  v3.super_class = (Class)CSDarwinPreventSystemSleepManager;
  [(CSDarwinPreventSystemSleepManager *)&v3 dealloc];
}

- (void)acquireAssertionForIdleUser
{
  objc_super v3 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 136315138;
    v18 = "-[CSDarwinPreventSystemSleepManager acquireAssertionForIdleUser]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v17, 0xCu);
  }
  v4 = [(CSFPreferences *)self->_preferences getIdleUserPreventSleepAssertionAcquitionDate];
  if (v4)
  {
    v5 = +[NSDate date];
    [v5 timeIntervalSinceReferenceDate];
    double v7 = v6;
    [v4 timeIntervalSinceReferenceDate];
    double v9 = v7 - v8;
    v10 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 136315906;
      v18 = "-[CSDarwinPreventSystemSleepManager acquireAssertionForIdleUser]";
      __int16 v19 = 2112;
      v20 = v4;
      __int16 v21 = 2112;
      v22 = v5;
      __int16 v23 = 2048;
      double v24 = v9;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s current date: %@, last assertion acquired date: %@, time difference: %f seconds", (uint8_t *)&v17, 0x2Au);
    }
    if (v9 <= 0.0 || (double assertionTimeoutInterval = self->_assertionTimeoutInterval, v9 >= assertionTimeoutInterval))
    {
      v13 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
        int v17 = 136315138;
        v18 = "-[CSDarwinPreventSystemSleepManager acquireAssertionForIdleUser]";
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s The user is idle beyond the timeout interval. Ignoring acquiring assertion", (uint8_t *)&v17, 0xCu);
      }
      [(CSDarwinPreventSystemSleepManager *)self releasePreventSystemSleepAssertion];
    }
    else
    {
      v12 = +[NSNumber numberWithDouble:assertionTimeoutInterval - v9];
      [(CSDarwinPreventSystemSleepManager *)self _acquirePreventSystemSleepAssertionWithTimeout:v12];
    }
  }
  else
  {
    v14 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 136315138;
      v18 = "-[CSDarwinPreventSystemSleepManager acquireAssertionForIdleUser]";
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%s last assertion acquired date is nil. Acquiring asssertion", (uint8_t *)&v17, 0xCu);
    }
    v15 = +[NSNumber numberWithDouble:self->_assertionTimeoutInterval];
    [(CSDarwinPreventSystemSleepManager *)self _acquirePreventSystemSleepAssertionWithTimeout:v15];

    preferences = self->_preferences;
    v5 = +[NSDate date];
    [(CSFPreferences *)preferences setIdleUserPreventSleepAssertionAcquitionDate:v5];
  }
}

- (void)acquireAssertionForActiveUser
{
  objc_super v3 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    double v6 = "-[CSDarwinPreventSystemSleepManager acquireAssertionForActiveUser]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s Acquiring assertion for active user", (uint8_t *)&v5, 0xCu);
  }
  [(CSFPreferences *)self->_preferences setIdleUserPreventSleepAssertionAcquitionDate:0];
  v4 = +[NSNumber numberWithDouble:self->_assertionTimeoutInterval];
  [(CSDarwinPreventSystemSleepManager *)self _acquirePreventSystemSleepAssertionWithTimeout:v4];
}

- (void)acquireAssertion
{
  id v3 = +[NSNumber numberWithDouble:self->_assertionTimeoutInterval];
  [(CSDarwinPreventSystemSleepManager *)self _acquirePreventSystemSleepAssertionWithTimeout:v3];
}

- (void)releasePreventSystemSleepAssertion
{
  [(CSPreventSystemSleepPowerAssertion *)self->_preventSystemSleepPowerAssertion invalidate];
  preventSystemSleepPowerAssertion = self->_preventSystemSleepPowerAssertion;
  self->_preventSystemSleepPowerAssertion = 0;
}

- (void)_acquirePreventSystemSleepAssertionWithTimeout:(id)a3
{
  id v4 = a3;
  int v5 = [CSPreventSystemSleepPowerAssertion alloc];
  id v6 = [v4 unsignedLongLongValue];

  double v7 = [(CSPreventSystemSleepPowerAssertion *)v5 initWithTimeOut:(double)(unint64_t)v6];
  double v8 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315138;
    v11 = "-[CSDarwinPreventSystemSleepManager _acquirePreventSystemSleepAssertionWithTimeout:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s Releasing old assertion", (uint8_t *)&v10, 0xCu);
  }
  [(CSDarwinPreventSystemSleepManager *)self releasePreventSystemSleepAssertion];
  preventSystemSleepPowerAssertion = self->_preventSystemSleepPowerAssertion;
  self->_preventSystemSleepPowerAssertion = v7;
}

- (CSDarwinPreventSystemSleepManager)initWithTimeout:(double)a3
{
  int v5 = +[CSFPreferences sharedPreferences];
  id v6 = [(CSDarwinPreventSystemSleepManager *)self initWithTimeout:v5 preferences:a3];

  return v6;
}

- (CSDarwinPreventSystemSleepManager)initWithTimeout:(double)a3 preferences:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CSDarwinPreventSystemSleepManager;
  double v8 = [(CSDarwinPreventSystemSleepManager *)&v11 init];
  double v9 = v8;
  if (v8)
  {
    v8->_double assertionTimeoutInterval = a3;
    objc_storeStrong((id *)&v8->_preferences, a4);
  }

  return v9;
}

@end