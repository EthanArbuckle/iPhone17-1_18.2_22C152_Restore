@interface Stream
- (NSError)streamError;
- (Stream)init;
- (StreamDelegate)delegate;
- (unint64_t)streamStatus;
- (void)close;
- (void)open;
- (void)setDelegate:(id)a3;
@end

@implementation Stream

- (Stream)init
{
  v15.receiver = self;
  v15.super_class = (Class)Stream;
  id v2 = [(Stream *)&v15 init];
  if (v2)
  {
    v3 = objc_alloc_init(UnfairLock);
    v4 = (void *)*((void *)v2 + 3);
    *((void *)v2 + 3) = v3;

    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.appstored.Stream.DelegateQueue", v5);
    v7 = (void *)*((void *)v2 + 1);
    *((void *)v2 + 1) = v6;

    dispatch_source_t v8 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_data_or, 0, 0, *((dispatch_queue_t *)v2 + 1));
    v9 = (void *)*((void *)v2 + 2);
    *((void *)v2 + 2) = v8;

    objc_initWeak(&location, v2);
    v10 = *((void *)v2 + 2);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1002E7600;
    v12[3] = &unk_100525760;
    objc_copyWeak(&v13, &location);
    dispatch_source_set_event_handler(v10, v12);
    dispatch_activate(*((dispatch_object_t *)v2 + 2));
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
  return (Stream *)v2;
}

- (StreamDelegate)delegate
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = sub_100018118;
  v10 = sub_100017C48;
  id v11 = 0;
  lock = self->_lock;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1002E77A4;
  v5[3] = &unk_100521988;
  v5[4] = self;
  v5[5] = &v6;
  sub_100010468(lock, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (StreamDelegate *)v3;
}

- (void)setDelegate:(id)a3
{
  id v4 = a3;
  lock = self->_lock;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1002E7888;
  v7[3] = &unk_1005218C0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  sub_100010468(lock, v7);
}

- (NSError)streamError
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = sub_100018118;
  v10 = sub_100017C48;
  id v11 = 0;
  lock = self->_lock;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1002E799C;
  v5[3] = &unk_100521988;
  v5[4] = self;
  v5[5] = &v6;
  sub_100010468(lock, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSError *)v3;
}

- (unint64_t)streamStatus
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  lock = self->_lock;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1002E7B28;
  v5[3] = &unk_100521988;
  v5[4] = self;
  v5[5] = &v6;
  sub_100010468(lock, v5);
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)close
{
}

- (void)open
{
  sub_1002E7B3C((uint64_t)self, 2);
  if (self)
  {
    delegateSource = self->_delegateSource;
    dispatch_source_merge_data(delegateSource, 1uLL);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_streamError, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_delegateSource, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
}

@end