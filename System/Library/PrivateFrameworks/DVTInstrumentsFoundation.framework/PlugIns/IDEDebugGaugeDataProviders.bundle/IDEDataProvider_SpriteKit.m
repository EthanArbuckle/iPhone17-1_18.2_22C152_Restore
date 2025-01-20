@interface IDEDataProvider_SpriteKit
+ (id)sharedDataProvider;
- (BOOL)captureAttributes:(id)a3 toDictionary:(id)a4 forPID:(id)a5;
- (IDEDataProvider_SpriteKit)init;
- (id)captureAttributes:(id)a3 forPIDs:(id)a4;
- (id)startSamplingForPIDs:(id)a3;
- (id)stopSamplingForPIDs:(id)a3;
- (id)supportedAttributes;
@end

@implementation IDEDataProvider_SpriteKit

+ (id)sharedDataProvider
{
  if (qword_15390 != -1) {
    dispatch_once(&qword_15390, &stru_10428);
  }
  v2 = (void *)qword_15388;
  return v2;
}

- (IDEDataProvider_SpriteKit)init
{
  v8.receiver = self;
  v8.super_class = (Class)IDEDataProvider_SpriteKit;
  v2 = [(IDEDataProvider_SpriteKit *)&v8 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    collectionStartedForPidDictionary = v2->_collectionStartedForPidDictionary;
    v2->_collectionStartedForPidDictionary = v3;

    dispatch_queue_t v5 = dispatch_queue_create("Lock to protect multithread access during capturing", 0);
    capture_lock = v2->_capture_lock;
    v2->_capture_lock = (OS_dispatch_queue *)v5;
  }
  return v2;
}

- (id)supportedAttributes
{
  if (qword_153A0 != -1) {
    dispatch_once(&qword_153A0, &stru_10448);
  }
  v2 = (void *)qword_15398;
  return v2;
}

- (id)startSamplingForPIDs:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = +[NSMutableSet set];
  capture_lock = self->_capture_lock;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_4ABC;
  block[3] = &unk_10470;
  id v13 = v4;
  v14 = self;
  id v7 = v5;
  id v15 = v7;
  id v8 = v4;
  dispatch_sync(capture_lock, block);
  v9 = v15;
  id v10 = v7;

  return v10;
}

- (BOOL)captureAttributes:(id)a3 toDictionary:(id)a4 forPID:(id)a5
{
  dispatch_queue_t v5 = -[NSMutableDictionary objectForKey:](self->_collectionStartedForPidDictionary, "objectForKey:", a5, a4);
  [v5 BOOLValue];

  return 0;
}

- (id)stopSamplingForPIDs:(id)a3
{
  id v4 = a3;
  capture_lock = self->_capture_lock;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_4D28;
  v9[3] = &unk_10498;
  id v6 = v4;
  id v10 = v6;
  v11 = self;
  dispatch_sync(capture_lock, v9);
  id v7 = v6;

  return v7;
}

- (id)captureAttributes:(id)a3 forPIDs:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[NSMutableDictionary dictionary];
  capture_lock = self->_capture_lock;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_4FAC;
  v16[3] = &unk_104C0;
  id v17 = v7;
  v18 = self;
  id v19 = v6;
  id v10 = v8;
  id v20 = v10;
  id v11 = v6;
  id v12 = v7;
  dispatch_sync(capture_lock, v16);
  id v13 = v20;
  id v14 = v10;

  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectionStartedForPidDictionary, 0);
  objc_storeStrong((id *)&self->_capture_lock, 0);
}

@end