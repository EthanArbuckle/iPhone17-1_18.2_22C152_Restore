@interface HMDCompositeSettingNumberValue
- (BOOL)isEqualValue:(id)a3;
- (HMDCompositeSettingNumberValue)initWithValue:(id)a3;
- (NSNumber)numberValue;
- (id)attributeDescriptions;
@end

@implementation HMDCompositeSettingNumberValue

- (void).cxx_destruct
{
}

- (NSNumber)numberValue
{
  return (NSNumber *)objc_getProperty(self, a2, 8, 1);
}

- (id)attributeDescriptions
{
  v8[1] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F424F8]);
  v4 = [(HMDCompositeSettingNumberValue *)self numberValue];
  v5 = (void *)[v3 initWithName:@"value" value:v4];
  v8[0] = v5;
  v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:1];

  return v6;
}

- (BOOL)isEqualValue:(id)a3
{
  v4 = (HMDCompositeSettingNumberValue *)a3;
  v5 = v4;
  if (v4 == self)
  {
    char v11 = 1;
  }
  else
  {
    if ([(HMDCompositeSettingNumberValue *)v4 conformsToProtocol:&unk_26E4D7BE8]) {
      v6 = v5;
    }
    else {
      v6 = 0;
    }
    v7 = v6;
    v8 = v7;
    if (v7)
    {
      v9 = [(HMDCompositeSettingNumberValue *)v7 numberValue];
      v10 = [(HMDCompositeSettingNumberValue *)self numberValue];
      char v11 = [v9 isEqual:v10];
    }
    else
    {
      char v11 = 0;
    }
  }
  return v11;
}

- (HMDCompositeSettingNumberValue)initWithValue:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDCompositeSettingNumberValue;
  v5 = [(HMDCompositeSettingValue *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    numberValue = v5->_numberValue;
    v5->_numberValue = (NSNumber *)v6;
  }
  return v5;
}

@end