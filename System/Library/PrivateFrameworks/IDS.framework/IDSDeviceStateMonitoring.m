@interface IDSDeviceStateMonitoring
+ (NSMutableDictionary)monitors;
+ (id)sharedInstanceForNotificationName:(id)a3;
- (BOOL)isMonitoring;
- (IDSDeviceStateMonitoring)initWithName:(id)a3 queue:(id)a4;
- (NSMutableArray)delegateArray;
- (NSString)name;
- (OS_dispatch_queue)queue;
- (int)outToken;
- (os_unfair_lock_s)lock;
- (unint64_t)currentState;
- (void)dealloc;
- (void)notifyDelegatesAboutNewState:(unint64_t)a3 token:(int)a4;
- (void)registerForStateUpdates:(id)a3 queue:(id)a4;
- (void)setLock:(os_unfair_lock_s)a3;
- (void)unRegisterForStateUpdates:(id)a3;
@end

@implementation IDSDeviceStateMonitoring

+ (NSMutableDictionary)monitors
{
  v2 = (void *)qword_1E92DE440;
  if (!qword_1E92DE440)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v4 = (void *)qword_1E92DE440;
    qword_1E92DE440 = (uint64_t)v3;

    v2 = (void *)qword_1E92DE440;
  }

  return (NSMutableDictionary *)v2;
}

+ (id)sharedInstanceForNotificationName:(id)a3
{
  id v3 = a3;
  v4 = +[IDSDeviceStateMonitoring monitors];
  v5 = [v4 objectForKey:v3];

  if (!v5)
  {
    v6 = [IDSDeviceStateMonitoring alloc];
    if (qword_1E92DE450 != -1) {
      dispatch_once(&qword_1E92DE450, &unk_1EE246828);
    }
    v5 = [(IDSDeviceStateMonitoring *)v6 initWithName:v3 queue:qword_1E92DE448];
    v7 = +[IDSDeviceStateMonitoring monitors];
    [v7 setObject:v5 forKey:v3];
  }

  return v5;
}

- (IDSDeviceStateMonitoring)initWithName:(id)a3 queue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)IDSDeviceStateMonitoring;
  v9 = [(IDSDeviceStateMonitoring *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_queue, a4);
    objc_storeStrong((id *)&v10->_name, a3);
    v10->_outToken = 0;
    v10->_currentState = 0;
    v10->_isMonitoring = 0;
    v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    delegateArray = v10->_delegateArray;
    v10->_delegateArray = v11;

    v10->_lock._os_unfair_lock_opaque = 0;
  }

  return v10;
}

- (void)dealloc
{
  int outToken = self->_outToken;
  if (outToken != -1)
  {
    notify_cancel(outToken);
    self->_int outToken = -1;
  }
  v4.receiver = self;
  v4.super_class = (Class)IDSDeviceStateMonitoring;
  [(IDSDeviceStateMonitoring *)&v4 dealloc];
}

- (void)registerForStateUpdates:(id)a3 queue:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x1E4F6C3A8] pairWithFirst:v6 second:v7];
  os_unfair_lock_lock(&self->_lock);
  [(NSMutableArray *)self->_delegateArray addObject:v8];
  os_unfair_lock_unlock(&self->_lock);
  if (!self->_isMonitoring)
  {
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    v9 = [(NSString *)self->_name UTF8String];
    queue = self->_queue;
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    v16 = sub_1919E8414;
    v17 = &unk_1E572CD50;
    objc_copyWeak(&v18, &location);
    uint32_t v11 = notify_register_dispatch(v9, &self->_outToken, queue, &v14);
    if (v11)
    {
      v12 = +[IDSLogging IDSDevice];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        name = self->_name;
        *(_DWORD *)buf = 138412546;
        *(void *)&buf[4] = name;
        __int16 v21 = 1024;
        uint32_t v22 = v11;
        _os_log_impl(&dword_19190B000, v12, OS_LOG_TYPE_DEFAULT, "Dispatch registration failed {name: %@, status: %u}", buf, 0x12u);
      }
    }
    else
    {
      self->_isMonitoring = 1;
      *(void *)buf = 0;
      notify_get_state(self->_outToken, (uint64_t *)buf);
      if (self->_currentState != *(void *)buf) {
        self->_currentState = *(void *)buf;
      }
    }
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
}

- (void)notifyDelegatesAboutNewState:(unint64_t)a3 token:(int)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  if (self->_currentState != a3)
  {
    self->_currentState = a3;
    os_unfair_lock_t lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v18 = self;
    id v6 = self->_delegateArray;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v24 objects:v36 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v25 != v9) {
            objc_enumerationMutation(v6);
          }
          uint32_t v11 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          v12 = [v11 first];
          v13 = [v11 second];
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = sub_1919E86B8;
          block[3] = &unk_1E5728E48;
          id v22 = v12;
          unint64_t v23 = a3;
          id v14 = v12;
          dispatch_async(v13, block);
        }
        uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v24 objects:v36 count:16];
      }
      while (v8);
    }

    os_unfair_lock_unlock(lock);
    uint64_t v15 = +[IDSLogging IDSDevice];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      name = self->_name;
      uint64_t v17 = [(NSMutableArray *)v18->_delegateArray count];
      *(_DWORD *)buf = 138413058;
      v29 = name;
      __int16 v30 = 2048;
      unint64_t v31 = a3;
      __int16 v32 = 1024;
      int v33 = a4;
      __int16 v34 = 2048;
      uint64_t v35 = v17;
      _os_log_impl(&dword_19190B000, v15, OS_LOG_TYPE_DEFAULT, "Dispatch registration invoked - fetched state {name: %@, state: %lu, token:%d, delegate count:%lu}", buf, 0x26u);
    }
  }
}

- (void)unRegisterForStateUpdates:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  delegateArray = self->_delegateArray;
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  v12 = sub_1919E87E4;
  v13 = &unk_1E572CD78;
  id v7 = v4;
  id v14 = v7;
  id v8 = v5;
  id v15 = v8;
  [(NSMutableArray *)delegateArray enumerateObjectsUsingBlock:&v10];
  -[NSMutableArray removeObjectsInArray:](self->_delegateArray, "removeObjectsInArray:", v8, v10, v11, v12, v13);
  if (![(NSMutableArray *)self->_delegateArray count])
  {
    uint64_t v9 = +[IDSDeviceStateMonitoring monitors];
    [v9 removeObjectForKey:self->_name];
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (unint64_t)currentState
{
  return self->_currentState;
}

- (int)outToken
{
  return self->_outToken;
}

- (BOOL)isMonitoring
{
  return self->_isMonitoring;
}

- (NSString)name
{
  return self->_name;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void)setLock:(os_unfair_lock_s)a3
{
  self->_os_unfair_lock_t lock = a3;
}

- (NSMutableArray)delegateArray
{
  return self->_delegateArray;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegateArray, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end