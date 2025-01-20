@interface ADAudioSession
+ (id)sharedSession;
- (ADAudioSession)init;
- (id)currentInputRoute;
- (id)currentOutputRoute;
@end

@implementation ADAudioSession

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputRoute, 0);
  objc_storeStrong((id *)&self->_inputRoute, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (id)currentOutputRoute
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = sub_10006D4C0;
  v10 = sub_10006D4D0;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10006D4D8;
  v5[3] = &unk_10050D5F0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)currentInputRoute
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = sub_10006D4C0;
  v10 = sub_10006D4D0;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10006E9F8;
  v5[3] = &unk_10050D5F0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (ADAudioSession)init
{
  v7.receiver = self;
  v7.super_class = (Class)ADAudioSession;
  v2 = [(ADAudioSession *)&v7 init];
  if (v2)
  {
    id v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create(0, v3);

    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;
  }
  return v2;
}

+ (id)sharedSession
{
  if (qword_1005857A8 != -1) {
    dispatch_once(&qword_1005857A8, &stru_1004FF9E0);
  }
  v2 = (void *)qword_1005857A0;
  return v2;
}

@end