@interface IMMultiQueue
- (BOOL)_addBlock:(id)a3 withGUID:(id)a4 forKey:(id)a5 description:(id)a6;
- (BOOL)addBlock:(id)a3 forKey:(id)a4 description:(id)a5;
- (BOOL)addBlock:(id)a3 withTimeout:(double)a4 forKey:(id)a5 description:(id)a6;
- (IMMultiQueue)init;
- (IMMultiQueue)initWithQueue:(id)a3;
- (id)loggableOverview;
- (id)loggableOverviewForKey:(id)a3;
- (void)_popEnqueuedBlockWithGUID:(id)a3 key:(id)a4;
@end

@implementation IMMultiQueue

- (IMMultiQueue)init
{
  return (IMMultiQueue *)objc_msgSend_initWithQueue_(self, a2, MEMORY[0x1E4F14428], v2);
}

- (IMMultiQueue)initWithQueue:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IMMultiQueue;
  v6 = [(IMMultiQueue *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_queue, a3);
  }

  return v7;
}

- (void)_popEnqueuedBlockWithGUID:(id)a3 key:(id)a4
{
  id v37 = a4;
  queueMap = self->_queueMap;
  id v7 = a3;
  v10 = objc_msgSend_objectForKey_(queueMap, v8, (uint64_t)v37, v9);
  v14 = objc_msgSend_lastObject(v10, v11, v12, v13);
  objc_msgSend_GUID(v14, v15, v16, v17);
  id v18 = (id)objc_claimAutoreleasedReturnValue();

  if (v18 == v7)
  {
    objc_msgSend_removeLastObject(v10, v19, v20, v21);
    if (objc_msgSend_count(v10, v22, v23, v24))
    {
      v28 = objc_msgSend_lastObject(v10, v25, v26, v27);
      objc_msgSend_block(v28, v29, v30, v31);
      v32 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      v32[2]();
    }
    else
    {
      objc_msgSend_removeObjectForKey_(self->_queueMap, v25, (uint64_t)v37, v27);
    }
    if (!objc_msgSend_count(self->_queueMap, v33, v34, v35))
    {
      v36 = self->_queueMap;
      self->_queueMap = 0;
    }
  }
}

- (BOOL)addBlock:(id)a3 withTimeout:(double)a4 forKey:(id)a5 description:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  char v16 = 0;
  if (v10 && v11)
  {
    uint64_t v17 = objc_msgSend_copyStringGUID(NSString, v13, v14, v15);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = sub_1918D9768;
    aBlock[3] = &unk_1E57246F0;
    aBlock[4] = self;
    id v24 = v17;
    id v18 = v11;
    id v25 = v18;
    double v27 = a4;
    id v26 = v10;
    id v19 = v17;
    uint64_t v20 = _Block_copy(aBlock);
    char v16 = objc_msgSend__addBlock_withGUID_forKey_description_(self, v21, (uint64_t)v20, (uint64_t)v19, v18, v12);
  }
  return v16;
}

- (BOOL)addBlock:(id)a3 forKey:(id)a4 description:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  char v14 = 0;
  if (v8 && v9)
  {
    uint64_t v15 = objc_msgSend_copyStringGUID(NSString, v11, v12, v13);
    uint64_t v21 = MEMORY[0x1E4F143A8];
    uint64_t v22 = 3221225472;
    uint64_t v23 = sub_1918D9B10;
    id v24 = &unk_1E5724718;
    id v25 = self;
    id v26 = v15;
    id v16 = v9;
    id v27 = v16;
    id v28 = v8;
    id v17 = v15;
    id v18 = _Block_copy(&v21);
    char v14 = objc_msgSend__addBlock_withGUID_forKey_description_(self, v19, (uint64_t)v18, (uint64_t)v17, v16, v10, v21, v22, v23, v24, v25);
  }
  return v14;
}

- (BOOL)_addBlock:(id)a3 withGUID:(id)a4 forKey:(id)a5 description:(id)a6
{
  id v10 = (void (**)(void))a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  objc_msgSend_objectForKey_(self->_queueMap, v14, (uint64_t)v12, v15);
  id v19 = (id)objc_claimAutoreleasedReturnValue();
  if (!v19)
  {
    if (!self->_queueMap)
    {
      Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
      queueMap = self->_queueMap;
      self->_queueMap = Mutable;
    }
    id v19 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    objc_msgSend_setObject_forKey_(self->_queueMap, v22, (uint64_t)v19, (uint64_t)v12);
  }
  uint64_t v26 = objc_msgSend_count(v19, v16, v17, v18);
  if (v26)
  {
    id v27 = (const void *)objc_msgSend_copy(v10, v23, v24, v25);

    id v28 = [IMMultiQueueItem alloc];
    v29 = _Block_copy(v27);
    uint64_t v31 = objc_msgSend_initWithBlock_GUID_description_(v28, v30, (uint64_t)v29, (uint64_t)v11, v13);

    objc_msgSend_insertObject_atIndex_(v19, v32, (uint64_t)v31, 0);
    id v10 = (void (**)(void))v27;
  }
  else
  {
    v33 = [IMMultiQueueItem alloc];
    uint64_t v31 = objc_msgSend_initWithBlock_GUID_description_(v33, v34, 0, (uint64_t)v11, v13);
    objc_msgSend_insertObject_atIndex_(v19, v35, (uint64_t)v31, 0);
    v10[2](v10);
  }

  return v26 != 0;
}

- (id)loggableOverview
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = (void *)MEMORY[0x1E4F1CA48];
  uint64_t v6 = objc_msgSend_count(self->_queueMap, a2, v2, v3);
  id v9 = objc_msgSend_arrayWithCapacity_(v5, v7, v6, v8);
  id v10 = (void *)MEMORY[0x192FDE5A0]();
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v11 = self->_queueMap;
  uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v12, (uint64_t)&v23, (uint64_t)v27, 16);
  if (v13)
  {
    uint64_t v16 = v13;
    uint64_t v17 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v24 != v17) {
          objc_enumerationMutation(v11);
        }
        id v19 = objc_msgSend_loggableOverviewForKey_(self, v14, *(void *)(*((void *)&v23 + 1) + 8 * i), v15, (void)v23);
        objc_msgSend_addObject_(v9, v20, (uint64_t)v19, v21);
      }
      uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v14, (uint64_t)&v23, (uint64_t)v27, 16);
    }
    while (v16);
  }

  return v9;
}

- (id)loggableOverviewForKey:(id)a3
{
  queueMap = self->_queueMap;
  id v4 = a3;
  id v7 = objc_msgSend_objectForKey_(queueMap, v5, (uint64_t)v4, v6);
  id v8 = [NSString alloc];
  uint64_t v12 = objc_msgSend_count(v7, v9, v10, v11);
  uint64_t v16 = objc_msgSend_lastObject(v7, v13, v14, v15);
  uint64_t v20 = objc_msgSend_describer(v16, v17, v18, v19);
  long long v23 = objc_msgSend_initWithFormat_(v8, v21, @"<%@  ->  count: %ld,  current: %@>", v22, v4, v12, v20);

  return v23;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_queueMap, 0);
}

@end