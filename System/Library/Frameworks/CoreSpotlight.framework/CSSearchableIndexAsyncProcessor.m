@interface CSSearchableIndexAsyncProcessor
- (CSSearchableIndexAsyncProcessor)initWithName:(id)a3;
- (void)indexSearchableItemsAsync:(id)a3 protectionClass:(id)a4 bundleIdentifier:(id)a5 indexOptions:(int64_t)a6 completion:(id)a7;
@end

@implementation CSSearchableIndexAsyncProcessor

- (CSSearchableIndexAsyncProcessor)initWithName:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CSSearchableIndexAsyncProcessor;
  v5 = [(CSSearchableIndexAsyncProcessor *)&v15 init];
  if (v5)
  {
    dispatch_semaphore_t v6 = dispatch_semaphore_create(4);
    semaphore = v5->_semaphore;
    v5->_semaphore = (OS_dispatch_semaphore *)v6;

    bzero(label, 0x400uLL);
    id v8 = v4;
    __sprintf_chk(label, 0, 0x400uLL, "com.apple.spotlight.indexitems.%s", (const char *)[v8 UTF8String]);
    objc_storeStrong((id *)&v5->_processorName, v8);
    v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = dispatch_queue_attr_make_with_qos_class(v9, (dispatch_qos_class_t)5u, 0);
    dispatch_queue_t v11 = dispatch_queue_create(label, v10);
    serialQueue = v5->_serialQueue;
    v5->_serialQueue = (OS_dispatch_queue *)v11;

    v13 = v5;
  }

  return v5;
}

- (void)indexSearchableItemsAsync:(id)a3 protectionClass:(id)a4 bundleIdentifier:(id)a5 indexOptions:(int64_t)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_semaphore, 0xFFFFFFFFFFFFFFFFLL);
  v16 = sub_100050698();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    v17 = self->_processorName;
    v18 = [(NSString *)v17 UTF8String];

    *(_DWORD *)buf = 136315138;
    v31 = v18;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "[%s] Submitting async job to index CSSearchableItem", buf, 0xCu);
  }

  serialQueue = self->_serialQueue;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_100034598;
  v24[3] = &unk_1000D9DA0;
  v24[4] = self;
  id v25 = v13;
  id v26 = v14;
  id v27 = v12;
  id v28 = v15;
  int64_t v29 = a6;
  id v20 = v15;
  id v21 = v12;
  id v22 = v14;
  id v23 = v13;
  dispatch_async(serialQueue, v24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_semaphore, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);

  objc_storeStrong((id *)&self->_processorName, 0);
}

@end