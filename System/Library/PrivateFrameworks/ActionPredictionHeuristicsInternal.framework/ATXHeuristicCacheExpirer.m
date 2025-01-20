@interface ATXHeuristicCacheExpirer
+ (BOOL)supportsSecureCoding;
- (ATXHeuristicCacheExpirer)init;
- (void)dealloc;
- (void)expire;
- (void)startExpiring:(id)a3 cache:(id)a4;
- (void)stopExpiring:(id)a3 cache:(id)a4;
@end

@implementation ATXHeuristicCacheExpirer

- (void).cxx_destruct
{
}

- (ATXHeuristicCacheExpirer)init
{
  v6.receiver = self;
  v6.super_class = (Class)ATXHeuristicCacheExpirer;
  v2 = [(ATXHeuristicCacheExpirer *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    expirationEntries = v2->_expirationEntries;
    v2->_expirationEntries = (NSMutableSet *)v3;

    pthread_mutex_init(&v2->_lock, 0);
  }
  return v2;
}

- (void)stopExpiring:(id)a3 cache:(id)a4
{
  if (a4)
  {
    p_lock = &self->_lock;
    id v7 = a4;
    id v8 = a3;
    pthread_mutex_lock(p_lock);
    expirationEntries = self->_expirationEntries;
    v10 = [[ATXHeuristicCacheExpirationEntry alloc] initWithHeuristic:v8 cache:v7];

    [(NSMutableSet *)expirationEntries removeObject:v10];
    if (![(NSMutableSet *)self->_expirationEntries count]) {
      [(ATXHeuristicCacheExpirer *)self _stop];
    }
    pthread_mutex_unlock(p_lock);
  }
}

- (void)dealloc
{
  [(ATXHeuristicCacheExpirer *)self _stop];
  pthread_mutex_destroy(&self->_lock);
  v3.receiver = self;
  v3.super_class = (Class)ATXHeuristicCacheExpirer;
  [(ATXHeuristicCacheExpirer *)&v3 dealloc];
}

- (void)startExpiring:(id)a3 cache:(id)a4
{
  if (a4)
  {
    p_lock = &self->_lock;
    id v7 = a4;
    id v8 = a3;
    pthread_mutex_lock(p_lock);
    expirationEntries = self->_expirationEntries;
    v10 = [[ATXHeuristicCacheExpirationEntry alloc] initWithHeuristic:v8 cache:v7];

    [(NSMutableSet *)expirationEntries addObject:v10];
    if ([(NSMutableSet *)self->_expirationEntries count]) {
      [(ATXHeuristicCacheExpirer *)self _start];
    }
    pthread_mutex_unlock(p_lock);
  }
}

- (void)expire
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  v4 = self->_expirationEntries;
  v5 = (NSMutableSet *)objc_opt_new();
  expirationEntries = self->_expirationEntries;
  self->_expirationEntries = v5;

  pthread_mutex_unlock(p_lock);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = v4;
  uint64_t v8 = [(NSMutableSet *)v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        v13 = objc_msgSend(v12, "cache", (void)v15);
        v14 = [v12 heuristicName];
        [v13 _expire:v14 postNotification:1];
      }
      uint64_t v9 = [(NSMutableSet *)v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end