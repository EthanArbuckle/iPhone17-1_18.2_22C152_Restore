@interface DisplayModeRefreshRateObserver
- (DisplayModeRefreshRateObserver)init;
- (double)readHDMILatencyFromCoreAnimation;
- (int)updateHDMILatencyOnCoreAnimation:(double)a3;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
@end

@implementation DisplayModeRefreshRateObserver

- (DisplayModeRefreshRateObserver)init
{
  v8.receiver = self;
  v8.super_class = (Class)DisplayModeRefreshRateObserver;
  v2 = [(DisplayModeRefreshRateObserver *)&v8 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v2->_accessQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.coremedia.displaymoderefreshrateobserver", v3);
    v4 = (CADisplay *)[MEMORY[0x1E4F39B60] TVOutDisplay];
    v2->_tvOutDisplay = v4;
    [(CADisplay *)v4 addObserver:v2 forKeyPath:@"currentMode" options:7 context:0];
    accessQueue = v2->_accessQueue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __38__DisplayModeRefreshRateObserver_init__block_invoke;
    v7[3] = &unk_1E57C6368;
    v7[4] = v2;
    MXDispatchAsync((uint64_t)"-[DisplayModeRefreshRateObserver init]", (uint64_t)"DisplayModeRefreshRateObserver.m", 48, 0, 0, accessQueue, (uint64_t)v7);
  }
  return v2;
}

uint64_t __38__DisplayModeRefreshRateObserver_init__block_invoke(uint64_t a1)
{
  v2 = (void *)[*(id *)(*(void *)(a1 + 32) + 24) currentMode];
  uint64_t result = [v2 width];
  if (result)
  {
    uint64_t result = [v2 height];
    if (result)
    {
      [v2 refreshRate];
      *(void *)(*(void *)(a1 + 32) + 16) = v4;
      double v5 = *(double *)(*(void *)(a1 + 32) + 16);
      return HDMILatencyMgr_UpdateCurrentRefreshRate(v5);
    }
  }
  return result;
}

- (void)dealloc
{
  accessQueue = self->_accessQueue;
  if (accessQueue) {
    dispatch_release(accessQueue);
  }
  v4.receiver = self;
  v4.super_class = (Class)DisplayModeRefreshRateObserver;
  [(DisplayModeRefreshRateObserver *)&v4 dealloc];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if ([a3 isEqualToString:@"currentMode"])
  {
    accessQueue = self->_accessQueue;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __81__DisplayModeRefreshRateObserver_observeValueForKeyPath_ofObject_change_context___block_invoke;
    v13[3] = &unk_1E57C6368;
    v13[4] = self;
    MXDispatchAsync((uint64_t)"-[DisplayModeRefreshRateObserver observeValueForKeyPath:ofObject:change:context:]", (uint64_t)"DisplayModeRefreshRateObserver.m", 76, 0, 0, accessQueue, (uint64_t)v13);
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)DisplayModeRefreshRateObserver;
    [(DisplayModeRefreshRateObserver *)&v12 observeValueForKeyPath:a3 ofObject:a4 change:a5 context:a6];
  }
}

uint64_t __81__DisplayModeRefreshRateObserver_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  v2 = (void *)[*(id *)(*(void *)(a1 + 32) + 24) currentMode];
  uint64_t result = [v2 width];
  if (result)
  {
    uint64_t result = [v2 height];
    if (result)
    {
      [v2 refreshRate];
      *(void *)(*(void *)(a1 + 32) + 16) = v4;
      double v5 = *(double *)(*(void *)(a1 + 32) + 16);
      return HDMILatencyMgr_UpdateCurrentRefreshRate(v5);
    }
  }
  return result;
}

- (int)updateHDMILatencyOnCoreAnimation:(double)a3
{
  v3 = (void *)[(CADisplay *)self->_tvOutDisplay currentMode];
  if ([v3 width] && objc_msgSend(v3, "height")) {
    return 0;
  }
  else {
    return -12782;
  }
}

- (double)readHDMILatencyFromCoreAnimation
{
  v2 = (void *)[(CADisplay *)self->_tvOutDisplay currentMode];
  if ([v2 width]) {
    [v2 height];
  }
  return 0.0;
}

@end