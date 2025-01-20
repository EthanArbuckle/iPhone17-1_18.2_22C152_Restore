@interface BLStorage
+ (id)sharedInstance;
- (BLStorage)init;
- (void)requestFreeSpace:(unint64_t)a3 atPath:(id)a4 withOptions:(id)a5 completionBlock:(id)a6;
@end

@implementation BLStorage

- (BLStorage)init
{
  v6.receiver = self;
  v6.super_class = (Class)BLStorage;
  v2 = [(BLStorage *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.BookLibrary.BLStorage", 0);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v3;

    v2->_lastFreeSpaceRequest = -1.79769313e308;
  }
  return v2;
}

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100026890;
  block[3] = &unk_1001A11C8;
  block[4] = a1;
  if (qword_1001C8140 != -1) {
    dispatch_once(&qword_1001C8140, block);
  }
  v2 = (void *)qword_1001C8148;

  return v2;
}

- (void)requestFreeSpace:(unint64_t)a3 atPath:(id)a4 withOptions:(id)a5 completionBlock:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x3032000000;
  v18[3] = sub_100026A24;
  v18[4] = sub_100026A34;
  id v19 = 0;
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100026A3C;
  block[3] = &unk_1001A1C00;
  id v13 = v10;
  v16 = self;
  v17 = v18;
  id v15 = v13;
  dispatch_sync((dispatch_queue_t)dispatchQueue, block);
  CPFreeSpaceRequestBytesAtPathWithCompletionBlock();

  _Block_object_dispose(v18, 8);
}

- (void).cxx_destruct
{
}

@end