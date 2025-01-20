@interface PeCoNetDKDiagnosticInputs
- (BOOL)skipSummaryScreen;
- (BOOL)validateAndInitializeParameters:(id)a3;
- (BOOL)validateAndInitializeSpecifications:(id)a3;
- (float)noMovementAttitudeChangeMinThreshold;
- (int)sceneErrorTimeOut;
- (int)sceneErrorWarningThreshold;
- (int)sessionTimeOut;
- (unsigned)userNotMovingTimeout;
- (void)setNoMovementAttitudeChangeMinThreshold:(float)a3;
- (void)setSceneErrorTimeOut:(int)a3;
- (void)setSceneErrorWarningThreshold:(int)a3;
- (void)setSessionTimeOut:(int)a3;
- (void)setSkipSummaryScreen:(BOOL)a3;
- (void)setUserNotMovingTimeout:(unsigned int)a3;
@end

@implementation PeCoNetDKDiagnosticInputs

- (BOOL)validateAndInitializeSpecifications:(id)a3
{
  return 1;
}

- (BOOL)validateAndInitializeParameters:(id)a3
{
  id v4 = a3;
  NSLog(@"validateAndInitializeParameters: key=%@", v4);
  v5 = [v4 objectForKey:@"sessionTimeOut"];
  v6 = v5;
  if (v5)
  {
    id v7 = [v5 intValue];
    self->_sessionTimeOut = (int)v7;
    NSLog(@"validateAndInitializeParameters: sessionTimeOut=%d", v7);
  }
  else
  {
    self->_sessionTimeOut = 0;
    NSLog(@"validateAndInitializeParameters: _sessionTimeOut is missing");
  }
  v8 = [v4 objectForKey:@"sceneErrorTimeOut"];

  if (v8)
  {
    id v9 = [v8 intValue];
    self->_sceneErrorTimeOut = (int)v9;
    NSLog(@"validateAndInitializeParameters: _sceneErrorTimeOut=%d", v9);
  }
  else
  {
    self->_sceneErrorTimeOut = 0;
    NSLog(@"validateAndInitializeParameters: _sceneErrorTimeOut is missing");
  }
  v10 = [v4 objectForKey:@"sceneErrorWarningThreshold"];

  if (v10)
  {
    id v11 = [v10 intValue];
    self->_sceneErrorWarningThreshold = (int)v11;
    NSLog(@"validateAndInitializeParameters: _sceneErrorWarningThreshold=%d", v11);
  }
  else
  {
    self->_sceneErrorWarningThreshold = 0;
    NSLog(@"validateAndInitializeParameters: _sceneErrorWarningThreshold is missing");
  }
  v12 = [v4 objectForKey:@"userNotMovingTimeout"];

  if (v12)
  {
    id v13 = [v12 intValue];
    self->_userNotMovingTimeout = v13;
    NSLog(@"validateAndInitializeParameters: _userNotMovingTimeout=%d", v13);
  }
  else
  {
    self->_userNotMovingTimeout = 0;
    NSLog(@"validateAndInitializeParameters: _userNotMovingTimeout is missing");
  }
  v14 = [v4 objectForKey:@"noMovementAttitudeChangeMinThreshold"];

  if (v14)
  {
    [v14 floatValue];
    self->_noMovementAttitudeChangeMinThreshold = v15;
    NSLog(@"validateAndInitializeParameters: _noMovementAttitudeChangeMinThreshold=%f", v15);
  }
  else
  {
    self->_noMovementAttitudeChangeMinThreshold = 0.0;
    NSLog(@"validateAndInitializeParameters: _noMovementAttitudeChangeMinThreshold is missing");
  }
  v16 = [v4 objectForKey:@"skipSummaryScreen"];

  if (v16)
  {
    self->_skipSummaryScreen = [v16 BOOLValue];
    NSLog(@"validateAndInitializeParameters: received skipSummaryScreen parameter, skipSummaryScreen=%d", [v16 BOOLValue]);
  }
  else
  {
    self->_skipSummaryScreen = 1;
    NSLog(@"validateAndInitializeParameters: skipSummaryScreen is missing, setting to true");
  }

  return 1;
}

- (int)sessionTimeOut
{
  return self->_sessionTimeOut;
}

- (void)setSessionTimeOut:(int)a3
{
  self->_sessionTimeOut = a3;
}

- (int)sceneErrorTimeOut
{
  return self->_sceneErrorTimeOut;
}

- (void)setSceneErrorTimeOut:(int)a3
{
  self->_sceneErrorTimeOut = a3;
}

- (int)sceneErrorWarningThreshold
{
  return self->_sceneErrorWarningThreshold;
}

- (void)setSceneErrorWarningThreshold:(int)a3
{
  self->_sceneErrorWarningThreshold = a3;
}

- (unsigned)userNotMovingTimeout
{
  return self->_userNotMovingTimeout;
}

- (void)setUserNotMovingTimeout:(unsigned int)a3
{
  self->_userNotMovingTimeout = a3;
}

- (float)noMovementAttitudeChangeMinThreshold
{
  return self->_noMovementAttitudeChangeMinThreshold;
}

- (void)setNoMovementAttitudeChangeMinThreshold:(float)a3
{
  self->_noMovementAttitudeChangeMinThreshold = a3;
}

- (BOOL)skipSummaryScreen
{
  return self->_skipSummaryScreen;
}

- (void)setSkipSummaryScreen:(BOOL)a3
{
  self->_skipSummaryScreen = a3;
}

@end