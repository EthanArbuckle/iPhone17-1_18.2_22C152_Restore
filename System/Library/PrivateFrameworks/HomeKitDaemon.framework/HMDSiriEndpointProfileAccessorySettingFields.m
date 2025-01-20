@interface HMDSiriEndpointProfileAccessorySettingFields
+ (id)BOOLeanValueKeyPaths;
+ (id)fieldKeyForKeyPath:(id)a3;
+ (id)keyPaths;
+ (id)languageValueKeyPaths;
+ (id)logCategory;
+ (id)numberValueKeyPaths;
- (HMDSiriEndpointProfileAccessorySettingFields)init;
- (id)attributeDescriptions;
- (id)serializeFields;
- (void)setBoolValue:(BOOL)a3 forKeyPath:(id)a4;
- (void)setLanguageValue:(id)a3 forKeyPath:(id)a4;
- (void)setNumberValue:(id)a3 forKeyPath:(id)a4;
@end

@implementation HMDSiriEndpointProfileAccessorySettingFields

- (void).cxx_destruct
{
}

- (id)attributeDescriptions
{
  v8[1] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F424F8]);
  v4 = [(HMDSiriEndpointProfileAccessorySettingFields *)self serializeFields];
  v5 = (void *)[v3 initWithName:@"serializedFields" value:v4];
  v8[0] = v5;
  v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:1];

  return v6;
}

- (id)serializeFields
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = (void *)[(NSMutableDictionary *)self->_serializeFields copy];
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setLanguageValue:(id)a3 forKeyPath:(id)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = +[HMDSiriEndpointProfileAccessorySettingFields languageValueKeyPaths];
  char v9 = [v8 containsObject:v7];

  if (v9)
  {
    v10 = +[HMDSiriEndpointProfileAccessorySettingFields fieldKeyForKeyPath:v7];
    v24 = [NSString stringWithFormat:@"%@%@", v10, @"_inputLanguageCode"];
    v11 = [NSString stringWithFormat:@"%@%@", v10, @"_outputVoiceLanguageCode"];
    v12 = [NSString stringWithFormat:@"%@%@", v10, @"_outputVoiceGenderCode"];
    p_lock = &self->_lock;
    os_unfair_lock_lock_with_options();
    serializeFields = self->_serializeFields;
    v15 = [v6 inputLanguageCode];
    [(NSMutableDictionary *)serializeFields setObject:v15 forKey:v24];

    v16 = self->_serializeFields;
    v17 = [v6 outputVoiceLanguageCode];
    [(NSMutableDictionary *)v16 setObject:v17 forKey:v11];

    v18 = self->_serializeFields;
    v19 = [v6 outputVoiceGenderCode];
    [(NSMutableDictionary *)v18 setObject:v19 forKey:v12];

    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    v20 = (void *)MEMORY[0x230FBD990]();
    v21 = self;
    v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v23 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      v26 = v23;
      __int16 v27 = 2112;
      id v28 = v6;
      __int16 v29 = 2112;
      id v30 = v7;
      _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_ERROR, "%{public}@Failed to store language value: %@ for keypath: %@", buf, 0x20u);
    }
  }
}

- (void)setNumberValue:(id)a3 forKeyPath:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = +[HMDSiriEndpointProfileAccessorySettingFields numberValueKeyPaths];
  char v9 = [v8 containsObject:v7];

  if (v9)
  {
    v10 = +[HMDSiriEndpointProfileAccessorySettingFields fieldKeyForKeyPath:v7];
    os_unfair_lock_lock_with_options();
    [(NSMutableDictionary *)self->_serializeFields setObject:v6 forKey:v10];
    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    v11 = (void *)MEMORY[0x230FBD990]();
    v12 = self;
    v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = HMFGetLogIdentifier();
      int v15 = 138543874;
      v16 = v14;
      __int16 v17 = 2112;
      id v18 = v6;
      __int16 v19 = 2112;
      id v20 = v7;
      _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to store integer value: %@ for keypath: %@", (uint8_t *)&v15, 0x20u);
    }
  }
}

- (void)setBoolValue:(BOOL)a3 forKeyPath:(id)a4
{
  BOOL v4 = a3;
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = +[HMDSiriEndpointProfileAccessorySettingFields BOOLeanValueKeyPaths];
  char v8 = [v7 containsObject:v6];

  if (v8)
  {
    char v9 = +[HMDSiriEndpointProfileAccessorySettingFields fieldKeyForKeyPath:v6];
    p_lock = &self->_lock;
    os_unfair_lock_lock_with_options();
    serializeFields = self->_serializeFields;
    v12 = [NSNumber numberWithBool:v4];
    [(NSMutableDictionary *)serializeFields setObject:v12 forKey:v9];

    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    v13 = (void *)MEMORY[0x230FBD990]();
    v14 = self;
    int v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = HMFGetLogIdentifier();
      __int16 v17 = HMFBooleanToString();
      int v18 = 138543874;
      __int16 v19 = v16;
      __int16 v20 = 2112;
      uint64_t v21 = v17;
      __int16 v22 = 2112;
      id v23 = v6;
      _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_ERROR, "%{public}@Failed to store BOOLean value: %@ for keypath: %@", (uint8_t *)&v18, 0x20u);
    }
  }
}

- (HMDSiriEndpointProfileAccessorySettingFields)init
{
  v7.receiver = self;
  v7.super_class = (Class)HMDSiriEndpointProfileAccessorySettingFields;
  v2 = [(HMDSiriEndpointProfileAccessorySettingFields *)&v7 init];
  id v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    BOOL v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    serializeFields = v3->_serializeFields;
    v3->_serializeFields = v4;
  }
  return v3;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t7_86139 != -1) {
    dispatch_once(&logCategory__hmf_once_t7_86139, &__block_literal_global_86140);
  }
  v2 = (void *)logCategory__hmf_once_v8_86141;
  return v2;
}

void __59__HMDSiriEndpointProfileAccessorySettingFields_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v8_86141;
  logCategory__hmf_once_v8_86141 = v0;
}

+ (id)languageValueKeyPaths
{
  return &unk_26E474068;
}

+ (id)numberValueKeyPaths
{
  return &unk_26E474050;
}

+ (id)BOOLeanValueKeyPaths
{
  return &unk_26E474038;
}

+ (id)keyPaths
{
  id v2 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v3 = +[HMDSiriEndpointProfileAccessorySettingFields BOOLeanValueKeyPaths];
  [v2 addObjectsFromArray:v3];

  BOOL v4 = +[HMDSiriEndpointProfileAccessorySettingFields numberValueKeyPaths];
  [v2 addObjectsFromArray:v4];

  v5 = +[HMDSiriEndpointProfileAccessorySettingFields languageValueKeyPaths];
  [v2 addObjectsFromArray:v5];

  id v6 = (void *)[v2 copy];
  return v6;
}

+ (id)fieldKeyForKeyPath:(id)a3
{
  return (id)[a3 stringByReplacingOccurrencesOfString:@"." withString:@"_"];
}

@end