@interface HFNaturalLanguageOptions
- (HFNaturalLanguageOptions)init;
- (HMHome)home;
- (NSMutableDictionary)extraOptions;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation HFNaturalLanguageOptions

- (HFNaturalLanguageOptions)init
{
  v6.receiver = self;
  v6.super_class = (Class)HFNaturalLanguageOptions;
  v2 = [(HFNaturalLanguageOptions *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
    extraOptions = v2->_extraOptions;
    v2->_extraOptions = (NSMutableDictionary *)v3;
  }
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init((Class)objc_opt_class());
  v5 = [(HFNaturalLanguageOptions *)self home];
  [v4 setHome:v5];

  objc_super v6 = [(HFNaturalLanguageOptions *)self extraOptions];
  uint64_t v7 = [v6 mutableCopy];
  v8 = (void *)v4[2];
  v4[2] = v7;

  return v4;
}

- (HMHome)home
{
  return self->_home;
}

- (NSMutableDictionary)extraOptions
{
  return self->_extraOptions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extraOptions, 0);
  objc_storeStrong((id *)&self->_home, 0);
}

@end