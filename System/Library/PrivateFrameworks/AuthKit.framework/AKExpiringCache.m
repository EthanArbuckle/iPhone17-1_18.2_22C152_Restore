@interface AKExpiringCache
- (AKExpiringCache)init;
- (id)objectForKey:(id)a3;
- (void)flushCacheForced:(BOOL)a3;
- (void)removeObjectForKey:(id)a3;
- (void)setObject:(id)a3 forKey:(id)a4 expiresIn:(double)a5;
@end

@implementation AKExpiringCache

- (AKExpiringCache)init
{
  v6.receiver = self;
  v6.super_class = (Class)AKExpiringCache;
  v2 = [(AKExpiringCache *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[NSMutableDictionary dictionary];
    internalCache = v2->_internalCache;
    v2->_internalCache = (NSMutableDictionary *)v3;

    v2->_lock._os_unfair_lock_opaque = 0;
  }
  return v2;
}

- (id)objectForKey:(id)a3
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100034E9C;
  v7[3] = &unk_100227A70;
  p_lock = &self->_lock;
  v7[4] = self;
  id v8 = a3;
  id v4 = v8;
  os_unfair_lock_lock(p_lock);
  v5 = sub_100034E9C((uint64_t)v7);
  os_unfair_lock_unlock(p_lock);

  return v5;
}

- (void)removeObjectForKey:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100034FC4;
  v5[3] = &unk_100226C00;
  p_lock = &self->_lock;
  v5[4] = self;
  id v6 = a3;
  id v4 = v6;
  os_unfair_lock_lock(p_lock);
  sub_100034FC4((uint64_t)v5);
  os_unfair_lock_unlock(p_lock);
}

- (void)setObject:(id)a3 forKey:(id)a4 expiresIn:(double)a5
{
  id v8 = a4;
  id v9 = a3;
  v10 = [_AKExpiringCacheValue alloc];
  v11 = +[NSDate dateWithTimeIntervalSinceNow:a5];
  v12 = [(_AKExpiringCacheValue *)v10 initWithObject:v9 expiryDate:v11];

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100035188;
  v18[3] = &unk_100226BD8;
  v18[4] = self;
  v19 = v12;
  id v20 = v8;
  id v13 = v8;
  v14 = v12;
  os_unfair_lock_lock(&self->_lock);
  sub_100035188(v18);
  os_unfair_lock_unlock(&self->_lock);
  dispatch_time_t v15 = dispatch_time(0, (uint64_t)(a5 * 1000000000.0));
  v16 = dispatch_get_global_queue(21, 0);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10003519C;
  v17[3] = &unk_100226FB8;
  v17[4] = self;
  dispatch_after(v15, v16, v17);
}

- (void)flushCacheForced:(BOOL)a3
{
  p_lock = &self->_lock;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_1000353AC;
  v23[3] = &unk_100227A98;
  v23[4] = self;
  os_unfair_lock_lock(&self->_lock);
  id v6 = sub_1000353AC((uint64_t)v23);
  os_unfair_lock_unlock(p_lock);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id obj = v6;
  id v7 = [obj countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v20;
    do
    {
      v10 = 0;
      do
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v19 + 1) + 8 * (void)v10);
        v14[0] = _NSConcreteStackBlock;
        v14[1] = 3221225472;
        dispatch_time_t v15 = sub_1000353B8;
        v16 = &unk_100227AC0;
        v17 = self;
        uint64_t v18 = v11;
        os_unfair_lock_lock(p_lock);
        v12 = v15((uint64_t)v14);
        os_unfair_lock_unlock(p_lock);
        if (a3 || [v12 isExpired]) {
          [(AKExpiringCache *)self removeObjectForKey:v11];
        }

        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [obj countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v8);
  }
}

- (void).cxx_destruct
{
}

@end