@interface BatterySwellingInputs
- (BOOL)validateAndInitializeParameters:(id)a3;
- (BOOL)validateAndInitializeSpecifications:(id)a3;
- (double)flipSetupTimeout;
- (double)samplingSetupTimeout;
- (double)samplingTimeout;
- (int)angleTolerance;
- (int)numFramesToRecord;
- (int)pixelMapHeight;
- (int)pixelMapWidth;
- (void)setAngleTolerance:(int)a3;
- (void)setFlipSetupTimeout:(double)a3;
- (void)setNumFramesToRecord:(int)a3;
- (void)setPixelMapHeight:(int)a3;
- (void)setPixelMapWidth:(int)a3;
- (void)setSamplingSetupTimeout:(double)a3;
- (void)setSamplingTimeout:(double)a3;
@end

@implementation BatterySwellingInputs

- (BOOL)validateAndInitializeSpecifications:(id)a3
{
  char v8 = 0;
  id v4 = a3;
  v5 = [v4 dk_numberFromRequiredKey:@"pixelMapHeight" lowerBound:&off_10000C8D0 upperBound:&off_10000C8E8 failed:&v8];
  -[BatterySwellingInputs setPixelMapHeight:](self, "setPixelMapHeight:", [v5 intValue]);

  v6 = [v4 dk_numberFromRequiredKey:@"pixelMapWidth" lowerBound:&off_10000C8D0 upperBound:&off_10000C8E8 failed:&v8];

  -[BatterySwellingInputs setPixelMapWidth:](self, "setPixelMapWidth:", [v6 intValue]);
  return v8 == 0;
}

- (BOOL)validateAndInitializeParameters:(id)a3
{
  char v11 = 0;
  id v4 = a3;
  v5 = [v4 dk_numberFromRequiredKey:@"angleTolerance" lowerBound:&off_10000C900 upperBound:&off_10000C918 failed:&v11];
  -[BatterySwellingInputs setAngleTolerance:](self, "setAngleTolerance:", [v5 intValue]);

  v6 = [v4 dk_numberFromRequiredKey:@"samplingSetupTimeout" lowerBound:&off_10000C978 upperBound:&off_10000C988 failed:&v11];
  [v6 doubleValue];
  [(BatterySwellingInputs *)self setSamplingSetupTimeout:"setSamplingSetupTimeout:"];

  v7 = [v4 dk_numberFromRequiredKey:@"samplingTimeout" lowerBound:&off_10000C978 upperBound:&off_10000C988 failed:&v11];
  [v7 doubleValue];
  [(BatterySwellingInputs *)self setSamplingTimeout:"setSamplingTimeout:"];

  char v8 = [v4 dk_numberFromRequiredKey:@"flipSetupTimeout" lowerBound:&off_10000C978 upperBound:&off_10000C988 failed:&v11];
  [v8 doubleValue];
  [(BatterySwellingInputs *)self setFlipSetupTimeout:"setFlipSetupTimeout:"];

  v9 = [v4 dk_numberFromRequiredKey:@"numberOfFramesToCapture" lowerBound:&off_10000C900 upperBound:&off_10000C930 failed:&v11];

  -[BatterySwellingInputs setNumFramesToRecord:](self, "setNumFramesToRecord:", [v9 intValue]);
  return v11 == 0;
}

- (int)pixelMapHeight
{
  return self->_pixelMapHeight;
}

- (void)setPixelMapHeight:(int)a3
{
  self->_pixelMapHeight = a3;
}

- (int)pixelMapWidth
{
  return self->_pixelMapWidth;
}

- (void)setPixelMapWidth:(int)a3
{
  self->_pixelMapWidth = a3;
}

- (int)angleTolerance
{
  return self->_angleTolerance;
}

- (void)setAngleTolerance:(int)a3
{
  self->_angleTolerance = a3;
}

- (double)samplingSetupTimeout
{
  return self->_samplingSetupTimeout;
}

- (void)setSamplingSetupTimeout:(double)a3
{
  self->_samplingSetupTimeout = a3;
}

- (double)flipSetupTimeout
{
  return self->_flipSetupTimeout;
}

- (void)setFlipSetupTimeout:(double)a3
{
  self->_flipSetupTimeout = a3;
}

- (double)samplingTimeout
{
  return self->_samplingTimeout;
}

- (void)setSamplingTimeout:(double)a3
{
  self->_samplingTimeout = a3;
}

- (int)numFramesToRecord
{
  return self->_numFramesToRecord;
}

- (void)setNumFramesToRecord:(int)a3
{
  self->_numFramesToRecord = a3;
}

@end