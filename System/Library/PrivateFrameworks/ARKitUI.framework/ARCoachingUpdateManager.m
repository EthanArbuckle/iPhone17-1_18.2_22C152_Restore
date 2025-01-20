@interface ARCoachingUpdateManager
- (ARCoachingUpdateManagerDelegate)delegate;
- (id)init:(id)a3 metalLayer:(id)a4;
- (void)dealloc;
- (void)drawWithTimeDelta:(double)a3;
- (void)setDelegate:(id)a3;
- (void)start;
- (void)stop;
- (void)update;
@end

@implementation ARCoachingUpdateManager

- (id)init:(id)a3 metalLayer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)ARCoachingUpdateManager;
  v8 = [(ARCoachingUpdateManager *)&v13 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_metalLayer, a4);
    [(CAMetalLayer *)v9->_metalLayer setDevice:v6];
    [(CAMetalLayer *)v9->_metalLayer setPresentsWithTransaction:1];
    uint64_t v10 = [v6 newCommandQueue];
    commandQueue = v9->_commandQueue;
    v9->_commandQueue = (MTLCommandQueue *)v10;

    [(MTLCommandQueue *)v9->_commandQueue setLabel:@"MetalRenderer command queue"];
    v9->_lastUpdateTime = 0.0;
  }

  return v9;
}

- (void)dealloc
{
  [(ARCoachingUpdateManager *)self stop];
  v3.receiver = self;
  v3.super_class = (Class)ARCoachingUpdateManager;
  [(ARCoachingUpdateManager *)&v3 dealloc];
}

- (void)start
{
  if (!self->_displayLink)
  {
    objc_super v3 = [MEMORY[0x263F15780] displayLinkWithTarget:self selector:sel_update];
    displayLink = self->_displayLink;
    self->_displayLink = v3;

    [(CADisplayLink *)self->_displayLink setPreferredFramesPerSecond:60];
    v5 = self->_displayLink;
    id v6 = [MEMORY[0x263EFF9F0] mainRunLoop];
    [(CADisplayLink *)v5 addToRunLoop:v6 forMode:*MEMORY[0x263EFF478]];

    self->_lastUpdateTime = CACurrentMediaTime();
  }
}

- (void)stop
{
  displayLink = self->_displayLink;
  if (displayLink)
  {
    [(CADisplayLink *)displayLink invalidate];
    v4 = self->_displayLink;
    self->_displayLink = 0;
  }
}

- (void)update
{
  CFTimeInterval v3 = CACurrentMediaTime();
  CFTimeInterval v4 = v3 - self->_lastUpdateTime;
  v5 = [(ARCoachingUpdateManager *)self delegate];
  [v5 updateForCurrentTime:v3 timeDelta:v4];

  [(ARCoachingUpdateManager *)self drawWithTimeDelta:v4];
  self->_lastUpdateTime = v3;
}

- (void)drawWithTimeDelta:(double)a3
{
  [(CAMetalLayer *)self->_metalLayer bounds];
  if (!CGRectEqualToRect(v12, *MEMORY[0x263F001A8]))
  {
    v5 = [(MTLCommandQueue *)self->_commandQueue commandBuffer];
    if (v5)
    {
      id v10 = v5;
      id v6 = [(CAMetalLayer *)self->_metalLayer nextDrawable];
      if (v6)
      {
        [v10 setLabel:@"Frame command buffer"];
        kdebug_trace();
        [v10 addCompletedHandler:&__block_literal_global_2];
        id v7 = [(ARCoachingUpdateManager *)self delegate];

        if (v7)
        {
          v8 = [(ARCoachingUpdateManager *)self delegate];
          [v8 resizeForDrawable:v6];

          v9 = [(ARCoachingUpdateManager *)self delegate];
          [v9 drawInDrawable:v6 withCommandBuffer:v10 timeDelta:a3];
        }
        [v10 commit];
        [v10 waitUntilScheduled];
        [v6 present];
      }

      v5 = v10;
    }
  }
}

uint64_t __45__ARCoachingUpdateManager_drawWithTimeDelta___block_invoke()
{
  return kdebug_trace();
}

- (ARCoachingUpdateManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ARCoachingUpdateManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_storeStrong((id *)&self->_commandQueue, 0);

  objc_storeStrong((id *)&self->_metalLayer, 0);
}

@end