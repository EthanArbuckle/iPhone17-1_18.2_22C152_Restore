@interface ARDisplayLink
- (ARDisplayLink)init;
- (ARDisplayLink)initWithPreferredFramesPerSecond:(int64_t)a3 callback:(id)a4;
- (ARRunLoop)runloop;
- (double)vsyncOffset;
- (int64_t)preferredFramesPerSecond;
- (void)_recomputeActualVsyncOffsetWithVsyncOffset:(double)a3 preferredFramesPerSecond:(int64_t)a4;
- (void)dealloc;
- (void)displayLinkCallback;
- (void)invalidate;
- (void)setPreferredFramesPerSecond:(int64_t)a3;
- (void)setVsyncOffset:(double)a3;
@end

@implementation ARDisplayLink

- (ARDisplayLink)initWithPreferredFramesPerSecond:(int64_t)a3 callback:(id)a4
{
  id v6 = a4;
  v20.receiver = self;
  v20.super_class = (Class)ARDisplayLink;
  v7 = [(ARDisplayLink *)&v20 init];
  v8 = v7;
  if (v7)
  {
    v7->_lock._os_unfair_lock_opaque = 0;
    uint64_t v9 = [v6 copy];
    id callback = v8->_callback;
    v8->_id callback = (id)v9;

    v8->_preferredFramesPerSecond = a3;
    v11 = [ARRunLoop alloc];
    v12 = objc_msgSend(NSString, "stringWithFormat:", @"com.apple.arkit.ardisplaylink.%p", v8);
    uint64_t v13 = [(ARRunLoop *)v11 initWithName:v12];
    runloop = v8->_runloop;
    v8->_runloop = (ARRunLoop *)v13;

    [(ARRunLoop *)v8->_runloop start];
    objc_initWeak(&location, v8);
    v15 = v8->_runloop;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __59__ARDisplayLink_initWithPreferredFramesPerSecond_callback___block_invoke;
    v17[3] = &unk_1E6187558;
    objc_copyWeak(v18, &location);
    v18[1] = (id)a3;
    [(ARRunLoop *)v15 runOnRunLoop:v17];
    objc_destroyWeak(v18);
    objc_destroyWeak(&location);
  }

  return v8;
}

void __59__ARDisplayLink_initWithPreferredFramesPerSecond_callback___block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    v8 = [[_ARDisplayLinkHelper alloc] initWithDisplayLink:WeakRetained];
    uint64_t v4 = [MEMORY[0x1E4F39B68] displayLinkWithTarget:v8 selector:sel_callback_];
    id v5 = v3[1];
    v3[1] = (id)v4;

    [v3[1] setPreferredFramesPerSecond:*(void *)(a1 + 40)];
    id v6 = v3[1];
    v7 = [MEMORY[0x1E4F1CAC0] currentRunLoop];
    [v6 addToRunLoop:v7 forMode:*MEMORY[0x1E4F1C4B0]];
  }
}

- (ARDisplayLink)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  id v5 = [NSString stringWithUTF8String:"-[ARDisplayLink init]"];
  [v3 raise:v4, @"Don't call %@.", v5 format];

  return [(ARDisplayLink *)self init];
}

- (void)dealloc
{
  [(ARDisplayLink *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)ARDisplayLink;
  [(ARDisplayLink *)&v3 dealloc];
}

- (void)setVsyncOffset:(double)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_vsyncOffset = a3;
  [(ARDisplayLink *)self _recomputeActualVsyncOffsetWithVsyncOffset:self->_preferredFramesPerSecond preferredFramesPerSecond:a3];
  os_unfair_lock_unlock(p_lock);
}

- (double)vsyncOffset
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  double vsyncOffset = self->_vsyncOffset;
  os_unfair_lock_unlock(p_lock);
  return vsyncOffset;
}

- (int64_t)preferredFramesPerSecond
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  int64_t preferredFramesPerSecond = self->_preferredFramesPerSecond;
  os_unfair_lock_unlock(p_lock);
  return preferredFramesPerSecond;
}

- (void)setPreferredFramesPerSecond:(int64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_preferredFramesPerSecond != a3)
  {
    self->_int64_t preferredFramesPerSecond = a3;
    id v6 = self->_displayLink;
    runloop = self->_runloop;
    uint64_t v9 = MEMORY[0x1E4F143A8];
    uint64_t v10 = 3221225472;
    v11 = __45__ARDisplayLink_setPreferredFramesPerSecond___block_invoke;
    v12 = &unk_1E61860A0;
    uint64_t v13 = v6;
    int64_t v14 = a3;
    v8 = v6;
    [(ARRunLoop *)runloop runOnRunLoop:&v9];
    -[ARDisplayLink _recomputeActualVsyncOffsetWithVsyncOffset:preferredFramesPerSecond:](self, "_recomputeActualVsyncOffsetWithVsyncOffset:preferredFramesPerSecond:", self->_preferredFramesPerSecond, self->_vsyncOffset, v9, v10, v11, v12);
  }
  os_unfair_lock_unlock(p_lock);
}

uint64_t __45__ARDisplayLink_setPreferredFramesPerSecond___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setPreferredFramesPerSecond:*(void *)(a1 + 40)];
}

- (void)invalidate
{
  objc_super v3 = self->_displayLink;
  runloop = self->_runloop;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __27__ARDisplayLink_invalidate__block_invoke;
  v6[3] = &unk_1E61851B0;
  v7 = v3;
  id v5 = v3;
  [(ARRunLoop *)runloop runOnRunLoop:v6];
  [(ARRunLoop *)self->_runloop cancel];
}

uint64_t __27__ARDisplayLink_invalidate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidate];
}

- (void)_recomputeActualVsyncOffsetWithVsyncOffset:(double)a3 preferredFramesPerSecond:(int64_t)a4
{
  double v5 = 1.0 / (double)a4;
  double v6 = fmod(a3, v5);
  double v7 = -0.0;
  if (v6 < 0.0) {
    double v7 = v5;
  }
  double v8 = v6 + v7 - ARDispatchAfterLeewayForTimeInterval(v6 + v7);
  runloop = self->_runloop;
  v10[1] = 3221225472;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[2] = __85__ARDisplayLink__recomputeActualVsyncOffsetWithVsyncOffset_preferredFramesPerSecond___block_invoke;
  v10[3] = &unk_1E61860A0;
  if (v8 < 0.0) {
    double v8 = 0.0;
  }
  v10[4] = self;
  *(double *)&v10[5] = v8;
  [(ARRunLoop *)runloop runOnRunLoop:v10];
}

double __85__ARDisplayLink__recomputeActualVsyncOffsetWithVsyncOffset_preferredFramesPerSecond___block_invoke(uint64_t a1)
{
  double result = *(double *)(a1 + 40);
  *(double *)(*(void *)(a1 + 32) + 32) = result;
  return result;
}

- (void)displayLinkCallback
{
  objc_initWeak(&location, self);
  objc_super v3 = (void *)MEMORY[0x1E4F1CB00];
  double actualVsyncOffset = self->_actualVsyncOffset;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __36__ARDisplayLink_displayLinkCallback__block_invoke;
  v6[3] = &unk_1E6187580;
  objc_copyWeak(&v7, &location);
  id v5 = (id)[v3 scheduledTimerWithTimeInterval:0 repeats:v6 block:actualVsyncOffset];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __36__ARDisplayLink_displayLinkCallback__block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained) {
    (*(void (**)(void))(WeakRetained[2] + 16))();
  }
  [v4 invalidate];
}

- (ARRunLoop)runloop
{
  return self->_runloop;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_runloop, 0);
  objc_storeStrong(&self->_callback, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
}

@end