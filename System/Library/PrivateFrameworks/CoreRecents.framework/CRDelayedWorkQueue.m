@interface CRDelayedWorkQueue
- (BOOL)scheduleWorkForKey:(id)a3 afterDelay:(double)a4 work:(id)a5;
- (CRDelayedWorkQueue)init;
- (void)cancel;
- (void)cancelWorkForKey:(id)a3;
- (void)dealloc;
- (void)flush;
@end

@implementation CRDelayedWorkQueue

- (CRDelayedWorkQueue)init
{
  v5.receiver = self;
  v5.super_class = (Class)CRDelayedWorkQueue;
  v2 = [(CRDelayedWorkQueue *)&v5 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v2->_queue = (OS_dispatch_queue *)dispatch_queue_create([+[NSString stringWithFormat:@"com.apple.corerecents.delayedWork.%p", v2] UTF8String], v3);
    v2->_requests = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  }
  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CRDelayedWorkQueue;
  [(CRDelayedWorkQueue *)&v3 dealloc];
}

- (void)cancelWorkForKey:(id)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v6 = [(NSMutableDictionary *)self->_requests objectForKey:a3];
  if (v6)
  {
    dispatch_source_cancel(v6);
    [(NSMutableDictionary *)self->_requests removeObjectForKey:a3];
  }
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)scheduleWorkForKey:(id)a3 afterDelay:(double)a4 work:(id)a5
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v10 = [(NSMutableDictionary *)self->_requests objectForKeyedSubscript:a3];
  if (!v10)
  {
    if (a4 <= 0.0)
    {
      os_unfair_lock_unlock(p_lock);
      (*((void (**)(id))a5 + 2))(a5);
      os_unfair_lock_lock(p_lock);
    }
    else
    {
      v11 = +[NSString stringWithFormat:@"com.apple.corerecents.delayedWork-%p-%@", self, a3];
      v12 = [[CRProcessTransaction alloc] initWithDescription:v11];
      if (a4 < 1.79769313e308) {
        v13 = [[CRPowerAssertion alloc] initWithIdentifier:v11 timeout:a4 + 30.0];
      }
      else {
        v13 = 0;
      }
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_1000078C0;
      v19[3] = &unk_10002C9D0;
      v19[4] = self;
      v19[5] = a3;
      v14 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_queue);
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472;
      handler[2] = sub_100007910;
      handler[3] = &unk_10002C9F8;
      handler[6] = v19;
      handler[7] = a5;
      handler[4] = v13;
      handler[5] = v12;
      dispatch_source_set_event_handler(v14, handler);
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_10000796C;
      v17[3] = &unk_10002CA20;
      v17[5] = v12;
      v17[6] = v19;
      v17[4] = v13;
      dispatch_source_set_cancel_handler(v14, v17);
      [(NSMutableDictionary *)self->_requests setObject:v14 forKeyedSubscript:a3];
      if (a4 < 1.79769313e308) {
        dispatch_time_t v15 = dispatch_time(0, (uint64_t)(a4 * 1000000000.0));
      }
      else {
        dispatch_time_t v15 = -1;
      }
      dispatch_source_set_timer(v14, v15, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
      dispatch_resume(v14);
    }
  }
  os_unfair_lock_unlock(p_lock);
  return v10 == 0;
}

- (void)cancel
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  requests = self->_requests;
  self->_requests = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  os_unfair_lock_unlock(p_lock);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = [(NSMutableDictionary *)requests objectEnumerator];
  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        dispatch_source_cancel(*(dispatch_source_t *)(*((void *)&v10 + 1) + 8 * (void)v9));
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)flush
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100007B44;
  block[3] = &unk_10002CA48;
  block[4] = self;
  dispatch_async((dispatch_queue_t)queue, block);
}

@end