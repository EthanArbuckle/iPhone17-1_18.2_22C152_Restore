@interface HDRegionAvailabilityProvider
+ (id)anyCountryAvailability;
+ (id)uncheckedAvailability;
- (id)onboardingEligibilityForCountryCode:(id)a3;
- (id)regionAvailability;
- (id)regionAvailabilityForDevice:(id)a3;
- (void)_initWithRegionAvailability:(void *)a1;
@end

@implementation HDRegionAvailabilityProvider

+ (id)uncheckedAvailability
{
  v2 = [HDRegionAvailabilityProvider alloc];
  v3 = [MEMORY[0x1E4F2B410] uncheckedAvailability];
  v4 = -[HDRegionAvailabilityProvider _initWithRegionAvailability:](v2, v3);

  return v4;
}

- (void)_initWithRegionAvailability:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    v7.receiver = a1;
    v7.super_class = (Class)HDRegionAvailabilityProvider;
    a1 = objc_msgSendSuper2(&v7, sel_init);
    if (a1)
    {
      uint64_t v4 = [v3 copy];
      v5 = (void *)a1[1];
      a1[1] = v4;
    }
  }

  return a1;
}

+ (id)anyCountryAvailability
{
  v2 = [HDRegionAvailabilityProvider alloc];
  id v3 = [MEMORY[0x1E4F2B410] anyCountryAvailability];
  uint64_t v4 = -[HDRegionAvailabilityProvider _initWithRegionAvailability:](v2, v3);

  return v4;
}

- (id)onboardingEligibilityForCountryCode:(id)a3
{
  return (id)[(HKRegionAvailability *)self->_regionAvailability onboardingEligibilityForCountryCode:a3];
}

- (id)regionAvailability
{
  return self->_regionAvailability;
}

- (id)regionAvailabilityForDevice:(id)a3
{
  return self->_regionAvailability;
}

- (void).cxx_destruct
{
}

@end