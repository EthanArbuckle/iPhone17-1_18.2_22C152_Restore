@interface MSPSharedTripBlocklist
+ (MSPSharedTripBlocklist)sharedInstance;
+ (void)migrateFromiCloudKVSIfNeeded;
- (BOOL)containsAnyIdentifiersInArray:(id)a3;
- (BOOL)containsIdentifier:(id)a3;
- (MSPSharedTripBlocklist)init;
- (id)_fetchSyncedIdentifiers;
- (id)description;
- (void)_cancelTimeoutTimer;
- (void)_purgeExpiredIdentifiersIn:(id)a3;
- (void)_reloadBlockedIdentifiersFromSync;
- (void)_resumeIsolationQueueIfNeeded;
- (void)blockIdentifier:(id)a3;
- (void)blockIdentifiers:(id)a3;
- (void)clearBlockedIdentifiers;
- (void)purgeExpiredIdentifiers;
- (void)storeControllerWithDataChanged:(id)a3;
- (void)storeControllerWithDidLoad:(id)a3;
- (void)storeControllerWithFailedToLoad:(id)a3;
- (void)unblockIdentifiers:(id)a3;
@end

@implementation MSPSharedTripBlocklist

+ (MSPSharedTripBlocklist)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__MSPSharedTripBlocklist_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1EB7F4510 != -1) {
    dispatch_once(&qword_1EB7F4510, block);
  }
  v2 = (void *)_MergedGlobals_37;

  return (MSPSharedTripBlocklist *)v2;
}

uint64_t __40__MSPSharedTripBlocklist_sharedInstance__block_invoke(uint64_t a1)
{
  _MergedGlobals_37 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return MEMORY[0x1F41817F8]();
}

- (MSPSharedTripBlocklist)init
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  v27.receiver = self;
  v27.super_class = (Class)MSPSharedTripBlocklist;
  id v2 = [(MSPSharedTripBlocklist *)&v27 init];
  if (v2)
  {
    v3 = MSPGetSharedTripLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = NSString;
      id v5 = v2;
      v6 = [v4 stringWithFormat:@"%@<%p>", objc_opt_class(), v5];

      *(_DWORD *)buf = 138543362;
      v30 = v6;
      _os_log_impl(&dword_1B87E5000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] initializing...", buf, 0xCu);
    }
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.mapspushd.SharedTripBlocklist.store", 0);
    v8 = (void *)*((void *)v2 + 3);
    *((void *)v2 + 3) = v7;

    dispatch_queue_t v9 = dispatch_queue_create("com.apple.mapspushd.SharedTripBlocklist", 0);
    v10 = (void *)*((void *)v2 + 2);
    *((void *)v2 + 2) = v9;

    dispatch_suspend(*((dispatch_object_t *)v2 + 2));
    id v11 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    v12 = (void *)*((void *)v2 + 1);
    *((void *)v2 + 1) = v11;

    *((unsigned char *)v2 + 48) = 1;
    objc_initWeak((id *)buf, v2);
    uint64_t v13 = *((void *)v2 + 3);
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __30__MSPSharedTripBlocklist_init__block_invoke;
    v25[3] = &unk_1E617C748;
    objc_copyWeak(&v26, (id *)buf);
    uint64_t v14 = +[GCDTimer scheduledTimerWithTimeInterval:v13 queue:v25 block:5.0];
    v15 = (void *)*((void *)v2 + 7);
    *((void *)v2 + 7) = v14;

    id v16 = objc_alloc(MEMORY[0x1E4F74398]);
    v17 = [MEMORY[0x1E4F74380] defaultStoreConfig];
    uint64_t v28 = objc_opt_class();
    v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v28 count:1];
    uint64_t v19 = [v16 initWithConfig:v17 notifyForChanges:v18 callbackQueue:*((void *)v2 + 3) delegate:v2];
    v20 = (void *)*((void *)v2 + 4);
    *((void *)v2 + 4) = v19;

    v21 = *((void *)v2 + 2);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __30__MSPSharedTripBlocklist_init__block_invoke_2;
    block[3] = &unk_1E617C770;
    id v24 = v2;
    dispatch_async(v21, block);

    objc_destroyWeak(&v26);
    objc_destroyWeak((id *)buf);
  }
  return (MSPSharedTripBlocklist *)v2;
}

void __30__MSPSharedTripBlocklist_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _resumeIsolationQueueIfNeeded];
}

uint64_t __30__MSPSharedTripBlocklist_init__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reloadBlockedIdentifiersFromSync];
}

- (id)description
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v2 = [(NSMutableSet *)self->_blockedIdentifiers allObjects];
  v3 = v2;
  if (v2)
  {
    if ([v2 count])
    {
      v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v3, "count"));
      long long v24 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      v23 = v3;
      id v5 = v3;
      uint64_t v6 = [v5 countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v6)
      {
        uint64_t v7 = v6;
        uint64_t v8 = *(void *)v25;
        do
        {
          for (uint64_t i = 0; i != v7; ++i)
          {
            if (*(void *)v25 != v8) {
              objc_enumerationMutation(v5);
            }
            v10 = *(void **)(*((void *)&v24 + 1) + 8 * i);
            if (v10)
            {
              id v11 = NSString;
              id v12 = v10;
              uint64_t v13 = [v11 stringWithFormat:@"%@<%p>", objc_opt_class(), v12];
            }
            else
            {
              uint64_t v13 = @"<nil>";
            }
            [v4 addObject:v13];
          }
          uint64_t v7 = [v5 countByEnumeratingWithState:&v24 objects:v28 count:16];
        }
        while (v7);
      }

      uint64_t v14 = [v5 componentsJoinedByString:@", "];
      v15 = NSString;
      id v16 = v5;
      v17 = [v15 stringWithFormat:@"%@<%p>", objc_opt_class(), v16];

      v18 = [v15 stringWithFormat:@"%@ [%@]", v17, v14];

      v3 = v23;
    }
    else
    {
      uint64_t v19 = NSString;
      id v20 = v3;
      v21 = [v19 stringWithFormat:@"%@<%p>", objc_opt_class(), v20];

      v18 = [v19 stringWithFormat:@"%@ (empty)", v21];
    }
  }
  else
  {
    v18 = @"<nil>";
  }

  return v18;
}

- (BOOL)containsAnyIdentifiersInArray:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  id v5 = [MEMORY[0x1E4F1CAD0] setWithArray:v4];
  isolationQueue = self->_isolationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__MSPSharedTripBlocklist_containsAnyIdentifiersInArray___block_invoke;
  block[3] = &unk_1E617C798;
  v17 = &v18;
  void block[4] = self;
  id v7 = v5;
  id v16 = v7;
  dispatch_sync(isolationQueue, block);
  uint64_t v8 = MSPGetSharedTripLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    dispatch_queue_t v9 = self;
    v10 = [NSString stringWithFormat:@"%@<%p>", objc_opt_class(), v9];

    if (*((unsigned char *)v19 + 24)) {
      id v11 = @"YES";
    }
    else {
      id v11 = @"NO";
    }
    id v12 = v11;
    *(_DWORD *)buf = 138543874;
    v23 = v10;
    __int16 v24 = 2112;
    id v25 = v4;
    __int16 v26 = 2112;
    long long v27 = v12;
    _os_log_impl(&dword_1B87E5000, v8, OS_LOG_TYPE_INFO, "[%{public}@] containsIdentifiers? %@ : %@", buf, 0x20u);
  }
  BOOL v13 = *((unsigned char *)v19 + 24) != 0;

  _Block_object_dispose(&v18, 8);
  return v13;
}

uint64_t __56__MSPSharedTripBlocklist_containsAnyIdentifiersInArray___block_invoke(void *a1)
{
  uint64_t result = [*(id *)(a1[4] + 8) intersectsSet:a1[5]];
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = result;
  return result;
}

- (BOOL)containsIdentifier:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  isolationQueue = self->_isolationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__MSPSharedTripBlocklist_containsIdentifier___block_invoke;
  block[3] = &unk_1E617C798;
  id v16 = &v17;
  void block[4] = self;
  id v6 = v4;
  id v15 = v6;
  dispatch_sync(isolationQueue, block);
  id v7 = MSPGetSharedTripLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = self;
    dispatch_queue_t v9 = [NSString stringWithFormat:@"%@<%p>", objc_opt_class(), v8];

    if (*((unsigned char *)v18 + 24)) {
      v10 = @"YES";
    }
    else {
      v10 = @"NO";
    }
    id v11 = v10;
    *(_DWORD *)buf = 138543874;
    v22 = v9;
    __int16 v23 = 2112;
    id v24 = v6;
    __int16 v25 = 2112;
    __int16 v26 = v11;
    _os_log_impl(&dword_1B87E5000, v7, OS_LOG_TYPE_INFO, "[%{public}@] containsIdentifier? %@ : %@", buf, 0x20u);
  }
  BOOL v12 = *((unsigned char *)v18 + 24) != 0;

  _Block_object_dispose(&v17, 8);
  return v12;
}

uint64_t __45__MSPSharedTripBlocklist_containsIdentifier___block_invoke(void *a1)
{
  uint64_t result = [*(id *)(a1[4] + 8) containsObject:a1[5]];
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = result;
  return result;
}

- (void)blockIdentifier:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v7 = a3;
    id v4 = (void *)MEMORY[0x1E4F1C978];
    id v5 = a3;
    id v6 = [v4 arrayWithObjects:&v7 count:1];

    -[MSPSharedTripBlocklist blockIdentifiers:](self, "blockIdentifiers:", v6, v7, v8);
  }
}

- (void)blockIdentifiers:(id)a3
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithArray:v4];
    isolationQueue = self->_isolationQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __43__MSPSharedTripBlocklist_blockIdentifiers___block_invoke;
    block[3] = &unk_1E617C510;
    id v7 = v5;
    id v51 = v7;
    v52 = self;
    dispatch_sync(isolationQueue, block);
    if ([v7 count])
    {
      GEOConfigGetDouble();
      uint64_t v8 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceNow:");
      [v8 timeIntervalSinceReferenceDate];
      double v10 = v9;
      id v11 = MSPGetSharedTripLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v12 = NSString;
        BOOL v13 = self;
        uint64_t v14 = [v12 stringWithFormat:@"%@<%p>", objc_opt_class(), v13];

        uint64_t v15 = [v7 count];
        *(_DWORD *)buf = 138544130;
        v55 = v14;
        __int16 v56 = 2048;
        uint64_t v57 = v15;
        __int16 v58 = 2112;
        uint64_t v59 = (uint64_t)v7;
        __int16 v60 = 2112;
        v61 = v8;
        _os_log_impl(&dword_1B87E5000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] blockIdentifiers | blocking %lu identifiers %@ (expires at %@)", buf, 0x2Au);
      }
      unint64_t v16 = [v7 count];
      if (v16 < [v4 count])
      {
        uint64_t v17 = [v4 count];
        uint64_t v18 = [v7 count];
        uint64_t v19 = MSPGetSharedTripLog();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v20 = v17 - v18;
          char v21 = NSString;
          v22 = self;
          __int16 v23 = [v21 stringWithFormat:@"%@<%p>", objc_opt_class(), v22];

          uint64_t v24 = [v4 count];
          *(_DWORD *)buf = 138543874;
          v55 = v23;
          __int16 v56 = 2048;
          uint64_t v57 = v20;
          __int16 v58 = 2048;
          uint64_t v59 = v24;
          _os_log_impl(&dword_1B87E5000, v19, OS_LOG_TYPE_DEFAULT, "[%{public}@] blockIdentifiers | %lu/%lu identifiers were already blocked", buf, 0x20u);
        }
      }
      id v44 = v4;
      __int16 v25 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v7, "count"));
      long long v46 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      id v26 = v7;
      uint64_t v27 = [v26 countByEnumeratingWithState:&v46 objects:v53 count:16];
      if (v27)
      {
        uint64_t v28 = v27;
        uint64_t v29 = *(void *)v47;
        do
        {
          for (uint64_t i = 0; i != v28; ++i)
          {
            if (*(void *)v47 != v29) {
              objc_enumerationMutation(v26);
            }
            uint64_t v31 = (void *)[objc_alloc(MEMORY[0x1E4F74360]) initWithStore:self->_store expiryTime:(uint64_t)v10 sharedTripIdentifier:*(void *)(*((void *)&v46 + 1) + 8 * i)];
            if (v31) {
              [v25 addObject:v31];
            }
          }
          uint64_t v28 = [v26 countByEnumeratingWithState:&v46 objects:v53 count:16];
        }
        while (v28);
      }

      store = self->_store;
      id v45 = 0;
      [(_TtC8MapsSync13MapsSyncStore *)store saveWithObjects:v25 error:&v45];
      id v33 = v45;
      v34 = v8;
      if (v33 || !self->_store)
      {
        v35 = MSPGetSharedTripLog();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        {
          v36 = NSString;
          v37 = self;
          v38 = [v36 stringWithFormat:@"%@<%p>", objc_opt_class(), v37];

          if (self->_store) {
            v39 = @"YES";
          }
          else {
            v39 = @"NO";
          }
          v40 = v39;
          *(_DWORD *)buf = 138544130;
          v55 = v38;
          __int16 v56 = 2112;
          uint64_t v57 = (uint64_t)v26;
          __int16 v58 = 2112;
          uint64_t v59 = (uint64_t)v33;
          __int16 v60 = 2112;
          v61 = v40;
          _os_log_impl(&dword_1B87E5000, v35, OS_LOG_TYPE_ERROR, "[%{public}@] block | failed to block identifiers %@: error: %@, has store: %@", buf, 0x2Au);
        }
      }

      id v4 = v44;
    }
    else
    {
      v34 = MSPGetSharedTripLog();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        v41 = NSString;
        v42 = self;
        v43 = [v41 stringWithFormat:@"%@<%p>", objc_opt_class(), v42];

        *(_DWORD *)buf = 138543618;
        v55 = v43;
        __int16 v56 = 2112;
        uint64_t v57 = (uint64_t)v4;
        _os_log_impl(&dword_1B87E5000, v34, OS_LOG_TYPE_ERROR, "[%{public}@] block | already blocked: %@", buf, 0x16u);
      }
    }
  }
}

uint64_t __43__MSPSharedTripBlocklist_blockIdentifiers___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) minusSet:*(void *)(*(void *)(a1 + 40) + 8)];
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(*(void *)(a1 + 40) + 8);

  return [v3 unionSet:v2];
}

- (void)unblockIdentifiers:(id)a3
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = MSPGetSharedTripLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    if (self)
    {
      id v6 = NSString;
      id v7 = self;
      uint64_t v8 = [v6 stringWithFormat:@"%@<%p>", objc_opt_class(), v7];
    }
    else
    {
      uint64_t v8 = @"<nil>";
    }
    *(_DWORD *)buf = 138543362;
    id v44 = v8;
    _os_log_impl(&dword_1B87E5000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] unblockIdentifiers", buf, 0xCu);
  }
  if (v4)
  {
    isolationQueue = self->_isolationQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __45__MSPSharedTripBlocklist_unblockIdentifiers___block_invoke;
    block[3] = &unk_1E617C510;
    void block[4] = self;
    id v10 = v4;
    id v42 = v10;
    dispatch_sync(isolationQueue, block);
    id v11 = [(MSPSharedTripBlocklist *)self _fetchSyncedIdentifiers];
    if (!v11)
    {
LABEL_33:

      goto LABEL_34;
    }
    id v35 = v4;
    id v33 = v10;
    BOOL v12 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v10];
    BOOL v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v11, "count"));
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    v34 = v11;
    id v14 = v11;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v37 objects:v51 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v38;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v38 != v17) {
            objc_enumerationMutation(v14);
          }
          uint64_t v19 = *(void **)(*((void *)&v37 + 1) + 8 * i);
          uint64_t v20 = [v19 sharedTripIdentifier];
          int v21 = [v12 containsObject:v20];

          if (v21) {
            [v13 addObject:v19];
          }
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v37 objects:v51 count:16];
      }
      while (v16);
    }

    if ([v13 count])
    {
      store = self->_store;
      id v36 = 0;
      [(_TtC8MapsSync13MapsSyncStore *)store deleteWithObjects:v13 error:&v36];
      __int16 v23 = v36;
      if (v23 || !self->_store)
      {
        uint64_t v24 = MSPGetSharedTripLog();
        id v4 = v35;
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          __int16 v25 = NSString;
          id v26 = self;
          uint64_t v27 = [v25 stringWithFormat:@"%@<%p>", objc_opt_class(), v26];

          if (self->_store) {
            uint64_t v28 = @"YES";
          }
          else {
            uint64_t v28 = @"NO";
          }
          uint64_t v29 = v28;
          *(_DWORD *)buf = 138544130;
          id v44 = v27;
          __int16 v45 = 2112;
          id v46 = v33;
          __int16 v47 = 2112;
          long long v48 = v23;
          __int16 v49 = 2112;
          v50 = v29;
          _os_log_impl(&dword_1B87E5000, v24, OS_LOG_TYPE_ERROR, "[%{public}@] unblock | failed to unblock identifiers %@: error: %@, has store: %@", buf, 0x2Au);
        }
        goto LABEL_31;
      }
      __int16 v23 = 0;
    }
    else
    {
      __int16 v23 = MSPGetSharedTripLog();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        id v4 = v35;
        if (self)
        {
          v30 = NSString;
          uint64_t v31 = self;
          v32 = [v30 stringWithFormat:@"%@<%p>", objc_opt_class(), v31];
        }
        else
        {
          v32 = @"<nil>";
        }
        *(_DWORD *)buf = 138543618;
        id v44 = v32;
        __int16 v45 = 2112;
        id v11 = v34;
        id v46 = v33;
        _os_log_impl(&dword_1B87E5000, v23, OS_LOG_TYPE_ERROR, "[%{public}@] unblock | no matching synced items to delete for %@", buf, 0x16u);

        goto LABEL_32;
      }
    }
    id v4 = v35;
LABEL_31:
    id v11 = v34;
LABEL_32:

    goto LABEL_33;
  }
LABEL_34:
}

void __45__MSPSharedTripBlocklist_unblockIdentifiers___block_invoke(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 8);
  id v2 = [MEMORY[0x1E4F1CAD0] setWithArray:*(void *)(a1 + 40)];
  [v1 minusSet:v2];
}

- (void)clearBlockedIdentifiers
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v3 = MSPGetSharedTripLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    if (self)
    {
      id v4 = NSString;
      id v5 = self;
      id v6 = [v4 stringWithFormat:@"%@<%p>", objc_opt_class(), v5];
    }
    else
    {
      id v6 = @"<nil>";
    }
    *(_DWORD *)buf = 138543362;
    uint64_t v20 = v6;
    _os_log_impl(&dword_1B87E5000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] clear | blocked identifiers", buf, 0xCu);
  }
  isolationQueue = self->_isolationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__MSPSharedTripBlocklist_clearBlockedIdentifiers__block_invoke;
  block[3] = &unk_1E617C770;
  void block[4] = self;
  dispatch_sync(isolationQueue, block);
  uint64_t v8 = [(MSPSharedTripBlocklist *)self _fetchSyncedIdentifiers];
  if (v8)
  {
    store = self->_store;
    id v17 = 0;
    [(_TtC8MapsSync13MapsSyncStore *)store deleteWithObjects:v8 error:&v17];
    id v10 = v17;
    if (v10 || !self->_store)
    {
      id v11 = MSPGetSharedTripLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        BOOL v12 = NSString;
        BOOL v13 = self;
        id v14 = [v12 stringWithFormat:@"%@<%p>", objc_opt_class(), v13];

        if (self->_store) {
          uint64_t v15 = @"YES";
        }
        else {
          uint64_t v15 = @"NO";
        }
        uint64_t v16 = v15;
        *(_DWORD *)buf = 138543874;
        uint64_t v20 = v14;
        __int16 v21 = 2112;
        id v22 = v10;
        __int16 v23 = 2112;
        uint64_t v24 = v16;
        _os_log_impl(&dword_1B87E5000, v11, OS_LOG_TYPE_ERROR, "[%{public}@] clear | failed to delete all identifiers with error: %@, has store: %@", buf, 0x20u);
      }
    }
  }
}

uint64_t __49__MSPSharedTripBlocklist_clearBlockedIdentifiers__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) removeAllObjects];
}

- (void)purgeExpiredIdentifiers
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v3 = MSPGetSharedTripLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    if (self)
    {
      id v4 = NSString;
      id v5 = self;
      id v6 = [v4 stringWithFormat:@"%@<%p>", objc_opt_class(), v5];
    }
    else
    {
      id v6 = @"<nil>";
    }
    *(_DWORD *)buf = 138543362;
    BOOL v13 = v6;
    _os_log_impl(&dword_1B87E5000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] purge | requested", buf, 0xCu);
  }
  id v7 = [(MSPSharedTripBlocklist *)self _fetchSyncedIdentifiers];
  uint64_t v8 = v7;
  if (v7)
  {
    isolationQueue = self->_isolationQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __49__MSPSharedTripBlocklist_purgeExpiredIdentifiers__block_invoke;
    block[3] = &unk_1E617C510;
    void block[4] = self;
    id v11 = v7;
    dispatch_async(isolationQueue, block);
  }
}

uint64_t __49__MSPSharedTripBlocklist_purgeExpiredIdentifiers__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _purgeExpiredIdentifiersIn:*(void *)(a1 + 40)];
}

- (void)_purgeExpiredIdentifiersIn:(id)a3
{
  uint64_t v86 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v67 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v66 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v3, "count"));
  long long v69 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v69 objects:v77 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v70;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v70 != v7) {
          objc_enumerationMutation(v4);
        }
        double v9 = *(void **)(*((void *)&v69 + 1) + 8 * i);
        id v10 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceReferenceDate:", (double)objc_msgSend(v9, "expiryTime"));
        [v10 timeIntervalSinceNow];
        if (v11 <= 0.0)
        {
          double v12 = v11;
          BOOL v13 = MSPGetSharedTripLog();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          {
            if (self)
            {
              uint64_t v14 = NSString;
              uint64_t v15 = self;
              uint64_t v16 = [v14 stringWithFormat:@"%@<%p>", objc_opt_class(), v15];
            }
            else
            {
              uint64_t v16 = @"<nil>";
            }
            id v17 = [v9 sharedTripIdentifier];
            *(_DWORD *)buf = 138543874;
            v79 = v16;
            __int16 v80 = 2112;
            uint64_t v81 = (uint64_t)v17;
            __int16 v82 = 2048;
            double v83 = fabs(v12);
            _os_log_impl(&dword_1B87E5000, v13, OS_LOG_TYPE_DEBUG, "[%{public}@] purge | found %@ which expired %#.1lfs ago", buf, 0x20u);
          }
          [v66 addObject:v9];
          uint64_t v18 = [v9 sharedTripIdentifier];
          [v67 addObject:v18];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v69 objects:v77 count:16];
    }
    while (v6);
  }

  uint64_t v19 = [v67 count];
  uint64_t v20 = MSPGetSharedTripLog();
  __int16 v21 = v20;
  if (v19)
  {
    id v22 = self;
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      if (self)
      {
        __int16 v23 = NSString;
        uint64_t v24 = self;
        uint64_t v25 = [v23 stringWithFormat:@"%@<%p>", objc_opt_class(), v24];
      }
      else
      {
        uint64_t v25 = @"<nil>";
      }
      uint64_t v29 = v25;
      uint64_t v30 = [v67 count];
      uint64_t v31 = [v4 count];
      id v32 = [v67 allObjects];
      id v33 = v32;
      if (v32)
      {
        if ([v32 count])
        {
          uint64_t v60 = v31;
          uint64_t v61 = v30;
          v63 = v29;
          v64 = v21;
          v34 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v33, "count"));
          long long v73 = 0u;
          long long v74 = 0u;
          long long v75 = 0u;
          long long v76 = 0u;
          uint64_t v62 = v33;
          id v35 = v33;
          uint64_t v36 = [v35 countByEnumeratingWithState:&v73 objects:buf count:16];
          if (v36)
          {
            uint64_t v37 = v36;
            uint64_t v38 = *(void *)v74;
            do
            {
              for (uint64_t j = 0; j != v37; ++j)
              {
                if (*(void *)v74 != v38) {
                  objc_enumerationMutation(v35);
                }
                long long v40 = *(void **)(*((void *)&v73 + 1) + 8 * j);
                if (v40)
                {
                  v41 = NSString;
                  id v42 = v40;
                  v43 = [v41 stringWithFormat:@"%@<%p>", objc_opt_class(), v42];
                }
                else
                {
                  v43 = @"<nil>";
                }
                [v34 addObject:v43];
              }
              uint64_t v37 = [v35 countByEnumeratingWithState:&v73 objects:buf count:16];
            }
            while (v37);
          }

          id v44 = [v35 componentsJoinedByString:@", "];
          __int16 v45 = NSString;
          id v46 = v35;
          __int16 v47 = [v45 stringWithFormat:@"%@<%p>", objc_opt_class(), v46];

          long long v48 = [v45 stringWithFormat:@"%@ [%@]", v47, v44];

          uint64_t v29 = v63;
          __int16 v21 = v64;
          uint64_t v30 = v61;
          id v33 = v62;
          uint64_t v31 = v60;
        }
        else
        {
          __int16 v49 = NSString;
          id v50 = v33;
          v34 = [v49 stringWithFormat:@"%@<%p>", objc_opt_class(), v50];

          long long v48 = [v49 stringWithFormat:@"%@ (empty)", v34];
        }
      }
      else
      {
        long long v48 = @"<nil>";
      }
      id v22 = self;

      *(_DWORD *)buf = 138544130;
      v79 = v29;
      __int16 v80 = 2048;
      uint64_t v81 = v30;
      __int16 v82 = 2048;
      double v83 = *(double *)&v31;
      __int16 v84 = 2112;
      v85 = v48;
      _os_log_impl(&dword_1B87E5000, v21, OS_LOG_TYPE_DEFAULT, "[%{public}@] purge | will purge %lu/%lu blocked identifiers: %@", buf, 0x2Au);
    }
    [(NSMutableSet *)v22->_blockedIdentifiers minusSet:v67];
    store = v22->_store;
    id v68 = 0;
    [(_TtC8MapsSync13MapsSyncStore *)store deleteWithObjects:v66 error:&v68];
    __int16 v21 = v68;
    if (v21 || !v22->_store)
    {
      uint64_t v52 = MSPGetSharedTripLog();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
      {
        v53 = v22;
        v54 = NSString;
        v55 = v53;
        __int16 v56 = [v54 stringWithFormat:@"%@<%p>", objc_opt_class(), v55];

        if (v53->_store) {
          uint64_t v57 = @"YES";
        }
        else {
          uint64_t v57 = @"NO";
        }
        __int16 v58 = v57;
        *(_DWORD *)buf = 138543874;
        v79 = v56;
        __int16 v80 = 2112;
        uint64_t v81 = (uint64_t)v21;
        __int16 v82 = 2112;
        double v83 = *(double *)&v58;
        _os_log_impl(&dword_1B87E5000, v52, OS_LOG_TYPE_ERROR, "[%{public}@] purge | failed to remove identifiers with error %@, has store: %@", buf, 0x20u);
      }
    }
    else
    {
      __int16 v21 = 0;
    }
  }
  else if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    if (self)
    {
      id v26 = NSString;
      uint64_t v27 = self;
      uint64_t v28 = [v26 stringWithFormat:@"%@<%p>", objc_opt_class(), v27];
    }
    else
    {
      uint64_t v28 = @"<nil>";
    }
    uint64_t v59 = [v4 count];
    *(_DWORD *)buf = 138543618;
    v79 = v28;
    __int16 v80 = 2048;
    uint64_t v81 = v59;
    _os_log_impl(&dword_1B87E5000, v21, OS_LOG_TYPE_DEBUG, "[%{public}@] purge | found nothing to purge from %lu items", buf, 0x16u);
  }
}

- (void)_reloadBlockedIdentifiersFromSync
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v3 = [(MSPSharedTripBlocklist *)self _fetchSyncedIdentifiers];
  id v4 = MSPGetSharedTripLog();
  uint64_t v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      if (self)
      {
        uint64_t v6 = NSString;
        uint64_t v7 = self;
        uint64_t v8 = [v6 stringWithFormat:@"%@<%p>", objc_opt_class(), v7];
      }
      else
      {
        uint64_t v8 = @"<nil>";
      }
      *(_DWORD *)buf = 138543618;
      uint64_t v29 = v8;
      __int16 v30 = 2112;
      uint64_t v31 = v3;
      _os_log_impl(&dword_1B87E5000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] reload | loaded identifiers from sync: %@", buf, 0x16u);
    }
    [(MSPSharedTripBlocklist *)self _purgeExpiredIdentifiersIn:v3];
    uint64_t v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", -[NSObject count](v3, "count"));
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    double v12 = v3;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v24;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v24 != v15) {
            objc_enumerationMutation(v12);
          }
          id v17 = [*(id *)(*((void *)&v23 + 1) + 8 * v16) sharedTripIdentifier];
          [v5 addObject:v17];

          ++v16;
        }
        while (v14 != v16);
        uint64_t v14 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v14);
    }

    objc_storeStrong((id *)&self->_blockedIdentifiers, v5);
    double v11 = MSPGetSharedTripLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v18 = NSString;
      uint64_t v19 = self;
      uint64_t v20 = [v18 stringWithFormat:@"%@<%p>", objc_opt_class(), v19, (void)v23];

      *(_DWORD *)buf = 138543618;
      uint64_t v29 = v20;
      __int16 v30 = 2112;
      uint64_t v31 = v5;
      _os_log_impl(&dword_1B87E5000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] reload | set local copy of identifiers: %@", buf, 0x16u);
    }
    goto LABEL_24;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    if (self)
    {
      double v9 = NSString;
      id v10 = self;
      double v11 = [v9 stringWithFormat:@"%@<%p>", objc_opt_class(), v10];
    }
    else
    {
      double v11 = @"<nil>";
    }
    if (self->_store) {
      __int16 v21 = @"YES";
    }
    else {
      __int16 v21 = @"NO";
    }
    id v22 = v21;
    *(_DWORD *)buf = 138543618;
    uint64_t v29 = v11;
    __int16 v30 = 2112;
    uint64_t v31 = v22;
    _os_log_impl(&dword_1B87E5000, v5, OS_LOG_TYPE_ERROR, "[%{public}@] reload | could not load from sync (has store: %@)", buf, 0x16u);

LABEL_24:
  }
}

- (id)_fetchSyncedIdentifiers
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (self->_store)
  {
    id v3 = (void *)[objc_alloc(MEMORY[0x1E4F74368]) initWithStore:self->_store];
    id v14 = 0;
    id v4 = [v3 fetchSyncAndReturnError:&v14];
    id v5 = v14;
    if (v4)
    {
      id v6 = v4;
    }
    else
    {
      uint64_t v7 = MSPGetSharedTripLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        uint64_t v8 = NSString;
        double v9 = self;
        id v10 = [v8 stringWithFormat:@"%@<%p>", objc_opt_class(), v9];

        if (self->_store) {
          double v11 = @"YES";
        }
        else {
          double v11 = @"NO";
        }
        double v12 = v11;
        *(_DWORD *)buf = 138543874;
        uint64_t v16 = v10;
        __int16 v17 = 2112;
        id v18 = v5;
        __int16 v19 = 2112;
        uint64_t v20 = v12;
        _os_log_impl(&dword_1B87E5000, v7, OS_LOG_TYPE_ERROR, "[%{public}@] fetch | _fetchSyncedIdentifiers failed to fetch with error: %@, has store: %@", buf, 0x20u);
      }
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (void)_resumeIsolationQueueIfNeeded
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (self->_storeLoadTimeoutTimer)
  {
    id v3 = MSPGetSharedTripLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      id v4 = NSString;
      id v5 = self;
      id v6 = [v4 stringWithFormat:@"%@<%p>", objc_opt_class(), v5];

      *(_DWORD *)buf = 138543362;
      uint64_t v13 = v6;
      _os_log_impl(&dword_1B87E5000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] timed out waiting to load store", buf, 0xCu);
    }
    [(GCDTimer *)self->_storeLoadTimeoutTimer invalidate];
    storeLoadTimeoutTimer = self->_storeLoadTimeoutTimer;
    self->_storeLoadTimeoutTimer = 0;
  }
  if (self->_waitingForStoreToLoad)
  {
    self->_waitingForStoreToLoad = 0;
    dispatch_resume((dispatch_object_t)self->_isolationQueue);
  }
  else
  {
    uint64_t v8 = MSPGetSharedTripLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      double v9 = NSString;
      id v10 = self;
      double v11 = [v9 stringWithFormat:@"%@<%p>", objc_opt_class(), v10];

      *(_DWORD *)buf = 138543362;
      uint64_t v13 = v11;
      _os_log_impl(&dword_1B87E5000, v8, OS_LOG_TYPE_ERROR, "[%{public}@] tried to resume isolation queue, but already resumed (store may have loaded late)", buf, 0xCu);
    }
  }
}

- (void)_cancelTimeoutTimer
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (self->_storeLoadTimeoutTimer)
  {
    id v3 = MSPGetSharedTripLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      id v4 = NSString;
      id v5 = self;
      id v6 = [v4 stringWithFormat:@"%@<%p>", objc_opt_class(), v5];

      *(_DWORD *)buf = 138543362;
      double v9 = v6;
      _os_log_impl(&dword_1B87E5000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] store | cancelling timeout timer", buf, 0xCu);
    }
    [(GCDTimer *)self->_storeLoadTimeoutTimer invalidate];
    storeLoadTimeoutTimer = self->_storeLoadTimeoutTimer;
    self->_storeLoadTimeoutTimer = 0;
  }
}

- (void)storeControllerWithDidLoad:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = MSPGetSharedTripLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    if (self)
    {
      uint64_t v7 = NSString;
      uint64_t v8 = self;
      double v9 = [v7 stringWithFormat:@"%@<%p>", objc_opt_class(), v8];
    }
    else
    {
      double v9 = @"<nil>";
    }
    *(_DWORD *)buf = 138543362;
    __int16 v17 = v9;
    _os_log_impl(&dword_1B87E5000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] store | loaded", buf, 0xCu);
  }
  [(MSPSharedTripBlocklist *)self _cancelTimeoutTimer];
  objc_storeStrong((id *)&self->_store, a3);
  if (self->_waitingForStoreToLoad)
  {
    [(MSPSharedTripBlocklist *)self _resumeIsolationQueueIfNeeded];
  }
  else
  {
    uint64_t v10 = MSPGetSharedTripLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      double v11 = NSString;
      double v12 = self;
      uint64_t v13 = [v11 stringWithFormat:@"%@<%p>", objc_opt_class(), v12];

      *(_DWORD *)buf = 138543362;
      __int16 v17 = v13;
      _os_log_impl(&dword_1B87E5000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] store | loaded after we already resumed our queue, force reload blocked identifiers", buf, 0xCu);
    }
    isolationQueue = self->_isolationQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __53__MSPSharedTripBlocklist_storeControllerWithDidLoad___block_invoke;
    block[3] = &unk_1E617C770;
    void block[4] = self;
    dispatch_async(isolationQueue, block);
  }
}

uint64_t __53__MSPSharedTripBlocklist_storeControllerWithDidLoad___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reloadBlockedIdentifiersFromSync];
}

- (void)storeControllerWithFailedToLoad:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = MSPGetSharedTripLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    if (self)
    {
      id v6 = NSString;
      uint64_t v7 = self;
      uint64_t v8 = [v6 stringWithFormat:@"%@<%p>", objc_opt_class(), v7];
    }
    else
    {
      uint64_t v8 = @"<nil>";
    }
    *(_DWORD *)buf = 138543618;
    double v11 = v8;
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl(&dword_1B87E5000, v5, OS_LOG_TYPE_ERROR, "[%{public}@] store | failed to load: %@", buf, 0x16u);
  }
  [(MSPSharedTripBlocklist *)self _cancelTimeoutTimer];
  store = self->_store;
  self->_store = 0;

  [(MSPSharedTripBlocklist *)self _resumeIsolationQueueIfNeeded];
}

- (void)storeControllerWithDataChanged:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = MSPGetSharedTripLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    if (self)
    {
      id v5 = NSString;
      id v6 = self;
      uint64_t v7 = [v5 stringWithFormat:@"%@<%p>", objc_opt_class(), v6];
    }
    else
    {
      uint64_t v7 = @"<nil>";
    }
    *(_DWORD *)buf = 138543362;
    double v11 = v7;
    _os_log_impl(&dword_1B87E5000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] store | data changed, schedule reload of blocked identifiers", buf, 0xCu);
  }
  isolationQueue = self->_isolationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__MSPSharedTripBlocklist_storeControllerWithDataChanged___block_invoke;
  block[3] = &unk_1E617C770;
  void block[4] = self;
  dispatch_async(isolationQueue, block);
}

uint64_t __57__MSPSharedTripBlocklist_storeControllerWithDataChanged___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reloadBlockedIdentifiersFromSync];
}

+ (void)migrateFromiCloudKVSIfNeeded
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  int BOOL = GEOConfigGetBOOL();
  id v4 = +[MSPMapsDefaultsAccessor get:@"ShareETABlocklistMigration2022"];
  id v5 = MSPGetSharedTripLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    if (a1)
    {
      id v6 = NSString;
      id v7 = a1;
      uint64_t v8 = [v6 stringWithFormat:@"%@<%p>", objc_opt_class(), v7];
    }
    else
    {
      uint64_t v8 = @"<nil>";
    }
    double v9 = @"NO";
    if (BOOL) {
      double v9 = @"YES";
    }
    uint64_t v10 = v9;
    *(_DWORD *)buf = 138543874;
    uint64_t v15 = v8;
    __int16 v16 = 2114;
    __int16 v17 = v4;
    __int16 v18 = 2114;
    __int16 v19 = v10;
    _os_log_impl(&dword_1B87E5000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] migration | Last KVS blocklist migration performed: %{public}@, should always check: %{public}@", buf, 0x20u);
  }
  if (v4) {
    int v11 = BOOL;
  }
  else {
    int v11 = 1;
  }
  if (v11 == 1)
  {
    uint64_t v12 = dispatch_get_global_queue(9, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __54__MSPSharedTripBlocklist_migrateFromiCloudKVSIfNeeded__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    void block[4] = a1;
    dispatch_async(v12, block);
  }
}

void __54__MSPSharedTripBlocklist_migrateFromiCloudKVSIfNeeded__block_invoke(uint64_t a1)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4F29130] defaultStore];
  id v3 = [v2 dictionaryForKey:@"com.apple.mapspushd.MSPSharedTripBlacklist"];
  if (v3)
  {
    id v4 = MSPGetSharedTripLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = *(void **)(a1 + 32);
      if (v5)
      {
        id v6 = NSString;
        id v7 = v5;
        uint64_t v8 = [v6 stringWithFormat:@"%@<%p>", objc_opt_class(), v7];
      }
      else
      {
        uint64_t v8 = @"<nil>";
      }
      *(_DWORD *)buf = 138543362;
      v34 = v8;
      _os_log_impl(&dword_1B87E5000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] migration | - Found blocklist data in iCloud KVS, will migrate in background", buf, 0xCu);
    }
    double v9 = [v3 objectForKeyedSubscript:@"tripIdentifiers"];
    if ([v9 count])
    {
      uint64_t v10 = MSPGetSharedTripLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = *(void **)(a1 + 32);
        if (v11)
        {
          uint64_t v12 = NSString;
          id v13 = v11;
          uint64_t v14 = [v12 stringWithFormat:@"%@<%p>", objc_opt_class(), v13];
        }
        else
        {
          uint64_t v14 = @"<nil>";
        }
        uint64_t v15 = [v9 count];
        *(_DWORD *)buf = 138543618;
        v34 = v14;
        __int16 v35 = 2048;
        uint64_t v36 = v15;
        _os_log_impl(&dword_1B87E5000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] migration | - Migrating %lu blocked trip identifiers...", buf, 0x16u);
      }
      __int16 v16 = [*(id *)(a1 + 32) sharedInstance];
      [v16 blockIdentifiers:v9];
    }
    if (GEOConfigGetBOOL())
    {
      __int16 v17 = MSPGetSharedTripLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v18 = *(void **)(a1 + 32);
        if (v18)
        {
          __int16 v19 = NSString;
          id v20 = v18;
          uint64_t v21 = [v19 stringWithFormat:@"%@<%p>", objc_opt_class(), v20];
        }
        else
        {
          uint64_t v21 = @"<nil>";
        }
        *(_DWORD *)buf = 138543362;
        v34 = v21;
        _os_log_impl(&dword_1B87E5000, v17, OS_LOG_TYPE_DEFAULT, "[%{public}@] migration | - Clearing KVS blocklist post-migration...", buf, 0xCu);
      }
      [v2 removeObjectForKey:@"com.apple.mapspushd.MSPSharedTripBlacklist"];
      [v2 synchronize];
    }
    id v22 = MSPGetSharedTripLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      long long v23 = *(void **)(a1 + 32);
      if (v23)
      {
        long long v24 = NSString;
        id v25 = v23;
        long long v26 = [v24 stringWithFormat:@"%@<%p>", objc_opt_class(), v25];
      }
      else
      {
        long long v26 = @"<nil>";
      }
      *(_DWORD *)buf = 138543362;
      v34 = v26;
      _os_log_impl(&dword_1B87E5000, v22, OS_LOG_TYPE_DEFAULT, "[%{public}@] migration | - Finished migrating blocked trip identifiers", buf, 0xCu);
    }
  }
  uint64_t v27 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v28 = MSPGetSharedTripLog();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v29 = *(void **)(a1 + 32);
    if (v29)
    {
      __int16 v30 = NSString;
      id v31 = v29;
      uint64_t v32 = [v30 stringWithFormat:@"%@<%p>", objc_opt_class(), v31];
    }
    else
    {
      uint64_t v32 = @"<nil>";
    }
    *(_DWORD *)buf = 138543618;
    v34 = v32;
    __int16 v35 = 2114;
    uint64_t v36 = (uint64_t)v27;
    _os_log_impl(&dword_1B87E5000, v28, OS_LOG_TYPE_DEFAULT, "[%{public}@] migration | Recording KVS migration check at: %{public}@", buf, 0x16u);
  }
  +[MSPMapsDefaultsAccessor set:@"ShareETABlocklistMigration2022" value:v27];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeLoadTimeoutTimer, 0);
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_storeController, 0);
  objc_storeStrong((id *)&self->_storeQueue, 0);
  objc_storeStrong((id *)&self->_isolationQueue, 0);

  objc_storeStrong((id *)&self->_blockedIdentifiers, 0);
}

@end