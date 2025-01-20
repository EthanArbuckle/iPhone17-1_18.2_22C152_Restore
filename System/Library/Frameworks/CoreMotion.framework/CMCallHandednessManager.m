@interface CMCallHandednessManager
+ (BOOL)isCallHandednessAvailable;
- (CMCallHandednessDelegate)delegate;
- (CMCallHandednessManager)init;
- (void)dealloc;
- (void)onCallHandednessStateUpdated:(const Sample *)a3;
- (void)setDelegate:(id)a3;
- (void)startCallHandednessUpdates;
- (void)stopCallHandednessUpdates;
@end

@implementation CMCallHandednessManager

- (CMCallHandednessManager)init
{
  if ((objc_msgSend_isCallHandednessAvailable(CMCallHandednessManager, a2, v2) & 1) == 0)
  {
    v9 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v5, v6);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v9, v10, (uint64_t)a2, self, @"CMCallHandednessManager.mm", 45, @"CMCallHandednessManager is not supported on this platform. Use isCallHandednessAvailable to avoid this error");
  }
  v11.receiver = self;
  v11.super_class = (Class)CMCallHandednessManager;
  v7 = [(CMCallHandednessManager *)&v11 init];
  if (v7) {
    v7->fPrivateQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.CoreMotion.CMCallHandednessPrivateQueue", 0);
  }
  return v7;
}

- (void)startCallHandednessUpdates
{
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  fPrivateQueue = self->fPrivateQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_1904C4828;
  v5[3] = &unk_1E568DB10;
  v5[4] = self;
  *(CFAbsoluteTime *)&v5[5] = Current;
  dispatch_sync(fPrivateQueue, v5);
}

- (void)stopCallHandednessUpdates
{
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  if (objc_msgSend_isCallHandednessAvailable(CMCallHandednessManager, v4, v5))
  {
    fPrivateQueue = self->fPrivateQueue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = sub_1904C4C98;
    v7[3] = &unk_1E568DB10;
    v7[4] = self;
    *(CFAbsoluteTime *)&v7[5] = Current;
    dispatch_sync(fPrivateQueue, v7);
  }
}

- (void)dealloc
{
  if (objc_msgSend_isCallHandednessAvailable(CMCallHandednessManager, a2, v2)
    && self->fDispatcher)
  {
    if (qword_1E929E998 != -1) {
      dispatch_once(&qword_1E929E998, &unk_1EDFD22C0);
    }
    sub_1902CDE08(qword_1E929E990, 0, (uint64_t)self->fDispatcher);
  }
  fDispatcher = self->fDispatcher;
  if (fDispatcher) {
    (*((void (**)(Dispatcher *))fDispatcher->var0 + 1))(fDispatcher);
  }
  self->fDispatcher = 0;
  dispatch_release((dispatch_object_t)self->fPrivateQueue);
  v5.receiver = self;
  v5.super_class = (Class)CMCallHandednessManager;
  [(CMCallHandednessManager *)&v5 dealloc];
}

+ (BOOL)isCallHandednessAvailable
{
  sub_1902BAD40();

  return sub_19046BC40();
}

- (void)onCallHandednessStateUpdated:(const Sample *)a3
{
  int timestamp_low = LOBYTE(a3->timestamp);
  uint64_t v4 = timestamp_low == 1;
  BOOL v5 = timestamp_low == 2;
  fPrivateQueue = self->fPrivateQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1904C5170;
  v7[3] = &unk_1E568DB10;
  if (v5) {
    uint64_t v4 = 2;
  }
  v7[4] = self;
  v7[5] = v4;
  dispatch_async(fPrivateQueue, v7);
}

- (CMCallHandednessDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (CMCallHandednessDelegate *)a3;
}

@end