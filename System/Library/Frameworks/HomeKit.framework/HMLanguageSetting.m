@interface HMLanguageSetting
- (BOOL)isEqual:(id)a3;
- (HMLanguageSetting)initWithKeyPath:(id)a3 readOnly:(BOOL)a4 languageValue:(id)a5;
- (HMLanguageSetting)initWithKeyPath:(id)a3 readOnly:(BOOL)a4 payload:(id)a5;
- (HMLanguageSetting)initWithProtoPayload:(id)a3;
- (HMLanguageSetting)settingWithSettingValue:(id)a3;
- (HMSettingLanguageValue)languageValue;
- (id)attributeDescriptions;
- (id)payloadCopy;
- (id)protoPayload;
- (unint64_t)hash;
@end

@implementation HMLanguageSetting

- (void).cxx_destruct
{
}

- (HMSettingLanguageValue)languageValue
{
  return (HMSettingLanguageValue *)objc_getProperty(self, a2, 24, 1);
}

- (unint64_t)hash
{
  v3 = [(HMLanguageSetting *)self languageValue];
  uint64_t v4 = [v3 hash];
  v7.receiver = self;
  v7.super_class = (Class)HMLanguageSetting;
  unint64_t v5 = [(HMImmutableSetting *)&v7 hash] ^ v4;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (HMLanguageSetting *)a3;
  if (self == v4)
  {
    char v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      unint64_t v5 = v4;
    }
    else {
      unint64_t v5 = 0;
    }
    v6 = v5;
    if (v6
      && (v11.receiver = self,
          v11.super_class = (Class)HMLanguageSetting,
          [(HMImmutableSetting *)&v11 isEqual:v6]))
    {
      objc_super v7 = [(HMLanguageSetting *)self languageValue];
      v8 = [(HMLanguageSetting *)v6 languageValue];
      char v9 = [v7 isEqual:v8];
    }
    else
    {
      char v9 = 0;
    }
  }
  return v9;
}

- (id)attributeDescriptions
{
  v11[1] = *MEMORY[0x1E4F143B8];
  v10.receiver = self;
  v10.super_class = (Class)HMLanguageSetting;
  v3 = [(HMImmutableSetting *)&v10 attributeDescriptions];
  id v4 = objc_alloc(MEMORY[0x1E4F653F8]);
  unint64_t v5 = [(HMLanguageSetting *)self languageValue];
  v6 = (void *)[v4 initWithName:@"languageValue" value:v5];
  v11[0] = v6;
  objc_super v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  v8 = [v3 arrayByAddingObjectsFromArray:v7];

  return v8;
}

- (HMLanguageSetting)initWithKeyPath:(id)a3 readOnly:(BOOL)a4 payload:(id)a5
{
  BOOL v6 = a4;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  objc_super v10 = objc_msgSend(v9, "hmf_dictionaryForKey:", @"HMImmutableSettingValuePayloadKey");
  if (v10)
  {
    objc_super v11 = [[HMSettingLanguageValue alloc] initWithPayload:v10];
    v12 = +[HMFObjectCacheHMSettingLanguageValue cachedInstanceForLanguageSettingValue:v11];

    if (v12)
    {
      v13 = [(HMLanguageSetting *)self initWithKeyPath:v8 readOnly:v6 languageValue:v12];
      v14 = v13;
    }
    else
    {
      v18 = (void *)MEMORY[0x19F3A64A0]();
      v13 = self;
      v19 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        v20 = HMFGetLogIdentifier();
        int v22 = 138543618;
        v23 = v20;
        __int16 v24 = 2112;
        id v25 = v10;
        _os_log_impl(&dword_19D1A8000, v19, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode language value setting due to invalid language value payload: %@", (uint8_t *)&v22, 0x16u);
      }
      v14 = 0;
    }
  }
  else
  {
    v15 = (void *)MEMORY[0x19F3A64A0]();
    v13 = self;
    v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = HMFGetLogIdentifier();
      int v22 = 138543618;
      v23 = v17;
      __int16 v24 = 2112;
      id v25 = v9;
      _os_log_impl(&dword_19D1A8000, v16, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode language value setting due to no language value in payload: %@", (uint8_t *)&v22, 0x16u);
    }
    v14 = 0;
  }

  return v14;
}

- (id)payloadCopy
{
  v12[2] = *MEMORY[0x1E4F143B8];
  v10.receiver = self;
  v10.super_class = (Class)HMLanguageSetting;
  v3 = [(HMImmutableSetting *)&v10 payloadCopy];
  id v4 = (void *)[v3 mutableCopy];

  v11[0] = @"HMImmutableSettingTypePayloadKey";
  v11[1] = @"HMImmutableSettingValuePayloadKey";
  v12[0] = &unk_1EEF07FE0;
  unint64_t v5 = [(HMLanguageSetting *)self languageValue];
  BOOL v6 = [v5 payloadCopy];
  v12[1] = v6;
  objc_super v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
  [v4 addEntriesFromDictionary:v7];

  id v8 = (void *)[v4 copy];

  return v8;
}

- (id)protoPayload
{
  v24.receiver = self;
  v24.super_class = (Class)HMLanguageSetting;
  v3 = [(HMImmutableSetting *)&v24 protoPayload];
  id v4 = objc_alloc_init(HMImmutableSettingsProtoLanguageSettingEvent);
  [v3 setLanguageSetting:v4];

  unint64_t v5 = objc_alloc_init(HMImmutableSettingsProtoLanguageValueEvent);
  BOOL v6 = [v3 languageSetting];
  [v6 setValue:v5];

  objc_super v7 = [(HMLanguageSetting *)self languageValue];
  id v8 = [v7 inputLanguageCode];
  id v9 = [v3 languageSetting];
  objc_super v10 = [v9 value];
  [v10 setInputLanguageCode:v8];

  objc_super v11 = [(HMLanguageSetting *)self languageValue];
  v12 = [v11 outputVoiceLanguageCode];
  v13 = [v3 languageSetting];
  v14 = [v13 value];
  [v14 setOutputVoiceLanguageCode:v12];

  v15 = [(HMLanguageSetting *)self languageValue];
  v16 = [v15 outputVoiceGenderCode];
  v17 = [v3 languageSetting];
  v18 = [v17 value];
  [v18 setOutputVoiceGenderCode:v16];

  v19 = [(HMLanguageSetting *)self languageValue];
  v20 = [v19 voiceName];
  v21 = [v3 languageSetting];
  int v22 = [v21 value];
  [v22 setVoiceName:v20];

  return v3;
}

- (HMLanguageSetting)initWithProtoPayload:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (([v4 hasKeyPath] & 1) == 0)
  {
    v21 = (void *)MEMORY[0x19F3A64A0]();
    v19 = self;
    int v22 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      goto LABEL_16;
    }
    v23 = HMFGetLogIdentifier();
    int v29 = 138543618;
    v30 = v23;
    __int16 v31 = 2112;
    id v32 = v4;
    objc_super v24 = "%{public}@Failed to decode setting missing keyPath: %@";
LABEL_15:
    _os_log_impl(&dword_19D1A8000, v22, OS_LOG_TYPE_ERROR, v24, (uint8_t *)&v29, 0x16u);

    goto LABEL_16;
  }
  if (([v4 hasReadOnly] & 1) == 0)
  {
    v21 = (void *)MEMORY[0x19F3A64A0]();
    v19 = self;
    int v22 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      goto LABEL_16;
    }
    v23 = HMFGetLogIdentifier();
    int v29 = 138543618;
    v30 = v23;
    __int16 v31 = 2112;
    id v32 = v4;
    objc_super v24 = "%{public}@Failed to decode setting missing readOnly: %@";
    goto LABEL_15;
  }
  uint64_t v5 = [v4 languageSetting];
  if (!v5
    || (BOOL v6 = (void *)v5,
        [v4 languageSetting],
        objc_super v7 = objc_claimAutoreleasedReturnValue(),
        char v8 = [v7 hasValue],
        v7,
        v6,
        (v8 & 1) == 0))
  {
    v21 = (void *)MEMORY[0x19F3A64A0]();
    v19 = self;
    int v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v23 = HMFGetLogIdentifier();
      int v29 = 138543618;
      v30 = v23;
      __int16 v31 = 2112;
      id v32 = v4;
      objc_super v24 = "%{public}@Failed to decode setting missing language value: %@";
      goto LABEL_15;
    }
LABEL_16:

    v20 = 0;
    goto LABEL_17;
  }
  id v9 = [v4 languageSetting];
  objc_super v10 = [v9 value];

  if ([v10 hasInputLanguageCode]
    && [v10 hasOutputVoiceLanguageCode]
    && ([v10 hasOutputVoiceGenderCode] & 1) != 0)
  {
    objc_super v11 = [HMSettingLanguageValue alloc];
    v12 = [v10 inputLanguageCode];
    v13 = [v10 outputVoiceLanguageCode];
    v14 = [v10 outputVoiceGenderCode];
    v15 = [v10 voiceName];
    v16 = [(HMSettingLanguageValue *)v11 initWithInputLanguageCode:v12 outputVoiceLanguageCode:v13 outputVoiceGenderCode:v14 voiceName:v15];
    v17 = +[HMFObjectCacheHMSettingLanguageValue cachedInstanceForLanguageSettingValue:v16];

    v18 = [v4 keyPath];
    v19 = -[HMLanguageSetting initWithKeyPath:readOnly:languageValue:](self, "initWithKeyPath:readOnly:languageValue:", v18, [v4 readOnly], v17);

    v20 = v19;
  }
  else
  {
    uint64_t v26 = (void *)MEMORY[0x19F3A64A0]();
    v19 = self;
    v27 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      v28 = HMFGetLogIdentifier();
      int v29 = 138543618;
      v30 = v28;
      __int16 v31 = 2112;
      id v32 = v4;
      _os_log_impl(&dword_19D1A8000, v27, OS_LOG_TYPE_ERROR, "%{public}@Language value is missing required attributes: %@", (uint8_t *)&v29, 0x16u);
    }
    v20 = 0;
  }

LABEL_17:
  return v20;
}

- (HMLanguageSetting)settingWithSettingValue:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = v5;
  if (v6)
  {
    objc_super v7 = [HMLanguageSetting alloc];
    char v8 = [(HMImmutableSetting *)self keyPath];
    id v9 = [(HMLanguageSetting *)v7 initWithKeyPath:v8 readOnly:[(HMImmutableSetting *)self isReadOnly] languageValue:v6];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (HMLanguageSetting)initWithKeyPath:(id)a3 readOnly:(BOOL)a4 languageValue:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  if (v9)
  {
    objc_super v10 = v9;
    v16.receiver = self;
    v16.super_class = (Class)HMLanguageSetting;
    objc_super v11 = [(HMImmutableSetting *)&v16 initWithKeyPath:v8 readOnly:v6];
    v12 = v11;
    if (v11) {
      objc_storeStrong((id *)&v11->_languageValue, a5);
    }

    return v12;
  }
  else
  {
    v14 = (HMCameraClipAssetContext *)_HMFPreconditionFailure();
    [(HMCameraClipAssetContext *)v14 .cxx_destruct];
  }
  return result;
}

@end