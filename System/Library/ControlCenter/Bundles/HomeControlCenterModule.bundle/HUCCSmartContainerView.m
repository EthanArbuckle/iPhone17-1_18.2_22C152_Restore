@interface HUCCSmartContainerView
- (BOOL)isShowingLockSecurity;
- (CGRect)compressedAnimationStartFrame;
- (HUCCInfoMosaicGridView)lockSecurityView;
- (HUCCSmartContainerView)initWithFrame:(CGRect)a3;
- (UIView)animationView;
- (UIView)compressedView;
- (UIView)expandedView;
- (void)didMoveToSuperview;
- (void)didMoveToWindow;
- (void)hideLockSecurity;
- (void)layoutSubviews;
- (void)resetToInitialState;
- (void)setAnimationView:(id)a3;
- (void)setCompressedAnimationStartFrame:(CGRect)a3;
- (void)setCompressedView:(id)a3;
- (void)setExpandedView:(id)a3;
- (void)setIsShowingLockSecurity:(BOOL)a3;
- (void)setLockSecurityView:(id)a3;
- (void)showLockSecurityWithFrameDelegate:(id)a3;
- (void)willMoveToExpandedStateWithAnimationStartFrame:(CGRect)a3;
@end

@implementation HUCCSmartContainerView

- (HUCCSmartContainerView)initWithFrame:(CGRect)a3
{
  v22.receiver = self;
  v22.super_class = (Class)HUCCSmartContainerView;
  v5 = -[HUCCSmartContainerView initWithFrame:](&v22, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v5)
  {
    v6 = objc_msgSend_clearColor(MEMORY[0x263F1C550], v3, v4);
    objc_msgSend_setBackgroundColor_(v5, v7, (uint64_t)v6);

    objc_msgSend_setClipsToBounds_(v5, v8, 0);
    v11 = objc_msgSend_controlCenterModuleBackgroundMaterial(MEMORY[0x263F33CA0], v9, v10);
    objc_msgSend_setAnimationView_(v5, v12, (uint64_t)v11);

    CCUICompactModuleContinuousCornerRadius();
    double v14 = v13;
    v17 = objc_msgSend_animationView(v5, v15, v16);
    objc_msgSend__setContinuousCornerRadius_(v17, v18, v19, v14);

    objc_msgSend_setIsShowingLockSecurity_(v5, v20, 0);
  }
  return v5;
}

- (void)didMoveToSuperview
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v10.receiver = self;
  v10.super_class = (Class)HUCCSmartContainerView;
  [(HUCCSmartContainerView *)&v10 didMoveToSuperview];
  v3 = HFLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = (objc_class *)objc_opt_class();
    v5 = NSStringFromClass(v4);
    v8 = objc_msgSend_window(self, v6, v7);
    v9 = @"yes";
    if (!v8) {
      v9 = @"no";
    }
    *(_DWORD *)buf = 138412802;
    v12 = v5;
    __int16 v13 = 2080;
    double v14 = "-[HUCCSmartContainerView didMoveToSuperview]";
    __int16 v15 = 2112;
    uint64_t v16 = v9;
    _os_log_impl(&dword_24065C000, v3, OS_LOG_TYPE_DEFAULT, "%@:%s — has window: %@", buf, 0x20u);
  }
}

- (void)didMoveToWindow
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v10.receiver = self;
  v10.super_class = (Class)HUCCSmartContainerView;
  [(HUCCSmartContainerView *)&v10 didMoveToWindow];
  v3 = HFLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = (objc_class *)objc_opt_class();
    v5 = NSStringFromClass(v4);
    v8 = objc_msgSend_window(self, v6, v7);
    v9 = @"yes";
    if (!v8) {
      v9 = @"no";
    }
    *(_DWORD *)buf = 138412802;
    v12 = v5;
    __int16 v13 = 2080;
    double v14 = "-[HUCCSmartContainerView didMoveToWindow]";
    __int16 v15 = 2112;
    uint64_t v16 = v9;
    _os_log_impl(&dword_24065C000, v3, OS_LOG_TYPE_DEFAULT, "%@:%s — has window: %@", buf, 0x20u);
  }
}

- (void)setCompressedView:(id)a3
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  uint64_t v4 = (UIView *)a3;
  v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (objc_class *)objc_opt_class();
    uint64_t v7 = NSStringFromClass(v6);
    compressedView = self->_compressedView;
    int v39 = 138413058;
    v40 = v7;
    __int16 v41 = 2080;
    v42 = "-[HUCCSmartContainerView setCompressedView:]";
    __int16 v43 = 2112;
    v44 = compressedView;
    __int16 v45 = 2112;
    v46 = v4;
    _os_log_impl(&dword_24065C000, v5, OS_LOG_TYPE_DEFAULT, "%@:%s, was %@ is %@", (uint8_t *)&v39, 0x2Au);
  }
  v11 = self->_compressedView;
  if (v11)
  {
    objc_msgSend_removeFromSuperview(v11, v9, v10);
    double v14 = objc_msgSend_animationView(self, v12, v13);
    objc_msgSend_removeFromSuperview(v14, v15, v16);
  }
  uint64_t v17 = self->_compressedView;
  self->_compressedView = v4;
  v18 = v4;

  objc_msgSend_addSubview_(self, v19, (uint64_t)self->_compressedView);
  objc_msgSend_bounds(self, v20, v21);
  double v23 = v22;
  double v25 = v24;
  double v27 = v26;
  double v29 = v28;
  v32 = objc_msgSend_compressedView(self, v30, v31);
  objc_msgSend_setFrame_(v32, v33, v34, v23, v25, v27, v29);

  v37 = objc_msgSend_animationView(self, v35, v36);
  objc_msgSend_insertSubview_aboveSubview_(self, v38, (uint64_t)v37, self->_compressedView);
}

- (void)setExpandedView:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = HFLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = (objc_class *)objc_opt_class();
    v8 = NSStringFromClass(v7);
    expandedView = self->_expandedView;
    int v23 = 138413058;
    double v24 = v8;
    __int16 v25 = 2080;
    double v26 = "-[HUCCSmartContainerView setExpandedView:]";
    __int16 v27 = 2112;
    double v28 = expandedView;
    __int16 v29 = 2112;
    id v30 = v5;
    _os_log_impl(&dword_24065C000, v6, OS_LOG_TYPE_DEFAULT, "%@:%s, was %@ is %@", (uint8_t *)&v23, 0x2Au);
  }
  p_expandedView = &self->_expandedView;
  uint64_t v13 = self->_expandedView;
  if (v13) {
    objc_msgSend_removeFromSuperview(v13, v10, v11);
  }
  objc_storeStrong((id *)p_expandedView, a3);
  if (*p_expandedView)
  {
    double v14 = HFLogForCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v15 = (objc_class *)objc_opt_class();
      uint64_t v16 = NSStringFromClass(v15);
      objc_msgSend_alpha(*p_expandedView, v17, v18);
      int v23 = 138413058;
      double v24 = v16;
      __int16 v25 = 2080;
      double v26 = "-[HUCCSmartContainerView setExpandedView:]";
      __int16 v27 = 2048;
      double v28 = v19;
      __int16 v29 = 2048;
      id v30 = 0;
      _os_log_impl(&dword_24065C000, v14, OS_LOG_TYPE_DEFAULT, "%@:%s, expandedView.alpha was %f is %f", (uint8_t *)&v23, 0x2Au);
    }
    objc_msgSend_setAlpha_(*p_expandedView, v20, v21, 0.0);
    objc_msgSend_addSubview_(self, v22, (uint64_t)*p_expandedView);
  }
}

- (void)willMoveToExpandedStateWithAnimationStartFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  uint64_t v7 = objc_msgSend_expandedView(self, a2, v3);
  objc_msgSend_setFrame_(v7, v8, v9, 0.0, 0.0, width, height);

  v12 = objc_msgSend_animationView(self, v10, v11);
  objc_msgSend_setFrame_(v12, v13, v14, 0.0, 0.0, width, height);

  MEMORY[0x270F9A6D0](self, sel_setCompressedAnimationStartFrame_, v15);
}

- (void)resetToInitialState
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  uint64_t v4 = objc_msgSend_animationView(self, a2, v2);
  objc_msgSend_setHidden_(v4, v5, 1);

  int isShowingLockSecurity = objc_msgSend_isShowingLockSecurity(self, v6, v7);
  uint64_t v9 = HFLogForCategory();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (isShowingLockSecurity)
  {
    if (v10)
    {
      uint64_t v11 = (objc_class *)objc_opt_class();
      v12 = NSStringFromClass(v11);
      uint64_t v15 = objc_msgSend_compressedView(self, v13, v14);
      objc_msgSend_alpha(v15, v16, v17);
      int v42 = 138413058;
      __int16 v43 = v12;
      __int16 v44 = 2080;
      __int16 v45 = "-[HUCCSmartContainerView resetToInitialState]";
      __int16 v46 = 2048;
      uint64_t v47 = v18;
      __int16 v48 = 2048;
      uint64_t v49 = 0;
      _os_log_impl(&dword_24065C000, v9, OS_LOG_TYPE_DEFAULT, "%@:%s, compressedView.alpha was %f is %f", (uint8_t *)&v42, 0x2Au);
    }
    uint64_t v21 = objc_msgSend_compressedView(self, v19, v20);
    objc_msgSend_setAlpha_(v21, v22, v23, 0.0);
  }
  else
  {
    if (v10)
    {
      double v24 = (objc_class *)objc_opt_class();
      __int16 v25 = NSStringFromClass(v24);
      double v28 = objc_msgSend_compressedView(self, v26, v27);
      objc_msgSend_alpha(v28, v29, v30);
      int v42 = 138413058;
      __int16 v43 = v25;
      __int16 v44 = 2080;
      __int16 v45 = "-[HUCCSmartContainerView resetToInitialState]";
      __int16 v46 = 2048;
      uint64_t v47 = v31;
      __int16 v48 = 2048;
      uint64_t v49 = 0x3FF0000000000000;
      _os_log_impl(&dword_24065C000, v9, OS_LOG_TYPE_DEFAULT, "%@:%s, compressedView.alpha was %f is %f", (uint8_t *)&v42, 0x2Au);
    }
    uint64_t v21 = objc_msgSend_compressedView(self, v32, v33);
    objc_msgSend_setAlpha_(v21, v34, v35, 1.0);
  }

  v38 = objc_msgSend_expandedView(self, v36, v37);
  objc_msgSend_setAlpha_(v38, v39, v40, 0.0);

  objc_msgSend_setExpandedView_(self, v41, 0);
}

- (void)showLockSecurityWithFrameDelegate:(id)a3
{
  uint64_t v65 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ((objc_msgSend_isShowingLockSecurity(self, v5, v6) & 1) == 0)
  {
    id v7 = objc_alloc(MEMORY[0x263F49B08]);
    BOOL v10 = objc_msgSend_initWithFrame_(v7, v8, v9, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    objc_msgSend_setLockSecurityView_(self, v11, (uint64_t)v10);

    uint64_t v14 = objc_msgSend_lockSecurityView(self, v12, v13);
    objc_msgSend_setFrameDelegate_(v14, v15, (uint64_t)v4);

    uint64_t v18 = objc_msgSend_lockSecurityView(self, v16, v17);
    objc_msgSend_setTranslatesAutoresizingMaskIntoConstraints_(v18, v19, 1);

    uint64_t v20 = HULocalizedModelString();
    uint64_t v23 = objc_msgSend_lockSecurityView(self, v21, v22);
    objc_msgSend_updateUIWithInfoText_andActionText_(v23, v24, (uint64_t)v20, &stru_26F4C88A0);

    objc_initWeak(&location, self);
    __int16 v25 = dispatch_get_global_queue(2, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = sub_240667A54;
    block[3] = &unk_2650CBFF8;
    objc_copyWeak(&v55, &location);
    id v26 = v20;
    id v54 = v26;
    dispatch_async(v25, block);

    __int16 v29 = objc_msgSend_layoutGeometry(HUCCSmartGridLayout, v27, v28);
    v32 = objc_msgSend_lockSecurityView(self, v30, v31);
    objc_msgSend_setMosaicLayoutGeometry_(v32, v33, (uint64_t)v29);

    uint64_t v36 = objc_msgSend_lockSecurityView(self, v34, v35);
    objc_msgSend_addSubview_(self, v37, (uint64_t)v36);

    v38 = HFLogForCategory();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      int v39 = (objc_class *)objc_opt_class();
      NSStringFromClass(v39);
      id v40 = (id)objc_claimAutoreleasedReturnValue();
      __int16 v43 = objc_msgSend_compressedView(self, v41, v42);
      objc_msgSend_alpha(v43, v44, v45);
      *(_DWORD *)buf = 138413058;
      id v58 = v40;
      __int16 v59 = 2080;
      v60 = "-[HUCCSmartContainerView showLockSecurityWithFrameDelegate:]";
      __int16 v61 = 2048;
      uint64_t v62 = v46;
      __int16 v63 = 2048;
      uint64_t v64 = 0;
      _os_log_impl(&dword_24065C000, v38, OS_LOG_TYPE_DEFAULT, "%@:%s, compressedView.alpha was %f is %f", buf, 0x2Au);
    }
    uint64_t v49 = objc_msgSend_compressedView(self, v47, v48);
    objc_msgSend_setAlpha_(v49, v50, v51, 0.0);

    objc_msgSend_setIsShowingLockSecurity_(self, v52, 1);
    objc_destroyWeak(&v55);
    objc_destroyWeak(&location);
  }
}

- (void)hideLockSecurity
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  if (objc_msgSend_isShowingLockSecurity(self, a2, v2))
  {
    id v4 = HFLogForCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = (objc_class *)objc_opt_class();
      uint64_t v6 = NSStringFromClass(v5);
      uint64_t v9 = objc_msgSend_compressedView(self, v7, v8);
      objc_msgSend_alpha(v9, v10, v11);
      int v25 = 138413058;
      id v26 = v6;
      __int16 v27 = 2080;
      uint64_t v28 = "-[HUCCSmartContainerView hideLockSecurity]";
      __int16 v29 = 2048;
      uint64_t v30 = v12;
      __int16 v31 = 2048;
      uint64_t v32 = 0x3FF0000000000000;
      _os_log_impl(&dword_24065C000, v4, OS_LOG_TYPE_DEFAULT, "%@:%s, compressedView.alpha was %f is %f", (uint8_t *)&v25, 0x2Au);
    }
    uint64_t v15 = objc_msgSend_compressedView(self, v13, v14);
    objc_msgSend_setAlpha_(v15, v16, v17, 1.0);

    uint64_t v20 = objc_msgSend_lockSecurityView(self, v18, v19);
    objc_msgSend_removeFromSuperview(v20, v21, v22);

    objc_msgSend_setLockSecurityView_(self, v23, 0);
    objc_msgSend_setIsShowingLockSecurity_(self, v24, 0);
  }
}

- (void)layoutSubviews
{
  v18.receiver = self;
  v18.super_class = (Class)HUCCSmartContainerView;
  [(HUCCSmartContainerView *)&v18 layoutSubviews];
  objc_msgSend_bounds(self, v3, v4);
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  uint64_t v15 = objc_msgSend_lockSecurityView(self, v13, v14);
  objc_msgSend_setFrame_(v15, v16, v17, v6, v8, v10, v12);
}

- (CGRect)compressedAnimationStartFrame
{
  double x = self->_compressedAnimationStartFrame.origin.x;
  double y = self->_compressedAnimationStartFrame.origin.y;
  double width = self->_compressedAnimationStartFrame.size.width;
  double height = self->_compressedAnimationStartFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setCompressedAnimationStartFrame:(CGRect)a3
{
  self->_compressedAnimationStartFrame = a3;
}

- (UIView)animationView
{
  return self->_animationView;
}

- (void)setAnimationView:(id)a3
{
}

- (UIView)compressedView
{
  return self->_compressedView;
}

- (UIView)expandedView
{
  return self->_expandedView;
}

- (BOOL)isShowingLockSecurity
{
  return self->_isShowingLockSecurity;
}

- (void)setIsShowingLockSecurity:(BOOL)a3
{
  self->_int isShowingLockSecurity = a3;
}

- (HUCCInfoMosaicGridView)lockSecurityView
{
  return self->_lockSecurityView;
}

- (void)setLockSecurityView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lockSecurityView, 0);
  objc_storeStrong((id *)&self->_expandedView, 0);
  objc_storeStrong((id *)&self->_compressedView, 0);

  objc_storeStrong((id *)&self->_animationView, 0);
}

@end