@interface HMDLegacyV4ModelInfo
- (Class)hmdModelClass;
- (HMDLegacyV4ModelInfo)initWithClass:(Class)a3;
- (NSDictionary)properties;
- (NSString)hmdTypeName;
@end

@implementation HMDLegacyV4ModelInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hmdModelClass, 0);
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_hmdTypeName, 0);
}

- (Class)hmdModelClass
{
  return self->_hmdModelClass;
}

- (NSDictionary)properties
{
  return self->_properties;
}

- (NSString)hmdTypeName
{
  return self->_hmdTypeName;
}

- (HMDLegacyV4ModelInfo)initWithClass:(Class)a3
{
  v20.receiver = self;
  v20.super_class = (Class)HMDLegacyV4ModelInfo;
  v4 = [(HMDLegacyV4ModelInfo *)&v20 init];
  v5 = v4;
  if (v4)
  {
    objc_storeStrong((id *)&v4->_hmdModelClass, a3);
    v6 = +[HMDBackingStoreSingleton sharedInstance];
    v7 = [v6 classToNameTransform];
    uint64_t v8 = [v7 objectForKey:a3];
    hmdTypeName = v5->_hmdTypeName;
    v5->_hmdTypeName = (NSString *)v8;

    if (!v5->_hmdTypeName)
    {
      uint64_t v10 = NSStringFromClass(a3);
      v11 = v5->_hmdTypeName;
      v5->_hmdTypeName = (NSString *)v10;
    }
    v12 = [(objc_class *)a3 properties];
    v13 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v12, "count"));
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __38__HMDLegacyV4ModelInfo_initWithClass___block_invoke;
    v18[3] = &unk_264A17420;
    id v19 = v13;
    id v14 = v13;
    [v12 enumerateKeysAndObjectsUsingBlock:v18];
    uint64_t v15 = [v14 copy];
    properties = v5->_properties;
    v5->_properties = (NSDictionary *)v15;
  }
  return v5;
}

void __38__HMDLegacyV4ModelInfo_initWithClass___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v19 = a3;
  id v5 = a2;
  uint64_t v6 = [v19 classObj];
  if (v6 == objc_opt_class())
  {
    v9 = *(void **)(a1 + 32);
    uint64_t v10 = [MEMORY[0x263F492C0] deprecatedField];
    [v9 setObject:v10 forKey:v5];
  }
  else
  {
    unint64_t v7 = [v19 logging];
    if (v7 > 3) {
      uint64_t v8 = 0;
    }
    else {
      uint64_t v8 = qword_2303E3D00[v7];
    }
    id v11 = +[HMDBackingStoreModelObjectStorageInfo deprecatedField];

    if (v11 == v19)
    {
      v12 = [MEMORY[0x263F492C0] deprecatedField];
      uint64_t v6 = [v12 classObj];
    }
    uint64_t v10 = [MEMORY[0x263EFF980] array];
    v13 = [MEMORY[0x263F49310] fieldWithClass:v6 options:v10];
    id v14 = [v19 readOnly];
    [v13 setReadonlyVersion:v14];

    uint64_t v15 = [v19 unavailable];
    [v13 setUnavailableVersion:v15];

    v16 = [v19 defaultValue];
    [v13 setDefaultValue:v16];

    [v13 setLoggingVisibility:v8];
    v17 = *(void **)(a1 + 32);
    v18 = (void *)[v13 copy];
    [v17 setObject:v18 forKey:v5];

    id v5 = v13;
  }
}

@end