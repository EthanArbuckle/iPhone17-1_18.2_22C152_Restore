@interface CAEAGLLayer
+ (BOOL)CA_automaticallyNotifiesObservers:(Class)a3;
+ (id)defaultValueForKey:(id)a3;
- (BOOL)_defersDidBecomeVisiblePostCommit;
- (BOOL)isAsynchronous;
- (BOOL)isDrawableAvailable;
- (BOOL)isDrawableAvailableInternal;
- (BOOL)lowLatency;
- (BOOL)presentsWithTransaction;
- (BOOL)shouldArchiveValueForKey:(id)a3;
- (NSDictionary)drawableProperties;
- (_EAGLNativeWindowObject)nativeWindow;
- (double)drawableTimeoutSeconds;
- (double)inputTime;
- (unint64_t)maximumDrawableCount;
- (void)_didCommitLayer:(void *)a3;
- (void)_display;
- (void)dealloc;
- (void)didChangeValueForKey:(id)a3;
- (void)discardContents;
- (void)layerDidBecomeVisible:(BOOL)a3;
- (void)setAsynchronous:(BOOL)a3;
- (void)setDrawableProperties:(id)a3;
- (void)setDrawableTimeoutSeconds:(double)a3;
- (void)setInputTime:(double)a3;
- (void)setLowLatency:(BOOL)a3;
- (void)setMaximumDrawableCount:(unint64_t)a3;
- (void)setPresentsWithTransaction:(BOOL)presentsWithTransaction;
@end

@implementation CAEAGLLayer

+ (BOOL)CA_automaticallyNotifiesObservers:(Class)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if ((Class)objc_opt_class() == a3) {
    return 0;
  }
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___CAEAGLLayer;
  return objc_msgSendSuper2(&v6, sel_CA_automaticallyNotifiesObservers_, a3);
}

- (void)setDrawableProperties:(id)a3
{
  v3[1] = *(double *)MEMORY[0x1E4F143B8];
  *(void *)&v3[0] = a3;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0xBC, (const CGAffineTransform *)3, v3);
}

- (NSDictionary)drawableProperties
{
  v3[1] = *(id *)MEMORY[0x1E4F143B8];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0xBCu, (const CGAffineTransform *)3, v3);
  return (NSDictionary *)v3[0];
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

- (void)_didCommitLayer:(void *)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  win = self->_win;
  if (win)
  {
    if ((*((_DWORD *)win + 33) & 4) != 0)
    {
      uint64_t v6 = *((void *)a3 + 5);
      if (v6)
      {
        uint64_t v7 = (os_unfair_lock_s *)*((void *)win + 18);
        if (v7)
        {
          v8 = v7 + 4;
          os_unfair_lock_lock(v7 + 4);
          int v9 = v7[6]._os_unfair_lock_opaque + 1;
          v7[6]._os_unfair_lock_opaque = v9;
          os_unfair_lock_unlock(v7 + 4);
          os_unfair_lock_lock(v7 + 4);
          os_unfair_lock_opaque = (CA::Render::Object *)v7[7]._os_unfair_lock_opaque;
          os_unfair_lock_unlock(v8);
          int valuePtr = v9;
          v11 = (__CFString *)CFNumberCreate(0, kCFNumberIntType, &valuePtr);
          CA::Context::commit_command((CA::Context *)0xE, os_unfair_lock_opaque, v11, *(const void **)(v6 + 208), v12);
          CFRelease(v11);
        }
        atomic_fetch_and((atomic_uint *volatile)win + 33, 0xFFFFFFFB);
      }
    }
  }
  v13.receiver = self;
  v13.super_class = (Class)CAEAGLLayer;
  [(CALayer *)&v13 _didCommitLayer:a3];
}

- (void)_display
{
  id v3 = [(CALayer *)self contents];

  [(CALayer *)self setContents:v3];
}

- (BOOL)_defersDidBecomeVisiblePostCommit
{
  return 1;
}

- (void)layerDidBecomeVisible:(BOOL)a3
{
  win = self->_win;
  if (win)
  {
    if (a3) {
      char v4 = 2;
    }
    else {
      char v4 = 0;
    }
    *((unsigned char *)win + 256) = *((unsigned char *)win + 256) & 0xFD | v4;
  }
}

- (void)dealloc
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  win = self->_win;
  if (win)
  {
    +[CATransaction lock];
    *((void *)win + 19) = 0;
    +[CATransaction unlock];
    native_window_release(win, v4);
  }
  v5.receiver = self;
  v5.super_class = (Class)CAEAGLLayer;
  [(CALayer *)&v5 dealloc];
}

- (_EAGLNativeWindowObject)nativeWindow
{
  v18[1] = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    p_win = &self->_win;
    win = self->_win;
    if (win) {
      return (_EAGLNativeWindowObject *)win;
    }
    goto LABEL_7;
  }
  int v5 = dyld_program_sdk_at_least();
  p_win = &self->_win;
  win = self->_win;
  if (win) {
    return (_EAGLNativeWindowObject *)win;
  }
  if (!v5)
  {
LABEL_7:
    int v6 = 0;
    goto LABEL_8;
  }
  +[CATransaction begin];
  int v6 = 1;
LABEL_8:
  +[CATransaction lock];
  win = *p_win;
  if (!*p_win)
  {
    if (byte_1EB2ACC48) {
      unint64_t v7 = 2;
    }
    else {
      unint64_t v7 = [(CAEAGLLayer *)self maximumDrawableCount];
    }
    if ((native_window_new(unsigned long)::initialized & 1) == 0)
    {
      native_window_new(unsigned long)::initialized = 1;
      v8 = (objc_class *)objc_opt_class();
      if (class_getInstanceMethod(v8, sel_presentRenderbuffer_atTime_)) {
        native_window_new(unsigned long)::has_present_at_time_method = 1;
      }
    }
    if (!collect_slot)
    {
      v18[0] = 0;
      pthread_key_create(v18, 0);
      collect_slot = v18[0];
    }
    int v9 = (_CAEAGLNativeWindow *)malloc_type_calloc(1uLL, 0x108uLL, 0x10A0040BE3B53CFuLL);
    win = v9;
    *((void *)v9 + 1) = native_window_attach;
    *((void *)v9 + 2) = native_window_detach;
    if (native_window_new(unsigned long)::has_present_at_time_method) {
      v10 = native_window_swap;
    }
    else {
      v10 = native_window_swap_zero_time;
    }
    *(_DWORD *)int v9 = 5;
    *((void *)v9 + 3) = native_window_begin_iosurface;
    *((void *)v9 + 4) = v10;
    *((void *)v9 + 5) = native_window_collect;
    *((void *)v9 + 6) = native_window_begin_properties;
    *((void *)v9 + 7) = native_window_estimated_size;
    CA::Render::add_observer(0x32u, 0, (uint64_t)will_suspend_callback, (uint64_t)v9, 0);
    *((_DWORD *)win + 32) = 1;
    *((void *)win + 29) = dispatch_semaphore_create(0);
    *((_DWORD *)win + 60) = 0;
    uint64_t v11 = CAImageQueueCreate_(0, v7);
    if (v11)
    {
      *(void *)(v11 + 32) = 0;
      *((void *)win + 18) = v11;
      *((void *)win + 31) = v7;
      *((void *)win + 21) = 0x3FF0000000000000;
      if (CADeviceSupportsAPT::once[0] != -1) {
        dispatch_once(CADeviceSupportsAPT::once, &__block_literal_global_52);
      }
      if (CADeviceSupportsAPT::supports_apt) {
        uint64_t v12 = 0x400000000008000;
      }
      else {
        uint64_t v12 = 0x400000000000000;
      }
      if (CADeviceSupportsAPT::supports_apt) {
        uint64_t v13 = 0x400000000008001;
      }
      else {
        uint64_t v13 = 0x400000000000001;
      }
      CAImageQueueSetFlagsInternal(*((int **)win + 18), v13, v12);
      CAImageQueueSetCollectableCallback(*((void *)win + 18), 0, (uint64_t)layer_collectable_signal, (uint64_t)win);
      *((void *)win + 19) = self;
      [(CALayer *)self setContents:*((void *)win + 18)];
      *((unsigned char *)win + 256) = *((unsigned char *)win + 256) & 0xFE | [(CALayer *)self isOpaque];
      if ([(CAEAGLLayer *)self presentsWithTransaction]) {
        char v14 = 4;
      }
      else {
        char v14 = 0;
      }
      *((unsigned char *)win + 256) = *((unsigned char *)win + 256) & 0xFB | v14;
      if ([(CAEAGLLayer *)self lowLatency]) {
        char v15 = 8;
      }
      else {
        char v15 = 0;
      }
      char v16 = *((unsigned char *)win + 256) & 0xF7 | v15;
      *((unsigned char *)win + 256) = v16;
      *((unsigned char *)win + 256) = v16 & 0xFD | (*((_DWORD *)self->super._attr.layer + 13) >> 19) & 2;
      *p_win = win;
    }
    else
    {
      free(win);
      win = 0;
    }
  }
  +[CATransaction unlock];
  if (v6) {
    +[CATransaction commit];
  }
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    if (dyld_program_sdk_at_least()
      && +[CATransaction currentState] == 1)
    {
      NSLog(&cfstr_CoreanimationE.isa);
    }
    else
    {
      +[CATransaction flush];
    }
  }
  return (_EAGLNativeWindowObject *)win;
}

- (void)didChangeValueForKey:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (self->_win)
  {
    if ([a3 isEqualToString:@"opaque"])
    {
      BOOL v5 = [(CALayer *)self isOpaque];
      win = self->_win;
      char v7 = *((unsigned char *)win + 256) & 0xFE | v5;
LABEL_15:
      *((unsigned char *)win + 256) = v7;
      goto LABEL_16;
    }
    if ([a3 isEqualToString:@"presentsWithTransaction"])
    {
      BOOL v8 = [(CAEAGLLayer *)self presentsWithTransaction];
      win = self->_win;
      if (v8) {
        char v9 = 4;
      }
      else {
        char v9 = 0;
      }
      char v10 = *((unsigned char *)win + 256) & 0xFB;
LABEL_14:
      char v7 = v10 | v9;
      goto LABEL_15;
    }
    if ([a3 isEqualToString:@"lowLatency"])
    {
      BOOL v11 = [(CAEAGLLayer *)self lowLatency];
      win = self->_win;
      if (v11) {
        char v9 = 8;
      }
      else {
        char v9 = 0;
      }
      char v10 = *((unsigned char *)win + 256) & 0xF7;
      goto LABEL_14;
    }
  }
LABEL_16:
  v12.receiver = self;
  v12.super_class = (Class)CAEAGLLayer;
  [(CAEAGLLayer *)&v12 didChangeValueForKey:a3];
}

- (BOOL)shouldArchiveValueForKey:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if ([a3 isEqualToString:@"contents"]) {
    return CAEncodeIOSurfacesAsCGImages != 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)CAEAGLLayer;
  return [(CALayer *)&v6 shouldArchiveValueForKey:a3];
}

+ (id)defaultValueForKey:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (([a3 isEqualToString:@"opaque"] & 1) != 0
    || [a3 isEqualToString:@"allowsDisplayCompositing"])
  {
    BOOL v5 = (id *)MEMORY[0x1E4F1CFD0];
    return *v5;
  }
  if ([a3 isEqualToString:@"presentsWithTransaction"]
    || [a3 isEqualToString:@"lowLatency"])
  {
    BOOL v5 = (id *)MEMORY[0x1E4F1CFC8];
    return *v5;
  }
  if ([a3 isEqualToString:@"maximumDrawableCount"])
  {
    id result = (id)+[CAEAGLLayer defaultValueForKey:]::max_buffers;
    if (!+[CAEAGLLayer defaultValueForKey:]::max_buffers)
    {
      if (byte_1EB2ACC48) {
        uint64_t v7 = 2;
      }
      else {
        uint64_t v7 = 3;
      }
      id result = (id)[objc_alloc(NSNumber) initWithInt:v7];
      +[CAEAGLLayer defaultValueForKey:]::max_buffers = (uint64_t)result;
    }
  }
  else
  {
    v8.receiver = a1;
    v8.super_class = (Class)&OBJC_METACLASS___CAEAGLLayer;
    return objc_msgSendSuper2(&v8, sel_defaultValueForKey_, a3);
  }
  return result;
}

- (double)drawableTimeoutSeconds
{
  win = self->_win;
  if (win) {
    return *((double *)win + 21);
  }
  else {
    return 1.0;
  }
}

- (void)setDrawableTimeoutSeconds:(double)a3
{
  win = self->_win;
  if (win) {
    *((double *)win + 21) = a3;
  }
}

- (double)inputTime
{
  win = self->_win;
  if (win) {
    return *((double *)win + 20);
  }
  else {
    return 0.0;
  }
}

- (void)setInputTime:(double)a3
{
  win = self->_win;
  if (win)
  {
    if (*((double *)win + 20) != 0.0) {
      NSLog(&cfstr_CaeagllayerSet.isa, a2);
    }
    *((double *)win + 20) = a3;
  }
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

- (void)setMaximumDrawableCount:(unint64_t)a3
{
  v6[1] = *(double *)MEMORY[0x1E4F143B8];
  uint64_t v5 = maximumDrawableCount_atom;
  if (!maximumDrawableCount_atom)
  {
    uint64_t v5 = CAInternAtomWithCString("maximumDrawableCount");
    maximumDrawableCount_atom = v5;
  }
  *(void *)&v6[0] = a3;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)v5, (const CGAffineTransform *)0xE, v6);
}

- (unint64_t)maximumDrawableCount
{
  v5[1] = *(id *)MEMORY[0x1E4F143B8];
  unsigned int v3 = maximumDrawableCount_atom;
  if (!maximumDrawableCount_atom)
  {
    unsigned int v3 = CAInternAtomWithCString("maximumDrawableCount");
    maximumDrawableCount_atom = v3;
  }
  v5[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, v3, (const CGAffineTransform *)0xE, v5);
  return (unint64_t)v5[0];
}

- (BOOL)isAsynchronous
{
  return ![(CAEAGLLayer *)self presentsWithTransaction];
}

- (void)setAsynchronous:(BOOL)a3
{
}

- (void)discardContents
{
  win = (uint64_t *)self->_win;
  if (win)
  {
    pthread_setspecific(collect_slot, win);
    CAImageQueueConsumeUnconsumed_(win[18], 1);
    CAImageQueueFlush(win[18]);
    pthread_key_t v3 = collect_slot;
    pthread_setspecific(v3, 0);
  }
}

- (BOOL)isDrawableAvailableInternal
{
  win = (uint64_t *)self->_win;
  if (!win) {
    return 0;
  }
  pthread_setspecific(collect_slot, win);
  uint64_t v3 = CAImageQueueCollect_(win[18], 0, 0);
  pthread_setspecific(collect_slot, 0);
  return v3 != 0;
}

- (BOOL)isDrawableAvailable
{
  uint64_t v3 = mach_absolute_time();
  double v4 = CATimeWithHostTime(v3);
  while (1)
  {
    BOOL v5 = [(CAEAGLLayer *)self isDrawableAvailableInternal];
    uint64_t v6 = mach_absolute_time();
    double v7 = CATimeWithHostTime(v6);
    if (v5 || v7 - v4 > 0.001) {
      break;
    }
    usleep(0x64u);
  }
  return v5;
}

@end