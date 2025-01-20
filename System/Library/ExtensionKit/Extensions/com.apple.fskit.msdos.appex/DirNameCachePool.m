@interface DirNameCachePool
- (DirNameCachePool)init;
- (NSMutableArray)pool;
- (OS_dispatch_semaphore)poolSemaphore;
- (id)getAvailableEntry;
- (id)getDNCEntryByKey:(unsigned int)a3;
- (unsigned)capacity;
- (void)check;
- (void)doneWithNameCacheForDir:(id)a3;
- (void)getNameCacheForDir:(id)a3 cachedOnly:(BOOL)a4 replyHandler:(id)a5;
- (void)removeNameCacheForDir:(id)a3;
- (void)setCapacity:(unsigned int)a3;
- (void)setPool:(id)a3;
- (void)setPoolSemaphore:(id)a3;
@end

@implementation DirNameCachePool

- (DirNameCachePool)init
{
  v8.receiver = self;
  v8.super_class = (Class)DirNameCachePool;
  v2 = [(DirNameCachePool *)&v8 init];
  v3 = v2;
  if (v2)
  {
    v2->_capacity = 5;
    v4 = (NSMutableArray *)[objc_alloc((Class)NSMutableArray) initWithCapacity:5];
    pool = v3->_pool;
    v3->_pool = v4;

    dispatch_semaphore_t v6 = dispatch_semaphore_create(5);
    [(DirNameCachePool *)v3 setPoolSemaphore:v6];
  }
  return v3;
}

- (id)getDNCEntryByKey:(unsigned int)a3
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v4 = self->_pool;
  id v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v9, "cacheKey", (void)v12) == a3)
        {
          id v10 = v9;
          goto LABEL_11;
        }
      }
      id v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  id v10 = 0;
LABEL_11:

  return v10;
}

- (id)getAvailableEntry
{
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v2 = self->_pool;
  id v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (!v3)
  {

LABEL_15:
    long long v14 = fskit_std_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_10002CD70(v14);
    }

    id v5 = 0;
    goto LABEL_18;
  }
  id v4 = v3;
  id v5 = 0;
  uint64_t v6 = *(void *)v17;
  do
  {
    for (i = 0; i != v4; i = (char *)i + 1)
    {
      if (*(void *)v17 != v6) {
        objc_enumerationMutation(v2);
      }
      objc_super v8 = *(void **)(*((void *)&v16 + 1) + 8 * i);
      v9 = objc_msgSend(v8, "dnc", (void)v16);
      unsigned __int8 v10 = [v9 isInUse];

      if ((v10 & 1) == 0)
      {
        if (!v5
          || ([v8 timestamp],
              v11 = objc_claimAutoreleasedReturnValue(),
              [v5 timestamp],
              long long v12 = objc_claimAutoreleasedReturnValue(),
              v12,
              v11,
              v11 < v12))
        {
          id v13 = v8;

          id v5 = v13;
        }
      }
    }
    id v4 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v16 objects:v20 count:16];
  }
  while (v4);

  if (!v5) {
    goto LABEL_15;
  }
LABEL_18:

  return v5;
}

- (void)getNameCacheForDir:(id)a3 cachedOnly:(BOOL)a4 replyHandler:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  if (!dispatch_semaphore_wait((dispatch_semaphore_t)self->_poolSemaphore, 0))
  {
    v11 = self->_pool;
    objc_sync_enter(v11);
    -[DirNameCachePool getDNCEntryByKey:](self, "getDNCEntryByKey:", [v8 firstCluster]);
    long long v12 = (DNCPoolEntry *)objc_claimAutoreleasedReturnValue();
    id v13 = v12;
    if (v12)
    {
      long long v14 = [(DNCPoolEntry *)v12 dnc];
      unsigned int v15 = [v14 isInUse];

      if (v15)
      {
        dispatch_semaphore_signal((dispatch_semaphore_t)self->_poolSemaphore);
        long long v16 = fskit_std_log();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
          sub_10002CE78(v27, (int)[v8 firstCluster]);
        }

        long long v17 = fs_errorForPOSIXError();
        (*((void (**)(id, void *, void, void))v9 + 2))(v9, v17, 0, 0);
      }
      else
      {
        long long v18 = [(DNCPoolEntry *)v13 dnc];
        [v18 setIsInUse:1];

        long long v19 = +[NSDate now];
        [(DNCPoolEntry *)v13 setTimestamp:v19];

        v20 = [(DNCPoolEntry *)v13 dnc];
        (*((void (**)(id, void, void *, void))v9 + 2))(v9, 0, v20, 0);
      }
    }
    else
    {
      if (v6)
      {
        dispatch_semaphore_signal((dispatch_semaphore_t)self->_poolSemaphore);
        (*((void (**)(id, void, void, void))v9 + 2))(v9, 0, 0, 0);
LABEL_19:
        objc_sync_exit(v11);

        goto LABEL_20;
      }
      if ((unint64_t)[(NSMutableArray *)self->_pool count] >= self->_capacity)
      {
        id v13 = [(DirNameCachePool *)self getAvailableEntry];
        if (!v13)
        {
          v26 = fskit_std_log();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT)) {
            sub_10002CDF4(v26);
          }

          dispatch_semaphore_signal((dispatch_semaphore_t)self->_poolSemaphore);
          fs_errorForPOSIXError();
          id v13 = (DNCPoolEntry *)objc_claimAutoreleasedReturnValue();
          (*((void (**)(id, DNCPoolEntry *, void, void))v9 + 2))(v9, v13, 0, 0);
          goto LABEL_18;
        }
        -[DNCPoolEntry setCacheKey:](v13, "setCacheKey:", [v8 firstCluster]);
        v23 = +[NSDate now];
        [(DNCPoolEntry *)v13 setTimestamp:v23];

        v21 = -[DirNameCache initWithDirEntrySize:]([DirNameCache alloc], "initWithDirEntrySize:", [v8 dirEntrySize]);
        [(DNCPoolEntry *)v13 setDnc:v21];
        v24 = [(DNCPoolEntry *)v13 dnc];
        [v24 setIsInUse:1];
      }
      else
      {
        v21 = -[DirNameCache initWithDirEntrySize:]([DirNameCache alloc], "initWithDirEntrySize:", [v8 dirEntrySize]);
        [(DirNameCache *)v21 setIsInUse:1];
        id v13 = -[DNCPoolEntry initWithDNC:cacheKey:]([DNCPoolEntry alloc], "initWithDNC:cacheKey:", v21, [v8 firstCluster]);
        v22 = +[NSDate now];
        [(DNCPoolEntry *)v13 setTimestamp:v22];

        [(NSMutableArray *)self->_pool addObject:v13];
      }
      v25 = [(DNCPoolEntry *)v13 dnc];
      (*((void (**)(id, void, void *, uint64_t))v9 + 2))(v9, 0, v25, 1);
    }
LABEL_18:

    goto LABEL_19;
  }
  unsigned __int8 v10 = fskit_std_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    sub_10002CEC8(v10);
  }

  (*((void (**)(id, void, void, void))v9 + 2))(v9, 0, 0, 0);
LABEL_20:
}

- (void)removeNameCacheForDir:(id)a3
{
  id v4 = a3;
  id v5 = self->_pool;
  objc_sync_enter(v5);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  BOOL v6 = self->_pool;
  id v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    id v8 = 0;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        unsigned int v12 = objc_msgSend(v11, "cacheKey", (void)v14);
        if (v12 == [v4 firstCluster])
        {
          id v13 = v11;

          id v8 = v13;
        }
      }
      id v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);

    if (v8) {
      [(NSMutableArray *)self->_pool removeObject:v8];
    }
  }
  else
  {

    id v8 = 0;
  }

  objc_sync_exit(v5);
}

- (void)doneWithNameCacheForDir:(id)a3
{
  id v4 = a3;
  id v5 = self->_pool;
  objc_sync_enter(v5);
  BOOL v6 = -[DirNameCachePool getDNCEntryByKey:](self, "getDNCEntryByKey:", [v4 firstCluster]);
  id v7 = v6;
  if (v6)
  {
    id v8 = [v6 dnc];
    unsigned __int8 v9 = [v8 isInUse];

    if ((v9 & 1) == 0)
    {
      unsigned __int8 v10 = fskit_std_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_10002CF9C(v13, (int)[v4 firstCluster]);
      }
    }
    v11 = [v7 dnc];
    [v11 setIsInUse:0];

    dispatch_semaphore_signal((dispatch_semaphore_t)self->_poolSemaphore);
  }
  else
  {
    unsigned int v12 = fskit_std_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10002CF4C(v13, (int)[v4 firstCluster]);
    }
  }
  objc_sync_exit(v5);
}

- (void)check
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v2 = self->_pool;
  id v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v11 objects:v19 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v12;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        id v8 = fskit_std_log();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          unsigned int v9 = [v7 cacheKey];
          unsigned __int8 v10 = [v7 timestamp];
          *(_DWORD *)buf = 67109378;
          unsigned int v16 = v9;
          __int16 v17 = 2112;
          long long v18 = v10;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Key %d, timestamp %@", buf, 0x12u);
        }
      }
      id v4 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v11 objects:v19 count:16];
    }
    while (v4);
  }
}

- (NSMutableArray)pool
{
  return (NSMutableArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setPool:(id)a3
{
}

- (OS_dispatch_semaphore)poolSemaphore
{
  return (OS_dispatch_semaphore *)objc_getProperty(self, a2, 24, 1);
}

- (void)setPoolSemaphore:(id)a3
{
}

- (unsigned)capacity
{
  return self->_capacity;
}

- (void)setCapacity:(unsigned int)a3
{
  self->_capacity = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_poolSemaphore, 0);

  objc_storeStrong((id *)&self->_pool, 0);
}

@end