@interface HMDCompositeSettingOperationResult
+ (id)frameWorkFetchResultsWithOperationResults:(id)a3;
- (HMDCompositeSetting)setting;
- (HMDCompositeSettingMetadata)metadata;
- (HMDCompositeSettingOperationResult)initWithKeyPath:(id)a3 setting:(id)a4 metadata:(id)a5 error:(id)a6;
- (NSError)error;
- (NSString)keyPath;
- (id)attributeDescriptions;
@end

@implementation HMDCompositeSettingOperationResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyPath, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_setting, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
}

- (NSString)keyPath
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 24, 1);
}

- (HMDCompositeSetting)setting
{
  return (HMDCompositeSetting *)objc_getProperty(self, a2, 16, 1);
}

- (HMDCompositeSettingMetadata)metadata
{
  return (HMDCompositeSettingMetadata *)objc_getProperty(self, a2, 8, 1);
}

- (id)attributeDescriptions
{
  v17[4] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F653F8]);
  v4 = [(HMDCompositeSettingOperationResult *)self keyPath];
  v5 = (void *)[v3 initWithName:@"keyPath" value:v4];
  v17[0] = v5;
  id v6 = objc_alloc(MEMORY[0x1E4F653F8]);
  v7 = [(HMDCompositeSettingOperationResult *)self setting];
  v8 = (void *)[v6 initWithName:@"setting" value:v7];
  v17[1] = v8;
  id v9 = objc_alloc(MEMORY[0x1E4F653F8]);
  v10 = [(HMDCompositeSettingOperationResult *)self error];
  v11 = (void *)[v9 initWithName:@"error" value:v10];
  v17[2] = v11;
  id v12 = objc_alloc(MEMORY[0x1E4F653F8]);
  v13 = [(HMDCompositeSettingOperationResult *)self metadata];
  v14 = (void *)[v12 initWithName:@"metadata" value:v13];
  v17[3] = v14;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:4];

  return v15;
}

- (HMDCompositeSettingOperationResult)initWithKeyPath:(id)a3 setting:(id)a4 metadata:(id)a5 error:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)HMDCompositeSettingOperationResult;
  v15 = [(HMDCompositeSettingOperationResult *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_error, a6);
    objc_storeStrong((id *)&v16->_setting, a4);
    objc_storeStrong((id *)&v16->_metadata, a5);
    objc_storeStrong((id *)&v16->_keyPath, a3);
  }

  return v16;
}

+ (id)frameWorkFetchResultsWithOperationResults:(id)a3
{
  return (id)objc_msgSend(a3, "na_map:", &__block_literal_global_240);
}

id __80__HMDCompositeSettingOperationResult_frameWorkFetchResultsWithOperationResults___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = +[HMDCompositeSettingsControllerManager immutableSettingFromFetchReturn:v2];
  id v4 = objc_alloc(MEMORY[0x1E4F2E5F0]);
  v5 = v4;
  if (v3)
  {
    id v6 = (void *)[v4 initWithSetting:v3];
  }
  else
  {
    v7 = [v2 keyPath];
    id v6 = (void *)[v5 initWithKeyPath:v7 failureType:1];
  }
  return v6;
}

@end