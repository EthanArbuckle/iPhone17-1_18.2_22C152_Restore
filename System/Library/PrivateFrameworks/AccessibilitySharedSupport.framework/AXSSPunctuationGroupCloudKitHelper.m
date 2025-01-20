@interface AXSSPunctuationGroupCloudKitHelper
- (Class)managedObjectClass;
- (id)apsEnvironment;
- (id)createCKRecordFromGroup:(id)a3;
- (id)createCKRecordFromObject:(id)a3;
- (id)recordType;
- (id)testRecordForSchemaCreation:(id)a3;
- (void)beginWatchingForChanges;
- (void)clearRecordsForPurging:(id)a3;
- (void)dealloc;
- (void)processRecordDeletionsFromServer:(id)a3;
- (void)processServerUpdateChanges:(id)a3 moc:(id)a4 recordNameToManagedObject:(id)a5;
- (void)punctuationGroupsChanged:(id)a3;
- (void)retrieveLocalChangesForCloud:(id)a3;
@end

@implementation AXSSPunctuationGroupCloudKitHelper

- (id)recordType
{
  return @"AXPunctuationGroup";
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
  v4.super_class = (Class)AXSSPunctuationGroupCloudKitHelper;
  [(AXSSCloudKitHelper *)&v4 dealloc];
}

- (id)apsEnvironment
{
  return (id)*MEMORY[0x1E4F4E1D0];
}

- (id)testRecordForSchemaCreation:(id)a3
{
  objc_super v4 = (objc_class *)MEMORY[0x1E4F1A2D8];
  id v5 = a3;
  id v6 = [v4 alloc];
  v7 = [(AXSSCloudKitHelper *)self zoneSubscription];
  v8 = [v7 recordType];
  v9 = (void *)[v6 initWithRecordType:v8 recordID:v5];

  [v9 setName:@"test"];

  return v9;
}

- (id)createCKRecordFromGroup:(id)a3
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
  v13 = [(AXSSPunctuationGroupCloudKitHelper *)self recordType];
  v14 = (void *)[v12 initWithRecordType:v13 recordID:v11];

  v15 = [v5 name];
  [v14 setName:v15];

  v16 = [v5 basePunctuationUUID];
  v17 = [v16 UUIDString];
  [v14 setBasePunctuationGroup:v17];

  v18 = NSNumber;
  uint64_t v19 = [v5 version];

  v20 = [v18 numberWithUnsignedShort:v19];
  [v14 setVersion:v20];

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
  v13 = [(AXSSPunctuationGroupCloudKitHelper *)self recordType];
  v14 = (void *)[v12 initWithRecordType:v13 recordID:v11];

  v15 = [v5 name];
  [v14 setName:v15];

  v16 = [v5 basePunctuationUUID];
  v17 = [v16 UUIDString];
  [v14 setBasePunctuationGroup:v17];

  v18 = NSNumber;
  uint64_t v19 = [v5 version];

  v20 = [v18 numberWithShort:v19];
  [v14 setVersion:v20];

  return v14;
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
        v8 = *(void **)(*((void *)&v14 + 1) + 8 * v7);
        v9 = AXLogPunctuationStorage();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
          -[AXSSPunctuationGroupCloudKitHelper clearRecordsForPurging:](v18, v8, &v19, v9);
        }

        v10 = +[AXSSPunctuationManager sharedDatabase];
        id v11 = objc_alloc(MEMORY[0x1E4F29128]);
        id v12 = [v8 recordName];
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
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  v52 = (void (**)(id, void *, void *, void *))a3;
  v54 = [MEMORY[0x1E4F1CA48] array];
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  uint64_t v4 = +[AXSSPunctuationManager sharedDatabase];
  uint64_t v5 = [v4 punctuationGroups];

  id obj = v5;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v63 objects:v76 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v64;
    uint64_t v55 = *(void *)v64;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v64 != v8) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v63 + 1) + 8 * v9);
        id v11 = AXLogPunctuationStorage();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          int v53 = [v10 inCloud];
          v24 = [v10 ckChangeTag];
          v25 = [MEMORY[0x1E4F1C9C8] date];
          [v25 timeIntervalSinceReferenceDate];
          double v27 = v26;
          v28 = [v10 ckRecordProcessDate];
          [v28 timeIntervalSinceReferenceDate];
          double v30 = v27 - v29;
          v31 = [MEMORY[0x1E4F1C9C8] date];
          [v31 timeIntervalSinceReferenceDate];
          uint64_t v33 = v32;
          v34 = [v10 ckRecordProcessDate];
          [v34 timeIntervalSinceReferenceDate];
          *(_DWORD *)buf = 67110402;
          *(_DWORD *)v69 = v53;
          *(_WORD *)&v69[4] = 2112;
          *(void *)&v69[6] = v24;
          *(_WORD *)&v69[14] = 2112;
          *(void *)&v69[16] = v10;
          __int16 v70 = 2048;
          double v71 = v30;
          __int16 v72 = 2048;
          uint64_t v73 = v33;
          __int16 v74 = 2048;
          uint64_t v75 = v35;
          _os_log_debug_impl(&dword_1B3B9D000, v11, OS_LOG_TYPE_DEBUG, "Is group in icloud? %d, tag: %@: %@, last mod date: %f[%f-%f]", buf, 0x3Au);

          uint64_t v8 = v55;
        }

        int v12 = [v10 inCloud];
        if (v12)
        {
          v13 = [v10 ckChangeTag];
          id v3 = v13;
          if (v13) {
            goto LABEL_20;
          }
        }
        long long v14 = [v10 ckRecordProcessDate];
        if (!v14)
        {

          if (v12) {
LABEL_17:
          }
          v13 = [(AXSSPunctuationGroupCloudKitHelper *)self createCKRecordFromGroup:v10];
          [v54 addObject:v13];
          uint64_t v21 = [MEMORY[0x1E4F1C9C8] date];
          [v10 setCkRecordProcessDate:v21];

          v22 = +[AXSSPunctuationManager sharedDatabase];
          [v22 updatePunctuationGroup:v10];

          v23 = AXLogPunctuationStorage();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)v69 = v13;
            _os_log_debug_impl(&dword_1B3B9D000, v23, OS_LOG_TYPE_DEBUG, "Adding record: %@", buf, 0xCu);
          }

LABEL_20:
          goto LABEL_21;
        }
        long long v15 = [MEMORY[0x1E4F1C9C8] date];
        [v15 timeIntervalSinceReferenceDate];
        double v17 = v16;
        v18 = [v10 ckRecordProcessDate];
        [v18 timeIntervalSinceReferenceDate];
        double v20 = v17 - v19;

        if (v12) {
        uint64_t v8 = v55;
        }
        if (v20 > 60.0) {
          goto LABEL_17;
        }
LABEL_21:
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [obj countByEnumeratingWithState:&v63 objects:v76 count:16];
    }
    while (v7);
  }

  v36 = [MEMORY[0x1E4F1CA48] array];
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  v37 = +[AXSSPunctuationManager sharedDatabase];
  v38 = +[AXSSPunctuationGroup description];
  v39 = [v37 cloudRecordsToPurge:v38];

  id obja = v39;
  uint64_t v40 = [v39 countByEnumeratingWithState:&v59 objects:v67 count:16];
  if (v40)
  {
    uint64_t v41 = v40;
    uint64_t v42 = *(void *)v60;
    do
    {
      for (uint64_t i = 0; i != v41; ++i)
      {
        if (*(void *)v60 != v42) {
          objc_enumerationMutation(obja);
        }
        v44 = *(void **)(*((void *)&v59 + 1) + 8 * i);
        id v45 = objc_alloc(MEMORY[0x1E4F1A2F8]);
        v46 = [v44 UUIDString];
        v47 = [(AXSSCloudKitHelper *)self recordZone];
        v48 = [v47 zoneID];
        v49 = (void *)[v45 initWithRecordName:v46 zoneID:v48];

        [v36 addObject:v49];
        v50 = AXLogPunctuationStorage();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)v69 = v44;
          _os_log_impl(&dword_1B3B9D000, v50, OS_LOG_TYPE_INFO, "Purging group: %@", buf, 0xCu);
        }
      }
      uint64_t v41 = [obja countByEnumeratingWithState:&v59 objects:v67 count:16];
    }
    while (v41);
  }

  v51 = AXLogPunctuationStorage();
  if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    *(void *)v69 = v54;
    *(_WORD *)&v69[8] = 2112;
    *(void *)&v69[10] = v36;
    _os_log_impl(&dword_1B3B9D000, v51, OS_LOG_TYPE_INFO, "Group providing data for local server: %@, del: %@", buf, 0x16u);
  }

  v52[2](v52, v54, v36, &__block_literal_global_7);
}

void __67__AXSSPunctuationGroupCloudKitHelper_retrieveLocalChangesForCloud___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = objc_alloc(MEMORY[0x1E4F29128]);
  uint64_t v4 = [v2 recordID];
  uint64_t v5 = [v4 recordName];
  uint64_t v6 = (void *)[v3 initWithUUIDString:v5];

  uint64_t v7 = +[AXSSPunctuationManager sharedDatabase];
  uint64_t v8 = [v7 punctuationGroupForUUID:v6];

  uint64_t v9 = AXLogPunctuationStorage();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    int v13 = 138412802;
    id v14 = v2;
    __int16 v15 = 2112;
    double v16 = v8;
    __int16 v17 = 2112;
    v18 = v6;
    _os_log_impl(&dword_1B3B9D000, v9, OS_LOG_TYPE_INFO, "Processing group cloud retreival: %@ %@ %@", (uint8_t *)&v13, 0x20u);
  }

  [v8 setInCloud:1];
  v10 = [v2 recordChangeTag];
  [v8 setCkChangeTag:v10];

  [v8 setCkRecordProcessDate:0];
  id v11 = +[AXSSPunctuationManager sharedDatabase];
  [v11 updatePunctuationGroup:v8 fromCloudKit:1];

  int v12 = AXLogPunctuationStorage();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    int v13 = 138412290;
    id v14 = v8;
    _os_log_impl(&dword_1B3B9D000, v12, OS_LOG_TYPE_INFO, "Marked in icloud: %@", (uint8_t *)&v13, 0xCu);
  }
}

- (void)beginWatchingForChanges
{
  v8.receiver = self;
  v8.super_class = (Class)AXSSPunctuationGroupCloudKitHelper;
  [(AXSSCloudKitHelper *)&v8 beginWatchingForChanges];
  id v3 = [MEMORY[0x1E4F28C40] defaultCenter];
  [v3 addObserver:self selector:sel_punctuationGroupsChanged_ name:@"AXSSVoiceOverPunctuationGroupsChangedNotification" object:0];

  id v4 = objc_alloc(MEMORY[0x1E4F48318]);
  uint64_t v5 = [(AXSSCloudKitHelper *)self cloudkitQueue];
  uint64_t v6 = (AXDispatchTimer *)[v4 initWithTargetSerialQueue:v5];
  changeCoalescer = self->_changeCoalescer;
  self->_changeCoalescer = v6;

  [(AXDispatchTimer *)self->_changeCoalescer setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:1];
}

- (void)punctuationGroupsChanged:(id)a3
{
  id v4 = a3;
  changeCoalescer = self->_changeCoalescer;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __63__AXSSPunctuationGroupCloudKitHelper_punctuationGroupsChanged___block_invoke;
  v7[3] = &unk_1E606C9A0;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  [(AXDispatchTimer *)changeCoalescer afterDelay:v7 processBlock:0.5];
}

uint64_t __63__AXSSPunctuationGroupCloudKitHelper_punctuationGroupsChanged___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v2 = +[AXSSPunctuationManager sharedDatabase];
  id v3 = [v2 managedObjectContext];
  [v3 performBlockAndWait:&__block_literal_global_21_0];

  id v4 = AXLogPunctuationStorage();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v7 = 138412290;
    uint64_t v8 = v5;
    _os_log_impl(&dword_1B3B9D000, v4, OS_LOG_TYPE_INFO, "Punctuation groups changed locally, consolidating for cloud push: %@", (uint8_t *)&v7, 0xCu);
  }

  return [*(id *)(a1 + 40) processLocalChangesAndPush];
}

void __63__AXSSPunctuationGroupCloudKitHelper_punctuationGroupsChanged___block_invoke_2()
{
  id v1 = +[AXSSPunctuationManager sharedDatabase];
  v0 = [v1 managedObjectContext];
  [v0 refreshAllObjects];
}

- (void)processServerUpdateChanges:(id)a3 moc:(id)a4 recordNameToManagedObject:(id)a5
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v28 objects:v34 count:16];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(void *)v29;
    *(void *)&long long v7 = 138412290;
    long long v27 = v7;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v29 != v9) {
          objc_enumerationMutation(v5);
        }
        id v11 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        id v12 = objc_alloc(MEMORY[0x1E4F29128]);
        int v13 = [v11 recordID];
        id v14 = [v13 recordName];
        __int16 v15 = (void *)[v12 initWithUUIDString:v14];

        double v16 = +[AXSSPunctuationManager sharedDatabase];
        __int16 v17 = [v16 punctuationGroupForUUID:v15];

        if (v17)
        {
          v18 = [v17 ckChangeTag];

          if (!v18)
          {
            uint64_t v19 = AXLogPunctuationStorage();
            if (!os_log_type_enabled(v19, OS_LOG_TYPE_INFO)) {
              goto LABEL_14;
            }
            *(_DWORD *)buf = v27;
            uint64_t v33 = v17;
            double v20 = v19;
            uint64_t v21 = "Local group is newer than cloud group, ditching cloud group: %@";
            goto LABEL_13;
          }
        }
        else
        {
          __int16 v17 = objc_opt_new();
          [v17 setUuid:v15];
        }
        v22 = objc_msgSend(v11, "name", v27);
        [v17 setName:v22];

        id v23 = objc_alloc(MEMORY[0x1E4F29128]);
        v24 = [v11 basePunctuationGroup];
        v25 = (void *)[v23 initWithUUIDString:v24];
        [v17 setBasePunctuationUUID:v25];

        double v26 = +[AXSSPunctuationManager sharedDatabase];
        [v26 updatePunctuationGroup:v17 fromCloudKit:1];

        uint64_t v19 = AXLogPunctuationStorage();
        if (!os_log_type_enabled(v19, OS_LOG_TYPE_INFO)) {
          goto LABEL_14;
        }
        *(_DWORD *)buf = v27;
        uint64_t v33 = v17;
        double v20 = v19;
        uint64_t v21 = "Handling punctuation group: %@";
LABEL_13:
        _os_log_impl(&dword_1B3B9D000, v20, OS_LOG_TYPE_INFO, v21, buf, 0xCu);
LABEL_14:
      }
      uint64_t v8 = [v5 countByEnumeratingWithState:&v28 objects:v34 count:16];
    }
    while (v8);
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
        uint64_t v8 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        id v9 = objc_alloc(MEMORY[0x1E4F29128]);
        v10 = [v8 recordName];
        id v11 = (void *)[v9 initWithUUIDString:v10];

        id v12 = +[AXSSPunctuationManager sharedDatabase];
        int v13 = [v12 punctuationGroupForUUID:v11];

        id v14 = +[AXSSPunctuationManager sharedDatabase];
        [v14 removePunctuationGroup:v13];

        __int16 v15 = AXLogPunctuationStorage();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          uint64_t v21 = v8;
          __int16 v22 = 2112;
          id v23 = v13;
          _os_log_impl(&dword_1B3B9D000, v15, OS_LOG_TYPE_DEFAULT, "Removing group from server push: %@ %@", buf, 0x16u);
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
  long long v7 = [a2 recordName];
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_debug_impl(&dword_1B3B9D000, a4, OS_LOG_TYPE_DEBUG, "Committing record purge group: %@", a1, 0xCu);
}

@end