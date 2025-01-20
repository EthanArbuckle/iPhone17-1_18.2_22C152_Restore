@interface CAMetalLayer
+ (BOOL)CA_automaticallyNotifiesObservers:(Class)a3;
+ (id)defaultValueForKey:(id)a3;
- (BOOL)allowsDisplayCompositingWithCopy;
- (BOOL)allowsNextDrawableTimeout;
- (BOOL)displaySyncEnabled;
- (BOOL)exclusiveMode;
- (BOOL)fenceEnabled;
- (BOOL)framebufferOnly;
- (BOOL)isDrawableAvailable;
- (BOOL)lowLatency;
- (BOOL)lowWorkload;
- (BOOL)nonDefaultColorspace;
- (BOOL)presentsWithTransaction;
- (BOOL)serverSyncEnabled;
- (BOOL)shouldArchiveValueForKey:(id)a3;
- (CADisplay)cachedDisplay;
- (CAEDRMetadata)EDRMetadata;
- (CAMetalLayer)init;
- (CGColorSpaceRef)colorspace;
- (CGSize)drawableSize;
- (MTLPixelFormat)pixelFormat;
- (NSDictionary)developerHUDProperties;
- (NSUInteger)maximumDrawableCount;
- (double)drawableTimeoutSeconds;
- (double)inputTime;
- (id)currentDisplay;
- (id)device;
- (id)newDrawable;
- (id)nextDrawable;
- (id)preferredDevice;
- (id)shimDrawable:(id)a3;
- (unint64_t)displayCompositingInternalStatus;
- (unint64_t)protectionOptions;
- (unint64_t)textureUsage;
- (void)_didCommitLayer:(void *)a3;
- (void)_display;
- (void)dealloc;
- (void)didChangeValueForKey:(id)a3;
- (void)discardContents;
- (void)layerDidBecomeVisible:(BOOL)a3;
- (void)removeBackBuffers;
- (void)setAllowsDisplayCompositingWithCopy:(BOOL)a3;
- (void)setAllowsNextDrawableTimeout:(BOOL)allowsNextDrawableTimeout;
- (void)setCachedDisplay:(id)a3;
- (void)setColorspace:(CGColorSpace *)a3 nonDefault:(BOOL)a4;
- (void)setColorspace:(CGColorSpaceRef)colorspace;
- (void)setContents:(id)a3;
- (void)setDeveloperHUDProperties:(NSDictionary *)developerHUDProperties;
- (void)setDevice:(id)device;
- (void)setDisplaySyncEnabled:(BOOL)displaySyncEnabled;
- (void)setDrawableSize:(CGSize)drawableSize;
- (void)setDrawableTimeoutSeconds:(double)a3;
- (void)setEDRMetadata:(CAEDRMetadata *)EDRMetadata;
- (void)setFenceEnabled:(BOOL)a3;
- (void)setFramebufferOnly:(BOOL)framebufferOnly;
- (void)setInputTime:(double)a3;
- (void)setLowLatency:(BOOL)a3;
- (void)setLowWorkload:(BOOL)a3;
- (void)setMaximumDrawableCount:(NSUInteger)maximumDrawableCount;
- (void)setName:(id)a3;
- (void)setNonDefaultColorspace:(BOOL)a3;
- (void)setPixelFormat:(MTLPixelFormat)pixelFormat;
- (void)setPresentsWithTransaction:(BOOL)presentsWithTransaction;
- (void)setProtectionOptions:(unint64_t)a3;
- (void)setServerSyncEnabled:(BOOL)a3;
- (void)setTextureUsage:(unint64_t)a3;
@end

@implementation CAMetalLayer

- (void)didChangeValueForKey:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (self->_priv)
  {
    if ([a3 isEqualToString:@"opaque"])
    {
      BOOL v5 = [(CALayer *)self isOpaque];
      priv = self->_priv;
      if (v5) {
        __int16 v7 = 4;
      }
      else {
        __int16 v7 = 0;
      }
      __int16 v8 = priv[144] & 0xFFFB;
      goto LABEL_17;
    }
    if ([a3 isEqualToString:@"presentsWithTransaction"])
    {
      BOOL v9 = [(CAMetalLayer *)self presentsWithTransaction];
      priv = self->_priv;
      if (v9) {
        __int16 v7 = 32;
      }
      else {
        __int16 v7 = 0;
      }
      __int16 v8 = priv[144] & 0xFFDF;
      goto LABEL_17;
    }
    if ([a3 isEqualToString:@"allowsNextDrawableTimeout"])
    {
      BOOL v10 = [(CAMetalLayer *)self allowsNextDrawableTimeout];
      priv = self->_priv;
      if (v10) {
        __int16 v7 = 128;
      }
      else {
        __int16 v7 = 0;
      }
      __int16 v8 = priv[144] & 0xFF7F;
      goto LABEL_17;
    }
    if (![a3 isEqualToString:@"fenceEnabled"])
    {
      if ([a3 isEqualToString:@"serverSyncEnabled"])
      {
        BOOL v14 = [(CAMetalLayer *)self serverSyncEnabled];
        priv = self->_priv;
        if (v14) {
          __int16 v7 = 1024;
        }
        else {
          __int16 v7 = 0;
        }
        __int16 v8 = priv[144] & 0xFBFF;
      }
      else
      {
        if ([a3 isEqualToString:@"lowLatency"])
        {
          __int16 v15 = [(CAMetalLayer *)self lowLatency];
          priv = self->_priv;
          __int16 v11 = priv[144] & 0xFFFE | v15;
          goto LABEL_18;
        }
        if ([a3 isEqualToString:@"lowWorkload"])
        {
          BOOL v16 = [(CAMetalLayer *)self lowWorkload];
          priv = self->_priv;
          if (v16) {
            __int16 v7 = 2;
          }
          else {
            __int16 v7 = 0;
          }
          __int16 v8 = priv[144] & 0xFFFD;
        }
        else
        {
          if (![a3 isEqualToString:@"allowsDisplayCompositingWithCopy"]) {
            goto LABEL_19;
          }
          BOOL v17 = [(CAMetalLayer *)self allowsDisplayCompositingWithCopy];
          priv = self->_priv;
          if (v17) {
            __int16 v7 = 0x2000;
          }
          else {
            __int16 v7 = 0;
          }
          __int16 v8 = priv[144] & 0xDFFF;
        }
      }
LABEL_17:
      __int16 v11 = v8 | v7;
LABEL_18:
      priv[144] = v11;
      goto LABEL_19;
    }
    if ([(CAMetalLayer *)self fenceEnabled]) {
      __int16 v12 = 256;
    }
    else {
      __int16 v12 = 0;
    }
    *((_WORD *)self->_priv + 144) = *((_WORD *)self->_priv + 144) & 0xFEFF | v12;
    if ([(CAMetalLayer *)self fenceEnabled]) {
      __int16 v13 = 512;
    }
    else {
      __int16 v13 = 0;
    }
    *((_WORD *)self->_priv + 144) = *((_WORD *)self->_priv + 144) & 0xFDFF | v13;
    CAImageQueueSetFlagsInternal(*((int **)self->_priv + 2), 0x4000000000000000, (unint64_t)(*((_WORD *)self->_priv + 144) & 0x100) << 54);
  }
LABEL_19:
  v18.receiver = self;
  v18.super_class = (Class)CAMetalLayer;
  [(CAMetalLayer *)&v18 didChangeValueForKey:a3];
}

- (void)layerDidBecomeVisible:(BOOL)a3
{
  priv = self->_priv;
  if (priv)
  {
    if (a3) {
      __int16 v4 = 8;
    }
    else {
      __int16 v4 = 0;
    }
    *((_WORD *)priv + 144) = *((_WORD *)priv + 144) & 0xFFF7 | v4;
    if (a3) {
      CAImageQueueConsumeUnconsumed_(*((void *)priv + 2), 0);
    }
    else {
      layer_private_cleanup_callbacks((_CAMetalLayerPrivate *)priv);
    }
  }
}

+ (BOOL)CA_automaticallyNotifiesObservers:(Class)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if ((Class)objc_opt_class() == a3) {
    return 0;
  }
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___CAMetalLayer;
  return objc_msgSendSuper2(&v6, sel_CA_automaticallyNotifiesObservers_, a3);
}

- (void)_display
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2.receiver = self;
  v2.super_class = (Class)CAMetalLayer;
  [(CALayer *)&v2 setContents:[(CALayer *)self contents]];
}

- (BOOL)isDrawableAvailable
{
  uint64_t v3 = mach_absolute_time();
  double v4 = CATimeWithHostTime(v3);
  while (1)
  {
    priv = (char *)self->_priv;
    objc_super v6 = (os_unfair_lock_s *)(priv + 8);
    os_unfair_lock_lock((os_unfair_lock_t)priv + 2);
    __int16 v7 = *((_WORD *)priv + 144);
    if ((v7 & 0x100) != 0)
    {
      BOOL v9 = *((void *)priv + 4) == 0;
LABEL_7:
      if ((v7 & 0x10) == 0 && v9) {
        uint64_t v10 = 132;
      }
      else {
        uint64_t v10 = 136;
      }
      BOOL v8 = *(_DWORD *)&priv[v10] > 2u;
      goto LABEL_11;
    }
    if ((v7 & 0x20) != 0 && !*((void *)priv + 4))
    {
      BOOL v9 = 1;
      goto LABEL_7;
    }
    BOOL v8 = 0;
LABEL_11:
    pthread_setspecific(collect_slot, priv);
    unint64_t v11 = CAImageQueueCollect_(*((void *)priv + 2), 0, v8);
    pthread_setspecific(collect_slot, 0);
    if (v11)
    {
      uint64_t v12 = *((void *)priv + 4) || (*((_WORD *)priv + 144) & 0x10) != 0
          ? *((unsigned int *)priv + 34)
          : *((unsigned int *)priv + 33);
      if (v12 < 5)
      {
        unint64_t v13 = 5 - v12;
        unint64_t v14 = v11;
        if (v13 < v11) {
          unint64_t v14 = v13;
        }
        v11 -= v14;
      }
    }
    unint64_t v15 = *((unsigned int *)priv + 35);
    os_unfair_lock_unlock(v6);
    uint64_t v16 = mach_absolute_time();
    double v17 = CATimeWithHostTime(v16);
    if (v11 > v15 || v17 - v4 > 0.001) {
      break;
    }
    usleep(0x64u);
  }
  if (v11 <= v15)
  {
    objc_super v18 = self->_priv;
    os_unfair_lock_lock((os_unfair_lock_t)v18 + 2);
    CAImageQueuePing_(*((void *)v18 + 2), 0, 0, 0.0, 0.0);
    os_unfair_lock_unlock((os_unfair_lock_t)v18 + 2);
  }
  return v11 > v15;
}

+ (id)defaultValueForKey:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (([a3 isEqualToString:@"opaque"] & 1) != 0
    || ([a3 isEqualToString:@"allowsDisplayCompositing"] & 1) != 0)
  {
    return (id)MEMORY[0x1E4F1CC38];
  }
  if (([a3 isEqualToString:@"presentsWithTransaction"] & 1) != 0
    || ([a3 isEqualToString:@"fenceEnabled"] & 1) != 0
    || ([a3 isEqualToString:@"serverSyncEnabled"] & 1) != 0)
  {
    return (id)MEMORY[0x1E4F1CC28];
  }
  if (([a3 isEqualToString:@"displaySyncEnabled"] & 1) != 0
    || ([a3 isEqualToString:@"allowsNextDrawableTimeout"] & 1) != 0)
  {
    return (id)MEMORY[0x1E4F1CC38];
  }
  if ([a3 isEqualToString:@"lowLatency"]) {
    return (id)MEMORY[0x1E4F1CC28];
  }
  if ([a3 isEqualToString:@"allowsDisplayCompositingWithCopy"]) {
    return (id)MEMORY[0x1E4F1CC38];
  }
  if (([a3 isEqualToString:@"lowWorkload"] & 1) == 0)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___CAMetalLayer;
    return objc_msgSendSuper2(&v6, sel_defaultValueForKey_, a3);
  }
  return (id)MEMORY[0x1E4F1CC28];
}

- (CGSize)drawableSize
{
  priv = self->_priv;
  LODWORD(v2) = priv[30];
  LODWORD(v3) = priv[31];
  double v5 = (double)v2;
  double v6 = (double)v3;
  result.height = v6;
  result.width = v5;
  return result;
}

- (id)nextDrawable
{
  v6[1] = *(id *)MEMORY[0x1E4F143B8];
  unint64_t v3 = (os_unfair_lock_s *)((char *)self->_priv + 8);
  os_unfair_lock_lock(v3);
  if (*((void *)self->_priv + 4)) {
    [MEMORY[0x1E4F1CA00] raise:@"CAMetalLayerInvalidOperation" format:@"-nextDrawable should not be called when using CAMetalDisplayLink."];
  }
  v6[0] = 0;
  CAMetalLayerPrivateNextDrawableLocked(self, (CAMetalDrawable **)v6, 0);
  [v6[0] estimateTargets];
  id v4 = [(CAMetalLayer *)self shimDrawable:v6[0]];
  os_unfair_lock_unlock(v3);
  return v4;
}

- (id)shimDrawable:(id)a3
{
  return a3;
}

- (id)currentDisplay
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(*((void *)self->_priv + 2) + 48);
  if (v3) {
    int v4 = *(_DWORD *)(*(void *)(v3 + 24) + 24);
  }
  else {
    int v4 = 0;
  }
  if ([(CAMetalLayer *)self cachedDisplay]
    && [(CADisplay *)[(CAMetalLayer *)self cachedDisplay] displayId] == v4)
  {
    return [(CAMetalLayer *)self cachedDisplay];
  }
  else
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v6 = +[CADisplay displays];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v12 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          unint64_t v11 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          if ([v11 displayId] == v4)
          {
            [(CAMetalLayer *)self setCachedDisplay:v11];
            return v11;
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v12 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
    [(CAMetalLayer *)self setCachedDisplay:0];
    return 0;
  }
}

- (CADisplay)cachedDisplay
{
  return self->_cachedDisplay;
}

- (void)setCachedDisplay:(id)a3
{
}

- (MTLPixelFormat)pixelFormat
{
  return *((void *)self->_priv + 12);
}

- (void)setColorspace:(CGColorSpaceRef)colorspace
{
}

- (void)_didCommitLayer:(void *)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  priv = self->_priv;
  if (priv)
  {
    if ((*((_DWORD *)priv + 1) & 2) != 0)
    {
      uint64_t v6 = *((void *)a3 + 5);
      if (v6)
      {
        uint64_t v7 = (os_unfair_lock_s *)*((void *)priv + 2);
        if (v7)
        {
          uint64_t v8 = v7 + 4;
          os_unfair_lock_lock(v7 + 4);
          int v9 = v7[6]._os_unfair_lock_opaque + 1;
          v7[6]._os_unfair_lock_opaque = v9;
          os_unfair_lock_unlock(v7 + 4);
          os_unfair_lock_lock(v7 + 4);
          os_unfair_lock_opaque = (CA::Render::Object *)v7[7]._os_unfair_lock_opaque;
          os_unfair_lock_unlock(v8);
          int valuePtr = v9;
          unint64_t v11 = (__CFString *)CFNumberCreate(0, kCFNumberIntType, &valuePtr);
          CA::Context::commit_command((CA::Context *)0xE, os_unfair_lock_opaque, v11, *(const void **)(v6 + 208), v12);
          CFRelease(v11);
        }
        atomic_fetch_and((atomic_uint *volatile)priv + 1, 0xFFFFFFFD);
      }
    }
  }
  v13.receiver = self;
  v13.super_class = (Class)CAMetalLayer;
  [(CALayer *)&v13 _didCommitLayer:a3];
}

- (void)setFramebufferOnly:(BOOL)framebufferOnly
{
  priv = (os_unfair_lock_s *)self->_priv;
  if (priv)
  {
    BOOL v4 = framebufferOnly;
    os_unfair_lock_lock(priv + 2);
    __int16 os_unfair_lock_opaque = priv[72]._os_unfair_lock_opaque;
    if (((((os_unfair_lock_opaque & 0x40) == 0) ^ v4) & 1) == 0)
    {
      if (v4) {
        __int16 v6 = 64;
      }
      else {
        __int16 v6 = 0;
      }
      LOWORD(priv[72]._os_unfair_lock_opaque) = os_unfair_lock_opaque & 0xFFBF | v6;
      layer_private_flush_async((_CAMetalLayerPrivate *)priv);
    }
    os_unfair_lock_unlock(priv + 2);
  }
}

- (void)setPixelFormat:(MTLPixelFormat)pixelFormat
{
  if ((int)pixelFormat <= (uint64_t)(MTLPixelFormatBGRA8Unorm_sRGB|0x8))
  {
    if ((int)pixelFormat <= (uint64_t)MTLPixelFormatRG16Sint)
    {
      if ((pixelFormat - 10) < 2)
      {
        uint64_t v5 = 1093677112;
        goto LABEL_29;
      }
      if ((pixelFormat - 30) < 2)
      {
        uint64_t v5 = 1279340600;
        goto LABEL_29;
      }
LABEL_28:
      objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"CAMetalLayerInvalid", @"invalid pixel format %lu", pixelFormat);
      uint64_t v5 = 0;
      goto LABEL_29;
    }
    if ((pixelFormat - 70) >= 2)
    {
      if ((pixelFormat - 80) < 2)
      {
        uint64_t v5 = 1111970369;
LABEL_29:
        int v8 = 29;
        goto LABEL_30;
      }
      if (pixelFormat == MTLPixelFormatRG16Float)
      {
        uint64_t v5 = 843264104;
        goto LABEL_29;
      }
      goto LABEL_28;
    }
    unsigned __int16 v7 = 16961;
LABEL_19:
    uint64_t v5 = v7 | 0x52470000u;
    goto LABEL_29;
  }
  if ((int)pixelFormat <= 549)
  {
    if (pixelFormat == MTLPixelFormatRGB10A2Unorm)
    {
      uint64_t v5 = 1378955371;
      goto LABEL_29;
    }
    if (pixelFormat == MTLPixelFormatBGR10A2Unorm)
    {
      uint64_t v5 = 1815162994;
      goto LABEL_29;
    }
    if (pixelFormat != MTLPixelFormatRGBA16Float) {
      goto LABEL_28;
    }
    unsigned __int16 v7 = 26689;
    goto LABEL_19;
  }
  if ((pixelFormat - 550) > 5) {
    goto LABEL_28;
  }
  int v6 = 1 << (pixelFormat - 38);
  if ((v6 & 3) != 0)
  {
    uint64_t v5 = 1647534392;
  }
  else if ((v6 & 0xC) != 0)
  {
    uint64_t v5 = 1999908961;
  }
  else
  {
    uint64_t v5 = 1999843442;
  }
  int v8 = 28;
LABEL_30:
  if (![(CAMetalLayer *)self colorspace]
    || ![(CAMetalLayer *)self nonDefaultColorspace])
  {
    if (pixelFormat == MTLPixelFormatRGBA16Float) {
      unsigned int v9 = 26;
    }
    else {
      unsigned int v9 = v8;
    }
    [(CAMetalLayer *)self setColorspace:CAGetColorSpace(v9) nonDefault:0];
  }
  priv = self->_priv;
  if (priv)
  {
    layer_private_check_pixel_format(*((_CAMetalLayerPrivate **)priv + 9), (CA::Render *)v5);
    os_unfair_lock_lock((os_unfair_lock_t)priv + 2);
    if (*((void *)priv + 12) != pixelFormat)
    {
      *((_DWORD *)priv + 16) = v5;
      *((void *)priv + 12) = pixelFormat;
      layer_private_flush_async((_CAMetalLayerPrivate *)priv);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)priv + 2);
    if (MEMORY[0x1E4F62348]) {
      FPMetalLayerMarkSetPixelFormat();
    }
  }
}

- (void)setNonDefaultColorspace:(BOOL)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = nonDefaultColorspace_atom;
  if (!nonDefaultColorspace_atom)
  {
    uint64_t v5 = CAInternAtomWithCString("nonDefaultColorspace");
    nonDefaultColorspace_atom = v5;
  }
  BOOL v6 = a3;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)v5, (const CGAffineTransform *)7, (double *)&v6);
}

- (void)setColorspace:(CGColorSpace *)a3 nonDefault:(BOOL)a4
{
  BOOL v4 = a4;
  priv = (CGColorSpace **)self->_priv;
  if (priv && priv[31] != a3)
  {
    CGColorSpaceRetain(a3);
    int v8 = self->_priv;
    unsigned int v9 = (CGColorSpace *)*((void *)v8 + 31);
    if (v9)
    {
      CGColorSpaceRelease(v9);
      int v8 = self->_priv;
    }
    *((void *)v8 + 31) = a3;
  }

  [(CAMetalLayer *)self setNonDefaultColorspace:v4];
}

- (CGColorSpaceRef)colorspace
{
  return (CGColorSpaceRef)*((void *)self->_priv + 31);
}

- (BOOL)nonDefaultColorspace
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  unsigned int v3 = nonDefaultColorspace_atom;
  if (!nonDefaultColorspace_atom)
  {
    unsigned int v3 = CAInternAtomWithCString("nonDefaultColorspace");
    nonDefaultColorspace_atom = v3;
  }
  char v5 = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, v3, (const CGAffineTransform *)7, (id *)&v5);
  return v5 != 0;
}

- (void)setDevice:(id)device
{
  priv = self->_priv;
  if (priv)
  {
    os_unfair_lock_lock((os_unfair_lock_t)priv + 2);
    if (*((id *)priv + 9) != device)
    {
      id v5 = device;

      *((void *)priv + 9) = device;
      layer_private_flush_async((_CAMetalLayerPrivate *)priv);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)priv + 2);
  }
}

- (void)setDrawableSize:(CGSize)drawableSize
{
  priv = (os_unfair_lock_s *)self->_priv;
  if (priv)
  {
    if (drawableSize.width > 16384.0
      || drawableSize.width < 1.0
      || drawableSize.height < 1.0
      || drawableSize.height > 16384.0)
    {
      NSLog(&cfstr_CametallayerIg.isa, a2, *(void *)&drawableSize.width, *(void *)&drawableSize.height);
    }
    else
    {
      int width = drawableSize.width;
      int height = drawableSize.height;
      os_unfair_lock_lock(priv + 2);
      if (priv[30]._os_unfair_lock_opaque != width || priv[31]._os_unfair_lock_opaque != height)
      {
        layer_private_set_drawable_size_internal((_CAMetalLayerPrivate *)priv, width, height);
        layer_private_flush_async((_CAMetalLayerPrivate *)priv);
      }
      os_unfair_lock_unlock(priv + 2);
    }
  }
}

- (id)device
{
  return (id)*((void *)self->_priv + 9);
}

- (CAMetalLayer)init
{
  v45[1] = *MEMORY[0x1E4F143B8];
  v44.receiver = self;
  v44.super_class = (Class)CAMetalLayer;
  unint64_t v2 = [(CALayer *)&v44 init];
  if (v2)
  {
    if (!collect_slot)
    {
      v45[0] = 0;
      pthread_key_create(v45, 0);
      collect_slot = v45[0];
    }
    unsigned int v3 = malloc_type_calloc(1uLL, 0x130uLL, 0x10A0040EC70FFF3uLL);
    *(_DWORD *)unsigned int v3 = 1;
    uint64_t v4 = CAImageQueueCreate_(0, 5u);
    if (v4) {
      *(void *)(v4 + 32) = 0;
    }
    v3[2] = v4;
    if (byte_1EB2ACC48) {
      int v5 = 2;
    }
    else {
      int v5 = 3;
    }
    *((_DWORD *)v3 + 33) = v5;
    *((_DWORD *)v3 + 34) = 3;
    v3[18] = dispatch_semaphore_create(0);
    *((_DWORD *)v3 + 38) = 0;
    v3[24] = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v3[27] = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if (v3[2])
    {
      CA::Render::add_observer(0x31u, 0, (uint64_t)layer_private_memory_warning, (uint64_t)v3, 0);
      CA::Render::add_observer(9u, 0, (uint64_t)drawable_purgeable_callback, (uint64_t)v3, 0);
      int v6 = *((_DWORD *)v3 + 33);
      if (v6 == 2) {
        uint64_t v7 = 0x2440000000008001;
      }
      else {
        uint64_t v7 = 0x2400000000008001;
      }
      if (v6 == 2) {
        uint64_t v8 = 0x2440000000008000;
      }
      else {
        uint64_t v8 = 0x2400000000008000;
      }
      if (wants_compositing_dependencies(void)::once != -1) {
        dispatch_once(&wants_compositing_dependencies(void)::once, &__block_literal_global_515);
      }
      if (wants_compositing_dependencies(void)::wants_compositing_dependencies) {
        uint64_t v9 = v7 | 0x4000000000000;
      }
      else {
        uint64_t v9 = v7;
      }
      if (wants_compositing_dependencies(void)::wants_compositing_dependencies) {
        uint64_t v10 = v8 | 0x4000000000000;
      }
      else {
        uint64_t v10 = v8;
      }
      CAImageQueueSetFlagsInternal((int *)v3[2], v9, v10);
      uint64_t v11 = v3[2];
      uint64_t v12 = *(void *)(v11 + 48);
      if (v12) {
        *(unsigned char *)(*(void *)(v12 + 24) + 95) = 2;
      }
      CAImageQueueSetCollectableCallback(v11, 0, (uint64_t)layer_collectable_signal, (uint64_t)v3);
      uint64_t v13 = v3[2];
      if (!*(void *)(v13 + 48)) {
        goto LABEL_45;
      }
      pthread_mutex_lock(&composited_mutex);
      long long v14 = *(void (**)(_CAImageQueue *, void *, unsigned int, uint64_t))(v13 + 144);
      if (v14 != layer_composited || *(void **)(v13 + 152) != v3)
      {
        if (*(unsigned char *)(v13 + 160))
        {
          do
            pthread_cond_wait(&composited_cond, &composited_mutex);
          while (*(unsigned char *)(v13 + 160));
          long long v14 = *(void (**)(_CAImageQueue *, void *, unsigned int, uint64_t))(v13 + 144);
        }
        if (!v14)
        {
          uint64_t v15 = composited_list;
          malloc_zone = (malloc_zone_t *)get_malloc_zone();
          uint64_t v17 = malloc_type_zone_malloc(malloc_zone, 0x10uLL, 0x8BB15036uLL);
          *uint64_t v17 = v13;
          v17[1] = v15;
          composited_list = (uint64_t)v17;
        }
        *(void *)(v13 + 144) = layer_composited;
        *(void *)(v13 + 152) = v3;
        *(_DWORD *)(*(void *)(*(void *)(v13 + 48) + 24) + 52) = *(_DWORD *)(v13 + 28);
      }
      pthread_mutex_unlock(&composited_mutex);
      uint64_t v13 = v3[2];
      if (*(void *)(v13 + 48))
      {
        pthread_mutex_lock(&presented_mutex);
        objc_super v18 = *(void (**)(_CAImageQueue *, unsigned int, double, double, double, char *))(v13 + 120);
        if (v18 != layer_presented || *(void **)(v13 + 128) != v3)
        {
          if (*(unsigned char *)(v13 + 136))
          {
            do
              pthread_cond_wait(&presented_cond, &presented_mutex);
            while (*(unsigned char *)(v13 + 136));
            objc_super v18 = *(void (**)(_CAImageQueue *, unsigned int, double, double, double, char *))(v13 + 120);
          }
          if (!v18)
          {
            uint64_t v19 = presented_list;
            v20 = (malloc_zone_t *)get_malloc_zone();
            v21 = malloc_type_zone_malloc(v20, 0x10uLL, 0x8BB15036uLL);
            void *v21 = v13;
            v21[1] = v19;
            presented_list = (uint64_t)v21;
          }
          *(void *)(v13 + 120) = layer_presented;
          *(void *)(v13 + 128) = v3;
          *(_DWORD *)(*(void *)(*(void *)(v13 + 48) + 24) + 48) = *(_DWORD *)(v13 + 28);
        }
        pthread_mutex_unlock(&presented_mutex);
        uint64_t v13 = v3[2];
        BOOL v22 = *(void *)(v13 + 48) == 0;
      }
      else
      {
LABEL_45:
        BOOL v22 = 1;
      }
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __20__CAMetalLayer_init__block_invoke;
      aBlock[3] = &__block_descriptor_40_e24_v16__0___CAImageQueue__8l;
      aBlock[4] = v3;
      if (!v22)
      {
        pthread_mutex_lock(&display_change_mutex);
        v23 = *(void **)(v13 + 168);
        if (v23 != aBlock)
        {
          if (*(unsigned char *)(v13 + 176))
          {
            do
              pthread_cond_wait(&display_change_cond, &display_change_mutex);
            while (*(unsigned char *)(v13 + 176));
            v23 = *(void **)(v13 + 168);
          }
          if (!v23)
          {
            uint64_t v24 = display_change_list;
            v25 = (malloc_zone_t *)get_malloc_zone();
            v26 = malloc_type_zone_malloc(v25, 0x10uLL, 0x8BB15036uLL);
            void *v26 = v13;
            v26[1] = v24;
            display_change_list = (uint64_t)v26;
            v23 = *(void **)(v13 + 168);
          }
          _Block_release(v23);
          *(void *)(v13 + 168) = _Block_copy(aBlock);
          *(_DWORD *)(*(void *)(*(void *)(v13 + 48) + 24) + 56) = *(_DWORD *)(v13 + 28);
        }
        pthread_mutex_unlock(&display_change_mutex);
        uint64_t v13 = v3[2];
      }
      v3[3] = v2;
      v42.receiver = v2;
      v42.super_class = (Class)CAMetalLayer;
      [(CALayer *)&v42 setContents:v13];
      if ([(CALayer *)v2 isOpaque]) {
        __int16 v27 = 4;
      }
      else {
        __int16 v27 = 0;
      }
      *((_WORD *)v3 + 144) = v3[36] & 0xFFFB | v27;
      if ([(CAMetalLayer *)v2 presentsWithTransaction]) {
        __int16 v28 = 32;
      }
      else {
        __int16 v28 = 0;
      }
      *((_WORD *)v3 + 144) = v3[36] & 0xFFDF | v28;
      if ([(CAMetalLayer *)v2 allowsNextDrawableTimeout]) {
        __int16 v29 = 128;
      }
      else {
        __int16 v29 = 0;
      }
      *((_WORD *)v3 + 144) = v3[36] & 0xFF7F | v29;
      if ([(CAMetalLayer *)v2 fenceEnabled]) {
        __int16 v30 = 256;
      }
      else {
        __int16 v30 = 0;
      }
      *((_WORD *)v3 + 144) = v3[36] & 0xFEFF | v30;
      if ([(CAMetalLayer *)v2 fenceEnabled]) {
        __int16 v31 = 512;
      }
      else {
        __int16 v31 = 0;
      }
      *((_WORD *)v3 + 144) = v3[36] & 0xFDFF | v31;
      if ([(CAMetalLayer *)v2 serverSyncEnabled]) {
        __int16 v32 = 1024;
      }
      else {
        __int16 v32 = 0;
      }
      *((_WORD *)v3 + 144) = v3[36] & 0xFBFF | v32;
      *((_WORD *)v3 + 144) = v3[36] & 0xFFFE | [(CAMetalLayer *)v2 lowLatency];
      if ([(CAMetalLayer *)v2 lowWorkload]) {
        __int16 v33 = 2;
      }
      else {
        __int16 v33 = 0;
      }
      *((_WORD *)v3 + 144) = v3[36] & 0xFFFD | v33;
      if ([(CAMetalLayer *)v2 allowsDisplayCompositingWithCopy]) {
        __int16 v34 = 0x2000;
      }
      else {
        __int16 v34 = 0;
      }
      __int16 v35 = v3[36] & 0xDFFF | v34;
      *((_WORD *)v3 + 144) = v35;
      *((_WORD *)v3 + 144) = v35 & 0xFFE7 | (*((_DWORD *)v2->super._attr.layer + 13) >> 17) & 8;
      id v36 = MTLCreateSystemDefaultDevice();
      v3[9] = v36;
      id v37 = v36;
      v3[10] = v37;
      v3[11] = [v37 registryID];
      v3[12] = 80;
      *((_DWORD *)v3 + 16) = 1111970369;
      *((_WORD *)v3 + 144) |= 0x40u;
      *((_DWORD *)v3 + 32) = 0;
      *((unsigned char *)v3 + 232) = -1;
      v3[30] = 0;
      v3[31] = 0;
      v3[34] = 0;
      v3[35] = 0;
      v3[32] = 0;
      v3[33] = -1;
      v3[6] = 0x3FF0000000000000;
      v3[37] = 0;
      v38 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
      v3[21] = dispatch_queue_create("com.apple.coreanimation.CAMetalLayerEventListenerQueue", v38);
      v3[20] = [objc_alloc(MEMORY[0x1E4F2EF98]) initWithDispatchQueue:v3[21]];
      uint64_t v39 = mach_absolute_time();
      v3[28] = CAHostTimeWithTime(1.0) + v39;
      v40 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
      v3[22] = dispatch_queue_create("com.apple.coreanimation.CAMetalLayerTimeoutQueue", v40);
      v2->_priv = v3;
      if (MEMORY[0x1E4F622F8]) {
        FPCAMetalLayerAllocated();
      }
    }
    else
    {
      free(v3);

      return 0;
    }
  }
  return v2;
}

- (BOOL)fenceEnabled
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  unsigned int v3 = fenceEnabled_atom;
  if (!fenceEnabled_atom)
  {
    unsigned int v3 = CAInternAtomWithCString("fenceEnabled");
    fenceEnabled_atom = v3;
  }
  char v5 = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, v3, (const CGAffineTransform *)7, (id *)&v5);
  return v5 != 0;
}

- (BOOL)presentsWithTransaction
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  unsigned int v3 = presentsWithTransaction_atom;
  if (!presentsWithTransaction_atom)
  {
    unsigned int v3 = CAInternAtomWithCString("presentsWithTransaction");
    presentsWithTransaction_atom = v3;
  }
  char v5 = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, v3, (const CGAffineTransform *)7, (id *)&v5);
  return v5 != 0;
}

- (BOOL)allowsNextDrawableTimeout
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  unsigned int v3 = allowsNextDrawableTimeout_atom;
  if (!allowsNextDrawableTimeout_atom)
  {
    unsigned int v3 = CAInternAtomWithCString("allowsNextDrawableTimeout");
    allowsNextDrawableTimeout_atom = v3;
  }
  char v5 = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, v3, (const CGAffineTransform *)7, (id *)&v5);
  return v5 != 0;
}

- (BOOL)serverSyncEnabled
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  unsigned int v3 = serverSyncEnabled_atom;
  if (!serverSyncEnabled_atom)
  {
    unsigned int v3 = CAInternAtomWithCString("serverSyncEnabled");
    serverSyncEnabled_atom = v3;
  }
  char v5 = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, v3, (const CGAffineTransform *)7, (id *)&v5);
  return v5 != 0;
}

- (BOOL)lowWorkload
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  unsigned int v3 = lowWorkload_atom;
  if (!lowWorkload_atom)
  {
    unsigned int v3 = CAInternAtomWithCString("lowWorkload");
    lowWorkload_atom = v3;
  }
  char v5 = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, v3, (const CGAffineTransform *)7, (id *)&v5);
  return v5 != 0;
}

- (BOOL)lowLatency
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  unsigned int v3 = lowLatency_atom;
  if (!lowLatency_atom)
  {
    unsigned int v3 = CAInternAtomWithCString("lowLatency");
    lowLatency_atom = v3;
  }
  char v5 = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, v3, (const CGAffineTransform *)7, (id *)&v5);
  return v5 != 0;
}

- (BOOL)allowsDisplayCompositingWithCopy
{
  priv = (unsigned __int16 *)self->_priv;
  if (priv) {
    return (priv[144] >> 13) & 1;
  }
  else {
    LOBYTE(v3) = 1;
  }
  return v3;
}

- (void)setFenceEnabled:(BOOL)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = fenceEnabled_atom;
  if (!fenceEnabled_atom)
  {
    uint64_t v5 = CAInternAtomWithCString("fenceEnabled");
    fenceEnabled_atom = v5;
  }
  BOOL v6 = a3;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)v5, (const CGAffineTransform *)7, (double *)&v6);
}

- (NSUInteger)maximumDrawableCount
{
  priv = (unsigned int *)self->_priv;
  if (priv) {
    return priv[33];
  }
  else {
    return 0;
  }
}

- (void)setPresentsWithTransaction:(BOOL)presentsWithTransaction
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = presentsWithTransaction_atom;
  if (!presentsWithTransaction_atom)
  {
    uint64_t v5 = CAInternAtomWithCString("presentsWithTransaction");
    presentsWithTransaction_atom = v5;
  }
  BOOL v6 = presentsWithTransaction;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)v5, (const CGAffineTransform *)7, (double *)&v6);
}

- (void)setLowLatency:(BOOL)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = lowLatency_atom;
  if (!lowLatency_atom)
  {
    uint64_t v5 = CAInternAtomWithCString("lowLatency");
    lowLatency_atom = v5;
  }
  BOOL v6 = a3;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)v5, (const CGAffineTransform *)7, (double *)&v6);
}

- (void)setAllowsNextDrawableTimeout:(BOOL)allowsNextDrawableTimeout
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = allowsNextDrawableTimeout_atom;
  if (!allowsNextDrawableTimeout_atom)
  {
    uint64_t v5 = CAInternAtomWithCString("allowsNextDrawableTimeout");
    allowsNextDrawableTimeout_atom = v5;
  }
  BOOL v6 = allowsNextDrawableTimeout;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)v5, (const CGAffineTransform *)7, (double *)&v6);
}

- (void)setMaximumDrawableCount:(NSUInteger)maximumDrawableCount
{
  priv = self->_priv;
  if (*((void *)priv + 4))
  {
    [MEMORY[0x1E4F1CA00] raise:@"CAMetalLayerInvalidOperation" format:@"-setMaximumDrawableCount should not be called when using CAMetalDisplayLink."];
    priv = self->_priv;
  }
  if ((maximumDrawableCount & 0xFFFFFFFFFFFFFFFELL) != 2 || !priv)
  {
    [MEMORY[0x1E4F1CA00] raise:@"CAMetalLayerInvalidMaximumDrawableCount", @"failed trying to set maximumDrawableCount to %lu outside of the valid range of [2, 3]", maximumDrawableCount format];
    return;
  }
  if (byte_1EB2ACC48)
  {
    *((_DWORD *)priv + 33) = 2;
    BOOL v6 = (int *)*((void *)priv + 2);
  }
  else
  {
    *((_DWORD *)priv + 33) = maximumDrawableCount;
    BOOL v6 = (int *)*((void *)priv + 2);
    if (maximumDrawableCount != 2)
    {
      uint64_t v7 = 0;
      goto LABEL_10;
    }
  }
  uint64_t v7 = 0x40000000000000;
LABEL_10:

  CAImageQueueSetFlagsInternal(v6, 0x40000000000000, v7);
}

- (void)setDeveloperHUDProperties:(NSDictionary *)developerHUDProperties
{
  v6[1] = *(double *)MEMORY[0x1E4F143B8];
  uint64_t v5 = developerHUDProperties_atom;
  if (!developerHUDProperties_atom)
  {
    uint64_t v5 = CAInternAtomWithCString("developerHUDProperties");
    developerHUDProperties_atom = v5;
  }
  *(void *)&v6[0] = developerHUDProperties;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)v5, (const CGAffineTransform *)3, v6);
}

- (NSDictionary)developerHUDProperties
{
  v5[1] = *(id *)MEMORY[0x1E4F143B8];
  unsigned int v3 = developerHUDProperties_atom;
  if (!developerHUDProperties_atom)
  {
    unsigned int v3 = CAInternAtomWithCString("developerHUDProperties");
    developerHUDProperties_atom = v3;
  }
  v5[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, v3, (const CGAffineTransform *)3, v5);
  return (NSDictionary *)v5[0];
}

- (void)setDisplaySyncEnabled:(BOOL)displaySyncEnabled
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = displaySyncEnabled_atom;
  if (!displaySyncEnabled_atom)
  {
    uint64_t v5 = CAInternAtomWithCString("displaySyncEnabled");
    displaySyncEnabled_atom = v5;
  }
  BOOL v6 = displaySyncEnabled;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)v5, (const CGAffineTransform *)7, (double *)&v6);
}

- (BOOL)displaySyncEnabled
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  unsigned int v3 = displaySyncEnabled_atom;
  if (!displaySyncEnabled_atom)
  {
    unsigned int v3 = CAInternAtomWithCString("displaySyncEnabled");
    displaySyncEnabled_atom = v3;
  }
  char v5 = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, v3, (const CGAffineTransform *)7, (id *)&v5);
  return v5 != 0;
}

- (void)setContents:(id)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if ([(CALayer *)self contents] != a3) {
    NSLog(&cfstr_CoreanimationC_25.isa);
  }
  v5.receiver = self;
  v5.super_class = (Class)CAMetalLayer;
  [(CALayer *)&v5 setContents:a3];
}

- (id)newDrawable
{
  if (-[CAMetalLayer newDrawable]::warn_once != -1) {
    dispatch_once(&-[CAMetalLayer newDrawable]::warn_once, &__block_literal_global_352);
  }
  id v3 = [(CAMetalLayer *)self nextDrawable];

  return v3;
}

void __27__CAMetalLayer_newDrawable__block_invoke()
{
}

- (void)setEDRMetadata:(CAEDRMetadata *)EDRMetadata
{
  if (*((CAEDRMetadata **)self->_priv + 32) != EDRMetadata)
  {
    objc_super v5 = EDRMetadata;

    *((void *)self->_priv + 32) = EDRMetadata;
  }
}

- (CAEDRMetadata)EDRMetadata
{
  return (CAEDRMetadata *)*((void *)self->_priv + 32);
}

- (BOOL)framebufferOnly
{
  return (*((unsigned __int16 *)self->_priv + 144) >> 6) & 1;
}

- (id)preferredDevice
{
  return (id)*((void *)self->_priv + 10);
}

- (void)setName:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v3.receiver = self;
  v3.super_class = (Class)CAMetalLayer;
  -[CALayer setName:](&v3, sel_setName_);
  if (MEMORY[0x1E4F62340]) {
    FPMetalLayerMarkSetName();
  }
}

uint64_t __20__CAMetalLayer_init__block_invoke(uint64_t result)
{
  if (*(void *)(*(void *)(result + 32) + 32)) {
    return +[CADisplayLink notifyDisplayChange:](CADisplayLink, "notifyDisplayChange:");
  }
  return result;
}

- (void)dealloc
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  priv = (_CAMetalLayerPrivate *)self->_priv;
  if (priv)
  {
    +[CATransaction lock];
    *((void *)priv + 3) = 0;
    +[CATransaction unlock];
    layer_private_release(priv, v4);
  }
  self->_priv = (void *)0x3333333333333333;
  if (MEMORY[0x1E4F62338]) {
    FPMetalLayerMarkDealloc();
  }
  v5.receiver = self;
  v5.super_class = (Class)CAMetalLayer;
  [(CALayer *)&v5 dealloc];
}

- (BOOL)shouldArchiveValueForKey:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (([a3 isEqualToString:@"device"] & 1) != 0
    || ([a3 isEqualToString:@"pixelFormat"] & 1) != 0
    || ([a3 isEqualToString:@"framebufferOnly"] & 1) != 0
    || ([a3 isEqualToString:@"drawableSize"] & 1) != 0
    || ([a3 isEqualToString:@"maximumDrawableCount"] & 1) != 0
    || ([a3 isEqualToString:@"presentsWithTransaction"] & 1) != 0
    || ([a3 isEqualToString:@"colorspace"] & 1) != 0
    || ([a3 isEqualToString:@"EDRMetadata"] & 1) != 0
    || ([a3 isEqualToString:@"protectionOptions"] & 1) != 0
    || ([a3 isEqualToString:@"textureUsage"] & 1) != 0)
  {
    return 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)CAMetalLayer;
  return [(CALayer *)&v6 shouldArchiveValueForKey:a3];
}

- (void)setAllowsDisplayCompositingWithCopy:(BOOL)a3
{
  priv = self->_priv;
  if (priv)
  {
    if (a3) {
      __int16 v4 = 0x2000;
    }
    else {
      __int16 v4 = 0;
    }
    priv[144] = priv[144] & 0xDFFF | v4;
  }
}

- (unint64_t)textureUsage
{
  return *((void *)self->_priv + 35);
}

- (void)setTextureUsage:(unint64_t)a3
{
  priv = (os_unfair_lock_s *)self->_priv;
  if (priv)
  {
    os_unfair_lock_lock(priv + 2);
    if (*(void *)&priv[70]._os_unfair_lock_opaque != a3)
    {
      *(void *)&priv[70].___int16 os_unfair_lock_opaque = a3;
      layer_private_flush_async((_CAMetalLayerPrivate *)priv);
    }
    os_unfair_lock_unlock(priv + 2);
  }
}

- (unint64_t)protectionOptions
{
  return *((void *)self->_priv + 34);
}

- (void)setProtectionOptions:(unint64_t)a3
{
  priv = (os_unfair_lock_s *)self->_priv;
  if (priv)
  {
    os_unfair_lock_lock(priv + 2);
    if (*(void *)&priv[68]._os_unfair_lock_opaque != a3)
    {
      *(void *)&priv[68].___int16 os_unfair_lock_opaque = a3;
      layer_private_flush_async((_CAMetalLayerPrivate *)priv);
    }
    os_unfair_lock_unlock(priv + 2);
  }
}

- (double)drawableTimeoutSeconds
{
  priv = (double *)self->_priv;
  if (priv) {
    return priv[6];
  }
  else {
    return 0.0;
  }
}

- (void)setDrawableTimeoutSeconds:(double)a3
{
  priv = (double *)self->_priv;
  if (priv) {
    priv[6] = a3;
  }
}

- (double)inputTime
{
  priv = (double *)self->_priv;
  if (priv) {
    return priv[5];
  }
  else {
    return 0.0;
  }
}

- (void)setInputTime:(double)a3
{
  priv = (double *)self->_priv;
  if (priv)
  {
    if (priv[5] != 0.0) {
      NSLog(&cfstr_CametallayerSe.isa, a2);
    }
    priv[5] = a3;
  }
}

- (BOOL)exclusiveMode
{
  return 0;
}

- (void)setLowWorkload:(BOOL)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = lowWorkload_atom;
  if (!lowWorkload_atom)
  {
    uint64_t v5 = CAInternAtomWithCString("lowWorkload");
    lowWorkload_atom = v5;
  }
  BOOL v6 = a3;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)v5, (const CGAffineTransform *)7, (double *)&v6);
}

- (void)setServerSyncEnabled:(BOOL)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = serverSyncEnabled_atom;
  if (!serverSyncEnabled_atom)
  {
    uint64_t v5 = CAInternAtomWithCString("serverSyncEnabled");
    serverSyncEnabled_atom = v5;
  }
  BOOL v6 = a3;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)v5, (const CGAffineTransform *)7, (double *)&v6);
}

- (void)removeBackBuffers
{
  priv = (os_unfair_lock_s *)self->_priv;
  if (priv) {
    layer_private_flush_backbuffers(priv);
  }
}

- (void)discardContents
{
  priv = self->_priv;
  if (priv)
  {
    os_unfair_lock_lock((os_unfair_lock_t)priv + 2);
    pthread_setspecific(collect_slot, priv);
    CAImageQueueConsumeUnconsumed_(*((void *)priv + 2), 1);
    CAImageQueueFlush(*((void *)priv + 2));
    pthread_setspecific(collect_slot, 0);
    os_unfair_lock_unlock((os_unfair_lock_t)priv + 2);
  }
}

- (unint64_t)displayCompositingInternalStatus
{
  priv = self->_priv;
  if (priv) {
    return priv[33];
  }
  else {
    return -1;
  }
}

@end