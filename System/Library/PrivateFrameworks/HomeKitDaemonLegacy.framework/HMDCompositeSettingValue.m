@interface HMDCompositeSettingValue
+ (id)compositeSettingValueFromImmutableSettingsValue:(id)a3;
- (BOOL)isEqualValue:(id)a3;
- (HMDCompositeSettingValue)init;
@end

@implementation HMDCompositeSettingValue

- (BOOL)isEqualValue:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3B8];
  v7 = NSString;
  v8 = NSStringFromSelector(a2);
  v9 = [v7 stringWithFormat:@"You must override %@ in a subclass", v8];
  id v10 = [v5 exceptionWithName:v6 reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

- (HMDCompositeSettingValue)init
{
  v3.receiver = self;
  v3.super_class = (Class)HMDCompositeSettingValue;
  return [(HMDCompositeSettingValue *)&v3 init];
}

+ (id)compositeSettingValueFromImmutableSettingsValue:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;
  if (v6)
  {
    v7 = -[HMDCompositeSettingBoolValue initWithValue:]([HMDCompositeSettingBoolValue alloc], "initWithValue:", [v6 BOOLValue]);
    goto LABEL_30;
  }
  id v8 = v4;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v9 = v8;
  }
  else {
    v9 = 0;
  }
  id v10 = v9;

  if (!v10)
  {
    id v13 = v8;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v14 = v13;
    }
    else {
      v14 = 0;
    }
    id v15 = v14;

    if (v15)
    {
      v16 = [HMDCompositeSettingStringValue alloc];
      v17 = [v15 stringValue];
      v7 = [(HMDCompositeSettingStringValue *)v16 initWithValue:v17];

LABEL_28:
      goto LABEL_29;
    }
    id v18 = v13;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v19 = v18;
    }
    else {
      v19 = 0;
    }
    id v20 = v19;

    if (v20)
    {
      v21 = [HMDCompositeSettingLanguageValue alloc];
      id v22 = [v20 inputLanguageCode];
      v23 = [v20 outputVoiceLanguageCode];
      v24 = [v20 outputVoiceGenderCode];
      v25 = [v20 voiceName];
      v7 = [(HMDCompositeSettingLanguageValue *)v21 initWithInputLanguage:v22 outputVoiceLanguageCode:v23 outputVoiceGenderCode:v24 voiceName:v25];
    }
    else
    {
      id v26 = v18;
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v27 = v26;
      }
      else {
        v27 = 0;
      }
      id v22 = v27;

      if (!v22)
      {
        v30 = (void *)MEMORY[0x1D9452090]();
        id v31 = a1;
        v32 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v33 = v34 = v30;
          *(_DWORD *)buf = 138543618;
          v36 = v33;
          __int16 v37 = 2112;
          id v38 = v26;
          _os_log_impl(&dword_1D49D5000, v32, OS_LOG_TYPE_ERROR, "%{public}@Failed to get a composite setting value from immutable settings value: %@", buf, 0x16u);

          v30 = v34;
        }

        v7 = 0;
        goto LABEL_27;
      }
      v28 = [HMDCompositeSettingVersionValue alloc];
      v23 = [v22 version];
      v7 = -[HMDCompositeSettingVersionValue initWithVersion:type:](v28, "initWithVersion:type:", v23, [v22 type]);
    }

LABEL_27:
    goto LABEL_28;
  }
  v11 = [HMDCompositeSettingNumberValue alloc];
  v12 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v10, "integerValue"));
  v7 = [(HMDCompositeSettingNumberValue *)v11 initWithValue:v12];

LABEL_29:
LABEL_30:

  return v7;
}

@end