@interface CKPKPushRegistry
+ (id)sharedPushRegistry;
- (NSHashTable)delegates;
- (PKPushRegistry)pushRegistry;
- (id)initInternal;
- (void)addDelegate:(id)a3;
- (void)pushRegistry:(id)a3 didReceiveIncomingPushWithPayload:(id)a4 forType:(id)a5 withCompletionHandler:(id)a6;
- (void)removeDelegate:(id)a3;
@end

@implementation CKPKPushRegistry

- (id)initInternal
{
  v22.receiver = self;
  v22.super_class = (Class)CKPKPushRegistry;
  v5 = [(CKPKPushRegistry *)&v22 init];
  if (v5)
  {
    uint64_t v6 = objc_msgSend_weakObjectsHashTable(MEMORY[0x1E4F28D30], v2, v3, v4);
    delegates = v5->_delegates;
    v5->_delegates = (NSHashTable *)v6;

    id v8 = objc_alloc(MEMORY[0x1E4F39AB0]);
    v9 = CKGetGlobalQueue(-1);
    uint64_t v12 = objc_msgSend_initWithQueue_(v8, v10, (uint64_t)v9, v11);
    pushRegistry = v5->_pushRegistry;
    v5->_pushRegistry = (PKPushRegistry *)v12;

    objc_msgSend_setDelegate_(v5->_pushRegistry, v14, (uint64_t)v5, v15);
    v18 = objc_msgSend_setWithObject_(MEMORY[0x1E4F1CAD0], v16, *MEMORY[0x1E4F39AC8], v17);
    objc_msgSend_setDesiredPushTypes_(v5->_pushRegistry, v19, (uint64_t)v18, v20);
  }
  return v5;
}

+ (id)sharedPushRegistry
{
  if (qword_1EB279C48 != -1) {
    dispatch_once(&qword_1EB279C48, &unk_1ED7EF198);
  }
  v2 = (void *)qword_1EB279C50;

  return v2;
}

- (void)addDelegate:(id)a3
{
  id v11 = a3;
  uint64_t v4 = self;
  objc_sync_enter(v4);
  id v8 = objc_msgSend_delegates(v4, v5, v6, v7);
  objc_msgSend_addObject_(v8, v9, (uint64_t)v11, v10);

  objc_sync_exit(v4);
}

- (void)removeDelegate:(id)a3
{
  id v11 = a3;
  uint64_t v4 = self;
  objc_sync_enter(v4);
  id v8 = objc_msgSend_delegates(v4, v5, v6, v7);
  objc_msgSend_removeObject_(v8, v9, (uint64_t)v11, v10);

  objc_sync_exit(v4);
}

- (void)pushRegistry:(id)a3 didReceiveIncomingPushWithPayload:(id)a4 forType:(id)a5 withCompletionHandler:(id)a6
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v33 = a3;
  id v10 = a4;
  id v34 = a5;
  v35 = (void (**)(void))a6;
  id v11 = self;
  objc_sync_enter(v11);
  uint64_t v15 = objc_msgSend_delegates(v11, v12, v13, v14);
  v19 = objc_msgSend_allObjects(v15, v16, v17, v18);

  objc_sync_exit(v11);
  if (objc_msgSend_count(v19, v20, v21, v22))
  {
    v23 = dispatch_group_create();
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id v24 = v19;
    uint64_t v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v24, v25, (uint64_t)&v40, (uint64_t)v44, 16);
    if (v26)
    {
      uint64_t v27 = *(void *)v41;
      do
      {
        for (uint64_t i = 0; i != v26; ++i)
        {
          if (*(void *)v41 != v27) {
            objc_enumerationMutation(v24);
          }
          v29 = *(void **)(*((void *)&v40 + 1) + 8 * i);
          dispatch_group_enter(v23);
          v38[0] = MEMORY[0x1E4F143A8];
          v38[1] = 3221225472;
          v38[2] = sub_18B0B1FBC;
          v38[3] = &unk_1E5460350;
          v39 = v23;
          objc_msgSend_didReceiveIncomingPushWithPayload_withCompletionHandler_(v29, v30, (uint64_t)v10, (uint64_t)v38);
        }
        uint64_t v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v24, v31, (uint64_t)&v40, (uint64_t)v44, 16);
      }
      while (v26);
    }

    v32 = CKGetGlobalQueue(-1);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_18B0B1FC4;
    block[3] = &unk_1E5462200;
    v37 = v35;
    dispatch_group_notify(v23, v32, block);
  }
  else if (v35)
  {
    v35[2]();
  }
}

- (NSHashTable)delegates
{
  return self->_delegates;
}

- (PKPushRegistry)pushRegistry
{
  return self->_pushRegistry;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pushRegistry, 0);

  objc_storeStrong((id *)&self->_delegates, 0);
}

@end