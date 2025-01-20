@interface VCDispatchQueue
+ (id)defaultManager;
- (VCDispatchQueue)init;
- (id)getCustomRootQueueWithPriority:(int)a3 isFixedPriority:(BOOL)a4;
- (void)dealloc;
@end

@implementation VCDispatchQueue

uint64_t __66__VCDispatchQueue_getCustomRootQueueWithPriority_isFixedPriority___block_invoke(uint64_t result)
{
  if (*(unsigned char *)(result + 32)) {
    return MEMORY[0x1F40CDB40]();
  }
  return result;
}

+ (id)defaultManager
{
  if (defaultManager_onceToken_0 != -1) {
    dispatch_once(&defaultManager_onceToken_0, &__block_literal_global_23);
  }
  return (id)_vcDispatchQueue;
}

- (id)getCustomRootQueueWithPriority:(int)a3 isFixedPriority:(BOOL)a4
{
  int v4 = a4;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  rootQueues = self->_rootQueues;
  uint64_t v9 = [(NSMutableArray *)rootQueues countByEnumeratingWithState:&v26 objects:v25 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v27;
LABEL_3:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v27 != v11) {
        objc_enumerationMutation(rootQueues);
      }
      v13 = *(void **)(*((void *)&v26 + 1) + 8 * v12);
      v24.__sig = 0xAAAAAAAAAAAAAAAALL;
      *(void *)v24.__opaque = 0xAAAAAAAAAAAAAAAALL;
      [v13 getValue:&v24];
      if (LODWORD(v24.__sig) == a3 && BYTE4(v24.__sig) == v4) {
        break;
      }
      if (v10 == ++v12)
      {
        uint64_t v10 = [(NSMutableArray *)rootQueues countByEnumeratingWithState:&v26 objects:v25 count:16];
        if (v10) {
          goto LABEL_3;
        }
        goto LABEL_14;
      }
    }
    v15 = *(void **)v24.__opaque;
    if (*(void *)v24.__opaque) {
      goto LABEL_17;
    }
  }
LABEL_14:
  *(void *)&long long v16 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v16 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&v24.__opaque[24] = v16;
  *(_OWORD *)&v24.__opaque[40] = v16;
  *(_OWORD *)&v24.__sig = v16;
  *(_OWORD *)&v24.__opaque[8] = v16;
  pthread_attr_init(&v24);
  sched_param v23 = (sched_param)0xAAAAAAAAAAAAAAAALL;
  pthread_attr_getschedparam(&v24, &v23);
  v23.sched_priority = a3;
  pthread_attr_setschedparam(&v24, &v23);
  pthread_attr_setschedpolicy(&v24, 4);
  int v21 = -1431655766;
  int v20 = a3;
  LOBYTE(v21) = v4;
  uint64_t v18 = MEMORY[0x1E4F143A8];
  LOBYTE(v19) = v4;
  uint64_t v22 = dispatch_pthread_root_queue_create();
  if (v22) {
    -[NSMutableArray addObject:](self->_rootQueues, "addObject:", objc_msgSend(MEMORY[0x1E4F29238], "value:withObjCType:", &v20, "{?=iB@}", v18, 3221225472, __66__VCDispatchQueue_getCustomRootQueueWithPriority_isFixedPriority___block_invoke, &__block_descriptor_33_e5_v8__0l, v19));
  }
  pthread_attr_destroy(&v24);
  v15 = (void *)v22;
LABEL_17:
  pthread_mutex_unlock(p_lock);
  return v15;
}

VCDispatchQueue *__33__VCDispatchQueue_defaultManager__block_invoke()
{
  result = objc_alloc_init(VCDispatchQueue);
  _vcDispatchQueue = (uint64_t)result;
  return result;
}

- (VCDispatchQueue)init
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v5.receiver = self;
  v5.super_class = (Class)VCDispatchQueue;
  v2 = [(VCDispatchQueue *)&v5 init];
  v3 = v2;
  if (v2)
  {
    pthread_mutex_init(&v2->_lock, 0);
    v3->_rootQueues = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }
  return v3;
}

- (void)dealloc
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v9 = 0;
  dispatch_object_t object = 0;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  rootQueues = self->_rootQueues;
  uint64_t v4 = [(NSMutableArray *)rootQueues countByEnumeratingWithState:&v12 objects:v11 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(rootQueues);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * i) getValue:&v9 size:16];
        if (object) {
          dispatch_release(object);
        }
      }
      uint64_t v5 = [(NSMutableArray *)rootQueues countByEnumeratingWithState:&v12 objects:v11 count:16];
    }
    while (v5);
  }
  [(NSMutableArray *)self->_rootQueues removeAllObjects];

  pthread_mutex_destroy(&self->_lock);
  v8.receiver = self;
  v8.super_class = (Class)VCDispatchQueue;
  [(VCDispatchQueue *)&v8 dealloc];
}

@end