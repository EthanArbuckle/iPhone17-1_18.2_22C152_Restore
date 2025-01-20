@interface HMAccessorySettingFetchResult
+ (id)fetchResultsWithKeyPaths:(id)a3 failureType:(int64_t)a4;
+ (id)shortDescription;
- (HMAccessorySettingFetchResult)initWithKeyPath:(id)a3 failureType:(int64_t)a4;
- (HMAccessorySettingFetchResult)initWithKeyPath:(id)a3 setting:(id)a4 failureType:(int64_t)a5;
- (HMAccessorySettingFetchResult)initWithSetting:(id)a3;
- (HMImmutableSetting)setting;
- (NSArray)attributeDescriptions;
- (NSError)error;
- (NSString)description;
- (NSString)keyPath;
- (NSString)shortDescription;
- (int64_t)failureType;
@end

@implementation HMAccessorySettingFetchResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_setting, 0);

  objc_storeStrong((id *)&self->_keyPath, 0);
}

- (int64_t)failureType
{
  return self->_failureType;
}

- (HMImmutableSetting)setting
{
  return (HMImmutableSetting *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)keyPath
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)description
{
  return (NSString *)MEMORY[0x1F411CB90](self, a2);
}

- (NSArray)attributeDescriptions
{
  v14[3] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F653F8]);
  v4 = [(HMAccessorySettingFetchResult *)self keyPath];
  v5 = (void *)[v3 initWithName:@"keyPath" value:v4];
  id v6 = objc_alloc(MEMORY[0x1E4F653F8]);
  v7 = [(HMAccessorySettingFetchResult *)self setting];
  v8 = (void *)[v6 initWithName:@"setting" value:v7];
  v14[1] = v8;
  id v9 = objc_alloc(MEMORY[0x1E4F653F8]);
  v10 = HMAccessorySettingsPartialFetchFailureTypeToString([(HMAccessorySettingFetchResult *)self failureType]);
  v11 = (void *)[v9 initWithName:@"failureType" value:v10];
  v14[2] = v11;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:3];

  return (NSArray *)v12;
}

- (NSString)shortDescription
{
  v2 = objc_opt_class();

  return (NSString *)[v2 shortDescription];
}

- (NSError)error
{
  id v3 = [(HMAccessorySettingFetchResult *)self setting];

  if (v3)
  {
    v4 = 0;
  }
  else
  {
    unint64_t v5 = [(HMAccessorySettingFetchResult *)self failureType];
    if (v5 > 3) {
      uint64_t v6 = 15;
    }
    else {
      uint64_t v6 = qword_19D47B9D0[v5];
    }
    v4 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:v6];
  }

  return (NSError *)v4;
}

- (HMAccessorySettingFetchResult)initWithKeyPath:(id)a3 setting:(id)a4 failureType:(int64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  if (v9)
  {
    v11 = v10;
    v19.receiver = self;
    v19.super_class = (Class)HMAccessorySettingFetchResult;
    v12 = [(HMAccessorySettingFetchResult *)&v19 init];
    v13 = v12;
    if (v12)
    {
      objc_storeStrong((id *)&v12->_keyPath, a3);
      objc_storeStrong((id *)&v13->_setting, a4);
      v13->_failureType = a5;
    }

    return v13;
  }
  else
  {
    v15 = (HMAccessorySettingFetchResult *)_HMFPreconditionFailure();
    return [(HMAccessorySettingFetchResult *)v15 initWithKeyPath:v17 failureType:v18];
  }
}

- (HMAccessorySettingFetchResult)initWithKeyPath:(id)a3 failureType:(int64_t)a4
{
  return [(HMAccessorySettingFetchResult *)self initWithKeyPath:a3 setting:0 failureType:a4];
}

- (HMAccessorySettingFetchResult)initWithSetting:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    unint64_t v5 = v4;
    uint64_t v6 = [v4 keyPath];
    v7 = [(HMAccessorySettingFetchResult *)self initWithKeyPath:v6 setting:v5 failureType:0];

    return v7;
  }
  else
  {
    id v9 = (void *)_HMFPreconditionFailure();
    return (HMAccessorySettingFetchResult *)+[HMAccessorySettingFetchResult shortDescription];
  }
}

+ (id)shortDescription
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

+ (id)fetchResultsWithKeyPaths:(id)a3 failureType:(int64_t)a4
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __70__HMAccessorySettingFetchResult_fetchResultsWithKeyPaths_failureType___block_invoke;
  v6[3] = &__block_descriptor_40_e49___HMAccessorySettingFetchResult_16__0__NSString_8l;
  v6[4] = a4;
  id v4 = objc_msgSend(a3, "na_map:", v6);

  return v4;
}

HMAccessorySettingFetchResult *__70__HMAccessorySettingFetchResult_fetchResultsWithKeyPaths_failureType___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [[HMAccessorySettingFetchResult alloc] initWithKeyPath:v3 failureType:*(void *)(a1 + 32)];

  return v4;
}

@end