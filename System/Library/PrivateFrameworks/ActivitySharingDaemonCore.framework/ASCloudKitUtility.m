@interface ASCloudKitUtility
+ (id)shareURLForShare:(id)a3;
- (ASCloudKitUtility)init;
- (ASCloudKitUtility)initWithContainer:(id)a3;
- (CKContainer)container;
- (id)_lookupInfoFromIdentifier:(id)a3;
- (void)_acceptShareMetadatas:(id)a3 completion:(id)a4;
- (void)_acceptSharesWithURLs:(id)a3 operation:(id)a4 cloudKitGroup:(id)a5 completion:(id)a6;
- (void)_fetchChangesInDatabase:(id)a3 serverChangeTokenCache:(id)a4 priority:(int64_t)a5 activity:(id)a6 group:(id)a7 additionalZoneIDs:(id)a8 zoneIDsToSkip:(id)a9 fetchConfigurations:(id)a10 completion:(id)a11;
- (void)_fetchChangesInZones:(id)a3 additionalZonesToFetch:(id)a4 fetchConfigurations:(id)a5 inDatabase:(id)a6 serverChangeTokenCache:(id)a7 priority:(int64_t)a8 allowRetry:(BOOL)a9 activity:(id)a10 group:(id)a11 completion:(id)a12;
- (void)_fetchShareParticipantForLookupInfos:(id)a3 group:(id)a4 completion:(id)a5;
- (void)_fetchShareWithShareRecordID:(id)a3 activity:(id)a4 group:(id)a5 completion:(id)a6;
- (void)_retrieveZone:(id)a3 database:(id)a4 completion:(id)a5;
- (void)_saveRecordsIntoPrivateDatabase:(id)a3 recordIDsToDelete:(id)a4 savePolicy:(int64_t)a5 priority:(int64_t)a6 activity:(id)a7 group:(id)a8 completion:(id)a9;
- (void)_saveRecordsIntoPrivateDatabaseCreatingZones:(id)a3 recordIDsToDelete:(id)a4 savePolicy:(int64_t)a5 priority:(int64_t)a6 activity:(id)a7 useZoneWideSharing:(BOOL)a8 group:(id)a9 completion:(id)a10;
- (void)acceptSharesWithInvitationTokensByShareURL:(id)a3 cloudKitGroup:(id)a4 completion:(id)a5;
- (void)acceptSharesWithURLs:(id)a3 cloudKitGroup:(id)a4 completion:(id)a5;
- (void)addParticipant:(id)a3 toShares:(id)a4 group:(id)a5 completion:(id)a6;
- (void)addParticipantWithCloudKitAddress:(id)a3 toShares:(id)a4 group:(id)a5 completion:(id)a6;
- (void)cancelAllExecutingFetches;
- (void)createRecordZonesWithIDs:(id)a3 priority:(int64_t)a4 useZoneWideSharing:(BOOL)a5 group:(id)a6 completion:(id)a7;
- (void)createShareAndAssociatedZoneWithShareRecordID:(id)a3 rootRecord:(id)a4 otherRecordsToSave:(id)a5 completion:(id)a6;
- (void)fetchChangesInPrivateDatabaseWithServerChangeTokenCache:(id)a3 priority:(int64_t)a4 activity:(id)a5 group:(id)a6 additionalZoneIDs:(id)a7 zoneIDsToSkip:(id)a8 fetchConfigurations:(id)a9 completion:(id)a10;
- (void)fetchChangesInPrivateDatabaseWithServerChangeTokenCache:(id)a3 priority:(int64_t)a4 activity:(id)a5 group:(id)a6 completion:(id)a7;
- (void)fetchChangesInSharedDatabaseWithServerChangeTokenCache:(id)a3 priority:(int64_t)a4 activity:(id)a5 group:(id)a6 additionalZoneIDs:(id)a7 zoneIDsToSkip:(id)a8 fetchConfigurations:(id)a9 completion:(id)a10;
- (void)fetchChangesInSharedDatabaseWithServerChangeTokenCache:(id)a3 priority:(int64_t)a4 activity:(id)a5 group:(id)a6 completion:(id)a7;
- (void)fetchShareParticipantForEmailAddress:(id)a3 group:(id)a4 completion:(id)a5;
- (void)fetchShareParticipantForIdentifier:(id)a3 group:(id)a4 completion:(id)a5;
- (void)fetchShareWithShareRecordID:(id)a3 activity:(id)a4 group:(id)a5 completion:(id)a6;
- (void)forceSaveRecordsIntoPrivateDatabaseIgnoringServerChanges:(id)a3 recordIDsToDelete:(id)a4 priority:(int64_t)a5 activity:(id)a6 group:(id)a7 completion:(id)a8;
- (void)forceSaveRecordsIntoPrivateDatabaseIgnoringServerChanges:(id)a3 recordIDsToDelete:(id)a4 priority:(int64_t)a5 activity:(id)a6 useZoneWideSharing:(BOOL)a7 group:(id)a8 completion:(id)a9;
- (void)init;
- (void)removeParticipantWithCloudKitAddress:(id)a3 fromShares:(id)a4 group:(id)a5 completion:(id)a6;
- (void)retrieveZone:(id)a3 completion:(id)a4;
- (void)saveRecordsIntoPrivateDatabase:(id)a3 priority:(int64_t)a4 activity:(id)a5 group:(id)a6 completion:(id)a7;
- (void)saveRecordsIntoPrivateDatabase:(id)a3 recordIDsToDelete:(id)a4 priority:(int64_t)a5 activity:(id)a6 group:(id)a7 completion:(id)a8;
- (void)saveRecordsIntoPrivateDatabase:(id)a3 recordIDsToDelete:(id)a4 priority:(int64_t)a5 activity:(id)a6 useZoneWideSharing:(BOOL)a7 group:(id)a8 completion:(id)a9;
- (void)saveSubscriptions:(id)a3 andDeleteSubscriptionsWithIdentifiers:(id)a4 inDatabase:(id)a5 completion:(id)a6;
- (void)setContainer:(id)a3;
@end

@implementation ASCloudKitUtility

- (ASCloudKitUtility)initWithContainer:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ASCloudKitUtility;
  v5 = [(ASCloudKitUtility *)&v12 init];
  v6 = v5;
  if (v5)
  {
    [(ASCloudKitUtility *)v5 setContainer:v4];
    uint64_t v7 = HKCreateSerialDispatchQueue();
    serialQueue = v6->_serialQueue;
    v6->_serialQueue = (OS_dispatch_queue *)v7;

    uint64_t v9 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    queue_executingFetchOperations = v6->_queue_executingFetchOperations;
    v6->_queue_executingFetchOperations = (NSHashTable *)v9;
  }
  return v6;
}

- (ASCloudKitUtility)init
{
  v7.receiver = self;
  v7.super_class = (Class)ASCloudKitUtility;
  v2 = [(ASCloudKitUtility *)&v7 init];
  if (v2)
  {
    ASLoggingInitialize();
    v3 = *MEMORY[0x263F23AA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AA8], OS_LOG_TYPE_ERROR)) {
      [(ASCloudKitUtility *)v3 init];
    }
  }
  return v2;
}

- (void)saveSubscriptions:(id)a3 andDeleteSubscriptionsWithIdentifiers:(id)a4 inDatabase:(id)a5 completion:(id)a6
{
  id v9 = a6;
  v10 = (objc_class *)MEMORY[0x263EFD750];
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [v10 alloc];
  v15 = [v13 allObjects];

  v16 = [v12 allObjects];

  v17 = (void *)[v14 initWithSubscriptionsToSave:v15 subscriptionIDsToDelete:v16];
  v18 = _ASOperationConfigurationForPriority(2, 0);
  [v17 setConfiguration:v18];

  v19 = ASCloudKitGroupInitialSetup();
  [v17 setGroup:v19];

  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __99__ASCloudKitUtility_saveSubscriptions_andDeleteSubscriptionsWithIdentifiers_inDatabase_completion___block_invoke;
  v21[3] = &unk_265218D68;
  id v22 = v9;
  id v20 = v9;
  [v17 setModifySubscriptionsCompletionBlock:v21];
  [v11 addOperation:v17];
}

void __99__ASCloudKitUtility_saveSubscriptions_andDeleteSubscriptionsWithIdentifiers_inDatabase_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  ASLoggingInitialize();
  v10 = (void *)*MEMORY[0x263F23AA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AA8], OS_LOG_TYPE_DEFAULT))
  {
    id v11 = v10;
    int v14 = 134218240;
    uint64_t v15 = [v7 count];
    __int16 v16 = 2048;
    uint64_t v17 = [v8 count];
    _os_log_impl(&dword_2474C9000, v11, OS_LOG_TYPE_DEFAULT, "Saved %lu subscriptions, deleted %lu subscriptions.", (uint8_t *)&v14, 0x16u);
  }
  uint64_t v12 = *(void *)(a1 + 32);
  if (v12)
  {
    id v13 = [MEMORY[0x263EFFA08] setWithArray:v7];
    (*(void (**)(uint64_t, BOOL, id, void *))(v12 + 16))(v12, v9 == 0, v9, v13);
  }
}

- (void)createRecordZonesWithIDs:(id)a3 priority:(int64_t)a4 useZoneWideSharing:(BOOL)a5 group:(id)a6 completion:(id)a7
{
  BOOL v9 = a5;
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a6;
  id v26 = a7;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  uint64_t v12 = [v10 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v34;
    uint64_t v15 = (void *)MEMORY[0x263EFFA68];
    do
    {
      uint64_t v16 = 0;
      uint64_t v17 = v15;
      do
      {
        if (*(void *)v34 != v14) {
          objc_enumerationMutation(v10);
        }
        uint64_t v18 = (void *)[objc_alloc(MEMORY[0x263EFD7F8]) initWithZoneID:*(void *)(*((void *)&v33 + 1) + 8 * v16)];
        objc_msgSend(v18, "setCapabilities:", objc_msgSend(v18, "capabilities") | 1);
        objc_msgSend(v18, "setCapabilities:", objc_msgSend(v18, "capabilities") | 2);
        objc_msgSend(v18, "setCapabilities:", objc_msgSend(v18, "capabilities") | 4);
        if (v9) {
          objc_msgSend(v18, "setCapabilities:", objc_msgSend(v18, "capabilities") | 8);
        }
        uint64_t v15 = [v17 arrayByAddingObject:v18];

        ++v16;
        uint64_t v17 = v15;
      }
      while (v13 != v16);
      uint64_t v13 = [v10 countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v13);
  }
  else
  {
    uint64_t v15 = (void *)MEMORY[0x263EFFA68];
  }
  v19 = (void *)[objc_alloc(MEMORY[0x263EFD740]) initWithRecordZonesToSave:v15 recordZoneIDsToDelete:0];
  [v19 setGroup:v11];
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __91__ASCloudKitUtility_createRecordZonesWithIDs_priority_useZoneWideSharing_group_completion___block_invoke;
  v29[3] = &unk_265218D90;
  id v30 = v10;
  id v31 = v11;
  id v32 = v26;
  id v20 = v26;
  id v21 = v11;
  id v22 = v10;
  [v19 setModifyRecordZonesCompletionBlock:v29];
  [v19 setQualityOfService:17];
  v23 = _ASOperationConfigurationForPriority(a4, 0);
  [v19 setConfiguration:v23];

  v24 = [(ASCloudKitUtility *)self container];
  v25 = [v24 privateCloudDatabase];
  [v25 addOperation:v19];
}

void __91__ASCloudKitUtility_createRecordZonesWithIDs_priority_useZoneWideSharing_group_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  ASLoggingInitialize();
  id v10 = (void *)*MEMORY[0x263F23AA8];
  id v11 = *MEMORY[0x263F23AA8];
  if (v9)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __91__ASCloudKitUtility_createRecordZonesWithIDs_priority_useZoneWideSharing_group_completion___block_invoke_cold_1();
    }
  }
  else if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = *(void **)(a1 + 40);
    uint64_t v13 = v10;
    uint64_t v14 = [v12 name];
    int v16 = 138412546;
    id v17 = v7;
    __int16 v18 = 2112;
    v19 = v14;
    _os_log_impl(&dword_2474C9000, v13, OS_LOG_TYPE_DEFAULT, "Created record zones in private database: %@, with group %@", (uint8_t *)&v16, 0x16u);
  }
  uint64_t v15 = *(void *)(a1 + 48);
  if (v15) {
    (*(void (**)(uint64_t, BOOL, id, id))(v15 + 16))(v15, v9 == 0, v9, v7);
  }
}

- (void)_saveRecordsIntoPrivateDatabase:(id)a3 recordIDsToDelete:(id)a4 savePolicy:(int64_t)a5 priority:(int64_t)a6 activity:(id)a7 group:(id)a8 completion:(id)a9
{
  id v15 = a7;
  id v16 = a8;
  id v17 = a9;
  __int16 v18 = (objc_class *)MEMORY[0x263EFD748];
  id v19 = a4;
  id v20 = a3;
  id v21 = (void *)[[v18 alloc] initWithRecordsToSave:v20 recordIDsToDelete:v19];

  [v21 setAtomic:1];
  [v21 setSavePolicy:a5];
  [v21 setGroup:v16];
  uint64_t v28 = MEMORY[0x263EF8330];
  uint64_t v29 = 3221225472;
  id v30 = __117__ASCloudKitUtility__saveRecordsIntoPrivateDatabase_recordIDsToDelete_savePolicy_priority_activity_group_completion___block_invoke;
  id v31 = &unk_265218DB8;
  id v32 = self;
  id v33 = v16;
  id v34 = v15;
  id v35 = v17;
  id v22 = v17;
  id v23 = v15;
  id v24 = v16;
  [v21 setModifyRecordsCompletionBlock:&v28];
  objc_msgSend(v21, "setQualityOfService:", 17, v28, v29, v30, v31, v32);
  v25 = _ASOperationConfigurationForPriority(a6, v23);
  [v21 setConfiguration:v25];

  id v26 = [(ASCloudKitUtility *)self container];
  v27 = [v26 privateCloudDatabase];
  [v27 addOperation:v21];
}

void __117__ASCloudKitUtility__saveRecordsIntoPrivateDatabase_recordIDsToDelete_savePolicy_priority_activity_group_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  ASLoggingInitialize();
  id v10 = (void *)*MEMORY[0x263F23AA8];
  BOOL v11 = os_log_type_enabled((os_log_t)*MEMORY[0x263F23AA8], OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (!v11) {
      goto LABEL_7;
    }
    uint64_t v12 = *(void **)(a1 + 32);
    uint64_t v13 = v10;
    uint64_t v14 = [v12 container];
    id v15 = [v14 containerIdentifier];
    int v21 = 138543618;
    uint64_t v22 = (uint64_t)v15;
    __int16 v23 = 2114;
    id v24 = v9;
    _os_log_impl(&dword_2474C9000, v13, OS_LOG_TYPE_DEFAULT, "Failed to save records into private database for container %{public}@ with error: %{public}@", (uint8_t *)&v21, 0x16u);
  }
  else
  {
    if (!v11) {
      goto LABEL_7;
    }
    uint64_t v13 = v10;
    uint64_t v16 = [v7 count];
    uint64_t v14 = [*(id *)(a1 + 32) container];
    id v17 = [v14 containerIdentifier];
    __int16 v18 = [*(id *)(a1 + 40) name];
    uint64_t v19 = *(void *)(a1 + 48);
    int v21 = 134218754;
    uint64_t v22 = v16;
    __int16 v23 = 2114;
    id v24 = v17;
    __int16 v25 = 2114;
    id v26 = v18;
    __int16 v27 = 2114;
    uint64_t v28 = v19;
    _os_log_impl(&dword_2474C9000, v13, OS_LOG_TYPE_DEFAULT, "Saved %lu records into private database: container %{public}@, group %{public}@, activity %{public}@", (uint8_t *)&v21, 0x2Au);
  }
LABEL_7:
  uint64_t v20 = *(void *)(a1 + 56);
  if (v20) {
    (*(void (**)(uint64_t, BOOL, id, id))(v20 + 16))(v20, v9 == 0, v9, v7);
  }
}

- (void)_saveRecordsIntoPrivateDatabaseCreatingZones:(id)a3 recordIDsToDelete:(id)a4 savePolicy:(int64_t)a5 priority:(int64_t)a6 activity:(id)a7 useZoneWideSharing:(BOOL)a8 group:(id)a9 completion:(id)a10
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v30 = a4;
  id v13 = a7;
  id v29 = a9;
  id v14 = a10;
  id v15 = [MEMORY[0x263EFFA08] set];
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id v16 = v12;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v46 objects:v50 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v47;
    do
    {
      uint64_t v20 = 0;
      int v21 = v15;
      do
      {
        if (*(void *)v47 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v22 = [*(id *)(*((void *)&v46 + 1) + 8 * v20) recordID];
        __int16 v23 = [v22 zoneID];
        id v15 = [v21 setByAddingObject:v23];

        ++v20;
        int v21 = v15;
      }
      while (v18 != v20);
      uint64_t v18 = [v16 countByEnumeratingWithState:&v46 objects:v50 count:16];
    }
    while (v18);
  }

  v36[0] = MEMORY[0x263EF8330];
  v36[1] = 3221225472;
  v36[2] = __149__ASCloudKitUtility__saveRecordsIntoPrivateDatabaseCreatingZones_recordIDsToDelete_savePolicy_priority_activity_useZoneWideSharing_group_completion___block_invoke;
  v36[3] = &unk_265218E08;
  v36[4] = self;
  id v37 = v15;
  BOOL v45 = a8;
  id v38 = v29;
  id v39 = v16;
  id v40 = v30;
  id v41 = v13;
  int64_t v43 = a6;
  int64_t v44 = a5;
  id v42 = v14;
  id v32 = v14;
  id v24 = v13;
  id v25 = v30;
  id v26 = v16;
  id v27 = v29;
  id v28 = v15;
  [(ASCloudKitUtility *)self _saveRecordsIntoPrivateDatabase:v26 recordIDsToDelete:v25 savePolicy:a5 priority:a6 activity:v24 group:v27 completion:v36];
}

void __149__ASCloudKitUtility__saveRecordsIntoPrivateDatabaseCreatingZones_recordIDsToDelete_savePolicy_priority_activity_useZoneWideSharing_group_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
LABEL_14:
    (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
    goto LABEL_19;
  }
  id v8 = v6;
  if ([v8 code] != 26)
  {
    if ([v8 code] == 2)
    {
      id v9 = [v8 userInfo];
      id v10 = [v9 objectForKeyedSubscript:*MEMORY[0x263EFD4C8]];

      long long v31 = 0u;
      long long v32 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      BOOL v11 = [v10 allValues];
      uint64_t v12 = [v11 countByEnumeratingWithState:&v29 objects:buf count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v30;
        while (2)
        {
          uint64_t v15 = 0;
          do
          {
            if (*(void *)v30 != v14) {
              objc_enumerationMutation(v11);
            }
            if ([*(id *)(*((void *)&v29 + 1) + 8 * v15) code] == 26)
            {

              goto LABEL_16;
            }
            ++v15;
          }
          while (v13 != v15);
          uint64_t v13 = [v11 countByEnumeratingWithState:&v29 objects:buf count:16];
          if (v13) {
            continue;
          }
          break;
        }
      }
    }
    goto LABEL_14;
  }
LABEL_16:

  ASLoggingInitialize();
  id v16 = *MEMORY[0x263F23AA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AA8], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2474C9000, v16, OS_LOG_TYPE_DEFAULT, "Zones not found when saving records, creating zones and re-trying save.", buf, 2u);
  }
  uint64_t v17 = *(void **)(a1 + 32);
  uint64_t v18 = *(void *)(a1 + 40);
  uint64_t v19 = *(void *)(a1 + 88);
  uint64_t v20 = *(unsigned __int8 *)(a1 + 104);
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __149__ASCloudKitUtility__saveRecordsIntoPrivateDatabaseCreatingZones_recordIDsToDelete_savePolicy_priority_activity_useZoneWideSharing_group_completion___block_invoke_289;
  v22[3] = &unk_265218DE0;
  v22[4] = v17;
  uint64_t v21 = *(void *)(a1 + 48);
  id v23 = *(id *)(a1 + 56);
  id v24 = *(id *)(a1 + 64);
  int8x16_t v28 = vextq_s8(*(int8x16_t *)(a1 + 88), *(int8x16_t *)(a1 + 88), 8uLL);
  id v25 = *(id *)(a1 + 72);
  id v26 = *(id *)(a1 + 48);
  id v27 = *(id *)(a1 + 80);
  [v17 createRecordZonesWithIDs:v18 priority:v19 useZoneWideSharing:v20 group:v21 completion:v22];

LABEL_19:
}

uint64_t __149__ASCloudKitUtility__saveRecordsIntoPrivateDatabaseCreatingZones_recordIDsToDelete_savePolicy_priority_activity_useZoneWideSharing_group_completion___block_invoke_289(uint64_t a1, int a2, uint64_t a3)
{
  if (!a3 && a2) {
    return [*(id *)(a1 + 32) _saveRecordsIntoPrivateDatabase:*(void *)(a1 + 40) recordIDsToDelete:*(void *)(a1 + 48) savePolicy:*(void *)(a1 + 80) priority:*(void *)(a1 + 88) activity:*(void *)(a1 + 56) group:*(void *)(a1 + 64) completion:*(void *)(a1 + 72)];
  }
  uint64_t v4 = *(uint64_t (**)(void))(*(void *)(a1 + 72) + 16);
  return v4();
}

- (void)forceSaveRecordsIntoPrivateDatabaseIgnoringServerChanges:(id)a3 recordIDsToDelete:(id)a4 priority:(int64_t)a5 activity:(id)a6 group:(id)a7 completion:(id)a8
{
}

- (void)saveRecordsIntoPrivateDatabase:(id)a3 priority:(int64_t)a4 activity:(id)a5 group:(id)a6 completion:(id)a7
{
}

- (void)saveRecordsIntoPrivateDatabase:(id)a3 recordIDsToDelete:(id)a4 priority:(int64_t)a5 activity:(id)a6 group:(id)a7 completion:(id)a8
{
}

- (void)saveRecordsIntoPrivateDatabase:(id)a3 recordIDsToDelete:(id)a4 priority:(int64_t)a5 activity:(id)a6 useZoneWideSharing:(BOOL)a7 group:(id)a8 completion:(id)a9
{
}

- (void)forceSaveRecordsIntoPrivateDatabaseIgnoringServerChanges:(id)a3 recordIDsToDelete:(id)a4 priority:(int64_t)a5 activity:(id)a6 useZoneWideSharing:(BOOL)a7 group:(id)a8 completion:(id)a9
{
}

+ (id)shareURLForShare:(id)a3
{
  return (id)[a3 URL];
}

- (void)createShareAndAssociatedZoneWithShareRecordID:(id)a3 rootRecord:(id)a4 otherRecordsToSave:(id)a5 completion:(id)a6
{
  v29[2] = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = a5;
  uint64_t v14 = [v10 zoneID];
  uint64_t v15 = [v11 recordID];
  id v16 = [v15 zoneID];
  int v17 = [v14 isEqual:v16];

  if (v17)
  {
    uint64_t v18 = (void *)[objc_alloc(MEMORY[0x263EFD840]) initWithRootRecord:v11 shareID:v10];
    [v18 setParticipantVisibility:1];
    v29[0] = v18;
    v29[1] = v11;
    uint64_t v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v29 count:2];
    uint64_t v20 = [v19 arrayByAddingObjectsFromArray:v13];

    uint64_t v21 = ASCloudKitGroupSharingSetup();
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __108__ASCloudKitUtility_createShareAndAssociatedZoneWithShareRecordID_rootRecord_otherRecordsToSave_completion___block_invoke;
    v25[3] = &unk_265218E30;
    id v26 = v10;
    id v27 = v11;
    id v28 = v12;
    [(ASCloudKitUtility *)self saveRecordsIntoPrivateDatabase:v20 priority:2 activity:0 group:v21 completion:v25];

    id v13 = v18;
  }
  else
  {
    ASLoggingInitialize();
    uint64_t v22 = *MEMORY[0x263F23AA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AA8], OS_LOG_TYPE_ERROR)) {
      -[ASCloudKitUtility createShareAndAssociatedZoneWithShareRecordID:rootRecord:otherRecordsToSave:completion:](v22, v23, v24);
    }
    (*((void (**)(id, void, void, void, id, id))v12 + 2))(v12, 0, 0, 0, v11, v13);
  }
}

void __108__ASCloudKitUtility_createShareAndAssociatedZoneWithShareRecordID_rootRecord_otherRecordsToSave_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v22 = a3;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = a4;
  uint64_t v6 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    id v8 = 0;
    id v23 = 0;
    uint64_t v9 = *(void *)v26;
    id v10 = (void *)MEMORY[0x263EFFA68];
    while (1)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v26 != v9) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        id v13 = [v12 recordID];
        if ([v13 isEqual:*(void *)(a1 + 32)])
        {
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();

          if (isKindOfClass)
          {
            id v15 = v12;
            id v16 = v23;
            id v23 = v15;
            goto LABEL_13;
          }
        }
        else
        {
        }
        int v17 = [v12 recordID];
        uint64_t v18 = [*(id *)(a1 + 40) recordID];
        int v19 = [v17 isEqual:v18];

        if (v19)
        {
          id v20 = v12;
          id v16 = v8;
          id v8 = v20;
        }
        else
        {
          uint64_t v21 = [v10 arrayByAddingObject:v12];
          id v16 = v10;
          id v10 = (void *)v21;
        }
LABEL_13:
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
      if (!v7) {
        goto LABEL_17;
      }
    }
  }
  id v8 = 0;
  id v23 = 0;
  id v10 = (void *)MEMORY[0x263EFFA68];
LABEL_17:
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)_fetchShareWithShareRecordID:(id)a3 activity:(id)a4 group:(id)a5 completion:(id)a6
{
  v29[1] = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a6;
  id v12 = (objc_class *)MEMORY[0x263EFD6D8];
  id v13 = a5;
  id v14 = a4;
  id v15 = [v12 alloc];
  v29[0] = v10;
  id v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v29 count:1];
  int v17 = (void *)[v15 initWithRecordIDs:v16];

  [v17 setGroup:v13];
  uint64_t v23 = MEMORY[0x263EF8330];
  uint64_t v24 = 3221225472;
  long long v25 = __76__ASCloudKitUtility__fetchShareWithShareRecordID_activity_group_completion___block_invoke;
  long long v26 = &unk_265218E58;
  id v27 = v10;
  id v28 = v11;
  id v18 = v11;
  id v19 = v10;
  [v17 setFetchRecordsCompletionBlock:&v23];
  objc_msgSend(v17, "setQualityOfService:", 17, v23, v24, v25, v26);
  id v20 = _ASOperationConfigurationForPriority(2, v14);

  [v17 setConfiguration:v20];
  uint64_t v21 = [(ASCloudKitUtility *)self container];
  id v22 = [v21 privateCloudDatabase];
  [v22 addOperation:v17];
}

void __76__ASCloudKitUtility__fetchShareWithShareRecordID_activity_group_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a3;
  uint64_t v5 = [a2 objectForKeyedSubscript:*(void *)(a1 + 32)];
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  (*(void (**)(void, BOOL))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v7 == 0);
}

- (void)fetchShareWithShareRecordID:(id)a3 activity:(id)a4 group:(id)a5 completion:(id)a6
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  ASLoggingInitialize();
  id v14 = *MEMORY[0x263F23AA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AA8], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v21 = v10;
    _os_log_impl(&dword_2474C9000, v14, OS_LOG_TYPE_DEFAULT, "Fetching share with ID: %@", buf, 0xCu);
  }
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __75__ASCloudKitUtility_fetchShareWithShareRecordID_activity_group_completion___block_invoke;
  v17[3] = &unk_265218E80;
  id v18 = v10;
  id v19 = v11;
  id v15 = v11;
  id v16 = v10;
  [(ASCloudKitUtility *)self _fetchShareWithShareRecordID:v16 activity:v13 group:v12 completion:v17];
}

void __75__ASCloudKitUtility_fetchShareWithShareRecordID_activity_group_completion___block_invoke(uint64_t a1, int a2, void *a3, void *a4)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  ASLoggingInitialize();
  uint64_t v9 = *MEMORY[0x263F23AA8];
  if (!v7 && v8 && a2)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AA8], OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412290;
      id v11 = v8;
      _os_log_impl(&dword_2474C9000, v9, OS_LOG_TYPE_DEFAULT, "Found share: %@", (uint8_t *)&v10, 0xCu);
    }
  }
  else if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AA8], OS_LOG_TYPE_ERROR))
  {
    __75__ASCloudKitUtility_fetchShareWithShareRecordID_activity_group_completion___block_invoke_cold_1();
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_acceptShareMetadatas:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)[objc_alloc(MEMORY[0x263EFD5B8]) initWithShareMetadatas:v6];
  uint64_t v9 = ASCloudKitGroupSharingSetup();
  [v8 setGroup:v9];

  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x3032000000;
  v17[3] = __Block_byref_object_copy__15;
  void v17[4] = __Block_byref_object_dispose__15;
  objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v6, "count"));
  id v18 = (id)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __54__ASCloudKitUtility__acceptShareMetadatas_completion___block_invoke;
  v16[3] = &unk_265218EA8;
  v16[4] = v17;
  [v8 setPerShareCompletionBlock:v16];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __54__ASCloudKitUtility__acceptShareMetadatas_completion___block_invoke_299;
  v13[3] = &unk_265218ED0;
  id v10 = v7;
  id v14 = v10;
  id v15 = v17;
  [v8 setAcceptSharesCompletionBlock:v13];
  [v8 setQualityOfService:17];
  id v11 = _ASOperationConfigurationForPriority(2, 0);
  [v8 setConfiguration:v11];

  uint64_t v12 = [(ASCloudKitUtility *)self container];
  [v12 addOperation:v8];

  _Block_object_dispose(v17, 8);
}

void __54__ASCloudKitUtility__acceptShareMetadatas_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [a2 share];
  id v10 = [v9 URL];

  ASLoggingInitialize();
  id v11 = (void *)*MEMORY[0x263F23AA8];
  uint64_t v12 = *MEMORY[0x263F23AA8];
  if (v8)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      __54__ASCloudKitUtility__acceptShareMetadatas_completion___block_invoke_cold_1();
    }
  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = v11;
      id v14 = [v7 recordID];
      int v15 = 138412546;
      id v16 = v10;
      __int16 v17 = 2112;
      id v18 = v14;
      _os_log_impl(&dword_2474C9000, v13, OS_LOG_TYPE_DEFAULT, "Accepted share with URL %@ and share ID %@", (uint8_t *)&v15, 0x16u);
    }
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setObject:v7 forKeyedSubscript:v10];
  }
}

void __54__ASCloudKitUtility__acceptShareMetadatas_completion___block_invoke_299(uint64_t a1, void *a2)
{
  id v3 = a2;
  ASLoggingInitialize();
  uint64_t v4 = *MEMORY[0x263F23AA8];
  uint64_t v5 = *MEMORY[0x263F23AA8];
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __54__ASCloudKitUtility__acceptShareMetadatas_completion___block_invoke_299_cold_1();
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_2474C9000, v4, OS_LOG_TYPE_DEFAULT, "Accepted all shares successfully", v6, 2u);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)acceptSharesWithURLs:(id)a3 cloudKitGroup:(id)a4 completion:(id)a5
{
  id v8 = (objc_class *)MEMORY[0x263EFD6E8];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = (id)[[v8 alloc] initWithShareURLs:v11];
  [(ASCloudKitUtility *)self _acceptSharesWithURLs:v11 operation:v12 cloudKitGroup:v10 completion:v9];
}

- (void)_acceptSharesWithURLs:(id)a3 operation:(id)a4 cloudKitGroup:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  [v11 setGroup:v12];
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x3032000000;
  v24[3] = __Block_byref_object_copy__15;
  v24[4] = __Block_byref_object_dispose__15;
  id v25 = (id)MEMORY[0x263EFFA68];
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __78__ASCloudKitUtility__acceptSharesWithURLs_operation_cloudKitGroup_completion___block_invoke;
  v23[3] = &unk_265218EF8;
  v23[4] = v24;
  [v11 setPerShareMetadataBlock:v23];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __78__ASCloudKitUtility__acceptSharesWithURLs_operation_cloudKitGroup_completion___block_invoke_303;
  v18[3] = &unk_265218F20;
  id v14 = v13;
  id v21 = v14;
  uint64_t v22 = v24;
  id v15 = v10;
  id v19 = v15;
  id v20 = self;
  [v11 setFetchShareMetadataCompletionBlock:v18];
  [v11 setQualityOfService:17];
  id v16 = _ASOperationConfigurationForPriority(2, 0);
  [v11 setConfiguration:v16];

  __int16 v17 = [(ASCloudKitUtility *)self container];
  [v17 addOperation:v11];

  _Block_object_dispose(v24, 8);
}

void __78__ASCloudKitUtility__acceptSharesWithURLs_operation_cloudKitGroup_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  ASLoggingInitialize();
  id v10 = *MEMORY[0x263F23AA8];
  if (v8 && v7 && !v9)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AA8], OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138412290;
      id v15 = v7;
      _os_log_impl(&dword_2474C9000, v10, OS_LOG_TYPE_DEFAULT, "Fetched share metadata for URL %@ successfully", (uint8_t *)&v14, 0xCu);
    }
    uint64_t v11 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) arrayByAddingObject:v8];
    uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 8);
    id v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v11;
  }
  else if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AA8], OS_LOG_TYPE_ERROR))
  {
    __78__ASCloudKitUtility__acceptSharesWithURLs_operation_cloudKitGroup_completion___block_invoke_cold_1();
  }
}

void __78__ASCloudKitUtility__acceptSharesWithURLs_operation_cloudKitGroup_completion___block_invoke_303(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    ASLoggingInitialize();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AA8], OS_LOG_TYPE_ERROR)) {
      __78__ASCloudKitUtility__acceptSharesWithURLs_operation_cloudKitGroup_completion___block_invoke_303_cold_2();
    }
    uint64_t v4 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
LABEL_12:
    v4();
    goto LABEL_13;
  }
  uint64_t v5 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) count];
  uint64_t v6 = [*(id *)(a1 + 32) count];
  ASLoggingInitialize();
  id v7 = *MEMORY[0x263F23AA8];
  id v8 = *MEMORY[0x263F23AA8];
  if (v5 != v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __78__ASCloudKitUtility__acceptSharesWithURLs_operation_cloudKitGroup_completion___block_invoke_303_cold_1(v7, v11, v12);
    }
    uint64_t v4 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    goto LABEL_12;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    id v10 = v7;
    int v13 = 134217984;
    uint64_t v14 = [v9 count];
    _os_log_impl(&dword_2474C9000, v10, OS_LOG_TYPE_DEFAULT, "Accepting shares after fetching metadata (%lu metadatas)", (uint8_t *)&v13, 0xCu);
  }
  [*(id *)(a1 + 40) _acceptShareMetadatas:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) completion:*(void *)(a1 + 48)];
LABEL_13:
}

- (void)acceptSharesWithInvitationTokensByShareURL:(id)a3 cloudKitGroup:(id)a4 completion:(id)a5
{
  id v8 = (objc_class *)MEMORY[0x263EFD6E8];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = [v8 alloc];
  int v13 = [v11 allKeys];
  id v15 = (id)[v12 initWithShareURLs:v13 invitationTokensByShareURL:v11];

  uint64_t v14 = [v11 allKeys];

  [(ASCloudKitUtility *)self _acceptSharesWithURLs:v14 operation:v15 cloudKitGroup:v10 completion:v9];
}

- (void)fetchShareParticipantForEmailAddress:(id)a3 group:(id)a4 completion:(id)a5
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v8 = (void *)MEMORY[0x263EFD888];
  id v15 = a3;
  id v9 = (void *)MEMORY[0x263EFF8C0];
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  int v13 = [v9 arrayWithObjects:&v15 count:1];
  uint64_t v14 = objc_msgSend(v8, "lookupInfosWithEmails:", v13, v15, v16);

  [(ASCloudKitUtility *)self _fetchShareParticipantForLookupInfos:v14 group:v11 completion:v10];
}

- (void)_fetchShareParticipantForLookupInfos:(id)a3 group:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)[objc_alloc(MEMORY[0x263EFD6F8]) initWithUserIdentityLookupInfos:v8];
  [v11 setGroup:v9];
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x3032000000;
  v19[3] = __Block_byref_object_copy__15;
  v19[4] = __Block_byref_object_dispose__15;
  id v20 = [MEMORY[0x263EFFA08] set];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __75__ASCloudKitUtility__fetchShareParticipantForLookupInfos_group_completion___block_invoke;
  v18[3] = &unk_265218F48;
  void v18[4] = v19;
  [v11 setShareParticipantFetchedBlock:v18];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __75__ASCloudKitUtility__fetchShareParticipantForLookupInfos_group_completion___block_invoke_2;
  v15[3] = &unk_265218ED0;
  id v12 = v10;
  id v16 = v12;
  __int16 v17 = v19;
  [v11 setFetchShareParticipantsCompletionBlock:v15];
  [v11 setQualityOfService:17];
  int v13 = _ASOperationConfigurationForPriority(2, 0);
  [v11 setConfiguration:v13];

  uint64_t v14 = [(ASCloudKitUtility *)self container];
  [v14 addOperation:v11];

  _Block_object_dispose(v19, 8);
}

uint64_t __75__ASCloudKitUtility__fetchShareParticipantForLookupInfos_group_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setByAddingObject:a2];
  return MEMORY[0x270F9A758]();
}

void __75__ASCloudKitUtility__fetchShareParticipantForLookupInfos_group_completion___block_invoke_2(uint64_t a1, void *a2)
{
  BOOL v2 = a2 == 0;
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  id v5 = a2;
  id v6 = [v4 anyObject];
  (*(void (**)(uint64_t, BOOL, id, id))(v3 + 16))(v3, v2, v5, v6);
}

- (void)fetchShareParticipantForIdentifier:(id)a3 group:(id)a4 completion:(id)a5
{
  v15[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = ASSanitizedContactDestination();
  uint64_t v12 = [(ASCloudKitUtility *)self _lookupInfoFromIdentifier:v8];
  int v13 = (void *)v12;
  if (v12)
  {
    v15[0] = v12;
    uint64_t v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:1];
    [(ASCloudKitUtility *)self _fetchShareParticipantForLookupInfos:v14 group:v9 completion:v10];
  }
  else
  {
    ASLoggingInitialize();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AA8], OS_LOG_TYPE_ERROR)) {
      -[ASCloudKitUtility fetchShareParticipantForIdentifier:group:completion:]();
    }
    uint64_t v14 = [MEMORY[0x263F087E8] errorWithDomain:@"ASCloudKitUtilityErrorDomain" code:0 userInfo:0];
    (*((void (**)(id, void, void *, void))v10 + 2))(v10, 0, v14, 0);
  }
}

- (id)_lookupInfoFromIdentifier:(id)a3
{
  id v3 = a3;
  if (ASDestinationIsPhoneNumber())
  {
    uint64_t v4 = [objc_alloc(MEMORY[0x263EFD888]) initWithPhoneNumber:v3];
LABEL_5:
    id v5 = (void *)v4;
    goto LABEL_7;
  }
  if (ASDestinationIsEmail())
  {
    uint64_t v4 = [objc_alloc(MEMORY[0x263EFD888]) initWithEmailAddress:v3];
    goto LABEL_5;
  }
  id v5 = 0;
LABEL_7:

  return v5;
}

- (void)addParticipantWithCloudKitAddress:(id)a3 toShares:(id)a4 group:(id)a5 completion:(id)a6
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  ASLoggingInitialize();
  uint64_t v14 = *MEMORY[0x263F23AA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AA8], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v25 = v10;
    __int16 v26 = 2112;
    id v27 = v11;
    _os_log_impl(&dword_2474C9000, v14, OS_LOG_TYPE_DEFAULT, "Adding participant with address %@ to shares: %@", buf, 0x16u);
  }
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __81__ASCloudKitUtility_addParticipantWithCloudKitAddress_toShares_group_completion___block_invoke;
  v19[3] = &unk_265218F70;
  v19[4] = self;
  id v20 = v11;
  id v21 = v12;
  id v22 = v10;
  id v23 = v13;
  id v15 = v13;
  id v16 = v10;
  id v17 = v12;
  id v18 = v11;
  [(ASCloudKitUtility *)self fetchShareParticipantForEmailAddress:v16 group:v17 completion:v19];
}

void __81__ASCloudKitUtility_addParticipantWithCloudKitAddress_toShares_group_completion___block_invoke(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  if (!v7 && a2 && v8)
  {
    id v10 = *(void **)(a1 + 32);
    uint64_t v11 = *(void *)(a1 + 40);
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __81__ASCloudKitUtility_addParticipantWithCloudKitAddress_toShares_group_completion___block_invoke_2;
    v14[3] = &unk_265215FA8;
    uint64_t v12 = *(void *)(a1 + 48);
    id v15 = *(id *)(a1 + 56);
    id v16 = *(id *)(a1 + 64);
    [v10 addParticipant:v9 toShares:v11 group:v12 completion:v14];
  }
  else
  {
    ASLoggingInitialize();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AA8], OS_LOG_TYPE_ERROR)) {
      __81__ASCloudKitUtility_addParticipantWithCloudKitAddress_toShares_group_completion___block_invoke_cold_1();
    }
    uint64_t v13 = *(void *)(a1 + 64);
    if (v13) {
      (*(void (**)(uint64_t, void, id))(v13 + 16))(v13, 0, v7);
    }
  }
}

void __81__ASCloudKitUtility_addParticipantWithCloudKitAddress_toShares_group_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v5 = a3;
  ASLoggingInitialize();
  id v6 = *MEMORY[0x263F23AA8];
  if (v5 || (a2 & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AA8], OS_LOG_TYPE_ERROR)) {
      __81__ASCloudKitUtility_addParticipantWithCloudKitAddress_toShares_group_completion___block_invoke_2_cold_1();
    }
  }
  else if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AA8], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    int v9 = 138412290;
    uint64_t v10 = v7;
    _os_log_impl(&dword_2474C9000, v6, OS_LOG_TYPE_DEFAULT, "Added participant with address %@ successfully.", (uint8_t *)&v9, 0xCu);
  }
  uint64_t v8 = *(void *)(a1 + 40);
  if (v8) {
    (*(void (**)(uint64_t, uint64_t, id))(v8 + 16))(v8, a2, v5);
  }
}

- (void)addParticipant:(id)a3 toShares:(id)a4 group:(id)a5 completion:(id)a6
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v28 = a5;
  id v26 = a6;
  ASLoggingInitialize();
  uint64_t v11 = *MEMORY[0x263F23AA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AA8], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v38 = v9;
    __int16 v39 = 2112;
    id v40 = v10;
    _os_log_impl(&dword_2474C9000, v11, OS_LOG_TYPE_DEFAULT, "Adding participant %@ to shares: %@", buf, 0x16u);
  }
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v12 = v10;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v33 != v15) {
          objc_enumerationMutation(v12);
        }
        id v17 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        id v18 = objc_msgSend(v9, "userIdentity", v26);
        id v19 = [v17 owner];
        id v20 = [v19 userIdentity];
        char v21 = [v18 isEquivalentToUserIdentity:v20];

        if (v21)
        {
          ASLoggingInitialize();
          id v22 = *MEMORY[0x263F23AA8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AA8], OS_LOG_TYPE_ERROR)) {
            -[ASCloudKitUtility addParticipant:toShares:group:completion:](buf, &buf[1], v22);
          }
        }
        else
        {
          id v23 = (void *)[v9 copy];
          [v17 addParticipant:v23];
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v14);
  }

  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  void v29[2] = __62__ASCloudKitUtility_addParticipant_toShares_group_completion___block_invoke;
  void v29[3] = &unk_265217848;
  id v30 = v9;
  id v31 = v26;
  id v24 = v26;
  id v25 = v9;
  [(ASCloudKitUtility *)self saveRecordsIntoPrivateDatabase:v12 priority:2 activity:0 group:v28 completion:v29];
}

void __62__ASCloudKitUtility_addParticipant_toShares_group_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  ASLoggingInitialize();
  id v9 = *MEMORY[0x263F23AA8];
  if (v7 || (a2 & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AA8], OS_LOG_TYPE_ERROR)) {
      __81__ASCloudKitUtility_addParticipantWithCloudKitAddress_toShares_group_completion___block_invoke_2_cold_1();
    }
  }
  else if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AA8], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = *(void *)(a1 + 32);
    int v12 = 138412546;
    uint64_t v13 = v10;
    __int16 v14 = 2112;
    id v15 = v8;
    _os_log_impl(&dword_2474C9000, v9, OS_LOG_TYPE_DEFAULT, "Added participant %@ to shares %@ successfully.", (uint8_t *)&v12, 0x16u);
  }
  uint64_t v11 = *(void *)(a1 + 40);
  if (v11) {
    (*(void (**)(uint64_t, uint64_t, id))(v11 + 16))(v11, a2, v7);
  }
}

- (void)removeParticipantWithCloudKitAddress:(id)a3 fromShares:(id)a4 group:(id)a5 completion:(id)a6
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  ASLoggingInitialize();
  __int16 v14 = (void *)*MEMORY[0x263F23AA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AA8], OS_LOG_TYPE_DEFAULT))
  {
    id v15 = v14;
    uint64_t v16 = _ASRecordIDsForRecords(v11);
    *(_DWORD *)buf = 138412546;
    id v28 = v10;
    __int16 v29 = 2112;
    id v30 = v16;
    _os_log_impl(&dword_2474C9000, v15, OS_LOG_TYPE_DEFAULT, "Removing participant with address %@ from shares with IDs: %@", buf, 0x16u);
  }
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __86__ASCloudKitUtility_removeParticipantWithCloudKitAddress_fromShares_group_completion___block_invoke;
  v21[3] = &unk_265218F70;
  id v22 = v11;
  id v23 = self;
  id v24 = v12;
  id v25 = v10;
  id v26 = v13;
  id v17 = v13;
  id v18 = v10;
  id v19 = v12;
  id v20 = v11;
  [(ASCloudKitUtility *)self fetchShareParticipantForEmailAddress:v18 group:v19 completion:v21];
}

void __86__ASCloudKitUtility_removeParticipantWithCloudKitAddress_fromShares_group_completion___block_invoke(uint64_t a1, int a2, void *a3, void *a4)
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  if (!v7 && a2 && v8)
  {
    uint64_t v25 = a1;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v10 = *(id *)(a1 + 32);
    uint64_t v11 = [v10 countByEnumeratingWithState:&v31 objects:v35 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v32 != v13) {
            objc_enumerationMutation(v10);
          }
          id v15 = *(void **)(*((void *)&v31 + 1) + 8 * i);
          uint64_t v16 = [v9 userIdentity];
          id v17 = [v15 owner];
          id v18 = [v17 userIdentity];
          char v19 = [v16 isEquivalentToUserIdentity:v18];

          if (v19)
          {
            ASLoggingInitialize();
            id v20 = *MEMORY[0x263F23AA8];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AA8], OS_LOG_TYPE_ERROR)) {
              __86__ASCloudKitUtility_removeParticipantWithCloudKitAddress_fromShares_group_completion___block_invoke_cold_1(&v29, v30, v20);
            }
          }
          else
          {
            [v15 removeParticipant:v9];
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v31 objects:v35 count:16];
      }
      while (v12);
    }

    uint64_t v22 = *(void *)(v25 + 32);
    char v21 = *(void **)(v25 + 40);
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __86__ASCloudKitUtility_removeParticipantWithCloudKitAddress_fromShares_group_completion___block_invoke_310;
    v26[3] = &unk_265217848;
    uint64_t v23 = *(void *)(v25 + 48);
    id v27 = *(id *)(v25 + 56);
    id v28 = *(id *)(v25 + 64);
    [v21 saveRecordsIntoPrivateDatabase:v22 priority:2 activity:0 group:v23 completion:v26];

    id v7 = 0;
  }
  else
  {
    ASLoggingInitialize();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AA8], OS_LOG_TYPE_ERROR)) {
      __86__ASCloudKitUtility_removeParticipantWithCloudKitAddress_fromShares_group_completion___block_invoke_cold_2();
    }
    uint64_t v24 = *(void *)(a1 + 64);
    if (v24) {
      (*(void (**)(uint64_t, void, id))(v24 + 16))(v24, 0, v7);
    }
  }
}

void __86__ASCloudKitUtility_removeParticipantWithCloudKitAddress_fromShares_group_completion___block_invoke_310(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  ASLoggingInitialize();
  id v9 = (void *)*MEMORY[0x263F23AA8];
  if (v7 || (a2 & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AA8], OS_LOG_TYPE_ERROR)) {
      __86__ASCloudKitUtility_removeParticipantWithCloudKitAddress_fromShares_group_completion___block_invoke_310_cold_1();
    }
  }
  else if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AA8], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = *(void *)(a1 + 32);
    uint64_t v11 = v9;
    uint64_t v12 = _ASRecordIDsForRecords(v8);
    int v14 = 138412546;
    uint64_t v15 = v10;
    __int16 v16 = 2112;
    id v17 = v12;
    _os_log_impl(&dword_2474C9000, v11, OS_LOG_TYPE_DEFAULT, "Removed participant %@ from shares with IDs %@ successfully.", (uint8_t *)&v14, 0x16u);
  }
  uint64_t v13 = *(void *)(a1 + 40);
  if (v13) {
    (*(void (**)(uint64_t, uint64_t, id))(v13 + 16))(v13, a2, v7);
  }
}

- (void)cancelAllExecutingFetches
{
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46__ASCloudKitUtility_cancelAllExecutingFetches__block_invoke;
  block[3] = &unk_2652157F0;
  block[4] = self;
  dispatch_async(serialQueue, block);
}

uint64_t __46__ASCloudKitUtility_cancelAllExecutingFetches__block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 16);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v12;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v11 + 1) + 8 * v6);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v8 = v7;
          [v8 setRecordZoneWithIDChangedBlock:0];
          [v8 setFetchDatabaseChangesCompletionBlock:0];
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            goto LABEL_11;
          }
          id v9 = v7;
          objc_msgSend(v9, "setRecordChangedBlock:", 0, (void)v11);
          [v9 setRecordZoneChangeTokensUpdatedBlock:0];
          [v9 setRecordZoneFetchCompletionBlock:0];
          [v9 setFetchRecordZoneChangesCompletionBlock:0];
        }

LABEL_11:
        objc_msgSend(v7, "cancel", (void)v11);
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }

  return [*(id *)(*(void *)(a1 + 32) + 16) removeAllObjects];
}

- (void)_fetchChangesInZones:(id)a3 additionalZonesToFetch:(id)a4 fetchConfigurations:(id)a5 inDatabase:(id)a6 serverChangeTokenCache:(id)a7 priority:(int64_t)a8 allowRetry:(BOOL)a9 activity:(id)a10 group:(id)a11 completion:(id)a12
{
  uint64_t v115 = *MEMORY[0x263EF8340];
  id v16 = a3;
  id v17 = a4;
  location = (id *)a5;
  id v69 = a6;
  id v18 = a7;
  id v68 = a10;
  id v73 = a11;
  id v64 = a12;
  v56 = v16;
  v66 = v17;
  char v19 = [v16 setByAddingObjectsFromSet:v17];
  ASLoggingInitialize();
  id v20 = (os_log_t *)MEMORY[0x263F23AA8];
  char v21 = (void *)*MEMORY[0x263F23AA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AA8], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v22 = v21;
    uint64_t v23 = [v19 count];
    [v69 databaseScope];
    uint64_t v24 = CKDatabaseScopeString();
    uint64_t v25 = [v73 name];
    *(_DWORD *)buf = 134218754;
    uint64_t v108 = v23;
    __int16 v109 = 2114;
    v110 = v24;
    __int16 v111 = 2114;
    v112 = v25;
    __int16 v113 = 2114;
    id v114 = v68;
    _os_log_impl(&dword_2474C9000, v22, OS_LOG_TYPE_DEFAULT, "Fetching changes in %lu record zones (database %{public}@, group %{public}@, activity %{public}@)", buf, 0x2Au);
  }
  if ([location count])
  {
    ASLoggingInitialize();
    os_log_t v26 = *v20;
    if (os_log_type_enabled(*v20, OS_LOG_TYPE_DEFAULT))
    {
      id v27 = v26;
      [v69 databaseScope];
      id v28 = CKDatabaseScopeString();
      uint8_t v29 = [(CKContainer *)self->_container containerIdentifier];
      *(_DWORD *)buf = 138543874;
      uint64_t v108 = (uint64_t)location;
      __int16 v109 = 2114;
      v110 = v28;
      __int16 v111 = 2114;
      v112 = v29;
      _os_log_impl(&dword_2474C9000, v27, OS_LOG_TYPE_DEFAULT, "Using fetch configurations %{public}@ %{public}@ database in %{public}@", buf, 0x20u);
    }
  }
  v62 = [MEMORY[0x263EFF980] array];
  v60 = [MEMORY[0x263EFF980] array];
  v57 = [MEMORY[0x263EFF9C0] set];
  v58 = [MEMORY[0x263EFF9A0] dictionary];
  id v30 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v19, "count"));
  long long v104 = 0u;
  long long v105 = 0u;
  long long v102 = 0u;
  long long v103 = 0u;
  id v31 = v19;
  uint64_t v32 = [v31 countByEnumeratingWithState:&v102 objects:v106 count:16];
  if (v32)
  {
    uint64_t v33 = *(void *)v103;
    do
    {
      uint64_t v34 = 0;
      do
      {
        if (*(void *)v103 != v33) {
          objc_enumerationMutation(v31);
        }
        uint64_t v35 = *(void *)(*((void *)&v102 + 1) + 8 * v34);
        id v36 = objc_alloc_init(MEMORY[0x263EFD6B0]);
        id v37 = [v18 serverChangeTokenForRecordZoneID:v35];
        [v36 setPreviousServerChangeToken:v37];

        [v30 setObject:v36 forKeyedSubscript:v35];
        ++v34;
      }
      while (v32 != v34);
      uint64_t v32 = [v31 countByEnumeratingWithState:&v102 objects:v106 count:16];
    }
    while (v32);
  }

  id v38 = objc_alloc(MEMORY[0x263EFD6B8]);
  __int16 v39 = [v31 allObjects];
  id v40 = (void *)[v38 initWithRecordZoneIDs:v39 configurationsByRecordZoneID:v30];

  [v40 setGroup:v73];
  objc_initWeak((id *)buf, v40);
  [v40 setFetchAllChanges:1];
  v97[0] = MEMORY[0x263EF8330];
  v97[1] = 3221225472;
  v97[2] = __165__ASCloudKitUtility__fetchChangesInZones_additionalZonesToFetch_fetchConfigurations_inDatabase_serverChangeTokenCache_priority_allowRetry_activity_group_completion___block_invoke;
  v97[3] = &unk_265218F98;
  uint64_t v41 = location;
  v98 = v41;
  id v42 = v62;
  id v99 = v42;
  id v43 = v69;
  id v100 = v43;
  id v70 = v58;
  id v101 = v70;
  [v40 setRecordChangedBlock:v97];
  v95[0] = MEMORY[0x263EF8330];
  v95[1] = 3221225472;
  v95[2] = __165__ASCloudKitUtility__fetchChangesInZones_additionalZonesToFetch_fetchConfigurations_inDatabase_serverChangeTokenCache_priority_allowRetry_activity_group_completion___block_invoke_318;
  v95[3] = &unk_265218FC0;
  id v44 = v60;
  id v96 = v44;
  [v40 setRecordWithIDWasDeletedBlock:v95];
  v93[0] = MEMORY[0x263EF8330];
  v93[1] = 3221225472;
  v93[2] = __165__ASCloudKitUtility__fetchChangesInZones_additionalZonesToFetch_fetchConfigurations_inDatabase_serverChangeTokenCache_priority_allowRetry_activity_group_completion___block_invoke_2;
  v93[3] = &unk_265218FE8;
  id v45 = v18;
  id v94 = v45;
  [v40 setRecordZoneChangeTokensUpdatedBlock:v93];
  v89[0] = MEMORY[0x263EF8330];
  v89[1] = 3221225472;
  v89[2] = __165__ASCloudKitUtility__fetchChangesInZones_additionalZonesToFetch_fetchConfigurations_inDatabase_serverChangeTokenCache_priority_allowRetry_activity_group_completion___block_invoke_3;
  v89[3] = &unk_265219010;
  id v46 = v57;
  id v90 = v46;
  id v47 = v45;
  id v91 = v47;
  id v61 = v66;
  id v92 = v61;
  [v40 setRecordZoneFetchCompletionBlock:v89];
  v77[0] = MEMORY[0x263EF8330];
  v77[1] = 3221225472;
  v77[2] = __165__ASCloudKitUtility__fetchChangesInZones_additionalZonesToFetch_fetchConfigurations_inDatabase_serverChangeTokenCache_priority_allowRetry_activity_group_completion___block_invoke_323;
  v77[3] = &unk_265219088;
  objc_copyWeak(v87, (id *)buf);
  v77[4] = self;
  id v48 = v43;
  id v78 = v48;
  id v67 = v42;
  id v79 = v67;
  id v49 = v46;
  id v80 = v49;
  BOOL v88 = a9;
  v59 = v41;
  v81 = v59;
  id v63 = v47;
  id v82 = v63;
  v87[1] = (id)a8;
  id v50 = v68;
  id v83 = v50;
  id v74 = v73;
  id v84 = v74;
  id v51 = v64;
  id v86 = v51;
  id v52 = v44;
  id v85 = v52;
  [v40 setFetchRecordZoneChangesCompletionBlock:v77];
  [v40 setQualityOfService:17];
  v53 = _ASOperationConfigurationForPriority(a8, v50);
  [v40 setConfiguration:v53];

  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __165__ASCloudKitUtility__fetchChangesInZones_additionalZonesToFetch_fetchConfigurations_inDatabase_serverChangeTokenCache_priority_allowRetry_activity_group_completion___block_invoke_327;
  block[3] = &unk_2652157C8;
  block[4] = self;
  id v55 = v40;
  id v76 = v55;
  dispatch_async(serialQueue, block);
  [v48 addOperation:v55];

  objc_destroyWeak(v87);
  objc_destroyWeak((id *)buf);
}

void __165__ASCloudKitUtility__fetchChangesInZones_additionalZonesToFetch_fetchConfigurations_inDatabase_serverChangeTokenCache_priority_allowRetry_activity_group_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = [v3 recordType];
  uint64_t v6 = [v4 objectForKeyedSubscript:v5];

  if (!v6)
  {
LABEL_13:
    [*(id *)(a1 + 40) addObject:v3];
    goto LABEL_19;
  }
  if ([v6 shouldSkip])
  {
    ASLoggingInitialize();
    id v7 = (void *)*MEMORY[0x263F23AA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AA8], OS_LOG_TYPE_DEFAULT))
    {
      id v8 = v7;
      id v9 = [v3 recordType];
      uint64_t v10 = [v3 recordID];
      long long v11 = [v10 zoneID];
      [*(id *)(a1 + 48) databaseScope];
      long long v12 = CKDatabaseScopeString();
      int v32 = 138543874;
      uint64_t v33 = v9;
      __int16 v34 = 2114;
      uint64_t v35 = v11;
      __int16 v36 = 2114;
      id v37 = v12;
      long long v13 = "Skipping %{public}@ from %{public}@ in database: %{public}@)";
LABEL_9:
      _os_log_impl(&dword_2474C9000, v8, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v32, 0x20u);

LABEL_18:
      goto LABEL_19;
    }
    goto LABEL_19;
  }
  uint64_t v14 = [v6 oldestAllowedModificationDate];
  if (!v14) {
    goto LABEL_10;
  }
  uint64_t v15 = (void *)v14;
  id v16 = [v6 oldestAllowedModificationDate];
  id v17 = [v3 modificationDate];
  int v18 = objc_msgSend(v16, "hk_isAfterDate:", v17);

  if (!v18)
  {
LABEL_10:
    if ([v6 shouldCoalesce])
    {
      id v20 = *(void **)(a1 + 56);
      char v21 = [v3 recordType];
      uint64_t v22 = [v20 objectForKeyedSubscript:v21];
      uint64_t v23 = v22;
      if (v22)
      {
        uint64_t v24 = v22;
      }
      else
      {
        uint64_t v24 = [MEMORY[0x263EFF980] array];
      }
      id v8 = v24;

      uint64_t v25 = [v3 recordID];
      os_log_t v26 = [v25 recordName];

      id v27 = [v3 recordID];
      id v28 = [v27 recordName];
      char v29 = [v8 containsObject:v28];

      if ((v29 & 1) == 0)
      {
        [v8 addObject:v26];
        id v30 = *(void **)(a1 + 56);
        id v31 = [v3 recordType];
        [v30 setObject:v8 forKeyedSubscript:v31];
      }
      goto LABEL_18;
    }
    goto LABEL_13;
  }
  ASLoggingInitialize();
  char v19 = (void *)*MEMORY[0x263F23AA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AA8], OS_LOG_TYPE_DEFAULT))
  {
    id v8 = v19;
    id v9 = [v3 recordType];
    uint64_t v10 = [v3 recordID];
    long long v11 = [v10 zoneID];
    [*(id *)(a1 + 48) databaseScope];
    long long v12 = CKDatabaseScopeString();
    int v32 = 138543874;
    uint64_t v33 = v9;
    __int16 v34 = 2114;
    uint64_t v35 = v11;
    __int16 v36 = 2114;
    id v37 = v12;
    long long v13 = "Record too old: %{public}@ from %{public}@ in database: %{public}@";
    goto LABEL_9;
  }
LABEL_19:
}

uint64_t __165__ASCloudKitUtility__fetchChangesInZones_additionalZonesToFetch_fetchConfigurations_inDatabase_serverChangeTokenCache_priority_allowRetry_activity_group_completion___block_invoke_318(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

uint64_t __165__ASCloudKitUtility__fetchChangesInZones_additionalZonesToFetch_fetchConfigurations_inDatabase_serverChangeTokenCache_priority_allowRetry_activity_group_completion___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setServerChangeToken:a3 forRecordZoneID:a2];
}

void __165__ASCloudKitUtility__fetchChangesInZones_additionalZonesToFetch_fetchConfigurations_inDatabase_serverChangeTokenCache_priority_allowRetry_activity_group_completion___block_invoke_3(id *a1, void *a2, void *a3, uint64_t a4, uint64_t a5, void *a6)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v9 = a2;
  id v10 = a3;
  id v11 = a6;
  long long v12 = v11;
  if (v11)
  {
    uint64_t v13 = [v11 code];
    ASLoggingInitialize();
    uint64_t v14 = *MEMORY[0x263F23AA8];
    uint64_t v15 = *MEMORY[0x263F23AA8];
    if (v13 == 21)
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        int v21 = 138412290;
        id v22 = v9;
        _os_log_impl(&dword_2474C9000, v14, OS_LOG_TYPE_DEFAULT, "Change token expired for zone %@", (uint8_t *)&v21, 0xCu);
      }
      [a1[4] addObject:v9];
    }
    else if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      __165__ASCloudKitUtility__fetchChangesInZones_additionalZonesToFetch_fetchConfigurations_inDatabase_serverChangeTokenCache_priority_allowRetry_activity_group_completion___block_invoke_3_cold_1();
    }
    id v18 = a1[5];
    id v19 = 0;
LABEL_16:
    [v18 setServerChangeToken:v19 forRecordZoneID:v9];
    goto LABEL_17;
  }
  if (![a1[6] containsObject:v9])
  {
    ASLoggingInitialize();
    id v20 = *MEMORY[0x263F23AA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AA8], OS_LOG_TYPE_DEFAULT))
    {
      int v21 = 138412546;
      id v22 = v9;
      __int16 v23 = 2112;
      id v24 = v10;
      _os_log_impl(&dword_2474C9000, v20, OS_LOG_TYPE_DEFAULT, "Fetched changes successfully in zone %@, serverChangeToken %@", (uint8_t *)&v21, 0x16u);
    }
    id v18 = a1[5];
    id v19 = v10;
    goto LABEL_16;
  }
  id v16 = [MEMORY[0x263EFF910] date];
  ASLoggingInitialize();
  id v17 = *MEMORY[0x263F23AA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AA8], OS_LOG_TYPE_DEFAULT))
  {
    int v21 = 138412546;
    id v22 = v9;
    __int16 v23 = 2112;
    id v24 = v16;
    _os_log_impl(&dword_2474C9000, v17, OS_LOG_TYPE_DEFAULT, "Fetched additional records successfully in zone %@, for date %@", (uint8_t *)&v21, 0x16u);
  }
  [a1[5] setFetchDate:v16 forRecordZoneID:v9];

LABEL_17:
}

void __165__ASCloudKitUtility__fetchChangesInZones_additionalZonesToFetch_fetchConfigurations_inDatabase_serverChangeTokenCache_priority_allowRetry_activity_group_completion___block_invoke_323(uint64_t a1, void *a2)
{
  uint64_t v65 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 112));

  if (WeakRetained)
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(NSObject **)(v5 + 8);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __165__ASCloudKitUtility__fetchChangesInZones_additionalZonesToFetch_fetchConfigurations_inDatabase_serverChangeTokenCache_priority_allowRetry_activity_group_completion___block_invoke_2_324;
    block[3] = &unk_265219038;
    block[4] = v5;
    objc_copyWeak(&v54, (id *)(a1 + 112));
    dispatch_async(v6, block);
    objc_destroyWeak(&v54);
  }
  ASLoggingInitialize();
  id v7 = (os_log_t *)MEMORY[0x263F23AA8];
  id v8 = (void *)*MEMORY[0x263F23AA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AA8], OS_LOG_TYPE_DEFAULT))
  {
    id v9 = *(void **)(a1 + 40);
    id v10 = v8;
    [v9 databaseScope];
    id v11 = CKDatabaseScopeString();
    uint64_t v12 = [*(id *)(a1 + 48) count];
    uint64_t v13 = [*(id *)(*(void *)(a1 + 32) + 24) containerIdentifier];
    *(_DWORD *)buf = 138543874;
    uint64_t v60 = (uint64_t)v11;
    __int16 v61 = 2048;
    uint64_t v62 = v12;
    __int16 v63 = 2114;
    id v64 = v13;
    _os_log_impl(&dword_2474C9000, v10, OS_LOG_TYPE_DEFAULT, "Finished fetching changes in database %{public}@, %lu records, %{public}@", buf, 0x20u);
  }
  if (![*(id *)(a1 + 56) count] || !*(unsigned char *)(a1 + 128))
  {
    ASLoggingInitialize();
    os_log_t v24 = *v7;
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v25 = *(void **)(a1 + 48);
      os_log_t v26 = v24;
      uint64_t v27 = [v25 count];
      *(_DWORD *)buf = 134217984;
      uint64_t v60 = v27;
      _os_log_impl(&dword_2474C9000, v26, OS_LOG_TYPE_DEFAULT, "Calling completion with %lu changed records", buf, 0xCu);
    }
    uint64_t v28 = [*(id *)(a1 + 40) databaseScope];
    id v29 = objc_alloc_init(MEMORY[0x263EFF9C0]);
    [v29 addObject:&unk_26FBA7EB0];
    if (v28 == 3) {
      [v29 addObject:&unk_26FBA7EC8];
    }
    id v30 = (void *)[v29 copy];

    id v31 = v3;
    id v23 = v30;
    int v32 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v31, "code"));
    int v33 = [v23 containsObject:v32];

    if (v33)
    {
    }
    else
    {
      if ([v31 code] != 2)
      {

LABEL_29:
        __int16 v34 = *(void (**)(void))(*(void *)(a1 + 104) + 16);
        goto LABEL_30;
      }
      id v48 = v3;
      uint64_t v35 = [v31 userInfo];
      __int16 v36 = [v35 objectForKeyedSubscript:*MEMORY[0x263EFD4C8]];

      long long v57 = 0u;
      long long v58 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      id v46 = v36;
      id v37 = [v36 allValues];
      uint64_t v38 = [v37 countByEnumeratingWithState:&v55 objects:buf count:16];
      if (v38)
      {
        uint64_t v39 = v38;
        uint64_t v40 = *(void *)v56;
        while (2)
        {
          for (uint64_t i = 0; i != v39; ++i)
          {
            if (*(void *)v56 != v40) {
              objc_enumerationMutation(v37);
            }
            id v42 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(*((void *)&v55 + 1) + 8 * i), "code"));
            int v43 = [v23 containsObject:v42];

            if (!v43)
            {

              id v3 = v48;
              goto LABEL_29;
            }
          }
          uint64_t v39 = [v37 countByEnumeratingWithState:&v55 objects:buf count:16];
          if (v39) {
            continue;
          }
          break;
        }
      }

      id v3 = v48;
    }
    __int16 v34 = *(void (**)(void))(*(void *)(a1 + 104) + 16);
LABEL_30:
    v34();
    goto LABEL_31;
  }
  id v47 = v3;
  ASLoggingInitialize();
  uint64_t v14 = *v7;
  if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2474C9000, v14, OS_LOG_TYPE_DEFAULT, "Some change tokens have expired, fetching again.", buf, 2u);
  }
  id v45 = *(void **)(a1 + 32);
  uint64_t v15 = *(void *)(a1 + 56);
  id v16 = [MEMORY[0x263EFFA08] set];
  uint64_t v17 = *(void *)(a1 + 40);
  uint64_t v18 = *(void *)(a1 + 64);
  uint64_t v19 = *(void *)(a1 + 72);
  uint64_t v20 = *(void *)(a1 + 120);
  uint64_t v21 = *(void *)(a1 + 80);
  uint64_t v22 = *(void *)(a1 + 88);
  v49[0] = MEMORY[0x263EF8330];
  v49[1] = 3221225472;
  v49[2] = __165__ASCloudKitUtility__fetchChangesInZones_additionalZonesToFetch_fetchConfigurations_inDatabase_serverChangeTokenCache_priority_allowRetry_activity_group_completion___block_invoke_325;
  v49[3] = &unk_265219060;
  id v52 = *(id *)(a1 + 104);
  id v50 = *(id *)(a1 + 48);
  id v51 = *(id *)(a1 + 96);
  LOBYTE(v44) = 0;
  [v45 _fetchChangesInZones:v15 additionalZonesToFetch:v16 fetchConfigurations:v18 inDatabase:v17 serverChangeTokenCache:v19 priority:v20 allowRetry:v44 activity:v21 group:v22 completion:v49];

  id v23 = v52;
  id v3 = v47;
LABEL_31:
}

void __165__ASCloudKitUtility__fetchChangesInZones_additionalZonesToFetch_fetchConfigurations_inDatabase_serverChangeTokenCache_priority_allowRetry_activity_group_completion___block_invoke_2_324(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 16);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [v1 removeObject:WeakRetained];
}

void __165__ASCloudKitUtility__fetchChangesInZones_additionalZonesToFetch_fetchConfigurations_inDatabase_serverChangeTokenCache_priority_allowRetry_activity_group_completion___block_invoke_325(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  uint64_t v9 = *(void *)(a1 + 48);
  id v10 = *(void **)(a1 + 32);
  id v11 = a5;
  id v12 = a3;
  id v14 = [v10 arrayByAddingObjectsFromArray:a4];
  uint64_t v13 = [*(id *)(a1 + 40) arrayByAddingObjectsFromArray:v11];

  (*(void (**)(uint64_t, uint64_t, id, id, void *))(v9 + 16))(v9, a2, v12, v14, v13);
}

uint64_t __165__ASCloudKitUtility__fetchChangesInZones_additionalZonesToFetch_fetchConfigurations_inDatabase_serverChangeTokenCache_priority_allowRetry_activity_group_completion___block_invoke_327(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) addObject:*(void *)(a1 + 40)];
}

- (void)_fetchChangesInDatabase:(id)a3 serverChangeTokenCache:(id)a4 priority:(int64_t)a5 activity:(id)a6 group:(id)a7 additionalZoneIDs:(id)a8 zoneIDsToSkip:(id)a9 fetchConfigurations:(id)a10 completion:(id)a11
{
  uint64_t v65 = *MEMORY[0x263EF8340];
  id v17 = a3;
  id v43 = a4;
  id v42 = a6;
  id v18 = a7;
  id v41 = a8;
  uint64_t v19 = (void *)a5;
  id v20 = a9;
  id v21 = a10;
  id v22 = a11;
  ASLoggingInitialize();
  id v23 = (void *)*MEMORY[0x263F23AA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AA8], OS_LOG_TYPE_DEFAULT))
  {
    os_log_t v24 = v23;
    [v17 databaseScope];
    uint64_t v25 = CKDatabaseScopeString();
    os_log_t v26 = [(CKContainer *)self->_container containerIdentifier];
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v25;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v26;
    _os_log_impl(&dword_2474C9000, v24, OS_LOG_TYPE_DEFAULT, "Fetching changes in database %{public}@, %{public}@", buf, 0x16u);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  uint64_t v62 = __Block_byref_object_copy__15;
  __int16 v63 = __Block_byref_object_dispose__15;
  id v64 = [MEMORY[0x263EFFA08] set];
  id v27 = objc_alloc(MEMORY[0x263EFD698]);
  uint64_t v28 = [v43 serverChangeTokenForDatabase:v17];
  id v29 = (void *)[v27 initWithPreviousServerChangeToken:v28];

  objc_initWeak(&location, v29);
  [v29 setFetchAllChanges:1];
  [v29 setGroup:v18];
  v57[0] = MEMORY[0x263EF8330];
  v57[1] = 3221225472;
  v57[2] = __155__ASCloudKitUtility__fetchChangesInDatabase_serverChangeTokenCache_priority_activity_group_additionalZoneIDs_zoneIDsToSkip_fetchConfigurations_completion___block_invoke;
  v57[3] = &unk_2652190B0;
  id v40 = v20;
  id v58 = v40;
  v59 = buf;
  [v29 setRecordZoneWithIDChangedBlock:v57];
  v47[0] = MEMORY[0x263EF8330];
  v47[1] = 3221225472;
  v47[2] = __155__ASCloudKitUtility__fetchChangesInDatabase_serverChangeTokenCache_priority_activity_group_additionalZoneIDs_zoneIDsToSkip_fetchConfigurations_completion___block_invoke_329;
  v47[3] = &unk_2652190D8;
  objc_copyWeak(v56, &location);
  v47[4] = self;
  id v44 = v43;
  id v48 = v44;
  id v30 = v17;
  id v49 = v30;
  long long v55 = buf;
  id v31 = v22;
  id v32 = v41;
  id v50 = v32;
  id v33 = v21;
  id v51 = v33;
  v56[1] = v19;
  id v34 = v42;
  id v52 = v34;
  id v35 = v18;
  id v53 = v35;
  id v36 = v31;
  id v54 = v36;
  [v29 setFetchDatabaseChangesCompletionBlock:v47];
  [v29 setQualityOfService:17];
  id v37 = _ASOperationConfigurationForPriority((uint64_t)v19, v34);
  [v29 setConfiguration:v37];

  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __155__ASCloudKitUtility__fetchChangesInDatabase_serverChangeTokenCache_priority_activity_group_additionalZoneIDs_zoneIDsToSkip_fetchConfigurations_completion___block_invoke_331;
  block[3] = &unk_2652157C8;
  block[4] = self;
  id v39 = v29;
  id v46 = v39;
  dispatch_async(serialQueue, block);
  [v30 addOperation:v39];

  objc_destroyWeak(v56);
  objc_destroyWeak(&location);

  _Block_object_dispose(buf, 8);
}

void __155__ASCloudKitUtility__fetchChangesInDatabase_serverChangeTokenCache_priority_activity_group_additionalZoneIDs_zoneIDsToSkip_fetchConfigurations_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = [v3 zoneName];
  char v5 = [v4 isEqualToString:@"ActivityDataZone"];

  if ((v5 & 1) != 0
    || ([v3 zoneName],
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        char v7 = [v6 isEqualToString:@"RelationshipZone"],
        v6,
        (v7 & 1) != 0))
  {

    goto LABEL_4;
  }
  if (ASSecureCloudEnabled())
  {
    id v16 = [v3 zoneName];
    int v17 = [v16 hasPrefix:@"RelationshipZone"];

    if (v17)
    {
LABEL_4:
      if ([*(id *)(a1 + 32) containsObject:v3])
      {
        ASLoggingInitialize();
        id v8 = *MEMORY[0x263F23AA8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AA8], OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v9 = *(void *)(a1 + 32);
          int v19 = 138412546;
          id v20 = v3;
          __int16 v21 = 2112;
          uint64_t v22 = v9;
          id v10 = "Skipping zone with changes %@, full list of zone IDs to skip %@";
          id v11 = v8;
          uint32_t v12 = 22;
LABEL_14:
          _os_log_impl(&dword_2474C9000, v11, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v19, v12);
          goto LABEL_15;
        }
      }
      else
      {
        uint64_t v13 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setByAddingObject:v3];
        uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 8);
        uint64_t v15 = *(void **)(v14 + 40);
        *(void *)(v14 + 40) = v13;
      }
      goto LABEL_15;
    }
  }
  else
  {
  }
  ASLoggingInitialize();
  id v18 = *MEMORY[0x263F23AA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AA8], OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 138543362;
    id v20 = v3;
    id v10 = "Ignoring changes in zone with ID: %{public}@";
    id v11 = v18;
    uint32_t v12 = 12;
    goto LABEL_14;
  }
LABEL_15:
}

void __155__ASCloudKitUtility__fetchChangesInDatabase_serverChangeTokenCache_priority_activity_group_additionalZoneIDs_zoneIDsToSkip_fetchConfigurations_completion___block_invoke_329(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 104));

  if (WeakRetained)
  {
    uint64_t v9 = *(void *)(a1 + 32);
    id v10 = *(NSObject **)(v9 + 8);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __155__ASCloudKitUtility__fetchChangesInDatabase_serverChangeTokenCache_priority_activity_group_additionalZoneIDs_zoneIDsToSkip_fetchConfigurations_completion___block_invoke_2;
    block[3] = &unk_265219038;
    block[4] = v9;
    objc_copyWeak(&v23, (id *)(a1 + 104));
    dispatch_async(v10, block);
    objc_destroyWeak(&v23);
  }
  if (v7)
  {
    ASLoggingInitialize();
    id v11 = (void *)*MEMORY[0x263F23AA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AA8], OS_LOG_TYPE_ERROR)) {
      __155__ASCloudKitUtility__fetchChangesInDatabase_serverChangeTokenCache_priority_activity_group_additionalZoneIDs_zoneIDsToSkip_fetchConfigurations_completion___block_invoke_329_cold_1(a1, v11, (uint64_t)v7);
    }
    [*(id *)(a1 + 40) setServerChangeToken:0 forDatabase:*(void *)(a1 + 48)];
    uint32_t v12 = *(void (**)(void))(*(void *)(a1 + 88) + 16);
  }
  else
  {
    [*(id *)(a1 + 40) setServerChangeToken:v6 forDatabase:*(void *)(a1 + 48)];
    if ([*(id *)(*(void *)(*(void *)(a1 + 96) + 8) + 40) count]
      || [*(id *)(a1 + 56) count])
    {
      uint64_t v13 = *(void **)(a1 + 32);
      uint64_t v14 = *(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 40);
      uint64_t v15 = [MEMORY[0x263EFFA08] setWithArray:*(void *)(a1 + 56)];
      LOBYTE(v21) = 1;
      [v13 _fetchChangesInZones:v14 additionalZonesToFetch:v15 fetchConfigurations:*(void *)(a1 + 64) inDatabase:*(void *)(a1 + 48) serverChangeTokenCache:*(void *)(a1 + 40) priority:*(void *)(a1 + 112) allowRetry:v21 activity:*(void *)(a1 + 72) group:*(void *)(a1 + 80) completion:*(void *)(a1 + 88)];

      goto LABEL_11;
    }
    ASLoggingInitialize();
    id v16 = (void *)*MEMORY[0x263F23AA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AA8], OS_LOG_TYPE_DEFAULT))
    {
      int v17 = *(void **)(a1 + 48);
      id v18 = v16;
      [v17 databaseScope];
      int v19 = CKDatabaseScopeString();
      id v20 = [*(id *)(*(void *)(a1 + 32) + 24) containerIdentifier];
      *(_DWORD *)buf = 138543618;
      uint64_t v25 = v19;
      __int16 v26 = 2114;
      id v27 = v20;
      _os_log_impl(&dword_2474C9000, v18, OS_LOG_TYPE_DEFAULT, "No changes in database %{public}@, not fetching. %{public}@", buf, 0x16u);
    }
    uint32_t v12 = *(void (**)(void))(*(void *)(a1 + 88) + 16);
  }
  v12();
LABEL_11:
}

void __155__ASCloudKitUtility__fetchChangesInDatabase_serverChangeTokenCache_priority_activity_group_additionalZoneIDs_zoneIDsToSkip_fetchConfigurations_completion___block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 16);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [v1 removeObject:WeakRetained];
}

uint64_t __155__ASCloudKitUtility__fetchChangesInDatabase_serverChangeTokenCache_priority_activity_group_additionalZoneIDs_zoneIDsToSkip_fetchConfigurations_completion___block_invoke_331(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) addObject:*(void *)(a1 + 40)];
}

- (void)_retrieveZone:(id)a3 database:(id)a4 completion:(id)a5
{
  v23[1] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a5;
  uint64_t v9 = (objc_class *)MEMORY[0x263EFD6D0];
  id v10 = a4;
  id v11 = [v9 alloc];
  v23[0] = v7;
  uint32_t v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:1];
  uint64_t v13 = (void *)[v11 initWithRecordZoneIDs:v12];

  uint64_t v17 = MEMORY[0x263EF8330];
  uint64_t v18 = 3221225472;
  int v19 = __55__ASCloudKitUtility__retrieveZone_database_completion___block_invoke;
  id v20 = &unk_265218E58;
  id v21 = v7;
  id v22 = v8;
  id v14 = v8;
  id v15 = v7;
  [v13 setFetchRecordZonesCompletionBlock:&v17];
  objc_msgSend(v13, "setQualityOfService:", 17, v17, v18, v19, v20);
  id v16 = _ASOperationConfigurationForPriority(2, 0);
  [v13 setConfiguration:v16];

  [v10 addOperation:v13];
}

void __55__ASCloudKitUtility__retrieveZone_database_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  ASLoggingInitialize();
  BOOL v7 = os_log_type_enabled((os_log_t)*MEMORY[0x263F23AA8], OS_LOG_TYPE_ERROR);
  if (v6)
  {
    if (v7) {
      __55__ASCloudKitUtility__retrieveZone_database_completion___block_invoke_cold_2();
    }
  }
  else if (v7)
  {
    __55__ASCloudKitUtility__retrieveZone_database_completion___block_invoke_cold_1();
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)retrieveZone:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(ASCloudKitUtility *)self container];
  id v8 = [v9 privateCloudDatabase];
  [(ASCloudKitUtility *)self _retrieveZone:v7 database:v8 completion:v6];
}

- (void)fetchChangesInPrivateDatabaseWithServerChangeTokenCache:(id)a3 priority:(int64_t)a4 activity:(id)a5 group:(id)a6 completion:(id)a7
{
}

- (void)fetchChangesInSharedDatabaseWithServerChangeTokenCache:(id)a3 priority:(int64_t)a4 activity:(id)a5 group:(id)a6 completion:(id)a7
{
}

- (void)fetchChangesInPrivateDatabaseWithServerChangeTokenCache:(id)a3 priority:(int64_t)a4 activity:(id)a5 group:(id)a6 additionalZoneIDs:(id)a7 zoneIDsToSkip:(id)a8 fetchConfigurations:(id)a9 completion:(id)a10
{
  id v17 = a10;
  id v18 = a9;
  id v19 = a8;
  id v20 = a7;
  id v21 = a6;
  id v22 = a5;
  id v23 = a3;
  id v25 = [(ASCloudKitUtility *)self container];
  os_log_t v24 = [v25 privateCloudDatabase];
  [(ASCloudKitUtility *)self _fetchChangesInDatabase:v24 serverChangeTokenCache:v23 priority:a4 activity:v22 group:v21 additionalZoneIDs:v20 zoneIDsToSkip:v19 fetchConfigurations:v18 completion:v17];
}

- (void)fetchChangesInSharedDatabaseWithServerChangeTokenCache:(id)a3 priority:(int64_t)a4 activity:(id)a5 group:(id)a6 additionalZoneIDs:(id)a7 zoneIDsToSkip:(id)a8 fetchConfigurations:(id)a9 completion:(id)a10
{
  id v17 = a10;
  id v18 = a9;
  id v19 = a8;
  id v20 = a7;
  id v21 = a6;
  id v22 = a5;
  id v23 = a3;
  id v25 = [(ASCloudKitUtility *)self container];
  os_log_t v24 = [v25 sharedCloudDatabase];
  [(ASCloudKitUtility *)self _fetchChangesInDatabase:v24 serverChangeTokenCache:v23 priority:a4 activity:v22 group:v21 additionalZoneIDs:v20 zoneIDsToSkip:v19 fetchConfigurations:v18 completion:v17];
}

- (CKContainer)container
{
  return self->_container;
}

- (void)setContainer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_container, 0);
  objc_storeStrong((id *)&self->_queue_executingFetchOperations, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
}

- (void)init
{
  *(_WORD *)id v3 = 0;
  OUTLINED_FUNCTION_4_1(&dword_2474C9000, a1, a3, "Use initWithContainer", v3);
}

void __91__ASCloudKitUtility_createRecordZonesWithIDs_priority_useZoneWideSharing_group_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_8(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_2_0(&dword_2474C9000, v0, v1, "Failed to create record zones with IDs %@ with error: %{public}@");
}

- (void)createShareAndAssociatedZoneWithShareRecordID:(uint64_t)a3 rootRecord:otherRecordsToSave:completion:.cold.1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  *(_WORD *)id v3 = 0;
  OUTLINED_FUNCTION_4_1(&dword_2474C9000, a1, a3, "Cannot create a share with a root record in a different record zone.", v3);
}

void __75__ASCloudKitUtility_fetchShareWithShareRecordID_activity_group_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_8(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_2_0(&dword_2474C9000, v0, v1, "Failed to fetch share with ID %@, error: %{public}@");
}

void __54__ASCloudKitUtility__acceptShareMetadatas_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_0(&dword_2474C9000, v0, v1, "Failed to accept share with URL %@ with error: %{public}@");
}

void __54__ASCloudKitUtility__acceptShareMetadatas_completion___block_invoke_299_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2474C9000, v0, v1, "Failed to accept shares with error: %{public}@", v2, v3, v4, v5, v6);
}

void __78__ASCloudKitUtility__acceptSharesWithURLs_operation_cloudKitGroup_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2474C9000, v0, v1, "Error fetching share metadata: %{public}@", v2, v3, v4, v5, v6);
}

void __78__ASCloudKitUtility__acceptSharesWithURLs_operation_cloudKitGroup_completion___block_invoke_303_cold_1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  *(_WORD *)uint64_t v3 = 0;
  OUTLINED_FUNCTION_4_1(&dword_2474C9000, a1, a3, "Incorrect number of metadatas fetched; not accepting shares.", v3);
}

void __78__ASCloudKitUtility__acceptSharesWithURLs_operation_cloudKitGroup_completion___block_invoke_303_cold_2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2474C9000, v0, v1, "Fetching share metadata failed with error %{public}@; not accepting shares",
    v2,
    v3,
    v4,
    v5,
    v6);
}

- (void)fetchShareParticipantForIdentifier:group:completion:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2474C9000, v0, v1, "Destination is neither a phone number or email address %@", v2, v3, v4, v5, v6);
}

void __81__ASCloudKitUtility_addParticipantWithCloudKitAddress_toShares_group_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_2_0(&dword_2474C9000, v0, v1, "Adding participant %@ failed: failed to fetch user identity with error: %{public}@");
}

void __81__ASCloudKitUtility_addParticipantWithCloudKitAddress_toShares_group_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_8(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_2_0(&dword_2474C9000, v0, v1, "Adding participant %@ failed: saving shares failed with error: %{public}@");
}

- (void)addParticipant:(NSObject *)a3 toShares:group:completion:.cold.1(uint8_t *a1, unsigned char *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_4_1(&dword_2474C9000, a3, (uint64_t)a3, "Trying to add owner of the share, skipping.", a1);
}

void __86__ASCloudKitUtility_removeParticipantWithCloudKitAddress_fromShares_group_completion___block_invoke_cold_1(uint8_t *a1, unsigned char *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_4_1(&dword_2474C9000, a3, (uint64_t)a3, "Trying to remove owner of the share, skipping.", a1);
}

void __86__ASCloudKitUtility_removeParticipantWithCloudKitAddress_fromShares_group_completion___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_2_0(&dword_2474C9000, v0, v1, "Removing participant %@ failed: failed to fetch user identity with error: %{public}@");
}

void __86__ASCloudKitUtility_removeParticipantWithCloudKitAddress_fromShares_group_completion___block_invoke_310_cold_1()
{
  OUTLINED_FUNCTION_8(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_2_0(&dword_2474C9000, v0, v1, "Removing participant %@ failed: saving shares failed with error: %{public}@");
}

void __165__ASCloudKitUtility__fetchChangesInZones_additionalZonesToFetch_fetchConfigurations_inDatabase_serverChangeTokenCache_priority_allowRetry_activity_group_completion___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_0(&dword_2474C9000, v0, v1, "Failed to fetch changes in zone %@ with error %{public}@");
}

void __155__ASCloudKitUtility__fetchChangesInDatabase_serverChangeTokenCache_priority_activity_group_additionalZoneIDs_zoneIDsToSkip_fetchConfigurations_completion___block_invoke_329_cold_1(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v4 = *(void **)(a1 + 48);
  uint64_t v5 = a2;
  [v4 databaseScope];
  uint8_t v6 = CKDatabaseScopeString();
  int v7 = 138543618;
  id v8 = v6;
  __int16 v9 = 2114;
  uint64_t v10 = a3;
  _os_log_error_impl(&dword_2474C9000, v5, OS_LOG_TYPE_ERROR, "Failed to fetch changed record zones in database %{public}@ with error %{public}@", (uint8_t *)&v7, 0x16u);
}

void __55__ASCloudKitUtility__retrieveZone_database_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2474C9000, v0, v1, "Retrieved zone %@{public}", v2, v3, v4, v5, v6);
}

void __55__ASCloudKitUtility__retrieveZone_database_completion___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_8(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_2_0(&dword_2474C9000, v0, v1, "Failed to retrieve zone %@{public} with error %{public}@");
}

@end