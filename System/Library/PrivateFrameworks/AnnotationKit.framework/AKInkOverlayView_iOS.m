@interface AKInkOverlayView_iOS
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (id)_viewsToHitTestForEvent:(id)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)commonInit;
@end

@implementation AKInkOverlayView_iOS

- (void)commonInit
{
  v3.receiver = self;
  v3.super_class = (Class)AKInkOverlayView_iOS;
  [(AKInkOverlayView *)&v3 commonInit];
  [(AKInkOverlayView_iOS *)self setUserInteractionEnabled:0];
}

- (id)_viewsToHitTestForEvent:(id)a3
{
  v10[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(AKInkOverlayView *)self canvasView];
  uint64_t v6 = [v4 type];

  if (v6 == 9)
  {
    v10[0] = v5;
    uint64_t v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:1];
  }
  else
  {
    uint64_t v7 = [v5 _adornmentViewsToHitTest];
  }
  v8 = (void *)v7;

  return v8;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v7 = a4;
  [(AKInkOverlayView_iOS *)self _viewsToHitTestForEvent:v7];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if (v13)
        {
          -[AKInkOverlayView_iOS convertPoint:toView:](self, "convertPoint:toView:", *(void *)(*((void *)&v16 + 1) + 8 * i), x, y, (void)v16);
          if (objc_msgSend(v13, "pointInside:withEvent:", v7))
          {
            BOOL v14 = 1;
            goto LABEL_12;
          }
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
  BOOL v14 = 0;
LABEL_12:

  return v14;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v7 = a4;
  v25.receiver = self;
  v25.super_class = (Class)AKInkOverlayView_iOS;
  id v8 = -[AKInkOverlayView_iOS hitTest:withEvent:](&v25, sel_hitTest_withEvent_, v7, x, y);
  if (!v8)
  {
    [(AKInkOverlayView_iOS *)self _viewsToHitTestForEvent:v7];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v22;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v22 != v12) {
            objc_enumerationMutation(v9);
          }
          BOOL v14 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          if (v14)
          {
            -[AKInkOverlayView_iOS convertPoint:toView:](self, "convertPoint:toView:", *(void *)(*((void *)&v21 + 1) + 8 * i), x, y, (void)v21);
            double v16 = v15;
            double v18 = v17;
            if (objc_msgSend(v14, "pointInside:withEvent:", v7))
            {
              uint64_t v19 = objc_msgSend(v14, "hitTest:withEvent:", v7, v16, v18);
              if (v19)
              {
                id v8 = (void *)v19;
                goto LABEL_14;
              }
            }
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v21 objects:v26 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }
    id v8 = 0;
LABEL_14:
  }

  return v8;
}

@end