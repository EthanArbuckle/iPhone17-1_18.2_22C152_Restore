@interface TouchIDSensorSPIBusIntegrityInputs
- (BOOL)validateAndInitializeParameters:(id)a3;
- (double)runDelay;
- (int)numberOfRuns;
- (void)setNumberOfRuns:(int)a3;
- (void)setRunDelay:(double)a3;
@end

@implementation TouchIDSensorSPIBusIntegrityInputs

- (BOOL)validateAndInitializeParameters:(id)a3
{
  char v8 = 0;
  id v4 = a3;
  v5 = [v4 dk_numberFromRequiredKey:@"numberOfRuns" lowerBound:&off_100004430 upperBound:&off_100004448 failed:&v8];
  -[TouchIDSensorSPIBusIntegrityInputs setNumberOfRuns:](self, "setNumberOfRuns:", [v5 intValue]);

  v6 = [v4 dk_numberFromRequiredKey:@"runDelay" lowerBound:&off_100004460 upperBound:&off_100004470 failed:&v8];

  [v6 doubleValue];
  -[TouchIDSensorSPIBusIntegrityInputs setRunDelay:](self, "setRunDelay:");

  return v8 == 0;
}

- (int)numberOfRuns
{
  return self->_numberOfRuns;
}

- (void)setNumberOfRuns:(int)a3
{
  self->_numberOfRuns = a3;
}

- (double)runDelay
{
  return self->_runDelay;
}

- (void)setRunDelay:(double)a3
{
  self->_runDelay = a3;
}

@end