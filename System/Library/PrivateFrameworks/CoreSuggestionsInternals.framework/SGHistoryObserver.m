@interface SGHistoryObserver
- (SGHistoryObserver)initWithStore:(id)a3;
- (void)hashesDidChange;
- (void)processNewConfirmOrRejectEventHashes:(id)a3;
- (void)processNewConfirmedOrRejectedReminderHashes:(id)a3;
@end

@implementation SGHistoryObserver

- (void).cxx_destruct
{
}

- (void)hashesDidChange
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_store);
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained clearMasterEntityCache];
    id WeakRetained = v3;
  }
}

- (void)processNewConfirmedOrRejectedReminderHashes:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_store);
  v6 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained duplicateKeysMatchingAnyReminderHash:v4];
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v19 = [obj countByEnumeratingWithState:&v26 objects:v33 count:16];
    if (!v19) {
      goto LABEL_22;
    }
    uint64_t v18 = *(void *)v27;
    while (1)
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v27 != v18) {
          objc_enumerationMutation(obj);
        }
        uint64_t v21 = v7;
        v8 = *(void **)(*((void *)&v26 + 1) + 8 * v7);
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        v9 = [obj objectForKeyedSubscript:v8];
        uint64_t v10 = [v9 countByEnumeratingWithState:&v22 objects:v32 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v23;
          do
          {
            uint64_t v13 = 0;
            do
            {
              if (*(void *)v23 != v12) {
                objc_enumerationMutation(v9);
              }
              v14 = [v6 loadReminderByKey:*(void *)(*((void *)&v22 + 1) + 8 * v13)];
              if (v14)
              {
                v15 = [v6 journal];
                v16 = [[SGJournalEntry alloc] initWithOperation:20 reminder:v14];
                [v15 addEntry:v16];
LABEL_14:

                goto LABEL_16;
              }
              v15 = sgRemindersLogHandle();
              if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
              {
                v16 = [v8 base64EncodedDataWithOptions:0];
                *(_DWORD *)buf = 138412290;
                v31 = v16;
                _os_log_error_impl(&dword_1CA650000, v15, OS_LOG_TYPE_ERROR, "SGDSuggestManager - Database inconsistency: Found key for reminder hash %@ but reminder is missing", buf, 0xCu);
                goto LABEL_14;
              }
LABEL_16:

              ++v13;
            }
            while (v11 != v13);
            uint64_t v17 = [v9 countByEnumeratingWithState:&v22 objects:v32 count:16];
            uint64_t v11 = v17;
          }
          while (v17);
        }

        uint64_t v7 = v21 + 1;
      }
      while (v21 + 1 != v19);
      uint64_t v19 = [obj countByEnumeratingWithState:&v26 objects:v33 count:16];
      if (!v19)
      {
LABEL_22:

        break;
      }
    }
  }
}

- (void)processNewConfirmOrRejectEventHashes:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_store);
  v6 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained duplicateKeysMatchingAnyEventHash:v4];
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v20 = [obj countByEnumeratingWithState:&v28 objects:v35 count:16];
    if (v20)
    {
      char v7 = 0;
      uint64_t v19 = *(void *)v29;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v29 != v19) {
            objc_enumerationMutation(obj);
          }
          uint64_t v22 = v8;
          v9 = *(void **)(*((void *)&v28 + 1) + 8 * v8);
          long long v24 = 0u;
          long long v25 = 0u;
          long long v26 = 0u;
          long long v27 = 0u;
          long long v23 = v9;
          uint64_t v10 = objc_msgSend(obj, "objectForKeyedSubscript:");
          uint64_t v11 = [v10 countByEnumeratingWithState:&v24 objects:v34 count:16];
          if (v11)
          {
            uint64_t v12 = v11;
            uint64_t v13 = *(void *)v25;
            do
            {
              for (uint64_t i = 0; i != v12; ++i)
              {
                if (*(void *)v25 != v13) {
                  objc_enumerationMutation(v10);
                }
                v15 = [v6 loadEventByDuplicateKey:*(void *)(*((void *)&v24 + 1) + 8 * i)];
                if (v15)
                {
                  v16 = [v6 journal];
                  uint64_t v17 = [[SGJournalEntry alloc] initWithOperation:8 event:v15];
                  [v16 addEntry:v17];

                  char v7 = 1;
                }
                else
                {
                  v16 = sgLogHandle();
                  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
                  {
                    uint64_t v18 = [v23 base64EncodedDataWithOptions:0];
                    *(_DWORD *)buf = 138412290;
                    v33 = v18;
                    _os_log_impl(&dword_1CA650000, v16, OS_LOG_TYPE_DEFAULT, "Database inconsistency; found key for event hash %@ but event is missing",
                      buf,
                      0xCu);
                  }
                }
              }
              uint64_t v12 = [v10 countByEnumeratingWithState:&v24 objects:v34 count:16];
            }
            while (v12);
          }

          uint64_t v8 = v22 + 1;
        }
        while (v22 + 1 != v20);
        uint64_t v20 = [obj countByEnumeratingWithState:&v28 objects:v35 count:16];
      }
      while (v20);
      if (v7) {
        +[SGDSuggestManager clearRequestCache];
      }
    }
  }
}

- (SGHistoryObserver)initWithStore:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SGHistoryObserver;
  v5 = [(SGHistoryObserver *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_store, v4);
  }

  return v6;
}

@end