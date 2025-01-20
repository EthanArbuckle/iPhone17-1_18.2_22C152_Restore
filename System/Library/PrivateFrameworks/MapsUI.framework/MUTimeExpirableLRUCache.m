@interface MUTimeExpirableLRUCache
- (MUTimeExpirableLRUCache)initWithMaxSize:(unint64_t)a3 timeToLive:(double)a4;
- (id)objectForKey:(id)a3;
- (id)timestampForKey:(id)a3;
- (unint64_t)count;
- (unint64_t)maxSize;
- (unint64_t)numberOfTimestamps;
- (void)lruCache:(id)a3 willEvictObject:(id)a4 forKey:(id)a5;
- (void)setObject:(id)a3 forKey:(id)a4;
@end

@implementation MUTimeExpirableLRUCache

- (MUTimeExpirableLRUCache)initWithMaxSize:(unint64_t)a3 timeToLive:(double)a4
{
  v13.receiver = self;
  v13.super_class = (Class)MUTimeExpirableLRUCache;
  v6 = [(MUTimeExpirableLRUCache *)&v13 init];
  v7 = v6;
  if (v6)
  {
    v6->_maxSize = a3;
    v6->_timeToLiveInSeconds = a4;
    v8 = [[MULRUCache alloc] initWithMaxSize:a3];
    valuesByCacheKeys = v7->_valuesByCacheKeys;
    v7->_valuesByCacheKeys = v8;

    [(MULRUCache *)v7->_valuesByCacheKeys setDelegate:v7];
    uint64_t v10 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:a3];
    timestampsByCacheKeys = v7->_timestampsByCacheKeys;
    v7->_timestampsByCacheKeys = (NSMutableDictionary *)v10;
  }
  return v7;
}

- (id)objectForKey:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = [(NSMutableDictionary *)self->_timestampsByCacheKeys objectForKey:v4];
    if (v5)
    {
      double Current = CFAbsoluteTimeGetCurrent();
      [v5 doubleValue];
      double v8 = Current - v7;
      if (v8 < 0.0) {
        double v8 = 0.0;
      }
      valuesByCacheKeys = self->_valuesByCacheKeys;
      if (v8 <= self->_timeToLiveInSeconds)
      {
        uint64_t v10 = [(MULRUCache *)valuesByCacheKeys objectForKey:v4];
        goto LABEL_9;
      }
      [(MULRUCache *)valuesByCacheKeys removeObjectForKey:v4];
      [(NSMutableDictionary *)self->_timestampsByCacheKeys removeObjectForKey:v4];
    }
    uint64_t v10 = 0;
LABEL_9:

    goto LABEL_10;
  }
  uint64_t v10 = 0;
LABEL_10:

  return v10;
}

- (unint64_t)count
{
  return [(MULRUCache *)self->_valuesByCacheKeys count];
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  valuesByCacheKeys = self->_valuesByCacheKeys;
  id v7 = a4;
  [(MULRUCache *)valuesByCacheKeys setObject:a3 forKey:v7];
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  timestampsByCacheKeys = self->_timestampsByCacheKeys;
  id v10 = [NSNumber numberWithDouble:Current];
  [(NSMutableDictionary *)timestampsByCacheKeys setObject:v10 forKey:v7];
}

- (void)lruCache:(id)a3 willEvictObject:(id)a4 forKey:(id)a5
{
}

- (id)timestampForKey:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_timestampsByCacheKeys objectForKey:a3];
}

- (unint64_t)numberOfTimestamps
{
  return [(NSMutableDictionary *)self->_timestampsByCacheKeys count];
}

- (unint64_t)maxSize
{
  return self->_maxSize;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valuesByCacheKeys, 0);
  objc_storeStrong((id *)&self->_timestampsByCacheKeys, 0);
}

@end