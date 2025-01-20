@interface EKChangeListener
+ (BOOL)isSyncStatusChangeNotification:(id)a3;
+ (id)changedIdentifiersForNotification:(id)a3;
+ (id)updatedObjectFor:(id)a3 changeNotification:(id)a4;
- (EKChangeListener)init;
- (NSPointerArray)delegates;
- (id)_orderedDelegates;
- (void)objectsChangedNotification:(id)a3;
- (void)registerDelegate:(id)a3;
- (void)setDelegates:(id)a3;
@end

@implementation EKChangeListener

- (EKChangeListener)init
{
  v7.receiver = self;
  v7.super_class = (Class)EKChangeListener;
  v2 = [(EKChangeListener *)&v7 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F28F50] weakObjectsPointerArray];
    [(EKChangeListener *)v2 setDelegates:v3];

    v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 addObserver:v2 selector:sel_objectsChangedNotification_ name:@"EKEventModifiedNotification" object:0];

    v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 addObserver:v2 selector:sel_objectsChangedNotification_ name:@"EKEventStoreChangedNotification" object:0];
  }
  return v2;
}

- (void)setDelegates:(id)a3
{
}

- (void)registerDelegate:(id)a3
{
  id v4 = a3;
  id v5 = [(EKChangeListener *)self delegates];
  [v5 addPointer:v4];
}

- (id)_orderedDelegates
{
  v2 = [(EKChangeListener *)self delegates];
  v3 = [v2 allObjects];
  id v4 = [v3 sortedArrayUsingComparator:&__block_literal_global_14];

  return v4;
}

uint64_t __37__EKChangeListener__orderedDelegates__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  if (objc_opt_respondsToSelector() & 1) != 0 && ([v4 hasUpdatePriority]) {
    uint64_t v6 = -1;
  }
  else {
    uint64_t v6 = (objc_opt_respondsToSelector() & 1) != 0 && ([v5 hasUpdatePriority] & 1) != 0;
  }

  return v6;
}

- (void)objectsChangedNotification:(id)a3
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!+[EKChangeListener isSyncStatusChangeNotification:v4])
  {
    id v5 = [(EKChangeListener *)self delegates];
    [v5 compact];

    v34 = [v4 userInfo];
    uint64_t v6 = [v34 objectForKeyedSubscript:@"EKEventStoreRevert"];
    int v7 = [v6 BOOLValue];

    if (v7)
    {
      v8 = [v4 userInfo];
      v41 = [v8 objectForKeyedSubscript:@"EKEventStoreModifiedEventIdentifier"];
    }
    else
    {
      v41 = 0;
    }
    v35 = [MEMORY[0x1E4F1CA48] array];
    long long v63 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    obuint64_t j = [(EKChangeListener *)self _orderedDelegates];
    uint64_t v42 = [obj countByEnumeratingWithState:&v63 objects:v70 count:16];
    if (v42)
    {
      uint64_t v40 = *(void *)v64;
      v38 = self;
      id v39 = v4;
      int v37 = v7;
      do
      {
        for (uint64_t i = 0; i != v42; ++i)
        {
          if (*(void *)v64 != v40) {
            objc_enumerationMutation(obj);
          }
          v10 = *(void **)(*((void *)&v63 + 1) + 8 * i);
          v11 = [MEMORY[0x1E4F1CA60] dictionary];
          v12 = [MEMORY[0x1E4F1CA48] array];
          v57[0] = MEMORY[0x1E4F143A8];
          v57[1] = 3221225472;
          v57[2] = __47__EKChangeListener_objectsChangedNotification___block_invoke;
          v57[3] = &unk_1E5B973B0;
          v57[4] = self;
          id v58 = v4;
          id v13 = v11;
          id v59 = v13;
          char v62 = v7;
          id v60 = v41;
          id v14 = v12;
          id v61 = v14;
          v15 = (void (**)(void, void, void))MEMORY[0x1A6266730](v57);
          if (objc_opt_respondsToSelector())
          {
            v16 = [v10 trackedObjectMap];
            long long v53 = 0u;
            long long v54 = 0u;
            long long v55 = 0u;
            long long v56 = 0u;
            uint64_t v17 = [v16 countByEnumeratingWithState:&v53 objects:v69 count:16];
            if (v17)
            {
              uint64_t v18 = v17;
              id v43 = v14;
              id v44 = v13;
              uint64_t v19 = *(void *)v54;
              do
              {
                for (uint64_t j = 0; j != v18; ++j)
                {
                  if (*(void *)v54 != v19) {
                    objc_enumerationMutation(v16);
                  }
                  uint64_t v21 = *(void *)(*((void *)&v53 + 1) + 8 * j);
                  v22 = [v16 objectForKeyedSubscript:v21];
                  ((void (**)(void, uint64_t, void *))v15)[2](v15, v21, v22);
                }
                uint64_t v18 = [v16 countByEnumeratingWithState:&v53 objects:v69 count:16];
              }
              while (v18);
LABEL_26:
              self = v38;
              id v4 = v39;
              int v7 = v37;
              id v14 = v43;
              id v13 = v44;
            }
          }
          else
          {
            long long v51 = 0u;
            long long v52 = 0u;
            long long v49 = 0u;
            long long v50 = 0u;
            v16 = [v10 trackedObjects];
            uint64_t v23 = [v16 countByEnumeratingWithState:&v49 objects:v68 count:16];
            if (v23)
            {
              uint64_t v24 = v23;
              id v43 = v14;
              id v44 = v13;
              uint64_t v25 = *(void *)v50;
              do
              {
                for (uint64_t k = 0; k != v24; ++k)
                {
                  if (*(void *)v50 != v25) {
                    objc_enumerationMutation(v16);
                  }
                  v27 = *(void **)(*((void *)&v49 + 1) + 8 * k);
                  v28 = [v27 specificIdentifier];
                  ((void (**)(void, void *, void *))v15)[2](v15, v28, v27);
                }
                uint64_t v24 = [v16 countByEnumeratingWithState:&v49 objects:v68 count:16];
              }
              while (v24);
              goto LABEL_26;
            }
          }

          if (v7 && [v14 count] && (objc_opt_respondsToSelector() & 1) != 0) {
            [v10 trackedObjectsDidRevert:v14];
          }
          [v10 trackedObjectsDidUpdate:v13];
          if (objc_opt_respondsToSelector()) {
            [v35 addObject:v10];
          }
        }
        uint64_t v42 = [obj countByEnumeratingWithState:&v63 objects:v70 count:16];
      }
      while (v42);
    }

    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id v29 = v35;
    uint64_t v30 = [v29 countByEnumeratingWithState:&v45 objects:v67 count:16];
    if (v30)
    {
      uint64_t v31 = v30;
      uint64_t v32 = *(void *)v46;
      do
      {
        for (uint64_t m = 0; m != v31; ++m)
        {
          if (*(void *)v46 != v32) {
            objc_enumerationMutation(v29);
          }
          [*(id *)(*((void *)&v45 + 1) + 8 * m) notifyObservers];
        }
        uint64_t v31 = [v29 countByEnumeratingWithState:&v45 objects:v67 count:16];
      }
      while (v31);
    }
  }
}

void __47__EKChangeListener_objectsChangedNotification___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() updatedObjectFor:v4 changeNotification:*(void *)(a1 + 40)];
  uint64_t v6 = [v4 specificIdentifier];
  if (v6)
  {
    if (v5) {
      [*(id *)(a1 + 48) setObject:v5 forKeyedSubscript:v6];
    }
    if (*(unsigned char *)(a1 + 72) && [*(id *)(a1 + 56) isEqualToString:v6]) {
      [*(id *)(a1 + 64) addObject:v4];
    }
  }
  else
  {
    int v7 = EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
      __47__EKChangeListener_objectsChangedNotification___block_invoke_cold_1((uint64_t)v4, v7);
    }
  }
}

+ (id)updatedObjectFor:(id)a3 changeNotification:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  int v7 = [v6 userInfo];
  v8 = [v7 objectForKeyedSubscript:@"EKEventStoreChangeTypeUserInfoKey"];
  v9 = v8;
  if (v8 && [v8 integerValue] != 1)
  {
    id v13 = v5;
    goto LABEL_18;
  }
  v10 = [v7 objectForKeyedSubscript:@"EKEventStoreRevert"];
  int v11 = [v10 BOOLValue];

  if (v11)
  {
    v12 = [v6 object];

    if (v12)
    {
      id v13 = [v6 object];
      id v14 = [v13 specificIdentifier];
      v15 = [v5 specificIdentifier];
      char v16 = [v14 isEqual:v15];

      if (v16) {
        goto LABEL_18;
      }
    }
  }
  uint64_t v17 = [(id)objc_opt_class() changedIdentifiersForNotification:v6];
  uint64_t v18 = [v5 uniqueIdentifier];
  char v19 = [v17 containsObject:v18];

  if ((v19 & 1) == 0 && v17) {
    goto LABEL_16;
  }
  if (![v5 _refreshable])
  {
    id v13 = [v6 object];
    if (v13)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        goto LABEL_17;
      }
    }

    goto LABEL_16;
  }
  if ([v5 refreshAndNotify:0])
  {
LABEL_16:
    id v13 = v5;
    goto LABEL_17;
  }
  id v13 = 0;
LABEL_17:

LABEL_18:

  return v13;
}

+ (id)changedIdentifiersForNotification:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  objc_sync_enter(v3);
  objc_getAssociatedObject(v3, &changedIdentifiersForNotification__associatedObjectKey);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = 0;
    }
    else
    {
      id v4 = v4;
      id v5 = v4;
    }
  }
  else
  {
    id v6 = [v3 userInfo];
    int v7 = [v6 objectForKeyedSubscript:@"EKEventStoreModifiedEventIdentifier"];

    if (v7)
    {
      id v5 = [MEMORY[0x1E4F1CAD0] setWithObject:v7];
      objc_setAssociatedObject(v3, &changedIdentifiersForNotification__associatedObjectKey, v5, (void *)1);
      id v4 = 0;
    }
    else
    {
      v8 = [v3 userInfo];
      v9 = [v8 objectForKeyedSubscript:@"EKEventStoreChangedObjectIDsUserInfoKey"];

      if (v9)
      {
        v10 = [v3 object];
        int v11 = [MEMORY[0x1E4F1CA80] set];
        long long v22 = 0u;
        long long v23 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        id v12 = v9;
        uint64_t v13 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
        if (v13)
        {
          uint64_t v14 = *(void *)v21;
          do
          {
            for (uint64_t i = 0; i != v13; ++i)
            {
              if (*(void *)v21 != v14) {
                objc_enumerationMutation(v12);
              }
              char v16 = *(void **)(*((void *)&v20 + 1) + 8 * i);
              if (objc_msgSend(v16, "entityType", (void)v20) == 2) {
                [v11 addObject:v16];
              }
            }
            uint64_t v13 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
          }
          while (v13);
        }

        uint64_t v17 = [v10 uniqueIdentifiersForEventsWithObjectIDs:v11];
        if (v17)
        {
          objc_setAssociatedObject(v3, &changedIdentifiersForNotification__associatedObjectKey, v17, (void *)1);
        }
        else
        {
          uint64_t v18 = [MEMORY[0x1E4F1CA98] null];
          objc_setAssociatedObject(v3, &changedIdentifiersForNotification__associatedObjectKey, v18, (void *)1);
        }
        id v4 = v17;
      }
      else
      {
        id v4 = 0;
      }

      id v5 = v4;
    }
  }
  objc_sync_exit(v3);

  return v5;
}

+ (BOOL)isSyncStatusChangeNotification:(id)a3
{
  id v3 = [a3 userInfo];
  id v4 = [v3 objectForKeyedSubscript:@"EKEventStoreChangeTypeUserInfoKey"];

  if (v4) {
    BOOL v5 = [v4 unsignedIntegerValue] == 2;
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (NSPointerArray)delegates
{
  return (NSPointerArray *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

void __47__EKChangeListener_objectsChangedNotification___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A4E47000, a2, OS_LOG_TYPE_ERROR, "Unexpected nil specificIdentifier for object: %@", (uint8_t *)&v2, 0xCu);
}

@end