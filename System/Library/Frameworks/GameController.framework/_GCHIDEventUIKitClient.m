@interface _GCHIDEventUIKitClient
- (_GCHIDEventUIKitClient)init;
- (_GCHIDEventUIKitClient)initWithQueue:(id)a3;
- (void)dealloc;
- (void)observerDeliveryPolicyDidChange:(id)a3;
- (void)publishHIDEvent:(__IOHIDEvent *)a3;
@end

@implementation _GCHIDEventUIKitClient

- (_GCHIDEventUIKitClient)initWithQueue:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  v17.receiver = self;
  v17.super_class = (Class)_GCHIDEventUIKitClient;
  v5 = [(_GCHIDEventSubject *)&v17 init];
  if (!v5) {
    goto LABEL_4;
  }
  v6 = +[UIApplication sharedApplication];
  if (v6)
  {
    objc_initWeak(&location, v5);
    v11 = _NSConcreteStackBlock;
    uint64_t v12 = 3221225472;
    v13 = __40___GCHIDEventUIKitClient_initWithQueue___block_invoke;
    v14 = &unk_26D22D360;
    objc_copyWeak(&v15, &location);
    [(_GCHIDEventUIKitClient *)v6 _setHIDGameControllerEventObserver:&v11 onQueue:v4];
    v7 = (BKSHIDEventDeliveryPolicyObserver *)objc_alloc_init((Class)&off_26D2CF610);
    hidObserver = v5->_hidObserver;
    v5->_hidObserver = v7;

    v9 = +[BKSHIDEventDeferringEnvironment keyboardFocusEnvironment];
    [(BKSHIDEventDeliveryPolicyObserver *)v5->_hidObserver setDeferringEnvironment:v9];

    [(BKSHIDEventDeliveryPolicyObserver *)v5->_hidObserver addObserver:v5];
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);

LABEL_4:
    v6 = v5;
  }

  return v6;
}

- (_GCHIDEventUIKitClient)init
{
  return [(_GCHIDEventUIKitClient *)self initWithQueue:&_dispatch_main_q];
}

- (void)dealloc
{
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  [(BKSHIDEventDeliveryPolicyObserver *)self->_hidObserver removeObserver:self];
  v3 = +[UIApplication sharedApplication];
  [v3 _removeHIDGameControllerEventObserver];

  v4.receiver = self;
  v4.super_class = (Class)_GCHIDEventUIKitClient;
  [(_GCHIDEventUIKitClient *)&v4 dealloc];
}

- (void)publishHIDEvent:(__IOHIDEvent *)a3
{
  self->_hidObserverWasActive = 1;
  v3.receiver = self;
  v3.super_class = (Class)_GCHIDEventUIKitClient;
  [(_GCHIDEventSubject *)&v3 publishHIDEvent:a3];
}

- (void)observerDeliveryPolicyDidChange:(id)a3
{
  id v4 = a3;
  if (gc_isInternalBuild())
  {
    v6 = getGCLogger();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      BOOL hidObserverWasActive = self->_hidObserverWasActive;
      *(_DWORD *)buf = 67109376;
      BOOL v10 = hidObserverWasActive;
      __int16 v11 = 1024;
      int v12 = [v4 canReceiveEvents];
      _os_log_impl(&dword_220998000, v6, OS_LOG_TYPE_INFO, "BKSHIDEventDeliveryPolicy did change %{BOOL}d -> %{BOOL}d", buf, 0xEu);
    }
  }
  if (self->_hidObserverWasActive && ([v4 canReceiveEvents] & 1) == 0)
  {
    mach_absolute_time();
    v5 = (const void *)IOHIDEventCreate();
    IOHIDEventSetSenderID();
    v8.receiver = self;
    v8.super_class = (Class)_GCHIDEventUIKitClient;
    [(_GCHIDEventSubject *)&v8 publishHIDEvent:v5];
    CFRelease(v5);
    self->_BOOL hidObserverWasActive = 0;
  }
}

- (void).cxx_destruct
{
}

@end