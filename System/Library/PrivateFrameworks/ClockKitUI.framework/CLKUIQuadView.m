@interface CLKUIQuadView
+ (id)quadViewWithFrame:(CGRect)a3 identifier:(id)a4;
+ (id)quadViewWithFrame:(CGRect)a3 identifier:(id)a4 options:(unint64_t)a5;
+ (id)quadViewWithFrame:(CGRect)a3 identifier:(id)a4 options:(unint64_t)a5 colorSpace:(int64_t)a6;
- (BOOL)_displayAndCheckForDrawable:(BOOL)a3 renderDiscontinuity:(BOOL)a4 withCompletion:(id)a5;
- (BOOL)_sync_prepareAndRenderForTime:(double)a3 inGroup:(id)a4 checkForDrawable:(BOOL)a5 renderDiscontinuity:(BOOL)a6 completion:(id)a7;
- (BOOL)isPaused;
- (BOOL)renderSynchronouslyWithImageQueueDiscard:(BOOL)a3 inGroup:(id)a4;
- (BOOL)renderSynchronouslyWithImageQueueDiscard:(BOOL)a3 inGroup:(id)a4 completion:(id)a5;
- (BOOL)singleBufferMode;
- (CGSize)drawableSize;
- (CLKUIQuadView)initWithFrame:(CGRect)a3 identifier:(id)a4 options:(unint64_t)a5 asyncRenderQueue:(id)a6;
- (CLKUIQuadViewDelegate)delegate;
- (NSArray)quads;
- (NSString)debugIdentifier;
- (id)snapshotInRect:(CGRect)a3 scale:(double)a4 time:(double)a5;
- (int64_t)preferredFramesPerSecond;
- (unint64_t)frameNum;
- (void)_async_prepareAndRenderForTime:(double)a3 inGroup:(id)a4 checkForDrawable:(BOOL)a5 renderDiscontinuity:(BOOL)a6 completion:(id)a7;
- (void)_prepareAndRenderForTime:(double)a3 inGroup:(id)a4 checkForDrawable:(BOOL)a5 renderDiscontinuity:(BOOL)a6 completion:(id)a7;
- (void)_prerenderForTime:(double)a3;
- (void)_runOnRenderQueueIfNeeded:(id)a3;
- (void)addDisabledRenderingReason:(id)a3;
- (void)addQuad:(id)a3;
- (void)addQuadsFromArray:(id)a3;
- (void)dealloc;
- (void)didMoveToWindow;
- (void)enumerateHierarchyObserversFromView:(id)a3 withBlock:(id)a4;
- (void)removeAllQuads;
- (void)removeDisabledRenderingReason:(id)a3;
- (void)removeQuad:(id)a3;
- (void)setDebugIdentifier:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setPaused:(BOOL)a3;
- (void)setPreferredFramesPerSecond:(int64_t)a3;
- (void)setSingleBufferMode:(BOOL)a3;
- (void)willMoveToWindow:(id)a3;
@end

@implementation CLKUIQuadView

+ (id)quadViewWithFrame:(CGRect)a3 identifier:(id)a4 options:(unint64_t)a5 colorSpace:(int64_t)a6
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v12 = a4;
  v13 = -[CLKUIMetalQuadView initWithFrame:identifier:options:colorSpace:]([CLKUIMetalQuadView alloc], "initWithFrame:identifier:options:colorSpace:", v12, a5, a6, x, y, width, height);

  return v13;
}

+ (id)quadViewWithFrame:(CGRect)a3 identifier:(id)a4 options:(unint64_t)a5
{
  return (id)objc_msgSend(a1, "quadViewWithFrame:identifier:options:colorSpace:", a4, a5, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

+ (id)quadViewWithFrame:(CGRect)a3 identifier:(id)a4
{
  return (id)objc_msgSend(a1, "quadViewWithFrame:identifier:options:colorSpace:", a4, 0, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)_runOnRenderQueueIfNeeded:(id)a3
{
  asyncRenderQueue = self->_asyncRenderQueue;
  if (asyncRenderQueue)
  {
    id v5 = a3;
    dispatch_assert_queue_not_V2(asyncRenderQueue);
    dispatch_sync((dispatch_queue_t)self->_asyncRenderQueue, v5);
  }
  else
  {
    (*((void (**)(id))a3 + 2))(a3);
  }
}

- (BOOL)renderSynchronouslyWithImageQueueDiscard:(BOOL)a3 inGroup:(id)a4
{
  return [(CLKUIQuadView *)self renderSynchronouslyWithImageQueueDiscard:a3 inGroup:a4 completion:0];
}

- (BOOL)renderSynchronouslyWithImageQueueDiscard:(BOOL)a3 inGroup:(id)a4 completion:(id)a5
{
  BOOL v6 = a3;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  v9 = (void (**)(void))a5;
  [(NSCountedSet *)self->_disabledRenderingReasons count];
  kdebug_trace();
  if ([(NSCountedSet *)self->_disabledRenderingReasons count])
  {
    v10 = CLKLoggingObjectForDomain();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      debugIdentifier = self->_debugIdentifier;
      disabledRenderingReasons = self->_disabledRenderingReasons;
      *(_DWORD *)buf = 138412546;
      *(void *)&buf[4] = debugIdentifier;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = disabledRenderingReasons;
      _os_log_impl(&dword_1D3174000, v10, OS_LOG_TYPE_DEFAULT, "CLKUIQuadView (%@): Rendering disabled for reasons: %@", buf, 0x16u);
    }

    if (v9) {
      v9[2](v9);
    }
    BOOL v13 = 0;
  }
  else
  {
    if (v6) {
      [(CLKUIQuadView *)self discardContents];
    }
    double v14 = CACurrentMediaTime();
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    char v24 = 0;
    asyncRenderQueue = self->_asyncRenderQueue;
    if (asyncRenderQueue)
    {
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __77__CLKUIQuadView_renderSynchronouslyWithImageQueueDiscard_inGroup_completion___block_invoke;
      v17[3] = &unk_1E697BA00;
      v20 = buf;
      v17[4] = self;
      double v21 = v14;
      id v18 = v8;
      BOOL v22 = v6;
      v19 = v9;
      dispatch_sync(asyncRenderQueue, v17);

      BOOL v13 = *(unsigned char *)(*(void *)&buf[8] + 24) != 0;
    }
    else
    {
      BOOL v13 = [(CLKUIQuadView *)self _sync_prepareAndRenderForTime:v8 inGroup:!v6 checkForDrawable:1 renderDiscontinuity:v9 completion:v14];
      *(unsigned char *)(*(void *)&buf[8] + 24) = v13;
    }
    _Block_object_dispose(buf, 8);
  }

  return v13;
}

uint64_t __77__CLKUIQuadView_renderSynchronouslyWithImageQueueDiscard_inGroup_completion___block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "_sync_prepareAndRenderForTime:inGroup:checkForDrawable:renderDiscontinuity:completion:", *(void *)(a1 + 40), *(unsigned char *)(a1 + 72) == 0, 1, *(void *)(a1 + 48), *(double *)(a1 + 64));
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = result;
  return result;
}

- (CLKUIQuadView)initWithFrame:(CGRect)a3 identifier:(id)a4 options:(unint64_t)a5 asyncRenderQueue:(id)a6
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v14 = a4;
  id v15 = a6;
  v26.receiver = self;
  v26.super_class = (Class)CLKUIQuadView;
  v16 = -[CLKUIQuadView initWithFrame:](&v26, sel_initWithFrame_, x, y, width, height);
  if (v16)
  {
    dispatch_semaphore_t v17 = dispatch_semaphore_create(3);
    asyncSemaphore = v16->_asyncSemaphore;
    v16->_asyncSemaphore = (OS_dispatch_semaphore *)v17;

    v19 = [[CLKUIQuadViewRenderCoordinator alloc] initWithQuadView:v16 synchronizeWithClockTimer:(a5 >> 2) & 1];
    renderCoordinator = v16->_renderCoordinator;
    v16->_renderCoordinator = v19;

    uint64_t v21 = [MEMORY[0x1E4F1CA48] array];
    mutableQuads = v16->_mutableQuads;
    v16->_mutableQuads = (NSMutableArray *)v21;

    uint64_t v23 = objc_opt_new();
    disabledRenderingReasons = v16->_disabledRenderingReasons;
    v16->_disabledRenderingReasons = (NSCountedSet *)v23;

    objc_storeStrong((id *)&v16->_asyncRenderQueue, a6);
    objc_storeStrong((id *)&v16->_debugIdentifier, a4);
  }

  return v16;
}

- (void)dealloc
{
  [(CLKUIQuadViewRenderCoordinator *)self->_renderCoordinator invalidate];
  renderCoordinator = self->_renderCoordinator;
  self->_renderCoordinator = 0;

  [(CLKUIQuadView *)self removeAllQuads];
  v4.receiver = self;
  v4.super_class = (Class)CLKUIQuadView;
  [(CLKUIQuadView *)&v4 dealloc];
}

- (void)addDisabledRenderingReason:(id)a3
{
}

- (void)removeDisabledRenderingReason:(id)a3
{
}

- (void)_prepareAndRenderForTime:(double)a3 inGroup:(id)a4 checkForDrawable:(BOOL)a5 renderDiscontinuity:(BOOL)a6 completion:(id)a7
{
  if (self->_asyncRenderQueue) {
    [(CLKUIQuadView *)self _async_prepareAndRenderForTime:a4 inGroup:a5 checkForDrawable:a6 renderDiscontinuity:a7 completion:a3];
  }
  else {
    [(CLKUIQuadView *)self _sync_prepareAndRenderForTime:a4 inGroup:a5 checkForDrawable:a6 renderDiscontinuity:a7 completion:a3];
  }
}

- (void)_async_prepareAndRenderForTime:(double)a3 inGroup:(id)a4 checkForDrawable:(BOOL)a5 renderDiscontinuity:(BOOL)a6 completion:(id)a7
{
  id v12 = a4;
  id v13 = a7;
  if (dispatch_semaphore_wait((dispatch_semaphore_t)self->_asyncSemaphore, 0))
  {
    asyncRenderQueue = self->_asyncRenderQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __104__CLKUIQuadView__async_prepareAndRenderForTime_inGroup_checkForDrawable_renderDiscontinuity_completion___block_invoke_2;
    block[3] = &unk_1E697BA50;
    block[4] = self;
    id v20 = v13;
    id v15 = v13;
    dispatch_async(asyncRenderQueue, block);
    v16 = v20;
  }
  else
  {
    dispatch_semaphore_t v17 = self->_asyncRenderQueue;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __104__CLKUIQuadView__async_prepareAndRenderForTime_inGroup_checkForDrawable_renderDiscontinuity_completion___block_invoke;
    v21[3] = &unk_1E697BA28;
    v21[4] = self;
    double v24 = a3;
    BOOL v25 = a5;
    BOOL v26 = a6;
    id v22 = v12;
    id v23 = v13;
    id v18 = v13;
    dispatch_async(v17, v21);

    v16 = v22;
  }
}

intptr_t __104__CLKUIQuadView__async_prepareAndRenderForTime_inGroup_checkForDrawable_renderDiscontinuity_completion___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_sync_prepareAndRenderForTime:inGroup:checkForDrawable:renderDiscontinuity:completion:", *(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 64), *(unsigned __int8 *)(a1 + 65), *(void *)(a1 + 48), *(double *)(a1 + 56));
  v2 = *(NSObject **)(*(void *)(a1 + 32) + 464);
  return dispatch_semaphore_signal(v2);
}

intptr_t __104__CLKUIQuadView__async_prepareAndRenderForTime_inGroup_checkForDrawable_renderDiscontinuity_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  v3 = *(NSObject **)(*(void *)(a1 + 32) + 464);
  return dispatch_semaphore_signal(v3);
}

- (BOOL)_sync_prepareAndRenderForTime:(double)a3 inGroup:(id)a4 checkForDrawable:(BOOL)a5 renderDiscontinuity:(BOOL)a6 completion:(id)a7
{
  BOOL v8 = a6;
  BOOL v9 = a5;
  id v12 = a4;
  id v13 = a7;
  asyncRenderQueue = self->_asyncRenderQueue;
  if (asyncRenderQueue) {
    dispatch_assert_queue_V2(asyncRenderQueue);
  }
  unint64_t frameNum = self->_frameNum;
  if (v12) {
    dispatch_group_enter(v12);
  }
  unsigned int debugId = self->_debugId;
  kdebug_trace();
  [(CLKUIQuadView *)self _prerenderForTime:a3];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __103__CLKUIQuadView__sync_prepareAndRenderForTime_inGroup_checkForDrawable_renderDiscontinuity_completion___block_invoke;
  v21[3] = &unk_1E697BA78;
  id v22 = v12;
  id v23 = v13;
  unint64_t v24 = frameNum;
  unsigned int v25 = debugId;
  dispatch_semaphore_t v17 = v12;
  id v18 = v13;
  BOOL v19 = [(CLKUIQuadView *)self _displayAndCheckForDrawable:v9 renderDiscontinuity:v8 withCompletion:v21];
  kdebug_trace();
  ++self->_frameNum;

  return v19;
}

uint64_t __103__CLKUIQuadView__sync_prepareAndRenderForTime_inGroup_checkForDrawable_renderDiscontinuity_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  v3 = *(NSObject **)(a1 + 32);
  if (v3) {
    dispatch_group_leave(v3);
  }
  return kdebug_trace();
}

- (void)enumerateHierarchyObserversFromView:(id)a3 withBlock:(id)a4
{
  id v5 = a3;
  BOOL v6 = (void (**)(id, void *))a4;
  id v9 = v5;
  v7 = v9;
  do
  {
    if (objc_opt_respondsToSelector()) {
      v6[2](v6, v7);
    }
    uint64_t v8 = [v7 superview];

    v7 = (void *)v8;
  }
  while (v8);
}

- (void)willMoveToWindow:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CLKUIQuadView;
  [(CLKUIQuadView *)&v7 willMoveToWindow:a3];
  objc_super v4 = [(CLKUIQuadView *)self superview];

  if (v4)
  {
    id v5 = [(CLKUIQuadView *)self superview];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __34__CLKUIQuadView_willMoveToWindow___block_invoke;
    v6[3] = &unk_1E697BAA0;
    v6[4] = self;
    [(CLKUIQuadView *)self enumerateHierarchyObserversFromView:v5 withBlock:v6];
  }
}

uint64_t __34__CLKUIQuadView_willMoveToWindow___block_invoke(uint64_t a1, void *a2)
{
  return [a2 quadViewWillLeaveSubtree:*(void *)(a1 + 32)];
}

- (void)didMoveToWindow
{
  v6.receiver = self;
  v6.super_class = (Class)CLKUIQuadView;
  [(CLKUIQuadView *)&v6 didMoveToWindow];
  v3 = [(CLKUIQuadView *)self superview];

  if (v3)
  {
    objc_super v4 = [(CLKUIQuadView *)self superview];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __32__CLKUIQuadView_didMoveToWindow__block_invoke;
    v5[3] = &unk_1E697BAA0;
    v5[4] = self;
    [(CLKUIQuadView *)self enumerateHierarchyObserversFromView:v4 withBlock:v5];
  }
}

uint64_t __32__CLKUIQuadView_didMoveToWindow__block_invoke(uint64_t a1, void *a2)
{
  return [a2 quadViewWillEnterSubtree:*(void *)(a1 + 32)];
}

- (void)setPreferredFramesPerSecond:(int64_t)a3
{
}

- (int64_t)preferredFramesPerSecond
{
  return [(CLKUIQuadViewRenderCoordinator *)self->_renderCoordinator preferredFramesPerSecond];
}

- (void)setPaused:(BOOL)a3
{
}

- (BOOL)isPaused
{
  return [(CLKUIQuadViewRenderCoordinator *)self->_renderCoordinator isPaused];
}

- (unint64_t)frameNum
{
  return self->_frameNum;
}

- (CGSize)drawableSize
{
  double v2 = *MEMORY[0x1E4F1DB30];
  double v3 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  result.double height = v3;
  result.double width = v2;
  return result;
}

- (NSArray)quads
{
  return (NSArray *)self->_mutableQuads;
}

- (void)addQuad:(id)a3
{
  id v4 = a3;
  [v4 setQuadView:self];
  [v4 setupForQuadView:self];
  [(NSMutableArray *)self->_mutableQuads addObject:v4];

  mutableQuads = self->_mutableQuads;
  [(CLKUIQuadView *)self _handleQuadArrayChange:mutableQuads];
}

- (void)addQuadsFromArray:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        [v9 setQuadView:self];
        [v9 setupForQuadView:self];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
  [(NSMutableArray *)self->_mutableQuads addObjectsFromArray:v4];
  [(CLKUIQuadView *)self _handleQuadArrayChange:self->_mutableQuads];
}

- (void)removeQuad:(id)a3
{
  id v4 = a3;
  [v4 purge];
  [v4 setQuadView:0];
  [(NSMutableArray *)self->_mutableQuads removeObject:v4];

  mutableQuads = self->_mutableQuads;
  [(CLKUIQuadView *)self _handleQuadArrayChange:mutableQuads];
}

- (void)removeAllQuads
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  double v3 = self->_mutableQuads;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        objc_msgSend(v8, "purge", (void)v9);
        [v8 setQuadView:0];
      }
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  [(NSMutableArray *)self->_mutableQuads removeAllObjects];
  [(CLKUIQuadView *)self _handleQuadArrayChange:self->_mutableQuads];
}

- (void)_prerenderForTime:(double)a3
{
  if (*(unsigned char *)&self->_delegateRespondsTo)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained quadViewWillDisplay:self forTime:a3];
  }
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    id v5 = objc_storeWeak((id *)&self->_delegate, obj);
    *(unsigned char *)&self->_delegateRespondsTo = *(unsigned char *)&self->_delegateRespondsTo & 0xFE | objc_opt_respondsToSelector() & 1;
  }
}

- (id)snapshotInRect:(CGRect)a3 scale:(double)a4 time:(double)a5
{
  return 0;
}

- (void)setDebugIdentifier:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [v4 length];
  if (v5 >= 4) {
    uint64_t v6 = 4;
  }
  else {
    uint64_t v6 = v5;
  }
  if (v6)
  {
    int v7 = 0;
    uint64_t v8 = 0;
    unsigned int v9 = 0;
    do
    {
      v9 |= [v4 characterAtIndex:v8++] << v7;
      v7 += 8;
    }
    while (v6 != v8);
  }
  else
  {
    unsigned int v9 = 0;
  }
  self->_unsigned int debugId = v9;
  debugIdentifier = self->_debugIdentifier;
  self->_debugIdentifier = (NSString *)v4;
}

- (BOOL)_displayAndCheckForDrawable:(BOOL)a3 renderDiscontinuity:(BOOL)a4 withCompletion:(id)a5
{
  return 1;
}

- (CLKUIQuadViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CLKUIQuadViewDelegate *)WeakRetained;
}

- (BOOL)singleBufferMode
{
  return self->_singleBufferMode;
}

- (void)setSingleBufferMode:(BOOL)a3
{
  self->_singleBufferMode = a3;
}

- (NSString)debugIdentifier
{
  return self->_debugIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugIdentifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_asyncSemaphore, 0);
  objc_storeStrong((id *)&self->_asyncRenderQueue, 0);
  objc_storeStrong((id *)&self->_disabledRenderingReasons, 0);
  objc_storeStrong((id *)&self->_renderCoordinator, 0);
  objc_storeStrong((id *)&self->_mutableQuads, 0);
}

@end