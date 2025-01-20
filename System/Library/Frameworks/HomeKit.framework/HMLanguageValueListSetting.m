@interface HMLanguageValueListSetting
- (BOOL)isEqual:(id)a3;
- (HMLanguageValueListSetting)initWithKeyPath:(id)a3 readOnly:(BOOL)a4 languageValues:(id)a5;
- (HMLanguageValueListSetting)initWithKeyPath:(id)a3 readOnly:(BOOL)a4 payload:(id)a5;
- (HMLanguageValueListSetting)initWithProtoPayload:(id)a3;
- (NSArray)languageValues;
- (id)attributeDescriptions;
- (id)payloadCopy;
- (id)protoPayload;
- (unint64_t)hash;
@end

@implementation HMLanguageValueListSetting

- (void).cxx_destruct
{
}

- (NSArray)languageValues
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HMLanguageValueListSetting *)a3;
  if (self == v4)
  {
    char v11 = 1;
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
    if (v6
      && (v15.receiver = self,
          v15.super_class = (Class)HMLanguageValueListSetting,
          [(HMImmutableSetting *)&v15 isEqual:v6]))
    {
      v7 = [(HMLanguageValueListSetting *)self languageValues];
      uint64_t v8 = [v7 count];
      v9 = [(HMLanguageValueListSetting *)v6 languageValues];
      if (v8 == [v9 count])
      {
        v10 = [(HMLanguageValueListSetting *)self languageValues];
        v13[0] = MEMORY[0x1E4F143A8];
        v13[1] = 3221225472;
        v13[2] = __38__HMLanguageValueListSetting_isEqual___block_invoke;
        v13[3] = &unk_1E593EE50;
        v14 = v6;
        char v11 = objc_msgSend(v10, "na_allObjectsPassTest:", v13);
      }
      else
      {
        char v11 = 0;
      }
    }
    else
    {
      char v11 = 0;
    }
  }
  return v11;
}

uint64_t __38__HMLanguageValueListSetting_isEqual___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  v4 = [v2 languageValues];
  uint64_t v5 = [v4 containsObject:v3];

  return v5;
}

- (unint64_t)hash
{
  id v3 = [(HMLanguageValueListSetting *)self languageValues];
  uint64_t v4 = [v3 hash];
  v7.receiver = self;
  v7.super_class = (Class)HMLanguageValueListSetting;
  unint64_t v5 = [(HMImmutableSetting *)&v7 hash] ^ v4;

  return v5;
}

- (id)attributeDescriptions
{
  v11[1] = *MEMORY[0x1E4F143B8];
  v10.receiver = self;
  v10.super_class = (Class)HMLanguageValueListSetting;
  id v3 = [(HMImmutableSetting *)&v10 attributeDescriptions];
  id v4 = objc_alloc(MEMORY[0x1E4F653F8]);
  unint64_t v5 = [(HMLanguageValueListSetting *)self languageValues];
  v6 = (void *)[v4 initWithName:@"languageValues" value:v5];
  v11[0] = v6;
  objc_super v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  uint64_t v8 = [v3 arrayByAddingObjectsFromArray:v7];

  return v8;
}

- (HMLanguageValueListSetting)initWithKeyPath:(id)a3 readOnly:(BOOL)a4 payload:(id)a5
{
  BOOL v6 = a4;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  objc_super v10 = objc_msgSend(v9, "hmf_arrayForKey:", @"HMImmutableSettingValuePayloadKey");
  char v11 = v10;
  if (v10)
  {
    v12 = objc_msgSend(v10, "na_map:", &__block_literal_global_16);
    uint64_t v13 = [v11 count];
    if (v13 == [v12 count])
    {
      v14 = [(HMLanguageValueListSetting *)self initWithKeyPath:v8 readOnly:v6 languageValues:v12];
      objc_super v15 = v14;
    }
    else
    {
      v19 = (void *)MEMORY[0x19F3A64A0]();
      v14 = self;
      v20 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v21 = HMFGetLogIdentifier();
        int v23 = 138543618;
        v24 = v21;
        __int16 v25 = 2112;
        id v26 = v11;
        _os_log_impl(&dword_19D1A8000, v20, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode language value list setting due to invalid language value payloads: %@", (uint8_t *)&v23, 0x16u);
      }
      objc_super v15 = 0;
    }
  }
  else
  {
    v16 = (void *)MEMORY[0x19F3A64A0]();
    v14 = self;
    v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v18 = HMFGetLogIdentifier();
      int v23 = 138543618;
      v24 = v18;
      __int16 v25 = 2112;
      id v26 = v9;
      _os_log_impl(&dword_19D1A8000, v17, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode language value list setting due to no language values in payload: %@", (uint8_t *)&v23, 0x16u);
    }
    objc_super v15 = 0;
  }

  return v15;
}

id __63__HMLanguageValueListSetting_initWithKeyPath_readOnly_payload___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [[HMSettingLanguageValue alloc] initWithPayload:v2];

  id v4 = +[HMFObjectCacheHMSettingLanguageValue cachedInstanceForLanguageSettingValue:v3];

  return v4;
}

- (id)payloadCopy
{
  v12[2] = *MEMORY[0x1E4F143B8];
  id v3 = [(HMLanguageValueListSetting *)self languageValues];
  id v4 = objc_msgSend(v3, "na_map:", &__block_literal_global_9_9395);

  v10.receiver = self;
  v10.super_class = (Class)HMLanguageValueListSetting;
  unint64_t v5 = [(HMImmutableSetting *)&v10 payloadCopy];
  BOOL v6 = (void *)[v5 mutableCopy];

  v11[0] = @"HMImmutableSettingTypePayloadKey";
  v11[1] = @"HMImmutableSettingValuePayloadKey";
  v12[0] = &unk_1EEF07BA8;
  v12[1] = v4;
  objc_super v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
  [v6 addEntriesFromDictionary:v7];

  id v8 = (void *)[v6 copy];

  return v8;
}

uint64_t __41__HMLanguageValueListSetting_payloadCopy__block_invoke(uint64_t a1, void *a2)
{
  return [a2 payloadCopy];
}

- (id)protoPayload
{
  v10.receiver = self;
  v10.super_class = (Class)HMLanguageValueListSetting;
  id v3 = [(HMImmutableSetting *)&v10 protoPayload];
  id v4 = [(HMLanguageValueListSetting *)self languageValues];
  unint64_t v5 = objc_msgSend(v4, "na_map:", &__block_literal_global_9402);

  BOOL v6 = objc_alloc_init(HMImmutableSettingsProtoAvailableLanguageListEvent);
  [v3 setAvailableLanguages:v6];

  objc_super v7 = (void *)[v5 mutableCopy];
  id v8 = [v3 availableLanguages];
  [v8 setLanguages:v7];

  return v3;
}

HMImmutableSettingsProtoLanguageValueEvent *__42__HMLanguageValueListSetting_protoPayload__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = objc_alloc_init(HMImmutableSettingsProtoLanguageValueEvent);
  id v4 = [v2 inputLanguageCode];
  [(HMImmutableSettingsProtoLanguageValueEvent *)v3 setInputLanguageCode:v4];

  unint64_t v5 = [v2 outputVoiceLanguageCode];
  [(HMImmutableSettingsProtoLanguageValueEvent *)v3 setOutputVoiceLanguageCode:v5];

  BOOL v6 = [v2 outputVoiceGenderCode];
  [(HMImmutableSettingsProtoLanguageValueEvent *)v3 setOutputVoiceGenderCode:v6];

  objc_super v7 = [v2 voiceName];

  [(HMImmutableSettingsProtoLanguageValueEvent *)v3 setVoiceName:v7];

  return v3;
}

- (HMLanguageValueListSetting)initWithProtoPayload:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (([v4 hasKeyPath] & 1) == 0)
  {
    v14 = (void *)MEMORY[0x19F3A64A0]();
    v12 = self;
    objc_super v15 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      goto LABEL_13;
    }
    v16 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    id v26 = v16;
    __int16 v27 = 2112;
    id v28 = v4;
    v17 = "%{public}@Failed to decode setting missing keyPath: %@";
LABEL_12:
    _os_log_impl(&dword_19D1A8000, v15, OS_LOG_TYPE_ERROR, v17, buf, 0x16u);

    goto LABEL_13;
  }
  if (([v4 hasReadOnly] & 1) == 0)
  {
    v14 = (void *)MEMORY[0x19F3A64A0]();
    v12 = self;
    objc_super v15 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      goto LABEL_13;
    }
    v16 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    id v26 = v16;
    __int16 v27 = 2112;
    id v28 = v4;
    v17 = "%{public}@Failed to decode setting missing readOnly: %@";
    goto LABEL_12;
  }
  if (![v4 hasAvailableLanguages]
    || ([v4 availableLanguages], unint64_t v5 = objc_claimAutoreleasedReturnValue(), v5, !v5))
  {
    v14 = (void *)MEMORY[0x19F3A64A0]();
    v12 = self;
    objc_super v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v26 = v16;
      __int16 v27 = 2112;
      id v28 = v4;
      v17 = "%{public}@Failed to decode setting missing available languages: %@";
      goto LABEL_12;
    }
LABEL_13:

    uint64_t v13 = 0;
    goto LABEL_14;
  }
  BOOL v6 = [v4 availableLanguages];
  objc_super v7 = [v6 languages];

  uint64_t v19 = MEMORY[0x1E4F143A8];
  uint64_t v20 = 3221225472;
  v21 = __51__HMLanguageValueListSetting_initWithProtoPayload___block_invoke;
  v22 = &unk_1E593EDC8;
  id v8 = self;
  int v23 = v8;
  id v9 = v4;
  id v24 = v9;
  objc_super v10 = objc_msgSend(v7, "na_map:", &v19);
  char v11 = objc_msgSend(v9, "keyPath", v19, v20, v21, v22);
  v12 = -[HMLanguageValueListSetting initWithKeyPath:readOnly:languageValues:](v8, "initWithKeyPath:readOnly:languageValues:", v11, [v9 readOnly], v10);

  uint64_t v13 = v12;
LABEL_14:

  return v13;
}

id __51__HMLanguageValueListSetting_initWithProtoPayload___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([v3 hasInputLanguageCode]
    && [v3 hasOutputVoiceLanguageCode]
    && ([v3 hasOutputVoiceGenderCode] & 1) != 0)
  {
    id v4 = [HMSettingLanguageValue alloc];
    unint64_t v5 = [v3 inputLanguageCode];
    BOOL v6 = [v3 outputVoiceLanguageCode];
    objc_super v7 = [v3 outputVoiceGenderCode];
    id v8 = [v3 voiceName];
    id v9 = [(HMSettingLanguageValue *)v4 initWithInputLanguageCode:v5 outputVoiceLanguageCode:v6 outputVoiceGenderCode:v7 voiceName:v8];
    objc_super v10 = +[HMFObjectCacheHMSettingLanguageValue cachedInstanceForLanguageSettingValue:v9];
  }
  else
  {
    char v11 = (void *)MEMORY[0x19F3A64A0]();
    id v12 = *(id *)(a1 + 32);
    uint64_t v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = HMFGetLogIdentifier();
      uint64_t v15 = *(void *)(a1 + 40);
      int v17 = 138543618;
      v18 = v14;
      __int16 v19 = 2112;
      uint64_t v20 = v15;
      _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_ERROR, "%{public}@Language value is missing required attributes: %@", (uint8_t *)&v17, 0x16u);
    }
    objc_super v10 = 0;
  }

  return v10;
}

- (HMLanguageValueListSetting)initWithKeyPath:(id)a3 readOnly:(BOOL)a4 languageValues:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  v13.receiver = self;
  v13.super_class = (Class)HMLanguageValueListSetting;
  id v9 = [(HMImmutableSetting *)&v13 initWithKeyPath:a3 readOnly:v5];
  if (v9)
  {
    uint64_t v10 = [v8 copy];
    languageValues = v9->_languageValues;
    v9->_languageValues = (NSArray *)v10;
  }
  return v9;
}

@end