@interface PBADataRecoveryEngine
- (BOOL)dataRecoveryPossible;
- (BOOL)requiresDataRecovery;
- (PBADataRecoveryEngine)init;
- (PBADataRecoveryEngine)initWithMobileKeyBag:(id)a3;
- (void)_queue_performDataRecoveryWithPasscode:(id)a3 progressHandler:(id)a4 completion:(id)a5;
- (void)performDataRecoveryWithPasscode:(id)a3 progressHandler:(id)a4 completion:(id)a5;
@end

@implementation PBADataRecoveryEngine

- (PBADataRecoveryEngine)initWithMobileKeyBag:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PBADataRecoveryEngine;
  v6 = [(PBADataRecoveryEngine *)&v12 init];
  if (v6)
  {
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.preboard.datarecovery", 0);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v7;

    dispatch_queue_t v9 = dispatch_queue_create("com.apple.preboard.datarecovery.callout", 0);
    calloutQueue = v6->_calloutQueue;
    v6->_calloutQueue = (OS_dispatch_queue *)v9;

    objc_storeStrong((id *)&v6->_queue_mobileKeyBag, a3);
  }

  return v6;
}

- (PBADataRecoveryEngine)init
{
  v3 = +[SBFMobileKeyBag sharedInstance];
  v4 = [(PBADataRecoveryEngine *)self initWithMobileKeyBag:v3];

  return v4;
}

- (BOOL)requiresDataRecovery
{
  uint64_t v6 = 0;
  dispatch_queue_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100008810;
  v5[3] = &unk_10001C950;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)dataRecoveryPossible
{
  uint64_t v6 = 0;
  dispatch_queue_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10000891C;
  v5[3] = &unk_10001C950;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)performDataRecoveryWithPasscode:(id)a3 progressHandler:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = self->_queue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100008A60;
  v15[3] = &unk_10001C978;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(queue, v15);
}

- (void)_queue_performDataRecoveryWithPasscode:(id)a3 progressHandler:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue_mobileKeyBag = self->_queue_mobileKeyBag;
  id v34 = 0;
  unsigned int v12 = [(SBFMobileKeyBag *)queue_mobileKeyBag beginRecovery:v8 error:&v34];
  id v13 = v34;
  id v14 = v13;
  if (!v12)
  {
    id v23 = v13;
    if (!v10) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  v15 = [(SBFMobileKeyBag *)self->_queue_mobileKeyBag state];
  id v16 = [v15 escrowCount];
  if ((unint64_t)v16 <= 1) {
    uint64_t v18 = 1;
  }
  else {
    uint64_t v18 = (uint64_t)v16;
  }
  if (v18 >= 1)
  {
    while (1)
    {
      v19 = [(SBFMobileKeyBag *)self->_queue_mobileKeyBag state];
      id v20 = [v19 escrowCount];
      uint64_t v21 = (uint64_t)v20;
      if (v9)
      {
        calloutQueue = self->_calloutQueue;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_100008D48;
        block[3] = &unk_10001C9A0;
        uint64_t v32 = v18;
        id v33 = v20;
        id v31 = v9;
        dispatch_async(calloutQueue, block);
      }
      if (v21 <= 0) {
        break;
      }
      usleep(0x411Au);
    }
  }
  LODWORD(v17) = 10.0;
  [(SBFMobileKeyBag *)self->_queue_mobileKeyBag waitForUnlockWithTimeout:v17];
  v24 = [(SBFMobileKeyBag *)self->_queue_mobileKeyBag state];
  if ([v24 lockState] && objc_msgSend(v24, "recoveryRequired"))
  {
    NSErrorUserInfoKey v35 = NSLocalizedDescriptionKey;
    CFStringRef v36 = @"Data recovery failed";
    v25 = +[NSDictionary dictionaryWithObjects:&v36 forKeys:&v35 count:1];
    id v23 = +[NSError errorWithDomain:@"com.apple.preboard.dr" code:1 userInfo:v25];
  }
  else
  {
    id v23 = 0;
  }

  if (v10)
  {
LABEL_18:
    v26 = self->_calloutQueue;
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_100008D6C;
    v27[3] = &unk_10001C9C8;
    id v29 = v10;
    id v28 = v23;
    dispatch_async(v26, v27);
  }
LABEL_19:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue_mobileKeyBag, 0);
  objc_storeStrong((id *)&self->_calloutQueue, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end