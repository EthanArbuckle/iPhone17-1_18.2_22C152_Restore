@interface MX_HIDEventObserver
- (BOOL)smartCoverClosed;
- (MX_HIDEventObserver)init;
- (OS_dispatch_queue)accessQueue;
- (void)dealloc;
- (void)handleButtonEvent:(__IOHIDEvent *)a3;
- (void)handleEvent:(__IOHIDEvent *)a3;
- (void)setAccessQueue:(id)a3;
- (void)setSmartCoverClosed:(BOOL)a3;
@end

@implementation MX_HIDEventObserver

- (MX_HIDEventObserver)init
{
  v7.receiver = self;
  v7.super_class = (Class)MX_HIDEventObserver;
  v2 = [(MX_HIDEventObserver *)&v7 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = dispatch_queue_create("com.apple.mediaexperience.hideventobserver", v3);
    v2->_accessQueue = (OS_dispatch_queue *)v4;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __27__MX_HIDEventObserver_init__block_invoke;
    v6[3] = &unk_1E57C6368;
    v6[4] = v2;
    MXDispatchAsync((uint64_t)"-[MX_HIDEventObserver init]", (uint64_t)"MX_IOKit.m", 73, 0, 0, v4, (uint64_t)v6);
  }
  return v2;
}

- (void)dealloc
{
  v3 = (void *)MEMORY[0x1997179E0](self, a2);
  accessQueue = self->_accessQueue;
  if (accessQueue) {
    dispatch_release(accessQueue);
  }
  mHIDClient = self->mHIDClient;
  if (mHIDClient) {
    CFRelease(mHIDClient);
  }
  v6.receiver = self;
  v6.super_class = (Class)MX_HIDEventObserver;
  [(MX_HIDEventObserver *)&v6 dealloc];
}

- (void)handleButtonEvent:(__IOHIDEvent *)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t IntegerValue = IOHIDEventGetIntegerValue();
  uint64_t v5 = IOHIDEventGetIntegerValue();
  if (IntegerValue == 65289 && v5 == 2)
  {
    gFlap1StateIsEngaged = IOHIDEventGetIntegerValue() == 1;
    if (!dword_1E9359ED0) {
      goto LABEL_11;
    }
  }
  else
  {
    if (IntegerValue != 65289) {
      goto LABEL_11;
    }
    if (v5 != 1) {
      goto LABEL_11;
    }
    gOpenStateIsEngaged = IOHIDEventGetIntegerValue() == 1;
    if (!dword_1E9359ED0) {
      goto LABEL_11;
    }
  }
  os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
  os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
  fig_log_call_emit_and_clean_up_after_send_and_compose();
LABEL_11:
  if (gFlap1StateIsEngaged) {
    BOOL v8 = gOpenStateIsEngaged == 0;
  }
  else {
    BOOL v8 = 1;
  }
  uint64_t v9 = !v8;
  -[MX_HIDEventObserver setSmartCoverClosed:](self, "setSmartCoverClosed:", v9, v10, v11);
}

- (void)handleEvent:(__IOHIDEvent *)a3
{
  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x2020000000;
  v6[3] = a3;
  if (a3) {
    CFRetain(a3);
  }
  v4 = [(MX_HIDEventObserver *)self accessQueue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __35__MX_HIDEventObserver_handleEvent___block_invoke;
  v5[3] = &unk_1E57C8DC8;
  v5[4] = self;
  v5[5] = v6;
  MXDispatchAsync((uint64_t)"-[MX_HIDEventObserver handleEvent:]", (uint64_t)"MX_IOKit.m", 157, 0, 0, v4, (uint64_t)v5);
  _Block_object_dispose(v6, 8);
}

- (OS_dispatch_queue)accessQueue
{
  return self->_accessQueue;
}

- (void)setAccessQueue:(id)a3
{
}

- (BOOL)smartCoverClosed
{
  return self->_smartCoverClosed;
}

- (void)setSmartCoverClosed:(BOOL)a3
{
  self->_smartCoverClosed = a3;
}

@end