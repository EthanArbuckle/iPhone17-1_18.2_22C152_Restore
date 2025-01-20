@interface CAMetalDisplayLink
- (BOOL)isPaused;
- (CAFrameRateRange)preferredFrameRateRange;
- (CAMetalDisplayLink)initWithMetalLayer:(CAMetalLayer *)layer;
- (float)preferredFrameLatency;
- (id)_initWithMetalLinkItem:(void *)a3;
- (id)delegate;
- (void)addToRunLoop:(NSRunLoop *)runloop forMode:(NSRunLoopMode)mode;
- (void)dealloc;
- (void)invalidate;
- (void)removeFromRunLoop:(NSRunLoop *)runloop forMode:(NSRunLoopMode)mode;
- (void)setDelegate:(id)delegate;
- (void)setPaused:(BOOL)paused;
- (void)setPreferredFrameLatency:(float)preferredFrameLatency;
- (void)setPreferredFrameRateRange:(CAFrameRateRange)preferredFrameRateRange;
@end

@implementation CAMetalDisplayLink

- (void).cxx_destruct
{
}

- (void)setDelegate:(id)delegate
{
}

- (id)delegate
{
  return objc_loadWeak((id *)&self->_delegate);
}

- (BOOL)isPaused
{
  return *((unsigned char *)self->_impl + 316) & 1;
}

- (void)setPaused:(BOOL)paused
{
}

- (CAFrameRateRange)preferredFrameRateRange
{
  impl = (float *)self->_impl;
  float v3 = impl[19];
  float v4 = impl[20];
  float v5 = impl[21];
  result.preferred = v5;
  result.maximum = v4;
  result.minimum = v3;
  return result;
}

- (void)setPreferredFrameRateRange:(CAFrameRateRange)preferredFrameRateRange
{
  float preferred = preferredFrameRateRange.preferred;
  float maximum = preferredFrameRateRange.maximum;
  float minimum = preferredFrameRateRange.minimum;
  if (!CAFrameRateRangeIsValid(preferredFrameRateRange.minimum, preferredFrameRateRange.maximum, preferredFrameRateRange.preferred))
  {
    uint64_t v11 = [NSString stringWithFormat:@"invalid range (minimum: %.2f maximum: %.2f preferred: %.2f)", minimum, maximum, preferred];
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v11 userInfo:0]);
  }
  impl = (CA::Display::DisplayLink **)self->_impl;
  float v8 = minimum;
  float v9 = maximum;
  float v10 = preferred;

  CA::Display::DisplayLinkItem::set_preferred_fps_range(impl, *(CAFrameRateRange *)&v8, 1, 1);
}

- (float)preferredFrameLatency
{
  return *((float *)self->_impl + 82);
}

- (void)setPreferredFrameLatency:(float)preferredFrameLatency
{
  if (preferredFrameLatency == 1.0 || preferredFrameLatency == 2.0) {
    *((float *)self->_impl + 82) = preferredFrameLatency;
  }
}

- (void)invalidate
{
}

- (void)removeFromRunLoop:(NSRunLoop *)runloop forMode:(NSRunLoopMode)mode
{
  impl = (CA::Display::DisplayLinkItem *)self->_impl;
  v6 = [(NSRunLoop *)runloop getCFRunLoop];

  CA::Display::DisplayLinkItem::unschedule(impl, v6, (const __CFString *)mode);
}

- (void)addToRunLoop:(NSRunLoop *)runloop forMode:(NSRunLoopMode)mode
{
  impl = (CA::Display::DisplayLinkItem *)self->_impl;
  v6 = [(NSRunLoop *)runloop getCFRunLoop];

  CA::Display::DisplayLinkItem::schedule(impl, v6, (const __CFString *)mode);
}

- (void)dealloc
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  impl = self->_impl;
  if (impl) {
    (*(void (**)(void *, SEL))(*(void *)impl + 8))(impl, a2);
  }
  v4.receiver = self;
  v4.super_class = (Class)CAMetalDisplayLink;
  [(CAMetalDisplayLink *)&v4 dealloc];
}

- (CAMetalDisplayLink)initWithMetalLayer:(CAMetalLayer *)layer
{
  uint64_t v4 = *(void *)(*((void *)layer->_priv + 2) + 48);
  if (v4) {
    int v5 = *(_DWORD *)(*(void *)(v4 + 24) + 24);
  }
  else {
    int v5 = 0;
  }
  if (CADisplayLookupFromDisplayId(v5)) {
    operator new();
  }

  return 0;
}

- (id)_initWithMetalLinkItem:(void *)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v7.receiver = self;
  v7.super_class = (Class)CAMetalDisplayLink;
  uint64_t v4 = [(CAMetalDisplayLink *)&v7 init];
  int v5 = v4;
  if (v4)
  {
    v4->_impl = a3;
    *((void *)a3 + 32) = v4;
  }
  else if (a3)
  {
    (*(void (**)(void *))(*(void *)a3 + 8))(a3);
  }
  return v5;
}

@end