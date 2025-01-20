@interface HDCloudSyncValidateSubscriptionsOperation
+ (BOOL)shouldLogAtOperationStart;
- (BOOL)includeSecondaryContainers;
- (HDCloudSyncRegisterSubscriptionsOperation)_registerOperationForSubscriptions:(void *)a3 container:;
- (void)main;
- (void)setIncludeSecondaryContainers:(BOOL)a3;
@end

@implementation HDCloudSyncValidateSubscriptionsOperation

+ (BOOL)shouldLogAtOperationStart
{
  return 0;
}

- (void)main
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  if (self)
  {
    v3 = [(HDCloudSyncOperation *)self profile];
    uint64_t v4 = [v3 profileType];

    switch(v4)
    {
      case 1:
        v9 = [(HDCloudSyncOperation *)self profile];
        v10 = [v9 daemon];
        v11 = [v10 behavior];
        int v12 = [v11 tinkerModeEnabled];

        if (v12)
        {
          *(void *)&long long v66 = HDCloudSyncPrimaryProfileDataRequestedSubscriptionIdentifier;
          *((void *)&v66 + 1) = HDCloudSyncPrimaryProfileDataAvailableForDownloadSubscriptionIdentifier;
          v63 = @"CloudSyncDataUploadRequestRecord";
          v64 = @"CloudSyncStoreRecord";
          *(void *)&long long v67 = HDCloudSyncPrimaryMedicalIDDataAvailableForDownloadSubscriptionIdentifier;
          uint64_t v65 = 0x1F17353E0;
          v6 = (void *)MEMORY[0x1E4F1C9E8];
          uint64_t v7 = 3;
          goto LABEL_5;
        }
        *(void *)&long long v66 = HDCloudSyncPrimaryMedicalIDDataAvailableForDownloadSubscriptionIdentifier;
        uint64_t v5 = 0x1F17353E0;
        goto LABEL_4;
      case 2:
      case 4:
        *(void *)&long long v66 = HDCloudSyncSharedSummaryDataAvailableForDownloadSubscriptionIdentifier;
        uint64_t v5 = 0x1F1749360;
LABEL_4:
        v63 = (__CFString *)v5;
        v6 = (void *)MEMORY[0x1E4F1C9E8];
        uint64_t v7 = 1;
        goto LABEL_5;
      case 3:
        v13 = [(HDCloudSyncOperation *)self profile];
        uint64_t v14 = [v13 profileType];

        if (v14 != 3) {
          goto LABEL_10;
        }
        *(void *)&long long v66 = HDCloudSyncTinkerProfileDataAvailableForDownloadSubscriptionIdentifier;
        *((void *)&v66 + 1) = HDCloudSyncTinkerMedicalIDDataAvailableForDownloadSubscriptionIdentifier;
        v63 = @"CloudSyncStoreRecord";
        v64 = @"CloudSyncMedicalIDRecord";
        v6 = (void *)MEMORY[0x1E4F1C9E8];
        uint64_t v7 = 2;
LABEL_5:
        v8 = [v6 dictionaryWithObjects:&v63 forKeys:&v66 count:v7];
        break;
      default:
LABEL_10:
        v8 = (void *)MEMORY[0x1E4F1CC08];
        break;
    }
  }
  else
  {
    v8 = 0;
  }
  v15 = [HDCloudSyncCompoundOperation alloc];
  v16 = [(HDCloudSyncOperation *)self configuration];
  v17 = [(HDCloudSyncCompoundOperation *)v15 initWithConfiguration:v16 cloudState:0 name:@"Validate subscriptions." continueOnSubOperationError:0];

  v18 = v17;
  if (self)
  {
    id v56 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v55 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v19 = [(HDCloudSyncOperation *)self profile];
    if ([v19 profileType] == 1)
    {
      v20 = [(HDCloudSyncOperation *)self profile];
      v21 = [v20 daemon];
      v22 = [v21 behavior];
      char v23 = [v22 tinkerModeEnabled];

      if (v23)
      {
LABEL_23:

        goto LABEL_24;
      }
      v24 = [(HDCloudSyncOperation *)self profile];
      v25 = [v24 daemon];
      v26 = [v25 cloudSyncCoordinator];
      v19 = [v26 stateSyncDomainForSubscriptionIdentifier];

      long long v68 = 0u;
      long long v69 = 0u;
      long long v66 = 0u;
      long long v67 = 0u;
      v27 = [v19 allKeys];
      uint64_t v28 = [v27 countByEnumeratingWithState:&v66 objects:&v63 count:16];
      if (v28)
      {
        uint64_t v29 = v28;
        uint64_t v30 = *(void *)v67;
        do
        {
          for (uint64_t i = 0; i != v29; ++i)
          {
            if (*(void *)v67 != v30) {
              objc_enumerationMutation(v27);
            }
            uint64_t v32 = *(void *)(*((void *)&v66 + 1) + 8 * i);
            [v56 setObject:0x1F174F500 forKeyedSubscript:v32];
            v33 = [v19 objectForKeyedSubscript:v32];
            [v55 addObject:v33];
          }
          uint64_t v29 = [v27 countByEnumeratingWithState:&v66 objects:&v63 count:16];
        }
        while (v29);
      }

      v61[0] = MEMORY[0x1E4F143A8];
      v61[1] = 3221225472;
      v61[2] = __79__HDCloudSyncValidateSubscriptionsOperation__createZonesForStateEntityDomains___block_invoke;
      v61[3] = &unk_1E62F2F90;
      v61[4] = self;
      v34 = objc_msgSend(v55, "hk_map:", v61);
      v35 = [HDCloudSyncCreateZonesOperation alloc];
      v36 = [(HDCloudSyncOperation *)self configuration];
      v37 = [(HDCloudSyncOperation *)self configuration];
      v38 = [v37 repository];
      v39 = [v38 primaryCKContainer];
      v40 = [(HDCloudSyncCreateZonesOperation *)v35 initWithConfiguration:v36 cloudState:0 zones:v34 container:v39];

      [(HDCloudSyncCompoundOperation *)v18 addOperation:v40 transitionHandler:0];
    }

    goto LABEL_23;
  }
  id v56 = 0;
LABEL_24:

  v41 = objc_msgSend(v8, "hk_dictionaryByAddingEntriesFromDictionary:", v56);
  v42 = [(HDCloudSyncOperation *)self configuration];
  v43 = [v42 repository];
  v44 = [v43 primaryCKContainer];
  v45 = -[HDCloudSyncValidateSubscriptionsOperation _registerOperationForSubscriptions:container:]((HDCloudSyncRegisterSubscriptionsOperation *)self, v41, v44);

  [(HDCloudSyncCompoundOperation *)v18 addOperation:v45 transitionHandler:0];
  if (self->_includeSecondaryContainers)
  {
    long long v59 = 0u;
    long long v60 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    v46 = [(HDCloudSyncOperation *)self configuration];
    v47 = [v46 repository];
    v48 = [v47 secondaryCKContainers];

    uint64_t v49 = [v48 countByEnumeratingWithState:&v57 objects:v62 count:16];
    if (v49)
    {
      uint64_t v50 = v49;
      uint64_t v51 = *(void *)v58;
      do
      {
        for (uint64_t j = 0; j != v50; ++j)
        {
          if (*(void *)v58 != v51) {
            objc_enumerationMutation(v48);
          }
          v53 = -[HDCloudSyncValidateSubscriptionsOperation _registerOperationForSubscriptions:container:]((HDCloudSyncRegisterSubscriptionsOperation *)self, v8, *(void **)(*((void *)&v57 + 1) + 8 * j));
          v54 = [v53 operationIgnoringErrors];
          [(HDCloudSyncCompoundOperation *)v18 addOperation:v54 transitionHandler:0];
        }
        uint64_t v50 = [v48 countByEnumeratingWithState:&v57 objects:v62 count:16];
      }
      while (v50);
    }
  }
  [(HDCloudSyncOperation *)self delegateToOperation:v18];
}

- (HDCloudSyncRegisterSubscriptionsOperation)_registerOperationForSubscriptions:(void *)a3 container:
{
  v3 = a1;
  if (a1)
  {
    id v5 = a3;
    id v6 = a2;
    uint64_t v7 = [HDCloudSyncRegisterSubscriptionsOperation alloc];
    v8 = [(HDCloudSyncOperation *)v3 configuration];
    v3 = [(HDCloudSyncRegisterSubscriptionsOperation *)v7 initWithConfiguration:v8 cloudState:0 container:v5 subscriptions:v6];
  }

  return v3;
}

id __79__HDCloudSyncValidateSubscriptionsOperation__createZonesForStateEntityDomains___block_invoke(uint64_t a1, void *a2)
{
  v3 = (objc_class *)MEMORY[0x1E4F1A310];
  id v4 = a2;
  id v5 = [v3 alloc];
  id v6 = (void *)MEMORY[0x1E4F1A320];
  uint64_t v7 = [*(id *)(a1 + 32) configuration];
  v8 = [v7 syncContainerPrefix];
  v9 = objc_msgSend(v6, "hd_stateSyncZoneIDForSyncCircleIdentifier:domain:", v8, v4);

  v10 = (void *)[v5 initWithZoneID:v9];

  return v10;
}

- (BOOL)includeSecondaryContainers
{
  return self->_includeSecondaryContainers;
}

- (void)setIncludeSecondaryContainers:(BOOL)a3
{
  self->_includeSecondaryContainers = a3;
}

@end