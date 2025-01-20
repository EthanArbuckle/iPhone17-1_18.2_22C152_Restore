@interface PKController
- (PKController)init;
- (id)initWithPixelSize:(uint64_t)a3 actualSize:(void *)a4 singleComponent:(double)a5 sixChannelBlendingMode:(double)a6 metalConfig:(double)a7;
- (id)renderedStrokes;
- (id)teardown;
- (void)_addNewStrokes:(int)a3 wasAddedEarly:(int)a4 hidden:(void *)a5 preDrawingChangedBlock:;
- (void)_didUpdateMutableRenderedStrokes;
- (void)_setDrawing:(void *)a3 imageTexture:;
- (void)addLiveStrokeEarly:(void *)a3 completionBlock:;
- (void)addNewRenderedStrokes:(int)a3 wasAddedEarly:(int)a4 hidden:(void *)a5 preDrawingChangedBlock:;
- (void)cancelLiveStroke;
- (void)didStartLiveInteraction;
- (void)hideStrokesWithoutUpdating:(void *)a3 completion:;
- (void)inputController;
- (void)performAsyncInteractBlock:(uint64_t)a1;
- (void)setDrawing:(void *)a3 imageTexture:(void *)a4 completion:;
- (void)setDrawing:(void *)a3 tiles:(long long *)a4 tileTransform:(void *)a5 contentImageTexture:(long long *)a6 contentImageTextureTransform:(void *)a7 completionBlock:;
- (void)setLiveInteractionDrawing:(uint64_t)a1;
- (void)updateDrawingWithErasedStrokes:(uint64_t)a1;
@end

@implementation PKController

- (PKController)init
{
}

- (id)initWithPixelSize:(uint64_t)a3 actualSize:(void *)a4 singleComponent:(double)a5 sixChannelBlendingMode:(double)a6 metalConfig:(double)a7
{
  id v16 = a4;
  if (a1 && +[PKMetalUtility isMetalAvailable])
  {
    v42.receiver = a1;
    v42.super_class = (Class)PKController;
    id v17 = objc_msgSendSuper2(&v42, sel_init);
    if (v17)
    {
      v18 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v19 = dispatch_queue_attr_make_with_qos_class(v18, QOS_CLASS_USER_INTERACTIVE, 0);

      objc_storeStrong((id *)v17 + 3, a4);
      dispatch_queue_t v20 = dispatch_queue_create("com.apple.pencilkit.draw-interact", v19);
      v21 = (void *)*((void *)v17 + 11);
      *((void *)v17 + 11) = v20;

      dispatch_queue_t v22 = dispatch_queue_create("com.apple.pencilkit.draw", v19);
      v23 = (void *)*((void *)v17 + 12);
      *((void *)v17 + 12) = v22;

      uint64_t v24 = [MEMORY[0x1E4F1CA48] array];
      v25 = (void *)*((void *)v17 + 5);
      *((void *)v17 + 5) = v24;

      v26 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v27 = dispatch_queue_attr_make_with_qos_class(v26, QOS_CLASS_UTILITY, 0);

      dispatch_queue_t v28 = dispatch_queue_create("com.apple.pencilkit.draw-background", v27);
      v29 = (void *)*((void *)v17 + 13);
      *((void *)v17 + 13) = v28;

      dispatch_semaphore_t v30 = dispatch_semaphore_create(0);
      v31 = (void *)*((void *)v17 + 10);
      *((void *)v17 + 10) = v30;

      *((unsigned char *)v17 + 49) = 0;
      objc_storeStrong((id *)v17 + 3, a4);
      v32 = [PKMetalRendererController alloc];
      if (a2) {
        uint64_t v33 = 10;
      }
      else {
        uint64_t v33 = 80;
      }
      v34 = -[PKMetalRendererController initWithPixelSize:actualSize:pixelFormat:sixChannelBlendingMode:metalConfig:](v32, v33, a3, v16, a5, a6, a7, a8);
      v35 = (void *)*((void *)v17 + 8);
      *((void *)v17 + 8) = v34;

      id v36 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v37 = (void *)*((void *)v17 + 2);
      *((void *)v17 + 2) = v36;

      v38 = objc_alloc_init(PKDrawing);
      v39 = (void *)*((void *)v17 + 9);
      *((void *)v17 + 9) = v38;

      -[PKMetalRendererController setup](*((void *)v17 + 8));
      -[PKController _didUpdateMutableRenderedStrokes](v17);
    }
    a1 = v17;
    id v40 = a1;
  }
  else
  {
    id v40 = 0;
  }

  return v40;
}

- (void)_didUpdateMutableRenderedStrokes
{
  if (a1)
  {
    obj = a1;
    objc_sync_enter(obj);
    uint64_t v1 = [obj[2] copy];
    id v2 = obj[1];
    obj[1] = (id)v1;

    objc_sync_exit(obj);
  }
}

- (id)teardown
{
  if (result)
  {
    uint64_t v1 = result;
    -[PKMetalRendererController cancelAllRendering]((uint64_t)result[8]);
    -[PKMetalRendererController teardown]((uint64_t)v1[8]);
    return (id *)objc_storeWeak(v1 + 7, 0);
  }
  return result;
}

- (id)renderedStrokes
{
  if (a1)
  {
    uint64_t v1 = a1;
    objc_sync_enter(v1);
    id v2 = (void *)[v1[1] copy];
    objc_sync_exit(v1);
  }
  else
  {
    id v2 = 0;
  }

  return v2;
}

- (void)inputController
{
  if (a1)
  {
    id v2 = (void *)a1[8];
    if (v2) {
      id v2 = (void *)v2[68];
    }
    a1 = v2;
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)didStartLiveInteraction
{
  if (a1)
  {
    uint64_t v1 = *(NSObject **)(a1 + 88);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __39__PKController_didStartLiveInteraction__block_invoke;
    block[3] = &unk_1E64C5368;
    block[4] = a1;
    dispatch_async(v1, block);
  }
}

intptr_t __39__PKController_didStartLiveInteraction__block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 48) = 1;
  intptr_t result = dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 80), 0xFFFFFFFFFFFFFFFFLL);
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    *(unsigned char *)(v3 + 48) = 0;
  }
  return result;
}

- (void)setLiveInteractionDrawing:(uint64_t)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    v5 = (void *)[v3 copy];

    v6 = *(NSObject **)(a1 + 96);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __42__PKController_setLiveInteractionDrawing___block_invoke;
    v7[3] = &unk_1E64C5870;
    v7[4] = a1;
    id v4 = v5;
    id v8 = v4;
    dispatch_async(v6, v7);
  }
}

void __42__PKController_setLiveInteractionDrawing___block_invoke(uint64_t a1)
{
}

- (void)setDrawing:(void *)a3 tiles:(long long *)a4 tileTransform:(void *)a5 contentImageTexture:(long long *)a6 contentImageTextureTransform:(void *)a7 completionBlock:
{
  id v13 = a2;
  id v14 = a3;
  id v15 = a5;
  id v16 = a7;
  if (a1)
  {
    objc_initWeak(location, a1);
    id v17 = (void *)[v13 copy];

    v18 = a1[11];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __112__PKController_setDrawing_tiles_tileTransform_contentImageTexture_contentImageTextureTransform_completionBlock___block_invoke;
    block[3] = &unk_1E64C5640;
    objc_copyWeak(&v26, location);
    id v13 = v17;
    id v22 = v13;
    id v23 = v15;
    long long v19 = a6[1];
    long long v27 = *a6;
    long long v28 = v19;
    long long v29 = a6[2];
    id v24 = v14;
    long long v20 = a4[1];
    long long v30 = *a4;
    long long v31 = v20;
    long long v32 = a4[2];
    id v25 = v16;
    dispatch_async(v18, block);

    objc_destroyWeak(&v26);
    objc_destroyWeak(location);
  }
}

uint64_t __112__PKController_setDrawing_tiles_tileTransform_contentImageTexture_contentImageTextureTransform_completionBlock___block_invoke(uint64_t a1)
{
  id v2 = (id *)(a1 + 64);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  -[PKController _setDrawing:imageTexture:]((uint64_t)WeakRetained, *(void **)(a1 + 32), 0);

  id v4 = objc_loadWeakRetained(v2);
  v5 = v4;
  if (v4) {
    id v4 = (id)*((void *)v4 + 8);
  }
  long long v6 = *(_OWORD *)(a1 + 88);
  v13[0] = *(_OWORD *)(a1 + 72);
  v13[1] = v6;
  v13[2] = *(_OWORD *)(a1 + 104);
  v7 = *(void **)(a1 + 40);
  id v8 = *(void **)(a1 + 48);
  long long v9 = *(_OWORD *)(a1 + 136);
  v12[0] = *(_OWORD *)(a1 + 120);
  v12[1] = v9;
  v12[2] = *(_OWORD *)(a1 + 152);
  -[PKMetalRendererController renderImageTexture:imageTextureTransform:withTiles:tileTransform:]((uint64_t)v4, v7, v13, v8, v12);

  v10 = *(uint64_t (**)(void))(*(void *)(a1 + 56) + 16);

  return v10();
}

- (void)_setDrawing:(void *)a3 imageTexture:
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    v7 = os_log_create("com.apple.pencilkit", "Sketching");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      id v12 = v5;
      _os_log_debug_impl(&dword_1C44F8000, v7, OS_LOG_TYPE_DEBUG, "Set async drawing %p", buf, 0xCu);
    }

    id v8 = *(NSObject **)(a1 + 96);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __41__PKController__setDrawing_imageTexture___block_invoke;
    v9[3] = &unk_1E64C5870;
    v9[4] = a1;
    id v10 = v5;
    dispatch_sync(v8, v9);
    if (v6) {
      -[PKMetalRendererController drawTexture:](*(void *)(a1 + 64), v6);
    }
  }
}

- (void)setDrawing:(void *)a3 imageTexture:(void *)a4 completion:
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (a1)
  {
    id v10 = os_log_create("com.apple.pencilkit", "Sketching");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      id v18 = v7;
      _os_log_debug_impl(&dword_1C44F8000, v10, OS_LOG_TYPE_DEBUG, "Set drawing %p", buf, 0xCu);
    }

    v11 = (void *)[v7 copy];
    id v12 = *(NSObject **)(a1 + 88);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __51__PKController_setDrawing_imageTexture_completion___block_invoke;
    long long v13[3] = &unk_1E64C57D0;
    v13[4] = a1;
    id v7 = v11;
    id v14 = v7;
    id v15 = v8;
    id v16 = v9;
    dispatch_async(v12, v13);
  }
}

uint64_t __51__PKController_setDrawing_imageTexture_completion___block_invoke(uint64_t a1)
{
  -[PKController _setDrawing:imageTexture:](*(void *)(a1 + 32), *(void **)(a1 + 40), *(void **)(a1 + 48));
  uint64_t result = *(void *)(a1 + 56);
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

void __41__PKController__setDrawing_imageTexture___block_invoke(uint64_t a1)
{
  id v7 = [*(id *)(*(void *)(a1 + 32) + 72) uuid];
  id v2 = [*(id *)(a1 + 40) uuid];
  int v3 = [v7 isEqual:v2];

  if (v3) {
    [*(id *)(*(void *)(a1 + 32) + 72) mergeWithDrawing:*(void *)(a1 + 40)];
  }
  else {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 72), *(id *)(a1 + 40));
  }
  id v8 = [*(id *)(*(void *)(a1 + 32) + 72) strokes];
  uint64_t v4 = [v8 mutableCopy];
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v4;
}

- (void)performAsyncInteractBlock:(uint64_t)a1
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (a1)
  {
    uint64_t v5 = *(NSObject **)(a1 + 88);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __42__PKController_performAsyncInteractBlock___block_invoke;
    v6[3] = &unk_1E64C53B8;
    v6[4] = a1;
    id v7 = v3;
    dispatch_async(v5, v6);
  }
}

intptr_t __42__PKController_performAsyncInteractBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v4 = MEMORY[0x1E4F143A8];
  uint64_t v5 = 3221225472;
  id v6 = __42__PKController_performAsyncInteractBlock___block_invoke_2;
  id v7 = &unk_1E64C5368;
  uint64_t v8 = *(void *)(a1 + 32);
  (*(void (**)(void))(v2 + 16))();
  return dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 80), 0xFFFFFFFFFFFFFFFFLL);
}

intptr_t __42__PKController_performAsyncInteractBlock___block_invoke_2(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 80));
}

- (void)hideStrokesWithoutUpdating:(void *)a3 completion:
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __54__PKController_hideStrokesWithoutUpdating_completion___block_invoke;
    v7[3] = &unk_1E64C5668;
    v7[4] = a1;
    id v8 = v5;
    id v9 = v6;
    -[PKController performAsyncInteractBlock:](a1, v7);
  }
}

void __54__PKController_hideStrokesWithoutUpdating_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(NSObject **)(v4 + 96);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __54__PKController_hideStrokesWithoutUpdating_completion___block_invoke_2;
  v11[3] = &unk_1E64C5870;
  v11[4] = v4;
  id v12 = *(id *)(a1 + 40);
  dispatch_sync(v5, v11);
  -[PKController _didUpdateMutableRenderedStrokes](*(void **)(a1 + 32));
  v3[2](v3);
  uint64_t v10 = *(void *)(a1 + 48);
  if (v10) {
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v10 + 16))(v10, v6, v7, v8, v9);
  }
}

void __54__PKController_hideStrokesWithoutUpdating_completion___block_invoke_2(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 72) setStrokes:*(void *)(a1 + 40) hidden:1];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 56));
  [WeakRetained drawingChanged:*(void *)(*(void *)(a1 + 32) + 72)];

  id v6 = [*(id *)(*(void *)(a1 + 32) + 72) strokes];
  uint64_t v2 = [v6 mutableCopy];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(v3 + 16);
  *(void *)(v3 + 16) = v2;
}

- (void)updateDrawingWithErasedStrokes:(uint64_t)a1
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (a1)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __47__PKController_updateDrawingWithErasedStrokes___block_invoke;
    v5[3] = &unk_1E64C5690;
    id v6 = v3;
    uint64_t v7 = a1;
    -[PKController performAsyncInteractBlock:](a1, v5);
  }
}

void __47__PKController_updateDrawingWithErasedStrokes___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v35 = a2;
  double x = *MEMORY[0x1E4F1DB20];
  double y = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  double width = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  double height = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  uint64_t v7 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v8 = *(id *)(a1 + 32);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v45 objects:v50 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v46;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v46 != v10) {
          objc_enumerationMutation(v8);
        }
        id v12 = *(void **)(*((void *)&v45 + 1) + 8 * i);
        uint64_t v13 = [v12 _strokeUUID];
        [v7 addObject:v13];

        [v12 _bounds];
        v55.origin.double x = v14;
        v55.origin.double y = v15;
        v55.size.double width = v16;
        v55.size.double height = v17;
        v52.origin.double x = x;
        v52.origin.double y = y;
        v52.size.double width = width;
        v52.size.double height = height;
        CGRect v53 = CGRectUnion(v52, v55);
        double x = v53.origin.x;
        double y = v53.origin.y;
        double width = v53.size.width;
        double height = v53.size.height;
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v45 objects:v50 count:16];
    }
    while (v9);
  }

  id v18 = (void *)MEMORY[0x1E4F1CA48];
  uint64_t v19 = [*(id *)(*(void *)(a1 + 40) + 72) strokes];
  long long v20 = objc_msgSend(v18, "arrayWithCapacity:", objc_msgSend(v19, "count"));

  long long v44 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v41 = 0u;
  v21 = [*(id *)(*(void *)(a1 + 40) + 72) strokes];
  uint64_t v22 = [v21 countByEnumeratingWithState:&v41 objects:v49 count:16];
  if (v22)
  {
    uint64_t v23 = *(void *)v42;
    do
    {
      for (uint64_t j = 0; j != v22; ++j)
      {
        if (*(void *)v42 != v23) {
          objc_enumerationMutation(v21);
        }
        id v25 = *(void **)(*((void *)&v41 + 1) + 8 * j);
        id v26 = [v25 _strokeUUID];
        char v27 = [v7 containsObject:v26];

        if ((v27 & 1) == 0)
        {
          [v25 _bounds];
          v56.origin.double x = v28;
          v56.origin.double y = v29;
          v56.size.double width = v30;
          v56.size.double height = v31;
          v54.origin.double x = x;
          v54.origin.double y = y;
          v54.size.double width = width;
          v54.size.double height = height;
          if (CGRectIntersectsRect(v54, v56)) {
            [v20 addObject:v25];
          }
        }
      }
      uint64_t v22 = [v21 countByEnumeratingWithState:&v41 objects:v49 count:16];
    }
    while (v22);
  }

  long long v32 = *(_OWORD **)(*(void *)(a1 + 40) + 64);
  if (v32)
  {
    long long v33 = v32[44];
    long long v38 = v32[43];
    long long v39 = v33;
    long long v40 = v32[45];
  }
  else
  {
    long long v39 = 0u;
    long long v40 = 0u;
    long long v38 = 0u;
  }
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __47__PKController_updateDrawingWithErasedStrokes___block_invoke_2;
  v36[3] = &unk_1E64C57F8;
  id v34 = v35;
  id v37 = v34;
  -[PKMetalRendererController drawStrokesAfterClear:clippedToStrokeSpaceRect:strokeTransform:useLayerContext:completion:]((uint64_t)v32, v20, &v38, 1, v36, x, y, width, height);
}

uint64_t __47__PKController_updateDrawingWithErasedStrokes___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)addLiveStrokeEarly:(void *)a3 completionBlock:
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    uint64_t v7 = *(NSObject **)(a1 + 96);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __51__PKController_addLiveStrokeEarly_completionBlock___block_invoke;
    block[3] = &unk_1E64C5820;
    void block[4] = a1;
    id v9 = v5;
    id v10 = v6;
    dispatch_async(v7, block);
  }
}

void __51__PKController_addLiveStrokeEarly_completionBlock___block_invoke(void *a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void **)(a1[4] + 72);
  v5[0] = a1[5];
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];
  uint64_t v4 = [v2 undoableAddNewStrokes:v3];

  if (v4) {
    [*(id *)(a1[4] + 40) addObject:v4];
  }
  (*(void (**)(void))(a1[6] + 16))();
}

- (void)cancelLiveStroke
{
  if (a1)
  {
    uint64_t v1 = *(NSObject **)(a1 + 96);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __32__PKController_cancelLiveStroke__block_invoke;
    block[3] = &unk_1E64C5368;
    void block[4] = a1;
    dispatch_async(v1, block);
  }
}

void __32__PKController_cancelLiveStroke__block_invoke(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 40) count])
  {
    id v3 = [*(id *)(*(void *)(a1 + 32) + 40) firstObject];
    [*(id *)(*(void *)(a1 + 32) + 40) removeObjectAtIndex:0];
    [v3 applyToDrawing:*(void *)(*(void *)(a1 + 32) + 72)];
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 56));
    [WeakRetained drawingChanged:*(void *)(*(void *)(a1 + 32) + 72)];
  }
}

- (void)addNewRenderedStrokes:(int)a3 wasAddedEarly:(int)a4 hidden:(void *)a5 preDrawingChangedBlock:
{
  id v9 = a2;
  id v10 = a5;
  if (a1)
  {
    if (*(unsigned char *)(a1 + 50))
    {
      -[PKController _addNewStrokes:wasAddedEarly:hidden:preDrawingChangedBlock:](a1, v9, a3, a4, v10);
    }
    else
    {
      if (*(unsigned char *)(a1 + 48))
      {
        uint64_t v13 = *(NSObject **)(a1 + 96);
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __82__PKController_addNewRenderedStrokes_wasAddedEarly_hidden_preDrawingChangedBlock___block_invoke;
        block[3] = &unk_1E64C56B8;
        void block[4] = a1;
        v11 = &v20;
        id v20 = v9;
        char v22 = a3;
        char v23 = a4;
        id v12 = &v21;
        id v21 = v10;
        dispatch_sync(v13, block);
      }
      else
      {
        v14[0] = MEMORY[0x1E4F143A8];
        v14[1] = 3221225472;
        v14[2] = __82__PKController_addNewRenderedStrokes_wasAddedEarly_hidden_preDrawingChangedBlock___block_invoke_2;
        v14[3] = &unk_1E64C5758;
        v14[4] = a1;
        v11 = &v15;
        id v15 = v9;
        char v17 = a3;
        char v18 = a4;
        id v12 = &v16;
        id v16 = v10;
        -[PKController performAsyncInteractBlock:](a1, v14);
      }
    }
  }
}

- (void)_addNewStrokes:(int)a3 wasAddedEarly:(int)a4 hidden:(void *)a5 preDrawingChangedBlock:
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v31 = a2;
  id v32 = a5;
  if (a1)
  {
    if (!a3) {
      goto LABEL_7;
    }
    if ([v31 count] == 1)
    {
      id v8 = *(void **)(a1 + 72);
      id v9 = [v31 objectAtIndexedSubscript:0];
      objc_msgSend(v8, "updateStroke:indexHint:", v9, objc_msgSend(*(id *)(a1 + 72), "_rootStrokesCount") - 1);
    }
    if ([*(id *)(a1 + 40) count])
    {
      CGFloat v30 = [*(id *)(a1 + 40) firstObject];
      [*(id *)(a1 + 40) removeObjectAtIndex:0];
    }
    else
    {
LABEL_7:
      CGFloat v30 = 0;
    }
    long long v33 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v31, "count"));
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v10 = v31;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v38 objects:v46 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v39;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v39 != v12) {
            objc_enumerationMutation(v10);
          }
          CGFloat v14 = *(void **)(*((void *)&v38 + 1) + 8 * i);
          id v15 = [v14 _strokeUUID];
          BOOL v16 = v15 == 0;

          if (!v16)
          {
            char v17 = [*(id *)(a1 + 72) visibleStrokeForInsertingStroke:v14];
            [v33 addObject:v17];
            char v18 = os_log_create("com.apple.pencilkit", "");
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412546;
              uint64_t v43 = a1;
              __int16 v44 = 2112;
              long long v45 = v14;
              _os_log_debug_impl(&dword_1C44F8000, v18, OS_LOG_TYPE_DEBUG, "Drawing %@ add stroke %@", buf, 0x16u);
            }

            uint64_t v19 = [v14 ink];
            id v20 = [v19 behavior];
            int v21 = [v20 isEraser];

            if (v21)
            {
              char v22 = *(NSObject **)(a1 + 104);
              block[0] = MEMORY[0x1E4F143A8];
              block[1] = 3221225472;
              block[2] = __75__PKController__addNewStrokes_wasAddedEarly_hidden_preDrawingChangedBlock___block_invoke;
              block[3] = &unk_1E64C5820;
              void block[4] = a1;
              id v36 = v17;
              id v37 = v32;
              dispatch_async(v22, block);
            }
          }
        }
        uint64_t v11 = [v10 countByEnumeratingWithState:&v38 objects:v46 count:16];
      }
      while (v11);
    }

    if ([v33 count])
    {
      id v23 = v30;
      if (!v23)
      {
        id v23 = [*(id *)(a1 + 72) undoableAddNewStrokes:v33];
      }
      if (a4)
      {
        id v24 = [*(id *)(a1 + 72) undoableDeleteStrokes:v33];
      }
      else
      {
        id v24 = 0;
      }
      id v25 = *(void **)(a1 + 72);
      uint64_t v26 = *(void *)(a1 + 104);
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __75__PKController__addNewStrokes_wasAddedEarly_hidden_preDrawingChangedBlock___block_invoke_4;
      v34[3] = &unk_1E64C57A8;
      v34[4] = a1;
      [v25 clipStrokesIfNeededOnQueue:v26 completion:v34];
      id v27 = v33;
      if ([v27 count])
      {
        [*(id *)(a1 + 16) addObjectsFromArray:v27];
        -[PKController _didUpdateMutableRenderedStrokes]((void *)a1);
      }

      *(unsigned char *)(a1 + 50) = 1;
      (*((void (**)(id, id, void *, void))v32 + 2))(v32, v23, v24, 0);
      *(unsigned char *)(a1 + 50) = 0;
    }
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    [WeakRetained drawingChanged:*(void *)(a1 + 72)];
  }
}

void __82__PKController_addNewRenderedStrokes_wasAddedEarly_hidden_preDrawingChangedBlock___block_invoke(uint64_t a1)
{
}

void __82__PKController_addNewRenderedStrokes_wasAddedEarly_hidden_preDrawingChangedBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(NSObject **)(v4 + 96);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __82__PKController_addNewRenderedStrokes_wasAddedEarly_hidden_preDrawingChangedBlock___block_invoke_3;
  block[3] = &unk_1E64C5730;
  void block[4] = v4;
  id v8 = *(id *)(a1 + 40);
  __int16 v11 = *(_WORD *)(a1 + 56);
  id v9 = *(id *)(a1 + 48);
  id v10 = v3;
  id v6 = v3;
  dispatch_sync(v5, block);
}

void __82__PKController_addNewRenderedStrokes_wasAddedEarly_hidden_preDrawingChangedBlock___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(a1 + 40);
  int v4 = *(unsigned __int8 *)(a1 + 64);
  int v5 = *(unsigned __int8 *)(a1 + 65);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __82__PKController_addNewRenderedStrokes_wasAddedEarly_hidden_preDrawingChangedBlock___block_invoke_4;
  v6[3] = &unk_1E64C5708;
  id v7 = *(id *)(a1 + 48);
  -[PKController _addNewStrokes:wasAddedEarly:hidden:preDrawingChangedBlock:](v2, v3, v4, v5, v6);
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

void __82__PKController_addNewRenderedStrokes_wasAddedEarly_hidden_preDrawingChangedBlock___block_invoke_4(uint64_t a1, void *a2, void *a3, char a4)
{
  id v7 = a2;
  id v8 = a3;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __82__PKController_addNewRenderedStrokes_wasAddedEarly_hidden_preDrawingChangedBlock___block_invoke_5;
  long long v12[3] = &unk_1E64C56E0;
  id v9 = *(id *)(a1 + 32);
  id v14 = v8;
  id v15 = v9;
  id v13 = v7;
  char v16 = a4;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(MEMORY[0x1E4F14428], v12);
}

uint64_t __82__PKController_addNewRenderedStrokes_wasAddedEarly_hidden_preDrawingChangedBlock___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), *(void *)(a1 + 32), *(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 56));
}

void __75__PKController__addNewStrokes_wasAddedEarly_hidden_preDrawingChangedBlock___block_invoke(uint64_t a1)
{
  v24[1] = *MEMORY[0x1E4F143B8];
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  int v21 = __Block_byref_object_copy__0;
  char v22 = __Block_byref_object_dispose__0;
  id v23 = 0;
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(NSObject **)(v2 + 96);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __75__PKController__addNewStrokes_wasAddedEarly_hidden_preDrawingChangedBlock___block_invoke_16;
  block[3] = &unk_1E64C5848;
  void block[4] = v2;
  void block[5] = &v18;
  dispatch_sync(v3, block);
  int v4 = [(id)v19[5] sliceWithEraseStroke:*(void *)(a1 + 40)];
  int v5 = _PencilKitBundle();
  id v6 = [v5 localizedStringForKey:@"Pixel Erase" value:@"Pixel Erase" table:@"Localizable"];
  [v4 setActionName:v6];

  id v7 = (void *)v19[5];
  v24[0] = *(void *)(a1 + 40);
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:1];
  [v7 deleteStrokes:v8];

  uint64_t v9 = *(void *)(a1 + 32);
  id v10 = *(NSObject **)(v9 + 88);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __75__PKController__addNewStrokes_wasAddedEarly_hidden_preDrawingChangedBlock___block_invoke_2;
  long long v13[3] = &unk_1E64C5780;
  v13[4] = v9;
  char v16 = &v18;
  id v11 = *(id *)(a1 + 48);
  id v14 = v4;
  id v15 = v11;
  id v12 = v4;
  dispatch_sync(v10, v13);

  _Block_object_dispose(&v18, 8);
}

void __75__PKController__addNewStrokes_wasAddedEarly_hidden_preDrawingChangedBlock___block_invoke_16(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 72) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  int v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __75__PKController__addNewStrokes_wasAddedEarly_hidden_preDrawingChangedBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(NSObject **)(v2 + 96);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __75__PKController__addNewStrokes_wasAddedEarly_hidden_preDrawingChangedBlock___block_invoke_3;
  block[3] = &unk_1E64C5780;
  void block[4] = v2;
  long long v5 = *(_OWORD *)(a1 + 48);
  id v4 = (id)v5;
  long long v8 = v5;
  id v7 = *(id *)(a1 + 40);
  dispatch_sync(v3, block);
}

void __75__PKController__addNewStrokes_wasAddedEarly_hidden_preDrawingChangedBlock___block_invoke_3(void *a1)
{
  [*(id *)(a1[4] + 72) mergeWithDrawing:*(void *)(*(void *)(a1[7] + 8) + 40)];
  uint64_t v2 = a1[4];
  if (v2) {
    *(unsigned char *)(v2 + 50) = 1;
  }
  (*(void (**)(void))(a1[6] + 16))();
  uint64_t v3 = a1[4];
  if (v3)
  {
    *(unsigned char *)(v3 + 50) = 0;
    uint64_t v3 = a1[4];
  }
  id WeakRetained = objc_loadWeakRetained((id *)(v3 + 56));
  [WeakRetained drawingChanged:*(void *)(a1[4] + 72)];
}

void __75__PKController__addNewStrokes_wasAddedEarly_hidden_preDrawingChangedBlock___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  long long v5 = *(NSObject **)(v4 + 88);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __75__PKController__addNewStrokes_wasAddedEarly_hidden_preDrawingChangedBlock___block_invoke_5;
  v7[3] = &unk_1E64C5870;
  v7[4] = v4;
  id v8 = v3;
  id v6 = v3;
  dispatch_sync(v5, v7);
}

void __75__PKController__addNewStrokes_wasAddedEarly_hidden_preDrawingChangedBlock___block_invoke_5(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(NSObject **)(v1 + 96);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __75__PKController__addNewStrokes_wasAddedEarly_hidden_preDrawingChangedBlock___block_invoke_6;
  v3[3] = &unk_1E64C5870;
  v3[4] = v1;
  id v4 = *(id *)(a1 + 40);
  dispatch_sync(v2, v3);
}

void __75__PKController__addNewStrokes_wasAddedEarly_hidden_preDrawingChangedBlock___block_invoke_6(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 72) mergeWithDrawing:*(void *)(a1 + 40)];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 56));
  [WeakRetained drawingChanged:*(void *)(*(void *)(a1 + 32) + 72)];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundQueue, 0);
  objc_storeStrong((id *)&self->_drawingQueue, 0);
  objc_storeStrong((id *)&self->_interactQueue, 0);
  objc_storeStrong((id *)&self->_interactSemaphore, 0);
  objc_storeStrong((id *)&self->_drawing, 0);
  objc_storeStrong((id *)&self->_rendererController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_liveDrawingUndoCommands, 0);
  objc_storeStrong((id *)&self->_metalConfig, 0);
  objc_storeStrong((id *)&self->_mutableRenderedStrokes, 0);

  objc_storeStrong((id *)&self->_renderedStrokes, 0);
}

@end