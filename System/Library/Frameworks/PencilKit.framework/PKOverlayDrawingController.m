@interface PKOverlayDrawingController
- (BOOL)hasVisibleTokensForItem:(uint64_t)a1;
- (PKOverlayDrawingView)viewForUUID:(double)a3 estimatedFrameForNewView:(double)a4;
- (double)timestampForVisibleTokensForItem:(uint64_t)a1;
- (id)allViews;
- (id)drawingForAllResultsForSourceDrawing:(id *)a1;
- (id)drawingViewAtLocation:(double)a3;
- (id)existingViewForUUID:(id *)a1;
- (id)initForView:(void *)a3 delegate:;
- (id)tokenAtLocation:(CGFloat)a3;
- (uint64_t)removeAllTokens;
- (uint64_t)removedFromView;
- (void)_removeActiveTokensForItem:(uint64_t)a1;
- (void)_removeOldTokenViewsExcludeItems:(uint64_t)a1;
- (void)_updateDrawingViews;
- (void)didBeginDrawing;
- (void)hideImageForUUID:(uint64_t)a1;
- (void)removeToken:(uint64_t)a1;
- (void)removeTokensFor:(uint64_t)a1;
- (void)removeViewForUUID:(int)a3 animated:;
- (void)setTokens:(void *)a3 item:;
- (void)showDetectionAnimationWithImage:(double)a3 frame:(double)a4;
- (void)updateDrawingView:(void *)a3 strokes:(void *)a4 animationType:(void *)a5 result:(void *)a6 imageView:;
- (void)updateImageView:(void *)a3 overlayView:(uint64_t)a4 animationType:;
- (void)viewDidLayout;
@end

@implementation PKOverlayDrawingController

- (id)initForView:(void *)a3 delegate:
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    v22.receiver = a1;
    v22.super_class = (Class)PKOverlayDrawingController;
    v7 = (id *)objc_msgSendSuper2(&v22, sel_init);
    a1 = v7;
    if (v7)
    {
      objc_storeWeak(v7 + 11, v5);
      objc_storeWeak(a1 + 1, v6);
      uint64_t v8 = objc_opt_new();
      id v9 = a1[8];
      a1[8] = (id)v8;

      uint64_t v10 = objc_opt_new();
      id v11 = a1[9];
      a1[9] = (id)v10;

      uint64_t v12 = objc_opt_new();
      id v13 = a1[10];
      a1[10] = (id)v12;

      [v5 frame];
      a1[2] = v14;
      a1[3] = v15;
      a1[4] = v16;
      a1[5] = v17;
      [v5 frame];
      a1[6] = v18;
      uint64_t v19 = [MEMORY[0x1E4F1CA60] dictionary];
      id v20 = a1[7];
      a1[7] = (id)v19;
    }
  }

  return a1;
}

- (void)viewDidLayout
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
    [WeakRetained frame];
    uint64_t v4 = v3;
    uint64_t v6 = v5;
    double v8 = v7;
    uint64_t v10 = v9;

    *(void *)(a1 + 16) = v4;
    *(void *)(a1 + 24) = v6;
    *(double *)(a1 + 32) = v8;
    *(void *)(a1 + 40) = v10;
    if (vabdd_f64(v8, *(double *)(a1 + 48)) >= 0.00999999978)
    {
      *(double *)(a1 + 48) = v8;
      [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:a1 selector:sel__updateDrawingViews object:0];
      long long v36 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      id v11 = [*(id *)(a1 + 64) allValues];
      uint64_t v12 = [v11 countByEnumeratingWithState:&v36 objects:v42 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v37;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v37 != v14) {
              objc_enumerationMutation(v11);
            }
            v16 = -[PKOverlayDrawingView imageView](*(id **)(*((void *)&v36 + 1) + 8 * i));
            [v16 setHidden:1];
          }
          uint64_t v13 = [v11 countByEnumeratingWithState:&v36 objects:v42 count:16];
        }
        while (v13);
      }

      long long v34 = 0u;
      long long v35 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      v17 = [*(id *)(a1 + 56) allValues];
      uint64_t v18 = [v17 countByEnumeratingWithState:&v32 objects:v41 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v33;
        do
        {
          for (uint64_t j = 0; j != v19; ++j)
          {
            if (*(void *)v33 != v20) {
              objc_enumerationMutation(v17);
            }
            objc_super v22 = *(void **)(*((void *)&v32 + 1) + 8 * j);
            long long v28 = 0u;
            long long v29 = 0u;
            long long v30 = 0u;
            long long v31 = 0u;
            id v23 = v22;
            uint64_t v24 = [v23 countByEnumeratingWithState:&v28 objects:v40 count:16];
            if (v24)
            {
              uint64_t v25 = v24;
              uint64_t v26 = *(void *)v29;
              do
              {
                for (uint64_t k = 0; k != v25; ++k)
                {
                  if (*(void *)v29 != v26) {
                    objc_enumerationMutation(v23);
                  }
                  [*(id *)(*((void *)&v28 + 1) + 8 * k) setHidden:1];
                }
                uint64_t v25 = [v23 countByEnumeratingWithState:&v28 objects:v40 count:16];
              }
              while (v25);
            }
          }
          uint64_t v19 = [v17 countByEnumeratingWithState:&v32 objects:v41 count:16];
        }
        while (v19);
      }

      [(id)a1 performSelector:sel__updateDrawingViews withObject:0 afterDelay:0.1];
    }
  }
}

- (uint64_t)removedFromView
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    v1 = (id *)result;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    v2 = [*(id *)(result + 56) allValues];
    uint64_t v3 = [v2 countByEnumeratingWithState:&v26 objects:v32 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v27;
      do
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v27 != v5) {
            objc_enumerationMutation(v2);
          }
          double v7 = *(void **)(*((void *)&v26 + 1) + 8 * v6);
          long long v22 = 0u;
          long long v23 = 0u;
          long long v24 = 0u;
          long long v25 = 0u;
          id v8 = v7;
          uint64_t v9 = [v8 countByEnumeratingWithState:&v22 objects:v31 count:16];
          if (v9)
          {
            uint64_t v10 = v9;
            uint64_t v11 = *(void *)v23;
            do
            {
              uint64_t v12 = 0;
              do
              {
                if (*(void *)v23 != v11) {
                  objc_enumerationMutation(v8);
                }
                [*(id *)(*((void *)&v22 + 1) + 8 * v12++) removeFromSuperview];
              }
              while (v10 != v12);
              uint64_t v10 = [v8 countByEnumeratingWithState:&v22 objects:v31 count:16];
            }
            while (v10);
          }

          ++v6;
        }
        while (v6 != v4);
        uint64_t v4 = [v2 countByEnumeratingWithState:&v26 objects:v32 count:16];
      }
      while (v4);
    }

    [v1[7] removeAllObjects];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v13 = objc_msgSend(v1[8], "allValues", 0);
    uint64_t v14 = [v13 countByEnumeratingWithState:&v18 objects:v30 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v19;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v19 != v16) {
            objc_enumerationMutation(v13);
          }
          [*(id *)(*((void *)&v18 + 1) + 8 * v17++) removeFromSuperview];
        }
        while (v15 != v17);
        uint64_t v15 = [v13 countByEnumeratingWithState:&v18 objects:v30 count:16];
      }
      while (v15);
    }

    [v1[8] removeAllObjects];
    [v1[9] removeAllObjects];
    return [v1[10] removeAllObjects];
  }
  return result;
}

- (void)_updateDrawingViews
{
  v2 = self;
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  if (self) {
    self = (PKOverlayDrawingController *)self->_drawingViews;
  }
  obuint64_t j = [(PKOverlayDrawingController *)self allValues];
  uint64_t v3 = [obj countByEnumeratingWithState:&v30 objects:v43 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v31;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v31 != v5) {
          objc_enumerationMutation(obj);
        }
        double v7 = *(void **)(*((void *)&v30 + 1) + 8 * v6);
        if (v7) {
          id v8 = (void *)v7[52];
        }
        else {
          id v8 = 0;
        }
        id v9 = v8;
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if (v2) {
            drawingViewStrokesMap = v2->_drawingViewStrokesMap;
          }
          else {
            drawingViewStrokesMap = 0;
          }
          uint64_t v11 = [(NSMutableDictionary *)drawingViewStrokesMap objectForKeyedSubscript:v9];
          if (v2) {
            drawingViewResultMap = v2->_drawingViewResultMap;
          }
          else {
            drawingViewResultMap = 0;
          }
          uint64_t v13 = [(NSMutableDictionary *)drawingViewResultMap objectForKeyedSubscript:v9];
          -[PKOverlayDrawingController updateDrawingView:strokes:animationType:result:imageView:]((id *)&v2->super.isa, v7, v11, (void *)2, v13, 0);
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v14 = [obj countByEnumeratingWithState:&v30 objects:v43 count:16];
      uint64_t v4 = v14;
    }
    while (v14);
  }

  if (v2)
  {
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v27 = [(NSMutableDictionary *)v2->_activeTokens allValues];
    uint64_t v15 = [v27 countByEnumeratingWithState:&v39 objects:v45 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      id obja = *(id *)v40;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(id *)v40 != obja) {
            objc_enumerationMutation(v27);
          }
          long long v18 = *(void **)(*((void *)&v39 + 1) + 8 * i);
          long long v35 = 0u;
          long long v36 = 0u;
          long long v37 = 0u;
          long long v38 = 0u;
          id v19 = v18;
          uint64_t v20 = [v19 countByEnumeratingWithState:&v35 objects:v44 count:16];
          if (v20)
          {
            uint64_t v21 = v20;
            uint64_t v22 = *(void *)v36;
            do
            {
              for (uint64_t j = 0; j != v21; ++j)
              {
                if (*(void *)v36 != v22) {
                  objc_enumerationMutation(v19);
                }
                long long v24 = *(void **)(*((void *)&v35 + 1) + 8 * j);
                id WeakRetained = objc_loadWeakRetained((id *)&v2->_delegate);
                long long v26 = WeakRetained;
                if (WeakRetained) {
                  [WeakRetained overlayControllerDrawingTransform:v2];
                }
                else {
                  memset(v34, 0, sizeof(v34));
                }
                -[PKMathRecognitionTokenView updateFrameForDrawingTransform:]((uint64_t)v24, v34);

                [v24 setHidden:0];
              }
              uint64_t v21 = [v19 countByEnumeratingWithState:&v35 objects:v44 count:16];
            }
            while (v21);
          }
        }
        uint64_t v16 = [v27 countByEnumeratingWithState:&v39 objects:v45 count:16];
      }
      while (v16);
    }
  }
}

- (void)updateDrawingView:(void *)a3 strokes:(void *)a4 animationType:(void *)a5 result:(void *)a6 imageView:
{
  uint64_t v11 = a2;
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  if (a1)
  {
    objc_initWeak(&location, a1);
    uint64_t v15 = (void *)[v12 copy];
    id v16 = a1[9];
    if (v11) {
      uint64_t v17 = (void *)v11[52];
    }
    else {
      uint64_t v17 = 0;
    }
    id v18 = v17;
    [v16 setObject:v15 forKeyedSubscript:v18];

    id v19 = (void *)[v13 copy];
    id v20 = a1[10];
    if (v11) {
      uint64_t v21 = (void *)v11[52];
    }
    else {
      uint64_t v21 = 0;
    }
    id v22 = v21;
    [v20 setObject:v19 forKeyedSubscript:v22];

    if ([v12 count])
    {
      if (v14)
      {
        [v14 setAccessibilityValue:v13];
        -[PKOverlayDrawingController updateImageView:overlayView:animationType:]((uint64_t)a1, v14, v11, (uint64_t)a4);
      }
      else
      {
        id WeakRetained = objc_loadWeakRetained(a1 + 1);
        v26[0] = MEMORY[0x1E4F143A8];
        v26[1] = 3221225472;
        v26[2] = __87__PKOverlayDrawingController_updateDrawingView_strokes_animationType_result_imageView___block_invoke;
        v26[3] = &unk_1E64CA868;
        objc_copyWeak(v29, &location);
        id v27 = v13;
        long long v28 = v11;
        v29[1] = a4;
        [WeakRetained overlayController:a1 imageViewForStrokes:v12 completion:v26];

        objc_destroyWeak(v29);
      }
    }
    else
    {
      double v24 = 0.2;
      if (!a4) {
        double v24 = 0.0;
      }
      [(PKOverlayDrawingView *)(uint64_t)v11 hideImageViewWithDuration:v24];
    }
    objc_destroyWeak(&location);
  }
}

- (void)hideImageForUUID:(uint64_t)a1
{
  if (a1)
  {
    uint64_t v3 = *(void **)(a1 + 72);
    id v4 = a2;
    [v3 setObject:0 forKeyedSubscript:v4];
    id v7 = [*(id *)(a1 + 64) objectForKeyedSubscript:v4];

    uint64_t v6 = v7;
    if (v7)
    {
      [(PKOverlayDrawingView *)(uint64_t)v7 hideImageViewWithDuration:0.0];
      uint64_t v6 = v7;
    }
  }
}

- (void)updateImageView:(void *)a3 overlayView:(uint64_t)a4 animationType:
{
  id v21 = a2;
  id v7 = a3;
  if (a1)
  {
    double v8 = 0.3;
    if (a4 == 2) {
      double v8 = 0.5;
    }
    if (a4) {
      double v9 = v8;
    }
    else {
      double v9 = 0.0;
    }
    objc_msgSend(v21, "frame", v8);
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
    [WeakRetained addSubview:v7];

    [v21 setUserInteractionEnabled:0];
    [v21 setAlpha:0.0];
    [v21 setAccessibilityIdentifier:@"com.apple.pencilkit.synthesizedMathView"];
    objc_msgSend(v21, "setFrame:", 0.0, 0.0, v15, v17);
    [v7 setHidden:0];
    [v21 setHidden:0];
    [v7 addSubview:v21];
    id v19 = -[PKOverlayDrawingView imageView]((id *)v7);

    if (!v19) {
      objc_msgSend(v7, "setFrame:", v11, v13, v15, v17);
    }
    id v20 = objc_loadWeakRetained((id *)(a1 + 8));
    [v20 overlayController:a1 willUpdateView:v7 animationDuration:v9];

    -[PKOverlayDrawingView showImageView:frame:animationType:animationDuration:]((id *)v7, v21, a4, v11, v13, v15, v17, v9);
  }
}

void __87__PKOverlayDrawingController_updateDrawingView_strokes_animationType_result_imageView___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    [v4 setAccessibilityValue:*(void *)(a1 + 32)];
    -[PKOverlayDrawingController updateImageView:overlayView:animationType:]((uint64_t)WeakRetained, v4, *(void **)(a1 + 40), *(void *)(a1 + 56));
  }
}

- (PKOverlayDrawingView)viewForUUID:(double)a3 estimatedFrameForNewView:(double)a4
{
  if (a1)
  {
    double v11 = *(void **)(a1 + 64);
    id v12 = a2;
    uint64_t v13 = [v11 objectForKeyedSubscript:v12];
    if (v13)
    {
      double v14 = (PKOverlayDrawingView *)v13;
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
      [WeakRetained addSubview:v14];
    }
    else
    {
      double v14 = -[PKOverlayDrawingView initWithFrame:]([PKOverlayDrawingView alloc], "initWithFrame:", a3, a4, a5, a6);
      id v17 = objc_loadWeakRetained((id *)(a1 + 88));
      [v17 addSubview:v14];

      [*(id *)(a1 + 64) setObject:v14 forKeyedSubscript:v12];
      if (!v14)
      {
LABEL_6:

        goto LABEL_7;
      }
    }
    objc_setProperty_nonatomic_copy(v14, v16, v12, 416);
    goto LABEL_6;
  }
  double v14 = 0;
LABEL_7:

  return v14;
}

- (void)_removeActiveTokensForItem:(uint64_t)a1
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    id v4 = objc_msgSend(*(id *)(a1 + 56), "objectForKeyedSubscript:", v3, 0);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v10;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(v4);
          }
          [*(id *)(*((void *)&v9 + 1) + 8 * v8++) removeFromSuperview];
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v6);
    }

    [*(id *)(a1 + 56) removeObjectForKey:v3];
  }
}

- (id)existingViewForUUID:(id *)a1
{
  if (a1)
  {
    a1 = [a1[8] objectForKeyedSubscript:a2];
    uint64_t v2 = vars8;
  }
  return a1;
}

- (void)removeViewForUUID:(int)a3 animated:
{
  id v5 = a2;
  if (a1)
  {
    id v6 = a1[8];
    uint64_t v7 = [v6 objectForKeyedSubscript:v5];

    if (v7)
    {
      if (a3) {
        double v8 = 0.3;
      }
      else {
        double v8 = 0.0;
      }
      id WeakRetained = objc_loadWeakRetained(a1 + 1);
      [WeakRetained overlayController:a1 willUpdateView:v7 animationDuration:v8];

      [a1[8] removeObjectForKey:v5];
      long long v10 = (void *)MEMORY[0x1E4FB1EB0];
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __57__PKOverlayDrawingController_removeViewForUUID_animated___block_invoke;
      v16[3] = &unk_1E64C61C0;
      id v17 = v7;
      uint64_t v11 = MEMORY[0x1E4F143A8];
      uint64_t v12 = 3221225472;
      uint64_t v13 = __57__PKOverlayDrawingController_removeViewForUUID_animated___block_invoke_2;
      uint64_t v14 = &unk_1E64C6730;
      id v15 = v17;
      [v10 animateWithDuration:v16 animations:&v11 completion:v8];
    }
    objc_msgSend(a1[9], "setObject:forKeyedSubscript:", 0, v5, v11, v12, v13, v14);
    -[PKOverlayDrawingController _removeActiveTokensForItem:]((uint64_t)a1, v5);
  }
}

uint64_t __57__PKOverlayDrawingController_removeViewForUUID_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

uint64_t __57__PKOverlayDrawingController_removeViewForUUID_animated___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeFromSuperview];
}

- (void)showDetectionAnimationWithImage:(double)a3 frame:(double)a4
{
  v40[4] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v11 = (objc_class *)MEMORY[0x1E4FB1838];
    id v12 = a2;
    uint64_t v13 = objc_msgSend([v11 alloc], "initWithFrame:", a3, a4, a5, a6);
    [v13 setImage:v12];

    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
    [WeakRetained addSubview:v13];

    id v15 = objc_alloc_init(MEMORY[0x1E4F39BD0]);
    objc_msgSend(v15, "setStartPoint:", -2.0, -2.0);
    objc_msgSend(v15, "setEndPoint:", 0.0, 0.0);
    double v16 = [MEMORY[0x1E4FB1618] whiteColor];
    id v17 = [v16 colorWithAlphaComponent:0.0];

    id v18 = [MEMORY[0x1E4FB1618] whiteColor];
    id v19 = [v18 colorWithAlphaComponent:1.0];

    [v15 setLocations:&unk_1F200EFE8];
    id v20 = v17;
    v40[0] = [v20 CGColor];
    id v21 = v19;
    v40[1] = [v21 CGColor];
    id v22 = v21;
    v40[2] = [v22 CGColor];
    id v23 = v20;
    v40[3] = [v23 CGColor];
    double v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:4];
    [v15 setColors:v24];

    [v13 bounds];
    objc_msgSend(v15, "setFrame:");
    long long v25 = [v13 layer];
    [v25 setMask:v15];

    long long v26 = [v13 layer];
    [v26 setMasksToBounds:1];

    id v27 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"startPoint"];
    long long v28 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", -2.0, -2.0);
    [v27 setFromValue:v28];

    long long v29 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", 1.0, 1.0);
    [v27 setToValue:v29];

    long long v30 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"endPoint"];
    long long v31 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", 0.0, 0.0);
    [v30 setFromValue:v31];

    long long v32 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", 3.0, 3.0);
    [v30 setToValue:v32];

    [v27 setDuration:0.5];
    [v30 setDuration:0.5];
    [v27 setRemovedOnCompletion:1];
    [v30 setRemovedOnCompletion:1];
    long long v33 = [v27 keyPath];
    [v15 addAnimation:v27 forKey:v33];

    long long v34 = [v30 keyPath];
    [v15 addAnimation:v30 forKey:v34];

    id v35 = objc_loadWeakRetained((id *)(a1 + 8));
    [v35 overlayController:a1 willUpdateView:0 animationDuration:0.5];

    dispatch_time_t v36 = dispatch_time(0, 500000000);
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __68__PKOverlayDrawingController_showDetectionAnimationWithImage_frame___block_invoke;
    v38[3] = &unk_1E64C61C0;
    id v39 = v13;
    id v37 = v13;
    dispatch_after(v36, MEMORY[0x1E4F14428], v38);
  }
}

uint64_t __68__PKOverlayDrawingController_showDetectionAnimationWithImage_frame___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeFromSuperview];
}

- (void)setTokens:(void *)a3 item:
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (a1)
  {
    double v8 = [v6 uuid];
    -[PKOverlayDrawingController _removeActiveTokensForItem:](a1, v8);

    long long v9 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v5, "count"));
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v22 = v5;
    obuint64_t j = v5;
    uint64_t v10 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v26 != v12) {
            objc_enumerationMutation(obj);
          }
          uint64_t v14 = +[PKMathRecognitionTokenView viewForToken:item:]((uint64_t)PKMathRecognitionTokenView, *(void **)(*((void *)&v25 + 1) + 8 * i), v7);
          if (v14)
          {
            id v15 = v9;
            [v9 addObject:v14];
            id WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
            [WeakRetained addSubview:v14];

            id v17 = objc_loadWeakRetained((id *)(a1 + 8));
            id v18 = v17;
            if (v17) {
              [v17 overlayControllerDrawingTransform:a1];
            }
            else {
              memset(v24, 0, sizeof(v24));
            }
            -[PKMathRecognitionTokenView updateFrameForDrawingTransform:]((uint64_t)v14, v24);

            long long v9 = v15;
          }
        }
        uint64_t v11 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v11);
    }

    if ([v9 count])
    {
      id v19 = (void *)[v9 copy];
      id v20 = *(void **)(a1 + 56);
      id v21 = [v7 uuid];
      [v20 setObject:v19 forKeyedSubscript:v21];
    }
    id v5 = v22;
  }
}

- (BOOL)hasVisibleTokensForItem:(uint64_t)a1
{
  if (!a1) {
    return 0;
  }
  uint64_t v2 = [*(id *)(a1 + 56) objectForKeyedSubscript:a2];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (double)timestampForVisibleTokensForItem:(uint64_t)a1
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0.0;
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 56), "objectForKeyedSubscript:", a2, 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v13;
    double v6 = 0.0;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v8 = *(void *)(*((void *)&v12 + 1) + 8 * v7);
        if (v8) {
          double v9 = *(double *)(v8 + 432);
        }
        else {
          double v9 = 0.0;
        }
        if (v6 < v9) {
          double v6 = v9;
        }
        ++v7;
      }
      while (v4 != v7);
      uint64_t v10 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
      uint64_t v4 = v10;
    }
    while (v10);
  }
  else
  {
    double v6 = 0.0;
  }

  return v6;
}

- (void)removeTokensFor:(uint64_t)a1
{
  if (a1)
  {
    id v3 = [a2 uuid];
    -[PKOverlayDrawingController _removeActiveTokensForItem:](a1, v3);
  }
}

- (void)removeToken:(uint64_t)a1
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    uint64_t v5 = [v3 item];
    double v6 = v5;
    if (v5)
    {
      uint64_t v7 = *(void **)(a1 + 56);
      uint64_t v8 = [v5 uuid];
      double v9 = [v7 objectForKeyedSubscript:v8];
      uint64_t v10 = (void *)[v9 mutableCopy];

      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      id v11 = v10;
      uint64_t v12 = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v24;
        do
        {
          uint64_t v15 = 0;
          do
          {
            if (*(void *)v24 != v14) {
              objc_enumerationMutation(v11);
            }
            double v16 = *(void **)(*((void *)&v23 + 1) + 8 * v15);
            if (v16) {
              uint64_t v17 = (void *)v16[52];
            }
            else {
              uint64_t v17 = 0;
            }
            id v18 = v17;

            if (v18 == v4)
            {
              objc_msgSend(v16, "removeFromSuperview", (void)v23);
              [v11 removeObject:v16];
              id v20 = (void *)[v11 copy];
              id v21 = *(void **)(a1 + 56);
              id v22 = [v6 uuid];
              [v21 setObject:v20 forKeyedSubscript:v22];

              goto LABEL_17;
            }
            ++v15;
          }
          while (v13 != v15);
          uint64_t v19 = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
          uint64_t v13 = v19;
        }
        while (v19);
      }
LABEL_17:
    }
  }
}

- (uint64_t)removeAllTokens
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v1 = result;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v2 = [*(id *)(result + 56) allValues];
    uint64_t v3 = [v2 countByEnumeratingWithState:&v17 objects:v22 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v18;
      do
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v18 != v5) {
            objc_enumerationMutation(v2);
          }
          uint64_t v7 = *(void **)(*((void *)&v17 + 1) + 8 * v6);
          long long v13 = 0u;
          long long v14 = 0u;
          long long v15 = 0u;
          long long v16 = 0u;
          id v8 = v7;
          uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v21 count:16];
          if (v9)
          {
            uint64_t v10 = v9;
            uint64_t v11 = *(void *)v14;
            do
            {
              uint64_t v12 = 0;
              do
              {
                if (*(void *)v14 != v11) {
                  objc_enumerationMutation(v8);
                }
                [*(id *)(*((void *)&v13 + 1) + 8 * v12++) removeFromSuperview];
              }
              while (v10 != v12);
              uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v21 count:16];
            }
            while (v10);
          }

          ++v6;
        }
        while (v6 != v4);
        uint64_t v4 = [v2 countByEnumeratingWithState:&v17 objects:v22 count:16];
      }
      while (v4);
    }

    return [*(id *)(v1 + 56) removeAllObjects];
  }
  return result;
}

- (id)tokenAtLocation:(CGFloat)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    uint64_t v5 = [*(id *)(a1 + 56) allValues];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v25 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          long long v20 = 0u;
          long long v21 = 0u;
          long long v22 = 0u;
          long long v23 = 0u;
          id v11 = v10;
          uint64_t v12 = [v11 countByEnumeratingWithState:&v20 objects:v28 count:16];
          if (v12)
          {
            uint64_t v13 = v12;
            uint64_t v14 = *(void *)v21;
            while (2)
            {
              for (uint64_t j = 0; j != v13; ++j)
              {
                if (*(void *)v21 != v14) {
                  objc_enumerationMutation(v11);
                }
                long long v16 = *(void **)(*((void *)&v20 + 1) + 8 * j);
                [v16 frame];
                v32.x = a2;
                v32.y = a3;
                if (CGRectContainsPoint(v33, v32))
                {
                  if (v16) {
                    long long v18 = (void *)v16[52];
                  }
                  else {
                    long long v18 = 0;
                  }
                  id v17 = v18;

                  goto LABEL_22;
                }
              }
              uint64_t v13 = [v11 countByEnumeratingWithState:&v20 objects:v28 count:16];
              if (v13) {
                continue;
              }
              break;
            }
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v24 objects:v29 count:16];
        id v17 = 0;
      }
      while (v7);
    }
    else
    {
      id v17 = 0;
    }
LABEL_22:
  }
  else
  {
    id v17 = 0;
  }

  return v17;
}

- (id)allViews
{
  uint64_t v1 = a1;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v2 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(a1[8], "count"));
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v3 = objc_msgSend(v1[8], "allValues", 0);
    uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v14 != v6) {
            objc_enumerationMutation(v3);
          }
          uint64_t v8 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          uint64_t v9 = [v8 superview];
          if (v9)
          {
            uint64_t v10 = (void *)v9;
            [v8 frame];
            BOOL IsNull = CGRectIsNull(v20);

            if (!IsNull) {
              [v2 addObject:v8];
            }
          }
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v5);
    }

    uint64_t v1 = (id *)[v2 copy];
  }

  return v1;
}

- (id)drawingViewAtLocation:(double)a3
{
  uint64_t v3 = a1;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    uint64_t v6 = -[PKOverlayDrawingController allViews](a1);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v23;
      uint64_t v10 = v3 + 11;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v23 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v12 = *(id **)(*((void *)&v22 + 1) + 8 * i);
          long long v13 = -[PKOverlayDrawingView imageView](v12);

          if (v13)
          {
            id WeakRetained = objc_loadWeakRetained(v10);
            uint64_t v15 = -[PKOverlayDrawingView imageView](v12);
            objc_msgSend(WeakRetained, "convertPoint:toView:", v15, a2, a3, (void)v22);
            CGFloat v17 = v16;
            CGFloat v19 = v18;

            CGRect v20 = -[PKOverlayDrawingView imageView](v12);
            [v20 bounds];
            v29.x = v17;
            v29.y = v19;
            LOBYTE(v15) = CGRectContainsPoint(v30, v29);

            if (v15)
            {
              uint64_t v3 = v12;
              goto LABEL_13;
            }
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
    uint64_t v3 = 0;
LABEL_13:
  }

  return v3;
}

- (id)drawingForAllResultsForSourceDrawing:(id *)a1
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    uint64_t v4 = [MEMORY[0x1E4F1CA48] array];
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v5 = objc_msgSend(a1[9], "allValues", 0);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v12;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v5);
          }
          [v4 addObjectsFromArray:*(void *)(*((void *)&v11 + 1) + 8 * i)];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v7);
    }

    if ([v4 count]) {
      a1 = (id *)[objc_alloc((Class)objc_opt_class()) initWithStrokes:v4 fromDrawing:v3];
    }
    else {
      a1 = 0;
    }
  }

  return a1;
}

- (void)_removeOldTokenViewsExcludeItems:(uint64_t)a1
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    double v4 = CACurrentMediaTime();
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v5 = objc_msgSend(*(id *)(a1 + 56), "allKeys", 0);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          double v11 = -[PKOverlayDrawingController timestampForVisibleTokensForItem:](a1, (uint64_t)v10);
          BOOL v12 = v11 <= 0.0 || v4 - v11 <= 5.0;
          if (!v12 && ([v3 containsObject:v10] & 1) == 0) {
            -[PKOverlayDrawingController _removeActiveTokensForItem:](a1, v10);
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v7);
    }
  }
}

- (void)didBeginDrawing
{
  if (a1)
  {
    id v2 = [MEMORY[0x1E4F1CAD0] set];
    -[PKOverlayDrawingController _removeOldTokenViewsExcludeItems:](a1, v2);
  }
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_view);
  objc_storeStrong((id *)&self->_drawingViewResultMap, 0);
  objc_storeStrong((id *)&self->_drawingViewStrokesMap, 0);
  objc_storeStrong((id *)&self->_drawingViews, 0);
  objc_storeStrong((id *)&self->_activeTokens, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end