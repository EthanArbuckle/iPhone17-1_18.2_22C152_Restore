@interface AXRDeviceRemoteScrollAccumulator
- (AXRDeviceRemoteScrollAccumulator)init;
- (AXRDeviceRemoteScrollAccumulatorDelegate)delegate;
- (void)_queue_accumulateScrollAmount:(int64_t)a3;
- (void)accumulateScrollAmount:(int64_t)a3;
- (void)setDelegate:(id)a3;
@end

@implementation AXRDeviceRemoteScrollAccumulator

- (AXRDeviceRemoteScrollAccumulator)init
{
  v8.receiver = self;
  v8.super_class = (Class)AXRDeviceRemoteScrollAccumulator;
  v2 = [(AXRDeviceRemoteScrollAccumulator *)&v8 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_USER_INTERACTIVE, 0);

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.accessibility.axremoted.scroll.accumulator", v4);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;
  }
  return v2;
}

- (void)accumulateScrollAmount:(int64_t)a3
{
  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000041A8;
  v4[3] = &unk_100008680;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async((dispatch_queue_t)queue, v4);
}

- (void)_queue_accumulateScrollAmount:(int64_t)a3
{
  +[NSDate timeIntervalSinceReferenceDate];
  if (v5 - self->_lastScrollEventTime >= 0.25)
  {
    self->_scrollIsActive = 0;
    self->_lastScrollEventTime = v5;
    self->_int64_t currentAccumulatedScroll = a3;
    return;
  }
  int64_t currentAccumulatedScroll = self->_currentAccumulatedScroll;
  self->_scrollIsActive = 1;
  self->_lastScrollEventTime = v5;
  int64_t v7 = currentAccumulatedScroll + a3;
  self->_int64_t currentAccumulatedScroll = v7;
  if (v7 < 51)
  {
    if (v7 > -51) {
      return;
    }
    v9 = ax_remote_daemon_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      sub_100005350(v9);
    }

    self->_currentAccumulatedScroll += 50;
  }
  else
  {
    objc_super v8 = ax_remote_daemon_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      sub_10000530C(v8);
    }

    self->_currentAccumulatedScroll -= 50;
  }
  AXPerformBlockAsynchronouslyOnMainThread();
}

- (AXRDeviceRemoteScrollAccumulatorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AXRDeviceRemoteScrollAccumulatorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end