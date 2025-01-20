@interface HDProfileStoreServer
+ (id)requiredEntitlements;
+ (id)taskIdentifier;
- (id)exportedInterface;
- (id)remoteInterface;
- (void)dealloc;
- (void)profileListDidChange;
- (void)remote_createProfileOfType:(int64_t)a3 displayName:(id)a4 completion:(id)a5;
- (void)remote_deleteProfile:(id)a3 completion:(id)a4;
- (void)remote_fetchDisplayImageData:(id)a3;
- (void)remote_fetchDisplayNameWithCompletion:(id)a3;
- (void)remote_fetchSharingInformationForProfileIdentifier:(id)a3 completion:(id)a4;
- (void)remote_getAllProfilesWithCompletion:(id)a3;
- (void)remote_profileIdentifierForNRDeviceUUID:(id)a3 completion:(id)a4;
- (void)remote_profileIdentifierForNRDeviceUUID:(id)a3 ownerAppleID:(id)a4 completion:(id)a5;
- (void)remote_setDisplayFirstName:(id)a3 lastName:(id)a4 completion:(id)a5;
- (void)remote_setDisplayImageData:(id)a3 completion:(id)a4;
- (void)remote_startObservingWithCompletion:(id)a3;
@end

@implementation HDProfileStoreServer

- (void)dealloc
{
  v3 = -[HDHealthStoreProviderServer _profileManager](self);
  [v3 removeProfileManagerObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)HDProfileStoreServer;
  [(HDProfileStoreServer *)&v4 dealloc];
}

- (void)remote_createProfileOfType:(int64_t)a3 displayName:(id)a4 completion:(id)a5
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v8 = (void (**)(id, void *, id))a5;
  id v9 = a4;
  _HKInitializeLogging();
  v10 = HKLogInfrastructure();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    int64_t v16 = a3;
    _os_log_impl(&dword_1BCB7D000, v10, OS_LOG_TYPE_DEFAULT, "Creating new profile of type %ld", buf, 0xCu);
  }

  v11 = -[HDHealthStoreProviderServer _profileManager](self);
  id v14 = 0;
  v12 = [v11 createProfileOfType:a3 displayName:v9 error:&v14];

  id v13 = v14;
  if (v8) {
    v8[2](v8, v12, v13);
  }
}

- (void)remote_deleteProfile:(id)a3 completion:(id)a4
{
  id v7 = a3;
  v8 = (void (**)(id, void, id))a4;
  id v9 = [(HDStandardTaskServer *)self profile];
  v10 = [v9 profileIdentifier];
  int v11 = [v10 isEqual:v7];

  if (v11)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", objc_opt_class(), a2, @"Delete profile called on health store of the same profile."");
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    v8[2](v8, 0, v12);
  }
  else
  {
    id v13 = -[HDHealthStoreProviderServer _profileManager](self);
    id v14 = [v13 profileForIdentifier:v7];

    if ([v14 profileType] == 1)
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", objc_opt_class(), a2, @"Cannot delete primary profile."");
      id v12 = (id)objc_claimAutoreleasedReturnValue();
      v8[2](v8, 0, v12);
    }
    else
    {
      v15 = -[HDHealthStoreProviderServer _profileManager](self);
      id v17 = 0;
      uint64_t v16 = [v15 deleteProfile:v7 error:&v17];
      id v12 = v17;

      if (v8) {
        v8[2](v8, v16, v12);
      }
    }
  }
}

- (void)remote_getAllProfilesWithCompletion:(id)a3
{
  if (a3)
  {
    id v5 = a3;
    -[HDHealthStoreProviderServer _profileManager](self);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    v6 = [v7 allProfileIdentifiers];
    (*((void (**)(id, void *, void))a3 + 2))(v5, v6, 0);
  }
}

- (void)remote_setDisplayFirstName:(id)a3 lastName:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  int v11 = (void (**)(void *, uint64_t, id))a5;
  if (v11) {
    id v12 = v11;
  }
  else {
    id v12 = (void (**)(void *, uint64_t, id))&__block_literal_global_122;
  }
  if (v9)
  {
    id v13 = [(HDStandardTaskServer *)self profile];
    id v17 = 0;
    uint64_t v14 = [v13 setDisplayFirstName:v9 lastName:v10 error:&v17];
    id v15 = v17;

    v12[2](v12, v14, v15);
  }
  else
  {
    uint64_t v16 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", objc_opt_class(), a2, @"Display name must not be nil."");
    v12[2](v12, 0, v16);
  }
}

- (void)remote_profileIdentifierForNRDeviceUUID:(id)a3 completion:(id)a4
{
  id v11 = a3;
  id v7 = (void (**)(id, void *, void))a4;
  if (v7)
  {
    if (v11)
    {
      v8 = -[HDHealthStoreProviderServer _profileManager](self);
      id v9 = [v8 profileAssociatedWithNRDeviceUUID:v11];

      if (v9) {
        id v10 = v9;
      }
      else {
        id v10 = 0;
      }
      v7[2](v7, v10, 0);
    }
    else
    {
      id v9 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", objc_opt_class(), a2, @"NRDevice must not be nil."");
      ((void (**)(id, void *, void *))v7)[2](v7, 0, v9);
    }
  }
}

- (void)remote_profileIdentifierForNRDeviceUUID:(id)a3 ownerAppleID:(id)a4 completion:(id)a5
{
  uint64_t v89 = *MEMORY[0x1E4F143B8];
  id v60 = a3;
  id v59 = a4;
  id v9 = a5;
  id v10 = v9;
  if (v9)
  {
    v58 = (void (**)(id, uint64_t, void))v9;
    if (v60)
    {
      id v11 = -[HDHealthStoreProviderServer _profileManager](self);
      id v12 = [v11 allProfileIdentifiers];

      long long v75 = 0u;
      long long v76 = 0u;
      long long v73 = 0u;
      long long v74 = 0u;
      obuint64_t j = v12;
      uint64_t v13 = [obj countByEnumeratingWithState:&v73 objects:v88 count:16];
      if (v13)
      {
        uint64_t v14 = 0;
        uint64_t v15 = *(void *)v74;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v74 != v15) {
              objc_enumerationMutation(obj);
            }
            uint64_t v17 = *(void *)(*((void *)&v73 + 1) + 8 * i);
            v18 = -[HDHealthStoreProviderServer _profileManager](self);
            id v19 = [v18 profileForIdentifier:v17];

            if (v19)
            {
              if ([v19 profileType] == 3)
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  v24 = [MEMORY[0x1E4F28B00] currentHandler];
                  [v24 handleFailureInMethod:a2, self, @"HDProfileStoreServer.m", 174, @"Profile %@ is of type Tinker but is not an instance of type HDTinkerProfile (#t0)", v19 object file lineNumber description];
                }
                id v19 = v19;
                id v72 = 0;
                v20 = [v19 pairedNRDeviceUUIDWithError:&v72];
                id v21 = v72;
                if (v20)
                {
                  if ([v20 isEqual:v60])
                  {
                    v58[2](v58, v17, 0);

                    goto LABEL_51;
                  }
                }
                else
                {
                  id v23 = v14;
                  if (!v14) {
                    id v23 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
                  }
                  uint64_t v14 = v23;
                  [v23 addObject:v19];
                }
              }
            }
            else
            {
              _HKInitializeLogging();
              v22 = *MEMORY[0x1E4F29FA8];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543618;
                *(void *)&uint8_t buf[4] = self;
                *(_WORD *)&buf[12] = 2114;
                *(void *)&buf[14] = v17;
                _os_log_error_impl(&dword_1BCB7D000, v22, OS_LOG_TYPE_ERROR, "%{public}@ Profile is nil for profileIdentifier: %{public}@", buf, 0x16u);
              }
            }
          }
          uint64_t v13 = [obj countByEnumeratingWithState:&v73 objects:v88 count:16];
        }
        while (v13);

        if (v14)
        {
          _HKInitializeLogging();
          v25 = *MEMORY[0x1E4F29FA8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            *(void *)&uint8_t buf[4] = self;
            _os_log_impl(&dword_1BCB7D000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@ Found profiles with missing NRDevice UUID. Fetch share owner participant email address.", buf, 0xCu);
          }
          if (!v59)
          {
            v51 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", objc_opt_class(), a2, @"Owner appleID is nil."");
            ((void (**)(id, uint64_t, void *))v58)[2](v58, 0, v51);

            goto LABEL_51;
          }
          *(void *)buf = 0;
          *(void *)&buf[8] = buf;
          *(void *)&buf[16] = 0x3032000000;
          v85 = __Block_byref_object_copy__113;
          v86 = __Block_byref_object_dispose__113;
          id v87 = 0;
          v55 = (void *)[objc_alloc(MEMORY[0x1E4F1A488]) initWithEmailAddress:v59];
          dispatch_semaphore_t v26 = dispatch_semaphore_create(0);
          v27 = [(HDStandardTaskServer *)self profile];
          v28 = [v27 cloudSyncManager];
          v68[0] = MEMORY[0x1E4F143A8];
          v68[1] = 3221225472;
          v68[2] = __88__HDProfileStoreServer_remote_profileIdentifierForNRDeviceUUID_ownerAppleID_completion___block_invoke;
          v68[3] = &unk_1E6302B20;
          v68[4] = self;
          id v69 = v59;
          v71 = buf;
          dispatch_semaphore_t dsema = v26;
          dispatch_semaphore_t v70 = dsema;
          id v29 = (id)[v28 lookupParticipantWithIdentityLookUpInfo:v55 completion:v68];

          dispatch_time_t v30 = dispatch_time(0, 15000000000);
          if (dispatch_semaphore_wait(dsema, v30))
          {
            _HKInitializeLogging();
            v31 = *MEMORY[0x1E4F29FA8];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)v77 = 138543362;
              v78 = self;
              _os_log_error_impl(&dword_1BCB7D000, v31, OS_LOG_TYPE_ERROR, "%{public}@ Timed out waiting for owner participant from CloudKit.", v77, 0xCu);
            }
          }
          long long v66 = 0u;
          long long v67 = 0u;
          long long v64 = 0u;
          long long v65 = 0u;
          id v32 = v14;
          uint64_t v33 = [v32 countByEnumeratingWithState:&v64 objects:v83 count:16];
          if (v33)
          {
            id v56 = v32;
            uint64_t v57 = *(void *)v65;
            while (2)
            {
              uint64_t v34 = v33;
              for (uint64_t j = 0; j != v34; ++j)
              {
                if (*(void *)v65 != v57) {
                  objc_enumerationMutation(v56);
                }
                v36 = *(void **)(*((void *)&v64 + 1) + 8 * j);
                v37 = [v36 cloudSyncManager];
                id v63 = 0;
                v38 = [v37 shareOwnerParticipantWithError:&v63];
                id v39 = v63;

                if (v38) {
                  BOOL v40 = 1;
                }
                else {
                  BOOL v40 = v39 == 0;
                }
                if (v40)
                {
                  v41 = [v38 userIdentity];
                  v42 = [v41 lookupInfo];
                  v43 = [v42 emailAddress];

                  v44 = [*(id *)(*(void *)&buf[8] + 40) userIdentity];
                  v45 = [v44 lookupInfo];
                  v46 = [v45 emailAddress];

                  if (v43 && [v43 isEqualToString:v46])
                  {
                    id v62 = 0;
                    [v36 setPairedNRDeviceUUID:v60 error:&v62];
                    id v52 = v62;
                    v53 = [v36 profileIdentifier];
                    v58[2](v58, (uint64_t)v53, 0);

                    char v49 = 0;
                    goto LABEL_55;
                  }
                }
                else
                {
                  _HKInitializeLogging();
                  v38 = (id)*MEMORY[0x1E4F29FA8];
                  if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
                  {
                    v48 = [v36 profileIdentifier];
                    *(_DWORD *)v77 = 138543874;
                    v78 = self;
                    __int16 v79 = 2114;
                    v80 = v48;
                    __int16 v81 = 2114;
                    id v82 = v39;
                    _os_log_error_impl(&dword_1BCB7D000, v38, OS_LOG_TYPE_ERROR, "%{public}@ Error retrieving share owner participant for tinker profile %{public}@, %{public}@", v77, 0x20u);
                  }
                }
              }
              uint64_t v33 = [v56 countByEnumeratingWithState:&v64 objects:v83 count:16];
              if (v33) {
                continue;
              }
              break;
            }
            char v49 = 1;
LABEL_55:
            id v32 = v56;
          }
          else
          {
            char v49 = 1;
          }
          uint64_t v14 = v32;

          _Block_object_dispose(buf, 8);
          if ((v49 & 1) == 0) {
            goto LABEL_51;
          }
        }
      }
      else
      {

        uint64_t v14 = 0;
      }
      v58[2](v58, 0, 0);
LABEL_51:

      id v10 = v58;
      goto LABEL_52;
    }
    v50 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", objc_opt_class(), a2, @"NRDevice must not be nil."");
    id v10 = v58;
    ((void (**)(id, uint64_t, void *))v58)[2](v58, 0, v50);
  }
LABEL_52:
}

void __88__HDProfileStoreServer_remote_profileIdentifierForNRDeviceUUID_ownerAppleID_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!v5)
  {
    if (v6)
    {
      _HKInitializeLogging();
      v8 = *MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
      {
        uint64_t v12 = *(void *)(a1 + 32);
        uint64_t v13 = *(void *)(a1 + 40);
        int v14 = 138543874;
        uint64_t v15 = v12;
        __int16 v16 = 2114;
        uint64_t v17 = v13;
        __int16 v18 = 2114;
        id v19 = v7;
        _os_log_error_impl(&dword_1BCB7D000, v8, OS_LOG_TYPE_ERROR, "%{public}@ Error retrieving share owner participant for owner ID %{public}@, %{public}@", (uint8_t *)&v14, 0x20u);
      }
    }
  }
  uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v5;
  id v11 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

- (void)remote_fetchDisplayNameWithCompletion:(id)a3
{
  objc_super v4 = (void (**)(id, uint64_t, uint64_t, id))a3;
  if (v4)
  {
    uint64_t v20 = 0;
    id v21 = &v20;
    uint64_t v22 = 0x3032000000;
    id v23 = __Block_byref_object_copy__113;
    v24 = __Block_byref_object_dispose__113;
    id v25 = 0;
    uint64_t v14 = 0;
    uint64_t v15 = &v14;
    uint64_t v16 = 0x3032000000;
    uint64_t v17 = __Block_byref_object_copy__113;
    __int16 v18 = __Block_byref_object_dispose__113;
    id v19 = 0;
    id v5 = [(HDStandardTaskServer *)self profile];
    id v6 = [v5 database];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __62__HDProfileStoreServer_remote_fetchDisplayNameWithCompletion___block_invoke;
    v12[3] = &unk_1E62FF020;
    v12[4] = self;
    v12[5] = &v20;
    v12[6] = &v14;
    id v13 = 0;
    int v7 = [v6 performHighPriorityTransactionsWithError:&v13 block:v12];
    id v8 = v13;

    if (v7)
    {
      id v9 = 0;
      uint64_t v10 = v21[5];
      uint64_t v11 = v15[5];
    }
    else
    {
      uint64_t v10 = 0;
      uint64_t v11 = 0;
      id v9 = v8;
    }
    v4[2](v4, v10, v11, v9);
    _Block_object_dispose(&v14, 8);

    _Block_object_dispose(&v20, 8);
  }
}

uint64_t __62__HDProfileStoreServer_remote_fetchDisplayNameWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_super v4 = [*(id *)(a1 + 32) profile];
  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  int v7 = *(void **)(v6 + 40);
  uint64_t v8 = *(void *)(v5 + 8);
  id v11 = *(id *)(v8 + 40);
  obuint64_t j = v7;
  uint64_t v9 = [v4 fetchDisplayFirstName:&obj lastName:&v11 error:a2];
  objc_storeStrong((id *)(v6 + 40), obj);
  objc_storeStrong((id *)(v8 + 40), v11);

  return v9;
}

- (void)remote_fetchDisplayImageData:(id)a3
{
  objc_super v4 = (void (**)(id, void *, id))a3;
  uint64_t v5 = [(HDStandardTaskServer *)self profile];
  id v8 = 0;
  uint64_t v6 = [v5 fetchDisplayImageDataWithError:&v8];
  id v7 = v8;

  v4[2](v4, v6, v7);
}

- (void)remote_setDisplayImageData:(id)a3 completion:(id)a4
{
  uint64_t v6 = (void (**)(id, uint64_t, id))a4;
  id v7 = a3;
  id v8 = [(HDStandardTaskServer *)self profile];
  id v11 = 0;
  uint64_t v9 = [v8 setDisplayImageData:v7 error:&v11];

  id v10 = v11;
  v6[2](v6, v9, v10);
}

- (void)remote_startObservingWithCompletion:(id)a3
{
  uint64_t v5 = (void (**)(void))a3;
  objc_super v4 = -[HDHealthStoreProviderServer _profileManager](self);
  [v4 addProfileManagerObserver:self];

  v5[2]();
}

- (void)remote_fetchSharingInformationForProfileIdentifier:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = (void (**)(id, void *, void *, void))a4;
  uint64_t v9 = -[HDHealthStoreProviderServer _profileManager](self);
  id v10 = [v9 profileForIdentifier:v7];

  if (v10)
  {
    id v19 = 0;
    id v11 = +[HDKeyValueEntity retrieveDatabaseIdentifierCreationDateFromProfile:v10 error:&v19];
    id v12 = v19;
    id v13 = [v10 cloudSyncManager];
    id v18 = 0;
    uint64_t v14 = [v13 shareOwnerParticipantWithError:&v18];
    id v15 = v18;

    uint64_t v16 = [v14 description];
    if (v12) {
      id v17 = v12;
    }
    else {
      id v17 = v15;
    }
    ((void (**)(id, void *, void *, id))v8)[2](v8, v11, v16, v17);
  }
  else
  {
    id v11 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", objc_opt_class(), a2, @"No profile for identifier %@"", v7);
    ((void (**)(id, void *, void *, void *))v8)[2](v8, 0, 0, v11);
  }
}

- (void)profileListDidChange
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __44__HDProfileStoreServer_profileListDidChange__block_invoke;
  v3[3] = &unk_1E62F3170;
  v3[4] = self;
  v2 = [(HDStandardTaskServer *)self remoteObjectProxyWithErrorHandler:v3];
  objc_msgSend(v2, "client_remoteDidUpdateProfileList");
}

void __44__HDProfileStoreServer_profileListDidChange__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  _HKInitializeLogging();
  objc_super v4 = *MEMORY[0x1E4F29F98];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F98], OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138543618;
    uint64_t v7 = v5;
    __int16 v8 = 2114;
    id v9 = v3;
    _os_log_error_impl(&dword_1BCB7D000, v4, OS_LOG_TYPE_ERROR, "%{public}@: failed to notify client of profile changes due to: %{public}@", (uint8_t *)&v6, 0x16u);
  }
}

- (id)exportedInterface
{
  return (id)MEMORY[0x1F40E7EB8](self, a2);
}

- (id)remoteInterface
{
  return (id)MEMORY[0x1F40E7EB0](self, a2);
}

+ (id)taskIdentifier
{
  return (id)[MEMORY[0x1E4F2B360] taskIdentifier];
}

+ (id)requiredEntitlements
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = *MEMORY[0x1E4F2A548];
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];

  return v2;
}

@end