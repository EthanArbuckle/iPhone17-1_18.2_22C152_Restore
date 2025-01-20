@interface Synchronize
+ (OS_dispatch_queue)queue;
+ (void)async:(id)a3;
+ (void)sync:(id)a3;
- (OS_dispatch_queue)queue;
- (Synchronize)initWithQueueName:(id)a3;
- (void)async:(id)a3;
- (void)sync:(id)a3;
@end

@implementation Synchronize

- (Synchronize)initWithQueueName:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)Synchronize;
  v5 = [(Synchronize *)&v9 init];
  if (v5)
  {
    dispatch_queue_t v6 = dispatch_queue_create((const char *)[v4 UTF8String], 0);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v6;
  }
  return v5;
}

+ (OS_dispatch_queue)queue
{
  if (qword_10002C2A0 != -1) {
    dispatch_once(&qword_10002C2A0, &stru_1000247F8);
  }
  v2 = (void *)qword_10002C2A8;

  return (OS_dispatch_queue *)v2;
}

+ (void)sync:(id)a3
{
  id v3 = a3;
  id v4 = +[Synchronize queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000D59C;
  block[3] = &unk_100024820;
  id v7 = v3;
  id v5 = v3;
  dispatch_sync(v4, block);
}

- (void)sync:(id)a3
{
  id v4 = a3;
  id v5 = [(Synchronize *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000D658;
  block[3] = &unk_100024820;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, block);
}

+ (void)async:(id)a3
{
  id v3 = a3;
  id v4 = +[Synchronize queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000D714;
  block[3] = &unk_100024820;
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, block);
}

- (void)async:(id)a3
{
  id v4 = a3;
  id v5 = [(Synchronize *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000D7D0;
  block[3] = &unk_100024820;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, block);
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

@end