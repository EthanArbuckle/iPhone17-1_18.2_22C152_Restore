@interface PKTileController
- (id)initWithPixelSize:(int)a3 actualSize:(void *)a4 pixelFormat:(double)a5 sixChannelBlending:(double)a6 metalConfig:(double)a7;
- (void)callbackAfterTileGeneration:(uint64_t)a1;
- (void)renderStrokes:(void *)a3 additionalStrokes:(void *)a4 intoTile:(void *)a5 completionBlock:;
- (void)renderTilesIntoTiles:(void *)a3 completion:;
- (void)resumePreviews;
- (void)runTasks;
- (void)setContentZoomScale:(uint64_t)a1;
- (void)setSixChannelBlending:(uint64_t)a1;
- (void)suspendPreviews;
- (void)teardown;
@end

@implementation PKTileController

- (void)resumePreviews
{
  if (a1)
  {
    v2 = os_log_create("com.apple.pencilkit", "Tiles");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v3 = 0;
      _os_log_debug_impl(&dword_1C44F8000, v2, OS_LOG_TYPE_DEBUG, "resume tile previews", v3, 2u);
    }

    if (*(unsigned char *)(a1 + 10))
    {
      dispatch_resume(*(dispatch_object_t *)(a1 + 48));
      *(unsigned char *)(a1 + 10) = 0;
    }
  }
}

- (id)initWithPixelSize:(int)a3 actualSize:(void *)a4 pixelFormat:(double)a5 sixChannelBlending:(double)a6 metalConfig:(double)a7
{
  id v15 = a4;
  if (a1 && +[PKMetalUtility isMetalAvailable])
  {
    v31.receiver = a1;
    v31.super_class = (Class)PKTileController;
    v16 = objc_msgSendSuper2(&v31, sel_init);
    if (v16)
    {
      id v17 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v18 = (void *)v16[4];
      v16[4] = v17;

      id v19 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v20 = (void *)v16[5];
      v16[5] = v19;

      *((unsigned char *)v16 + 9) = a3;
      v16[2] = 0x3FF0000000000000;
      v21 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v22 = dispatch_queue_attr_make_with_qos_class(v21, QOS_CLASS_USER_INTERACTIVE, 0);

      dispatch_queue_t v23 = dispatch_queue_create("com.apple.pencilkit.draw-previews", v22);
      v24 = (void *)v16[6];
      v16[6] = v23;

      v25 = [PKMetalRendererController alloc];
      if (a3) {
        uint64_t v26 = 3;
      }
      else {
        uint64_t v26 = 0;
      }
      v27 = -[PKMetalRendererController initWithPixelSize:actualSize:pixelFormat:sixChannelBlendingMode:metalConfig:](v25, a2, v26, v15, a5, a6, a7, a8);
      v28 = (void *)v16[3];
      v16[3] = v27;

      -[PKMetalRendererController setup](v16[3]);
    }
    a1 = v16;
    id v29 = a1;
  }
  else
  {
    id v29 = 0;
  }

  return v29;
}

- (void)teardown
{
  if (a1)
  {
    -[PKMetalRendererController cancelAllRendering](*(void *)(a1 + 24));
    -[PKTileController resumePreviews](a1);
    uint64_t v2 = *(void *)(a1 + 24);
    -[PKMetalRendererController teardown](v2);
  }
}

- (void)suspendPreviews
{
  if (a1)
  {
    uint64_t v2 = os_log_create("com.apple.pencilkit", "Tiles");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v3 = 0;
      _os_log_debug_impl(&dword_1C44F8000, v2, OS_LOG_TYPE_DEBUG, "suspend tile previews", v3, 2u);
    }

    if (!*(unsigned char *)(a1 + 10))
    {
      dispatch_suspend(*(dispatch_object_t *)(a1 + 48));
      *(unsigned char *)(a1 + 10) = 1;
    }
  }
}

- (void)setSixChannelBlending:(uint64_t)a1
{
  if (a1 && *(unsigned __int8 *)(a1 + 9) != a2)
  {
    *(unsigned char *)(a1 + 9) = a2;
    if (a2) {
      uint64_t v2 = 3;
    }
    else {
      uint64_t v2 = 0;
    }
    -[PKMetalRendererController setSixChannelBlendingMode:](*(void *)(a1 + 24), v2);
  }
}

- (void)setContentZoomScale:(uint64_t)a1
{
  if (a1)
  {
    if (*(double *)(a1 + 16) != a2)
    {
      *(double *)(a1 + 16) = a2;
      -[PKMetalRendererController setContentZoomScale:](*(void *)(a1 + 24), a2);
    }
  }
}

- (void)renderTilesIntoTiles:(void *)a3 completion:
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    v7 = *(NSObject **)(a1 + 48);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __52__PKTileController_renderTilesIntoTiles_completion___block_invoke;
    block[3] = &unk_1E64C6988;
    block[4] = a1;
    id v9 = v5;
    id v10 = v6;
    dispatch_async(v7, block);
  }
}

uint64_t __52__PKTileController_renderTilesIntoTiles_completion___block_invoke(uint64_t a1)
{
  -[PKMetalRendererController renderTilesIntoTiles:](*(void *)(*(void *)(a1 + 32) + 24), *(void **)(a1 + 40));
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);

  return v2();
}

- (void)callbackAfterTileGeneration:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    v4 = os_log_create("com.apple.pencilkit", "Tiles");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v7 = 0;
      _os_log_debug_impl(&dword_1C44F8000, v4, OS_LOG_TYPE_DEBUG, "queue tile completion", v7, 2u);
    }

    id v5 = *(id *)(a1 + 40);
    id v6 = _Block_copy(v3);

    [v5 addObject:v6];
    -[PKTileController runTasks](a1);
  }
}

- (void)runTasks
{
  v1 = *(NSObject **)(a1 + 48);
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __28__PKTileController_runTasks__block_invoke;
  v2[3] = &unk_1E64C8030;
  v2[4] = a1;
  char v3 = 0;
  dispatch_async(v1, v2);
}

- (void)renderStrokes:(void *)a3 additionalStrokes:(void *)a4 intoTile:(void *)a5 completionBlock:
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    id v9 = a5;
    id v10 = a4;
    id v11 = a3;
    id v12 = a2;
    v13 = [[PKTileTask alloc] initWithStrokes:v12 additionalStrokes:v11 intoTile:v10 completionBlock:v9];

    v14 = os_log_create("com.apple.pencilkit", "Tiles");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      int v15 = 138412290;
      v16 = v13;
      _os_log_debug_impl(&dword_1C44F8000, v14, OS_LOG_TYPE_DEBUG, "queue %@", (uint8_t *)&v15, 0xCu);
    }

    os_unfair_lock_lock(&tasks_lock);
    [*(id *)(a1 + 32) addObject:v13];
    os_unfair_lock_unlock(&tasks_lock);
    -[PKTileController runTasks](a1);
  }
}

void __28__PKTileController_runTasks__block_invoke(uint64_t a1)
{
  uint64_t v86 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_lock(&tasks_lock);
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    char v3 = *(void **)(v2 + 32);
  }
  else {
    char v3 = 0;
  }
  if ([v3 count])
  {
    v4 = *(void **)(a1 + 32);
    if (v4) {
      v4 = (void *)v4[4];
    }
    id v5 = v4;
    uint64_t v6 = [v5 firstObject];

    uint64_t v7 = *(void *)(a1 + 32);
    if (v7) {
      v8 = *(void **)(v7 + 32);
    }
    else {
      v8 = 0;
    }
    [v8 removeObjectAtIndex:0];
    os_unfair_lock_unlock(&tasks_lock);
    if (v6)
    {
      id v9 = *(id *)(v6 + 24);
      id v10 = (CGFloat *)v9;
      if (v9) {
        unint64_t v11 = atomic_load(v9 + 2);
      }
      else {
        unint64_t v11 = 0;
      }
      if (*(void *)(v6 + 32) == v11)
      {
        os_log_t v13 = (os_log_t)*(id *)(v6 + 8);
        v14 = *(void **)(v6 + 16);
        if (v14)
        {
          uint64_t v66 = v6;
          uint64_t v64 = a1;
          uint64_t v15 = *(void *)(a1 + 32);
          id v16 = v14;
          uint64_t v17 = v13;
          id v67 = v16;
          v65 = v10;
          if (v15)
          {
            os_log_t v13 = [v17 mutableCopy];
            v18 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", -[NSObject count](v17, "count"));
            long long v76 = 0u;
            long long v77 = 0u;
            long long v78 = 0u;
            long long v79 = 0u;
            v63 = v17;
            id v19 = v17;
            uint64_t v20 = [v19 countByEnumeratingWithState:&v76 objects:&buf count:16];
            if (v20)
            {
              uint64_t v21 = v20;
              uint64_t v22 = 0;
              uint64_t v23 = *(void *)v77;
              do
              {
                for (uint64_t i = 0; i != v21; ++i)
                {
                  if (*(void *)v77 != v23) {
                    objc_enumerationMutation(v19);
                  }
                  v25 = *(void **)(*((void *)&v76 + 1) + 8 * i);
                  uint64_t v26 = [NSNumber numberWithInteger:v22 + i];
                  v27 = [v25 _strokeUUID];
                  [v18 setObject:v26 forKeyedSubscript:v27];
                }
                uint64_t v21 = [v19 countByEnumeratingWithState:&v76 objects:&buf count:16];
                v22 += i;
              }
              while (v21);
            }

            id v28 = objc_alloc_init(MEMORY[0x1E4F28E60]);
            long long v72 = 0u;
            long long v73 = 0u;
            long long v74 = 0u;
            long long v75 = 0u;
            id v29 = v67;
            uint64_t v30 = [v29 countByEnumeratingWithState:&v72 objects:v81 count:16];
            if (v30)
            {
              uint64_t v31 = v30;
              uint64_t v32 = *(void *)v73;
              do
              {
                for (uint64_t j = 0; j != v31; ++j)
                {
                  if (*(void *)v73 != v32) {
                    objc_enumerationMutation(v29);
                  }
                  v34 = *(void **)(*((void *)&v72 + 1) + 8 * j);
                  v35 = [v34 _strokeUUID];
                  v36 = [v18 objectForKeyedSubscript:v35];

                  int v37 = [v34 _isHidden];
                  int v38 = v37;
                  if (v36)
                  {
                    uint64_t v39 = [v36 integerValue];
                    if (v38) {
                      [v28 addIndex:v39];
                    }
                    else {
                      [v13 setObject:v34 atIndexedSubscript:v39];
                    }
                  }
                  else if ((v37 & 1) == 0)
                  {
                    [v13 addObject:v34];
                  }
                }
                uint64_t v31 = [v29 countByEnumeratingWithState:&v72 objects:v81 count:16];
              }
              while (v31);
            }

            [v13 removeObjectsAtIndexes:v28];
            uint64_t v6 = v66;
            uint64_t v17 = v63;
          }
          else
          {
            os_log_t v13 = 0;
          }

          a1 = v64;
          id v10 = v65;
        }
        if (v10) {
          id Property = objc_getProperty(v10, v12, 136, 1);
        }
        else {
          id Property = 0;
        }
        id v41 = Property;
        int v42 = [v41 isEqualToArray:v13];

        if (v42)
        {
          (*(void (**)(void))(*(void *)(v6 + 40) + 16))();
          v43 = os_log_create("com.apple.pencilkit", "Tiles");
          if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
          {
            LODWORD(buf) = 138412290;
            *(void *)((char *)&buf + 4) = v6;
            _os_log_debug_impl(&dword_1C44F8000, v43, OS_LOG_TYPE_DEBUG, "nothing to do %@", (uint8_t *)&buf, 0xCu);
          }
        }
        else
        {
          v45 = os_log_create("com.apple.pencilkit", "Tiles");
          if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
          {
            LODWORD(buf) = 138412290;
            *(void *)((char *)&buf + 4) = v6;
            _os_log_debug_impl(&dword_1C44F8000, v45, OS_LOG_TYPE_DEBUG, "render %@", (uint8_t *)&buf, 0xCu);
          }

          v43 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[NSObject count](v13, "count"));
          if (v10)
          {
            CGFloat v47 = v10[23];
            CGFloat v46 = v10[24];
            CGFloat v48 = v10[25];
            CGFloat v49 = v10[26];
          }
          else
          {
            CGFloat v46 = 0.0;
            CGFloat v48 = 0.0;
            CGFloat v49 = 0.0;
            CGFloat v47 = 0.0;
          }
          long long v70 = 0u;
          long long v71 = 0u;
          long long v68 = 0u;
          long long v69 = 0u;
          v50 = v13;
          uint64_t v51 = [v50 countByEnumeratingWithState:&v68 objects:v80 count:16];
          if (v51)
          {
            uint64_t v52 = v51;
            uint64_t v53 = *(void *)v69;
            do
            {
              for (uint64_t k = 0; k != v52; ++k)
              {
                if (*(void *)v69 != v53) {
                  objc_enumerationMutation(v50);
                }
                v55 = *(void **)(*((void *)&v68 + 1) + 8 * k);
                [v55 _bounds];
                v88.origin.x = v56;
                v88.origin.y = v57;
                v88.size.width = v58;
                v88.size.height = v59;
                v87.origin.x = v47;
                v87.origin.y = v46;
                v87.size.width = v48;
                v87.size.height = v49;
                if (CGRectIntersectsRect(v87, v88)) {
                  [v43 addObject:v55];
                }
              }
              uint64_t v52 = [v50 countByEnumeratingWithState:&v68 objects:v80 count:16];
            }
            while (v52);
          }

          BOOL v60 = -[PKMetalRendererController drawStrokes:intoTile:renderCount:offscreen:](*(void *)(*(void *)(a1 + 32) + 24), v43, v10, *(void *)(v6 + 32), *(unsigned char *)(a1 + 40));
          v61 = *(void (**)(void))(*(void *)(v6 + 40) + 16);
          if (v60)
          {
            v61();
            if (v10) {
              objc_setProperty_atomic_copy(v10, v62, v50, 136);
            }
          }
          else
          {
            v61();
          }
        }
      }
      else
      {
        (*(void (**)(void))(*(void *)(v6 + 40) + 16))();
        os_log_t v13 = os_log_create("com.apple.pencilkit", "Tiles");
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          LODWORD(buf) = 138412290;
          *(void *)((char *)&buf + 4) = v6;
          _os_log_debug_impl(&dword_1C44F8000, v13, OS_LOG_TYPE_DEBUG, "skip %@", (uint8_t *)&buf, 0xCu);
        }
      }

      return;
    }
  }
  else
  {
    os_unfair_lock_unlock(&tasks_lock);
  }
  uint64_t v44 = *(void *)(a1 + 32);
  if (v44)
  {
    *(void *)&long long buf = MEMORY[0x1E4F143A8];
    *((void *)&buf + 1) = 3221225472;
    v83 = __31__PKTileController_didComplete__block_invoke;
    v84 = &unk_1E64C61C0;
    uint64_t v85 = v44;
    dispatch_sync(MEMORY[0x1E4F14428], &buf);
  }
}

void __31__PKTileController_didComplete__block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    char v3 = *(void **)(v2 + 40);
  }
  else {
    char v3 = 0;
  }
  if ([v3 count])
  {
    uint64_t v4 = *(void *)(a1 + 32);
    if (v4) {
      id v5 = *(void **)(v4 + 40);
    }
    else {
      id v5 = 0;
    }
    uint64_t v6 = (void *)[v5 copy];
    uint64_t v7 = *(void *)(a1 + 32);
    if (v7) {
      v8 = *(void **)(v7 + 40);
    }
    else {
      v8 = 0;
    }
    [v8 removeAllObjects];
    id v9 = os_log_create("com.apple.pencilkit", "Tiles");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 134217984;
      uint64_t v21 = [v6 count];
      _os_log_debug_impl(&dword_1C44F8000, v9, OS_LOG_TYPE_DEBUG, "did complete %ld", buf, 0xCu);
    }

    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v10 = v6;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v16;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v16 != v13) {
            objc_enumerationMutation(v10);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v15 + 1) + 8 * v14) + 16))(*(void *)(*((void *)&v15 + 1) + 8 * v14));
          ++v14;
        }
        while (v12 != v14);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v12);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previewQueue, 0);
  objc_storeStrong((id *)&self->_completionHandlers, 0);
  objc_storeStrong((id *)&self->_tasks, 0);

  objc_storeStrong((id *)&self->_rendererController, 0);
}

@end