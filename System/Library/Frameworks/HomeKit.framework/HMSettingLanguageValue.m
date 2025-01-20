@interface HMSettingLanguageValue
- (BOOL)isEqual:(id)a3;
- (HMSettingLanguageValue)initWithInputLanguageCode:(id)a3 outputVoiceLanguageCode:(id)a4 outputVoiceGenderCode:(id)a5;
- (HMSettingLanguageValue)initWithInputLanguageCode:(id)a3 outputVoiceLanguageCode:(id)a4 outputVoiceGenderCode:(id)a5 voiceName:(id)a6;
- (HMSettingLanguageValue)initWithPayload:(id)a3;
- (HMSettingLanguageValue)initWithProtoPayload:(id)a3;
- (NSString)inputLanguageCode;
- (NSString)outputVoiceGenderCode;
- (NSString)outputVoiceLanguageCode;
- (NSString)voiceName;
- (id)attributeDescriptions;
- (id)payloadCopy;
- (id)protoPayload;
- (unint64_t)hash;
@end

@implementation HMSettingLanguageValue

- (HMSettingLanguageValue)initWithInputLanguageCode:(id)a3 outputVoiceLanguageCode:(id)a4 outputVoiceGenderCode:(id)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = (void *)MEMORY[0x19F3A64A0]();
  v12 = self;
  v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    v14 = HMFGetLogIdentifier();
    int v17 = 138544130;
    v18 = v14;
    __int16 v19 = 2112;
    id v20 = v8;
    __int16 v21 = 2112;
    id v22 = v9;
    __int16 v23 = 2112;
    id v24 = v10;
    _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_ERROR, "%{public}@Deprecated API: Initializing with inputLanguageCode: %@ outputVoiceLanguageCode: %@ outputVoiceGenderCode: %@", (uint8_t *)&v17, 0x2Au);
  }
  id v15 = [(HMImmutableSettingValue *)v12 initSettingValue];

  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_voiceName, 0);
  objc_storeStrong((id *)&self->_outputVoiceGenderCode, 0);
  objc_storeStrong((id *)&self->_outputVoiceLanguageCode, 0);

  objc_storeStrong((id *)&self->_inputLanguageCode, 0);
}

- (NSString)voiceName
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)outputVoiceGenderCode
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)outputVoiceLanguageCode
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)inputLanguageCode
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (unint64_t)hash
{
  v3 = [(HMSettingLanguageValue *)self inputLanguageCode];
  uint64_t v4 = [v3 hash];
  v5 = [(HMSettingLanguageValue *)self outputVoiceLanguageCode];
  uint64_t v6 = [v5 hash] ^ v4;
  v7 = [(HMSettingLanguageValue *)self outputVoiceGenderCode];
  uint64_t v8 = [v7 hash];
  id v9 = [(HMSettingLanguageValue *)self voiceName];
  uint64_t v10 = v6 ^ v8 ^ [v9 hash];
  v13.receiver = self;
  v13.super_class = (Class)HMSettingLanguageValue;
  unint64_t v11 = v10 ^ [(HMImmutableSettingValue *)&v13 hash];

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (HMSettingLanguageValue *)a3;
  if (self == v4)
  {
    BOOL v15 = 1;
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
    uint64_t v6 = v5;
    if (v6)
    {
      v7 = [(HMSettingLanguageValue *)self inputLanguageCode];
      uint64_t v8 = [(HMSettingLanguageValue *)v6 inputLanguageCode];
      if ([v7 isEqualToString:v8])
      {
        id v9 = [(HMSettingLanguageValue *)self outputVoiceGenderCode];
        uint64_t v10 = [(HMSettingLanguageValue *)v6 outputVoiceGenderCode];
        if ([v9 isEqualToString:v10])
        {
          unint64_t v11 = [(HMSettingLanguageValue *)self outputVoiceLanguageCode];
          v12 = [(HMSettingLanguageValue *)v6 outputVoiceLanguageCode];
          if (![v11 isEqualToString:v12]) {
            goto LABEL_15;
          }
          objc_super v13 = [(HMSettingLanguageValue *)self voiceName];
          [(HMSettingLanguageValue *)v6 voiceName];
          v14 = v18 = v11;
          int v17 = HMFEqualObjects();

          unint64_t v11 = v18;
          if (v17)
          {
            v19.receiver = self;
            v19.super_class = (Class)HMSettingLanguageValue;
            BOOL v15 = [(HMImmutableSettingValue *)&v19 isEqual:v6];
          }
          else
          {
LABEL_15:
            BOOL v15 = 0;
          }
        }
        else
        {
          BOOL v15 = 0;
        }
      }
      else
      {
        BOOL v15 = 0;
      }
    }
    else
    {
      BOOL v15 = 0;
    }
  }
  return v15;
}

- (id)attributeDescriptions
{
  v20[4] = *MEMORY[0x1E4F143B8];
  v19.receiver = self;
  v19.super_class = (Class)HMSettingLanguageValue;
  v3 = [(HMImmutableSettingValue *)&v19 attributeDescriptions];
  id v4 = objc_alloc(MEMORY[0x1E4F653F8]);
  v18 = [(HMSettingLanguageValue *)self inputLanguageCode];
  v5 = (void *)[v4 initWithName:@"inputLanguageCode" value:v18];
  v20[0] = v5;
  id v6 = objc_alloc(MEMORY[0x1E4F653F8]);
  v7 = [(HMSettingLanguageValue *)self outputVoiceLanguageCode];
  uint64_t v8 = (void *)[v6 initWithName:@"outputVoiceLanguageCode" value:v7];
  v20[1] = v8;
  id v9 = objc_alloc(MEMORY[0x1E4F653F8]);
  uint64_t v10 = [(HMSettingLanguageValue *)self outputVoiceGenderCode];
  unint64_t v11 = (void *)[v9 initWithName:@"outputVoiceGenderCode" value:v10];
  v20[2] = v11;
  id v12 = objc_alloc(MEMORY[0x1E4F653F8]);
  objc_super v13 = [(HMSettingLanguageValue *)self voiceName];
  v14 = (void *)[v12 initWithName:@"voiceName" value:v13];
  v20[3] = v14;
  BOOL v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:4];
  v16 = [v3 arrayByAddingObjectsFromArray:v15];

  return v16;
}

- (HMSettingLanguageValue)initWithProtoPayload:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 hasLanguageValueEvent])
  {
    v5 = [v4 languageValueEvent];
    if ([v5 hasInputLanguageCode])
    {
      if ([v5 hasOutputVoiceGenderCode])
      {
        if ([v5 hasOutputVoiceLanguageCode])
        {
          id v6 = [v5 inputLanguageCode];
          v7 = [v5 outputVoiceLanguageCode];
          uint64_t v8 = [v5 outputVoiceGenderCode];
          id v9 = [v5 voiceName];
          uint64_t v10 = [(HMSettingLanguageValue *)self initWithInputLanguageCode:v6 outputVoiceLanguageCode:v7 outputVoiceGenderCode:v8 voiceName:v9];

          unint64_t v11 = v10;
LABEL_17:

          goto LABEL_18;
        }
        BOOL v15 = (void *)MEMORY[0x19F3A64A0]();
        uint64_t v10 = self;
        v16 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          int v17 = HMFGetLogIdentifier();
          int v20 = 138543618;
          __int16 v21 = v17;
          __int16 v22 = 2112;
          id v23 = v4;
          v18 = "%{public}@Failed to decode setting value due to no output voice language value in language value event i"
                "n proto payload: %@";
          goto LABEL_15;
        }
LABEL_16:

        unint64_t v11 = 0;
        goto LABEL_17;
      }
      BOOL v15 = (void *)MEMORY[0x19F3A64A0]();
      uint64_t v10 = self;
      v16 = HMFGetOSLogHandle();
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        goto LABEL_16;
      }
      int v17 = HMFGetLogIdentifier();
      int v20 = 138543618;
      __int16 v21 = v17;
      __int16 v22 = 2112;
      id v23 = v4;
      v18 = "%{public}@Failed to decode setting value due to no output voice gender value in language value event in proto payload: %@";
    }
    else
    {
      BOOL v15 = (void *)MEMORY[0x19F3A64A0]();
      uint64_t v10 = self;
      v16 = HMFGetOSLogHandle();
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        goto LABEL_16;
      }
      int v17 = HMFGetLogIdentifier();
      int v20 = 138543618;
      __int16 v21 = v17;
      __int16 v22 = 2112;
      id v23 = v4;
      v18 = "%{public}@Failed to decode setting value due to no input language value in language value event in proto payload: %@";
    }
LABEL_15:
    _os_log_impl(&dword_19D1A8000, v16, OS_LOG_TYPE_ERROR, v18, (uint8_t *)&v20, 0x16u);

    goto LABEL_16;
  }
  id v12 = (void *)MEMORY[0x19F3A64A0]();
  uint64_t v10 = self;
  objc_super v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    v14 = HMFGetLogIdentifier();
    int v20 = 138543618;
    __int16 v21 = v14;
    __int16 v22 = 2112;
    id v23 = v4;
    _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode setting value due to no language value event type in proto payload: %@", (uint8_t *)&v20, 0x16u);
  }
  unint64_t v11 = 0;
LABEL_18:

  return v11;
}

- (id)protoPayload
{
  v3 = objc_alloc_init(HMImmutableSettingsProtoValueEvent);
  id v4 = objc_alloc_init(HMImmutableSettingsProtoLanguageValueEvent);
  v5 = [(HMSettingLanguageValue *)self inputLanguageCode];
  [(HMImmutableSettingsProtoLanguageValueEvent *)v4 setInputLanguageCode:v5];

  id v6 = [(HMSettingLanguageValue *)self outputVoiceLanguageCode];
  [(HMImmutableSettingsProtoLanguageValueEvent *)v4 setOutputVoiceLanguageCode:v6];

  v7 = [(HMSettingLanguageValue *)self outputVoiceGenderCode];
  [(HMImmutableSettingsProtoLanguageValueEvent *)v4 setOutputVoiceGenderCode:v7];

  uint64_t v8 = [(HMSettingLanguageValue *)self voiceName];
  [(HMImmutableSettingsProtoLanguageValueEvent *)v4 setVoiceName:v8];

  [(HMImmutableSettingsProtoValueEvent *)v3 setLanguageValueEvent:v4];

  return v3;
}

- (HMSettingLanguageValue)initWithPayload:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4) {
    _HMFPreconditionFailure();
  }
  v5 = v4;
  id v6 = objc_msgSend(v4, "hmf_stringForKey:", @"HMSettingLanguageValueInputLanaguageCodePayloadKey");
  v7 = objc_msgSend(v5, "hmf_stringForKey:", @"HMSettingLanguageValueOutputVoiceLanaguageCodePayloadKey");
  uint64_t v8 = objc_msgSend(v5, "hmf_stringForKey:", @"HMSettingLanguageValueOutputVoiceGenderCodePayloadKey");
  id v9 = objc_msgSend(v5, "hmf_stringForKey:", @"HMSettingLanguageValueVoiceNameCodePayloadKey");
  if (v6 && v7 && v8)
  {
    uint64_t v10 = [(HMSettingLanguageValue *)self initWithInputLanguageCode:v6 outputVoiceLanguageCode:v7 outputVoiceGenderCode:v8 voiceName:v9];
    unint64_t v11 = v10;
  }
  else
  {
    id v12 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v10 = self;
    objc_super v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = HMFGetLogIdentifier();
      int v16 = 138543618;
      int v17 = v14;
      __int16 v18 = 2112;
      objc_super v19 = v5;
      _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode setting language value due to invalid payload: %@", (uint8_t *)&v16, 0x16u);
    }
    unint64_t v11 = 0;
  }

  return v11;
}

- (id)payloadCopy
{
  v15[4] = *MEMORY[0x1E4F143B8];
  v13.receiver = self;
  v13.super_class = (Class)HMSettingLanguageValue;
  v3 = [(HMImmutableSettingValue *)&v13 payloadCopy];
  id v4 = (void *)[v3 mutableCopy];

  v15[0] = &unk_1EEF081C0;
  v14[0] = @"HMImmutableSettingValueTypePayloadKey";
  v14[1] = @"HMSettingLanguageValueInputLanaguageCodePayloadKey";
  v5 = [(HMSettingLanguageValue *)self inputLanguageCode];
  v15[1] = v5;
  v14[2] = @"HMSettingLanguageValueOutputVoiceLanaguageCodePayloadKey";
  id v6 = [(HMSettingLanguageValue *)self outputVoiceLanguageCode];
  v15[2] = v6;
  v14[3] = @"HMSettingLanguageValueOutputVoiceGenderCodePayloadKey";
  v7 = [(HMSettingLanguageValue *)self outputVoiceGenderCode];
  v15[3] = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:4];
  [v4 addEntriesFromDictionary:v8];

  id v9 = [(HMSettingLanguageValue *)self voiceName];

  if (v9)
  {
    uint64_t v10 = [(HMSettingLanguageValue *)self voiceName];
    [v4 setObject:v10 forKeyedSubscript:@"HMSettingLanguageValueVoiceNameCodePayloadKey"];
  }
  unint64_t v11 = (void *)[v4 copy];

  return v11;
}

- (HMSettingLanguageValue)initWithInputLanguageCode:(id)a3 outputVoiceLanguageCode:(id)a4 outputVoiceGenderCode:(id)a5 voiceName:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)HMSettingLanguageValue;
  BOOL v15 = [(HMImmutableSettingValue *)&v18 initSettingValue];
  int v16 = (HMSettingLanguageValue *)v15;
  if (v15)
  {
    objc_storeStrong(v15 + 1, a3);
    objc_storeStrong((id *)&v16->_outputVoiceLanguageCode, a4);
    objc_storeStrong((id *)&v16->_outputVoiceGenderCode, a5);
    objc_storeStrong((id *)&v16->_voiceName, a6);
  }

  return v16;
}

@end