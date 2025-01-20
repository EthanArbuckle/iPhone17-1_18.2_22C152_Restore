@interface ARUIRingsView
+ (Class)layerClass;
+ (id)ringsViewConfiguredForCompanionOfType:(int64_t)a3 withRenderer:(id)a4;
+ (id)ringsViewConfiguredForOneRingOnCompanionOfType:(int64_t)a3;
+ (id)ringsViewConfiguredForOneRingOnWatchOfType:(int64_t)a3;
+ (id)ringsViewConfiguredForOneRingOnWatchOfType:(int64_t)a3 withIcon:(BOOL)a4;
+ (id)ringsViewConfiguredForOneRingOnWatchOfType:(int64_t)a3 withRenderer:(id)a4;
+ (id)ringsViewConfiguredForThreeRingsOnCompanion;
+ (id)ringsViewConfiguredForThreeRingsOnCompanionWithRenderer:(id)a3;
+ (id)ringsViewConfiguredForThreeRingsOnWatch;
+ (id)ringsViewConfiguredForThreeRingsOnWatchWithRenderer:(id)a3;
+ (id)ringsViewConfiguredForWatchOfType:(int64_t)a3 withIcon:(BOOL)a4 renderer:(id)a5;
- (ARUIRenderer)renderer;
- (ARUIRingGroup)ringGroup;
- (ARUIRingGroupController)ringGroupController;
- (ARUIRingsView)initWithRingGroup:(id)a3;
- (ARUIRingsView)initWithRingGroup:(id)a3 renderer:(id)a4;
- (ARUIRingsView)initWithRingGroupController:(id)a3;
- (ARUIRingsView)initWithRingGroupController:(id)a3 renderer:(id)a4;
- (ARUIRingsView)initWithRingGroupControllers:(id)a3;
- (ARUIRingsView)initWithRingGroupControllers:(id)a3 renderer:(id)a4;
- (ARUIRingsView)initWithRingGroups:(id)a3;
- (ARUIRingsView)initWithRingGroups:(id)a3 renderer:(id)a4;
- (BOOL)_shouldAllowRendering;
- (BOOL)discardBackBuffers;
- (BOOL)isPaused;
- (BOOL)shouldBypassApplicationStateChecking;
- (BOOL)shouldCheckDrawableAvailable;
- (BOOL)shouldRenderOnLayout;
- (BOOL)synchronizesWithCA;
- (BOOL)viewIsVisible;
- (NSArray)ringGroupControllers;
- (UIImage)iconSpriteImage;
- (UIImage)snapshot;
- (double)emptyRingAlpha;
- (id)_allRings;
- (id)_anySpriteSheet;
- (id)ringGroups;
- (int64_t)preferredFramesPerSecond;
- (unint64_t)iconTextureColumns;
- (unint64_t)iconTextureRows;
- (void)_didEnterBackground:(id)a3;
- (void)_discardBackBuffers;
- (void)_sharedInitWithRingGroups:(id)a3 renderer:(id)a4;
- (void)_sharedInitWithWithRingGroupControllers:(id)a3 renderer:(id)a4;
- (void)_updateRenderContext;
- (void)_updateRingGroupPauseState;
- (void)_willEnterForeground:(id)a3;
- (void)layoutSubviews;
- (void)setActiveEnergyPercentage:(double)a3 animated:(BOOL)a4;
- (void)setActiveEnergyPercentage:(double)a3 briskPercentage:(double)a4 movingHoursPercentage:(double)a5 animated:(BOOL)a6 completion:(id)a7;
- (void)setBounds:(CGRect)a3;
- (void)setBriskPercentage:(double)a3 animated:(BOOL)a4;
- (void)setDiscardBackBuffers:(BOOL)a3;
- (void)setEmptyRingAlpha:(double)a3;
- (void)setFrame:(CGRect)a3;
- (void)setIconSpriteImage:(id)a3;
- (void)setIconTextureColumns:(unint64_t)a3;
- (void)setIconTextureRows:(unint64_t)a3;
- (void)setMovingHoursPercentage:(double)a3 animated:(BOOL)a4;
- (void)setOpaque:(BOOL)a3;
- (void)setPaused:(BOOL)a3;
- (void)setPreferredFramesPerSecond:(int64_t)a3;
- (void)setShouldBypassApplicationStateChecking:(BOOL)a3;
- (void)setShouldCheckDrawableAvailable:(BOOL)a3;
- (void)setShouldRenderOnLayout:(BOOL)a3;
- (void)setSynchronizesWithCA:(BOOL)a3;
- (void)willMoveToWindow:(id)a3;
@end

@implementation ARUIRingsView

- (ARUIRingsView)initWithRingGroup:(id)a3 renderer:(id)a4
{
  v12[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)ARUIRingsView;
  v8 = -[ARUIRingsView initWithFrame:](&v11, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  if (v8)
  {
    v12[0] = v6;
    v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:1];
    [(ARUIRingsView *)v8 _sharedInitWithRingGroups:v9 renderer:v7];
  }
  return v8;
}

- (void)_sharedInitWithRingGroups:(id)a3 renderer:(id)a4
{
  id v7 = a3;
  v8 = (ARUIRenderer *)a4;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __52__ARUIRingsView__sharedInitWithRingGroups_renderer___block_invoke;
  v13[3] = &unk_264498DA8;
  v13[4] = self;
  [v7 enumerateObjectsUsingBlock:v13];
  objc_storeStrong((id *)&self->_ringGroups, a3);
  v9 = v8;
  if (!v8) {
    v9 = objc_alloc_init(ARUIRenderer);
  }
  objc_storeStrong((id *)&self->_renderer, v9);
  if (!v8) {

  }
  [(ARUIRingsView *)self _updateRenderContext];
  v10 = [MEMORY[0x263F82438] sharedApplication];
  uint64_t v11 = [v10 applicationState];

  self->_backgrounded = v11 == 2;
  self->_discardBackBuffers = 1;
  self->_shouldRenderOnLayout = 1;
  self->_shouldCheckDrawableAvailable = 0;
  v12 = [MEMORY[0x263F08A00] defaultCenter];
  [v12 addObserver:self selector:sel__didEnterBackground_ name:*MEMORY[0x263F83330] object:0];
  [v12 addObserver:self selector:sel__willEnterForeground_ name:*MEMORY[0x263F833B8] object:0];
}

- (void)setFrame:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ARUIRingsView;
  -[ARUIRingsView setFrame:](&v4, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(ARUIRingsView *)self _updateRenderContext];
}

- (void)_updateRenderContext
{
  [(ARUIRingsView *)self bounds];
  v5 = -[ARUIRenderContext initWithSize:]([ARUIRenderContext alloc], "initWithSize:", v3, v4);
  [(ARUIRenderContext *)v5 setOpaque:[(ARUIRingsView *)self isOpaque]];
  id v6 = [(ARUIRingsView *)self metalLayer];
  [(ARUIRenderContext *)v5 drawableSize];
  double v8 = v7;
  [(ARUIRenderContext *)v5 drawableSize];
  objc_msgSend(v6, "setDrawableSize:", v8, v9);

  renderContext = self->_renderContext;
  self->_renderContext = v5;

  [(ARUIRingsView *)self setNeedsLayout];
}

- (void)layoutSubviews
{
  v15.receiver = self;
  v15.super_class = (Class)ARUIRingsView;
  [(ARUIRingsView *)&v15 layoutSubviews];
  if ([(ARUIRingsView *)self _shouldAllowRendering])
  {
    double v3 = [(ARUIRingsView *)self metalLayer];
    if ([v3 isDrawableAvailable])
    {
      double v4 = [(ARUIRingsView *)self metalLayer];
      v5 = [v4 nextDrawable];

      if (!v5) {
        return;
      }
      objc_initWeak(&location, self);
      BOOL discardBackBuffers = self->_discardBackBuffers;
      if (self->_discardBackBuffers)
      {
        float v7 = v12;
        v12[0] = MEMORY[0x263EF8330];
        v12[1] = 3221225472;
        void v12[2] = __31__ARUIRingsView_layoutSubviews__block_invoke;
        v12[3] = &unk_264498DD0;
        double v3 = &v13;
        objc_copyWeak(&v13, &location);
      }
      else
      {
        float v7 = 0;
      }
      double v8 = (void *)MEMORY[0x223C21650](v7);
      renderer = self->_renderer;
      v10 = [(ARUIRingsView *)self _allRings];
      uint64_t v11 = [(ARUIRingsView *)self _anySpriteSheet];
      [(ARUIRenderer *)renderer renderRings:v10 spriteSheet:v11 intoDrawable:v5 withContext:self->_renderContext completion:v8];

      if (discardBackBuffers) {
        objc_destroyWeak(v3);
      }
      objc_destroyWeak(&location);
    }
    else
    {
      v5 = v3;
    }
  }
}

- (BOOL)_shouldAllowRendering
{
  if (!self->_shouldBypassApplicationStateChecking && self->_backgrounded
    || !self->_inViewHierarchy
    || !self->_shouldRenderOnLayout)
  {
    return 0;
  }
  if (!self->_shouldCheckDrawableAvailable) {
    return 1;
  }
  v2 = [(ARUIRingsView *)self metalLayer];
  char v3 = [v2 isDrawableAvailable];

  return v3;
}

- (id)_anySpriteSheet
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = self->_ringGroups;
  char v3 = (void *)[(NSArray *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v10;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v10 != v4) {
          objc_enumerationMutation(v2);
        }
        id v6 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        float v7 = objc_msgSend(v6, "spriteSheet", (void)v9);

        if (v7)
        {
          char v3 = [v6 spriteSheet];
          goto LABEL_11;
        }
      }
      char v3 = (void *)[(NSArray *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (id)_allRings
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  char v3 = [MEMORY[0x263EFF980] array];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = self->_ringGroups;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        long long v9 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "rings", (void)v11);
        [v3 addObjectsFromArray:v9];
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (void)willMoveToWindow:(id)a3
{
  self->_inViewHierarchy = a3 != 0;
  id v4 = a3;
  [(ARUIRingsView *)self _updateRingGroupPauseState];
  v5.receiver = self;
  v5.super_class = (Class)ARUIRingsView;
  [(ARUIRingsView *)&v5 willMoveToWindow:v4];
}

- (void)_updateRingGroupPauseState
{
  if (self->_inViewHierarchy) {
    BOOL v3 = !self->_shouldBypassApplicationStateChecking && self->_backgrounded;
  }
  else {
    BOOL v3 = 1;
  }
  id v4 = [(ARUIRingsView *)self ringGroup];
  int v5 = [v4 paused];

  ringGroups = self->_ringGroups;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __43__ARUIRingsView__updateRingGroupPauseState__block_invoke;
  v7[3] = &__block_descriptor_33_e30_v32__0__ARUIRingGroup_8Q16_B24l;
  BOOL v8 = v3;
  [(NSArray *)ringGroups enumerateObjectsUsingBlock:v7];
  if (!v3)
  {
    if (v5) {
      [(ARUIRingsView *)self setNeedsLayout];
    }
  }
}

void __31__ARUIRingsView_layoutSubviews__block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  BOOL v3 = [WeakRetained ringGroup];
  char v4 = [v3 animating];

  if ((v4 & 1) == 0)
  {
    id v5 = objc_loadWeakRetained(v1);
    [v5 _discardBackBuffers];
  }
}

- (ARUIRingGroup)ringGroup
{
  return (ARUIRingGroup *)[(NSArray *)self->_ringGroups firstObject];
}

void __52__ARUIRingsView__sharedInitWithRingGroups_renderer___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  [v3 setDelegate:v2];
  [v3 setPaused:1];
}

uint64_t __43__ARUIRingsView__updateRingGroupPauseState__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setPaused:*(unsigned __int8 *)(a1 + 32)];
}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (ARUIRingsView)initWithRingGroupController:(id)a3
{
  v12[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ARUIRingsView;
  id v5 = -[ARUIRingsView initWithFrame:](&v10, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  if (v5)
  {
    v12[0] = v4;
    uint64_t v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:1];
    ringGroupControllers = v5->_ringGroupControllers;
    v5->_ringGroupControllers = (NSArray *)v6;

    id v11 = v4;
    BOOL v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v11 count:1];
    [(ARUIRingsView *)v5 _sharedInitWithWithRingGroupControllers:v8 renderer:0];
  }
  return v5;
}

- (ARUIRingsView)initWithRingGroupController:(id)a3 renderer:(id)a4
{
  v15[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)ARUIRingsView;
  BOOL v8 = -[ARUIRingsView initWithFrame:](&v13, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  if (v8)
  {
    v15[0] = v6;
    uint64_t v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:1];
    ringGroupControllers = v8->_ringGroupControllers;
    v8->_ringGroupControllers = (NSArray *)v9;

    id v14 = v6;
    id v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v14 count:1];
    [(ARUIRingsView *)v8 _sharedInitWithWithRingGroupControllers:v11 renderer:v7];
  }
  return v8;
}

- (ARUIRingsView)initWithRingGroupControllers:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ARUIRingsView;
  id v6 = -[ARUIRingsView initWithFrame:](&v9, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_ringGroupControllers, a3);
    [(ARUIRingsView *)v7 _sharedInitWithWithRingGroupControllers:v5 renderer:0];
  }

  return v7;
}

- (ARUIRingsView)initWithRingGroupControllers:(id)a3 renderer:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ARUIRingsView;
  objc_super v9 = -[ARUIRingsView initWithFrame:](&v12, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  objc_super v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_ringGroupControllers, a3);
    [(ARUIRingsView *)v10 _sharedInitWithWithRingGroupControllers:v7 renderer:v8];
  }

  return v10;
}

- (ARUIRingGroupController)ringGroupController
{
  return (ARUIRingGroupController *)[(NSArray *)self->_ringGroupControllers firstObject];
}

- (NSArray)ringGroupControllers
{
  return self->_ringGroupControllers;
}

- (void)_sharedInitWithWithRingGroupControllers:(id)a3 renderer:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v16;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v13), "ringGroup", (void)v15);
        [v8 addObject:v14];

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v11);
  }

  [(ARUIRingsView *)self _sharedInitWithRingGroups:v8 renderer:v7];
}

- (ARUIRingsView)initWithRingGroup:(id)a3
{
  v9[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ARUIRingsView;
  id v5 = -[ARUIRingsView initWithFrame:](&v8, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  if (v5)
  {
    v9[0] = v4;
    id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:1];
    [(ARUIRingsView *)v5 _sharedInitWithRingGroups:v6 renderer:0];
  }
  return v5;
}

- (ARUIRingsView)initWithRingGroups:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ARUIRingsView;
  id v5 = -[ARUIRingsView initWithFrame:](&v8, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  id v6 = v5;
  if (v5) {
    [(ARUIRingsView *)v5 _sharedInitWithRingGroups:v4 renderer:0];
  }

  return v6;
}

- (ARUIRingsView)initWithRingGroups:(id)a3 renderer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)ARUIRingsView;
  objc_super v8 = -[ARUIRingsView initWithFrame:](&v11, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  id v9 = v8;
  if (v8) {
    [(ARUIRingsView *)v8 _sharedInitWithRingGroups:v6 renderer:v7];
  }

  return v9;
}

- (id)ringGroups
{
  return self->_ringGroups;
}

- (void)setBounds:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ARUIRingsView;
  -[ARUIRingsView setBounds:](&v4, sel_setBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(ARUIRingsView *)self _updateRenderContext];
}

- (void)setOpaque:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)ARUIRingsView;
  -[ARUIRingsView setOpaque:](&v5, sel_setOpaque_);
  [(ARUIRenderContext *)self->_renderContext setOpaque:v3];
  [(ARUIRingsView *)self setNeedsLayout];
}

- (void)_discardBackBuffers
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __36__ARUIRingsView__discardBackBuffers__block_invoke;
  block[3] = &unk_264498A30;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __36__ARUIRingsView__discardBackBuffers__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) metalLayer];
  [v1 removeBackBuffers];
}

- (void)_didEnterBackground:(id)a3
{
  self->_backgrounded = 1;
  [(ARUIRingsView *)self _updateRingGroupPauseState];
}

- (void)_willEnterForeground:(id)a3
{
  self->_backgrounded = 0;
  [(ARUIRingsView *)self _updateRingGroupPauseState];
}

- (void)setSynchronizesWithCA:(BOOL)a3
{
}

- (BOOL)synchronizesWithCA
{
  return [(ARUIRenderContext *)self->_renderContext presentsWithTransaction];
}

- (UIImage)snapshot
{
  renderer = self->_renderer;
  objc_super v4 = [(ARUIRingsView *)self _allRings];
  objc_super v5 = [(ARUIRingsView *)self _anySpriteSheet];
  id v6 = [(ARUIRenderer *)renderer snapshotRings:v4 spriteSheet:v5 withContext:self->_renderContext];

  return (UIImage *)v6;
}

- (ARUIRenderer)renderer
{
  return self->_renderer;
}

- (BOOL)shouldBypassApplicationStateChecking
{
  return self->_shouldBypassApplicationStateChecking;
}

- (void)setShouldBypassApplicationStateChecking:(BOOL)a3
{
  self->_shouldBypassApplicationStateChecking = a3;
}

- (BOOL)discardBackBuffers
{
  return self->_discardBackBuffers;
}

- (void)setDiscardBackBuffers:(BOOL)a3
{
  self->_BOOL discardBackBuffers = a3;
}

- (BOOL)shouldRenderOnLayout
{
  return self->_shouldRenderOnLayout;
}

- (void)setShouldRenderOnLayout:(BOOL)a3
{
  self->_shouldRenderOnLayout = a3;
}

- (BOOL)shouldCheckDrawableAvailable
{
  return self->_shouldCheckDrawableAvailable;
}

- (void)setShouldCheckDrawableAvailable:(BOOL)a3
{
  self->_shouldCheckDrawableAvailable = a3;
}

- (int64_t)preferredFramesPerSecond
{
  return self->_preferredFramesPerSecond;
}

- (void)setPreferredFramesPerSecond:(int64_t)a3
{
  self->_preferredFramesPerSecond = a3;
}

- (BOOL)viewIsVisible
{
  return self->_viewIsVisible;
}

- (BOOL)isPaused
{
  return self->_paused;
}

- (void)setPaused:(BOOL)a3
{
  self->_paused = a3;
}

- (double)emptyRingAlpha
{
  return self->_emptyRingAlpha;
}

- (void)setEmptyRingAlpha:(double)a3
{
  self->_emptyRingAlpha = a3;
}

- (unint64_t)iconTextureRows
{
  return self->_iconTextureRows;
}

- (void)setIconTextureRows:(unint64_t)a3
{
  self->_iconTextureRows = a3;
}

- (unint64_t)iconTextureColumns
{
  return self->_iconTextureColumns;
}

- (void)setIconTextureColumns:(unint64_t)a3
{
  self->_iconTextureColumns = a3;
}

- (UIImage)iconSpriteImage
{
  return self->_iconSpriteImage;
}

- (void)setIconSpriteImage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconSpriteImage, 0);
  objc_storeStrong((id *)&self->_renderer, 0);
  objc_storeStrong((id *)&self->_ringGroupControllers, 0);
  objc_storeStrong((id *)&self->_ringGroups, 0);

  objc_storeStrong((id *)&self->_renderContext, 0);
}

+ (id)ringsViewConfiguredForThreeRingsOnWatch
{
  return +[ARUIRingsView ringsViewConfiguredForWatchOfType:3 withIcon:1 renderer:0];
}

+ (id)ringsViewConfiguredForThreeRingsOnWatchWithRenderer:(id)a3
{
  return +[ARUIRingsView ringsViewConfiguredForWatchOfType:3 withIcon:1 renderer:a3];
}

+ (id)ringsViewConfiguredForOneRingOnWatchOfType:(int64_t)a3
{
  return +[ARUIRingsView ringsViewConfiguredForWatchOfType:a3 withIcon:1 renderer:0];
}

+ (id)ringsViewConfiguredForOneRingOnWatchOfType:(int64_t)a3 withRenderer:(id)a4
{
  return +[ARUIRingsView ringsViewConfiguredForWatchOfType:a3 withIcon:1 renderer:a4];
}

+ (id)ringsViewConfiguredForOneRingOnWatchOfType:(int64_t)a3 withIcon:(BOOL)a4
{
  return +[ARUIRingsView ringsViewConfiguredForWatchOfType:a3 withIcon:a4 renderer:0];
}

+ (id)ringsViewConfiguredForWatchOfType:(int64_t)a3 withIcon:(BOOL)a4 renderer:(id)a5
{
  BOOL v5 = a4;
  id v7 = a5;
  objc_super v8 = +[ARUIRingGroupController ringGroupControllerConfiguredForWatchWithRingType:a3 withIcon:v5];
  id v9 = [[ARUIRingsView alloc] initWithRingGroupController:v8 renderer:v7];

  return v9;
}

+ (id)ringsViewConfiguredForThreeRingsOnCompanion
{
  return +[ARUIRingsView ringsViewConfiguredForCompanionOfType:3 withRenderer:0];
}

+ (id)ringsViewConfiguredForThreeRingsOnCompanionWithRenderer:(id)a3
{
  return +[ARUIRingsView ringsViewConfiguredForCompanionOfType:3 withRenderer:a3];
}

+ (id)ringsViewConfiguredForOneRingOnCompanionOfType:(int64_t)a3
{
  return +[ARUIRingsView ringsViewConfiguredForCompanionOfType:a3 withRenderer:0];
}

+ (id)ringsViewConfiguredForCompanionOfType:(int64_t)a3 withRenderer:(id)a4
{
  id v5 = a4;
  id v6 = +[ARUIRingGroupController ringGroupControllerConfiguredForCompanionWithRingType:a3 withIcon:1];
  id v7 = [[ARUIRingsView alloc] initWithRingGroupController:v6 renderer:v5];

  return v7;
}

- (void)setActiveEnergyPercentage:(double)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [(ARUIRingsView *)self ringGroupController];
  [v6 setActiveEnergyPercentage:v4 animated:a3];
}

- (void)setMovingHoursPercentage:(double)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [(ARUIRingsView *)self ringGroupController];
  [v6 setMovingHoursPercentage:v4 animated:a3];
}

- (void)setBriskPercentage:(double)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [(ARUIRingsView *)self ringGroupController];
  [v6 setBriskPercentage:v4 animated:a3];
}

- (void)setActiveEnergyPercentage:(double)a3 briskPercentage:(double)a4 movingHoursPercentage:(double)a5 animated:(BOOL)a6 completion:(id)a7
{
  BOOL v7 = a6;
  id v12 = a7;
  id v13 = [(ARUIRingsView *)self ringGroupController];
  [v13 setActiveEnergyPercentage:v7 briskPercentage:v12 movingHoursPercentage:a3 animated:a4 completion:a5];
}

@end