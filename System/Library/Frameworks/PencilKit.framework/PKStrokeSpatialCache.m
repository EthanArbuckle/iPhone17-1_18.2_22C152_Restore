@interface PKStrokeSpatialCache
- (PKStrokeSpatialCache)init;
- (void)_cancelGenerateVisibleStrokesBlockIfNecessary;
- (void)_generateStrokesOnCanvasForVisibleFrame:(double)a3 inDrawing:(double)a4;
- (void)_invalidateCacheForBounds:(int)a3 inDrawing:(CGFloat)a4 force:(CGFloat)a5;
- (void)dealloc;
@end

@implementation PKStrokeSpatialCache

- (PKStrokeSpatialCache)init
{
  v8.receiver = self;
  v8.super_class = (Class)PKStrokeSpatialCache;
  v2 = [(PKStrokeSpatialCache *)&v8 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_UTILITY, 0);

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.pencilkit.onscreen-visible-strokes", v4);
    onscreenVisibleStrokesQueue = v2->_onscreenVisibleStrokesQueue;
    v2->_onscreenVisibleStrokesQueue = (OS_dispatch_queue *)v5;
  }
  return v2;
}

- (void)dealloc
{
  if (self)
  {
    id generateOnscreenVisibleStrokesBlock = self->_generateOnscreenVisibleStrokesBlock;
    if (generateOnscreenVisibleStrokesBlock)
    {
      dispatch_block_cancel(generateOnscreenVisibleStrokesBlock);
      objc_setProperty_nonatomic_copy(self, v4, 0, 32);
    }
  }
  v5.receiver = self;
  v5.super_class = (Class)PKStrokeSpatialCache;
  [(PKStrokeSpatialCache *)&v5 dealloc];
}

- (void)_invalidateCacheForBounds:(int)a3 inDrawing:(CGFloat)a4 force:(CGFloat)a5
{
  id v16 = a2;
  if (a1)
  {
    v18.origin.x = a4;
    v18.origin.y = a5;
    v18.size.width = a6;
    v18.size.height = a7;
    BOOL v13 = !CGRectIsNull(v18);
    v19.origin.x = a4;
    v19.origin.y = a5;
    v19.size.width = a6;
    v19.size.height = a7;
    if (CGRectEqualToRect(v19, *(CGRect *)(a1 + 64))) {
      int v14 = [v16 isEqual:*(void *)(a1 + 56)] ^ 1;
    }
    else {
      int v14 = 1;
    }
    v20.origin.x = a4;
    v20.origin.y = a5;
    v20.size.width = a6;
    v20.size.height = a7;
    if (CGRectIsNull(v20))
    {
      -[PKStrokeSpatialCache _cancelGenerateVisibleStrokesBlockIfNecessary]((void *)a1);
      *(unsigned char *)(a1 + 8) = 1;
      v15 = *(void **)(a1 + 24);
      *(void *)(a1 + 24) = MEMORY[0x1E4F1CBF0];
    }
    else if ((v13 & (v14 | a3)) == 1)
    {
      -[PKStrokeSpatialCache _generateStrokesOnCanvasForVisibleFrame:inDrawing:](a1, v16, a4, a5, a6, a7);
    }
  }
}

- (void)_cancelGenerateVisibleStrokesBlockIfNecessary
{
  if (a1)
  {
    v2 = (void *)a1[4];
    if (v2)
    {
      ++a1[6];
      dispatch_block_cancel(v2);
      objc_setProperty_nonatomic_copy(a1, v3, 0, 32);
    }
  }
}

- (void)_generateStrokesOnCanvasForVisibleFrame:(double)a3 inDrawing:(double)a4
{
  id v12 = a2;
  if (a1)
  {
    -[PKStrokeSpatialCache _cancelGenerateVisibleStrokesBlockIfNecessary]((void *)a1);
    objc_storeStrong((id *)(a1 + 56), a2);
    *(double *)(a1 + 64) = a3;
    *(double *)(a1 + 72) = a4;
    *(double *)(a1 + 80) = a5;
    *(double *)(a1 + 88) = a6;
    BOOL v13 = (void *)[v12 copy];
    objc_initWeak(&location, (id)a1);
    int v14 = (void *)(*(void *)(a1 + 48) + 1);
    *(void *)(a1 + 48) = v14;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __74__PKStrokeSpatialCache__generateStrokesOnCanvasForVisibleFrame_inDrawing___block_invoke;
    block[3] = &unk_1E64C9320;
    block[4] = a1;
    v20[1] = *(id *)&a3;
    v20[2] = *(id *)&a4;
    v20[3] = *(id *)&a5;
    v20[4] = *(id *)&a6;
    id v15 = v13;
    id v19 = v15;
    objc_copyWeak(v20, &location);
    v20[5] = v14;
    dispatch_block_t v16 = dispatch_block_create((dispatch_block_flags_t)0, block);
    objc_setProperty_nonatomic_copy((id)a1, v17, v16, 32);

    *(unsigned char *)(a1 + 8) = 0;
    dispatch_async(*(dispatch_queue_t *)(a1 + 40), *(dispatch_block_t *)(a1 + 32));
    objc_destroyWeak(v20);

    objc_destroyWeak(&location);
  }
}

void __74__PKStrokeSpatialCache__generateStrokesOnCanvasForVisibleFrame_inDrawing___block_invoke(uint64_t a1)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a1 + 40;
  v2 = *(void **)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 32);
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v26 = __74__PKStrokeSpatialCache__generateStrokesOnCanvasForVisibleFrame_inDrawing___block_invoke_2;
  v27 = &unk_1E64C92F8;
  objc_copyWeak(v29, (id *)(a1 + 48));
  v29[1] = *(id *)(a1 + 88);
  id v28 = *(id *)v3;
  CGFloat v5 = *(double *)(v3 + 16);
  CGFloat v6 = *(double *)(a1 + 64);
  CGFloat v7 = *(double *)(a1 + 72);
  CGFloat v8 = *(double *)(a1 + 80);
  id v9 = v2;
  v10 = v25;
  if (v4)
  {
    v11 = [MEMORY[0x1E4F1CA48] array];
    [v9 _eraserStrokeBounds];
    CGFloat v13 = v12;
    CGFloat v15 = v14;
    CGFloat v17 = v16;
    CGFloat v19 = v18;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    CGRect v20 = [v9 strokes];
    uint64_t v21 = [v20 countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v21)
    {
      uint64_t v22 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v31 != v22) {
            objc_enumerationMutation(v20);
          }
          v24 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          [v24 _bounds];
          v38.origin.x = v5;
          v38.origin.y = v6;
          v38.size.width = v7;
          v38.size.height = v8;
          if (CGRectIntersectsRect(v36, v38))
          {
            [v24 _bounds];
            v39.origin.x = v13;
            v39.origin.y = v15;
            v39.size.width = v17;
            v39.size.height = v19;
            if (!CGRectIntersectsRect(v37, v39)) {
              [v11 addObject:v24];
            }
          }
        }
        uint64_t v21 = [v20 countByEnumeratingWithState:&v30 objects:v34 count:16];
      }
      while (v21);
    }

    v26(v10, v11);
  }

  objc_destroyWeak(v29);
}

void __74__PKStrokeSpatialCache__generateStrokesOnCanvasForVisibleFrame_inDrawing___block_invoke_2(id *a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __74__PKStrokeSpatialCache__generateStrokesOnCanvasForVisibleFrame_inDrawing___block_invoke_3;
  v5[3] = &unk_1E64C92D0;
  objc_copyWeak(v8, a1 + 5);
  v8[1] = a1[6];
  id v6 = v3;
  id v7 = a1[4];
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);

  objc_destroyWeak(v8);
}

void __74__PKStrokeSpatialCache__generateStrokesOnCanvasForVisibleFrame_inDrawing___block_invoke_3(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = WeakRetained;
  if (WeakRetained && *(void *)(a1 + 56) == WeakRetained[6])
  {
    id v4 = os_log_create("com.apple.pencilkit", "Selection");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v9 = [*(id *)(a1 + 32) count];
      v10 = [*(id *)(a1 + 40) strokes];
      int v11 = 134218240;
      uint64_t v12 = v9;
      __int16 v13 = 2048;
      uint64_t v14 = [v10 count];
      _os_log_debug_impl(&dword_1C44F8000, v4, OS_LOG_TYPE_DEBUG, "Found %lu visible onscreen strokes with a drawing of %lu visible strokes", (uint8_t *)&v11, 0x16u);
    }
    *((unsigned char *)v3 + 8) = 1;
    objc_storeStrong((id *)v3 + 3, *(id *)(a1 + 32));
    id v5 = objc_loadWeakRetained((id *)v3 + 2);

    if (v5)
    {
      id v7 = objc_loadWeakRetained((id *)v3 + 2);
      [v7 didFinishCalculatingVisibleOnscreenStrokes:*(void *)(a1 + 32) drawing:*(void *)(a1 + 40)];
    }
    objc_setProperty_nonatomic_copy(v3, v6, 0, 32);
  }
  else
  {
    CGFloat v8 = os_log_create("com.apple.pencilkit", "Selection");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v11) = 0;
      _os_log_debug_impl(&dword_1C44F8000, v8, OS_LOG_TYPE_DEBUG, "Did not used cached strokes since another block started running while another one was being processed", (uint8_t *)&v11, 2u);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedDrawing, 0);
  objc_storeStrong((id *)&self->_onscreenVisibleStrokesQueue, 0);
  objc_storeStrong(&self->_generateOnscreenVisibleStrokesBlock, 0);
  objc_storeStrong((id *)&self->_onscreenVisibleStrokes, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end