@interface CMPickupManager
+ (BOOL)isPickupAvailable;
- (CMPickupDelegate)delegate;
- (CMPickupManager)init;
- (void)dealloc;
- (void)onPickupStateUpdated:(const Sample *)a3;
- (void)setDelegate:(id)a3;
- (void)startPickupUpdates;
- (void)stopPickupUpdates;
@end

@implementation CMPickupManager

- (CMPickupManager)init
{
  if ((objc_msgSend_isPickupAvailable(CMPickupManager, a2, v2) & 1) == 0)
  {
    v9 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v5, v6);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v9, v10, (uint64_t)a2, self, @"CMPickupManager.mm", 42, @"Pickup Detection is not supported on this platform. Use isPickupAvailable to avoid this error.");
  }
  v11.receiver = self;
  v11.super_class = (Class)CMPickupManager;
  v7 = [(CMPickupManager *)&v11 init];
  if (v7) {
    v7->fPrivateQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.CoreMotion.CMPickupDetectorPrivateQueue", 0);
  }
  return v7;
}

- (void)dealloc
{
  if (self->fDispatcher)
  {
    if (qword_1E929EA28 != -1) {
      dispatch_once(&qword_1E929EA28, &unk_1EDFD19E0);
    }
    sub_1902CDE08(qword_1E929EA20, 0, (uint64_t)self->fDispatcher);
    fDispatcher = self->fDispatcher;
    if (fDispatcher) {
      (*((void (**)(Dispatcher *))fDispatcher->var0 + 1))(fDispatcher);
    }
  }
  self->fDispatcher = 0;
  dispatch_release((dispatch_object_t)self->fPrivateQueue);
  v4.receiver = self;
  v4.super_class = (Class)CMPickupManager;
  [(CMPickupManager *)&v4 dealloc];
}

- (void)startPickupUpdates
{
  fPrivateQueue = self->fPrivateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_190562740;
  block[3] = &unk_1E568D118;
  block[4] = self;
  dispatch_sync(fPrivateQueue, block);
}

- (void)stopPickupUpdates
{
  fPrivateQueue = self->fPrivateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_190562B5C;
  block[3] = &unk_1E568D118;
  block[4] = self;
  dispatch_sync(fPrivateQueue, block);
}

+ (BOOL)isPickupAvailable
{
  return ((unint64_t)sub_1902CD6B0() >> 33) & 1;
}

- (void)onPickupStateUpdated:(const Sample *)a3
{
  int timestamp_low = LOBYTE(a3->timestamp);
  uint64_t v4 = timestamp_low == 1;
  BOOL v5 = timestamp_low == 2;
  fPrivateQueue = self->fPrivateQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_190562F30;
  v7[3] = &unk_1E568DB10;
  if (v5) {
    uint64_t v4 = 2;
  }
  v7[4] = self;
  v7[5] = v4;
  dispatch_async(fPrivateQueue, v7);
}

- (CMPickupDelegate)delegate
{
  return (CMPickupDelegate *)objc_loadWeak((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end