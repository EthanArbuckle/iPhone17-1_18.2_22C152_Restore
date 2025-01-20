@interface WKDisplayLinkHandler
- (WKDisplayLinkHandler)initWithDrawingAreaProxy:(void *)a3;
- (unsigned)nominalFramesPerSecond;
- (void)dealloc;
- (void)didChangeNominalFramesPerSecond;
- (void)displayLinkFired:(id)a3;
- (void)invalidate;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)pause;
- (void)schedule;
- (void)setPreferredFramesPerSecond:(int64_t)a3;
@end

@implementation WKDisplayLinkHandler

- (WKDisplayLinkHandler)initWithDrawingAreaProxy:(void *)a3
{
  v18.receiver = self;
  v18.super_class = (Class)WKDisplayLinkHandler;
  v4 = [(WKDisplayLinkHandler *)&v18 init];
  v5 = v4;
  if (v4)
  {
    v4->_drawingAreaProxy = a3;
    v6 = (CADisplayLink *)[MEMORY[0x1E4F39B68] displayLinkWithTarget:v4 selector:sel_displayLinkFired_];
    v5->_displayLink = v6;
    uint64_t v7 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
    [(CADisplayLink *)v6 addToRunLoop:v7 forMode:*MEMORY[0x1E4F1C4B0]];
    v8 = (void *)[(CADisplayLink *)v5->_displayLink display];
    [v8 addObserver:v5 forKeyPath:@"refreshRate" options:1 context:displayRefreshRateObservationContext];
    [(CADisplayLink *)v5->_displayLink setPaused:1];
    if (!a3) {
      goto LABEL_9;
    }
    uint64_t v10 = *(void *)(*((void *)a3 + 5) + 8);
    if (v10) {
      uint64_t v11 = v10 - 16;
    }
    else {
      uint64_t v11 = 0;
    }
    uint64_t v12 = *(void *)(v11 + 272);
    {
      WebKit::WebPreferencesKey::preferPageRenderingUpdatesNear60FPSEnabledKey(void)::$_0::operator() const(void)::impl += 2;
      WebKit::WebPreferencesKey::preferPageRenderingUpdatesNear60FPSEnabledKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::preferPageRenderingUpdatesNear60FPSEnabledKey(void)::$_0::operator() const(void)::impl;
    }
    if ((WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)(v12 + 40), (WTF::StringImpl **)&WebKit::WebPreferencesKey::preferPageRenderingUpdatesNear60FPSEnabledKey(void)::key, v9) & 1) == 0)
    {
      displayLink = v5->_displayLink;
      if (_MergedGlobals_86 == 1)
      {
        LODWORD(v13) = dword_1EB359B2C;
        LODWORD(v14) = unk_1EB359B30;
        LODWORD(v15) = dword_1EB359B34;
      }
      else
      {
        *(CAFrameRateRange *)&double v13 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
        dword_1EB359B2C = LODWORD(v13);
        unk_1EB359B30 = LODWORD(v14);
        dword_1EB359B34 = LODWORD(v15);
        _MergedGlobals_86 = 1;
      }
      -[CADisplayLink setPreferredFrameRateRange:](displayLink, "setPreferredFrameRateRange:", v13, v14, v15);
      [(CADisplayLink *)v5->_displayLink setHighFrameRateReason:2883587];
    }
    else
    {
LABEL_9:
      [(CADisplayLink *)v5->_displayLink setPreferredFramesPerSecond:60];
    }
  }
  return v5;
}

- (void)displayLinkFired:(id)a3
{
}

- (void)setPreferredFramesPerSecond:(int64_t)a3
{
}

- (void)schedule
{
}

- (unsigned)nominalFramesPerSecond
{
  uint64_t v4 = *(void *)(*((void *)self->_drawingAreaProxy + 5) + 8);
  if (v4) {
    uint64_t v5 = v4 - 16;
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = *(void *)(v5 + 272);
  {
    WebKit::WebPreferencesKey::webAnimationsCustomFrameRateEnabledKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::webAnimationsCustomFrameRateEnabledKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::webAnimationsCustomFrameRateEnabledKey(void)::$_0::operator() const(void)::impl;
  }
  if ((WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)(v6 + 40), (WTF::StringImpl **)&WebKit::WebPreferencesKey::webAnimationsCustomFrameRateEnabledKey(void)::key, v2) & 1) == 0)
  {
    uint64_t v8 = *(void *)(v5 + 272);
    {
      WebKit::WebPreferencesKey::preferPageRenderingUpdatesNear60FPSEnabledKey(void)::$_0::operator() const(void)::impl += 2;
      WebKit::WebPreferencesKey::preferPageRenderingUpdatesNear60FPSEnabledKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::preferPageRenderingUpdatesNear60FPSEnabledKey(void)::$_0::operator() const(void)::impl;
    }
    if (WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)(v8 + 40), (WTF::StringImpl **)&WebKit::WebPreferencesKey::preferPageRenderingUpdatesNear60FPSEnabledKey(void)::key, v7))return 60; {
  }
    }
  [(CADisplayLink *)self->_displayLink maximumRefreshRate];
  if (v9 > 0.0) {
    return vcvtad_u64_f64(1.0 / v9);
  }
  else {
    return 60;
  }
}

- (void)pause
{
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)WKDisplayLinkHandler;
  [(WKDisplayLinkHandler *)&v2 dealloc];
}

- (void)invalidate
{
  v3 = (void *)[(CADisplayLink *)self->_displayLink display];
  [v3 removeObserver:self forKeyPath:@"refreshRate" context:displayRefreshRateObservationContext];
  [(CADisplayLink *)self->_displayLink invalidate];
  self->_displayLink = 0;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if ((void *)displayRefreshRateObservationContext == a6) {
    [(WKDisplayLinkHandler *)self didChangeNominalFramesPerSecond];
  }
}

- (void)didChangeNominalFramesPerSecond
{
  uint64_t v2 = *(void *)(*((void *)self->_drawingAreaProxy + 5) + 8);
  if (v2) {
    uint64_t v3 = v2 - 16;
  }
  else {
    uint64_t v3 = 0;
  }
  CFRetain(*(CFTypeRef *)(v3 + 8));
  uint64_t v4 = *(void *)(v3 + 824);
  if ((v4 & 0xFF00000000) != 0) {
    WebKit::WebPageProxy::windowScreenDidChange((WebKit::WebPageProxy *)v3, v4);
  }
  uint64_t v5 = *(const void **)(v3 + 8);

  CFRelease(v5);
}

@end