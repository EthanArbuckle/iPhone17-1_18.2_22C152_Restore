@interface SGSuggestHistory
+ (id)newTestingInstanceWithSharedKVS:(id)a3;
+ (id)sharedSuggestHistory;
+ (void)reset;
+ (void)resetNoFlush;
- (BOOL)_anyHash:(id)a3 inSet:(id)a4;
- (BOOL)hasConfirmedField:(id)a3 value:(id)a4 forStorageEvent:(id)a5;
- (BOOL)hasContact:(id)a3;
- (BOOL)hasContactDetail:(id)a3 forContact:(id)a4;
- (BOOL)hasContactDetailKey:(id)a3;
- (BOOL)hasStorageContact:(id)a3;
- (BOOL)isConfirmedEvent:(id)a3;
- (BOOL)isConfirmedEventWithoutTimeStamp:(id)a3;
- (BOOL)isConfirmedReminder:(id)a3;
- (BOOL)isRejectedEvent:(id)a3;
- (BOOL)isRejectedReminder:(id)a3;
- (BOOL)isUpdatableContact:(id)a3;
- (BOOL)isValidCancelledEvent:(id)a3;
- (BOOL)isValidNewEvent:(id)a3;
- (BOOL)isValidNewReminder:(id)a3;
- (BOOL)isValidSuggestion:(id)a3;
- (BOOL)needsMigration;
- (NSUbiquitousKeyValueStore)kvs;
- (SGSuggestHistory)init;
- (SGSuggestHistory)initWithKVS:(id)a3 kvStoreIdentifier:(id)a4;
- (id)_canaryHash;
- (id)_hashesForConfirmedField:(id)a3 value:(id)a4 storageEvent:(id)a5 forMatching:(BOOL)a6;
- (id)confirmHashesForOpaqueKey:(id)a3 withCreationTime:(SGUnixTimestamp_)a4 forMatching:(BOOL)a5;
- (id)confirmHashesForOpaqueKeyWithoutTimestamp:(id)a3 forMatching:(BOOL)a4;
- (id)confirmHashesForRemindersOpaqueKey:(id)a3 withCreationTime:(SGUnixTimestamp_)a4 forMatching:(BOOL)a5;
- (id)description;
- (id)hashesByAddingCompatibilityHashesToHashes:(id)a3 forMatching:(BOOL)a4;
- (id)hashesForContact:(id)a3 forMatching:(BOOL)a4;
- (id)hashesForContactDetail:(id)a3 fromContact:(id)a4 forMatching:(BOOL)a5;
- (id)hashesForCuratedContactDetail:(id)a3 fromContact:(id)a4 forMatching:(BOOL)a5;
- (id)hashesForOpaqueKey:(id)a3 forMatching:(BOOL)a4;
- (id)hashesForPseudoEventByKey:(id)a3 forMatching:(BOOL)a4;
- (id)hashesForStorageContact:(id)a3 forMatching:(BOOL)a4;
- (id)hashesForStrings:(id)a3 forMatching:(BOOL)a4;
- (id)identityBasedHashesForPseudoEvent:(id)a3 withCreationTime:(SGUnixTimestamp_)a4;
- (id)identityBasedHashesForPseudoReminder:(id)a3 withCreationTime:(SGUnixTimestamp_)a4;
- (id)keysForContact:(id)a3;
- (id)keysForContactDetail:(id)a3 ofContact:(id)a4;
- (id)keysForCuratedContactDetail:(id)a3 ofContact:(id)a4;
- (id)keysForStorageContact:(id)a3;
- (id)kvsIfSyncSupported;
- (id)legacyIOS13HashesForClassicHashes:(id)a3;
- (id)legacyManateeSecret;
- (id)loadResetInfo;
- (id)mutableSetForKey:(id)a3;
- (id)rejectHashesForOpaqueKey:(id)a3 forMatching:(BOOL)a4;
- (id)salt;
- (void)_setHashes:(id)a3 forKey:(id)a4;
- (void)_setInternalStateAccordingToKVS:(id)a3;
- (void)_tellObserversHashesDidChange;
- (void)addSuggestHistoryObserver:(id)a3;
- (void)confirmEvent:(id)a3;
- (void)confirmEventFromExternalDevice:(id)a3;
- (void)confirmFieldValues:(id)a3 forStorageEvent:(id)a4;
- (void)confirmOrRejectDetail:(id)a3 forContact:(id)a4;
- (void)confirmOrRejectDetailHashes:(id)a3;
- (void)confirmOrRejectRecordForContact:(id)a3;
- (void)confirmReminder:(id)a3;
- (void)confirmReminderFromExternalDevice:(id)a3;
- (void)confirmStorageEvent:(id)a3;
- (void)handleSyncedDataChanged:(id)a3;
- (void)migrateFromKVS:(id)a3 withCompletion:(id)a4;
- (void)migrateIfNeeded;
- (void)pushAll:(id)a3;
- (void)pushConfirmedEventFields:(id)a3;
- (void)pushConfirmedEventWithoutTimestampFields:(id)a3;
- (void)pushConfirmedEvents:(id)a3;
- (void)pushConfirmedEventsWithoutTimestamp:(id)a3;
- (void)pushConfirmedReminders:(id)a3;
- (void)pushContacts:(id)a3;
- (void)pushDontUpdate:(id)a3;
- (void)pushEmptyHashesForTestingKey:(id)a3;
- (void)pushRejectedEvents:(id)a3;
- (void)pushRejectedReminders:(id)a3;
- (void)pushResetInfo:(id)a3;
- (void)pushStorageDetails:(id)a3;
- (void)recordSuccessfulMigration;
- (void)rejectContact:(id)a3;
- (void)rejectContactDetailKey:(id)a3;
- (void)rejectEvent:(id)a3;
- (void)rejectEventFromExternalDevice:(id)a3;
- (void)rejectRealtimeContact:(id)a3;
- (void)rejectReminder:(id)a3;
- (void)rejectReminderFromExternalDevice:(id)a3;
- (void)rejectStorageEvent:(id)a3;
- (void)removeConfirmationHistoryForEntityWithOpaqueKey:(id)a3 creationTimestamp:(SGUnixTimestamp_)a4;
- (void)removeConfirmationHistoryForEvent:(id)a3;
- (void)reset;
- (void)resetNoFlush;
- (void)setInternalStateAccordingToKVS;
- (void)setMigrateFromStore:(id)a3;
- (void)writeAndPushConfirmedEventHashes:(id)a3;
- (void)writeAndPushConfirmedEventWithoutTimestampHashes:(id)a3;
- (void)writeAndPushConfirmedReminderHashes:(id)a3;
- (void)writeAndPushRejectedEventHashes:(id)a3;
- (void)writeAndPushRejectedReminderHashes:(id)a3;
@end

@implementation SGSuggestHistory

+ (id)sharedSuggestHistory
{
  if (sharedSuggestHistory_onceToken != -1) {
    dispatch_once(&sharedSuggestHistory_onceToken, &__block_literal_global_8469);
  }
  v2 = (void *)sharedSuggestHistory_instance;
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_kvStoreIdentifier, 0);
  objc_storeStrong((id *)&self->_noCloudFakeBackingKVStore, 0);
  objc_storeStrong((id *)&self->_backingKVStore, 0);
  objc_storeStrong((id *)&self->_lock, 0);
}

- (void)pushEmptyHashesForTestingKey:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_opt_new();
  [(SGSuggestHistory *)self _setHashes:v5 forKey:v4];
}

- (BOOL)hasConfirmedField:(id)a3 value:(id)a4 forStorageEvent:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x2020000000;
  char v31 = 0;
  lock = self->_lock;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __60__SGSuggestHistory_hasConfirmedField_value_forStorageEvent___block_invoke;
  v23[3] = &unk_1E65B6F18;
  v27 = &v28;
  v23[4] = self;
  id v12 = v8;
  id v24 = v12;
  id v13 = v9;
  id v25 = v13;
  id v14 = v10;
  id v26 = v14;
  [(_PASLock *)lock runWithLockAcquired:v23];
  if (*((unsigned char *)v29 + 24))
  {
    BOOL v15 = 1;
  }
  else
  {
    v16 = self->_lock;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __60__SGSuggestHistory_hasConfirmedField_value_forStorageEvent___block_invoke_2;
    v18[3] = &unk_1E65B6F18;
    v22 = &v28;
    v18[4] = self;
    id v19 = v12;
    id v20 = v13;
    id v21 = v14;
    [(_PASLock *)v16 runWithLockAcquired:v18];

    BOOL v15 = *((unsigned char *)v29 + 24) != 0;
  }

  _Block_object_dispose(&v28, 8);
  return v15;
}

void __60__SGSuggestHistory_hasConfirmedField_value_forStorageEvent___block_invoke(void *a1, void *a2)
{
  v3 = (void *)a1[4];
  uint64_t v4 = a1[5];
  uint64_t v5 = a1[6];
  uint64_t v6 = a1[7];
  v7 = a2;
  id v9 = [v3 _hashesForConfirmedField:v4 value:v5 storageEvent:v6 forMatching:1];
  uint64_t v8 = v7[7];

  *(unsigned char *)(*(void *)(a1[8] + 8) + 24) = [v3 _anyHash:v9 inSet:v8];
}

void __60__SGSuggestHistory_hasConfirmedField_value_forStorageEvent___block_invoke_2(void *a1, void *a2)
{
  v3 = (void *)a1[4];
  uint64_t v4 = a1[5];
  uint64_t v5 = a1[6];
  uint64_t v6 = a1[7];
  v7 = a2;
  id v9 = [v3 _hashesForConfirmedField:v4 value:v5 storageEvent:v6 forMatching:1];
  uint64_t v8 = v7[8];

  *(unsigned char *)(*(void *)(a1[8] + 8) + 24) = [v3 _anyHash:v9 inSet:v8];
}

- (void)confirmFieldValues:(id)a3 forStorageEvent:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", 2 * objc_msgSend(v6, "count"));
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v32 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v31 + 1) + 8 * i);
        BOOL v15 = [v9 objectForKeyedSubscript:v14];
        v16 = [(SGSuggestHistory *)self _hashesForConfirmedField:v14 value:v15 storageEvent:v7 forMatching:0];
        [v8 addObjectsFromArray:v16];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v11);
  }

  lock = self->_lock;
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __55__SGSuggestHistory_confirmFieldValues_forStorageEvent___block_invoke;
  v28[3] = &unk_1E65B6E78;
  id v18 = v8;
  id v29 = v18;
  uint64_t v30 = self;
  [(_PASLock *)lock runWithLockAcquired:v28];
  id v19 = self->_lock;
  uint64_t v22 = MEMORY[0x1E4F143A8];
  uint64_t v23 = 3221225472;
  id v24 = __55__SGSuggestHistory_confirmFieldValues_forStorageEvent___block_invoke_2;
  id v25 = &unk_1E65B6E78;
  id v26 = v18;
  v27 = self;
  id v20 = v18;
  [(_PASLock *)v19 runWithLockAcquired:&v22];
  id v21 = objc_msgSend(v7, "recordId", v22, v23, v24, v25);
  +[SGDNotificationBroadcaster emitEventUpdated:v21];
}

void __55__SGSuggestHistory_confirmFieldValues_forStorageEvent___block_invoke(uint64_t a1, void *a2)
{
  v3 = (void *)a2[7];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = a2;
  [v3 addObjectsFromArray:v4];
  [*(id *)(a1 + 40) pushConfirmedEventFields:v5];
}

void __55__SGSuggestHistory_confirmFieldValues_forStorageEvent___block_invoke_2(uint64_t a1, void *a2)
{
  v3 = (void *)a2[8];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = a2;
  [v3 addObjectsFromArray:v4];
  [*(id *)(a1 + 40) pushConfirmedEventWithoutTimestampFields:v5];
}

- (id)_hashesForConfirmedField:(id)a3 value:(id)a4 storageEvent:(id)a5 forMatching:(BOOL)a6
{
  BOOL v6 = a6;
  v24[3] = *MEMORY[0x1E4F143B8];
  uint64_t v10 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  uint64_t v14 = (void *)[[v10 alloc] initWithCapacity:2];
  BOOL v15 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v12 requiringSecureCoding:1 error:0];

  id v16 = v15;
  [v16 bytes];
  [v16 length];
  v17 = _PASBytesToHex();
  id v18 = [v11 opaqueKey];

  v24[0] = v18;
  v24[1] = v13;
  v24[2] = v17;
  id v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:3];

  id v20 = [(SGSuggestHistory *)self salt];
  id v21 = SGSha256BytesForStrings(v19, v20);
  [v14 addObject:v21];

  uint64_t v22 = [(SGSuggestHistory *)self hashesByAddingCompatibilityHashesToHashes:v14 forMatching:v6];

  return v22;
}

- (BOOL)hasContactDetailKey:(id)a3
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 serialize];
  v18[0] = v5;
  BOOL v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
  id v7 = [(SGSuggestHistory *)self hashesForStrings:v6 forMatching:1];

  uint64_t v14 = 0;
  BOOL v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  lock = self->_lock;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __40__SGSuggestHistory_hasContactDetailKey___block_invoke;
  v11[3] = &unk_1E65B6EA0;
  id v13 = &v14;
  v11[4] = self;
  id v9 = v7;
  id v12 = v9;
  [(_PASLock *)lock runWithLockAcquired:v11];
  LOBYTE(self) = *((unsigned char *)v15 + 24) != 0;

  _Block_object_dispose(&v14, 8);
  return (char)self;
}

uint64_t __40__SGSuggestHistory_hasContactDetailKey___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = [*(id *)(a1 + 32) _anyHash:*(void *)(a1 + 40) inSet:*(void *)(a2 + 72)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (BOOL)hasContactDetail:(id)a3 forContact:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v16 = 0;
  char v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  lock = self->_lock;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __48__SGSuggestHistory_hasContactDetail_forContact___block_invoke;
  v12[3] = &unk_1E65B6EF0;
  BOOL v15 = &v16;
  v12[4] = self;
  id v9 = v6;
  id v13 = v9;
  id v10 = v7;
  id v14 = v10;
  [(_PASLock *)lock runWithLockAcquired:v12];
  LOBYTE(v6) = *((unsigned char *)v17 + 24);

  _Block_object_dispose(&v16, 8);
  return (char)v6;
}

void __48__SGSuggestHistory_hasContactDetail_forContact___block_invoke(void *a1, void *a2)
{
  v3 = (void *)a1[4];
  uint64_t v4 = a1[5];
  uint64_t v5 = a1[6];
  id v6 = a2;
  id v8 = [v3 hashesForContactDetail:v4 fromContact:v5 forMatching:1];
  uint64_t v7 = v6[9];

  *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = [v3 _anyHash:v8 inSet:v7];
}

- (void)rejectEventFromExternalDevice:(id)a3
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(SGSuggestHistory *)self kvs];
  id v6 = +[SGSuggestHistory newTestingInstanceWithSharedKVS:v5];

  uint64_t v7 = [v4 opaqueKey];
  id v8 = [v6 rejectHashesForOpaqueKey:v7 forMatching:0];

  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy__8254;
  char v17 = __Block_byref_object_dispose__8255;
  id v18 = 0;
  lock = self->_lock;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __50__SGSuggestHistory_rejectEventFromExternalDevice___block_invoke;
  v12[3] = &unk_1E65B6C28;
  v12[4] = &v13;
  [(_PASLock *)lock runWithLockAcquired:v12];
  [(id)v14[5] addObjectsFromArray:v8];
  [(SGSuggestHistory *)self _setHashes:v14[5] forKey:@"rejectedEvents"];
  uint64_t v19 = *MEMORY[0x1E4F28A20];
  v20[0] = &unk_1F2535778;
  id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];
  id v11 = [MEMORY[0x1E4F28EA0] notificationWithName:@"new data" object:self userInfo:v10];
  [(SGSuggestHistory *)self handleSyncedDataChanged:v11];

  _Block_object_dispose(&v13, 8);
}

uint64_t __50__SGSuggestHistory_rejectEventFromExternalDevice___block_invoke(uint64_t a1, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = [*(id *)(a2 + 24) mutableCopy];
  return MEMORY[0x1F41817F8]();
}

- (void)confirmEventFromExternalDevice:(id)a3
{
  v29[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(SGSuggestHistory *)self kvs];
  id v6 = +[SGSuggestHistory newTestingInstanceWithSharedKVS:v5];

  uint64_t v7 = [v4 opaqueKey];
  id v8 = [v4 creationDate];
  [v8 timeIntervalSince1970];
  id v9 = objc_msgSend(v6, "confirmHashesForOpaqueKey:withCreationTime:forMatching:", v7, 0);

  id v10 = [v4 opaqueKey];
  id v11 = [v6 confirmHashesForOpaqueKeyWithoutTimestamp:v10 forMatching:0];

  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3032000000;
  id v25 = __Block_byref_object_copy__8254;
  id v26 = __Block_byref_object_dispose__8255;
  id v27 = 0;
  uint64_t v16 = 0;
  char v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = __Block_byref_object_copy__8254;
  id v20 = __Block_byref_object_dispose__8255;
  id v21 = 0;
  lock = self->_lock;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __51__SGSuggestHistory_confirmEventFromExternalDevice___block_invoke;
  v15[3] = &unk_1E65B6CC8;
  v15[4] = &v22;
  v15[5] = &v16;
  [(_PASLock *)lock runWithLockAcquired:v15];
  [(id)v23[5] addObjectsFromArray:v9];
  [(id)v17[5] addObjectsFromArray:v11];
  [(SGSuggestHistory *)self _setHashes:v23[5] forKey:@"events"];
  [(SGSuggestHistory *)self _setHashes:v17[5] forKey:@"eventsWithoutTimestamp"];
  uint64_t v28 = *MEMORY[0x1E4F28A20];
  v29[0] = &unk_1F2535778;
  uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:&v28 count:1];
  id v14 = [MEMORY[0x1E4F28EA0] notificationWithName:@"new data" object:self userInfo:v13];
  [(SGSuggestHistory *)self handleSyncedDataChanged:v14];

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);
}

uint64_t __51__SGSuggestHistory_confirmEventFromExternalDevice___block_invoke(uint64_t a1, void *a2)
{
  v3 = (void *)a2[1];
  id v4 = a2;
  uint64_t v5 = [v3 mutableCopy];
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  id v8 = (void *)v4[2];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [v8 mutableCopy];
  return MEMORY[0x1F41817F8]();
}

- (void)addSuggestHistoryObserver:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"SGSuggestHistory.m", 1630, @"Invalid parameter not satisfying: %@", @"suggestHistoryObserver" object file lineNumber description];
  }
  lock = self->_lock;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __46__SGSuggestHistory_addSuggestHistoryObserver___block_invoke;
  v9[3] = &unk_1E65B6C00;
  id v10 = v5;
  id v7 = v5;
  [(_PASLock *)lock runWithLockAcquired:v9];
}

uint64_t __46__SGSuggestHistory_addSuggestHistoryObserver___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a2 + 96) addObject:*(void *)(a1 + 32)];
}

- (BOOL)isValidSuggestion:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    if ([v5 state] == 1)
    {
      uint64_t v6 = [v5 contact];
      BOOL v7 = [(SGSuggestHistory *)self hasContact:v6];
LABEL_18:
      char v11 = !v7;
      goto LABEL_19;
    }
    if ([v5 state] == 2)
    {
      uint64_t v6 = [v5 contact];
      BOOL v9 = [(SGSuggestHistory *)self isUpdatableContact:v6];
      goto LABEL_16;
    }
    goto LABEL_14;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    int v8 = [v5 state];
    switch(v8)
    {
      case 3:
        uint64_t v6 = [v5 event];
        BOOL v9 = [(SGSuggestHistory *)self isValidCancelledEvent:v6];
        goto LABEL_16;
      case 2:
        uint64_t v6 = [v5 event];
        BOOL v7 = [(SGSuggestHistory *)self isRejectedEvent:v6];
        goto LABEL_18;
      case 1:
        uint64_t v6 = [v5 event];
        BOOL v9 = [(SGSuggestHistory *)self isValidNewEvent:v6];
LABEL_16:
        char v11 = v9;
LABEL_19:

        goto LABEL_20;
    }
LABEL_14:
    char v11 = 1;
LABEL_20:

    goto LABEL_21;
  }
  id v10 = sgLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    int v14 = 138412290;
    id v15 = (id)objc_opt_class();
    id v13 = v15;
    _os_log_error_impl(&dword_1CA650000, v10, OS_LOG_TYPE_ERROR, "Argument must be of type SGRealtimeContact or SGRealtimeEvent, but was %@", (uint8_t *)&v14, 0xCu);
  }
  char v11 = 1;
LABEL_21:

  return v11;
}

- (BOOL)isRejectedReminder:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  lock = self->_lock;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __39__SGSuggestHistory_isRejectedReminder___block_invoke;
  v8[3] = &unk_1E65B6EA0;
  id v10 = &v11;
  v8[4] = self;
  id v6 = v4;
  id v9 = v6;
  [(_PASLock *)lock runWithLockAcquired:v8];
  LOBYTE(lock) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)lock;
}

void __39__SGSuggestHistory_isRejectedReminder___block_invoke(void *a1, void *a2)
{
  v3 = (void *)a1[4];
  id v4 = (void *)a1[5];
  id v5 = a2;
  id v8 = [v4 opaqueKey];
  id v6 = [v3 rejectHashesForOpaqueKey:v8 forMatching:1];
  uint64_t v7 = v5[5];

  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = [v3 _anyHash:v6 inSet:v7];
}

- (BOOL)isConfirmedReminder:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  lock = self->_lock;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __40__SGSuggestHistory_isConfirmedReminder___block_invoke;
  v8[3] = &unk_1E65B6EA0;
  id v10 = &v11;
  v8[4] = self;
  id v6 = v4;
  id v9 = v6;
  [(_PASLock *)lock runWithLockAcquired:v8];
  LOBYTE(lock) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)lock;
}

void __40__SGSuggestHistory_isConfirmedReminder___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = *(void **)(a1 + 40);
  id v5 = a2;
  id v9 = [v4 opaqueKey];
  id v6 = [*(id *)(a1 + 40) creationDate];
  [v6 timeIntervalSince1970];
  uint64_t v7 = objc_msgSend(v3, "confirmHashesForRemindersOpaqueKey:withCreationTime:forMatching:", v9, 1);
  uint64_t v8 = v5[4];

  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v3 _anyHash:v7 inSet:v8];
}

- (BOOL)isValidNewReminder:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  lock = self->_lock;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __39__SGSuggestHistory_isValidNewReminder___block_invoke;
  v8[3] = &unk_1E65B6EA0;
  id v10 = &v11;
  v8[4] = self;
  id v6 = v4;
  id v9 = v6;
  [(_PASLock *)lock runWithLockAcquired:v8];
  LOBYTE(lock) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)lock;
}

uint64_t __39__SGSuggestHistory_isValidNewReminder___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isConfirmedReminder:*(void *)(a1 + 40)];
  if (result)
  {
    char v3 = 0;
  }
  else
  {
    uint64_t result = [*(id *)(a1 + 32) isRejectedReminder:*(void *)(a1 + 40)];
    char v3 = result ^ 1;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v3;
  return result;
}

- (void)removeConfirmationHistoryForEntityWithOpaqueKey:(id)a3 creationTimestamp:(SGUnixTimestamp_)a4
{
  id v6 = a3;
  lock = self->_lock;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __86__SGSuggestHistory_removeConfirmationHistoryForEntityWithOpaqueKey_creationTimestamp___block_invoke;
  v9[3] = &unk_1E65B6EC8;
  void v9[4] = self;
  id v10 = v6;
  double secondsFromUnixEpoch = a4.secondsFromUnixEpoch;
  id v8 = v6;
  [(_PASLock *)lock runWithLockAcquired:v9];
}

void __86__SGSuggestHistory_removeConfirmationHistoryForEntityWithOpaqueKey_creationTimestamp___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  char v3 = a2;
  id v4 = [*(id *)(a1 + 32) rejectHashesForOpaqueKey:*(void *)(a1 + 40) forMatching:1];
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v41 objects:v47 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    char v7 = 0;
    uint64_t v8 = *(void *)v42;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v42 != v8) {
          objc_enumerationMutation(v4);
        }
        id v10 = *(void **)(*((void *)&v41 + 1) + 8 * i);
        if ([v3[3] containsObject:v10])
        {
          uint64_t v11 = [*(id *)(a1 + 32) _canaryHash];
          char v12 = [v10 isEqual:v11];

          if ((v12 & 1) == 0)
          {
            [v3[3] removeObject:v10];
            char v7 = 1;
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v41 objects:v47 count:16];
    }
    while (v6);
    if (v7) {
      [*(id *)(a1 + 32) pushRejectedEvents:v3];
    }
  }
  long long v32 = v4;
  uint64_t v13 = [*(id *)(a1 + 32) confirmHashesForOpaqueKey:*(void *)(a1 + 40) withCreationTime:1 forMatching:*(double *)(a1 + 48)];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v37 objects:v46 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    char v16 = 0;
    uint64_t v17 = *(void *)v38;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v38 != v17) {
          objc_enumerationMutation(v13);
        }
        uint64_t v19 = *(void **)(*((void *)&v37 + 1) + 8 * j);
        if ([v3[1] containsObject:v19])
        {
          id v20 = [*(id *)(a1 + 32) _canaryHash];
          char v21 = [v19 isEqual:v20];

          if ((v21 & 1) == 0)
          {
            [v3[1] removeObject:v19];
            char v16 = 1;
          }
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v37 objects:v46 count:16];
    }
    while (v15);
    if (v16) {
      [*(id *)(a1 + 32) pushConfirmedEvents:v3];
    }
  }
  uint64_t v22 = [*(id *)(a1 + 32) confirmHashesForOpaqueKeyWithoutTimestamp:*(void *)(a1 + 40) forMatching:1];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  uint64_t v23 = [v22 countByEnumeratingWithState:&v33 objects:v45 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    long long v31 = v13;
    char v25 = 0;
    uint64_t v26 = *(void *)v34;
    do
    {
      for (uint64_t k = 0; k != v24; ++k)
      {
        if (*(void *)v34 != v26) {
          objc_enumerationMutation(v22);
        }
        uint64_t v28 = *(void **)(*((void *)&v33 + 1) + 8 * k);
        if (objc_msgSend(v3[2], "containsObject:", v28, v31))
        {
          id v29 = [*(id *)(a1 + 32) _canaryHash];
          char v30 = [v28 isEqual:v29];

          if ((v30 & 1) == 0)
          {
            [v3[2] removeObject:v28];
            char v25 = 1;
          }
        }
      }
      uint64_t v24 = [v22 countByEnumeratingWithState:&v33 objects:v45 count:16];
    }
    while (v24);
    uint64_t v13 = v31;
    if (v25) {
      [*(id *)(a1 + 32) pushConfirmedEventsWithoutTimestamp:v3];
    }
  }
}

- (void)removeConfirmationHistoryForEvent:(id)a3
{
  id v4 = a3;
  id v6 = [v4 opaqueKey];
  uint64_t v5 = [v4 creationDate];

  [v5 timeIntervalSince1970];
  -[SGSuggestHistory removeConfirmationHistoryForEntityWithOpaqueKey:creationTimestamp:](self, "removeConfirmationHistoryForEntityWithOpaqueKey:creationTimestamp:", v6);
}

- (BOOL)isRejectedEvent:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  char v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  locuint64_t k = self->_lock;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __36__SGSuggestHistory_isRejectedEvent___block_invoke;
  v8[3] = &unk_1E65B6EA0;
  id v10 = &v11;
  v8[4] = self;
  id v6 = v4;
  id v9 = v6;
  [(_PASLock *)lock runWithLockAcquired:v8];
  LOBYTE(lock) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)lock;
}

void __36__SGSuggestHistory_isRejectedEvent___block_invoke(void *a1, void *a2)
{
  char v3 = (void *)a1[4];
  id v4 = (void *)a1[5];
  uint64_t v5 = a2;
  id v8 = [v4 opaqueKey];
  id v6 = [v3 rejectHashesForOpaqueKey:v8 forMatching:1];
  uint64_t v7 = v5[3];

  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = [v3 _anyHash:v6 inSet:v7];
}

- (BOOL)isConfirmedEvent:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  char v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  locuint64_t k = self->_lock;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __37__SGSuggestHistory_isConfirmedEvent___block_invoke;
  v8[3] = &unk_1E65B6EA0;
  id v10 = &v11;
  v8[4] = self;
  id v6 = v4;
  id v9 = v6;
  [(_PASLock *)lock runWithLockAcquired:v8];
  LOBYTE(lock) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)lock;
}

void __37__SGSuggestHistory_isConfirmedEvent___block_invoke(uint64_t a1, void *a2)
{
  char v3 = *(void **)(a1 + 32);
  id v4 = *(void **)(a1 + 40);
  uint64_t v5 = a2;
  id v9 = [v4 opaqueKey];
  id v6 = [*(id *)(a1 + 40) creationDate];
  [v6 timeIntervalSince1970];
  uint64_t v7 = objc_msgSend(v3, "confirmHashesForOpaqueKey:withCreationTime:forMatching:", v9, 1);
  uint64_t v8 = v5[1];

  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v3 _anyHash:v7 inSet:v8];
}

- (BOOL)isConfirmedEventWithoutTimeStamp:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  char v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  locuint64_t k = self->_lock;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __53__SGSuggestHistory_isConfirmedEventWithoutTimeStamp___block_invoke;
  v8[3] = &unk_1E65B6EA0;
  id v10 = &v11;
  v8[4] = self;
  id v6 = v4;
  id v9 = v6;
  [(_PASLock *)lock runWithLockAcquired:v8];
  LOBYTE(lock) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)lock;
}

void __53__SGSuggestHistory_isConfirmedEventWithoutTimeStamp___block_invoke(void *a1, void *a2)
{
  char v3 = (void *)a1[4];
  id v4 = (void *)a1[5];
  uint64_t v5 = a2;
  id v8 = [v4 opaqueKey];
  id v6 = [v3 confirmHashesForOpaqueKeyWithoutTimestamp:v8 forMatching:1];
  uint64_t v7 = v5[2];

  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = [v3 _anyHash:v6 inSet:v7];
}

- (BOOL)isUpdatableContact:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  char v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  locuint64_t k = self->_lock;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __39__SGSuggestHistory_isUpdatableContact___block_invoke;
  v8[3] = &unk_1E65B6EA0;
  id v10 = &v11;
  v8[4] = self;
  id v6 = v4;
  id v9 = v6;
  [(_PASLock *)lock runWithLockAcquired:v8];
  LOBYTE(lock) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)lock;
}

void __39__SGSuggestHistory_isUpdatableContact___block_invoke(void *a1, void *a2)
{
  char v3 = (void *)a1[4];
  uint64_t v4 = a1[5];
  uint64_t v5 = a2;
  id v7 = [v3 hashesForContact:v4 forMatching:1];
  uint64_t v6 = v5[10];

  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = [v3 _anyHash:v7 inSet:v6] ^ 1;
}

- (BOOL)isValidCancelledEvent:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  char v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  locuint64_t k = self->_lock;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __42__SGSuggestHistory_isValidCancelledEvent___block_invoke;
  v8[3] = &unk_1E65B6EA0;
  id v10 = &v11;
  v8[4] = self;
  id v6 = v4;
  id v9 = v6;
  [(_PASLock *)lock runWithLockAcquired:v8];
  LOBYTE(lock) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)lock;
}

uint64_t __42__SGSuggestHistory_isValidCancelledEvent___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isConfirmedEvent:*(void *)(a1 + 40)];
  if (result)
  {
    char v3 = 0;
  }
  else
  {
    uint64_t result = [*(id *)(a1 + 32) isRejectedEvent:*(void *)(a1 + 40)];
    char v3 = result ^ 1;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v3;
  return result;
}

- (BOOL)isValidNewEvent:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  char v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  locuint64_t k = self->_lock;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __36__SGSuggestHistory_isValidNewEvent___block_invoke;
  v8[3] = &unk_1E65B6EA0;
  id v10 = &v11;
  v8[4] = self;
  id v6 = v4;
  id v9 = v6;
  [(_PASLock *)lock runWithLockAcquired:v8];
  LOBYTE(lock) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)lock;
}

uint64_t __36__SGSuggestHistory_isValidNewEvent___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isConfirmedEvent:*(void *)(a1 + 40)];
  if ((result & 1) != 0
    || (uint64_t result = [*(id *)(a1 + 32) isConfirmedEventWithoutTimeStamp:*(void *)(a1 + 40)],
        (result & 1) != 0))
  {
    char v3 = 0;
  }
  else
  {
    uint64_t result = [*(id *)(a1 + 32) isRejectedEvent:*(void *)(a1 + 40)];
    char v3 = result ^ 1;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v3;
  return result;
}

- (BOOL)hasStorageContact:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  char v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  locuint64_t k = self->_lock;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __38__SGSuggestHistory_hasStorageContact___block_invoke;
  v8[3] = &unk_1E65B6EA0;
  id v10 = &v11;
  v8[4] = self;
  id v6 = v4;
  id v9 = v6;
  [(_PASLock *)lock runWithLockAcquired:v8];
  LOBYTE(lock) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)lock;
}

void __38__SGSuggestHistory_hasStorageContact___block_invoke(void *a1, void *a2)
{
  char v3 = (void *)a1[4];
  uint64_t v4 = a1[5];
  uint64_t v5 = a2;
  id v7 = [v3 hashesForStorageContact:v4 forMatching:1];
  uint64_t v6 = v5[6];

  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = [v3 _anyHash:v7 inSet:v6];
}

- (BOOL)hasContact:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  char v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  locuint64_t k = self->_lock;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __31__SGSuggestHistory_hasContact___block_invoke;
  v8[3] = &unk_1E65B6EA0;
  id v10 = &v11;
  v8[4] = self;
  id v6 = v4;
  id v9 = v6;
  [(_PASLock *)lock runWithLockAcquired:v8];
  LOBYTE(lock) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)lock;
}

void __31__SGSuggestHistory_hasContact___block_invoke(void *a1, void *a2)
{
  char v3 = (void *)a1[4];
  uint64_t v4 = a1[5];
  uint64_t v5 = a2;
  id v7 = [v3 hashesForContact:v4 forMatching:1];
  uint64_t v6 = v5[6];

  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = [v3 _anyHash:v7 inSet:v6];
}

- (BOOL)_anyHash:(id)a3 inSet:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        if (objc_msgSend(v7, "containsObject:", v13, (void)v18))
        {
          char v14 = [(SGSuggestHistory *)self _canaryHash];
          int v15 = [v13 isEqual:v14];

          if (!v15)
          {
            BOOL v16 = 1;
            goto LABEL_12;
          }
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
  BOOL v16 = 0;
LABEL_12:

  return v16;
}

- (void)rejectReminderFromExternalDevice:(id)a3
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(SGSuggestHistory *)self kvs];
  id v6 = +[SGSuggestHistory newTestingInstanceWithSharedKVS:v5];

  id v7 = [v4 opaqueKey];
  id v8 = [v6 rejectHashesForOpaqueKey:v7 forMatching:0];

  uint64_t v13 = 0;
  char v14 = &v13;
  uint64_t v15 = 0x3032000000;
  BOOL v16 = __Block_byref_object_copy__8254;
  uint64_t v17 = __Block_byref_object_dispose__8255;
  id v18 = 0;
  locuint64_t k = self->_lock;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __53__SGSuggestHistory_rejectReminderFromExternalDevice___block_invoke;
  v12[3] = &unk_1E65B6C28;
  v12[4] = &v13;
  [(_PASLock *)lock runWithLockAcquired:v12];
  [(id)v14[5] addObjectsFromArray:v8];
  [(SGSuggestHistory *)self _setHashes:v14[5] forKey:@"rejectedReminders"];
  uint64_t v19 = *MEMORY[0x1E4F28A20];
  v20[0] = &unk_1F2535778;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];
  uint64_t v11 = [MEMORY[0x1E4F28EA0] notificationWithName:@"new data" object:self userInfo:v10];
  [(SGSuggestHistory *)self handleSyncedDataChanged:v11];

  _Block_object_dispose(&v13, 8);
}

uint64_t __53__SGSuggestHistory_rejectReminderFromExternalDevice___block_invoke(uint64_t a1, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = [*(id *)(a2 + 40) mutableCopy];
  return MEMORY[0x1F41817F8]();
}

- (void)confirmReminderFromExternalDevice:(id)a3
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(SGSuggestHistory *)self kvs];
  id v6 = +[SGSuggestHistory newTestingInstanceWithSharedKVS:v5];

  id v7 = [v4 opaqueKey];
  id v8 = [v4 creationDate];
  [v8 timeIntervalSince1970];
  uint64_t v9 = objc_msgSend(v6, "confirmHashesForRemindersOpaqueKey:withCreationTime:forMatching:", v7, 0);

  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy__8254;
  id v18 = __Block_byref_object_dispose__8255;
  id v19 = 0;
  locuint64_t k = self->_lock;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __54__SGSuggestHistory_confirmReminderFromExternalDevice___block_invoke;
  v13[3] = &unk_1E65B6C28;
  v13[4] = &v14;
  [(_PASLock *)lock runWithLockAcquired:v13];
  [(id)v15[5] addObjectsFromArray:v9];
  [(SGSuggestHistory *)self _setHashes:v15[5] forKey:@"reminders"];
  uint64_t v20 = *MEMORY[0x1E4F28A20];
  v21[0] = &unk_1F2535778;
  uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];
  char v12 = [MEMORY[0x1E4F28EA0] notificationWithName:@"new data" object:self userInfo:v11];
  [(SGSuggestHistory *)self handleSyncedDataChanged:v12];

  _Block_object_dispose(&v14, 8);
}

uint64_t __54__SGSuggestHistory_confirmReminderFromExternalDevice___block_invoke(uint64_t a1, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = [*(id *)(a2 + 32) mutableCopy];
  return MEMORY[0x1F41817F8]();
}

- (void)writeAndPushRejectedReminderHashes:(id)a3
{
  id v4 = a3;
  locuint64_t k = self->_lock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55__SGSuggestHistory_writeAndPushRejectedReminderHashes___block_invoke;
  v7[3] = &unk_1E65B6E78;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  [(_PASLock *)lock runWithLockAcquired:v7];
}

void __55__SGSuggestHistory_writeAndPushRejectedReminderHashes___block_invoke(uint64_t a1, void *a2)
{
  char v3 = (void *)a2[5];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = a2;
  [v3 addObjectsFromArray:v4];
  [*(id *)(a1 + 40) pushRejectedReminders:v5];
}

- (void)rejectReminder:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = sgRemindersLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    id v8 = [v4 opaqueKey];
    int v9 = 138412290;
    uint64_t v10 = v8;
    _os_log_debug_impl(&dword_1CA650000, v5, OS_LOG_TYPE_DEBUG, "Rejecting reminder with opaqueKey %@", (uint8_t *)&v9, 0xCu);
  }
  id v6 = [v4 opaqueKey];
  id v7 = [(SGSuggestHistory *)self rejectHashesForOpaqueKey:v6 forMatching:0];
  [(SGSuggestHistory *)self writeAndPushRejectedReminderHashes:v7];

  +[SGDNotificationBroadcaster emitReminderUpdated:0];
}

- (void)writeAndPushConfirmedReminderHashes:(id)a3
{
  id v4 = a3;
  locuint64_t k = self->_lock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __56__SGSuggestHistory_writeAndPushConfirmedReminderHashes___block_invoke;
  v7[3] = &unk_1E65B6E78;
  id v8 = v4;
  int v9 = self;
  id v6 = v4;
  [(_PASLock *)lock runWithLockAcquired:v7];
}

void __56__SGSuggestHistory_writeAndPushConfirmedReminderHashes___block_invoke(uint64_t a1, void *a2)
{
  char v3 = (void *)a2[4];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = a2;
  [v3 addObjectsFromArray:v4];
  [*(id *)(a1 + 40) pushConfirmedReminders:v5];
}

- (void)confirmReminder:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = sgRemindersLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v10 = [v4 opaqueKey];
    int v11 = 138412290;
    char v12 = v10;
    _os_log_debug_impl(&dword_1CA650000, v5, OS_LOG_TYPE_DEBUG, "Confirming reminder with opaqueKey %@", (uint8_t *)&v11, 0xCu);
  }
  id v6 = [v4 opaqueKey];
  id v7 = [v4 creationDate];
  [v7 timeIntervalSince1970];
  id v8 = -[SGSuggestHistory confirmHashesForRemindersOpaqueKey:withCreationTime:forMatching:](self, "confirmHashesForRemindersOpaqueKey:withCreationTime:forMatching:", v6, 0);
  [(SGSuggestHistory *)self writeAndPushConfirmedReminderHashes:v8];

  int v9 = [v4 recordId];
  +[SGDNotificationBroadcaster emitReminderUpdated:v9];
}

- (void)writeAndPushRejectedEventHashes:(id)a3
{
  id v4 = a3;
  locuint64_t k = self->_lock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__SGSuggestHistory_writeAndPushRejectedEventHashes___block_invoke;
  v7[3] = &unk_1E65B6E78;
  id v8 = v4;
  int v9 = self;
  id v6 = v4;
  [(_PASLock *)lock runWithLockAcquired:v7];
}

void __52__SGSuggestHistory_writeAndPushRejectedEventHashes___block_invoke(uint64_t a1, void *a2)
{
  char v3 = (void *)a2[3];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = a2;
  [v3 addObjectsFromArray:v4];
  [*(id *)(a1 + 40) pushRejectedEvents:v5];
}

- (void)rejectStorageEvent:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = sgLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 138412290;
    id v9 = v4;
    _os_log_debug_impl(&dword_1CA650000, v5, OS_LOG_TYPE_DEBUG, "Rejecting storage event %@", (uint8_t *)&v8, 0xCu);
  }

  id v6 = [v4 opaqueKey];
  id v7 = [(SGSuggestHistory *)self rejectHashesForOpaqueKey:v6 forMatching:0];
  [(SGSuggestHistory *)self writeAndPushRejectedEventHashes:v7];

  +[SGDNotificationBroadcaster emitEventUpdated:0];
}

- (void)rejectEvent:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = sgLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 138412290;
    id v9 = v4;
    _os_log_debug_impl(&dword_1CA650000, v5, OS_LOG_TYPE_DEBUG, "Rejecting event %@", (uint8_t *)&v8, 0xCu);
  }

  id v6 = [v4 opaqueKey];
  id v7 = [(SGSuggestHistory *)self rejectHashesForOpaqueKey:v6 forMatching:0];
  [(SGSuggestHistory *)self writeAndPushRejectedEventHashes:v7];

  +[SGDNotificationBroadcaster emitEventUpdated:0];
}

- (void)writeAndPushConfirmedEventWithoutTimestampHashes:(id)a3
{
  id v4 = a3;
  locuint64_t k = self->_lock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __69__SGSuggestHistory_writeAndPushConfirmedEventWithoutTimestampHashes___block_invoke;
  v7[3] = &unk_1E65B6E78;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  [(_PASLock *)lock runWithLockAcquired:v7];
}

void __69__SGSuggestHistory_writeAndPushConfirmedEventWithoutTimestampHashes___block_invoke(uint64_t a1, void *a2)
{
  char v3 = (void *)a2[2];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = a2;
  [v3 addObjectsFromArray:v4];
  [*(id *)(a1 + 40) pushConfirmedEventsWithoutTimestamp:v5];
}

- (void)writeAndPushConfirmedEventHashes:(id)a3
{
  id v4 = a3;
  locuint64_t k = self->_lock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __53__SGSuggestHistory_writeAndPushConfirmedEventHashes___block_invoke;
  v7[3] = &unk_1E65B6E78;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  [(_PASLock *)lock runWithLockAcquired:v7];
}

void __53__SGSuggestHistory_writeAndPushConfirmedEventHashes___block_invoke(uint64_t a1, void *a2)
{
  char v3 = (void *)a2[1];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = a2;
  [v3 addObjectsFromArray:v4];
  [*(id *)(a1 + 40) pushConfirmedEvents:v5];
}

- (void)confirmStorageEvent:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = sgLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v11 = 138412290;
    id v12 = v4;
    _os_log_debug_impl(&dword_1CA650000, v5, OS_LOG_TYPE_DEBUG, "Confirming storage event %@", (uint8_t *)&v11, 0xCu);
  }

  id v6 = [v4 opaqueKey];
  [v4 creationTimestamp];
  id v7 = -[SGSuggestHistory confirmHashesForOpaqueKey:withCreationTime:forMatching:](self, "confirmHashesForOpaqueKey:withCreationTime:forMatching:", v6, 0);
  [(SGSuggestHistory *)self writeAndPushConfirmedEventHashes:v7];

  id v8 = [v4 opaqueKey];
  id v9 = [(SGSuggestHistory *)self confirmHashesForOpaqueKeyWithoutTimestamp:v8 forMatching:0];
  [(SGSuggestHistory *)self writeAndPushConfirmedEventWithoutTimestampHashes:v9];

  uint64_t v10 = [v4 recordId];
  +[SGDNotificationBroadcaster emitEventUpdated:v10];
}

- (void)confirmEvent:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = sgLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v12 = 138412290;
    id v13 = v4;
    _os_log_debug_impl(&dword_1CA650000, v5, OS_LOG_TYPE_DEBUG, "Confirming event %@", (uint8_t *)&v12, 0xCu);
  }

  id v6 = [v4 opaqueKey];
  id v7 = [v4 creationDate];
  [v7 timeIntervalSince1970];
  id v8 = -[SGSuggestHistory confirmHashesForOpaqueKey:withCreationTime:forMatching:](self, "confirmHashesForOpaqueKey:withCreationTime:forMatching:", v6, 0);
  [(SGSuggestHistory *)self writeAndPushConfirmedEventHashes:v8];

  id v9 = [v4 opaqueKey];
  uint64_t v10 = [(SGSuggestHistory *)self confirmHashesForOpaqueKeyWithoutTimestamp:v9 forMatching:0];
  [(SGSuggestHistory *)self writeAndPushConfirmedEventWithoutTimestampHashes:v10];

  int v11 = [v4 recordId];
  +[SGDNotificationBroadcaster emitEventUpdated:v11];
}

- (void)rejectContact:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = sgLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v15 = v4;
    _os_log_debug_impl(&dword_1CA650000, v5, OS_LOG_TYPE_DEBUG, "Rejecting contact %@", buf, 0xCu);
  }

  locuint64_t k = self->_lock;
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  uint64_t v10 = __34__SGSuggestHistory_rejectContact___block_invoke;
  int v11 = &unk_1E65B6E78;
  int v12 = self;
  id v13 = v4;
  id v7 = v4;
  [(_PASLock *)lock runWithLockAcquired:&v8];
  +[SGDNotificationBroadcaster emitContactUpdated:](SGDNotificationBroadcaster, "emitContactUpdated:", 0, v8, v9, v10, v11, v12);
}

void __34__SGSuggestHistory_rejectContact___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a2 + 48);
  id v3 = [*(id *)(a1 + 32) hashesForContact:*(void *)(a1 + 40) forMatching:0];
  [v2 addObjectsFromArray:v3];
}

- (void)rejectRealtimeContact:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = sgLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v15 = v4;
    _os_log_debug_impl(&dword_1CA650000, v5, OS_LOG_TYPE_DEBUG, "Rejecting contact %@", buf, 0xCu);
  }

  locuint64_t k = self->_lock;
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  uint64_t v10 = __42__SGSuggestHistory_rejectRealtimeContact___block_invoke;
  int v11 = &unk_1E65B6E78;
  id v12 = v4;
  id v13 = self;
  id v7 = v4;
  [(_PASLock *)lock runWithLockAcquired:&v8];
  +[SGDNotificationBroadcaster emitContactUpdated:](SGDNotificationBroadcaster, "emitContactUpdated:", 0, v8, v9, v10, v11);
}

void __42__SGSuggestHistory_rejectRealtimeContact___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([*(id *)(a1 + 32) state] == 1)
  {
    id v4 = (void *)v3[6];
    uint64_t v5 = *(void **)(a1 + 40);
    id v6 = [*(id *)(a1 + 32) contact];
    id v7 = [v5 hashesForContact:v6 forMatching:0];
    [v4 addObjectsFromArray:v7];

    [*(id *)(a1 + 40) pushContacts:v3];
  }
  else if ([*(id *)(a1 + 32) state] == 2)
  {
    uint64_t v8 = (void *)v3[10];
    uint64_t v9 = *(void **)(a1 + 40);
    uint64_t v10 = [*(id *)(a1 + 32) contact];
    int v11 = [v9 hashesForContact:v10 forMatching:0];
    [v8 addObjectsFromArray:v11];

    [*(id *)(a1 + 40) pushDontUpdate:v3];
  }
  else
  {
    id v12 = sgLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v13 = [*(id *)(a1 + 32) state];
      v14[0] = 67109120;
      v14[1] = v13;
      _os_log_error_impl(&dword_1CA650000, v12, OS_LOG_TYPE_ERROR, "Don't know how to deal with this realtime contact state (state = %i)", (uint8_t *)v14, 8u);
    }
  }
}

- (void)rejectContactDetailKey:(id)a3
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v4 = [a3 serialize];
  v7[0] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  id v6 = [(SGSuggestHistory *)self hashesForStrings:v5 forMatching:0];
  [(SGSuggestHistory *)self confirmOrRejectDetailHashes:v6];
}

- (void)confirmOrRejectRecordForContact:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = sgLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v16 = v4;
    _os_log_debug_impl(&dword_1CA650000, v5, OS_LOG_TYPE_DEBUG, "Confirming or rejecting contact %@", buf, 0xCu);
  }

  locuint64_t k = self->_lock;
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  int v11 = __52__SGSuggestHistory_confirmOrRejectRecordForContact___block_invoke;
  id v12 = &unk_1E65B6E78;
  int v13 = self;
  id v14 = v4;
  id v7 = v4;
  [(_PASLock *)lock runWithLockAcquired:&v9];
  uint64_t v8 = objc_msgSend(v7, "recordId", v9, v10, v11, v12, v13);
  +[SGDNotificationBroadcaster emitContactUpdated:v8];
}

void __52__SGSuggestHistory_confirmOrRejectRecordForContact___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (void *)a2[6];
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v7 = a2;
  id v6 = [v4 hashesForStorageContact:v5 forMatching:0];
  [v3 addObjectsFromArray:v6];

  [*(id *)(a1 + 32) pushContacts:v7];
}

- (void)confirmOrRejectDetail:(id)a3 forContact:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = sgLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v11 = 138412290;
    id v12 = v6;
    _os_log_debug_impl(&dword_1CA650000, v8, OS_LOG_TYPE_DEBUG, "Confirming or rejecting record for contact %@", (uint8_t *)&v11, 0xCu);
  }

  uint64_t v9 = [(SGSuggestHistory *)self hashesForContactDetail:v7 fromContact:v6 forMatching:0];

  [(SGSuggestHistory *)self confirmOrRejectDetailHashes:v9];
  uint64_t v10 = [v6 recordId];
  +[SGDNotificationBroadcaster emitContactUpdated:v10];
}

- (void)confirmOrRejectDetailHashes:(id)a3
{
  id v4 = a3;
  locuint64_t k = self->_lock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __48__SGSuggestHistory_confirmOrRejectDetailHashes___block_invoke;
  v7[3] = &unk_1E65B6E78;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  [(_PASLock *)lock runWithLockAcquired:v7];
}

void __48__SGSuggestHistory_confirmOrRejectDetailHashes___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (void *)a2[9];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = a2;
  [v3 addObjectsFromArray:v4];
  [*(id *)(a1 + 40) pushStorageDetails:v5];
}

- (void)handleSyncedDataChanged:(id)a3
{
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v70 = 0;
  v71 = &v70;
  uint64_t v72 = 0x3032000000;
  v73 = __Block_byref_object_copy__8254;
  v74 = __Block_byref_object_dispose__8255;
  id v75 = 0;
  uint64_t v64 = 0;
  v65 = &v64;
  uint64_t v66 = 0x3032000000;
  v67 = __Block_byref_object_copy__8254;
  v68 = __Block_byref_object_dispose__8255;
  id v69 = 0;
  v62[0] = 0;
  v62[1] = v62;
  v62[2] = 0x3032000000;
  v62[3] = __Block_byref_object_copy__8254;
  v62[4] = __Block_byref_object_dispose__8255;
  id v63 = 0;
  uint64_t v56 = 0;
  v57 = &v56;
  uint64_t v58 = 0x3032000000;
  v59 = __Block_byref_object_copy__8254;
  v60 = __Block_byref_object_dispose__8255;
  id v61 = 0;
  uint64_t v50 = 0;
  v51 = &v50;
  uint64_t v52 = 0x3032000000;
  v53 = __Block_byref_object_copy__8254;
  v54 = __Block_byref_object_dispose__8255;
  id v55 = 0;
  uint64_t v44 = 0;
  v45 = &v44;
  uint64_t v46 = 0x3032000000;
  v47 = __Block_byref_object_copy__8254;
  uint64_t v48 = __Block_byref_object_dispose__8255;
  id v49 = 0;
  uint64_t v5 = [v4 userInfo];
  id v6 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F28A20]];
  uint64_t v7 = [v6 unsignedIntegerValue];

  id v8 = sgLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109120;
    int v81 = v7;
    _os_log_debug_impl(&dword_1CA650000, v8, OS_LOG_TYPE_DEBUG, "Suggestions history synced data change, reason=%i", buf, 8u);
  }

  locuint64_t k = self->_lock;
  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  v43[2] = __44__SGSuggestHistory_handleSyncedDataChanged___block_invoke;
  v43[3] = &unk_1E65B6E50;
  v43[4] = self;
  v43[5] = &v70;
  v43[6] = &v64;
  v43[7] = v62;
  v43[8] = &v56;
  v43[9] = &v50;
  v43[10] = &v44;
  v43[11] = v7;
  [(_PASLock *)lock runWithLockAcquired:v43];
  if (v65[5])
  {
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v10 = (id)v71[5];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v39 objects:v79 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v40;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v40 != v12) {
            objc_enumerationMutation(v10);
          }
          [*(id *)(*((void *)&v39 + 1) + 8 * v13++) processNewConfirmOrRejectEventHashes:v65[5]];
        }
        while (v11 != v13);
        uint64_t v11 = [v10 countByEnumeratingWithState:&v39 objects:v79 count:16];
      }
      while (v11);
    }
  }
  if (v57[5])
  {
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v14 = (id)v71[5];
    uint64_t v15 = [v14 countByEnumeratingWithState:&v35 objects:v78 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v36;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v36 != v16) {
            objc_enumerationMutation(v14);
          }
          [*(id *)(*((void *)&v35 + 1) + 8 * v17++) processNewConfirmOrRejectEventHashes:v57[5]];
        }
        while (v15 != v17);
        uint64_t v15 = [v14 countByEnumeratingWithState:&v35 objects:v78 count:16];
      }
      while (v15);
    }
  }
  if (v51[5])
  {
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v18 = (id)v71[5];
    uint64_t v19 = [v18 countByEnumeratingWithState:&v31 objects:v77 count:16];
    if (v19)
    {
      uint64_t v20 = *(void *)v32;
      do
      {
        uint64_t v21 = 0;
        do
        {
          if (*(void *)v32 != v20) {
            objc_enumerationMutation(v18);
          }
          [*(id *)(*((void *)&v31 + 1) + 8 * v21++) processNewConfirmedOrRejectedReminderHashes:v51[5]];
        }
        while (v19 != v21);
        uint64_t v19 = [v18 countByEnumeratingWithState:&v31 objects:v77 count:16];
      }
      while (v19);
    }
  }
  if (v45[5])
  {
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v22 = (id)v71[5];
    uint64_t v23 = [v22 countByEnumeratingWithState:&v27 objects:v76 count:16];
    if (v23)
    {
      uint64_t v24 = *(void *)v28;
      do
      {
        uint64_t v25 = 0;
        do
        {
          if (*(void *)v28 != v24) {
            objc_enumerationMutation(v22);
          }
          objc_msgSend(*(id *)(*((void *)&v27 + 1) + 8 * v25++), "processNewConfirmedOrRejectedReminderHashes:", v45[5], (void)v27);
        }
        while (v23 != v25);
        uint64_t v23 = [v22 countByEnumeratingWithState:&v27 objects:v76 count:16];
      }
      while (v23);
    }
  }
  if (v7 == 3)
  {
    uint64_t v26 = sgLogHandle();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA650000, v26, OS_LOG_TYPE_DEFAULT, "SGSuggestHistory calling migrateIfNeeded due to NSUbiquitousKeyValueStoreAccountChange", buf, 2u);
    }

    [(SGSuggestHistory *)self migrateIfNeeded];
  }
  _Block_object_dispose(&v44, 8);

  _Block_object_dispose(&v50, 8);
  _Block_object_dispose(&v56, 8);

  _Block_object_dispose(v62, 8);
  _Block_object_dispose(&v64, 8);

  _Block_object_dispose(&v70, 8);
}

void __44__SGSuggestHistory_handleSyncedDataChanged___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v80 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)*((void *)v3 + 13);
  *((void *)v3 + 13) = 0;

  uint64_t v5 = (void *)*((void *)v3 + 14);
  *((void *)v3 + 14) = 0;

  uint64_t v6 = [*((id *)v3 + 12) copy];
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  switch(*(void *)(a1 + 88))
  {
    case 0:
      uint64_t v9 = [*(id *)(a1 + 32) loadResetInfo];
      id v10 = [v9 objectAtIndexedSubscript:0];
      unint64_t v11 = [v10 unsignedLongValue];

      uint64_t v12 = [*((id *)v3 + 11) objectAtIndexedSubscript:0];
      unint64_t v13 = [v12 unsignedLongValue];

      if (v11 <= v13) {
        goto LABEL_7;
      }
      id v14 = [v9 objectAtIndexedSubscript:1];
      [v14 doubleValue];
      double v16 = v15;

      [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
      double v18 = vabdd_f64(v17, v16);
      uint64_t v19 = sgLogHandle();
      uint64_t v20 = v19;
      if (v18 >= 900.0)
      {
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_debug_impl(&dword_1CA650000, v20, OS_LOG_TYPE_DEBUG, "Suppressing KVS history reset because time window has expired.", buf, 2u);
        }

        objc_storeStrong((id *)v3 + 11, v9);
LABEL_7:

        uint64_t v9 = [*(id *)(a1 + 32) setForKey:@"events"];
        if (([v9 isEqualToSet:*((void *)v3 + 1)] & 1) == 0)
        {
          uint64_t v21 = [v9 mutableCopy];
          uint64_t v22 = *(void *)(*(void *)(a1 + 48) + 8);
          uint64_t v23 = *(void **)(v22 + 40);
          *(void *)(v22 + 40) = v21;

          [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) minusSet:*((void *)v3 + 1)];
          uint64_t v24 = sgEventsLogHandle();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v25 = [v9 count];
            uint64_t v26 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) count];
            *(_DWORD *)buf = 134349312;
            uint64_t v77 = v25;
            __int16 v78 = 2050;
            uint64_t v79 = v26;
            _os_log_impl(&dword_1CA650000, v24, OS_LOG_TYPE_DEFAULT, "SGSuggestHistory - Receive updated confirmed event hashes (%{public}lu total, %{public}lu new)", buf, 0x16u);
          }

          [*((id *)v3 + 1) unionSet:v9];
          [*(id *)(a1 + 32) pushConfirmedEvents:v3];
        }
        long long v27 = [*(id *)(a1 + 32) setForKey:@"eventsWithoutTimestamp"];
        if (([v27 isEqualToSet:*((void *)v3 + 2)] & 1) == 0)
        {
          uint64_t v28 = [v27 mutableCopy];
          uint64_t v29 = *(void *)(*(void *)(a1 + 56) + 8);
          long long v30 = *(void **)(v29 + 40);
          *(void *)(v29 + 40) = v28;

          [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) minusSet:*((void *)v3 + 2)];
          long long v31 = sgEventsLogHandle();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v32 = [v27 count];
            uint64_t v33 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) count];
            *(_DWORD *)buf = 134349312;
            uint64_t v77 = v32;
            __int16 v78 = 2050;
            uint64_t v79 = v33;
            _os_log_impl(&dword_1CA650000, v31, OS_LOG_TYPE_DEFAULT, "SGSuggestHistory - Receive updated confirmed event hashes (%{public}lu total, %{public}lu new)", buf, 0x16u);
          }

          [*((id *)v3 + 2) unionSet:v27];
          [*(id *)(a1 + 32) pushConfirmedEventsWithoutTimestamp:v3];
        }
        long long v34 = [*(id *)(a1 + 32) setForKey:@"rejectedEvents"];
        if (([v34 isEqualToSet:*((void *)v3 + 3)] & 1) == 0)
        {
          uint64_t v35 = [v34 mutableCopy];
          uint64_t v36 = *(void *)(*(void *)(a1 + 64) + 8);
          long long v37 = *(void **)(v36 + 40);
          *(void *)(v36 + 40) = v35;

          [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) minusSet:*((void *)v3 + 3)];
          long long v38 = sgEventsLogHandle();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v39 = [v34 count];
            uint64_t v40 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) count];
            *(_DWORD *)buf = 134349312;
            uint64_t v77 = v39;
            __int16 v78 = 2050;
            uint64_t v79 = v40;
            _os_log_impl(&dword_1CA650000, v38, OS_LOG_TYPE_DEFAULT, "SGSuggestHistory - Receive updated rejected event hashes (%{public}lu total, %{public}lu new)", buf, 0x16u);
          }

          [*((id *)v3 + 3) unionSet:v34];
          [*(id *)(a1 + 32) pushRejectedEvents:v3];
        }
        long long v41 = [*(id *)(a1 + 32) setForKey:@"confirmedEventFields"];
        if (([v41 isEqualToSet:*((void *)v3 + 7)] & 1) == 0)
        {
          long long v42 = sgEventsLogHandle();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v43 = [v41 count];
            *(_DWORD *)buf = 134349056;
            uint64_t v77 = v43;
            _os_log_impl(&dword_1CA650000, v42, OS_LOG_TYPE_DEFAULT, "SGSuggestHistory - Receive updated confirmed event field hashes (%{public}lu total)", buf, 0xCu);
          }

          [*((id *)v3 + 7) unionSet:v41];
          [*(id *)(a1 + 32) pushConfirmedEventFields:v3];
        }
        uint64_t v44 = [*(id *)(a1 + 32) setForKey:@"confirmedEventWithoutTimestampFields"];
        if (([v44 isEqualToSet:*((void *)v3 + 8)] & 1) == 0)
        {
          v45 = sgEventsLogHandle();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v46 = [v44 count];
            *(_DWORD *)buf = 134349056;
            uint64_t v77 = v46;
            _os_log_impl(&dword_1CA650000, v45, OS_LOG_TYPE_DEFAULT, "SGSuggestHistory - Receive updated confirmed event field without timestamp hashes (%{public}lu total)", buf, 0xCu);
          }

          [*((id *)v3 + 8) unionSet:v44];
          [*(id *)(a1 + 32) pushConfirmedEventWithoutTimestampFields:v3];
        }
        v47 = [*(id *)(a1 + 32) setForKey:@"reminders"];
        if (([v47 isEqualToSet:*((void *)v3 + 4)] & 1) == 0)
        {
          uint64_t v48 = [v47 mutableCopy];
          uint64_t v49 = *(void *)(*(void *)(a1 + 72) + 8);
          uint64_t v50 = *(void **)(v49 + 40);
          *(void *)(v49 + 40) = v48;

          [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) minusSet:*((void *)v3 + 4)];
          v51 = sgRemindersLogHandle();
          if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v52 = [v47 count];
            uint64_t v53 = [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) count];
            *(_DWORD *)buf = 134349312;
            uint64_t v77 = v52;
            __int16 v78 = 2050;
            uint64_t v79 = v53;
            _os_log_impl(&dword_1CA650000, v51, OS_LOG_TYPE_DEFAULT, "SGSuggestHistory - Receive updated confirmed reminder hashes (%{public}lu total, %{public}lu new)", buf, 0x16u);
          }

          [*((id *)v3 + 4) unionSet:v47];
          [*(id *)(a1 + 32) pushConfirmedReminders:v3];
        }
        v54 = [*(id *)(a1 + 32) setForKey:@"rejectedReminders"];
        id v75 = v54;
        if (([v54 isEqualToSet:*((void *)v3 + 5)] & 1) == 0)
        {
          uint64_t v55 = [v54 mutableCopy];
          uint64_t v56 = *(void *)(*(void *)(a1 + 80) + 8);
          v57 = *(void **)(v56 + 40);
          *(void *)(v56 + 40) = v55;

          [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) minusSet:*((void *)v3 + 5)];
          uint64_t v58 = sgRemindersLogHandle();
          if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v59 = [v54 count];
            uint64_t v60 = [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) count];
            *(_DWORD *)buf = 134349312;
            uint64_t v77 = v59;
            v54 = v75;
            __int16 v78 = 2048;
            uint64_t v79 = v60;
            _os_log_impl(&dword_1CA650000, v58, OS_LOG_TYPE_DEFAULT, "SGSuggestHistory - Receive updated rejected reminder hashes (%{public}lu total %lu new)", buf, 0x16u);
          }

          [*((id *)v3 + 5) unionSet:v54];
          [*(id *)(a1 + 32) pushRejectedReminders:v3];
        }
        v74 = v47;
        id v61 = [*(id *)(a1 + 32) setForKey:@"newContacts"];
        if (([v61 isEqualToSet:*((void *)v3 + 6)] & 1) == 0)
        {
          v62 = sgLogHandle();
          if (os_log_type_enabled(v62, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v70 = [v61 count];
            *(_DWORD *)buf = 134217984;
            uint64_t v77 = v70;
            _os_log_debug_impl(&dword_1CA650000, v62, OS_LOG_TYPE_DEBUG, "Receive updated contact hashes (%lu total)", buf, 0xCu);
          }

          [*((id *)v3 + 6) unionSet:v61];
          [*(id *)(a1 + 32) pushContacts:v3];
        }
        id v63 = [*(id *)(a1 + 32) setForKey:@"storageDetails"];
        if (([v63 isEqualToSet:*((void *)v3 + 9)] & 1) == 0)
        {
          uint64_t v64 = sgLogHandle();
          if (os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v71 = [v63 count];
            *(_DWORD *)buf = 134217984;
            uint64_t v77 = v71;
            _os_log_debug_impl(&dword_1CA650000, v64, OS_LOG_TYPE_DEBUG, "Receive updated storage detail hashes (%lu total)", buf, 0xCu);
          }

          [*((id *)v3 + 9) unionSet:v63];
          [*(id *)(a1 + 32) pushStorageDetails:v3];
        }
        v65 = [*(id *)(a1 + 32) setForKey:@"dontUpdate"];
        if (([v65 isEqualToSet:*((void *)v3 + 10)] & 1) == 0)
        {
          v73 = v44;
          uint64_t v66 = v41;
          v67 = v34;
          v68 = v27;
          id v69 = sgLogHandle();
          if (os_log_type_enabled(v69, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v72 = [v65 count];
            *(_DWORD *)buf = 134217984;
            uint64_t v77 = v72;
            _os_log_debug_impl(&dword_1CA650000, v69, OS_LOG_TYPE_DEBUG, "Receive updated don't-update hashes (%lu total)", buf, 0xCu);
          }

          [*((id *)v3 + 10) unionSet:v65];
          [*(id *)(a1 + 32) pushDontUpdate:v3];
          long long v27 = v68;
          long long v34 = v67;
          long long v41 = v66;
          uint64_t v44 = v73;
        }

        goto LABEL_58;
      }
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v77 = 0x408C200000000000;
        _os_log_impl(&dword_1CA650000, v20, OS_LOG_TYPE_INFO, "Resetting history due to a KVS reset event within %g sec time window.", buf, 0xCu);
      }

      [*(id *)(a1 + 32) _setInternalStateAccordingToKVS:v3];
      goto LABEL_58;
    case 1:
      uint64_t v9 = sgLogHandle();
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_58;
      }
      *(_WORD *)buf = 0;
      goto LABEL_54;
    case 2:
      uint64_t v9 = sgLogHandle();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CA650000, v9, OS_LOG_TYPE_DEFAULT, "Exceeded iCloud key value storage quota. Can't store any more acted on suggestions.", buf, 2u);
      }
      goto LABEL_58;
    case 3:
      [*(id *)(a1 + 32) _setInternalStateAccordingToKVS:v3];
      uint64_t v9 = sgLogHandle();
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_58;
      }
      *(_WORD *)buf = 0;
LABEL_54:
      _os_log_debug_impl(&dword_1CA650000, v9, OS_LOG_TYPE_DEBUG, "KVS account change", buf, 2u);
LABEL_58:

LABEL_59:
      return;
    default:
      goto LABEL_59;
  }
}

- (void)reset
{
  [(SGSuggestHistory *)self resetNoFlush];
  backingKVStore = self->_backingKVStore;
  [(NSUbiquitousKeyValueStore *)backingKVStore synchronize];
}

- (void)resetNoFlush
{
  id v3 = sgLogHandle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CA650000, v3, OS_LOG_TYPE_INFO, "Resetting suggestions history", buf, 2u);
  }

  locuint64_t k = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __32__SGSuggestHistory_resetNoFlush__block_invoke;
  v5[3] = &unk_1E65B6C00;
  v5[4] = self;
  [(_PASLock *)lock runWithLockAcquired:v5];
}

void __32__SGSuggestHistory_resetNoFlush__block_invoke(uint64_t a1, void *a2)
{
  v33[2] = *MEMORY[0x1E4F143B8];
  id v3 = (void *)a2[13];
  a2[13] = 0;
  id v4 = a2;

  uint64_t v5 = (void *)v4[14];
  v4[14] = 0;

  uint64_t v6 = objc_opt_new();
  uint64_t v7 = (void *)v4[6];
  v4[6] = v6;

  uint64_t v8 = objc_opt_new();
  uint64_t v9 = (void *)v4[9];
  v4[9] = v8;

  uint64_t v10 = objc_opt_new();
  unint64_t v11 = (void *)v4[1];
  v4[1] = v10;

  uint64_t v12 = objc_opt_new();
  unint64_t v13 = (void *)v4[2];
  v4[2] = v12;

  uint64_t v14 = objc_opt_new();
  double v15 = (void *)v4[3];
  v4[3] = v14;

  uint64_t v16 = objc_opt_new();
  double v17 = (void *)v4[7];
  v4[7] = v16;

  uint64_t v18 = objc_opt_new();
  uint64_t v19 = (void *)v4[8];
  v4[8] = v18;

  uint64_t v20 = objc_opt_new();
  uint64_t v21 = (void *)v4[4];
  v4[4] = v20;

  uint64_t v22 = objc_opt_new();
  uint64_t v23 = (void *)v4[5];
  v4[5] = v22;

  uint64_t v24 = objc_opt_new();
  uint64_t v25 = (void *)v4[10];
  v4[10] = v24;

  uint64_t v26 = NSNumber;
  long long v27 = [(id)v4[11] objectAtIndexedSubscript:0];
  uint64_t v28 = objc_msgSend(v26, "numberWithUnsignedLong:", objc_msgSend(v27, "unsignedLongValue") + 1);
  v33[0] = v28;
  uint64_t v29 = NSNumber;
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  long long v30 = objc_msgSend(v29, "numberWithDouble:");
  v33[1] = v30;
  uint64_t v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:2];
  uint64_t v32 = (void *)v4[11];
  v4[11] = v31;

  [*(id *)(a1 + 32) pushAll:v4];
}

- (id)hashesForPseudoEventByKey:(id)a3 forMatching:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v6 = [a3 serialize];
  uint64_t v7 = [(SGSuggestHistory *)self hashesForOpaqueKey:v6 forMatching:v4];

  return v7;
}

- (id)hashesForOpaqueKey:(id)a3 forMatching:(BOOL)a4
{
  BOOL v4 = a4;
  v12[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (!v7)
  {
    unint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"SGSuggestHistory.m", 1003, @"Invalid parameter not satisfying: %@", @"opaqueKey" object file lineNumber description];
  }
  v12[0] = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  uint64_t v9 = [(SGSuggestHistory *)self hashesForStrings:v8 forMatching:v4];

  return v9;
}

- (id)rejectHashesForOpaqueKey:(id)a3 forMatching:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  if (!v7)
  {
    uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"SGSuggestHistory.m", 997, @"Invalid parameter not satisfying: %@", @"opaqueKey" object file lineNumber description];
  }
  uint64_t v8 = [(SGSuggestHistory *)self hashesForOpaqueKey:v7 forMatching:v4];

  return v8;
}

- (id)confirmHashesForOpaqueKeyWithoutTimestamp:(id)a3 forMatching:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  if (!v7)
  {
    uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"SGSuggestHistory.m", 990, @"Invalid parameter not satisfying: %@", @"opaqueKey" object file lineNumber description];
  }
  uint64_t v8 = [(SGSuggestHistory *)self hashesForOpaqueKey:v7 forMatching:v4];

  return v8;
}

- (id)confirmHashesForOpaqueKey:(id)a3 withCreationTime:(SGUnixTimestamp_)a4 forMatching:(BOOL)a5
{
  BOOL v5 = a5;
  v17[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  if (!v9)
  {
    uint64_t v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"SGSuggestHistory.m", 981, @"Invalid parameter not satisfying: %@", @"opaqueKey" object file lineNumber description];
  }
  uint64_t v10 = (void *)MEMORY[0x1CB79B230]();
  unint64_t v11 = (void *)[[NSString alloc] initWithFormat:@"%.2f", *(SGUnixTimestamp_ *)&a4.secondsFromUnixEpoch];
  uint64_t v12 = [v9 stringByAppendingString:v11];

  v17[0] = v12;
  unint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
  uint64_t v14 = [(SGSuggestHistory *)self hashesForStrings:v13 forMatching:v5];

  return v14;
}

- (id)confirmHashesForRemindersOpaqueKey:(id)a3 withCreationTime:(SGUnixTimestamp_)a4 forMatching:(BOOL)a5
{
  return [(SGSuggestHistory *)self confirmHashesForOpaqueKey:a3 withCreationTime:a5 forMatching:round(a4.secondsFromUnixEpoch / 10.0) * 10.0];
}

- (id)identityBasedHashesForPseudoReminder:(id)a3 withCreationTime:(SGUnixTimestamp_)a4
{
  id v7 = a3;
  if (!v7)
  {
    double v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"SGSuggestHistory.m", 958, @"Invalid parameter not satisfying: %@", @"key" object file lineNumber description];
  }
  uint64_t v8 = [v7 serialize];
  id v9 = [(SGSuggestHistory *)self confirmHashesForRemindersOpaqueKey:v8 withCreationTime:1 forMatching:a4.secondsFromUnixEpoch];

  uint64_t v10 = [v7 serialize];
  unint64_t v11 = [(SGSuggestHistory *)self rejectHashesForOpaqueKey:v10 forMatching:1];

  uint64_t v12 = (void *)MEMORY[0x1CB79B230]();
  unint64_t v13 = [v9 arrayByAddingObjectsFromArray:v11];

  return v13;
}

- (id)identityBasedHashesForPseudoEvent:(id)a3 withCreationTime:(SGUnixTimestamp_)a4
{
  id v7 = a3;
  if (!v7)
  {
    double v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"SGSuggestHistory.m", 947, @"Invalid parameter not satisfying: %@", @"key" object file lineNumber description];
  }
  uint64_t v8 = [v7 serialize];
  id v9 = [(SGSuggestHistory *)self confirmHashesForOpaqueKey:v8 withCreationTime:1 forMatching:a4.secondsFromUnixEpoch];

  uint64_t v10 = [v7 serialize];
  unint64_t v11 = [(SGSuggestHistory *)self rejectHashesForOpaqueKey:v10 forMatching:1];

  uint64_t v12 = (void *)MEMORY[0x1CB79B230]();
  unint64_t v13 = [v9 arrayByAddingObjectsFromArray:v11];

  return v13;
}

- (id)hashesForCuratedContactDetail:(id)a3 fromContact:(id)a4 forMatching:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = [(SGSuggestHistory *)self keysForCuratedContactDetail:a3 ofContact:a4];
  uint64_t v8 = [(SGSuggestHistory *)self hashesForStrings:v7 forMatching:v5];

  return v8;
}

- (id)hashesForContactDetail:(id)a3 fromContact:(id)a4 forMatching:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = [(SGSuggestHistory *)self keysForContactDetail:a3 ofContact:a4];
  uint64_t v8 = [(SGSuggestHistory *)self hashesForStrings:v7 forMatching:v5];

  return v8;
}

- (id)hashesForStorageContact:(id)a3 forMatching:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v6 = [(SGSuggestHistory *)self keysForStorageContact:a3];
  id v7 = [(SGSuggestHistory *)self hashesForStrings:v6 forMatching:v4];

  return v7;
}

- (id)hashesForContact:(id)a3 forMatching:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v6 = [(SGSuggestHistory *)self keysForContact:a3];
  id v7 = [(SGSuggestHistory *)self hashesForStrings:v6 forMatching:v4];

  return v7;
}

- (id)hashesForStrings:(id)a3 forMatching:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  unint64_t v11 = [(SGSuggestHistory *)self salt];
  id v7 = v11;
  uint64_t v8 = sgMap();

  id v9 = [(SGSuggestHistory *)self hashesByAddingCompatibilityHashesToHashes:v8 forMatching:v4];

  return v9;
}

id __49__SGSuggestHistory_hashesForStrings_forMatching___block_invoke(uint64_t a1, void *a2)
{
  return SGSha256BytesForString(a2, *(void **)(a1 + 32));
}

- (id)hashesByAddingCompatibilityHashesToHashes:(id)a3 forMatching:(BOOL)a4
{
  BOOL v4 = a4;
  v18[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = v6;
  if (v4)
  {
    uint64_t v8 = [(SGSuggestHistory *)self legacyIOS13HashesForClassicHashes:v6];
    id v9 = (void *)v8;
    uint64_t v10 = (void *)MEMORY[0x1E4F1CBF0];
    if (v8) {
      uint64_t v10 = (void *)v8;
    }
    id v11 = v10;

    uint64_t v12 = (void *)MEMORY[0x1CB79B230]();
    unint64_t v13 = [(SGSuggestHistory *)self _canaryHash];
    v18[0] = v13;
    uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
    double v15 = [v14 arrayByAddingObjectsFromArray:v7];
    uint64_t v16 = [v15 arrayByAddingObjectsFromArray:v11];
  }
  else
  {
    uint64_t v16 = (void *)[v6 copy];
  }

  return v16;
}

- (id)legacyIOS13HashesForClassicHashes:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(SGSuggestHistory *)self legacyManateeSecret];
  uint64_t v6 = [v5 length];
  id v7 = sgLogHandle();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v6)
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1CA650000, v7, OS_LOG_TYPE_DEBUG, "SGCK will use legacy manatee hashes", buf, 2u);
    }

    if (legacyIOS13HashesForClassicHashes___pasOnceToken66 != -1) {
      dispatch_once(&legacyIOS13HashesForClassicHashes___pasOnceToken66, &__block_literal_global_171_8331);
    }
    id v11 = (id)legacyIOS13HashesForClassicHashes___pasExprOnceResult;
    id v12 = v5;
    id v7 = v11;
    id v9 = sgMap();
  }
  else
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1CA650000, v7, OS_LOG_TYPE_DEBUG, "SGCK legacy Manatee salt not supported", buf, 2u);
    }
    id v9 = 0;
  }

  return v9;
}

id __54__SGSuggestHistory_legacyIOS13HashesForClassicHashes___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 length];
  if (v4 == [*(id *)(a1 + 32) length] + 32
    && (BOOL v5 = (const void *)[*(id *)(a1 + 32) bytes],
        id v6 = v3,
        !memcmp(v5, (const void *)[v6 bytes], objc_msgSend(*(id *)(a1 + 32), "length"))))
  {
    uint64_t v10 = sgLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)id v11 = 0;
      _os_log_fault_impl(&dword_1CA650000, v10, OS_LOG_TYPE_FAULT, "SGCK legacyIOS13HashesForClassicHashes was passed a hash that is already a ios13 hash", v11, 2u);
    }

    if (_PASEvaluateLogFaultAndProbCrashCriteria()) {
      abort();
    }
    id v7 = v6;
  }
  else
  {
    id v7 = (id)[*(id *)(a1 + 32) mutableCopy];
    BOOL v8 = SGSha256HMACData(v3, *(id *)(a1 + 40));
    [v7 appendData:v8];
  }
  return v7;
}

void __54__SGSuggestHistory_legacyIOS13HashesForClassicHashes___block_invoke()
{
  v0 = (void *)MEMORY[0x1CB79B230]();
  uint64_t v1 = [@"v2_" dataUsingEncoding:4];
  v2 = (void *)legacyIOS13HashesForClassicHashes___pasExprOnceResult;
  legacyIOS13HashesForClassicHashes___pasExprOnceResult = v1;
}

- (id)_canaryHash
{
  if (_canaryHash__pasOnceToken63 != -1) {
    dispatch_once(&_canaryHash__pasOnceToken63, &__block_literal_global_166);
  }
  v2 = (void *)_canaryHash__pasExprOnceResult;
  return v2;
}

void __31__SGSuggestHistory__canaryHash__block_invoke()
{
  v0 = (void *)MEMORY[0x1CB79B230]();
  id v1 = [NSString alloc];
  v2 = [MEMORY[0x1E4F29128] UUID];
  id v3 = [v2 UUIDString];
  uint64_t v4 = (void *)[v1 initWithFormat:@"canary_%@", v3];
  uint64_t v5 = [v4 dataUsingEncoding:4];
  id v6 = (void *)_canaryHash__pasExprOnceResult;
  _canaryHash__pasExprOnceResult = v5;
}

- (id)keysForCuratedContactDetail:(id)a3 ofContact:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  context = (void *)MEMORY[0x1CB79B230]();
  id v7 = objc_opt_new();
  BOOL v8 = objc_opt_new();
  uint64_t v9 = [MEMORY[0x1E4F1B910] stringFromContact:v6 style:0];
  uint64_t v10 = (void *)v9;
  if (v9)
  {
    id v11 = SGNormalizeName(v9);
    [v8 addObject:v11];
  }
  id v12 = [v6 emailAddresses];
  uint64_t v13 = [v12 count];

  if (v13)
  {
    uint64_t v14 = [v6 emailAddresses];
    double v15 = [v14 objectAtIndexedSubscript:0];
    uint64_t v16 = [v15 value];
    double v17 = SGNormalizeEmailAddress();
    [v8 addObject:v17];
  }
  uint64_t v18 = SGDelimitedStringsSerializeArray();
  uint64_t v19 = [v5 value];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    uint64_t v21 = [v5 value];
    uint64_t v22 = SGNormalizeEmailAddress();
    uint64_t v23 = [v22 stringByAppendingString:v18];
    [v7 addObject:v23];
  }
  uint64_t v24 = [v5 value];
  objc_opt_class();
  char v25 = objc_opt_isKindOfClass();

  if (v25)
  {
    uint64_t v26 = [v5 value];
    long long v27 = [v26 stringValue];
    uint64_t v28 = SGNormalizePhoneNumber();
    uint64_t v29 = [v28 stringByAppendingString:v18];
    [v7 addObject:v29];
  }
  long long v30 = [v5 value];
  objc_opt_class();
  char v31 = objc_opt_isKindOfClass();

  if (v31)
  {
    uint64_t v32 = [v5 value];
    uint64_t v33 = SGNormalizeCNAddress(v32);
    long long v34 = [v33 stringByAppendingString:v18];
    [v7 addObject:v34];
  }

  return v7;
}

- (id)keysForContactDetail:(id)a3 ofContact:(id)a4
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  context = (void *)MEMORY[0x1CB79B230]();
  id v7 = objc_opt_new();
  BOOL v8 = objc_opt_new();
  uint64_t v9 = [v6 name];

  if (v9)
  {
    uint64_t v10 = [v6 name];
    id v11 = [v10 fullName];
    id v12 = SGNormalizeName((uint64_t)v11);
    [v8 addObject:v12];
  }
  uint64_t v13 = [v6 emailAddresses];
  uint64_t v14 = [v13 count];

  if (v14)
  {
    double v15 = [v6 emailAddresses];
    uint64_t v16 = [v15 objectAtIndexedSubscript:0];
    double v17 = [v16 emailAddress];
    uint64_t v18 = SGNormalizeEmailAddress();
    [v8 addObject:v18];
  }
  uint64_t v19 = SGDelimitedStringsSerializeArray();
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v42 = v8;
    id v43 = v6;
    id v41 = v5;
    uint64_t v20 = [[SGSocialProfileDetails alloc] initWithSocialProfile:v41];
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    uint64_t v21 = [(SGSocialProfileDetails *)v20 uniqueIdentifiers];
    uint64_t v22 = [v21 countByEnumeratingWithState:&v45 objects:v49 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v46;
      do
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v46 != v24) {
            objc_enumerationMutation(v21);
          }
          uint64_t v26 = *(void **)(*((void *)&v45 + 1) + 8 * i);
          SGNormalizeSocialProfile(v26);
          long long v27 = [(id)objc_claimAutoreleasedReturnValue() stringByAppendingString:v19];
          [v7 addObject:v27];
        }
        uint64_t v23 = [v21 countByEnumeratingWithState:&v45 objects:v49 count:16];
      }
      while (v23);
    }

    BOOL v8 = v42;
    id v6 = v43;
  }
  if (objc_opt_respondsToSelector())
  {
    uint64_t v28 = [v5 emailAddress];
    uint64_t v29 = SGNormalizeEmailAddress();
    long long v30 = [v29 stringByAppendingString:v19];
    [v7 addObject:v30];
  }
  if (objc_opt_respondsToSelector())
  {
    char v31 = [v5 phoneNumber];
    uint64_t v32 = SGNormalizePhoneNumber();
    uint64_t v33 = [v32 stringByAppendingString:v19];
    [v7 addObject:v33];
  }
  if (objc_opt_respondsToSelector())
  {
    long long v34 = [v5 address];
    uint64_t v35 = SGNormalizeAddress(v34);
    uint64_t v36 = [v35 stringByAppendingString:v19];
    [v7 addObject:v36];
  }
  if (objc_opt_respondsToSelector())
  {
    long long v37 = [v5 dateString];
    long long v38 = SGNormalizeBirthday(v37);
    uint64_t v39 = [v38 stringByAppendingString:v19];
    [v7 addObject:v39];
  }

  return v7;
}

- (id)keysForStorageContact:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = objc_opt_new();
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v5 = objc_msgSend(v3, "profiles", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        id v11 = [v10 title];

        if (v11)
        {
          id v12 = [v10 title];
          uint64_t v13 = SGNormalizeName((uint64_t)v12);
          [v4 addObject:v13];
        }
        uint64_t v14 = [v10 duplicateKey];
        if ([v14 entityType] == 4)
        {
          double v15 = [v14 identityKey];
          if ([v15 hasEmailAddress])
          {
            uint64_t v16 = [v15 emailAddress];
            [v4 addObject:v16];
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v7);
  }

  return v4;
}

- (id)keysForContact:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = objc_opt_new();
  id v5 = [v3 name];
  uint64_t v6 = [v5 fullName];

  if (v6)
  {
    uint64_t v7 = [v3 name];
    uint64_t v8 = [v7 fullName];
    uint64_t v9 = SGNormalizeName((uint64_t)v8);
    [v4 addObject:v9];
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v10 = objc_msgSend(v3, "emailAddresses", 0);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v10);
        }
        double v15 = [*(id *)(*((void *)&v18 + 1) + 8 * i) emailAddress];
        uint64_t v16 = SGNormalizeEmailAddress();
        [v4 addObject:v16];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v12);
  }

  return v4;
}

- (void)pushAll:(id)a3
{
  id v4 = a3;
  [(SGSuggestHistory *)self pushConfirmedEvents:v4];
  [(SGSuggestHistory *)self pushConfirmedEventsWithoutTimestamp:v4];
  [(SGSuggestHistory *)self pushRejectedEvents:v4];
  [(SGSuggestHistory *)self pushConfirmedEventFields:v4];
  [(SGSuggestHistory *)self pushConfirmedEventWithoutTimestampFields:v4];
  [(SGSuggestHistory *)self pushConfirmedReminders:v4];
  [(SGSuggestHistory *)self pushRejectedReminders:v4];
  [(SGSuggestHistory *)self pushContacts:v4];
  [(SGSuggestHistory *)self pushStorageDetails:v4];
  [(SGSuggestHistory *)self pushDontUpdate:v4];
  [(SGSuggestHistory *)self pushResetInfo:v4];
}

- (void)setInternalStateAccordingToKVS
{
  locuint64_t k = self->_lock;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __50__SGSuggestHistory_setInternalStateAccordingToKVS__block_invoke;
  v3[3] = &unk_1E65B6C00;
  v3[4] = self;
  [(_PASLock *)lock runWithLockAcquired:v3];
}

uint64_t __50__SGSuggestHistory_setInternalStateAccordingToKVS__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _setInternalStateAccordingToKVS:a2];
}

- (void)_setInternalStateAccordingToKVS:(id)a3
{
  uint64_t v29 = a3;
  uint64_t v5 = [(SGSuggestHistory *)self mutableSetForKey:@"events"];
  uint64_t v6 = (void *)v29[1];
  v29[1] = v5;

  uint64_t v7 = [(SGSuggestHistory *)self mutableSetForKey:@"eventsWithoutTimestamp"];
  uint64_t v8 = (void *)v29[2];
  void v29[2] = v7;

  uint64_t v9 = [(SGSuggestHistory *)self mutableSetForKey:@"rejectedEvents"];
  uint64_t v10 = (void *)v29[3];
  v29[3] = v9;

  uint64_t v11 = [(SGSuggestHistory *)self mutableSetForKey:@"confirmedEventFields"];
  uint64_t v12 = (void *)v29[7];
  v29[7] = v11;

  uint64_t v13 = [(SGSuggestHistory *)self mutableSetForKey:@"confirmedEventWithoutTimestampFields"];
  uint64_t v14 = (void *)v29[8];
  v29[8] = v13;

  uint64_t v15 = [(SGSuggestHistory *)self mutableSetForKey:@"reminders"];
  uint64_t v16 = (void *)v29[4];
  v29[4] = v15;

  uint64_t v17 = [(SGSuggestHistory *)self mutableSetForKey:@"rejectedReminders"];
  long long v18 = (void *)v29[5];
  v29[5] = v17;

  uint64_t v19 = [(SGSuggestHistory *)self mutableSetForKey:@"newContacts"];
  long long v20 = (void *)v29[6];
  v29[6] = v19;

  uint64_t v21 = [(SGSuggestHistory *)self mutableSetForKey:@"storageDetails"];
  uint64_t v22 = (void *)v29[9];
  v29[9] = v21;

  uint64_t v23 = [(SGSuggestHistory *)self mutableSetForKey:@"dontUpdate"];
  uint64_t v24 = (void *)v29[10];
  v29[10] = v23;

  uint64_t v25 = [(SGSuggestHistory *)self loadResetInfo];
  uint64_t v26 = (void *)v29[11];
  v29[11] = v25;

  long long v27 = v29;
  if (!v29[1] || !v29[2] || !v29[3] || !v29[7] || !v29[8] || !v29[4] || !v29[5] || !v29[6] || !v29[9] || !v29[10])
  {
    uint64_t v28 = [MEMORY[0x1E4F28B00] currentHandler];
    [v28 handleFailureInMethod:a2 object:self file:@"SGSuggestHistory.m" lineNumber:738 description:@"Suggest history sets must not be nil"];

    long long v27 = v29;
  }
}

- (void)pushResetInfo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = (id *)a3;
  uint64_t v5 = sgLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v7 = [v4[11] objectAtIndexedSubscript:0];
    uint64_t v8 = [v7 unsignedLongValue];
    uint64_t v9 = [v4[11] objectAtIndexedSubscript:1];
    [v9 doubleValue];
    int v11 = 134218240;
    uint64_t v12 = v8;
    __int16 v13 = 2048;
    uint64_t v14 = v10;
    _os_log_debug_impl(&dword_1CA650000, v5, OS_LOG_TYPE_DEBUG, "Pushing reset info (generation %lu, timestamp %.1f)", (uint8_t *)&v11, 0x16u);
  }
  uint64_t v6 = [(SGSuggestHistory *)self kvs];
  [v6 setArray:v4[11] forKey:@"resetInfo"];
}

- (void)pushDontUpdate:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = (id *)a3;
  uint64_t v5 = sgLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v6 = [v4[10] count];
    v7[0] = 67109120;
    v7[1] = v6;
    _os_log_debug_impl(&dword_1CA650000, v5, OS_LOG_TYPE_DEBUG, "Pushing do-not-update set with %i items", (uint8_t *)v7, 8u);
  }

  [(SGSuggestHistory *)self _setHashes:v4[10] forKey:@"dontUpdate"];
}

- (void)pushStorageDetails:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = (id *)a3;
  uint64_t v5 = sgLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v6 = [v4[9] count];
    v7[0] = 67109120;
    v7[1] = v6;
    _os_log_debug_impl(&dword_1CA650000, v5, OS_LOG_TYPE_DEBUG, "Pushing storage details set with %i items", (uint8_t *)v7, 8u);
  }

  [(SGSuggestHistory *)self _setHashes:v4[9] forKey:@"storageDetails"];
}

- (void)pushContacts:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = (id *)a3;
  uint64_t v5 = sgLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v6 = [v4[6] count];
    v7[0] = 67109120;
    v7[1] = v6;
    _os_log_debug_impl(&dword_1CA650000, v5, OS_LOG_TYPE_DEBUG, "Pushing contacts set with %i items", (uint8_t *)v7, 8u);
  }

  [(SGSuggestHistory *)self _setHashes:v4[6] forKey:@"newContacts"];
}

- (void)pushConfirmedEventWithoutTimestampFields:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = (id *)a3;
  uint64_t v5 = sgLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v6 = [v4[8] count];
    v7[0] = 67109120;
    v7[1] = v6;
    _os_log_debug_impl(&dword_1CA650000, v5, OS_LOG_TYPE_DEBUG, "Pushing confirmed event without timestamp fields set with %i items", (uint8_t *)v7, 8u);
  }

  [(SGSuggestHistory *)self _setHashes:v4[8] forKey:@"confirmedEventWithoutTimestampFields"];
}

- (void)pushConfirmedEventFields:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = (id *)a3;
  uint64_t v5 = sgLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v6 = [v4[7] count];
    v7[0] = 67109120;
    v7[1] = v6;
    _os_log_debug_impl(&dword_1CA650000, v5, OS_LOG_TYPE_DEBUG, "Pushing confirmed event fields set with %i items", (uint8_t *)v7, 8u);
  }

  [(SGSuggestHistory *)self _setHashes:v4[7] forKey:@"confirmedEventFields"];
}

- (void)pushRejectedReminders:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = (id *)a3;
  uint64_t v5 = sgRemindersLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v6 = [v4[5] count];
    v7[0] = 67109120;
    v7[1] = v6;
    _os_log_debug_impl(&dword_1CA650000, v5, OS_LOG_TYPE_DEBUG, "Pushing rejected reminders set with %i items", (uint8_t *)v7, 8u);
  }

  [(SGSuggestHistory *)self _setHashes:v4[5] forKey:@"rejectedReminders"];
}

- (void)pushConfirmedReminders:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = (id *)a3;
  uint64_t v5 = sgRemindersLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v6 = [v4[4] count];
    v7[0] = 67109120;
    v7[1] = v6;
    _os_log_debug_impl(&dword_1CA650000, v5, OS_LOG_TYPE_DEBUG, "Pushing confirmed reminders set with %i items", (uint8_t *)v7, 8u);
  }

  [(SGSuggestHistory *)self _setHashes:v4[4] forKey:@"reminders"];
}

- (void)pushRejectedEvents:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = (id *)a3;
  uint64_t v5 = sgLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v6 = [v4[3] count];
    v7[0] = 67109120;
    v7[1] = v6;
    _os_log_debug_impl(&dword_1CA650000, v5, OS_LOG_TYPE_DEBUG, "Pushing rejected events set with %i items", (uint8_t *)v7, 8u);
  }

  [(SGSuggestHistory *)self _setHashes:v4[3] forKey:@"rejectedEvents"];
}

- (void)pushConfirmedEventsWithoutTimestamp:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = (id *)a3;
  uint64_t v5 = sgLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v6 = [v4[2] count];
    v7[0] = 67109120;
    v7[1] = v6;
    _os_log_debug_impl(&dword_1CA650000, v5, OS_LOG_TYPE_DEBUG, "Pushing confirmed events without timestamp set with %i items", (uint8_t *)v7, 8u);
  }

  [(SGSuggestHistory *)self _setHashes:v4[2] forKey:@"eventsWithoutTimestamp"];
}

- (void)pushConfirmedEvents:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = (id *)a3;
  uint64_t v5 = sgLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v6 = [v4[1] count];
    v7[0] = 67109120;
    v7[1] = v6;
    _os_log_debug_impl(&dword_1CA650000, v5, OS_LOG_TYPE_DEBUG, "Pushing confirmed events set with %i items", (uint8_t *)v7, 8u);
  }

  [(SGSuggestHistory *)self _setHashes:v4[1] forKey:@"events"];
}

- (void)_setHashes:(id)a3 forKey:(id)a4
{
  id v14 = a3;
  id v7 = a4;
  uint64_t v8 = [(SGSuggestHistory *)self _canaryHash];
  int v9 = [v14 containsObject:v8];

  if (v9)
  {
    __int16 v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"SGSuggestHistory.m", 631, @"Invalid parameter not satisfying: %@", @"![hashes containsObject:[self _canaryHash]]" object file lineNumber description];
  }
  if ([v14 count])
  {
    uint64_t v10 = (void *)MEMORY[0x1CB79B230]();
    id v11 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v14 requiringSecureCoding:1 error:0];
  }
  else
  {
    if (_setHashes_forKey___pasOnceToken51 != -1) {
      dispatch_once(&_setHashes_forKey___pasOnceToken51, &__block_literal_global_148);
    }
    id v11 = (id)_setHashes_forKey___pasExprOnceResult;
  }
  uint64_t v12 = [(SGSuggestHistory *)self kvs];
  [v12 setObject:v11 forKey:v7];

  [(SGSuggestHistory *)self _tellObserversHashesDidChange];
}

void __38__SGSuggestHistory__setHashes_forKey___block_invoke()
{
  v0 = (void *)MEMORY[0x1CB79B230]();
  id v1 = (void *)MEMORY[0x1E4F28DB0];
  v2 = objc_opt_new();
  uint64_t v3 = [v1 archivedDataWithRootObject:v2 requiringSecureCoding:1 error:0];
  id v4 = (void *)_setHashes_forKey___pasExprOnceResult;
  _setHashes_forKey___pasExprOnceResult = v3;
}

- (void)_tellObserversHashesDidChange
{
}

void __49__SGSuggestHistory__tellObserversHashesDidChange__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = (void *)[*(id *)(a2 + 96) copy];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = v2;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v7++), "hashesDidChange", (void)v8);
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (id)description
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  long long v9 = __Block_byref_object_copy__8254;
  long long v10 = __Block_byref_object_dispose__8255;
  id v11 = 0;
  locuint64_t k = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __31__SGSuggestHistory_description__block_invoke;
  v5[3] = &unk_1E65B6C28;
  v5[4] = &v6;
  [(_PASLock *)lock runWithLockAcquired:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

uint64_t __31__SGSuggestHistory_description__block_invoke(uint64_t a1, void *a2)
{
  v2 = (objc_class *)NSString;
  id v3 = a2;
  id v15 = [v2 alloc];
  uint64_t v14 = [v3[1] count];
  uint64_t v4 = [v3[2] count];
  uint64_t v5 = [v3[3] count];
  uint64_t v6 = [v3[4] count];
  uint64_t v7 = [v3[5] count];
  uint64_t v8 = [v3[7] count];
  uint64_t v9 = [v3[8] count];
  uint64_t v10 = [v3[6] count];
  uint64_t v11 = [v3[9] count];
  id v12 = v3[10];

  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = [v15 initWithFormat:@"Suggest history with %d confirmed event hashes, %d confirmed event without timestamp hashes, %d rejected event hashes, %d confirmed reminder hashes, %d rejected reminder hashes, %d confirmed event field hashes, %d confirmed event without timestamp field hashes, %d contact hashes, %d storage detail hashes, and %d no-update hashes.", v14, v4, v5, v6, v7, v8, v9, v10, v11, objc_msgSend(v12, "count")];
  return MEMORY[0x1F41817F8]();
}

- (id)loadResetInfo
{
  v2 = [(SGSuggestHistory *)self kvs];
  id v3 = [v2 arrayForKey:@"resetInfo"];

  if (v3 && [v3 count] == 2)
  {
    uint64_t v4 = [v3 objectAtIndexedSubscript:0];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = [v3 objectAtIndexedSubscript:1];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass) {
        goto LABEL_10;
      }
    }
    else
    {
    }
  }
  uint64_t v7 = sgLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)uint64_t v9 = 0;
    _os_log_debug_impl(&dword_1CA650000, v7, OS_LOG_TYPE_DEBUG, "Empty or corrupt resetInfo", v9, 2u);
  }

  id v3 = &unk_1F25367D0;
LABEL_10:
  return v3;
}

- (id)mutableSetForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SGSuggestHistory *)self kvs];
  uint64_t v6 = [v5 dataForKey:v4];

  if (v6)
  {
    uint64_t v7 = (void *)MEMORY[0x1E4F28DC0];
    if (mutableSetForKey___pasOnceToken49 != -1) {
      dispatch_once(&mutableSetForKey___pasOnceToken49, &__block_literal_global_135);
    }
    uint64_t v8 = [v7 unarchivedObjectOfClasses:mutableSetForKey___pasExprOnceResult fromData:v6 error:0];
    if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v9 = v8;
      }
      else {
        id v9 = (id)[v8 mutableCopy];
      }
    }
    else
    {
      id v9 = (id)objc_opt_new();
    }
    uint64_t v10 = v9;
  }
  else
  {
    uint64_t v10 = objc_opt_new();
  }

  return v10;
}

void __37__SGSuggestHistory_mutableSetForKey___block_invoke()
{
  v0 = (void *)MEMORY[0x1CB79B230]();
  id v1 = (void *)MEMORY[0x1CB79B230]();
  id v2 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_msgSend(v2, "initWithObjects:", v3, v4, objc_opt_class(), 0);
  uint64_t v6 = (void *)mutableSetForKey___pasExprOnceResult;
  mutableSetForKey___pasExprOnceResult = v5;
}

- (id)legacyManateeSecret
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__8254;
  uint64_t v10 = __Block_byref_object_dispose__8255;
  id v11 = 0;
  locuint64_t k = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __39__SGSuggestHistory_legacyManateeSecret__block_invoke;
  v5[3] = &unk_1E65B6DD8;
  v5[4] = self;
  void v5[5] = &v6;
  [(_PASLock *)lock runWithLockAcquired:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __39__SGSuggestHistory_legacyManateeSecret__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v7 = a2;
  id v3 = (void *)v7[14];
  if (!v3)
  {
    uint64_t v4 = [*(id *)(a1 + 32) kvs];
    uint64_t v5 = [v4 dataForKey:@"SGSaltManatee"];
    uint64_t v6 = (void *)v7[14];
    v7[14] = v5;

    id v3 = (void *)v7[14];
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v3);
}

- (id)salt
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__8254;
  uint64_t v10 = __Block_byref_object_dispose__8255;
  id v11 = 0;
  locuint64_t k = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __24__SGSuggestHistory_salt__block_invoke;
  v5[3] = &unk_1E65B6DD8;
  v5[4] = self;
  void v5[5] = &v6;
  [(_PASLock *)lock runWithLockAcquired:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __24__SGSuggestHistory_salt__block_invoke(uint64_t a1, void *a2)
{
  id v11 = a2;
  id v3 = (void *)v11[13];
  if (!v3)
  {
    uint64_t v4 = [*(id *)(a1 + 32) kvs];
    uint64_t v5 = [v4 dataForKey:@"SGSalt"];
    uint64_t v6 = (void *)v11[13];
    v11[13] = v5;

    id v3 = (void *)v11[13];
    if (!v3)
    {
      uint64_t v7 = SGRandomDataOfLength(0x20uLL);
      uint64_t v8 = [v7 copy];
      id v9 = (void *)v11[13];
      v11[13] = v8;

      uint64_t v10 = [*(id *)(a1 + 32) kvs];
      [v10 setData:v11[13] forKey:@"SGSalt"];

      id v3 = (void *)v11[13];
    }
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v3);
}

- (SGSuggestHistory)init
{
  id v3 = objc_alloc(MEMORY[0x1E4F29130]);
  uint64_t v4 = *MEMORY[0x1E4F5DEE0];
  uint64_t v5 = (void *)[v3 initWithStoreIdentifier:*MEMORY[0x1E4F5DEE0] type:1];
  uint64_t v6 = [(SGSuggestHistory *)self initWithKVS:v5 kvStoreIdentifier:v4];
  if (v6)
  {
    uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F29130]) initWithStoreIdentifier:v4 type:0];
    [(SGSuggestHistory *)v6 setMigrateFromStore:v7];
  }
  return v6;
}

- (SGSuggestHistory)initWithKVS:(id)a3 kvStoreIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v24.receiver = self;
  v24.super_class = (Class)SGSuggestHistory;
  id v9 = [(SGSuggestHistory *)&v24 init];
  if (v9)
  {
    uint64_t v10 = [v8 copy];
    kvStoreIdentifier = v9->_kvStoreIdentifier;
    v9->_kvStoreIdentifier = (NSString *)v10;

    uint64_t v12 = objc_opt_new();
    uint64_t v13 = objc_opt_new();
    uint64_t v14 = *(void **)(v12 + 96);
    *(void *)(v12 + 96) = v13;

    uint64_t v15 = objc_opt_new();
    noCloudFakeBackingKVStore = v9->_noCloudFakeBackingKVStore;
    v9->_noCloudFakeBackingKVStore = (SGNoCloudNSUbiquitousKeyValueStore *)v15;

    objc_storeStrong((id *)&v9->_backingKVStore, a3);
    if (!v9->_backingKVStore)
    {
      uint64_t v17 = sgLogHandle();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)uint64_t v23 = 0;
        _os_log_error_impl(&dword_1CA650000, v17, OS_LOG_TYPE_ERROR, "SGSuggestHistory is a no-op with kvs == nil!", v23, 2u);
      }

      objc_storeStrong((id *)&v9->_backingKVStore, v9->_noCloudFakeBackingKVStore);
    }
    long long v18 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v18 addObserver:v9 selector:sel_handleSyncedDataChanged_ name:*MEMORY[0x1E4F28A30] object:v9->_backingKVStore];

    if (![(NSUbiquitousKeyValueStore *)v9->_backingKVStore synchronize])
    {
      uint64_t v19 = sgLogHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v23 = 0;
        _os_log_impl(&dword_1CA650000, v19, OS_LOG_TYPE_DEFAULT, "Something went wrong with trying to synchronize icloud store", v23, 2u);
      }
    }
    [(SGSuggestHistory *)v9 _setInternalStateAccordingToKVS:v12];
    *(unsigned char *)(v12 + 128) = 0;
    uint64_t v20 = [objc_alloc(MEMORY[0x1E4F93B70]) initWithGuardedData:v12];
    locuint64_t k = v9->_lock;
    v9->_locuint64_t k = (_PASLock *)v20;
  }
  return v9;
}

- (NSUbiquitousKeyValueStore)kvs
{
  if ([MEMORY[0x1E4F5DAF0] syncHistoryToCloud])
  {
    uint64_t v3 = 16;
  }
  else
  {
    uint64_t v4 = sgLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)id v7 = 0;
      _os_log_debug_impl(&dword_1CA650000, v4, OS_LOG_TYPE_DEBUG, "Suppressing cloud sync. This should happen in testing only.", v7, 2u);
    }

    uint64_t v3 = 24;
  }
  uint64_t v5 = *(Class *)((char *)&self->super.isa + v3);
  return (NSUbiquitousKeyValueStore *)v5;
}

- (void)migrateFromKVS:(id)a3 withCompletion:(id)a4
{
  v60[10] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = (void (**)(id, void))a4;
  uint64_t v53 = 0;
  v54 = &v53;
  uint64_t v55 = 0x2020000000;
  char v56 = 0;
  uint64_t v47 = 0;
  long long v48 = &v47;
  uint64_t v49 = 0x3032000000;
  uint64_t v50 = __Block_byref_object_copy__8254;
  v51 = __Block_byref_object_dispose__8255;
  id v52 = 0;
  locuint64_t k = self->_lock;
  v46[0] = MEMORY[0x1E4F143A8];
  v46[1] = 3221225472;
  v46[2] = __50__SGSuggestHistory_migrateFromKVS_withCompletion___block_invoke;
  v46[3] = &unk_1E65B6CC8;
  v46[4] = &v53;
  v46[5] = &v47;
  [(_PASLock *)lock runWithLockAcquired:v46];
  if (*((unsigned char *)v54 + 24))
  {
    uint64_t v10 = sgLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA650000, v10, OS_LOG_TYPE_DEFAULT, "SGSuggestHistory: migrateFromKVS aborting to avoid re-entrancy", buf, 2u);
    }

    v8[2](v8, 0);
  }
  else
  {
    v60[0] = @"events";
    v60[1] = @"eventsWithoutTimestamp";
    v60[2] = @"rejectedEvents";
    v60[3] = @"reminders";
    v60[4] = @"rejectedReminders";
    v60[5] = @"newContacts";
    v60[6] = @"storageDetails";
    v60[7] = @"dontUpdate";
    v60[8] = @"confirmedEventFields";
    v60[9] = @"confirmedEventWithoutTimestampFields";
    id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v60 count:10];
    uint64_t v12 = self->_lock;
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __50__SGSuggestHistory_migrateFromKVS_withCompletion___block_invoke_97;
    v39[3] = &unk_1E65B6D18;
    id v29 = v11;
    id v40 = v29;
    id v13 = v7;
    id v41 = v13;
    uint64_t v14 = v12;
    SEL v45 = a2;
    long long v42 = v14;
    id v43 = self;
    uint64_t v44 = v8;
    uint64_t v15 = (void (**)(void, void))[v39 copy];
    if (v48[5]
      && (objc_msgSend(MEMORY[0x1E4F1C9C8], "date", v29),
          uint64_t v16 = objc_claimAutoreleasedReturnValue(),
          [v16 timeIntervalSinceDate:v48[5]],
          BOOL v18 = v17 < 600.0,
          v16,
          v18))
    {
      uint64_t v19 = sgLogHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v20 = [MEMORY[0x1E4F1C9C8] date];
        [v20 timeIntervalSinceDate:v48[5]];
        *(_DWORD *)buf = 134218240;
        *(void *)&uint8_t buf[4] = v21;
        __int16 v58 = 2048;
        uint64_t v59 = 0x4082C00000000000;
        _os_log_impl(&dword_1CA650000, v19, OS_LOG_TYPE_DEFAULT, "SGSuggestHistory: migrateFromKVS aborting, %f sec elapsed since last migration but cooldown period is %f", buf, 0x16u);
      }
      v15[2](v15, 0);
    }
    else
    {
      -[_PASLock runWithLockAcquired:](v14, "runWithLockAcquired:", &__block_literal_global_111, v29);
      uint64_t v22 = [(SGSuggestHistory *)self kvsIfSyncSupported];
      if (v22)
      {
        uint64_t v23 = objc_opt_new();
        v37[0] = MEMORY[0x1E4F143A8];
        v37[1] = 3221225472;
        v37[2] = __50__SGSuggestHistory_migrateFromKVS_withCompletion___block_invoke_113;
        v37[3] = &unk_1E65C0100;
        id v24 = v23;
        id v38 = v24;
        [v13 synchronizeWithCompletionHandler:v37];
        uint64_t v25 = +[SGDCloudKitSync sharedInstance];
        uint64_t v26 = [v25 privacySalt];

        *(void *)buf = 0;
        objc_initWeak((id *)buf, self);
        v30[0] = MEMORY[0x1E4F143A8];
        v30[1] = 3221225472;
        v30[2] = __50__SGSuggestHistory_migrateFromKVS_withCompletion___block_invoke_116;
        v30[3] = &unk_1E65B6DB0;
        id v31 = v22;
        objc_copyWeak(&v36, (id *)buf);
        uint64_t v35 = v15;
        id v27 = v24;
        id v32 = v27;
        id v33 = v13;
        id v34 = v29;
        [v26 wait:v30];

        objc_destroyWeak(&v36);
        objc_destroyWeak((id *)buf);
      }
      else
      {
        uint64_t v28 = sgLogHandle();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_1CA650000, v28, OS_LOG_TYPE_FAULT, "SGSuggestHistory: migrateFromKVS aborting due to nil destination kvs", buf, 2u);
        }

        if (_PASEvaluateLogFaultAndProbCrashCriteria()) {
          abort();
        }
        v15[2](v15, 0);
      }
    }
  }
  _Block_object_dispose(&v47, 8);

  _Block_object_dispose(&v53, 8);
}

void __50__SGSuggestHistory_migrateFromKVS_withCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = *(unsigned char *)(a2 + 128);
  *(unsigned char *)(a2 + 128) = 1;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(id *)(a2 + 136));
}

uint64_t __50__SGSuggestHistory_migrateFromKVS_withCompletion___block_invoke_97(uint64_t a1, int a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    uint64_t v4 = sgLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(__CFString **)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      uint64_t v23 = v5;
      _os_log_impl(&dword_1CA650000, v4, OS_LOG_TYPE_DEFAULT, "SGSuggestHistory: migrateFromKVS succeeded, deleting keys from fromKVS: %@", buf, 0xCu);
    }

    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v6 = *(id *)(a1 + 32);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v18;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v18 != v9) {
            objc_enumerationMutation(v6);
          }
          [*(id *)(a1 + 40) setData:0 forKey:*(void *)(*((void *)&v17 + 1) + 8 * v10++)];
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v8);
    }
  }
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __50__SGSuggestHistory_migrateFromKVS_withCompletion___block_invoke_98;
  v16[3] = &unk_1E65B6CF0;
  uint64_t v11 = *(void *)(a1 + 72);
  uint64_t v12 = *(void **)(a1 + 48);
  v16[4] = *(void *)(a1 + 56);
  v16[5] = v11;
  [v12 runWithLockAcquired:v16];
  id v13 = sgLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = @"failed";
    if (a2) {
      uint64_t v14 = @"succeeded";
    }
    *(_DWORD *)buf = 138412290;
    uint64_t v23 = v14;
    _os_log_impl(&dword_1CA650000, v13, OS_LOG_TYPE_DEFAULT, "SGSuggestHistory: migrateFromKVS %@, calling completion block...", buf, 0xCu);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 64) + 16))();
}

void __50__SGSuggestHistory_migrateFromKVS_withCompletion___block_invoke_113(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = sgLogHandle();
  uint64_t v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v6 = 138412290;
      id v7 = v3;
      _os_log_error_impl(&dword_1CA650000, v5, OS_LOG_TYPE_ERROR, "SGSuggestHistory: migrateFromKVS error syncing fromKVS (will still proceed with migration, this is a best-effort thing): %@", (uint8_t *)&v6, 0xCu);
    }

    [*(id *)(a1 + 32) fail:v3];
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v6) = 0;
      _os_log_impl(&dword_1CA650000, v5, OS_LOG_TYPE_DEFAULT, "SGSuggestHistory: migrateFromKVS successfully synced fromKVS", (uint8_t *)&v6, 2u);
    }

    [*(id *)(a1 + 32) succeed:MEMORY[0x1E4F1CC38]];
  }
}

void __50__SGSuggestHistory_migrateFromKVS_withCompletion___block_invoke_116(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = a1[4];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __50__SGSuggestHistory_migrateFromKVS_withCompletion___block_invoke_2;
  v9[3] = &unk_1E65B6D88;
  objc_copyWeak(&v16, a1 + 9);
  id v15 = a1[8];
  id v10 = a1[5];
  id v11 = a1[6];
  id v12 = a1[4];
  id v8 = v5;
  id v13 = v8;
  id v14 = a1[7];
  [v7 synchronizeWithCompletionHandler:v9];

  objc_destroyWeak(&v16);
}

void __50__SGSuggestHistory_migrateFromKVS_withCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  id v5 = WeakRetained;
  if (WeakRetained && ([WeakRetained needsMigration] & 1) != 0)
  {
    if (!v3)
    {
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __50__SGSuggestHistory_migrateFromKVS_withCompletion___block_invoke_117;
      v8[3] = &unk_1E65B6D60;
      id v7 = *(void **)(a1 + 32);
      id v9 = *(id *)(a1 + 40);
      id v10 = *(id *)(a1 + 48);
      id v13 = *(id *)(a1 + 72);
      id v11 = *(id *)(a1 + 56);
      id v12 = *(id *)(a1 + 64);
      [v7 wait:v8];

      goto LABEL_9;
    }
    id v6 = sgLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v15 = v3;
      _os_log_error_impl(&dword_1CA650000, v6, OS_LOG_TYPE_ERROR, "SGSuggestHistory: migrateFromKVS bailing due to error syncing dest KVS: %@", buf, 0xCu);
    }
  }
  else
  {
    id v6 = sgLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA650000, v6, OS_LOG_TYPE_DEFAULT, "SGSuggestHistory: migrateFromKVS bailing, migration no longer needed after attempting to sync dest KVS", buf, 2u);
    }
  }

  (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
LABEL_9:
}

void __50__SGSuggestHistory_migrateFromKVS_withCompletion___block_invoke_117(uint64_t a1, void *a2, void *a3)
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) dataForKey:@"SGSalt"];
  id v8 = [*(id *)(a1 + 40) dataForKey:@"SGSalt"];

  uint64_t v56 = a1;
  if (v8)
  {
    id v9 = [*(id *)(a1 + 40) dataForKey:@"SGSalt"];
    char v10 = [v7 isEqual:v9];

    if ((v10 & 1) == 0)
    {
      log = sgLogHandle();
      if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
      {
        id v11 = [*(id *)(v56 + 40) dataForKey:@"SGSalt"];
        *(_DWORD *)buf = 138478083;
        v65 = v11;
        __int16 v66 = 2113;
        uint64_t v67 = (uint64_t)v7;
        id v12 = "SGSuggestHistory: bailing with success because new (%{private}@) and old (%{private}@) kvs have different salts";
LABEL_13:
        _os_log_error_impl(&dword_1CA650000, log, OS_LOG_TYPE_ERROR, v12, buf, 0x16u);

        goto LABEL_57;
      }
      goto LABEL_57;
    }
  }
  else if (v7)
  {
    id v13 = sgLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138477827;
      v65 = v7;
      _os_log_impl(&dword_1CA650000, v13, OS_LOG_TYPE_DEFAULT, "SGSuggestHistory: migrateFromKVS copying salt %{private}@ to new kvs", buf, 0xCu);
    }

    [*(id *)(a1 + 40) setData:v7 forKey:@"SGSalt"];
  }
  id v14 = [*(id *)(v56 + 40) dataForKey:@"SGSaltManatee"];

  id v15 = *(void **)(v56 + 48);
  if (!v14)
  {
    if (v15)
    {
      [*(id *)(v56 + 40) setData:*(void *)(v56 + 48) forKey:@"SGSaltManatee"];
      long long v19 = sgLogHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        long long v20 = *(void **)(v56 + 48);
        *(_DWORD *)buf = 138477827;
        v65 = v20;
        uint64_t v21 = "SGSuggestHistory: migrateFromKVS copying legacy manatee salt %{private}@";
        uint64_t v22 = v19;
        uint32_t v23 = 12;
LABEL_19:
        _os_log_impl(&dword_1CA650000, v22, OS_LOG_TYPE_DEFAULT, v21, buf, v23);
      }
    }
    else
    {
      long long v19 = sgLogHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        uint64_t v21 = "SGSuggestHistory: migrateFromKVS not copying legacy manatee salt because no legacy manatee salt has been generated";
        uint64_t v22 = v19;
        uint32_t v23 = 2;
        goto LABEL_19;
      }
    }

LABEL_21:
    long long v62 = 0u;
    long long v63 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    log = *(id *)(v56 + 56);
    uint64_t v24 = [log countByEnumeratingWithState:&v60 objects:v70 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v53 = v7;
      id v54 = v6;
      id v55 = v5;
      uint64_t v59 = *(void *)v61;
      uint64_t v26 = v56;
      do
      {
        uint64_t v27 = 0;
        uint64_t v57 = v25;
        do
        {
          if (*(void *)v61 != v59) {
            objc_enumerationMutation(log);
          }
          uint64_t v28 = *(void **)(*((void *)&v60 + 1) + 8 * v27);
          id v29 = (void *)MEMORY[0x1CB79B230]();
          long long v30 = [*(id *)(v26 + 32) dataForKey:v28];
          if (v30)
          {
            id v31 = (void *)MEMORY[0x1E4F28DC0];
            id v32 = (void *)MEMORY[0x1CB79B230]();
            id v33 = objc_alloc(MEMORY[0x1E4F1CAD0]);
            uint64_t v34 = objc_opt_class();
            uint64_t v35 = objc_msgSend(v33, "initWithObjects:", v34, objc_opt_class(), 0);
            id v36 = [v31 unarchivedObjectOfClasses:v35 fromData:v30 error:0];

            if (v36)
            {
              long long v37 = [*(id *)(v26 + 40) dataForKey:v28];
              if (v37)
              {
                id v38 = (void *)MEMORY[0x1E4F28DC0];
                uint64_t v39 = (void *)MEMORY[0x1CB79B230]();
                id v40 = objc_alloc(MEMORY[0x1E4F1CAD0]);
                uint64_t v41 = objc_opt_class();
                long long v42 = objc_msgSend(v40, "initWithObjects:", v41, objc_opt_class(), 0);
                id v43 = [v38 unarchivedObjectOfClasses:v42 fromData:v37 error:0];

                uint64_t v44 = [v43 count];
                [v43 unionSet:v36];
                uint64_t v45 = [v43 count];
                long long v46 = sgLogHandle();
                BOOL v47 = os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT);
                if (v45 == v44)
                {
                  if (v47)
                  {
                    *(_DWORD *)buf = 138543362;
                    v65 = v28;
                    _os_log_impl(&dword_1CA650000, v46, OS_LOG_TYPE_DEFAULT, "SGSuggestHistory: migrateFromKVS for key %{public}@ fromKVS does not have any entries that aren't already in dest", buf, 0xCu);
                  }
                  uint64_t v26 = v56;
                }
                else
                {
                  if (v47)
                  {
                    *(_DWORD *)buf = 138543618;
                    v65 = v28;
                    __int16 v66 = 2048;
                    uint64_t v67 = v45 - v44;
                    _os_log_impl(&dword_1CA650000, v46, OS_LOG_TYPE_DEFAULT, "SGSuggestHistory: migrateFromKVS for key %{public}@ fromKVS migrating %tu entries from fromKVS to dest kvs that dest kvs didn't already have", buf, 0x16u);
                  }

                  long long v46 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v43 requiringSecureCoding:1 error:0];
                  uint64_t v50 = sgLogHandle();
                  v51 = v50;
                  uint64_t v26 = v56;
                  if (v46)
                  {
                    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
                    {
                      uint64_t v52 = [v46 length];
                      *(_DWORD *)buf = 138543618;
                      v65 = v28;
                      __int16 v66 = 2048;
                      uint64_t v67 = v52;
                      _os_log_impl(&dword_1CA650000, v51, OS_LOG_TYPE_DEFAULT, "SGSuggestHistory: migrateFromKVS for key %{public}@ newDestData is length %tu", buf, 0x16u);
                    }

                    [*(id *)(v56 + 40) setData:v46 forKey:v28];
                  }
                  else
                  {
                    if (os_log_type_enabled(v50, OS_LOG_TYPE_FAULT))
                    {
                      *(_DWORD *)buf = 138543875;
                      v65 = v28;
                      __int16 v66 = 2113;
                      uint64_t v67 = (uint64_t)v36;
                      __int16 v68 = 2113;
                      id v69 = v43;
                      _os_log_fault_impl(&dword_1CA650000, v51, OS_LOG_TYPE_FAULT, "SGSuggestHistory: migrateFromKVS newDestData is nil for key %{public}@! this should not happen. src: %{private}@, dest: %{private}@", buf, 0x20u);
                    }

                    if (_PASEvaluateLogFaultAndProbCrashCriteria()) {
                      goto LABEL_58;
                    }
                    long long v46 = 0;
                  }
                }
              }
              else
              {
                uint64_t v49 = sgLogHandle();
                if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138543362;
                  v65 = v28;
                  _os_log_impl(&dword_1CA650000, v49, OS_LOG_TYPE_DEFAULT, "SGSuggestHistory: migrateFromKVS for key %{public}@ fromKVS does not have any existing entries in dest, so copying the serialized object directly", buf, 0xCu);
                }

                [*(id *)(v26 + 40) setData:v30 forKey:v28];
              }

              uint64_t v25 = v57;
            }
            else
            {
              long long v48 = sgLogHandle();
              if (os_log_type_enabled(v48, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)buf = 138543362;
                v65 = v28;
                _os_log_fault_impl(&dword_1CA650000, v48, OS_LOG_TYPE_FAULT, "SGSuggestHistory: migrateFromKVS for key %{public}@ failed to decode data in fromKVS, so skipping", buf, 0xCu);
              }

              if (_PASEvaluateLogFaultAndProbCrashCriteria()) {
LABEL_58:
              }
                abort();
              id v36 = 0;
            }
          }
          else
          {
            id v36 = sgLogHandle();
            if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              v65 = v28;
              _os_log_impl(&dword_1CA650000, v36, OS_LOG_TYPE_DEFAULT, "SGSuggestHistory: migrateFromKVS for key %{public}@ has no existing data in fromKVS, so skipping", buf, 0xCu);
            }
          }

          ++v27;
        }
        while (v25 != v27);
        uint64_t v25 = [log countByEnumeratingWithState:&v60 objects:v70 count:16];
      }
      while (v25);
      id v6 = v54;
      id v5 = v55;
      id v7 = v53;
    }
    goto LABEL_57;
  }
  uint64_t v16 = [*(id *)(v56 + 40) dataForKey:@"SGSaltManatee"];
  char v17 = [v15 isEqual:v16];

  if (v17) {
    goto LABEL_21;
  }
  log = sgLogHandle();
  if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
  {
    long long v18 = *(void **)(v56 + 48);
    id v11 = [*(id *)(v56 + 40) dataForKey:@"SGSaltManatee"];
    *(_DWORD *)buf = 138478083;
    v65 = v18;
    __int16 v66 = 2113;
    uint64_t v67 = (uint64_t)v11;
    id v12 = "SGSuggestHistory: migrateFromKVS legacy manatee salt %{private}@ in fromKVS conflicts with existing legacy man"
          "atee salt %{private}@ in dest, so we're going to bail with success";
    goto LABEL_13;
  }
LABEL_57:

  (*(void (**)(void))(*(void *)(v56 + 64) + 16))();
}

void __50__SGSuggestHistory_migrateFromKVS_withCompletion___block_invoke_109(uint64_t a1, void *a2)
{
  id v2 = (void *)MEMORY[0x1E4F1C9C8];
  id v3 = a2;
  uint64_t v4 = [v2 date];
  id v5 = (id)v3[17];
  v3[17] = v4;
}

void __50__SGSuggestHistory_migrateFromKVS_withCompletion___block_invoke_98(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!v3[128])
  {
    id v5 = v3;
    uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:*(void *)(a1 + 40), *(void *)(a1 + 32), @"SGSuggestHistory.m", 310, @"Invalid parameter not satisfying: %@", @"guardedData->isMigrating" object file lineNumber description];

    id v3 = v5;
  }
  v3[128] = 0;
}

- (void)recordSuccessfulMigration
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = [NSString alloc];
  id v5 = SGRandomDataOfLength(9uLL);
  id v6 = [v5 base64EncodedStringWithOptions:0];
  id v7 = (void *)[v4 initWithFormat:@"SGSuggestHistory-Migration-%@", v6];

  if ((unint64_t)[v7 lengthOfBytesUsingEncoding:4] >= 0x41)
  {
    char v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"SGSuggestHistory.m", 263, @"Invalid parameter not satisfying: %@", @"[migrationToken lengthOfBytesUsingEncoding:NSUTF8StringEncoding] <= 64" object file lineNumber description];
  }
  [MEMORY[0x1E4F5DAF0] setDidKVSMigrationToken:v7 forIdentifier:self->_kvStoreIdentifier];
  id v8 = [(SGSuggestHistory *)self kvs];
  [v8 setObject:&unk_1F2535748 forKey:v7];

  id v9 = sgLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v12 = v7;
    _os_log_impl(&dword_1CA650000, v9, OS_LOG_TYPE_DEFAULT, "SGSuggestHistory: recording successful migration using token %{public}@", buf, 0xCu);
  }
}

- (BOOL)needsMigration
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F5DAF0] didKVSMigrationTokenForIdentifier:self->_kvStoreIdentifier];
  if (!v3)
  {
    id v6 = sgLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v13) = 0;
      id v9 = "SGSuggestHistory: needsMigration returning YES because migrationToken is nil";
      char v10 = v6;
      uint32_t v11 = 2;
LABEL_10:
      _os_log_impl(&dword_1CA650000, v10, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v13, v11);
    }
LABEL_11:
    BOOL v8 = 1;
    goto LABEL_12;
  }
  id v4 = [(SGSuggestHistory *)self kvsIfSyncSupported];
  id v5 = [v4 objectForKey:v3];

  id v6 = sgLogHandle();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (!v5)
  {
    if (v7)
    {
      int v13 = 138543362;
      id v14 = v3;
      id v9 = "SGSuggestHistory: needsMigration returning YES because migrationToken %{public}@ is not set in the KVS";
      char v10 = v6;
      uint32_t v11 = 12;
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  if (v7)
  {
    int v13 = 138543362;
    id v14 = v3;
    _os_log_impl(&dword_1CA650000, v6, OS_LOG_TYPE_DEFAULT, "SGSuggestHistory: needsMigration returning NO because migrationToken %{public}@ is already set in the KVS", (uint8_t *)&v13, 0xCu);
  }
  BOOL v8 = 0;
LABEL_12:

  return v8;
}

- (void)migrateIfNeeded
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v3 = sgLogHandle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_1CA650000, v3, OS_LOG_TYPE_DEFAULT, "SGSuggestHistory: Entering migrateIfNeeded", (uint8_t *)&buf, 2u);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v31 = 0x3032000000;
  id v32 = __Block_byref_object_copy__8254;
  id v33 = __Block_byref_object_dispose__8255;
  id v34 = 0;
  locuint64_t k = self->_lock;
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  void v29[2] = __35__SGSuggestHistory_migrateIfNeeded__block_invoke;
  v29[3] = &unk_1E65B6C28;
  v29[4] = &buf;
  [(_PASLock *)lock runWithLockAcquired:v29];
  id v5 = *(id *)(*((void *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);

  if (!v5)
  {
    long long v20 = sgLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1CA650000, v20, OS_LOG_TYPE_DEFAULT, "SGSuggestHistory: Exiting migrateIfNeeded (fromKVS is nil)", (uint8_t *)&buf, 2u);
    }
    goto LABEL_13;
  }
  if (![(SGSuggestHistory *)self needsMigration])
  {
    long long v20 = sgLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1CA650000, v20, OS_LOG_TYPE_DEFAULT, "SGSuggestHistory: Exiting migrateIfNeeded (migration not needed)", (uint8_t *)&buf, 2u);
    }
LABEL_13:

    goto LABEL_14;
  }
  id location = 0;
  objc_initWeak(&location, self);
  id v6 = (void *)[[NSString alloc] initWithFormat:@"SGSuggestHistory migration: %@", self->_kvStoreIdentifier];
  BOOL v7 = sgLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v6;
    _os_log_impl(&dword_1CA650000, v7, OS_LOG_TYPE_DEFAULT, "SGSuggestHistory: migrateIfNeeded session %{public}@", (uint8_t *)&buf, 0xCu);
  }

  BOOL v8 = (void *)MEMORY[0x1CB79B230]();
  id v9 = (void *)MEMORY[0x1E4F93B18];
  id v10 = v6;
  uint32_t v11 = objc_msgSend(v9, "autoreleasingSerialQueueWithLabel:qosClass:", objc_msgSend(v10, "UTF8String"), 17);
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v31 = 0x3032000000;
  id v32 = __Block_byref_object_copy__8254;
  id v33 = __Block_byref_object_dispose__8255;
  id v34 = 0;
  id v12 = (void *)MEMORY[0x1CB79B230]();
  id v13 = v10;
  [v13 UTF8String];
  uint64_t v14 = os_transaction_create();
  uint64_t v15 = *(void **)(*((void *)&buf + 1) + 40);
  *(void *)(*((void *)&buf + 1) + 40) = v14;

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__SGSuggestHistory_migrateIfNeeded__block_invoke_71;
  block[3] = &unk_1E65C0148;
  block[4] = &buf;
  dispatch_block_t v16 = dispatch_block_create((dispatch_block_flags_t)0, block);
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  void v21[2] = __35__SGSuggestHistory_migrateIfNeeded__block_invoke_72;
  v21[3] = &unk_1E65B6CA0;
  objc_copyWeak(&v26, &location);
  id v22 = v5;
  id v23 = v11;
  id v24 = v16;
  p_long long buf = &buf;
  id v17 = v16;
  long long v18 = v11;
  dispatch_async(v18, v21);
  dispatch_time_t v19 = dispatch_time(0, 300000000000);
  dispatch_after(v19, v18, v17);

  objc_destroyWeak(&v26);
  _Block_object_dispose(&buf, 8);

  objc_destroyWeak(&location);
LABEL_14:
}

void __35__SGSuggestHistory_migrateIfNeeded__block_invoke(uint64_t a1, uint64_t a2)
{
}

uint64_t __35__SGSuggestHistory_migrateIfNeeded__block_invoke_71(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 8);
  id v2 = *(void **)(v1 + 40);
  *(void *)(v1 + 40) = 0;

  id v3 = sgLogHandle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_fault_impl(&dword_1CA650000, v3, OS_LOG_TYPE_FAULT, "SGSuggestHistory: Timed out in migrateIfNeeded -- Ending transaction but migration will continue (unless we probabilistically crash)", v5, 2u);
  }

  uint64_t result = _PASEvaluateLogFaultAndProbCrashCriteria();
  if (result) {
    abort();
  }
  return result;
}

void __35__SGSuggestHistory_migrateIfNeeded__block_invoke_72(uint64_t a1)
{
  id v2 = sgLogHandle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1CA650000, v2, OS_LOG_TYPE_DEFAULT, "SGSuggestHistory: migrateIfNeeded on queue", buf, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __35__SGSuggestHistory_migrateIfNeeded__block_invoke_73;
    v8[3] = &unk_1E65B6C78;
    uint64_t v4 = *(void *)(a1 + 32);
    id v9 = *(id *)(a1 + 40);
    long long v7 = *(_OWORD *)(a1 + 48);
    id v5 = (id)v7;
    long long v11 = v7;
    id v10 = WeakRetained;
    [v10 migrateFromKVS:v4 withCompletion:v8];

    id v6 = v9;
  }
  else
  {
    id v6 = sgLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1CA650000, v6, OS_LOG_TYPE_DEFAULT, "SGSuggestHistory: migrateIfNeeded aborting due to nil strongSelf", buf, 2u);
    }
  }
}

void __35__SGSuggestHistory_migrateIfNeeded__block_invoke_73(uint64_t a1, char a2)
{
  uint64_t v4 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__SGSuggestHistory_migrateIfNeeded__block_invoke_2;
  block[3] = &unk_1E65B6C50;
  long long v6 = *(_OWORD *)(a1 + 48);
  id v5 = (id)v6;
  long long v9 = v6;
  char v10 = a2;
  id v8 = *(id *)(a1 + 40);
  dispatch_async(v4, block);
}

void __35__SGSuggestHistory_migrateIfNeeded__block_invoke_2(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v2 = *(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  dispatch_block_cancel(*(dispatch_block_t *)(a1 + 40));
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = 0;

  id v5 = sgLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    if (*(unsigned char *)(a1 + 56)) {
      long long v6 = @"SUCCESS";
    }
    else {
      long long v6 = @"FAILURE";
    }
    int v7 = 138412290;
    id v8 = v6;
    _os_log_impl(&dword_1CA650000, v5, OS_LOG_TYPE_DEFAULT, "SGSuggestHistory: migrateIfNeeded %@", (uint8_t *)&v7, 0xCu);
  }

  if (*(unsigned char *)(a1 + 56)) {
    [*(id *)(a1 + 32) recordSuccessfulMigration];
  }
}

- (void)setMigrateFromStore:(id)a3
{
  id v4 = a3;
  locuint64_t k = self->_lock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  _DWORD v7[2] = __40__SGSuggestHistory_setMigrateFromStore___block_invoke;
  v7[3] = &unk_1E65B6C00;
  id v8 = v4;
  id v6 = v4;
  [(_PASLock *)lock runWithLockAcquired:v7];
  [(SGSuggestHistory *)self migrateIfNeeded];
}

void __40__SGSuggestHistory_setMigrateFromStore___block_invoke(uint64_t a1, uint64_t a2)
{
}

- (id)kvsIfSyncSupported
{
  backingKVStore = (SGNoCloudNSUbiquitousKeyValueStore *)self->_backingKVStore;
  if (backingKVStore == self->_noCloudFakeBackingKVStore) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = backingKVStore;
  }
  return v3;
}

+ (void)resetNoFlush
{
  id v2 = +[SGSuggestHistory sharedSuggestHistory];
  [v2 resetNoFlush];
}

+ (void)reset
{
  id v2 = +[SGSuggestHistory sharedSuggestHistory];
  [v2 reset];
}

+ (id)newTestingInstanceWithSharedKVS:(id)a3
{
  id v3 = a3;
  id v4 = [SGSuggestHistory alloc];
  id v5 = [MEMORY[0x1E4F29128] UUID];
  id v6 = [v5 UUIDString];
  int v7 = [(SGSuggestHistory *)v4 initWithKVS:v3 kvStoreIdentifier:v6];

  return v7;
}

uint64_t __40__SGSuggestHistory_sharedSuggestHistory__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = (void *)sharedSuggestHistory_instance;
  sharedSuggestHistory_instance = v0;

  id v2 = (void *)sharedSuggestHistory_instance;
  return [v2 migrateIfNeeded];
}

@end