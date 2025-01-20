@interface RFSelfDiagInputs
- (BOOL)testCompleteChimeAlertEnabled;
- (BOOL)testCompleteVibrationAlertEnabled;
- (BOOL)validateAndInitializeParameters:(id)a3;
- (id)commandDescription;
- (int)command;
- (int)detectChamberSensor;
- (unsigned)detectChamberReadyALSThreshold;
- (unsigned)detectChamberReadyWaitTime;
- (unsigned)measureType;
- (unsigned)testCompleteAlertTime;
- (void)setCommand:(int)a3;
- (void)setDetectChamberReadyALSThreshold:(unsigned int)a3;
- (void)setDetectChamberReadyWaitTime:(unsigned int)a3;
- (void)setDetectChamberSensor:(int)a3;
- (void)setMeasureType:(unsigned int)a3;
- (void)setTestCompleteAlertTime:(unsigned int)a3;
- (void)setTestCompleteChimeAlertEnabled:(BOOL)a3;
- (void)setTestCompleteVibrationAlertEnabled:(BOOL)a3;
@end

@implementation RFSelfDiagInputs

- (id)commandDescription
{
  unsigned int v2 = [(RFSelfDiagInputs *)self command];
  if (v2 > 3) {
    return @"Unkown command";
  }
  else {
    return *(&off_100010400 + (int)v2);
  }
}

- (BOOL)validateAndInitializeParameters:(id)a3
{
  id v4 = a3;
  char v13 = 0;
  v5 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
  if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v15 = v4;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v5, OS_LOG_TYPE_DEFAULT, "Validating parmaeters: %@", buf, 0xCu);
  }
  v6 = [v4 ds_numberFromKey:@"command" defaultValue:&off_1000109B8 failed:&v13];
  -[RFSelfDiagInputs setCommand:](self, "setCommand:", [v6 intValue]);

  v7 = [v4 ds_numberFromKey:@"measureType" defaultValue:&off_1000109D0 failed:&v13];
  -[RFSelfDiagInputs setMeasureType:](self, "setMeasureType:", [v7 intValue]);

  v8 = [v4 ds_numberFromKey:@"detectChamberReady" lowerBound:&off_1000109B8 upperBound:&off_1000109E8 defaultValue:&off_1000109E8 failed:&v13];
  -[RFSelfDiagInputs setDetectChamberSensor:](self, "setDetectChamberSensor:", [v8 intValue]);

  v9 = [v4 ds_numberFromKey:@"ALSThreshold" lowerBound:&off_1000109B8 upperBound:&off_100010A00 defaultValue:&off_100010A18 failed:&v13];
  -[RFSelfDiagInputs setDetectChamberReadyALSThreshold:](self, "setDetectChamberReadyALSThreshold:", [v9 intValue]);

  v10 = [v4 ds_numberFromKey:@"closeChamberCountdown" lowerBound:&off_100010A30 upperBound:&off_100010A48 defaultValue:&off_100010A60 failed:&v13];
  -[RFSelfDiagInputs setDetectChamberReadyWaitTime:](self, "setDetectChamberReadyWaitTime:", [v10 intValue]);

  v11 = [v4 ds_numberFromKey:@"testCompleteAlertTime" defaultValue:&off_100010A78 failed:&v13];
  -[RFSelfDiagInputs setTestCompleteAlertTime:](self, "setTestCompleteAlertTime:", [v11 intValue]);

  -[RFSelfDiagInputs setTestCompleteVibrationAlertEnabled:[self ds_BOOLFromKey:@"vibrationAlert" defaultValue:1 failed:&v13]];
  [self setTestCompleteChimeAlertEnabled:[v4 ds_BOOLFromKey:@"chimeAlert" defaultValue:1 failed:&v13]];

  return 1;
}

- (int)command
{
  return self->_command;
}

- (void)setCommand:(int)a3
{
  self->_command = a3;
}

- (unsigned)measureType
{
  return self->_measureType;
}

- (void)setMeasureType:(unsigned int)a3
{
  self->_measureType = a3;
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