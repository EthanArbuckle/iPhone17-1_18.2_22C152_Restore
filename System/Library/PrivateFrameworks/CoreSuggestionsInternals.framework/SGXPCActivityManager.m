@interface SGXPCActivityManager
+ (id)nameForActivityId:(int)a3;
+ (id)sharedInstance;
- (BOOL)setState:(id)a3 state:(int64_t)a4;
- (BOOL)shouldDefer:(id)a3;
- (SGXPCActivityManager)init;
- (id)_taskForActivity:(id)a3;
- (id)activityForActivityId:(int)a3;
- (id)copyCriteria:(id)a3;
- (int64_t)getState:(id)a3;
- (void)dealloc;
- (void)registerActivitiesWithSystem;
- (void)registerForActivity:(int)a3 handler:(id)a4;
- (void)setCriteria:(id)a3 criteria:(id)a4 forActivity:(int)a5;
@end

@implementation SGXPCActivityManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentTasks, 0);
  objc_storeStrong((id *)&self->_handlers, 0);
  objc_storeStrong((id *)&self->_lastCriteria, 0);
  objc_storeStrong((id *)&self->_activities, 0);
}

- (id)copyCriteria:(id)a3
{
  v5 = (_xpc_activity_s *)a3;
  if (!v5)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"SGXPCActivity.m", 270, @"Invalid parameter not satisfying: %@", @"activity" object file lineNumber description];
  }
  xpc_object_t v6 = xpc_activity_copy_criteria(v5);

  return v6;
}

- (BOOL)shouldDefer:(id)a3
{
  v4 = (_xpc_activity_s *)a3;
  if (xpc_activity_should_defer(v4))
  {
    char v5 = 1;
  }
  else
  {
    xpc_object_t v6 = [(SGXPCActivityManager *)self _taskForActivity:v4];
    char v5 = [v6 shouldDefer];
  }
  return v5;
}

- (id)_taskForActivity:(id)a3
{
  id v4 = a3;
  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  uint64_t v6 = 0;
  while (1)
  {
    id v7 = [(NSMutableArray *)self->_activities objectAtIndexedSubscript:v6];

    if (v7 == v4) {
      break;
    }
    if (++v6 == 15)
    {
      v8 = 0;
      goto LABEL_6;
    }
  }
  currentTasks = self->_currentTasks;
  v10 = [NSNumber numberWithInt:v6];
  v8 = [(NSMutableDictionary *)currentTasks objectForKeyedSubscript:v10];

LABEL_6:
  pthread_mutex_unlock(p_lock);

  return v8;
}

- (void)setCriteria:(id)a3 criteria:(id)a4 forActivity:(int)a5
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  v9 = (_xpc_activity_s *)a3;
  id v10 = a4;
  if (!v10)
  {
    v30 = [MEMORY[0x1E4F28B00] currentHandler];
    [v30 handleFailureInMethod:a2, self, @"SGXPCActivity.m", 234, @"Invalid parameter not satisfying: %@", @"criteria" object file lineNumber description];
  }
  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  uint64_t v12 = a5;
  v13 = [(NSMutableArray *)self->_lastCriteria objectAtIndexedSubscript:a5];
  uint64_t v14 = [MEMORY[0x1E4F1CA98] null];
  v15 = v13;
  if (v13 == (void *)v14) {
    goto LABEL_12;
  }
  v31 = v9;
  v15 = (void *)v14;
  id v16 = v13;
  id v17 = v10;
  v18 = (const char *)*MEMORY[0x1E4F142C8];
  string = xpc_dictionary_get_string(v16, (const char *)*MEMORY[0x1E4F142C8]);
  v20 = xpc_dictionary_get_string(v17, v18);
  if (strcmp(string, v20)
    || (v21 = (const char *)*MEMORY[0x1E4F141C8],
        int64_t int64 = xpc_dictionary_get_int64(v16, (const char *)*MEMORY[0x1E4F141C8]),
        int64 != xpc_dictionary_get_int64(v17, v21))
    || (v23 = (const char *)*MEMORY[0x1E4F14170],
        int64_t v24 = xpc_dictionary_get_int64(v16, (const char *)*MEMORY[0x1E4F14170]),
        v24 != xpc_dictionary_get_int64(v17, v23)))
  {

    v9 = v31;
LABEL_12:

    goto LABEL_13;
  }
  v25 = (const char *)*MEMORY[0x1E4F141A8];
  int64_t v26 = xpc_dictionary_get_int64(v16, (const char *)*MEMORY[0x1E4F141A8]);
  int64_t v27 = xpc_dictionary_get_int64(v17, v25);

  v9 = v31;
  if (v26 == v27)
  {
    v28 = sgLogHandle();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1CA650000, v28, OS_LOG_TYPE_DEBUG, "Ignoring CTS criteria change as it didn't change.", buf, 2u);
    }

    goto LABEL_16;
  }
LABEL_13:
  [(NSMutableArray *)self->_lastCriteria setObject:v10 atIndexedSubscript:v12];
  v29 = sgLogHandle();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v33 = v9;
    __int16 v34 = 2112;
    id v35 = v10;
    _os_log_impl(&dword_1CA650000, v29, OS_LOG_TYPE_INFO, "Setting CTS criteria for activity: %@, criteria: %@", buf, 0x16u);
  }

  xpc_activity_set_criteria(v9, v10);
LABEL_16:
  pthread_mutex_unlock(p_lock);
}

- (BOOL)setState:(id)a3 state:(int64_t)a4
{
  return xpc_activity_set_state((xpc_activity_t)a3, a4);
}

- (int64_t)getState:(id)a3
{
  return xpc_activity_get_state((xpc_activity_t)a3);
}

- (id)activityForActivityId:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  uint64_t v6 = [(NSMutableArray *)self->_activities objectAtIndexedSubscript:(int)v3];
  pthread_mutex_unlock(p_lock);
  id v7 = [MEMORY[0x1E4F1CA98] null];

  if (v6 == v7)
  {
    v9 = sgLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      int v11 = 136315138;
      uint64_t v12 = identifierForActivityId(v3);
      _os_log_debug_impl(&dword_1CA650000, v9, OS_LOG_TYPE_DEBUG, "Activity \"%s\" has not registered with the system yet. Returning nil.", (uint8_t *)&v11, 0xCu);
    }

    id v8 = 0;
  }
  else
  {
    id v8 = v6;
  }

  return v8;
}

- (void)registerForActivity:(int)a3 handler:(id)a4
{
  id v7 = a4;
  id v12 = v7;
  if (a3 >= 0xF)
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"SGXPCActivity.m", 201, @"Invalid parameter not satisfying: %@", @"0 <= activityId && activityId < _SGXPCActivityCount" object file lineNumber description];

    if (v12) {
      goto LABEL_3;
    }
  }
  else if (v7)
  {
    goto LABEL_3;
  }
  int v11 = [MEMORY[0x1E4F28B00] currentHandler];
  [v11 handleFailureInMethod:a2, self, @"SGXPCActivity.m", 202, @"Invalid parameter not satisfying: %@", @"handler" object file lineNumber description];

LABEL_3:
  pthread_mutex_lock(&self->_lock);
  id v8 = (void *)[v12 copy];
  v9 = (void *)MEMORY[0x1CB79B4C0]();
  [(NSMutableArray *)self->_handlers setObject:v9 atIndexedSubscript:a3];

  pthread_mutex_unlock(&self->_lock);
}

- (void)registerActivitiesWithSystem
{
  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  if (self->_registered)
  {
    pthread_mutex_unlock(p_lock);
    sgLogHandle();
    id v4 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v4->super.super, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1CA650000, &v4->super.super, OS_LOG_TYPE_DEBUG, "Already registered for activities", buf, 2u);
    }
  }
  else
  {
    self->_registered = 1;
    id v4 = self->_activities;
    char v5 = self->_lastCriteria;
    uint64_t v6 = self->_handlers;
    id v7 = self->_currentTasks;
    pthread_mutex_unlock(p_lock);
    uint64_t v8 = 0;
    v9 = (void *)*MEMORY[0x1E4F14158];
    do
    {
      id v10 = identifierForActivityId(v8);
      if (*v10)
      {
        int v11 = v10;
        v12[0] = MEMORY[0x1E4F143A8];
        v12[1] = 3221225472;
        v12[2] = __52__SGXPCActivityManager_registerActivitiesWithSystem__block_invoke;
        v12[3] = &unk_1E65B8198;
        int v18 = v8;
        id v17 = p_lock;
        uint64_t v13 = v4;
        uint64_t v14 = v5;
        v15 = v6;
        id v16 = v7;
        xpc_activity_register(v11, v9, v12);
      }
      uint64_t v8 = (v8 + 1);
    }
    while (v8 != 15);
  }
}

void __52__SGXPCActivityManager_registerActivitiesWithSystem__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a2;
  if (xpc_activity_get_state(v3))
  {
    id v4 = +[SGLongRunningTaskManager sharedInstance];
    char v5 = [v4 taskWithDeadline:3600.0];

    pthread_mutex_lock(*(pthread_mutex_t **)(a1 + 64));
    uint64_t v6 = [*(id *)(a1 + 48) objectAtIndexedSubscript:*(int *)(a1 + 72)];
    id v7 = *(void **)(a1 + 56);
    uint64_t v8 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 72)];
    [v7 setObject:v5 forKeyedSubscript:v8];

    pthread_mutex_unlock(*(pthread_mutex_t **)(a1 + 64));
    v9 = nullHandler();

    if (v6 == v9)
    {
      uint64_t v13 = sgLogHandle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        int v18 = identifierForActivityId(*(unsigned int *)(a1 + 72));
        int v19 = 136315138;
        v20 = v18;
        _os_log_debug_impl(&dword_1CA650000, v13, OS_LOG_TYPE_DEBUG, "Stub activity called for %s", (uint8_t *)&v19, 0xCu);
      }
    }
    else
    {
      id v10 = (void *)MEMORY[0x1CB79B230]();
      ((void (**)(void, _xpc_activity_s *))v6)[2](v6, v3);
    }
    [v5 markFinished];
    pthread_mutex_lock(*(pthread_mutex_t **)(a1 + 64));
    uint64_t v14 = *(void **)(a1 + 56);
    v15 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 72)];
    [v14 removeObjectForKey:v15];

    pthread_mutex_unlock(*(pthread_mutex_t **)(a1 + 64));
  }
  else
  {
    int v11 = sgLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      id v17 = identifierForActivityId(*(unsigned int *)(a1 + 72));
      int v19 = 136315138;
      v20 = v17;
      _os_log_debug_impl(&dword_1CA650000, v11, OS_LOG_TYPE_DEBUG, "Checking in for activity %s", (uint8_t *)&v19, 0xCu);
    }

    pthread_mutex_lock(*(pthread_mutex_t **)(a1 + 64));
    [*(id *)(a1 + 32) setObject:v3 atIndexedSubscript:*(int *)(a1 + 72)];
    xpc_object_t v12 = xpc_activity_copy_criteria(v3);
    if (v12)
    {
      [*(id *)(a1 + 40) setObject:v12 atIndexedSubscript:*(int *)(a1 + 72)];
    }
    else
    {
      id v16 = [MEMORY[0x1E4F1CA98] null];
      [*(id *)(a1 + 40) setObject:v16 atIndexedSubscript:*(int *)(a1 + 72)];
    }
    pthread_mutex_unlock(*(pthread_mutex_t **)(a1 + 64));
  }
}

- (void)dealloc
{
  pthread_mutex_destroy(&self->_lock);
  v3.receiver = self;
  v3.super_class = (Class)SGXPCActivityManager;
  [(SGXPCActivityManager *)&v3 dealloc];
}

- (SGXPCActivityManager)init
{
  v16.receiver = self;
  v16.super_class = (Class)SGXPCActivityManager;
  v2 = [(SGXPCActivityManager *)&v16 init];
  objc_super v3 = v2;
  if (v2)
  {
    pthread_mutex_init(&v2->_lock, 0);
    id v4 = [MEMORY[0x1E4F1CA98] null];
    uint64_t v5 = arrayFilledWith(v4);
    activities = v3->_activities;
    v3->_activities = (NSMutableArray *)v5;

    id v7 = [MEMORY[0x1E4F1CA98] null];
    uint64_t v8 = arrayFilledWith(v7);
    lastCriteria = v3->_lastCriteria;
    v3->_lastCriteria = (NSMutableArray *)v8;

    id v10 = nullHandler();
    uint64_t v11 = arrayFilledWith(v10);
    handlers = v3->_handlers;
    v3->_handlers = (NSMutableArray *)v11;

    uint64_t v13 = objc_opt_new();
    currentTasks = v3->_currentTasks;
    v3->_currentTasks = (NSMutableDictionary *)v13;
  }
  return v3;
}

+ (id)nameForActivityId:(int)a3
{
  objc_super v3 = NSString;
  id v4 = identifierForActivityId(*(uint64_t *)&a3);
  return (id)[v3 stringWithUTF8String:v4];
}

+ (id)sharedInstance
{
  if (sharedInstance__pasOnceToken2_14448 != -1) {
    dispatch_once(&sharedInstance__pasOnceToken2_14448, &__block_literal_global_14449);
  }
  v2 = (void *)sharedInstance__pasExprOnceResult_14450;
  return v2;
}

void __38__SGXPCActivityManager_sharedInstance__block_invoke()
{
  v0 = (void *)MEMORY[0x1CB79B230]();
  uint64_t v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_14450;
  sharedInstance__pasExprOnceResult_14450 = v1;
}

@end