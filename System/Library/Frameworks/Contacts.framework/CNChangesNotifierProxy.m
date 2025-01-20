@interface CNChangesNotifierProxy
- (BOOL)forwardsSelfGeneratedDistributedSaveNotifications;
- (double)externalNotificationCoalescingDelay;
- (id)initWithSchedulerProvider:(void *)a3 loggerProvider:;
- (id)postNotificationName:(void *)a3 fromSender:(void *)a4 saveIdentifier:(char)a5 isFromExternalProcess:;
- (id)postNotificationName:(void *)a3 fromSender:(void *)a4 saveIdentifier:(void *)a5 userInfo:(char)a6 shouldForwardExternally:(int)a7 calledFromNotifierQueue:(char)a8 isFromExternalProcess:;
- (id)receiveNotificationName:(void *)a3 fromSender:(void *)a4 saveIdentifier:(void *)a5 userInfo:(int)a6 calledFromNotifierQueue:(char)a7 isFromExternalProcess:;
- (void)addListenerForNotificationName:(void *)a3 registration:(void *)a4 removal:;
- (void)coalesceNotificationName:(uint64_t)a1;
- (void)forwardNotificationName:(void *)a3 asNotificationName:;
- (void)receiveExternalNotificationName:(id)a3;
- (void)receiveNotificationName:(id)a3 fromSender:(id)a4 saveIdentifier:(id)a5 userInfo:(id)a6 isFromExternalProcess:(BOOL)a7;
- (void)removeAllRegisteredNotificationSources;
- (void)setCoalescingTimer:(uint64_t)a1;
- (void)setExternalNotificationCoalescingDelay:(double)a3;
- (void)setForwardsSelfGeneratedDistributedSaveNotifications:(BOOL)a3;
- (void)setRemovalBlocks:(uint64_t)a1;
- (void)stopSupressionOfNotificationName:(uint64_t)a1;
- (void)supressNotificationName:(uint64_t)a1;
- (void)waitForCurrentTasksToFinish;
@end

@implementation CNChangesNotifierProxy

uint64_t __69__CNChangesNotifierProxy_forwardNotificationName_asNotificationName___block_invoke(void *a1)
{
  v1 = (void *)a1[4];
  if (v1) {
    v1 = (void *)v1[7];
  }
  return [v1 setObject:a1[5] forKey:a1[6]];
}

- (void)setRemovalBlocks:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 24), a2);
  }
}

void __78__CNChangesNotifierProxy_addListenerForNotificationName_registration_removal___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    v3 = *(void **)(v2 + 24);
  }
  else {
    v3 = 0;
  }
  id v8 = [v3 objectForKey:*(void *)(a1 + 32)];
  if (!v8)
  {
    uint64_t v4 = [MEMORY[0x1E4F1CA80] set];
    uint64_t v5 = *(void *)(a1 + 40);
    if (v5) {
      v6 = *(void **)(v5 + 24);
    }
    else {
      v6 = 0;
    }
    id v8 = (id)v4;
    [v6 setObject:v4 forKey:*(void *)(a1 + 32)];
  }
  v7 = (void *)[*(id *)(a1 + 56) copy];
  [v8 addObject:v7];
}

- (void)forwardNotificationName:(void *)a3 asNotificationName:
{
  id v5 = a2;
  id v6 = a3;
  v7 = v6;
  if (a1)
  {
    id v8 = *(NSObject **)(a1 + 80);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __69__CNChangesNotifierProxy_forwardNotificationName_asNotificationName___block_invoke;
    block[3] = &unk_1E56B4508;
    block[4] = a1;
    id v10 = v6;
    id v11 = v5;
    dispatch_async(v8, block);
  }
}

- (void)addListenerForNotificationName:(void *)a3 registration:(void *)a4 removal:
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (a1)
  {
    id v10 = *(NSObject **)(a1 + 80);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __78__CNChangesNotifierProxy_addListenerForNotificationName_registration_removal___block_invoke;
    v11[3] = &unk_1E56B7350;
    id v14 = v8;
    id v12 = v7;
    uint64_t v13 = a1;
    id v15 = v9;
    dispatch_async(v10, v11);
  }
}

- (id)initWithSchedulerProvider:(void *)a3 loggerProvider:
{
  id v6 = a2;
  id v7 = a3;
  if (a1)
  {
    v21.receiver = a1;
    v21.super_class = (Class)CNChangesNotifierProxy;
    a1 = (id *)objc_msgSendSuper2(&v21, sel_init);
    if (a1)
    {
      uint64_t v8 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
      id v9 = a1[3];
      a1[3] = (id)v8;

      uint64_t v10 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
      id v11 = a1[4];
      a1[4] = (id)v10;

      uint64_t v12 = [MEMORY[0x1E4F1CA60] dictionary];
      id v13 = a1[7];
      a1[7] = (id)v12;

      id v14 = objc_alloc_init(MEMORY[0x1E4F28BD0]);
      id v15 = a1[8];
      a1[8] = v14;

      id v16 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      id v17 = a1[9];
      a1[9] = v16;

      dispatch_queue_t v18 = dispatch_queue_create("com.apple.Contacts.CNChangesNotifierProxy", 0);
      id v19 = a1[10];
      a1[10] = v18;

      objc_storeStrong(a1 + 5, a2);
      objc_storeStrong(a1 + 6, a3);
      a1[2] = (id)0x3FF0000000000000;
    }
  }

  return a1;
}

- (void)coalesceNotificationName:(uint64_t)a1
{
  id v4 = a2;
  if (a1) {
    objc_storeStrong((id *)(a1 + 96), a2);
  }
}

- (id)postNotificationName:(void *)a3 fromSender:(void *)a4 saveIdentifier:(char)a5 isFromExternalProcess:
{
  if (result) {
    return -[CNChangesNotifierProxy postNotificationName:fromSender:saveIdentifier:userInfo:shouldForwardExternally:calledFromNotifierQueue:isFromExternalProcess:]((uint64_t)result, a2, a3, a4, 0, 1, 0, a5);
  }
  return result;
}

- (id)postNotificationName:(void *)a3 fromSender:(void *)a4 saveIdentifier:(void *)a5 userInfo:(char)a6 shouldForwardExternally:(int)a7 calledFromNotifierQueue:(char)a8 isFromExternalProcess:
{
  id v15 = a2;
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  if (a1)
  {
    uint64_t v32 = 0;
    v33 = &v32;
    uint64_t v34 = 0x3032000000;
    v35 = __Block_byref_object_copy__21;
    v36 = __Block_byref_object_dispose__21;
    id v37 = 0;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __152__CNChangesNotifierProxy_postNotificationName_fromSender_saveIdentifier_userInfo_shouldForwardExternally_calledFromNotifierQueue_isFromExternalProcess___block_invoke;
    aBlock[3] = &unk_1E56B7378;
    aBlock[4] = a1;
    id v25 = v15;
    id v26 = v16;
    char v30 = a8;
    char v31 = a6;
    id v27 = v17;
    v29 = &v32;
    id v28 = v18;
    id v19 = (void (**)(void))_Block_copy(aBlock);
    v20 = v19;
    if (a7)
    {
      v19[2](v19);
      objc_super v21 = _Block_copy((const void *)v33[5]);
    }
    else
    {
      dispatch_sync(*(dispatch_queue_t *)(a1 + 80), v19);
      uint64_t v22 = v33[5];
      if (v22) {
        (*(void (**)(void))(v22 + 16))();
      }
      objc_super v21 = 0;
    }

    _Block_object_dispose(&v32, 8);
  }
  else
  {
    objc_super v21 = 0;
  }

  return v21;
}

void __152__CNChangesNotifierProxy_postNotificationName_fromSender_saveIdentifier_userInfo_shouldForwardExternally_calledFromNotifierQueue_isFromExternalProcess___block_invoke(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    v3 = *(void **)(v2 + 64);
  }
  else {
    v3 = 0;
  }
  int v4 = [v3 containsObject:*(void *)(a1 + 40)];
  uint64_t v5 = *(void *)(a1 + 32);
  if (v4)
  {
    if (v5) {
      id v6 = *(void **)(v5 + 72);
    }
    else {
      id v6 = 0;
    }
    id v25 = [v6 objectForKeyedSubscript:*(void *)(a1 + 40)];
    if (!v25)
    {
      uint64_t v7 = [MEMORY[0x1E4F1CA80] set];
      uint64_t v8 = *(void *)(a1 + 32);
      if (v8) {
        id v9 = *(void **)(v8 + 72);
      }
      else {
        id v9 = 0;
      }
      id v25 = (id)v7;
      [v9 setObject:v7 forKeyedSubscript:*(void *)(a1 + 40)];
    }
    uint64_t v10 = [MEMORY[0x1E4F1CA60] dictionary];
    id v11 = v10;
    uint64_t v12 = *(void *)(a1 + 48);
    if (v12) {
      [v10 setObject:v12 forKey:@"CNNotificationSourcesKey"];
    }
    if (*(unsigned char *)(a1 + 80)) {
      [v11 setObject:MEMORY[0x1E4F1CC38] forKey:@"CNNotificationOriginationExternally"];
    }
    uint64_t v13 = *(void *)(a1 + 56);
    if (v13) {
      [v11 setObject:v13 forKey:@"CNNotificationSaveIdentifiersKey"];
    }
    [v25 addObject:v11];
  }
  else
  {
    if (v5) {
      id v14 = *(void **)(v5 + 32);
    }
    else {
      id v14 = 0;
    }
    id v15 = [v14 objectForKey:*(void *)(a1 + 40)];
    id v16 = v15;
    if (v15 && *(unsigned char *)(a1 + 81))
    {
      long long v28 = 0u;
      long long v29 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      id v17 = [v15 objectEnumerator];
      uint64_t v18 = [v17 countByEnumeratingWithState:&v26 objects:v30 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v27;
        do
        {
          for (uint64_t i = 0; i != v19; ++i)
          {
            if (*(void *)v27 != v20) {
              objc_enumerationMutation(v17);
            }
            (*(void (**)(void))(*(void *)(*((void *)&v26 + 1) + 8 * i) + 16))();
          }
          uint64_t v19 = [v17 countByEnumeratingWithState:&v26 objects:v30 count:16];
        }
        while (v19);
      }
    }
    uint64_t v22 = -[CNChangesNotifierProxy receiveNotificationName:fromSender:saveIdentifier:userInfo:calledFromNotifierQueue:isFromExternalProcess:](*(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), 1, *(unsigned __int8 *)(a1 + 80));
    uint64_t v23 = *(void *)(*(void *)(a1 + 72) + 8);
    v24 = *(void **)(v23 + 40);
    *(void *)(v23 + 40) = v22;
  }
}

- (id)receiveNotificationName:(void *)a3 fromSender:(void *)a4 saveIdentifier:(void *)a5 userInfo:(int)a6 calledFromNotifierQueue:(char)a7 isFromExternalProcess:
{
  id v13 = a2;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  if (a1)
  {
    uint64_t v40 = 0;
    v41 = &v40;
    uint64_t v42 = 0x3032000000;
    v43 = __Block_byref_object_copy__21;
    v44 = __Block_byref_object_dispose__21;
    id v45 = 0;
    id v17 = *(id *)(a1 + 48);
    uint64_t v18 = [v17 contactsLogger];

    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __131__CNChangesNotifierProxy_receiveNotificationName_fromSender_saveIdentifier_userInfo_calledFromNotifierQueue_isFromExternalProcess___block_invoke;
    v32[3] = &unk_1E56B7418;
    v32[4] = a1;
    id v33 = v13;
    v38 = &v40;
    id v34 = v14;
    id v35 = v15;
    id v36 = v16;
    char v39 = a7;
    id v19 = v18;
    id v37 = v19;
    uint64_t v20 = (void (**)(void))_Block_copy(v32);
    objc_super v21 = v20;
    if (a6)
    {
      v20[2](v20);
      uint64_t v22 = _Block_copy((const void *)v41[5]);
    }
    else
    {
      dispatch_sync(*(dispatch_queue_t *)(a1 + 80), v20);
      uint64_t v30 = v41[5];
      if (v30) {
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void))(v30 + 16))(v30, v23, v24, v25, v26, v27, v28, v29, v32[0]);
      }
      uint64_t v22 = 0;
    }

    _Block_object_dispose(&v40, 8);
  }
  else
  {
    uint64_t v22 = 0;
  }

  return v22;
}

- (void)removeAllRegisteredNotificationSources
{
  if (a1)
  {
    v1 = *(NSObject **)(a1 + 80);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __64__CNChangesNotifierProxy_removeAllRegisteredNotificationSources__block_invoke;
    block[3] = &unk_1E56B4530;
    block[4] = a1;
    dispatch_async(v1, block);
  }
}

void __64__CNChangesNotifierProxy_removeAllRegisteredNotificationSources__block_invoke(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    v3 = *(void **)(v2 + 24);
  }
  else {
    v3 = 0;
  }
  id obj = [v3 keyEnumerator];
  uint64_t v4 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v25;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v25 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(a1 + 32);
        if (v8) {
          id v9 = *(void **)(v8 + 24);
        }
        else {
          id v9 = 0;
        }
        uint64_t v10 = [v9 objectForKey:*(void *)(*((void *)&v24 + 1) + 8 * v7)];
        id v11 = v10;
        if (v10)
        {
          long long v22 = 0u;
          long long v23 = 0u;
          long long v20 = 0u;
          long long v21 = 0u;
          uint64_t v12 = [v10 objectEnumerator];
          uint64_t v13 = [v12 countByEnumeratingWithState:&v20 objects:v28 count:16];
          if (v13)
          {
            uint64_t v14 = v13;
            uint64_t v15 = *(void *)v21;
            do
            {
              for (uint64_t i = 0; i != v14; ++i)
              {
                if (*(void *)v21 != v15) {
                  objc_enumerationMutation(v12);
                }
                (*(void (**)(void))(*(void *)(*((void *)&v20 + 1) + 8 * i) + 16))();
              }
              uint64_t v14 = [v12 countByEnumeratingWithState:&v20 objects:v28 count:16];
            }
            while (v14);
          }
        }
        ++v7;
      }
      while (v7 != v5);
      uint64_t v17 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
      uint64_t v5 = v17;
    }
    while (v17);
  }

  uint64_t v18 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
  -[CNChangesNotifierProxy setRemovalBlocks:](*(void *)(a1 + 32), v18);
}

- (void)supressNotificationName:(uint64_t)a1
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (a1)
  {
    uint64_t v5 = *(NSObject **)(a1 + 80);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __50__CNChangesNotifierProxy_supressNotificationName___block_invoke;
    v6[3] = &unk_1E56B3DC8;
    v6[4] = a1;
    id v7 = v3;
    dispatch_sync(v5, v6);
  }
}

uint64_t __50__CNChangesNotifierProxy_supressNotificationName___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  if (v1) {
    v1 = (void *)v1[8];
  }
  return [v1 addObject:*(void *)(a1 + 40)];
}

- (void)stopSupressionOfNotificationName:(uint64_t)a1
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (a1)
  {
    uint64_t v10 = 0;
    id v11 = &v10;
    uint64_t v12 = 0x3032000000;
    uint64_t v13 = __Block_byref_object_copy__21;
    uint64_t v14 = __Block_byref_object_dispose__21;
    id v15 = 0;
    uint64_t v5 = *(NSObject **)(a1 + 80);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __59__CNChangesNotifierProxy_stopSupressionOfNotificationName___block_invoke;
    block[3] = &unk_1E56B4B18;
    block[4] = a1;
    id v8 = v3;
    id v9 = &v10;
    dispatch_sync(v5, block);
    uint64_t v6 = v11[5];
    if (v6) {
      (*(void (**)(void))(v6 + 16))();
    }

    _Block_object_dispose(&v10, 8);
  }
}

void __59__CNChangesNotifierProxy_stopSupressionOfNotificationName___block_invoke(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    id v3 = *(void **)(v2 + 64);
  }
  else {
    id v3 = 0;
  }
  [v3 removeObject:*(void *)(v1 + 40)];
  uint64_t v4 = *(void **)(v1 + 32);
  if (v4) {
    uint64_t v4 = (void *)v4[8];
  }
  id v33 = v4;
  if ([v33 countForObject:*(void *)(v1 + 40)])
  {
  }
  else
  {
    uint64_t v5 = *(void **)(v1 + 32);
    if (v5) {
      uint64_t v5 = (void *)v5[9];
    }
    uint64_t v6 = v5;
    id v7 = [v6 allKeys];
    int v8 = [v7 containsObject:*(void *)(v1 + 40)];

    if (v8)
    {
      uint64_t v9 = *(void *)(v1 + 32);
      if (v9) {
        uint64_t v10 = *(void **)(v9 + 72);
      }
      else {
        uint64_t v10 = 0;
      }
      id v11 = [v10 objectForKeyedSubscript:*(void *)(v1 + 40)];
      uint64_t v12 = *(void *)(v1 + 32);
      if (v12) {
        uint64_t v13 = *(void **)(v12 + 72);
      }
      else {
        uint64_t v13 = 0;
      }
      [v13 removeObjectForKey:*(void *)(v1 + 40)];
      uint64_t v14 = [MEMORY[0x1E4F1CA60] dictionary];
      id v34 = [MEMORY[0x1E4F1CA48] array];
      uint64_t v32 = [MEMORY[0x1E4F1CA48] array];
      long long v35 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      id v15 = [v11 objectEnumerator];
      uint64_t v16 = [v15 countByEnumeratingWithState:&v35 objects:v39 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v29 = v14;
        uint64_t v30 = v11;
        uint64_t v31 = v1;
        char v18 = 0;
        uint64_t v19 = *(void *)v36;
        do
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v36 != v19) {
              objc_enumerationMutation(v15);
            }
            long long v21 = *(void **)(*((void *)&v35 + 1) + 8 * i);
            long long v22 = [v21 objectForKeyedSubscript:@"CNNotificationOriginationExternally"];
            char v23 = [v22 BOOLValue];

            long long v24 = [v21 objectForKeyedSubscript:@"CNNotificationSourcesKey"];
            if (v24) {
              [v34 addObject:v24];
            }
            long long v25 = [v21 objectForKeyedSubscript:@"CNNotificationSaveIdentifiersKey"];
            if (v25) {
              [v32 addObject:v25];
            }
            v18 |= v23;
          }
          uint64_t v17 = [v15 countByEnumeratingWithState:&v35 objects:v39 count:16];
        }
        while (v17);

        id v11 = v30;
        uint64_t v1 = v31;
        uint64_t v14 = v29;
        if (v18) {
          [v29 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"CNNotificationOriginationExternally"];
        }
      }
      else
      {
      }
      [v14 setObject:v34 forKeyedSubscript:@"CNNotificationSourcesKey"];
      [v14 setObject:v32 forKeyedSubscript:@"CNNotificationSaveIdentifiersKey"];
      uint64_t v26 = -[CNChangesNotifierProxy postNotificationName:fromSender:saveIdentifier:userInfo:shouldForwardExternally:calledFromNotifierQueue:isFromExternalProcess:](*(void *)(v1 + 32), *(void **)(v1 + 40), 0, 0, v14, 1, 1, 0);
      uint64_t v27 = *(void *)(*(void *)(v1 + 48) + 8);
      uint64_t v28 = *(void **)(v27 + 40);
      *(void *)(v27 + 40) = v26;
    }
  }
}

- (void)receiveExternalNotificationName:(id)a3
{
  unint64_t v4 = (unint64_t)a3;
  if (!self) {
    goto LABEL_9;
  }
  uint64_t v5 = self->_coalescingNotificationName;
  if (!v5) {
    goto LABEL_9;
  }
  uint64_t v6 = v5;
  unint64_t v7 = self->_coalescingNotificationName;
  if (v4 | v7)
  {
    int v8 = (void *)v7;
    int v9 = [(NSString *)self->_coalescingNotificationName isEqual:v4];

    if (v9) {
      goto LABEL_6;
    }
LABEL_9:
    id v16 = -[CNChangesNotifierProxy receiveNotificationName:fromSender:saveIdentifier:userInfo:calledFromNotifierQueue:isFromExternalProcess:]((uint64_t)self, (void *)v4, 0, 0, 0, 0, 1);
    goto LABEL_10;
  }

LABEL_6:
  if (!self->_coalescingTimer)
  {
    objc_initWeak(&location, self);
    uint64_t v10 = self->_schedulerProvider;
    id v11 = objc_alloc(MEMORY[0x1E4F5A370]);
    [(CNChangesNotifierProxy *)self externalNotificationCoalescingDelay];
    double v13 = v12;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __58__CNChangesNotifierProxy_receiveExternalNotificationName___block_invoke;
    v17[3] = &unk_1E56B73A0;
    objc_copyWeak(&v19, &location);
    id v18 = (id)v4;
    uint64_t v14 = [(CNSchedulerProvider *)v10 mainThreadScheduler];
    id v15 = (void *)[v11 initWithDelay:1 options:v17 block:v10 schedulerProvider:v14 downstreamScheduler:v13];
    -[CNChangesNotifierProxy setCoalescingTimer:]((uint64_t)self, v15);

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }
  [(CNCoalescingTimer *)self->_coalescingTimer handleEvent];
LABEL_10:
}

void __58__CNChangesNotifierProxy_receiveExternalNotificationName___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = -[CNChangesNotifierProxy receiveNotificationName:fromSender:saveIdentifier:userInfo:calledFromNotifierQueue:isFromExternalProcess:]((uint64_t)WeakRetained, *(void **)(a1 + 32), 0, 0, 0, 0, 1);
}

- (void)setCoalescingTimer:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 88), a2);
  }
}

- (void)receiveNotificationName:(id)a3 fromSender:(id)a4 saveIdentifier:(id)a5 userInfo:(id)a6 isFromExternalProcess:(BOOL)a7
{
  id v7 = -[CNChangesNotifierProxy receiveNotificationName:fromSender:saveIdentifier:userInfo:calledFromNotifierQueue:isFromExternalProcess:]((uint64_t)self, a3, a4, a5, a6, 0, a7);
}

void __131__CNChangesNotifierProxy_receiveNotificationName_fromSender_saveIdentifier_userInfo_calledFromNotifierQueue_isFromExternalProcess___block_invoke(uint64_t a1)
{
  v26[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    id v3 = *(void **)(v2 + 56);
  }
  else {
    id v3 = 0;
  }
  unint64_t v4 = [v3 objectForKey:*(void *)(a1 + 40)];
  uint64_t v5 = *(void **)(a1 + 32);
  if (v4)
  {
    uint64_t v6 = -[CNChangesNotifierProxy receiveNotificationName:fromSender:saveIdentifier:userInfo:calledFromNotifierQueue:isFromExternalProcess:](v5, v4, *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), 1, *(unsigned __int8 *)(a1 + 88));
LABEL_9:
    uint64_t v7 = *(void *)(*(void *)(a1 + 80) + 8);
    int v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;

    goto LABEL_10;
  }
  if (v5) {
    uint64_t v5 = (void *)v5[8];
  }
  if ([v5 containsObject:*(void *)(a1 + 40)])
  {
    uint64_t v6 = -[CNChangesNotifierProxy postNotificationName:fromSender:saveIdentifier:userInfo:shouldForwardExternally:calledFromNotifierQueue:isFromExternalProcess:](*(void *)(a1 + 32), *(void **)(a1 + 40), *(void **)(a1 + 48), *(void **)(a1 + 56), *(void **)(a1 + 64), 0, 1, *(unsigned char *)(a1 + 88));
    goto LABEL_9;
  }
  id v9 = *(id *)(a1 + 48);
  id v10 = *(id *)(a1 + 64);
  if (v10)
  {
    id v11 = v10;
  }
  else
  {
    double v12 = [MEMORY[0x1E4F1CA60] dictionary];
    id v11 = v12;
    if (*(unsigned char *)(a1 + 88)) {
      [v12 setObject:MEMORY[0x1E4F1CC38] forKey:@"CNNotificationOriginationExternally"];
    }
    if (v9)
    {
      v26[0] = v9;
      double v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:1];
      [v11 setObject:v13 forKey:@"CNNotificationSourcesKey"];
    }
    else
    {
      [v11 setObject:MEMORY[0x1E4F1CBF0] forKey:@"CNNotificationSourcesKey"];
    }
    if (*(void *)(a1 + 56))
    {
      uint64_t v25 = *(void *)(a1 + 56);
      uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v25 count:1];
      [v11 setObject:v14 forKey:@"CNNotificationSaveIdentifiersKey"];
    }
    else
    {
      [v11 setObject:MEMORY[0x1E4F1CBF0] forKey:@"CNNotificationSaveIdentifiersKey"];
    }

    id v9 = 0;
  }
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __131__CNChangesNotifierProxy_receiveNotificationName_fromSender_saveIdentifier_userInfo_calledFromNotifierQueue_isFromExternalProcess___block_invoke_2;
  v20[3] = &unk_1E56B73F0;
  id v21 = *(id *)(a1 + 72);
  id v22 = *(id *)(a1 + 40);
  id v23 = v9;
  id v24 = v11;
  id v15 = v11;
  id v16 = v9;
  uint64_t v17 = [v20 copy];
  uint64_t v18 = *(void *)(*(void *)(a1 + 80) + 8);
  id v19 = *(void **)(v18 + 40);
  *(void *)(v18 + 40) = v17;

LABEL_10:
}

void __131__CNChangesNotifierProxy_receiveNotificationName_fromSender_saveIdentifier_userInfo_calledFromNotifierQueue_isFromExternalProcess___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __131__CNChangesNotifierProxy_receiveNotificationName_fromSender_saveIdentifier_userInfo_calledFromNotifierQueue_isFromExternalProcess___block_invoke_3;
  v3[3] = &unk_1E56B73C8;
  id v4 = v2;
  id v5 = *(id *)(a1 + 40);
  id v6 = *(id *)(a1 + 48);
  id v7 = *(id *)(a1 + 56);
  [v4 postingNotification:v3];
}

void __131__CNChangesNotifierProxy_receiveNotificationName_fromSender_saveIdentifier_userInfo_calledFromNotifierQueue_isFromExternalProcess___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) postingNotificationWithName:*(void *)(a1 + 40)];
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:*(void *)(a1 + 40) object:*(void *)(a1 + 48) userInfo:*(void *)(a1 + 56)];
}

- (void)waitForCurrentTasksToFinish
{
}

- (BOOL)forwardsSelfGeneratedDistributedSaveNotifications
{
  return self->forwardsSelfGeneratedDistributedSaveNotifications;
}

- (void)setForwardsSelfGeneratedDistributedSaveNotifications:(BOOL)a3
{
  self->forwardsSelfGeneratedDistributedSaveNotifications = a3;
}

- (double)externalNotificationCoalescingDelay
{
  return self->_externalNotificationCoalescingDelay;
}

- (void)setExternalNotificationCoalescingDelay:(double)a3
{
  self->_externalNotificationCoalescingDelay = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coalescingNotificationName, 0);
  objc_storeStrong((id *)&self->_coalescingTimer, 0);
  objc_storeStrong((id *)&self->_notifierQueue, 0);
  objc_storeStrong((id *)&self->_notificationsToBeSentOnceAllowed, 0);
  objc_storeStrong((id *)&self->_supressedNotificationNames, 0);
  objc_storeStrong((id *)&self->_notificationForwardingMapping, 0);
  objc_storeStrong((id *)&self->_loggerProvider, 0);
  objc_storeStrong((id *)&self->_schedulerProvider, 0);
  objc_storeStrong((id *)&self->_notifyingBlocks, 0);

  objc_storeStrong((id *)&self->_removalBlocks, 0);
}

@end