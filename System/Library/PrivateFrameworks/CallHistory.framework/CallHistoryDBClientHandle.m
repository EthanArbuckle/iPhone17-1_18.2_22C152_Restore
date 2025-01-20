@interface CallHistoryDBClientHandle
+ (id)createForClient;
+ (id)createForServer;
- (BOOL)createCallRecord:(id)a3;
- (BOOL)createCallRecord:(id)a3 error:(id *)a4;
- (BOOL)createCallRecord:(id)a3 error:(id *)a4 save:(BOOL)a5;
- (BOOL)createCallRecords:(id)a3;
- (BOOL)createCallRecords:(id)a3 error:(id *)a4;
- (BOOL)deleteAll;
- (BOOL)deleteAll:(id *)a3;
- (BOOL)deleteObjectWithUniqueId:(id)a3;
- (BOOL)deleteObjectWithUniqueId:(id)a3 error:(id *)a4;
- (BOOL)deleteObjectWithUniqueId:(id)a3 error:(id *)a4 save:(BOOL)a5;
- (BOOL)deleteObjectsWithUniqueIds:(id)a3;
- (BOOL)deleteObjectsWithUniqueIds:(id)a3 error:(id *)a4;
- (BOOL)moveCallRecordsFromDatabaseAtURL:(id)a3;
- (BOOL)resetAllTimers;
- (BOOL)saveDatabase:(id *)a3;
- (BOOL)updateCallRecord_sync:(id)a3 withCall:(id)a4;
- (BOOL)updateCallRecord_sync:(id)a3 withChangeDict:(id)a4;
- (BOOL)willHandleNotification_sync:(id)a3;
- (CHNotifyObserver)callsDidChangeNotifyObserver;
- (CallDBManager)manager;
- (CallHistoryDBHandle)dbStoreHandle;
- (NSObject)observerCallTimersRef;
- (id)convertToCHRecentCalls_sync:(id)a3;
- (id)convertToCHRecentCalls_sync:(id)a3 limit:(unint64_t)a4;
- (id)fetchAll;
- (id)fetchAllNoLimit;
- (id)fetchAllObjectsWithUniqueId:(id)a3;
- (id)fetchCallIdentifiersWithPredicate:(id)a3 sortDescriptors:(id)a4 limit:(unint64_t)a5 offset:(unint64_t)a6 batchSize:(unint64_t)a7;
- (id)fetchCallsWithPredicate:(id)a3 sortDescriptors:(id)a4 limit:(unint64_t)a5 offset:(unint64_t)a6 batchSize:(unint64_t)a7;
- (id)fetchCoalescedCallsWithPredicate:(id)a3 sortDescriptors:(id)a4 limit:(unint64_t)a5 offset:(unint64_t)a6 batchSize:(unint64_t)a7;
- (id)fetchObjectWithUniqueId:(id)a3;
- (id)fetchObjectsWithPredicate:(id)a3;
- (id)fetchObjectsWithUniqueIds:(id)a3;
- (id)fetchWithCallTypes:(unsigned int)a3;
- (id)init:(BOOL)a3;
- (id)timerIncoming;
- (id)timerLastReset;
- (id)timerLifetime;
- (id)timerOutgoing;
- (id)updateAllCallRecords:(id)a3;
- (id)updateAllCallRecords:(id)a3 error:(id *)a4;
- (id)updateAllCallRecords_sync:(id)a3 error:(id *)a4;
- (id)updateCallRecords:(id)a3;
- (id)updateCallRecords:(id)a3 error:(id *)a4;
- (id)updateCallRecords:(id)a3 error:(id *)a4 save:(BOOL)a5;
- (id)updateCallRecordsWithCalls:(id)a3 error:(id *)a4 save:(BOOL)a5;
- (id)updateCallRecordsWithCalls_sync:(id)a3 error:(id *)a4 save:(BOOL)a5;
- (id)updateCallRecords_sync:(id)a3 error:(id *)a4 save:(BOOL)a5;
- (id)updateCallsWithPredicate:(id)a3 propertiesToUpdate:(id)a4 error:(id *)a5;
- (int64_t)deleteCallsWithPredicate:(id)a3;
- (unint64_t)fetchCallCountWithPredicate:(id)a3 sortDescriptors:(id)a4;
- (unint64_t)fetchCoalescedCallCountWithPredicate:(id)a3 sortDescriptors:(id)a4;
- (unsigned)getCallStatus_sync:(id)a3 isOriginated:(id)a4 isAnswered:(id)a5;
- (void)dealloc;
- (void)handleCallRecordSave_sync;
- (void)handleCallTimersSave_sync:(id)a3;
- (void)parseCallStatus_sync:(unsigned int)a3 isAnswered:(BOOL *)a4 isOriginated:(BOOL *)a5;
- (void)registerForNotifications;
- (void)resetTimers;
- (void)setStoreObject_sync:(id)a3 withClientObject:(id)a4;
- (void)unRegisterForNotifications;
@end

@implementation CallHistoryDBClientHandle

void __79__CallHistoryDBClientHandle_updateCallsWithPredicate_propertiesToUpdate_error___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1BA9CD070]();
  v3 = [*(id *)(*(void *)(a1 + 32) + 24) updateManagedCallsWithPredicate:*(void *)(a1 + 40) propertiesToUpdate:*(void *)(a1 + 48)];
  if (v3)
  {
    ct_green_tea_logger_create_static();
    v4 = getCTGreenTeaOsLogHandle();
    v5 = v4;
    if (v4 && os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      uint64_t v6 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138412290;
      uint64_t v15 = v6;
      _os_log_impl(&dword_1B8E4A000, v5, OS_LOG_TYPE_INFO, "Modify: %@", buf, 0xCu);
    }

    v7 = *(void **)(*(void *)(a1 + 32) + 24);
    uint64_t v8 = *(void *)(*(void *)(a1 + 56) + 8);
    id obj = *(id *)(v8 + 40);
    int v9 = [v7 save:&obj];
    objc_storeStrong((id *)(v8 + 40), obj);
    if (v9)
    {
      uint64_t v10 = objc_msgSend(*(id *)(a1 + 32), "convertToCHRecentCalls_sync:", v3);
      uint64_t v11 = *(void *)(*(void *)(a1 + 64) + 8);
      v12 = *(void **)(v11 + 40);
      *(void *)(v11 + 40) = v10;
    }
  }
}

void __92__CallHistoryDBClientHandle_fetchCallsWithPredicate_sortDescriptors_limit_offset_batchSize___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1BA9CD070]();
  v3 = [*(id *)(*(void *)(a1 + 32) + 24) fetchManagedCallsWithPredicate:*(void *)(a1 + 40) sortDescriptors:*(void *)(a1 + 48) limit:*(void *)(a1 + 64) offset:*(void *)(a1 + 72) batchSize:*(void *)(a1 + 80)];
  if (v3)
  {
    uint64_t v4 = objc_msgSend(*(id *)(a1 + 32), "convertToCHRecentCalls_sync:", v3);
    uint64_t v5 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;
  }
}

- (id)convertToCHRecentCalls_sync:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "chRecentCall", (void)v12);
        [v4 addObject:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

uint64_t __73__CallHistoryDBClientHandle_fetchCallCountWithPredicate_sortDescriptors___block_invoke(void *a1)
{
  uint64_t result = [*(id *)(a1[4] + 24) fetchManagedCallCountWithPredicate:a1[5] sortDescriptors:a1[6]];
  *(void *)(*(void *)(a1[7] + 8) + 24) = result;
  return result;
}

+ (id)createForClient
{
  id v2 = [[CallHistoryDBClientHandle alloc] init:1];
  return v2;
}

- (unint64_t)fetchCallCountWithPredicate:(id)a3 sortDescriptors:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000;
  uint64_t v19 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __73__CallHistoryDBClientHandle_fetchCallCountWithPredicate_sortDescriptors___block_invoke;
  v12[3] = &unk_1E61C7D00;
  long long v15 = &v16;
  v12[4] = self;
  id v8 = v6;
  id v13 = v8;
  id v9 = v7;
  id v14 = v9;
  [(CHSynchronizedLoggable *)self executeSync:v12];
  unint64_t v10 = v17[3];

  _Block_object_dispose(&v16, 8);
  return v10;
}

- (id)fetchCallsWithPredicate:(id)a3 sortDescriptors:(id)a4 limit:(unint64_t)a5 offset:(unint64_t)a6 batchSize:(unint64_t)a7
{
  id v12 = a3;
  id v13 = a4;
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__2;
  v29 = __Block_byref_object_dispose__2;
  id v30 = 0;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __92__CallHistoryDBClientHandle_fetchCallsWithPredicate_sortDescriptors_limit_offset_batchSize___block_invoke;
  v18[3] = &unk_1E61C7D28;
  v18[4] = self;
  id v14 = v12;
  id v19 = v14;
  id v15 = v13;
  unint64_t v22 = a5;
  unint64_t v23 = a6;
  unint64_t v24 = a7;
  id v20 = v15;
  v21 = &v25;
  [(CHSynchronizedLoggable *)self executeSync:v18];
  id v16 = (id)v26[5];

  _Block_object_dispose(&v25, 8);
  return v16;
}

- (id)init:(BOOL)a3
{
  v21.receiver = self;
  v21.super_class = (Class)CallHistoryDBClientHandle;
  id v4 = [(CHSynchronizedLoggable *)&v21 initWithName:"ch.clientdbhandle"];
  if (v4)
  {
    objc_initWeak(&location, v4);
    id v5 = [CHNotifyObserver alloc];
    id v6 = [NSString stringWithUTF8String:"com.apple.callhistory.notification.calls-changed"];
    id v7 = [(CHSynchronizedLoggable *)v4 queue];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __34__CallHistoryDBClientHandle_init___block_invoke;
    v18[3] = &unk_1E61C7610;
    objc_copyWeak(&v19, &location);
    uint64_t v8 = [(CHNotifyObserver *)v5 initWithName:v6 queue:v7 callback:v18];
    callsDidChangeNotifyObserver = v4->_callsDidChangeNotifyObserver;
    v4->_callsDidChangeNotifyObserver = (CHNotifyObserver *)v8;

    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    id v14 = __34__CallHistoryDBClientHandle_init___block_invoke_2;
    id v15 = &unk_1E61C7CB0;
    BOOL v17 = a3;
    unint64_t v10 = v4;
    id v16 = v10;
    [(CHSynchronizedLoggable *)v10 execute:&v12];
    [(CallHistoryDBClientHandle *)v10 registerForNotifications];

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }
  return v4;
}

- (void)registerForNotifications
{
  objc_initWeak(&location, self);
  id v3 = [MEMORY[0x1E4F28C40] defaultCenter];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __53__CallHistoryDBClientHandle_registerForNotifications__block_invoke;
  v6[3] = &unk_1E61C7CD8;
  objc_copyWeak(&v7, &location);
  id v4 = [v3 addObserverForName:@"kCallHistoryTimersDistributedSaveNotification" object:0 queue:0 usingBlock:v6];
  observerCallTimersRef = self->_observerCallTimersRef;
  self->_observerCallTimersRef = v4;

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __34__CallHistoryDBClientHandle_init___block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40)) {
    +[CallHistoryDBHandle createForClient];
  }
  else {
  uint64_t v2 = +[CallHistoryDBHandle createForServer];
  }
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 24);
  *(void *)(v3 + 24) = v2;

  id v5 = *(void **)(a1 + 32);
  id v6 = (void *)v5[3];
  id v7 = [v5 queue];
  [v6 registerForNotifications:v7];

  id v8 = [*(id *)(*(void *)(a1 + 32) + 24) callDBManager];
  [v8 createDataStore];
}

- (id)updateCallsWithPredicate:(id)a3 propertiesToUpdate:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v26 = 0;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__2;
  id v30 = __Block_byref_object_dispose__2;
  id v31 = 0;
  uint64_t v20 = 0;
  objc_super v21 = &v20;
  uint64_t v22 = 0x3032000000;
  unint64_t v23 = __Block_byref_object_copy__2;
  unint64_t v24 = __Block_byref_object_dispose__2;
  id v25 = 0;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __79__CallHistoryDBClientHandle_updateCallsWithPredicate_propertiesToUpdate_error___block_invoke;
  v15[3] = &unk_1E61C7DA0;
  v15[4] = self;
  id v10 = v8;
  id v16 = v10;
  id v11 = v9;
  id v17 = v11;
  uint64_t v18 = &v20;
  id v19 = &v26;
  [(CHSynchronizedLoggable *)self executeSync:v15];
  if (a5)
  {
    uint64_t v12 = (void *)v21[5];
    if (v12) {
      *a5 = v12;
    }
  }
  id v13 = (id)v27[5];

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  return v13;
}

- (void)parseCallStatus_sync:(unsigned int)a3 isAnswered:(BOOL *)a4 isOriginated:(BOOL *)a5
{
  if (a4 && a5)
  {
    *a4 = 0;
    *a5 = 0;
    switch(a3)
    {
      case 1u:
LABEL_12:
        *a4 = 1;
        return;
      case 2u:
        a4 = a5;
        goto LABEL_12;
      case 4u:
        goto LABEL_12;
    }
    BOOL v5 = a3 != 8 && a3 == 16;
    a4 = a5;
    if (v5) {
      goto LABEL_12;
    }
  }
}

- (unsigned)getCallStatus_sync:(id)a3 isOriginated:(id)a4 isAnswered:(id)a5
{
  if (!a3 || !a4 || !a5) {
    return 0;
  }
  id v7 = a4;
  id v8 = a3;
  uint64_t v9 = [a5 BOOLValue];
  uint64_t v10 = [v7 BOOLValue];

  [v8 doubleValue];
  double v12 = v11;

  return +[CHManager CHCallStatusForCallWithDuration:v10 isOriginated:v9 isAnswered:v12];
}

- (void)setStoreObject_sync:(id)a3 withClientObject:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  __int16 v50 = 0;
  -[CallHistoryDBClientHandle parseCallStatus_sync:isAnswered:isOriginated:](self, "parseCallStatus_sync:isAnswered:isOriginated:", [v7 callStatus], (char *)&v50 + 1, &v50);
  id v8 = [NSNumber numberWithBool:HIBYTE(v50)];
  [v6 setAnswered:v8];

  uint64_t v9 = [v7 date];
  [v6 setDate:v9];

  uint64_t v10 = [v7 disconnectedCause];
  objc_msgSend(v6, "setDisconnected_cause:", v10);

  double v11 = NSNumber;
  [v7 duration];
  double v12 = objc_msgSend(v11, "numberWithDouble:");
  [v6 setDuration:v12];

  id v13 = [v7 bytesOfDataUsed];
  objc_msgSend(v6, "setFace_time_data:", v13);

  id v14 = [v7 filteredOutReason];
  objc_msgSend(v6, "setFiltered_out_reason:", v14);

  id v15 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v7, "handleType"));
  objc_msgSend(v6, "setHandle_type:", v15);

  id v16 = [v7 imageURL];
  [v6 setImageURL:v16];

  id v17 = [v7 isoCountryCode];
  objc_msgSend(v6, "setIso_country_code:", v17);

  uint64_t v18 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v7, "junkConfidence"));
  [v6 setJunkConfidence:v18];

  id v19 = [v7 junkIdentificationCategory];
  [v6 setJunkIdentificationCategory:v19];

  uint64_t v20 = [v7 localParticipantUUID];
  [v6 setLocalParticipantUUID:v20];

  objc_super v21 = [v7 name];
  [v6 setName:v21];

  uint64_t v22 = objc_msgSend(NSNumber, "numberWithShort:", (__int16)objc_msgSend(v7, "callerIdAvailability"));
  objc_msgSend(v6, "setNumber_availability:", v22);

  unint64_t v23 = [NSNumber numberWithBool:v50];
  [v6 setOriginated:v23];

  unint64_t v24 = [v7 outgoingLocalParticipantUUID];
  [v6 setOutgoingLocalParticipantUUID:v24];

  id v25 = [v7 participantGroupUUID];
  [v6 setParticipantGroupUUID:v25];

  uint64_t v26 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v7, "read"));
  [v6 setRead:v26];

  uint64_t v27 = [v7 serviceProvider];
  objc_msgSend(v6, "setService_provider:", v27);

  uint64_t v28 = [v7 uniqueId];
  objc_msgSend(v6, "setUnique_id:", v28);

  v29 = [v7 conversationID];
  [v6 setConversationID:v29];

  id v30 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v7, "verificationStatus"));
  [v6 setVerificationStatus:v30];

  id v31 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v7, "autoAnsweredReason"));
  [v6 setAutoAnsweredReason:v31];

  objc_msgSend(v6, "setUsedEmergencyVideoStreaming:", objc_msgSend(v7, "usedEmergencyVideoStreaming"));
  objc_msgSend(v6, "setWasEmergencyCall:", objc_msgSend(v7, "wasEmergencyCall"));
  v32 = [v7 blockedByExtension];
  [v6 setBlockedByExtension:v32];

  v33 = [v7 blockedByExtensionName];
  [v6 setBlockedByExtensionName:v33];

  v34 = [v7 identityExtension];
  [v6 setIdentityExtension:v34];

  v35 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v7, "callDirectoryIdentityType"));
  [v6 setCallDirectoryIdentityType:v35];

  v36 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v7, "screenSharingType"));
  [v6 setScreenSharingType:v36];

  v37 = [v6 managedObjectContext];
  v38 = [v7 initiator];

  if (v38 && v37)
  {
    v39 = [v7 initiator];
    v40 = +[CHManagedHandle managedHandleForHandle:v39 inManagedObjectContext:v37];
    [v6 setInitiator:v40];
  }
  v41 = [v7 remoteParticipantHandles];

  if (v41 && v37)
  {
    v42 = [v7 remoteParticipantHandles];
    v43 = +[CHManagedHandle managedHandlesForHandles:v42 inManagedObjectContext:v37];
    [v6 setRemoteParticipantHandles:v43];
  }
  v44 = [v7 emergencyMediaItems];

  if (v44 && v37)
  {
    v45 = [v7 emergencyMediaItems];
    v46 = +[EmergencyMediaItem managedEmergencyMediaItemsForEmergencyMediaItems:v45 inManagedObjectContext:v37];
    [v6 setEmergencyMediaItems:v46];
  }
  v47 = [v7 callerId];
  [v6 setAddress:v47];

  v48 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v7, "callCategory"));
  objc_msgSend(v6, "setCall_category:", v48);

  v49 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v7, "callType"));
  [v6 setCalltype:v49];
}

- (id)convertToCHRecentCalls_sync:(id)a3 limit:(unint64_t)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v22 = (id)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:a4];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v23 objects:v27 count:16];
  id obj = v6;
  if (v7)
  {
    uint64_t v8 = v7;
    id v6 = 0;
    uint64_t v9 = *(void *)v24;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        double v11 = v6;
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(obj);
        }
        double v12 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        id v13 = (void *)MEMORY[0x1BA9CD070]();
        id v14 = [v12 chRecentCall];
        id v15 = v14;
        if (v11)
        {
          id v16 = [v11 coalescedCallWithCall:v14 usingStrategy:@"kCHCoalescingStrategyRecents"];
        }
        else
        {
          id v16 = v14;
        }
        id v17 = v16;
        uint64_t v18 = v16;
        if (!v16)
        {
          [v22 addObject:v11];
          uint64_t v18 = v15;
          if (a4)
          {
            uint64_t v19 = [v22 count];
            uint64_t v18 = v15;
            if (v19 == a4)
            {

              id v6 = obj;
              goto LABEL_17;
            }
          }
        }
        id v6 = v18;
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v8) {
        continue;
      }
      break;
    }

    if (v6)
    {
      [v22 addObject:v6];
      goto LABEL_17;
    }
  }
  else
  {
LABEL_17:
  }
  return v22;
}

+ (id)createForServer
{
  id v2 = [[CallHistoryDBClientHandle alloc] init:0];
  return v2;
}

void __34__CallHistoryDBClientHandle_init___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    objc_msgSend(WeakRetained, "handleCallRecordSave_sync");
    id WeakRetained = v2;
  }
}

void __53__CallHistoryDBClientHandle_registerForNotifications__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __53__CallHistoryDBClientHandle_registerForNotifications__block_invoke_2;
    v6[3] = &unk_1E61C7568;
    id v7 = WeakRetained;
    id v8 = v3;
    [v7 execute:v6];
  }
}

uint64_t __53__CallHistoryDBClientHandle_registerForNotifications__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleCallTimersSave_sync:", *(void *)(a1 + 40));
}

- (void)unRegisterForNotifications
{
  id v3 = [MEMORY[0x1E4F28C40] defaultCenter];
  [v3 removeObserver:self->_observerCallTimersRef name:@"kCallHistoryTimersDistributedSaveNotification" object:0];
}

- (int64_t)deleteCallsWithPredicate:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  double v12 = &v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __54__CallHistoryDBClientHandle_deleteCallsWithPredicate___block_invoke;
  v8[3] = &unk_1E61C7838;
  uint64_t v10 = &v11;
  v8[4] = self;
  id v5 = v4;
  id v9 = v5;
  [(CHSynchronizedLoggable *)self executeSync:v8];
  int64_t v6 = v12[3];

  _Block_object_dispose(&v11, 8);
  return v6;
}

uint64_t __54__CallHistoryDBClientHandle_deleteCallsWithPredicate___block_invoke(void *a1)
{
  ct_green_tea_logger_create_static();
  id v2 = getCTGreenTeaOsLogHandle();
  id v3 = v2;
  if (v2 && os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_1B8E4A000, v3, OS_LOG_TYPE_INFO, "Delete", v5, 2u);
  }

  uint64_t result = [*(id *)(a1[4] + 24) deleteManagedCallsWithPredicate:a1[5]];
  *(void *)(*(void *)(a1[6] + 8) + 24) = result;
  return result;
}

- (id)fetchCallIdentifiersWithPredicate:(id)a3 sortDescriptors:(id)a4 limit:(unint64_t)a5 offset:(unint64_t)a6 batchSize:(unint64_t)a7
{
  id v12 = a3;
  id v13 = a4;
  uint64_t v25 = 0;
  long long v26 = &v25;
  uint64_t v27 = 0x3032000000;
  uint64_t v28 = __Block_byref_object_copy__2;
  v29 = __Block_byref_object_dispose__2;
  id v30 = 0;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __102__CallHistoryDBClientHandle_fetchCallIdentifiersWithPredicate_sortDescriptors_limit_offset_batchSize___block_invoke;
  v18[3] = &unk_1E61C7D50;
  objc_super v21 = &v25;
  void v18[4] = self;
  id v14 = v12;
  id v19 = v14;
  id v15 = v13;
  id v20 = v15;
  unint64_t v22 = a5;
  unint64_t v23 = a6;
  unint64_t v24 = a7;
  [(CHSynchronizedLoggable *)self executeSync:v18];
  id v16 = (id)v26[5];

  _Block_object_dispose(&v25, 8);
  return v16;
}

void __102__CallHistoryDBClientHandle_fetchCallIdentifiersWithPredicate_sortDescriptors_limit_offset_batchSize___block_invoke(void *a1)
{
  id v2 = (void *)MEMORY[0x1BA9CD070]();
  uint64_t v3 = [*(id *)(a1[4] + 24) fetchManagedCallIdentifiersWithPredicate:a1[5] sortDescriptors:a1[6] limit:a1[8] offset:a1[9] batchSize:a1[10]];
  uint64_t v4 = *(void *)(a1[7] + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (unint64_t)fetchCoalescedCallCountWithPredicate:(id)a3 sortDescriptors:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x2020000000;
  uint64_t v19 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __82__CallHistoryDBClientHandle_fetchCoalescedCallCountWithPredicate_sortDescriptors___block_invoke;
  v12[3] = &unk_1E61C7D78;
  v12[4] = self;
  id v8 = v6;
  id v13 = v8;
  id v9 = v7;
  id v14 = v9;
  id v15 = &v16;
  [(CHSynchronizedLoggable *)self executeSync:v12];
  unint64_t v10 = v17[3];

  _Block_object_dispose(&v16, 8);
  return v10;
}

void __82__CallHistoryDBClientHandle_fetchCoalescedCallCountWithPredicate_sortDescriptors___block_invoke(void *a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1BA9CD070]();
  uint64_t v3 = [*(id *)(a1[4] + 24) fetchManagedCallsWithPredicate:a1[5] sortDescriptors:a1[6] limit:0 offset:0 batchSize:0];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    id v13 = v2;
    id v6 = 0;
    uint64_t v7 = *(void *)v15;
    do
    {
      uint64_t v8 = 0;
      id v9 = v6;
      do
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v3);
        }
        unint64_t v10 = [*(id *)(*((void *)&v14 + 1) + 8 * v8) chRecentCall];
        uint64_t v11 = [v9 coalescedCallWithCall:v10 usingStrategy:@"kCHCoalescingStrategyRecents"];
        id v12 = v11;
        if (!v11)
        {
          ++*(void *)(*(void *)(a1[7] + 8) + 24);
          id v12 = v10;
        }
        id v6 = v12;

        ++v8;
        id v9 = v6;
      }
      while (v5 != v8);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v5);

    id v2 = v13;
  }
}

- (id)fetchCoalescedCallsWithPredicate:(id)a3 sortDescriptors:(id)a4 limit:(unint64_t)a5 offset:(unint64_t)a6 batchSize:(unint64_t)a7
{
  id v12 = a3;
  id v13 = a4;
  uint64_t v25 = 0;
  long long v26 = &v25;
  uint64_t v27 = 0x3032000000;
  uint64_t v28 = __Block_byref_object_copy__2;
  v29 = __Block_byref_object_dispose__2;
  id v30 = 0;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __101__CallHistoryDBClientHandle_fetchCoalescedCallsWithPredicate_sortDescriptors_limit_offset_batchSize___block_invoke;
  v18[3] = &unk_1E61C7D28;
  void v18[4] = self;
  id v14 = v12;
  id v19 = v14;
  id v15 = v13;
  unint64_t v22 = a6;
  unint64_t v23 = a7;
  id v20 = v15;
  objc_super v21 = &v25;
  unint64_t v24 = a5;
  [(CHSynchronizedLoggable *)self executeSync:v18];
  id v16 = (id)v26[5];

  _Block_object_dispose(&v25, 8);
  return v16;
}

void __101__CallHistoryDBClientHandle_fetchCoalescedCallsWithPredicate_sortDescriptors_limit_offset_batchSize___block_invoke(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1BA9CD070]();
  uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 24) fetchManagedCallsWithPredicate:*(void *)(a1 + 40) sortDescriptors:*(void *)(a1 + 48) limit:0 offset:*(void *)(a1 + 64) batchSize:*(void *)(a1 + 72)];
  if (v3)
  {
    uint64_t v4 = objc_msgSend(*(id *)(a1 + 32), "convertToCHRecentCalls_sync:limit:", v3, *(void *)(a1 + 80));
    uint64_t v5 = *(void *)(*(void *)(a1 + 56) + 8);
    id v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;
  }
}

- (id)fetchAll
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __37__CallHistoryDBClientHandle_fetchAll__block_invoke;
  v4[3] = &unk_1E61C7A18;
  v4[4] = self;
  id v2 = [(CHSynchronizedLoggable *)self executeSyncWithResult:v4];
  return v2;
}

id __37__CallHistoryDBClientHandle_fetchAll__block_invoke(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1BA9CD070]();
  uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 24) fetchAll];
  uint64_t v4 = objc_msgSend(*(id *)(a1 + 32), "convertToCHRecentCalls_sync:", v3);

  return v4;
}

- (id)fetchAllNoLimit
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __44__CallHistoryDBClientHandle_fetchAllNoLimit__block_invoke;
  v4[3] = &unk_1E61C7A18;
  v4[4] = self;
  id v2 = [(CHSynchronizedLoggable *)self executeSyncWithResult:v4];
  return v2;
}

id __44__CallHistoryDBClientHandle_fetchAllNoLimit__block_invoke(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1BA9CD070]();
  uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 24) fetchAllNoLimit];
  uint64_t v4 = objc_msgSend(*(id *)(a1 + 32), "convertToCHRecentCalls_sync:", v3);

  return v4;
}

- (id)fetchWithCallTypes:(unsigned int)a3
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __48__CallHistoryDBClientHandle_fetchWithCallTypes___block_invoke;
  v5[3] = &unk_1E61C7DC8;
  v5[4] = self;
  unsigned int v6 = a3;
  uint64_t v3 = [(CHSynchronizedLoggable *)self executeSyncWithResult:v5];
  return v3;
}

id __48__CallHistoryDBClientHandle_fetchWithCallTypes___block_invoke(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1BA9CD070]();
  uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 24) fetchWithCallTypes:*(unsigned int *)(a1 + 40)];
  uint64_t v4 = objc_msgSend(*(id *)(a1 + 32), "convertToCHRecentCalls_sync:", v3);

  return v4;
}

- (id)fetchObjectsWithPredicate:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __55__CallHistoryDBClientHandle_fetchObjectsWithPredicate___block_invoke;
  v8[3] = &unk_1E61C7DF0;
  v8[4] = self;
  id v9 = v4;
  id v5 = v4;
  unsigned int v6 = [(CHSynchronizedLoggable *)self executeSyncWithResult:v8];

  return v6;
}

id __55__CallHistoryDBClientHandle_fetchObjectsWithPredicate___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1BA9CD070]();
  uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 24) fetchObjectsWithPredicate:*(void *)(a1 + 40)];
  id v4 = [*(id *)(a1 + 32) logHandle];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 134217984;
    uint64_t v10 = [v3 count];
    _os_log_impl(&dword_1B8E4A000, v4, OS_LOG_TYPE_DEFAULT, "Fetching calls from DBStoreHandle. Got back %lu calls", (uint8_t *)&v9, 0xCu);
  }

  id v5 = objc_msgSend(*(id *)(a1 + 32), "convertToCHRecentCalls_sync:", v3);
  unsigned int v6 = [*(id *)(a1 + 32) logHandle];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = [v5 count];
    int v9 = 134217984;
    uint64_t v10 = v7;
    _os_log_impl(&dword_1B8E4A000, v6, OS_LOG_TYPE_DEFAULT, "Converting records into CHRecentCall objects. Returning %lu calls", (uint8_t *)&v9, 0xCu);
  }

  return v5;
}

- (id)fetchAllObjectsWithUniqueId:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __57__CallHistoryDBClientHandle_fetchAllObjectsWithUniqueId___block_invoke;
  v8[3] = &unk_1E61C7E18;
  v8[4] = self;
  id v9 = v4;
  id v5 = v4;
  unsigned int v6 = [(CHSynchronizedLoggable *)self executeSyncWithResult:v8];

  return v6;
}

id __57__CallHistoryDBClientHandle_fetchAllObjectsWithUniqueId___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1BA9CD070]();
  uint64_t v3 = objc_opt_new();
  id v4 = [*(id *)(*(void *)(a1 + 32) + 24) fetchAllObjectsWithUniqueId:*(void *)(a1 + 40)];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
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
        id v9 = [*(id *)(*((void *)&v11 + 1) + 8 * i) chRecentCall];
        [v3 addObject:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)fetchObjectWithUniqueId:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __53__CallHistoryDBClientHandle_fetchObjectWithUniqueId___block_invoke;
  v8[3] = &unk_1E61C7E40;
  v8[4] = self;
  id v9 = v4;
  id v5 = v4;
  uint64_t v6 = [(CHSynchronizedLoggable *)self executeSyncWithResult:v8];

  return v6;
}

id __53__CallHistoryDBClientHandle_fetchObjectWithUniqueId___block_invoke(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1BA9CD070]();
  uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 24) fetchObjectWithUniqueId:*(void *)(a1 + 40)];
  id v4 = [v3 chRecentCall];

  return v4;
}

- (id)fetchObjectsWithUniqueIds:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __55__CallHistoryDBClientHandle_fetchObjectsWithUniqueIds___block_invoke;
  v8[3] = &unk_1E61C7DF0;
  v8[4] = self;
  id v9 = v4;
  id v5 = v4;
  uint64_t v6 = [(CHSynchronizedLoggable *)self executeSyncWithResult:v8];

  return v6;
}

id __55__CallHistoryDBClientHandle_fetchObjectsWithUniqueIds___block_invoke(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1BA9CD070]();
  uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 24) fetchObjectsWithUniqueIds:*(void *)(a1 + 40)];
  id v4 = objc_msgSend(*(id *)(a1 + 32), "convertToCHRecentCalls_sync:", v3);

  return v4;
}

- (BOOL)deleteAll
{
  uint64_t v3 = 0;
  return [(CallHistoryDBClientHandle *)self deleteAll:&v3];
}

- (BOOL)deleteAll:(id *)a3
{
  ct_green_tea_logger_create_static();
  id v5 = getCTGreenTeaOsLogHandle();
  uint64_t v6 = v5;
  if (v5 && os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B8E4A000, v6, OS_LOG_TYPE_INFO, "Delete", buf, 2u);
  }

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __39__CallHistoryDBClientHandle_deleteAll___block_invoke;
  v8[3] = &unk_1E61C7E68;
  v8[4] = self;
  void v8[5] = a3;
  return [(CHSynchronizedLoggable *)self executeSyncWithBOOL:v8];
}

uint64_t __39__CallHistoryDBClientHandle_deleteAll___block_invoke(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1BA9CD070]();
  [*(id *)(*(void *)(a1 + 32) + 24) deleteAll];
  uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 24) save:*(void *)(a1 + 40)];
  return v3;
}

- (BOOL)deleteObjectWithUniqueId:(id)a3
{
  return [(CallHistoryDBClientHandle *)self deleteObjectWithUniqueId:a3 error:0];
}

- (BOOL)deleteObjectWithUniqueId:(id)a3 error:(id *)a4
{
  return [(CallHistoryDBClientHandle *)self deleteObjectWithUniqueId:a3 error:a4 save:1];
}

- (BOOL)deleteObjectWithUniqueId:(id)a3 error:(id *)a4 save:(BOOL)a5
{
  id v8 = a3;
  ct_green_tea_logger_create_static();
  id v9 = getCTGreenTeaOsLogHandle();
  uint64_t v10 = v9;
  if (v9 && os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B8E4A000, v10, OS_LOG_TYPE_INFO, "Delete", buf, 2u);
  }

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __65__CallHistoryDBClientHandle_deleteObjectWithUniqueId_error_save___block_invoke;
  v14[3] = &unk_1E61C7E90;
  v14[4] = self;
  id v15 = v8;
  BOOL v17 = a5;
  uint64_t v16 = a4;
  id v11 = v8;
  BOOL v12 = [(CHSynchronizedLoggable *)self executeSyncWithBOOL:v14];

  return v12;
}

uint64_t __65__CallHistoryDBClientHandle_deleteObjectWithUniqueId_error_save___block_invoke(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1BA9CD070]();
  [*(id *)(*(void *)(a1 + 32) + 24) deleteObjectWithUniqueId:*(void *)(a1 + 40)];
  if (*(unsigned char *)(a1 + 56)) {
    uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 24) save:*(void *)(a1 + 48)];
  }
  else {
    uint64_t v3 = 1;
  }
  return v3;
}

- (BOOL)deleteObjectsWithUniqueIds:(id)a3
{
  uint64_t v4 = 0;
  return [(CallHistoryDBClientHandle *)self deleteObjectsWithUniqueIds:a3 error:&v4];
}

- (BOOL)deleteObjectsWithUniqueIds:(id)a3 error:(id *)a4
{
  id v6 = a3;
  ct_green_tea_logger_create_static();
  uint64_t v7 = getCTGreenTeaOsLogHandle();
  id v8 = v7;
  if (v7 && os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B8E4A000, v8, OS_LOG_TYPE_INFO, "Delete", buf, 2u);
  }

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __62__CallHistoryDBClientHandle_deleteObjectsWithUniqueIds_error___block_invoke;
  v12[3] = &unk_1E61C7EB8;
  v12[4] = self;
  id v13 = v6;
  long long v14 = a4;
  id v9 = v6;
  BOOL v10 = [(CHSynchronizedLoggable *)self executeSyncWithBOOL:v12];

  return v10;
}

uint64_t __62__CallHistoryDBClientHandle_deleteObjectsWithUniqueIds_error___block_invoke(void *a1)
{
  id v2 = (void *)MEMORY[0x1BA9CD070]();
  [*(id *)(a1[4] + 24) deleteObjectsWithUniqueIds:a1[5]];
  uint64_t v3 = [*(id *)(a1[4] + 24) save:a1[6]];
  return v3;
}

- (BOOL)createCallRecord:(id)a3
{
  return [(CallHistoryDBClientHandle *)self createCallRecord:a3 error:0];
}

- (BOOL)createCallRecord:(id)a3 error:(id *)a4
{
  return [(CallHistoryDBClientHandle *)self createCallRecord:a3 error:a4 save:1];
}

- (BOOL)createCallRecord:(id)a3 error:(id *)a4 save:(BOOL)a5
{
  id v8 = a3;
  ct_green_tea_logger_create_static();
  id v9 = getCTGreenTeaOsLogHandle();
  BOOL v10 = v9;
  if (v9 && os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B8E4A000, v10, OS_LOG_TYPE_INFO, "Insert", buf, 2u);
  }

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __57__CallHistoryDBClientHandle_createCallRecord_error_save___block_invoke;
  v14[3] = &unk_1E61C7E90;
  v14[4] = self;
  id v15 = v8;
  BOOL v17 = a5;
  uint64_t v16 = a4;
  id v11 = v8;
  BOOL v12 = [(CHSynchronizedLoggable *)self executeSyncWithBOOL:v14];

  return v12;
}

uint64_t __57__CallHistoryDBClientHandle_createCallRecord_error_save___block_invoke(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1BA9CD070]();
  uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 24) createCallRecord];
  objc_msgSend(*(id *)(a1 + 32), "setStoreObject_sync:withClientObject:", v3, *(void *)(a1 + 40));
  if (*(unsigned char *)(a1 + 56)) {
    uint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 24) save:*(void *)(a1 + 48)];
  }
  else {
    uint64_t v4 = 1;
  }

  return v4;
}

- (BOOL)createCallRecords:(id)a3
{
  return [(CallHistoryDBClientHandle *)self createCallRecords:a3 error:0];
}

- (BOOL)createCallRecords:(id)a3 error:(id *)a4
{
  id v6 = a3;
  ct_green_tea_logger_create_static();
  uint64_t v7 = getCTGreenTeaOsLogHandle();
  id v8 = v7;
  if (v7 && os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B8E4A000, v8, OS_LOG_TYPE_INFO, "Insert", buf, 2u);
  }

  if ([v6 count])
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __53__CallHistoryDBClientHandle_createCallRecords_error___block_invoke;
    v11[3] = &unk_1E61C7EB8;
    id v12 = v6;
    id v13 = self;
    long long v14 = a4;
    BOOL v9 = [(CHSynchronizedLoggable *)self executeSyncWithBOOL:v11];
  }
  else
  {
    BOOL v9 = 1;
  }

  return v9;
}

uint64_t __53__CallHistoryDBClientHandle_createCallRecords_error___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v13;
    while (2)
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v12 + 1) + 8 * v6);
        id v8 = (void *)MEMORY[0x1BA9CD070](v3);
        uint64_t v9 = objc_msgSend(*(id *)(*(void *)(a1 + 40) + 24), "createCallRecord", (void)v12);
        if (!v9)
        {

          return 0;
        }
        BOOL v10 = (void *)v9;
        objc_msgSend(*(id *)(a1 + 40), "setStoreObject_sync:withClientObject:", v9, v7);

        ++v6;
      }
      while (v4 != v6);
      uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
      uint64_t v4 = v3;
      if (v3) {
        continue;
      }
      break;
    }
  }

  return objc_msgSend(*(id *)(*(void *)(a1 + 40) + 24), "save:", *(void *)(a1 + 48), (void)v12);
}

- (id)updateCallRecords:(id)a3
{
  return [(CallHistoryDBClientHandle *)self updateCallRecords:a3 error:0];
}

- (id)updateCallRecords:(id)a3 error:(id *)a4
{
  return [(CallHistoryDBClientHandle *)self updateCallRecords:a3 error:a4 save:1];
}

- (id)updateCallRecords:(id)a3 error:(id *)a4 save:(BOOL)a5
{
  id v8 = a3;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __58__CallHistoryDBClientHandle_updateCallRecords_error_save___block_invoke;
  v12[3] = &unk_1E61C7EE0;
  v12[4] = self;
  id v13 = v8;
  long long v14 = a4;
  BOOL v15 = a5;
  id v9 = v8;
  BOOL v10 = [(CHSynchronizedLoggable *)self executeSyncWithResult:v12];

  return v10;
}

id __58__CallHistoryDBClientHandle_updateCallRecords_error_save___block_invoke(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1BA9CD070]();
  uint64_t v3 = objc_msgSend(*(id *)(a1 + 32), "updateCallRecords_sync:error:save:", *(void *)(a1 + 40), *(void *)(a1 + 48), *(unsigned __int8 *)(a1 + 56));
  return v3;
}

- (id)updateCallRecordsWithCalls:(id)a3 error:(id *)a4 save:(BOOL)a5
{
  id v8 = a3;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __67__CallHistoryDBClientHandle_updateCallRecordsWithCalls_error_save___block_invoke;
  v12[3] = &unk_1E61C7EE0;
  v12[4] = self;
  id v13 = v8;
  long long v14 = a4;
  BOOL v15 = a5;
  id v9 = v8;
  BOOL v10 = [(CHSynchronizedLoggable *)self executeSyncWithResult:v12];

  return v10;
}

id __67__CallHistoryDBClientHandle_updateCallRecordsWithCalls_error_save___block_invoke(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1BA9CD070]();
  uint64_t v3 = objc_msgSend(*(id *)(a1 + 32), "updateCallRecordsWithCalls_sync:error:save:", *(void *)(a1 + 40), *(void *)(a1 + 48), *(unsigned __int8 *)(a1 + 56));
  return v3;
}

- (id)updateAllCallRecords:(id)a3
{
  return [(CallHistoryDBClientHandle *)self updateAllCallRecords:a3 error:0];
}

- (id)updateAllCallRecords:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __56__CallHistoryDBClientHandle_updateAllCallRecords_error___block_invoke;
  v10[3] = &unk_1E61C7810;
  v10[4] = self;
  id v11 = v6;
  long long v12 = a4;
  id v7 = v6;
  id v8 = [(CHSynchronizedLoggable *)self executeSyncWithResult:v10];

  return v8;
}

id __56__CallHistoryDBClientHandle_updateAllCallRecords_error___block_invoke(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1BA9CD070]();
  uint64_t v3 = objc_msgSend(*(id *)(a1 + 32), "updateAllCallRecords_sync:error:", *(void *)(a1 + 40), *(void *)(a1 + 48));
  return v3;
}

- (id)timerIncoming
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __42__CallHistoryDBClientHandle_timerIncoming__block_invoke;
  v4[3] = &unk_1E61C7F08;
  v4[4] = self;
  id v2 = [(CHSynchronizedLoggable *)self executeSyncWithResult:v4];
  return v2;
}

uint64_t __42__CallHistoryDBClientHandle_timerIncoming__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) timerIncoming];
}

- (id)timerOutgoing
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __42__CallHistoryDBClientHandle_timerOutgoing__block_invoke;
  v4[3] = &unk_1E61C7F08;
  v4[4] = self;
  id v2 = [(CHSynchronizedLoggable *)self executeSyncWithResult:v4];
  return v2;
}

uint64_t __42__CallHistoryDBClientHandle_timerOutgoing__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) timerOutgoing];
}

- (id)timerLastReset
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __43__CallHistoryDBClientHandle_timerLastReset__block_invoke;
  v4[3] = &unk_1E61C7F08;
  v4[4] = self;
  id v2 = [(CHSynchronizedLoggable *)self executeSyncWithResult:v4];
  return v2;
}

uint64_t __43__CallHistoryDBClientHandle_timerLastReset__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) timerLastReset];
}

- (id)timerLifetime
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __42__CallHistoryDBClientHandle_timerLifetime__block_invoke;
  v4[3] = &unk_1E61C7F08;
  v4[4] = self;
  id v2 = [(CHSynchronizedLoggable *)self executeSyncWithResult:v4];
  return v2;
}

uint64_t __42__CallHistoryDBClientHandle_timerLifetime__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) timerLifetime];
}

- (void)resetTimers
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __40__CallHistoryDBClientHandle_resetTimers__block_invoke;
  v2[3] = &unk_1E61C74A8;
  v2[4] = self;
  [(CHSynchronizedLoggable *)self executeSync:v2];
}

uint64_t __40__CallHistoryDBClientHandle_resetTimers__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) resetTimers];
}

- (BOOL)resetAllTimers
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __43__CallHistoryDBClientHandle_resetAllTimers__block_invoke;
  v3[3] = &unk_1E61C79A0;
  v3[4] = self;
  return [(CHSynchronizedLoggable *)self executeSyncWithBOOL:v3];
}

uint64_t __43__CallHistoryDBClientHandle_resetAllTimers__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) resetAllTimers];
}

- (CallHistoryDBHandle)dbStoreHandle
{
  uint64_t v3 = [(CHSynchronizedLoggable *)self queue];
  dispatch_assert_queue_V2(v3);

  dbStoreHandle = self->dbStoreHandle;
  return dbStoreHandle;
}

- (CallDBManager)manager
{
  id v2 = self;
  objc_sync_enter(v2);
  manager = v2->_manager;
  if (!manager)
  {
    uint64_t v7 = 0;
    id v8 = &v7;
    uint64_t v9 = 0x3032000000;
    BOOL v10 = __Block_byref_object_copy__2;
    id v11 = __Block_byref_object_dispose__2;
    id v12 = 0;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __36__CallHistoryDBClientHandle_manager__block_invoke;
    v6[3] = &unk_1E61C79C8;
    void v6[4] = v2;
    v6[5] = &v7;
    [(CHSynchronizedLoggable *)v2 executeSync:v6];
    objc_storeStrong((id *)&v2->_manager, (id)v8[5]);
    _Block_object_dispose(&v7, 8);

    manager = v2->_manager;
  }
  uint64_t v4 = manager;
  objc_sync_exit(v2);

  return v4;
}

void __36__CallHistoryDBClientHandle_manager__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) dbStoreHandle];
  uint64_t v2 = [v5 callDBManager];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)handleCallRecordSave_sync
{
}

- (void)handleCallTimersSave_sync:(id)a3
{
  if ([(CallHistoryDBClientHandle *)self willHandleNotification_sync:a3])
  {
    [(CallHistoryDBHandle *)self->dbStoreHandle mergeCallDBPropChangesFromRemoteAppSave];
    [(CallHistoryDBHandle *)self->dbStoreHandle postTimersChangedNotification];
    uint64_t v4 = [(CHSynchronizedLoggable *)self logHandle];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl(&dword_1B8E4A000, v4, OS_LOG_TYPE_DEFAULT, "Got timers save notification from other app", v5, 2u);
    }
  }
}

- (BOOL)willHandleNotification_sync:(id)a3
{
  uint64_t v3 = [a3 object];
  uint64_t v4 = +[CallHistoryDBHandle objectId];
  char v5 = [v3 isEqual:v4];

  return v5 ^ 1;
}

- (id)updateCallRecords_sync:(id)a3 error:(id *)a4 save:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v32 = v8;
  BOOL v10 = [v8 allKeys];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v37 objects:v44 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v38;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v38 != v13) {
          objc_enumerationMutation(v10);
        }
        [v9 addObject:*(void *)(*((void *)&v37 + 1) + 8 * i)];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v37 objects:v44 count:16];
    }
    while (v12);
  }
  if (![v9 count])
  {
    uint64_t v16 = [(CHSynchronizedLoggable *)self logHandle];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B8E4A000, v16, OS_LOG_TYPE_DEFAULT, "No calls to update", buf, 2u);
    }
    goto LABEL_32;
  }
  BOOL v15 = [(CallHistoryDBHandle *)self->dbStoreHandle fetchObjectsWithUniqueIds:v9];
  uint64_t v16 = v15;
  if (!v15 || ![v15 count])
  {
    uint64_t v27 = [(CHSynchronizedLoggable *)self logHandle];
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v43 = v9;
      _os_log_impl(&dword_1B8E4A000, v27, OS_LOG_TYPE_DEFAULT, "Objects with given uniqueIds: %{public}@ to update do not exist", buf, 0xCu);
    }

LABEL_32:
    id v31 = 0;
    goto LABEL_33;
  }
  v29 = a4;
  BOOL v30 = v5;
  id v31 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  uint64_t v16 = v16;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v33 objects:v41 count:16];
  if (!v17) {
    goto LABEL_24;
  }
  uint64_t v18 = v17;
  uint64_t v19 = *(void *)v34;
  do
  {
    id v20 = v16;
    for (uint64_t j = 0; j != v18; ++j)
    {
      if (*(void *)v34 != v19) {
        objc_enumerationMutation(v20);
      }
      unint64_t v22 = *(void **)(*((void *)&v33 + 1) + 8 * j);
      unint64_t v23 = objc_msgSend(v22, "unique_id");
      unint64_t v24 = [v32 objectForKey:v23];

      if (v24)
      {
        if (![(CallHistoryDBClientHandle *)self updateCallRecord_sync:v22 withChangeDict:v24])goto LABEL_22; {
        uint64_t v25 = [v22 chRecentCall];
        }
        [v31 addObject:v25];
      }
      else
      {
        uint64_t v25 = [(CHSynchronizedLoggable *)self logHandle];
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          long long v26 = objc_msgSend(v22, "unique_id");
          *(_DWORD *)buf = 138543362;
          id v43 = v26;
          _os_log_impl(&dword_1B8E4A000, v25, OS_LOG_TYPE_DEFAULT, "Properties dict not found for call with uniqueId: %{public}@", buf, 0xCu);
        }
      }

LABEL_22:
    }
    uint64_t v16 = v20;
    uint64_t v18 = [v20 countByEnumeratingWithState:&v33 objects:v41 count:16];
  }
  while (v18);
LABEL_24:

  if ([v31 count] && v30) {
    [(CallHistoryDBHandle *)self->dbStoreHandle save:v29];
  }
LABEL_33:

  return v31;
}

- (id)updateCallRecordsWithCalls_sync:(id)a3 error:(id *)a4 save:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v32 = v8;
  BOOL v10 = [v8 allKeys];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v37 objects:v44 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v38;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v38 != v13) {
          objc_enumerationMutation(v10);
        }
        [v9 addObject:*(void *)(*((void *)&v37 + 1) + 8 * i)];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v37 objects:v44 count:16];
    }
    while (v12);
  }
  if (![v9 count])
  {
    uint64_t v16 = [(CHSynchronizedLoggable *)self logHandle];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B8E4A000, v16, OS_LOG_TYPE_DEFAULT, "No calls to update", buf, 2u);
    }
    goto LABEL_32;
  }
  BOOL v15 = [(CallHistoryDBHandle *)self->dbStoreHandle fetchObjectsWithUniqueIds:v9];
  uint64_t v16 = v15;
  if (!v15 || ![v15 count])
  {
    uint64_t v27 = [(CHSynchronizedLoggable *)self logHandle];
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v43 = v9;
      _os_log_impl(&dword_1B8E4A000, v27, OS_LOG_TYPE_DEFAULT, "Objects with given uniqueIds:%@ to update do not exist", buf, 0xCu);
    }

LABEL_32:
    id v31 = 0;
    goto LABEL_33;
  }
  v29 = a4;
  BOOL v30 = v5;
  id v31 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  uint64_t v16 = v16;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v33 objects:v41 count:16];
  if (!v17) {
    goto LABEL_24;
  }
  uint64_t v18 = v17;
  uint64_t v19 = *(void *)v34;
  do
  {
    id v20 = v16;
    for (uint64_t j = 0; j != v18; ++j)
    {
      if (*(void *)v34 != v19) {
        objc_enumerationMutation(v20);
      }
      unint64_t v22 = *(void **)(*((void *)&v33 + 1) + 8 * j);
      unint64_t v23 = objc_msgSend(v22, "unique_id");
      unint64_t v24 = [v32 objectForKey:v23];

      if (v24)
      {
        if (![(CallHistoryDBClientHandle *)self updateCallRecord_sync:v22 withCall:v24])goto LABEL_22; {
        uint64_t v25 = [v22 chRecentCall];
        }
        [v31 addObject:v25];
      }
      else
      {
        uint64_t v25 = [(CHSynchronizedLoggable *)self logHandle];
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          long long v26 = objc_msgSend(v22, "unique_id");
          *(_DWORD *)buf = 138412290;
          id v43 = v26;
          _os_log_impl(&dword_1B8E4A000, v25, OS_LOG_TYPE_DEFAULT, "Updated call not found for call with uniqueId: %@", buf, 0xCu);
        }
      }

LABEL_22:
    }
    uint64_t v16 = v20;
    uint64_t v18 = [v20 countByEnumeratingWithState:&v33 objects:v41 count:16];
  }
  while (v18);
LABEL_24:

  if ([v31 count] && v30) {
    [(CallHistoryDBHandle *)self->dbStoreHandle save:v29];
  }
LABEL_33:

  return v31;
}

- (id)updateAllCallRecords_sync:(id)a3 error:(id *)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = objc_opt_new();
  id v8 = [(CallHistoryDBHandle *)self->dbStoreHandle fetchAll];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v24 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        if ([(CallHistoryDBClientHandle *)self updateCallRecord_sync:v13 withChangeDict:v6])
        {
          long long v14 = [v13 chRecentCall];
          [v7 addObject:v14];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v24 count:16];
    }
    while (v10);
  }
  if ([v7 count])
  {
    [(CallHistoryDBHandle *)self->dbStoreHandle save:a4];
    ct_green_tea_logger_create_static();
    BOOL v15 = getCTGreenTeaOsLogHandle();
    uint64_t v16 = v15;
    if (v15 && os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v23 = v6;
      _os_log_impl(&dword_1B8E4A000, v16, OS_LOG_TYPE_INFO, "Modify: %@", buf, 0xCu);
    }
  }
  return v7;
}

- (BOOL)updateCallRecord_sync:(id)a3 withChangeDict:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 objectForKeyedSubscript:kCallUpdatePropertyOutgoingLocalParticipantUUID];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unint64_t v9 = v8;
    uint64_t v10 = [v6 outgoingLocalParticipantUUID];
    uint64_t v11 = (void *)v10;
    char v12 = (v9 | v10) == 0;
    if (v9) {
      char v12 = [(id)v10 isEqual:v9];
    }
    char v13 = v12 ^ 1;

    if ((v12 & 1) == 0) {
      [v6 setOutgoingLocalParticipantUUID:v9];
    }
  }
  else
  {
    char v13 = 0;
  }
  long long v14 = [v7 objectForKeyedSubscript:kCallUpdatePropertyRead];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v15 = v14;
    unint64_t v16 = [v6 read];
    unint64_t v17 = (unint64_t)v15;
    long long v18 = (void *)v17;
    if (v17 | v16)
    {
      if (v17)
      {
        char v19 = [(id)v16 isEqual:v17];

        if (v19) {
          goto LABEL_15;
        }
      }
      else
      {
      }
      [v6 setRead:v18];
      char v13 = 1;
    }
LABEL_15:
  }
  long long v20 = [v7 objectForKeyedSubscript:kCallUpdatePropertyBytesUsed];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_24;
  }
  id v21 = v20;
  objc_msgSend(v6, "face_time_data");
  unint64_t v22 = (unint64_t)(id)objc_claimAutoreleasedReturnValue();
  unint64_t v23 = (unint64_t)v21;
  unint64_t v24 = (void *)v23;
  if (v23 | v22)
  {
    if (v23)
    {
      char v25 = [(id)v22 isEqual:v23];

      if (v25) {
        goto LABEL_23;
      }
    }
    else
    {
    }
    objc_msgSend(v6, "setFace_time_data:", v24);
    char v13 = 1;
  }
LABEL_23:

LABEL_24:
  long long v26 = [v7 objectForKeyedSubscript:kCallUpdatePropertyCallStatus];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    __int16 v50 = 0;
    -[CallHistoryDBClientHandle parseCallStatus_sync:isAnswered:isOriginated:](self, "parseCallStatus_sync:isAnswered:isOriginated:", [v26 integerValue], (char *)&v50 + 1, &v50);
    uint64_t v27 = [v6 answered];
    int v28 = [v27 BOOLValue];
    int v29 = HIBYTE(v50);

    if (v29 != v28)
    {
      BOOL v30 = [NSNumber numberWithBool:HIBYTE(v50)];
      [v6 setAnswered:v30];

      char v13 = 1;
    }
    id v31 = [v6 originated];
    int v32 = [v31 BOOLValue];
    int v33 = v50;

    if (v33 != v32)
    {
      long long v34 = [NSNumber numberWithBool:v50];
      [v6 setOriginated:v34];

      char v13 = 1;
    }
  }
  long long v35 = [v7 objectForKeyedSubscript:kCallUpdatePropertyHasMessage];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v36 = v35;
    unint64_t v37 = [v6 hasMessage];
    unint64_t v38 = (unint64_t)v36;
    long long v39 = (void *)v38;
    if (v38 | v37)
    {
      if (v38)
      {
        char v40 = [(id)v37 isEqual:v38];

        if (v40) {
          goto LABEL_36;
        }
      }
      else
      {
      }
      [v6 setHasMessage:v39];
      char v13 = 1;
    }
LABEL_36:
  }
  v41 = [v7 objectForKeyedSubscript:kCallUpdatePropertyAutoAnsweredReason];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_45;
  }
  id v42 = v41;
  unint64_t v43 = [v6 autoAnsweredReason];
  unint64_t v44 = (unint64_t)v42;
  uint64_t v45 = (void *)v44;
  if (v44 | v43)
  {
    if (v44)
    {
      char v46 = [(id)v43 isEqual:v44];

      if (v46) {
        goto LABEL_44;
      }
    }
    else
    {
    }
    [v6 setAutoAnsweredReason:v45];
    char v13 = 1;
  }
LABEL_44:

LABEL_45:
  v47 = [v7 objectForKeyedSubscript:kCallUpdatePropertyEmergencyMediaItem];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v48 = [[CHEmergencyMediaItem alloc] initWithDictionary:v47];
    if (v48) {
      char v13 = [v6 addEmergencyMediaItem:v48];
    }
  }
  return v13;
}

- (BOOL)updateCallRecord_sync:(id)a3 withCall:(id)a4
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 chRecentCall];
  char v9 = [v8 isEqual:v7];
  if ((v9 & 1) == 0)
  {
    __int16 v44 = 0;
    -[CallHistoryDBClientHandle parseCallStatus_sync:isAnswered:isOriginated:](self, "parseCallStatus_sync:isAnswered:isOriginated:", [v7 callStatus], (char *)&v44 + 1, &v44);
    uint64_t v10 = [v7 uniqueId];
    objc_msgSend(v6, "setUnique_id:", v10);

    uint64_t v11 = [v7 outgoingLocalParticipantUUID];
    [v6 setOutgoingLocalParticipantUUID:v11];

    char v12 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v7, "read"));
    [v6 setRead:v12];

    char v13 = [v7 bytesOfDataUsed];
    objc_msgSend(v6, "setFace_time_data:", v13);

    long long v14 = [NSNumber numberWithBool:HIBYTE(v44)];
    [v6 setAnswered:v14];

    id v15 = [NSNumber numberWithBool:v44];
    [v6 setOriginated:v15];

    unint64_t v16 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v7, "hasMessage"));
    [v6 setHasMessage:v16];

    unint64_t v17 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v7, "autoAnsweredReason"));
    [v6 setAutoAnsweredReason:v17];

    long long v18 = [v7 participantGroupUUID];
    [v6 setParticipantGroupUUID:v18];

    char v19 = NSNumber;
    [v7 duration];
    long long v20 = objc_msgSend(v19, "numberWithDouble:");
    [v6 setDuration:v20];

    id v21 = [v6 localParticipantUUID];
    if (v21) {
      unint64_t v22 = v6;
    }
    else {
      unint64_t v22 = v7;
    }
    unint64_t v23 = [v22 localParticipantUUID];
    [v6 setLocalParticipantUUID:v23];

    unint64_t v24 = [v6 outgoingLocalParticipantUUID];
    if (v24) {
      char v25 = v6;
    }
    else {
      char v25 = v7;
    }
    long long v26 = [v25 outgoingLocalParticipantUUID];
    [v6 setOutgoingLocalParticipantUUID:v26];

    uint64_t v27 = [v6 verificationStatus];
    int v28 = [NSNumber numberWithInteger:0];
    if (v27 == v28) {
      objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v7, "verificationStatus"));
    }
    else {
    int v29 = [v6 verificationStatus];
    }
    [v6 setVerificationStatus:v29];

    BOOL v30 = [v6 date];
    id v31 = [v7 date];
    if ([v30 compare:v31] == 1) {
      int v32 = v7;
    }
    else {
      int v32 = v6;
    }
    int v33 = [v32 date];
    [v6 setDate:v33];

    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v34 = objc_msgSend(v7, "emergencyMediaItems", 0);
    uint64_t v35 = [v34 countByEnumeratingWithState:&v40 objects:v45 count:16];
    if (v35)
    {
      uint64_t v36 = v35;
      uint64_t v37 = *(void *)v41;
      do
      {
        for (uint64_t i = 0; i != v36; ++i)
        {
          if (*(void *)v41 != v37) {
            objc_enumerationMutation(v34);
          }
          [v6 addEmergencyMediaItem:*(void *)(*((void *)&v40 + 1) + 8 * i)];
        }
        uint64_t v36 = [v34 countByEnumeratingWithState:&v40 objects:v45 count:16];
      }
      while (v36);
    }
  }
  return v9 ^ 1;
}

- (void)dealloc
{
  [(CallHistoryDBClientHandle *)self unRegisterForNotifications];
  v3.receiver = self;
  v3.super_class = (Class)CallHistoryDBClientHandle;
  [(CallHistoryDBClientHandle *)&v3 dealloc];
}

- (BOOL)saveDatabase:(id *)a3
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __42__CallHistoryDBClientHandle_saveDatabase___block_invoke;
  v4[3] = &unk_1E61C7E68;
  v4[4] = self;
  void v4[5] = a3;
  return [(CHSynchronizedLoggable *)self executeSyncWithBOOL:v4];
}

uint64_t __42__CallHistoryDBClientHandle_saveDatabase___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) save:*(void *)(a1 + 40)];
}

- (BOOL)moveCallRecordsFromDatabaseAtURL:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __62__CallHistoryDBClientHandle_moveCallRecordsFromDatabaseAtURL___block_invoke;
  v7[3] = &unk_1E61C7F30;
  v7[4] = self;
  id v8 = v4;
  id v5 = v4;
  LOBYTE(self) = [(CHSynchronizedLoggable *)self executeSyncWithBOOL:v7];

  return (char)self;
}

uint64_t __62__CallHistoryDBClientHandle_moveCallRecordsFromDatabaseAtURL___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) moveCallRecordsFromDatabaseAtURL:*(void *)(a1 + 40)];
}

- (NSObject)observerCallTimersRef
{
  return self->_observerCallTimersRef;
}

- (CHNotifyObserver)callsDidChangeNotifyObserver
{
  return self->_callsDidChangeNotifyObserver;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callsDidChangeNotifyObserver, 0);
  objc_storeStrong((id *)&self->_observerCallTimersRef, 0);
  objc_storeStrong((id *)&self->_manager, 0);
  objc_storeStrong((id *)&self->dbStoreHandle, 0);
}

@end