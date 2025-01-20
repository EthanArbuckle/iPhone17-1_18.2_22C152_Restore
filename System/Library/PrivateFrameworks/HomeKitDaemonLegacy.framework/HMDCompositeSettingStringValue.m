@interface HMDCompositeSettingStringValue
- (BOOL)isEqualValue:(id)a3;
- (HMDCompositeSettingStringValue)initWithValue:(id)a3;
- (NSString)stringValue;
- (id)attributeDescriptions;
@end

@implementation HMDCompositeSettingStringValue

- (void).cxx_destruct
{
}

- (NSString)stringValue
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (id)attributeDescriptions
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F653F8]);
  v4 = [(HMDCompositeSettingStringValue *)self stringValue];
  v5 = (void *)[v3 initWithName:@"value" value:v4];
  v8[0] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];

  return v6;
}

- (BOOL)isEqualValue:(id)a3
{
  v4 = (HMDCompositeSettingStringValue *)a3;
  v5 = v4;
  if (v4 == self)
  {
    char v10 = 1;
  }
  else
  {
    if ([(HMDCompositeSettingStringValue *)v4 conformsToProtocol:&unk_1F2E11718]) {
      v6 = v5;
    }
    else {
      v6 = 0;
    }
    v7 = v6;
    v8 = [(HMDCompositeSettingStringValue *)v7 stringValue];

    v9 = [(HMDCompositeSettingStringValue *)self stringValue];
    char v10 = [v8 isEqualToString:v9];
  }
  return v10;
}

- (HMDCompositeSettingStringValue)initWithValue:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDCompositeSettingStringValue;
  v5 = [(HMDCompositeSettingValue *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    stringValue = v5->_stringValue;
    v5->_stringValue = (NSString *)v6;
  }
  return v5;
}

@end