@interface FARequestCoalescer
+ (FARequestCoalescer)sharedInstance;
- (FARequestCoalescer)init;
- (NSMutableDictionary)inFlightRequests;
- (OS_dispatch_queue)coalesceQueue;
- (id)performBlockForKey:(id)a3 force:(BOOL)a4 block:(id)a5;
- (void)setCoalesceQueue:(id)a3;
- (void)setInFlightRequests:(id)a3;
@end

@implementation FARequestCoalescer

+ (FARequestCoalescer)sharedInstance
{
  if (qword_10005EFB0 != -1) {
    dispatch_once(&qword_10005EFB0, &stru_10004E1E0);
  }
  v2 = (void *)qword_10005EFA8;
  return (FARequestCoalescer *)v2;
}

- (FARequestCoalescer)init
{
  v9.receiver = self;
  v9.super_class = (Class)FARequestCoalescer;
  v2 = [(FARequestCoalescer *)&v9 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("FACoalescedRequest Queue", v3);
    coalesceQueue = v2->_coalesceQueue;
    v2->_coalesceQueue = (OS_dispatch_queue *)v4;

    v6 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    inFlightRequests = v2->_inFlightRequests;
    v2->_inFlightRequests = v6;
  }
  return v2;
}

- (id)performBlockForKey:(id)a3 force:(BOOL)a4 block:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = objc_alloc((Class)AAFPromise);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100019A34;
  v15[3] = &unk_10004E258;
  v15[4] = self;
  id v16 = v8;
  BOOL v18 = a4;
  id v17 = v9;
  id v11 = v9;
  id v12 = v8;
  id v13 = [v10 initWithBlock:v15];

  return v13;
}

- (OS_dispatch_queue)coalesceQueue
{
  return self->_coalesceQueue;
}

- (void)setCoalesceQueue:(id)a3
{
}

- (NSMutableDictionary)inFlightRequests
{
  return self->_inFlightRequests;
}

- (void)setInFlightRequests:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inFlightRequests, 0);
  objc_storeStrong((id *)&self->_coalesceQueue, 0);
}

@end