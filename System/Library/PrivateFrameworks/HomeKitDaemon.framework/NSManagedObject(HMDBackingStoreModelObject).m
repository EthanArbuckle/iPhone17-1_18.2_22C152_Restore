@interface NSManagedObject(HMDBackingStoreModelObject)
- (id)hmd_lastKnownValueForKey:()HMDBackingStoreModelObject;
- (id)hmd_modelID;
- (id)hmd_modelsWithChangeType:()HMDBackingStoreModelObject detached:createManagedObject:error:;
- (id)hmd_parentModelID;
- (uint64_t)hmd_modelsWithChangeType:()HMDBackingStoreModelObject detached:error:;
@end

@implementation NSManagedObject(HMDBackingStoreModelObject)

- (id)hmd_modelsWithChangeType:()HMDBackingStoreModelObject detached:createManagedObject:error:
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  uint64_t v11 = objc_opt_class();
  if ((HMDManagedObjectClassIsBSORepresentable(v11) & 1) == 0) {
    _HMFPreconditionFailure();
  }
  v12 = objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "cd_modelClass")), "initWithManagedObject:changeType:detached:error:", a1, a3, a4, a6);
  if ((a5 & 1) == 0)
  {
    v13 = (void *)MEMORY[0x230FBD990]();
    id v14 = a1;
    v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v16 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v21 = v16;
      _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_INFO, "%{public}@Since this managed object was created without a managed object context setting model.managedObject to nil", buf, 0xCu);
    }
    [v12 setManagedObject:0];
  }
  if (v12)
  {
    v19 = v12;
    v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v19 count:1];
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (uint64_t)hmd_modelsWithChangeType:()HMDBackingStoreModelObject detached:error:
{
  return objc_msgSend(a1, "hmd_modelsWithChangeType:detached:createManagedObject:error:", a3, a4, 1, a5);
}

- (id)hmd_parentModelID
{
  uint64_t v2 = objc_opt_class();
  if (HMDManagedObjectClassIsBSORepresentable(v2))
  {
    v3 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "cd_modelClass"), "cd_parentReferenceName");
    if (v3)
    {
      v4 = objc_msgSend(a1, "hmd_lastKnownValueForKey:", v3);
      v5 = objc_msgSend(v4, "hmd_modelID");
    }
    else
    {
      v5 = objc_msgSend(MEMORY[0x263F08C38], "hmf_zeroUUID");
    }

    return v5;
  }
  else
  {
    uint64_t v7 = _HMFPreconditionFailure();
    return (id)-[NSManagedObject(HMDBackingStoreModelObject) hmd_modelID](v7);
  }
}

- (id)hmd_modelID
{
  uint64_t v2 = objc_opt_class();
  if (HMDManagedObjectClassIsBSORepresentable(v2))
  {
    id v3 = a1;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v4 = v3;
    }
    else {
      v4 = 0;
    }
    id v5 = v4;

    v6 = objc_msgSend(v5, "hmd_lastKnownValueForKey:", @"modelID");

    return v6;
  }
  else
  {
    uint64_t v8 = _HMFPreconditionFailure();
    return (id)-[NSManagedObject(HMDBackingStoreModelObject) hmd_lastKnownValueForKey:](v8);
  }
}

- (id)hmd_lastKnownValueForKey:()HMDBackingStoreModelObject
{
  v12[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([a1 isDeleted])
  {
    v12[0] = v4;
    id v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:1];
    v6 = [a1 committedValuesForKeys:v5];
    id v7 = [v6 objectForKeyedSubscript:v4];
    uint64_t v8 = v7;
    if ((id)*MEMORY[0x263EFFD08] == v7) {
      v9 = 0;
    }
    else {
      v9 = v7;
    }
    id v10 = v9;
  }
  else
  {
    id v10 = [a1 valueForKey:v4];
  }

  return v10;
}

@end