@interface ADPeerLocationPolicy
- (ADPeerLocationPolicy)init;
- (ADPeerLocationPolicyDelegate)delegate;
- (double)allowedTimelimit;
- (void)_cancelTimer;
- (void)_resetTimer;
- (void)locationDataWasRecievedFromPeer;
- (void)locationPeerDidChange;
- (void)setAllowedTimelimit:(double)a3;
- (void)setDelegate:(id)a3;
@end

@implementation ADPeerLocationPolicy

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_timerSource, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)setAllowedTimelimit:(double)a3
{
  self->_allowedTimelimit = a3;
}

- (double)allowedTimelimit
{
  return self->_allowedTimelimit;
}

- (void)setDelegate:(id)a3
{
}

- (ADPeerLocationPolicyDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (ADPeerLocationPolicyDelegate *)WeakRetained;
}

- (void)_resetTimer
{
  [(ADPeerLocationPolicy *)self _cancelTimer];
  double allowedTimelimit = self->_allowedTimelimit;
  queue = self->_queue;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100226BD4;
  handler[3] = &unk_10050E138;
  handler[4] = self;
  v5 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, queue);
  double v6 = 4.32e13;
  if (allowedTimelimit > 0.0) {
    double v6 = allowedTimelimit * 1000000000.0;
  }
  uint64_t v7 = (unint64_t)v6;
  dispatch_time_t v8 = dispatch_time(0, (unint64_t)v6);
  dispatch_source_set_timer(v5, v8, v7, 0);
  dispatch_source_set_event_handler(v5, handler);
  timerSource = self->_timerSource;
  self->_timerSource = (OS_dispatch_source *)v5;

  dispatch_resume((dispatch_object_t)self->_timerSource);
}

- (void)_cancelTimer
{
  timerSource = self->_timerSource;
  if (timerSource)
  {
    dispatch_source_cancel(timerSource);
    v4 = self->_timerSource;
    self->_timerSource = 0;
  }
}

- (void)locationPeerDidChange
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100226CE8;
  block[3] = &unk_10050E138;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)locationDataWasRecievedFromPeer
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100226DB8;
  block[3] = &unk_10050E138;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (ADPeerLocationPolicy)init
{
  v7.receiver = self;
  v7.super_class = (Class)ADPeerLocationPolicy;
  v2 = [(ADPeerLocationPolicy *)&v7 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("ADPeerLocationPolicy", v3);

    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    v2->_double allowedTimelimit = 43200.0;
  }
  return v2;
}

@end