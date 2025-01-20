@interface NSPersistentStore(HomeKitDaemon)
- (BOOL)hmd_modelWasDeletedWithID:()HomeKitDaemon modelIDKey:entity:duration:context:;
- (id)hmd_deletedModelIDsForEntity:()HomeKitDaemon modelIDKey:duration:context:;
- (id)hmd_tombstonesForEntity:()HomeKitDaemon duration:context:error:;
@end

@implementation NSPersistentStore(HomeKitDaemon)

- (id)hmd_tombstonesForEntity:()HomeKitDaemon duration:context:error:
{
  id v10 = a4;
  id v11 = a5;
  v12 = (void *)MEMORY[0x230FBD990]();
  id v24 = 0;
  v13 = -[NSPersistentStore _deleteChangesWithDuration:entity:context:error:](a1, v10, v11, (uint64_t)&v24, a2);
  id v14 = v24;
  if (v13)
  {
    v15 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v13, "count"));
    uint64_t v19 = MEMORY[0x263EF8330];
    uint64_t v20 = 3221225472;
    v21 = __83__NSPersistentStore_HomeKitDaemon__hmd_tombstonesForEntity_duration_context_error___block_invoke;
    v22 = &unk_264A1B180;
    id v16 = v15;
    id v23 = v16;
    objc_msgSend(v13, "hmf_enumerateWithAutoreleasePoolUsingBlock:", &v19);
  }
  else
  {
    id v16 = 0;
  }

  if (a6) {
    *a6 = v14;
  }
  v17 = objc_msgSend(v16, "copy", v19, v20, v21, v22);

  return v17;
}

- (id)hmd_deletedModelIDsForEntity:()HomeKitDaemon modelIDKey:duration:context:
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v13 = (void *)MEMORY[0x230FBD990]();
  id v27 = 0;
  id v14 = -[NSPersistentStore _deleteChangesWithDuration:entity:context:error:]((uint64_t)a1, v10, v12, (uint64_t)&v27, a2);
  id v15 = v27;
  if (v14)
  {
    id v16 = objc_msgSend(MEMORY[0x263EFF9C0], "setWithCapacity:", objc_msgSend(v14, "count"));
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __93__NSPersistentStore_HomeKitDaemon__hmd_deletedModelIDsForEntity_modelIDKey_duration_context___block_invoke;
    v24[3] = &unk_264A283C0;
    id v25 = v11;
    id v17 = v16;
    id v26 = v17;
    objc_msgSend(v14, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v24);

    v18 = (void *)[v17 copy];
  }
  else
  {
    uint64_t v19 = (void *)MEMORY[0x230FBD990]();
    id v20 = a1;
    v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v22 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v29 = v22;
      __int16 v30 = 2112;
      id v31 = v15;
      _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_ERROR, "%{public}@Deletion history request failed: %@", buf, 0x16u);
    }

    v18 = 0;
  }

  return v18;
}

- (BOOL)hmd_modelWasDeletedWithID:()HomeKitDaemon modelIDKey:entity:duration:context:
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x2020000000;
  char v35 = 0;
  id v16 = (void *)MEMORY[0x230FBD990]();
  id v31 = 0;
  id v17 = -[NSPersistentStore _deleteChangesWithDuration:entity:context:error:]((uint64_t)a1, v14, v15, (uint64_t)&v31, a2);
  id v18 = v31;
  if (v17)
  {
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __97__NSPersistentStore_HomeKitDaemon__hmd_modelWasDeletedWithID_modelIDKey_entity_duration_context___block_invoke;
    v27[3] = &unk_264A1B158;
    id v28 = v13;
    id v29 = v12;
    __int16 v30 = &v32;
    objc_msgSend(v17, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v27);
  }
  else
  {
    context = (void *)MEMORY[0x230FBD990]();
    id v19 = a1;
    HMFGetOSLogHandle();
    id v20 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      id v25 = v16;
      HMFGetLogIdentifier();
      id v21 = (id)objc_claimAutoreleasedReturnValue();
      v22 = [v14 name];
      *(_DWORD *)buf = 138544130;
      id v37 = v21;
      __int16 v38 = 2112;
      v39 = v22;
      __int16 v40 = 2112;
      id v41 = v12;
      __int16 v42 = 2112;
      id v43 = v18;
      _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_ERROR, "%{public}@Couldn't determine if <%@: %@> was previously deleted: %@", buf, 0x2Au);

      id v16 = v25;
    }
  }

  if (v17) {
    BOOL v23 = *((unsigned char *)v33 + 24) != 0;
  }
  else {
    BOOL v23 = 0;
  }
  _Block_object_dispose(&v32, 8);

  return v23;
}

@end