@interface HMImmutableSettingValueEvent
+ (id)decodeSettingValueFromEvent:(id)a3 error:(id *)a4;
- (HMImmutableSettingValue)settingValue;
- (id)encodedData;
- (id)initSettingValue:(id)a3 eventSource:(id)a4 eventTimestamp:(double)a5;
@end

@implementation HMImmutableSettingValueEvent

+ (id)decodeSettingValueFromEvent:(id)a3 error:(id *)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = [HMImmutableSettingsProtoValueEvent alloc];
  v7 = [v5 encodedData];
  v8 = [(HMImmutableSettingsProtoValueEvent *)v6 initWithData:v7];

  if (v8)
  {
    v9 = [[HMImmutableSettingValue alloc] initWithProtoPayload:v8];
    v10 = v9;
    if (a4 && !v9)
    {
      uint64_t v11 = 3;
LABEL_9:
      [MEMORY[0x1E4F28C58] hmErrorWithCode:v11];
      v10 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v12 = (void *)MEMORY[0x19F3A64A0]();
    v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = HMFGetLogIdentifier();
      int v16 = 138543618;
      v17 = v14;
      __int16 v18 = 2112;
      id v19 = v5;
      _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_ERROR, "%{public}@Unable to decode proto settings value event from event: %@", (uint8_t *)&v16, 0x16u);
    }
    if (a4)
    {
      uint64_t v11 = 19;
      goto LABEL_9;
    }
    v10 = 0;
  }

  return v10;
}

- (void).cxx_destruct
{
}

- (HMImmutableSettingValue)settingValue
{
  return self->_settingValue;
}

- (id)encodedData
{
  v2 = [(HMImmutableSettingValueEvent *)self settingValue];
  v3 = [v2 protoPayload];
  v4 = [v3 data];

  return v4;
}

- (id)initSettingValue:(id)a3 eventSource:(id)a4 eventTimestamp:(double)a5
{
  id v9 = a3;
  v10 = (objc_class *)MEMORY[0x1E4F69F48];
  id v11 = a4;
  v12 = (void *)[[v10 alloc] initWithSource:v11 cachePolicy:1 combineType:2 timestamp:a5];

  v13 = [(HMEEvent *)self initWithSubclassedEventMetadata:v12];
  v14 = v13;
  if (v13) {
    objc_storeStrong((id *)&v13->_settingValue, a3);
  }

  return v14;
}

@end