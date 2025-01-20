@interface BCUI2x4AvocadoViewController
- (BOOL)_includeEmptyDevices;
- (double)_columnWidthForBounds:(CGRect)a3 andMaxNumViews:(double)a4;
- (id)_newBatteryDeviceView;
- (unint64_t)_maximumNumberOfBatteryDeviceViews;
- (void)_contentSizeCategoryDidChange:(id)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation BCUI2x4AvocadoViewController

- (double)_columnWidthForBounds:(CGRect)a3 andMaxNumViews:(double)a4
{
  return (CGRectGetWidth(a3) + -38.0 + (a4 + -1.0) * -17.0) / a4;
}

- (void)_contentSizeCategoryDidChange:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)BCUI2x4AvocadoViewController;
  [(BCUIAvocadoViewController *)&v22 _contentSizeCategoryDidChange:v4];
  v17 = v4;
  BOOL v5 = +[BCUIRingItemView isAX3PlusLayoutRequiredForContentSizeCategory:v4];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v6 = [(BCUIAvocadoViewController *)self _batteryDeviceViews];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v19;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v18 + 1) + 8 * v10);
        if (objc_opt_respondsToSelector())
        {
          v12 = [(BCUI2x4AvocadoViewController *)self view];
          [v12 bounds];
          -[BCUI2x4AvocadoViewController _columnWidthForBounds:andMaxNumViews:](self, "_columnWidthForBounds:andMaxNumViews:");
          double v14 = v13;

          double v15 = (double)74 / v14;
          if (!v5) {
            double v15 = 1.0;
          }
          [v11 setRingScale:v15];
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v23 count:16];
    }
    while (v8);
  }

  v16 = [(BCUI2x4AvocadoViewController *)self view];
  [v16 setNeedsLayout];
}

- (void)viewWillLayoutSubviews
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  v48.receiver = self;
  v48.super_class = (Class)BCUI2x4AvocadoViewController;
  [(BCUIAvocadoViewController *)&v48 viewWillLayoutSubviews];
  [(BCUI2x4AvocadoViewController *)self _maximumNumberOfBatteryDeviceViews];
  v3 = [(BCUI2x4AvocadoViewController *)self view];
  [v3 bounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  -[BCUI2x4AvocadoViewController _columnWidthForBounds:andMaxNumViews:](self, "_columnWidthForBounds:andMaxNumViews:");
  double v13 = v12;
  v51.origin.x = v5;
  v51.origin.y = v7;
  v51.size.width = v9;
  v51.size.height = v11;
  CGRectGetHeight(v51);
  int v14 = [v3 _shouldReverseLayoutDirection];
  if (v14)
  {
    v52.origin.y = v7;
    v52.origin.x = v5;
    v52.size.height = v11;
    v52.size.width = v9;
    double v15 = CGRectGetMaxX(v52) + -19.0;
  }
  v16 = objc_msgSend(v3, "window", v15);
  if (v16)
  {
    v17 = [v3 window];
    long long v18 = [v17 screen];
    [v18 scale];
    uint64_t v20 = v19;
  }
  else
  {
    v17 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v17 scale];
    uint64_t v20 = v21;
  }

  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  objc_super v22 = [(BCUIAvocadoViewController *)self _batteryDeviceViews];
  uint64_t v23 = [v22 countByEnumeratingWithState:&v44 objects:v49 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v45;
    do
    {
      for (uint64_t i = 0; i != v24; ++i)
      {
        if (*(void *)v45 != v25) {
          objc_enumerationMutation(v22);
        }
        v27 = *(void **)(*((void *)&v44 + 1) + 8 * i);
        [v27 ringScale];
        if (v28 == 1.0)
        {
          UIRectIntegralWithScale();
        }
        else
        {
          uint64_t v43 = v20;
          UIRectCenteredYInRectScale();
        }
        uint64_t v33 = v29;
        uint64_t v34 = v30;
        uint64_t v35 = v31;
        uint64_t v36 = v32;
        [v27 setFrame:v43];
        uint64_t v37 = v33;
        uint64_t v38 = v34;
        uint64_t v39 = v35;
        uint64_t v40 = v36;
        if (v14)
        {
          double MaxX = CGRectGetMinX(*(CGRect *)&v37) - v13;
          double v42 = -17.0;
        }
        else
        {
          double MaxX = CGRectGetMaxX(*(CGRect *)&v37);
          double v42 = 17.0;
        }
      }
      uint64_t v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v44, v49, 16, MaxX, v42);
    }
    while (v24);
  }
}

- (unint64_t)_maximumNumberOfBatteryDeviceViews
{
  v2 = [(BCUI2x4AvocadoViewController *)self traitCollection];
  v3 = [v2 preferredContentSizeCategory];

  if (+[BCUIRingItemView isAX3PlusLayoutRequiredForContentSizeCategory:v3])
  {
    unint64_t v4 = 3;
  }
  else
  {
    unint64_t v4 = 4;
  }

  return v4;
}

- (BOOL)_includeEmptyDevices
{
  return 1;
}

- (id)_newBatteryDeviceView
{
  v3 = [(BCUI2x4AvocadoViewController *)self traitCollection];
  unint64_t v4 = [v3 preferredContentSizeCategory];

  LODWORD(v3) = +[BCUIRingItemView isAX3PlusLayoutRequiredForContentSizeCategory:v4];
  CGFloat v5 = [(BCUI2x4AvocadoViewController *)self view];
  [v5 bounds];
  -[BCUI2x4AvocadoViewController _columnWidthForBounds:andMaxNumViews:](self, "_columnWidthForBounds:andMaxNumViews:");
  double v7 = v6;

  double v8 = objc_alloc_init(BCUIRingItemView);
  [(BCUIRingItemView *)v8 setRingItemViewStyle:1];
  [(BCUIRingItemView *)v8 setRingLineWidth:6.0];
  double v9 = 1.0;
  if (v3) {
    double v9 = (double)74 / v7;
  }
  [(BCUIRingItemView *)v8 setRingScale:v9];

  return v8;
}

@end