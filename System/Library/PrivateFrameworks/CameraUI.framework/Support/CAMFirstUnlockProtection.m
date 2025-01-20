@interface CAMFirstUnlockProtection
+ (id)sharedInstance;
- (BOOL)checkFirstUnlock;
- (CAMFirstUnlockProtection)init;
- (void)_performPendingBlocksAfterFirstUnlock;
- (void)performAfterFirstUnlock:(id)a3;
@end

@implementation CAMFirstUnlockProtection

+ (id)sharedInstance
{
  if (qword_10000C4C8 != -1) {
    dispatch_once(&qword_10000C4C8, &stru_100008350);
  }
  v2 = (void *)qword_10000C4D0;
  return v2;
}

- (CAMFirstUnlockProtection)init
{
  v7.receiver = self;
  v7.super_class = (Class)CAMFirstUnlockProtection;
  v2 = [(CAMFirstUnlockProtection *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_isLocked = 1;
    v4 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    pendingBlocks = v3->_pendingBlocks;
    v3->_pendingBlocks = v4;
  }
  return v3;
}

- (void)_performPendingBlocksAfterFirstUnlock
{
  if (self->_isLocked && MKBDeviceUnlockedSinceBoot() == 1)
  {
    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    v3 = self->_pendingBlocks;
    id v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v9;
      do
      {
        objc_super v7 = 0;
        do
        {
          if (*(void *)v9 != v6) {
            objc_enumerationMutation(v3);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v8 + 1) + 8 * (void)v7) + 16))(*(void *)(*((void *)&v8 + 1) + 8 * (void)v7));
          objc_super v7 = (char *)v7 + 1;
        }
        while (v5 != v7);
        id v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      }
      while (v5);
    }

    [(NSMutableArray *)self->_pendingBlocks removeAllObjects];
    self->_isLocked = 0;
  }
}

- (void)performAfterFirstUnlock:(id)a3
{
  id v4 = (void (**)(void))a3;
  if (MKBDeviceUnlockedSinceBoot() == 1
    || ([(CAMFirstUnlockProtection *)self _performPendingBlocksAfterFirstUnlock],
        !self->_isLocked))
  {
    v4[2](v4);
  }
  else if (self->_isWatchingForUnlock)
  {
    id v5 = [v4 copy];
    [(NSMutableArray *)self->_pendingBlocks addObject:v5];
  }
  else
  {
    NSLog(@"Waiting for first unlock to start assetsd");
    self->_isWatchingForUnlock = 1;
    uint64_t v19 = 0;
    v20 = &v19;
    uint64_t v21 = 0x2020000000;
    int v22 = 0;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100005FB0;
    v18[3] = &unk_100008270;
    v18[4] = self;
    v18[5] = &v19;
    uint64_t v6 = objc_retainBlock(v18);
    objc_super v7 = (const char *)kMobileKeyBagLockStatusNotifyToken;
    long long v8 = (int *)(v20 + 3);
    id v9 = &_dispatch_main_q;
    v12 = _NSConcreteStackBlock;
    uint64_t v13 = 3221225472;
    v14 = sub_100006018;
    v15 = &unk_100008378;
    v17 = &v19;
    long long v10 = v6;
    id v16 = v10;
    LODWORD(v7) = notify_register_dispatch(v7, v8, (dispatch_queue_t)&_dispatch_main_q, &v12);

    if (v7)
    {
      NSLog(@"Unable to wait for first unlock", v12, v13, v14, v15);
      self->_isLocked = 0;
      v4[2](v4);
    }
    else
    {
      id v11 = objc_msgSend(v4, "copy", v12, v13, v14, v15);
      [(NSMutableArray *)self->_pendingBlocks addObject:v11];
    }
    _Block_object_dispose(&v19, 8);
  }
}

- (BOOL)checkFirstUnlock
{
  if (!self->_isLocked) {
    return 1;
  }
  if (+[NSThread isMainThread])
  {
    [(CAMFirstUnlockProtection *)self _performPendingBlocksAfterFirstUnlock];
    return !self->_isLocked;
  }
  else
  {
    uint64_t v10 = 0;
    id v11 = &v10;
    uint64_t v12 = 0x2020000000;
    char v13 = 0;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000617C;
    block[3] = &unk_1000083A0;
    block[4] = self;
    id v9 = &v10;
    id v4 = dispatch_semaphore_create(0);
    long long v8 = v4;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    dispatch_time_t v5 = dispatch_time(0, 10000000000);
    BOOL v3 = 0;
    if (!dispatch_semaphore_wait(v4, v5)) {
      BOOL v3 = *((unsigned char *)v11 + 24) != 0;
    }

    _Block_object_dispose(&v10, 8);
  }
  return v3;
}

- (void).cxx_destruct
{
}

@end