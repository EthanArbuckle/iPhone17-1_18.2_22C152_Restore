@interface InteractiveAccelerometerInputs
- (BOOL)validateAndInitializeParameters:(id)a3;
- (BOOL)validateAndInitializePredicates:(id)a3;
- (BOOL)validateAndInitializeSpecifications:(id)a3;
- (NSArray)orientationsParameter;
- (NSDictionary)componentOrientationSpecifications;
- (NSDictionary)parameters;
- (NSDictionary)predicates;
- (NSDictionary)specifications;
- (NSNumber)boundOffsetMax;
- (NSNumber)boundOffsetMin;
- (double)degreesShiftRange;
- (double)holdStationaryTimeout;
- (double)notStationaryTimeout;
- (double)secondsToRunOrientation;
- (double)zeroRange;
- (int)outputDataRate;
- (unint64_t)componentSensor;
- (void)setBoundOffsetMax:(id)a3;
- (void)setBoundOffsetMin:(id)a3;
- (void)setComponentOrientationSpecifications:(id)a3;
- (void)setComponentSensor:(unint64_t)a3;
- (void)setDegreesShiftRange:(double)a3;
- (void)setHoldStationaryTimeout:(double)a3;
- (void)setNotStationaryTimeout:(double)a3;
- (void)setOrientationsParameter:(id)a3;
- (void)setOutputDataRate:(int)a3;
- (void)setParameters:(id)a3;
- (void)setPredicates:(id)a3;
- (void)setSecondsToRunOrientation:(double)a3;
- (void)setSpecifications:(id)a3;
- (void)setZeroRange:(double)a3;
@end

@implementation InteractiveAccelerometerInputs

- (BOOL)validateAndInitializePredicates:(id)a3
{
  char v12 = 0;
  id v4 = a3;
  [(InteractiveAccelerometerInputs *)self setPredicates:v4];
  v5 = +[NSSet setWithObjects:@"Accelerometer", @"Gyro", 0];
  v6 = [v4 dk_stringFromRequiredKey:@"type" inSet:v5 failed:&v12];

  if ([v6 isEqualToString:@"Accelerometer"])
  {
    uint64_t v7 = 0;
    v8 = &off_100010B80;
    v9 = &off_100010B70;
LABEL_5:
    [(InteractiveAccelerometerInputs *)self setComponentSensor:v7];
    [(InteractiveAccelerometerInputs *)self setBoundOffsetMin:v9];
    [(InteractiveAccelerometerInputs *)self setBoundOffsetMax:v8];
    goto LABEL_6;
  }
  if ([v6 isEqualToString:@"Gyro"])
  {
    v8 = &off_100010BA0;
    uint64_t v7 = 1;
    v9 = &off_100010B90;
    goto LABEL_5;
  }
LABEL_6:
  BOOL v10 = v12 == 0;

  return v10;
}

- (BOOL)validateAndInitializeSpecifications:(id)a3
{
  id v4 = a3;
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x2020000000;
  char v30 = 0;
  [(InteractiveAccelerometerInputs *)self setSpecifications:v4];
  v5 = +[NSSet setWithObjects:@"portrait", @"portraitUpsideDown", @"landscapeLeft", @"landscapeRight", @"faceUp", @"faceDown", 0];
  v6 = [v4 dk_dictionaryFromRequiredKey:@"orientations" limitedToKeys:v5 failed:v28 + 3];
  uint64_t v7 = [v6 allKeys];
  v8 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v7 count]);

  unint64_t v9 = [(InteractiveAccelerometerInputs *)self componentSensor];
  BOOL v10 = @"gyroscope";
  if (!v9) {
    BOOL v10 = @"accelerometer";
  }
  v11 = v10;
  char v12 = +[NSSet setWithObjects:@"zeroRangeThreshold", @"degreesShiftRangeThreshold", @"lowerBoundOffsetX", @"upperBoundOffsetX", @"lowerBoundOffsetY", @"upperBoundOffsetY", @"lowerBoundOffsetZ", @"upperBoundOffsetZ", 0];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100002B74;
  v21[3] = &unk_1000103F8;
  v13 = v11;
  v22 = v13;
  id v14 = v12;
  v26 = &v27;
  id v23 = v14;
  v24 = self;
  id v15 = v8;
  id v25 = v15;
  [v6 enumerateKeysAndObjectsUsingBlock:v21];
  [(InteractiveAccelerometerInputs *)self setComponentOrientationSpecifications:v15];
  v16 = [v4 dk_numberFromRequiredKey:@"outputDataRate" lowerBound:&off_100010BC0 upperBound:&off_100010BD8 failed:v28 + 3];
  -[InteractiveAccelerometerInputs setOutputDataRate:](self, "setOutputDataRate:", [v16 intValue]);

  v17 = [v4 dk_numberFromRequiredKey:@"secondsToRunOrientation" lowerBound:&off_100010E60 upperBound:&off_100010E70 failed:v28 + 3];
  [v17 floatValue];
  [(InteractiveAccelerometerInputs *)self setSecondsToRunOrientation:v18];

  BOOL v19 = *((unsigned char *)v28 + 24) == 0;
  _Block_object_dispose(&v27, 8);

  return v19;
}

- (BOOL)validateAndInitializeParameters:(id)a3
{
  char v12 = 0;
  id v4 = a3;
  [(InteractiveAccelerometerInputs *)self setParameters:v4];
  v5 = [(InteractiveAccelerometerInputs *)self componentOrientationSpecifications];
  v6 = [v5 allKeys];
  uint64_t v7 = +[NSSet setWithArray:v6];
  v8 = [v4 dk_arrayFromRequiredKey:@"orientations" inSet:v7 maxLength:100 failed:&v12];
  [(InteractiveAccelerometerInputs *)self setOrientationsParameter:v8];

  unint64_t v9 = [v4 dk_numberFromRequiredKey:@"notStationaryTimeout" lowerBound:&off_100010E60 upperBound:&off_100010E70 failed:&v12];
  [v9 doubleValue];
  [(InteractiveAccelerometerInputs *)self setNotStationaryTimeout:"setNotStationaryTimeout:"];

  BOOL v10 = [v4 dk_numberFromRequiredKey:@"holdStationaryTimeout" lowerBound:&off_100010E60 upperBound:&off_100010E70 failed:&v12];

  [v10 doubleValue];
  [(InteractiveAccelerometerInputs *)self setHoldStationaryTimeout:"setHoldStationaryTimeout:"];

  return v12 == 0;
}

- (unint64_t)componentSensor
{
  return self->_componentSensor;
}

- (void)setComponentSensor:(unint64_t)a3
{
  self->_componentSensor = a3;
}

- (NSNumber)boundOffsetMin
{
  return self->_boundOffsetMin;
}

- (void)setBoundOffsetMin:(id)a3
{
}

- (NSNumber)boundOffsetMax
{
  return self->_boundOffsetMax;
}

- (void)setBoundOffsetMax:(id)a3
{
}

- (NSArray)orientationsParameter
{
  return self->_orientationsParameter;
}

- (void)setOrientationsParameter:(id)a3
{
}

- (double)notStationaryTimeout
{
  return self->_notStationaryTimeout;
}

- (void)setNotStationaryTimeout:(double)a3
{
  self->_notStationaryTimeout = a3;
}

- (double)holdStationaryTimeout
{
  return self->_holdStationaryTimeout;
}

- (void)setHoldStationaryTimeout:(double)a3
{
  self->_holdStationaryTimeout = a3;
}

- (double)zeroRange
{
  return self->_zeroRange;
}

- (void)setZeroRange:(double)a3
{
  self->_zeroRange = a3;
}

- (double)degreesShiftRange
{
  return self->_degreesShiftRange;
}

- (void)setDegreesShiftRange:(double)a3
{
  self->_degreesShiftRange = a3;
}

- (NSDictionary)componentOrientationSpecifications
{
  return self->_componentOrientationSpecifications;
}

- (void)setComponentOrientationSpecifications:(id)a3
{
}

- (int)outputDataRate
{
  return self->_outputDataRate;
}

- (void)setOutputDataRate:(int)a3
{
  self->_outputDataRate = a3;
}

- (double)secondsToRunOrientation
{
  return self->_secondsToRunOrientation;
}

- (void)setSecondsToRunOrientation:(double)a3
{
  self->_secondsToRunOrientation = a3;
}

- (NSDictionary)predicates
{
  return self->_predicates;
}

- (void)setPredicates:(id)a3
{
}

- (NSDictionary)specifications
{
  return self->_specifications;
}

- (void)setSpecifications:(id)a3
{
}

- (NSDictionary)parameters
{
  return self->_parameters;
}

- (void)setParameters:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_specifications, 0);
  objc_storeStrong((id *)&self->_predicates, 0);
  objc_storeStrong((id *)&self->_componentOrientationSpecifications, 0);
  objc_storeStrong((id *)&self->_orientationsParameter, 0);
  objc_storeStrong((id *)&self->_boundOffsetMax, 0);

  objc_storeStrong((id *)&self->_boundOffsetMin, 0);
}

@end