@interface HMImmutableSettingValue
+ (id)shortDescription;
- (BOOL)isEqual:(id)a3;
- (HMImmutableSettingValue)initWithPayload:(id)a3;
- (HMImmutableSettingValue)initWithProtoPayload:(id)a3;
- (NSArray)attributeDescriptions;
- (NSString)description;
- (NSString)shortDescription;
- (id)initSettingValue;
- (id)payloadCopy;
- (id)protoPayload;
- (unint64_t)hash;
@end

@implementation HMImmutableSettingValue

- (unint64_t)hash
{
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HMImmutableSettingValue *)a3;
  if (v4 == self)
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = objc_opt_isKindOfClass() & (v4 != 0);
  }

  return v5;
}

- (NSString)description
{
  return (NSString *)MEMORY[0x1F411CB90](self, a2);
}

- (NSArray)attributeDescriptions
{
  return (NSArray *)MEMORY[0x1E4F1CBF0];
}

- (NSString)shortDescription
{
  v2 = objc_opt_class();

  return (NSString *)[v2 shortDescription];
}

- (HMImmutableSettingValue)initWithProtoPayload:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 hasSettingValueEvent])
  {
    switch([v4 settingValueEvent])
    {
      case 0u:
        break;
      case 1u:
        v11 = HMSettingStringValue;
        goto LABEL_10;
      case 2u:
        v11 = HMSettingIntegerValue;
        goto LABEL_10;
      case 3u:
        v11 = HMSettingBooleanValue;
LABEL_10:
        BOOL v5 = (HMImmutableSettingValue *)[[v11 alloc] initWithProtoPayload:v4];
        goto LABEL_11;
      case 4u:
        v13 = [[HMSettingLanguageValue alloc] initWithProtoPayload:v4];
        v10 = +[HMFObjectCacheHMSettingLanguageValue cachedInstanceForLanguageSettingValue:v13];

        goto LABEL_12;
      default:
        v6 = (void *)MEMORY[0x19F3A64A0]();
        self = self;
        v7 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          v8 = HMFGetLogIdentifier();
          v9 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v4, "settingValueEvent"));
          int v14 = 138543874;
          v15 = v8;
          __int16 v16 = 2112;
          v17 = v9;
          __int16 v18 = 2112;
          id v19 = v4;
          _os_log_impl(&dword_19D1A8000, v7, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode setting value due to unknown settingValueEvent (%@) in protopayload: %@", (uint8_t *)&v14, 0x20u);
        }
        v10 = 0;
        goto LABEL_12;
    }
  }
  BOOL v5 = (HMImmutableSettingValue *)[(HMImmutableSettingValue *)self initSettingValue];
  self = v5;
LABEL_11:
  v10 = v5;
LABEL_12:

  return v10;
}

- (id)protoPayload
{
  v2 = objc_alloc_init(HMImmutableSettingsProtoValueEvent);

  return v2;
}

- (HMImmutableSettingValue)initWithPayload:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v17 = 0;
  unint64_t v5 = objc_msgSend(v4, "hmf_integerForKey:error:", @"HMImmutableSettingValueTypePayloadKey", &v17);
  id v6 = v17;
  if (v6)
  {
    v7 = (void *)MEMORY[0x19F3A64A0]();
    self = self;
    v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v19 = v9;
      __int16 v20 = 2112;
      id v21 = v4;
      _os_log_impl(&dword_19D1A8000, v8, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode setting value due to no value type in payload: %@", buf, 0x16u);
    }
LABEL_4:

    v10 = 0;
  }
  else
  {
    switch(v5)
    {
      case 0uLL:
        v11 = (HMImmutableSettingValue *)[(HMImmutableSettingValue *)self initSettingValue];
        self = v11;
        goto LABEL_15;
      case 1uLL:
        int v14 = HMSettingBooleanValue;
        goto LABEL_14;
      case 2uLL:
        int v14 = HMSettingIntegerValue;
        goto LABEL_14;
      case 3uLL:
        int v14 = HMSettingStringValue;
        goto LABEL_14;
      case 4uLL:
        v15 = [[HMSettingLanguageValue alloc] initWithPayload:v4];
        v10 = +[HMFObjectCacheHMSettingLanguageValue cachedInstanceForLanguageSettingValue:v15];

        break;
      case 5uLL:
        int v14 = HMSettingVersionValue;
LABEL_14:
        v11 = (HMImmutableSettingValue *)[[v14 alloc] initWithPayload:v4];
LABEL_15:
        v10 = v11;
        break;
      default:
        v7 = (void *)MEMORY[0x19F3A64A0]();
        self = self;
        v8 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          v12 = HMFGetLogIdentifier();
          v13 = HMImmutableSettingValueTypeAsString(v5);
          *(_DWORD *)buf = 138543874;
          id v19 = v12;
          __int16 v20 = 2112;
          id v21 = v13;
          __int16 v22 = 2112;
          id v23 = v4;
          _os_log_impl(&dword_19D1A8000, v8, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode setting value due to unknown value type: %@ in payload: %@", buf, 0x20u);
        }
        goto LABEL_4;
    }
  }

  return v10;
}

- (id)payloadCopy
{
  v5[1] = *MEMORY[0x1E4F143B8];
  id v4 = @"HMImmutableSettingValueTypePayloadKey";
  v5[0] = &unk_1EEF07AB8;
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v2;
}

- (id)initSettingValue
{
  v3.receiver = self;
  v3.super_class = (Class)HMImmutableSettingValue;
  return [(HMImmutableSettingValue *)&v3 init];
}

+ (id)shortDescription
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

@end