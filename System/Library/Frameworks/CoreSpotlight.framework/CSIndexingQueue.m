@interface CSIndexingQueue
- (CSIndexingQueue)initWithIdleTime:(double)a3 idleTimeLeeway:(double)a4 maximumBatchSize:(unint64_t)a5 mode:(int64_t)a6 notifyBlock:(id)a7;
- (CSIndexingQueue)initWithMode:(int64_t)a3 notifyBlock:(id)a4;
- (NSMutableDictionary)queuedItems;
- (OS_dispatch_queue)coalescingQueue;
- (OS_dispatch_source)coalescingTimer;
- (double)idleTime;
- (double)idleTimeLeeway;
- (id)notifyBlock;
- (int64_t)mode;
- (unint64_t)maximumBatchSize;
- (void)_applicationWillResign:(id)a3;
- (void)_flushWithAppResigned:(BOOL)a3 forced:(BOOL)a4;
- (void)_queueItems:(id)a3;
- (void)dealloc;
- (void)flush;
- (void)queueItem:(id)a3;
- (void)queueItems:(id)a3;
- (void)setCoalescingQueue:(id)a3;
- (void)setCoalescingTimer:(id)a3;
- (void)setIdleTime:(double)a3;
- (void)setIdleTimeLeeway:(double)a3;
- (void)setMaximumBatchSize:(unint64_t)a3;
- (void)setMode:(int64_t)a3;
- (void)setNotifyBlock:(id)a3;
- (void)setQueuedItems:(id)a3;
@end

@implementation CSIndexingQueue

- (void)_queueItems:(id)a3
{
  uint64_t v80 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v71 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  id obj = v4;
  v56 = v5;
  v57 = self;
  uint64_t v61 = [obj countByEnumeratingWithState:&v71 objects:v79 count:16];
  if (v61)
  {
    uint64_t v60 = *(void *)v72;
    *(void *)&long long v6 = 138412290;
    long long v55 = v6;
    do
    {
      for (uint64_t i = 0; i != v61; ++i)
      {
        if (*(void *)v72 != v60) {
          objc_enumerationMutation(obj);
        }
        v8 = *(void **)(*((void *)&v71 + 1) + 8 * i);
        v9 = objc_msgSend(v8, "searchableItem", v55);
        v10 = [v9 uniqueIdentifier];
        v11 = [(NSMutableDictionary *)self->_queuedItems objectForKeyedSubscript:v10];
        v12 = [v11 searchableItem];
        v13 = v12;
        if (v12)
        {
          v14 = [v12 attributeSet];
          v15 = [v9 attributeSet];
          [v8 updateWithItem:v11];
          if ([v9 isUpdate])
          {
            [v13 _updateWithSearchableItem:v9];
            v16 = logForCSLogCategoryDefault();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = v55;
              v78 = v11;
              _os_log_debug_impl(&dword_18D0E3000, v16, OS_LOG_TYPE_DEBUG, "update: %@", buf, 0xCu);
            }

            goto LABEL_27;
          }
          v17 = [v14 emailHeaders];
          if (v17)
          {
            v18 = [v15 emailHeaders];
            BOOL v19 = v18 == 0;
          }
          else
          {
            BOOL v19 = 0;
          }

          v20 = [v14 HTMLContentData];
          v59 = v15;
          if (v20)
          {
            v21 = [v15 HTMLContentData];
            BOOL v22 = v21 == 0;
          }
          else
          {
            BOOL v22 = 0;
          }

          if (v19 || v22)
          {
            if (v19)
            {
              v23 = [v14 emailHeaders];
              [v59 setEmailHeaders:v23];
            }
            if (v22)
            {
              v24 = [v14 HTMLContentData];
              [v59 setHTMLContentData:v24];
            }
          }

          v5 = v56;
          self = v57;
        }
        if (v10)
        {
          v25 = logForCSLogCategoryDefault();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v55;
            v78 = v8;
            _os_log_debug_impl(&dword_18D0E3000, v25, OS_LOG_TYPE_DEBUG, "queue: %@", buf, 0xCu);
          }

          [v5 setObject:v8 forKeyedSubscript:v10];
        }
LABEL_27:
      }
      uint64_t v61 = [obj countByEnumeratingWithState:&v71 objects:v79 count:16];
    }
    while (v61);
  }

  uint64_t v26 = [(NSMutableDictionary *)self->_queuedItems count];
  if ([v5 count] + v26 <= self->_maximumBatchSize)
  {
    [(NSMutableDictionary *)self->_queuedItems addEntriesFromDictionary:v5];
    coalescingTimer = self->_coalescingTimer;
    if (coalescingTimer)
    {
      dispatch_time_t v29 = dispatch_time(0, (uint64_t)(self->_idleTime * 1000000000.0));
      dispatch_source_set_timer(coalescingTimer, v29, 0xFFFFFFFFFFFFFFFFLL, (unint64_t)(self->_idleTimeLeeway * 1000000000.0));
    }
    else
    {
      v30 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)self->_coalescingQueue);
      v31 = self->_coalescingTimer;
      self->_coalescingTimer = v30;

      v32 = self->_coalescingTimer;
      handler[0] = MEMORY[0x1E4F143A8];
      handler[1] = 3221225472;
      handler[2] = __31__CSIndexingQueue__queueItems___block_invoke;
      handler[3] = &unk_1E5548F00;
      handler[4] = self;
      dispatch_source_set_event_handler(v32, handler);
      v33 = self->_coalescingTimer;
      dispatch_time_t v34 = dispatch_time(0, (uint64_t)(self->_idleTime * 1000000000.0));
      dispatch_source_set_timer(v33, v34, 0xFFFFFFFFFFFFFFFFLL, (unint64_t)(self->_idleTimeLeeway * 1000000000.0));
      dispatch_resume((dispatch_object_t)self->_coalescingTimer);
    }
  }
  else
  {
    int64_t mode = self->_mode;
    switch(mode)
    {
      case 2:
LABEL_33:
        [(NSMutableDictionary *)self->_queuedItems addEntriesFromDictionary:v5];
        [(CSIndexingQueue *)self _flushWithAppResigned:0 forced:0];
        break;
      case 1:
        v35 = [MEMORY[0x1E4F1CA60] dictionary];
        long long v67 = 0u;
        long long v68 = 0u;
        long long v69 = 0u;
        long long v70 = 0u;
        v36 = v5;
        uint64_t v37 = [(NSMutableDictionary *)v36 countByEnumeratingWithState:&v67 objects:v76 count:16];
        if (v37)
        {
          uint64_t v38 = v37;
          uint64_t v39 = *(void *)v68;
LABEL_39:
          uint64_t v40 = 0;
          while (1)
          {
            if (*(void *)v68 != v39) {
              objc_enumerationMutation(v36);
            }
            uint64_t v41 = *(void *)(*((void *)&v67 + 1) + 8 * v40);
            v42 = [(NSMutableDictionary *)v36 objectForKeyedSubscript:v41];
            [(NSMutableDictionary *)v35 setObject:v42 forKeyedSubscript:v41];
            unint64_t v43 = [(NSMutableDictionary *)v35 count];
            unint64_t maximumBatchSize = v57->_maximumBatchSize;

            if (v43 >= maximumBatchSize) {
              break;
            }
            if (v38 == ++v40)
            {
              uint64_t v38 = [(NSMutableDictionary *)v36 countByEnumeratingWithState:&v67 objects:v76 count:16];
              if (v38) {
                goto LABEL_39;
              }
              goto LABEL_45;
            }
          }
        }
        else
        {
LABEL_45:

          long long v65 = 0u;
          long long v66 = 0u;
          long long v63 = 0u;
          long long v64 = 0u;
          v36 = v57->_queuedItems;
          uint64_t v45 = [(NSMutableDictionary *)v36 countByEnumeratingWithState:&v63 objects:v75 count:16];
          if (v45)
          {
            uint64_t v46 = v45;
            uint64_t v47 = *(void *)v64;
LABEL_47:
            uint64_t v48 = 0;
            while (1)
            {
              if (*(void *)v64 != v47) {
                objc_enumerationMutation(v36);
              }
              uint64_t v49 = *(void *)(*((void *)&v63 + 1) + 8 * v48);
              v50 = [(NSMutableDictionary *)v57->_queuedItems objectForKeyedSubscript:v49];
              v51 = [(NSMutableDictionary *)v35 objectForKeyedSubscript:v49];

              if (!v51) {
                [(NSMutableDictionary *)v35 setObject:v50 forKeyedSubscript:v49];
              }
              unint64_t v52 = [(NSMutableDictionary *)v35 count];
              unint64_t v53 = v57->_maximumBatchSize;

              if (v52 >= v53) {
                break;
              }
              if (v46 == ++v48)
              {
                uint64_t v46 = [(NSMutableDictionary *)v36 countByEnumeratingWithState:&v63 objects:v75 count:16];
                if (v46) {
                  goto LABEL_47;
                }
                break;
              }
            }
          }
        }

        queuedItems = v57->_queuedItems;
        v57->_queuedItems = v35;

        v5 = v56;
        break;
      case 0:
        goto LABEL_33;
    }
  }
}

uint64_t __30__CSIndexingQueue_queueItems___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _queueItems:*(void *)(a1 + 40)];
}

- (void)queueItem:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v7 = a3;
    id v4 = (void *)MEMORY[0x1E4F1C978];
    id v5 = a3;
    long long v6 = [v4 arrayWithObjects:&v7 count:1];

    -[CSIndexingQueue queueItems:](self, "queueItems:", v6, v7, v8);
  }
}

- (void)queueItems:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  tracing_dispatch_async();
}

- (CSIndexingQueue)initWithIdleTime:(double)a3 idleTimeLeeway:(double)a4 maximumBatchSize:(unint64_t)a5 mode:(int64_t)a6 notifyBlock:(id)a7
{
  id v12 = a7;
  v27.receiver = self;
  v27.super_class = (Class)CSIndexingQueue;
  v13 = [(CSIndexingQueue *)&v27 init];
  v14 = v13;
  if (v13)
  {
    double v15 = 5.0;
    if (a3 > 0.0) {
      double v15 = a3;
    }
    double v16 = 1.0;
    if (a4 > 0.0) {
      double v16 = a4;
    }
    v13->_idleTime = v15;
    v13->_idleTimeLeeway = v16;
    unint64_t v17 = 100;
    if (a5) {
      unint64_t v17 = a5;
    }
    v13->_unint64_t maximumBatchSize = v17;
    v13->_int64_t mode = a6;
    v18 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    queuedItems = v14->_queuedItems;
    v14->_queuedItems = v18;

    v20 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
    dispatch_queue_t v21 = dispatch_queue_create("com.apple.CoreSpotlight.itemCoalescing", v20);
    coalescingQueue = v14->_coalescingQueue;
    v14->_coalescingQueue = (OS_dispatch_queue *)v21;

    v23 = _Block_copy(v12);
    id notifyBlock = v14->_notifyBlock;
    v14->_id notifyBlock = v23;

    if (v14->_mode == 2)
    {
      v25 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v25 addObserver:v14 selector:sel__applicationWillResign_ name:@"UIApplicationWillResignActiveNotification" object:0];
    }
  }

  return v14;
}

- (CSIndexingQueue)initWithMode:(int64_t)a3 notifyBlock:(id)a4
{
  return [(CSIndexingQueue *)self initWithIdleTime:100 idleTimeLeeway:a3 maximumBatchSize:a4 mode:5.0 notifyBlock:1.0];
}

- (void)dealloc
{
  if (self->_mode == 2)
  {
    id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 removeObserver:self name:@"UIApplicationWillResignActiveNotification" object:0];
  }
  v4.receiver = self;
  v4.super_class = (Class)CSIndexingQueue;
  [(CSIndexingQueue *)&v4 dealloc];
}

- (void)_applicationWillResign:(id)a3
{
  if (self->_mode == 2)
  {
    coalescingQueue = self->_coalescingQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __42__CSIndexingQueue__applicationWillResign___block_invoke;
    block[3] = &unk_1E5548F00;
    block[4] = self;
    dispatch_async(coalescingQueue, block);
  }
}

uint64_t __42__CSIndexingQueue__applicationWillResign___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _flushWithAppResigned:1 forced:0];
}

uint64_t __31__CSIndexingQueue__queueItems___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _flushWithAppResigned:0 forced:0];
}

- (void)_flushWithAppResigned:(BOOL)a3 forced:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_coalescingQueue);
  coalescingTimer = self->_coalescingTimer;
  if (coalescingTimer)
  {
    dispatch_source_cancel(coalescingTimer);
    uint64_t v8 = self->_coalescingTimer;
    self->_coalescingTimer = 0;
  }
  v9 = [(NSMutableDictionary *)self->_queuedItems allValues];
  [(NSMutableDictionary *)self->_queuedItems removeAllObjects];
  uint64_t v10 = [v9 count];
  if (self->_notifyBlock)
  {
    int v11 = v10;
    if (v10)
    {
      id v12 = logForCSLogCategoryDefault();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        v13[0] = 67109632;
        v13[1] = v11;
        __int16 v14 = 1024;
        BOOL v15 = v5;
        __int16 v16 = 1024;
        BOOL v17 = v4;
        _os_log_impl(&dword_18D0E3000, v12, OS_LOG_TYPE_INFO, "flush activites - count: %d resigned: %d forced: %d", (uint8_t *)v13, 0x14u);
      }

      (*((void (**)(void))self->_notifyBlock + 2))();
    }
  }
}

- (void)flush
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_coalescingQueue);
  coalescingQueue = self->_coalescingQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __24__CSIndexingQueue_flush__block_invoke;
  block[3] = &unk_1E5548F00;
  block[4] = self;
  dispatch_sync(coalescingQueue, block);
}

uint64_t __24__CSIndexingQueue_flush__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _flushWithAppResigned:0 forced:1];
}

- (int64_t)mode
{
  return self->_mode;
}

- (void)setMode:(int64_t)a3
{
  self->_int64_t mode = a3;
}

- (double)idleTime
{
  return self->_idleTime;
}

- (void)setIdleTime:(double)a3
{
  self->_idleTime = a3;
}

- (double)idleTimeLeeway
{
  return self->_idleTimeLeeway;
}

- (void)setIdleTimeLeeway:(double)a3
{
  self->_idleTimeLeeway = a3;
}

- (unint64_t)maximumBatchSize
{
  return self->_maximumBatchSize;
}

- (void)setMaximumBatchSize:(unint64_t)a3
{
  self->_unint64_t maximumBatchSize = a3;
}

- (NSMutableDictionary)queuedItems
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void)setQueuedItems:(id)a3
{
}

- (OS_dispatch_queue)coalescingQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 48, 1);
}

- (void)setCoalescingQueue:(id)a3
{
}

- (OS_dispatch_source)coalescingTimer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 56, 1);
}

- (void)setCoalescingTimer:(id)a3
{
}

- (id)notifyBlock
{
  return objc_getProperty(self, a2, 64, 1);
}

- (void)setNotifyBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_notifyBlock, 0);
  objc_storeStrong((id *)&self->_coalescingTimer, 0);
  objc_storeStrong((id *)&self->_coalescingQueue, 0);

  objc_storeStrong((id *)&self->_queuedItems, 0);
}

@end