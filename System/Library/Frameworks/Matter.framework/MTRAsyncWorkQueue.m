@interface MTRAsyncWorkQueue
- (BOOL)hasDuplicateForTypeID:(unint64_t)a3 workItemData:(id)a4;
- (MTRAsyncWorkQueue)initWithContext:(id)a3;
- (MTRAsyncWorkQueue)initWithContext:(id)a3 width:(unint64_t)a4;
- (id)description;
- (unint64_t)itemCount;
- (void)enqueueWorkItem:(id)a3;
- (void)enqueueWorkItem:(id)a3 description:(id)a4;
- (void)enqueueWorkItem:(id)a3 descriptionWithFormat:(id)a4;
- (void)invalidate;
@end

@implementation MTRAsyncWorkQueue

- (MTRAsyncWorkQueue)initWithContext:(id)a3
{
  return (MTRAsyncWorkQueue *)objc_msgSend_initWithContext_width_(self, a2, (uint64_t)a3, 1);
}

- (MTRAsyncWorkQueue)initWithContext:(id)a3 width:(unint64_t)a4
{
  id v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)MTRAsyncWorkQueue;
  v7 = [(MTRAsyncWorkQueue *)&v14 init];
  v8 = v7;
  if (v7)
  {
    objc_storeWeak(&v7->_context, v6);
    uint64_t v11 = objc_msgSend_array(MEMORY[0x263EFF980], v9, v10);
    items = v8->_items;
    v8->_items = (NSMutableArray *)v11;

    v8->_width = a4;
  }

  return v8;
}

- (id)description
{
  sub_244C9B718((uint64_t)&v12, (os_unfair_lock *)self);
  os_unfair_lock_lock(&self->_lock);
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = v13;
  uint64_t v8 = objc_msgSend_count(self->_items, v6, v7);
  uint64_t v10 = objc_msgSend_stringWithFormat_(v3, v9, @"<%@ context: %@, items count: %lu>", v4, v5, v8);
  os_unfair_lock_unlock(&self->_lock);

  return v10;
}

- (void)enqueueWorkItem:(id)a3
{
}

- (void)enqueueWorkItem:(id)a3 descriptionWithFormat:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [NSString alloc];
  uint64_t v10 = objc_msgSend_initWithFormat_arguments_(v8, v9, (uint64_t)v7, &v12);
  objc_msgSend_enqueueWorkItem_description_(self, v11, (uint64_t)v6, v10);
}

- (void)enqueueWorkItem:(id)a3 description:(id)a4
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  sub_244C9B718((uint64_t)&v29, (os_unfair_lock *)self);
  os_unfair_lock_lock(&self->_lock);
  if (v6) {
    v6[2] = 2;
  }
  objc_msgSend_addObject_(self->_items, v8, (uint64_t)v6);
  if (v7)
  {
    v9 = sub_244CC8484(0, "NotSpecified");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = v30;
      uint64_t v13 = objc_msgSend_count(self->_items, v10, v11);
      uint64_t v16 = objc_msgSend_uniqueID(v6, v14, v15);
      *(_DWORD *)buf = 138413058;
      id v32 = v12;
      __int16 v33 = 2048;
      uint64_t v34 = v13;
      __int16 v35 = 2048;
      uint64_t v36 = v16;
      __int16 v37 = 2112;
      id v38 = v7;
      _os_log_impl(&dword_2446BD000, v9, OS_LOG_TYPE_DEFAULT, "MTRAsyncWorkQueue<%@, items count: %lu> enqueued work item [%llu]: %@", buf, 0x2Au);
    }

    if (sub_244CC4E58(2u))
    {
LABEL_11:
      objc_msgSend_count(self->_items, v17, v18);
      objc_msgSend_uniqueID(v6, v27, v28);
      sub_244CC4DE0(0, 2);
    }
  }
  else
  {
    v19 = sub_244CC8484(0, "NotSpecified");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      id v22 = v30;
      uint64_t v23 = objc_msgSend_count(self->_items, v20, v21);
      uint64_t v26 = objc_msgSend_uniqueID(v6, v24, v25);
      *(_DWORD *)buf = 138412802;
      id v32 = v22;
      __int16 v33 = 2048;
      uint64_t v34 = v23;
      __int16 v35 = 2048;
      uint64_t v36 = v26;
      _os_log_impl(&dword_2446BD000, v19, OS_LOG_TYPE_DEFAULT, "MTRAsyncWorkQueue<%@, items count: %lu> enqueued work item [%llu]", buf, 0x20u);
    }

    if (sub_244CC4E58(2u)) {
      goto LABEL_11;
    }
  }
  sub_244C9A998((uint64_t)self, (uint64_t)&v29);
  os_unfair_lock_unlock(&self->_lock);
}

- (void)invalidate
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  sub_244C9B718((uint64_t)&v22, (os_unfair_lock *)self);
  os_unfair_lock_lock(&self->_lock);
  v3 = sub_244CC8484(0, "NotSpecified");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = v23;
    uint64_t v7 = objc_msgSend_count(self->_items, v4, v5);
    *(_DWORD *)buf = 138412546;
    id v26 = v6;
    __int16 v27 = 2048;
    uint64_t v28 = v7;
    _os_log_impl(&dword_2446BD000, v3, OS_LOG_TYPE_DEFAULT, "MTRAsyncWorkQueue<%@> invalidate %lu items", buf, 0x16u);
  }

  if (sub_244CC4E58(2u))
  {
    objc_msgSend_count(self->_items, v8, v9);
    sub_244CC4DE0(0, 2);
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v10 = self->_items;
  uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, (uint64_t)&v18, v24, 16);
  if (v12)
  {
    uint64_t v13 = *(void *)v19;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v10);
        }
        sub_244C9A208(*(void *)(*((void *)&v18 + 1) + 8 * v14++));
      }
      while (v12 != v14);
      uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v15, (uint64_t)&v18, v24, 16);
    }
    while (v12);
  }

  objc_msgSend_removeAllObjects(self->_items, v16, v17);
  os_unfair_lock_unlock(&self->_lock);
}

- (BOOL)hasDuplicateForTypeID:(unint64_t)a3 workItemData:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = a4;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v10 = objc_msgSend_reverseObjectEnumerator(self->_items, v8, v9);
  uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, (uint64_t)&v24, v28, 16);
  if (v14)
  {
    uint64_t v15 = *(void *)v25;
    while (2)
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v25 != v15) {
          objc_enumerationMutation(v10);
        }
        uint64_t v17 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        objc_msgSend_duplicateCheckHandler(v17, v12, v13);
        long long v20 = (void (**)(void, void, void, void))objc_claimAutoreleasedReturnValue();
        if (v20)
        {
          if (objc_msgSend_duplicateTypeID(v17, v18, v19) == a3)
          {
            __int16 v23 = 0;
            ((void (**)(void, id, __int16 *, char *))v20)[2](v20, v6, &v23, (char *)&v23 + 1);
            if (HIBYTE(v23))
            {
              BOOL v21 = (_BYTE)v23 != 0;

              goto LABEL_13;
            }
          }
        }
      }
      uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v12, (uint64_t)&v24, v28, 16);
      if (v14) {
        continue;
      }
      break;
    }
  }
  BOOL v21 = 0;
LABEL_13:

  os_unfair_lock_unlock(p_lock);
  return v21;
}

- (unint64_t)itemCount
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  unint64_t v6 = objc_msgSend_count(self->_items, v4, v5);
  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);

  objc_destroyWeak(&self->_context);
}

@end