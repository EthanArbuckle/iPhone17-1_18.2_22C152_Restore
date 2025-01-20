@interface FTMessageQueue
- (BOOL)addMessage:(id)a3;
- (BOOL)addMessageAtHeadOfQueue:(id)a3;
- (BOOL)removeMessage:(id)a3;
- (FTMessageQueue)init;
- (FTMessageQueueDelegate)delegate;
- (IDSBaseMessage)topMessage;
- (NSArray)messages;
- (NSMutableArray)_addDates;
- (NSMutableArray)_queue;
- (id)dequeueTopMessage;
- (id)messageForUniqueID:(unint64_t)a3;
- (int64_t)count;
- (void)_clearTimeout;
- (void)_setTimeout;
- (void)_timeoutHit;
- (void)removeAllMessages;
- (void)setDelegate:(id)a3;
- (void)set_addDates:(id)a3;
- (void)set_queue:(id)a3;
@end

@implementation FTMessageQueue

- (FTMessageQueue)init
{
  v9.receiver = self;
  v9.super_class = (Class)FTMessageQueue;
  v2 = [(FTMessageQueue *)&v9 init];
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F59DF8]);
    v4 = im_primary_queue();
    uint64_t v6 = objc_msgSend_initWithCapacity_queue_block_(v3, v5, 1, v4, &unk_1EFE07820);
    timeoutTask = v2->_timeoutTask;
    v2->_timeoutTask = (CUTDeferredTaskQueue *)v6;
  }
  return v2;
}

- (IDSBaseMessage)topMessage
{
  v4 = objc_msgSend_count(self->_queue, a2, v2);
  if (v4)
  {
    v4 = objc_msgSend_objectAtIndex_(self->_queue, v5, 0);
  }

  return (IDSBaseMessage *)v4;
}

- (NSArray)messages
{
  return (NSArray *)self->_queue;
}

- (int64_t)count
{
  return objc_msgSend_count(self->_queue, a2, v2);
}

- (void)_clearTimeout
{
}

- (void)_setTimeout
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  objc_msgSend__clearTimeout(self, a2, v2);
  v8 = objc_msgSend_topMessage(self, v4, v5);
  if (v8)
  {
    objc_super v9 = objc_msgSend_delegate(self, v6, v7);

    if (v9)
    {
      v11 = objc_msgSend_objectAtIndex_(self->_addDates, v10, 0);
      objc_msgSend_timeIntervalSinceNow(v11, v12, v13);
      double v15 = fabs(v14);
      objc_msgSend_timeout(v8, v16, v17);
      double v20 = v19 - v15;
      if (v20 <= 0.0)
      {
        double v21 = 0.1;
        objc_msgSend_enqueueExecutionWithTarget_afterDelay_(self->_timeoutTask, v18, (uint64_t)self, 0.1);
      }
      else
      {
        double v21 = v20;
        objc_msgSend_enqueueExecutionWithTarget_afterDelay_(self->_timeoutTask, v18, (uint64_t)self, v20);
      }
      v24 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v22, v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        v27 = objc_msgSend_topMessage(self, v25, v26);
        int v28 = 134218242;
        double v29 = v21;
        __int16 v30 = 2112;
        v31 = v27;
        _os_log_impl(&dword_1A7BC0000, v24, OS_LOG_TYPE_DEFAULT, "Setting timeout for %f seconds from now  (Message: %@)", (uint8_t *)&v28, 0x16u);
      }
    }
  }
}

- (void)_timeoutHit
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v4 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], a2, v2);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = objc_msgSend_topMessage(self, v5, v6);
    int v19 = 138412290;
    double v20 = v7;
    _os_log_impl(&dword_1A7BC0000, v4, OS_LOG_TYPE_DEFAULT, "Queue timeout hit for message: %@", (uint8_t *)&v19, 0xCu);
  }
  v10 = objc_msgSend_delegate(self, v8, v9);
  uint64_t v13 = objc_msgSend_topMessage(self, v11, v12);
  objc_msgSend_queue_hitTimeoutForMessage_(v10, v14, (uint64_t)self, v13);

  if (objc_msgSend_count(self->_queue, v15, v16)) {
    objc_msgSend__setTimeout(self, v17, v18);
  }
}

- (void)removeAllMessages
{
  objc_msgSend__clearTimeout(self, a2, v2);
  objc_msgSend_removeAllObjects(self->_addDates, v4, v5);
  objc_msgSend_removeAllObjects(self->_queue, v6, v7);
  if (!objc_msgSend_count(self->_queue, v8, v9))
  {
    queue = self->_queue;
    self->_queue = 0;
  }
  if (!objc_msgSend_count(self->_addDates, v10, v11))
  {
    addDates = self->_addDates;
    self->_addDates = 0;
  }
}

- (id)dequeueTopMessage
{
  if (objc_msgSend_count(self->_queue, a2, v2))
  {
    uint64_t v5 = objc_msgSend_objectAtIndex_(self->_queue, v4, 0);
    objc_msgSend__clearTimeout(self, v6, v7);
    objc_msgSend_removeObjectAtIndex_(self->_queue, v8, 0);
    objc_msgSend_removeObjectAtIndex_(self->_addDates, v9, 0);
    if (objc_msgSend_count(self->_queue, v10, v11)) {
      objc_msgSend__setTimeout(self, v12, v13);
    }
    if (!objc_msgSend_count(self->_queue, v12, v13))
    {
      queue = self->_queue;
      self->_queue = 0;
    }
    if (!objc_msgSend_count(self->_addDates, v14, v15))
    {
      addDates = self->_addDates;
      self->_addDates = 0;
    }
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (id)messageForUniqueID:(unint64_t)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v4 = objc_msgSend_copy(self->_queue, a2, a3, 0);
  uint64_t v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v15, v19, 16);
  if (v6)
  {
    uint64_t v9 = v6;
    uint64_t v10 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v4);
        }
        uint64_t v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if (objc_msgSend_uniqueID(v12, v7, v8) == a3)
        {
          id v13 = v12;
          goto LABEL_11;
        }
      }
      uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v7, (uint64_t)&v15, v19, 16);
      if (v9) {
        continue;
      }
      break;
    }
  }
  id v13 = 0;
LABEL_11:

  return v13;
}

- (BOOL)addMessage:(id)a3
{
  id v5 = a3;
  if (!self->_queue)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    queue = self->_queue;
    self->_queue = v6;
  }
  if (!self->_addDates)
  {
    uint64_t v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    addDates = self->_addDates;
    self->_addDates = v8;
  }
  objc_msgSend_addObject_(self->_queue, v4, (uint64_t)v5);
  uint64_t v10 = self->_addDates;
  id v13 = objc_msgSend_date(MEMORY[0x1E4F1C9C8], v11, v12);
  objc_msgSend_addObject_(v10, v14, (uint64_t)v13);

  if (objc_msgSend_count(self->_queue, v15, v16) == 1) {
    objc_msgSend__setTimeout(self, v17, v18);
  }

  return 1;
}

- (BOOL)addMessageAtHeadOfQueue:(id)a3
{
  id v5 = a3;
  if (!self->_queue)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    queue = self->_queue;
    self->_queue = v6;
  }
  if (!self->_addDates)
  {
    uint64_t v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    addDates = self->_addDates;
    self->_addDates = v8;
  }
  objc_msgSend_insertObject_atIndex_(self->_queue, v4, (uint64_t)v5, 0);
  uint64_t v10 = self->_addDates;
  id v13 = objc_msgSend_date(MEMORY[0x1E4F1C9C8], v11, v12);
  objc_msgSend_insertObject_atIndex_(v10, v14, (uint64_t)v13, 0);

  if (objc_msgSend_count(self->_queue, v15, v16) == 1) {
    objc_msgSend__setTimeout(self, v17, v18);
  }

  return 1;
}

- (BOOL)removeMessage:(id)a3
{
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = objc_msgSend_count(self->_queue, v4, v5);
    if (v7 - 1 < 0)
    {
      char v11 = 0;
    }
    else
    {
      uint64_t v10 = v7;
      char v11 = 0;
      do
      {
        objc_msgSend_objectAtIndex_(self->_queue, v8, --v10);
        id v12 = (id)objc_claimAutoreleasedReturnValue();

        if (v12 == v6)
        {
          objc_msgSend_removeObjectAtIndex_(self->_queue, v8, v10);
          objc_msgSend_removeObjectAtIndex_(self->_addDates, v13, v10);
          char v11 = 1;
        }
      }
      while (v10 > 0);
    }
    if (!objc_msgSend_count(self->_queue, v8, v9))
    {
      queue = self->_queue;
      self->_queue = 0;
    }
    if (!objc_msgSend_count(self->_addDates, v14, v15))
    {
      addDates = self->_addDates;
      self->_addDates = 0;
    }
  }
  else
  {
    char v11 = 0;
  }

  return v11 & 1;
}

- (NSMutableArray)_queue
{
  return (NSMutableArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)set_queue:(id)a3
{
}

- (NSMutableArray)_addDates
{
  return (NSMutableArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)set_addDates:(id)a3
{
}

- (FTMessageQueueDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (FTMessageQueueDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeoutTask, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_addDates, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end