@interface CHUISWidgetHostViewControllerView
- (BOOL)showsLargeContentViewer;
- (CGSize)intrinsicContentSize;
- (CHUISWidgetHostViewController)parentController;
- (double)_currentDisplayScale;
- (id)accessibilityHUDRepresentation;
- (void)setFrame:(CGRect)a3;
- (void)setParentController:(id)a3;
@end

@implementation CHUISWidgetHostViewControllerView

- (double)_currentDisplayScale
{
  BSDispatchQueueAssertMain();
  v3 = [(CHUISWidgetHostViewControllerView *)self traitCollection];
  [v3 displayScale];
  double v5 = v4;

  return v5;
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  p_parentController = &self->_parentController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentController);
  v10 = [WeakRetained metrics];

  [(CHUISWidgetHostViewControllerView *)self _currentDisplayScale];
  objc_msgSend(v10, "_effectiveSizePixelAlignedForDisplayScale:");
  BOOL v13 = width == v12 && height == v11;
  if (v13
    || (id v14 = objc_loadWeakRetained((id *)p_parentController),
        char v15 = [v14 metricsDefineSize],
        v14,
        (v15 & 1) == 0))
  {
    v25.receiver = self;
    v25.super_class = (Class)CHUISWidgetHostViewControllerView;
    -[CHUISWidgetHostViewControllerView setFrame:](&v25, sel_setFrame_, x, y, width, height);
    v19 = CHUISLogViewController();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      id v20 = objc_loadWeakRetained((id *)p_parentController);
      v21 = [v20 _cachedSceneLogDigest];
      v33.double width = width;
      v33.double height = height;
      v22 = NSStringFromCGSize(v33);
      *(_DWORD *)buf = 134218498;
      id v27 = v20;
      __int16 v28 = 2114;
      v29 = v21;
      __int16 v30 = 2112;
      v31 = v22;
      _os_log_impl(&dword_1BC3F1000, v19, OS_LOG_TYPE_DEFAULT, "[%p-%{public}@] Changing frame to %@", buf, 0x20u);
    }
    id v23 = objc_loadWeakRetained((id *)p_parentController);
    objc_msgSend(v23, "setPreferredContentSize:", width, height);

    v16 = objc_loadWeakRetained((id *)p_parentController);
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __46__CHUISWidgetHostViewControllerView_setFrame___block_invoke;
    v24[3] = &__block_descriptor_64_e78___UIApplicationSceneTransitionContext_16__0__CHUISMutableWidgetSceneSettings_8l;
    *(double *)&v24[4] = x;
    *(double *)&v24[5] = y;
    *(double *)&v24[6] = width;
    *(double *)&v24[7] = height;
    [v16 modifySceneSettings:v24];
  }
  else
  {
    v16 = CHUISLogViewController();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      id v17 = objc_loadWeakRetained((id *)p_parentController);
      v18 = [v17 _cachedSceneLogDigest];
      *(_DWORD *)buf = 134218242;
      id v27 = v17;
      __int16 v28 = 2114;
      v29 = v18;
      _os_log_impl(&dword_1BC3F1000, v16, OS_LOG_TYPE_DEFAULT, "[%p-%{public}@] Eating frame change in view because not configured to change the frame.", buf, 0x16u);
    }
  }
}

id __46__CHUISWidgetHostViewControllerView_setFrame___block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "setFrame:", 0.0, 0.0, *(double *)(a1 + 48), *(double *)(a1 + 56));
  if ([MEMORY[0x1E4FB1EB0] _isInAnimationBlockWithAnimationsEnabled])
  {
    id v2 = objc_alloc_init(MEMORY[0x1E4FB1458]);
    v3 = [MEMORY[0x1E4FB1B70] _synchronizedDrawingFence];
    [v2 setAnimationFence:v3];
  }
  else
  {
    id v2 = 0;
  }

  return v2;
}

- (CGSize)intrinsicContentSize
{
  v3 = [(CHUISWidgetHostViewControllerView *)self parentController];
  int v4 = [v3 metricsDefineSize];

  if (v4)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_parentController);
    v6 = [WeakRetained metrics];

    [(CHUISWidgetHostViewControllerView *)self _currentDisplayScale];
    objc_msgSend(v6, "_effectiveSizePixelAlignedForDisplayScale:");
    double v8 = v7;
    double v10 = v9;
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)CHUISWidgetHostViewControllerView;
    [(CHUISWidgetHostViewControllerView *)&v15 intrinsicContentSize];
    double v8 = v11;
    double v10 = v12;
  }
  double v13 = v8;
  double v14 = v10;
  result.double height = v14;
  result.double width = v13;
  return result;
}

- (BOOL)showsLargeContentViewer
{
  return 1;
}

- (id)accessibilityHUDRepresentation
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentController);
  int v4 = [WeakRetained _snapshotViewIgnoringVibrancyEffect:1];

  [v4 setAutoresizingMask:18];
  [v4 setContentMode:1];
  double v5 = [(CHUISWidgetHostViewControllerView *)self traitCollection];
  uint64_t v6 = [v5 userInterfaceStyle];

  id v7 = objc_alloc(MEMORY[0x1E4F4F8E8]);
  if (v6 == 2) {
    uint64_t v8 = 2;
  }
  else {
    uint64_t v8 = 1;
  }
  double v9 = (void *)[v7 initWithEffectType:0 backgroundType:v8 color:0];
  id v10 = objc_alloc(MEMORY[0x1E4F4F8F0]);
  [v4 bounds];
  double v11 = objc_msgSend(v10, "initWithFrame:");
  [v11 setConfiguration:v9];
  double v12 = [v11 contentView];
  [v12 addSubview:v4];

  double v13 = (void *)[objc_alloc(MEMORY[0x1E4FB13E0]) initWithCustomView:v11];

  return v13;
}

- (CHUISWidgetHostViewController)parentController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentController);

  return (CHUISWidgetHostViewController *)WeakRetained;
}

- (void)setParentController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end