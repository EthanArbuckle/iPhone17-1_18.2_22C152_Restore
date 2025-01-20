@interface SGCoalescingDropBox
- (SGCoalescingDropBox)initWithName:(const char *)a3 boxMaker:(id)a4 handler:(id)a5 qos:(unsigned int)a6;
- (void)dealloc;
- (void)updateBox:(id)a3;
- (void)updateBox:(id)a3 delay:(double)a4;
- (void)wait;
@end

@implementation SGCoalescingDropBox

- (void)updateBox:(id)a3 delay:(double)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  p_boxLock = &self->_boxLock;
  v7 = (void (**)(id, id, unsigned char *))a3;
  pthread_mutex_lock(p_boxLock);
  char v17 = 0;
  v7[2](v7, self->_box, &v17);

  BOOL pendingMerge = self->_pendingMerge;
  if (self->_pendingMerge)
  {
    if ((os_transaction_needs_more_time() & 1) == 0)
    {
      v9 = sgLogHandle();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        name = self->_name;
        *(_DWORD *)buf = 136315138;
        v19 = name;
        _os_log_impl(&dword_1CA650000, v9, OS_LOG_TYPE_DEFAULT, "SGCoalescingDropbox %s unable to extend transaction TTL.", buf, 0xCu);
      }

      queue = self->_queue;
      dispatch_block_t v12 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INITIATED, 0, &__block_literal_global_21924);
      dispatch_async(queue, v12);
    }
  }
  else
  {
    v13 = (OS_os_transaction *)os_transaction_create();
    transaction = self->_transaction;
    self->_transaction = v13;

    self->_BOOL pendingMerge = 1;
  }
  ++self->_outstanding;
  pthread_mutex_unlock(p_boxLock);
  if (a4 <= 0.0 || v17)
  {
    dispatch_source_merge_data((dispatch_source_t)self->_source, 1uLL);
  }
  else if (!pendingMerge)
  {
    v15 = self->_queue;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __39__SGCoalescingDropBox_updateBox_delay___block_invoke_2;
    v16[3] = &unk_1E65BEF88;
    v16[4] = self;
    [MEMORY[0x1E4F93B18] runAsyncOnQueue:v15 afterDelaySeconds:v16 block:a4];
  }
}

- (void)updateBox:(id)a3
{
}

- (SGCoalescingDropBox)initWithName:(const char *)a3 boxMaker:(id)a4 handler:(id)a5 qos:(unsigned int)a6
{
  id v10 = a4;
  id v11 = a5;
  v34.receiver = self;
  v34.super_class = (Class)SGCoalescingDropBox;
  dispatch_block_t v12 = [(SGCoalescingDropBox *)&v34 init];
  v13 = v12;
  if (v12)
  {
    v12->_name = a3;
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    id v15 = objc_claimAutoreleasedReturnValue();
    v16 = (const char *)[v15 UTF8String];
    char v17 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v18 = dispatch_queue_attr_make_with_qos_class(v17, (dispatch_qos_class_t)a6, 0);
    dispatch_queue_t v19 = dispatch_queue_create(v16, v18);
    queue = v13->_queue;
    v13->_queue = (OS_dispatch_queue *)v19;

    dispatch_source_t v21 = dispatch_source_create(MEMORY[0x1E4F14440], 0, 0, (dispatch_queue_t)v13->_queue);
    source = v13->_source;
    v13->_source = (OS_dispatch_source *)v21;

    uint64_t v23 = [v10 copy];
    id makeEmptyBox = v13->_makeEmptyBox;
    v13->_id makeEmptyBox = (id)v23;

    uint64_t v25 = [v11 copy];
    id handler = v13->_handler;
    v13->_id handler = (id)v25;

    uint64_t v27 = (*((void (**)(void))v13->_makeEmptyBox + 2))();
    id box = v13->_box;
    v13->_id box = (id)v27;

    pthread_mutex_init(&v13->_handlerLock, 0);
    pthread_mutex_init(&v13->_boxLock, 0);
    pthread_cond_init(&v13->_cond, 0);
    v13->_BOOL pendingMerge = 0;
    v13->_outstanding = 0;
    id location = 0;
    objc_initWeak(&location, v13);
    v29 = v13->_source;
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __57__SGCoalescingDropBox_initWithName_boxMaker_handler_qos___block_invoke;
    v31[3] = &unk_1E65C0018;
    objc_copyWeak(&v32, &location);
    dispatch_source_set_event_handler(v29, v31);
    dispatch_resume((dispatch_object_t)v13->_source);
    objc_destroyWeak(&v32);
    objc_destroyWeak(&location);
  }

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong(&self->_box, 0);
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong(&self->_makeEmptyBox, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)wait
{
  p_boxLock = &self->_boxLock;
  pthread_mutex_lock(&self->_boxLock);
  if (self->_outstanding >= 1)
  {
    do
      pthread_cond_wait(&self->_cond, p_boxLock);
    while (self->_outstanding > 0);
  }
  pthread_mutex_unlock(p_boxLock);
}

void __39__SGCoalescingDropBox_updateBox_delay___block_invoke_2(uint64_t a1)
{
}

- (void)dealloc
{
  dispatch_source_cancel((dispatch_source_t)self->_source);
  pthread_mutex_destroy(&self->_boxLock);
  pthread_cond_destroy(&self->_cond);
  v3.receiver = self;
  v3.super_class = (Class)SGCoalescingDropBox;
  [(SGCoalescingDropBox *)&v3 dealloc];
}

void __57__SGCoalescingDropBox_initWithName_boxMaker_handler_qos___block_invoke(uint64_t a1)
{
  WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v1 = (*(void (**)(void))(*((void *)WeakRetained + 4) + 16))();
    pthread_mutex_lock((pthread_mutex_t *)(WeakRetained + 56));
    v2 = (pthread_mutex_t *)(WeakRetained + 120);
    pthread_mutex_lock((pthread_mutex_t *)(WeakRetained + 120));
    id v3 = *((id *)WeakRetained + 6);
    WeakRetained[184] = 0;
    int v4 = *((_DWORD *)WeakRetained + 47);
    objc_storeStrong((id *)WeakRetained + 6, v1);
    pthread_mutex_unlock((pthread_mutex_t *)(WeakRetained + 120));
    if (v4) {
      (*(void (**)(void))(*((void *)WeakRetained + 5) + 16))();
    }
    pthread_mutex_lock(v2);
    int v5 = *((_DWORD *)WeakRetained + 47) - v4;
    *((_DWORD *)WeakRetained + 47) = v5;
    if (!v5)
    {
      v6 = (void *)*((void *)WeakRetained + 30);
      *((void *)WeakRetained + 30) = 0;
    }
    pthread_cond_signal((pthread_cond_t *)WeakRetained + 4);
    pthread_mutex_unlock(v2);
    pthread_mutex_unlock((pthread_mutex_t *)(WeakRetained + 56));
  }
}

@end