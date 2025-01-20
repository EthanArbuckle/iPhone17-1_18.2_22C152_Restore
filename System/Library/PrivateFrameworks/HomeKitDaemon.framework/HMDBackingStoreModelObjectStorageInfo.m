@interface HMDBackingStoreModelObjectStorageInfo
+ (id)deprecatedField;
+ (id)infoWithClass:(Class)a3;
+ (id)infoWithClass:(Class)a3 additionalDecodeClasses:(id)a4;
+ (id)infoWithClass:(Class)a3 defaultValue:(id)a4;
+ (id)infoWithClass:(Class)a3 defaultValue:(id)a4 logging:(unint64_t)a5;
+ (id)infoWithClass:(Class)a3 defaultValue:(id)a4 logging:(unint64_t)a5 readOnly:(id)a6;
+ (id)infoWithClass:(Class)a3 defaultValue:(id)a4 logging:(unint64_t)a5 readOnly:(id)a6 unavailable:(id)a7;
+ (id)infoWithClass:(Class)a3 logging:(unint64_t)a4;
+ (id)infoWithClass:(Class)a3 logging:(unint64_t)a4 readOnly:(id)a5;
+ (id)infoWithClass:(Class)a3 logging:(unint64_t)a4 readOnly:(id)a5 unavailable:(id)a6;
- (BOOL)defaultValueSet;
- (Class)classObj;
- (HMDBackingStoreModelObjectStorageInfo)initWithClass:(Class)a3 logging:(unint64_t)a4 readOnly:(id)a5 unavailable:(id)a6 defaultSet:(BOOL)a7 defaultValue:(id)a8 additonalDecodeClasses:(id)a9;
- (HMFVersion)readOnly;
- (HMFVersion)unavailable;
- (NSSet)decodeClasses;
- (id)defaultValue;
- (id)description;
- (unint64_t)logging;
- (void)setReadOnly:(id)a3;
- (void)setUnavailable:(id)a3;
@end

@implementation HMDBackingStoreModelObjectStorageInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_decodeClasses, 0);
  objc_storeStrong(&self->_defaultValue, 0);
  objc_storeStrong((id *)&self->_unavailable, 0);
  objc_storeStrong((id *)&self->_readOnly, 0);
  objc_storeStrong((id *)&self->_classObj, 0);
}

- (NSSet)decodeClasses
{
  return self->_decodeClasses;
}

- (BOOL)defaultValueSet
{
  return self->_defaultValueSet;
}

- (id)defaultValue
{
  return self->_defaultValue;
}

- (void)setUnavailable:(id)a3
{
}

- (HMFVersion)unavailable
{
  return self->_unavailable;
}

- (void)setReadOnly:(id)a3
{
}

- (HMFVersion)readOnly
{
  return self->_readOnly;
}

- (unint64_t)logging
{
  return self->_logging;
}

- (Class)classObj
{
  return self->_classObj;
}

- (id)description
{
  BOOL v3 = [(HMDBackingStoreModelObjectStorageInfo *)self defaultValueSet];
  v4 = NSString;
  v5 = NSStringFromClass([(HMDBackingStoreModelObjectStorageInfo *)self classObj]);
  unint64_t v6 = [(HMDBackingStoreModelObjectStorageInfo *)self logging];
  v7 = [(HMDBackingStoreModelObjectStorageInfo *)self readOnly];
  uint64_t v8 = [(HMDBackingStoreModelObjectStorageInfo *)self unavailable];
  v9 = (void *)v8;
  if (v3)
  {
    v10 = [(HMDBackingStoreModelObjectStorageInfo *)self defaultValue];
    v11 = [v4 stringWithFormat:@"<HMDBackingStoreModelObjectStorageInfo class: %@  logging: %lu  readOnly: %@ unavailable: %@ defaultValue:%@>", v5, v6, v7, v9, v10];
  }
  else
  {
    v11 = [v4 stringWithFormat:@"<HMDBackingStoreModelObjectStorageInfo class: %@  logging: %lu  readOnly: %@  unavailable: %@>", v5, v6, v7, v8];
  }

  return v11;
}

- (HMDBackingStoreModelObjectStorageInfo)initWithClass:(Class)a3 logging:(unint64_t)a4 readOnly:(id)a5 unavailable:(id)a6 defaultSet:(BOOL)a7 defaultValue:(id)a8 additonalDecodeClasses:(id)a9
{
  BOOL v10 = a7;
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v16 = a5;
  id v38 = a6;
  id v17 = a8;
  id v18 = a9;
  v42.receiver = self;
  v42.super_class = (Class)HMDBackingStoreModelObjectStorageInfo;
  v19 = [(HMDBackingStoreModelObjectStorageInfo *)&v42 init];
  v20 = v19;
  if (!v19)
  {
    v27 = 0;
    v23 = v17;
    goto LABEL_16;
  }
  id v36 = v16;
  objc_storeStrong((id *)&v19->_classObj, a3);
  +[HMDBackingStore deeplyProblematicObjectTypes];
  v21 = v37 = v18;
  v39[0] = MEMORY[0x263EF8330];
  v39[1] = 3221225472;
  v39[2] = __131__HMDBackingStoreModelObjectStorageInfo_initWithClass_logging_readOnly_unavailable_defaultSet_defaultValue_additonalDecodeClasses___block_invoke;
  v39[3] = &unk_264A17D80;
  Class v41 = a3;
  v22 = v20;
  v40 = v22;
  objc_msgSend(v21, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v39);

  id v18 = v37;
  v22[3] = (id)a4;
  objc_storeStrong(v22 + 4, a5);
  objc_storeStrong(v22 + 5, a6);
  *((unsigned char *)v22 + 8) = v10;
  objc_storeStrong(v22 + 6, a8);
  if (v37)
  {
    if ([(objc_class *)a3 isSubclassOfClass:objc_opt_class()])
    {
      v23 = v17;
      if ([v37 count])
      {
        objc_msgSend(v37, "hmf_enumerateWithAutoreleasePoolUsingBlock:", &__block_literal_global_22452);
        id v24 = [MEMORY[0x263EFF980] arrayWithObject:a3];
        [v24 addObjectsFromArray:v37];
        uint64_t v25 = [MEMORY[0x263EFFA08] setWithArray:v24];
        id v26 = v22[7];
        v22[7] = (id)v25;

        goto LABEL_8;
      }
    }
    else
    {
      _HMFPreconditionFailure();
    }
    _HMFPreconditionFailure();
  }
  id v24 = v22[7];
  v22[7] = 0;
  v23 = v17;
LABEL_8:

  if (v23 && v10 && (objc_opt_isKindOfClass() & 1) == 0)
  {
    v28 = (void *)MEMORY[0x230FBD990]();
    v29 = v22;
    v30 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      v31 = HMFGetLogIdentifier();
      v32 = (objc_class *)objc_opt_class();
      v33 = NSStringFromClass(v32);
      v34 = NSStringFromClass(a3);
      *(_DWORD *)buf = 138544130;
      v44 = v31;
      __int16 v45 = 2112;
      v46 = v23;
      __int16 v47 = 2112;
      v48 = v33;
      __int16 v49 = 2112;
      v50 = v34;
      _os_log_impl(&dword_22F52A000, v30, OS_LOG_TYPE_ERROR, "%{public}@Unable to create a Storage Info with a default value %@ of type %@ when the stored type is %@", buf, 0x2Au);

      id v18 = v37;
    }

    v27 = 0;
  }
  else
  {
    v27 = v22;
  }

  id v16 = v36;
LABEL_16:

  return v27;
}

void __131__HMDBackingStoreModelObjectStorageInfo_initWithClass_logging_readOnly_unavailable_defaultSet_defaultValue_additonalDecodeClasses___block_invoke(uint64_t a1, objc_class *a2, unsigned char *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (objc_opt_isKindOfClass())
  {
    unint64_t v6 = (void *)MEMORY[0x230FBD990]();
    id v7 = *(id *)(a1 + 32);
    uint64_t v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = HMFGetLogIdentifier();
      BOOL v10 = NSStringFromClass(a2);
      int v11 = 138543618;
      v12 = v9;
      __int16 v13 = 2112;
      v14 = v10;
      _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_ERROR, "%{public}@Encoding top level type of %@ will fail in the future.", (uint8_t *)&v11, 0x16u);
    }
    *a3 = 1;
  }
}

id __131__HMDBackingStoreModelObjectStorageInfo_initWithClass_logging_readOnly_unavailable_defaultSet_defaultValue_additonalDecodeClasses___block_invoke_7(uint64_t a1, void *a2)
{
  BOOL v3 = +[HMDBackingStore allowedTypes];
  if ([v3 containsObject:a2])
  {
  }
  else
  {
    char v4 = [a2 isSubclassOfClass:objc_opt_class()];

    if ((v4 & 1) == 0)
    {
LABEL_7:
      unint64_t v6 = (void *)_HMFPreconditionFailure();
      return +[HMDBackingStoreModelObjectStorageInfo deprecatedField];
    }
  }
  if (([a2 isSubclassOfClass:objc_opt_class()] & 1) != 0
    || (id result = (id)[a2 isSubclassOfClass:objc_opt_class()], result))
  {
    _HMFPreconditionFailure();
    goto LABEL_7;
  }
  return result;
}

+ (id)deprecatedField
{
  v2 = [[HMDBackingStoreModelObjectStorageInfo alloc] initWithClass:objc_opt_class() logging:0 readOnly:0 unavailable:0 defaultSet:0 defaultValue:0 additonalDecodeClasses:0];
  return v2;
}

+ (id)infoWithClass:(Class)a3 additionalDecodeClasses:(id)a4
{
  id v5 = a4;
  unint64_t v6 = [[HMDBackingStoreModelObjectStorageInfo alloc] initWithClass:a3 logging:1 readOnly:0 unavailable:0 defaultSet:0 defaultValue:0 additonalDecodeClasses:v5];

  return v6;
}

+ (id)infoWithClass:(Class)a3 defaultValue:(id)a4 logging:(unint64_t)a5 readOnly:(id)a6 unavailable:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  id v13 = a4;
  v14 = [[HMDBackingStoreModelObjectStorageInfo alloc] initWithClass:a3 logging:a5 readOnly:v12 unavailable:v11 defaultSet:1 defaultValue:v13 additonalDecodeClasses:0];

  return v14;
}

+ (id)infoWithClass:(Class)a3 defaultValue:(id)a4 logging:(unint64_t)a5 readOnly:(id)a6
{
  id v9 = a6;
  id v10 = a4;
  id v11 = [[HMDBackingStoreModelObjectStorageInfo alloc] initWithClass:a3 logging:a5 readOnly:v9 unavailable:0 defaultSet:1 defaultValue:v10 additonalDecodeClasses:0];

  return v11;
}

+ (id)infoWithClass:(Class)a3 defaultValue:(id)a4 logging:(unint64_t)a5
{
  id v7 = a4;
  uint64_t v8 = [[HMDBackingStoreModelObjectStorageInfo alloc] initWithClass:a3 logging:a5 readOnly:0 unavailable:0 defaultSet:1 defaultValue:v7 additonalDecodeClasses:0];

  return v8;
}

+ (id)infoWithClass:(Class)a3 defaultValue:(id)a4
{
  id v5 = a4;
  unint64_t v6 = [[HMDBackingStoreModelObjectStorageInfo alloc] initWithClass:a3 logging:1 readOnly:0 unavailable:0 defaultSet:1 defaultValue:v5 additonalDecodeClasses:0];

  return v6;
}

+ (id)infoWithClass:(Class)a3 logging:(unint64_t)a4 readOnly:(id)a5 unavailable:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = [[HMDBackingStoreModelObjectStorageInfo alloc] initWithClass:a3 logging:a4 readOnly:v10 unavailable:v9 defaultSet:0 defaultValue:0 additonalDecodeClasses:0];

  return v11;
}

+ (id)infoWithClass:(Class)a3 logging:(unint64_t)a4 readOnly:(id)a5
{
  id v7 = a5;
  uint64_t v8 = [[HMDBackingStoreModelObjectStorageInfo alloc] initWithClass:a3 logging:a4 readOnly:v7 unavailable:0 defaultSet:0 defaultValue:0 additonalDecodeClasses:0];

  return v8;
}

+ (id)infoWithClass:(Class)a3 logging:(unint64_t)a4
{
  char v4 = [[HMDBackingStoreModelObjectStorageInfo alloc] initWithClass:a3 logging:a4 readOnly:0 unavailable:0 defaultSet:0 defaultValue:0 additonalDecodeClasses:0];
  return v4;
}

+ (id)infoWithClass:(Class)a3
{
  BOOL v3 = [[HMDBackingStoreModelObjectStorageInfo alloc] initWithClass:a3 logging:1 readOnly:0 unavailable:0 defaultSet:0 defaultValue:0 additonalDecodeClasses:0];
  return v3;
}

@end