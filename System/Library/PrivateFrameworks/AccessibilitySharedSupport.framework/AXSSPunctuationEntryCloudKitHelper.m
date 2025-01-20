@interface AXSSPunctuationEntryCloudKitHelper
- (Class)managedObjectClass;
- (id)apsEnvironment;
- (id)createCKRecordFromEntry:(id)a3;
- (id)createCKRecordFromObject:(id)a3;
- (id)recordType;
- (id)testRecordForSchemaCreation:(id)a3;
- (void)_processPunctuationEntryFromCKRecord:(id)a3;
- (void)beginWatchingForChanges;
- (void)clearRecordsForPurging:(id)a3;
- (void)dealloc;
- (void)processRecordDeletionsFromServer:(id)a3;
- (void)processServerUpdateChanges:(id)a3 moc:(id)a4 recordNameToManagedObject:(id)a5;
- (void)punctuationGroupChanged:(id)a3;
- (void)retrieveLocalChangesForCloud:(id)a3;
@end

@implementation AXSSPunctuationEntryCloudKitHelper

- (id)recordType
{
  return @"AXPunctuationEntry";
}

- (id)apsEnvironment
{
  return (id)*MEMORY[0x1E4F4E1D0];
}

- (Class)managedObjectClass
{
  return (Class)objc_opt_class();
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28C40] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)AXSSPunctuationEntryCloudKitHelper;
  [(AXSSCloudKitHelper *)&v4 dealloc];
}

- (id)testRecordForSchemaCreation:(id)a3
{
  objc_super v4 = (objc_class *)MEMORY[0x1E4F1A2D8];
  id v5 = a3;
  id v6 = [v4 alloc];
  v7 = [(AXSSCloudKitHelper *)self zoneSubscription];
  v8 = [v7 recordType];
  v9 = (void *)[v6 initWithRecordType:v8 recordID:v5];

  [v9 setRule:@"Rule"];
  [v9 setVersion:&unk_1F0C679E0];
  v10 = [MEMORY[0x1E4F29128] UUID];
  [v9 setGroupUUID:v10];

  return v9;
}

- (id)createCKRecordFromEntry:(id)a3
{
  objc_super v4 = (objc_class *)MEMORY[0x1E4F1A2F8];
  id v5 = a3;
  id v6 = [v4 alloc];
  v7 = [v5 uuid];
  v8 = [v7 UUIDString];
  v9 = [(AXSSCloudKitHelper *)self recordZone];
  v10 = [v9 zoneID];
  v11 = (void *)[v6 initWithRecordName:v8 zoneID:v10];

  id v12 = objc_alloc(MEMORY[0x1E4F1A2D8]);
  v13 = [(AXSSPunctuationEntryCloudKitHelper *)self recordType];
  v14 = (void *)[v12 initWithRecordType:v13 recordID:v11];

  v15 = +[AXSSPunctuationManager sharedDatabase];
  v16 = objc_msgSend(v15, "ruleToString:", objc_msgSend(v5, "rule"));
  [v14 setRule:v16];

  v17 = [v5 punctuation];
  [v14 setPunctuation:v17];

  v18 = [v5 replacement];
  [v14 setReplacement:v18];

  v19 = objc_msgSend(NSNumber, "numberWithUnsignedShort:", objc_msgSend(v5, "version"));
  [v14 setVersion:v19];

  v20 = [v5 groupUUID];

  [v14 setGroupUUID:v20];

  return v14;
}

- (id)createCKRecordFromObject:(id)a3
{
  objc_super v4 = (objc_class *)MEMORY[0x1E4F1A2F8];
  id v5 = a3;
  id v6 = [v4 alloc];
  v7 = [v5 uuid];
  v8 = [v7 UUIDString];
  v9 = [(AXSSCloudKitHelper *)self recordZone];
  v10 = [v9 zoneID];
  v11 = (void *)[v6 initWithRecordName:v8 zoneID:v10];

  id v12 = objc_alloc(MEMORY[0x1E4F1A2D8]);
  v13 = [(AXSSPunctuationEntryCloudKitHelper *)self recordType];
  v14 = (void *)[v12 initWithRecordType:v13 recordID:v11];

  v15 = [v5 rule];
  [v14 setRule:v15];

  v16 = [v5 punctuation];
  [v14 setPunctuation:v16];

  v17 = [v5 replacement];
  [v14 setReplacement:v17];

  v18 = objc_msgSend(NSNumber, "numberWithShort:", objc_msgSend(v5, "version"));
  [v14 setVersion:v18];

  v19 = [v5 groupUUID];

  [v14 setGroupUUID:v19];

  return v14;
}

- (void)_processPunctuationEntryFromCKRecord:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc(MEMORY[0x1E4F29128]);
  id v5 = [v3 recordID];
  id v6 = [v5 recordName];
  v7 = (void *)[v4 initWithUUIDString:v6];

  v8 = +[AXSSPunctuationManager sharedDatabase];
  v9 = [v8 punctuationEntryForUUID:v7];

  if (!v9)
  {
    v9 = objc_opt_new();
    [v9 setUuid:v7];
    goto LABEL_10;
  }
  v10 = [v9 ckChangeTag];
  v11 = [v3 recordChangeTag];
  int v12 = [v10 isEqual:v11];

  if (v12)
  {
    if ([v9 inCloud])
    {
      v13 = AXLogPunctuationStorage();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        int v28 = 138412290;
        v29 = v9;
        v14 = "Entry is same as CK - skipping: %@";
LABEL_12:
        _os_log_impl(&dword_1B3B9D000, v13, OS_LOG_TYPE_INFO, v14, (uint8_t *)&v28, 0xCu);
        goto LABEL_13;
      }
      goto LABEL_13;
    }
LABEL_10:
    v21 = +[AXSSPunctuationManager sharedDatabase];
    v22 = [v3 rule];
    objc_msgSend(v9, "setRule:", objc_msgSend(v21, "stringToRule:", v22));

    v23 = [v3 punctuation];
    [v9 setPunctuation:v23];

    v24 = [v3 replacement];
    [v9 setReplacement:v24];

    v25 = [v3 groupUUID];
    [v9 setGroupUUID:v25];

    [v9 setInCloud:1];
    v26 = [v3 recordChangeTag];
    [v9 setCkChangeTag:v26];

    v27 = +[AXSSPunctuationManager sharedDatabase];
    [v27 updateEntry:v9 fromCloudKit:1];

    v13 = AXLogPunctuationStorage();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      int v28 = 138412290;
      v29 = v9;
      v14 = "Updating punctuation entry: %@";
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  v15 = [v9 lastModifiedDate];
  [v15 timeIntervalSinceReferenceDate];
  double v17 = v16;
  v18 = [v3 modificationDate];
  [v18 timeIntervalSinceReferenceDate];
  double v20 = v19;

  if (v17 <= v20) {
    goto LABEL_10;
  }
  v13 = AXLogPunctuationStorage();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    int v28 = 138412290;
    v29 = v9;
    v14 = "Local entry is newer, we need to update: %@";
    goto LABEL_12;
  }
LABEL_13:
}

- (void)beginWatchingForChanges
{
  v8.receiver = self;
  v8.super_class = (Class)AXSSPunctuationEntryCloudKitHelper;
  [(AXSSCloudKitHelper *)&v8 beginWatchingForChanges];
  id v3 = [MEMORY[0x1E4F28C40] defaultCenter];
  [v3 addObserver:self selector:sel_punctuationGroupChanged_ name:@"AXSSVoiceOverPunctuationGroupsChangedNotification" object:0];

  id v4 = objc_alloc(MEMORY[0x1E4F48318]);
  id v5 = [(AXSSCloudKitHelper *)self cloudkitQueue];
  id v6 = (AXDispatchTimer *)[v4 initWithTargetSerialQueue:v5];
  changeCoalescer = self->_changeCoalescer;
  self->_changeCoalescer = v6;

  [(AXDispatchTimer *)self->_changeCoalescer setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:1];
}

- (void)punctuationGroupChanged:(id)a3
{
  id v4 = a3;
  changeCoalescer = self->_changeCoalescer;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __62__AXSSPunctuationEntryCloudKitHelper_punctuationGroupChanged___block_invoke;
  v7[3] = &unk_1E606C9A0;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  [(AXDispatchTimer *)changeCoalescer afterDelay:v7 processBlock:0.5];
}

uint64_t __62__AXSSPunctuationEntryCloudKitHelper_punctuationGroupChanged___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = AXLogPunctuationStorage();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v7 = 138412290;
    uint64_t v8 = v3;
    _os_log_impl(&dword_1B3B9D000, v2, OS_LOG_TYPE_INFO, "Punctuation group changed locally, consolidating for cloud push: %@", (uint8_t *)&v7, 0xCu);
  }

  id v4 = +[AXSSPunctuationManager sharedDatabase];
  id v5 = [v4 managedObjectContext];
  [v5 performBlockAndWait:&__block_literal_global_14];

  return [*(id *)(a1 + 40) processLocalChangesAndPush];
}

void __62__AXSSPunctuationEntryCloudKitHelper_punctuationGroupChanged___block_invoke_17()
{
  id v1 = +[AXSSPunctuationManager sharedDatabase];
  v0 = [v1 managedObjectContext];
  [v0 refreshAllObjects];
}

- (void)clearRecordsForPurging:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v20 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v15;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v14 + 1) + 8 * v7);
        uint64_t v9 = AXLogPunctuationStorage();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
          -[AXSSPunctuationEntryCloudKitHelper clearRecordsForPurging:](v18, v8, &v19, v9);
        }

        v10 = +[AXSSPunctuationManager sharedDatabase];
        id v11 = objc_alloc(MEMORY[0x1E4F29128]);
        int v12 = [v8 recordName];
        v13 = (void *)[v11 initWithUUIDString:v12];
        [v10 removeCloudRecordForPurge:v13];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v14 objects:v20 count:16];
    }
    while (v5);
  }
}

- (void)retrieveLocalChangesForCloud:(id)a3
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  v48 = (void (**)(id, void *, void *, void *))a3;
  uint64_t v4 = [MEMORY[0x1E4F1CA48] array];
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  uint64_t v5 = +[AXSSPunctuationManager sharedDatabase];
  uint64_t v6 = [v5 punctuationGroups];

  id obj = v6;
  v53 = v4;
  uint64_t v51 = [v6 countByEnumeratingWithState:&v65 objects:v77 count:16];
  if (v51)
  {
    uint64_t v50 = *(void *)v66;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v66 != v50) {
          objc_enumerationMutation(obj);
        }
        uint64_t v52 = v7;
        uint64_t v8 = *(void **)(*((void *)&v65 + 1) + 8 * v7);
        long long v61 = 0u;
        long long v62 = 0u;
        long long v63 = 0u;
        long long v64 = 0u;
        id v55 = [v8 entries];
        uint64_t v9 = [v55 countByEnumeratingWithState:&v61 objects:v76 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v62;
          do
          {
            uint64_t v12 = 0;
            do
            {
              if (*(void *)v62 != v11) {
                objc_enumerationMutation(v55);
              }
              v13 = *(void **)(*((void *)&v61 + 1) + 8 * v12);
              long long v14 = AXLogPunctuationStorage();
              if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
              {
                int v26 = [v13 inCloud];
                v27 = [v13 ckChangeTag];
                int v28 = [MEMORY[0x1E4F1C9C8] date];
                [v28 timeIntervalSinceReferenceDate];
                double v30 = v29;
                v31 = [v13 ckRecordProcessDate];
                [v31 timeIntervalSinceReferenceDate];
                *(_DWORD *)buf = 67109890;
                *(_DWORD *)v71 = v26;
                *(_WORD *)&v71[4] = 2112;
                *(void *)&v71[6] = v27;
                __int16 v72 = 2112;
                v73 = v13;
                __int16 v74 = 2048;
                double v75 = v30 - v32;
                _os_log_debug_impl(&dword_1B3B9D000, v14, OS_LOG_TYPE_DEBUG, "Is entry in icloud? %d, tag: %@: %@, last mod date: %f", buf, 0x26u);

                uint64_t v4 = v53;
              }

              int v15 = [v13 inCloud];
              if (v15)
              {
                long long v16 = [v13 ckChangeTag];
                id v3 = v16;
                if (v16) {
                  goto LABEL_23;
                }
              }
              long long v17 = [v13 ckRecordProcessDate];
              if (!v17)
              {

                if (v15) {
LABEL_22:
                }
                v24 = [(AXSSPunctuationEntryCloudKitHelper *)self createCKRecordFromEntry:v13];
                [v4 addObject:v24];

                v25 = [MEMORY[0x1E4F1C9C8] date];
                [v13 setCkRecordProcessDate:v25];

                long long v16 = +[AXSSPunctuationManager sharedDatabase];
                [v16 updateEntry:v13];
LABEL_23:

                goto LABEL_24;
              }
              v18 = [MEMORY[0x1E4F1C9C8] date];
              [v18 timeIntervalSinceReferenceDate];
              double v20 = v19;
              uint64_t v21 = [v13 ckRecordProcessDate];
              [v21 timeIntervalSinceReferenceDate];
              double v23 = v20 - v22;

              if (v15) {
              if (v23 > 60.0)
              }
                goto LABEL_22;
LABEL_24:
              ++v12;
            }
            while (v10 != v12);
            uint64_t v10 = [v55 countByEnumeratingWithState:&v61 objects:v76 count:16];
          }
          while (v10);
        }

        uint64_t v7 = v52 + 1;
      }
      while (v52 + 1 != v51);
      uint64_t v51 = [obj countByEnumeratingWithState:&v65 objects:v77 count:16];
    }
    while (v51);
  }

  v33 = [MEMORY[0x1E4F1CA48] array];
  v34 = +[AXSSPunctuationManager sharedDatabase];
  v35 = +[AXSSPunctuationEntry description];
  v36 = [v34 cloudRecordsToPurge:v35];

  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  id v56 = v36;
  uint64_t v37 = [v56 countByEnumeratingWithState:&v57 objects:v69 count:16];
  if (v37)
  {
    uint64_t v38 = v37;
    uint64_t v39 = *(void *)v58;
    do
    {
      for (uint64_t i = 0; i != v38; ++i)
      {
        if (*(void *)v58 != v39) {
          objc_enumerationMutation(v56);
        }
        v41 = *(void **)(*((void *)&v57 + 1) + 8 * i);
        id v42 = objc_alloc(MEMORY[0x1E4F1A2F8]);
        v43 = [v41 UUIDString];
        v44 = [(AXSSCloudKitHelper *)self recordZone];
        v45 = [v44 zoneID];
        v46 = (void *)[v42 initWithRecordName:v43 zoneID:v45];

        [v33 addObject:v46];
        v47 = AXLogPunctuationStorage();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)v71 = v41;
          _os_log_impl(&dword_1B3B9D000, v47, OS_LOG_TYPE_INFO, "Purging entry: %@", buf, 0xCu);
        }

        uint64_t v4 = v53;
      }
      uint64_t v38 = [v56 countByEnumeratingWithState:&v57 objects:v69 count:16];
    }
    while (v38);
  }

  v48[2](v48, v4, v33, &__block_literal_global_23_0);
}

void __67__AXSSPunctuationEntryCloudKitHelper_retrieveLocalChangesForCloud___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = objc_alloc(MEMORY[0x1E4F29128]);
  uint64_t v4 = [v2 recordID];
  uint64_t v5 = [v4 recordName];
  uint64_t v6 = (void *)[v3 initWithUUIDString:v5];

  uint64_t v7 = +[AXSSPunctuationManager sharedDatabase];
  uint64_t v8 = [v7 punctuationEntryForUUID:v6];

  uint64_t v9 = AXLogPunctuationStorage();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    int v15 = 138412802;
    id v16 = v2;
    __int16 v17 = 2112;
    v18 = v8;
    __int16 v19 = 2112;
    double v20 = v6;
    _os_log_impl(&dword_1B3B9D000, v9, OS_LOG_TYPE_INFO, "Processing entry cloud retreival: %@ %@ %@", (uint8_t *)&v15, 0x20u);
  }

  if (v8)
  {
    [v8 setInCloud:1];
    uint64_t v10 = [v2 groupUUID];
    [v8 setGroupUUID:v10];

    uint64_t v11 = [v2 recordChangeTag];
    [v8 setCkChangeTag:v11];

    [v8 setCkRecordProcessDate:0];
    uint64_t v12 = +[AXSSPunctuationManager sharedDatabase];
    [v12 updateEntry:v8 fromCloudKit:1];

    v13 = AXLogPunctuationStorage();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      long long v14 = [v8 ckChangeTag];
      int v15 = 138412546;
      id v16 = v14;
      __int16 v17 = 2112;
      v18 = v8;
      _os_log_impl(&dword_1B3B9D000, v13, OS_LOG_TYPE_INFO, "Marked in icloud with new tag: %@: %@", (uint8_t *)&v15, 0x16u);
    }
  }
}

- (void)processServerUpdateChanges:(id)a3 moc:(id)a4 recordNameToManagedObject:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  uint64_t v9 = AXLogPunctuationStorage();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v21 = v7;
    __int16 v22 = 2112;
    id v23 = v8;
    _os_log_impl(&dword_1B3B9D000, v9, OS_LOG_TYPE_DEFAULT, "Received server updates: %@, %@", buf, 0x16u);
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v10 = v7;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        -[AXSSPunctuationEntryCloudKitHelper _processPunctuationEntryFromCKRecord:](self, "_processPunctuationEntryFromCKRecord:", *(void *)(*((void *)&v15 + 1) + 8 * v14++), (void)v15);
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v12);
  }
}

- (void)processRecordDeletionsFromServer:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v17 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        id v9 = objc_alloc(MEMORY[0x1E4F29128]);
        id v10 = [v8 recordName];
        uint64_t v11 = (void *)[v9 initWithUUIDString:v10];

        uint64_t v12 = +[AXSSPunctuationManager sharedDatabase];
        uint64_t v13 = [v12 punctuationEntryForUUID:v11];

        uint64_t v14 = +[AXSSPunctuationManager sharedDatabase];
        [v14 removeEntry:v13];

        long long v15 = AXLogPunctuationStorage();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          id v21 = v8;
          __int16 v22 = 2112;
          id v23 = v13;
          _os_log_impl(&dword_1B3B9D000, v15, OS_LOG_TYPE_DEFAULT, "Removing entry from server push: %@ %@", buf, 0x16u);
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v5);
  }
}

- (void).cxx_destruct
{
}

- (void)clearRecordsForPurging:(void *)a3 .cold.1(uint8_t *a1, void *a2, void *a3, NSObject *a4)
{
  id v7 = [a2 recordName];
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_debug_impl(&dword_1B3B9D000, a4, OS_LOG_TYPE_DEBUG, "Committing record purge entry: %@", a1, 0xCu);
}

@end