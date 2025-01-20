@interface CAMControlStatusBar
- (BOOL)_isDirectionIndicatorHiddenForSpace;
- (BOOL)isControlExpanded;
- (BOOL)isDirectionIndicatorVisible;
- (BOOL)isIndicatorDesiredForType:(unint64_t)a3;
- (CAMApertureStatusIndicator)apertureIndicator;
- (CAMControlStatusBar)initWithFrame:(CGRect)a3;
- (CAMControlStatusBarDelegate)delegate;
- (CAMDirectionalIndicator)directionIndicator;
- (CAMExpandingControl)_expandedControl;
- (CAMExposureBiasStatusIndicator)exposureBiasIndicator;
- (CAMFilterStatusIndicator)filterIndicator;
- (CAMFlashExpandableStatusIndicator)flashIndicator;
- (CAMHDRStatusIndicator)hdrIndicator;
- (CAMIntensityStatusIndicator)intensityIndicator;
- (CAMLivePhotoStatusIndicator)livePhotoIndicator;
- (CAMLowLightStatusIndicator)lowLightIndicator;
- (CAMPhotoFormatStatusIndicator)photoFormatStatusIndicator;
- (CAMProResStatusIndicator)proResIndicator;
- (CAMRAWStatusIndicator)rawIndicator;
- (CAMSemanticStyleStatusIndicator)semanticStyleIndicator;
- (CAMSharedLibraryStatusIndicator)sharedLibraryIndicator;
- (CAMSmartStyleStatusIndicator)smartStyleIndicator;
- (CAMTimerStatusIndicator)timerIndicator;
- (CAMVideoConfigurationStatusIndicator)videoConfigurationIndicator;
- (CAMVideoStabilizationStatusIndicator)videoStabilizationIndicator;
- (NSArray)primaryDesiredIndicatorTypes;
- (NSArray)secondaryDesiredIndicatorTypes;
- (NSMutableDictionary)_statusIndicatorsByType;
- (NSSet)_allDesiredTypes;
- (NSSet)_allVisibleTypes;
- (UIView)primaryAccessoryControl;
- (UIView)secondaryAccessoryControl;
- (id)_createIndicatorForType:(unint64_t)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)hudItemForAccessibilityHUDManager:(id)a3;
- (id)indicatorForType:(unint64_t)a3;
- (int64_t)orientation;
- (void)_ensureDesiredIndicators;
- (void)_handleStatusIndicatorTapped:(id)a3;
- (void)_installIndicatorIfNeededForType:(unint64_t)a3;
- (void)_iterateViewsForHUDManager:(id)a3 withItemFoundBlock:(id)a4;
- (void)_layoutAllDesiredTypes:(id)a3 atOrigin:(int64_t)a4;
- (void)_layoutDesiredViewsForTypes:(id)a3 inDesiredTypes:(id)a4 atOrigin:(int64_t)a5;
- (void)_loadIndicatorIfNeededForType:(unint64_t)a3;
- (void)_prelayoutForNewTypes:(id)a3 oldTypes:(id)a4 atOrigin:(int64_t)a5;
- (void)_setAllDesiredTypes:(id)a3;
- (void)_setAllVisibleTypes:(id)a3;
- (void)_setDirectionIndicatorHiddenForSpace:(BOOL)a3;
- (void)_setExpandedControl:(id)a3;
- (void)_updateDirectionIndicatorAlphaAnimated:(BOOL)a3;
- (void)_updateExpandingInsetsForControl:(id)a3;
- (void)_updateIndicatorsVisibilityAnimated:(BOOL)a3;
- (void)collapseExpandedIndicatorAnimated:(BOOL)a3;
- (void)controlStatusIndicatorDidChangeIntrinsicContentSize:(id)a3 animated:(BOOL)a4;
- (void)expandingControl:(id)a3 didChangeExpanded:(BOOL)a4 animated:(BOOL)a5;
- (void)expandingControl:(id)a3 willChangeExpanded:(BOOL)a4 animated:(BOOL)a5;
- (void)layoutSubviews;
- (void)selectedByAccessibilityHUDManager:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDirectionIndicatorVisible:(BOOL)a3;
- (void)setDirectionIndicatorVisible:(BOOL)a3 animated:(BOOL)a4;
- (void)setOrientation:(int64_t)a3;
- (void)setOrientation:(int64_t)a3 animated:(BOOL)a4;
- (void)setPrimaryAccessoryControl:(id)a3;
- (void)setPrimaryDesiredIndicatorTypes:(id)a3;
- (void)setPrimaryDesiredIndicatorTypes:(id)a3 secondaryDesiredIndicatorTypes:(id)a4 animated:(BOOL)a5;
- (void)setSecondaryAccessoryControl:(id)a3;
- (void)setSecondaryAccessoryControl:(id)a3 animated:(BOOL)a4;
- (void)setSecondaryDesiredIndicatorTypes:(id)a3;
@end

@implementation CAMControlStatusBar

- (CAMControlStatusBar)initWithFrame:(CGRect)a3
{
  v10.receiver = self;
  v10.super_class = (Class)CAMControlStatusBar;
  v3 = -[CAMControlStatusBar initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = [MEMORY[0x263EFF9A0] dictionary];
    statusIndicatorsByType = v3->__statusIndicatorsByType;
    v3->__statusIndicatorsByType = (NSMutableDictionary *)v4;

    primaryDesiredIndicatorTypes = v3->_primaryDesiredIndicatorTypes;
    v7 = (NSArray *)MEMORY[0x263EFFA68];
    v3->_primaryDesiredIndicatorTypes = (NSArray *)MEMORY[0x263EFFA68];

    secondaryDesiredIndicatorTypes = v3->_secondaryDesiredIndicatorTypes;
    v3->_secondaryDesiredIndicatorTypes = v7;
  }
  return v3;
}

- (void)layoutSubviews
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  v3 = [(CAMControlStatusBar *)self primaryDesiredIndicatorTypes];
  [(CAMControlStatusBar *)self _layoutAllDesiredTypes:v3 atOrigin:0];

  uint64_t v4 = [(CAMControlStatusBar *)self secondaryDesiredIndicatorTypes];
  [(CAMControlStatusBar *)self _layoutAllDesiredTypes:v4 atOrigin:1];

  [(CAMControlStatusBar *)self bounds];
  double v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  double v12 = v11;
  v13 = [(CAMControlStatusBar *)self _statusIndicatorsByType];
  v14 = [(CAMControlStatusBar *)self secondaryDesiredIndicatorTypes];
  uint64_t v15 = [v14 lastObject];

  v16 = [(CAMControlStatusBar *)self primaryDesiredIndicatorTypes];
  uint64_t v17 = [v16 lastObject];

  double MinX = v10;
  if (v15)
  {
    v19 = [v13 objectForKeyedSubscript:v15];
    [v19 frame];
    double MinX = CGRectGetMinX(v61);
  }
  v54 = (void *)v15;
  if (v17)
  {
    v20 = [v13 objectForKeyedSubscript:v17];
    [v20 frame];
    double MaxX = CGRectGetMaxX(v62);
  }
  else
  {
    double MaxX = 0.0;
  }
  v53 = (void *)v17;
  v22 = [(CAMControlStatusBar *)self directionIndicator];
  v23 = v22;
  if (v22)
  {
    [v22 intrinsicContentSize];
    UIRectCenteredXInRectScale();
    CGFloat v51 = v6;
    CGFloat rect = v12;
    double x = v63.origin.x;
    double y = v63.origin.y;
    double width = v63.size.width;
    double height = v63.size.height;
    double v50 = CGRectGetMaxX(v63);
    v64.origin.double x = x;
    v64.origin.double y = y;
    v64.size.double width = width;
    v64.size.double height = height;
    double v49 = CGRectGetMinX(v64);
    v65.origin.double x = x;
    v65.origin.double y = y;
    v65.size.double width = width;
    v65.size.double height = height;
    double v28 = CGRectGetWidth(v65);
    double v29 = v28;
    if (MinX - MaxX >= v28)
    {
      double v36 = MinX - width;
      if (MinX >= v50) {
        double v36 = x;
      }
      if (MaxX <= v49) {
        double v32 = v36;
      }
      else {
        double v32 = MaxX;
      }
    }
    else
    {
      v66.origin.double y = v8;
      double v30 = v28;
      v66.size.double width = v10;
      v66.origin.double x = v51;
      v66.size.double height = rect;
      CGRectGetMidY(v66);
      UIRectCenteredAboutPointScale();
      double v32 = v31;
      double y = v33;
      double width = v34;
      double v29 = v30;
      double height = v35;
    }
    -[CAMControlStatusBar _setDirectionIndicatorHiddenForSpace:](self, "_setDirectionIndicatorHiddenForSpace:", MinX - MaxX < v29, MinX - MaxX, 0);
    objc_msgSend(v23, "setFrame:", v32, y, width, height);
  }
  v37 = [(CAMControlStatusBar *)self _allDesiredTypes];
  v38 = (void *)[v37 mutableCopy];

  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  v39 = [(CAMControlStatusBar *)self secondaryDesiredIndicatorTypes];
  v40 = [v39 reverseObjectEnumerator];

  uint64_t v41 = [v40 countByEnumeratingWithState:&v55 objects:v59 count:16];
  if (v41)
  {
    uint64_t v42 = v41;
    uint64_t v43 = *(void *)v56;
LABEL_17:
    uint64_t v44 = 0;
    while (1)
    {
      if (*(void *)v56 != v43) {
        objc_enumerationMutation(v40);
      }
      uint64_t v45 = *(void *)(*((void *)&v55 + 1) + 8 * v44);
      v46 = [v13 objectForKeyedSubscript:v45];
      [v46 frame];
      double v47 = CGRectGetMinX(v67);

      if (MaxX < v47) {
        break;
      }
      [v38 removeObject:v45];
      if (v42 == ++v44)
      {
        uint64_t v42 = [v40 countByEnumeratingWithState:&v55 objects:v59 count:16];
        if (v42) {
          goto LABEL_17;
        }
        break;
      }
    }
  }

  v48 = (void *)[v38 copy];
  [(CAMControlStatusBar *)self _setAllVisibleTypes:v48];

  [(CAMControlStatusBar *)self _updateIndicatorsVisibilityAnimated:0];
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  [(CAMControlStatusBar *)self bounds];
  double MidY = CGRectGetMidY(v16);
  double v9 = MidY + -40.0;
  double v10 = fmax(y, MidY);
  if (y >= v9) {
    double v11 = v10;
  }
  else {
    double v11 = y;
  }
  v14.receiver = self;
  v14.super_class = (Class)CAMControlStatusBar;
  double v12 = -[CAMControlStatusBar hitTest:withEvent:](&v14, sel_hitTest_withEvent_, v7, x, v11);

  return v12;
}

- (void)_layoutAllDesiredTypes:(id)a3 atOrigin:(int64_t)a4
{
}

- (void)_layoutDesiredViewsForTypes:(id)a3 inDesiredTypes:(id)a4 atOrigin:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  [(CAMControlStatusBar *)self bounds];
  v38[0] = 0;
  v38[1] = v38;
  v38[2] = 0x2020000000;
  double v39 = 0.0;
  if (a5)
  {
    if (a5 != 1) {
      goto LABEL_6;
    }
    double v14 = v12 + -12.0;
  }
  else
  {
    double v14 = 12.0;
  }
  double v39 = v14;
LABEL_6:
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __75__CAMControlStatusBar__layoutDesiredViewsForTypes_inDesiredTypes_atOrigin___block_invoke;
  aBlock[3] = &unk_263FA5290;
  aBlock[5] = v10;
  aBlock[6] = v11;
  *(double *)&aBlock[7] = v12;
  aBlock[8] = v13;
  aBlock[9] = a5;
  aBlock[4] = v38;
  uint64_t v15 = (double (**)(void *, void *, double))_Block_copy(aBlock);
  if (a5 == 1)
  {
    CGRect v16 = [(CAMControlStatusBar *)self secondaryAccessoryControl];
    double v25 = v15[2](v15, v16, 16.0);
    double v27 = v26;
    double v29 = v28;
    double v31 = v30;
    v24 = [(CAMControlStatusBar *)self secondaryAccessoryControl];
    objc_msgSend(v24, "setFrame:", v25, v27, v29, v31);
    goto LABEL_10;
  }
  if (!a5)
  {
    CGRect v16 = [(CAMControlStatusBar *)self primaryAccessoryControl];
    double v17 = v15[2](v15, v16, 16.0);
    double v19 = v18;
    double v21 = v20;
    double v23 = v22;
    v24 = [(CAMControlStatusBar *)self primaryAccessoryControl];
    objc_msgSend(v24, "setFrame:", v17, v19, v21, v23);
LABEL_10:
  }
  v34[0] = MEMORY[0x263EF8330];
  v34[1] = 3221225472;
  v34[2] = __75__CAMControlStatusBar__layoutDesiredViewsForTypes_inDesiredTypes_atOrigin___block_invoke_2;
  v34[3] = &unk_263FA52B8;
  v34[4] = self;
  double v32 = v15;
  double v36 = v32;
  id v33 = v8;
  id v35 = v33;
  [v9 enumerateObjectsUsingBlock:v34];

  _Block_object_dispose(v38, 8);
}

double __75__CAMControlStatusBar__layoutDesiredViewsForTypes_inDesiredTypes_atOrigin___block_invoke(uint64_t a1, void *a2, double a3)
{
  double v4 = *MEMORY[0x263F001A8];
  CGFloat v3 = *(double *)(MEMORY[0x263F001A8] + 8);
  if (a2)
  {
    [a2 intrinsicContentSize];
    CGFloat v8 = v7;
    CGFloat v9 = *(double *)(a1 + 64);
    uint64_t v10 = *(void *)(a1 + 72);
    if (v10)
    {
      if (v10 != 1)
      {
LABEL_8:
        v15.origin.double x = v4;
        v15.origin.double y = v3;
        v15.size.double width = v8;
        v15.size.double height = v9;
        *(void *)&double v4 = (unint64_t)CGRectInset(v15, a3 * -0.5, 0.0);
        return v4;
      }
      double v4 = *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) - v7;
      v13.origin.double x = v4;
      v13.origin.double y = v3;
      v13.size.double width = v8;
      v13.size.double height = *(CGFloat *)(a1 + 64);
      double v11 = CGRectGetMinX(v13) - a3;
    }
    else
    {
      double v4 = *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
      v14.origin.double x = v4;
      v14.origin.double y = v3;
      v14.size.double width = v8;
      v14.size.double height = *(CGFloat *)(a1 + 64);
      double v11 = CGRectGetMaxX(v14) + a3;
    }
    *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v11;
    goto LABEL_8;
  }
  return v4;
}

void __75__CAMControlStatusBar__layoutDesiredViewsForTypes_inDesiredTypes_atOrigin___block_invoke_2(uint64_t a1, void *a2)
{
  id v13 = a2;
  CGFloat v3 = [*(id *)(a1 + 32) _statusIndicatorsByType];
  double v4 = [v3 objectForKeyedSubscript:v13];

  double v5 = (*(double (**)(double))(*(void *)(a1 + 48) + 16))(12.0);
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v12 = *(void **)(a1 + 40);
  if (!v12 || [v12 containsObject:v13]) {
    objc_msgSend(v4, "setFrame:", v5, v7, v9, v11);
  }
}

- (void)_prelayoutForNewTypes:(id)a3 oldTypes:(id)a4 atOrigin:(int64_t)a5
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  double v10 = [MEMORY[0x263EFF9C0] setWithArray:v8];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v11 = v9;
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
        [v10 removeObject:*(void *)(*((void *)&v23 + 1) + 8 * v15++)];
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v13);
  }

  CGRect v16 = (void *)MEMORY[0x263F82E00];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __63__CAMControlStatusBar__prelayoutForNewTypes_oldTypes_atOrigin___block_invoke;
  v19[3] = &unk_263FA0C58;
  v19[4] = self;
  id v20 = v10;
  id v21 = v8;
  int64_t v22 = a5;
  id v17 = v8;
  id v18 = v10;
  [v16 performWithoutAnimation:v19];
}

void __63__CAMControlStatusBar__prelayoutForNewTypes_oldTypes_atOrigin___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  [*(id *)(a1 + 32) _layoutDesiredViewsForTypes:*(void *)(a1 + 40) inDesiredTypes:*(void *)(a1 + 48) atOrigin:*(void *)(a1 + 56)];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = *(id *)(a1 + 40);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v10 + 1) + 8 * v6);
        id v8 = objc_msgSend(*(id *)(a1 + 32), "_statusIndicatorsByType", (void)v10);
        id v9 = [v8 objectForKeyedSubscript:v7];
        [v9 layoutIfNeeded];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
}

- (void)_updateExpandingInsetsForControl:(id)a3
{
  id v9 = a3;
  [v9 frame];
  objc_msgSend(v9, "alignmentRectForFrame:");
  [(CAMControlStatusBar *)self bounds];
  CGRect v12 = CGRectInset(v11, 12.0, 0.0);
  double x = v12.origin.x;
  double y = v12.origin.y;
  double width = v12.size.width;
  double height = v12.size.height;
  id v8 = [v9 superview];
  -[CAMControlStatusBar convertRect:toView:](self, "convertRect:toView:", v8, x, y, width, height);

  CEKRectInsetsInRect();
  objc_msgSend(v9, "setExpansionInsets:");
}

- (id)_createIndicatorForType:(unint64_t)a3
{
  uint64_t v5 = off_263F9E370;
  switch(a3)
  {
    case 0uLL:
      goto LABEL_19;
    case 1uLL:
      uint64_t v5 = off_263F9E540;
      goto LABEL_19;
    case 2uLL:
      uint64_t v5 = off_263F9E418;
      goto LABEL_19;
    case 3uLL:
      uint64_t v5 = off_263F9EC80;
      goto LABEL_19;
    case 4uLL:
      uint64_t v5 = off_263F9E348;
      goto LABEL_19;
    case 5uLL:
      uint64_t v5 = off_263F9DF88;
      goto LABEL_19;
    case 6uLL:
      uint64_t v5 = off_263F9E488;
      goto LABEL_19;
    case 7uLL:
      uint64_t v5 = off_263F9E2C8;
      goto LABEL_19;
    case 8uLL:
      uint64_t v6 = objc_alloc_init(CAMVideoConfigurationStatusIndicator);
      [(CAMControlStatusIndicator *)v6 setControlStatusType:8];
      goto LABEL_21;
    case 9uLL:
      uint64_t v5 = off_263F9E578;
      goto LABEL_19;
    case 0xAuLL:
      uint64_t v5 = off_263F9E9A0;
      goto LABEL_19;
    case 0xBuLL:
      uint64_t v5 = off_263F9EAA8;
      goto LABEL_19;
    case 0xCuLL:
      uint64_t v5 = off_263F9E8E0;
      goto LABEL_19;
    case 0xDuLL:
      uint64_t v5 = off_263F9E8A8;
      goto LABEL_19;
    case 0xEuLL:
      uint64_t v5 = off_263F9EA08;
      goto LABEL_19;
    case 0xFuLL:
      uint64_t v5 = off_263F9EDC0;
      goto LABEL_19;
    case 0x10uLL:
      uint64_t v5 = off_263F9E7A8;
LABEL_19:
      uint64_t v6 = (CAMVideoConfigurationStatusIndicator *)objc_alloc_init(*v5);
      break;
    default:
      uint64_t v6 = 0;
      break;
  }
  [(CAMControlStatusIndicator *)v6 setControlStatusType:a3];
  [(CAMVideoConfigurationStatusIndicator *)v6 addTarget:self action:sel__handleStatusIndicatorTapped_ forControlEvents:64];
LABEL_21:
  [(CAMVideoConfigurationStatusIndicator *)v6 setAlpha:0.0];
  return v6;
}

- (id)indicatorForType:(unint64_t)a3
{
  uint64_t v4 = [(CAMControlStatusBar *)self _statusIndicatorsByType];
  uint64_t v5 = [NSNumber numberWithUnsignedInteger:a3];
  uint64_t v6 = [v4 objectForKeyedSubscript:v5];

  return v6;
}

- (CAMFlashExpandableStatusIndicator)flashIndicator
{
  id v2 = [(CAMControlStatusBar *)self _statusIndicatorsByType];
  uint64_t v3 = [v2 objectForKeyedSubscript:&unk_26BDDEAA8];

  return (CAMFlashExpandableStatusIndicator *)v3;
}

- (CAMLivePhotoStatusIndicator)livePhotoIndicator
{
  id v2 = [(CAMControlStatusBar *)self _statusIndicatorsByType];
  uint64_t v3 = [v2 objectForKeyedSubscript:&unk_26BDDEAC0];

  return (CAMLivePhotoStatusIndicator *)v3;
}

- (CAMHDRStatusIndicator)hdrIndicator
{
  id v2 = [(CAMControlStatusBar *)self _statusIndicatorsByType];
  uint64_t v3 = [v2 objectForKeyedSubscript:&unk_26BDDEAD8];

  return (CAMHDRStatusIndicator *)v3;
}

- (CAMTimerStatusIndicator)timerIndicator
{
  id v2 = [(CAMControlStatusBar *)self _statusIndicatorsByType];
  uint64_t v3 = [v2 objectForKeyedSubscript:&unk_26BDDEAF0];

  return (CAMTimerStatusIndicator *)v3;
}

- (CAMFilterStatusIndicator)filterIndicator
{
  id v2 = [(CAMControlStatusBar *)self _statusIndicatorsByType];
  uint64_t v3 = [v2 objectForKeyedSubscript:&unk_26BDDEB08];

  return (CAMFilterStatusIndicator *)v3;
}

- (CAMApertureStatusIndicator)apertureIndicator
{
  id v2 = [(CAMControlStatusBar *)self _statusIndicatorsByType];
  uint64_t v3 = [v2 objectForKeyedSubscript:&unk_26BDDEB20];

  return (CAMApertureStatusIndicator *)v3;
}

- (CAMIntensityStatusIndicator)intensityIndicator
{
  id v2 = [(CAMControlStatusBar *)self _statusIndicatorsByType];
  uint64_t v3 = [v2 objectForKeyedSubscript:&unk_26BDDEB38];

  return (CAMIntensityStatusIndicator *)v3;
}

- (CAMExposureBiasStatusIndicator)exposureBiasIndicator
{
  id v2 = [(CAMControlStatusBar *)self _statusIndicatorsByType];
  uint64_t v3 = [v2 objectForKeyedSubscript:&unk_26BDDEB50];

  return (CAMExposureBiasStatusIndicator *)v3;
}

- (CAMVideoConfigurationStatusIndicator)videoConfigurationIndicator
{
  id v2 = [(CAMControlStatusBar *)self _statusIndicatorsByType];
  uint64_t v3 = [v2 objectForKeyedSubscript:&unk_26BDDEB68];

  return (CAMVideoConfigurationStatusIndicator *)v3;
}

- (CAMLowLightStatusIndicator)lowLightIndicator
{
  id v2 = [(CAMControlStatusBar *)self _statusIndicatorsByType];
  uint64_t v3 = [v2 objectForKeyedSubscript:&unk_26BDDEB80];

  return (CAMLowLightStatusIndicator *)v3;
}

- (CAMSemanticStyleStatusIndicator)semanticStyleIndicator
{
  id v2 = [(CAMControlStatusBar *)self _statusIndicatorsByType];
  uint64_t v3 = [v2 objectForKeyedSubscript:&unk_26BDDEB98];

  return (CAMSemanticStyleStatusIndicator *)v3;
}

- (CAMSmartStyleStatusIndicator)smartStyleIndicator
{
  id v2 = [(CAMControlStatusBar *)self _statusIndicatorsByType];
  uint64_t v3 = [v2 objectForKeyedSubscript:&unk_26BDDEBB0];

  return (CAMSmartStyleStatusIndicator *)v3;
}

- (CAMRAWStatusIndicator)rawIndicator
{
  id v2 = [(CAMControlStatusBar *)self _statusIndicatorsByType];
  uint64_t v3 = [v2 objectForKeyedSubscript:&unk_26BDDEBC8];

  return (CAMRAWStatusIndicator *)v3;
}

- (CAMPhotoFormatStatusIndicator)photoFormatStatusIndicator
{
  id v2 = [(CAMControlStatusBar *)self _statusIndicatorsByType];
  uint64_t v3 = [v2 objectForKeyedSubscript:&unk_26BDDEBE0];

  return (CAMPhotoFormatStatusIndicator *)v3;
}

- (CAMProResStatusIndicator)proResIndicator
{
  id v2 = [(CAMControlStatusBar *)self _statusIndicatorsByType];
  uint64_t v3 = [v2 objectForKeyedSubscript:&unk_26BDDEBF8];

  return (CAMProResStatusIndicator *)v3;
}

- (CAMSharedLibraryStatusIndicator)sharedLibraryIndicator
{
  id v2 = [(CAMControlStatusBar *)self _statusIndicatorsByType];
  uint64_t v3 = [v2 objectForKeyedSubscript:&unk_26BDDEC10];

  return (CAMSharedLibraryStatusIndicator *)v3;
}

- (CAMVideoStabilizationStatusIndicator)videoStabilizationIndicator
{
  id v2 = [(CAMControlStatusBar *)self _statusIndicatorsByType];
  uint64_t v3 = [v2 objectForKeyedSubscript:&unk_26BDDEC28];

  return (CAMVideoStabilizationStatusIndicator *)v3;
}

- (void)_handleStatusIndicatorTapped:(id)a3
{
  id v4 = a3;
  id v6 = [(CAMControlStatusBar *)self delegate];
  uint64_t v5 = [v4 controlStatusType];

  [v6 controlStatusBar:self didReceiveTapInIndicatorForType:v5];
}

- (void)setPrimaryDesiredIndicatorTypes:(id)a3
{
  id v4 = a3;
  id v5 = [(CAMControlStatusBar *)self secondaryDesiredIndicatorTypes];
  [(CAMControlStatusBar *)self setPrimaryDesiredIndicatorTypes:v4 secondaryDesiredIndicatorTypes:v5 animated:0];
}

- (void)setSecondaryDesiredIndicatorTypes:(id)a3
{
  id v4 = a3;
  id v5 = [(CAMControlStatusBar *)self primaryDesiredIndicatorTypes];
  [(CAMControlStatusBar *)self setPrimaryDesiredIndicatorTypes:v5 secondaryDesiredIndicatorTypes:v4 animated:0];
}

- (void)setPrimaryDesiredIndicatorTypes:(id)a3 secondaryDesiredIndicatorTypes:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  if (![v8 isEqual:self->_primaryDesiredIndicatorTypes]
    || ([v9 isEqual:self->_secondaryDesiredIndicatorTypes] & 1) == 0)
  {
    long long v10 = self->_primaryDesiredIndicatorTypes;
    CGRect v11 = self->_secondaryDesiredIndicatorTypes;
    CGRect v12 = (void *)[v8 copy];
    long long v13 = (void *)[v9 copy];
    objc_storeStrong((id *)&self->_primaryDesiredIndicatorTypes, v12);
    objc_storeStrong((id *)&self->_secondaryDesiredIndicatorTypes, v13);
    uint64_t v14 = [MEMORY[0x263EFF9C0] setWithArray:v13];
    [v14 addObjectsFromArray:v12];
    [(CAMControlStatusBar *)self _setAllDesiredTypes:v14];
    [(CAMControlStatusBar *)self _ensureDesiredIndicators];
    if (v5)
    {
      [(CAMControlStatusBar *)self _prelayoutForNewTypes:v12 oldTypes:v10 atOrigin:0];
      [(CAMControlStatusBar *)self _prelayoutForNewTypes:v13 oldTypes:v11 atOrigin:1];
      [(CAMControlStatusBar *)self setNeedsLayout];
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __95__CAMControlStatusBar_setPrimaryDesiredIndicatorTypes_secondaryDesiredIndicatorTypes_animated___block_invoke;
      v15[3] = &unk_263FA0208;
      v15[4] = self;
      [MEMORY[0x263F82E00] animateWithDuration:2 delay:v15 usingSpringWithDamping:0 initialSpringVelocity:0.5 options:0.0 animations:1.0 completion:1.0];
    }
    else
    {
      [(CAMControlStatusBar *)self setNeedsLayout];
    }
  }
}

uint64_t __95__CAMControlStatusBar_setPrimaryDesiredIndicatorTypes_secondaryDesiredIndicatorTypes_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

- (BOOL)isIndicatorDesiredForType:(unint64_t)a3
{
  id v4 = [(CAMControlStatusBar *)self _allDesiredTypes];
  BOOL v5 = [NSNumber numberWithUnsignedInteger:a3];
  char v6 = [v4 containsObject:v5];

  return v6;
}

- (void)collapseExpandedIndicatorAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(CAMControlStatusBar *)self _expandedControl];
  [v4 setExpanded:0 animated:v3];
}

- (BOOL)isControlExpanded
{
  id v2 = [(CAMControlStatusBar *)self _expandedControl];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)setDirectionIndicatorVisible:(BOOL)a3
{
}

- (void)setDirectionIndicatorVisible:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_directionIndicatorVisible != a3)
  {
    BOOL v4 = a4;
    self->_directionIndicatorVisible = a3;
    if (a3)
    {
      char v6 = [(CAMControlStatusBar *)self directionIndicator];

      if (!v6)
      {
        uint64_t v7 = objc_alloc_init(CAMDirectionalIndicator);
        directionIndicator = self->_directionIndicator;
        self->_directionIndicator = v7;

        [(CAMControlStatusBar *)self addSubview:self->_directionIndicator];
        if (v4) {
          [(CAMDirectionalIndicator *)self->_directionIndicator setAlpha:0.0];
        }
      }
    }
    [(CAMControlStatusBar *)self _updateDirectionIndicatorAlphaAnimated:v4];
  }
}

- (void)_setDirectionIndicatorHiddenForSpace:(BOOL)a3
{
  if (self->__directionIndicatorHiddenForSpace != a3)
  {
    self->__directionIndicatorHiddenForSpace = a3;
    [(CAMControlStatusBar *)self _updateDirectionIndicatorAlphaAnimated:0];
  }
}

- (void)_updateDirectionIndicatorAlphaAnimated:(BOOL)a3
{
  if ([(CAMControlStatusBar *)self isDirectionIndicatorVisible]
    && ![(CAMControlStatusBar *)self _isDirectionIndicatorHiddenForSpace])
  {
    BOOL v5 = [(CAMControlStatusBar *)self _expandedControl];
    BOOL v4 = v5 == 0;
  }
  else
  {
    BOOL v4 = 0;
  }
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __62__CAMControlStatusBar__updateDirectionIndicatorAlphaAnimated___block_invoke;
  v6[3] = &unk_263FA02A8;
  v6[4] = self;
  BOOL v7 = v4;
  +[CAMView animateIfNeededWithDuration:2 usingSpringWithDamping:v6 initialSpringVelocity:0 options:0.5 animations:1.0 completion:1.0];
}

void __62__CAMControlStatusBar__updateDirectionIndicatorAlphaAnimated___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40)) {
    double v1 = 1.0;
  }
  else {
    double v1 = 0.0;
  }
  id v2 = [*(id *)(a1 + 32) directionIndicator];
  [v2 setAlpha:v1];
}

- (void)setPrimaryAccessoryControl:(id)a3
{
  BOOL v5 = (UIView *)a3;
  p_primaryAccessoryControl = &self->_primaryAccessoryControl;
  if (self->_primaryAccessoryControl != v5)
  {
    id v9 = v5;
    BOOL v7 = self;
    id v8 = [(UIView *)*p_primaryAccessoryControl superview];

    if (v8 == v7) {
      [(UIView *)*p_primaryAccessoryControl removeFromSuperview];
    }
    objc_storeStrong((id *)p_primaryAccessoryControl, a3);
    [(CAMControlStatusBar *)v7 addSubview:*p_primaryAccessoryControl];

    BOOL v5 = v9;
  }
}

- (void)setSecondaryAccessoryControl:(id)a3
{
}

- (void)setSecondaryAccessoryControl:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v7 = (UIView *)a3;
  p_secondaryAccessoryControl = &self->_secondaryAccessoryControl;
  if (self->_secondaryAccessoryControl == v7) {
    goto LABEL_10;
  }
  id v9 = self;
  long long v10 = [(UIView *)*p_secondaryAccessoryControl superview];

  if (v10 == v9)
  {
    [(UIView *)*p_secondaryAccessoryControl removeFromSuperview];
    if (!v4) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  if (v4) {
LABEL_4:
  }
    [(CAMControlStatusBar *)v9 layoutIfNeeded];
LABEL_5:
  objc_storeStrong((id *)p_secondaryAccessoryControl, a3);
  if (v7) {
    [(CAMControlStatusBar *)v9 addSubview:*p_secondaryAccessoryControl];
  }
  [(CAMControlStatusBar *)v9 setNeedsLayout];
  if (v4)
  {
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __61__CAMControlStatusBar_setSecondaryAccessoryControl_animated___block_invoke;
    v11[3] = &unk_263FA0208;
    v11[4] = v9;
    [MEMORY[0x263F82E00] animateWithDuration:2 delay:v11 usingSpringWithDamping:0 initialSpringVelocity:0.5 options:0.0 animations:1.0 completion:1.0];
  }

LABEL_10:
}

uint64_t __61__CAMControlStatusBar_setSecondaryAccessoryControl_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

- (void)setOrientation:(int64_t)a3
{
}

- (void)setOrientation:(int64_t)a3 animated:(BOOL)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if (self->_orientation != a3)
  {
    BOOL v4 = a4;
    self->_orientation = a3;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    char v6 = [(CAMControlStatusBar *)self _statusIndicatorsByType];
    BOOL v7 = [v6 allValues];

    uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v14 != v10) {
            objc_enumerationMutation(v7);
          }
          CGRect v12 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          if ([v12 supportsOrientations]) {
            [v12 setOrientation:a3 animated:v4];
          }
          else {
            +[CAMView rotateView:v12 toInterfaceOrientation:a3 animated:v4];
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v9);
    }
  }
}

- (void)_ensureDesiredIndicators
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  BOOL v3 = [(CAMControlStatusBar *)self _allDesiredTypes];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = [*(id *)(*((void *)&v9 + 1) + 8 * v7) integerValue];
        [(CAMControlStatusBar *)self _loadIndicatorIfNeededForType:v8];
        [(CAMControlStatusBar *)self _installIndicatorIfNeededForType:v8];
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (void)_loadIndicatorIfNeededForType:(unint64_t)a3
{
  id v9 = [(CAMControlStatusBar *)self _statusIndicatorsByType];
  uint64_t v5 = [NSNumber numberWithUnsignedInteger:a3];
  uint64_t v6 = [v9 objectForKeyedSubscript:v5];

  if (!v6)
  {
    uint64_t v6 = [(CAMControlStatusBar *)self _createIndicatorForType:a3];
    objc_msgSend(v6, "setOrientation:", -[CAMControlStatusBar orientation](self, "orientation"));
    uint64_t v7 = [NSNumber numberWithUnsignedInteger:a3];
    [v9 setObject:v6 forKeyedSubscript:v7];

    if (objc_opt_respondsToSelector()) {
      [v6 setDelegate:self];
    }
    uint64_t v8 = [(CAMControlStatusBar *)self delegate];
    [v8 controlStatusBar:self didCreateIndicatorForType:a3];
  }
}

- (void)_installIndicatorIfNeededForType:(unint64_t)a3
{
  uint64_t v8 = self;
  uint64_t v4 = [(CAMControlStatusBar *)v8 _statusIndicatorsByType];
  uint64_t v5 = [NSNumber numberWithUnsignedInteger:a3];
  uint64_t v6 = [v4 objectForKeyedSubscript:v5];

  if (v6)
  {
    uint64_t v7 = [v6 superview];

    if (v7 != v8) {
      [(CAMControlStatusBar *)v8 addSubview:v6];
    }
  }
}

- (void)_updateIndicatorsVisibilityAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(CAMControlStatusBar *)self _allVisibleTypes];
  if (v3) {
    double v6 = 0.5;
  }
  else {
    double v6 = 0.0;
  }
  uint64_t v7 = [(CAMControlStatusBar *)self _expandedControl];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __59__CAMControlStatusBar__updateIndicatorsVisibilityAnimated___block_invoke;
  v10[3] = &unk_263FA0CD0;
  v10[4] = self;
  id v11 = v5;
  id v12 = v7;
  id v8 = v7;
  id v9 = v5;
  +[CAMView animateIfNeededWithDuration:2 usingSpringWithDamping:v10 initialSpringVelocity:0 options:v6 animations:1.0 completion:1.0];
}

void __59__CAMControlStatusBar__updateIndicatorsVisibilityAnimated___block_invoke(id *a1)
{
  id v2 = [a1[4] _statusIndicatorsByType];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __59__CAMControlStatusBar__updateIndicatorsVisibilityAnimated___block_invoke_2;
  v3[3] = &unk_263FA52E0;
  id v4 = a1[5];
  id v5 = a1[6];
  [v2 enumerateKeysAndObjectsUsingBlock:v3];
}

void __59__CAMControlStatusBar__updateIndicatorsVisibilityAnimated___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v10 = a3;
  int v6 = [v5 containsObject:a2];
  double v7 = 0.0;
  if (v6)
  {
    id v8 = *(id *)(a1 + 40);
    double v7 = 1.0;
    double v9 = 0.0;
    if (v8 == v10) {
      double v9 = 1.0;
    }
    if (v8) {
      double v7 = v9;
    }
  }
  [v10 setAlpha:v7];
}

- (void)controlStatusIndicatorDidChangeIntrinsicContentSize:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  [(CAMControlStatusBar *)self setNeedsLayout];
  if (v4)
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __84__CAMControlStatusBar_controlStatusIndicatorDidChangeIntrinsicContentSize_animated___block_invoke;
    v6[3] = &unk_263FA0208;
    v6[4] = self;
    [MEMORY[0x263F82E00] animateWithDuration:2 delay:v6 usingSpringWithDamping:0 initialSpringVelocity:0.5 options:0.0 animations:1.0 completion:1.0];
  }
}

uint64_t __84__CAMControlStatusBar_controlStatusIndicatorDidChangeIntrinsicContentSize_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

- (void)expandingControl:(id)a3 willChangeExpanded:(BOOL)a4 animated:(BOOL)a5
{
  BOOL v5 = a4;
  id v8 = a3;
  double v7 = [(CAMControlStatusBar *)self delegate];
  [v7 controlStatusBar:self willChangeExpandingControl:v8 expanded:v5];

  if (v5) {
    [(CAMControlStatusBar *)self _updateExpandingInsetsForControl:v8];
  }
}

- (void)expandingControl:(id)a3 didChangeExpanded:(BOOL)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v13 = a3;
  id v8 = [(CAMControlStatusBar *)self _expandedControl];
  id v9 = v8;
  if (v6)
  {
    [(CAMControlStatusBar *)self _setExpandedControl:v13];
    [v9 setExpanded:0 animated:v5];
    id v10 = [v13 superview];
    [v10 bringSubviewToFront:v13];

LABEL_6:
    [(CAMControlStatusBar *)self _updateIndicatorsVisibilityAnimated:v5];
    [(CAMControlStatusBar *)self _updateDirectionIndicatorAlphaAnimated:v5];
    goto LABEL_7;
  }

  if (v9 == v13) {
    [(CAMControlStatusBar *)self _setExpandedControl:0];
  }
  id v11 = [(CAMControlStatusBar *)self _expandedControl];

  if (!v11) {
    goto LABEL_6;
  }
LABEL_7:
  id v12 = [(CAMControlStatusBar *)self delegate];
  [v12 controlStatusBar:self didChangeExpandingControl:v13 expanded:v6];
}

- (void)_iterateViewsForHUDManager:(id)a3 withItemFoundBlock:(id)a4
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v6 = a3;
  double v7 = (void (**)(id, uint64_t))a4;
  id v8 = [(CAMControlStatusBar *)self _expandedControl];

  if (v8)
  {
    uint64_t v9 = [(CAMControlStatusBar *)self _expandedControl];
LABEL_3:
    id v10 = (void *)v9;
    v7[2](v7, v9);

    goto LABEL_23;
  }
  [v6 locationOfAccessibilityGestureInView:self];
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v15 = [(CAMControlStatusBar *)self _allVisibleTypes];
  uint64_t v16 = [v15 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v30;
    while (2)
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v30 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v20 = *(void *)(*((void *)&v29 + 1) + 8 * v19);
        id v21 = [(CAMControlStatusBar *)self _statusIndicatorsByType];
        int64_t v22 = [v21 objectForKeyedSubscript:v20];

        [v22 frame];
        v35.double x = v12;
        v35.double y = v14;
        if (CGRectContainsPoint(v39, v35))
        {
          v7[2](v7, (uint64_t)v22);

          goto LABEL_22;
        }

        ++v19;
      }
      while (v17 != v19);
      uint64_t v17 = [v15 countByEnumeratingWithState:&v29 objects:v33 count:16];
      if (v17) {
        continue;
      }
      break;
    }
  }

  if ([(CAMControlStatusBar *)self isDirectionIndicatorVisible])
  {
    long long v23 = [(CAMControlStatusBar *)self directionIndicator];
    [v23 frame];
    v36.double x = v12;
    v36.double y = v14;
    BOOL v24 = CGRectContainsPoint(v40, v36);

    if (v24)
    {
      uint64_t v9 = [(CAMControlStatusBar *)self directionIndicator];
      goto LABEL_3;
    }
  }
  long long v15 = [(CAMControlStatusBar *)self primaryAccessoryControl];
  long long v25 = [(CAMControlStatusBar *)self secondaryAccessoryControl];
  if ([v15 conformsToProtocol:&unk_26BDEB7E8])
  {
    [v15 frame];
    v37.double x = v12;
    v37.double y = v14;
    BOOL v26 = CGRectContainsPoint(v41, v37);
    uint64_t v27 = (uint64_t)v15;
    if (v26) {
      goto LABEL_20;
    }
  }
  if ([v25 conformsToProtocol:&unk_26BDEB7E8])
  {
    [v25 frame];
    v38.double x = v12;
    v38.double y = v14;
    BOOL v28 = CGRectContainsPoint(v42, v38);
    uint64_t v27 = (uint64_t)v25;
    if (v28) {
LABEL_20:
    }
      v7[2](v7, v27);
  }

LABEL_22:
LABEL_23:
}

- (id)hudItemForAccessibilityHUDManager:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  CGFloat v12 = &v11;
  uint64_t v13 = 0x3032000000;
  CGFloat v14 = __Block_byref_object_copy__19;
  long long v15 = __Block_byref_object_dispose__19;
  id v16 = 0;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __57__CAMControlStatusBar_hudItemForAccessibilityHUDManager___block_invoke;
  v8[3] = &unk_263FA0458;
  id v10 = &v11;
  id v5 = v4;
  id v9 = v5;
  [(CAMControlStatusBar *)self _iterateViewsForHUDManager:v5 withItemFoundBlock:v8];
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

uint64_t __57__CAMControlStatusBar_hudItemForAccessibilityHUDManager___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 hudItemForAccessibilityHUDManager:*(void *)(a1 + 32)];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v5 = *(void *)(v4 + 40);
  *(void *)(v4 + 40) = v3;
  return MEMORY[0x270F9A758](v3, v5);
}

- (void)selectedByAccessibilityHUDManager:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __57__CAMControlStatusBar_selectedByAccessibilityHUDManager___block_invoke;
  v6[3] = &unk_263FA0480;
  id v7 = v4;
  id v5 = v4;
  [(CAMControlStatusBar *)self _iterateViewsForHUDManager:v5 withItemFoundBlock:v6];
}

uint64_t __57__CAMControlStatusBar_selectedByAccessibilityHUDManager___block_invoke(uint64_t a1, void *a2)
{
  return [a2 selectedByAccessibilityHUDManager:*(void *)(a1 + 32)];
}

- (CAMControlStatusBarDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CAMControlStatusBarDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSArray)primaryDesiredIndicatorTypes
{
  return self->_primaryDesiredIndicatorTypes;
}

- (NSArray)secondaryDesiredIndicatorTypes
{
  return self->_secondaryDesiredIndicatorTypes;
}

- (BOOL)isDirectionIndicatorVisible
{
  return self->_directionIndicatorVisible;
}

- (CAMDirectionalIndicator)directionIndicator
{
  return self->_directionIndicator;
}

- (UIView)primaryAccessoryControl
{
  return self->_primaryAccessoryControl;
}

- (UIView)secondaryAccessoryControl
{
  return self->_secondaryAccessoryControl;
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (NSMutableDictionary)_statusIndicatorsByType
{
  return self->__statusIndicatorsByType;
}

- (NSSet)_allVisibleTypes
{
  return self->__allVisibleTypes;
}

- (void)_setAllVisibleTypes:(id)a3
{
}

- (NSSet)_allDesiredTypes
{
  return self->__allDesiredTypes;
}

- (void)_setAllDesiredTypes:(id)a3
{
}

- (BOOL)_isDirectionIndicatorHiddenForSpace
{
  return self->__directionIndicatorHiddenForSpace;
}

- (CAMExpandingControl)_expandedControl
{
  return self->__expandedControl;
}

- (void)_setExpandedControl:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__expandedControl, 0);
  objc_storeStrong((id *)&self->__allDesiredTypes, 0);
  objc_storeStrong((id *)&self->__allVisibleTypes, 0);
  objc_storeStrong((id *)&self->__statusIndicatorsByType, 0);
  objc_storeStrong((id *)&self->_secondaryAccessoryControl, 0);
  objc_storeStrong((id *)&self->_primaryAccessoryControl, 0);
  objc_storeStrong((id *)&self->_directionIndicator, 0);
  objc_storeStrong((id *)&self->_secondaryDesiredIndicatorTypes, 0);
  objc_storeStrong((id *)&self->_primaryDesiredIndicatorTypes, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end