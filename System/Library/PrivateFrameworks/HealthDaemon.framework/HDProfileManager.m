@interface HDProfileManager
- (BOOL)deleteAllProfilesOfType:(int64_t)a3 error:(id *)a4;
- (BOOL)deleteProfile:(id)a3 error:(id *)a4;
- (BOOL)profileExistsForIdentifier:(id)a3 error:(id *)a4;
- (HDProfileManager)initWithDaemon:(id)a3;
- (id)_createProfileOfType:(void *)a3 UUID:(void *)a4 name:(void *)a5 lastName:(void *)a6 error:;
- (id)allProfileIdentifiers;
- (id)createProfileForIdentifier:(id)a3 firstName:(id)a4 lastName:(id)a5 error:(id *)a6;
- (id)createProfileOfType:(int64_t)a3 displayName:(id)a4 error:(id *)a5;
- (id)newProfileWithIdentifier:(id)a3 daemon:(id)a4 directoryPath:(id)a5;
- (id)profileAssociatedWithNRDeviceUUID:(id)a3;
- (id)profileForIdentifier:(id)a3;
- (id)profileIdentifierForUUID:(id)a3;
- (void)_loadSecondaryProfiles;
- (void)_lock_addProfile:(int)a3 dispatchChangeNotification:;
- (void)addProfile:(id)a3;
- (void)addProfileManagerObserver:(id)a3;
- (void)addProfileManagerObserver:(id)a3 queue:(id)a4;
- (void)dispatchProfileListDidChange;
- (void)invalidateAndWaitWithReason:(id)a3;
- (void)removeProfileManagerObserver:(id)a3;
- (void)unitTest_reloadSecondaryProfiles;
@end

@implementation HDProfileManager

- (id)profileForIdentifier:(id)a3
{
  if (a3)
  {
    p_profilesLock = &self->_profilesLock;
    id v5 = a3;
    os_unfair_lock_lock(p_profilesLock);
    v6 = [(NSMutableDictionary *)self->_profiles objectForKey:v5];

    os_unfair_lock_unlock(p_profilesLock);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (HDProfileManager)initWithDaemon:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HDProfileManager;
  id v5 = [(HDProfileManager *)&v15 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_daemon, v4);
    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    profiles = v6->_profiles;
    v6->_profiles = v7;

    id v9 = objc_alloc(MEMORY[0x1E4F2B2D0]);
    v10 = HKLogInfrastructure();
    uint64_t v11 = [v9 initWithName:@"HDProfileManagerObservers" loggingCategory:v10];
    observers = v6->_observers;
    v6->_observers = (HDProfileManagerObserver *)v11;

    v6->_profilesLock._os_unfair_lock_opaque = 0;
    v14 = v6;
    HKDispatchAsyncOnGlobalConcurrentQueue();
  }
  return v6;
}

void __35__HDProfileManager_initWithDaemon___block_invoke(uint64_t a1)
{
}

- (void)_loadSecondaryProfiles
{
  v70[2] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    lock = (os_unfair_lock_s *)(a1 + 32);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 32));
    v56 = (void *)a1;
    location = (id *)(a1 + 8);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    v3 = [WeakRetained healthDirectoryPath];
    id v4 = [v3 pathComponents];
    id v5 = (void *)[v4 mutableCopy];

    [v5 addObject:@"Profiles"];
    v48 = v5;
    uint64_t v6 = [MEMORY[0x1E4F1CB10] fileURLWithPathComponents:v5];
    id v7 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
    uint64_t v8 = *MEMORY[0x1E4F1C628];
    uint64_t v53 = *MEMORY[0x1E4F1C6E8];
    v70[0] = *MEMORY[0x1E4F1C6E8];
    v70[1] = v8;
    id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v70 count:2];
    v46 = v7;
    v47 = (void *)v6;
    v10 = [v7 enumeratorAtURL:v6 includingPropertiesForKeys:v9 options:7 errorHandler:&__block_literal_global_316];

    long long v61 = 0u;
    long long v62 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    id obj = v10;
    uint64_t v11 = [obj countByEnumeratingWithState:&v59 objects:v69 count:16];
    if (!v11) {
      goto LABEL_33;
    }
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v60;
    uint64_t v52 = *(void *)v60;
    uint64_t v50 = v8;
    while (1)
    {
      uint64_t v14 = 0;
      uint64_t v54 = v12;
      do
      {
        if (*(void *)v60 != v13) {
          objc_enumerationMutation(obj);
        }
        objc_super v15 = *(void **)(*((void *)&v59 + 1) + 8 * v14);
        id v58 = 0;
        [v15 getResourceValue:&v58 forKey:v8 error:0];
        id v16 = v58;
        if ([v16 BOOLValue])
        {
          id v57 = 0;
          [v15 getResourceValue:&v57 forKey:v53 error:0];
          id v17 = v57;
          if (!v17)
          {
            v45 = [MEMORY[0x1E4F28B00] currentHandler];
            [v45 handleFailureInMethod:sel__profileIdentifierForDirectoryName_error_, v56, @"HDProfileManager.m", 427, @"Invalid parameter not satisfying: %@", @"directoryName != nil" object file lineNumber description];
          }
          v18 = [v17 componentsSeparatedByString:@"$"];
          if ([v18 count] != 2)
          {
            objc_msgSend(MEMORY[0x1E4F28C58], "hk_errorForInvalidArgument:class:selector:format:", @"directoryName", objc_opt_class(), sel__profileIdentifierForDirectoryName_error_, @"Directory name separates into too many components (%ld)", objc_msgSend(v18, "count"));
            id v26 = (id)objc_claimAutoreleasedReturnValue();
            v25 = v26;
            if (v26) {
              id v27 = v26;
            }

            v24 = 0;
            v23 = v25;
            goto LABEL_24;
          }
          v19 = [v18 objectAtIndexedSubscript:0];
          uint64_t v20 = [v19 integerValue];

          if ([MEMORY[0x1E4F2B358] isValidSecondaryProfileType:v20])
          {
            id v21 = objc_alloc(MEMORY[0x1E4F29128]);
            v22 = [v18 objectAtIndexedSubscript:1];
            v23 = (void *)[v21 initWithUUIDString:v22];

            if (v23)
            {
              v24 = [MEMORY[0x1E4F2B358] _profileWithUUID:v23 type:v20];
              v25 = 0;
LABEL_24:

              id v37 = v25;
              if (v24)
              {
                id v38 = [NSString alloc];
                id v39 = v15;
                v40 = objc_msgSend(v38, "initWithUTF8String:", objc_msgSend(v39, "fileSystemRepresentation"));
                id v41 = objc_loadWeakRetained(location);
                v42 = (void *)[v56 newProfileWithIdentifier:v24 daemon:v41 directoryPath:v40];

                -[HDProfileManager _lock_addProfile:dispatchChangeNotification:]((uint64_t)v56, v42, 0);
                _HKInitializeLogging();
                v43 = HKLogInfrastructure();
                if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412802;
                  id v64 = v42;
                  __int16 v65 = 2112;
                  id v66 = v24;
                  __int16 v67 = 2112;
                  id v68 = v39;
                  _os_log_impl(&dword_1BCB7D000, v43, OS_LOG_TYPE_DEFAULT, "Loaded profile from disk: %@ for identifier: %@ in directory: %@", buf, 0x20u);
                }

                id v44 = v42;
                HKDispatchAsyncOnGlobalConcurrentQueue();

                uint64_t v8 = v50;
              }
              else
              {
                _HKInitializeLogging();
                v40 = HKLogInfrastructure();
                if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412546;
                  id v64 = v17;
                  __int16 v65 = 2114;
                  id v66 = v37;
                  _os_log_error_impl(&dword_1BCB7D000, v40, OS_LOG_TYPE_ERROR, "Non UUID directory found in profiles directory: %@ error: %{public}@", buf, 0x16u);
                }
              }

              uint64_t v12 = v54;
              uint64_t v13 = v52;
              goto LABEL_31;
            }
            v32 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v33 = objc_opt_class();
            v34 = [v18 objectAtIndexedSubscript:1];
            objc_msgSend(v32, "hk_errorForInvalidArgument:class:selector:format:", @"directoryName", v33, sel__profileIdentifierForDirectoryName_error_, @"Directory name contains invalid profile identifier: %@", v34);
            id v35 = (id)objc_claimAutoreleasedReturnValue();
            v25 = v35;
            if (v35) {
              id v36 = v35;
            }

            v23 = 0;
          }
          else
          {
            v28 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v29 = objc_opt_class();
            v23 = [v18 objectAtIndexedSubscript:0];
            objc_msgSend(v28, "hk_errorForInvalidArgument:class:selector:format:", @"directoryName", v29, sel__profileIdentifierForDirectoryName_error_, @"Directory name contains invalid profile type (%@)", v23);
            id v30 = (id)objc_claimAutoreleasedReturnValue();
            v25 = v30;
            if (v30) {
              id v31 = v30;
            }
          }
          v24 = 0;
          goto LABEL_24;
        }
LABEL_31:

        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [obj countByEnumeratingWithState:&v59 objects:v69 count:16];
      if (!v12)
      {
LABEL_33:

        os_unfair_lock_unlock(lock);
        [v56 dispatchProfileListDidChange];

        return;
      }
    }
  }
}

- (BOOL)profileExistsForIdentifier:(id)a3 error:(id *)a4
{
  id v4 = -[HDProfileManager profileForIdentifier:](self, "profileForIdentifier:", a3, a4);
  BOOL v5 = v4 != 0;

  return v5;
}

- (void)addProfile:(id)a3
{
  p_profilesLock = &self->_profilesLock;
  id v5 = a3;
  os_unfair_lock_lock(p_profilesLock);
  -[HDProfileManager _lock_addProfile:dispatchChangeNotification:]((uint64_t)self, v5, 1);

  os_unfair_lock_unlock(p_profilesLock);
}

- (void)_lock_addProfile:(int)a3 dispatchChangeNotification:
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 32));
    uint64_t v6 = *(void **)(a1 + 16);
    id v7 = [v5 profileIdentifier];
    id v8 = [v6 objectForKey:v7];

    if (v8 != v5)
    {
      if (v8)
      {
        _HKInitializeLogging();
        id v9 = HKLogInfrastructure();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
        {
          uint64_t v12 = NSStringFromSelector(sel__lock_addProfile_dispatchChangeNotification_);
          uint64_t v13 = [v5 profileIdentifier];
          int v14 = 138413314;
          uint64_t v15 = a1;
          __int16 v16 = 2112;
          id v17 = v12;
          __int16 v18 = 2112;
          id v19 = v8;
          __int16 v20 = 2112;
          id v21 = v13;
          __int16 v22 = 2112;
          id v23 = v5;
          _os_log_fault_impl(&dword_1BCB7D000, v9, OS_LOG_TYPE_FAULT, "%@: %@ Overriding existing profile %@ for identifier %@ with new profile %@", (uint8_t *)&v14, 0x34u);
        }
        [v8 invalidateAndWaitWithReason:@"Replacing profile."];
      }
      v10 = *(void **)(a1 + 16);
      uint64_t v11 = [v5 profileIdentifier];
      [v10 setObject:v5 forKey:v11];

      [v5 notifyProfileInitializedObservers];
      if (a3) {
        [(id)a1 dispatchProfileListDidChange];
      }
    }
  }
}

- (id)createProfileOfType:(int64_t)a3 displayName:(id)a4 error:(id *)a5
{
  id v9 = a4;
  if (v9)
  {
    id v10 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v11 = -[HDProfileManager _createProfileOfType:UUID:name:lastName:error:]((uint64_t)self, a3, v10, v9, 0, a5);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_errorForNilArgument:class:selector:", @"displayName", objc_opt_class(), a2);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      if (a5) {
        *a5 = v10;
      }
      else {
        _HKLogDroppedError();
      }
    }

    uint64_t v11 = 0;
  }

  return v11;
}

- (id)_createProfileOfType:(void *)a3 UUID:(void *)a4 name:(void *)a5 lastName:(void *)a6 error:
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  if (!a1) {
    goto LABEL_6;
  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 32));
  if (!*(void *)(a1 + 16))
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a6, 119, @"Unable to create profiles after invalidation.");
LABEL_6:
    int v14 = 0;
    goto LABEL_27;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 32));
  v49 = v13;
  uint64_t v44 = a2;
  if (a2 == 1) {
    [MEMORY[0x1E4F2B358] primaryProfile];
  }
  else {
  uint64_t v15 = [MEMORY[0x1E4F2B358] _profileWithUUID:v11 type:a2];
  }
  id v47 = v11;
  if (!v15)
  {
    v42 = [MEMORY[0x1E4F28B00] currentHandler];
    [v42 handleFailureInMethod:sel__createProfileOfType_UUID_name_lastName_error_ object:a1 file:@"HDProfileManager.m" lineNumber:319 description:@"Profile identifier is nil."];
  }
  v45 = a6;
  v48 = v12;
  id v16 = v15;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
  __int16 v18 = [WeakRetained healthDirectoryURL];
  id v19 = [v18 URLByAppendingPathComponent:@"Profiles" isDirectory:1];

  id v20 = v16;
  if (!v15)
  {
    v43 = [MEMORY[0x1E4F28B00] currentHandler];
    [v43 handleFailureInMethod:sel__directoryNameForProfileIdentifier_, a1, @"HDProfileManager.m", 421, @"Invalid parameter not satisfying: %@", @"profileIdentifier != nil" object file lineNumber description];
  }
  id v21 = NSString;
  uint64_t v22 = [v20 type];
  id v23 = [v20 identifier];
  uint64_t v24 = [v23 UUIDString];
  v25 = [v21 stringWithFormat:@"%ld$%@", v22, v24];

  id v26 = [v19 URLByAppendingPathComponent:v25 isDirectory:1];

  id v27 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
  id v54 = 0;
  char v28 = [v27 createDirectoryAtURL:v26 withIntermediateDirectories:1 attributes:0 error:&v54];
  id v29 = v54;
  if (v28)
  {
    id v30 = [NSString alloc];
    id v31 = v26;
    v32 = objc_msgSend(v30, "initWithUTF8String:", objc_msgSend(v31, "fileSystemRepresentation"));
    id v33 = objc_loadWeakRetained((id *)(a1 + 8));
    v34 = (void *)[(id)a1 newProfileWithIdentifier:v20 daemon:v33 directoryPath:v32];

    if (v34)
    {
      v46 = v32;
      os_unfair_lock_lock((os_unfair_lock_t)(a1 + 32));
      -[HDProfileManager _lock_addProfile:dispatchChangeNotification:](a1, v34, 0);
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 32));
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __66__HDProfileManager__createProfileOfType_UUID_name_lastName_error___block_invoke;
      aBlock[3] = &unk_1E62F30F8;
      id v35 = v34;
      id v51 = v35;
      id v52 = v48;
      id v53 = v49;
      id v36 = _Block_copy(aBlock);
      [v35 executeBlockAfterProfileReady:v36];
      _HKInitializeLogging();
      id v37 = HKLogInfrastructure();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        id v56 = v35;
        __int16 v57 = 2112;
        id v58 = v20;
        __int16 v59 = 2112;
        id v60 = v31;
        _os_log_impl(&dword_1BCB7D000, v37, OS_LOG_TYPE_DEFAULT, "Created new profile: %@ for identifier: %@ in directory: %@", buf, 0x20u);
      }

      int v14 = [v35 profileIdentifier];

      id v38 = v51;
      id v12 = v48;
      v32 = v46;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "hk_errorForInvalidArgument:class:selector:format:", @"profileType", objc_opt_class(), sel__createProfileOfType_UUID_name_lastName_error_, @"Invalid profile type %ld", v44);
      id v40 = (id)objc_claimAutoreleasedReturnValue();
      id v38 = v40;
      id v12 = v48;
      if (v40)
      {
        if (v45) {
          void *v45 = v40;
        }
        else {
          _HKLogDroppedError();
        }
      }

      int v14 = 0;
    }

    id v11 = v47;
  }
  else
  {
    _HKInitializeLogging();
    id v39 = HKLogInfrastructure();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v56 = v26;
      __int16 v57 = 2114;
      id v58 = v29;
      _os_log_error_impl(&dword_1BCB7D000, v39, OS_LOG_TYPE_ERROR, "Unable to create directory (%@) for profile. Error: %{public}@", buf, 0x16u);
    }

    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:description:underlyingError:", v45, 102, @"Unable to create profile database directory", v29);
    int v14 = 0;
    id v11 = v47;
    id v12 = v48;
  }

  id v13 = v49;
LABEL_27:

  return v14;
}

- (id)createProfileForIdentifier:(id)a3 firstName:(id)a4 lastName:(id)a5 error:(id *)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  if (v12)
  {
    uint64_t v14 = [v11 type];
    uint64_t v15 = [v11 identifier];
    id v16 = -[HDProfileManager _createProfileOfType:UUID:name:lastName:error:]((uint64_t)self, v14, v15, v12, v13, a6);

    id v17 = [(HDProfileManager *)self profileForIdentifier:v16];
    if (v17)
    {
      id v18 = v17;
      id v19 = v18;
      goto LABEL_12;
    }
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a6, 100, @"Unable to fetch profile %@ after creation.", v11);
    id v18 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_errorForNilArgument:class:selector:", @"firstName", objc_opt_class(), a2);
    id v20 = (id)objc_claimAutoreleasedReturnValue();
    id v18 = v20;
    if (v20)
    {
      if (a6)
      {
        id v18 = v20;
        id v19 = 0;
        *a6 = v18;
      }
      else
      {
        _HKLogDroppedError();
        id v19 = 0;
      }
      id v16 = v18;
      goto LABEL_12;
    }
    id v16 = 0;
  }
  id v19 = 0;
LABEL_12:

  return v19;
}

- (BOOL)deleteProfile:(id)a3 error:(id *)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = v6;
  if (!self)
  {
LABEL_28:

    return 0;
  }
  if (!v6)
  {
    id v19 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_errorForNilArgument:class:selector:", @"profileIdentifier", objc_opt_class(), sel__deleteProfile_error_);
LABEL_15:
    id v20 = v19;
    if (v20)
    {
      if (a4) {
        *a4 = v20;
      }
      else {
        _HKLogDroppedError();
      }
    }

    goto LABEL_28;
  }
  uint64_t v8 = [(HDProfileManager *)self profileForIdentifier:v6];
  if (!v8)
  {
    id v19 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_errorForInvalidArgument:class:selector:format:", @"profileType", objc_opt_class(), sel__deleteProfile_error_, @"No profile for identifier %@.", v7);
    goto LABEL_15;
  }
  id v9 = (void *)v8;
  _HKInitializeLogging();
  id v10 = HKLogInfrastructure();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v27 = v7;
    _os_log_impl(&dword_1BCB7D000, v10, OS_LOG_TYPE_DEFAULT, "Deleting profile '%@'", buf, 0xCu);
  }

  os_unfair_lock_lock(&self->_profilesLock);
  [(NSMutableDictionary *)self->_profiles removeObjectForKey:v7];
  os_unfair_lock_unlock(&self->_profilesLock);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_daemon);
  [WeakRetained invalidateAllServersForProfile:v9];

  _HKInitializeLogging();
  id v12 = HKLogInfrastructure();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v27 = v7;
    _os_log_impl(&dword_1BCB7D000, v12, OS_LOG_TYPE_DEFAULT, "Invalidated existing servers for deleted profile '%@'", buf, 0xCu);
  }

  [v9 invalidateAndWaitWithReason:@"Profile deletion"];
  _HKInitializeLogging();
  id v13 = HKLogInfrastructure();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v27 = v7;
    _os_log_impl(&dword_1BCB7D000, v13, OS_LOG_TYPE_DEFAULT, "Invalidated deleted profile '%@'", buf, 0xCu);
  }

  uint64_t v14 = [v9 directoryURL];
  id v15 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
  id v25 = 0;
  int v16 = [v15 removeItemAtURL:v14 error:&v25];
  id v17 = v25;
  if (v16)
  {
    _HKInitializeLogging();
    id v18 = HKLogInfrastructure();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v27 = v7;
      _os_log_impl(&dword_1BCB7D000, v18, OS_LOG_TYPE_DEFAULT, "Finished deleting profile '%@'", buf, 0xCu);
    }
  }
  else
  {
    id v21 = [v15 contentsOfDirectoryAtURL:v14 includingPropertiesForKeys:0 options:0 error:0];
    _HKInitializeLogging();
    uint64_t v22 = HKLogInfrastructure();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v27 = v14;
      __int16 v28 = 2114;
      id v29 = v21;
      _os_log_impl(&dword_1BCB7D000, v22, OS_LOG_TYPE_DEFAULT, "Files remaining in %{public}@: %{public}@", buf, 0x16u);
    }

    _HKInitializeLogging();
    id v23 = HKLogInfrastructure();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v27 = v14;
      __int16 v28 = 2114;
      id v29 = v17;
      _os_log_fault_impl(&dword_1BCB7D000, v23, OS_LOG_TYPE_FAULT, "Failed to delete profile %{public}@: %{public}@", buf, 0x16u);
    }

    _HKInitializeLogging();
    id v18 = HKLogInfrastructure();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v27 = v7;
      _os_log_error_impl(&dword_1BCB7D000, v18, OS_LOG_TYPE_ERROR, "Failed to delete profile %@'", buf, 0xCu);
    }
  }

  if (v16)
  {
    [(HDProfileManager *)self dispatchProfileListDidChange];
    return 1;
  }
  return 0;
}

- (BOOL)deleteAllProfilesOfType:(int64_t)a3 error:(id *)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v7 = [(HDProfileManager *)self allProfileIdentifiers];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v29 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v20;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        if ([v12 type] == a3
          && ![(HDProfileManager *)self deleteProfile:v12 error:a4])
        {
          _HKInitializeLogging();
          uint64_t v14 = HKLogInfrastructure();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            int v16 = [v12 identifier];
            id v17 = [v16 UUIDString];
            uint64_t v18 = [v12 type];
            *(_DWORD *)buf = 138543874;
            uint64_t v24 = self;
            __int16 v25 = 2114;
            id v26 = v17;
            __int16 v27 = 2048;
            uint64_t v28 = v18;
            _os_log_error_impl(&dword_1BCB7D000, v14, OS_LOG_TYPE_ERROR, " %{public}@: Failed to delete profile with identifier %{public}@ of type %ld", buf, 0x20u);
          }
          BOOL v13 = 0;
          goto LABEL_14;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v19 objects:v29 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  BOOL v13 = 1;
LABEL_14:

  return v13;
}

- (id)allProfileIdentifiers
{
  p_profilesLock = &self->_profilesLock;
  os_unfair_lock_lock(&self->_profilesLock);
  id v4 = [(NSMutableDictionary *)self->_profiles allKeys];
  id v5 = (void *)[v4 copy];

  os_unfair_lock_unlock(p_profilesLock);

  return v5;
}

- (id)profileAssociatedWithNRDeviceUUID:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v21 = a3;
  [(HDProfileManager *)self allProfileIdentifiers];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 countByEnumeratingWithState:&v23 objects:v33 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    SEL v20 = a2;
    uint64_t v8 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v24 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        id v11 = [(HDProfileManager *)self profileForIdentifier:v10];
        id v12 = v11;
        if (v11)
        {
          if ([v11 profileType] == 3)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              id v17 = [MEMORY[0x1E4F28B00] currentHandler];
              [v17 handleFailureInMethod:v20, self, @"HDProfileManager.m", 164, @"Profile %@ is of type Tinker but is not an instance of type HDTinkerProfile (#t0)", v12 object file lineNumber description];
            }
            id v12 = v12;
            id v22 = 0;
            BOOL v13 = [v12 pairedNRDeviceUUIDWithError:&v22];
            id v14 = v22;
            if (v13)
            {
              if ([v13 isEqual:v21])
              {
                id v18 = v10;

                goto LABEL_21;
              }
            }
            else
            {
              _HKInitializeLogging();
              int v16 = *MEMORY[0x1E4F29FA8];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543874;
                uint64_t v28 = self;
                __int16 v29 = 2114;
                uint64_t v30 = v10;
                __int16 v31 = 2114;
                id v32 = v14;
                _os_log_error_impl(&dword_1BCB7D000, v16, OS_LOG_TYPE_ERROR, "%{public}@ Error fetching deviceUUID for profile: %{public}@ error: %{public}@", buf, 0x20u);
              }
            }
          }
        }
        else
        {
          _HKInitializeLogging();
          id v15 = *MEMORY[0x1E4F29FA8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            uint64_t v28 = self;
            __int16 v29 = 2114;
            uint64_t v30 = v10;
            _os_log_error_impl(&dword_1BCB7D000, v15, OS_LOG_TYPE_ERROR, "%{public}@ Profile is nil for profileIdentifier: %{public}@", buf, 0x16u);
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v23 objects:v33 count:16];
    }
    while (v7);
  }
  id v18 = 0;
LABEL_21:

  return v18;
}

- (id)profileIdentifierForUUID:(id)a3
{
  id v4 = a3;
  id v5 = [(HDProfileManager *)self allProfileIdentifiers];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __45__HDProfileManager_profileIdentifierForUUID___block_invoke;
  v9[3] = &unk_1E62F5910;
  id v10 = v4;
  id v6 = v4;
  uint64_t v7 = objc_msgSend(v5, "hk_firstObjectPassingTest:", v9);

  return v7;
}

uint64_t __45__HDProfileManager_profileIdentifierForUUID___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 identifier];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

- (void)invalidateAndWaitWithReason:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  _HKInitializeLogging();
  id v5 = HKLogInfrastructure();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    long long v19 = self;
    __int16 v20 = 2114;
    id v21 = v4;
    _os_log_impl(&dword_1BCB7D000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Invalidating (%{public}@)", buf, 0x16u);
  }

  os_unfair_lock_lock(&self->_profilesLock);
  id v6 = [(NSMutableDictionary *)self->_profiles allValues];
  profiles = self->_profiles;
  self->_profiles = 0;

  os_unfair_lock_unlock(&self->_profilesLock);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v12++), "invalidateAndWaitWithReason:", v4, (void)v13);
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

- (void)addProfileManagerObserver:(id)a3
{
}

- (void)addProfileManagerObserver:(id)a3 queue:(id)a4
{
}

- (void)removeProfileManagerObserver:(id)a3
{
}

- (void)dispatchProfileListDidChange
{
}

uint64_t __48__HDProfileManager_dispatchProfileListDidChange__block_invoke(uint64_t a1, void *a2)
{
  return [a2 profileListDidChange];
}

uint64_t __42__HDProfileManager__loadSecondaryProfiles__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = a3;
  if ([v5 code] != 260)
  {
    _HKInitializeLogging();
    id v6 = HKLogInfrastructure();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138412546;
      id v9 = v4;
      __int16 v10 = 2114;
      id v11 = v5;
      _os_log_error_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_ERROR, "Error while enumerating profiles directory. URL: %@ Error: %{public}@", (uint8_t *)&v8, 0x16u);
    }
  }
  return 1;
}

uint64_t __42__HDProfileManager__loadSecondaryProfiles__block_invoke_318(uint64_t a1)
{
  return [*(id *)(a1 + 32) awakeFromDisk];
}

void __66__HDProfileManager__createProfileOfType_UUID_name_lastName_error___block_invoke(void *a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[6];
  id v9 = 0;
  char v5 = [v2 setDisplayFirstName:v3 lastName:v4 error:&v9];
  id v6 = v9;
  if ((v5 & 1) == 0 && (HKIsUnitTesting() & 1) == 0)
  {
    _HKInitializeLogging();
    uint64_t v7 = HKLogInfrastructure();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = a1[5];
      *(_DWORD *)buf = 138543618;
      uint64_t v11 = v8;
      __int16 v12 = 2114;
      id v13 = v6;
      _os_log_error_impl(&dword_1BCB7D000, v7, OS_LOG_TYPE_ERROR, "Error setting display name %{public}@, error: %{public}@", buf, 0x16u);
    }
  }
}

- (id)newProfileWithIdentifier:(id)a3 daemon:(id)a4 directoryPath:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [v7 type];
  switch(v10)
  {
    case 1:
      uint64_t v11 = [[HDPrimaryProfile alloc] initWithDirectoryPath:v9 medicalIDDirectoryPath:v9 daemon:v8];
      goto LABEL_10;
    case 2:
      __int16 v12 = [HDProfile alloc];
      id v13 = v9;
      id v14 = 0;
      goto LABEL_9;
    case 3:
      long long v15 = HDTinkerProfile;
      goto LABEL_8;
    case 4:
      long long v15 = HDDevicelessProfile;
LABEL_8:
      __int16 v12 = (HDProfile *)[v15 alloc];
      id v13 = v9;
      id v14 = v9;
LABEL_9:
      uint64_t v11 = [(HDProfile *)v12 initWithDirectoryPath:v13 medicalIDDirectoryPath:v14 daemon:v8 profileIdentifier:v7];
      goto LABEL_10;
    default:
      if (v10 == 100)
      {
        uint64_t v11 = [[HDPrimaryProfile alloc] _initWithDirectoryPath:v9 medicalIDDirectoryPath:v9 daemon:v8 profileIdentifier:v7];
LABEL_10:
        long long v16 = v11;
      }
      else
      {
        long long v16 = 0;
      }

      return v16;
  }
}

- (void)unitTest_reloadSecondaryProfiles
{
}

void __52__HDProfileManager_unitTest_reloadSecondaryProfiles__block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 32));
  v2 = [*(id *)(*(void *)(a1 + 32) + 16) allKeys];
  uint64_t v3 = (void *)[v2 copy];

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v9, "type", (void)v11) != 1)
        {
          uint64_t v10 = [*(id *)(*(void *)(a1 + 32) + 16) objectForKey:v9];
          [v10 invalidateAndWaitWithReason:@"Reloading"];
          [*(id *)(*(void *)(a1 + 32) + 16) removeObjectForKey:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 32));
  -[HDProfileManager _loadSecondaryProfiles](*(void *)(a1 + 32));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_profiles, 0);

  objc_destroyWeak((id *)&self->_daemon);
}

@end