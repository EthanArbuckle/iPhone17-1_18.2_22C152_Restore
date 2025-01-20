@interface SKGTimer
- (BOOL)isValid;
- (OS_dispatch_queue)queue;
- (SKGTimer)initWithTimeIntervalSinceNow:(double)a3 tolerance:(double)a4 queue:(id)a5 block:(id)a6;
- (void)dealloc;
- (void)reset;
- (void)suspend;
@end

@implementation SKGTimer

- (SKGTimer)initWithTimeIntervalSinceNow:(double)a3 tolerance:(double)a4 queue:(id)a5 block:(id)a6
{
  id v11 = a5;
  id v12 = a6;
  v22.receiver = self;
  v22.super_class = (Class)SKGTimer;
  v13 = [(SKGTimer *)&v22 init];
  v14 = v13;
  if (v13)
  {
    v13->_interval = (uint64_t)(a3 * 1000000000.0);
    v13->_leeway = (unint64_t)(a4 * 1000000000.0);
    objc_storeStrong((id *)&v13->_queue, a5);
    dispatch_source_t v15 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)v14->_queue);
    timer = v14->_timer;
    v14->_timer = (OS_dispatch_source *)v15;

    v17 = v14->_timer;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10003DFF0;
    v19[3] = &unk_1000DAA60;
    id v21 = v12;
    v20 = v14;
    dispatch_source_set_event_handler(v17, v19);
  }
  return v14;
}

- (void)reset
{
  v3 = [(SKGTimer *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003E098;
  block[3] = &unk_1000DA128;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)suspend
{
  v3 = [(SKGTimer *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003E194;
  block[3] = &unk_1000DA128;
  block[4] = self;
  dispatch_async(v3, block);
}

- (BOOL)isValid
{
  v2 = self;
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  v3 = [(SKGTimer *)self queue];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10003E280;
  v5[3] = &unk_1000DA150;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_async(v3, v5);

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (void)dealloc
{
  v3 = [(SKGTimer *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003E368;
  block[3] = &unk_1000DA128;
  block[4] = self;
  dispatch_sync(v3, block);

  v4.receiver = self;
  v4.super_class = (Class)SKGTimer;
  [(SKGTimer *)&v4 dealloc];
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_timer, 0);
}

@end