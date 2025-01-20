@interface BLSHPseudoFlipbook
- (BLSHPseudoFlipbook)init;
- (BLSHRenderedFlipbookFrame)frameOnGlass;
- (BLSHRenderedFlipbookFrame)lastRenderedFrame;
- (BOOL)cachesFramesOnExit;
- (BOOL)is1HzFlipbook;
- (BOOL)isPowerSavingEnabled;
- (NSArray)activeFrames;
- (id)cancelAllFrames;
- (uint64_t)lock_cullExpiredFrames;
- (unint64_t)memoryUsage;
- (void)collect;
- (void)invalidate;
- (void)lock_cullExpiredFrames;
- (void)purge;
- (void)renderFrameForPresentation:(id)a3 dateSpecifier:(id)a4 completion:(id)a5;
- (void)set1HzFlipbook:(BOOL)a3;
- (void)setCachesFramesOnExit:(BOOL)a3;
- (void)setPowerSavingEnabled:(BOOL)a3;
@end

@implementation BLSHPseudoFlipbook

- (BLSHPseudoFlipbook)init
{
  v8.receiver = self;
  v8.super_class = (Class)BLSHPseudoFlipbook;
  v2 = [(BLSHPseudoFlipbook *)&v8 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    uint64_t v4 = [MEMORY[0x263EFF980] array];
    lock_activeFrames = v3->_lock_activeFrames;
    v3->_lock_activeFrames = (NSMutableArray *)v4;

    v3->_lock_nextframeID = 1;
    v6 = bls_flipbook_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[BLSHFlipbook initWithPlatformProvider:]((uint64_t)v3, v6);
    }
  }
  return v3;
}

- (BLSHRenderedFlipbookFrame)frameOnGlass
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v4 = mach_continuous_time();
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v5 = self->_lock_activeFrames;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    objc_super v8 = 0;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v5);
        }
        v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v11, "presentationTime", (void)v14) <= v4)
        {
          id v12 = v11;

          objc_super v8 = v12;
        }
      }
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }
  else
  {
    objc_super v8 = 0;
  }

  os_unfair_lock_unlock(p_lock);

  return (BLSHRenderedFlipbookFrame *)v8;
}

- (BLSHRenderedFlipbookFrame)lastRenderedFrame
{
  v2 = [(BLSHPseudoFlipbook *)self activeFrames];
  v3 = [v2 lastObject];

  return (BLSHRenderedFlipbookFrame *)v3;
}

- (NSArray)activeFrames
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[BLSHPseudoFlipbook lock_cullExpiredFrames]((uint64_t)self);
  uint64_t v4 = (void *)[(NSMutableArray *)self->_lock_activeFrames copy];
  os_unfair_lock_unlock(p_lock);

  return (NSArray *)v4;
}

- (uint64_t)lock_cullExpiredFrames
{
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v2 = mach_continuous_time();
    v3 = *(void **)(v1 + 16);
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __44__BLSHPseudoFlipbook_lock_cullExpiredFrames__block_invoke;
    v7[3] = &__block_descriptor_40_e44_B32__0___BLSHRenderedFlipbookFrame__8Q16_B24l;
    v7[4] = v2;
    result = [v3 indexOfObjectWithOptions:2 passingTest:v7];
    if (result && result != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v5 = result;
      uint64_t v6 = bls_flipbook_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
        [(BLSHPseudoFlipbook *)v1 lock_cullExpiredFrames];
      }

      return objc_msgSend(*(id *)(v1 + 16), "removeObjectsInRange:", 0, v5);
    }
  }
  return result;
}

- (unint64_t)memoryUsage
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v2 = [(BLSHPseudoFlipbook *)self activeFrames];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    unint64_t v5 = 0;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v2);
        }
        objc_super v8 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if (objc_opt_respondsToSelector()) {
          v5 += [v8 memoryUsage];
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
  else
  {
    unint64_t v5 = 0;
  }

  return v5;
}

- (BOOL)isPowerSavingEnabled
{
  uint64_t v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_powerSavingEnabled;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setPowerSavingEnabled:(BOOL)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_lock_powerSavingEnabled = a3;

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)is1HzFlipbook
{
  uint64_t v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_1HzFlipbook;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)set1HzFlipbook:(BOOL)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_lock_1HzFlipbook = a3;

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)cachesFramesOnExit
{
  uint64_t v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_cachesFramesOnExit;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setCachesFramesOnExit:(BOOL)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_lock_cachesFramesOnExit = a3;

  os_unfair_lock_unlock(p_lock);
}

BOOL __44__BLSHPseudoFlipbook_lock_cullExpiredFrames__block_invoke(uint64_t a1, void *a2)
{
  return (unint64_t)[a2 presentationTime] < *(void *)(a1 + 32);
}

- (void)renderFrameForPresentation:(id)a3 dateSpecifier:(id)a4 completion:(id)a5
{
  p_lock = &self->_lock;
  objc_super v8 = (void (**)(id, id, void))a5;
  id v9 = a4;
  os_unfair_lock_lock(p_lock);
  -[BLSHPseudoFlipbook lock_cullExpiredFrames]((uint64_t)self);
  long long v10 = [BLSHPseudoFlipbookFrame alloc];
  long long v11 = [v9 presentationDate];
  uint64_t v12 = objc_msgSend(v11, "bls_machContinuousTime");
  ++self->_lock_nextframeID;
  long long v13 = -[BLSHPseudoFlipbookFrame initWithPresentationTime:frameId:specifier:memoryUsage:](v10, "initWithPresentationTime:frameId:specifier:memoryUsage:", v12);

  [(NSMutableArray *)self->_lock_activeFrames addObject:v13];
  os_unfair_lock_unlock(p_lock);
  v8[2](v8, v13, 0);
}

- (id)cancelAllFrames
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v4 = mach_continuous_time();
  lock_activeFrames = self->_lock_activeFrames;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __37__BLSHPseudoFlipbook_cancelAllFrames__block_invoke;
  v9[3] = &__block_descriptor_40_e44_B32__0___BLSHRenderedFlipbookFrame__8Q16_B24l;
  v9[4] = v4;
  uint64_t v6 = [(NSMutableArray *)lock_activeFrames indexOfObjectWithOptions:2 passingTest:v9];
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v7 = 0;
  }
  else
  {
    uint64_t v7 = [(NSMutableArray *)self->_lock_activeFrames objectAtIndex:v6];
  }
  [(NSMutableArray *)self->_lock_activeFrames removeAllObjects];
  os_unfair_lock_unlock(p_lock);

  return v7;
}

BOOL __37__BLSHPseudoFlipbook_cancelAllFrames__block_invoke(uint64_t a1, void *a2)
{
  return (unint64_t)[a2 presentationTime] < *(void *)(a1 + 32);
}

- (void)collect
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v4 = NSStringFromSelector(a1);
  unint64_t v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = NSStringFromClass(v5);
  OUTLINED_FUNCTION_0_0();
  id v9 = @"BLSHPseudoFlipbook.m";
  __int16 v10 = 1024;
  int v11 = 178;
  __int16 v12 = v7;
  uint64_t v13 = a3;
  _os_log_error_impl(&dword_21FCFC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v8, 0x3Au);
}

- (void)purge
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v4 = NSStringFromSelector(a1);
  unint64_t v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = NSStringFromClass(v5);
  OUTLINED_FUNCTION_0_0();
  id v9 = @"BLSHPseudoFlipbook.m";
  __int16 v10 = 1024;
  int v11 = 182;
  __int16 v12 = v7;
  uint64_t v13 = a3;
  _os_log_error_impl(&dword_21FCFC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v8, 0x3Au);
}

- (void)invalidate
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  [(NSMutableArray *)self->_lock_activeFrames removeAllObjects];

  os_unfair_lock_unlock(p_lock);
}

- (void).cxx_destruct
{
}

- (void)lock_cullExpiredFrames
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 134218240;
  uint64_t v4 = a1;
  __int16 v5 = 2048;
  uint64_t v6 = a2;
  _os_log_debug_impl(&dword_21FCFC000, log, OS_LOG_TYPE_DEBUG, "%p culling (%lu) frames", (uint8_t *)&v3, 0x16u);
}

@end