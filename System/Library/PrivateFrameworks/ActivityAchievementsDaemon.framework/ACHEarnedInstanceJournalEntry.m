@interface ACHEarnedInstanceJournalEntry
+ (BOOL)supportsSecureCoding;
+ (void)applyEntries:(id)a3 withProfile:(id)a4;
- (ACHEarnedInstance)earnedInstance;
- (ACHEarnedInstanceJournalEntry)initWithCoder:(id)a3;
- (ACHEarnedInstanceJournalEntry)initWithEarnedInstance:(id)a3 provenance:(int64_t)a4 useLegacySyncIdentity:(BOOL)a5 action:(int64_t)a6;
- (BOOL)useLegacySyncIdentity;
- (int64_t)action;
- (int64_t)persistentID;
- (int64_t)provenance;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ACHEarnedInstanceJournalEntry

- (ACHEarnedInstanceJournalEntry)initWithEarnedInstance:(id)a3 provenance:(int64_t)a4 useLegacySyncIdentity:(BOOL)a5 action:(int64_t)a6
{
  id v11 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ACHEarnedInstanceJournalEntry;
  v12 = [(ACHEarnedInstanceJournalEntry *)&v15 init];
  v13 = v12;
  if (v12)
  {
    v12->_action = a6;
    objc_storeStrong((id *)&v12->_earnedInstance, a3);
    v13->_provenance = a4;
    v13->_useLegacySyncIdentity = a5;
  }

  return v13;
}

+ (void)applyEntries:(id)a3 withProfile:(id)a4
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v8 = objc_alloc_init(MEMORY[0x263EFF980]);
  v9 = [v6 database];
  id v29 = 0;
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __58__ACHEarnedInstanceJournalEntry_applyEntries_withProfile___block_invoke;
  v24[3] = &unk_264516508;
  id v25 = v5;
  id v26 = v6;
  id v10 = v7;
  id v27 = v10;
  id v11 = v8;
  id v28 = v11;
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __58__ACHEarnedInstanceJournalEntry_applyEntries_withProfile___block_invoke_2;
  v21[3] = &unk_264516378;
  id v12 = v26;
  id v22 = v12;
  id v13 = v25;
  id v23 = v13;
  BOOL v14 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:v9 error:&v29 block:v24 inaccessibilityHandler:v21];
  id v15 = v29;

  if (v14)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&journalAppliedObserverLock);
    id WeakRetained = objc_loadWeakRetained(&_journalEntryAppliedObserver);

    if (WeakRetained)
    {
      id v17 = objc_loadWeakRetained(&_journalEntryAppliedObserver);
      v18 = (void *)[v10 copy];
      v19 = (void *)[v11 copy];
      [v17 earnedInstanceEntityDidApplyJournalEntriesInsertedEarnedInstances:v18 removedEarnedInstances:v19];
    }
    os_unfair_lock_unlock((os_unfair_lock_t)&journalAppliedObserverLock);
  }
  else
  {
    v20 = ACHLogDatabase();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v31 = v13;
      __int16 v32 = 2114;
      id v33 = v15;
      _os_log_impl(&dword_21F5DA000, v20, OS_LOG_TYPE_DEFAULT, "Error applying journaled earned instances: %@: %{public}@", buf, 0x16u);
    }
  }
}

uint64_t __58__ACHEarnedInstanceJournalEntry_applyEntries_withProfile___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  unint64_t v4 = 0x264515000uLL;
  id v26 = a2;
  id v25 = [v26 databaseForEntityClass:objc_opt_class()];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v5 = [obj countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v32;
    LOBYTE(v28) = 1;
    while (1)
    {
      uint64_t v8 = 0;
      uint64_t v27 = v6;
      do
      {
        if (*(void *)v32 != v7) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void **)(*((void *)&v31 + 1) + 8 * v8);
        uint64_t v10 = objc_msgSend(v9, "action", v25);
        if (v10 != 1)
        {
          if (v10) {
            goto LABEL_16;
          }
          id v11 = [v9 earnedInstance];
          id v12 = ACHEarnedInstanceSyncIdentityFromEarnedInstance(v11, [v9 useLegacySyncIdentity], *(void **)(a1 + 40), v26);

          unint64_t v13 = v4;
          BOOL v14 = *(void **)(v4 + 2416);
          id v15 = [v9 earnedInstance];
          uint64_t v16 = [v9 provenance];
          [v12 entity];
          v18 = uint64_t v17 = a1;
          v19 = objc_msgSend(v14, "_insertEarnedInstance:provenance:syncIdentity:database:error:", v15, v16, objc_msgSend(v18, "persistentID"), v25, a3);

          if (v19)
          {
            v20 = [v9 earnedInstance];
            v21 = (void *)[v20 copy];

            objc_msgSend(v21, "setKey:", objc_msgSend(v19, "persistentID"));
            [*(id *)(v17 + 48) addObject:v21];
          }
          else
          {
            LOBYTE(v28) = 0;
          }
          unint64_t v4 = v13;
          a1 = v17;
          uint64_t v6 = v27;
          goto LABEL_14;
        }
        id v22 = [v9 earnedInstance];
        v35 = v22;
        id v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v35 count:1];

        int v28 = [*(id *)(v4 + 2416) removeEarnedInstances:v12 profile:*(void *)(a1 + 40) error:a3];
        if (v28)
        {
          id v23 = *(void **)(a1 + 56);
          v19 = [v9 earnedInstance];
          [v23 addObject:v19];
LABEL_14:
        }
LABEL_16:
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [obj countByEnumeratingWithState:&v31 objects:v36 count:16];
      if (!v6) {
        goto LABEL_20;
      }
    }
  }
  LOBYTE(v28) = 1;
LABEL_20:

  return v28 & 1;
}

uint64_t __58__ACHEarnedInstanceJournalEntry_applyEntries_withProfile___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = [*(id *)(a1 + 32) database];
  uint64_t v6 = [v5 addJournalEntries:*(void *)(a1 + 40) error:a3];

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ACHEarnedInstanceJournalEntry)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ACHEarnedInstanceJournalEntry;
  uint64_t v5 = [(HDJournalEntry *)&v11 initWithCoder:v4];
  if (v5)
  {
    v5->_action = [v4 decodeIntegerForKey:@"action"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"earnedInstance"];
    if ([v6 length])
    {
      uint64_t v7 = (void *)[objc_alloc(MEMORY[0x263F23678]) initWithData:v6];
      if (v7)
      {
        uint64_t v8 = [objc_alloc(MEMORY[0x263F236B8]) initWithCodable:v7];
        earnedInstance = v5->_earnedInstance;
        v5->_earnedInstance = (ACHEarnedInstance *)v8;

        -[ACHEarnedInstance setKey:](v5->_earnedInstance, "setKey:", [v4 decodeInt64ForKey:@"persistentID"]);
      }
    }
    v5->_provenance = [v4 decodeInt64ForKey:@"provenance"];
    v5->_useLegacySyncIdentity = 1;
    if ([v4 containsValueForKey:@"useLegacySyncIdentity"]) {
      v5->_useLegacySyncIdentity = [v4 decodeBoolForKey:@"useLegacySyncIdentity"];
    }
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v8 = a3;
  [v8 encodeInteger:self->_action forKey:@"action"];
  id v4 = [(ACHEarnedInstanceJournalEntry *)self earnedInstance];
  uint64_t v5 = ACHCodableFromEarnedInstance();

  uint64_t v6 = [v5 data];
  if ([v6 length])
  {
    [v8 encodeObject:v6 forKey:@"earnedInstance"];
    uint64_t v7 = [(ACHEarnedInstanceJournalEntry *)self earnedInstance];
    objc_msgSend(v8, "encodeInt64:forKey:", objc_msgSend(v7, "key"), @"persistentID");
  }
  [v8 encodeInt64:self->_provenance forKey:@"provenance"];
  [v8 encodeBool:self->_useLegacySyncIdentity forKey:@"useLegacySyncIdentity"];
}

- (int64_t)action
{
  return self->_action;
}

- (ACHEarnedInstance)earnedInstance
{
  return self->_earnedInstance;
}

- (int64_t)persistentID
{
  return self->_persistentID;
}

- (int64_t)provenance
{
  return self->_provenance;
}

- (BOOL)useLegacySyncIdentity
{
  return self->_useLegacySyncIdentity;
}

- (void).cxx_destruct
{
}

@end