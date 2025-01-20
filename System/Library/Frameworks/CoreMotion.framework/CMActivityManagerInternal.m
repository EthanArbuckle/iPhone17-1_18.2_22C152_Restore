@interface CMActivityManagerInternal
- (CMActivityManagerInternal)init;
- (void)connect;
- (void)dealloc;
- (void)disconnect;
- (void)overrideOscarSideband:(BOOL)a3 withState:(int64_t)a4;
- (void)simulateMotionState:(BOOL)a3 withState:(int64_t)a4;
- (void)simulateMotionStateYouthWithState:(int64_t)a3;
- (void)startActivityUpdatesWithHandlerPrivate:(id)a3;
- (void)stopActivityUpdatesPrivate;
@end

@implementation CMActivityManagerInternal

- (void)connect
{
  if (!self->fLocationdConnection) {
    operator new();
  }
}

- (void)simulateMotionState:(BOOL)a3 withState:(int64_t)a4
{
  v16[2] = *MEMORY[0x1E4F143B8];
  if (!self->fMotionStateSimSemaphore) {
    __assert_rtn("-[CMActivityManagerInternal simulateMotionState:withState:]", "CMActivityManager.mm", 238, "fMotionStateSimSemaphore && \"fMotionStateSimSemaphore not initialized.\"");
  }
  BOOL v5 = a3;
  objc_msgSend_connect(self, a2, a3);
  if (self->fLocationdConnection)
  {
    v15[0] = @"CMMotionStateSim";
    v16[0] = objc_msgSend_numberWithBool_(NSNumber, v7, v5);
    v15[1] = @"CMMotionStateSimState";
    v16[1] = objc_msgSend_numberWithInteger_(NSNumber, v8, a4);
    uint64_t v14 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v9, (uint64_t)v16, v15, 2);
    self->fMotionStateSimWaiting = 1;
    sub_1902BB770("kCLConnectionMessageMotionStateSim", &v14, &v12);
    v11 = v13;
    if (v13) {
      atomic_fetch_add_explicit(&v13->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    CLConnectionClient::sendMessage();
    if (v11) {
      sub_1902D8B58(v11);
    }
    if (v13) {
      sub_1902D8B58(v13);
    }
  }
  else
  {
    self->fMotionStateSimResult = 3;
    fMotionStateSimSemaphore = self->fMotionStateSimSemaphore;
    dispatch_semaphore_signal(fMotionStateSimSemaphore);
  }
}

- (void)dealloc
{
  objc_msgSend_disconnect(self, a2, v2);
  id fActivityHandler = self->fActivityHandler;
  if (fActivityHandler)
  {

    self->id fActivityHandler = 0;
  }
  dispatch_release((dispatch_object_t)self->fPrivateQueue);
  self->fPrivateQueue = 0;
  fSidebandOverrideSemaphore = self->fSidebandOverrideSemaphore;
  if (fSidebandOverrideSemaphore) {
    dispatch_release(fSidebandOverrideSemaphore);
  }
  fSidebandOverrideQueue = self->fSidebandOverrideQueue;
  if (fSidebandOverrideQueue) {
    dispatch_release(fSidebandOverrideQueue);
  }
  v7.receiver = self;
  v7.super_class = (Class)CMActivityManagerInternal;
  [(CMActivityManagerInternal *)&v7 dealloc];
}

- (void)stopActivityUpdatesPrivate
{
  v14[1] = *MEMORY[0x1E4F143B8];
  if (self->fActivityHandler)
  {
    v13 = @"kCLConnectionMessageSubscribeKey";
    v14[0] = MEMORY[0x1E4F1CC28];
    uint64_t v12 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], a2, (uint64_t)v14, &v13, 1);
    sub_1902B1F24(&v10, &v12);
    v3 = v11;
    uint64_t v8 = v10;
    v9 = v11;
    if (v11) {
      atomic_fetch_add_explicit(&v11->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    CLConnectionClient::sendMessage();
    if (v9) {
      sub_1902D8B58(v9);
    }
    sub_1902C3F54(&__p, "kCLConnectionMessageMotionState");
    CLConnectionClient::setHandlerForMessage();
    if (v7 < 0) {
      operator delete(__p);
    }
    self->fSubscribedToMotionState = 0;

    self->id fActivityHandler = 0;
    if (!self->fSidebandOverrideSemaphore) {
      objc_msgSend_disconnect(self, v4, v5);
    }
    if (v3) {
      sub_1902D8B58(v3);
    }
  }
}

- (CMActivityManagerInternal)init
{
  v4.receiver = self;
  v4.super_class = (Class)CMActivityManagerInternal;
  uint64_t v2 = [(CMActivityManagerInternal *)&v4 init];
  if (v2) {
    v2->fPrivateQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.CoreMotion.CMActivityManagerPrivateQueue", 0);
  }
  return v2;
}

- (void)disconnect
{
  fLocationdConnection = self->fLocationdConnection;
  if (fLocationdConnection)
  {
    uint64_t v4 = MEMORY[0x192FCC3F0](fLocationdConnection, a2);
    MEMORY[0x192FCC980](v4, 0xB0C40BC2CC919);
    self->fLocationdConnection = 0;
  }
}

- (void)startActivityUpdatesWithHandlerPrivate:(id)a3
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id fActivityHandler = self->fActivityHandler;
  if (fActivityHandler != a3)
  {

    self->id fActivityHandler = (id)objc_msgSend_copy(a3, v6, v7);
    objc_msgSend_connect(self, v8, v9);
    if (!self->fSubscribedToMotionState)
    {
      v16 = @"kCLConnectionMessageSubscribeKey";
      v17[0] = MEMORY[0x1E4F1CC38];
      uint64_t v15 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v10, (uint64_t)v17, &v16, 1);
      sub_1902B1F24(&v13, &v15);
      v11 = v14;
      uint64_t v12 = v14;
      if (v14) {
        atomic_fetch_add_explicit(&v14->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      CLConnectionClient::sendMessage();
      if (v12) {
        sub_1902D8B58(v12);
      }
      self->fSubscribedToMotionState = 1;
      if (v11) {
        sub_1902D8B58(v11);
      }
    }
  }
}

- (void)overrideOscarSideband:(BOOL)a3 withState:(int64_t)a4
{
  v16[2] = *MEMORY[0x1E4F143B8];
  if (!self->fSidebandOverrideSemaphore) {
    __assert_rtn("-[CMActivityManagerInternal overrideOscarSideband:withState:]", "CMActivityManager.mm", 219, "fSidebandOverrideSemaphore && \"fSidbandOverrideSemaphore not initialized.\"");
  }
  BOOL v5 = a3;
  objc_msgSend_connect(self, a2, a3);
  if (self->fLocationdConnection)
  {
    v15[0] = @"CMOverrideSidebandOverride";
    v16[0] = objc_msgSend_numberWithBool_(NSNumber, v7, v5);
    v15[1] = @"CMStateSidebandState";
    v16[1] = objc_msgSend_numberWithInteger_(NSNumber, v8, a4);
    uint64_t v14 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v9, (uint64_t)v16, v15, 2);
    self->fSidebandOverrideWaiting = 1;
    sub_1904EF0B0("kCLConnectionMessageSidebandOverride", &v14, &v12);
    v11 = v13;
    if (v13) {
      atomic_fetch_add_explicit(&v13->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    CLConnectionClient::sendMessage();
    if (v11) {
      sub_1902D8B58(v11);
    }
    if (v13) {
      sub_1902D8B58(v13);
    }
  }
  else
  {
    self->fSidebandOverrideResult = 3;
    fSidebandOverrideSemaphore = self->fSidebandOverrideSemaphore;
    dispatch_semaphore_signal(fSidebandOverrideSemaphore);
  }
}

- (void)simulateMotionStateYouthWithState:(int64_t)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  objc_msgSend_connect(self, a2, a3);
  if (self->fLocationdConnection)
  {
    v11 = @"CMMotionStateSimState";
    v12[0] = objc_msgSend_numberWithInteger_(NSNumber, v5, a3);
    uint64_t v10 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v6, (uint64_t)v12, &v11, 1);
    sub_19044262C("kCLConnectionMessageMotionStateYouthSim", &v10, &v8);
    uint64_t v7 = v9;
    if (v9) {
      atomic_fetch_add_explicit(&v9->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    CLConnectionClient::sendMessage();
    if (v7) {
      sub_1902D8B58(v7);
    }
    if (v9) {
      sub_1902D8B58(v9);
    }
  }
  else
  {
    self->fMotionStateYouthSimResult = 3;
  }
}

@end