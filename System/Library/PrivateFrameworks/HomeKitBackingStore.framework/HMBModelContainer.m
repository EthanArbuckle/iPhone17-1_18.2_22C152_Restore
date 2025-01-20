@interface HMBModelContainer
+ (NSSet)allowedTypes;
+ (NSSet)internalAllowedTypes;
+ (id)decodeAsNSDictionary:(id)a3 error:(id *)a4;
+ (id)decodeAsOPACK:(id)a3 error:(id *)a4;
+ (id)encodeAsNSDictionary:(id)a3 error:(id *)a4;
+ (id)encodeAsOPACK:(id)a3 error:(id *)a4;
+ (id)logCategory;
- (Class)_modelClassFromDictionary:(id)a3 typeName:(id)a4 error:(id *)a5;
- (Class)modelClassForTypeName:(id)a3;
- (HMBLocalZone)localZone;
- (HMBMirrorProtocol)mirror;
- (HMBModelContainer)init;
- (HMBModelContainer)initWithDataVersion:(id)a3 legacyDataVersion:(id)a4;
- (HMFVersion)dataVersion;
- (HMFVersion)legacyDataVersion;
- (NSMapTable)classReadOnlyVersionCache;
- (NSMapTable)classToNameTransform;
- (NSMapTable)classUnavailableVersionCache;
- (NSMapTable)nameToClassTransform;
- (NSMapTable)objectPropertyHashLookup;
- (NSMapTable)queryFieldsCache;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dataFromModel:(id)a3 encoding:(unint64_t)a4 storageLocation:(unint64_t)a5 updatedModelIDs:(id)a6 error:(id *)a7;
- (id)decodePropertyValueFromData:(id)a3 forProperty:(id)a4 field:(id)a5 storageLocation:(unint64_t)a6 error:(id *)a7;
- (id)encodePropertyValue:(id)a3 forProperty:(id)a4 field:(id)a5 storageLocation:(unint64_t)a6 error:(id *)a7;
- (id)modelFromData:(id)a3 encoding:(unint64_t)a4 storageLocation:(unint64_t)a5 error:(id *)a6;
- (id)modelFromData:(id)a3 encoding:(unint64_t)a4 storageLocation:(unint64_t)a5 type:(id)a6 error:(id *)a7;
- (id)modelFromDictionary:(id)a3 storageLocation:(unint64_t)a4 typeName:(id)a5 error:(id *)a6;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)readOnlyVersionsForModelClass:(Class)a3;
- (id)schemaHashForModel:(id)a3;
- (id)typeNameForModelClass:(Class)a3;
- (id)unavailableVersionsForModelClass:(Class)a3;
- (unint64_t)bestModelEncodingForStorageLocation:(unint64_t)a3;
- (void)setClassReadOnlyVersionCache:(id)a3;
- (void)setClassToNameTransform:(id)a3;
- (void)setClassUnavailableVersionCache:(id)a3;
- (void)setNameToClassTransform:(id)a3;
- (void)setObjectPropertyHashLookup:(id)a3;
- (void)updateLocalZone:(id)a3;
- (void)updateMirror:(id)a3;
@end

@implementation HMBModelContainer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_classUnavailableVersionCache, 0);
  objc_storeStrong((id *)&self->_classReadOnlyVersionCache, 0);
  objc_storeStrong((id *)&self->_objectPropertyHashLookup, 0);
  objc_storeStrong((id *)&self->_nameToClassTransform, 0);
  objc_storeStrong((id *)&self->_classToNameTransform, 0);
  objc_destroyWeak((id *)&self->_mirror);
  objc_destroyWeak((id *)&self->_localZone);
  objc_storeStrong((id *)&self->_queryFieldsCache, 0);
  objc_storeStrong((id *)&self->_dataVersion, 0);
  objc_storeStrong((id *)&self->_legacyDataVersion, 0);
}

- (void)setClassUnavailableVersionCache:(id)a3
{
}

- (NSMapTable)classUnavailableVersionCache
{
  return self->_classUnavailableVersionCache;
}

- (void)setClassReadOnlyVersionCache:(id)a3
{
}

- (NSMapTable)classReadOnlyVersionCache
{
  return self->_classReadOnlyVersionCache;
}

- (void)setObjectPropertyHashLookup:(id)a3
{
}

- (NSMapTable)objectPropertyHashLookup
{
  return self->_objectPropertyHashLookup;
}

- (void)setNameToClassTransform:(id)a3
{
}

- (NSMapTable)nameToClassTransform
{
  return self->_nameToClassTransform;
}

- (void)setClassToNameTransform:(id)a3
{
}

- (NSMapTable)classToNameTransform
{
  return self->_classToNameTransform;
}

- (HMBMirrorProtocol)mirror
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mirror);
  return (HMBMirrorProtocol *)WeakRetained;
}

- (HMBLocalZone)localZone
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_localZone);
  return (HMBLocalZone *)WeakRetained;
}

- (NSMapTable)queryFieldsCache
{
  return self->_queryFieldsCache;
}

- (HMFVersion)dataVersion
{
  return self->_dataVersion;
}

- (HMFVersion)legacyDataVersion
{
  return self->_legacyDataVersion;
}

- (id)decodePropertyValueFromData:(id)a3 forProperty:(id)a4 field:(id)a5 storageLocation:(unint64_t)a6 error:(id *)a7
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  if (objc_msgSend((id)objc_msgSend(v13, "classObj"), "conformsToProtocol:", &unk_1F2C527D0))
  {
    objc_msgSend((id)objc_msgSend(v13, "classObj"), "hmbDecodeData:fromStorageLocation:error:", v11, a6, a7);
    a7 = (id *)objc_claimAutoreleasedReturnValue();
  }
  else if (a7)
  {
    v14 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v15 = *MEMORY[0x1E4F64ED0];
    v16 = [NSString stringWithFormat:@"should conform to HMBModelObjectCoder (but storage class for property %@ does not)", v12, @"message"];
    v20[0] = v16;
    v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];
    *a7 = [v14 errorWithDomain:v15 code:3 userInfo:v17];

    a7 = 0;
  }

  return a7;
}

- (id)encodePropertyValue:(id)a3 forProperty:(id)a4 field:(id)a5 storageLocation:(unint64_t)a6 error:(id *)a7
{
  v30[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  if ([(id)objc_opt_class() conformsToProtocol:&unk_1F2C527D0])
  {
    id v26 = 0;
    id v12 = [v10 hmbEncodeForStorageLocation:a6 error:&v26];
    id v13 = v26;
    v14 = v13;
    if (v12)
    {
      id v15 = v12;
      v16 = v15;
    }
    else
    {
      if (!v13)
      {
        v14 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:11];
      }
      uint64_t v20 = [NSString stringWithFormat:@"Failed to encode value %@ for property '%@': %@", objc_opt_class(), v11, v14];
      v21 = (void *)v20;
      if (a7)
      {
        v22 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v23 = *MEMORY[0x1E4F64ED0];
        v27[0] = @"message";
        v27[1] = @"underlyingError";
        v28[0] = v20;
        v28[1] = v14;
        v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:2];
        *a7 = [v22 errorWithDomain:v23 code:3 userInfo:v24];
      }
      id v15 = 0;
      v16 = 0;
    }
    goto LABEL_11;
  }
  uint64_t v17 = [NSString stringWithFormat:@"Cannot encode value of type %@ for property '%@' because it does not conform to HMBModelObjectCoder", objc_opt_class(), v11];
  v14 = (void *)v17;
  if (a7)
  {
    v18 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v19 = *MEMORY[0x1E4F64ED0];
    v29 = @"message";
    v30[0] = v17;
    id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:&v29 count:1];
    [v18 errorWithDomain:v19 code:3 userInfo:v15];
    v16 = 0;
    *a7 = (id)objc_claimAutoreleasedReturnValue();
LABEL_11:

    goto LABEL_12;
  }
  v16 = 0;
LABEL_12:

  return v16;
}

- (Class)_modelClassFromDictionary:(id)a3 typeName:(id)a4 error:(id *)a5
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v9 = (NSString *)a4;
  id v10 = objc_msgSend(v8, "hmf_stringForKey:", @"_i");
  if (v10)
  {
    id v11 = (NSString *)[objc_alloc(MEMORY[0x1E4F65590]) initWithVersionString:v10];
    id v12 = [(HMBModelContainer *)self dataVersion];
    int v13 = [v12 isAtLeastVersion:v11];

    if (!v13)
    {
      v16 = (void *)MEMORY[0x1D944CB30]();
      uint64_t v17 = self;
      v18 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        uint64_t v19 = HMFGetLogIdentifier();
        uint64_t v20 = [(HMBModelContainer *)v17 dataVersion];
        *(_DWORD *)buf = 138543874;
        v45 = v19;
        __int16 v46 = 2112;
        v47 = v11;
        __int16 v48 = 2112;
        v49 = v20;
        _os_log_impl(&dword_1D4693000, v18, OS_LOG_TYPE_INFO, "%{public}@Using HMBModelUnsupported because model's minimum version %@ is higher than current version: %@", buf, 0x20u);
      }
      objc_opt_class();
      a5 = (id *)objc_claimAutoreleasedReturnValue();

      goto LABEL_25;
    }
  }
  if (!v9)
  {
    objc_msgSend(v8, "hmf_stringForKey:", @"_T");
    v9 = (NSString *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      objc_msgSend(v8, "hmf_stringForKey:", @"_t");
      v9 = (NSString *)objc_claimAutoreleasedReturnValue();
      if (!v9)
      {
        if (a5)
        {
          *a5 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:8];
        }
        v38 = (void *)MEMORY[0x1D944CB30]();
        v39 = self;
        v40 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
        {
          v41 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v45 = v41;
          __int16 v46 = 2112;
          v47 = (NSString *)v8;
          _os_log_impl(&dword_1D4693000, v40, OS_LOG_TYPE_ERROR, "%{public}@Cannot find type information in model dictionary: %@", buf, 0x16u);
        }
        v9 = 0;
        goto LABEL_16;
      }
    }
  }
  v14 = [(HMBModelContainer *)self modelClassForTypeName:v9];
  if (v14)
  {
    id v15 = v14;
  }
  else
  {
    v27 = (void *)MEMORY[0x1D944CB30]();
    v28 = self;
    v29 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      v30 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v45 = v30;
      __int16 v46 = 2112;
      v47 = v9;
      _os_log_impl(&dword_1D4693000, v29, OS_LOG_TYPE_INFO, "%{public}@Unable to find model class named %@", buf, 0x16u);
    }
    objc_msgSend(v8, "hmf_stringForKey:", @"_G");
    v31 = (NSString *)objc_claimAutoreleasedReturnValue();

    if (!v31 || (Class v32 = NSClassFromString(v31)) == 0)
    {
      v33 = (void *)MEMORY[0x1D944CB30]();
      v34 = v28;
      v35 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        v36 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v45 = v36;
        __int16 v46 = 2112;
        v47 = v31;
        _os_log_impl(&dword_1D4693000, v35, OS_LOG_TYPE_INFO, "%{public}@Unable to resolve type name to class: %@", buf, 0x16u);
      }
      objc_opt_class();
      a5 = (id *)objc_claimAutoreleasedReturnValue();
      v9 = v31;
      goto LABEL_25;
    }
    id v15 = v32;
    v9 = v31;
  }
  if ([(objc_class *)v15 isSubclassOfClass:objc_opt_class()])
  {
    a5 = v15;
    goto LABEL_25;
  }
  if (a5)
  {
    v21 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v22 = *MEMORY[0x1E4F64ED0];
    v42 = @"message";
    uint64_t v23 = NSString;
    v24 = NSStringFromClass(v15);
    v25 = [v23 stringWithFormat:@"remapped (or explicit map) is not a subclass of HMBModel (%@ is not a sub-class of HMBModel)", v24];
    v43 = v25;
    id v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v43 forKeys:&v42 count:1];
    *a5 = [v21 errorWithDomain:v22 code:3 userInfo:v26];

LABEL_16:
    a5 = 0;
  }
LABEL_25:

  return (Class)a5;
}

- (void)updateMirror:(id)a3
{
  id obj = a3;
  v4 = [(HMBModelContainer *)self mirror];
  if (obj)
  {
    if (!v4) {
      objc_storeWeak((id *)&self->_mirror, obj);
    }
  }
  else
  {
    v5 = (HMBModelContainer *)_HMFPreconditionFailure();
    [(HMBModelContainer *)v5 updateLocalZone:v7];
  }
}

- (void)updateLocalZone:(id)a3
{
  id obj = a3;
  v4 = [(HMBModelContainer *)self localZone];
  if (obj)
  {
    if (!v4) {
      objc_storeWeak((id *)&self->_localZone, obj);
    }
  }
  else
  {
    v5 = (HMBModelContainer *)_HMFPreconditionFailure();
    [(HMBModelContainer *)v5 schemaHashForModel:v7];
  }
}

- (id)schemaHashForModel:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [MEMORY[0x1E4F1CA48] array];
  v5 = [MEMORY[0x1E4F1CA58] data];
  SEL v6 = [(id)objc_opt_class() hmbPropertyNames];
  id v7 = [v6 allObjects];
  id v8 = [v7 sortedArrayUsingSelector:sel_compare_];
  [v4 addObjectsFromArray:v8];

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v9 = v4;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v20 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * i), "dataUsingEncoding:", 4, (void)v19);
        [v5 appendData:v14];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v11);
  }

  id v15 = (void *)MEMORY[0x1E4F29128];
  v16 = [(id)objc_opt_class() hmbSchemaHashRoot];
  uint64_t v17 = objc_msgSend(v15, "hmf_UUIDWithNamespace:data:", v16, v5);

  return v17;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  v5 = [(HMBModelContainer *)self dataVersion];
  SEL v6 = [(HMBModelContainer *)self legacyDataVersion];
  id v7 = (void *)[v4 initWithDataVersion:v5 legacyDataVersion:v6];

  if (v7)
  {
    id v8 = [(HMBModelContainer *)self classToNameTransform];
    id v9 = (void *)[v8 copy];
    [v7 setClassToNameTransform:v9];

    uint64_t v10 = [(HMBModelContainer *)self nameToClassTransform];
    uint64_t v11 = (void *)[v10 copy];
    [v7 setNameToClassTransform:v11];
  }
  return v7;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = [HMBMutableModelContainer alloc];
  v5 = [(HMBModelContainer *)self dataVersion];
  SEL v6 = [(HMBModelContainer *)self legacyDataVersion];
  id v7 = [(HMBModelContainer *)v4 initWithDataVersion:v5 legacyDataVersion:v6];

  if (v7)
  {
    id v8 = [(HMBModelContainer *)self classToNameTransform];
    id v9 = (void *)[v8 copy];
    [(HMBModelContainer *)v7 setClassToNameTransform:v9];

    uint64_t v10 = [(HMBModelContainer *)self nameToClassTransform];
    uint64_t v11 = (void *)[v10 copy];
    [(HMBModelContainer *)v7 setNameToClassTransform:v11];
  }
  return v7;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t21 != -1) {
    dispatch_once(&logCategory__hmf_once_t21, &__block_literal_global_114);
  }
  v2 = (void *)logCategory__hmf_once_v22;
  return v2;
}

uint64_t __32__HMBModelContainer_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v22;
  logCategory__hmf_once_long long v22 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

+ (id)decodeAsNSDictionary:(id)a3 error:(id *)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void *)MEMORY[0x1D944CB30]();
  id v8 = (void *)MEMORY[0x1E4F28DC0];
  id v9 = +[HMBModelContainer internalAllowedTypes];
  id v29 = 0;
  uint64_t v10 = [v8 unarchivedObjectOfClasses:v9 fromData:v6 error:&v29];
  id v11 = v29;

  if (v10)
  {
    id v12 = v10;
    objc_opt_class();
    int v13 = objc_opt_isKindOfClass() & 1;
    if (v13) {
      v14 = v12;
    }
    else {
      v14 = 0;
    }
    id v15 = v14;

    if (v13)
    {
      id v16 = v12;
    }
    else
    {
      long long v21 = (void *)MEMORY[0x1D944CB30]();
      id v22 = a1;
      uint64_t v23 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        uint64_t v24 = v28 = v21;
        v25 = objc_opt_class();
        *(_DWORD *)buf = 138543874;
        v31 = v24;
        __int16 v32 = 2112;
        id v33 = v25;
        __int16 v34 = 2112;
        id v35 = v12;
        id v26 = v25;
        _os_log_impl(&dword_1D4693000, v23, OS_LOG_TYPE_ERROR, "%{public}@Unarchived model data was not a dictionary: (%@) %@", buf, 0x20u);

        long long v21 = v28;
      }

      if (a4)
      {
        [MEMORY[0x1E4F28C58] hmfErrorWithCode:15];
        id v16 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v16 = 0;
      }
    }
  }
  else
  {
    uint64_t v17 = (void *)MEMORY[0x1D944CB30]();
    id v18 = a1;
    long long v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      long long v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      v31 = v20;
      __int16 v32 = 2112;
      id v33 = v6;
      __int16 v34 = 2112;
      id v35 = v11;
      _os_log_impl(&dword_1D4693000, v19, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive model data %@: %@", buf, 0x20u);
    }
    id v16 = 0;
    if (a4) {
      *a4 = v11;
    }
  }

  return v16;
}

+ (id)encodeAsNSDictionary:(id)a3 error:(id *)a4
{
  return (id)[MEMORY[0x1E4F28DB0] archivedDataWithRootObject:a3 requiringSecureCoding:1 error:a4];
}

+ (id)decodeAsOPACK:(id)a3 error:(id *)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void *)OPACKDecodeData();
  id v8 = v7;
  if (v7)
  {
    id v9 = v7;
    objc_opt_class();
    int v10 = objc_opt_isKindOfClass() & 1;
    if (v10) {
      id v11 = v9;
    }
    else {
      id v11 = 0;
    }
    id v12 = v11;

    if (v10)
    {
      id v13 = v9;
      goto LABEL_18;
    }
    v14 = (void *)MEMORY[0x1D944CB30]();
    id v15 = a1;
    id v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      id v26 = v17;
      __int16 v27 = 2112;
      id v28 = (id)objc_opt_class();
      __int16 v29 = 2112;
      id v30 = v9;
      id v18 = v28;
      _os_log_impl(&dword_1D4693000, v16, OS_LOG_TYPE_ERROR, "%{public}@OPACK-decoded model data was not a dictionary: (%@) %@", buf, 0x20u);
    }
    if (a4)
    {
      id v19 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:15];
LABEL_16:
      id v13 = 0;
      *a4 = v19;
      goto LABEL_18;
    }
  }
  else
  {
    id v12 = 0;
    long long v20 = (void *)MEMORY[0x1D944CB30]();
    id v21 = a1;
    id v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      uint64_t v23 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      id v26 = v23;
      __int16 v27 = 2112;
      id v28 = v6;
      __int16 v29 = 2112;
      id v30 = 0;
      _os_log_impl(&dword_1D4693000, v22, OS_LOG_TYPE_ERROR, "%{public}@Failed to OPACK decode model data %@: %@", buf, 0x20u);
    }
    if (a4)
    {
      id v19 = 0;
      id v12 = v19;
      goto LABEL_16;
    }
  }
  id v13 = 0;
LABEL_18:

  return v13;
}

+ (id)encodeAsOPACK:(id)a3 error:(id *)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void *)MEMORY[0x1D944C960]();
  if (!v7)
  {
    id v8 = (void *)MEMORY[0x1D944CB30]();
    id v9 = a1;
    int v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      v14 = v11;
      __int16 v15 = 2112;
      id v16 = v6;
      __int16 v17 = 2112;
      uint64_t v18 = 0;
      _os_log_impl(&dword_1D4693000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to OPACK encode dictionary %@: %@", buf, 0x20u);
    }
    if (a4) {
      *a4 = 0;
    }
  }
  return v7;
}

+ (NSSet)internalAllowedTypes
{
  if (internalAllowedTypes_onceToken != -1) {
    dispatch_once(&internalAllowedTypes_onceToken, &__block_literal_global_10);
  }
  v2 = (void *)internalAllowedTypes__internalAllowedTypes;
  return (NSSet *)v2;
}

void __41__HMBModelContainer_internalAllowedTypes__block_invoke()
{
  uint64_t v0 = (void *)MEMORY[0x1E4F1CAD0];
  id v4 = +[HMBModelContainer allowedTypes];
  uint64_t v1 = [v0 setWithSet:v4];
  uint64_t v2 = [v1 setByAddingObject:objc_opt_class()];
  id v3 = (void *)internalAllowedTypes__internalAllowedTypes;
  internalAllowedTypes__internalAllowedTypes = v2;
}

+ (NSSet)allowedTypes
{
  if (allowedTypes_onceToken != -1) {
    dispatch_once(&allowedTypes_onceToken, &__block_literal_global_2811);
  }
  uint64_t v2 = (void *)allowedTypes__allowedTypes;
  return (NSSet *)v2;
}

void __33__HMBModelContainer_allowedTypes__block_invoke()
{
  v4[8] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = (void *)MEMORY[0x1E4F1CAD0];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  v4[2] = objc_opt_class();
  v4[3] = objc_opt_class();
  v4[4] = objc_opt_class();
  v4[5] = objc_opt_class();
  v4[6] = objc_opt_class();
  v4[7] = objc_opt_class();
  uint64_t v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:8];
  uint64_t v2 = [v0 setWithArray:v1];
  id v3 = (void *)allowedTypes__allowedTypes;
  allowedTypes__allowedTypes = v2;
}

- (id)modelFromData:(id)a3 encoding:(unint64_t)a4 storageLocation:(unint64_t)a5 error:(id *)a6
{
  return [(HMBModelContainer *)self modelFromData:a3 encoding:a4 storageLocation:a5 type:0 error:a6];
}

- (id)modelFromData:(id)a3 encoding:(unint64_t)a4 storageLocation:(unint64_t)a5 type:(id)a6 error:(id *)a7
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a6;
  if (a4 == 2)
  {
    uint64_t v14 = +[HMBModelContainer decodeAsOPACK:v12 error:a7];
LABEL_5:
    __int16 v15 = (void *)v14;
    if (v14)
    {
      id v16 = [(HMBModelContainer *)self modelFromDictionary:v14 storageLocation:a5 typeName:v13 error:a7];

      goto LABEL_12;
    }
    goto LABEL_11;
  }
  if (a4 == 1)
  {
    uint64_t v14 = +[HMBModelContainer decodeAsNSDictionary:v12 error:a7];
    goto LABEL_5;
  }
  __int16 v17 = (void *)MEMORY[0x1D944CB30]();
  uint64_t v18 = self;
  uint64_t v19 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    long long v20 = HMFGetLogIdentifier();
    int v22 = 138543618;
    uint64_t v23 = v20;
    __int16 v24 = 2048;
    unint64_t v25 = a4;
    _os_log_impl(&dword_1D4693000, v19, OS_LOG_TYPE_ERROR, "%{public}@Cannot deserialize from unknown encoding: %lu", (uint8_t *)&v22, 0x16u);
  }
  if (a7)
  {
    [MEMORY[0x1E4F28C58] hmfErrorWithCode:3];
    id v16 = 0;
    *a7 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
LABEL_11:
  id v16 = 0;
LABEL_12:

  return v16;
}

- (id)modelFromDictionary:(id)a3 storageLocation:(unint64_t)a4 typeName:(id)a5 error:(id *)a6
{
  v46[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  id v12 = [(HMBModelContainer *)self _modelClassFromDictionary:v10 typeName:v11 error:a6];
  if (!v12)
  {
    id v16 = 0;
    goto LABEL_21;
  }
  id v13 = v12;
  uint64_t v14 = objc_msgSend(v10, "hmf_stringForKey:", @"_V");
  __int16 v15 = (void *)v14;
  if (v14)
  {
    v38 = (void *)v14;
LABEL_12:
    id v25 = objc_alloc(MEMORY[0x1E4F29128]);
    uint64_t v26 = [v10 valueForKey:@"_u"];
    uint64_t v27 = [v25 initWithUUIDString:v26];

    int v22 = (void *)v27;
    id v28 = objc_alloc(MEMORY[0x1E4F29128]);
    __int16 v29 = [v10 valueForKey:@"_P"];
    uint64_t v23 = (void *)[v28 initWithUUIDString:v29];

    id v30 = (void *)[[v13 alloc] initWithModelID:v22 parentModelID:v23];
    uint64_t v31 = [v30 populateModelWithDictionary:v10 fromStorageLocation:a4 using:self];
    if (v31)
    {
      __int16 v32 = (void *)MEMORY[0x1D944CB30]();
      id v33 = self;
      __int16 v34 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        id v35 = v37 = v22;
        *(_DWORD *)buf = 138543874;
        v40 = v35;
        __int16 v41 = 2112;
        id v42 = v10;
        __int16 v43 = 2112;
        v44 = v31;
        _os_log_impl(&dword_1D4693000, v34, OS_LOG_TYPE_ERROR, "%{public}@Failed to populate model with dictionary %@: %@", buf, 0x20u);

        int v22 = v37;
      }

      id v16 = 0;
      if (a6) {
        *a6 = v31;
      }
    }
    else
    {
      [v30 hmbAssociateWithContainer:self];
      id v16 = v30;
    }
    __int16 v15 = v38;

    goto LABEL_19;
  }
  __int16 v17 = [v10 valueForKey:@"_v"];

  if (v17)
  {
    if (v10)
    {
      uint64_t v18 = [(HMBModelContainer *)self legacyDataVersion];
      uint64_t v19 = [v18 versionString];
    }
    else
    {
      uint64_t v19 = @"0.0.0";
    }
    v38 = 0;
    __int16 v24 = (void *)[v10 mutableCopy];
    [v24 setObject:v19 forKey:@"_V"];

    id v10 = v24;
    goto LABEL_12;
  }
  if (!a6)
  {
    id v16 = 0;
    goto LABEL_20;
  }
  long long v20 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v21 = *MEMORY[0x1E4F64ED0];
  v45 = @"message";
  int v22 = [NSString stringWithFormat:@"expecting a versioning key named %@ but one does not exist", @"_v"];
  v46[0] = v22;
  uint64_t v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v46 forKeys:&v45 count:1];
  [v20 errorWithDomain:v21 code:3 userInfo:v23];
  id v16 = 0;
  *a6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_19:

LABEL_20:
LABEL_21:

  return v16;
}

- (id)dataFromModel:(id)a3 encoding:(unint64_t)a4 storageLocation:(unint64_t)a5 updatedModelIDs:(id)a6 error:(id *)a7
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a6;
  [v12 hmbAssociateWithContainer:self];
  id v28 = 0;
  uint64_t v14 = [v12 prepareForStorageLocation:a5 using:self updatedModelIDs:v13 error:&v28];
  id v15 = v28;
  if (v14)
  {
    if (a4 == 2)
    {
      uint64_t v16 = +[HMBModelContainer encodeAsOPACK:v14 error:a7];
      goto LABEL_10;
    }
    if (a4 == 1)
    {
      uint64_t v16 = +[HMBModelContainer encodeAsNSDictionary:v14 error:a7];
LABEL_10:
      int v22 = (void *)v16;
      goto LABEL_17;
    }
    uint64_t v23 = (void *)MEMORY[0x1D944CB30]();
    __int16 v24 = self;
    id v25 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      uint64_t v26 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      id v30 = v26;
      __int16 v31 = 2112;
      id v32 = v12;
      __int16 v33 = 2048;
      unint64_t v34 = a4;
      _os_log_impl(&dword_1D4693000, v25, OS_LOG_TYPE_ERROR, "%{public}@Cannot encode data from model %@ with unknown encoding: %lu", buf, 0x20u);
    }
    if (a7)
    {
      id v21 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:3];
      goto LABEL_15;
    }
  }
  else
  {
    __int16 v17 = (void *)MEMORY[0x1D944CB30]();
    uint64_t v18 = self;
    uint64_t v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      long long v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      id v30 = v20;
      __int16 v31 = 2112;
      id v32 = v12;
      __int16 v33 = 2112;
      unint64_t v34 = (unint64_t)v15;
      _os_log_impl(&dword_1D4693000, v19, OS_LOG_TYPE_ERROR, "%{public}@Failed to prepare model %@: %@", buf, 0x20u);
    }
    if (a7)
    {
      id v21 = v15;
LABEL_15:
      int v22 = 0;
      *a7 = v21;
      goto LABEL_17;
    }
  }
  int v22 = 0;
LABEL_17:

  return v22;
}

- (Class)modelClassForTypeName:(id)a3
{
  id v4 = (NSString *)a3;
  v5 = [(HMBModelContainer *)self nameToClassTransform];
  Class v6 = (Class)[v5 objectForKey:v4];

  if (!v6) {
    Class v6 = NSClassFromString(v4);
  }
  id v7 = v6;

  return v7;
}

- (id)typeNameForModelClass:(Class)a3
{
  id v4 = [(HMBModelContainer *)self classToNameTransform];
  v5 = [v4 objectForKey:a3];

  if (!v5)
  {
    v5 = NSStringFromClass(a3);
  }
  return v5;
}

- (unint64_t)bestModelEncodingForStorageLocation:(unint64_t)a3
{
  return 2;
}

- (id)unavailableVersionsForModelClass:(Class)a3
{
  p_propertyLock = &self->_propertyLock;
  os_unfair_lock_lock_with_options();
  Class v6 = [(HMBModelContainer *)self classUnavailableVersionCache];
  id v7 = [v6 objectForKey:a3];

  if (!v7)
  {
    if (([(objc_class *)a3 isSubclassOfClass:objc_opt_class()] & 1) == 0)
    {
      id result = (id)_HMFPreconditionFailure();
      __break(1u);
      return result;
    }
    id v8 = [MEMORY[0x1E4F1CA60] dictionary];
    id v9 = [(objc_class *)a3 hmbProperties];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __54__HMBModelContainer_unavailableVersionsForModelClass___block_invoke;
    v13[3] = &unk_1E69EA080;
    id v10 = v8;
    id v14 = v10;
    [v9 enumerateKeysAndObjectsUsingBlock:v13];
    id v7 = v10;
    id v11 = [(HMBModelContainer *)self classUnavailableVersionCache];
    [v11 setObject:v7 forKey:a3];
  }
  os_unfair_lock_unlock(p_propertyLock);
  return v7;
}

void __54__HMBModelContainer_unavailableVersionsForModelClass___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  Class v6 = [v5 unavailableVersion];

  if (v6)
  {
    id v7 = *(void **)(a1 + 32);
    id v8 = [v5 unavailableVersion];
    [v7 setObject:v8 forKey:v9];
  }
}

- (id)readOnlyVersionsForModelClass:(Class)a3
{
  p_propertyLock = &self->_propertyLock;
  os_unfair_lock_lock_with_options();
  Class v6 = [(HMBModelContainer *)self classReadOnlyVersionCache];
  id v7 = [v6 objectForKey:a3];

  if (!v7)
  {
    if (([(objc_class *)a3 isSubclassOfClass:objc_opt_class()] & 1) == 0)
    {
      id result = (id)_HMFPreconditionFailure();
      __break(1u);
      return result;
    }
    id v8 = [MEMORY[0x1E4F1CA60] dictionary];
    id v9 = [(objc_class *)a3 hmbProperties];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __51__HMBModelContainer_readOnlyVersionsForModelClass___block_invoke;
    v13[3] = &unk_1E69EA080;
    id v10 = v8;
    id v14 = v10;
    [v9 enumerateKeysAndObjectsUsingBlock:v13];
    id v7 = v10;
    id v11 = [(HMBModelContainer *)self classReadOnlyVersionCache];
    [v11 setObject:v7 forKey:a3];
  }
  os_unfair_lock_unlock(p_propertyLock);
  return v7;
}

void __51__HMBModelContainer_readOnlyVersionsForModelClass___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  Class v6 = [v5 readonlyVersion];

  if (v6)
  {
    id v7 = *(void **)(a1 + 32);
    id v8 = [v5 readonlyVersion];
    [v7 setObject:v8 forKey:v9];
  }
}

- (HMBModelContainer)initWithDataVersion:(id)a3 legacyDataVersion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v24.receiver = self;
  v24.super_class = (Class)HMBModelContainer;
  id v9 = [(HMBModelContainer *)&v24 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_legacyDataVersion, a4);
    objc_storeStrong((id *)&v10->_dataVersion, a3);
    uint64_t v11 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    classToNameTransform = v10->_classToNameTransform;
    v10->_classToNameTransform = (NSMapTable *)v11;

    uint64_t v13 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    nameToClassTransform = v10->_nameToClassTransform;
    v10->_nameToClassTransform = (NSMapTable *)v13;

    uint64_t v15 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    objectPropertyHashLookup = v10->_objectPropertyHashLookup;
    v10->_objectPropertyHashLookup = (NSMapTable *)v15;

    uint64_t v17 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    classReadOnlyVersionCache = v10->_classReadOnlyVersionCache;
    v10->_classReadOnlyVersionCache = (NSMapTable *)v17;

    uint64_t v19 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    classUnavailableVersionCache = v10->_classUnavailableVersionCache;
    v10->_classUnavailableVersionCache = (NSMapTable *)v19;

    uint64_t v21 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    queryFieldsCache = v10->_queryFieldsCache;
    v10->_queryFieldsCache = (NSMapTable *)v21;
  }
  return v10;
}

- (HMBModelContainer)init
{
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F65590]) initWithVersionString:@"4.0.0"];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F65590]) initWithVersionString:@"1.0.0"];
  id v5 = [(HMBModelContainer *)self initWithDataVersion:v3 legacyDataVersion:v4];

  return v5;
}

@end