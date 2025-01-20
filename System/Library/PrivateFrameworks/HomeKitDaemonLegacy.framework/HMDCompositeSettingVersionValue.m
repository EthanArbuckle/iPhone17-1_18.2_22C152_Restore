@interface HMDCompositeSettingVersionValue
- (HMDCompositeSettingVersionValue)initWithVersion:(id)a3 type:(int64_t)a4;
- (HMFVersion)version;
- (id)attributeDescriptions;
- (int64_t)type;
@end

@implementation HMDCompositeSettingVersionValue

- (void).cxx_destruct
{
}

- (int64_t)type
{
  return self->_type;
}

- (HMFVersion)version
{
  return (HMFVersion *)objc_getProperty(self, a2, 8, 1);
}

- (id)attributeDescriptions
{
  v11[2] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F653F8]);
  v4 = [(HMDCompositeSettingVersionValue *)self version];
  v5 = (void *)[v3 initWithName:@"version" value:v4];
  v11[0] = v5;
  id v6 = objc_alloc(MEMORY[0x1E4F653F8]);
  [(HMDCompositeSettingVersionValue *)self type];
  v7 = HMSettingVersionValueTypeAsString();
  v8 = (void *)[v6 initWithName:@"type" value:v7];
  v11[1] = v8;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];

  return v9;
}

- (HMDCompositeSettingVersionValue)initWithVersion:(id)a3 type:(int64_t)a4
{
  id v7 = a3;
  if (v7)
  {
    v8 = v7;
    v14.receiver = self;
    v14.super_class = (Class)HMDCompositeSettingVersionValue;
    v9 = [(HMDCompositeSettingValue *)&v14 init];
    v10 = v9;
    if (v9)
    {
      objc_storeStrong((id *)&v9->_version, a3);
      v10->_type = a4;
    }

    return v10;
  }
  else
  {
    v12 = (HMDCompositeSettingLanguageValue *)_HMFPreconditionFailure();
    [(HMDCompositeSettingLanguageValue *)v12 .cxx_destruct];
  }
  return result;
}

@end