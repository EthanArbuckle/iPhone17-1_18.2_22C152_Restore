@interface ForceTouchInputs
- (BOOL)hapticFeedback;
- (BOOL)randomizeCoordinates;
- (BOOL)validateAndInitializeParameters:(id)a3;
- (BOOL)validateAndInitializeSpecifications:(id)a3;
- (NSArray)pressurePoints;
- (NSArray)testCoordinateColorsParameter;
- (NSString)forceTouchSensitivityText;
- (double)noInputTimeout;
- (double)partialInputTimeout;
- (float)endingCircleRatio;
- (float)startingCircleRatio;
- (int)gridColumns;
- (int)gridRows;
- (void)setEndingCircleRatio:(float)a3;
- (void)setForceTouchSensitivityText:(id)a3;
- (void)setGridColumns:(int)a3;
- (void)setGridRows:(int)a3;
- (void)setHapticFeedback:(BOOL)a3;
- (void)setNoInputTimeout:(double)a3;
- (void)setPartialInputTimeout:(double)a3;
- (void)setPressurePoints:(id)a3;
- (void)setRandomizeCoordinates:(BOOL)a3;
- (void)setStartingCircleRatio:(float)a3;
- (void)setTestCoordinateColorsParameter:(id)a3;
@end

@implementation ForceTouchInputs

- (BOOL)validateAndInitializeSpecifications:(id)a3
{
  char v10 = 0;
  id v4 = a3;
  v5 = [v4 dk_numberFromRequiredKey:@"startingCircleRatio" lowerBound:&off_10000C8E8 upperBound:&off_10000C8F8 failed:&v10];
  [v5 floatValue];
  -[ForceTouchInputs setStartingCircleRatio:](self, "setStartingCircleRatio:");

  v6 = [v4 dk_numberFromRequiredKey:@"endingCircleRatio" lowerBound:&off_10000C8E8 upperBound:&off_10000C8F8 failed:&v10];
  [v6 floatValue];
  -[ForceTouchInputs setEndingCircleRatio:](self, "setEndingCircleRatio:");

  v7 = [v4 dk_numberFromRequiredKey:@"gridRows" lowerBound:&off_10000C928 upperBound:&off_10000C940 failed:&v10];
  -[ForceTouchInputs setGridRows:](self, "setGridRows:", [v7 intValue]);

  v8 = [v4 dk_numberFromRequiredKey:@"gridColumns" lowerBound:&off_10000C928 upperBound:&off_10000C940 failed:&v10];

  -[ForceTouchInputs setGridColumns:](self, "setGridColumns:", [v8 intValue]);
  return v10 == 0;
}

- (BOOL)validateAndInitializeParameters:(id)a3
{
  char v13 = 0;
  id v4 = a3;
  v5 = +[NSSet setWithObject:objc_opt_class()];
  v6 = [v4 dk_arrayFromRequiredKey:@"pressurePoints" types:v5 maxLength:1000 failed:&v13 validator:&stru_10000C378];
  [(ForceTouchInputs *)self setPressurePoints:v6];

  v7 = [v4 dk_stringFromRequiredKey:@"forceTouchSensitivityText" maxLength:100 failed:&v13];
  [(ForceTouchInputs *)self setForceTouchSensitivityText:v7];

  v8 = [v4 dk_numberFromKey:@"partialInputTimeout" lowerBound:&off_10000CAB0 upperBound:&off_10000CAC0 defaultValue:&off_10000CAD0 failed:&v13];
  [v8 doubleValue];
  [(ForceTouchInputs *)self setPartialInputTimeout:"setPartialInputTimeout:"];

  v9 = [v4 dk_numberFromKey:@"noInputTimeout" lowerBound:&off_10000CAB0 upperBound:&off_10000CAC0 defaultValue:&off_10000CAD0 failed:&v13];
  [v9 doubleValue];
  [(ForceTouchInputs *)self setNoInputTimeout:"setNoInputTimeout:"];

  -[ForceTouchInputs setRandomizeCoordinates:[self dk_BOOLFromKey:@"randomizeCoordinates" defaultValue:0 failed:&v13]];
  -[ForceTouchInputs setHapticFeedback:[self dk_BOOLFromKey:@"hapticFeedback" defaultValue:0 failed:&v13]];
  char v10 = +[NSSet setWithObject:objc_opt_class()];
  v11 = [v4 dk_arrayFromKey:@"testCoordinates" types:v10 maxLength:18 defaultValue:0 failed:&v13];

  [(ForceTouchInputs *)self setTestCoordinateColorsParameter:v11];
  return v13 == 0;
}

- (NSArray)testCoordinateColorsParameter
{
  return self->_testCoordinateColorsParameter;
}

- (void)setTestCoordinateColorsParameter:(id)a3
{
}

- (NSArray)pressurePoints
{
  return self->_pressurePoints;
}

- (void)setPressurePoints:(id)a3
{
}

- (double)noInputTimeout
{
  return self->_noInputTimeout;
}

- (void)setNoInputTimeout:(double)a3
{
  self->_noInputTimeout = a3;
}

- (double)partialInputTimeout
{
  return self->_partialInputTimeout;
}

- (void)setPartialInputTimeout:(double)a3
{
  self->_partialInputTimeout = a3;
}

- (BOOL)hapticFeedback
{
  return self->_hapticFeedback;
}

- (void)setHapticFeedback:(BOOL)a3
{
  self->_hapticFeedback = a3;
}

- (NSString)forceTouchSensitivityText
{
  return self->_forceTouchSensitivityText;
}

- (void)setForceTouchSensitivityText:(id)a3
{
}

- (float)startingCircleRatio
{
  return self->_startingCircleRatio;
}

- (void)setStartingCircleRatio:(float)a3
{
  self->_startingCircleRatio = a3;
}

- (float)endingCircleRatio
{
  return self->_endingCircleRatio;
}

- (void)setEndingCircleRatio:(float)a3
{
  self->_endingCircleRatio = a3;
}

- (int)gridRows
{
  return self->_gridRows;
}

- (void)setGridRows:(int)a3
{
  self->_gridRows = a3;
}

- (int)gridColumns
{
  return self->_gridColumns;
}

- (void)setGridColumns:(int)a3
{
  self->_gridColumns = a3;
}

- (BOOL)randomizeCoordinates
{
  return self->_randomizeCoordinates;
}

- (void)setRandomizeCoordinates:(BOOL)a3
{
  self->_randomizeCoordinates = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_forceTouchSensitivityText, 0);
  objc_storeStrong((id *)&self->_pressurePoints, 0);

  objc_storeStrong((id *)&self->_testCoordinateColorsParameter, 0);
}

@end