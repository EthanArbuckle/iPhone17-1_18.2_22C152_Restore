@interface CKDCancelTokenGroup
- (CKDCancelTokenGroup)init;
- (NSMutableArray)cancelTokens;
- (void)addCancelToken:(id)a3 withOperation:(id)a4;
- (void)cancel;
- (void)removeAllCancelTokens;
- (void)removeCancelToken:(id)a3;
- (void)setCancelTokens:(id)a3;
@end

@implementation CKDCancelTokenGroup

- (CKDCancelTokenGroup)init
{
  v6.receiver = self;
  v6.super_class = (Class)CKDCancelTokenGroup;
  v2 = [(CKDCancelTokenGroup *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    cancelTokens = v2->_cancelTokens;
    v2->_cancelTokens = v3;
  }
  return v2;
}

- (void)addCancelToken:(id)a3 withOperation:(id)a4
{
  id v18 = a3;
  id v8 = a4;
  if (v18)
  {
    if (objc_msgSend_isCancelled(v8, v6, v7)) {
      goto LABEL_4;
    }
    v11 = objc_msgSend_cancelTokens(self, v9, v10);
    objc_sync_enter(v11);
    v14 = objc_msgSend_cancelTokens(self, v12, v13);
    objc_msgSend_addObject_(v14, v15, (uint64_t)v18);

    objc_sync_exit(v11);
    if (objc_msgSend_isCancelled(v8, v16, v17)) {
LABEL_4:
    }
      objc_msgSend_cancel(v18, v9, v10);
  }
}

- (void)removeCancelToken:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v12 = v4;
    uint64_t v7 = objc_msgSend_cancelTokens(self, v5, v6);
    objc_sync_enter(v7);
    uint64_t v10 = objc_msgSend_cancelTokens(self, v8, v9);
    objc_msgSend_removeObject_(v10, v11, (uint64_t)v12);

    objc_sync_exit(v7);
    id v4 = v12;
  }
}

- (void)removeAllCancelTokens
{
  objc_msgSend_cancelTokens(self, a2, v2);
  id obj = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(obj);
  uint64_t v6 = objc_msgSend_cancelTokens(self, v4, v5);
  objc_msgSend_removeAllObjects(v6, v7, v8);

  objc_sync_exit(obj);
}

- (void)cancel
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = objc_msgSend_cancelTokens(self, a2, v2);
  objc_sync_enter(v4);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v7 = objc_msgSend_cancelTokens(self, v5, v6, 0);
  uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v19, v23, 16);
  if (v11)
  {
    uint64_t v12 = *(void *)v20;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v20 != v12) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend_cancel(*(void **)(*((void *)&v19 + 1) + 8 * v13++), v9, v10);
      }
      while (v11 != v13);
      uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v9, (uint64_t)&v19, v23, 16);
    }
    while (v11);
  }

  v16 = objc_msgSend_cancelTokens(self, v14, v15);
  objc_msgSend_removeAllObjects(v16, v17, v18);

  objc_sync_exit(v4);
}

- (NSMutableArray)cancelTokens
{
  return self->_cancelTokens;
}

- (void)setCancelTokens:(id)a3
{
}

- (void).cxx_destruct
{
}

@end