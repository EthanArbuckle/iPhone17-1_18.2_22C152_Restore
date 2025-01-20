@interface HMAccessoryCollectionSettingItem
+ (BOOL)requiresCustomItemValueClassesToDecodeForKeyPath:(id)a3;
+ (BOOL)supportsSecureCoding;
+ (id)shortDescription;
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldBlockValueDecode;
- (HMAccessoryCollectionSetting)setting;
- (HMAccessoryCollectionSettingItem)init;
- (HMAccessoryCollectionSettingItem)initWithCoder:(id)a3;
- (HMAccessoryCollectionSettingItem)initWithIdentifier:(id)a3 value:(id)a4;
- (HMAccessoryCollectionSettingItem)initWithValue:(id)a3;
- (NSData)serializedValue;
- (NSObject)value;
- (NSUUID)identifier;
- (id)debugDescription;
- (id)description;
- (id)descriptionWithPointer:(BOOL)a3;
- (id)shortDescription;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setSetting:(id)a3;
@end

@implementation HMAccessoryCollectionSettingItem

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_setting);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_serializedValue, 0);

  objc_storeStrong((id *)&self->_value, 0);
}

- (void)setSetting:(id)a3
{
}

- (HMAccessoryCollectionSetting)setting
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_setting);

  return (HMAccessoryCollectionSetting *)WeakRetained;
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 32, 1);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(HMAccessoryCollectionSettingItem *)self identifier];
  [v4 encodeObject:v5 forKey:@"HM.identifier"];

  id v6 = [(HMAccessoryCollectionSettingItem *)self serializedValue];
  [v4 encodeObject:v6 forKey:@"HM.value"];
}

- (HMAccessoryCollectionSettingItem)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HMAccessoryCollectionSettingItem;
  v5 = [(HMAccessoryCollectionSettingItem *)&v12 init];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.identifier"];
    uint64_t v7 = objc_msgSend(MEMORY[0x1E4F654F0], "hmf_cachedInstanceForNSUUID:", v6);
    identifier = v5->_identifier;
    v5->_identifier = (NSUUID *)v7;

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.value"];
    serializedValue = v5->_serializedValue;
    v5->_serializedValue = (NSData *)v9;
  }
  return v5;
}

- (BOOL)shouldBlockValueDecode
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v3 = [(HMAccessoryCollectionSettingItem *)self setting];
  id v4 = [v3 keyPath];
  if (!v4)
  {
    v8 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v9 = self;
    v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = HMFGetLogIdentifier();
      int v13 = 138543618;
      v14 = v11;
      __int16 v15 = 2112;
      v16 = v3;
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to block decode value due to no keypath for setting: %@", (uint8_t *)&v13, 0x16u);
    }
    goto LABEL_7;
  }
  if (!+[HMAccessoryCollectionSettingItem requiresCustomItemValueClassesToDecodeForKeyPath:v4])
  {
LABEL_7:
    char v7 = 0;
    goto LABEL_8;
  }
  v5 = +[_HMAccessoryCollectionSettingItemClassManager sharedManager];
  char v6 = [v5 hasCustomItemValueClassesForKeyPath:v4];

  char v7 = v6 ^ 1;
LABEL_8:

  return v7;
}

- (NSObject)value
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if ([(HMAccessoryCollectionSettingItem *)self shouldBlockValueDecode])
  {
    v3 = 0;
  }
  else
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock_with_options();
    value = self->_value;
    if (!value)
    {
      char v6 = [(HMAccessoryCollectionSettingItem *)self serializedValue];
      char v7 = self;
      id v8 = v6;
      context = (void *)MEMORY[0x19F3A64A0]();
      v23 = v7;
      uint64_t v9 = [(HMAccessoryCollectionSettingItem *)v7 setting];
      v10 = v9;
      if (v9) {
        [v9 itemValueClasses];
      }
      else {
      v24 = +[_HMAccessoryCollectionSettingItemClassManager defaultItemValueClasses];
      }

      v11 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v8 error:0];
      [v11 setDecodingFailurePolicy:1];
      uint64_t v12 = [v11 decodeObjectOfClasses:v24 forKey:*MEMORY[0x1E4F284E8]];
      int v13 = [v11 error];

      if (v13)
      {
        v14 = (void *)MEMORY[0x19F3A64A0]();
        __int16 v15 = v23;
        HMFGetOSLogHandle();
        v16 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          id v17 = (id)objc_claimAutoreleasedReturnValue();
          v18 = [v11 error];
          *(_DWORD *)buf = 138543618;
          id v26 = v17;
          __int16 v27 = 2112;
          v28 = v18;
          _os_log_impl(&dword_19D1A8000, v16, OS_LOG_TYPE_ERROR, "%{public}@Failed to deserialize accessory collection setting item value with error: %@", buf, 0x16u);
        }
      }
      [v11 finishDecoding];

      v20 = self->_value;
      p_value = &self->_value;
      *p_value = v12;

      value = *p_value;
    }
    v3 = value;
    os_unfair_lock_unlock(p_lock);
  }

  return v3;
}

- (NSData)serializedValue
{
  serializedValue = self->_serializedValue;
  if (serializedValue)
  {
    v3 = serializedValue;
  }
  else
  {
    id v4 = [(HMAccessoryCollectionSettingItem *)self value];
    encodeRootObject(v4);
    v3 = (NSData *)objc_claimAutoreleasedReturnValue();
  }

  return v3;
}

- (id)description
{
  return [(HMAccessoryCollectionSettingItem *)self descriptionWithPointer:0];
}

- (id)debugDescription
{
  return [(HMAccessoryCollectionSettingItem *)self descriptionWithPointer:1];
}

- (id)descriptionWithPointer:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = NSString;
  char v6 = [(id)objc_opt_class() shortDescription];
  if (v3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @" %p", self);
    char v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v7 = &stru_1EEE9DD88;
  }
  id v8 = [(HMAccessoryCollectionSettingItem *)self identifier];
  uint64_t v9 = [v8 UUIDString];
  v10 = [(HMAccessoryCollectionSettingItem *)self value];
  v11 = [v5 stringWithFormat:@"<%@%@, Identifier = %@, Value = %@>", v6, v7, v9, v10];

  if (v3) {

  }
  return v11;
}

- (id)shortDescription
{
  BOOL v3 = NSString;
  id v4 = [(id)objc_opt_class() shortDescription];
  v5 = [(HMAccessoryCollectionSettingItem *)self identifier];
  char v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HMAccessoryCollectionSettingItem *)a3;
  if (self == v4)
  {
    char v12 = 1;
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
    char v6 = v5;
    if (v6
      && ([(HMAccessoryCollectionSettingItem *)self identifier],
          char v7 = objc_claimAutoreleasedReturnValue(),
          [(HMAccessoryCollectionSettingItem *)v6 identifier],
          id v8 = objc_claimAutoreleasedReturnValue(),
          int v9 = [v7 isEqual:v8],
          v8,
          v7,
          v9))
    {
      v10 = [(HMAccessoryCollectionSettingItem *)self value];
      v11 = [(HMAccessoryCollectionSettingItem *)v6 value];
      char v12 = HMFEqualObjects();
    }
    else
    {
      char v12 = 0;
    }
  }
  return v12;
}

- (unint64_t)hash
{
  v2 = [(HMAccessoryCollectionSettingItem *)self identifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (HMAccessoryCollectionSettingItem)initWithIdentifier:(id)a3 value:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = v7;
    v16.receiver = self;
    v16.super_class = (Class)HMAccessoryCollectionSettingItem;
    int v9 = [(HMAccessoryCollectionSettingItem *)&v16 init];
    if (v9)
    {
      uint64_t v10 = objc_msgSend(MEMORY[0x1E4F654F0], "hmf_cachedInstanceForNSUUID:", v6);
      identifier = v9->_identifier;
      v9->_identifier = (NSUUID *)v10;

      objc_storeStrong((id *)&v9->_value, a4);
    }

    return v9;
  }
  else
  {
    int v13 = (HMAccessoryCollectionSettingItem *)_HMFPreconditionFailure();
    return [(HMAccessoryCollectionSettingItem *)v13 initWithValue:v15];
  }
}

- (HMAccessoryCollectionSettingItem)initWithValue:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F29128];
  id v5 = a3;
  id v6 = [v4 UUID];
  id v7 = [(HMAccessoryCollectionSettingItem *)self initWithIdentifier:v6 value:v5];

  return v7;
}

- (HMAccessoryCollectionSettingItem)init
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  id v4 = NSString;
  id v5 = NSStringFromSelector(a2);
  id v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BOOL)requiresCustomItemValueClassesToDecodeForKeyPath:(id)a3
{
  return [&unk_1EEF08F48 containsObject:a3];
}

+ (id)shortDescription
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

@end