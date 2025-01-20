@interface CSVoiceTriggerDarwinHandlerTestContext
- (BOOL)forceAcquirePowerAssertion;
- (BOOL)forceUserSessionActive;
- (CSDarwinPreventSystemSleepManager)preventSystemSleepManager;
- (CSVoiceTriggerDarwinHandlerTestContext)init;
- (double)forcedPowerAssertionTimeout;
- (void)setForceAcquirePowerAssertion:(BOOL)a3;
- (void)setForceUserSessionActive:(BOOL)a3;
- (void)setForcedPowerAssertionTimeout:(double)a3;
- (void)setPreventSystemSleepManager:(id)a3;
@end

@implementation CSVoiceTriggerDarwinHandlerTestContext

- (void).cxx_destruct
{
}

- (void)setForceUserSessionActive:(BOOL)a3
{
  self->_forceUserSessionActive = a3;
}

- (BOOL)forceUserSessionActive
{
  return self->_forceUserSessionActive;
}

- (void)setForcedPowerAssertionTimeout:(double)a3
{
  self->_forcedPowerAssertionTimeout = a3;
}

- (double)forcedPowerAssertionTimeout
{
  return self->_forcedPowerAssertionTimeout;
}

- (void)setForceAcquirePowerAssertion:(BOOL)a3
{
  self->_forceAcquirePowerAssertion = a3;
}

- (BOOL)forceAcquirePowerAssertion
{
  return self->_forceAcquirePowerAssertion;
}

- (void)setPreventSystemSleepManager:(id)a3
{
}

- (CSDarwinPreventSystemSleepManager)preventSystemSleepManager
{
  return self->_preventSystemSleepManager;
}

- (CSVoiceTriggerDarwinHandlerTestContext)init
{
  v6.receiver = self;
  v6.super_class = (Class)CSVoiceTriggerDarwinHandlerTestContext;
  v2 = [(CSVoiceTriggerDarwinHandlerTestContext *)&v6 init];
  v3 = v2;
  if (v2)
  {
    preventSystemSleepManager = v2->_preventSystemSleepManager;
    v2->_preventSystemSleepManager = 0;

    *(_WORD *)&v3->_forceAcquirePowerAssertion = 0;
    v3->_forcedPowerAssertionTimeout = 0.0;
  }
  return v3;
}

@end