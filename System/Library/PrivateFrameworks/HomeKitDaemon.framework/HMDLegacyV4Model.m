@interface HMDLegacyV4Model
+ (Class)hmbModelClassForHMDModelClass:(Class)a3;
+ (id)createWithLegacyRecord:(id)a3 modelContainer:(id)a4 error:(id *)a5;
+ (id)hmbProperties;
- (id)convertToHMDModelObject;
- (id)encodeWithExistingRecord:(id)a3 cloudZone:(id)a4 modelContainer:(id)a5 error:(id *)a6;
- (id)hmbType;
@end

@implementation HMDLegacyV4Model

- (id)convertToHMDModelObject
{
  os_unfair_lock_lock_with_options();
  v3 = [(id)__propertiesMap objectForKey:objc_opt_class()];
  os_unfair_lock_unlock((os_unfair_lock_t)&lock);
  if (!v3)
  {
    v15 = (_Unwind_Exception *)_HMFPreconditionFailure();
    os_unfair_lock_unlock((os_unfair_lock_t)&lock);
    _Unwind_Resume(v15);
  }
  v4 = [(HMBModel *)self hmbParentModelID];
  v5 = objc_msgSend(MEMORY[0x263F08C38], "hmf_zeroUUID");
  if (objc_msgSend(v4, "hmf_isEqualToUUID:", v5))
  {
    v6 = 0;
  }
  else
  {
    v6 = [(HMBModel *)self hmbParentModelID];
  }

  id v7 = objc_alloc((Class)[v3 hmdModelClass]);
  v8 = [(HMBModel *)self hmbModelID];
  v9 = (void *)[v7 initWithUUID:v8 parentUUID:v6];

  v10 = [(HMBModel *)self hmbReserved];
  uint64_t v11 = [v10 mutableCopy];
  v12 = (void *)v9[1];
  v9[1] = v11;

  v13 = +[HMDHomeKitVersion currentVersion];
  [v9 setBsoDataVersion:v13];

  return v9;
}

- (id)encodeWithExistingRecord:(id)a3 cloudZone:(id)a4 modelContainer:(id)a5 error:(id *)a6
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v35 = 0;
  if (a6) {
    v13 = a6;
  }
  else {
    v13 = (id *)&v35;
  }
  id v14 = v11;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v15 = v14;
  }
  else {
    v15 = 0;
  }
  id v16 = v15;

  if (!v16) {
    _HMFPreconditionFailure();
  }
  v17 = [(HMDLegacyV4Model *)self convertToHMDModelObject];
  v18 = [v17 encodeWithEncoding:1 for:1 error:v13];
  if (v18)
  {
    v19 = [(HMBModel *)self hmbParentModelID];
    v20 = [v16 recordWithExistingRecord:v10 modelData:v18 parentModelID:v19 modelContainer:v12 error:v13];

    if (v20)
    {
      id v21 = v20;
    }
    else
    {
      context = (void *)MEMORY[0x230FBD990]();
      v27 = self;
      v28 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        uint64_t v29 = HMFGetLogIdentifier();
        id v30 = *v13;
        *(_DWORD *)buf = 138543618;
        uint64_t v37 = v29;
        v31 = (void *)v29;
        __int16 v38 = 2112;
        id v39 = v30;
        _os_log_impl(&dword_22F52A000, v28, OS_LOG_TYPE_ERROR, "%{public}@Unable to create CKRecord for encapsulated legacy record: %@", buf, 0x16u);
      }
    }
  }
  else
  {
    v22 = (void *)MEMORY[0x230FBD990]();
    v23 = self;
    v24 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v25 = contexta = v22;
      id v26 = *v13;
      *(_DWORD *)buf = 138543618;
      uint64_t v37 = (uint64_t)v25;
      __int16 v38 = 2112;
      id v39 = v26;
      _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_ERROR, "%{public}@Unable to encode model for cloud record: %@", buf, 0x16u);

      v22 = contexta;
    }

    v20 = 0;
  }

  return v20;
}

- (id)hmbType
{
  os_unfair_lock_lock_with_options();
  v2 = [(id)__propertiesMap objectForKey:objc_opt_class()];
  v3 = v2;
  if (v2)
  {
    v4 = [v2 hmdTypeName];

    os_unfair_lock_unlock((os_unfair_lock_t)&lock);
    return v4;
  }
  else
  {
    id result = (id)_HMFPreconditionFailure();
    __break(1u);
  }
  return result;
}

+ (id)createWithLegacyRecord:(id)a3 modelContainer:(id)a4 error:(id *)a5
{
  uint64_t v77 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  uint64_t v70 = 0;
  if (a5) {
    id v10 = a5;
  }
  else {
    id v10 = (id *)&v70;
  }
  id v11 = v9;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v12 = v11;
  }
  else {
    id v12 = 0;
  }
  id v13 = v12;

  if (!v13) {
    _HMFPreconditionFailure();
  }
  id v14 = [v8 recordType];
  char v15 = [v14 isEqual:@"ObjectRecord"];

  if (v15)
  {
    id v16 = [v8 objectForKey:@"k00"];
    if (v16)
    {
      v17 = (void *)MEMORY[0x263F08928];
      v18 = [MEMORY[0x263F492B0] allowedTypes];
      v19 = [v17 unarchivedObjectOfClasses:v18 fromData:v16 error:v10];

      if (v19)
      {
        id v20 = v19;
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();
        if (isKindOfClass) {
          v22 = v20;
        }
        else {
          v22 = 0;
        }
        id v69 = v22;

        if (isKindOfClass)
        {
          objc_msgSend(v20, "hmf_numberForKey:", *MEMORY[0x263F49368]);
          id v23 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          id v23 = v20;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          id v39 = v23;
        }
        else {
          id v39 = 0;
        }
        id v40 = v39;

        v68 = v40;
        if ([v40 unsignedIntegerValue] == 1)
        {
          v41 = objc_msgSend(NSString, "stringWithFormat:", @"k%02lu", 1);
          v64 = [v8 objectForKey:v41];
          v42 = objc_msgSend(v13, "decryptData:decompress:error:");
          id v43 = 0;
          v63 = v43;
          if (v43)
          {
            id v44 = v43;
            v62 = v41;
            v66 = v19;
            v45 = (void *)MEMORY[0x230FBD990]();
            id v46 = a1;
            v47 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
            {
              v61 = HMFGetLogIdentifier();
              v48 = (objc_class *)objc_opt_class();
              NSStringFromClass(v48);
              v49 = v60 = v45;
              *(_DWORD *)buf = 138543874;
              v72 = v61;
              __int16 v73 = 2112;
              v74 = v49;
              __int16 v75 = 2112;
              id v76 = v44;
              _os_log_impl(&dword_22F52A000, v47, OS_LOG_TYPE_DEFAULT, "%{public}@%@ unable to decrypt model data (will try decoding it unencrypted): %@", buf, 0x20u);

              v45 = v60;
            }

            v50 = v64;
            id v51 = v64;

            v42 = v51;
            v19 = v66;
            v41 = v62;
          }
          else
          {
            v50 = v64;
          }
          v58 = +[HMDBackingStoreModelObject objectFromData:v42 encoding:1 error:v10];
          uint64_t v29 = [v58 convertToLegacyV4];
          [v29 hmbAssociateWithContainer:v13];
        }
        else
        {
          v52 = (void *)MEMORY[0x230FBD990]();
          id v53 = a1;
          v54 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v55 = v65 = v52;
            v56 = (objc_class *)objc_opt_class();
            NSStringFromClass(v56);
            v57 = v67 = v19;
            *(_DWORD *)buf = 138543874;
            v72 = v55;
            __int16 v73 = 2112;
            v74 = v57;
            __int16 v75 = 2112;
            id v76 = v20;
            _os_log_impl(&dword_22F52A000, v54, OS_LOG_TYPE_ERROR, "%{public}@%@ Unexpected encoding: %@", buf, 0x20u);

            v19 = v67;
            v52 = v65;
          }

          [MEMORY[0x263F087E8] hmfErrorWithCode:15];
          uint64_t v29 = 0;
          id *v10 = (id)objc_claimAutoreleasedReturnValue();
        }
      }
      else
      {
        v34 = (void *)MEMORY[0x230FBD990]();
        id v35 = a1;
        v36 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        {
          uint64_t v37 = HMFGetLogIdentifier();
          id v38 = *v10;
          *(_DWORD *)buf = 138543874;
          v72 = v37;
          __int16 v73 = 2112;
          v74 = v16;
          __int16 v75 = 2112;
          id v76 = v38;
          _os_log_impl(&dword_22F52A000, v36, OS_LOG_TYPE_ERROR, "%{public}@NSKeyedUnarchiver failed to unarchive metadata %@: %@", buf, 0x20u);
        }
        if (*v10)
        {
          uint64_t v29 = 0;
        }
        else
        {
          [MEMORY[0x263F087E8] hmfErrorWithCode:15];
          uint64_t v29 = 0;
          id *v10 = (id)objc_claimAutoreleasedReturnValue();
        }
      }
    }
    else
    {
      id v30 = (void *)MEMORY[0x230FBD990]();
      id v31 = a1;
      v32 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        v33 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v72 = v33;
        _os_log_impl(&dword_22F52A000, v32, OS_LOG_TYPE_ERROR, "%{public}@Unexpectedly nil recordMetadata.", buf, 0xCu);
      }
      [MEMORY[0x263F087E8] hmfErrorWithCode:15];
      uint64_t v29 = 0;
      id *v10 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v24 = (void *)MEMORY[0x230FBD990]();
    id v25 = a1;
    id v26 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      v27 = HMFGetLogIdentifier();
      v28 = [v8 recordType];
      *(_DWORD *)buf = 138543618;
      v72 = v27;
      __int16 v73 = 2112;
      v74 = v28;
      _os_log_impl(&dword_22F52A000, v26, OS_LOG_TYPE_ERROR, "%{public}@Unexpected legacy record type: %@", buf, 0x16u);
    }
    [MEMORY[0x263F087E8] hmfErrorWithCode:15];
    uint64_t v29 = 0;
    id *v10 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v29;
}

+ (id)hmbProperties
{
  os_unfair_lock_lock_with_options();
  v2 = [(id)__propertiesMap objectForKey:objc_opt_class()];
  v3 = v2;
  if (v2)
  {
    v4 = [v2 properties];

    os_unfair_lock_unlock((os_unfair_lock_t)&lock);
    return v4;
  }
  else
  {
    id result = (id)_HMFPreconditionFailure();
    __break(1u);
  }
  return result;
}

+ (Class)hmbModelClassForHMDModelClass:(Class)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  if (hmbModelClassForHMDModelClass__onceToken != -1) {
    dispatch_once(&hmbModelClassForHMDModelClass__onceToken, &__block_literal_global_16928);
  }
  os_unfair_lock_lock_with_options();
  if (!a3)
  {
    _HMFPreconditionFailure();
    __break(1u);
  }
  v5 = (void *)[(id)__classMap objectForKey:a3];
  if (v5)
  {
    v6 = v5;
  }
  else
  {
    id v7 = NSString;
    id v8 = NSStringFromClass(a3);
    id v9 = [v7 stringWithFormat:@"%@%@", @"WRAP_", v8];

    id v10 = (objc_class *)objc_opt_class();
    id v11 = v9;
    ClassPair = objc_allocateClassPair(v10, (const char *)[v11 UTF8String], 0);
    objc_registerClassPair(ClassPair);
    id v13 = (void *)MEMORY[0x230FBD990]();
    id v14 = a1;
    HMFGetOSLogHandle();
    char v15 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v20 = v16;
      __int16 v21 = 2112;
      v22 = ClassPair;
      _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@Created Legacy wrapper class: %@", buf, 0x16u);
    }
    v17 = [[HMDLegacyV4ModelInfo alloc] initWithClass:a3];
    [(id)__propertiesMap setObject:v17 forKey:ClassPair];
    [(id)__classMap setObject:ClassPair forKey:a3];
    v6 = ClassPair;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&lock);
  return v6;
}

void __50__HMDLegacyV4Model_hmbModelClassForHMDModelClass___block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08968] strongToStrongObjectsMapTable];
  v1 = (void *)__classMap;
  __classMap = v0;

  uint64_t v2 = [MEMORY[0x263F08968] strongToStrongObjectsMapTable];
  v3 = (void *)__propertiesMap;
  __propertiesMap = v2;
}

@end