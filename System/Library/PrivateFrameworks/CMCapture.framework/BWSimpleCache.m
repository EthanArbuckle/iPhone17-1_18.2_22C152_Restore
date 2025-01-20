@interface BWSimpleCache
+ (void)initialize;
- (BWSimpleCache)init;
- (id)copyAndClearObjectForKey:(id)a3;
- (void)cacheObject:(id)a3 forKey:(id)a4;
- (void)dealloc;
@end

@implementation BWSimpleCache

- (BWSimpleCache)init
{
  v4.receiver = self;
  v4.super_class = (Class)BWSimpleCache;
  v2 = [(BWSimpleCache *)&v4 init];
  if (v2)
  {
    v2->_cache = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v2->_propertyMutex = (OpaqueFigSimpleMutex *)FigSimpleMutexCreate();
  }
  return v2;
}

+ (void)initialize
{
}

- (void)dealloc
{
  FigSimpleMutexDestroy();
  v3.receiver = self;
  v3.super_class = (Class)BWSimpleCache;
  [(BWSimpleCache *)&v3 dealloc];
}

- (void)cacheObject:(id)a3 forKey:(id)a4
{
  pthread_mutex_lock((pthread_mutex_t *)self->_propertyMutex);
  [(NSMutableDictionary *)self->_cache setObject:a3 forKeyedSubscript:a4];
  propertyMutex = self->_propertyMutex;
  pthread_mutex_unlock((pthread_mutex_t *)propertyMutex);
}

- (id)copyAndClearObjectForKey:(id)a3
{
  pthread_mutex_lock((pthread_mutex_t *)self->_propertyMutex);
  id v5 = (id)[(NSMutableDictionary *)self->_cache objectForKeyedSubscript:a3];
  [(NSMutableDictionary *)self->_cache setObject:0 forKeyedSubscript:a3];
  pthread_mutex_unlock((pthread_mutex_t *)self->_propertyMutex);
  return v5;
}

@end