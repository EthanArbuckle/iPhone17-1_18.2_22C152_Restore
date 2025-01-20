@interface HMDCompositeSettingBoolValue
- (BOOL)BOOLValue;
- (BOOL)isEqualValue:(id)a3;
- (HMDCompositeSettingBoolValue)initWithValue:(BOOL)a3;
- (id)attributeDescriptions;
@end

@implementation HMDCompositeSettingBoolValue

- (BOOL)BOOLValue
{
  return self->_BOOLValue;
}

- (id)attributeDescriptions
{
  v8[1] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F424F8]);
  [(HMDCompositeSettingBoolValue *)self BOOLValue];
  v4 = HMFBooleanToString();
  v5 = (void *)[v3 initWithName:@"value" value:v4];
  v8[0] = v5;
  v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:1];

  return v6;
}

- (BOOL)isEqualValue:(id)a3
{
  v4 = (HMDCompositeSettingBoolValue *)a3;
  v5 = v4;
  if (v4 == self)
  {
    LOBYTE(v10) = 1;
  }
  else
  {
    if ([(HMDCompositeSettingBoolValue *)v4 conformsToProtocol:&unk_26E4D79D0]) {
      v6 = v5;
    }
    else {
      v6 = 0;
    }
    v7 = v6;
    v8 = v7;
    if (v7)
    {
      BOOL v9 = [(HMDCompositeSettingBoolValue *)v7 BOOLValue];
      int v10 = v9 ^ [(HMDCompositeSettingBoolValue *)self BOOLValue] ^ 1;
    }
    else
    {
      LOBYTE(v10) = 0;
    }
  }
  return v10;
}

- (HMDCompositeSettingBoolValue)initWithValue:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HMDCompositeSettingBoolValue;
  result = [(HMDCompositeSettingValue *)&v5 init];
  if (result) {
    result->_BOOLValue = a3;
  }
  return result;
}

@end