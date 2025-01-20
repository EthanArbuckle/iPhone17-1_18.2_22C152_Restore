@interface HMDCoreDataCloudTransform
+ (BOOL)transactionIsCloudStoreReset:(id)a3 context:(id)a4;
+ (Class)exportTransformableClassFromEntity:(id)a3;
+ (Class)importTransformableClassFromEntity:(id)a3;
+ (HMDCoreDataCloudTransform)new;
+ (HMDCoreDataCloudTransform)sharedInstance;
+ (id)exportTransformableEntityFromEntity:(id)a3;
+ (id)localTransformableEntityFromEntity:(id)a3;
+ (id)logCategory;
+ (void)wipeCoreDataStorageDueToPCSIdentityLossAndRelaunchHomeKitDaemon;
- (BOOL)badCDPState;
- (BOOL)cloudTransform:(id)a3 isPermittedForHomeWithModelID:(id)a4 isImport:(BOOL)a5;
- (BOOL)runTransformWithError:(id *)a3;
- (HMDCoreData)coreData;
- (HMDCoreDataCloudTransform)init;
- (HMDCoreDataCloudTransform)initWithCoreData:(id)a3 fakeRecordsEnabled:(BOOL)a4 logEventSubmitter:(id)a5 userDefaults:(id)a6;
- (HMDCoreDataCloudTransform)initWithCoreData:(id)a3 logEventSubmitter:(id)a4;
- (HMDCoreDataCloudTransformDelegate)delegate;
- (MKFCloudSyncMetadata)_fetchOrCreateMetadataForManagedObjectContext:(void *)a1;
- (NSUserDefaults)userDefaults;
- (_BYTE)_changeSetForHome:(uint64_t)a3 isImport:(void *)a4 clientIdentifier:(void *)a5 qualityOfService:(void *)a6 cache:;
- (__CFString)_homeModelIDPropertyNameForObjectID:(void *)a1;
- (id)_managedObjectContext;
- (id)cloudImportInProgressStoreIdentifiers;
- (id)fakeHomeChangeSetModelID;
- (id)managedObjectContext;
- (id)newCloudMirrorExportStatusMonitor;
- (id)pendingChangedStoreIdentifiers;
- (uint64_t)_processChangeSet:(int)a3 isImport:(void *)a4 context:;
- (uint64_t)_processExportUpdateForObjectID:(void *)a3 updatedProperties:(void *)a4 additionalUpdates:(void *)a5 context:;
- (uint64_t)_processImportUpdateForObjectID:(void *)a3 updatedProperties:(int)a4 transform:(void *)a5 additionalUpdates:(void *)a6 context:;
- (uint64_t)_saveContextToWorkingStore:(uint64_t)a3 error:;
- (uint64_t)_shouldProcessChange:(void *)a3 homeModelID:(int)a4 isImport:(void *)a5 context:;
- (void)_delayContextDestruction:(uint64_t)a1;
- (void)_enumerateCloudChangeListenersForEntity:(void *)a3 usingBlock:;
- (void)_processHistoryForStore:(id)a3 context:(id)a4;
- (void)_runTransformOnContext:(void *)a3 storeIdentifiers:(void *)a4 completeMergeHomeModelID:(void *)a5 completion:;
- (void)_runTransformWhilePerformingBlockOnContext:(void *)a3 storeIdentifiers:(void *)a4 completeMergeHomeModelID:;
- (void)_saveHomeManagerChangesToWorkingStoreWithContext:(void *)a1;
- (void)_updateWriterPropertiesForCloudObjects:(void *)a1 timestamp:(void *)a2 version:(void *)a3;
- (void)coreData:(id)a3 cloudKitExportFinishedForStoreWithIdentifier:(id)a4 duration:(double)a5 error:(id)a6;
- (void)coreData:(id)a3 cloudKitExportStartedForStoreWithIdentifier:(id)a4;
- (void)coreData:(id)a3 cloudKitImportFinishedForStoreWithIdentifier:(id)a4 duration:(double)a5 error:(id)a6;
- (void)coreData:(id)a3 cloudKitImportStartedForStoreWithIdentifier:(id)a4;
- (void)coreData:(id)a3 persistentStoreWithIdentifierDidChange:(id)a4;
- (void)countResidentsInHomeWithUUID:(id)a3 completion:(id)a4;
- (void)registerCloudChangeListener:(id)a3 forEntities:(id)a4;
- (void)runCompleteMergeTransformForHomeWithModelID:(id)a3 completion:(id)a4;
- (void)runTransformWithCompletion:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation HMDCoreDataCloudTransform

- (void)countResidentsInHomeWithUUID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(HMDCoreDataCloudTransform *)self managedObjectContext];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __75__HMDCoreDataCloudTransform_Home__countResidentsInHomeWithUUID_completion___block_invoke;
  v12[3] = &unk_264A2EE30;
  id v13 = v6;
  id v14 = v8;
  v15 = self;
  id v16 = v7;
  id v9 = v7;
  id v10 = v8;
  id v11 = v6;
  [v10 performBlock:v12];
}

void __75__HMDCoreDataCloudTransform_Home__countResidentsInHomeWithUUID_completion___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v13 = 0;
  v4 = +[MKFCKModel modelWithModelID:v2 context:v3 error:&v13];
  id v5 = v13;
  if (v4)
  {
    uint64_t v6 = *(void *)(a1 + 56);
    id v7 = [v4 residents];
    (*(void (**)(uint64_t, uint64_t, void))(v6 + 16))(v6, [v7 count], 0);
  }
  else
  {
    v8 = (void *)MEMORY[0x230FBD990]();
    id v9 = *(id *)(a1 + 48);
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v11 = HMFGetLogIdentifier();
      uint64_t v12 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138544130;
      v15 = v11;
      __int16 v16 = 2160;
      uint64_t v17 = 1752392040;
      __int16 v18 = 2112;
      uint64_t v19 = v12;
      __int16 v20 = 2114;
      id v21 = v5;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_ERROR, "%{public}@Could not find the home for UUID: %{mask.hash}@. Error: %{public}@", buf, 0x2Au);
    }
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_storeStrong((id *)&self->_coreData, 0);
  objc_storeStrong((id *)&self->_cloudChangeListeners, 0);
  objc_storeStrong((id *)&self->_historyTokensByStoreIdentifier, 0);
  objc_storeStrong((id *)&self->_logEventSubmitter, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_cloudImportInProgressStoreIdentifiers, 0);
  objc_storeStrong((id *)&self->_pendingChangedStoreIdentifiers, 0);
  objc_destroyWeak((id *)&self->_lazyManagedObjectContext);
  objc_storeStrong((id *)&self->_mergePolicy, 0);
  objc_storeStrong((id *)&self->_logger, 0);
}

- (NSUserDefaults)userDefaults
{
  return self->_userDefaults;
}

- (HMDCoreData)coreData
{
  return self->_coreData;
}

- (void)setDelegate:(id)a3
{
}

- (HMDCoreDataCloudTransformDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HMDCoreDataCloudTransformDelegate *)WeakRetained;
}

- (void)_processHistoryForStore:(id)a3 context:(id)a4
{
  v178[2] = *MEMORY[0x263EF8340];
  id v149 = a3;
  id v150 = a4;
  id v5 = [v149 identifier];
  uint64_t v6 = objc_msgSend(v150, "hmd_cloudPrivateStoreIdentifier");
  int v7 = [v5 isEqualToString:v6];

  int v145 = v7;
  if (v7)
  {
    int v140 = 0;
    int v147 = 1;
    v8 = @"cloud private";
  }
  else
  {
    id v9 = [v149 identifier];
    id v10 = objc_msgSend(v150, "hmd_cloudSharedStoreIdentifier");
    int v11 = [v9 isEqualToString:v10];

    if (v11)
    {
      int v140 = 1;
      v141 = @"cloud shared";
      int v147 = 1;
      goto LABEL_7;
    }
    int v140 = 0;
    int v147 = 0;
    v8 = @"working";
  }
  v141 = v8;
LABEL_7:
  context = (void *)MEMORY[0x230FBD990]();
  if (self) {
    historyTokensByStoreIdentifier = self->_historyTokensByStoreIdentifier;
  }
  else {
    historyTokensByStoreIdentifier = 0;
  }
  id v13 = historyTokensByStoreIdentifier;
  id v14 = [v149 identifier];
  v15 = [(NSMutableDictionary *)v13 objectForKeyedSubscript:v14];

  __int16 v16 = [MEMORY[0x263EFF2F8] fetchHistoryAfterToken:v15];
  [v16 setFetchBatchSize:10];
  id v164 = v149;
  uint64_t v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v164 count:1];
  [v16 setAffectedStores:v17];

  id v160 = 0;
  __int16 v18 = [v150 executeRequest:v16 error:&v160];
  id v19 = v160;
  if (v18)
  {
    __int16 v20 = [v18 result];
    id v21 = [v20 lastObject];
    v148 = [v21 token];

    id v22 = v20;
    id v23 = v150;
    v24 = v23;
    if (self)
    {
      id v25 = v23;
      v26 = (objc_class *)MEMORY[0x263F42598];
      id v27 = v22;
      v28 = (HMDCoreDataCloudTransform *)objc_alloc_init(v26);
      *(void *)buf = MEMORY[0x263EF8330];
      *(void *)&buf[8] = 3221225472;
      if (v147)
      {
        *(void *)&buf[16] = __71__HMDCoreDataCloudTransform__changeSetsFromImportTransactions_context___block_invoke;
        v166 = (const char *)&unk_264A283E8;
        *(void *)&long long v167 = self;
        v29 = (HMDCoreDataCloudTransform *)v25;
        *((void *)&v167 + 1) = v29;
        v168 = v28;
      }
      else
      {
        *(void *)&buf[16] = __71__HMDCoreDataCloudTransform__changeSetsFromExportTransactions_context___block_invoke;
        v166 = (const char *)&unk_264A283E8;
        *(void *)&long long v167 = self;
        *((void *)&v167 + 1) = v28;
        v29 = (HMDCoreDataCloudTransform *)v25;
        v168 = v29;
      }
      v30 = v28;
      objc_msgSend(v27, "hmf_enumerateWithAutoreleasePoolUsingBlock:", buf);

      v146 = [(HMDCoreDataCloudTransform *)v30 allValues];
    }
    else
    {
      v146 = 0;
    }
  }
  else
  {
    v31 = (void *)MEMORY[0x230FBD990]();
    v32 = self;
    v33 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      v34 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138544130;
      *(void *)&uint8_t buf[4] = v34;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v141;
      *(_WORD *)&buf[22] = 2114;
      v166 = v15;
      LOWORD(v167) = 2114;
      *(void *)((char *)&v167 + 2) = v19;
      _os_log_impl(&dword_22F52A000, v33, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch history for %{public}@ store with token %{public}@: %{public}@", buf, 0x2Au);
    }
    v146 = 0;
    v148 = 0;
  }

  if (v18)
  {
    uint64_t v156 = 0;
    v157 = &v156;
    uint64_t v158 = 0x2020000000;
    char v159 = 0;
    v152[0] = MEMORY[0x263EF8330];
    v152[1] = 3221225472;
    v152[2] = __61__HMDCoreDataCloudTransform__processHistoryForStore_context___block_invoke;
    v152[3] = &unk_264A1F1B0;
    v152[4] = self;
    char v155 = v147;
    id v35 = v150;
    id v153 = v35;
    v154 = &v156;
    objc_msgSend(v146, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v152);
    if (objc_msgSend(v35, "hmd_homeManagerApplicationDataChanged"))
    {
      objc_msgSend(v35, "setHmd_homeManagerApplicationDataChanged:", 0);
      id v36 = v35;
      v37 = v36;
      if (self)
      {
        v38 = (void *)MEMORY[0x230FBD990]();
        v39 = self;
        v40 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
        {
          v41 = HMFGetLogIdentifier();
          *(_DWORD *)v174 = 138543362;
          *(void *)&v174[4] = v41;
          _os_log_impl(&dword_22F52A000, v40, OS_LOG_TYPE_INFO, "%{public}@Running check to see if home manager application data has changed", v174, 0xCu);
        }
        v42 = +[MKFCKHome fetchRequest];
        [v42 setFetchBatchSize:10];
        v178[0] = @"primaryHomeCounter";
        v178[1] = @"homeManagerApplicationData";
        v43 = [MEMORY[0x263EFF8C0] arrayWithObjects:v178 count:2];
        v44 = +[MKFCKModel appendDefaultPreloadedPropertiesTo:v43];
        [v42 setPropertiesToFetch:v44];

        id v163 = 0;
        v45 = [v37 executeFetchRequest:v42 error:&v163];
        id v46 = v163;
        if (!v45)
        {
          v55 = (void *)MEMORY[0x230FBD990]();
          v56 = v39;
          v57 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
          {
            v58 = HMFGetLogIdentifier();
            *(_DWORD *)v174 = 138543618;
            *(void *)&v174[4] = v58;
            *(_WORD *)&v174[12] = 2114;
            *(void *)&v174[14] = v46;
            _os_log_impl(&dword_22F52A000, v57, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch homes: %{public}@", v174, 0x16u);
          }
          int v59 = 0;
          goto LABEL_39;
        }
        *(void *)v174 = 0;
        *(void *)&v174[8] = v174;
        *(void *)&v174[16] = 0x3032000000;
        v175 = __Block_byref_object_copy__116043;
        v176 = __Block_byref_object_dispose__116044;
        id v177 = 0;
        v162[0] = (id)MEMORY[0x263EF8330];
        v162[1] = (id)3221225472;
        v162[2] = __74__HMDCoreDataCloudTransform__updateHomeManagerApplicationDataWithContext___block_invoke;
        v162[3] = &unk_264A1F4A0;
        v162[4] = v174;
        objc_msgSend(v45, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v162);
        id v161 = v46;
        v47 = +[_MKFHomeManager fetchWithContext:v37 error:&v161];
        id contexta = v161;

        if (v47)
        {
          v48 = [v47 appDataDictionary];
          v49 = [*(id *)(*(void *)&v174[8] + 40) homeManagerApplicationData];
          int v50 = isEqualDeepCompare(v48, v49);

          if (!v50)
          {
            v62 = [*(id *)(*(void *)&v174[8] + 40) homeManagerApplicationData];
            v63 = (void *)[v62 copy];

            v64 = objc_msgSend(v37, "hmd_homeManagerContext");

            v65 = [(id)objc_opt_class() _homeManagerContextFromContext:v37];
            *(void *)buf = MEMORY[0x263EF8330];
            *(void *)&buf[8] = 3221225472;
            *(void *)&buf[16] = __74__HMDCoreDataCloudTransform__updateHomeManagerApplicationDataWithContext___block_invoke_242;
            v166 = (const char *)&unk_264A2F000;
            v169 = v174;
            id v66 = v63;
            *(void *)&long long v167 = v66;
            id v67 = v65;
            *((void *)&v167 + 1) = v67;
            v168 = v39;
            [v67 performBlockAndWait:buf];
            if (!v64) {
              objc_msgSend(v37, "setHmd_homeManagerContext:", 0);
            }

            int v59 = 1;
            goto LABEL_38;
          }
          v51 = (void *)MEMORY[0x230FBD990]();
          v52 = v39;
          HMFGetOSLogHandle();
          v53 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
          {
            v54 = HMFGetLogIdentifier();
            *(_DWORD *)v170 = 138543362;
            v171 = v54;
            _os_log_impl(&dword_22F52A000, v53, OS_LOG_TYPE_DEBUG, "%{public}@Home manager application data is unchanged", v170, 0xCu);
          }
        }
        else
        {
          v51 = (void *)MEMORY[0x230FBD990]();
          v60 = v39;
          HMFGetOSLogHandle();
          v53 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
          {
            v61 = HMFGetLogIdentifier();
            *(_DWORD *)v170 = 138543618;
            v171 = v61;
            __int16 v172 = 2114;
            id v173 = contexta;
            _os_log_impl(&dword_22F52A000, v53, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch home manager: %{public}@", v170, 0x16u);
          }
        }

        int v59 = 0;
LABEL_38:

        _Block_object_dispose(v174, 8);
        id v46 = contexta;
LABEL_39:

        v68 = v157;
        if (v59) {
          *((unsigned char *)v157 + 24) = 1;
        }
LABEL_45:
        v69 = self;
        BOOL v70 = *((unsigned char *)v68 + 24) == 0;
        int v71 = v145;
        if (!v70) {
          int v71 = 1;
        }
        if (v71 == 1)
        {
          contextb = -[HMDCoreDataCloudTransform _fetchOrCreateMetadataForManagedObjectContext:](self, v35);
          if (v145
            && ([contextb historyTokenForCloudStore],
                v72 = objc_claimAutoreleasedReturnValue(),
                BOOL v73 = v72 == 0,
                v72,
                v73))
          {
            v69 = self;
            if (v148) {
              goto LABEL_110;
            }
            id v89 = v149;
            id v138 = v35;
            if (self)
            {
              v90 = (void *)MEMORY[0x230FBD990]();
              v91 = self;
              v92 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v92, OS_LOG_TYPE_DEBUG))
              {
                v93 = HMFGetLogIdentifier();
                *(_DWORD *)buf = 138543362;
                *(void *)&uint8_t buf[4] = v93;
                _os_log_impl(&dword_22F52A000, v92, OS_LOG_TYPE_DEBUG, "%{public}@Fetching NSPersistentCloudKitContainerEvents for first import check", buf, 0xCu);
              }
              v139 = [MEMORY[0x263EFF2D8] fetchRequestForEvents];
              v94 = objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"(succeeded == YES) AND (type == %ld) AND (endDate != nil)", 1);
              [v139 setPredicate:v94];

              v95 = [MEMORY[0x263EFF2D8] fetchEventsMatchingFetchRequest:v139];
              [v95 setResultType:1];
              *(void *)v174 = v89;
              v96 = [MEMORY[0x263EFF8C0] arrayWithObjects:v174 count:1];
              [v95 setAffectedStores:v96];

              v162[0] = 0;
              v97 = [v138 executeRequest:v95 error:v162];
              id v137 = v162[0];
              if (v97)
              {
                id v136 = v97;
                v98 = [v136 result];
                if ([v98 count]
                  && ([v98 firstObject],
                      v99 = objc_claimAutoreleasedReturnValue(),
                      uint64_t v100 = [v99 unsignedIntegerValue],
                      v99,
                      v100))
                {
                  v101 = (void *)MEMORY[0x230FBD990]();
                  v102 = v91;
                  v103 = HMFGetOSLogHandle();
                  if (os_log_type_enabled(v103, OS_LOG_TYPE_INFO))
                  {
                    v104 = HMFGetLogIdentifier();
                    v105 = "s";
                    *(_DWORD *)buf = 138543874;
                    *(void *)&uint8_t buf[4] = v104;
                    if (v100 == 1) {
                      v105 = "";
                    }
                    *(_WORD *)&buf[12] = 2048;
                    *(void *)&buf[14] = v100;
                    *(_WORD *)&buf[22] = 2080;
                    v166 = v105;
                    _os_log_impl(&dword_22F52A000, v103, OS_LOG_TYPE_INFO, "%{public}@Found %ld import NSPersistentCloudKitContainerEvent%s, using current history token for store", buf, 0x20u);
                  }
                  v106 = [v138 persistentStoreCoordinator];
                  *(void *)buf = v89;
                  v107 = [MEMORY[0x263EFF8C0] arrayWithObjects:buf count:1];
                  v148 = [v106 currentPersistentHistoryTokenFromStores:v107];
                }
                else
                {
                  v128 = (void *)MEMORY[0x230FBD990]();
                  v129 = v91;
                  v130 = HMFGetOSLogHandle();
                  if (os_log_type_enabled(v130, OS_LOG_TYPE_INFO))
                  {
                    v131 = HMFGetLogIdentifier();
                    *(_DWORD *)buf = 138543362;
                    *(void *)&uint8_t buf[4] = v131;
                    _os_log_impl(&dword_22F52A000, v130, OS_LOG_TYPE_INFO, "%{public}@Found no import NSPersistentCloudKitContainerEvents", buf, 0xCu);
                  }
                  v148 = 0;
                }
              }
              else
              {
                v132 = (void *)MEMORY[0x230FBD990]();
                v133 = v91;
                v134 = HMFGetOSLogHandle();
                if (os_log_type_enabled(v134, OS_LOG_TYPE_ERROR))
                {
                  v135 = HMFGetLogIdentifier();
                  *(_DWORD *)buf = 138543618;
                  *(void *)&uint8_t buf[4] = v135;
                  *(_WORD *)&buf[12] = 2114;
                  *(void *)&buf[14] = v137;
                  _os_log_impl(&dword_22F52A000, v134, OS_LOG_TYPE_ERROR, "%{public}@NSPersistentCloudKitContainerEventRequest failed: %{public}@", buf, 0x16u);
                }
                v148 = 0;
              }
            }
            else
            {
              v148 = 0;
            }

            v69 = self;
            if (v148) {
LABEL_110:
            }
              *((unsigned char *)v157 + 24) = 1;
            else {
              v148 = 0;
            }
          }
          else
          {
            v69 = self;
          }
        }
        else
        {
          contextb = 0;
        }
        p_lock = &v69->_lock.lock;
        uint64_t v75 = os_unfair_lock_lock_with_options();
        char v76 = v147;
        if (!v69) {
          char v76 = 1;
        }
        if ((v76 & 1) == 0)
        {
          uint64_t v75 = [(NSMutableSet *)v69->_cloudImportInProgressStoreIdentifiers count];
          if (v75)
          {
            v77 = (void *)MEMORY[0x230FBD990]();
            v78 = self;
            HMFGetOSLogHandle();
            v79 = (id)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
            {
              v80 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543362;
              *(void *)&uint8_t buf[4] = v80;
              _os_log_impl(&dword_22F52A000, v79, OS_LOG_TYPE_DEFAULT, "%{public}@Cloud import is in progress, move the current export to pending and abort", buf, 0xCu);
            }
            v81 = v78->_pendingChangedStoreIdentifiers;
            v82 = objc_msgSend(v35, "hmd_workingStoreIdentifier");
            [(NSMutableSet *)v81 addObject:v82];
            goto LABEL_98;
          }
        }
        if (*((unsigned char *)v157 + 24))
        {
          if (v145)
          {
            v83 = [contextb historyTokenForCloudStore];
            char v84 = HMFEqualObjects();

            if ((v84 & 1) == 0)
            {
              [contextb setHistoryTokenForCloudStore:v148];
              goto LABEL_80;
            }
          }
          if (v140)
          {
            v85 = [contextb historyTokenForCloudSharedStore];
            char v86 = HMFEqualObjects();

            if ((v86 & 1) == 0)
            {
              [contextb setHistoryTokenForCloudSharedStore:v148];
              goto LABEL_80;
            }
          }
          v87 = [contextb historyTokenForWorkingStore];
          char v88 = HMFEqualObjects();

          if ((v88 & 1) == 0)
          {
            [contextb setHistoryTokenForWorkingStore:v148];
LABEL_80:
            id v108 = v35;
            if (self)
            {
              v109 = @"export";
              if (v147) {
                v109 = @"import";
              }
              v110 = v109;
              v111 = (void *)MEMORY[0x230FBD990]([v108 setMergePolicy:*MEMORY[0x263EFEFF8]]);
              v112 = self;
              v113 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v113, OS_LOG_TYPE_DEBUG))
              {
                v114 = HMFGetLogIdentifier();
                *(_DWORD *)buf = 138543618;
                *(void *)&uint8_t buf[4] = v114;
                *(_WORD *)&buf[12] = 2114;
                *(void *)&buf[14] = v110;
                _os_log_impl(&dword_22F52A000, v113, OS_LOG_TYPE_DEBUG, "%{public}@Saving history tokens after processing %{public}@ changes", buf, 0x16u);
              }
              *(void *)v174 = 0;
              char v115 = objc_msgSend(v108, "hmd_saveWithTransactionAuthor:error:", 4, v174);
              v116 = (char *)*(id *)v174;
              v117 = (void *)MEMORY[0x230FBD990]();
              v118 = v112;
              v119 = HMFGetOSLogHandle();
              v120 = v119;
              if (v115)
              {
                if (os_log_type_enabled(v119, OS_LOG_TYPE_DEBUG))
                {
                  v121 = HMFGetLogIdentifier();
                  *(_DWORD *)buf = 138543618;
                  *(void *)&uint8_t buf[4] = v121;
                  *(_WORD *)&buf[12] = 2114;
                  *(void *)&buf[14] = v110;
                  _os_log_impl(&dword_22F52A000, v120, OS_LOG_TYPE_DEBUG, "%{public}@Finished saving history tokens after processing %{public}@ changes", buf, 0x16u);
                }
              }
              else if (os_log_type_enabled(v119, OS_LOG_TYPE_ERROR))
              {
                v122 = HMFGetLogIdentifier();
                *(_DWORD *)buf = 138543874;
                *(void *)&uint8_t buf[4] = v122;
                *(_WORD *)&buf[12] = 2114;
                *(void *)&buf[14] = v110;
                *(_WORD *)&buf[22] = 2114;
                v166 = v116;
                _os_log_impl(&dword_22F52A000, v120, OS_LOG_TYPE_ERROR, "%{public}@Failed to save change tokens after processing %{public}@ changes: %{public}@", buf, 0x20u);
              }
            }
          }
        }
        if (!v148)
        {
LABEL_99:
          os_unfair_lock_unlock(p_lock);

          _Block_object_dispose(&v156, 8);
          goto LABEL_100;
        }
        v123 = (void *)MEMORY[0x230FBD990](v75);
        v124 = self;
        HMFGetOSLogHandle();
        v125 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v125, OS_LOG_TYPE_DEBUG))
        {
          v126 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543874;
          *(void *)&uint8_t buf[4] = v126;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v141;
          *(_WORD *)&buf[22] = 2114;
          v166 = v148;
          _os_log_impl(&dword_22F52A000, v125, OS_LOG_TYPE_DEBUG, "%{public}@Advancing in-memory history token for %{public}@ store: %{public}@", buf, 0x20u);
        }
        v127 = self;
        if (self) {
          v127 = (HMDCoreDataCloudTransform *)v124->_historyTokensByStoreIdentifier;
        }
        v81 = v127;
        v82 = [v149 identifier];
        [(NSMutableSet *)v81 setObject:v148 forKeyedSubscript:v82];
LABEL_98:

        goto LABEL_99;
      }
    }
    v68 = v157;
    goto LABEL_45;
  }
LABEL_100:
}

uint64_t __61__HMDCoreDataCloudTransform__processHistoryForStore_context___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = -[HMDCoreDataCloudTransform _processChangeSet:isImport:context:](*(void **)(a1 + 32), a2, *(unsigned __int8 *)(a1 + 56), *(void **)(a1 + 40));
  if (result) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
  return result;
}

- (MKFCloudSyncMetadata)_fetchOrCreateMetadataForManagedObjectContext:(void *)a1
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = v3;
  if (!a1)
  {
    v15 = 0;
    goto LABEL_14;
  }
  id v5 = v3;
  uint64_t v6 = +[MKFCloudSyncMetadata fetchRequest];
  [v6 setReturnsObjectsAsFaults:0];
  id v21 = 0;
  int v7 = [v5 executeFetchRequest:v6 error:&v21];
  id v8 = v21;
  if (v7)
  {
    if ((unint64_t)[v7 count] < 2) {
      goto LABEL_10;
    }
    id v9 = (void *)MEMORY[0x230FBD990]();
    id v10 = a1;
    int v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v23 = v12;
      __int16 v24 = 2114;
      id v25 = v7;
      id v13 = "%{public}@More than one metadata object (using first): %{public}@";
LABEL_8:
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_ERROR, v13, buf, 0x16u);
    }
  }
  else
  {
    id v9 = (void *)MEMORY[0x230FBD990]();
    id v14 = a1;
    int v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v23 = v12;
      __int16 v24 = 2114;
      id v25 = v8;
      id v13 = "%{public}@Failed to fetch metadata objects: %{public}@";
      goto LABEL_8;
    }
  }

LABEL_10:
  v15 = [v7 firstObject];

  if (!v15)
  {
    v15 = [[MKFCloudSyncMetadata alloc] initWithContext:v5];
    __int16 v16 = (void *)MEMORY[0x230FBD990]();
    id v17 = a1;
    __int16 v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      id v19 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v23 = v19;
      _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_INFO, "%{public}@Created new metadata object", buf, 0xCu);
    }
  }
LABEL_14:

  return v15;
}

- (id)pendingChangedStoreIdentifiers
{
  if (a1)
  {
    a1 = (id *)a1[7];
    uint64_t v1 = vars8;
  }
  return a1;
}

void __74__HMDCoreDataCloudTransform__updateHomeManagerApplicationDataWithContext___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v7 = v4;
  if (*(void *)(v5 + 40))
  {
    uint64_t v6 = [v4 primaryHomeCounter];
    if (v6 <= [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) primaryHomeCounter]) {
      goto LABEL_5;
    }
    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  }
  objc_storeStrong((id *)(v5 + 40), a2);
LABEL_5:
}

void __74__HMDCoreDataCloudTransform__updateHomeManagerApplicationDataWithContext___block_invoke_242(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x230FBD990]();
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) _importHomeManagerNewHome:0 newPrimaryHome:0 newApplicationData:*(void *)(a1 + 32) context:*(void *)(a1 + 40)];
  -[HMDCoreDataCloudTransform _saveHomeManagerChangesToWorkingStoreWithContext:](*(void **)(a1 + 48), *(void **)(a1 + 40));
  [*(id *)(a1 + 40) reset];
}

- (void)_saveHomeManagerChangesToWorkingStoreWithContext:(void *)a1
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (a1)
  {
    id v15 = 0;
    char v4 = -[HMDCoreDataCloudTransform _saveContextToWorkingStore:error:]((uint64_t)a1, v3, (uint64_t)&v15);
    id v5 = v15;
    uint64_t v6 = (void *)MEMORY[0x230FBD990]();
    id v7 = a1;
    id v8 = HMFGetOSLogHandle();
    id v9 = v8;
    if (v4)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        id v10 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        id v17 = v10;
        int v11 = "%{public}@Saved home manager changes";
        uint64_t v12 = v9;
        os_log_type_t v13 = OS_LOG_TYPE_INFO;
        uint32_t v14 = 12;
LABEL_7:
        _os_log_impl(&dword_22F52A000, v12, v13, v11, buf, v14);
      }
    }
    else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v10 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v17 = v10;
      __int16 v18 = 2114;
      id v19 = v5;
      int v11 = "%{public}@Failed to save home manager changes: %{public}@";
      uint64_t v12 = v9;
      os_log_type_t v13 = OS_LOG_TYPE_ERROR;
      uint32_t v14 = 22;
      goto LABEL_7;
    }
  }
}

- (uint64_t)_saveContextToWorkingStore:(uint64_t)a3 error:
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a2;
  [v5 setMergePolicy:v4];
  uint64_t v6 = objc_msgSend(v5, "hmd_saveWithTransactionAuthor:error:", 4, a3);

  return v6;
}

- (uint64_t)_processChangeSet:(int)a3 isImport:(void *)a4 context:
{
  uint64_t v236 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a4;
  id v177 = v7;
  if (a1)
  {
    if (v7 && ([v7[3] count] || objc_msgSend(v7[2], "count") || objc_msgSend(v7[1], "count")))
    {
      id v9 = @"export";
      if (a3) {
        id v9 = @"import";
      }
      id v173 = v9;
      objc_msgSend(v8, "setHmd_currentChangeSet:", v7);
      v178 = v8;
      int v169 = a3;
      v171 = a1;
      if (a3)
      {
        v174 = v7;
        id v10 = v8;
        int v11 = (void *)MEMORY[0x230FBD990]();
        uint64_t v12 = a1;
        os_log_type_t v13 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          uint32_t v14 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          *(void *)&uint8_t buf[4] = v14;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v174;
          _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@Processing import changes: %{public}@", buf, 0x16u);
        }
        uint64_t v210 = 0;
        v211 = &v210;
        uint64_t v212 = 0x2020000000;
        char v213 = 0;
        id v15 = -[HMDCoreDataCloudTransformChangeSet inserts](v174);
        uint64_t v204 = MEMORY[0x263EF8330];
        uint64_t v205 = 3221225472;
        uint64_t v206 = (uint64_t)__61__HMDCoreDataCloudTransform__processImportChangeSet_context___block_invoke;
        uint64_t v207 = (uint64_t)&unk_264A1F248;
        id v16 = v10;
        id v208 = v16;
        v209 = &v210;
        objc_msgSend(v15, "hmf_enumerateWithAutoreleasePoolUsingBlock:", &v204);

        id v17 = -[HMDCoreDataCloudTransformChangeSet updates](v174);
        *(void *)v232 = MEMORY[0x263EF8330];
        *(void *)&v232[8] = 3221225472;
        *(void *)&v232[16] = __61__HMDCoreDataCloudTransform__processImportChangeSet_context___block_invoke_2;
        v233 = &unk_264A1F270;
        id v18 = v16;
        id v234 = v18;
        v235 = &v210;
        [v17 enumerateKeysAndObjectsUsingBlock:v232];

        [v18 processPendingChanges];
        if (*((unsigned char *)v211 + 24))
        {
          id v19 = [[HMDLogEventCoreDataSignificantEvent alloc] initWithReason:4];
          [(HMDLogEventCoreDataSignificantEvent *)v19 setContext:@"DuplicateModelID"];
          id v20 = v12[10];
          [v20 submitLogEvent:v19];
        }
        char v21 = *((unsigned char *)v174 + 32);
        id v22 = [MEMORY[0x263EFF9A0] dictionary];
        uint64_t v200 = 0;
        v201 = &v200;
        uint64_t v202 = 0x2020000000;
        uint64_t v203 = 1;
        id v23 = v177[3];
        *(void *)buf = MEMORY[0x263EF8330];
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = __61__HMDCoreDataCloudTransform__processImportChangeSet_context___block_invoke_3;
        uint64_t v228 = (uint64_t)&unk_264A1F298;
        v230 = &v200;
        *(void *)v229 = v12;
        char v231 = v21;
        id v24 = v22;
        *(void *)&v229[8] = v24;
        id v167 = v18;
        *(void *)&v229[16] = v167;
        [v23 enumerateKeysAndObjectsUsingBlock:buf];

        if (v201[3])
        {
          id v25 = -[HMDCoreDataCloudTransformChangeSet inserts](v174);
          id v191 = (id)MEMORY[0x263EF8330];
          uint64_t v192 = 3221225472;
          uint64_t v193 = (uint64_t)__61__HMDCoreDataCloudTransform__processImportChangeSet_context___block_invoke_4;
          v194 = (uint64_t (*)(uint64_t, uint64_t))&unk_264A1F2C0;
          v198 = &v200;
          v195 = (void (*)(uint64_t))v12;
          char v199 = v21;
          id v24 = v24;
          id v196 = v24;
          id v26 = v167;
          id v197 = v26;
          objc_msgSend(v25, "hmf_enumerateWithAutoreleasePoolUsingBlock:", &v191);

          if (v201[3])
          {
            id v27 = -[HMDCoreDataCloudTransformChangeSet updates](v174);
            v218 = (void *)MEMORY[0x263EF8330];
            uint64_t v219 = 3221225472;
            v220 = __61__HMDCoreDataCloudTransform__processImportChangeSet_context___block_invoke_5;
            v221 = &unk_264A1F2E8;
            v225 = &v200;
            v222 = v12;
            char v226 = v21;
            id v24 = v24;
            id v223 = v24;
            id v28 = v26;
            id v224 = v28;
            [v27 enumerateKeysAndObjectsUsingBlock:&v218];

            if (v201[3])
            {
              *(void *)&long long v29 = 138543618;
              long long v166 = v29;
              while (objc_msgSend(v24, "count", v166))
              {
                v30 = (void *)MEMORY[0x230FBD990]();
                v31 = v12;
                HMFGetOSLogHandle();
                v32 = (id)objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
                {
                  v33 = HMFGetLogIdentifier();
                  *(_DWORD *)v214 = v166;
                  v215 = v33;
                  __int16 v216 = 2114;
                  v217 = v174;
                  _os_log_impl(&dword_22F52A000, v32, OS_LOG_TYPE_INFO, "%{public}@Processing import additional updates: %{public}@", v214, 0x16u);
                }
                id v34 = v24;
                id v35 = [MEMORY[0x263EFF9A0] dictionary];

                uint64_t v182 = MEMORY[0x263EF8330];
                uint64_t v183 = 3221225472;
                v184 = __61__HMDCoreDataCloudTransform__processImportChangeSet_context___block_invoke_214;
                v185 = &unk_264A1F310;
                v189 = &v200;
                v186 = v31;
                char v190 = v21;
                id v24 = v35;
                id v187 = v24;
                id v188 = v28;
                [v34 enumerateKeysAndObjectsUsingBlock:&v182];
                BOOL v36 = v201[3] == 0;

                if (v36) {
                  goto LABEL_21;
                }
              }
              uint64_t v37 = v201[3];
            }
            else
            {
LABEL_21:
              uint64_t v37 = 0;
            }
          }
          else
          {
            uint64_t v37 = 0;
          }
        }
        else
        {
          uint64_t v37 = 0;
        }

        _Block_object_dispose(&v200, 8);
        _Block_object_dispose(&v210, 8);
      }
      else
      {
        v38 = v7;
        id v39 = v8;
        v175 = v38;
        if (*((unsigned char *)v38 + 32))
        {
          v40 = (void *)MEMORY[0x230FBD990]();
          id v41 = a1;
          v42 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
          {
            v43 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            *(void *)&uint8_t buf[4] = v43;
            *(_WORD *)&buf[12] = 2114;
            *(void *)&buf[14] = v175;
            _os_log_impl(&dword_22F52A000, v42, OS_LOG_TYPE_INFO, "%{public}@Processing export changes: %{public}@", buf, 0x16u);
          }
          v44 = [MEMORY[0x263EFF9A0] dictionary];
          uint64_t v204 = 0;
          uint64_t v205 = (uint64_t)&v204;
          uint64_t v206 = 0x2020000000;
          uint64_t v207 = 1;
          id v45 = v177[3];
          *(void *)buf = MEMORY[0x263EF8330];
          *(void *)&buf[8] = 3221225472;
          *(void *)&buf[16] = __61__HMDCoreDataCloudTransform__processExportChangeSet_context___block_invoke;
          uint64_t v228 = (uint64_t)&unk_264A1F388;
          v230 = &v204;
          *(void *)v229 = v41;
          id v46 = v44;
          *(void *)&v229[8] = v46;
          id v47 = v39;
          *(void *)&v229[16] = v47;
          [v45 enumerateKeysAndObjectsUsingBlock:buf];

          if (*(void *)(v205 + 24))
          {
            id v48 = v175[1];
            id v191 = (id)MEMORY[0x263EF8330];
            uint64_t v192 = 3221225472;
            uint64_t v193 = (uint64_t)__61__HMDCoreDataCloudTransform__processExportChangeSet_context___block_invoke_2;
            v194 = (uint64_t (*)(uint64_t, uint64_t))&unk_264A1F3B0;
            v198 = &v204;
            v195 = (void (*)(uint64_t))v41;
            id v46 = v46;
            id v196 = v46;
            id v49 = v47;
            id v197 = v49;
            objc_msgSend(v48, "hmf_enumerateWithAutoreleasePoolUsingBlock:", &v191);

            if (*(void *)(v205 + 24))
            {
              id v50 = v175[2];
              v218 = (void *)MEMORY[0x263EF8330];
              uint64_t v219 = 3221225472;
              v220 = __61__HMDCoreDataCloudTransform__processExportChangeSet_context___block_invoke_3;
              v221 = &unk_264A1F3D8;
              v225 = &v204;
              v222 = (id *)v41;
              id v46 = v46;
              id v223 = v46;
              id v51 = v49;
              id v224 = v51;
              [v50 enumerateKeysAndObjectsUsingBlock:&v218];

              if (*(void *)(v205 + 24))
              {
                while ([v46 count])
                {
                  v52 = (void *)MEMORY[0x230FBD990]();
                  id v53 = v41;
                  HMFGetOSLogHandle();
                  v54 = (id)objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
                  {
                    HMFGetLogIdentifier();
                    id v55 = (id)objc_claimAutoreleasedReturnValue();
                    v56 = [v46 allKeys];
                    *(_DWORD *)v232 = 138543618;
                    *(void *)&v232[4] = v55;
                    *(_WORD *)&v232[12] = 2114;
                    *(void *)&v232[14] = v56;
                    _os_log_impl(&dword_22F52A000, v54, OS_LOG_TYPE_INFO, "%{public}@Processing export additional updates: %{public}@", v232, 0x16u);
                  }
                  id v57 = v46;
                  v58 = [MEMORY[0x263EFF9A0] dictionary];

                  uint64_t v182 = MEMORY[0x263EF8330];
                  uint64_t v183 = 3221225472;
                  v184 = __61__HMDCoreDataCloudTransform__processExportChangeSet_context___block_invoke_221;
                  v185 = &unk_264A1F400;
                  v189 = &v204;
                  v186 = (id *)v53;
                  id v46 = v58;
                  id v187 = v46;
                  id v188 = v51;
                  [v57 enumerateKeysAndObjectsUsingBlock:&v182];
                  BOOL v59 = *(void *)(v205 + 24) == 0;

                  if (v59) {
                    goto LABEL_32;
                  }
                }
                uint64_t v37 = *(void *)(v205 + 24);
              }
              else
              {
LABEL_32:
                uint64_t v37 = 0;
              }
            }
            else
            {
              uint64_t v37 = 0;
            }
          }
          else
          {
            uint64_t v37 = 0;
          }

          _Block_object_dispose(&v204, 8);
        }
        else
        {
          uint64_t v37 = 1;
        }
      }
      uint64_t v61 = objc_msgSend(v178, "setHmd_currentChangeSet:", 0);
      if (!v37)
      {
        v62 = (void *)MEMORY[0x230FBD990](v61);
        id v63 = v171;
        v64 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
        {
          v65 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543874;
          *(void *)&uint8_t buf[4] = v65;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v173;
          *(_WORD *)&buf[22] = 2114;
          uint64_t v228 = (uint64_t)v177;
          _os_log_impl(&dword_22F52A000, v64, OS_LOG_TYPE_DEFAULT, "%{public}@Rolling back managed objects after processing %{public}@ changes: %{public}@", buf, 0x20u);
        }
        uint64_t v61 = [v178 rollback];
      }
      id v66 = (void *)MEMORY[0x230FBD990](v61);
      id v67 = v171;
      v68 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v68, OS_LOG_TYPE_INFO))
      {
        v69 = HMFGetLogIdentifier();
        id v70 = v177[6];
        *(_DWORD *)buf = 138544130;
        *(void *)&uint8_t buf[4] = v69;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v173;
        *(_WORD *)&buf[22] = 2160;
        uint64_t v228 = 1752392040;
        *(_WORD *)v229 = 2112;
        *(void *)&v229[2] = v70;
        _os_log_impl(&dword_22F52A000, v68, OS_LOG_TYPE_INFO, "%{public}@Finished processing %{public}@ changes for home %{mask.hash}@", buf, 0x2Au);
      }
      if ([v178 hasChanges])
      {
        int v71 = v177;
        id v176 = v177[6];
        if (v176)
        {
          v72 = HMDWorkingContextNameForHomeUUID(v176);
          [v178 setName:v72];

          int v71 = v177;
        }
        if (v169)
        {
          BOOL v73 = v71;
          id v74 = v178;
          id v191 = 0;
          char v75 = -[HMDCoreDataCloudTransform _saveContextToWorkingStore:error:]((uint64_t)v67, v74, (uint64_t)&v191);
          id v76 = v191;
          v77 = (void *)MEMORY[0x230FBD990]();
          id v78 = v67;
          v79 = HMFGetOSLogHandle();
          v80 = v79;
          if (v75)
          {
            if (os_log_type_enabled(v79, OS_LOG_TYPE_INFO))
            {
              v81 = HMFGetLogIdentifier();
              id v82 = v177[6];
              *(_DWORD *)buf = 138543874;
              *(void *)&uint8_t buf[4] = v81;
              *(_WORD *)&buf[12] = 2160;
              *(void *)&buf[14] = 1752392040;
              *(_WORD *)&buf[22] = 2112;
              uint64_t v228 = (uint64_t)v82;
              _os_log_impl(&dword_22F52A000, v80, OS_LOG_TYPE_INFO, "%{public}@Saved after processing import changes for home %{mask.hash}@", buf, 0x20u);
            }
          }
          else if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR))
          {
            char v115 = HMFGetLogIdentifier();
            id v116 = v177[6];
            *(_DWORD *)buf = 138544130;
            *(void *)&uint8_t buf[4] = v115;
            *(_WORD *)&buf[12] = 2160;
            *(void *)&buf[14] = 1752392040;
            *(_WORD *)&buf[22] = 2112;
            uint64_t v228 = (uint64_t)v116;
            *(_WORD *)v229 = 2114;
            *(void *)&v229[2] = v76;
            _os_log_impl(&dword_22F52A000, v80, OS_LOG_TYPE_ERROR, "%{public}@Failed to save after processing import changes for home %{mask.hash}@: %{public}@", buf, 0x2Au);
          }

          v117 = objc_msgSend(v74, "hmd_homeManagerContext");
          if (v117)
          {
            objc_msgSend(v74, "setHmd_homeManagerContext:", 0);
            v179[0] = MEMORY[0x263EF8330];
            v179[1] = 3221225472;
            v179[2] = __64__HMDCoreDataCloudTransform__processChangeSet_isImport_context___block_invoke;
            v179[3] = &unk_264A2DFC8;
            char v181 = v75;
            v179[4] = v78;
            id v180 = v117;
            [v180 performBlockAndWait:v179];
          }
        }
        else
        {
          char v88 = v71;
          id v89 = v178;
          v90 = (void *)MEMORY[0x230FBD990]();
          v91 = (id *)v67;
          v92 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v92, OS_LOG_TYPE_DEBUG))
          {
            v93 = HMFGetLogIdentifier();
            id v94 = v177[6];
            id v95 = v88[8];
            *(_DWORD *)buf = 138544130;
            *(void *)&uint8_t buf[4] = v93;
            *(_WORD *)&buf[12] = 2160;
            *(void *)&buf[14] = 1752392040;
            *(_WORD *)&buf[22] = 2112;
            uint64_t v228 = (uint64_t)v94;
            *(_WORD *)v229 = 2114;
            *(void *)&v229[2] = v95;
            _os_log_impl(&dword_22F52A000, v92, OS_LOG_TYPE_DEBUG, "%{public}@Saving to cloud store after processing export changes for home %{mask.hash}@ on behalf of client identifier: %{public}@", buf, 0x2Au);
          }
          v96 = [v89 updatedObjects];
          v97 = [v89 insertedObjects];
          v98 = [v89 deletedObjects];
          v99 = [v89 transactionAuthor];
          __int16 v172 = +[HMDCoreDataCloudStoreTransactionLogEvent eventForUpdates:v96 inserts:v97 deletes:v98 transactionAuthor:v99];

          if (v172) {
            [v91[10] submitLogEvent:v172];
          }
          id v100 = v89;
          v101 = [v100 insertedObjects];
          v102 = [v100 updatedObjects];

          if ([v101 count] || objc_msgSend(v102, "count"))
          {
            v103 = [MEMORY[0x263EFF910] now];
            v104 = MKFCKModelCurrentWriterVersionString();
            -[HMDCoreDataCloudTransform _updateWriterPropertiesForCloudObjects:timestamp:version:](v101, v103, v104);
            -[HMDCoreDataCloudTransform _updateWriterPropertiesForCloudObjects:timestamp:version:](v102, v103, v104);
          }
          v105 = v88;
          id v106 = v100;
          v107 = v106;
          if (v105[7] > 24)
          {
            id v118 = v106;
            v119 = +[MKFCKAppleMediaAccessory entity];
            v218 = v119;
            v120 = +[MKFCKHome entity];
            uint64_t v219 = (uint64_t)v120;
            v121 = +[MKFCKUser entity];
            v220 = v121;
            v122 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v218 count:3];

            v123 = (void *)MEMORY[0x263EFF9C0];
            v124 = [v118 insertedObjects];
            v125 = [v123 setWithSet:v124];

            v126 = [v118 updatedObjects];
            [v125 unionSet:v126];

            v127 = [v118 deletedObjects];
            [v125 unionSet:v127];

            id v191 = 0;
            uint64_t v192 = (uint64_t)&v191;
            uint64_t v193 = 0x3032000000;
            v194 = __Block_byref_object_copy__116043;
            v195 = __Block_byref_object_dispose__116044;
            id v196 = 0;
            *(void *)buf = MEMORY[0x263EF8330];
            *(void *)&buf[8] = 3221225472;
            *(void *)&buf[16] = __75__HMDCoreDataCloudTransform__fetchRequestForCriticalObjectExportInContext___block_invoke;
            uint64_t v228 = (uint64_t)&unk_264A275E0;
            id v128 = v122;
            *(void *)v229 = v128;
            *(void *)&v229[8] = v91;
            *(void *)&v229[16] = &v191;
            objc_msgSend(v125, "hmf_enumerateWithAutoreleasePoolUsingBlock:", buf);
            id v129 = *(id *)(v192 + 40);

            _Block_object_dispose(&v191, 8);
            BOOL v114 = v129 != 0;
            if (v129)
            {
              v130 = (void *)v105[8];
              if (v130)
              {
                id v131 = v130;
                uint64_t v132 = [@"HomeKitCloudExportVoucher/" stringByAppendingString:v131];

                v133 = (__CFString *)v132;
              }
              else
              {
                v133 = @"HomeKitCloudExportVoucher/";
              }
              v168 = v133;
              v170 = +[HMDCoreData userInitiatedVoucherWithLabel:forEventsOfType:affectingObjectsMatching:](HMDCoreData, "userInitiatedVoucherWithLabel:forEventsOfType:affectingObjectsMatching:");
              id v138 = (void *)MEMORY[0x230FBD990]();
              v139 = v91;
              int v140 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v140, OS_LOG_TYPE_INFO))
              {
                v141 = HMFGetLogIdentifier();
                uint64_t v142 = v105[8];
                *(_DWORD *)buf = 138543618;
                *(void *)&uint8_t buf[4] = v141;
                *(_WORD *)&buf[12] = 2114;
                *(void *)&buf[14] = v142;
                _os_log_impl(&dword_22F52A000, v140, OS_LOG_TYPE_INFO, "%{public}@Applying export voucher on behalf of client identifier: %{public}@", buf, 0x16u);
              }
              v143 = [v139 coreData];
              v144 = [v143 container];

              int v145 = [v139 coreData];
              v146 = [v145 cloudPrivateStore];
              *(void *)buf = v146;
              int v147 = [MEMORY[0x263EFF8C0] arrayWithObjects:buf count:1];
              [v144 applyActivityVoucher:v170 toStores:v147];
            }
            else
            {
              v134 = (void *)MEMORY[0x230FBD990]();
              v135 = v91;
              id v136 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v136, OS_LOG_TYPE_INFO))
              {
                id v137 = HMFGetLogIdentifier();
                *(_DWORD *)buf = 138543362;
                *(void *)&uint8_t buf[4] = v137;
                _os_log_impl(&dword_22F52A000, v136, OS_LOG_TYPE_INFO, "%{public}@No export voucher necessary since no critical object was detected", buf, 0xCu);
              }
            }
          }
          else
          {
            id v108 = (void *)MEMORY[0x230FBD990]();
            v109 = v91;
            v110 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v110, OS_LOG_TYPE_DEBUG))
            {
              v111 = HMFGetLogIdentifier();
              v112 = HMFQualityOfServiceToString();
              uint64_t v113 = v105[8];
              *(_DWORD *)buf = 138543874;
              *(void *)&uint8_t buf[4] = v111;
              *(_WORD *)&buf[12] = 2112;
              *(void *)&buf[14] = v112;
              *(_WORD *)&buf[22] = 2112;
              uint64_t v228 = v113;
              _os_log_impl(&dword_22F52A000, v110, OS_LOG_TYPE_DEBUG, "%{public}@No export voucher necessary for change set with QoS %@ for clientIdentifier: %@", buf, 0x20u);
            }
            BOOL v114 = 0;
          }

          [v107 setMergePolicy:v91[4]];
          v148 = (void *)v105[8];
          id v191 = 0;
          id v149 = v148;
          char v150 = objc_msgSend(v107, "hmd_saveWithTransactionAuthor:clientIdentifier:allowQoSEscalation:error:", 4, v149, v114, &v191);
          id v151 = v191;

          v152 = (void *)MEMORY[0x230FBD990]();
          id v153 = v91;
          v154 = HMFGetOSLogHandle();
          char v155 = v154;
          if (v150)
          {
            if (os_log_type_enabled(v154, OS_LOG_TYPE_INFO))
            {
              uint64_t v156 = HMFGetLogIdentifier();
              id v157 = v177[6];
              uint64_t v158 = v105[8];
              *(_DWORD *)buf = 138544130;
              *(void *)&uint8_t buf[4] = v156;
              *(_WORD *)&buf[12] = 2160;
              *(void *)&buf[14] = 1752392040;
              *(_WORD *)&buf[22] = 2112;
              uint64_t v228 = (uint64_t)v157;
              *(_WORD *)v229 = 2114;
              *(void *)&v229[2] = v158;
              _os_log_impl(&dword_22F52A000, v155, OS_LOG_TYPE_INFO, "%{public}@Saved after processing export changes for home %{mask.hash}@ on behalf of client identifier %{public}@", buf, 0x2Au);
            }
          }
          else if (os_log_type_enabled(v154, OS_LOG_TYPE_ERROR))
          {
            char v159 = HMFGetLogIdentifier();
            id v160 = v177[6];
            uint64_t v161 = v105[8];
            *(_DWORD *)buf = 138544386;
            *(void *)&uint8_t buf[4] = v159;
            *(_WORD *)&buf[12] = 2160;
            *(void *)&buf[14] = 1752392040;
            *(_WORD *)&buf[22] = 2112;
            uint64_t v228 = (uint64_t)v160;
            *(_WORD *)v229 = 2114;
            *(void *)&v229[2] = v161;
            *(_WORD *)&v229[10] = 2114;
            *(void *)&v229[12] = v151;
            _os_log_impl(&dword_22F52A000, v155, OS_LOG_TYPE_ERROR, "%{public}@Failed to save after processing export changes for home %{mask.hash}@ on behalf of client identifier %{public}@: %{public}@", buf, 0x34u);
          }
        }
        if (v176)
        {
          objc_opt_class();
          v162 = (objc_class *)self;
          id v163 = NSStringFromClass(v162);
          [v178 setName:v163];
        }
        int v164 = [v178 hasChanges];
        if (v164) {
          [v178 rollback];
        }
        uint64_t v60 = v164 ^ 1u;
      }
      else
      {
        v83 = (void *)MEMORY[0x230FBD990]();
        id v84 = v67;
        v85 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v85, OS_LOG_TYPE_DEBUG))
        {
          char v86 = HMFGetLogIdentifier();
          id v87 = v177[6];
          *(_DWORD *)buf = 138544130;
          *(void *)&uint8_t buf[4] = v86;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v173;
          *(_WORD *)&buf[22] = 2160;
          uint64_t v228 = 1752392040;
          *(_WORD *)v229 = 2112;
          *(void *)&v229[2] = v87;
          _os_log_impl(&dword_22F52A000, v85, OS_LOG_TYPE_DEBUG, "%{public}@No changes to managed objects after processing %{public}@ changes for home %{mask.hash}@", buf, 0x2Au);
        }
        uint64_t v60 = 0;
      }

      id v8 = v178;
    }
    else
    {
      uint64_t v60 = 1;
    }
  }
  else
  {
    uint64_t v60 = 0;
  }

  return v60;
}

void __64__HMDCoreDataCloudTransform__processChangeSet_isImport_context___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v2 = (void *)MEMORY[0x230FBD990]();
  if (*(unsigned char *)(a1 + 48))
  {
    -[HMDCoreDataCloudTransform _saveHomeManagerChangesToWorkingStoreWithContext:](*(void **)(a1 + 32), *(void **)(a1 + 40));
  }
  else
  {
    id v3 = (void *)MEMORY[0x230FBD990]();
    id v4 = *(id *)(a1 + 32);
    id v5 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = HMFGetLogIdentifier();
      int v7 = 138543362;
      id v8 = v6;
      _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_ERROR, "%{public}@Discarding home manager changes after previous working store save failure", (uint8_t *)&v7, 0xCu);
    }
  }
  [*(id *)(a1 + 40) reset];
}

void __75__HMDCoreDataCloudTransform__fetchRequestForCriticalObjectExportInContext___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v5 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  id v7 = v6;

  if (v7)
  {
    id v8 = *(void **)(a1 + 32);
    uint64_t v9 = [v7 entity];
    LODWORD(v8) = [v8 containsObject:v9];

    if (v8)
    {
      id v10 = (void *)MEMORY[0x230FBD990]();
      id v11 = *(id *)(a1 + 40);
      uint64_t v12 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        os_log_type_t v13 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        id v24 = v13;
        __int16 v25 = 2112;
        id v26 = v7;
        _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, "%{public}@Detected dirty critical object for export: %@", buf, 0x16u);
      }
      uint32_t v14 = (void *)MEMORY[0x263EFF260];
      id v15 = [v7 entity];
      id v16 = [v15 name];
      uint64_t v17 = [v14 fetchRequestWithEntityName:v16];
      uint64_t v18 = *(void *)(*(void *)(a1 + 48) + 8);
      id v19 = *(void **)(v18 + 40);
      *(void *)(v18 + 40) = v17;

      id v20 = (void *)MEMORY[0x263F08A98];
      char v21 = [v7 modelID];
      id v22 = [v20 predicateWithFormat:@"(%K == %@)", @"modelID", v21];
      [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setPredicate:v22];

      *a3 = 1;
    }
  }
}

- (void)_updateWriterPropertiesForCloudObjects:(void *)a1 timestamp:(void *)a2 version:(void *)a3
{
  id v5 = a2;
  id v6 = a3;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __86__HMDCoreDataCloudTransform__updateWriterPropertiesForCloudObjects_timestamp_version___block_invoke;
  v9[3] = &unk_264A1F1D8;
  id v7 = v5;
  id v10 = v7;
  id v8 = v6;
  id v11 = v8;
  objc_msgSend(a1, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v9);
}

void __86__HMDCoreDataCloudTransform__updateWriterPropertiesForCloudObjects_timestamp_version___block_invoke(uint64_t a1, void *a2)
{
  id v12 = a2;
  int v3 = [v12 hasPersistentChangedValues];
  id v4 = v12;
  if (v3)
  {
    id v5 = v12;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }
    id v7 = v6;

    if (v7)
    {
      id v8 = [v7 writerTimestamp];
      char v9 = [v8 isEqualToDate:*(void *)(a1 + 32)];

      if ((v9 & 1) == 0) {
        [v7 setWriterTimestamp:*(void *)(a1 + 32)];
      }
      id v10 = [v7 writerVersion];
      char v11 = [v10 isEqualToString:*(void *)(a1 + 40)];

      if ((v11 & 1) == 0) {
        [v7 setWriterVersion:*(void *)(a1 + 40)];
      }
    }

    id v4 = v12;
  }
}

void __61__HMDCoreDataCloudTransform__processExportChangeSet_context___block_invoke(void *a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v62 = *MEMORY[0x263EF8340];
  id v8 = (void *)a1[4];
  id v7 = (void *)a1[5];
  char v9 = (void *)a1[6];
  id v10 = a2;
  id v11 = a3;
  id v12 = v7;
  id v13 = v9;
  if (v8)
  {
    uint32_t v14 = [v11 objectForKeyedSubscript:@"modelID"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v15 = v14;
    }
    else {
      id v15 = 0;
    }
    id v16 = v15;

    uint64_t v17 = [v13 objectWithID:v10];
    int v18 = [v17 isDeleted];

    if (v18)
    {
      id v19 = (void *)MEMORY[0x230FBD990]();
      id v20 = v8;
      char v21 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        id v46 = v11;
        id v22 = v49 = a4;
        uint64_t v23 = objc_msgSend(v10, "hmd_debugIdentifier");
        id v24 = v12;
        __int16 v25 = (void *)v23;
        *(_DWORD *)buf = 138544386;
        id v26 = ": ";
        id v53 = v22;
        if (!v16) {
          id v26 = "";
        }
        __int16 v54 = 2112;
        uint64_t v55 = v23;
        __int16 v56 = 2080;
        uint64_t v27 = &stru_26E2EB898;
        if (v16) {
          uint64_t v27 = v16;
        }
        uint64_t v57 = (uint64_t)v26;
        __int16 v58 = 2160;
        uint64_t v59 = 1752392040;
        __int16 v60 = 2112;
        uint64_t v61 = v27;
        _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_INFO, "%{public}@Skipping processing export delete for already-deleted object: <%@%s%{mask.hash}@>", buf, 0x34u);

        id v12 = v24;
        id v11 = v46;
        a4 = v49;
      }

      uint64_t v28 = 1;
    }
    else
    {
      id v51 = v12;
      long long v29 = objc_opt_class();
      v30 = [v10 entity];
      v31 = (void *)[v29 exportTransformableClassFromEntity:v30];

      if (v31)
      {
        id v50 = a4;
        v32 = (void *)MEMORY[0x230FBD990]();
        id v33 = v8;
        id v34 = HMFGetOSLogHandle();
        id v35 = v34;
        id v12 = v51;
        if (v16)
        {
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
          {
            BOOL v36 = HMFGetLogIdentifier();
            objc_msgSend(v10, "hmd_debugIdentifier");
            uint64_t v37 = v47 = v32;
            *(_DWORD *)buf = 138544130;
            id v53 = v36;
            __int16 v54 = 2112;
            uint64_t v55 = (uint64_t)v37;
            __int16 v56 = 2160;
            uint64_t v57 = 1752392040;
            __int16 v58 = 2112;
            uint64_t v59 = (uint64_t)v16;
            _os_log_impl(&dword_22F52A000, v35, OS_LOG_TYPE_DEBUG, "%{public}@Processing export delete: <%@: %{mask.hash}@>", buf, 0x2Au);

            v32 = v47;
            id v12 = v51;
          }

          uint64_t v28 = [v31 exportDeleteWithObjectID:v10 modelID:v16 additionalUpdates:v12 context:v13];
        }
        else
        {
          if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
          {
            v44 = HMFGetLogIdentifier();
            id v45 = objc_msgSend(v10, "hmd_debugIdentifier");
            *(_DWORD *)buf = 138543874;
            id v53 = v44;
            __int16 v54 = 2112;
            uint64_t v55 = (uint64_t)v45;
            __int16 v56 = 2112;
            uint64_t v57 = (uint64_t)v11;
            _os_log_impl(&dword_22F52A000, v35, OS_LOG_TYPE_ERROR, "%{public}@Not processing export delete for transformable %@ due to missing modelID in tombstone: %@", buf, 0x20u);

            id v12 = v51;
          }

          uint64_t v28 = 1;
        }
        a4 = v50;
      }
      else
      {
        v38 = (void *)MEMORY[0x230FBD990]();
        id v39 = v8;
        v40 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
        {
          id v41 = HMFGetLogIdentifier();
          objc_msgSend(v10, "hmd_debugIdentifier");
          id v48 = v11;
          v43 = v42 = a4;
          *(_DWORD *)buf = 138543618;
          id v53 = v41;
          __int16 v54 = 2112;
          uint64_t v55 = (uint64_t)v43;
          _os_log_impl(&dword_22F52A000, v40, OS_LOG_TYPE_DEBUG, "%{public}@Ignoring export delete: <%@>", buf, 0x16u);

          a4 = v42;
          id v11 = v48;
        }
        uint64_t v28 = 1;
        id v12 = v51;
      }
    }
  }
  else
  {
    uint64_t v28 = 0;
  }

  *(void *)(*(void *)(a1[7] + 8) + 24) = v28;
  if (!*(void *)(*(void *)(a1[7] + 8) + 24)) {
    *a4 = 1;
  }
}

void __61__HMDCoreDataCloudTransform__processExportChangeSet_context___block_invoke_2(void *a1, void *a2, unsigned char *a3)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v6 = (void *)a1[4];
  id v5 = (void *)a1[5];
  id v7 = (void *)a1[6];
  id v8 = a2;
  id v9 = v5;
  id v10 = v7;
  id v11 = v10;
  if (v6)
  {
    id v12 = [v10 objectWithID:v8];
    int v13 = [v12 isDeleted];

    if (v13)
    {
      uint32_t v14 = (void *)MEMORY[0x230FBD990]();
      id v15 = v6;
      id v16 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        uint64_t v17 = HMFGetLogIdentifier();
        objc_msgSend(v8, "hmd_debugIdentifier");
        v19 = int v18 = a3;
        *(_DWORD *)buf = 138543618;
        v32 = v17;
        __int16 v33 = 2112;
        id v34 = v19;
        id v20 = "%{public}@Skipping processing export insert for already-deleted object: <%@>";
        char v21 = v16;
        os_log_type_t v22 = OS_LOG_TYPE_INFO;
LABEL_11:
        _os_log_impl(&dword_22F52A000, v21, v22, v20, buf, 0x16u);

        a3 = v18;
        goto LABEL_12;
      }
      goto LABEL_12;
    }
    uint64_t v23 = objc_opt_class();
    id v24 = [v8 entity];
    __int16 v25 = (void *)[v23 exportTransformableClassFromEntity:v24];

    uint32_t v14 = (void *)MEMORY[0x230FBD990]();
    id v15 = v6;
    id v16 = HMFGetOSLogHandle();
    BOOL v26 = os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG);
    if (!v25)
    {
      if (v26)
      {
        uint64_t v17 = HMFGetLogIdentifier();
        objc_msgSend(v8, "hmd_debugIdentifier");
        v19 = int v18 = a3;
        *(_DWORD *)buf = 138543618;
        v32 = v17;
        __int16 v33 = 2112;
        id v34 = v19;
        id v20 = "%{public}@Ignoring export insert: <%@>";
        char v21 = v16;
        os_log_type_t v22 = OS_LOG_TYPE_DEBUG;
        goto LABEL_11;
      }
LABEL_12:

      uint64_t v29 = 1;
      goto LABEL_13;
    }
    if (v26)
    {
      HMFGetLogIdentifier();
      uint64_t v27 = v30 = a3;
      uint64_t v28 = objc_msgSend(v8, "hmd_debugIdentifier");
      *(_DWORD *)buf = 138543618;
      v32 = v27;
      __int16 v33 = 2112;
      id v34 = v28;
      _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_DEBUG, "%{public}@Processing export insert: <%@>", buf, 0x16u);

      a3 = v30;
    }

    uint64_t v29 = [v25 exportInsertWithObjectID:v8 additionalUpdates:v9 context:v11];
  }
  else
  {
    uint64_t v29 = 0;
  }
LABEL_13:

  *(void *)(*(void *)(a1[7] + 8) + 24) = v29;
  if (!*(void *)(*(void *)(a1[7] + 8) + 24)) {
    *a3 = 1;
  }
}

uint64_t __61__HMDCoreDataCloudTransform__processExportChangeSet_context___block_invoke_3(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t result = -[HMDCoreDataCloudTransform _processExportUpdateForObjectID:updatedProperties:additionalUpdates:context:](*(void **)(a1 + 32), a2, a3, *(void **)(a1 + 40), *(void **)(a1 + 48));
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)) {
    *a4 = 1;
  }
  return result;
}

void __61__HMDCoreDataCloudTransform__processExportChangeSet_context___block_invoke_221(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v7 = *(void **)(a1 + 32);
  id v8 = a2;
  id v9 = (void *)[a3 copy];
  uint64_t v10 = -[HMDCoreDataCloudTransform _processExportUpdateForObjectID:updatedProperties:additionalUpdates:context:](v7, v8, v9, *(void **)(a1 + 40), *(void **)(a1 + 48));

  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v10;
  if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)) {
    *a4 = 1;
  }
}

- (uint64_t)_processExportUpdateForObjectID:(void *)a3 updatedProperties:(void *)a4 additionalUpdates:(void *)a5 context:
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  int v13 = v12;
  if (!a1)
  {
    uint64_t v31 = 0;
    goto LABEL_13;
  }
  uint32_t v14 = [v12 objectWithID:v9];
  int v15 = [v14 isDeleted];

  if (v15)
  {
    id v16 = (void *)MEMORY[0x230FBD990]();
    id v17 = a1;
    int v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      id v19 = HMFGetLogIdentifier();
      id v20 = objc_msgSend(v9, "hmd_debugIdentifier");
      *(_DWORD *)buf = 138543618;
      uint64_t v35 = v19;
      __int16 v36 = 2112;
      uint64_t v37 = v20;
      char v21 = "%{public}@Skipping processing export update for already-deleted object: <%@>";
      os_log_type_t v22 = v18;
      os_log_type_t v23 = OS_LOG_TYPE_INFO;
LABEL_11:
      _os_log_impl(&dword_22F52A000, v22, v23, v21, buf, 0x16u);

      goto LABEL_12;
    }
    goto LABEL_12;
  }
  id v24 = objc_opt_class();
  __int16 v25 = [v9 entity];
  BOOL v26 = (void *)[v24 exportTransformableClassFromEntity:v25];

  id v16 = (void *)MEMORY[0x230FBD990]();
  id v17 = a1;
  int v18 = HMFGetOSLogHandle();
  BOOL v27 = os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG);
  if (!v26)
  {
    if (v27)
    {
      id v19 = HMFGetLogIdentifier();
      id v20 = objc_msgSend(v9, "hmd_debugIdentifier");
      *(_DWORD *)buf = 138543618;
      uint64_t v35 = v19;
      __int16 v36 = 2112;
      uint64_t v37 = v20;
      char v21 = "%{public}@Ignoring export update: <%@>";
      os_log_type_t v22 = v18;
      os_log_type_t v23 = OS_LOG_TYPE_DEBUG;
      goto LABEL_11;
    }
LABEL_12:

    uint64_t v31 = 1;
    goto LABEL_13;
  }
  if (v27)
  {
    uint64_t v28 = HMFGetLogIdentifier();
    uint64_t v29 = MKFPropertyNamesFromDescriptions(v10);
    objc_msgSend(v9, "hmd_debugIdentifier");
    v30 = __int16 v33 = v16;
    *(_DWORD *)buf = 138543874;
    uint64_t v35 = v28;
    __int16 v36 = 2114;
    uint64_t v37 = v29;
    __int16 v38 = 2112;
    id v39 = v30;
    _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_DEBUG, "%{public}@Processing export update [%{public}@]: <%@>", buf, 0x20u);

    id v16 = v33;
  }

  uint64_t v31 = [v26 exportUpdateWithObjectID:v9 updatedProperties:v10 additionalUpdates:v11 context:v13];
LABEL_13:

  return v31;
}

void __61__HMDCoreDataCloudTransform__processImportChangeSet_context___block_invoke(uint64_t a1, uint64_t a2)
{
  int v3 = [*(id *)(a1 + 32) objectWithID:a2];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  uint64_t v6 = [v5 ensureCanonicalModel];
  if (v6 == -1) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
}

void __61__HMDCoreDataCloudTransform__processImportChangeSet_context___block_invoke_2(uint64_t a1, uint64_t a2)
{
  int v3 = [*(id *)(a1 + 32) objectWithID:a2];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  uint64_t v6 = [v5 ensureCanonicalModel];
  if (v6 == -1) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
}

void __61__HMDCoreDataCloudTransform__processImportChangeSet_context___block_invoke_3(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  int v6 = *(unsigned __int8 *)(a1 + 64);
  id v8 = *(void **)(a1 + 32);
  id v7 = *(void **)(a1 + 40);
  id v9 = *(void **)(a1 + 48);
  id v10 = a2;
  id v11 = a3;
  id v37 = v7;
  id v12 = v9;
  if (v8)
  {
    int v13 = [v11 objectForKeyedSubscript:@"modelID"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint32_t v14 = v13;
    }
    else {
      uint32_t v14 = 0;
    }
    id v38 = v14;

    int v15 = [v12 objectWithID:v10];
    int v16 = [v15 isDeleted];

    id v17 = (void *)MEMORY[0x230FBD990]();
    id v18 = v8;
    id v19 = HMFGetOSLogHandle();
    id v20 = v19;
    if (v16)
    {
      char v21 = v38;
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        os_log_type_t v22 = HMFGetLogIdentifier();
        os_log_type_t v23 = objc_msgSend(v10, "hmd_debugIdentifier");
        *(_DWORD *)buf = 138544130;
        *(void *)&uint8_t buf[4] = v22;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v23;
        *(_WORD *)&buf[22] = 2160;
        uint64_t v40 = 1752392040;
        LOWORD(v41) = 2112;
        *(void *)((char *)&v41 + 2) = v38;
        _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_INFO, "%{public}@Skipping processing import delete for already-deleted object: <%@: %{mask.hash}@>", buf, 0x2Au);
      }
      uint64_t v24 = 1;
      __int16 v25 = v37;
      goto LABEL_21;
    }
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      BOOL v26 = HMFGetLogIdentifier();
      BOOL v27 = objc_msgSend(v10, "hmd_debugIdentifier");
      *(_DWORD *)buf = 138543874;
      *(void *)&uint8_t buf[4] = v26;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v27;
      *(_WORD *)&buf[22] = 2114;
      uint64_t v40 = (uint64_t)v38;
      _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_DEBUG, "%{public}@Processing import delete: <%@: %{public}@>", buf, 0x20u);
    }
    uint64_t v28 = [v10 entity];
    __int16 v25 = v37;
    if (v6)
    {
      uint64_t v29 = (void *)[(id)objc_opt_class() importTransformableClassFromEntity:v28];
      if (v29)
      {
        if (v38)
        {
          if (![v29 importDeleteWithObjectID:v10 modelID:v38 additionalUpdates:v37 context:v12])
          {
            uint64_t v24 = 0;
LABEL_20:

            char v21 = v38;
LABEL_21:

            goto LABEL_22;
          }
        }
        else
        {
          v30 = (void *)MEMORY[0x230FBD990]();
          id v31 = v18;
          v32 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v33 = uint64_t v35 = v30;
            id v34 = objc_msgSend(v10, "hmd_debugIdentifier");
            *(_DWORD *)buf = 138543874;
            *(void *)&uint8_t buf[4] = v33;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v34;
            *(_WORD *)&buf[22] = 2112;
            uint64_t v40 = (uint64_t)v11;
            _os_log_impl(&dword_22F52A000, v32, OS_LOG_TYPE_ERROR, "%{public}@Not processing import delete for object <%@> due to missing modelID in tombstone: %@", buf, 0x20u);

            __int16 v25 = v37;
            v30 = v35;
          }
        }
      }
    }
    *(void *)buf = MEMORY[0x263EF8330];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __107__HMDCoreDataCloudTransform__processImportDeleteForObjectID_tombstone_transform_additionalUpdates_context___block_invoke;
    uint64_t v40 = (uint64_t)&unk_264A1F360;
    *(void *)&long long v41 = v10;
    *((void *)&v41 + 1) = v11;
    id v42 = v12;
    -[HMDCoreDataCloudTransform _enumerateCloudChangeListenersForEntity:usingBlock:]((uint64_t)v18, v28, buf);

    uint64_t v24 = 1;
    goto LABEL_20;
  }
  uint64_t v24 = 0;
  __int16 v25 = v37;
LABEL_22:

  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v24;
  if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)) {
    *a4 = 1;
  }
}

void __61__HMDCoreDataCloudTransform__processImportChangeSet_context___block_invoke_4(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  int v5 = *(unsigned __int8 *)(a1 + 64);
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(void **)(a1 + 40);
  id v8 = *(void **)(a1 + 48);
  id v9 = a2;
  id v10 = v7;
  id v11 = v8;
  id v12 = v11;
  if (v6)
  {
    int v13 = [v11 objectWithID:v9];
    if ([v13 isDeleted])
    {
      uint32_t v14 = v12;
      id v15 = v10;
      int v16 = (void *)MEMORY[0x230FBD990]();
      id v17 = (id)v6;
      id v18 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        id v19 = v38 = a3;
        id v20 = objc_msgSend(v9, "hmd_debugIdentifier");
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v19;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v20;
        _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_INFO, "%{public}@Skipping processing import insert for already-deleted object: <%@>", buf, 0x16u);

        a3 = v38;
      }

      uint64_t v6 = 1;
      id v10 = v15;
      id v12 = v14;
    }
    else
    {
      id v41 = v10;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && (uint64_t v21 = [v13 ensureCanonicalModel], v21 != 1))
      {
        uint64_t v29 = v21;
        v30 = (void *)MEMORY[0x230FBD990]();
        id v31 = (id)v6;
        v32 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
        {
          uint64_t v40 = v30;
          __int16 v33 = a3;
          id v34 = HMFGetLogIdentifier();
          if ((unint64_t)(v29 + 2) > 3) {
            uint64_t v35 = @"unknown";
          }
          else {
            uint64_t v35 = off_264A23220[v29 + 2];
          }
          __int16 v36 = v35;
          id v37 = objc_msgSend(v9, "hmd_debugIdentifier");
          *(_DWORD *)buf = 138543874;
          *(void *)&uint8_t buf[4] = v34;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v36;
          *(_WORD *)&buf[22] = 2112;
          uint64_t v43 = v37;
          _os_log_impl(&dword_22F52A000, v32, OS_LOG_TYPE_INFO, "%{public}@Skipping processing import insert for non-canonical (%{public}@) model: <%@>", buf, 0x20u);

          a3 = v33;
          v30 = v40;
        }

        uint64_t v6 = 1;
        id v10 = v41;
      }
      else
      {
        os_log_type_t v22 = (void *)MEMORY[0x230FBD990]();
        id v23 = (id)v6;
        uint64_t v24 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        {
          __int16 v25 = HMFGetLogIdentifier();
          objc_msgSend(v9, "hmd_debugIdentifier");
          BOOL v26 = v39 = a3;
          *(_DWORD *)buf = 138543618;
          *(void *)&uint8_t buf[4] = v25;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v26;
          _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_DEBUG, "%{public}@Processing import insert: <%@>", buf, 0x16u);

          a3 = v39;
        }

        BOOL v27 = [v9 entity];
        id v10 = v41;
        if (v5
          && (uint64_t v28 = (void *)[(id)objc_opt_class() importTransformableClassFromEntity:v27]) != 0
          && ![v28 importInsertWithObjectID:v9 additionalUpdates:v41 context:v12])
        {
          uint64_t v6 = 0;
        }
        else
        {
          *(void *)buf = MEMORY[0x263EF8330];
          *(void *)&buf[8] = 3221225472;
          *(void *)&buf[16] = __97__HMDCoreDataCloudTransform__processImportInsertForObjectID_transform_additionalUpdates_context___block_invoke;
          uint64_t v43 = &unk_264A1F338;
          id v44 = v12;
          id v45 = v9;
          -[HMDCoreDataCloudTransform _enumerateCloudChangeListenersForEntity:usingBlock:]((uint64_t)v23, v27, buf);

          uint64_t v6 = 1;
        }
      }
    }
  }
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v6;
  if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)) {
    *a3 = 1;
  }
}

uint64_t __61__HMDCoreDataCloudTransform__processImportChangeSet_context___block_invoke_5(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t result = -[HMDCoreDataCloudTransform _processImportUpdateForObjectID:updatedProperties:transform:additionalUpdates:context:](*(void **)(a1 + 32), a2, a3, *(unsigned __int8 *)(a1 + 64), *(void **)(a1 + 40), *(void **)(a1 + 48));
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)) {
    *a4 = 1;
  }
  return result;
}

void __61__HMDCoreDataCloudTransform__processImportChangeSet_context___block_invoke_214(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v7 = *(void **)(a1 + 32);
  id v8 = a2;
  id v9 = (void *)[a3 copy];
  uint64_t v10 = -[HMDCoreDataCloudTransform _processImportUpdateForObjectID:updatedProperties:transform:additionalUpdates:context:](v7, v8, v9, *(unsigned __int8 *)(a1 + 64), *(void **)(a1 + 40), *(void **)(a1 + 48));

  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v10;
  if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)) {
    *a4 = 1;
  }
}

- (uint64_t)_processImportUpdateForObjectID:(void *)a3 updatedProperties:(int)a4 transform:(void *)a5 additionalUpdates:(void *)a6 context:
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  id v11 = a2;
  id v12 = a3;
  id v45 = a5;
  id v13 = a6;
  if (!a1)
  {
    uint64_t v24 = 0;
    goto LABEL_17;
  }
  MKFPropertyNamesFromDescriptions(v12);
  uint32_t v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
  id v15 = [v13 objectWithID:v11];
  if ([v15 isDeleted])
  {
    uint64_t v16 = MEMORY[0x230FBD990]();
    id v17 = a1;
    id v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      id v19 = HMFGetLogIdentifier();
      objc_msgSend(v11, "hmd_debugIdentifier");
      id v20 = v13;
      v22 = uint64_t v21 = v14;
      *(_DWORD *)buf = 138543874;
      id v51 = v19;
      __int16 v52 = 2048;
      id v53 = v21;
      __int16 v54 = 2112;
      uint64_t v55 = v22;
      _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_INFO, "%{public}@Skipping processing import update [%public@] for already-deleted object: <%@>", buf, 0x20u);

      uint32_t v14 = v21;
      id v13 = v20;
    }
    id v23 = (void *)v16;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || (uint64_t v25 = [v15 ensureCanonicalModel], v25 == 1))
    {
      BOOL v26 = (void *)MEMORY[0x230FBD990]();
      id v27 = a1;
      uint64_t v28 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        id v44 = v13;
        v30 = uint64_t v29 = v14;
        id v31 = objc_msgSend(v11, "hmd_debugIdentifier");
        *(_DWORD *)buf = 138543874;
        id v51 = v30;
        __int16 v52 = 2048;
        id v53 = v29;
        __int16 v54 = 2112;
        uint64_t v55 = v31;
        _os_log_impl(&dword_22F52A000, v28, OS_LOG_TYPE_DEBUG, "%{public}@Processing import update [%public@]: <%@>", buf, 0x20u);

        uint32_t v14 = v29;
        id v13 = v44;
      }

      v32 = [v11 entity];
      if (a4
        && (__int16 v33 = (void *)[(id)objc_opt_class() importTransformableClassFromEntity:v32]) != 0
        && ![v33 importUpdateWithObjectID:v11 updatedProperties:v12 additionalUpdates:v45 context:v13])
      {
        uint64_t v24 = 0;
      }
      else
      {
        v46[0] = MEMORY[0x263EF8330];
        v46[1] = 3221225472;
        v46[2] = __115__HMDCoreDataCloudTransform__processImportUpdateForObjectID_updatedProperties_transform_additionalUpdates_context___block_invoke;
        v46[3] = &unk_264A1F360;
        id v47 = v13;
        id v48 = v11;
        id v49 = v12;
        -[HMDCoreDataCloudTransform _enumerateCloudChangeListenersForEntity:usingBlock:]((uint64_t)v27, v32, v46);

        uint64_t v24 = 1;
      }

      goto LABEL_16;
    }
    uint64_t v35 = v25;
    uint64_t v36 = MEMORY[0x230FBD990]();
    id v37 = a1;
    id v38 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
    {
      id v39 = HMFGetLogIdentifier();
      uint64_t v43 = v14;
      if ((unint64_t)(v35 + 2) > 3) {
        uint64_t v40 = @"unknown";
      }
      else {
        uint64_t v40 = off_264A23220[v35 + 2];
      }
      id v41 = v40;
      id v42 = objc_msgSend(v11, "hmd_debugIdentifier");
      *(_DWORD *)buf = 138543874;
      id v51 = v39;
      __int16 v52 = 2048;
      id v53 = v41;
      __int16 v54 = 2112;
      uint64_t v55 = v42;
      _os_log_impl(&dword_22F52A000, v38, OS_LOG_TYPE_INFO, "%{public}@Skipping processing import update for non-canonical (%public@) model: <%@>", buf, 0x20u);

      uint32_t v14 = v43;
    }

    id v23 = (void *)v36;
  }
  uint64_t v24 = 1;
LABEL_16:

LABEL_17:
  return v24;
}

void __115__HMDCoreDataCloudTransform__processImportUpdateForObjectID_updatedProperties_transform_additionalUpdates_context___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (objc_opt_respondsToSelector())
  {
    int v3 = [*(id *)(a1 + 32) objectWithID:*(void *)(a1 + 40)];
    [v4 didInsertOrUpdateModel:v3 changedProperties:*(void *)(a1 + 48)];
  }
}

- (void)_enumerateCloudChangeListenersForEntity:(void *)a3 usingBlock:
{
  id v5 = a2;
  uint64_t v6 = a3;
  id v7 = [*(id *)(a1 + 96) objectForKey:v5];
  id v8 = v7;
  if (v7)
  {
    char v14 = 0;
    uint64_t v9 = [v7 count];
    if (v9)
    {
      unint64_t v10 = v9;
      char v11 = 0;
      unint64_t v12 = 1;
      do
      {
        id v13 = [v8 pointerAtIndex:v12 - 1];
        if (v13) {
          v6[2](v6, v13, &v14);
        }
        else {
          char v11 = 1;
        }

        if (v12 >= v10) {
          break;
        }
        ++v12;
      }
      while (!v14);
      if (v11)
      {
        [v8 compact];
        if (![v8 count]) {
          [*(id *)(a1 + 96) removeObjectForKey:v5];
        }
      }
    }
  }
}

void __97__HMDCoreDataCloudTransform__processImportInsertForObjectID_transform_additionalUpdates_context___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (objc_opt_respondsToSelector())
  {
    int v3 = [*(id *)(a1 + 32) objectWithID:*(void *)(a1 + 40)];
    [v4 didInsertOrUpdateModel:v3 changedProperties:0];
  }
}

void __107__HMDCoreDataCloudTransform__processImportDeleteForObjectID_tombstone_transform_additionalUpdates_context___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 didDeleteModelWithID:a1[4] tombstone:a1[5] context:a1[6]];
  }
}

void __71__HMDCoreDataCloudTransform__changeSetsFromImportTransactions_context___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v3 = a2;
  int v4 = [(id)objc_opt_class() transactionIsCloudStoreReset:v3 context:*(void *)(a1 + 40)];
  id v5 = *(void **)(a1 + 32);
  if (v4)
  {
    [(id)objc_opt_class() wipeCoreDataStorageDueToPCSIdentityLossAndRelaunchHomeKitDaemon];
  }
  else
  {
    id v6 = v3;
    id v7 = v6;
    if (v5)
    {
      if (!objc_msgSend(v6, "hmd_transactionAuthor"))
      {

        char v14 = [v7 changes];
        v16[0] = MEMORY[0x263EF8330];
        v16[1] = 3221225472;
        v16[2] = __71__HMDCoreDataCloudTransform__changeSetsFromImportTransactions_context___block_invoke_2;
        v16[3] = &unk_264A1F478;
        id v15 = *(void **)(a1 + 40);
        v16[4] = *(void *)(a1 + 32);
        id v17 = v15;
        id v18 = *(id *)(a1 + 48);
        objc_msgSend(v14, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v16);

        goto LABEL_10;
      }
      id v8 = (void *)MEMORY[0x230FBD990]();
      id v9 = v5;
      unint64_t v10 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        char v11 = HMFGetLogIdentifier();
        uint64_t v12 = [v7 transactionNumber];
        id v13 = [v7 author];
        *(_DWORD *)buf = 138544130;
        id v20 = v11;
        __int16 v21 = 2048;
        uint64_t v22 = v12;
        __int16 v23 = 2160;
        uint64_t v24 = 1752392040;
        __int16 v25 = 2112;
        BOOL v26 = v13;
        _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_DEBUG, "%{public}@Not importing transaction %lld with author %{mask.hash}@", buf, 0x2Au);
      }
    }
  }
LABEL_10:
}

void __71__HMDCoreDataCloudTransform__changeSetsFromImportTransactions_context___block_invoke_2(void **a1, void *a2)
{
  v163[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  int v4 = a1[4];
  id v5 = a1[5];
  id v6 = v3;
  id v7 = v5;
  if (!v4) {
    goto LABEL_17;
  }
  unint64_t v8 = [v6 changeType];
  if (v8 >= 2)
  {
    if (v8 == 2)
    {
      id v26 = v6;
      uint64_t v27 = [v26 changedObjectID];
      uint64_t v28 = [v27 entity];
      uint64_t v29 = [v28 managedObjectClassName];
      Class v30 = NSClassFromString(v29);
      LOBYTE(v30) = [(objc_class *)v30 isSubclassOfClass:objc_opt_class()];

      if ((v30 & 1) == 0)
      {
        id v49 = (void *)MEMORY[0x230FBD990]();
        id v50 = v4;
        id v51 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
        {
          __int16 v52 = HMFGetLogIdentifier();
          [v27 entity];
          v53 = char v150 = a1;
          [v53 name];
          uint64_t v55 = v54 = v27;
          *(_DWORD *)buf = 138543874;
          *(void *)&uint8_t buf[4] = v52;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v55;
          __int16 v157 = 2114;
          id v158 = v26;
          _os_log_impl(&dword_22F52A000, v51, OS_LOG_TYPE_ERROR, "%{public}@Unexpected entity type in change: %{public}@, %{public}@", buf, 0x20u);

          uint64_t v27 = v54;
          a1 = v150;
        }
        id v39 = 0;
        goto LABEL_52;
      }
      id v146 = v7;
      id v31 = [v26 tombstone];
      v32 = [v31 objectForKeyedSubscript:@"flags"];
      uint64_t v142 = v32;
      v144 = v31;
      if (v32)
      {
        __int16 v33 = v27;
        id v34 = v32;
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();
        if (isKindOfClass) {
          uint64_t v36 = v34;
        }
        else {
          uint64_t v36 = 0;
        }
        id v37 = v36;

        if (isKindOfClass)
        {
          *(void *)buf = 0;
          *(void *)&buf[8] = 0;
          uint64_t v38 = [v34 getUUIDBytes:buf];
          if ((buf[13] & 8) != 0)
          {
            v91 = (void *)MEMORY[0x230FBD990](v38);
            id v92 = v4;
            v93 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v93, OS_LOG_TYPE_DEBUG))
            {
              id v94 = HMFGetLogIdentifier();
              objc_msgSend(v33, "hmd_debugIdentifier");
              v96 = id v95 = a1;
              *(_DWORD *)buf = 138543874;
              *(void *)&uint8_t buf[4] = v94;
              *(_WORD *)&buf[12] = 2112;
              *(void *)&buf[14] = v96;
              __int16 v157 = 2112;
              id v158 = v144;
              _os_log_impl(&dword_22F52A000, v93, OS_LOG_TYPE_DEBUG, "%{public}@Ignoring import delete of fake model: %@, %@", buf, 0x20u);

              a1 = v95;
            }

            -[HMDCoreDataCloudTransform fakeHomeChangeSetModelID]();
            id v39 = (id)objc_claimAutoreleasedReturnValue();
            char v86 = v144;
            id v7 = v146;
            uint64_t v27 = v33;
            goto LABEL_51;
          }
        }
        id v149 = a1;

        uint64_t v27 = v33;
      }
      else
      {
        v64 = (void *)MEMORY[0x230FBD990]();
        id v65 = v4;
        id v66 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          id v67 = v31;
          id v68 = v26;
          id v70 = v69 = v27;
          *(_DWORD *)buf = 138543618;
          *(void *)&uint8_t buf[4] = v70;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v68;
          _os_log_impl(&dword_22F52A000, v66, OS_LOG_TYPE_ERROR, "%{public}@Flags missing from tombstone: %{public}@", buf, 0x16u);

          uint64_t v27 = v69;
          id v26 = v68;
          id v31 = v67;
        }
        id v149 = a1;
      }
      -[HMDCoreDataCloudTransform _homeModelIDPropertyNameForObjectID:](v27);
      id v34 = (id)objc_claimAutoreleasedReturnValue();
      int v71 = [v31 objectForKeyedSubscript:v34];
      v72 = v71;
      if (v71)
      {
        int v140 = v27;
        id v73 = v71;
        objc_opt_class();
        int v74 = objc_opt_isKindOfClass() & 1;
        if (v74) {
          char v75 = v73;
        }
        else {
          char v75 = 0;
        }
        id v76 = v75;

        if (v74)
        {
          id v39 = v73;
          id v7 = v146;
        }
        else
        {
          id v138 = v76;
          id v82 = (void *)MEMORY[0x230FBD990]();
          id v83 = v4;
          id v84 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR))
          {
            v85 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138544130;
            *(void *)&uint8_t buf[4] = v85;
            *(_WORD *)&buf[12] = 2160;
            *(void *)&buf[14] = 1752392040;
            __int16 v157 = 2112;
            id v158 = v73;
            __int16 v159 = 2114;
            id v160 = v26;
            _os_log_impl(&dword_22F52A000, v84, OS_LOG_TYPE_ERROR, "%{public}@Home model ID is unexpected type in tombstone: %{mask.hash}@, %{public}@", buf, 0x2Au);
          }
          id v39 = 0;
          id v7 = v146;
          id v76 = v138;
          uint64_t v27 = v140;
        }
      }
      else
      {
        v77 = (void *)MEMORY[0x230FBD990]();
        id v78 = v4;
        v79 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v81 = v80 = v27;
          *(_DWORD *)buf = 138543618;
          *(void *)&uint8_t buf[4] = v81;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v26;
          _os_log_impl(&dword_22F52A000, v79, OS_LOG_TYPE_ERROR, "%{public}@Home model ID missing from tombstone: %{public}@", buf, 0x16u);

          uint64_t v27 = v80;
        }

        id v39 = 0;
        id v7 = v146;
      }
      char v86 = v144;

      a1 = v149;
LABEL_51:

LABEL_52:
      goto LABEL_77;
    }
LABEL_17:
    id v39 = 0;
    goto LABEL_77;
  }
  v148 = a1;
  id v9 = v6;
  id v10 = v7;
  char v11 = [v9 changedObjectID];
  uint64_t v12 = [v11 entity];
  id v13 = [v12 managedObjectClassName];
  Class v14 = NSClassFromString(v13);
  LOBYTE(v14) = [(objc_class *)v14 isSubclassOfClass:objc_opt_class()];

  if ((v14 & 1) == 0)
  {
    uint64_t v40 = (void *)MEMORY[0x230FBD990]();
    id v41 = v4;
    id v42 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      uint64_t v43 = HMFGetLogIdentifier();
      [v11 entity];
      int v147 = v11;
      id v44 = v10;
      uint64_t v46 = v45 = v9;
      [v46 name];
      v48 = id v47 = v7;
      *(_DWORD *)buf = 138543874;
      *(void *)&uint8_t buf[4] = v43;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v48;
      __int16 v157 = 2114;
      id v158 = v45;
      _os_log_impl(&dword_22F52A000, v42, OS_LOG_TYPE_ERROR, "%{public}@Unexpected entity type in change: %{public}@, %{public}@", buf, 0x20u);

      id v7 = v47;
      id v9 = v45;
      id v10 = v44;
      char v11 = v147;
    }
    id v39 = 0;
    a1 = v148;
    goto LABEL_76;
  }
  id v141 = v9;
  id v145 = v7;
  id v15 = -[HMDCoreDataCloudTransform _homeModelIDPropertyNameForObjectID:](v11);
  v163[0] = v15;
  uint64_t v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v163 count:1];
  id v17 = +[MKFCKModel appendDefaultPreloadedPropertiesTo:v16];

  id v155 = 0;
  id v143 = v10;
  id v18 = objc_msgSend(v10, "hmd_fetchExistingObjectWithID:propertiesToFetch:error:", v11, v17, &v155);
  id v139 = v155;
  if (v139)
  {
    uint64_t v132 = v18;
    v134 = v15;
    id v136 = v17;
    id v19 = (void *)MEMORY[0x230FBD990]();
    id v20 = v4;
    __int16 v21 = HMFGetOSLogHandle();
    uint64_t v22 = v139;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      __int16 v23 = HMFGetLogIdentifier();
      uint64_t v24 = objc_msgSend(v11, "hmd_debugIdentifier");
      *(_DWORD *)buf = 138543874;
      *(void *)&uint8_t buf[4] = v23;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v24;
      __int16 v157 = 2114;
      id v158 = v139;
      _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch object %@: %{public}@", buf, 0x20u);
    }
    id v25 = 0;
    id v7 = v145;
    id v9 = v141;
    id v15 = v134;
    id v17 = v136;
    id v18 = v132;
    goto LABEL_75;
  }
  if (v18)
  {
    id v137 = v17;
    id v56 = v18;
    objc_opt_class();
    int v57 = objc_opt_isKindOfClass() & 1;
    if (v57) {
      __int16 v58 = v56;
    }
    else {
      __int16 v58 = 0;
    }
    id v59 = v58;

    id v9 = v141;
    v133 = v18;
    v135 = v15;
    id v131 = v59;
    if (v57)
    {
      if (![v56 isFake])
      {
        v97 = [v56 valueForKey:v15];
        v130 = v97;
        if (v97)
        {
          id v98 = v97;
          objc_opt_class();
          LODWORD(v128) = objc_opt_isKindOfClass() & 1;
          if (v128) {
            v99 = v98;
          }
          else {
            v99 = 0;
          }
          id v129 = v99;

          if (v128)
          {
            id v25 = v98;
          }
          else
          {
            id v128 = v98;
            v104 = (void *)MEMORY[0x230FBD990]();
            id v105 = v4;
            id v106 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v106, OS_LOG_TYPE_ERROR))
            {
              v107 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138544386;
              *(void *)&uint8_t buf[4] = v107;
              *(_WORD *)&buf[12] = 2160;
              *(void *)&buf[14] = 1752392040;
              __int16 v157 = 2112;
              id v158 = v128;
              __int16 v159 = 2112;
              id v160 = v56;
              __int16 v161 = 2114;
              id v162 = v141;
              _os_log_impl(&dword_22F52A000, v106, OS_LOG_TYPE_ERROR, "%{public}@Home model ID is unexpected type (%{mask.hash}@) in object: %@, %{public}@", buf, 0x34u);
            }
            id v25 = 0;
            id v18 = v133;
            id v15 = v135;
          }
          uint64_t v22 = 0;

          id v7 = v145;
          id v17 = v137;
        }
        else
        {
          id v100 = (void *)MEMORY[0x230FBD990]();
          id v101 = v4;
          v102 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v102, OS_LOG_TYPE_ERROR))
          {
            v103 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543874;
            *(void *)&uint8_t buf[4] = v103;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v56;
            __int16 v157 = 2114;
            id v158 = v141;
            _os_log_impl(&dword_22F52A000, v102, OS_LOG_TYPE_ERROR, "%{public}@Home model ID is missing in object: %@, %{public}@", buf, 0x20u);
          }
          id v25 = 0;
          id v7 = v145;
          id v15 = v135;
          id v17 = v137;
          id v18 = v133;
          uint64_t v22 = 0;
        }

        goto LABEL_74;
      }
      __int16 v60 = (void *)MEMORY[0x230FBD990]();
      id v61 = v4;
      uint64_t v62 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v62, OS_LOG_TYPE_DEBUG))
      {
        id v63 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v63;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v56;
        _os_log_impl(&dword_22F52A000, v62, OS_LOG_TYPE_DEBUG, "%{public}@Ignoring import of fake model: %@", buf, 0x16u);
      }
      -[HMDCoreDataCloudTransform fakeHomeChangeSetModelID]();
      id v25 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v87 = (void *)MEMORY[0x230FBD990]();
      id v88 = v4;
      id v89 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v89, OS_LOG_TYPE_ERROR))
      {
        v90 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        *(void *)&uint8_t buf[4] = v90;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v56;
        __int16 v157 = 2114;
        id v158 = v141;
        _os_log_impl(&dword_22F52A000, v89, OS_LOG_TYPE_ERROR, "%{public}@Unexpected type of object in change: %@, %{public}@", buf, 0x20u);
      }
      id v25 = 0;
    }
    id v7 = v145;
    id v15 = v135;
    id v17 = v137;
    id v18 = v133;
    uint64_t v22 = 0;
LABEL_74:

    goto LABEL_75;
  }
  id v25 = 0;
  uint64_t v22 = 0;
  id v9 = v141;
LABEL_75:

  id v39 = v25;
  id v10 = v143;
LABEL_76:

LABEL_77:
  uint64_t v108 = -[HMDCoreDataCloudTransform _changeSetForHome:isImport:clientIdentifier:qualityOfService:cache:](a1[4], v39, 1, 0, (void *)0xFFFFFFFFFFFFFFFFLL, a1[6]);
  v109 = [v6 changedObjectID];
  v110 = [v109 entity];
  v111 = +[MKFCKHome entity];
  int v112 = [v110 isKindOfEntity:v111];

  if (v112)
  {
    if ([v6 changeType] == 2)
    {
      if (v108) {
        *(unsigned char *)(v108 + 32) = 1;
      }
    }
    else
    {
      uint64_t v113 = [v6 updatedProperties];
      v152[0] = MEMORY[0x263EF8330];
      v152[1] = 3221225472;
      v152[2] = __71__HMDCoreDataCloudTransform__changeSetsFromImportTransactions_context___block_invoke_3;
      v152[3] = &unk_264A1F450;
      v152[4] = a1[4];
      id v153 = v39;
      id v154 = a1[5];
      objc_msgSend(v113, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v152);
    }
  }
  BOOL v114 = objc_msgSend(v6, "changedObjectID", v128);
  char v115 = [v114 entity];
  id v116 = +[MKFCKSharedHome entity];
  if (([v115 isKindOfEntity:v116] & 1) == 0)
  {

LABEL_89:
    if (!v108) {
      goto LABEL_92;
    }
    goto LABEL_90;
  }
  v117 = [v6 transaction];
  id v118 = [v117 storeID];
  objc_msgSend(a1[5], "hmd_cloudSharedStoreIdentifier");
  uint64_t v119 = v108;
  id v120 = v39;
  id v121 = v6;
  v123 = v122 = a1;
  int v151 = [v118 isEqualToString:v123];

  a1 = v122;
  id v6 = v121;
  id v39 = v120;
  uint64_t v108 = v119;

  if (!v151) {
    goto LABEL_89;
  }
  v124 = (void *)MEMORY[0x230FBD990]();
  id v125 = a1[4];
  v126 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v126, OS_LOG_TYPE_INFO))
  {
    v127 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    *(void *)&uint8_t buf[4] = v127;
    _os_log_impl(&dword_22F52A000, v126, OS_LOG_TYPE_INFO, "%{public}@Allowing import processing of MKFCKSharedHome that have been shared with this account", buf, 0xCu);
  }
  if (v108)
  {
    *(unsigned char *)(v108 + 32) = 1;
LABEL_90:
    if (-[HMDCoreDataCloudTransform _shouldProcessChange:homeModelID:isImport:context:]((id *)a1[4], v6, v39, 1, a1[5]))-[HMDCoreDataCloudTransformChangeSet processChange:]((id *)v108, v6); {
  }
    }
LABEL_92:
}

- (_BYTE)_changeSetForHome:(uint64_t)a3 isImport:(void *)a4 clientIdentifier:(void *)a5 qualityOfService:(void *)a6 cache:
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v11 = a2;
  id v12 = a4;
  id v13 = a6;
  if (!a1 || !v11 && (a3 & 1) != 0)
  {
    Class v14 = 0;
    goto LABEL_23;
  }
  id v15 = (void *)*MEMORY[0x263EFFD08];
  if (v11) {
    id v15 = v11;
  }
  id v16 = v15;
  Class v14 = [v13 objectForKeyedSubscript:v16];
  if (!v14)
  {
    Class v14 = -[HMDCoreDataCloudTransformChangeSet initWithHomeModelID:clientIdentifier:qualityOfService:]((id *)[HMDCoreDataCloudTransformChangeSet alloc], v11, v12, a5);
    [v13 setObject:v14 forKeyedSubscript:v16];
    if (v11)
    {
      id v17 = [a1 delegate];
      id v18 = v17;
      if (!v17) {
        id v17 = a1;
      }
      int v19 = [v17 cloudTransform:a1 isPermittedForHomeWithModelID:v11 isImport:a3];

      id v20 = (void *)MEMORY[0x230FBD990]();
      id v21 = a1;
      uint64_t v22 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        __int16 v23 = v27 = v20;
        uint64_t v24 = @"denied";
        *(_DWORD *)buf = 138544386;
        uint64_t v29 = v23;
        if (v19) {
          uint64_t v24 = @"allowed";
        }
        id v31 = v24;
        id v25 = @"import";
        __int16 v30 = 2114;
        __int16 v32 = 2114;
        if (!a3) {
          id v25 = @"export";
        }
        __int16 v33 = v25;
        __int16 v34 = 2160;
        uint64_t v35 = 1752392040;
        __int16 v36 = 2112;
        id v37 = v11;
        _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_DEBUG, "%{public}@Delegate has %{public}@ %{public}@ transform for home %{mask.hash}@", buf, 0x34u);

        id v20 = v27;
      }

      if (!v14) {
        goto LABEL_22;
      }
      goto LABEL_21;
    }
    if (v14)
    {
      LOBYTE(v19) = 1;
LABEL_21:
      v14[32] = v19;
    }
  }
LABEL_22:

LABEL_23:
  return v14;
}

void __71__HMDCoreDataCloudTransform__changeSetsFromImportTransactions_context___block_invoke_3(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = [v5 name];
  int v7 = [v6 isEqualToString:@"homeManagerApplicationData"];

  if (v7)
  {
    unint64_t v8 = (void *)MEMORY[0x230FBD990]();
    id v9 = *(id *)(a1 + 32);
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      id v11 = HMFGetLogIdentifier();
      uint64_t v12 = *(void *)(a1 + 40);
      int v13 = 138543874;
      Class v14 = v11;
      __int16 v15 = 2160;
      uint64_t v16 = 1752392040;
      __int16 v17 = 2112;
      uint64_t v18 = v12;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Detected home manager application data change on home %{mask.hash}@", (uint8_t *)&v13, 0x20u);
    }
    objc_msgSend(*(id *)(a1 + 48), "setHmd_homeManagerApplicationDataChanged:", 1);
    *a3 = 1;
  }
}

- (uint64_t)_shouldProcessChange:(void *)a3 homeModelID:(int)a4 isImport:(void *)a5 context:
{
  uint64_t v68 = *MEMORY[0x263EF8340];
  id v9 = a2;
  id v10 = a3;
  id v11 = a5;
  if (!a1)
  {
    uint64_t v16 = 0;
    goto LABEL_28;
  }
  uint64_t v12 = [v9 changedObjectID];
  int v13 = [v12 entity];

  if (!a4)
  {
LABEL_6:
    uint64_t v19 = +[MKFCKSharedHome entity];
    if ([v13 isKindOfEntity:v19])
    {
      id v20 = [v9 transaction];
      id v21 = [v20 storeID];
      uint64_t v22 = objc_msgSend(v11, "hmd_cloudPrivateStoreIdentifier");
      __int16 v52 = a1;
      id v23 = v9;
      uint64_t v24 = v13;
      id v25 = v10;
      id v26 = v11;
      int v27 = [v21 isEqualToString:v22];

      uint64_t v16 = v27 ^ 1u;
      if (v27)
      {
        id v11 = v26;
        id v10 = v25;
        int v13 = v24;
        id v9 = v23;
        goto LABEL_27;
      }
      id v11 = v26;
      id v10 = v25;
      int v13 = v24;
      id v9 = v23;
      a1 = v52;
      if (a4) {
        goto LABEL_27;
      }
LABEL_12:
      id v28 = v9;
      id v49 = v10;
      id v50 = v11;
      id v51 = v28;
      uint64_t v29 = [v28 changedObjectID];
      id v53 = [v29 entity];

      __int16 v30 = [v53 userInfo];
      id v31 = [v30 objectForKeyedSubscript:@"cloudSyncInclude"];
      __int16 v32 = v31;
      if (v31 && ([v31 BOOLValue] & 1) == 0)
      {
        id v48 = (void *)MEMORY[0x230FBD990]();
        uint64_t v40 = a1;
        id v41 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v46 = HMFGetLogIdentifier();
          id v42 = [v53 name];
          *(_DWORD *)v64 = 138544130;
          *(void *)&v64[4] = v46;
          *(_WORD *)&v64[12] = 2112;
          *(void *)&v64[14] = v42;
          *(_WORD *)&v64[22] = 2112;
          id v65 = @"cloudSyncInclude";
          LOWORD(v66) = 2112;
          *(void *)((char *)&v66 + 2) = v32;
          _os_log_impl(&dword_22F52A000, v41, OS_LOG_TYPE_DEBUG, "%{public}@Ignoring update to %@ as it is marked with '%@' = '%@'", v64, 0x2Au);
        }
        uint64_t v16 = 0;
      }
      else
      {
        __int16 v33 = [v30 objectForKeyedSubscript:@"cloudSyncEntity"];

        if (v33 && [v51 changeType] == 1)
        {
          id v47 = v11;
          uint64_t v54 = 0;
          uint64_t v55 = &v54;
          uint64_t v56 = 0x2020000000;
          char v57 = 0;
          __int16 v34 = [v51 updatedProperties];
          *(void *)v64 = MEMORY[0x263EF8330];
          *(void *)&v64[8] = 3221225472;
          *(void *)&v64[16] = __76__HMDCoreDataCloudTransform__shouldProcessExportChange_homeModelID_context___block_invoke;
          id v65 = (__CFString *)&unk_264A1F220;
          *(void *)&long long v66 = a1;
          id v45 = v53;
          *((void *)&v66 + 1) = v45;
          id v67 = &v54;
          objc_msgSend(v34, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v64);

          uint64_t v16 = *((unsigned char *)v55 + 24) != 0;
          if (!*((unsigned char *)v55 + 24))
          {
            context = (void *)MEMORY[0x230FBD990]();
            uint64_t v35 = a1;
            HMFGetOSLogHandle();
            __int16 v36 = (id)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
            {
              id v37 = v35;
              HMFGetLogIdentifier();
              id v38 = (id)objc_claimAutoreleasedReturnValue();
              id v39 = [v45 name];
              *(_DWORD *)buf = 138543874;
              id v59 = v38;
              __int16 v60 = 2112;
              id v61 = v39;
              __int16 v62 = 2112;
              id v63 = v51;
              _os_log_impl(&dword_22F52A000, v36, OS_LOG_TYPE_DEBUG, "%{public}@No relevant updates to %@, skipping change: %@", buf, 0x20u);

              uint64_t v35 = v37;
            }
          }

          id v11 = v47;
          _Block_object_dispose(&v54, 8);
        }
        else
        {
          uint64_t v16 = 1;
        }
      }

      goto LABEL_27;
    }

    if ((a4 & 1) == 0) {
      goto LABEL_12;
    }
LABEL_11:
    uint64_t v16 = 1;
    goto LABEL_27;
  }
  Class v14 = -[HMDCoreDataCloudTransform fakeHomeChangeSetModelID]();
  char v15 = [v10 isEqual:v14];

  if ((v15 & 1) == 0)
  {
    __int16 v17 = [a1[12] objectForKey:v13];
    uint64_t v18 = [v17 count];

    if (v18) {
      goto LABEL_11;
    }
    goto LABEL_6;
  }
  uint64_t v16 = 0;
LABEL_27:

LABEL_28:
  return v16;
}

- (id)fakeHomeChangeSetModelID
{
  if (fakeHomeChangeSetModelID__hmf_once_t13 != -1) {
    dispatch_once(&fakeHomeChangeSetModelID__hmf_once_t13, &__block_literal_global_111);
  }
  v0 = (void *)fakeHomeChangeSetModelID__hmf_once_v14;
  return v0;
}

void __76__HMDCoreDataCloudTransform__shouldProcessExportChange_homeModelID_context___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v3 = a2;
  int v4 = [v3 userInfo];
  id v5 = [v4 objectForKeyedSubscript:@"cloudSyncInclude"];
  id v6 = v5;
  if (!v5 || ([v5 BOOLValue] & 1) != 0)
  {
    id v7 = v3;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      unint64_t v8 = v7;
    }
    else {
      unint64_t v8 = 0;
    }
    id v9 = v8;

    if (v9)
    {
      if (([v6 BOOLValue] & 1) == 0)
      {
        id v10 = [v4 objectForKeyedSubscript:@"cloudSyncCustomCopy"];
        int v11 = [v10 BOOLValue];

        if (!v11)
        {
          uint64_t v12 = [v9 name];
          int v13 = [v12 isEqualToString:@"writerTimestamp"];

          if ((v13 & 1) == 0)
          {
            Class v14 = (void *)MEMORY[0x230FBD990]();
            id v15 = *(id *)(a1 + 32);
            uint64_t v16 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
            {
              __int16 v17 = HMFGetLogIdentifier();
              uint64_t v18 = [*(id *)(a1 + 40) name];
              uint64_t v19 = [v7 name];
              int v28 = 138543874;
              uint64_t v29 = v17;
              __int16 v30 = 2112;
              id v31 = v18;
              __int16 v32 = 2112;
              __int16 v33 = v19;
              _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_DEBUG, "%{public}@Ignoring update to %@.%@ as it is not included in cloud sync", (uint8_t *)&v28, 0x20u);
            }
          }
          goto LABEL_19;
        }
      }
    }
    else
    {
      id v26 = v7;
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (!v26 || (isKindOfClass & 1) == 0) {
        goto LABEL_19;
      }
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
LABEL_19:

    goto LABEL_20;
  }
  id v20 = (void *)MEMORY[0x230FBD990]();
  id v21 = *(id *)(a1 + 32);
  uint64_t v22 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    id v23 = HMFGetLogIdentifier();
    uint64_t v24 = [*(id *)(a1 + 40) name];
    id v25 = [v3 name];
    int v28 = 138544386;
    uint64_t v29 = v23;
    __int16 v30 = 2112;
    id v31 = v24;
    __int16 v32 = 2112;
    __int16 v33 = v25;
    __int16 v34 = 2112;
    uint64_t v35 = @"cloudSyncInclude";
    __int16 v36 = 2112;
    id v37 = v6;
    _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_DEBUG, "%{public}@Ignoring update to %@.%@ as it is marked with '%@' = '%@'", (uint8_t *)&v28, 0x34u);
  }
LABEL_20:
}

void __53__HMDCoreDataCloudTransform_fakeHomeChangeSetModelID__block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"FA40BC4C-1D19-499A-BE28-6CE8F1A9EF66"];
  uint64_t v1 = (void *)fakeHomeChangeSetModelID__hmf_once_v14;
  fakeHomeChangeSetModelID__hmf_once_Class v14 = v0;
}

- (__CFString)_homeModelIDPropertyNameForObjectID:(void *)a1
{
  uint64_t v1 = [a1 entity];
  uint64_t v2 = +[MKFCKHome entity];
  char v3 = [v1 isKindOfEntity:v2];

  int v4 = @"modelID";
  if ((v3 & 1) == 0)
  {
    id v5 = +[MKFCKSharedHome entity];
    int v6 = [v1 isKindOfEntity:v5];

    if (!v6) {
      int v4 = @"homeModelID";
    }
  }

  return v4;
}

void __71__HMDCoreDataCloudTransform__changeSetsFromExportTransactions_context___block_invoke(id *a1, void *a2)
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = a1[4];
  id v5 = v3;
  int v6 = v5;
  id v7 = v5;
  if (!v4) {
    goto LABEL_11;
  }
  unint64_t v8 = [v5 contextName];

  if (!v8)
  {
    id v10 = (void *)MEMORY[0x230FBD990]();
    id v16 = v4;
    uint64_t v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v39 = v13;
      __int16 v40 = 2112;
      uint64_t v41 = (uint64_t)v6;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_ERROR, "%{public}@Can't process transaction with no context name: %@", buf, 0x16u);
      goto LABEL_9;
    }
LABEL_10:

    id v7 = v6;
    goto LABEL_11;
  }
  unint64_t v9 = objc_msgSend(v6, "hmd_transactionAuthor");
  if (v9 <= 0xB && ((1 << v9) & 0xB30) != 0)
  {
    id v10 = (void *)MEMORY[0x230FBD990]();
    id v11 = v4;
    uint64_t v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v13 = HMFGetLogIdentifier();
      uint64_t v14 = [v6 transactionNumber];
      id v15 = [v6 author];
      *(_DWORD *)buf = 138543874;
      id v39 = v13;
      __int16 v40 = 2048;
      uint64_t v41 = v14;
      __int16 v42 = 2114;
      uint64_t v43 = (uint64_t)v15;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, "%{public}@Not exporting transaction %lld with author %{public}@", buf, 0x20u);

LABEL_9:
      goto LABEL_10;
    }
    goto LABEL_10;
  }

  id v7 = [v6 contextName];
  if ([v7 isEqualToString:@"HomeManager"])
  {
    __int16 v17 = 0;
    goto LABEL_15;
  }
  __int16 v17 = HMDHomeUUIDFromWorkingContextName(v7);
  if (v17)
  {
LABEL_15:
    uint64_t v18 = [v6 author];
    uint64_t v19 = +[HMDCoreDataContextTransactionAuthor contextAuthorWithString:v18];

    id v20 = a1[4];
    id v21 = [v19 clientIdentifier];
    -[HMDCoreDataCloudTransform _changeSetForHome:isImport:clientIdentifier:qualityOfService:cache:](v20, v17, 0, v21, (void *)[v19 qualityOfService], a1[5]);
    uint64_t v22 = (unsigned char *)objc_claimAutoreleasedReturnValue();

    if (!v22 || !v22[32])
    {
      id v23 = (void *)MEMORY[0x230FBD990]();
      id v24 = a1[4];
      id v25 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        id v26 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        id v39 = v26;
        __int16 v40 = 2160;
        uint64_t v41 = 1752392040;
        __int16 v42 = 2112;
        uint64_t v43 = (uint64_t)v17;
        _os_log_impl(&dword_22F52A000, v25, OS_LOG_TYPE_INFO, "%{public}@Delegate has denied transform for home %{mask.hash}@ but allowing transform because the transaction is a force update", buf, 0x20u);
      }
      if (v22) {
        v22[32] = 1;
      }
    }
    int v27 = [v6 changes];
    v34[0] = MEMORY[0x263EF8330];
    v34[1] = 3221225472;
    v34[2] = __71__HMDCoreDataCloudTransform__changeSetsFromExportTransactions_context___block_invoke_228;
    v34[3] = &unk_264A1F428;
    v34[4] = a1[4];
    id v35 = v17;
    id v36 = a1[6];
    id v37 = v22;
    int v28 = v22;
    id v29 = v17;
    objc_msgSend(v27, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v34);

    goto LABEL_11;
  }
  __int16 v30 = (void *)MEMORY[0x230FBD990]();
  id v31 = a1[4];
  __int16 v32 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
  {
    __int16 v33 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138544130;
    id v39 = v33;
    __int16 v40 = 2048;
    uint64_t v41 = [v6 transactionNumber];
    __int16 v42 = 2160;
    uint64_t v43 = 1752392040;
    __int16 v44 = 2112;
    id v45 = v7;
    _os_log_impl(&dword_22F52A000, v32, OS_LOG_TYPE_ERROR, "%{public}@Refusing to process export transaction %lld with context name %{mask.hash}@", buf, 0x2Au);
  }
LABEL_11:
}

void __71__HMDCoreDataCloudTransform__changeSetsFromExportTransactions_context___block_invoke_228(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (-[HMDCoreDataCloudTransform _shouldProcessChange:homeModelID:isImport:context:](*(id **)(a1 + 32), v3, *(void **)(a1 + 40), 0, *(void **)(a1 + 48)))-[HMDCoreDataCloudTransformChangeSet processChange:](*(id **)(a1 + 56), v3); {
}
  }

- (BOOL)cloudTransform:(id)a3 isPermittedForHomeWithModelID:(id)a4 isImport:(BOOL)a5
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  unint64_t v9 = (void *)MEMORY[0x230FBD990]();
  id v10 = self;
  id v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v12 = HMFGetLogIdentifier();
    int v14 = 138543874;
    id v15 = v12;
    __int16 v16 = 2160;
    uint64_t v17 = 1752392040;
    __int16 v18 = 2112;
    id v19 = v8;
    _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_DEBUG, "%{public}@No delegate assigned, presuming that transform is allowed for home %{mask.hash}@", (uint8_t *)&v14, 0x20u);
  }

  return 1;
}

- (void)coreData:(id)a3 cloudKitExportFinishedForStoreWithIdentifier:(id)a4 duration:(double)a5 error:(id)a6
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  int v13 = (void *)MEMORY[0x230FBD990]();
  int v14 = self;
  id v15 = HMFGetOSLogHandle();
  __int16 v16 = v15;
  if (v12)
  {
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    uint64_t v17 = HMFGetLogIdentifier();
    int v25 = 138544130;
    id v26 = v17;
    __int16 v27 = 2114;
    id v28 = v11;
    __int16 v29 = 2048;
    double v30 = a5;
    __int16 v31 = 2114;
    id v32 = v12;
    __int16 v18 = "%{public}@CloudKit export for store %{public}@ failed after %f seconds: %{public}@";
    id v19 = v16;
    os_log_type_t v20 = OS_LOG_TYPE_ERROR;
    uint32_t v21 = 42;
  }
  else
  {
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_INFO)) {
      goto LABEL_7;
    }
    uint64_t v17 = HMFGetLogIdentifier();
    int v25 = 138543874;
    id v26 = v17;
    __int16 v27 = 2114;
    id v28 = v11;
    __int16 v29 = 2048;
    double v30 = a5;
    __int16 v18 = "%{public}@CloudKit export for store %{public}@ finished after %f seconds";
    id v19 = v16;
    os_log_type_t v20 = OS_LOG_TYPE_INFO;
    uint32_t v21 = 32;
  }
  _os_log_impl(&dword_22F52A000, v19, v20, v18, (uint8_t *)&v25, v21);

LABEL_7:
  if (v14) {
    logEventSubmitter = v14->_logEventSubmitter;
  }
  else {
    logEventSubmitter = 0;
  }
  id v23 = logEventSubmitter;
  id v24 = [[HMDCoreDataCloudKitOperationLogEvent alloc] initWithOperationType:2];
  [(HMMLogEventSubmitting *)v23 submitLogEvent:v24 error:v12];
}

- (void)coreData:(id)a3 cloudKitExportStartedForStoreWithIdentifier:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x230FBD990]();
  unint64_t v9 = self;
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = HMFGetLogIdentifier();
    int v12 = 138543618;
    int v13 = v11;
    __int16 v14 = 2114;
    id v15 = v7;
    _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@CloudKit export started for store %{public}@", (uint8_t *)&v12, 0x16u);
  }
}

- (void)coreData:(id)a3 cloudKitImportFinishedForStoreWithIdentifier:(id)a4 duration:(double)a5 error:(id)a6
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  int v13 = self->_logger;
  __int16 v14 = v13;
  os_signpost_id_t importSignpostID = self->_importSignpostID;
  if (importSignpostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v13))
  {
    HMFBooleanToString();
    id v16 = (id)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      uint64_t v17 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v12, "code"));
      [v12 domain];
    }
    else
    {
      uint64_t v17 = [MEMORY[0x263EFF9D0] null];
      [MEMORY[0x263EFF9D0] null];
    __int16 v18 = };
    int v34 = 138413058;
    id v35 = v11;
    __int16 v36 = 2112;
    id v37 = v16;
    __int16 v38 = 2112;
    double v39 = *(double *)&v17;
    __int16 v40 = 2112;
    id v41 = v18;
    _os_signpost_emit_with_name_impl(&dword_22F52A000, v14, OS_SIGNPOST_INTERVAL_END, importSignpostID, "CoreDataCloudTransformImport", "storeIdentifier=%{signpost.description:attribute}@ succeeded=%{signpost.description:attribute}@ errorCode=%{signpost.description:attribute}@ errorDomain=%{signpost.description:attribute}@ ", (uint8_t *)&v34, 0x2Au);
  }
  self->_os_signpost_id_t importSignpostID = 0;
  id v19 = (void *)MEMORY[0x230FBD990]();
  os_log_type_t v20 = self;
  uint32_t v21 = HMFGetOSLogHandle();
  uint64_t v22 = v21;
  if (v12)
  {
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      id v23 = HMFGetLogIdentifier();
      int v34 = 138544130;
      id v35 = v23;
      __int16 v36 = 2114;
      id v37 = v11;
      __int16 v38 = 2048;
      double v39 = a5;
      __int16 v40 = 2114;
      id v41 = v12;
      _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_ERROR, "%{public}@CloudKit import for store %{public}@ failed after %f seconds: %{public}@", (uint8_t *)&v34, 0x2Au);
    }
  }
  else if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    id v24 = HMFGetLogIdentifier();
    int v34 = 138543874;
    id v35 = v24;
    __int16 v36 = 2114;
    id v37 = v11;
    __int16 v38 = 2048;
    double v39 = a5;
    _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_INFO, "%{public}@CloudKit import for store %{public}@ finished after %f seconds", (uint8_t *)&v34, 0x20u);
  }
  int v25 = v20->_logEventSubmitter;
  id v26 = [[HMDCoreDataCloudKitOperationLogEvent alloc] initWithOperationType:1];
  [(HMMLogEventSubmitting *)v25 submitLogEvent:v26 error:v12];

  os_unfair_lock_lock_with_options();
  __int16 v27 = v20->_cloudImportInProgressStoreIdentifiers;
  [(NSMutableSet *)v27 removeObject:v11];

  if ([(NSMutableSet *)v20->_cloudImportInProgressStoreIdentifiers count]
    || (id v28 = v20->_pendingChangedStoreIdentifiers,
        BOOL v29 = [(NSMutableSet *)v28 count] == 0,
        v28,
        v29))
  {
    os_unfair_lock_unlock(&v20->_lock.lock);
  }
  else
  {
    double v30 = -[HMDCoreDataCloudTransform _managedObjectContext]((id *)&v20->super.super.isa);
    __int16 v31 = v20->_pendingChangedStoreIdentifiers;
    id v32 = (void *)[(NSMutableSet *)v31 copy];

    uint64_t v33 = v20->_pendingChangedStoreIdentifiers;
    [(NSMutableSet *)v33 removeAllObjects];

    os_unfair_lock_unlock(&v20->_lock.lock);
    -[HMDCoreDataCloudTransform _runTransformOnContext:storeIdentifiers:completeMergeHomeModelID:completion:](v20, v30, v32, 0, 0);
  }
}

- (id)cloudImportInProgressStoreIdentifiers
{
  if (a1)
  {
    a1 = (id *)a1[8];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)_managedObjectContext
{
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained(a1 + 6);
    if (!WeakRetained)
    {
      id v3 = [a1 coreData];
      id v4 = (void *)[v3 newManagedObjectContext];
      v7[0] = MEMORY[0x263EF8330];
      v7[1] = 3221225472;
      v7[2] = __50__HMDCoreDataCloudTransform__managedObjectContext__block_invoke;
      v7[3] = &unk_264A2F2F8;
      id WeakRetained = v4;
      id v8 = WeakRetained;
      unint64_t v9 = a1;
      id v10 = v3;
      id v5 = v3;
      [WeakRetained performBlockAndWait:v7];
      objc_storeWeak(a1 + 6, WeakRetained);
    }
  }
  else
  {
    id WeakRetained = 0;
  }
  return WeakRetained;
}

- (void)_runTransformOnContext:(void *)a3 storeIdentifiers:(void *)a4 completeMergeHomeModelID:(void *)a5 completion:
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  int v13 = v12;
  if (a1)
  {
    v27[0] = 0;
    v27[1] = v27;
    v27[2] = 0x3032000000;
    v27[3] = __Block_byref_object_copy__116043;
    v27[4] = __Block_byref_object_dispose__116044;
    id v28 = 0;
    if (v12)
    {
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __105__HMDCoreDataCloudTransform__runTransformOnContext_storeIdentifiers_completeMergeHomeModelID_completion___block_invoke;
      block[3] = &unk_264A1F110;
      id v25 = v12;
      id v26 = v27;
      dispatch_block_t v14 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
    }
    else
    {
      dispatch_block_t v14 = 0;
    }
    objc_initWeak(&location, a1);
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __105__HMDCoreDataCloudTransform__runTransformOnContext_storeIdentifiers_completeMergeHomeModelID_completion___block_invoke_125;
    v16[3] = &unk_264A1F138;
    objc_copyWeak(&v22, &location);
    id v15 = v14;
    id v20 = v15;
    uint32_t v21 = v27;
    id v17 = v9;
    id v18 = v10;
    id v19 = v11;
    [v17 performBlock:v16];

    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);

    _Block_object_dispose(v27, 8);
  }
}

void __105__HMDCoreDataCloudTransform__runTransformOnContext_storeIdentifiers_completeMergeHomeModelID_completion___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = (void *)MEMORY[0x230FBD990]();
  id v4 = objc_opt_class();
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    id v6 = HMFGetLogIdentifier();
    int v7 = 138543362;
    id v8 = v6;
    _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_DEBUG, "%{public}@Running completion handler", (uint8_t *)&v7, 0xCu);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __105__HMDCoreDataCloudTransform__runTransformOnContext_storeIdentifiers_completeMergeHomeModelID_completion___block_invoke_125(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    -[HMDCoreDataCloudTransform _runTransformWhilePerformingBlockOnContext:storeIdentifiers:completeMergeHomeModelID:](WeakRetained, *(void **)(a1 + 32), *(void **)(a1 + 40), *(void **)(a1 + 48));
    if (*(void *)(a1 + 56))
    {
      id v4 = (void *)MEMORY[0x230FBD990]();
      id v5 = v3;
      id v6 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        int v7 = HMFGetLogIdentifier();
        int v22 = 138543362;
        id v23 = v7;
        _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_DEBUG, "%{public}@Dispatching completion handler", (uint8_t *)&v22, 0xCu);
      }
      uint64_t v8 = *(void *)(*(void *)(a1 + 64) + 8);
      uint64_t v9 = *(void **)(v8 + 40);
      *(void *)(v8 + 40) = 0;

      id v10 = dispatch_get_global_queue(21, 0);
      dispatch_async(v10, *(dispatch_block_t *)(a1 + 56));
    }
    -[HMDCoreDataCloudTransform _delayContextDestruction:]((uint64_t)v3, *(void **)(a1 + 32));
  }
  else
  {
    id v11 = (void *)MEMORY[0x230FBD990]();
    id v12 = objc_opt_class();
    int v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      dispatch_block_t v14 = HMFGetLogIdentifier();
      int v22 = 138543362;
      id v23 = v14;
      _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@HMDCoreDataCloudTransform deallocated before running transform", (uint8_t *)&v22, 0xCu);
    }
    if (*(void *)(a1 + 56))
    {
      id v15 = (void *)MEMORY[0x230FBD990]();
      id v16 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        id v17 = HMFGetLogIdentifier();
        int v22 = 138543362;
        id v23 = v17;
        _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_DEBUG, "%{public}@Dispatching completion handler", (uint8_t *)&v22, 0xCu);
      }
      uint64_t v18 = [MEMORY[0x263F087E8] hmfErrorWithCode:12];
      uint64_t v19 = *(void *)(*(void *)(a1 + 64) + 8);
      id v20 = *(void **)(v19 + 40);
      *(void *)(v19 + 40) = v18;

      uint32_t v21 = dispatch_get_global_queue(21, 0);
      dispatch_async(v21, *(dispatch_block_t *)(a1 + 56));
    }
  }
}

- (void)_runTransformWhilePerformingBlockOnContext:(void *)a3 storeIdentifiers:(void *)a4 completeMergeHomeModelID:
{
  v147[1] = *MEMORY[0x263EF8340];
  id v108 = a2;
  id v106 = a3;
  id v7 = a4;
  if (!a1) {
    goto LABEL_82;
  }
  if (![a1 badCDPState])
  {
    v103 = (void *)[objc_alloc(MEMORY[0x263F425C0]) initWithName:@"com.apple.homed.cloud-transform"];
    if (v7)
    {
      id v105 = 0;
    }
    else
    {
      id v12 = (void *)MEMORY[0x263EFF980];
      if (v106) {
        uint64_t v13 = [v106 count];
      }
      else {
        uint64_t v13 = 3;
      }
      dispatch_block_t v14 = [v12 arrayWithCapacity:v13];
      id v15 = [v108 persistentStoreCoordinator];
      id v16 = [v15 persistentStores];
      v112[0] = MEMORY[0x263EF8330];
      v112[1] = 3221225472;
      v112[2] = __114__HMDCoreDataCloudTransform__runTransformWhilePerformingBlockOnContext_storeIdentifiers_completeMergeHomeModelID___block_invoke;
      v112[3] = &unk_264A1F160;
      id v113 = v106;
      id v114 = v108;
      id v105 = v14;
      id v115 = v105;
      objc_msgSend(v16, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v112);

      if (![v105 count])
      {
LABEL_81:

        goto LABEL_82;
      }
    }
    id v17 = (void *)MEMORY[0x230FBD990]();
    uint64_t v18 = a1;
    uint64_t v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      id v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138544130;
      *(void *)&uint8_t buf[4] = v20;
      *(_WORD *)&buf[12] = 2160;
      *(void *)&buf[14] = 1752392040;
      *(_WORD *)&unsigned char buf[22] = 2112;
      id v143 = v7;
      LOWORD(v144) = 2114;
      *(void *)((char *)&v144 + 2) = v106;
      _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_DEBUG, "%{public}@Starting transform: completeMergeHomeModelID = %{mask.hash}@, storeIdentifiers = %{public}@", buf, 0x2Au);
    }
    id v107 = v108;
    uint32_t v21 = [MEMORY[0x263EFF340] currentQueryGenerationToken];
    id v127 = 0;
    char v22 = [v107 setQueryGenerationFromToken:v21 error:&v127];
    id v23 = v127;

    if ((v22 & 1) == 0)
    {
      uint64_t v24 = (void *)MEMORY[0x230FBD990]();
      id v25 = v18;
      id v26 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        __int16 v27 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v27;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v23;
        _os_log_impl(&dword_22F52A000, v26, OS_LOG_TYPE_ERROR, "%{public}@Failed to pin context to current query generation: %{public}@", buf, 0x16u);
      }
    }
    if (!v18[11])
    {
      id v28 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:3];
      BOOL v29 = -[HMDCoreDataCloudTransform _fetchOrCreateMetadataForManagedObjectContext:](v18, v107);
      double v30 = [v29 historyTokenForCloudStore];

      if (v30)
      {
        __int16 v31 = [v29 historyTokenForCloudStore];
        id v32 = objc_msgSend(v107, "hmd_cloudPrivateStoreIdentifier");
        [v28 setObject:v31 forKeyedSubscript:v32];
      }
      uint64_t v33 = [v29 historyTokenForCloudSharedStore];

      if (v33)
      {
        int v34 = [v29 historyTokenForCloudSharedStore];
        id v35 = objc_msgSend(v107, "hmd_cloudSharedStoreIdentifier");
        [v28 setObject:v34 forKeyedSubscript:v35];
      }
      __int16 v36 = [v29 historyTokenForWorkingStore];

      if (v36)
      {
        id v37 = [v29 historyTokenForWorkingStore];
        __int16 v38 = objc_msgSend(v107, "hmd_workingStoreIdentifier");
        [v28 setObject:v37 forKeyedSubscript:v38];
      }
      double v39 = (void *)MEMORY[0x230FBD990]();
      __int16 v40 = v18;
      id v41 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
      {
        uint64_t v42 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v42;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v29;
        _os_log_impl(&dword_22F52A000, v41, OS_LOG_TYPE_INFO, "%{public}@Fetched metadata for the first time: %@", buf, 0x16u);
      }
      uint64_t v43 = (void *)v40[11];
      v40[11] = v28;
    }
    if (!v7)
    {
      v109[0] = MEMORY[0x263EF8330];
      v109[1] = 3221225472;
      v109[2] = __114__HMDCoreDataCloudTransform__runTransformWhilePerformingBlockOnContext_storeIdentifiers_completeMergeHomeModelID___block_invoke_133;
      v109[3] = &unk_264A1F160;
      v109[4] = v18;
      id v110 = v107;
      id v111 = v105;
      objc_msgSend(v111, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v109);

LABEL_76:
      id v89 = (void *)MEMORY[0x230FBD990]();
      v90 = v18;
      v91 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v91, OS_LOG_TYPE_DEBUG))
      {
        id v92 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        *(void *)&uint8_t buf[4] = v92;
        _os_log_impl(&dword_22F52A000, v91, OS_LOG_TYPE_DEBUG, "%{public}@Resetting after transform", buf, 0xCu);
      }
      v93 = (void *)MEMORY[0x230FBD990]([v107 reset]);
      id v94 = v90;
      id v95 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v95, OS_LOG_TYPE_DEBUG))
      {
        v96 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        *(void *)&uint8_t buf[4] = v96;
        _os_log_impl(&dword_22F52A000, v95, OS_LOG_TYPE_DEBUG, "%{public}@Finished transform", buf, 0xCu);
      }
      goto LABEL_81;
    }
    __int16 v44 = (void *)MEMORY[0x230FBD990]();
    id v45 = v18;
    uint64_t v46 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
    {
      id v47 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      *(void *)&uint8_t buf[4] = v47;
      *(_WORD *)&buf[12] = 2160;
      *(void *)&buf[14] = 1752392040;
      *(_WORD *)&unsigned char buf[22] = 2112;
      id v143 = v7;
      _os_log_impl(&dword_22F52A000, v46, OS_LOG_TYPE_INFO, "%{public}@Starting complete merge transform for home with modelID %{mask.hash}@", buf, 0x20u);
    }
    id v48 = v107;
    id v49 = v7;
    objc_msgSend(v48, "hmd_assertIsExecuting");
    id v50 = v49;
    id v51 = v48;
    objc_msgSend(v51, "hmd_assertIsExecuting");
    __int16 v52 = objc_msgSend(v51, "hmd_coreData");
    v102 = v52;
    if (!v52)
    {
      __int16 v62 = (void *)MEMORY[0x230FBD990]();
      id v63 = v45;
      v64 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
      {
        id v65 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        *(void *)&uint8_t buf[4] = v65;
        _os_log_impl(&dword_22F52A000, v64, OS_LOG_TYPE_ERROR, "%{public}@HMDCoreData deallocated before running complete merge import", buf, 0xCu);
      }
      goto LABEL_73;
    }
    id v101 = [v52 cloudPrivateStore];
    v104 = +[MKFCKHome fetchRequest];
    id v53 = +[MKFCKModel predicateWithModelID:v50];
    [v104 setPredicate:v53];

    uint64_t v54 = +[MKFCKModel defaultPreloadedProperties];
    [v104 setPropertiesToFetch:v54];

    v147[0] = v101;
    uint64_t v55 = [MEMORY[0x263EFF8C0] arrayWithObjects:v147 count:1];
    [v104 setAffectedStores:v55];

    id v133 = 0;
    id v100 = [v51 executeFetchRequest:v104 error:&v133];
    id v56 = v133;
    if (!v100)
    {
      long long v66 = (void *)MEMORY[0x230FBD990]();
      id v67 = v45;
      uint64_t v68 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
      {
        v69 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138544130;
        *(void *)&uint8_t buf[4] = v69;
        *(_WORD *)&buf[12] = 2160;
        *(void *)&buf[14] = 1752392040;
        *(_WORD *)&unsigned char buf[22] = 2112;
        id v143 = v50;
        LOWORD(v144) = 2114;
        *(void *)((char *)&v144 + 2) = v56;
        _os_log_impl(&dword_22F52A000, v68, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch cloud home with modelID %{mask.hash}@: %{public}@", buf, 0x2Au);
      }
      goto LABEL_72;
    }
    char v57 = [v100 firstObject];
    id v127 = 0;
    id v128 = &v127;
    uint64_t v129 = 0x3032000000;
    v130 = __Block_byref_object_copy__116043;
    id v131 = __Block_byref_object_dispose__116044;
    id v132 = 0;
    uint64_t v121 = 0;
    v122 = &v121;
    uint64_t v123 = 0x3032000000;
    v124 = __Block_byref_object_copy__116043;
    id v125 = __Block_byref_object_dispose__116044;
    id v126 = 0;
    if (v57)
    {
      id v99 = v56;
      goto LABEL_35;
    }
    id v70 = +[MKFCKHome entity];
    id v120 = v56;
    uint64_t v71 = objc_msgSend(v101, "hmd_tombstonesForEntity:duration:context:error:", v70, v51, &v120, 0.0);
    id v99 = v120;

    if (!v71)
    {
      __int16 v58 = (void *)MEMORY[0x230FBD990]();
      id v59 = v45;
      HMFGetOSLogHandle();
      __int16 v60 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
      {
        id v82 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v82;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v99;
        _os_log_impl(&dword_22F52A000, v60, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch tombstones for cloud homes: %{public}@", buf, 0x16u);
      }
      goto LABEL_38;
    }
    uint64_t v116 = 0;
    v117 = &v116;
    uint64_t v118 = 0x2020000000;
    char v119 = 0;
    *(void *)buf = MEMORY[0x263EF8330];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __83__HMDCoreDataCloudTransform__performCompleteMergeImportForHomeWithModelID_context___block_invoke;
    id v143 = &unk_264A1F188;
    id v72 = v50;
    *(void *)&long long v144 = v72;
    *((void *)&v144 + 1) = &v127;
    id v145 = &v121;
    id v146 = &v116;
    uint64_t v73 = [(id)v71 enumerateKeysAndObjectsUsingBlock:buf];
    if (v128[5])
    {
      if (!*((unsigned char *)v117 + 24))
      {

        _Block_object_dispose(&v116, 8);
LABEL_35:
        if ([v57 isFake])
        {
          __int16 v58 = (void *)MEMORY[0x230FBD990]();
          id v59 = v45;
          HMFGetOSLogHandle();
          __int16 v60 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
          {
            id v61 = HMFGetLogIdentifier();
            *(_DWORD *)v134 = 138543618;
            v135 = v61;
            __int16 v136 = 2112;
            uint64_t v137 = (uint64_t)v57;
            _os_log_impl(&dword_22F52A000, v60, OS_LOG_TYPE_ERROR, "%{public}@Refusing to merge fake home: %@", v134, 0x16u);
          }
LABEL_38:

LABEL_71:
          _Block_object_dispose(&v121, 8);

          _Block_object_dispose(&v127, 8);
          id v56 = v99;
LABEL_72:

LABEL_73:
          v85 = (void *)MEMORY[0x230FBD990]();
          char v86 = v45;
          id v87 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v87, OS_LOG_TYPE_INFO))
          {
            id v88 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543874;
            *(void *)&uint8_t buf[4] = v88;
            *(_WORD *)&buf[12] = 2160;
            *(void *)&buf[14] = 1752392040;
            *(_WORD *)&unsigned char buf[22] = 2112;
            id v143 = v50;
            _os_log_impl(&dword_22F52A000, v87, OS_LOG_TYPE_INFO, "%{public}@Finished complete merge transform for home with modelID %{mask.hash}@", buf, 0x20u);
          }
          goto LABEL_76;
        }
        id v78 = [HMDCoreDataCloudTransformChangeSet alloc];
        if (v78)
        {
          uint64_t v71 = (uint64_t)-[HMDCoreDataCloudTransformChangeSet initWithHomeModelID:clientIdentifier:qualityOfService:]((id *)&v78->super.isa, v50, 0, (void *)0xFFFFFFFFFFFFFFFFLL);
          if (v57)
          {
LABEL_53:
            v79 = [v57 fetchLocalModelWithContext:v51];
            if (v79)
            {
              v80 = [v57 objectID];
              v81 = [MEMORY[0x263EFFA08] set];
              -[HMDCoreDataCloudTransformChangeSet processUpdate:updatedProperties:](v71, v80, v81);
            }
            else
            {
              v80 = [v57 objectID];
              if (v71) {
                [*(id *)(v71 + 8) addObject:v80];
              }
            }

            goto LABEL_67;
          }
        }
        else
        {
          uint64_t v71 = 0;
          if (v57) {
            goto LABEL_53;
          }
        }
        -[HMDCoreDataCloudTransformChangeSet processDelete:tombstone:]((id *)v71, v128[5], (void *)v122[5]);
LABEL_67:
        if (v71) {
          *(unsigned char *)(v71 + 32) = 1;
        }
        -[HMDCoreDataCloudTransform _processChangeSet:isImport:context:](v45, (void *)v71, 1, v51);
        [v51 rollback];
        [v51 refreshAllObjects];
        goto LABEL_70;
      }
      id v97 = v72;
      context = (void *)MEMORY[0x230FBD990](v73);
      int v74 = v45;
      HMFGetOSLogHandle();
      char v75 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR))
      {
        id v76 = HMFGetLogIdentifier();
        id v77 = v128[5];
        *(_DWORD *)v134 = 138544130;
        v135 = v76;
        __int16 v136 = 2112;
        uint64_t v137 = (uint64_t)v77;
        __int16 v138 = 2160;
        uint64_t v139 = 1752392040;
        __int16 v140 = 2112;
        id v141 = v97;
        _os_log_impl(&dword_22F52A000, v75, OS_LOG_TYPE_ERROR, "%{public}@Refusing to merge deleted fake home: <%@: %{mask.hash}@>", v134, 0x2Au);
      }
    }
    else
    {
      context = (void *)MEMORY[0x230FBD990](v73);
      id v83 = v45;
      HMFGetOSLogHandle();
      char v75 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v75, OS_LOG_TYPE_INFO))
      {
        id v84 = HMFGetLogIdentifier();
        *(_DWORD *)v134 = 138543874;
        v135 = v84;
        __int16 v136 = 2160;
        uint64_t v137 = 1752392040;
        __int16 v138 = 2112;
        uint64_t v139 = (uint64_t)v72;
        _os_log_impl(&dword_22F52A000, v75, OS_LOG_TYPE_INFO, "%{public}@Didn't find home with modelID %{mask.hash}@", v134, 0x20u);
      }
    }

    _Block_object_dispose(&v116, 8);
LABEL_70:

    goto LABEL_71;
  }
  uint64_t v8 = (void *)MEMORY[0x230FBD990]();
  id v9 = a1;
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    *(void *)&uint8_t buf[4] = v11;
    _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Not running transform due operating in bad CDP state", buf, 0xCu);
  }
LABEL_82:
}

- (void)_delayContextDestruction:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = dispatch_get_global_queue(9, 0);
    dispatch_time_t v5 = dispatch_time(0, 2000000000);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __54__HMDCoreDataCloudTransform__delayContextDestruction___block_invoke;
    block[3] = &unk_264A2F7F8;
    id v7 = v3;
    dispatch_after(v5, v4, block);
  }
}

void __114__HMDCoreDataCloudTransform__runTransformWhilePerformingBlockOnContext_storeIdentifiers_completeMergeHomeModelID___block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  id v3 = [v9 identifier];
  id v4 = *(void **)(a1 + 32);
  if (!v4 || [v4 containsObject:v3])
  {
    dispatch_time_t v5 = objc_msgSend(*(id *)(a1 + 40), "hmd_cloudPrivateStoreIdentifier");
    if ([v3 isEqualToString:v5])
    {
LABEL_6:

LABEL_7:
      [*(id *)(a1 + 48) addObject:v9];
      goto LABEL_8;
    }
    id v6 = objc_msgSend(*(id *)(a1 + 40), "hmd_cloudSharedStoreIdentifier");
    if ([v3 isEqualToString:v6])
    {

      goto LABEL_6;
    }
    id v7 = objc_msgSend(*(id *)(a1 + 40), "hmd_workingStoreIdentifier");
    char v8 = [v3 isEqualToString:v7];

    if (v8) {
      goto LABEL_7;
    }
  }
LABEL_8:
}

void __114__HMDCoreDataCloudTransform__runTransformWhilePerformingBlockOnContext_storeIdentifiers_completeMergeHomeModelID___block_invoke_133(id *a1, void *a2, uint64_t a3)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = (void *)MEMORY[0x230FBD990]();
  id v7 = a1[4];
  char v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = HMFGetLogIdentifier();
    id v10 = [v5 configurationName];
    id v11 = [v5 identifier];
    int v24 = 138543874;
    id v25 = v9;
    __int16 v26 = 2114;
    __int16 v27 = v10;
    __int16 v28 = 2114;
    BOOL v29 = v11;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Starting transform for store [%{public}@] with identifier: %{public}@", (uint8_t *)&v24, 0x20u);
  }
  id v12 = (void *)MEMORY[0x230FBD990]([a1[4] _processHistoryForStore:v5 context:a1[5]]);
  id v13 = a1[4];
  dispatch_block_t v14 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    id v15 = HMFGetLogIdentifier();
    id v16 = [v5 configurationName];
    id v17 = [v5 identifier];
    int v24 = 138543874;
    id v25 = v15;
    __int16 v26 = 2114;
    __int16 v27 = v16;
    __int16 v28 = 2114;
    BOOL v29 = v17;
    _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_INFO, "%{public}@Finished transform for store [%{public}@] with identifier: %{public}@", (uint8_t *)&v24, 0x20u);
  }
  if ([a1[6] count] - 1 != a3)
  {
    uint64_t v18 = (void *)MEMORY[0x230FBD990]();
    id v19 = a1[4];
    id v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      uint32_t v21 = HMFGetLogIdentifier();
      char v22 = [v5 configurationName];
      id v23 = [v5 identifier];
      int v24 = 138543874;
      id v25 = v21;
      __int16 v26 = 2114;
      __int16 v27 = v22;
      __int16 v28 = 2114;
      BOOL v29 = v23;
      _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_DEBUG, "%{public}@Cleaning up after transform for store [%{public}@] with identifier: %{public}@", (uint8_t *)&v24, 0x20u);
    }
    [a1[5] rollback];
    [a1[5] refreshAllObjects];
  }
}

void __83__HMDCoreDataCloudTransform__performCompleteMergeImportForHomeWithModelID_context___block_invoke(void *a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v12 = a2;
  id v8 = a3;
  id v9 = objc_msgSend(v8, "hmf_UUIDForKey:", @"modelID");
  if ([v9 isEqual:a1[4]])
  {
    *a4 = 1;
    objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), a2);
    objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), a3);
    id v10 = objc_msgSend(v8, "hmf_UUIDForKey:", @"flags");
    id v11 = v10;
    if (v10)
    {
      uint64_t v13 = 0;
      uint64_t v14 = 0;
      [v10 getUUIDBytes:&v13];
      if ((v14 & 0x80000000000) != 0) {
        *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = 1;
      }
    }
  }
}

void __50__HMDCoreDataCloudTransform__managedObjectContext__block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x230FBD990]();
  objc_opt_class();
  id v3 = (objc_class *)self;
  id v4 = NSStringFromClass(v3);
  [*(id *)(a1 + 32) setName:v4];

  id v5 = [*(id *)(a1 + 48) cloudPrivateStore];
  id v6 = [v5 identifier];
  objc_msgSend(*(id *)(a1 + 32), "setHmd_cloudPrivateStoreIdentifier:", v6);

  id v7 = [*(id *)(a1 + 48) cloudSharedStore];
  id v8 = [v7 identifier];
  objc_msgSend(*(id *)(a1 + 32), "setHmd_cloudSharedStoreIdentifier:", v8);

  id v9 = [*(id *)(a1 + 48) workingStore];
  id v10 = [v9 identifier];
  objc_msgSend(*(id *)(a1 + 32), "setHmd_workingStoreIdentifier:", v10);

  uint64_t v11 = *(void *)(a1 + 40);
  if (v11) {
    BOOL v12 = *(unsigned __int8 *)(v11 + 40) != 0;
  }
  else {
    BOOL v12 = 0;
  }
  objc_msgSend(*(id *)(a1 + 32), "setHmd_fakeRecordsEnabled:", v12);
}

- (void)coreData:(id)a3 cloudKitImportStartedForStoreWithIdentifier:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  os_unfair_lock_lock_with_options();
  id v8 = -[HMDCoreDataCloudTransform cloudImportInProgressStoreIdentifiers]((id *)&self->super.super.isa);
  [v8 addObject:v7];

  os_unfair_lock_unlock(&self->_lock.lock);
  id v9 = (void *)MEMORY[0x230FBD990]();
  id v10 = self;
  uint64_t v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    BOOL v12 = HMFGetLogIdentifier();
    int v14 = 138543618;
    id v15 = v12;
    __int16 v16 = 2114;
    id v17 = v7;
    _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@CloudKit import started for store %{public}@", (uint8_t *)&v14, 0x16u);
  }
  logger = v10->_logger;
  if (os_signpost_enabled(logger))
  {
    int v14 = 138412290;
    id v15 = v7;
    _os_signpost_emit_with_name_impl(&dword_22F52A000, logger, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "CoreDataCloudTransformImport", "storeIdentifier=%{signpost.description:attribute}@ ", (uint8_t *)&v14, 0xCu);
  }
  v10->_os_signpost_id_t importSignpostID = 0xEEEEB0B5B2B2EEEELL;
}

- (void)coreData:(id)a3 persistentStoreWithIdentifierDidChange:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (self && [(NSMutableSet *)self->_cloudImportInProgressStoreIdentifiers count])
  {
    id v9 = (void *)MEMORY[0x230FBD990]();
    id v10 = self;
    HMFGetOSLogHandle();
    uint64_t v11 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      BOOL v12 = HMFGetLogIdentifier();
      int v18 = 138543618;
      id v19 = v12;
      __int16 v20 = 2114;
      id v21 = v7;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_DEBUG, "%{public}@Waiting for cloud import to finish before running transform on store %{public}@", (uint8_t *)&v18, 0x16u);
    }
    uint64_t v13 = v10->_pendingChangedStoreIdentifiers;
    [(NSMutableSet *)v13 addObject:v7];

    os_unfair_lock_unlock(&p_lock->lock);
  }
  else
  {
    int v14 = -[HMDCoreDataCloudTransform _managedObjectContext]((id *)&self->super.super.isa);
    id v15 = -[HMDCoreDataCloudTransform pendingChangedStoreIdentifiers]((id *)&self->super.super.isa);
    __int16 v16 = [v15 setByAddingObject:v7];

    id v17 = -[HMDCoreDataCloudTransform pendingChangedStoreIdentifiers]((id *)&self->super.super.isa);
    [v17 removeAllObjects];

    os_unfair_lock_unlock(&self->_lock.lock);
    -[HMDCoreDataCloudTransform _runTransformOnContext:storeIdentifiers:completeMergeHomeModelID:completion:](self, v14, v16, 0, 0);
  }
}

- (BOOL)badCDPState
{
  uint64_t v2 = [(HMDCoreDataCloudTransform *)self userDefaults];
  char v3 = [v2 BOOLForKey:@"badCDPState"];

  return v3;
}

- (id)newCloudMirrorExportStatusMonitor
{
  char v3 = [HMDCoreDataCloudMirroringExportStatusMonitor alloc];
  id v4 = [(HMDCoreDataCloudTransform *)self coreData];
  id v5 = [(HMDCoreDataCloudTransform *)self managedObjectContext];
  id v6 = [(HMDCoreDataCloudMirroringExportStatusMonitor *)v3 initWithCoreData:v4 managedObjectContext:v5];

  return v6;
}

- (void)registerCloudChangeListener:(id)a3 forEntities:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __69__HMDCoreDataCloudTransform_registerCloudChangeListener_forEntities___block_invoke;
  v20[3] = &unk_264A1F0C0;
  id v9 = v8;
  id v21 = v9;
  objc_msgSend(v7, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v20);
  id v10 = [(HMDCoreDataCloudTransform *)self managedObjectContext];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __69__HMDCoreDataCloudTransform_registerCloudChangeListener_forEntities___block_invoke_3;
  v15[3] = &unk_264A2E908;
  v15[4] = self;
  id v16 = v6;
  id v17 = v7;
  id v18 = v9;
  id v19 = v10;
  id v11 = v10;
  id v12 = v9;
  id v13 = v7;
  id v14 = v6;
  [v11 performBlock:v15];
}

void __69__HMDCoreDataCloudTransform_registerCloudChangeListener_forEntities___block_invoke(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __69__HMDCoreDataCloudTransform_registerCloudChangeListener_forEntities___block_invoke_2;
  v3[3] = &unk_264A1F098;
  id v4 = *(id *)(a1 + 32);
  objc_msgSend(a2, "hmd_recursivelyEnumerateSubentitiesUsingBlock:", v3);
}

void __69__HMDCoreDataCloudTransform_registerCloudChangeListener_forEntities___block_invoke_3(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  uint64_t v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    id v5 = HMFGetLogIdentifier();
    uint64_t v6 = *(void *)(a1 + 40);
    id v7 = [*(id *)(a1 + 48) valueForKeyPath:@"name"];
    *(_DWORD *)buf = 138543874;
    __int16 v27 = v5;
    __int16 v28 = 2112;
    uint64_t v29 = v6;
    __int16 v30 = 2114;
    __int16 v31 = v7;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_DEBUG, "%{public}@Adding listener %@ for entity types %{public}@", buf, 0x20u);
  }
  id v8 = *(void **)(a1 + 56);
  uint64_t v20 = MEMORY[0x263EF8330];
  uint64_t v21 = 3221225472;
  uint64_t v22 = __69__HMDCoreDataCloudTransform_registerCloudChangeListener_forEntities___block_invoke_105;
  id v23 = &unk_264A1F0E8;
  id v9 = *(void **)(a1 + 40);
  uint64_t v24 = *(void *)(a1 + 32);
  id v25 = v9;
  objc_msgSend(v8, "hmf_enumerateWithAutoreleasePoolUsingBlock:", &v20);
  uint64_t v10 = objc_opt_respondsToSelector();
  if (v10)
  {
    id v15 = (void *)MEMORY[0x230FBD990](v10, v11, v12, v13, v14);
    id v16 = *(id *)(a1 + 32);
    id v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      id v18 = HMFGetLogIdentifier();
      uint64_t v19 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      __int16 v27 = v18;
      __int16 v28 = 2112;
      uint64_t v29 = v19;
      _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_DEBUG, "%{public}@Starting listener %@", buf, 0x16u);
    }
    objc_msgSend(*(id *)(a1 + 40), "willStartListeningWithContext:", *(void *)(a1 + 64), v20, v21, v22, v23, v24);
  }
}

void __69__HMDCoreDataCloudTransform_registerCloudChangeListener_forEntities___block_invoke_105(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    id v5 = *(void **)(v4 + 96);
  }
  else {
    id v5 = 0;
  }
  id v9 = v3;
  uint64_t v6 = [v5 objectForKey:v3];
  if (!v6)
  {
    uint64_t v6 = [MEMORY[0x263F08A88] weakObjectsPointerArray];
    uint64_t v7 = *(void *)(a1 + 32);
    if (v7) {
      id v8 = *(void **)(v7 + 96);
    }
    else {
      id v8 = 0;
    }
    [v8 setObject:v6 forKey:v9];
  }
  objc_msgSend(v6, "hmf_addObject:", *(void *)(a1 + 40));
}

void __69__HMDCoreDataCloudTransform_registerCloudChangeListener_forEntities___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (([v3 isAbstract] & 1) == 0) {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

- (void)runCompleteMergeTransformForHomeWithModelID:(id)a3 completion:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x230FBD990]();
  id v9 = self;
  uint64_t v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = HMFGetLogIdentifier();
    int v13 = 138543362;
    uint64_t v14 = v11;
    _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Complete merge requested", (uint8_t *)&v13, 0xCu);
  }
  uint64_t v12 = [(HMDCoreDataCloudTransform *)v9 managedObjectContext];
  -[HMDCoreDataCloudTransform _runTransformOnContext:storeIdentifiers:completeMergeHomeModelID:completion:](v9, v12, 0, v6, v7);
}

- (void)runTransformWithCompletion:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    int v10 = 138543362;
    uint64_t v11 = v8;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Manual run requested", (uint8_t *)&v10, 0xCu);
  }
  id v9 = [(HMDCoreDataCloudTransform *)v6 managedObjectContext];
  -[HMDCoreDataCloudTransform _runTransformOnContext:storeIdentifiers:completeMergeHomeModelID:completion:](v6, v9, 0, 0, v4);
}

- (BOOL)runTransformWithError:(id *)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = (void *)MEMORY[0x230FBD990](self, a2, a3);
  id v5 = self;
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    uint64_t v12 = v7;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Synchronous manual run requested", buf, 0xCu);
  }
  id v8 = [(HMDCoreDataCloudTransform *)v5 managedObjectContext];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __51__HMDCoreDataCloudTransform_runTransformWithError___block_invoke;
  v10[3] = &unk_264A2F7F8;
  v10[4] = v5;
  [v8 performBlockAndWait:v10];

  return 1;
}

void __51__HMDCoreDataCloudTransform_runTransformWithError___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [v2 managedObjectContext];
  -[HMDCoreDataCloudTransform _runTransformWhilePerformingBlockOnContext:storeIdentifiers:completeMergeHomeModelID:](v2, v3, 0, 0);

  id v4 = *(void **)(a1 + 32);
  id v5 = [v4 managedObjectContext];
  -[HMDCoreDataCloudTransform _delayContextDestruction:]((uint64_t)v4, v5);
}

- (id)managedObjectContext
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = -[HMDCoreDataCloudTransform _managedObjectContext]((id *)&self->super.super.isa);
  os_unfair_lock_unlock(&p_lock->lock);
  return v4;
}

- (HMDCoreDataCloudTransform)initWithCoreData:(id)a3 fakeRecordsEnabled:(BOOL)a4 logEventSubmitter:(id)a5 userDefaults:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  v26.receiver = self;
  v26.super_class = (Class)HMDCoreDataCloudTransform;
  uint64_t v14 = [(HMDCoreDataCloudTransform *)&v26 init];
  if (v14)
  {
    uint64_t v15 = HMFGetOSLogHandle();
    logger = v14->_logger;
    v14->_logger = (OS_os_log *)v15;

    v14->_lock.lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v14->_coreData, a3);
    uint64_t v17 = [MEMORY[0x263EFF9C0] set];
    pendingChangedStoreIdentifiers = v14->_pendingChangedStoreIdentifiers;
    v14->_pendingChangedStoreIdentifiers = (NSMutableSet *)v17;

    uint64_t v19 = objc_opt_new();
    cloudImportInProgressStoreIdentifiers = v14->_cloudImportInProgressStoreIdentifiers;
    v14->_cloudImportInProgressStoreIdentifiers = (NSMutableSet *)v19;

    uint64_t v21 = [MEMORY[0x263F08968] strongToStrongObjectsMapTable];
    cloudChangeListeners = v14->_cloudChangeListeners;
    v14->_cloudChangeListeners = (NSMapTable *)v21;

    v14->_fakeRecordsEnabled = a4;
    objc_storeStrong((id *)&v14->_logEventSubmitter, a5);
    id v23 = objc_alloc_init(HMDCoreDataCloudTransformMergePolicy);
    mergePolicy = v14->_mergePolicy;
    v14->_mergePolicy = v23;

    objc_storeStrong((id *)&v14->_userDefaults, a6);
    [v11 addNotificationListener:v14];
  }

  return v14;
}

- (HMDCoreDataCloudTransform)initWithCoreData:(id)a3 logEventSubmitter:(id)a4
{
  id v6 = (void *)MEMORY[0x263EFFA40];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v6 standardUserDefaults];
  int v10 = [(HMDCoreDataCloudTransform *)self initWithCoreData:v8 fakeRecordsEnabled:1 logEventSubmitter:v7 userDefaults:v9];

  return v10;
}

- (HMDCoreDataCloudTransform)init
{
  uint64_t v2 = (void *)MEMORY[0x263EFF940];
  uint64_t v3 = *MEMORY[0x263EFF498];
  id v4 = NSString;
  id v5 = NSStringFromSelector(a2);
  id v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

+ (BOOL)transactionIsCloudStoreReset:(id)a3 context:(id)a4
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 author];
  int v9 = [v8 isEqualToString:@"NSCloudKitMirroringDelegate.reset"];

  if (v9)
  {
    int v10 = [v6 storeID];
    id v11 = objc_msgSend(v7, "hmd_coreData");
    id v12 = [v11 cloudSharedStore];
    id v13 = [v12 identifier];
    int v14 = [v10 isEqualToString:v13];

    if (v14)
    {
      uint64_t v15 = (void *)MEMORY[0x230FBD990]();
      id v16 = a1;
      uint64_t v17 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        id v18 = HMFGetLogIdentifier();
        uint64_t v19 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v6, "transactionNumber"));
        int v26 = 138543618;
        __int16 v27 = v18;
        __int16 v28 = 2112;
        uint64_t v29 = v19;
        _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_INFO, "%{public}@Not processing reset on shared store : %@", (uint8_t *)&v26, 0x16u);
      }
      char v20 = 0;
    }
    else
    {
      uint64_t v21 = [v6 changes];
      char v20 = objc_msgSend(v21, "na_any:", &__block_literal_global_192_116298);

      uint64_t v15 = (void *)MEMORY[0x230FBD990]();
      id v22 = a1;
      uint64_t v17 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        id v23 = HMFGetLogIdentifier();
        uint64_t v24 = HMFBooleanToString();
        int v26 = 138543874;
        __int16 v27 = v23;
        __int16 v28 = 2112;
        uint64_t v29 = v24;
        __int16 v30 = 2114;
        id v31 = v6;
        _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@Reset detected : %@, Transaction: %{public}@", (uint8_t *)&v26, 0x20u);
      }
    }
  }
  else
  {
    char v20 = 0;
  }

  return v20;
}

BOOL __66__HMDCoreDataCloudTransform_transactionIsCloudStoreReset_context___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [v2 changedObjectID];
  id v4 = [v3 entity];
  id v5 = +[MKFCKHome entity];
  if ([v4 isKindOfEntity:v5]) {
    BOOL v6 = [v2 changeType] == 2;
  }
  else {
    BOOL v6 = 0;
  }

  return v6;
}

+ (void)wipeCoreDataStorageDueToPCSIdentityLossAndRelaunchHomeKitDaemon
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v3 = [MEMORY[0x263EFB210] defaultStore];
  id v4 = objc_msgSend(v3, "aa_primaryAppleAccount");

  id v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = a1;
  id v7 = HMFGetOSLogHandle();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v8)
    {
      int v9 = HMFGetLogIdentifier();
      int v12 = 138543362;
      id v13 = v9;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@PCS identities lost: Will be removing working, cloud, shared cloud, and client stores", (uint8_t *)&v12, 0xCu);
    }
    +[HMDResetConfigPostCleanup writePostCleanupRecordWithReason:6 steps:278];
    int v10 = +[HMDMainDriver driver];
    [v10 relaunch];
  }
  else
  {
    if (v8)
    {
      id v11 = HMFGetLogIdentifier();
      int v12 = 138543362;
      id v13 = v11;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@PCS identities lost: Not going to remove the CD stores as user is in the process of signing out.", (uint8_t *)&v12, 0xCu);
    }
    +[HMDResetConfigPostCleanup writePostCleanupRecordWithReason:2 steps:-1];
  }
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t15_116309 != -1) {
    dispatch_once(&logCategory__hmf_once_t15_116309, &__block_literal_global_117_116310);
  }
  id v2 = (void *)logCategory__hmf_once_v16_116311;
  return v2;
}

void __40__HMDCoreDataCloudTransform_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = (void *)logCategory__hmf_once_v16_116311;
  logCategory__hmf_once_v16_116311 = v0;
}

+ (id)localTransformableEntityFromEntity:(id)a3
{
  id v4 = a3;
  id v5 = [v4 managedObjectModel];
  if (localTransformableEntityFromEntity___hmf_once_t4 != -1) {
    dispatch_once(&localTransformableEntityFromEntity___hmf_once_t4, &__block_literal_global_91_116316);
  }
  id v6 = (id)localTransformableEntityFromEntity___hmf_once_v5;
  id v7 = [v4 name];
  id v8 = [v6 objectForKey:v7];

  if (v8)
  {
    id v9 = (id)*MEMORY[0x263EFFD08];
  }
  else
  {
    uint64_t v24 = 0;
    id v25 = &v24;
    uint64_t v26 = 0x3032000000;
    __int16 v27 = __Block_byref_object_copy__116043;
    __int16 v28 = __Block_byref_object_dispose__116044;
    id v29 = 0;
    int v10 = [v5 entities];
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __64__HMDCoreDataCloudTransform_localTransformableEntityFromEntity___block_invoke_93;
    v20[3] = &unk_264A1F070;
    id v23 = a1;
    id v11 = v4;
    id v21 = v11;
    id v22 = &v24;
    objc_msgSend(v10, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v20);

    int v12 = (void *)v25[5];
    id v9 = (id)*MEMORY[0x263EFFD08];
    if (!v12) {
      int v12 = (void *)*MEMORY[0x263EFFD08];
    }
    id v8 = v12;
    id v13 = [v11 name];
    [v6 setObject:v8 forKey:v13];

    _Block_object_dispose(&v24, 8);
  }
  if (v9 == v8)
  {
    id v18 = 0;
  }
  else
  {
    id v14 = v8;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v15 = v14;
    }
    else {
      uint64_t v15 = 0;
    }
    id v16 = v15;

    uint64_t v17 = [v5 entitiesByName];
    id v18 = [v17 objectForKeyedSubscript:v16];
  }
  return v18;
}

uint64_t __64__HMDCoreDataCloudTransform_localTransformableEntityFromEntity___block_invoke_93(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v16 = a2;
  id v6 = [v16 managedObjectClassName];
  Class v7 = NSClassFromString(v6);
  LODWORD(v7) = [(objc_class *)v7 isSubclassOfClass:objc_opt_class()];

  if (v7)
  {
    id v8 = [*(id *)(a1 + 48) exportTransformableEntityFromEntity:v16];
    id v9 = [v8 name];
    int v10 = [*(id *)(a1 + 32) name];
    int v11 = [v9 isEqual:v10];

    if (v11)
    {
      uint64_t v12 = [v16 name];
      uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
      id v14 = *(void **)(v13 + 40);
      *(void *)(v13 + 40) = v12;

      *a4 = 1;
    }
  }
  return MEMORY[0x270F9A790]();
}

void __64__HMDCoreDataCloudTransform_localTransformableEntityFromEntity___block_invoke()
{
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = (void *)localTransformableEntityFromEntity___hmf_once_v5;
  localTransformableEntityFromEntity___hmf_once_id v5 = v0;
}

+ (Class)exportTransformableClassFromEntity:(id)a3
{
  id v4 = a3;
  id v5 = [a1 exportTransformableEntityFromEntity:v4];
  id v6 = v5;
  if (v5)
  {
    Class v7 = [v5 managedObjectClassName];
LABEL_4:
    id v9 = NSClassFromString(v7);

    goto LABEL_5;
  }
  id v8 = [v4 userInfo];
  Class v7 = [v8 objectForKeyedSubscript:@"cloudSyncClass"];

  if (v7) {
    goto LABEL_4;
  }
  id v9 = 0;
LABEL_5:

  return (Class)v9;
}

+ (id)exportTransformableEntityFromEntity:(id)a3
{
  id v3 = a3;
  id v4 = [v3 userInfo];
  id v5 = [v4 objectForKeyedSubscript:@"cloudSyncEntity"];
  if (v5)
  {
    id v6 = [v3 managedObjectModel];
    Class v7 = [v6 entitiesByName];
    id v8 = [v7 objectForKeyedSubscript:v5];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

+ (Class)importTransformableClassFromEntity:(id)a3
{
  id v3 = [a3 managedObjectClassName];
  Class v4 = NSClassFromString(v3);
  if (importTransformableClassFromEntity___hmf_once_t2 != -1) {
    dispatch_once(&importTransformableClassFromEntity___hmf_once_t2, &__block_literal_global_116320);
  }
  if ([(id)importTransformableClassFromEntity___hmf_once_v3 classConforms:v4]) {
    Class v5 = v4;
  }
  else {
    Class v5 = 0;
  }
  id v6 = v5;

  return v6;
}

void __64__HMDCoreDataCloudTransform_importTransformableClassFromEntity___block_invoke()
{
  uint64_t v0 = [[HMCConformanceCache alloc] initWithProtocol:&unk_26E4B5818];
  uint64_t v1 = (void *)importTransformableClassFromEntity___hmf_once_v3;
  importTransformableClassFromEntity___hmf_once_id v3 = (uint64_t)v0;
}

+ (HMDCoreDataCloudTransform)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __43__HMDCoreDataCloudTransform_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  void block[4] = a1;
  if (sharedInstance__hmf_once_t0_116323 != -1) {
    dispatch_once(&sharedInstance__hmf_once_t0_116323, block);
  }
  id v2 = (void *)sharedInstance__hmf_once_v1_116324;
  return (HMDCoreDataCloudTransform *)v2;
}

void __43__HMDCoreDataCloudTransform_sharedInstance__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc(*(Class *)(a1 + 32));
  id v5 = +[HMDCoreData sharedInstance];
  id v2 = +[HMDMetricsManager sharedLogEventSubmitter];
  uint64_t v3 = [v1 initWithCoreData:v5 logEventSubmitter:v2];
  Class v4 = (void *)sharedInstance__hmf_once_v1_116324;
  sharedInstance__hmf_once_v1_116324 = v3;
}

+ (HMDCoreDataCloudTransform)new
{
  id v2 = (void *)MEMORY[0x263EFF940];
  uint64_t v3 = *MEMORY[0x263EFF498];
  Class v4 = NSString;
  id v5 = NSStringFromSelector(a2);
  id v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

@end