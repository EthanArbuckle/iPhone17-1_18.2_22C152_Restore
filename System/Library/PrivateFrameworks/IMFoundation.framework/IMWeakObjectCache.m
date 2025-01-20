@interface IMWeakObjectCache
+ (id)sharedInstance;
- (IMWeakObjectCache)init;
- (id)copyObjectForKey:(id)a3;
- (id)copyOrSetObject:(id)a3 forKey:(id)a4;
- (id)objectForKey:(id)a3;
- (void)dealloc;
- (void)removeObject:(id)a3 key:(id)a4;
@end

@implementation IMWeakObjectCache

+ (id)sharedInstance
{
  if (qword_1EB273CD0 != -1) {
    dispatch_once(&qword_1EB273CD0, &unk_1EE22FA98);
  }
  v2 = (void *)qword_1EB273C30;
  return v2;
}

- (IMWeakObjectCache)init
{
  v5.receiver = self;
  v5.super_class = (Class)IMWeakObjectCache;
  v2 = [(IMWeakObjectCache *)&v5 init];
  v3 = v2;
  if (v2) {
    pthread_mutex_init(&v2->_tableLock, 0);
  }
  return v3;
}

- (void)dealloc
{
  pthread_mutex_destroy(&self->_tableLock);
  v3.receiver = self;
  v3.super_class = (Class)IMWeakObjectCache;
  [(IMWeakObjectCache *)&v3 dealloc];
}

- (id)copyOrSetObject:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  id v9 = 0;
  if (v6 && v7)
  {
    pthread_mutex_lock(&self->_tableLock);
    weakObjectCache = self->_weakObjectCache;
    if (!weakObjectCache)
    {
      Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
      v14 = self->_weakObjectCache;
      self->_weakObjectCache = Mutable;

      weakObjectCache = self->_weakObjectCache;
    }
    v15 = objc_msgSend_objectForKey_(weakObjectCache, v10, (uint64_t)v8, v11);
    v19 = v15;
    if (v15)
    {
      uint64_t v20 = objc_msgSend_copyObject(v15, v16, v17, v18);
      if (v20)
      {
        id v9 = (id)v20;
        pthread_mutex_unlock(&self->_tableLock);
LABEL_10:

        goto LABEL_11;
      }
      objc_msgSend_removeObjectForKey_(self->_weakObjectCache, v21, (uint64_t)v8, v22);
    }
    v23 = [IMWeakReference alloc];
    uint64_t inited = objc_msgSend_initRefWithObject_(v23, v24, (uint64_t)v6, v25);

    objc_msgSend_setObject_forKey_(self->_weakObjectCache, v27, inited, (uint64_t)v8);
    pthread_mutex_unlock(&self->_tableLock);
    id v9 = v6;
    v19 = (void *)inited;
    goto LABEL_10;
  }
LABEL_11:

  return v9;
}

- (id)copyObjectForKey:(id)a3
{
  p_tableLock = &self->_tableLock;
  id v5 = a3;
  pthread_mutex_lock(p_tableLock);
  v8 = objc_msgSend_objectForKey_(self->_weakObjectCache, v6, (uint64_t)v5, v7);

  v12 = objc_msgSend_copyObject(v8, v9, v10, v11);
  pthread_mutex_unlock(p_tableLock);

  return v12;
}

- (id)objectForKey:(id)a3
{
  p_tableLock = &self->_tableLock;
  id v5 = a3;
  pthread_mutex_lock(p_tableLock);
  v8 = objc_msgSend_objectForKey_(self->_weakObjectCache, v6, (uint64_t)v5, v7);

  v12 = objc_msgSend_object(v8, v9, v10, v11);
  pthread_mutex_unlock(p_tableLock);

  return v12;
}

- (void)removeObject:(id)a3 key:(id)a4
{
  uint64_t v18 = (char *)a3;
  id v6 = a4;
  pthread_mutex_lock(&self->_tableLock);
  id v9 = objc_msgSend_objectForKey_(self->_weakObjectCache, v7, (uint64_t)v6, v8);
  uint64_t v13 = objc_msgSend_hash(v9, v10, v11, v12);
  v16 = v18;
  if ((char *)v13 == v18) {
    objc_msgSend_removeObjectForKey_(self->_weakObjectCache, v18, (uint64_t)v6, v15);
  }
  if (!objc_msgSend_count(self->_weakObjectCache, v16, v14, v15))
  {
    weakObjectCache = self->_weakObjectCache;
    self->_weakObjectCache = 0;
  }
  pthread_mutex_unlock(&self->_tableLock);
}

- (void).cxx_destruct
{
}

@end