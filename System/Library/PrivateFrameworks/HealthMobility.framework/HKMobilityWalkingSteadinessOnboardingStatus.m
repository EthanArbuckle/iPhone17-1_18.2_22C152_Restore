@interface HKMobilityWalkingSteadinessOnboardingStatus
+ (BOOL)supportsSecureCoding;
- (BOOL)isClassificationAvailable;
- (BOOL)isEqual:(id)a3;
- (BOOL)isLocaleValidOnLocalDevice;
- (BOOL)shouldAdvertiseOnboarding;
- (HKMobilityWalkingSteadinessOnboardingStatus)initWithCoder:(id)a3;
- (HKMobilityWalkingSteadinessOnboardingStatus)initWithState:(int64_t)a3 unavailableReasons:(int64_t)a4 dateOnboarded:(id)a5 shouldOnboardingTileBeAdvertised:(BOOL)a6 isLocaleValidOnLocalDevice:(BOOL)a7 isClassificationAvailable:(BOOL)a8;
- (NSDate)dateOnboarded;
- (int64_t)onboardingUnavailableReasons;
- (int64_t)state;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKMobilityWalkingSteadinessOnboardingStatus

- (HKMobilityWalkingSteadinessOnboardingStatus)initWithState:(int64_t)a3 unavailableReasons:(int64_t)a4 dateOnboarded:(id)a5 shouldOnboardingTileBeAdvertised:(BOOL)a6 isLocaleValidOnLocalDevice:(BOOL)a7 isClassificationAvailable:(BOOL)a8
{
  id v15 = a5;
  v20.receiver = self;
  v20.super_class = (Class)HKMobilityWalkingSteadinessOnboardingStatus;
  v16 = [(HKMobilityWalkingSteadinessOnboardingStatus *)&v20 init];
  v17 = v16;
  if (v16)
  {
    v16->_state = a3;
    v16->_onboardingUnavailableReasons = a4;
    objc_storeStrong((id *)&v16->_dateOnboarded, a5);
    v17->_shouldAdvertiseOnboarding = a6;
    v17->_isLocaleValidOnLocalDevice = a7;
    v17->_isClassificationAvailable = a8;
    v18 = v17;
  }

  return v17;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HKMobilityWalkingSteadinessOnboardingStatus *)a3;
  if (self == v4)
  {
    BOOL v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v6 = (unsigned __int8 *)v5;
      BOOL v7 = self->_state == v5->_state
        && self->_onboardingUnavailableReasons == v5->_onboardingUnavailableReasons
        && [(NSDate *)self->_dateOnboarded isEqual:v5->_dateOnboarded]
        && self->_shouldAdvertiseOnboarding == v6[8]
        && self->_isLocaleValidOnLocalDevice == v6[9]
        && self->_isClassificationAvailable == v6[10];
    }
    else
    {
      BOOL v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  int64_t v3 = self->_onboardingUnavailableReasons ^ self->_state;
  uint64_t v4 = v3 ^ [(NSDate *)self->_dateOnboarded hash];
  v5 = [NSNumber numberWithBool:self->_shouldAdvertiseOnboarding];
  uint64_t v6 = v4 ^ [v5 hash];
  BOOL v7 = [NSNumber numberWithBool:self->_isLocaleValidOnLocalDevice];
  uint64_t v8 = [v7 hash];
  v9 = [NSNumber numberWithBool:self->_isClassificationAvailable];
  unint64_t v10 = v6 ^ v8 ^ [v9 hash];

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t state = self->_state;
  id v5 = a3;
  [v5 encodeInteger:state forKey:@"State"];
  [v5 encodeInteger:self->_onboardingUnavailableReasons forKey:@"OnboardingUnavailableReasons"];
  [v5 encodeObject:self->_dateOnboarded forKey:@"DateOnboarded"];
  [v5 encodeBool:self->_shouldAdvertiseOnboarding forKey:@"ShouldAdvertiseOnboarding"];
  [v5 encodeBool:self->_isLocaleValidOnLocalDevice forKey:@"IsLocaleValidOnLocalDevice"];
  [v5 encodeBool:self->_isClassificationAvailable forKey:@"IsClassificationAvailableKey"];
}

- (HKMobilityWalkingSteadinessOnboardingStatus)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKMobilityWalkingSteadinessOnboardingStatus;
  id v5 = [(HKMobilityWalkingSteadinessOnboardingStatus *)&v9 init];
  if (v5)
  {
    v5->_int64_t state = [v4 decodeIntegerForKey:@"State"];
    v5->_onboardingUnavailableReasons = [v4 decodeIntegerForKey:@"OnboardingUnavailableReasons"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"DateOnboarded"];
    dateOnboarded = v5->_dateOnboarded;
    v5->_dateOnboarded = (NSDate *)v6;

    v5->_shouldAdvertiseOnboarding = [v4 decodeBoolForKey:@"ShouldAdvertiseOnboarding"];
    v5->_isLocaleValidOnLocalDevice = [v4 decodeBoolForKey:@"IsLocaleValidOnLocalDevice"];
    v5->_isClassificationAvailable = [v4 decodeBoolForKey:@"IsClassificationAvailableKey"];
  }

  return v5;
}

- (int64_t)state
{
  return self->_state;
}

- (int64_t)onboardingUnavailableReasons
{
  return self->_onboardingUnavailableReasons;
}

- (NSDate)dateOnboarded
{
  return self->_dateOnboarded;
}

- (BOOL)shouldAdvertiseOnboarding
{
  return self->_shouldAdvertiseOnboarding;
}

- (BOOL)isLocaleValidOnLocalDevice
{
  return self->_isLocaleValidOnLocalDevice;
}

- (BOOL)isClassificationAvailable
{
  return self->_isClassificationAvailable;
}

- (void).cxx_destruct
{
}

@end