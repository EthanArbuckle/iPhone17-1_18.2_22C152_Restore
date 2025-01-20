@interface HDDefaultAuthorizationSchemaProvider
- (int64_t)isClientAuthorizedToReadObject:(id)a3 sourceBundleIdentifier:(id)a4 clientEntitlements:(id)a5 profile:(id)a6 error:(id *)a7;
- (int64_t)isClientAuthorizedToReadType:(id)a3 sourceBundleIdentifier:(id)a4 clientEntitlements:(id)a5 profile:(id)a6 error:(id *)a7;
- (int64_t)isClientAuthorizedToWriteObject:(id)a3 sourceBundleIdentifier:(id)a4 clientEntitlements:(id)a5 profile:(id)a6 error:(id *)a7;
- (int64_t)isClientAuthorizedToWriteType:(id)a3 sourceBundleIdentifier:(id)a4 clientEntitlements:(id)a5 profile:(id)a6 error:(id *)a7;
- (int64_t)setAuthorizationStatuses:(id)a3 authorizationModes:(id)a4 bundleIdentifier:(id)a5 options:(unint64_t)a6 profile:(id)a7 error:(id *)a8;
@end

@implementation HDDefaultAuthorizationSchemaProvider

- (int64_t)isClientAuthorizedToReadObject:(id)a3 sourceBundleIdentifier:(id)a4 clientEntitlements:(id)a5 profile:(id)a6 error:(id *)a7
{
  v51[1] = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v43 = a5;
  id v15 = a6;
  v16 = (void *)MEMORY[0x1E4F2B420];
  v51[0] = v13;
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v51 count:1];
  v18 = objc_msgSend(v16, "hd_sampleTypesForObjects:", v17);

  id v49 = 0;
  v19 = +[HDAuthorizationStatus authorizationStatusForTypes:v18 bundleIdentifier:v14 profile:v15 error:&v49];
  id v20 = v49;
  id v21 = v20;
  if (!v19)
  {
    int64_t v28 = 2;
    if (!v20) {
      goto LABEL_21;
    }
    goto LABEL_18;
  }
  v41 = self;
  v22 = [MEMORY[0x1E4F2B2C0] _typesIncludingParentTypes:v18];
  uint64_t v23 = [v19 count];
  v36 = v22;
  if (v23 != [v22 count])
  {
    v35 = [MEMORY[0x1E4F28B00] currentHandler];
    [v35 handleFailureInMethod:a2, v41, @"HDDefaultAuthorizationSchemaProvider.m", 55, @"Invalid parameter not satisfying: %@", @"[authorizationStatuses count] == [typesIncludingParentTypes count]" object file lineNumber description];
  }
  id v38 = v15;
  v39 = a7;
  id v40 = v14;
  id v42 = v13;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  v37 = v18;
  id v24 = v18;
  uint64_t v25 = [v24 countByEnumeratingWithState:&v45 objects:v50 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v46;
    int64_t v28 = 2;
    do
    {
      uint64_t v29 = 0;
      v30 = v21;
      do
      {
        if (*(void *)v46 != v27) {
          objc_enumerationMutation(v24);
        }
        uint64_t v31 = *(void *)(*((void *)&v45 + 1) + 8 * v29);
        v32 = [v19 objectForKeyedSubscript:v31];
        id v44 = v30;
        BOOL v33 = +[HDAuthorizationStatus isAuthorizedForObjectType:v31 authorizationStatus:v32 clientEntitlements:v43 sharing:0 error:&v44];
        id v21 = v44;

        if (v33) {
          int64_t v28 = 1;
        }

        ++v29;
        v30 = v21;
      }
      while (v26 != v29);
      uint64_t v26 = [v24 countByEnumeratingWithState:&v45 objects:v50 count:16];
    }
    while (v26);
  }
  else
  {
    int64_t v28 = 2;
  }

  id v14 = v40;
  id v13 = v42;
  id v15 = v38;
  a7 = v39;
  v18 = v37;
  if (v21)
  {
LABEL_18:
    if (a7) {
      *a7 = v21;
    }
    else {
      _HKLogDroppedError();
    }
  }
LABEL_21:

  return v28;
}

- (int64_t)isClientAuthorizedToReadType:(id)a3 sourceBundleIdentifier:(id)a4 clientEntitlements:(id)a5 profile:(id)a6 error:(id *)a7
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v13 = a4;
  id v38 = a5;
  id v14 = a6;
  id v15 = [MEMORY[0x1E4F1CAD0] setWithObject:a3];
  id v44 = 0;
  v16 = +[HDAuthorizationStatus authorizationStatusForTypes:v15 bundleIdentifier:v13 profile:v14 error:&v44];
  id v17 = v44;
  id v18 = v17;
  if (!v16)
  {
    int64_t v25 = 2;
    if (!v17) {
      goto LABEL_21;
    }
    goto LABEL_18;
  }
  v19 = [MEMORY[0x1E4F2B2C0] _typesIncludingParentTypes:v15];
  uint64_t v20 = [v16 count];
  BOOL v33 = v19;
  if (v20 != [v19 count])
  {
    v32 = [MEMORY[0x1E4F28B00] currentHandler];
    [v32 handleFailureInMethod:a2, self, @"HDDefaultAuthorizationSchemaProvider.m", 97, @"Invalid parameter not satisfying: %@", @"[authorizationStatuses count] == [typesIncludingParentTypes count]" object file lineNumber description];
  }
  id v35 = v14;
  v36 = a7;
  id v37 = v13;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  v34 = v15;
  id v21 = v15;
  uint64_t v22 = [v21 countByEnumeratingWithState:&v40 objects:v45 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v41;
    int64_t v25 = 2;
    do
    {
      uint64_t v26 = 0;
      uint64_t v27 = v18;
      do
      {
        if (*(void *)v41 != v24) {
          objc_enumerationMutation(v21);
        }
        uint64_t v28 = *(void *)(*((void *)&v40 + 1) + 8 * v26);
        uint64_t v29 = [v16 objectForKeyedSubscript:v28];
        id v39 = v27;
        BOOL v30 = +[HDAuthorizationStatus isAuthorizedForObjectType:v28 authorizationStatus:v29 clientEntitlements:v38 sharing:0 error:&v39];
        id v18 = v39;

        if (v30) {
          int64_t v25 = 1;
        }

        ++v26;
        uint64_t v27 = v18;
      }
      while (v23 != v26);
      uint64_t v23 = [v21 countByEnumeratingWithState:&v40 objects:v45 count:16];
    }
    while (v23);
  }
  else
  {
    int64_t v25 = 2;
  }

  a7 = v36;
  id v13 = v37;
  id v15 = v34;
  id v14 = v35;
  if (v18)
  {
LABEL_18:
    if (a7) {
      *a7 = v18;
    }
    else {
      _HKLogDroppedError();
    }
  }
LABEL_21:

  return v25;
}

- (int64_t)isClientAuthorizedToWriteType:(id)a3 sourceBundleIdentifier:(id)a4 clientEntitlements:(id)a5 profile:(id)a6 error:(id *)a7
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v13 = a4;
  id v38 = a5;
  id v14 = a6;
  id v15 = [MEMORY[0x1E4F1CAD0] setWithObject:a3];
  id v44 = 0;
  v16 = +[HDAuthorizationStatus authorizationStatusForTypes:v15 bundleIdentifier:v13 profile:v14 error:&v44];
  id v17 = v44;
  id v18 = v17;
  if (!v16)
  {
    int64_t v25 = 2;
    if (!v17) {
      goto LABEL_21;
    }
    goto LABEL_18;
  }
  v19 = [MEMORY[0x1E4F2B2C0] _typesIncludingParentTypes:v15];
  uint64_t v20 = [v16 count];
  BOOL v33 = v19;
  if (v20 != [v19 count])
  {
    v32 = [MEMORY[0x1E4F28B00] currentHandler];
    [v32 handleFailureInMethod:a2, self, @"HDDefaultAuthorizationSchemaProvider.m", 142, @"Invalid parameter not satisfying: %@", @"[authorizationStatuses count] == [typesIncludingParentTypes count]" object file lineNumber description];
  }
  id v35 = v14;
  v36 = a7;
  id v37 = v13;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  v34 = v15;
  id v21 = v15;
  uint64_t v22 = [v21 countByEnumeratingWithState:&v40 objects:v45 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v41;
    int64_t v25 = 2;
    do
    {
      uint64_t v26 = 0;
      uint64_t v27 = v18;
      do
      {
        if (*(void *)v41 != v24) {
          objc_enumerationMutation(v21);
        }
        uint64_t v28 = *(void *)(*((void *)&v40 + 1) + 8 * v26);
        uint64_t v29 = [v16 objectForKeyedSubscript:v28];
        id v39 = v27;
        BOOL v30 = +[HDAuthorizationStatus isAuthorizedForObjectType:v28 authorizationStatus:v29 clientEntitlements:v38 sharing:1 error:&v39];
        id v18 = v39;

        if (v30) {
          int64_t v25 = 1;
        }

        ++v26;
        uint64_t v27 = v18;
      }
      while (v23 != v26);
      uint64_t v23 = [v21 countByEnumeratingWithState:&v40 objects:v45 count:16];
    }
    while (v23);
  }
  else
  {
    int64_t v25 = 2;
  }

  a7 = v36;
  id v13 = v37;
  id v15 = v34;
  id v14 = v35;
  if (v18)
  {
LABEL_18:
    if (a7) {
      *a7 = v18;
    }
    else {
      _HKLogDroppedError();
    }
  }
LABEL_21:

  return v25;
}

- (int64_t)isClientAuthorizedToWriteObject:(id)a3 sourceBundleIdentifier:(id)a4 clientEntitlements:(id)a5 profile:(id)a6 error:(id *)a7
{
  v51[1] = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v43 = a5;
  id v15 = a6;
  v16 = (void *)MEMORY[0x1E4F2B420];
  v51[0] = v13;
  id v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v51 count:1];
  id v18 = objc_msgSend(v16, "hd_sampleTypesForObjects:", v17);

  id v49 = 0;
  v19 = +[HDAuthorizationStatus authorizationStatusForTypes:v18 bundleIdentifier:v14 profile:v15 error:&v49];
  id v20 = v49;
  id v21 = v20;
  if (!v19)
  {
    int64_t v28 = 2;
    if (!v20) {
      goto LABEL_21;
    }
    goto LABEL_18;
  }
  long long v41 = self;
  uint64_t v22 = [MEMORY[0x1E4F2B2C0] _typesIncludingParentTypes:v18];
  uint64_t v23 = [v19 count];
  v36 = v22;
  if (v23 != [v22 count])
  {
    id v35 = [MEMORY[0x1E4F28B00] currentHandler];
    [v35 handleFailureInMethod:a2, v41, @"HDDefaultAuthorizationSchemaProvider.m", 187, @"Invalid parameter not satisfying: %@", @"[authorizationStatuses count] == [typesIncludingParentTypes count]" object file lineNumber description];
  }
  id v38 = v15;
  id v39 = a7;
  id v40 = v14;
  id v42 = v13;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v37 = v18;
  id v24 = v18;
  uint64_t v25 = [v24 countByEnumeratingWithState:&v45 objects:v50 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v46;
    int64_t v28 = 2;
    do
    {
      uint64_t v29 = 0;
      BOOL v30 = v21;
      do
      {
        if (*(void *)v46 != v27) {
          objc_enumerationMutation(v24);
        }
        uint64_t v31 = *(void *)(*((void *)&v45 + 1) + 8 * v29);
        v32 = [v19 objectForKeyedSubscript:v31];
        id v44 = v30;
        BOOL v33 = +[HDAuthorizationStatus isAuthorizedForObjectType:v31 authorizationStatus:v32 clientEntitlements:v43 sharing:1 error:&v44];
        id v21 = v44;

        if (v33) {
          int64_t v28 = 1;
        }

        ++v29;
        BOOL v30 = v21;
      }
      while (v26 != v29);
      uint64_t v26 = [v24 countByEnumeratingWithState:&v45 objects:v50 count:16];
    }
    while (v26);
  }
  else
  {
    int64_t v28 = 2;
  }

  id v14 = v40;
  id v13 = v42;
  id v15 = v38;
  a7 = v39;
  id v18 = v37;
  if (v21)
  {
LABEL_18:
    if (a7) {
      *a7 = v21;
    }
    else {
      _HKLogDroppedError();
    }
  }
LABEL_21:

  return v28;
}

- (int64_t)setAuthorizationStatuses:(id)a3 authorizationModes:(id)a4 bundleIdentifier:(id)a5 options:(unint64_t)a6 profile:(id)a7 error:(id *)a8
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  id v18 = (void *)MEMORY[0x1E4F1CAD0];
  v19 = [v14 allKeys];
  id v20 = [v18 setWithArray:v19];

  id v21 = [v17 database];
  v51[0] = MEMORY[0x1E4F143A8];
  v51[1] = 3221225472;
  v51[2] = __123__HDDefaultAuthorizationSchemaProvider_setAuthorizationStatuses_authorizationModes_bundleIdentifier_options_profile_error___block_invoke;
  void v51[3] = &unk_1E62F40C0;
  id v50 = v17;
  id v52 = v50;
  id v22 = v16;
  id v53 = v22;
  v54 = self;
  SEL v58 = a2;
  id v55 = v20;
  id v23 = v14;
  id v56 = v23;
  id v57 = v15;
  unint64_t v59 = a6;
  id v24 = v15;
  id v25 = v20;
  BOOL v26 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:v21 error:a8 block:v51];

  if ((a6 & 2) != 0 && v26)
  {
    id v27 = v23;
    id v28 = v50;
    if (self)
    {
      id v49 = v25;
      id v29 = v22;
      BOOL v30 = [v28 sourceManager];
      id v61 = 0;
      uint64_t v31 = [v30 clientSourceForBundleIdentifier:v29 error:&v61];

      id v32 = v61;
      id v47 = v27;
      if (v31)
      {
        if ([v31 _requiresAuthorization])
        {
          BOOL v33 = objc_msgSend(v27, "hk_filterKeysWithBlock:", &__block_literal_global_27);
          v34 = [v33 allObjects];
        }
        else
        {
          v34 = [v27 allKeys];
        }
        id v37 = objc_msgSend(v28, "sourceOrderManager", v24);
        id v60 = v32;
        char v38 = [v37 addOrderedSource:v31 objectTypes:v34 error:&v60];
        id v36 = v60;

        if ((v38 & 1) == 0)
        {
          _HKInitializeLogging();
          id v39 = (void *)*MEMORY[0x1E4F29EF8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29EF8], OS_LOG_TYPE_ERROR))
          {
            id v44 = v39;
            long long v45 = [v31 bundleIdentifier];
            *(_DWORD *)buf = 138543618;
            v63 = v45;
            __int16 v64 = 2114;
            id v65 = v36;
            _os_log_error_impl(&dword_1BCB7D000, v44, OS_LOG_TYPE_ERROR, "Failed to update source order while changing authorization status for %{public}@: %{public}@", buf, 0x16u);
          }
        }

        id v24 = v46;
      }
      else
      {
        _HKInitializeLogging();
        id v35 = (void *)*MEMORY[0x1E4F29EF8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29EF8], OS_LOG_TYPE_ERROR))
        {
          id v42 = v35;
          id v43 = [0 bundleIdentifier];
          *(_DWORD *)buf = 138543618;
          v63 = v43;
          __int16 v64 = 2114;
          id v65 = v32;
          _os_log_error_impl(&dword_1BCB7D000, v42, OS_LOG_TYPE_ERROR, "Failed to find source %{public}@ to update source order after authorization update: %{public}@", buf, 0x16u);
        }
        id v36 = v32;
      }

      id v27 = v47;
      id v25 = v49;
    }
  }
  if (v26) {
    int64_t v40 = 1;
  }
  else {
    int64_t v40 = 2;
  }

  return v40;
}

BOOL __123__HDDefaultAuthorizationSchemaProvider_setAuthorizationStatuses_authorizationModes_bundleIdentifier_options_profile_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  v6 = [*(id *)(a1 + 32) sourceManager];
  uint64_t v7 = *(void *)(a1 + 40);
  id v41 = 0;
  v8 = [v6 localSourceForBundleIdentifier:v7 copyIfNecessary:1 error:&v41];
  id v9 = v41;

  if (v8)
  {
    v10 = +[HDAuthorizationEntity authorizationRecordsByTypeForBundleIdentifier:*(void *)(a1 + 40) types:*(void *)(a1 + 56) profile:*(void *)(a1 + 32) error:a3];
    if (v10)
    {
      uint64_t v35 = 0;
      id v36 = &v35;
      uint64_t v37 = 0x3032000000;
      char v38 = __Block_byref_object_copy__22;
      id v39 = __Block_byref_object_dispose__22;
      id v40 = 0;
      v11 = *(void **)(a1 + 64);
      uint64_t v27 = MEMORY[0x1E4F143A8];
      uint64_t v28 = 3221225472;
      id v29 = __123__HDDefaultAuthorizationSchemaProvider_setAuthorizationStatuses_authorizationModes_bundleIdentifier_options_profile_error___block_invoke_299;
      BOOL v30 = &unk_1E62F5F90;
      id v12 = v10;
      uint64_t v13 = *(void *)(a1 + 48);
      id v31 = v12;
      uint64_t v32 = v13;
      uint64_t v14 = *(void *)(a1 + 80);
      BOOL v33 = &v35;
      uint64_t v34 = v14;
      [v11 enumerateKeysAndObjectsUsingBlock:&v27];
      id v15 = (void *)v36[5];
      if (v15)
      {
        id v16 = v15;
        id v17 = v16;
        if (a3)
        {
          BOOL v18 = 0;
          *a3 = v16;
        }
        else
        {
          _HKLogDroppedError();
          BOOL v18 = 0;
        }
      }
      else
      {
        BOOL v18 = +[HDAuthorizationEntity setAuthorizationStatuses:authorizationRequests:authorizationModes:sourceEntity:options:profile:error:](HDAuthorizationEntity, "setAuthorizationStatuses:authorizationRequests:authorizationModes:sourceEntity:options:profile:error:", *(void *)(a1 + 64), MEMORY[0x1E4F1CC08], *(void *)(a1 + 72), v8, *(void *)(a1 + 88), *(void *)(a1 + 32), a3, v27, v28, v29, v30);
        if (!*(void *)(a1 + 48)) {
          goto LABEL_19;
        }
        v19 = *(void **)(a1 + 32);
        id v20 = @"Authorization changed";
        id v21 = [v19 nanoSyncManager];
        [v21 syncHealthDataWithOptions:0 reason:@"Authorization changed" completion:0];

        if (!*(void *)(a1 + 48)) {
          goto LABEL_19;
        }
        uint64_t v23 = a1 + 32;
        id v22 = *(void **)(a1 + 32);
        id v24 = *(id *)(v23 + 8);
        id v17 = [v22 daemon];
        id v25 = [v17 xpcEventManager];
        [v25 authorizationChangedForBundleIdentifier:v24];
      }
LABEL_19:

      _Block_object_dispose(&v35, 8);
      goto LABEL_20;
    }
    id v12 = 0;
    BOOL v18 = 0;
  }
  else
  {
    if (v9)
    {
      id v12 = v9;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", objc_opt_class(), *(void *)(a1 + 80), @"No source with bundle identifier %@"", *(void *)(a1 + 40));
      id v12 = (id)objc_claimAutoreleasedReturnValue();
      if (!v12)
      {
        id v9 = 0;
        BOOL v18 = 0;
        goto LABEL_21;
      }
    }
    if (a3)
    {
      id v12 = v12;
      BOOL v18 = 0;
      *a3 = v12;
    }
    else
    {
      _HKLogDroppedError();
      BOOL v18 = 0;
    }
    id v9 = v12;
  }
LABEL_20:

LABEL_21:
  return v18;
}

void __123__HDDefaultAuthorizationSchemaProvider_setAuthorizationStatuses_authorizationModes_bundleIdentifier_options_profile_error___block_invoke_299(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v15 = a2;
  id v7 = a3;
  v8 = [*(id *)(a1 + 32) objectForKeyedSubscript:v15];
  uint64_t v9 = [v7 integerValue];
  if (v8)
  {
    if ([v8 isCompatibleStatus:v9]) {
      goto LABEL_6;
    }
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", objc_opt_class(), *(void *)(a1 + 56), @"Invalid authorization status %@ for type %@, request %ld", v7, v15, objc_msgSend(v8, "request""));
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", objc_opt_class(), *(void *)(a1 + 56), @"Missing authorization record for type %@"", v15, v13, v14);
  uint64_t v10 = };
  uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
  id v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;

LABEL_6:
  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)) {
    *a4 = 1;
  }
}

uint64_t __112__HDDefaultAuthorizationSchemaProvider__updateSourceOrderWithAuthorizationStatuses_forBundleIdentifier_profile___block_invoke(uint64_t a1, void *a2)
{
  [a2 integerValue];
  if (HKAuthorizationStatusAllowsReading()) {
    return 1;
  }

  return HKAuthorizationStatusAllowsSharing();
}

@end