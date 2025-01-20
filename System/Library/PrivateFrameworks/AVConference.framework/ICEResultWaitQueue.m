@interface ICEResultWaitQueue
- (ICEResultWaitQueue)init;
- (id)copyResultForCallID:(unsigned int)a3;
- (void)addResult:(tagCONNRESULT *)a3 forCallID:(unsigned int)a4;
- (void)dealloc;
@end

@implementation ICEResultWaitQueue

- (ICEResultWaitQueue)init
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v4.receiver = self;
  v4.super_class = (Class)ICEResultWaitQueue;
  v2 = [(ICEResultWaitQueue *)&v4 init];
  v2->queryList = (NSMutableArray *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:5];
  pthread_mutex_init(&v2->resMutex, 0);
  pthread_cond_init(&v2->resCond, 0);
  return v2;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  [(NSMutableArray *)self->queryList removeAllObjects];

  pthread_mutex_destroy(&self->resMutex);
  pthread_cond_destroy(&self->resCond);
  v3.receiver = self;
  v3.super_class = (Class)ICEResultWaitQueue;
  [(ICEResultWaitQueue *)&v3 dealloc];
}

- (id)copyResultForCallID:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v4 = self;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  p_resMutex = &self->resMutex;
  pthread_mutex_lock(&self->resMutex);
  v6 = 0;
  p_resCond = &v4->resCond;
  v18 = p_resMutex;
  do
  {
    if (v6)
    {
      if ([(ICEResultQuery *)v6 isQueryAnswered]) {
        goto LABEL_26;
      }
      v19.tv_sec = 0xAAAAAAAAAAAAAAAALL;
      v19.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
    }
    else
    {
      v19.tv_sec = 0xAAAAAAAAAAAAAAAALL;
      v19.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
      long long v27 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      queryList = v4->queryList;
      uint64_t v9 = [(NSMutableArray *)queryList countByEnumeratingWithState:&v27 objects:v26 count:16];
      if (!v9) {
        goto LABEL_17;
      }
      uint64_t v10 = v9;
      v11 = v4;
      v6 = 0;
      uint64_t v12 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v28 != v12) {
            objc_enumerationMutation(queryList);
          }
          v14 = *(ICEResultQuery **)(*((void *)&v27 + 1) + 8 * i);
          if ([(ICEResultQuery *)v14 callID] == v3) {
            v6 = v14;
          }
        }
        uint64_t v10 = [(NSMutableArray *)queryList countByEnumeratingWithState:&v27 objects:v26 count:16];
      }
      while (v10);
      uint64_t v4 = v11;
      p_resMutex = v18;
      if (!v6)
      {
LABEL_17:
        v6 = [[ICEResultQuery alloc] initWithCallID:v3];
        [(NSMutableArray *)v4->queryList addObject:v6];
        goto LABEL_18;
      }
    }
    if ([(ICEResultQuery *)v6 isQueryAnswered])
    {
LABEL_26:
      [(NSMutableArray *)v4->queryList removeObject:v6];
      pthread_mutex_unlock(p_resMutex);
      return v6;
    }
LABEL_18:
    timespec v19 = (timespec)xmmword_1E259C140;
  }
  while (!pthread_cond_timedwait_relative_np(p_resCond, p_resMutex, &v19));
  if (v6 && [(NSMutableArray *)v4->queryList containsObject:v6]) {
    [(NSMutableArray *)v4->queryList removeObject:v6];
  }

  pthread_mutex_unlock(p_resMutex);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    uint64_t v15 = VRTraceErrorLogLevelToCSTR();
    v16 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v21 = v15;
      __int16 v22 = 2080;
      v23 = "-[ICEResultWaitQueue copyResultForCallID:]";
      __int16 v24 = 1024;
      int v25 = 126;
      _os_log_impl(&dword_1E1EA4000, v16, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Didn't return a connection result in the ICE result wait queue.  This shouldn't happen", buf, 0x1Cu);
    }
  }
  return 0;
}

- (void)addResult:(tagCONNRESULT *)a3 forCallID:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  p_resMutex = &self->resMutex;
  pthread_mutex_lock(&self->resMutex);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  queryList = self->queryList;
  uint64_t v9 = [(NSMutableArray *)queryList countByEnumeratingWithState:&v18 objects:v17 count:16];
  if (!v9) {
    goto LABEL_12;
  }
  uint64_t v10 = v9;
  v11 = 0;
  uint64_t v12 = *(void *)v19;
  do
  {
    for (uint64_t i = 0; i != v10; ++i)
    {
      if (*(void *)v19 != v12) {
        objc_enumerationMutation(queryList);
      }
      v14 = *(void **)(*((void *)&v18 + 1) + 8 * i);
      if ([v14 callID] == v4) {
        v11 = v14;
      }
    }
    uint64_t v10 = [(NSMutableArray *)queryList countByEnumeratingWithState:&v18 objects:v17 count:16];
  }
  while (v10);
  if (v11)
  {
    [v11 setResult:a3];
  }
  else
  {
LABEL_12:
    uint64_t v15 = [[ICEResultQuery alloc] initWithResult:a3];
    v16 = v15;
    if (!a3) {
      [(ICEResultQuery *)v15 setCallID:v4];
    }
    [(NSMutableArray *)self->queryList addObject:v16];
  }
  pthread_cond_broadcast(&self->resCond);
  pthread_mutex_unlock(p_resMutex);
}

@end