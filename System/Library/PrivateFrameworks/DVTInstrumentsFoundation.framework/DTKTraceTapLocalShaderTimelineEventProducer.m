@interface DTKTraceTapLocalShaderTimelineEventProducer
+ (BOOL)supportsConfig:(id)a3;
- (DTKTraceTapLocalShaderTimelineEventProducer)init;
- (void)_notifyShaderBinaryInfo;
- (void)dealloc;
- (void)start;
- (void)stop;
@end

@implementation DTKTraceTapLocalShaderTimelineEventProducer

+ (BOOL)supportsConfig:(id)a3
{
  id v3 = a3;
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = sub_2308FD470;
  v6[3] = &unk_264B8EBB0;
  v6[4] = &v7;
  [v3 enumerateTriggerConfigs:v6];
  char v4 = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (DTKTraceTapLocalShaderTimelineEventProducer)init
{
  v6.receiver = self;
  v6.super_class = (Class)DTKTraceTapLocalShaderTimelineEventProducer;
  v2 = [(DTKTraceTapLocalShaderTimelineEventProducer *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.dt.instruments.ktrace.shadertimelineproducer", 0);
    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)v3;

    notify_register_check("com.apple.Metal.AGXEnableOSSignposts", &v2->_token);
  }
  return v2;
}

- (void)dealloc
{
  timer = self->_timer;
  if (timer)
  {
    dispatch_source_cancel(timer);
    char v4 = self->_timer;
    self->_timer = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)DTKTraceTapLocalShaderTimelineEventProducer;
  [(DTKTraceTapLocalShaderTimelineEventProducer *)&v5 dealloc];
}

- (void)_notifyShaderBinaryInfo
{
  notify_set_state(self->_token, 0);
  notify_post("com.apple.Metal.AGXEnableOSSignposts");
  dispatch_time_t v3 = dispatch_time(0, 100000000);
  char v4 = dispatch_get_global_queue(33, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_2308FD6DC;
  block[3] = &unk_264B8D590;
  block[4] = self;
  dispatch_after(v3, v4, block);
}

- (void)start
{
  dispatch_time_t v3 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x263EF8400], 0, 0, (dispatch_queue_t)self->_workQueue);
  timer = self->_timer;
  self->_timer = v3;

  objc_super v5 = self->_timer;
  dispatch_time_t v6 = dispatch_time(0, 5000000000);
  dispatch_source_set_timer(v5, v6, 0x12A05F200uLL, 0xBEBC200uLL);
  objc_initWeak(&location, self);
  uint64_t v7 = self->_timer;
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = sub_2308FD854;
  handler[3] = &unk_264B8FEE8;
  objc_copyWeak(&v9, &location);
  handler[4] = self;
  dispatch_source_set_event_handler(v7, handler);
  dispatch_resume((dispatch_object_t)self->_timer);
  [(DTKTraceTapLocalShaderTimelineEventProducer *)self _notifyShaderBinaryInfo];
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)stop
{
  timer = self->_timer;
  if (timer)
  {
    dispatch_source_cancel(timer);
    char v4 = self->_timer;
    self->_timer = 0;
  }
  notify_set_state(self->_token, 0);
  notify_post("com.apple.Metal.AGXEnableOSSignposts");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

@end