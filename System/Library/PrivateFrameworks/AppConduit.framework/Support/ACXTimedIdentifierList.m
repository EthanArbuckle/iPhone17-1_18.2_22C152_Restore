@interface ACXTimedIdentifierList
- (ACXTimedIdentifierList)initWithTimeout:(double)a3;
- (BOOL)addIdentifierIfNotPresent:(id)a3;
- (BOOL)containsIdentifier:(id)a3;
- (BOOL)removeIdentifier:(id)a3;
- (NSMutableDictionary)list;
- (OS_dispatch_queue)queue;
- (OS_dispatch_source)sweepTimer;
- (double)timeoutInSeconds;
- (id)timeoutHandler;
- (void)setSweepTimer:(id)a3;
- (void)setTimeoutHandler:(id)a3;
- (void)updateTimeOnIdentifier:(id)a3;
@end

@implementation ACXTimedIdentifierList

- (ACXTimedIdentifierList)initWithTimeout:(double)a3
{
  v12.receiver = self;
  v12.super_class = (Class)ACXTimedIdentifierList;
  v4 = [(ACXTimedIdentifierList *)&v12 init];
  v5 = v4;
  if (v4)
  {
    if (a3 <= 0.0) {
      sub_10005BDF0();
    }
    v4->_timeoutInSeconds = a3;
    uint64_t v6 = objc_opt_new();
    list = v5->_list;
    v5->_list = (NSMutableDictionary *)v6;

    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.appconduitd.TimedIdentifierList", v8);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v9;
  }
  return v5;
}

- (BOOL)addIdentifierIfNotPresent:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  objc_super v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  v5 = [(ACXTimedIdentifierList *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100050928;
  block[3] = &unk_10008CA68;
  block[4] = self;
  id v9 = v4;
  v10 = &v11;
  id v6 = v4;
  dispatch_sync(v5, block);

  LOBYTE(v4) = *((unsigned char *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return (char)v4;
}

- (void)updateTimeOnIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(ACXTimedIdentifierList *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100050DFC;
  v7[3] = &unk_10008CC28;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

- (BOOL)removeIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  objc_super v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  v5 = [(ACXTimedIdentifierList *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100050FB4;
  block[3] = &unk_10008CA68;
  block[4] = self;
  id v9 = v4;
  v10 = &v11;
  id v6 = v4;
  dispatch_sync(v5, block);

  LOBYTE(v4) = *((unsigned char *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return (char)v4;
}

- (BOOL)containsIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  objc_super v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  v5 = [(ACXTimedIdentifierList *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100051190;
  block[3] = &unk_10008CA18;
  id v9 = v4;
  v10 = &v11;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  LOBYTE(v4) = *((unsigned char *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return (char)v4;
}

- (id)timeoutHandler
{
  return self->_timeoutHandler;
}

- (void)setTimeoutHandler:(id)a3
{
}

- (NSMutableDictionary)list
{
  return self->_list;
}

- (OS_dispatch_source)sweepTimer
{
  return self->_sweepTimer;
}

- (void)setSweepTimer:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (double)timeoutInSeconds
{
  return self->_timeoutInSeconds;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_sweepTimer, 0);
  objc_storeStrong((id *)&self->_list, 0);

  objc_storeStrong(&self->_timeoutHandler, 0);
}

@end