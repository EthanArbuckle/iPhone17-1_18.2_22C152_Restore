@interface SingleToolbarItemContainerView
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)setBoundsWithToolbar:(id)a3;
- (void)updateForMiniBarState:(BOOL)a3;
- (void)willMoveToSuperview:(id)a3;
@end

@implementation SingleToolbarItemContainerView

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)SingleToolbarItemContainerView;
  v8 = -[SingleToolbarItemContainerView hitTest:withEvent:](&v20, sel_hitTest_withEvent_, v7, x, y);
  if (!v8)
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    v9 = [(SingleToolbarItemContainerView *)self subviews];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v21 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v17;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v17 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "hitTest:withEvent:", v7, x, y);
          if (v14)
          {
            v8 = (void *)v14;
            goto LABEL_12;
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v21 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }
    v8 = 0;
LABEL_12:
  }

  return v8;
}

- (void)updateForMiniBarState:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v4 = [(SingleToolbarItemContainerView *)self subviews];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v10 + 1) + 8 * v8);
        if (objc_opt_respondsToSelector()) {
          [v9 updateForMiniBarState:v3];
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (void)willMoveToSuperview:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(SingleToolbarItemContainerView *)self setBoundsWithToolbar:v4];
  }
}

- (void)setBoundsWithToolbar:(id)a3
{
  id v4 = a3;
  [v4 bounds];
  double v6 = v5;
  double v8 = v7;
  [v4 _contentMargin];
  double v10 = v9;

  EKUIMainWindowForMultiwindowError();
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v16, "ekui_horizontalSizeClass") == 1 && objc_msgSend(v16, "ekui_horizontalSizeClass") == 2) {
    double v10 = v10 + -1.5;
  }
  double v11 = *MEMORY[0x1E4F1DB28];
  double v12 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v13 = v6 - (v10 + v10);
  double v14 = v8 + -6.0;
  [(SingleToolbarItemContainerView *)self bounds];
  v19.origin.double x = v11;
  v19.origin.double y = v12;
  v19.size.width = v13;
  v19.size.height = v14;
  if (!CGRectEqualToRect(v18, v19))
  {
    -[SingleToolbarItemContainerView setBounds:](self, "setBounds:", v11, v12, v13, v14);
    uint64_t v15 = [(SingleToolbarItemContainerView *)self superview];
    [v15 setNeedsLayout];
  }
}

@end