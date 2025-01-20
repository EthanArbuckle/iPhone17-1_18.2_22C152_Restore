@interface DAChamberInputs
- (BOOL)testCompleteChimeAlertEnabled;
- (BOOL)testCompleteVibrationAlertEnabled;
- (BOOL)validateAndInitializeParameters:(id)a3;
- (int)detectChamberSensor;
- (unsigned)detectChamberReadyALSThreshold;
- (unsigned)detectChamberReadyWaitTime;
- (unsigned)testCompleteAlertTime;
- (void)setDetectChamberReadyALSThreshold:(unsigned int)a3;
- (void)setDetectChamberReadyWaitTime:(unsigned int)a3;
- (void)setDetectChamberSensor:(int)a3;
- (void)setTestCompleteAlertTime:(unsigned int)a3;
- (void)setTestCompleteChimeAlertEnabled:(BOOL)a3;
- (void)setTestCompleteVibrationAlertEnabled:(BOOL)a3;
@end

@implementation DAChamberInputs

- (BOOL)validateAndInitializeParameters:(id)a3
{
  id v4 = a3;
  char v11 = 0;
  v5 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Validating parameters: %@", buf, 0xCu);
  }

  v6 = [v4 dk_numberFromKey:@"detectChamberReady" lowerBound:&off_10001D850 upperBound:&off_10001D868 defaultValue:&off_10001D868 failed:&v11];
  -[DAChamberInputs setDetectChamberSensor:](self, "setDetectChamberSensor:", [v6 intValue]);

  v7 = [v4 dk_numberFromKey:@"ALSThreshold" lowerBound:&off_10001D850 upperBound:&off_10001D880 defaultValue:&off_10001D898 failed:&v11];
  -[DAChamberInputs setDetectChamberReadyALSThreshold:](self, "setDetectChamberReadyALSThreshold:", [v7 intValue]);

  v8 = [v4 dk_numberFromKey:@"closeChamberCountdown" lowerBound:&off_10001D8B0 upperBound:&off_10001D8C8 defaultValue:&off_10001D8E0 failed:&v11];
  -[DAChamberInputs setDetectChamberReadyWaitTime:](self, "setDetectChamberReadyWaitTime:", [v8 intValue]);

  v9 = [v4 dk_numberFromKey:@"testCompleteAlertTime" lowerBound:&off_10001D8B0 upperBound:&off_10001D8C8 defaultValue:&off_10001D8F8 failed:&v11];
  -[DAChamberInputs setTestCompleteAlertTime:](self, "setTestCompleteAlertTime:", [v9 intValue]);

  [self setTestCompleteVibrationAlertEnabled:[v4 dk_BOOLFromKey:@"vibrationAlert" defaultValue:1 failed:&v11]];
  [self setTestCompleteChimeAlertEnabled:[v4 dk_BOOLFromKey:@"chimeAlert" defaultValue:1 failed:&v11]];

  return 1;
}

- (int)detectChamberSensor
{
  return self->_detectChamberSensor;
}

- (void)setDetectChamberSensor:(int)a3
{
  self->_detectChamberSensor = a3;
}

- (unsigned)detectChamberReadyWaitTime
{
  return self->_detectChamberReadyWaitTime;
}

- (void)setDetectChamberReadyWaitTime:(unsigned int)a3
{
  self->_detectChamberReadyWaitTime = a3;
}

- (unsigned)detectChamberReadyALSThreshold
{
  return self->_detectChamberReadyALSThreshold;
}

- (void)setDetectChamberReadyALSThreshold:(unsigned int)a3
{
  self->_detectChamberReadyALSThreshold = a3;
}

- (BOOL)testCompleteVibrationAlertEnabled
{
  return self->_testCompleteVibrationAlertEnabled;
}

- (void)setTestCompleteVibrationAlertEnabled:(BOOL)a3
{
  self->_testCompleteVibrationAlertEnabled = a3;
}

- (BOOL)testCompleteChimeAlertEnabled
{
  return self->_testCompleteChimeAlertEnabled;
}

- (void)setTestCompleteChimeAlertEnabled:(BOOL)a3
{
  self->_testCompleteChimeAlertEnabled = a3;
}

- (unsigned)testCompleteAlertTime
{
  return self->_testCompleteAlertTime;
}

- (void)setTestCompleteAlertTime:(unsigned int)a3
{
  self->_testCompleteAlertTime = a3;
}

@end