@interface HKElectrocardiogramSessionConfiguration
+ (BOOL)supportsSecureCoding;
+ (HKElectrocardiogramSessionConfiguration)sessionConfigurationWithUUID:(id)a3 mode:(int64_t)a4 maximumDuration:(double)a5 wornOnRightArm:(BOOL)a6;
- (BOOL)wornOnRightArm;
- (HKElectrocardiogramSessionConfiguration)initWithCoder:(id)a3;
- (NSUUID)sessionUUID;
- (double)maximumDuration;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)mode;
- (void)encodeWithCoder:(id)a3;
- (void)setMaximumDuration:(double)a3;
- (void)setMode:(int64_t)a3;
- (void)setSessionUUID:(id)a3;
- (void)setWornOnRightArm:(BOOL)a3;
@end

@implementation HKElectrocardiogramSessionConfiguration

+ (HKElectrocardiogramSessionConfiguration)sessionConfigurationWithUUID:(id)a3 mode:(int64_t)a4 maximumDuration:(double)a5 wornOnRightArm:(BOOL)a6
{
  BOOL v6 = a6;
  id v9 = a3;
  v10 = objc_alloc_init(HKElectrocardiogramSessionConfiguration);
  [(HKElectrocardiogramSessionConfiguration *)v10 setSessionUUID:v9];

  [(HKElectrocardiogramSessionConfiguration *)v10 setMode:a4];
  [(HKElectrocardiogramSessionConfiguration *)v10 setMaximumDuration:a5];
  [(HKElectrocardiogramSessionConfiguration *)v10 setWornOnRightArm:v6];

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  [v4 setSessionUUID:self->_sessionUUID];
  [v4 setMode:self->_mode];
  [v4 setMaximumDuration:self->_maximumDuration];
  [v4 setWornOnRightArm:self->_wornOnRightArm];
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKElectrocardiogramSessionConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HKElectrocardiogramSessionConfiguration;
  v5 = [(HKElectrocardiogramSessionConfiguration *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sessionUUID"];
    sessionUUID = v5->_sessionUUID;
    v5->_sessionUUID = (NSUUID *)v6;

    v5->_mode = [v4 decodeIntegerForKey:@"mode"];
    [v4 decodeDoubleForKey:@"maximumDuration"];
    v5->_maximumDuration = v8;
    v5->_wornOnRightArm = [v4 decodeBoolForKey:@"wornOnRightArm"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  sessionUUID = self->_sessionUUID;
  id v5 = a3;
  [v5 encodeObject:sessionUUID forKey:@"sessionUUID"];
  [v5 encodeInteger:self->_mode forKey:@"mode"];
  [v5 encodeDouble:@"maximumDuration" forKey:self->_maximumDuration];
  [v5 encodeBool:self->_wornOnRightArm forKey:@"wornOnRightArm"];
}

- (NSUUID)sessionUUID
{
  return self->_sessionUUID;
}

- (void)setSessionUUID:(id)a3
{
}

- (int64_t)mode
{
  return self->_mode;
}

- (void)setMode:(int64_t)a3
{
  self->_mode = a3;
}

- (double)maximumDuration
{
  return self->_maximumDuration;
}

- (void)setMaximumDuration:(double)a3
{
  self->_maximumDuration = a3;
}

- (BOOL)wornOnRightArm
{
  return self->_wornOnRightArm;
}

- (void)setWornOnRightArm:(BOOL)a3
{
  self->_wornOnRightArm = a3;
}

- (void).cxx_destruct
{
}

@end