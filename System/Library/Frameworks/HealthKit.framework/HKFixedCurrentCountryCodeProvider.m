@interface HKFixedCurrentCountryCodeProvider
- (HKFixedCurrentCountryCodeProvider)initWithCountryCode:(id)a3;
- (id)currentCountryCode;
@end

@implementation HKFixedCurrentCountryCodeProvider

- (HKFixedCurrentCountryCodeProvider)initWithCountryCode:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKFixedCurrentCountryCodeProvider;
  v5 = [(HKFixedCurrentCountryCodeProvider *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    countryCode = v5->_countryCode;
    v5->_countryCode = (NSString *)v6;
  }
  return v5;
}

- (id)currentCountryCode
{
  return self->_countryCode;
}

- (void).cxx_destruct
{
}

@end