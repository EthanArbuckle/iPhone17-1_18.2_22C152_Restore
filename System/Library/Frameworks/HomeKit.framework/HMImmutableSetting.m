@interface HMImmutableSetting
+ (id)shortDescription;
- (BOOL)isEqual:(id)a3;
- (BOOL)isReadOnly;
- (HMImmutableSetting)initWithKeyPath:(id)a3 readOnly:(BOOL)a4;
- (HMImmutableSetting)initWithPayload:(id)a3;
- (HMImmutableSetting)initWithProtoPayload:(id)a3;
- (HMImmutableSetting)settingWithSettingValue:(id)a3;
- (NSArray)attributeDescriptions;
- (NSString)description;
- (NSString)keyPath;
- (NSString)shortDescription;
- (id)payloadCopy;
- (id)protoPayload;
- (id)settingValue;
- (unint64_t)hash;
@end

@implementation HMImmutableSetting

- (void).cxx_destruct
{
}

- (BOOL)isReadOnly
{
  return self->_readOnly;
}

- (NSString)keyPath
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)description
{
  return (NSString *)MEMORY[0x1F411CB90](self, a2);
}

- (unint64_t)hash
{
  v2 = [(HMImmutableSetting *)self keyPath];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HMImmutableSetting *)a3;
  if (self == v4)
  {
    LOBYTE(v10) = 1;
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
    if (v6)
    {
      v7 = [(HMImmutableSetting *)self keyPath];
      v8 = [(HMImmutableSetting *)v6 keyPath];
      if ([v7 isEqualToString:v8])
      {
        BOOL v9 = [(HMImmutableSetting *)self isReadOnly];
        BOOL v10 = v9 ^ [(HMImmutableSetting *)v6 isReadOnly] ^ 1;
      }
      else
      {
        LOBYTE(v10) = 0;
      }
    }
    else
    {
      LOBYTE(v10) = 0;
    }
  }
  return v10;
}

- (NSArray)attributeDescriptions
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F653F8]);
  v4 = [(HMImmutableSetting *)self keyPath];
  v5 = (void *)[v3 initWithName:@"keyPath" value:v4];
  v8[0] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];

  return (NSArray *)v6;
}

- (NSString)shortDescription
{
  v2 = objc_opt_class();

  return (NSString *)[v2 shortDescription];
}

- (HMImmutableSetting)initWithProtoPayload:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 hasSettingChangeEvent])
  {
    switch([v4 settingChangeEvent])
    {
      case 0u:
        v5 = (void *)MEMORY[0x19F3A64A0]();
        v6 = self;
        v7 = HMFGetOSLogHandle();
        if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
          goto LABEL_8;
        }
        v8 = HMFGetLogIdentifier();
        int v13 = 138543618;
        v14 = v8;
        __int16 v15 = 2112;
        id v16 = v4;
        BOOL v9 = "%{public}@Setting event is not set in protopayload: %@";
        goto LABEL_7;
      case 1u:
        v11 = HMImmutableStringSetting;
        goto LABEL_15;
      case 2u:
        v11 = HMBoundedIntegerSetting;
        goto LABEL_15;
      case 3u:
        v11 = HMBooleanSetting;
        goto LABEL_15;
      case 4u:
        v11 = HMLanguageSetting;
        goto LABEL_15;
      case 5u:
        v11 = HMLanguageValueListSetting;
LABEL_15:
        BOOL v10 = (HMImmutableSetting *)[[v11 alloc] initWithProtoPayload:v4];
        goto LABEL_16;
      default:
        v5 = (void *)MEMORY[0x19F3A64A0]();
        v6 = self;
        v7 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          v8 = HMFGetLogIdentifier();
          int v13 = 138543618;
          v14 = v8;
          __int16 v15 = 2112;
          id v16 = v4;
          BOOL v9 = "%{public}@Failed to decode setting due to unknown setting event in protopayload: %@";
LABEL_7:
          _os_log_impl(&dword_19D1A8000, v7, OS_LOG_TYPE_ERROR, v9, (uint8_t *)&v13, 0x16u);
        }
LABEL_8:

        break;
    }
  }
  BOOL v10 = 0;
LABEL_16:

  return v10;
}

- (id)protoPayload
{
  id v3 = objc_alloc_init(HMImmutableSettingsProtoSettingChangeEvent);
  id v4 = [(HMImmutableSetting *)self keyPath];
  [(HMImmutableSettingsProtoSettingChangeEvent *)v3 setKeyPath:v4];

  [(HMImmutableSettingsProtoSettingChangeEvent *)v3 setReadOnly:[(HMImmutableSetting *)self isReadOnly]];

  return v3;
}

- (HMImmutableSetting)initWithPayload:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v21 = 0;
  unint64_t v5 = objc_msgSend(v4, "hmf_integerForKey:error:", @"HMImmutableSettingTypePayloadKey", &v21);
  id v6 = v21;
  v7 = objc_msgSend(v4, "hmf_stringForKey:", @"HMImmutableSettingKeyPathPayloadKey");
  id v20 = v6;
  uint64_t v8 = objc_msgSend(v4, "hmf_BOOLForKey:error:", @"HMImmutableSettingReadOnlyPayloadKey", &v20);
  id v9 = v20;

  if (v9 || !v7)
  {
    v11 = (void *)MEMORY[0x19F3A64A0]();
    self = self;
    v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v23 = v13;
      __int16 v24 = 2112;
      id v25 = v4;
      _os_log_impl(&dword_19D1A8000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode setting payload: %@", buf, 0x16u);
    }
LABEL_8:

    v14 = 0;
  }
  else
  {
    switch(v5)
    {
      case 0uLL:
        BOOL v10 = [(HMImmutableSetting *)self initWithKeyPath:v7 readOnly:v8];
        self = v10;
        goto LABEL_19;
      case 1uLL:
        __int16 v15 = HMBooleanSetting;
        goto LABEL_18;
      case 2uLL:
        __int16 v15 = HMBoundedIntegerSetting;
        goto LABEL_18;
      case 3uLL:
        __int16 v15 = HMImmutableStringSetting;
        goto LABEL_18;
      case 4uLL:
        __int16 v15 = HMStringListSetting;
        goto LABEL_18;
      case 5uLL:
        __int16 v15 = HMLanguageSetting;
        goto LABEL_18;
      case 6uLL:
        __int16 v15 = HMLanguageValueListSetting;
LABEL_18:
        BOOL v10 = (HMImmutableSetting *)[[v15 alloc] initWithKeyPath:v7 readOnly:v8 payload:v4];
LABEL_19:
        v14 = v10;
        break;
      default:
        v11 = (void *)MEMORY[0x19F3A64A0]();
        self = self;
        id v16 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          uint64_t v17 = HMFGetLogIdentifier();
          v18 = HMImmutableSettingTypeAsString(v5);
          *(_DWORD *)buf = 138543874;
          v23 = v17;
          __int16 v24 = 2112;
          id v25 = v18;
          __int16 v26 = 2112;
          id v27 = v4;
          _os_log_impl(&dword_19D1A8000, v16, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode setting due to unknown value type: %@ in payload: %@", buf, 0x20u);
        }
        goto LABEL_8;
    }
  }

  return v14;
}

- (id)payloadCopy
{
  v8[3] = *MEMORY[0x1E4F143B8];
  v8[0] = &unk_1EEF08100;
  v7[0] = @"HMImmutableSettingTypePayloadKey";
  v7[1] = @"HMImmutableSettingKeyPathPayloadKey";
  id v3 = [(HMImmutableSetting *)self keyPath];
  v8[1] = v3;
  v7[2] = @"HMImmutableSettingReadOnlyPayloadKey";
  id v4 = objc_msgSend(NSNumber, "numberWithBool:", -[HMImmutableSetting isReadOnly](self, "isReadOnly"));
  void v8[2] = v4;
  unint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:3];

  return v5;
}

- (id)settingValue
{
  return 0;
}

- (HMImmutableSetting)settingWithSettingValue:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F28790] reason:@"Must be implemented by subclass" userInfo:0];
  objc_exception_throw(v4);
}

- (HMImmutableSetting)initWithKeyPath:(id)a3 readOnly:(BOOL)a4
{
  id v7 = a3;
  if (v7)
  {
    uint64_t v8 = v7;
    v14.receiver = self;
    v14.super_class = (Class)HMImmutableSetting;
    id v9 = [(HMImmutableSetting *)&v14 init];
    BOOL v10 = v9;
    if (v9)
    {
      objc_storeStrong((id *)&v9->_keyPath, a3);
      v10->_readOnly = a4;
    }

    return v10;
  }
  else
  {
    v12 = (void *)_HMFPreconditionFailure();
    return (HMImmutableSetting *)+[HMImmutableSetting shortDescription];
  }
}

+ (id)shortDescription
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

@end