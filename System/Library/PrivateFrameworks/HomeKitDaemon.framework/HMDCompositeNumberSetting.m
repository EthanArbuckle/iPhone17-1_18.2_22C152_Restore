@interface HMDCompositeNumberSetting
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualValue:(id)a3;
- (HMDCompositeNumberSetting)initWithValue:(id)a3 readVersion:(id)a4 writeVersion:(id)a5;
- (NSNumber)numberValue;
- (id)attributeDescriptions;
@end

@implementation HMDCompositeNumberSetting

- (void).cxx_destruct
{
}

- (NSNumber)numberValue
{
  return (NSNumber *)objc_getProperty(self, a2, 24, 1);
}

- (id)attributeDescriptions
{
  v11[1] = *MEMORY[0x263EF8340];
  v10.receiver = self;
  v10.super_class = (Class)HMDCompositeNumberSetting;
  v3 = [(HMDCompositeSetting *)&v10 attributeDescriptions];
  id v4 = objc_alloc(MEMORY[0x263F424F8]);
  v5 = [(HMDCompositeNumberSetting *)self numberValue];
  v6 = (void *)[v4 initWithName:@"value" value:v5];
  v11[0] = v6;
  v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:1];
  v8 = [v7 arrayByAddingObjectsFromArray:v3];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HMDCompositeNumberSetting *)a3;
  if (v4 == self)
  {
    BOOL v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v5 = v4;
    }
    else {
      v5 = 0;
    }
    v6 = v5;
    v7 = v6;
    if (v6 && [(HMDCompositeNumberSetting *)v6 isEqualValue:self])
    {
      v10.receiver = self;
      v10.super_class = (Class)HMDCompositeNumberSetting;
      BOOL v8 = [(HMDCompositeSetting *)&v10 isEqual:v7];
    }
    else
    {
      BOOL v8 = 0;
    }
  }
  return v8;
}

- (BOOL)isEqualValue:(id)a3
{
  id v4 = (HMDCompositeNumberSetting *)a3;
  v5 = v4;
  if (v4 == self)
  {
    char v11 = 1;
  }
  else
  {
    if ([(HMDCompositeNumberSetting *)v4 conformsToProtocol:&unk_26E4D7BE8]) {
      v6 = v5;
    }
    else {
      v6 = 0;
    }
    v7 = v6;
    BOOL v8 = v7;
    if (v7)
    {
      v9 = [(HMDCompositeNumberSetting *)v7 numberValue];
      objc_super v10 = [(HMDCompositeNumberSetting *)self numberValue];
      char v11 = [v9 isEqual:v10];
    }
    else
    {
      char v11 = 0;
    }
  }
  return v11;
}

- (HMDCompositeNumberSetting)initWithValue:(id)a3 readVersion:(id)a4 writeVersion:(id)a5
{
  id v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HMDCompositeNumberSetting;
  v9 = [(HMDCompositeSetting *)&v13 initWithReadVersion:a4 writeVersion:a5];
  if (v9)
  {
    uint64_t v10 = [v8 copy];
    numberValue = v9->_numberValue;
    v9->_numberValue = (NSNumber *)v10;
  }
  return v9;
}

@end