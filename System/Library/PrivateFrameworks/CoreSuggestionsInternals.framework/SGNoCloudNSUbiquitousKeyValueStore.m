@interface SGNoCloudNSUbiquitousKeyValueStore
- (BOOL)synchronize;
- (SGNoCloudNSUbiquitousKeyValueStore)init;
- (id)arrayForKey:(id)a3;
- (id)dataForKey:(id)a3;
- (id)objectForKey:(id)a3;
- (void)dealloc;
- (void)setArray:(id)a3 forKey:(id)a4;
- (void)setData:(id)a3 forKey:(id)a4;
- (void)setObject:(id)a3 forKey:(id)a4;
- (void)synchronizeWithCompletionHandler:(id)a3;
@end

@implementation SGNoCloudNSUbiquitousKeyValueStore

- (void).cxx_destruct
{
}

- (void)setArray:(id)a3 forKey:(id)a4
{
  p_lock = &self->_lock;
  id v7 = a4;
  id v8 = a3;
  pthread_mutex_lock(p_lock);
  [(NSMutableDictionary *)self->_kv setObject:v8 forKeyedSubscript:v7];

  pthread_mutex_unlock(p_lock);
}

- (void)setData:(id)a3 forKey:(id)a4
{
  p_lock = &self->_lock;
  id v7 = a4;
  id v8 = a3;
  pthread_mutex_lock(p_lock);
  [(NSMutableDictionary *)self->_kv setObject:v8 forKeyedSubscript:v7];

  pthread_mutex_unlock(p_lock);
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  p_lock = &self->_lock;
  id v7 = a4;
  id v8 = a3;
  pthread_mutex_lock(p_lock);
  [(NSMutableDictionary *)self->_kv setObject:v8 forKeyedSubscript:v7];

  pthread_mutex_unlock(p_lock);
}

- (id)arrayForKey:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  pthread_mutex_lock(p_lock);
  v6 = [(NSMutableDictionary *)self->_kv objectForKeyedSubscript:v5];

  pthread_mutex_unlock(p_lock);
  return v6;
}

- (id)dataForKey:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  pthread_mutex_lock(p_lock);
  v6 = [(NSMutableDictionary *)self->_kv objectForKeyedSubscript:v5];

  pthread_mutex_unlock(p_lock);
  return v6;
}

- (id)objectForKey:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  pthread_mutex_lock(p_lock);
  v6 = [(NSMutableDictionary *)self->_kv objectForKeyedSubscript:v5];

  pthread_mutex_unlock(p_lock);
  return v6;
}

- (void)synchronizeWithCompletionHandler:(id)a3
{
}

- (BOOL)synchronize
{
  return 1;
}

- (void)dealloc
{
  pthread_mutex_destroy(&self->_lock);
  v3.receiver = self;
  v3.super_class = (Class)SGNoCloudNSUbiquitousKeyValueStore;
  [(SGNoCloudNSUbiquitousKeyValueStore *)&v3 dealloc];
}

- (SGNoCloudNSUbiquitousKeyValueStore)init
{
  v6.receiver = self;
  v6.super_class = (Class)SGNoCloudNSUbiquitousKeyValueStore;
  v2 = [(SGNoCloudNSUbiquitousKeyValueStore *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    kv = v2->_kv;
    v2->_kv = (NSMutableDictionary *)v3;

    pthread_mutex_init(&v2->_lock, 0);
  }
  return v2;
}

@end