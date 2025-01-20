@interface CameraSensorInputs
- (BOOL)enableMaxDataRate;
- (BOOL)enableTestPatternPN9;
- (BOOL)validateAndInitializeParameters:(id)a3;
- (BOOL)validateAndInitializePredicates:(id)a3;
- (BOOL)validateAndInitializeSpecifications:(id)a3;
- (NSNumber)minimumFrameRate;
- (NSString)identifier;
- (double)frameSampleTimeout;
- (int)framesToSample;
- (void)setEnableMaxDataRate:(BOOL)a3;
- (void)setEnableTestPatternPN9:(BOOL)a3;
- (void)setFrameSampleTimeout:(double)a3;
- (void)setFramesToSample:(int)a3;
- (void)setIdentifier:(id)a3;
- (void)setMinimumFrameRate:(id)a3;
@end

@implementation CameraSensorInputs

- (BOOL)validateAndInitializePredicates:(id)a3
{
  char v8 = 0;
  id v4 = a3;
  v5 = +[NSSet setWithObjects:@"Rear", @"Front", @"FrontSuperWide", @"RearTelephoto", @"RearSynced", @"RearSuperWide", 0];
  v6 = [v4 dk_stringFromRequiredKey:@"identifier" inSet:v5 failed:&v8];

  [(CameraSensorInputs *)self setIdentifier:v6];
  LOBYTE(self) = v8 == 0;

  return (char)self;
}

- (BOOL)validateAndInitializeParameters:(id)a3
{
  char v7 = 0;
  id v4 = a3;
  [self setEnableMaxDataRate:[v4 dk_BOOLFromKey:@"enableMaxDataRate" defaultValue:0 failed:&v7]];
  id v5 = [v4 dk_BOOLFromKey:@"enableTestPatternPN9" defaultValue:0 failed:&v7];

  [(CameraSensorInputs *)self setEnableTestPatternPN9:v5];
  return v7 == 0;
}

- (BOOL)validateAndInitializeSpecifications:(id)a3
{
  unsigned __int8 v14 = 0;
  id v4 = a3;
  id v5 = [v4 dk_numberFromKey:@"framesToSample" lowerBound:&off_100010F58 upperBound:&off_100010F70 defaultValue:&off_100010F88 failed:&v14];
  -[CameraSensorInputs setFramesToSample:](self, "setFramesToSample:", [v5 intValue]);

  v6 = [v4 dk_numberFromKey:@"frameSampleTimeout" lowerBound:&off_100010FA0 upperBound:&off_100010FB0 defaultValue:&off_100010FC0 failed:&v14];
  [v6 doubleValue];
  [(CameraSensorInputs *)self setFrameSampleTimeout:"setFrameSampleTimeout:"];

  char v7 = [v4 objectForKeyedSubscript:@"minimumFrameRate"];

  int v8 = v14;
  if (!v14 && v7)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(CameraSensorInputs *)self setMinimumFrameRate:v7];
      v9 = [(CameraSensorInputs *)self minimumFrameRate];
      if ((int)[v9 intValue] <= 0)
      {
      }
      else
      {
        v10 = [(CameraSensorInputs *)self minimumFrameRate];
        int v11 = [v10 intValue];

        if (v11 <= 1000)
        {
          int v8 = v14;
          goto LABEL_9;
        }
      }
    }
    int v8 = 1;
    unsigned __int8 v14 = 1;
  }
LABEL_9:
  BOOL v12 = v8 == 0;

  return v12;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (BOOL)enableMaxDataRate
{
  return self->_enableMaxDataRate;
}

- (void)setEnableMaxDataRate:(BOOL)a3
{
  self->_enableMaxDataRate = a3;
}

- (BOOL)enableTestPatternPN9
{
  return self->_enableTestPatternPN9;
}

- (void)setEnableTestPatternPN9:(BOOL)a3
{
  self->_enableTestPatternPN9 = a3;
}

- (int)framesToSample
{
  return self->_framesToSample;
}

- (void)setFramesToSample:(int)a3
{
  self->_framesToSample = a3;
}

- (double)frameSampleTimeout
{
  return self->_frameSampleTimeout;
}

- (void)setFrameSampleTimeout:(double)a3
{
  self->_frameSampleTimeout = a3;
}

- (NSNumber)minimumFrameRate
{
  return self->_minimumFrameRate;
}

- (void)setMinimumFrameRate:(id)a3
{
  self->_minimumFrameRate = (NSNumber *)a3;
}

- (void).cxx_destruct
{
}

@end