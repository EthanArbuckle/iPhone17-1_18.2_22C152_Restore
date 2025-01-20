@interface HMDCompositeBoolSetting
- (BOOL)BOOLValue;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualValue:(id)a3;
- (HMDCompositeBoolSetting)initWithValue:(BOOL)a3 readVersion:(id)a4 writeVersion:(id)a5;
- (id)attributeDescriptions;
@end

@implementation HMDCompositeBoolSetting

- (BOOL)BOOLValue
{
  return self->_BOOLValue;
}

- (id)attributeDescriptions
{
  v11[1] = *MEMORY[0x1E4F143B8];
  v10.receiver = self;
  v10.super_class = (Class)HMDCompositeBoolSetting;
  v3 = [(HMDCompositeSetting *)&v10 attributeDescriptions];
  id v4 = objc_alloc(MEMORY[0x1E4F653F8]);
  [(HMDCompositeBoolSetting *)self BOOLValue];
  v5 = HMFBooleanToString();
  v6 = (void *)[v4 initWithName:@"value" value:v5];
  v11[0] = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  v8 = [v7 arrayByAddingObjectsFromArray:v3];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HMDCompositeBoolSetting *)a3;
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
    if (v6 && [(HMDCompositeBoolSetting *)v6 isEqualValue:self])
    {
      v10.receiver = self;
      v10.super_class = (Class)HMDCompositeBoolSetting;
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
  id v4 = (HMDCompositeBoolSetting *)a3;
  v5 = v4;
  if (v4 == self)
  {
    LOBYTE(v10) = 1;
  }
  else
  {
    if ([(HMDCompositeBoolSetting *)v4 conformsToProtocol:&unk_1F2E11670]) {
      v6 = v5;
    }
    else {
      v6 = 0;
    }
    v7 = v6;
    BOOL v8 = v7;
    if (v7)
    {
      BOOL v9 = [(HMDCompositeBoolSetting *)v7 BOOLValue];
      int v10 = v9 ^ [(HMDCompositeBoolSetting *)self BOOLValue] ^ 1;
    }
    else
    {
      LOBYTE(v10) = 0;
    }
  }
  return v10;
}

- (HMDCompositeBoolSetting)initWithValue:(BOOL)a3 readVersion:(id)a4 writeVersion:(id)a5
{
  v7.receiver = self;
  v7.super_class = (Class)HMDCompositeBoolSetting;
  result = [(HMDCompositeSetting *)&v7 initWithReadVersion:a4 writeVersion:a5];
  if (result) {
    result->_BOOLValue = a3;
  }
  return result;
}

@end