@interface HDVisionPrescriptionAuthorizationSchemaProvider
- (int64_t)isClientAuthorizedToReadObject:(id)a3 sourceBundleIdentifier:(id)a4 clientEntitlements:(id)a5 profile:(id)a6 error:(id *)a7;
- (int64_t)isClientAuthorizedToWriteObject:(id)a3 sourceBundleIdentifier:(id)a4 clientEntitlements:(id)a5 profile:(id)a6 error:(id *)a7;
- (int64_t)setObjectAuthorizationStatuses:(id)a3 forObjectType:(id)a4 bundleIdentifier:(id)a5 sessionIdentifier:(id)a6 profile:(id)a7 error:(id *)a8;
@end

@implementation HDVisionPrescriptionAuthorizationSchemaProvider

- (int64_t)isClientAuthorizedToReadObject:(id)a3 sourceBundleIdentifier:(id)a4 clientEntitlements:(id)a5 profile:(id)a6 error:(id *)a7
{
  v47[1] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v39 = a5;
  id v14 = a6;
  v15 = (void *)MEMORY[0x1E4F2B420];
  v47[0] = v12;
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v47 count:1];
  v17 = objc_msgSend(v15, "hd_sampleTypesForObjects:", v16);

  id v45 = 0;
  v18 = +[HDAuthorizationStatus authorizationStatusForTypes:v17 bundleIdentifier:v13 profile:v14 error:&v45];
  id v19 = v45;
  if (v18)
  {
    v20 = [MEMORY[0x1E4F2B2C0] _typesIncludingParentTypes:v17];
    uint64_t v21 = [v18 count];
    v34 = v20;
    if (v21 != [v20 count])
    {
      v33 = [MEMORY[0x1E4F28B00] currentHandler];
      [v33 handleFailureInMethod:a2, self, @"HDVisionPrescriptionAuthorizationSchemaProvider.m", 50, @"Invalid parameter not satisfying: %@", @"[authorizationStatuses count] == [typesIncludingParentTypes count]" object file lineNumber description];
    }
    id v36 = v14;
    id v37 = v13;
    id v38 = v12;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    v35 = v17;
    id v22 = v17;
    uint64_t v23 = [v22 countByEnumeratingWithState:&v41 objects:v46 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v42;
      int64_t v26 = 2;
      do
      {
        uint64_t v27 = 0;
        v28 = v19;
        do
        {
          if (*(void *)v42 != v25) {
            objc_enumerationMutation(v22);
          }
          uint64_t v29 = *(void *)(*((void *)&v41 + 1) + 8 * v27);
          v30 = [v18 objectForKeyedSubscript:v29];
          id v40 = v28;
          BOOL v31 = +[HDAuthorizationStatus isAuthorizedForObjectType:v29 authorizationStatus:v30 clientEntitlements:v39 sharing:0 error:&v40];
          id v19 = v40;

          if (v31) {
            int64_t v26 = 1;
          }

          ++v27;
          v28 = v19;
        }
        while (v24 != v27);
        uint64_t v24 = [v22 countByEnumeratingWithState:&v41 objects:v46 count:16];
      }
      while (v24);
    }
    else
    {
      int64_t v26 = 2;
    }

    id v13 = v37;
    id v12 = v38;
    v17 = v35;
    id v14 = v36;
  }
  else
  {
    int64_t v26 = 2;
  }

  return v26;
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
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v51 count:1];
  v18 = objc_msgSend(v16, "hd_sampleTypesForObjects:", v17);

  id v49 = 0;
  id v19 = +[HDAuthorizationStatus authorizationStatusForTypes:v18 bundleIdentifier:v14 profile:v15 error:&v49];
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
  id v22 = [MEMORY[0x1E4F2B2C0] _typesIncludingParentTypes:v18];
  uint64_t v23 = [v19 count];
  id v36 = v22;
  if (v23 != [v22 count])
  {
    v35 = [MEMORY[0x1E4F28B00] currentHandler];
    [v35 handleFailureInMethod:a2, v41, @"HDVisionPrescriptionAuthorizationSchemaProvider.m", 91, @"Invalid parameter not satisfying: %@", @"[authorizationStatuses count] == [typesIncludingParentTypes count]" object file lineNumber description];
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
      v30 = v21;
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

- (int64_t)setObjectAuthorizationStatuses:(id)a3 forObjectType:(id)a4 bundleIdentifier:(id)a5 sessionIdentifier:(id)a6 profile:(id)a7 error:(id *)a8
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a5;
  id v36 = a6;
  id v14 = a7;
  id v15 = [v14 sourceManager];
  v16 = [v15 localSourceForBundleIdentifier:v13 error:a8];

  if (v16)
  {
    v17 = [v16 sourceUUIDWithProfile:v14 error:a8];
    if (v17)
    {
      uint64_t v31 = v16;
      v32 = a8;
      BOOL v33 = v14;
      id v34 = v13;
      id v18 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v37 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      id v35 = v12;
      id v19 = v12;
      uint64_t v20 = [v19 countByEnumeratingWithState:&v37 objects:v41 count:16];
      if (v20)
      {
        uint64_t v21 = v20;
        uint64_t v22 = *(void *)v38;
        do
        {
          for (uint64_t i = 0; i != v21; ++i)
          {
            if (*(void *)v38 != v22) {
              objc_enumerationMutation(v19);
            }
            uint64_t v24 = *(void *)(*((void *)&v37 + 1) + 8 * i);
            id v25 = objc_alloc(MEMORY[0x1E4F2B2B8]);
            uint64_t v26 = [v19 objectForKeyedSubscript:v24];
            uint64_t v27 = HKObjectAuthorizationStatusForNumber();
            int64_t v28 = (void *)[v25 initWithObjectUUID:v24 sourceUUID:v17 sessionUUID:v36 status:v27 modificationDate:CFAbsoluteTimeGetCurrent()];

            [v18 addObject:v28];
          }
          uint64_t v21 = [v19 countByEnumeratingWithState:&v37 objects:v41 count:16];
        }
        while (v21);
      }

      id v14 = v33;
      if (+[HDObjectAuthorizationEntity setObjectAuthorizationRecords:syncProvenance:syncIdentity:profile:error:](HDObjectAuthorizationEntity, "setObjectAuthorizationRecords:syncProvenance:syncIdentity:profile:error:", v18, 0, [v33 currentSyncIdentityPersistentID], v33, v32))
      {
        int64_t v29 = 1;
      }
      else
      {
        int64_t v29 = 2;
      }

      id v13 = v34;
      id v12 = v35;
      v16 = v31;
    }
    else
    {
      int64_t v29 = 2;
    }
  }
  else
  {
    int64_t v29 = 2;
  }

  return v29;
}

@end