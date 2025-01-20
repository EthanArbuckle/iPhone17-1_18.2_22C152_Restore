@interface SKDisplayLink
+ (SKDisplayLink)displayLinkWithDisplay:(id)a3 handler:(id)a4 client:(id)a5;
- (BOOL)_callbackAlreadyInProgress;
- (BOOL)isPaused;
- (CADisplay)display;
- (SKDisplayLink)init;
- (SKDisplayLink)initWithDisplay:(id)a3 handler:(id)a4 client:(id)a5;
- (int64_t)preferredFramesPerSecond;
- (void)_caDisplayLinkCallback;
- (void)_callbackForNextFrame:(double)a3;
- (void)_setCallbackAlreadyInProgress:(BOOL)a3;
- (void)_setup;
- (void)_teardown;
- (void)dealloc;
- (void)setDisplay:(id)a3;
- (void)setPaused:(BOOL)a3;
- (void)setPreferredFramesPerSecond:(int64_t)a3;
@end

@implementation SKDisplayLink

- (BOOL)_callbackAlreadyInProgress
{
  return self->_callbackAlreadyInProgress;
}

- (void)_setCallbackAlreadyInProgress:(BOOL)a3
{
  self->_callbackAlreadyInProgress = a3;
}

- (SKDisplayLink)initWithDisplay:(id)a3 handler:(id)a4 client:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  v18.receiver = self;
  v18.super_class = (Class)SKDisplayLink;
  v11 = [(SKDisplayLink *)&v18 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_display, a3);
    v12->_preferredFramesPerSecond = 60.0;
    timer = v12->_timer;
    v12->_timer = 0;

    v12->_paused = 1;
    uint64_t v14 = MEMORY[0x21052F3F0](v10);
    id block = v12->_block;
    v12->_id block = (id)v14;

    caDisplayLink = v12->_caDisplayLink;
    v12->_client = a5;
    v12->_caDisplayLink = 0;

    [(SKDisplayLink *)v12 _setup];
  }

  return v12;
}

- (SKDisplayLink)init
{
  return 0;
}

+ (SKDisplayLink)displayLinkWithDisplay:(id)a3 handler:(id)a4 client:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = (void *)[objc_alloc((Class)objc_opt_class()) initWithDisplay:v7 handler:v8 client:a5];

  return (SKDisplayLink *)v9;
}

- (BOOL)isPaused
{
  return self->_paused;
}

- (void)setPaused:(BOOL)a3
{
  BOOL v3 = a3;
  kdebug_trace();
  if (self->_paused != v3)
  {
    self->_paused = v3;
    caDisplayLink = self->_caDisplayLink;
    if (caDisplayLink)
    {
      [(CADisplayLink *)caDisplayLink setPaused:v3];
    }
  }
}

- (void)setPreferredFramesPerSecond:(int64_t)a3
{
  self->_uint64_t preferredFramesPerSecond = (float)a3;
  kdebug_trace();
  caDisplayLink = self->_caDisplayLink;
  if (caDisplayLink)
  {
    uint64_t preferredFramesPerSecond = (uint64_t)self->_preferredFramesPerSecond;
    [(CADisplayLink *)caDisplayLink setPreferredFramesPerSecond:preferredFramesPerSecond];
  }
}

- (int64_t)preferredFramesPerSecond
{
  return (uint64_t)self->_preferredFramesPerSecond;
}

- (void)setDisplay:(id)a3
{
  id v7 = (CADisplay *)a3;
  if (self->_display != v7)
  {
    objc_storeStrong((id *)&self->_display, a3);
    caDisplayLink = self->_caDisplayLink;
    if (caDisplayLink)
    {
      v6 = [(CADisplayLink *)caDisplayLink display];

      if (v6 != v7)
      {
        [(SKDisplayLink *)self _teardown];
        [(SKDisplayLink *)self _setup];
      }
    }
  }
}

- (CADisplay)display
{
  return self->_display;
}

- (void)_setup
{
  self->_averageFrameTime = 0.0;
  self->_frameCount = 0;
  self->_frameCountBeginTime = 0.0;
  kdebug_trace();
  caDisplayLink = self->_caDisplayLink;
  if (caDisplayLink)
  {
    [(CADisplayLink *)caDisplayLink invalidate];
    v4 = self->_caDisplayLink;
    self->_caDisplayLink = 0;
  }
  display = self->_display;
  if (display) {
    [MEMORY[0x263F15780] displayLinkWithDisplay:display target:self selector:sel__caDisplayLinkCallback];
  }
  else {
  v6 = [MEMORY[0x263F15780] displayLinkWithTarget:self selector:sel__caDisplayLinkCallback];
  }
  id v7 = self->_caDisplayLink;
  self->_caDisplayLink = v6;

  [(CADisplayLink *)self->_caDisplayLink setPreferredFramesPerSecond:(uint64_t)self->_preferredFramesPerSecond];
  [(CADisplayLink *)self->_caDisplayLink setPaused:self->_paused];
  id v8 = self->_caDisplayLink;
  id v9 = [MEMORY[0x263EFF9F0] mainRunLoop];
  -[CADisplayLink addToRunLoop:forMode:](v8, "addToRunLoop:forMode:");
}

- (void)_teardown
{
  kdebug_trace();
  caDisplayLink = self->_caDisplayLink;
  if (caDisplayLink)
  {
    [(CADisplayLink *)caDisplayLink invalidate];
    v4 = self->_caDisplayLink;
    self->_caDisplayLink = 0;
  }
}

- (void)_callbackForNextFrame:(double)a3
{
  if (sk_debug_get_optional() && sk_debug_get_optional()) {
    kdebug_trace();
  }
  if (!self->_paused)
  {
    (*((void (**)(double))self->_block + 2))(a3);
    self->_previousFrameTime = a3;
    int64_t frameCount = self->_frameCount;
    self->_int64_t frameCount = frameCount + 1;
    if (frameCount >= 4)
    {
      float preferredFramesPerSecond = self->_preferredFramesPerSecond;
      float v7 = a3 - a3;
      float v8 = (a3 - self->_frameCountBeginTime) / (double)(frameCount + 1);
      self->_averageFrameTime = v8;
      self->_frameCountBeginTime = a3;
      self->_int64_t frameCount = 0;
      if ((float)(preferredFramesPerSecond * 0.75) > v7 && vabds_f32(v7, v8) < 0.002)
      {
        kdebug_trace();
        [(SKDisplayLink *)self _teardown];
        [(SKDisplayLink *)self _setup];
      }
    }
  }
}

- (void)dealloc
{
  [(SKDisplayLink *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)SKDisplayLink;
  [(SKDisplayLink *)&v3 dealloc];
}

- (void)_caDisplayLinkCallback
{
  char v3 = objc_opt_respondsToSelector();
  caDisplayLink = self->_caDisplayLink;
  if (v3)
  {
    [(CADisplayLink *)caDisplayLink targetTimestamp];
  }
  else
  {
    [(CADisplayLink *)caDisplayLink timestamp];
    double v5 = v6 + (float)(1.0 / self->_preferredFramesPerSecond);
  }

  [(SKDisplayLink *)self _callbackForNextFrame:v5];
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong((id *)&self->_display, 0);
  objc_storeStrong((id *)&self->_caDisplayLink, 0);

  objc_storeStrong((id *)&self->_timer, 0);
}

@end