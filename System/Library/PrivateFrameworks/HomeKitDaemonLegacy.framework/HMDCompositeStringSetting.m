@interface HMDCompositeStringSetting
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualValue:(id)a3;
- (HMDCompositeStringSetting)initWithValue:(id)a3 readVersion:(id)a4 writeVersion:(id)a5;
- (NSString)stringValue;
- (id)attributeDescriptions;
@end

@implementation HMDCompositeStringSetting

- (void).cxx_destruct
{
}

- (NSString)stringValue
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (id)attributeDescriptions
{
  v11[1] = *MEMORY[0x1E4F143B8];
  v10.receiver = self;
  v10.super_class = (Class)HMDCompositeStringSetting;
  v3 = [(HMDCompositeSetting *)&v10 attributeDescriptions];
  id v4 = objc_alloc(MEMORY[0x1E4F653F8]);
  v5 = [(HMDCompositeStringSetting *)self stringValue];
  v6 = (void *)[v4 initWithName:@"value" value:v5];
  v11[0] = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  v8 = [v7 arrayByAddingObjectsFromArray:v3];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HMDCompositeStringSetting *)a3;
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
    if (v6 && [(HMDCompositeStringSetting *)v6 isEqualValue:self])
    {
      v10.receiver = self;
      v10.super_class = (Class)HMDCompositeStringSetting;
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
  id v4 = (HMDCompositeStringSetting *)a3;
  v5 = v4;
  if (v4 == self)
  {
    char v10 = 1;
  }
  else
  {
    if ([(HMDCompositeStringSetting *)v4 conformsToProtocol:&unk_1F2E11718]) {
      v6 = v5;
    }
    else {
      v6 = 0;
    }
    v7 = v6;
    BOOL v8 = [(HMDCompositeStringSetting *)v7 stringValue];

    v9 = [(HMDCompositeStringSetting *)self stringValue];
    char v10 = [v8 isEqualToString:v9];
  }
  return v10;
}

- (HMDCompositeStringSetting)initWithValue:(id)a3 readVersion:(id)a4 writeVersion:(id)a5
{
  id v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HMDCompositeStringSetting;
  v9 = [(HMDCompositeSetting *)&v13 initWithReadVersion:a4 writeVersion:a5];
  if (v9)
  {
    uint64_t v10 = [v8 copy];
    stringValue = v9->_stringValue;
    v9->_stringValue = (NSString *)v10;
  }
  return v9;
}

@end