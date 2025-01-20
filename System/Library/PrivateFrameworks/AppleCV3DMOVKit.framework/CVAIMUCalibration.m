@interface CVAIMUCalibration
+ (BOOL)supportsSecureCoding;
+ (id)classes;
- (CVAIMUCalibration)initWithCoder:(id)a3;
- (NSArray)accelConversion;
- (NSArray)gravity;
- (NSArray)gyroConversion;
- (NSArray)imuToIMURotation;
- (NSArray)imuToIMUTranslation;
- (NSArray)noiseCharacteristics;
- (double)accelTimestampCorrection;
- (id)debugDescription;
- (id)dictionary;
- (void)encodeWithCoder:(id)a3;
- (void)setAccelConversion:(id)a3;
- (void)setAccelTimestampCorrection:(double)a3;
- (void)setGravity:(id)a3;
- (void)setGyroConversion:(id)a3;
- (void)setImuToIMURotation:(id)a3;
- (void)setImuToIMUTranslation:(id)a3;
- (void)setNoiseCharacteristics:(id)a3;
@end

@implementation CVAIMUCalibration

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)classes
{
  if (qword_267C58B88 == -1)
  {
    v2 = (void *)qword_267C58B80;
  }
  else
  {
    dispatch_once(&qword_267C58B88, &unk_26CB5E2F8);
    v2 = (void *)qword_267C58B80;
  }
  return v2;
}

- (CVAIMUCalibration)initWithCoder:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)CVAIMUCalibration;
  v5 = [(CVAIMUCalibration *)&v21 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x21D490BF0]();
    uint64_t v7 = [v4 decodeObjectForKey:@"nc"];
    noiseCharacteristics = v5->_noiseCharacteristics;
    v5->_noiseCharacteristics = (NSArray *)v7;

    uint64_t v9 = [v4 decodeObjectForKey:@"gr"];
    gravity = v5->_gravity;
    v5->_gravity = (NSArray *)v9;

    [v4 decodeDoubleForKey:@"atc"];
    v5->_accelTimestampCorrection = v11;
    uint64_t v12 = [v4 decodeObjectForKey:@"ac"];
    accelConversion = v5->_accelConversion;
    v5->_accelConversion = (NSArray *)v12;

    uint64_t v14 = [v4 decodeObjectForKey:@"gc"];
    gyroConversion = v5->_gyroConversion;
    v5->_gyroConversion = (NSArray *)v14;

    uint64_t v16 = [v4 decodeObjectForKey:@"r"];
    imuToIMURotation = v5->_imuToIMURotation;
    v5->_imuToIMURotation = (NSArray *)v16;

    uint64_t v18 = [v4 decodeObjectForKey:@"t"];
    imuToIMUTranslation = v5->_imuToIMUTranslation;
    v5->_imuToIMUTranslation = (NSArray *)v18;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  id v4 = (void *)MEMORY[0x21D490BF0]();
  [v5 encodeObject:self->_noiseCharacteristics forKey:@"nc"];
  [v5 encodeObject:self->_gravity forKey:@"gr"];
  [v5 encodeDouble:@"atc" forKey:self->_accelTimestampCorrection];
  [v5 encodeObject:self->_accelConversion forKey:@"ac"];
  [v5 encodeObject:self->_gyroConversion forKey:@"gc"];
  [v5 encodeObject:self->_imuToIMURotation forKey:@"r"];
  [v5 encodeObject:self->_imuToIMUTranslation forKey:@"t"];
}

- (id)dictionary
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v8[0] = @"nc";
  v8[1] = @"gr";
  gravity = self->_gravity;
  v9[0] = self->_noiseCharacteristics;
  v9[1] = gravity;
  v8[2] = @"atc";
  id v4 = [NSNumber numberWithDouble:self->_accelTimestampCorrection];
  accelConversion = self->_accelConversion;
  v9[2] = v4;
  v9[3] = accelConversion;
  v8[3] = @"ac";
  v8[4] = @"gc";
  long long v10 = *(_OWORD *)&self->_gyroConversion;
  v8[5] = @"r";
  v8[6] = @"t";
  imuToIMUTranslation = self->_imuToIMUTranslation;
  v6 = [NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:7];

  return v6;
}

- (id)debugDescription
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(CVAIMUCalibration *)self dictionary];
  v6 = [v3 stringWithFormat:@"<%@: %@>", v4, v5];

  return v6;
}

- (NSArray)noiseCharacteristics
{
  return self->_noiseCharacteristics;
}

- (void)setNoiseCharacteristics:(id)a3
{
}

- (NSArray)gravity
{
  return self->_gravity;
}

- (void)setGravity:(id)a3
{
}

- (double)accelTimestampCorrection
{
  return self->_accelTimestampCorrection;
}

- (void)setAccelTimestampCorrection:(double)a3
{
  self->_accelTimestampCorrection = a3;
}

- (NSArray)accelConversion
{
  return self->_accelConversion;
}

- (void)setAccelConversion:(id)a3
{
}

- (NSArray)gyroConversion
{
  return self->_gyroConversion;
}

- (void)setGyroConversion:(id)a3
{
}

- (NSArray)imuToIMURotation
{
  return self->_imuToIMURotation;
}

- (void)setImuToIMURotation:(id)a3
{
}

- (NSArray)imuToIMUTranslation
{
  return self->_imuToIMUTranslation;
}

- (void)setImuToIMUTranslation:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imuToIMUTranslation, 0);
  objc_storeStrong((id *)&self->_imuToIMURotation, 0);
  objc_storeStrong((id *)&self->_gyroConversion, 0);
  objc_storeStrong((id *)&self->_accelConversion, 0);
  objc_storeStrong((id *)&self->_gravity, 0);
  objc_storeStrong((id *)&self->_noiseCharacteristics, 0);
}

@end