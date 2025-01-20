@interface HFNetworkConfigurationItemProvider
- (id)_profileItemForProfile:(id)a3;
- (id)_supportedProfileClasses;
@end

@implementation HFNetworkConfigurationItemProvider

- (id)_supportedProfileClasses
{
  v2 = (void *)MEMORY[0x263EFFA08];
  uint64_t v3 = objc_opt_class();
  return (id)[v2 setWithObject:v3];
}

- (id)_profileItemForProfile:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [HFNetworkConfigurationItem alloc];
    v6 = [(HFAccessoryProfileItemProvider *)self home];
    v7 = objc_msgSend(v6, "hf_characteristicValueManager");
    v8 = [(HFAccessoryProfileItem *)v5 initWithProfile:v4 valueSource:v7];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

@end