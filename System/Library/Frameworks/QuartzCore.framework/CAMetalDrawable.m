@interface CAMetalDrawable
- (BOOL)didComposite;
- (BOOL)didFinish;
- (BOOL)hasExplicitDeadlines;
- (BOOL)hasPresentedHandlers;
- (BOOL)needsLowLatency;
- (BOOL)presentScheduledInsertSeedValid;
- (CAMetalDrawable)initWithDrawablePrivate:(_CAMetalDrawablePrivate *)a3 layer:(id)a4 waitStart:(double)a5;
- (CAMetalLayer)layer;
- (CATimingFramePacingLatency)preferredLatency;
- (CGRect)dirtyRect;
- (IOSurfaceSharedEvent)sharedEvent;
- (MTLTexture)texture;
- (_CAMetalDrawablePrivate)priv;
- (double)minimumPresentationDuration;
- (double)presentDeadline;
- (double)presentedTime;
- (double)targetPresentationTimestamp;
- (double)targetSamplingTimestamp;
- (double)targetTimestamp;
- (double)timeAcquired;
- (double)timePresentCalled;
- (float)clientPreferredLatency;
- (id)cachedTexture;
- (id)newTextureWithResourceIndex:(unint64_t)a3;
- (unint64_t)drawableID;
- (unint64_t)status;
- (unsigned)insertSeed;
- (unsigned)presentScheduledInsertSeed;
- (unsigned)surfaceID;
- (unsigned)updateSeed;
- (void)addPresentScheduledHandler:(id)a3;
- (void)addPresentedHandler:(id)a3;
- (void)dealloc;
- (void)didPresentAtTime:(double)a3;
- (void)didScheduledPresent;
- (void)estimateTargets;
- (void)present;
- (void)presentAfterMinimumDuration:(double)a3;
- (void)presentAtTime:(double)a3;
- (void)presentWithOptions:(id)a3;
- (void)releasePrivateReferences:(void *)a3;
- (void)setClientPreferredLatency:(float)a3;
- (void)setDidComposite:(BOOL)a3;
- (void)setDidFinish:(BOOL)a3;
- (void)setDirtyRect:(CGRect)a3;
- (void)setDrawableID:(unint64_t)a3;
- (void)setHasExplicitDeadlines:(BOOL)a3;
- (void)setInsertSeed:(unsigned int)a3;
- (void)setMinimumPresentationDuration:(double)a3;
- (void)setNeedsLowLatency:(BOOL)a3;
- (void)setPreferredLatency:(CATimingFramePacingLatency)a3;
- (void)setPresentDeadline:(double)a3;
- (void)setPresentScheduledInsertSeed:(unsigned int)a3;
- (void)setPresentScheduledInsertSeedValid:(BOOL)a3;
- (void)setPresentedTime:(double)a3;
- (void)setSharedEvent:(id)a3;
- (void)setStatus:(unint64_t)a3;
- (void)setSurfaceID:(unsigned int)a3;
- (void)setTargetPresentationTimestamp:(double)a3;
- (void)setTargetSamplingTimestamp:(double)a3;
- (void)setTargetTimestamp:(double)a3;
- (void)setTimeAcquired:(double)a3;
- (void)setTimePresentCalled:(double)a3;
- (void)setUpdateSeed:(unsigned int)a3;
@end

@implementation CAMetalDrawable

- (void).cxx_destruct
{
}

- (void)addPresentedHandler:(id)a3
{
  priv = self->_priv;
  if (priv && (var9 = priv->var9) != 0)
  {
    v6 = _Block_copy(a3);
    v7 = (os_unfair_lock_s *)((char *)var9 + 208);
    os_unfair_lock_lock(v7);
    [(NSMutableArray *)self->_presentedHandlers addObject:v6];
    os_unfair_lock_unlock(v7);
  }
  else
  {
    NSLog(&cfstr_Addpresentedha.isa, a2, a3);
  }
}

- (double)targetPresentationTimestamp
{
  return self->_targetPresentationTimestamp;
}

- (double)targetSamplingTimestamp
{
  return self->_targetSamplingTimestamp;
}

- (IOSurfaceSharedEvent)sharedEvent
{
  return self->_sharedEvent;
}

- (_CAMetalDrawablePrivate)priv
{
  return self->_priv;
}

- (void)setStatus:(unint64_t)a3
{
  self->_status = a3;
}

- (CATimingFramePacingLatency)preferredLatency
{
  double latency = self->_preferredLatency.latency;
  double frame_duration = self->_preferredLatency.frame_duration;
  result.double frame_duration = frame_duration;
  result.double latency = latency;
  return result;
}

- (BOOL)needsLowLatency
{
  return self->_needsLowLatency;
}

- (CGRect)dirtyRect
{
  double x = self->_dirtyRect.origin.x;
  double y = self->_dirtyRect.origin.y;
  double width = self->_dirtyRect.size.width;
  double height = self->_dirtyRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setPresentScheduledInsertSeedValid:(BOOL)a3
{
  self->_presentScheduledInsertSeedValid = a3;
}

- (void)setInsertSeed:(unsigned int)a3
{
  self->_insertSeed = a3;
}

- (void)setDidFinish:(BOOL)a3
{
  self->_didFinish = a3;
}

- (double)minimumPresentationDuration
{
  return self->_minimumPresentationDuration;
}

- (void)setPresentScheduledInsertSeed:(unsigned int)a3
{
  self->_presentScheduledInsertSeed = a3;
}

- (void)estimateTargets
{
  v17[1] = *MEMORY[0x1E4F143B8];
  v3 = (void *)[objc_loadWeak((id *)&self->_layer) currentDisplay];
  if (v3)
  {
    uint64_t v4 = [v3 timingsControl];
    if (v4)
    {
      uint64_t v5 = v4;
      long long v15 = 0uLL;
      uint64_t v16 = 0;
      CA::Display::DisplayTimingsControl::timing_reference((CA::Display::DisplayTimingsControl *)&v15, v4, 0);
      if (*(unsigned char *)(v5 + 233)) {
        LODWORD(v6) = 2;
      }
      else {
        LODWORD(v6) = 1;
      }
      if (v6 <= *(_DWORD *)(v5 + 56)) {
        LODWORD(v6) = *(_DWORD *)(v5 + 56);
      }
      unsigned int v7 = *(_DWORD *)(v5 + 88);
      if (v6 <= v7) {
        uint64_t v6 = v7;
      }
      else {
        uint64_t v6 = v6;
      }
      unint64_t v8 = v16 * v6;
      long long v13 = v15;
      uint64_t v14 = v16;
      uint64_t v9 = mach_absolute_time();
      v17[0] = v8;
      unint64_t phase = get_phase((unint64_t *)&v13, v9, v17);
      if (phase) {
        uint64_t v9 = v9 - phase + v17[0];
      }
      unint64_t v11 = (v8 << CA::Display::DisplayTimingsControl::server_triple_buffered((os_unfair_lock_s *)v5)) + v9;
      double v12 = CATimeWithHostTime(v9);
      -[CAMetalDrawable setTargetTimestamp:](self, "setTargetTimestamp:", v12, v13, v14);
      [(CAMetalDrawable *)self setTargetPresentationTimestamp:CATimeWithHostTime(v11)];
      [(CAMetalDrawable *)self setHasExplicitDeadlines:0];
    }
  }
}

- (unsigned)presentScheduledInsertSeed
{
  return self->_presentScheduledInsertSeed;
}

- (id)cachedTexture
{
  return self->_cachedTexture;
}

- (BOOL)presentScheduledInsertSeedValid
{
  return self->_presentScheduledInsertSeedValid;
}

- (void)didScheduledPresent
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  presentScheduledHandlers = self->_presentScheduledHandlers;
  uint64_t v4 = [(NSMutableArray *)presentScheduledHandlers countByEnumeratingWithState:&v10 objects:v9 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(presentScheduledHandlers);
        }
        unint64_t v8 = *(void (***)(void, void))(*((void *)&v10 + 1) + 8 * i);
        ((void (**)(void, CAMetalDrawable *))v8)[2](v8, self);
        _Block_release(v8);
      }
      uint64_t v5 = [(NSMutableArray *)presentScheduledHandlers countByEnumeratingWithState:&v10 objects:v9 count:16];
    }
    while (v5);
  }
  [(NSMutableArray *)self->_presentScheduledHandlers removeAllObjects];
}

- (void)setTargetTimestamp:(double)a3
{
  self->_targetTimestamp = a3;
}

- (void)setTargetPresentationTimestamp:(double)a3
{
  self->_targetPresentationTimestamp = a3;
}

- (void)setHasExplicitDeadlines:(BOOL)a3
{
  self->_hasExplicitDeadlines = a3;
}

- (double)targetTimestamp
{
  return self->_targetTimestamp;
}

- (unsigned)updateSeed
{
  return self->_updateSeed;
}

- (double)timePresentCalled
{
  return self->_timePresentCalled;
}

- (BOOL)didComposite
{
  return self->_didComposite;
}

- (CAMetalDrawable)initWithDrawablePrivate:(_CAMetalDrawablePrivate *)a3 layer:(id)a4 waitStart:(double)a5
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v12.receiver = self;
  v12.super_class = (Class)CAMetalDrawable;
  unsigned int v7 = [(CAMetalDrawable *)&v12 init];
  unint64_t v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_layer, a4);

    v8->_priv = a3;
    v8->_cachedTexture = 0;
    var9 = a3->var9;
    atomic_fetch_add((atomic_uint *volatile)var9, 1u);
    v8->_cachedTexture = (MTLTexture *)a3->var11;
    atomic_fetch_add((atomic_uint *volatile)var9 + 35, 1u);
    CGSize v10 = *(CGSize *)(MEMORY[0x1E4F1DB10] + 16);
    v8->_dirtyRect.origin = (CGPoint)*MEMORY[0x1E4F1DB10];
    v8->_dirtyRect.size = v10;
    v8->_drawableID = atomic_fetch_add((atomic_uint *volatile)a3->var9 + 39, 1u);
    if (present_on_finish_enabled(*(_CAImageQueue **)(*((void *)var9 + 2) + 48))) {
      v8->_sharedEvent = (IOSurfaceSharedEvent *)objc_alloc_init(MEMORY[0x1E4F2EF90]);
    }
    v8->_status = 0;
    v8->_presentedHandlers = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v8->_updateSeed = 0;
    v8->_didComposite = 0;
    v8->_presentScheduledHandlers = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v8->_surfaceID = IOSurfaceGetID(a3->var10);
    v8->_timeAcquired = a3->var8;
    if (MEMORY[0x1E4F62330])
    {
      [(CAMetalDrawable *)v8 layer];
      [(CAMetalDrawable *)v8 surfaceID];
      [(CAMetalDrawable *)v8 drawableID];
      [(CAMetalDrawable *)v8 timeAcquired];
      FPDrawableLifetimeMarkStarted();
    }
  }
  return v8;
}

- (unint64_t)drawableID
{
  return self->_drawableID;
}

- (CAMetalLayer)layer
{
  return (CAMetalLayer *)objc_loadWeak((id *)&self->_layer);
}

- (double)timeAcquired
{
  return self->_timeAcquired;
}

- (unsigned)surfaceID
{
  return self->_surfaceID;
}

- (void)releasePrivateReferences:(void *)a3
{
  self->_priv = 0;
  if (!a3) {
    __assert_rtn("-[CAMetalDrawable releasePrivateReferences:]", "CAMetalLayer.mm", 2546, "priv");
  }
  uint64_t v5 = (os_unfair_lock_s *)((char *)a3 + 208);
  os_unfair_lock_lock((os_unfair_lock_t)a3 + 52);
  if (![(CAMetalDrawable *)self status] && [(NSMutableArray *)self->_presentedHandlers count])
  {
    [(CAMetalDrawable *)self setStatus:3];
    [(CAMetalDrawable *)self didPresentAtTime:0.0];
  }
  os_unfair_lock_unlock(v5);
  atomic_fetch_add((atomic_uint *volatile)a3 + 35, 0xFFFFFFFF);

  layer_private_release((_CAMetalLayerPrivate *)a3, v6);
}

- (unint64_t)status
{
  return self->_status;
}

- (void)didPresentAtTime:(double)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  presentedHandlers = self->_presentedHandlers;
  uint64_t v5 = [(NSMutableArray *)presentedHandlers countByEnumeratingWithState:&v11 objects:v10 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(presentedHandlers);
        }
        uint64_t v9 = *(void (***)(void, void))(*((void *)&v11 + 1) + 8 * i);
        ((void (**)(void, CAMetalDrawable *))v9)[2](v9, self);
        _Block_release(v9);
      }
      uint64_t v6 = [(NSMutableArray *)presentedHandlers countByEnumeratingWithState:&v11 objects:v10 count:16];
    }
    while (v6);
  }
  [(NSMutableArray *)self->_presentedHandlers removeAllObjects];
}

- (void)setUpdateSeed:(unsigned int)a3
{
  self->_updateSeed = a3;
}

- (void)setDidComposite:(BOOL)a3
{
  self->_didComposite = a3;
}

- (void)setPresentedTime:(double)a3
{
  self->_presentedTime = a3;
}

- (double)presentDeadline
{
  return self->_presentDeadline;
}

- (float)clientPreferredLatency
{
  return self->_clientPreferredLatency;
}

- (MTLTexture)texture
{
  if (!self->_priv && -[CAMetalDrawable texture]::warn_once != -1) {
    dispatch_once(&-[CAMetalDrawable texture]::warn_once, &__block_literal_global_10445);
  }
  return self->_cachedTexture;
}

- (void)dealloc
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  priv = self->_priv;
  if (priv)
  {
    atomic_fetch_add((atomic_uint *volatile)priv->var9 + 35, 0xFFFFFFFF);
    uint64_t v4 = self->_priv;
    var9 = v4->var9;
    os_unfair_lock_lock((os_unfair_lock_t)var9 + 2);
    if (atomic_fetch_add(&v4->var0.var0.var0, 0xFFFFFFFF) == 1)
    {
      uint64_t v6 = *((void *)var9 + 7);
      malloc_zone = (malloc_zone_t *)get_malloc_zone();
      unint64_t v8 = malloc_type_zone_malloc(malloc_zone, 0x10uLL, 0x8BB15036uLL);
      *unint64_t v8 = v4;
      v8[1] = v6;
      *((void *)var9 + 7) = v8;
      os_unfair_lock_unlock((os_unfair_lock_t)var9 + 2);
      layer_collectable_signal(0, var9);
    }
    else
    {
      os_unfair_lock_unlock((os_unfair_lock_t)var9 + 2);
    }
    layer_private_release(var9, v9);
  }
  if (![(CAMetalDrawable *)self didFinish] && MEMORY[0x1E4F62328])
  {
    [(CAMetalDrawable *)self layer];
    [(CAMetalDrawable *)self drawableID];
    uint64_t v10 = mach_absolute_time();
    CATimeWithHostTime(v10);
    [(CAMetalDrawable *)self hasExplicitDeadlines];
    FPDrawableLifetimeMarkFinished();
  }

  if ([(NSMutableArray *)self->_presentedHandlers count])
  {
    [(CAMetalDrawable *)self setStatus:3];
    [(CAMetalDrawable *)self didPresentAtTime:0.0];
  }

  self->_presentedHandlers = 0;
  if ([(NSMutableArray *)self->_presentScheduledHandlers count]) {
    [(CAMetalDrawable *)self didScheduledPresent];
  }

  self->_presentScheduledHandlers = 0;
  objc_storeWeak((id *)&self->_layer, 0);

  self->_priv = (_CAMetalDrawablePrivate *)0x5555555555555555;
  self->_cachedTexture = 0;
  v11.receiver = self;
  v11.super_class = (Class)CAMetalDrawable;
  [(CAMetalDrawable *)&v11 dealloc];
}

- (BOOL)didFinish
{
  return self->_didFinish;
}

- (BOOL)hasExplicitDeadlines
{
  return self->_hasExplicitDeadlines;
}

- (void)presentWithOptions:(id)a3
{
  if (!a3)
  {
LABEL_5:
    [(CAMetalDrawable *)self present];
    return;
  }
  int v5 = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", @"presentationMode"), "intValue");
  if (v5 == 2)
  {
    priv = self->_priv;
    if (priv && *((void *)priv->var9 + 4) && self->_hasExplicitDeadlines) {
      [MEMORY[0x1E4F1CA00] raise:@"CAMetalDrawableInvalidOperation" format:@"-presentAfterMinimumDuration should not be called when using CAMetalDisplayLink."];
    }
    objc_msgSend((id)objc_msgSend(a3, "objectForKey:", @"presentTimeInterval"), "doubleValue");
    -[CAMetalDrawable presentAfterMinimumDuration:](self, "presentAfterMinimumDuration:");
  }
  else
  {
    if (v5 != 1)
    {
      if (v5) {
        return;
      }
      goto LABEL_5;
    }
    uint64_t v7 = self->_priv;
    if (v7 && *((void *)v7->var9 + 4) && self->_hasExplicitDeadlines) {
      [MEMORY[0x1E4F1CA00] raise:@"CAMetalDrawableInvalidOperation" format:@"-presentAtTime should not be called when using CAMetalDisplayLink."];
    }
    objc_msgSend((id)objc_msgSend(a3, "objectForKey:", @"presentTimeInterval"), "doubleValue");
    -[CAMetalDrawable presentAtTime:](self, "presentAtTime:");
  }
}

- (double)presentedTime
{
  return self->_presentedTime;
}

- (void)present
{
  v31[2] = *MEMORY[0x1E4F143B8];
  priv = self->_priv;
  if (priv)
  {
    var9 = priv->var9;
    __int16 v5 = *((_WORD *)var9 + 144);
    if (v5)
    {
      LOWORD(v6) = 0;
    }
    else if ((v5 & 0x20) == 0 || (uint64_t v6 = *((void *)var9 + 4)) != 0)
    {
      LOWORD(v6) = ~(2 * v5) & 0x1000;
    }
    *((_WORD *)var9 + 144) = v6 | v5 & 0xEFFF;
    IOSurfaceGetID(priv->var10);
    kdebug_trace();
    if (CADeviceSupportsAPT::once[0] != -1) {
      dispatch_once(CADeviceSupportsAPT::once, &__block_literal_global_52);
    }
    double v7 = dbl_184998250[CADeviceSupportsAPT::supports_apt == 0];
    uint64_t v8 = mach_absolute_time();
    double v9 = CATimeWithHostTime(v8);
    self->_double timePresentCalled = v9;
    double var8 = priv->var8;
    double v11 = v9 - var8;
    uint64_t v30 = 0;
    v31[0] = 0;
    mach_get_times();
    unint64_t v12 = CAHostTimeWithTime(var8);
    if (CAMetalLayerLog(void)::onceToken != -1) {
      dispatch_once(&CAMetalLayerLog(void)::onceToken, &__block_literal_global_500);
    }
    if (v11 >= v7)
    {
      if (CAMetalLayerStallLog(void)::onceToken[0] != -1) {
        dispatch_once(CAMetalLayerStallLog(void)::onceToken, &__block_literal_global_504);
      }
      long long v13 = &CAMetalLayerStallLog(void)::log;
    }
    else
    {
      long long v13 = &CAMetalLayerLog(void)::log;
    }
    long long v14 = *v13;
    uint64_t v15 = *((void *)var9 + 2);
    if (v15)
    {
      uint64_t v16 = *(void *)(v15 + 48);
      if (v16) {
        uint64_t v16 = *(void *)(v16 + 24);
      }
    }
    else
    {
      uint64_t v16 = 0;
    }
    unint64_t v17 = v12;
    if ((*((_WORD *)var9 + 144) & 8) != 0
      && (uint64_t v18 = *(void *)(v15 + 48)) != 0
      && *(_DWORD *)(*(void *)(v18 + 24) + 32))
    {
      os_signpost_id_t v19 = *(unsigned int *)(v16 + 88);
      if (!v19 || !os_signpost_enabled(v14)) {
        goto LABEL_32;
      }
      IOSurfaceID ID = IOSurfaceGetID(priv->var10);
      LODWORD(v30) = 67240448;
      HIDWORD(v30) = ID;
      LOWORD(v31[0]) = 2050;
      *(void *)((char *)v31 + 2) = v17;
      v21 = "ID is queue ID. surfaceID=%{public, name=surfaceID}#x visible=1 beginTime=%{public, signpost.description:begin_time}llu";
    }
    else
    {
      os_signpost_id_t v19 = *(unsigned int *)(v16 + 88);
      if (!v19 || !os_signpost_enabled(v14)) {
        goto LABEL_32;
      }
      IOSurfaceID v22 = IOSurfaceGetID(priv->var10);
      LODWORD(v30) = 67240448;
      HIDWORD(v30) = v22;
      LOWORD(v31[0]) = 2050;
      *(void *)((char *)v31 + 2) = v17;
      v21 = "ID is queue ID. visible=0 surfaceID=%{public, name=surfaceID}#x beginTime=%{public, signpost.description:begin_time}llu";
    }
    _os_signpost_emit_with_name_impl(&dword_184668000, v14, OS_SIGNPOST_EVENT, v19, "ClientDrawable", v21, (uint8_t *)&v30, 0x12u);
LABEL_32:
    if (CADeviceIsAppleBundle::once != -1) {
      dispatch_once(&CADeviceIsAppleBundle::once, &__block_literal_global_345);
    }
    if (CADeviceIsAppleBundle::apple_bundle || (*((_WORD *)var9 + 144) & 0x20) != 0) {
      goto LABEL_46;
    }
    if (CADeviceSupportsAPT::once[0] != -1) {
      dispatch_once(CADeviceSupportsAPT::once, &__block_literal_global_52);
    }
    if (CADeviceSupportsAPT::supports_apt && !CADeviceDisableMinimumFrameDuration()) {
      goto LABEL_61;
    }
    if (CAHighFrameRateRestrictionEnabled(void)::once != -1) {
      dispatch_once(&CAHighFrameRateRestrictionEnabled(void)::once, &__block_literal_global_6);
    }
    if (!CAHighFrameRateRestrictionEnabled(void)::enabled) {
      goto LABEL_46;
    }
    if (CADeviceDisableMinimumFrameDurationOnPhone::once != -1) {
      dispatch_once(&CADeviceDisableMinimumFrameDurationOnPhone::once, &__block_literal_global_147);
    }
    if (CADeviceDisableMinimumFrameDurationOnPhone::disabled)
    {
LABEL_46:
      unsigned int v23 = *((unsigned __int16 *)var9 + 144);
      BOOL v24 = (v23 & 0x1000) != 0 && BYTE6(xmmword_1EB2ACC50) == 0;
      if (v24) {
        unsigned int v25 = v23 & 1 | (16 * ((v23 >> 1) & 1)) | (v23 >> 9) & 4 | 2;
      }
      else {
        unsigned int v25 = v23 & 1 | (16 * ((v23 >> 1) & 1)) | (v23 >> 9) & 4;
      }
      double v26 = 0.004;
      if (!v24) {
        double v26 = 0.0;
      }
      double timePresentCalled = self->_timePresentCalled;
      v28 = var9;
      v29 = self;
    }
    else
    {
LABEL_61:
      double timePresentCalled = self->_timePresentCalled;
      double v26 = 0.014;
      v28 = var9;
      v29 = self;
      unsigned int v25 = 2;
    }
    layer_private_present(v28, v29, v26, timePresentCalled, v25);
    if (self->_priv
      && self->_timePresentCalled > self->_targetTimestamp + -0.001
      && *((void *)var9 + 4)
      && CAMetalLayerShouldDispatchLink(*((CAMetalLayer **)var9 + 3)))
    {
      +[CADisplayLink dispatchDeferredDisplayLink:*((void *)var9 + 4)];
    }
    return;
  }
  if (warn_multiple_present(void)::once[0] != -1)
  {
    dispatch_once(warn_multiple_present(void)::once, &__block_literal_global_495);
  }
}

- (void)setClientPreferredLatency:(float)a3
{
  self->_clientPreferredLatencdouble y = a3;
}

- (void)setNeedsLowLatency:(BOOL)a3
{
  self->_needsLowLatencdouble y = a3;
}

- (void)setPreferredLatency:(CATimingFramePacingLatency)a3
{
  self->_preferredLatencdouble y = a3;
}

- (void)setMinimumPresentationDuration:(double)a3
{
  self->_minimumPresentationDuration = a3;
}

- (void)setPresentDeadline:(double)a3
{
  self->_presentDeadline = a3;
}

- (void)setTargetSamplingTimestamp:(double)a3
{
  self->_targetSamplingTimestamp = a3;
}

- (void)setTimePresentCalled:(double)a3
{
  self->_double timePresentCalled = a3;
}

- (void)setTimeAcquired:(double)a3
{
  self->_timeAcquired = a3;
}

- (void)setSurfaceID:(unsigned int)a3
{
  self->_surfaceIOSurfaceID ID = a3;
}

- (unsigned)insertSeed
{
  return self->_insertSeed;
}

- (void)setSharedEvent:(id)a3
{
}

- (void)setDrawableID:(unint64_t)a3
{
  self->_drawableIOSurfaceID ID = a3;
}

- (void)setDirtyRect:(CGRect)a3
{
  self->_dirtyRect = a3;
}

- (id)newTextureWithResourceIndex:(unint64_t)a3
{
  priv = self->_priv;
  if (priv) {
    return allocate_drawable_texture(priv->var12, priv->var10, priv->var1, priv->var2, priv->var4, a3, priv->var16, *((unsigned char *)priv + 113) & 1, @"CAMetalLayer Replay Drawable", priv->var7);
  }
  NSLog(&cfstr_Cametallayerdr_0.isa, a2, a3);
  return 0;
}

- (void)presentAtTime:(double)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  priv = self->_priv;
  if (priv)
  {
    var9 = priv->var9;
    if (*((void *)var9 + 4) && self->_hasExplicitDeadlines)
    {
      [MEMORY[0x1E4F1CA00] raise:@"CAMetalDrawableInvalidOperation" format:@"-presentAtTime should not be called when using CAMetalDisplayLink."];
      priv = self->_priv;
      var9 = priv->var9;
    }
    [(CAMetalDrawable *)self targetPresentationTimestamp];
    BOOL v8 = v7 < a3;
    double v9 = a3;
    if (!v8) {
      [(CAMetalDrawable *)self targetPresentationTimestamp];
    }
    [(CAMetalDrawable *)self setTargetPresentationTimestamp:v9];
    __int16 v10 = *((_WORD *)var9 + 144);
    if (v10)
    {
      int v11 = 0;
    }
    else if ((v10 & 0x20) != 0)
    {
      int v11 = (*((void *)var9 + 4) != 0) << 12;
    }
    else
    {
      int v11 = 4096;
    }
    *((_WORD *)var9 + 144) = v11 | v10 & 0xEFFF;
    if (BYTE6(xmmword_1EB2ACC50)) {
      BOOL v12 = 1;
    }
    else {
      BOOL v12 = v11 == 0;
    }
    if (v12) {
      unsigned int v13 = 0;
    }
    else {
      unsigned int v13 = 10;
    }
    IOSurfaceGetID(priv->var10);
    kdebug_trace();
    if (CADeviceSupportsAPT::once[0] != -1) {
      dispatch_once(CADeviceSupportsAPT::once, &__block_literal_global_52);
    }
    double v14 = dbl_184998250[CADeviceSupportsAPT::supports_apt == 0];
    uint64_t v15 = mach_absolute_time();
    double v16 = CATimeWithHostTime(v15);
    self->_double timePresentCalled = v16;
    double var8 = priv->var8;
    double v18 = v16 - var8;
    uint64_t v30 = 0;
    *(void *)v31 = 0;
    mach_get_times();
    unint64_t v19 = CAHostTimeWithTime(var8);
    if (CAMetalLayerLog(void)::onceToken != -1) {
      dispatch_once(&CAMetalLayerLog(void)::onceToken, &__block_literal_global_500);
    }
    if (v18 >= v14)
    {
      if (CAMetalLayerStallLog(void)::onceToken[0] != -1) {
        dispatch_once(CAMetalLayerStallLog(void)::onceToken, &__block_literal_global_504);
      }
      v20 = &CAMetalLayerStallLog(void)::log;
    }
    else
    {
      v20 = &CAMetalLayerLog(void)::log;
    }
    v21 = *v20;
    uint64_t v22 = *((void *)var9 + 2);
    if (v22)
    {
      uint64_t v23 = *(void *)(v22 + 48);
      if (v23) {
        uint64_t v23 = *(void *)(v23 + 24);
      }
    }
    else
    {
      uint64_t v23 = 0;
    }
    unint64_t v24 = v19;
    if ((*((_WORD *)var9 + 144) & 8) != 0
      && (uint64_t v25 = *(void *)(v22 + 48)) != 0
      && *(_DWORD *)(*(void *)(v25 + 24) + 32))
    {
      os_signpost_id_t v26 = *(unsigned int *)(v23 + 88);
      if (!v26 || !os_signpost_enabled(v21)) {
        goto LABEL_43;
      }
      IOSurfaceID ID = IOSurfaceGetID(priv->var10);
      LODWORD(v30) = 67240960;
      HIDWORD(v30) = ID;
      *(_WORD *)v31 = 2050;
      *(double *)&v31[2] = a3;
      __int16 v32 = 1026;
      unsigned int v33 = v13;
      __int16 v34 = 2050;
      unint64_t v35 = v24;
      v28 = "ID is queue ID. surfaceID=%{public, name=surfaceID}#x desiredTime=%{public, name=desiredTime}f flags=%{publi"
            "c, name=flags}#x visible=1 beginTime=%{public, signpost.description:begin_time}llu";
    }
    else
    {
      os_signpost_id_t v26 = *(unsigned int *)(v23 + 88);
      if (!v26 || !os_signpost_enabled(v21)) {
        goto LABEL_43;
      }
      IOSurfaceID v29 = IOSurfaceGetID(priv->var10);
      LODWORD(v30) = 67240960;
      HIDWORD(v30) = v29;
      *(_WORD *)v31 = 2050;
      *(double *)&v31[2] = a3;
      __int16 v32 = 1026;
      unsigned int v33 = v13;
      __int16 v34 = 2050;
      unint64_t v35 = v24;
      v28 = "ID is queue ID. surfaceID=%{public, name=surfaceID}#x desiredTime=%{public, name=desiredTime}f flags=%{publi"
            "c, name=flags}#x visible=0 beginTime=%{public, signpost.description:begin_time}llu";
    }
    _os_signpost_emit_with_name_impl(&dword_184668000, v21, OS_SIGNPOST_EVENT, v26, "ClientDrawable", v28, (uint8_t *)&v30, 0x22u);
LABEL_43:
    layer_private_present(var9, self, a3, self->_timePresentCalled, v13);
    return;
  }
  if (warn_multiple_present(void)::once[0] != -1)
  {
    dispatch_once(warn_multiple_present(void)::once, &__block_literal_global_495);
  }
}

void __26__CAMetalDrawable_texture__block_invoke()
{
}

- (void)addPresentScheduledHandler:(id)a3
{
  v10[5] = *MEMORY[0x1E4F143B8];
  priv = self->_priv;
  if (priv && (var9 = priv->var9) != 0 && (*((_WORD *)var9 + 144) & 0x400) != 0)
  {
    os_unfair_lock_lock((os_unfair_lock_t)var9 + 2);
    if (*((void *)var9 + 9))
    {
      os_unfair_lock_lock((os_unfair_lock_t)var9 + 46);
      [(NSMutableArray *)self->_presentScheduledHandlers addObject:_Block_copy(a3)];
      if (([*((id *)var9 + 24) containsObject:self] & 1) == 0)
      {
        [*((id *)var9 + 24) addObject:self];
        dispatch_time_t v8 = dispatch_time(0, 1100000000);
        atomic_fetch_add((atomic_uint *volatile)var9, 1u);
        double v9 = *((void *)var9 + 22);
        v10[0] = MEMORY[0x1E4F143A8];
        v10[1] = 3221225472;
        v10[2] = __46__CAMetalDrawable_addPresentScheduledHandler___block_invoke;
        v10[3] = &__block_descriptor_40_e5_v8__0l;
        v10[4] = var9;
        dispatch_after(v8, v9, v10);
      }
      os_unfair_lock_unlock((os_unfair_lock_t)var9 + 46);
    }
    else
    {
      (*((void (**)(id, CAMetalDrawable *))a3 + 2))(a3, self);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)var9 + 2);
  }
  else
  {
    double v7 = (void (*)(id, CAMetalDrawable *))*((void *)a3 + 2);
    v7(a3, self);
  }
}

void __46__CAMetalDrawable_addPresentScheduledHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 200);
  uint64_t v3 = CAHostTimeWithTime(0.2) + v2;
  if (mach_absolute_time() > v3) {
    layer_private_cleanup_callbacks(*(_CAMetalLayerPrivate **)(a1 + 32));
  }
  __int16 v5 = *(_CAMetalLayerPrivate **)(a1 + 32);

  layer_private_release(v5, v4);
}

- (BOOL)hasPresentedHandlers
{
  uint64_t v2 = self;
  uint64_t v3 = (os_unfair_lock_s *)((char *)self->_priv->var9 + 208);
  os_unfair_lock_lock(v3);
  LOBYTE(v2) = [(NSMutableArray *)v2->_presentedHandlers count] != 0;
  os_unfair_lock_unlock(v3);
  return (char)v2;
}

- (void)presentAfterMinimumDuration:(double)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  priv = self->_priv;
  if (priv)
  {
    var9 = priv->var9;
    if (*((void *)var9 + 4) && self->_hasExplicitDeadlines)
    {
      [MEMORY[0x1E4F1CA00] raise:@"CAMetalDrawableInvalidOperation" format:@"-presentAfterMinimumDuration should not be called when using CAMetalDisplayLink."];
      priv = self->_priv;
      var9 = priv->var9;
    }
    __int16 v7 = *((_WORD *)var9 + 144);
    if (v7)
    {
      int v8 = 0;
    }
    else if ((v7 & 0x20) != 0)
    {
      int v8 = (*((void *)var9 + 4) != 0) << 12;
    }
    else
    {
      int v8 = 4096;
    }
    *((_WORD *)var9 + 144) = v8 | v7 & 0xEFFF;
    if (a3 <= 0.0 && (!v8 || BYTE6(xmmword_1EB2ACC50)))
    {
      unsigned int v9 = v7 & 1;
      a3 = 0.0;
    }
    else
    {
      unsigned int v9 = 2;
      if (v8 && !BYTE6(xmmword_1EB2ACC50)) {
        a3 = fmax(a3, 0.004);
      }
    }
    IOSurfaceGetID(priv->var10);
    kdebug_trace();
    if (CADeviceSupportsAPT::once[0] != -1) {
      dispatch_once(CADeviceSupportsAPT::once, &__block_literal_global_52);
    }
    double v10 = dbl_184998250[CADeviceSupportsAPT::supports_apt == 0];
    uint64_t v11 = mach_absolute_time();
    double v12 = CATimeWithHostTime(v11);
    self->_double timePresentCalled = v12;
    double v13 = v12 - priv->var8;
    [(CAMetalDrawable *)self setMinimumPresentationDuration:a3];
    uint64_t v25 = 0;
    *(void *)os_signpost_id_t v26 = 0;
    mach_get_times();
    unint64_t v14 = CAHostTimeWithTime(priv->var8);
    if (CAMetalLayerLog(void)::onceToken != -1) {
      dispatch_once(&CAMetalLayerLog(void)::onceToken, &__block_literal_global_500);
    }
    if (v13 >= v10)
    {
      if (CAMetalLayerStallLog(void)::onceToken[0] != -1) {
        dispatch_once(CAMetalLayerStallLog(void)::onceToken, &__block_literal_global_504);
      }
      uint64_t v15 = &CAMetalLayerStallLog(void)::log;
    }
    else
    {
      uint64_t v15 = &CAMetalLayerLog(void)::log;
    }
    double v16 = *v15;
    uint64_t v17 = *((void *)var9 + 2);
    if (v17)
    {
      uint64_t v18 = *(void *)(v17 + 48);
      if (v18) {
        uint64_t v18 = *(void *)(v18 + 24);
      }
    }
    else
    {
      uint64_t v18 = 0;
    }
    unint64_t v19 = v14;
    if ((*((_WORD *)var9 + 144) & 8) != 0
      && (uint64_t v20 = *(void *)(v17 + 48)) != 0
      && *(_DWORD *)(*(void *)(v20 + 24) + 32))
    {
      os_signpost_id_t v21 = *(unsigned int *)(v18 + 88);
      if (!v21 || !os_signpost_enabled(v16)) {
        goto LABEL_42;
      }
      IOSurfaceID ID = IOSurfaceGetID(priv->var10);
      LODWORD(v25) = 67240960;
      HIDWORD(v25) = ID;
      *(_WORD *)os_signpost_id_t v26 = 2050;
      *(double *)&v26[2] = a3;
      __int16 v27 = 1026;
      unsigned int v28 = v9;
      __int16 v29 = 2050;
      unint64_t v30 = v19;
      uint64_t v23 = "ID is queue ID. surfaceID=%{public, name=surfaceID}#x delay=%{public, name=delay}f flags=%{public, name=flag"
            "s}#x visible=1 beginTime=%{public, signpost.description:begin_time}llu";
    }
    else
    {
      os_signpost_id_t v21 = *(unsigned int *)(v18 + 88);
      if (!v21 || !os_signpost_enabled(v16)) {
        goto LABEL_42;
      }
      IOSurfaceID v24 = IOSurfaceGetID(priv->var10);
      LODWORD(v25) = 67240960;
      HIDWORD(v25) = v24;
      *(_WORD *)os_signpost_id_t v26 = 2050;
      *(double *)&v26[2] = a3;
      __int16 v27 = 1026;
      unsigned int v28 = v9;
      __int16 v29 = 2050;
      unint64_t v30 = v19;
      uint64_t v23 = "ID is queue ID. surfaceID=%{public, name=surfaceID}#x delay=%{public, name=delay}f  flags=%{public, name=fla"
            "gs}#x visible=0 beginTime=%{public, signpost.description:begin_time}llu";
    }
    _os_signpost_emit_with_name_impl(&dword_184668000, v16, OS_SIGNPOST_EVENT, v21, "ClientDrawable", v23, (uint8_t *)&v25, 0x22u);
LABEL_42:
    layer_private_present(var9, self, a3, self->_timePresentCalled, v9);
    return;
  }
  if (warn_multiple_present(void)::once[0] != -1)
  {
    dispatch_once(warn_multiple_present(void)::once, &__block_literal_global_495);
  }
}

@end