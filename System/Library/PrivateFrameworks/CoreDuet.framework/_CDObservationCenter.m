@interface _CDObservationCenter
+ (id)sharedInstance;
- (_CDObservationCenter)init;
- (id)_notificationToObserverEntriesForSender:(int)a3 observerObserver:(int)a4 shouldCreate:;
- (id)_observerToEntriesForSender:(void *)a3 name:(int)a4 observerObserver:(int)a5 shouldCreate:;
- (unint64_t)observerCountOnName:(id)a3;
- (void)_addObserver:(void *)a3 name:(void *)a4 sender:(void *)a5 queue:(int)a6 observerObserver:(void *)a7 usingCall:;
- (void)_postNotificationName:(void *)a3 userInfo:(void *)a4 sender:(int)a5 observerObserver:;
- (void)_postObserverChangesNotificationWithObserverCounts:(void *)a1;
- (void)_removeObserver:(int)a3 observerObserver:;
- (void)_removeObserver:(void *)a3 name:(int)a4 observerObserver:;
- (void)_removeObserver:(void *)a3 name:(void *)a4 sender:(int)a5 observerObserver:(void *)a6 observerCounts:;
- (void)addObserver:(id)a3 name:(id)a4 sender:(id)a5 queue:(id)a6 usingBlock:(id)a7;
- (void)addObserver:(id)a3 name:(id)a4 sender:(id)a5 queue:(id)a6 usingSelector:(SEL)a7;
- (void)addObserverChangesObserver:(id)a3 onName:(id)a4 queue:(id)a5 usingBlock:(id)a6;
- (void)addObserverChangesObserver:(id)a3 onName:(id)a4 queue:(id)a5 usingSelector:(SEL)a6;
- (void)postNotificationName:(id)a3 userInfo:(id)a4 sender:(id)a5;
- (void)removeObserver:(id)a3;
- (void)removeObserver:(id)a3 name:(id)a4;
- (void)removeObserver:(id)a3 name:(id)a4 sender:(id)a5;
- (void)removeObserverChangesObserver:(id)a3 onName:(id)a4;
@end

@implementation _CDObservationCenter

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38___CDObservationCenter_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_initialized_1 != -1) {
    dispatch_once(&sharedInstance_initialized_1, block);
  }
  v2 = (void *)sharedInstance_sharedInstance_1;
  return v2;
}

- (_CDObservationCenter)init
{
  v8.receiver = self;
  v8.super_class = (Class)_CDObservationCenter;
  v2 = [(_CDObservationCenter *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
    senderToNotificationObservers = v2->_senderToNotificationObservers;
    v2->_senderToNotificationObservers = (NSMapTable *)v3;

    uint64_t v5 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
    senderToNotificationObserverObservers = v2->_senderToNotificationObserverObservers;
    v2->_senderToNotificationObserverObservers = (NSMapTable *)v5;
  }
  return v2;
}

- (id)_notificationToObserverEntriesForSender:(int)a3 observerObserver:(int)a4 shouldCreate:
{
  id v7 = a2;
  if (a1)
  {
    uint64_t v8 = 8;
    if (a3) {
      uint64_t v8 = 16;
    }
    id v9 = *(id *)(a1 + v8);
    if (!v7)
    {
      id v7 = [MEMORY[0x1E4F1CA98] null];
    }
    v10 = [v9 objectForKey:v7];
    if (v10) {
      BOOL v11 = 1;
    }
    else {
      BOOL v11 = a4 == 0;
    }
    if (!v11)
    {
      v10 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
      [v9 setObject:v10 forKey:v7];
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)_observerToEntriesForSender:(void *)a3 name:(int)a4 observerObserver:(int)a5 shouldCreate:
{
  id v9 = a3;
  if (a1)
  {
    v10 = -[_CDObservationCenter _notificationToObserverEntriesForSender:observerObserver:shouldCreate:](a1, a2, a4, a5);
    BOOL v11 = v10;
    if (v10)
    {
      v12 = [v10 objectForKey:v9];
      if (!v12 && a5)
      {
        v12 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
        [v11 setObject:v12 forKey:v9];
      }
    }
    else
    {
      v12 = 0;
    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)_addObserver:(void *)a3 name:(void *)a4 sender:(void *)a5 queue:(int)a6 observerObserver:(void *)a7 usingCall:
{
  v29[1] = *MEMORY[0x1E4F143B8];
  id v13 = a2;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  if (a1)
  {
    id v18 = a1;
    objc_sync_enter(v18);
    v19 = -[_CDObservationCenter _observerToEntriesForSender:name:observerObserver:shouldCreate:]((uint64_t)v18, v15, v14, a6, 1);
    v20 = objc_opt_new();
    v22 = v20;
    if (v20)
    {
      objc_setProperty_atomic(v20, v21, v16, 8);
      objc_setProperty_atomic(v22, v23, v17, 16);
    }
    uint64_t v24 = [v19 count];
    [v19 setObject:v22 forKey:v13];
    if ((a6 & 1) != 0 || [v19 count] == v24) {
      uint64_t v25 = -1;
    }
    else {
      uint64_t v25 = [v18 observerCountOnName:v14];
    }

    objc_sync_exit(v18);
    if ((v25 & 0x8000000000000000) == 0)
    {
      v28 = @"observerCount";
      v26 = [NSNumber numberWithInteger:v25];
      v29[0] = v26;
      v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:&v28 count:1];
      -[_CDObservationCenter _postNotificationName:userInfo:sender:observerObserver:](v18, v14, v27, v18, 1);
    }
  }
}

- (void)_postNotificationName:(void *)a3 userInfo:(void *)a4 sender:(int)a5 observerObserver:
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  id v58 = a3;
  id v10 = a4;
  id v57 = v10;
  v36 = v9;
  if (a1)
  {
    BOOL v11 = objc_opt_new();
    id v12 = a1;
    objc_sync_enter(v12);
    id v13 = -[_CDObservationCenter _observerToEntriesForSender:name:observerObserver:shouldCreate:]((uint64_t)v12, v10, v9, a5, 0);
    id v14 = (void *)[v13 copy];

    if (v14) {
      [v11 addObject:v14];
    }
    id v15 = -[_CDObservationCenter _observerToEntriesForSender:name:observerObserver:shouldCreate:]((uint64_t)v12, 0, v36, a5, 0);
    id v16 = (void *)[v15 copy];

    if (v16) {
      [v11 addObject:v16];
    }

    objc_sync_exit(v12);
    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    id obj = v11;
    uint64_t v39 = [obj countByEnumeratingWithState:&v53 objects:v60 count:16];
    if (v39)
    {
      uint64_t v38 = *(void *)v54;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v54 != v38)
          {
            uint64_t v18 = v17;
            objc_enumerationMutation(obj);
            uint64_t v17 = v18;
          }
          uint64_t v40 = v17;
          v19 = *(void **)(*((void *)&v53 + 1) + 8 * v17);
          long long v49 = 0u;
          long long v50 = 0u;
          long long v51 = 0u;
          long long v52 = 0u;
          id v20 = v19;
          uint64_t v42 = [v20 countByEnumeratingWithState:&v49 objects:v59 count:16];
          if (v42)
          {
            uint64_t v41 = *(void *)v50;
            do
            {
              uint64_t v21 = 0;
              do
              {
                if (*(void *)v50 != v41) {
                  objc_enumerationMutation(v20);
                }
                id v22 = *(id *)(*((void *)&v49 + 1) + 8 * v21);
                SEL v23 = [v20 objectForKey:v22];
                uint64_t v25 = v23;
                if (v23)
                {
                  v26 = objc_getProperty(v23, v24, 8, 1);
                  id Property = objc_getProperty(v25, v27, 16, 1);
                }
                else
                {
                  v26 = 0;
                  id Property = 0;
                }
                id v29 = Property;
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  v30 = (NSString *)v29;
                  SEL v31 = NSSelectorFromString(v30);
                  v32 = [(id)objc_opt_class() instanceMethodSignatureForSelector:v31];
                  if (v32)
                  {
                    v33 = [MEMORY[0x1E4F1CA18] invocationWithMethodSignature:v32];
                    [v33 setSelector:v31];
                    [v33 setTarget:v22];
                    [v33 setArgument:&v57 atIndex:2];
                    [v33 setArgument:&v58 atIndex:3];
                    if (v26)
                    {
                      block[0] = MEMORY[0x1E4F143A8];
                      block[1] = 3221225472;
                      block[2] = __79___CDObservationCenter__postNotificationName_userInfo_sender_observerObserver___block_invoke;
                      block[3] = &unk_1E560D578;
                      id v48 = v33;
                      dispatch_async(v26, block);
                    }
                    else
                    {
                      [v33 invoke];
                    }
                  }
                }
                else
                {
                  uint64_t v34 = MEMORY[0x192FB31A0](v29);
                  v30 = (NSString *)v34;
                  if (v34)
                  {
                    if (v26)
                    {
                      v43[0] = MEMORY[0x1E4F143A8];
                      v43[1] = 3221225472;
                      v43[2] = __79___CDObservationCenter__postNotificationName_userInfo_sender_observerObserver___block_invoke_2;
                      v43[3] = &unk_1E560E4E0;
                      id v44 = v57;
                      id v45 = v58;
                      v30 = v30;
                      v46 = v30;
                      dispatch_async(v26, v43);
                    }
                    else
                    {
                      (*(void (**)(uint64_t, id, id))(v34 + 16))(v34, v57, v58);
                    }
                  }
                }

                ++v21;
              }
              while (v42 != v21);
              uint64_t v35 = [v20 countByEnumeratingWithState:&v49 objects:v59 count:16];
              uint64_t v42 = v35;
            }
            while (v35);
          }

          uint64_t v17 = v40 + 1;
        }
        while (v40 + 1 != v39);
        uint64_t v39 = [obj countByEnumeratingWithState:&v53 objects:v60 count:16];
      }
      while (v39);
    }

    id v10 = v57;
  }
}

- (void)_removeObserver:(int)a3 observerObserver:
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    v6 = objc_opt_new();
    id v7 = a1;
    objc_sync_enter(v7);
    uint64_t v8 = 8;
    if (a3) {
      uint64_t v8 = 16;
    }
    id v9 = *(id *)&v7[v8];
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v25 = v9;
    id v10 = [v9 keyEnumerator];
    BOOL v11 = [v10 allObjects];
    id v12 = (void *)[v11 copy];

    uint64_t v13 = [v12 countByEnumeratingWithState:&v32 objects:v37 count:16];
    if (v13)
    {
      SEL v23 = v12;
      uint64_t v24 = *(void *)v33;
      do
      {
        uint64_t v26 = v13;
        for (uint64_t i = 0; i != v26; ++i)
        {
          if (*(void *)v33 != v24) {
            objc_enumerationMutation(v12);
          }
          id v15 = *(id *)(*((void *)&v32 + 1) + 8 * i);
          id v16 = [v25 objectForKey:v15];
          long long v30 = 0u;
          long long v31 = 0u;
          long long v28 = 0u;
          long long v29 = 0u;
          SEL v27 = v16;
          uint64_t v17 = [v16 keyEnumerator];
          uint64_t v18 = [v17 allObjects];
          v19 = (void *)[v18 copy];

          uint64_t v20 = [v19 countByEnumeratingWithState:&v28 objects:v36 count:16];
          if (v20)
          {
            uint64_t v21 = *(void *)v29;
            do
            {
              for (uint64_t j = 0; j != v20; ++j)
              {
                if (*(void *)v29 != v21) {
                  objc_enumerationMutation(v19);
                }
                -[_CDObservationCenter _removeObserver:name:sender:observerObserver:observerCounts:](v7, v5, *(void **)(*((void *)&v28 + 1) + 8 * j), v15, a3, v6);
              }
              uint64_t v20 = [v19 countByEnumeratingWithState:&v28 objects:v36 count:16];
            }
            while (v20);
          }

          id v12 = v23;
        }
        uint64_t v13 = [v23 countByEnumeratingWithState:&v32 objects:v37 count:16];
      }
      while (v13);
    }

    objc_sync_exit(v7);
    if ([v6 count]) {
      -[_CDObservationCenter _postObserverChangesNotificationWithObserverCounts:](v7, v6);
    }
  }
}

- (void)_removeObserver:(void *)a3 name:(void *)a4 sender:(int)a5 observerObserver:(void *)a6 observerCounts:
{
  id v26 = a2;
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  id v14 = v13;
  if (a1)
  {
    id v15 = v13;
    if (!v13) {
      id v15 = objc_opt_new();
    }
    id v16 = a1;
    objc_sync_enter(v16);
    uint64_t v17 = 8;
    if (a5) {
      uint64_t v17 = 16;
    }
    id v18 = *(id *)&v16[v17];
    v19 = [v18 objectForKey:v12];
    uint64_t v20 = v19;
    if (v19)
    {
      uint64_t v21 = [v19 objectForKey:v11];
      id v22 = v21;
      if (v21)
      {
        uint64_t v23 = [v21 count];
        [v22 removeObjectForKey:v26];
        if ((a5 & 1) == 0 && [v22 count] != v23)
        {
          uint64_t v24 = [v16 observerCountOnName:v11];
          id v25 = [NSNumber numberWithUnsignedInteger:v24];
          [v15 setObject:v25 forKey:v11];
        }
        if (![v22 count]) {
          [v20 removeObjectForKey:v11];
        }
      }
      if (![v20 count]) {
        [v18 removeObjectForKey:v12];
      }
    }
    objc_sync_exit(v16);

    if (!v14) {
      -[_CDObservationCenter _postObserverChangesNotificationWithObserverCounts:](v16, v15);
    }
  }
  else
  {
    id v15 = v13;
  }
}

- (void)_postObserverChangesNotificationWithObserverCounts:(void *)a1
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = v3;
  if (a1 && [v3 count])
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v15 = v4;
    id v5 = v4;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v22 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v17 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          id v11 = [v5 objectForKeyedSubscript:v10];
          uint64_t v12 = [v11 unsignedIntegerValue];
          uint64_t v20 = @"observerCount";
          id v13 = [NSNumber numberWithUnsignedInteger:v12];
          uint64_t v21 = v13;
          id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v21 forKeys:&v20 count:1];
          -[_CDObservationCenter _postNotificationName:userInfo:sender:observerObserver:](a1, v10, v14, a1, 1);
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v22 count:16];
      }
      while (v7);
    }

    v4 = v15;
  }
}

- (void)_removeObserver:(void *)a3 name:(int)a4 observerObserver:
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  if (a1)
  {
    id v9 = objc_opt_new();
    id v10 = a1;
    objc_sync_enter(v10);
    uint64_t v11 = 8;
    if (a4) {
      uint64_t v11 = 16;
    }
    id v12 = *(id *)&v10[v11];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v20 = v12;
    id v13 = [v12 keyEnumerator];
    id v14 = [v13 allObjects];
    id v15 = (void *)[v14 copy];

    uint64_t v16 = [v15 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v16)
    {
      uint64_t v17 = *(void *)v22;
      do
      {
        uint64_t v18 = 0;
        do
        {
          if (*(void *)v22 != v17) {
            objc_enumerationMutation(v15);
          }
          id v19 = *(id *)(*((void *)&v21 + 1) + 8 * v18);
          -[_CDObservationCenter _removeObserver:name:sender:observerObserver:observerCounts:](v10, v7, v8, v19, a4, v9);

          ++v18;
        }
        while (v16 != v18);
        uint64_t v16 = [v15 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v16);
    }

    objc_sync_exit(v10);
    if ([v9 count]) {
      -[_CDObservationCenter _postObserverChangesNotificationWithObserverCounts:](v10, v9);
    }
  }
}

- (void)addObserver:(id)a3 name:(id)a4 sender:(id)a5 queue:(id)a6 usingSelector:(SEL)a7
{
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  NSStringFromSelector(a7);
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  -[_CDObservationCenter _addObserver:name:sender:queue:observerObserver:usingCall:](self, v15, v14, v13, v12, 0, v16);
}

- (void)addObserver:(id)a3 name:(id)a4 sender:(id)a5 queue:(id)a6 usingBlock:(id)a7
{
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  id v16 = (id)MEMORY[0x192FB31A0](a7);
  -[_CDObservationCenter _addObserver:name:sender:queue:observerObserver:usingCall:](self, v15, v14, v13, v12, 0, v16);
}

- (void)postNotificationName:(id)a3 userInfo:(id)a4 sender:(id)a5
{
}

- (void)removeObserver:(id)a3
{
}

- (void)removeObserver:(id)a3 name:(id)a4
{
}

- (void)removeObserver:(id)a3 name:(id)a4 sender:(id)a5
{
}

- (void)addObserverChangesObserver:(id)a3 onName:(id)a4 queue:(id)a5 usingSelector:(SEL)a6
{
  id v10 = a3;
  id v18 = a4;
  id v11 = a5;
  id v12 = [(id)objc_opt_class() instanceMethodSignatureForSelector:a6];
  if (v12)
  {
    id v13 = [MEMORY[0x1E4F1CA18] invocationWithMethodSignature:v12];
    [v13 setSelector:a6];
    [v13 setTarget:v10];
    [v13 setArgument:&v18 atIndex:2];
    id v14 = v18;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __78___CDObservationCenter_addObserverChangesObserver_onName_queue_usingSelector___block_invoke;
    v16[3] = &unk_1E560E508;
    id v17 = v13;
    id v15 = v13;
    [(_CDObservationCenter *)self addObserverChangesObserver:v10 onName:v14 queue:v11 usingBlock:v16];
  }
}

- (void)addObserverChangesObserver:(id)a3 onName:(id)a4 queue:(id)a5 usingBlock:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = self;
  objc_sync_enter(v14);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __75___CDObservationCenter_addObserverChangesObserver_onName_queue_usingBlock___block_invoke;
  v18[3] = &unk_1E560E530;
  id v15 = v13;
  id v20 = v15;
  id v16 = v11;
  id v19 = v16;
  id v17 = (void *)MEMORY[0x192FB31A0](v18);
  -[_CDObservationCenter _addObserver:name:sender:queue:observerObserver:usingCall:](v14, v10, v16, v14, v12, 1, v17);

  objc_sync_exit(v14);
}

- (void)removeObserverChangesObserver:(id)a3 onName:(id)a4
{
}

- (unint64_t)observerCountOnName:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  uint64_t v6 = v5->_senderToNotificationObservers;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v7 = [(NSMapTable *)v6 keyEnumerator];
  id v8 = [v7 allObjects];

  unint64_t v9 = 0;
  uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v18;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(id *)(*((void *)&v17 + 1) + 8 * v12);
        id v14 = -[_CDObservationCenter _observerToEntriesForSender:name:observerObserver:shouldCreate:]((uint64_t)v5, v13, v4, 0, 0);
        id v15 = v14;
        if (v14) {
          v9 += [v14 count];
        }

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v10);
  }

  objc_sync_exit(v5);
  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_senderToNotificationObserverObservers, 0);
  objc_storeStrong((id *)&self->_senderToNotificationObservers, 0);
}

@end