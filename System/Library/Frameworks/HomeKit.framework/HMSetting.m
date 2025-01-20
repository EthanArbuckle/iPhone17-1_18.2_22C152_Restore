@interface HMSetting
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isWritable;
- (Class)valueClass;
- (HMSetting)initWithCoder:(id)a3;
- (HMSetting)initWithIdentifier:(id)a3 name:(id)a4 type:(int64_t)a5 value:(id)a6 properties:(unint64_t)a7;
- (HMSetting)initWithInternal;
- (HMSettingManager)settingManager;
- (HMSettingValue)internalValue;
- (NSString)keyPath;
- (NSString)localizedTitle;
- (NSString)name;
- (NSUUID)identifier;
- (id)_initWithIdentifier:(id)a3 name:(id)a4 type:(int64_t)a5 value:(id)a6 properties:(unint64_t)a7;
- (id)description;
- (id)value;
- (id)valueForUpdate:(id)a3;
- (int64_t)type;
- (unint64_t)properties;
- (void)merge:(id)a3;
- (void)setKeyPath:(id)a3;
- (void)setName:(id)a3;
- (void)setProperties:(unint64_t)a3;
- (void)setSettingManager:(id)a3;
- (void)setType:(int64_t)a3;
- (void)setValue:(id)a3;
- (void)setValueClass:(Class)a3;
- (void)updateValue:(id)a3 completionHandler:(id)a4;
@end

@implementation HMSetting

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_destroyWeak((id *)&self->_settingManager);
  objc_storeStrong((id *)&self->_valueClass, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_keyPath, 0);

  objc_storeStrong(&self->_value, 0);
}

- (void)setProperties:(unint64_t)a3
{
  self->_properties = a3;
}

- (unint64_t)properties
{
  return self->_properties;
}

- (void)setName:(id)a3
{
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setSettingManager:(id)a3
{
}

- (HMSettingManager)settingManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_settingManager);

  return (HMSettingManager *)WeakRetained;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setValueClass:(Class)a3
{
}

- (Class)valueClass
{
  return (Class)objc_getProperty(self, a2, 32, 1);
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 24, 1);
}

- (void)setKeyPath:(id)a3
{
}

- (NSString)keyPath
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setValue:(id)a3
{
}

- (id)value
{
  return objc_getProperty(self, a2, 8, 1);
}

- (HMSetting)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.type"];
  uint64_t v6 = (int)[v5 intValue];

  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.identifier"];
  v8 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  v11 = objc_msgSend(v8, "setWithObjects:", v9, v10, objc_opt_class(), 0);
  v12 = [v4 decodeObjectOfClasses:v11 forKey:@"HM.value"];

  v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.properties"];
  uint64_t v14 = [v13 integerValue];

  v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.name"];

  v16 = [(HMSetting *)self _initWithIdentifier:v7 name:v15 type:v6 value:v12 properties:v14];
  return v16;
}

- (void)merge:(id)a3
{
  id v5 = [a3 value];
  id v4 = (void *)[v5 copy];
  [(HMSetting *)self setValue:v4];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HMSetting *)a3;
  if (self == v4)
  {
    char v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v5 = v4;
    }
    else {
      id v5 = 0;
    }
    uint64_t v6 = v5;
    v7 = [(HMSetting *)self value];
    v8 = [(HMSetting *)v6 value];

    char v9 = HMFEqualObjects();
  }

  return v9;
}

- (void)updateValue:(id)a3 completionHandler:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = (void (**)(id, void *))a4;
  v8 = [(HMSetting *)self settingManager];
  char v9 = v8;
  if (v8)
  {
    [v8 updateValueForSetting:self value:v6 completionHandler:v7];
  }
  else
  {
    uint64_t v10 = (void *)MEMORY[0x19F3A64A0]();
    v11 = self;
    v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = HMFGetLogIdentifier();
      int v15 = 138543362;
      v16 = v13;
      _os_log_impl(&dword_19D1A8000, v12, OS_LOG_TYPE_ERROR, "%{public}@setting does not have manager", (uint8_t *)&v15, 0xCu);
    }
    uint64_t v14 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
    v7[2](v7, v14);
  }
}

- (id)valueForUpdate:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3B8];
  v7 = NSString;
  v8 = NSStringFromSelector(a2);
  char v9 = [v7 stringWithFormat:@"You must override %@ in a subclass", v8];
  id v10 = [v5 exceptionWithName:v6 reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

- (HMSettingValue)internalValue
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  id v4 = NSString;
  id v5 = NSStringFromSelector(a2);
  uint64_t v6 = [v4 stringWithFormat:@"You must override %@ in a subclass", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (BOOL)isWritable
{
  return ([(HMSetting *)self properties] >> 1) & 1;
}

- (NSString)localizedTitle
{
  v2 = [(HMSetting *)self keyPath];
  uint64_t v3 = +[HMAccessorySettings localizationKeyForKeyPath:v2];

  id v4 = +[HMLocalization sharedManager];
  id v5 = [v4 getLocalizedString:v3];

  return (NSString *)v5;
}

- (id)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(HMSetting *)self localizedTitle];
  [(HMSetting *)self isWritable];
  uint64_t v6 = HMFBooleanToString();
  id v7 = [(HMSetting *)self value];
  v8 = [v3 stringWithFormat:@"[%@, Title = %@, Writeable = %@, Value = %@]", v4, v5, v6, v7];

  return v8;
}

- (id)_initWithIdentifier:(id)a3 name:(id)a4 type:(int64_t)a5 value:(id)a6 properties:(unint64_t)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  if ((unint64_t)(a5 - 1) > 4) {
    int v15 = 0;
  }
  else {
    int v15 = (void *)[objc_alloc(*off_1E5943160[a5 - 1]) initWithIdentifier:v12 name:v13 type:a5 value:v14 properties:a7];
  }

  return v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HMSetting)initWithIdentifier:(id)a3 name:(id)a4 type:(int64_t)a5 value:(id)a6 properties:(unint64_t)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  v21.receiver = self;
  v21.super_class = (Class)HMSetting;
  int v15 = [(HMSetting *)&v21 init];
  if (v15)
  {
    uint64_t v16 = objc_msgSend(MEMORY[0x1E4F654F0], "hmf_cachedInstanceForNSUUID:", v12);
    identifier = v15->_identifier;
    v15->_identifier = (NSUUID *)v16;

    uint64_t v18 = objc_msgSend(MEMORY[0x1E4F654E8], "hmf_cachedInstanceForString:", v13);
    name = v15->_name;
    v15->_name = (NSString *)v18;

    objc_storeStrong(&v15->_value, a6);
    v15->_type = a5;
    v15->_properties = a7;
    objc_storeStrong((id *)&v15->_keyPath, a4);
  }

  return v15;
}

- (HMSetting)initWithInternal
{
  v3.receiver = self;
  v3.super_class = (Class)HMSetting;
  return [(HMSetting *)&v3 init];
}

@end