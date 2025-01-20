@interface HKLollipopController
+ (BOOL)pointSelectionContextsHaveUserInfo:(id)a3;
- (BOOL)_selectionHasMoved:(id)a3;
- (BOOL)centerLollipopVertically;
- (BOOL)noAnimationVisibility;
- (HKInteractiveChartAnnotationView)annotationView;
- (HKLollipopController)initWithAnnotationDataSource:(id)a3 parentView:(id)a4 delegate:(id)a5;
- (HKLollipopDelegate)delegate;
- (NSArray)lastSelectionLocation;
- (NSDate)lastFirstLollipopDate;
- (NSMutableArray)extensionViews;
- (UIView)fieldView;
- (UIView)parentView;
- (double)_backgroundViewCornerRadius;
- (double)_lollipopExtensionLength;
- (double)_lollipopExtensionWidth;
- (double)lastDismissTime;
- (id)_lollipopAnnotationColor;
- (id)_lollipopExtensionColor;
- (id)_lollipopFieldColor;
- (id)_stickLocationsFromPointContexts:(id)a3;
- (id)firstLollipopDateSinceDelta:(double)a3;
- (void)_bringViewsToFront;
- (void)_positionAnnotationViewWithStickLocations:(id)a3;
- (void)_rebuildExtensionsWithStickLocations:(id)a3;
- (void)_setAlpha:(double)a3;
- (void)_setExtensionViewBackgrounds;
- (void)_setHidden:(BOOL)a3;
- (void)setCenterLollipopVertically:(BOOL)a3;
- (void)setExtensionViews:(id)a3;
- (void)setFieldView:(id)a3;
- (void)setInvisibleAnimated:(BOOL)a3;
- (void)setLastDismissTime:(double)a3;
- (void)setLastFirstLollipopDate:(id)a3;
- (void)setLastSelectionLocation:(id)a3;
- (void)setNoAnimationVisibility:(BOOL)a3;
- (void)setParentView:(id)a3;
- (void)setVisibleWithRect:(CGRect)a3 pointContexts:(id)a4 animated:(BOOL)a5;
- (void)updateWithPointContexts:(id)a3;
@end

@implementation HKLollipopController

- (HKLollipopController)initWithAnnotationDataSource:(id)a3 parentView:(id)a4 delegate:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v23.receiver = self;
  v23.super_class = (Class)HKLollipopController;
  v11 = [(HKLollipopController *)&v23 init];
  if (v11)
  {
    v12 = [[HKInteractiveChartAnnotationView alloc] initWithContext:1];
    annotationView = v11->_annotationView;
    v11->_annotationView = v12;

    v14 = objc_msgSend(NSString, "hk_chartAccessibilityIdentifier:", @"LollipopContainer");
    [(HKInteractiveChartAnnotationView *)v11->_annotationView setAccessibilityIdentifier:v14];

    [(HKInteractiveChartAnnotationView *)v11->_annotationView setTranslatesAutoresizingMaskIntoConstraints:1];
    [(HKInteractiveChartAnnotationView *)v11->_annotationView setDataSource:v8];
    objc_storeWeak((id *)&v11->_delegate, v10);
    objc_storeStrong((id *)&v11->_parentView, a4);
    id v15 = objc_alloc(MEMORY[0x1E4FB1EB0]);
    uint64_t v16 = objc_msgSend(v15, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    fieldView = v11->_fieldView;
    v11->_fieldView = (UIView *)v16;

    [(UIView *)v11->_fieldView setPreservesSuperviewLayoutMargins:1];
    v18 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    extensionViews = v11->_extensionViews;
    v11->_extensionViews = v18;

    lastSelectionLocation = v11->_lastSelectionLocation;
    v11->_lastSelectionLocation = 0;

    lastFirstLollipopDate = v11->_lastFirstLollipopDate;
    v11->_lastFirstLollipopDate = 0;

    v11->_lastDismissTime = 0.0;
    *(_WORD *)&v11->_centerLollipopVertically = 0;
    [(UIView *)v11->_parentView addSubview:v11->_fieldView];
    [(UIView *)v11->_fieldView addSubview:v11->_annotationView];
    [(HKLollipopController *)v11 setInvisibleAnimated:0];
  }

  return v11;
}

- (id)_lollipopFieldColor
{
  v3 = [(HKLollipopController *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    v5 = [(HKLollipopController *)self delegate];
    v6 = [v5 lollipopFieldColor];
  }
  else
  {
    v6 = [MEMORY[0x1E4FB1618] whiteColor];
  }
  return v6;
}

- (id)_lollipopAnnotationColor
{
  v3 = [(HKLollipopController *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    v5 = [(HKLollipopController *)self delegate];
    v6 = [v5 lollipopAnnotationColor];
  }
  else
  {
    v6 = [MEMORY[0x1E4FB1618] blackColor];
  }
  return v6;
}

- (id)_lollipopExtensionColor
{
  v3 = [(HKLollipopController *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    v5 = [(HKLollipopController *)self delegate];
    v6 = [v5 lollipopExtensionColor];
  }
  else
  {
    v6 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_chartLollipopStickColor");
  }
  return v6;
}

- (double)_lollipopExtensionLength
{
  v3 = [(HKLollipopController *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0) {
    return -1.0;
  }
  v5 = [(HKLollipopController *)self delegate];
  [v5 lollipopExtensionLength];
  double v7 = v6;

  return v7;
}

- (double)_lollipopExtensionWidth
{
  v3 = [(HKLollipopController *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0) {
    return 2.0;
  }
  v5 = [(HKLollipopController *)self delegate];
  [v5 lollipopExtensionWidth];
  double v7 = v6;

  return v7;
}

- (double)_backgroundViewCornerRadius
{
  v3 = [(HKLollipopController *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0) {
    return 0.0;
  }
  v5 = [(HKLollipopController *)self delegate];
  [v5 lollipopBackgroundViewCornerRadius];
  double v7 = v6;

  return v7;
}

- (void)_setExtensionViewBackgrounds
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v3 = [(HKLollipopController *)self extensionViews];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v10 + 1) + 8 * v7);
        id v9 = [(HKLollipopController *)self _lollipopExtensionColor];
        [v8 setBackgroundColor:v9];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
}

- (void)updateWithPointContexts:(id)a3
{
  id v11 = a3;
  if (-[HKLollipopController _selectionHasMoved:](self, "_selectionHasMoved:"))
  {
    uint64_t v4 = [(HKLollipopController *)self delegate];
    uint64_t v5 = [(HKLollipopController *)self annotationView];
    uint64_t v6 = [v5 dataSource];
    [v4 updateAnnotationDataSource:v6 pointContexts:v11];

    uint64_t v7 = [(HKLollipopController *)self annotationView];
    [v7 reloadData];

    id v8 = [(HKLollipopController *)self _lollipopAnnotationColor];
    id v9 = [(HKLollipopController *)self annotationView];
    [v9 setBackgroundColor:v8];

    long long v10 = [(HKLollipopController *)self _stickLocationsFromPointContexts:v11];
    [(HKLollipopController *)self _positionAnnotationViewWithStickLocations:v10];
    [(HKLollipopController *)self _rebuildExtensionsWithStickLocations:v10];
  }
}

- (BOOL)_selectionHasMoved:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * i), "selectedRangeXValues", (void)v21);
        [v5 addObject:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v8);
  }

  uint64_t v12 = [(HKLollipopController *)self lastSelectionLocation];
  if (v12
    && (long long v13 = (void *)v12,
        [(HKLollipopController *)self lastSelectionLocation],
        v14 = objc_claimAutoreleasedReturnValue(),
        char v15 = [v14 isEqual:v5],
        v14,
        v13,
        (v15 & 1) != 0))
  {
    BOOL v16 = 0;
  }
  else
  {
    -[HKLollipopController setLastSelectionLocation:](self, "setLastSelectionLocation:", v5, (void)v21);
    v17 = [v6 firstObject];
    v18 = [v17 selectedPointValueRange];
    v19 = [v18 startDate];
    [(HKLollipopController *)self setLastFirstLollipopDate:v19];

    BOOL v16 = 1;
  }

  return v16;
}

- (id)_stickLocationsFromPointContexts:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v24 objects:v30 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v25;
    double v7 = 1.79769313e308;
    double v8 = -1.79769313e308;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v25 != v6) {
          objc_enumerationMutation(v3);
        }
        long long v10 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        id v11 = [v10 selectedRangeXValues];
        uint64_t v12 = [v11 minValue];
        [v12 doubleValue];
        double v14 = v13;

        if (v7 >= v14) {
          double v7 = v14;
        }
        char v15 = [v10 selectedRangeXValues];
        BOOL v16 = [v15 maxValue];
        [v16 doubleValue];
        double v18 = v17;

        if (v8 < v18) {
          double v8 = v18;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v24 objects:v30 count:16];
    }
    while (v5);
  }
  else
  {
    double v7 = 1.79769313e308;
    double v8 = -1.79769313e308;
  }
  uint64_t v19 = [NSNumber numberWithDouble:v7];
  v20 = (void *)v19;
  if (vabdd_f64(v8, v7) >= 0.1)
  {
    v28[0] = v19;
    long long v22 = [NSNumber numberWithDouble:v8];
    v28[1] = v22;
    long long v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:2];
  }
  else
  {
    uint64_t v29 = v19;
    long long v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v29 count:1];
  }

  return v21;
}

- (void)_positionAnnotationViewWithStickLocations:(id)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(HKLollipopController *)self fieldView];
  [v5 layoutMargins];
  double v39 = v6;

  double v7 = [(HKLollipopController *)self fieldView];
  [v7 frame];
  double v9 = v8;
  double v40 = v10;
  double v12 = v11;

  double v13 = [(HKLollipopController *)self annotationView];
  objc_msgSend(v13, "systemLayoutSizeFittingSize:", *MEMORY[0x1E4FB2C68], *(double *)(MEMORY[0x1E4FB2C68] + 8));
  double v15 = v14;
  double v17 = v16;

  BOOL v18 = [(HKLollipopController *)self centerLollipopVertically];
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v19 = v4;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v41 objects:v45 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v42;
    double v23 = 1.79769313e308;
    double v24 = -1.79769313e308;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v42 != v22) {
          objc_enumerationMutation(v19);
        }
        long long v26 = *(void **)(*((void *)&v41 + 1) + 8 * i);
        [v26 doubleValue];
        double v28 = v9 + v27;
        if (v23 >= v28) {
          double v23 = v28;
        }
        [v26 doubleValue];
        double v30 = v9 + v29;
        if (v24 < v30) {
          double v24 = v30;
        }
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v41 objects:v45 count:16];
    }
    while (v21);
  }
  else
  {
    double v23 = 1.79769313e308;
    double v24 = -1.79769313e308;
  }
  if (v17 >= v12) {
    double v17 = v12;
  }
  double v31 = v12 - v17 + -0.5;
  if (v18) {
    double v31 = (v12 - v17) * 0.5;
  }
  double v38 = v31;
  double v32 = fmax(v39, 16.0);

  double v33 = v24 - v23 + v32 * 2.0;
  if (v15 >= v33) {
    double v33 = v15;
  }
  if (v33 >= v40 + v32 * -2.0) {
    double v34 = v40 + v32 * -2.0;
  }
  else {
    double v34 = v33;
  }
  double v35 = (v24 + v23) * 0.5 + v34 * -0.5;
  if (v35 < v32 + v9) {
    double v35 = v32 + v9;
  }
  if (v32 + v34 + v35 > v9 + v40) {
    double v35 = v9 + v40 - v32 - v34;
  }
  double v36 = v35 - v9;
  v37 = [(HKLollipopController *)self annotationView];
  objc_msgSend(v37, "setFrame:", v36, v38, v34, v17);
}

- (void)_rebuildExtensionsWithStickLocations:(id)a3
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 count];
  double v6 = [(HKLollipopController *)self extensionViews];
  uint64_t v7 = [v6 count];

  if (v5 != v7)
  {
    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    double v8 = [(HKLollipopController *)self extensionViews];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v48 objects:v52 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v49;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v49 != v11) {
            objc_enumerationMutation(v8);
          }
          [*(id *)(*((void *)&v48 + 1) + 8 * v12++) removeFromSuperview];
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v48 objects:v52 count:16];
      }
      while (v10);
    }

    double v13 = [(HKLollipopController *)self extensionViews];
    [v13 removeAllObjects];

    if ([v4 count])
    {
      unint64_t v14 = 0;
      double v15 = *MEMORY[0x1E4F1DB28];
      double v16 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
      double v17 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
      double v18 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
      do
      {
        id v19 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", v15, v16, v17, v18);
        uint64_t v20 = [(HKLollipopController *)self parentView];
        [v20 addSubview:v19];

        uint64_t v21 = [(HKLollipopController *)self extensionViews];
        [v21 addObject:v19];

        ++v14;
      }
      while (v14 < [v4 count]);
    }
    [(HKLollipopController *)self _setExtensionViewBackgrounds];
  }
  [(HKLollipopController *)self _lollipopExtensionLength];
  if (v22 >= 0.0)
  {
    double v23 = v22;
    double v24 = [(HKLollipopController *)self fieldView];
    [v24 frame];
    double v26 = v25;
    double v28 = v27;

    double v29 = [(HKLollipopController *)self annotationView];
    [v29 frame];
    double v31 = v30;
    double v33 = v32;

    if ([v4 count])
    {
      unint64_t v34 = 0;
      double v35 = v33 + v26 + v31;
      double v36 = v23 + v26 + v28 - v35;
      do
      {
        v37 = [v4 objectAtIndexedSubscript:v34];
        [v37 doubleValue];
        double v39 = HKUIFloorToScreenScale(v38);
        double v40 = [(HKLollipopController *)self fieldView];
        [v40 frame];
        double v42 = v39 + v41;

        [(HKLollipopController *)self _lollipopExtensionWidth];
        double v44 = v43;
        double v45 = v42 + v43 * -0.5;
        uint64_t v46 = [(HKLollipopController *)self extensionViews];
        v47 = [v46 objectAtIndexedSubscript:v34];
        objc_msgSend(v47, "setFrame:", v45, v35, v44, v36);

        ++v34;
      }
      while (v34 < [v4 count]);
    }
  }
}

- (void)setVisibleWithRect:(CGRect)a3 pointContexts:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v11 = a4;
  if (![(HKLollipopController *)self isVisible])
  {
    [(HKLollipopController *)self setNoAnimationVisibility:1];
    uint64_t v12 = [(HKLollipopController *)self fieldView];
    objc_msgSend(v12, "setFrame:", x, y, width, height);

    double v13 = [(HKLollipopController *)self _lollipopFieldColor];
    unint64_t v14 = [(HKLollipopController *)self fieldView];
    [v14 setBackgroundColor:v13];

    [(HKLollipopController *)self _backgroundViewCornerRadius];
    double v16 = v15;
    double v17 = [(HKLollipopController *)self fieldView];
    double v18 = [v17 layer];
    [v18 setCornerRadius:v16];

    [(HKLollipopController *)self updateWithPointContexts:v11];
    id v19 = [(HKLollipopController *)self _lollipopAnnotationColor];
    uint64_t v20 = [(HKLollipopController *)self annotationView];
    [v20 setBackgroundColor:v19];

    [(HKLollipopController *)self _setExtensionViewBackgrounds];
    [(HKLollipopController *)self _bringViewsToFront];
    [(HKLollipopController *)self _setHidden:0];
    if (v5)
    {
      [(HKLollipopController *)self _setAlpha:0.0];
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __66__HKLollipopController_setVisibleWithRect_pointContexts_animated___block_invoke;
      v21[3] = &unk_1E6D50ED8;
      v21[4] = self;
      [MEMORY[0x1E4FB1EB0] animateWithDuration:v21 animations:0.12];
    }
  }
}

uint64_t __66__HKLollipopController_setVisibleWithRect_pointContexts_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setAlpha:1.0];
}

- (void)setInvisibleAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(HKLollipopController *)self isVisible])
  {
    [(HKLollipopController *)self setLastDismissTime:CFAbsoluteTimeGetCurrent()];
    [(HKLollipopController *)self setNoAnimationVisibility:0];
    if (v3)
    {
      [(HKLollipopController *)self _setAlpha:1.0];
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __45__HKLollipopController_setInvisibleAnimated___block_invoke;
      v6[3] = &unk_1E6D50ED8;
      v6[4] = self;
      v5[0] = MEMORY[0x1E4F143A8];
      v5[1] = 3221225472;
      v5[2] = __45__HKLollipopController_setInvisibleAnimated___block_invoke_2;
      v5[3] = &unk_1E6D53418;
      v5[4] = self;
      [MEMORY[0x1E4FB1EB0] animateWithDuration:v6 animations:v5 completion:0.12];
    }
    else
    {
      [(HKLollipopController *)self _setHidden:1];
    }
  }
}

uint64_t __45__HKLollipopController_setInvisibleAnimated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setAlpha:0.0];
}

uint64_t __45__HKLollipopController_setInvisibleAnimated___block_invoke_2(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) noAnimationVisibility];
  BOOL v3 = *(void **)(a1 + 32);
  if (v2)
  {
    return [v3 _setAlpha:1.0];
  }
  else
  {
    return [v3 _setHidden:1];
  }
}

- (id)firstLollipopDateSinceDelta:(double)a3
{
  if ([(HKLollipopController *)self isVisible]
    || (double Current = CFAbsoluteTimeGetCurrent(),
        [(HKLollipopController *)self lastDismissTime],
        Current - v6 <= a3))
  {
    uint64_t v7 = [(HKLollipopController *)self lastFirstLollipopDate];
  }
  else
  {
    uint64_t v7 = 0;
  }
  return v7;
}

+ (BOOL)pointSelectionContextsHaveUserInfo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = 0;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        double v8 = [*(id *)(*((void *)&v10 + 1) + 8 * i) userInfo];
        v5 += [v8 count];
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
    LOBYTE(v4) = v5 > 0;
  }

  return v4;
}

- (void)_bringViewsToFront
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = [(HKLollipopController *)self parentView];
  uint64_t v4 = [(HKLollipopController *)self fieldView];
  [v3 bringSubviewToFront:v4];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = [(HKLollipopController *)self extensionViews];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * v9);
        long long v11 = [(HKLollipopController *)self parentView];
        [v11 bringSubviewToFront:v10];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
}

- (void)_setHidden:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(HKLollipopController *)self fieldView];
  [v5 setHidden:v3];

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v6 = [(HKLollipopController *)self extensionViews];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * v10++) setHidden:v3];
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }

  [(HKLollipopController *)self setLastSelectionLocation:0];
}

- (void)_setAlpha:(double)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(HKLollipopController *)self fieldView];
  [v5 setAlpha:a3];

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v6 = [(HKLollipopController *)self extensionViews];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * v10++) setAlpha:a3];
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (HKInteractiveChartAnnotationView)annotationView
{
  return self->_annotationView;
}

- (HKLollipopDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HKLollipopDelegate *)WeakRetained;
}

- (BOOL)centerLollipopVertically
{
  return self->_centerLollipopVertically;
}

- (void)setCenterLollipopVertically:(BOOL)a3
{
  self->_centerLollipopVerticalldouble y = a3;
}

- (UIView)parentView
{
  return self->_parentView;
}

- (void)setParentView:(id)a3
{
}

- (UIView)fieldView
{
  return self->_fieldView;
}

- (void)setFieldView:(id)a3
{
}

- (NSMutableArray)extensionViews
{
  return self->_extensionViews;
}

- (void)setExtensionViews:(id)a3
{
}

- (NSArray)lastSelectionLocation
{
  return self->_lastSelectionLocation;
}

- (void)setLastSelectionLocation:(id)a3
{
}

- (NSDate)lastFirstLollipopDate
{
  return self->_lastFirstLollipopDate;
}

- (void)setLastFirstLollipopDate:(id)a3
{
}

- (double)lastDismissTime
{
  return self->_lastDismissTime;
}

- (void)setLastDismissTime:(double)a3
{
  self->_lastDismissTime = a3;
}

- (BOOL)noAnimationVisibility
{
  return self->_noAnimationVisibility;
}

- (void)setNoAnimationVisibility:(BOOL)a3
{
  self->_noAnimationVisibilitdouble y = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastFirstLollipopDate, 0);
  objc_storeStrong((id *)&self->_lastSelectionLocation, 0);
  objc_storeStrong((id *)&self->_extensionViews, 0);
  objc_storeStrong((id *)&self->_fieldView, 0);
  objc_storeStrong((id *)&self->_parentView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_annotationView, 0);
}

@end