@interface MTCCRoundButton
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (MTCCRoundButton)init;
- (NSString)title;
- (UIImage)image;
- (UIImageView)imageView;
- (UILabel)titleLabel;
- (UIView)backgroundView;
- (UIView)containerView;
- (UIView)highlightView;
- (UIView)normalStateBackgroundView;
- (UIView)selectedStateBackgroundView;
- (void)_dragEnter:(id)a3;
- (void)_dragExit:(id)a3;
- (void)_touchDown:(id)a3;
- (void)_touchUpInside:(id)a3;
- (void)_touchUpOutside:(id)a3;
- (void)_updateCornerRadius;
- (void)_updateForStateChange;
- (void)dealloc;
- (void)handleContentSizeChange:(id)a3;
- (void)layoutSubviews;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setBackgroundColor:(id)a3 forState:(unint64_t)a4;
- (void)setBackgroundMaterialView:(id)a3 forState:(unint64_t)a4;
- (void)setBackgroundView:(id)a3;
- (void)setContainerView:(id)a3;
- (void)setHighlightView:(id)a3;
- (void)setImage:(id)a3;
- (void)setImageView:(id)a3;
- (void)setNormalStateBackgroundView:(id)a3;
- (void)setSelectedStateBackgroundView:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTitleLabel:(id)a3;
@end

@implementation MTCCRoundButton

- (MTCCRoundButton)init
{
  uint64_t v118 = *MEMORY[0x263EF8340];
  v114.receiver = self;
  v114.super_class = (Class)MTCCRoundButton;
  double v2 = *MEMORY[0x263F001A8];
  double v3 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v4 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v5 = *(double *)(MEMORY[0x263F001A8] + 24);
  id v6 = -[MTCCRoundButton initWithFrame:](&v114, sel_initWithFrame_, *MEMORY[0x263F001A8], v3, v4, v5);
  if (v6)
  {
    v7 = MTLogForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v117 = v6;
      _os_log_impl(&dword_2406B2000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ initialized", buf, 0xCu);
    }

    id v8 = objc_alloc(MEMORY[0x263F1CB60]);
    objc_msgSend_bounds(v6, v9, v10);
    uint64_t v13 = objc_msgSend_initWithFrame_(v8, v11, v12);
    v14 = (void *)*((void *)v6 + 57);
    *((void *)v6 + 57) = v13;

    objc_msgSend_setAutoresizingMask_(*((void **)v6 + 57), v15, 18);
    v18 = objc_msgSend_clearColor(MEMORY[0x263F1C550], v16, v17);
    objc_msgSend_setBackgroundColor_(*((void **)v6 + 57), v19, (uint64_t)v18);

    objc_msgSend_setUserInteractionEnabled_(*((void **)v6 + 57), v20, 0);
    objc_msgSend_addSubview_(v6, v21, *((void *)v6 + 57));
    id v22 = objc_alloc(MEMORY[0x263F1CB98]);
    objc_msgSend_bounds(v6, v23, v24);
    v27 = objc_msgSend_initWithFrame_(v22, v25, v26);
    v29 = objc_msgSend_effectWithStyle_(MEMORY[0x263F1C480], v28, 1);
    v115 = v29;
    v31 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v30, (uint64_t)&v115, 1);
    objc_msgSend_setBackgroundEffects_(v27, v32, (uint64_t)v31);

    objc_msgSend_setAutoresizingMask_(v27, v33, 18);
    objc_msgSend_setUserInteractionEnabled_(v27, v34, 0);
    v35 = (void *)*((void *)v6 + 58);
    *((void *)v6 + 58) = v27;
    id v36 = v27;

    objc_msgSend_addSubview_(*((void **)v6 + 57), v37, *((void *)v6 + 58));
    id v38 = objc_alloc(MEMORY[0x263F1CB60]);
    objc_msgSend_bounds(v6, v39, v40);
    uint64_t v43 = objc_msgSend_initWithFrame_(v38, v41, v42);
    v44 = (void *)*((void *)v6 + 59);
    *((void *)v6 + 59) = v43;

    objc_msgSend_setAutoresizingMask_(*((void **)v6 + 59), v45, 18);
    objc_msgSend_setUserInteractionEnabled_(*((void **)v6 + 59), v46, 0);
    objc_msgSend_addSubview_(*((void **)v6 + 57), v47, *((void *)v6 + 59));
    id v48 = objc_alloc(MEMORY[0x263F1CB60]);
    objc_msgSend_bounds(v6, v49, v50);
    uint64_t v53 = objc_msgSend_initWithFrame_(v48, v51, v52);
    v54 = (void *)*((void *)v6 + 60);
    *((void *)v6 + 60) = v53;

    objc_msgSend_setAutoresizingMask_(*((void **)v6 + 60), v55, 18);
    objc_msgSend_setUserInteractionEnabled_(*((void **)v6 + 60), v56, 0);
    objc_msgSend_setAlpha_(*((void **)v6 + 60), v57, v58, 0.0);
    objc_msgSend_addSubview_(*((void **)v6 + 57), v59, *((void *)v6 + 60));
    id v60 = objc_alloc(MEMORY[0x263F1CB60]);
    objc_msgSend_bounds(v6, v61, v62);
    uint64_t v65 = objc_msgSend_initWithFrame_(v60, v63, v64);
    v66 = (void *)*((void *)v6 + 61);
    *((void *)v6 + 61) = v65;

    objc_msgSend_setAutoresizingMask_(*((void **)v6 + 61), v67, 18);
    objc_msgSend_setUserInteractionEnabled_(*((void **)v6 + 61), v68, 0);
    objc_msgSend_setAlpha_(*((void **)v6 + 61), v69, v70, 0.0);
    objc_msgSend_addSubview_(*((void **)v6 + 57), v71, *((void *)v6 + 61));
    id v72 = objc_alloc(MEMORY[0x263F1C768]);
    uint64_t v75 = objc_msgSend_initWithFrame_(v72, v73, v74, v2, v3, v4, v5);
    v76 = (void *)*((void *)v6 + 62);
    *((void *)v6 + 62) = v75;

    v78 = objc_msgSend_preferredFontDescriptorWithTextStyle_addingSymbolicTraits_options_(MEMORY[0x263F1C660], v77, *MEMORY[0x263F1D2B8], 2, 0);
    v79 = (void *)MEMORY[0x263F1C658];
    objc_msgSend_pointSize(v78, v80, v81);
    v83 = objc_msgSend_fontWithDescriptor_size_(v79, v82, (uint64_t)v78);
    objc_msgSend_setFont_(*((void **)v6 + 62), v84, (uint64_t)v83);

    v87 = objc_msgSend_whiteColor(MEMORY[0x263F1C550], v85, v86);
    objc_msgSend_setTextColor_(*((void **)v6 + 62), v88, (uint64_t)v87);

    objc_msgSend_setTextAlignment_(*((void **)v6 + 62), v89, 1);
    objc_msgSend_setClipsToBounds_(*((void **)v6 + 62), v90, 0);
    objc_msgSend_setAdjustsFontSizeToFitWidth_(*((void **)v6 + 62), v91, 1);
    objc_msgSend_setBaselineAdjustment_(*((void **)v6 + 62), v92, 1);
    objc_msgSend_addSubview_(*((void **)v6 + 57), v93, *((void *)v6 + 62));
    id v94 = objc_alloc(MEMORY[0x263F1C6D0]);
    uint64_t v97 = objc_msgSend_initWithFrame_(v94, v95, v96, v2, v3, v4, v5);
    v98 = (void *)*((void *)v6 + 63);
    *((void *)v6 + 63) = v97;

    objc_msgSend_setUserInteractionEnabled_(*((void **)v6 + 63), v99, 0);
    objc_msgSend_addSubview_(*((void **)v6 + 57), v100, *((void *)v6 + 63));
    objc_msgSend_addTarget_action_forControlEvents_(v6, v101, (uint64_t)v6, sel__touchDown_, 1);
    objc_msgSend_addTarget_action_forControlEvents_(v6, v102, (uint64_t)v6, sel__touchUpInside_, 64);
    objc_msgSend_addTarget_action_forControlEvents_(v6, v103, (uint64_t)v6, sel__touchUpOutside_, 128);
    objc_msgSend_addTarget_action_forControlEvents_(v6, v104, (uint64_t)v6, sel__dragEnter_, 16);
    objc_msgSend_addTarget_action_forControlEvents_(v6, v105, (uint64_t)v6, sel__dragExit_, 32);
    objc_msgSend_addObserver_forKeyPath_options_context_(v6, v106, (uint64_t)v6, @"enabled", 0, 0);
    objc_msgSend_addObserver_forKeyPath_options_context_(v6, v107, (uint64_t)v6, @"highlighted", 0, 0);
    objc_msgSend_addObserver_forKeyPath_options_context_(v6, v108, (uint64_t)v6, @"selected", 0, 0);
    v111 = objc_msgSend_defaultCenter(MEMORY[0x263F08A00], v109, v110);
    objc_msgSend_addObserver_selector_name_object_(v111, v112, (uint64_t)v6, sel_handleContentSizeChange_, *MEMORY[0x263F1D158], 0);
  }
  return (MTCCRoundButton *)v6;
}

- (void)dealloc
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  double v3 = MTLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v9 = self;
    _os_log_impl(&dword_2406B2000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ deallocing", buf, 0xCu);
  }

  objc_msgSend_removeObserver_forKeyPath_(self, v4, (uint64_t)self, @"enabled");
  objc_msgSend_removeObserver_forKeyPath_(self, v5, (uint64_t)self, @"highlighted");
  objc_msgSend_removeObserver_forKeyPath_(self, v6, (uint64_t)self, @"selected");
  v7.receiver = self;
  v7.super_class = (Class)MTCCRoundButton;
  [(MTCCRoundButton *)&v7 dealloc];
}

- (void)setTitle:(id)a3
{
  id v4 = a3;
  objc_super v7 = objc_msgSend_titleLabel(self, v5, v6);
  objc_msgSend_setText_(v7, v8, (uint64_t)v4);

  objc_msgSend_setNeedsLayout(self, v9, v10);
}

- (NSString)title
{
  double v3 = objc_msgSend_titleLabel(self, a2, v2);
  uint64_t v6 = objc_msgSend_text(v3, v4, v5);

  return (NSString *)v6;
}

- (void)setBackgroundColor:(id)a3 forState:(unint64_t)a4
{
  uint64_t v6 = (const char *)a3;
  objc_super v7 = v6;
  if (a4)
  {
    if (a4 == 4)
    {
      id v8 = &OBJC_IVAR___MTCCRoundButton__selectedStateBackgroundView;
    }
    else
    {
      if (a4 != 1) {
        goto LABEL_8;
      }
      id v8 = &OBJC_IVAR___MTCCRoundButton__highlightView;
    }
  }
  else
  {
    id v8 = &OBJC_IVAR___MTCCRoundButton__normalStateBackgroundView;
  }
  v9 = v6;
  uint64_t v6 = (const char *)objc_msgSend_setBackgroundColor_(*(void **)((char *)&self->super.super.super.super.isa + *v8), v6, (uint64_t)v6);
  objc_super v7 = v9;
LABEL_8:

  MEMORY[0x270F9A758](v6, v7);
}

- (void)setBackgroundMaterialView:(id)a3 forState:(unint64_t)a4
{
  id v7 = a3;
  if (v7)
  {
    if (a4 == 4)
    {
      id v22 = v7;
      objc_msgSend_removeFromSuperview(self->_selectedStateBackgroundView, v8, v9);
      objc_storeStrong((id *)&self->_selectedStateBackgroundView, a3);
      objc_msgSend_setAutoresizingMask_(self->_selectedStateBackgroundView, v14, 18);
      objc_msgSend_setUserInteractionEnabled_(self->_selectedStateBackgroundView, v15, 0);
      objc_msgSend_setAlpha_(self->_selectedStateBackgroundView, v16, v17, 0.0);
      objc_msgSend_insertSubview_aboveSubview_(self->_containerView, v18, (uint64_t)self->_selectedStateBackgroundView, self->_normalStateBackgroundView);
    }
    else if (a4 == 1)
    {
      id v22 = v7;
      objc_msgSend_removeFromSuperview(self->_normalStateBackgroundView, v8, v9);
      objc_storeStrong((id *)&self->_normalStateBackgroundView, a3);
      objc_msgSend_setAutoresizingMask_(self->_normalStateBackgroundView, v19, 18);
      objc_msgSend_setUserInteractionEnabled_(self->_normalStateBackgroundView, v20, 0);
      objc_msgSend_insertSubview_aboveSubview_(self->_containerView, v21, (uint64_t)self->_normalStateBackgroundView, self->_backgroundView);
    }
    else
    {
      if (a4) {
        goto LABEL_9;
      }
      id v22 = v7;
      objc_msgSend_removeFromSuperview(self->_backgroundView, v8, v9);
      objc_storeStrong((id *)&self->_backgroundView, a3);
      objc_msgSend_setAutoresizingMask_(self->_backgroundView, v10, 18);
      objc_msgSend_setUserInteractionEnabled_(self->_backgroundView, v11, 0);
      objc_msgSend_addSubview_(self->_containerView, v12, (uint64_t)self->_backgroundView);
      objc_msgSend_sendSubviewToBack_(self->_containerView, v13, (uint64_t)self->_backgroundView);
    }
    id v7 = v22;
  }
LABEL_9:
}

- (void)setImage:(id)a3
{
  id v4 = a3;
  objc_msgSend_imageView(self, v5, v6);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setImage_(v8, v7, (uint64_t)v4);
}

- (UIImage)image
{
  double v3 = objc_msgSend_imageView(self, a2, v2);
  uint64_t v6 = objc_msgSend_image(v3, v4, v5);

  return (UIImage *)v6;
}

- (void)layoutSubviews
{
  v68.receiver = self;
  v68.super_class = (Class)MTCCRoundButton;
  [(MTCCRoundButton *)&v68 layoutSubviews];
  objc_msgSend__updateCornerRadius(self, v3, v4);
  objc_msgSend_bounds(self, v5, v6);
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  uint64_t v17 = objc_msgSend_titleLabel(self, v15, v16);
  objc_msgSend_sizeToFit(v17, v18, v19);

  id v22 = objc_msgSend_titleLabel(self, v20, v21);
  objc_msgSend_frame(v22, v23, v24);
  double v66 = v26;
  CGFloat v67 = v25;
  CGFloat v28 = v27;
  CGFloat v30 = v29;

  v33 = objc_msgSend_traitCollection(self, v31, v32);
  objc_msgSend_preferredContentSizeCategory(v33, v34, v35);
  id v36 = (NSString *)objc_claimAutoreleasedReturnValue();
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v36);

  if (IsAccessibilityCategory)
  {
    objc_msgSend_frame(self, v38, v39);
    double v41 = v40 + -48.0;
  }
  else
  {
    v69.size.height = v66;
    v69.origin.x = v67;
    v69.origin.y = v28;
    v69.size.width = v30;
    double Width = CGRectGetWidth(v69);
    v70.origin.x = v8;
    v70.origin.y = v10;
    v70.size.width = v12;
    v70.size.height = v14;
    double v41 = fmin(Width, CGRectGetWidth(v70));
  }
  v71.origin.x = v8;
  v71.origin.y = v10;
  v71.size.width = v12;
  v71.size.height = v14;
  CGRectGetMidX(v71);
  CGFloat v65 = v8;
  v72.origin.x = v67;
  v72.origin.y = v28;
  v72.size.width = v41;
  v72.size.height = v66;
  CGRectGetWidth(v72);
  v73.size.width = v12;
  v73.origin.x = v8;
  v73.origin.y = v10;
  v73.size.height = v14;
  CGRectGetMidY(v73);
  CGFloat v43 = v10;
  v74.origin.x = v67;
  v74.origin.y = v28;
  v74.size.width = v41;
  v74.size.height = v66;
  CGRectGetHeight(v74);
  UIPointIntegral();
  double v45 = v44;
  double v47 = v46;
  uint64_t v50 = objc_msgSend_titleLabel(self, v48, v49);
  objc_msgSend_setFrame_(v50, v51, v52, v45, v47, v41, v66);

  v55 = objc_msgSend_imageView(self, v53, v54);
  objc_msgSend_sizeToFit(v55, v56, v57);

  v75.origin.x = v65;
  v75.origin.y = v43;
  v75.size.width = v12;
  v75.size.height = v14;
  double MidX = CGRectGetMidX(v75);
  v76.origin.x = v65;
  v76.origin.y = v43;
  v76.size.width = v12;
  v76.size.height = v14;
  double MidY = CGRectGetMidY(v76);
  uint64_t v62 = objc_msgSend_imageView(self, v60, v61);
  objc_msgSend_setCenter_(v62, v63, v64, MidX, MidY);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3 = 80.0;
  double v4 = 80.0;
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)intrinsicContentSize
{
  ((void (*)(MTCCRoundButton *, char *))MEMORY[0x270F9A6D0])(self, sel_sizeThatFits_);
  result.height = v3;
  result.width = v2;
  return result;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  objc_msgSend_view(v4, v5, v6);
  double v9 = (MTCCRoundButton *)objc_claimAutoreleasedReturnValue();
  if (v9 == self)
  {
    char isDescendantOfView = 1;
  }
  else
  {
    CGFloat v10 = objc_msgSend_view(v4, v7, v8);
    char isDescendantOfView = objc_msgSend_isDescendantOfView_(v10, v11, (uint64_t)self);
  }
  return isDescendantOfView;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v12 = a3;
  double v9 = (MTCCRoundButton *)a4;
  if (v9 == self
    && ((objc_msgSend_isEqualToString_(v12, v8, @"selected") & 1) != 0
     || (objc_msgSend_isEqualToString_(v12, v10, @"enabled") & 1) != 0
     || objc_msgSend_isEqualToString_(v12, v10, @"highlighted")))
  {
    objc_msgSend__updateForStateChange(v9, v10, v11);
  }
}

- (void)handleContentSizeChange:(id)a3
{
  objc_msgSend_preferredFontDescriptorWithTextStyle_addingSymbolicTraits_options_(MEMORY[0x263F1C660], a2, *MEMORY[0x263F1D2B8], 2, 0);
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  id v4 = (void *)MEMORY[0x263F1C658];
  objc_msgSend_pointSize(v15, v5, v6);
  uint64_t v8 = objc_msgSend_fontWithDescriptor_size_(v4, v7, (uint64_t)v15);
  uint64_t v11 = objc_msgSend_titleLabel(self, v9, v10);
  objc_msgSend_setFont_(v11, v12, (uint64_t)v8);

  objc_msgSend_setNeedsLayout(self, v13, v14);
}

- (void)_updateCornerRadius
{
  objc_msgSend_bounds(self, a2, v2);
  CGFloat x = v57.origin.x;
  CGFloat y = v57.origin.y;
  CGFloat width = v57.size.width;
  CGFloat height = v57.size.height;
  double v8 = CGRectGetWidth(v57);
  v58.origin.CGFloat x = x;
  v58.origin.CGFloat y = y;
  v58.size.CGFloat width = width;
  v58.size.CGFloat height = height;
  double v9 = CGRectGetHeight(v58);
  double v10 = fmin(v8, v9) * 0.5;
  double v13 = objc_msgSend_containerView(self, v11, v12);
  uint64_t v16 = v13;
  if (v8 == v9)
  {
    objc_msgSend__setCornerRadius_(v13, v14, v15, v10);

    uint64_t v19 = objc_msgSend_backgroundView(self, v17, v18);
    objc_msgSend__setCornerRadius_(v19, v20, v21, v10);

    uint64_t v24 = objc_msgSend_normalStateBackgroundView(self, v22, v23);
    objc_msgSend__setCornerRadius_(v24, v25, v26, v10);

    double v29 = objc_msgSend_selectedStateBackgroundView(self, v27, v28);
    objc_msgSend__setCornerRadius_(v29, v30, v31, v10);

    objc_msgSend_highlightView(self, v32, v33);
    id v55 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend__setCornerRadius_(v55, v34, v35, v10);
  }
  else
  {
    objc_msgSend__setContinuousCornerRadius_(v13, v14, v15, v10);

    id v38 = objc_msgSend_backgroundView(self, v36, v37);
    objc_msgSend__setContinuousCornerRadius_(v38, v39, v40, v10);

    CGFloat v43 = objc_msgSend_normalStateBackgroundView(self, v41, v42);
    objc_msgSend__setContinuousCornerRadius_(v43, v44, v45, v10);

    id v48 = objc_msgSend_selectedStateBackgroundView(self, v46, v47);
    objc_msgSend__setContinuousCornerRadius_(v48, v49, v50, v10);

    objc_msgSend_highlightView(self, v51, v52);
    id v55 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend__setContinuousCornerRadius_(v55, v53, v54, v10);
  }
}

- (void)_touchDown:(id)a3
{
}

- (void)_touchUpInside:(id)a3
{
}

- (void)_touchUpOutside:(id)a3
{
}

- (void)_dragEnter:(id)a3
{
}

- (void)_dragExit:(id)a3
{
}

- (void)_updateForStateChange
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = sub_2406B6A00;
  v2[3] = &unk_2650CFC20;
  v2[4] = self;
  objc_msgSend_animateWithDuration_animations_(MEMORY[0x263F1CB60], a2, (uint64_t)v2, 0.25);
}

- (UIView)containerView
{
  return self->_containerView;
}

- (void)setContainerView:(id)a3
{
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
}

- (UIView)normalStateBackgroundView
{
  return self->_normalStateBackgroundView;
}

- (void)setNormalStateBackgroundView:(id)a3
{
}

- (UIView)selectedStateBackgroundView
{
  return self->_selectedStateBackgroundView;
}

- (void)setSelectedStateBackgroundView:(id)a3
{
}

- (UIView)highlightView
{
  return self->_highlightView;
}

- (void)setHighlightView:(id)a3
{
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_highlightView, 0);
  objc_storeStrong((id *)&self->_selectedStateBackgroundView, 0);
  objc_storeStrong((id *)&self->_normalStateBackgroundView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);

  objc_storeStrong((id *)&self->_containerView, 0);
}

@end