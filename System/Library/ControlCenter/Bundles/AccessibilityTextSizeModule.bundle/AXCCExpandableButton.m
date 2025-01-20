@interface AXCCExpandableButton
+ (double)collapsedHeightWithImageHeight:(double)a3 maximumHeight:(double)a4;
- (AXCCExpandableButton)initWithFrame:(CGRect)a3;
- (AXCCExpandableButtonOption)selectedOption;
- (AXCCVisualStylingProvider)stylingProvider;
- (BOOL)accessibilityRespondsToUserInteraction;
- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (BOOL)displayMessage;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)isAccessibilityElement;
- (BOOL)isAnimating;
- (BOOL)isControlCenter;
- (BOOL)isExpanded;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (BOOL)resetTracking;
- (BOOL)toggleEnabled;
- (CGSize)buttonImageSize;
- (CGSize)maximumExpandedSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSArray)options;
- (NSMutableArray)buttons;
- (NSString)title;
- (NSTimer)messageTimer;
- (UILabel)messageLabel;
- (UILabel)subtitleLabel;
- (UILabel)titleLabel;
- (UIView)backgroundView;
- (UIView)clippingView;
- (UIView)overlaySelectionView;
- (UIView)selectionView;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (id)initForControlCenter;
- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5;
- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4;
- (int64_t)_buttonLayoutAxis;
- (int64_t)axis;
- (int64_t)selectedOptionIndex;
- (unint64_t)accessibilityTraits;
- (void)_animateGlyphStateSelected:(BOOL)a3;
- (void)_layoutLabels;
- (void)_layoutSelectionView;
- (void)_resetSelectionView;
- (void)_springAnimate:(id)a3;
- (void)_updateButtonsVisiblity;
- (void)_updateSelectionVisiblity;
- (void)cancelTrackingWithEvent:(id)a3;
- (void)didTapButton:(id)a3;
- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (void)layoutSubviews;
- (void)pointerInteraction:(id)a3 willEnterRegion:(id)a4 animator:(id)a5;
- (void)pointerInteraction:(id)a3 willExitRegion:(id)a4 animator:(id)a5;
- (void)setAnimating:(BOOL)a3;
- (void)setAxis:(int64_t)a3;
- (void)setBackgroundView:(id)a3;
- (void)setButtonImageSize:(CGSize)a3;
- (void)setButtons:(id)a3;
- (void)setClippingView:(id)a3;
- (void)setContentVerticalAlignment:(int64_t)a3;
- (void)setDisplayMessage:(BOOL)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setExpanded:(BOOL)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setIsControlCenter:(BOOL)a3;
- (void)setMaximumExpandedSize:(CGSize)a3;
- (void)setMessageLabel:(id)a3;
- (void)setMessageTimer:(id)a3;
- (void)setOptions:(id)a3;
- (void)setOverlaySelectionView:(id)a3;
- (void)setResetTracking:(BOOL)a3;
- (void)setSelectedOptionIndex:(int64_t)a3;
- (void)setSelectionView:(id)a3;
- (void)setStylingProvider:(id)a3;
- (void)setSubtitleLabel:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setToggleEnabled:(BOOL)a3;
- (void)showMessage:(id)a3;
- (void)updateContentSizeCategory;
- (void)updateVisualStyling;
@end

@implementation AXCCExpandableButton

- (id)initForControlCenter
{
  uint64_t v7 = objc_msgSend_initWithFrame_(self, a2, v2, v3, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  if (v7)
  {
    v8 = objc_msgSend_controlCenterDarkMaterial(MEMORY[0x263F33CA0], v4, v5, v6);
    objc_msgSend_setBackgroundView_((void *)v7, v9, (uint64_t)v8, v10);

    objc_msgSend_controlCenterApplyPrimaryContentShadow(*(void **)(v7 + 544), v11, v12, v13);
    objc_msgSend_controlCenterApplyPrimaryContentShadow(*(void **)(v7 + 552), v14, v15, v16);
    objc_msgSend_controlCenterApplyPrimaryContentShadow(*(void **)(v7 + 560), v17, v18, v19);
    *(unsigned char *)(v7 + 461) = 1;
  }
  return (id)v7;
}

- (AXCCExpandableButton)initWithFrame:(CGRect)a3
{
  v145.receiver = self;
  v145.super_class = (Class)AXCCExpandableButton;
  id v6 = -[AXCCExpandableButton initWithFrame:](&v145, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v6)
  {
    uint64_t v7 = objc_msgSend_array(MEMORY[0x263EFF980], v3, v4, v5);
    v8 = (void *)*((void *)v6 + 63);
    *((void *)v6 + 63) = v7;

    *((void *)v6 + 59) = 0x7FFFFFFFFFFFFFFFLL;
    objc_msgSend_setContentVerticalAlignment_(v6, v9, 0, v10);
    id v11 = objc_alloc(MEMORY[0x263F82E00]);
    double v12 = *MEMORY[0x263F001A8];
    double v13 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v14 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v15 = *(double *)(MEMORY[0x263F001A8] + 24);
    uint64_t v19 = objc_msgSend_initWithFrame_(v11, v16, v17, v18, *MEMORY[0x263F001A8], v13, v14, v15);
    v20 = (void *)*((void *)v6 + 64);
    *((void *)v6 + 64) = v19;

    v24 = objc_msgSend_systemGroupedBackgroundColor(MEMORY[0x263F825C8], v21, v22, v23);
    objc_msgSend_setBackgroundColor_(*((void **)v6 + 64), v25, (uint64_t)v24, v26);

    objc_msgSend_addSubview_(v6, v27, *((void *)v6 + 64), v28);
    uint64_t v29 = objc_opt_new();
    v30 = (void *)*((void *)v6 + 67);
    *((void *)v6 + 67) = v29;

    objc_msgSend_setUserInteractionEnabled_(*((void **)v6 + 67), v31, 0, v32);
    objc_msgSend_setClipsToBounds_(*((void **)v6 + 67), v33, 1, v34);
    objc_msgSend_addSubview_(v6, v35, *((void *)v6 + 67), v36);
    id v37 = objc_alloc(MEMORY[0x263F82E00]);
    uint64_t v41 = objc_msgSend_initWithFrame_(v37, v38, v39, v40, v12, v13, v14, v15);
    v42 = (void *)*((void *)v6 + 66);
    *((void *)v6 + 66) = v41;

    objc_msgSend_addSubview_(*((void **)v6 + 67), v43, *((void *)v6 + 66), v44);
    id v45 = objc_alloc(MEMORY[0x263F82E00]);
    uint64_t v49 = objc_msgSend_initWithFrame_(v45, v46, v47, v48, v12, v13, v14, v15);
    v50 = (void *)*((void *)v6 + 65);
    *((void *)v6 + 65) = v49;

    v54 = objc_msgSend_whiteColor(MEMORY[0x263F825C8], v51, v52, v53);
    objc_msgSend_setBackgroundColor_(*((void **)v6 + 65), v55, (uint64_t)v54, v56);

    objc_msgSend__setDrawsAsBackdropOverlayWithBlendMode_(*((void **)v6 + 65), v57, 2, v58);
    objc_msgSend_addSubview_(*((void **)v6 + 66), v59, *((void *)v6 + 65), v60);
    id v61 = objc_alloc(MEMORY[0x263F828E0]);
    uint64_t v65 = objc_msgSend_initWithFrame_(v61, v62, v63, v64, v12, v13, v14, v15);
    v66 = (void *)*((void *)v6 + 68);
    *((void *)v6 + 68) = v65;

    objc_msgSend_setNumberOfLines_(*((void **)v6 + 68), v67, 2, v68);
    objc_msgSend_setTextAlignment_(*((void **)v6 + 68), v69, 1, v70);
    LODWORD(v71) = 1051931443;
    objc_msgSend__setHyphenationFactor_(*((void **)v6 + 68), v72, v73, v74, v71);
    v78 = objc_msgSend_labelColor(MEMORY[0x263F825C8], v75, v76, v77);
    objc_msgSend_setTextColor_(*((void **)v6 + 68), v79, (uint64_t)v78, v80);

    objc_msgSend_addSubview_(v6, v81, *((void *)v6 + 68), v82);
    id v83 = objc_alloc(MEMORY[0x263F828E0]);
    uint64_t v87 = objc_msgSend_initWithFrame_(v83, v84, v85, v86, v12, v13, v14, v15);
    v88 = (void *)*((void *)v6 + 69);
    *((void *)v6 + 69) = v87;

    objc_msgSend_setNumberOfLines_(*((void **)v6 + 69), v89, 2, v90);
    objc_msgSend_setTextAlignment_(*((void **)v6 + 69), v91, 1, v92);
    LODWORD(v93) = 1051931443;
    objc_msgSend__setHyphenationFactor_(*((void **)v6 + 69), v94, v95, v96, v93);
    v100 = objc_msgSend_labelColor(MEMORY[0x263F825C8], v97, v98, v99);
    objc_msgSend_setTextColor_(*((void **)v6 + 69), v101, (uint64_t)v100, v102);

    objc_msgSend_addSubview_(v6, v103, *((void *)v6 + 69), v104);
    id v105 = objc_alloc(MEMORY[0x263F828E0]);
    uint64_t v109 = objc_msgSend_initWithFrame_(v105, v106, v107, v108, v12, v13, v14, v15);
    v110 = (void *)*((void *)v6 + 70);
    *((void *)v6 + 70) = v109;

    objc_msgSend_setNumberOfLines_(*((void **)v6 + 70), v111, 2, v112);
    objc_msgSend_setTextAlignment_(*((void **)v6 + 70), v113, 1, v114);
    LODWORD(v115) = 1051931443;
    objc_msgSend__setHyphenationFactor_(*((void **)v6 + 70), v116, v117, v118, v115);
    objc_msgSend_setAlpha_(*((void **)v6 + 70), v119, v120, v121, 0.0);
    v125 = objc_msgSend_labelColor(MEMORY[0x263F825C8], v122, v123, v124);
    objc_msgSend_setTextColor_(*((void **)v6 + 70), v126, (uint64_t)v125, v127);

    objc_msgSend_addSubview_(v6, v128, *((void *)v6 + 70), v129);
    id v130 = objc_alloc(MEMORY[0x263F82A70]);
    v133 = objc_msgSend_initWithDelegate_(v130, v131, (uint64_t)v6, v132);
    objc_msgSend_addInteraction_(v6, v134, (uint64_t)v133, v135);
    v139 = objc_msgSend_defaultCenter(MEMORY[0x263F08A00], v136, v137, v138);
    objc_msgSend_addObserver_selector_name_object_(v139, v140, (uint64_t)v6, (uint64_t)sel_updateContentSizeCategory, *MEMORY[0x263F83428], 0);

    objc_msgSend_updateContentSizeCategory(v6, v141, v142, v143);
  }
  return (AXCCExpandableButton *)v6;
}

- (void)layoutSubviews
{
  uint64_t v138 = *MEMORY[0x263EF8340];
  v136.receiver = self;
  v136.super_class = (Class)AXCCExpandableButton;
  [(AXCCExpandableButton *)&v136 layoutSubviews];
  objc_msgSend_bounds(self, v3, v4, v5);
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  uint64_t v17 = objc_msgSend_traitCollection(self, v14, v15, v16);
  objc_msgSend_displayScale(v17, v18, v19, v20);

  int64_t axis = self->_axis;
  if (axis)
  {
    if (axis == 1)
    {
      v139.origin.CGFloat x = v7;
      v139.origin.CGFloat y = v9;
      v139.size.width = v11;
      v139.size.height = v13;
      CGFloat Width = CGRectGetWidth(v139);
      v140.origin.CGFloat x = v7;
      v140.origin.CGFloat y = v9;
      v140.size.width = v11;
      v140.size.height = v13;
      uint64_t v25 = 0;
      CGRectGetHeight(v140);
      v141.origin.CGFloat x = v7;
      v141.origin.CGFloat y = v9;
      v141.size.width = v11;
      v141.size.height = v13;
      CGRectGetHeight(v141);
      UIFloorToScale();
      uint64_t v27 = v26;
      if ((unint64_t)objc_msgSend_count(self->_buttons, v28, v29, v30) >= 2)
      {
        objc_msgSend_count(self->_buttons, v31, v32, v33);
        objc_msgSend_count(self->_buttons, v34, v35, v36);
        UIFloorToScale();
        uint64_t v25 = v37;
      }
      buttons = self->_buttons;
      v134[0] = MEMORY[0x263EF8330];
      v134[1] = 3221225472;
      v134[2] = sub_24060E26C;
      v134[3] = &unk_2650C77C8;
      v134[4] = self;
      *(CGFloat *)&v134[5] = v7;
      *(CGFloat *)&v134[6] = v9;
      *(CGFloat *)&v134[7] = v11;
      *(CGFloat *)&v134[8] = v13;
      v134[9] = v27;
      v134[10] = v25;
      *(CGFloat *)&v134[11] = Width;
      objc_msgSend_enumerateObjectsUsingBlock_(buttons, v31, (uint64_t)v134, v33);
    }
  }
  else
  {
    v142.origin.CGFloat x = v7;
    v142.origin.CGFloat y = v9;
    v142.size.width = v11;
    v142.size.height = v13;
    CGFloat Height = CGRectGetHeight(v142);
    v143.origin.CGFloat x = v7;
    v143.origin.CGFloat y = v9;
    v143.size.width = v11;
    v143.size.height = v13;
    CGRectGetWidth(v143);
    v144.origin.CGFloat x = v7;
    v144.origin.CGFloat y = v9;
    v144.size.width = v11;
    v144.size.height = v13;
    CGRectGetWidth(v144);
    UIFloorToScale();
    uint64_t v41 = v40;
    objc_msgSend_count(self->_options, v42, v43, v44);
    UIFloorToScale();
    id v45 = self->_buttons;
    v135[0] = MEMORY[0x263EF8330];
    v135[1] = 3221225472;
    v135[2] = sub_24060E228;
    v135[3] = &unk_2650C77C8;
    v135[4] = self;
    *(CGFloat *)&v135[5] = v7;
    *(CGFloat *)&v135[6] = v9;
    *(CGFloat *)&v135[7] = v11;
    *(CGFloat *)&v135[8] = v13;
    v135[9] = v41;
    v135[10] = v46;
    *(CGFloat *)&v135[11] = Height;
    objc_msgSend_enumerateObjectsUsingBlock_(v45, v47, (uint64_t)v135, v48);
  }
  uint64_t v49 = objc_msgSend_firstObject(self->_buttons, v21, v22, v23);
  objc_msgSend_imageFrame(v49, v50, v51, v52);
  double v54 = v53;
  double v56 = v55;
  double v58 = v57;
  double v60 = v59;
  uint64_t v64 = objc_msgSend_firstObject(self->_buttons, v61, v62, v63);
  objc_msgSend_convertRect_fromView_(self, v65, (uint64_t)v64, v66, v54, v56, v58, v60);
  CGFloat x = v67;
  CGFloat y = v69;
  CGFloat v72 = v71;
  CGFloat v74 = v73;

  long long v132 = 0u;
  long long v133 = 0u;
  long long v130 = 0u;
  long long v131 = 0u;
  v75 = self->_buttons;
  uint64_t v77 = objc_msgSend_countByEnumeratingWithState_objects_count_(v75, v76, (uint64_t)&v130, (uint64_t)v137, 16);
  if (v77)
  {
    uint64_t v81 = v77;
    uint64_t v82 = *(void *)v131;
    do
    {
      for (uint64_t i = 0; i != v81; ++i)
      {
        if (*(void *)v131 != v82) {
          objc_enumerationMutation(v75);
        }
        v84 = *(void **)(*((void *)&v130 + 1) + 8 * i);
        objc_msgSend_imageFrame(v84, v78, v79, v80);
        objc_msgSend_convertRect_fromView_(self, v85, (uint64_t)v84, v86);
        v149.origin.CGFloat x = v87;
        v149.origin.CGFloat y = v88;
        v149.size.width = v89;
        v149.size.height = v90;
        v145.origin.CGFloat x = x;
        v145.origin.CGFloat y = y;
        v145.size.width = v72;
        v145.size.height = v74;
        CGRect v146 = CGRectUnion(v145, v149);
        CGFloat x = v146.origin.x;
        CGFloat y = v146.origin.y;
        CGFloat v72 = v146.size.width;
        CGFloat v74 = v146.size.height;
      }
      uint64_t v81 = objc_msgSend_countByEnumeratingWithState_objects_count_(v75, v78, (uint64_t)&v130, (uint64_t)v137, 16);
    }
    while (v81);
  }

  objc_msgSend_bounds(self, v91, v92, v93);
  UIRectCenteredXInRect();
  double v95 = v94;
  double v97 = v96;
  double v99 = v98;
  double v101 = v100;
  objc_msgSend_setFrame_(self->_backgroundView, v102, v103, v104);
  objc_msgSend_setFrame_(self->_clippingView, v105, v106, v107, v95, v97, v99, v101);
  v147.origin.CGFloat x = v95;
  v147.origin.CGFloat y = v97;
  v147.size.width = v99;
  v147.size.height = v101;
  double v108 = CGRectGetWidth(v147);
  v148.origin.CGFloat x = v95;
  v148.origin.CGFloat y = v97;
  v148.size.width = v99;
  v148.size.height = v101;
  double v112 = CGRectGetHeight(v148);
  BOOL v113 = v108 == v112;
  if (v108 < v112) {
    double v112 = v108;
  }
  double v114 = v112 * 0.5;
  backgroundView = self->_backgroundView;
  double v116 = v112 * 0.5;
  if (v113)
  {
    objc_msgSend__setCornerRadius_(backgroundView, v109, v110, v111, v116);
    objc_msgSend__setCornerRadius_(self->_clippingView, v117, v118, v119, v114);
  }
  else
  {
    objc_msgSend__setContinuousCornerRadius_(backgroundView, v109, v110, v111, v116);
    objc_msgSend__setContinuousCornerRadius_(self->_clippingView, v120, v121, v122, v114);
  }
  objc_msgSend__layoutSelectionView(self, v123, v124, v125);
  objc_msgSend__layoutLabels(self, v126, v127, v128);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  CGFloat width = a3.width;
  if (self->_axis && self->_expanded)
  {
    double v8 = self->_maximumExpandedSize.height;
    if (v8 <= 0.0)
    {
      double v9 = self->_buttonImageSize.height;
      double v8 = v9 * (double)(unint64_t)objc_msgSend_count(self->_buttons, a2, v3, v4);
    }
  }
  else
  {
    double v10 = objc_opt_class();
    objc_msgSend_collapsedHeightWithImageHeight_maximumHeight_(v10, v11, v12, v13, self->_buttonImageSize.height, height);
    double v8 = v14 + 0.0;
  }
  if (v8 >= height) {
    double v15 = height;
  }
  else {
    double v15 = v8;
  }
  double v16 = width;
  result.double height = v15;
  result.CGFloat width = v16;
  return result;
}

+ (double)collapsedHeightWithImageHeight:(double)a3 maximumHeight:(double)a4
{
  double v7 = a3 + 8.0;
  double v8 = objc_msgSend_mainScreen(MEMORY[0x263F82B60], a2, v4, v5);
  objc_msgSend_scale(v8, v9, v10, v11);

  uint64_t v12 = *MEMORY[0x263F83440];
  double v14 = objc_msgSend__preferredFontForTextStyle_maximumContentSizeCategory_(MEMORY[0x263F81708], v13, *MEMORY[0x263F835D0], *MEMORY[0x263F83440]);
  objc_msgSend_lineHeight(v14, v15, v16, v17);
  UICeilToScale();
  double v19 = v7 + v18;
  v21 = objc_msgSend__preferredFontForTextStyle_maximumContentSizeCategory_(MEMORY[0x263F81708], v20, *MEMORY[0x263F83588], v12);
  objc_msgSend_lineHeight(v21, v22, v23, v24);
  UICeilToScale();
  double v26 = v19 + v25;
  if (v26 < a4) {
    a4 = v26;
  }

  return a4;
}

- (void)setBackgroundView:(id)a3
{
  uint64_t v5 = (const char *)a3;
  backgroundView = self->_backgroundView;
  uint64_t v10 = (char *)v5;
  if (backgroundView != (UIView *)v5)
  {
    objc_msgSend_removeFromSuperview(backgroundView, v5, v6, v7);
    objc_storeStrong((id *)&self->_backgroundView, a3);
    objc_msgSend_insertSubview_atIndex_(self, v9, (uint64_t)v10, 0);
  }
}

- (void)setStylingProvider:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  uint64_t v7 = (AXCCVisualStylingProvider *)a3;
  stylingProvider = self->_stylingProvider;
  if (stylingProvider != v7)
  {
    objc_msgSend_removeObserver_(stylingProvider, v5, (uint64_t)self, v6);
    objc_storeStrong((id *)&self->_stylingProvider, a3);
    objc_msgSend_addObserver_(self->_stylingProvider, v9, (uint64_t)self, v10);
    objc_msgSend_updateVisualStyling(self, v11, v12, v13);
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    double v14 = self->_buttons;
    uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v22, (uint64_t)v26, 16);
    if (v16)
    {
      uint64_t v19 = v16;
      uint64_t v20 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v23 != v20) {
            objc_enumerationMutation(v14);
          }
          objc_msgSend_setStylingProvider_(*(void **)(*((void *)&v22 + 1) + 8 * i), v17, (uint64_t)v7, v18, (void)v22);
        }
        uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v17, (uint64_t)&v22, (uint64_t)v26, 16);
      }
      while (v19);
    }
  }
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
  id v5 = a3;
  objc_msgSend_setText_(self->_titleLabel, v6, (uint64_t)v5, v7);

  objc_msgSend_setNeedsLayout(self, v8, v9, v10);
}

- (void)setOptions:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_options, a3);
  self->_toggleEnabled = 0;
  objc_msgSend_setSelectedOptionIndex_(self, v6, 0x7FFFFFFFFFFFFFFFLL, v7);
  for (unint64_t i = objc_msgSend_count(self->_buttons, v8, v9, v10); i > objc_msgSend_count(v5, v11, v12, v13); --i)
  {
    uint64_t v18 = objc_msgSend_lastObject(self->_buttons, v15, v16, v17);
    objc_msgSend_removeLastObject(self->_buttons, v19, v20, v21);
    objc_msgSend_removeFromSuperview(v18, v22, v23, v24);
  }
  unint64_t v25 = objc_msgSend_count(self->_buttons, v15, v16, v17);
  if (v25 < objc_msgSend_count(v5, v26, v27, v28))
  {
    double v31 = *MEMORY[0x263F001A8];
    double v32 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v33 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v34 = *(double *)(MEMORY[0x263F001A8] + 24);
    do
    {
      uint64_t v35 = [AXCCRoundButton alloc];
      uint64_t v39 = objc_msgSend_initWithFrame_(v35, v36, v37, v38, v31, v32, v33, v34);
      objc_msgSend_addTarget_action_forControlEvents_(v39, v40, (uint64_t)self, (uint64_t)sel_didTapButton_, 64);
      objc_msgSend_addObject_(self->_buttons, v41, (uint64_t)v39, v42);
      objc_msgSend_addSubview_(self, v43, (uint64_t)v39, v44);

      ++v25;
    }
    while (v25 < objc_msgSend_count(v5, v45, v46, v47));
  }
  v60[0] = MEMORY[0x263EF8330];
  v60[1] = 3221225472;
  v60[2] = sub_24060E8B4;
  v60[3] = &unk_2650C77F0;
  v60[4] = self;
  objc_msgSend_enumerateObjectsUsingBlock_(v5, v29, (uint64_t)v60, v30);
  objc_msgSend__updateButtonsVisiblity(self, v48, v49, v50);
  objc_msgSend_updateVisualStyling(self, v51, v52, v53);
  objc_msgSend__updateSelectionVisiblity(self, v54, v55, v56);
  objc_msgSend_setNeedsLayout(self, v57, v58, v59);
}

- (AXCCExpandableButtonOption)selectedOption
{
  selectedOptionIndeCGFloat x = self->_selectedOptionIndex;
  if (selectedOptionIndex == 0x7FFFFFFFFFFFFFFFLL
    || selectedOptionIndex >= objc_msgSend_count(self->_options, a2, v2, v3))
  {
    double v8 = 0;
  }
  else
  {
    double v8 = objc_msgSend_objectAtIndexedSubscript_(self->_options, v6, self->_selectedOptionIndex, v7);
  }

  return (AXCCExpandableButtonOption *)v8;
}

- (void)setSelectedOptionIndex:(int64_t)a3
{
  BOOL v6 = self->_selectedOptionIndex == 0x7FFFFFFFFFFFFFFFLL;
  self->_selectedOptionIndeCGFloat x = a3;
  uint64_t v7 = objc_msgSend_selectedOption(self, a2, a3, v3);
  uint64_t v11 = objc_msgSend_title(v7, v8, v9, v10);
  objc_msgSend_setText_(self->_subtitleLabel, v12, (uint64_t)v11, v13);

  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = sub_24060EBFC;
  v32[3] = &unk_2650C7818;
  v32[4] = self;
  BOOL v33 = v6;
  objc_msgSend_performWithoutAnimation_(MEMORY[0x263F82E00], v14, (uint64_t)v32, v15);
  objc_msgSend__layoutSelectionView(self, v16, v17, v18);
  objc_msgSend__updateSelectionVisiblity(self, v19, v20, v21);
  objc_msgSend__updateButtonsVisiblity(self, v22, v23, v24);
  uint64_t v28 = objc_msgSend_buttons(self, v25, v26, v27);
  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = sub_24060EC4C;
  v31[3] = &unk_2650C7838;
  v31[4] = a3;
  objc_msgSend_enumerateObjectsUsingBlock_(v28, v29, (uint64_t)v31, v30);
  UIAccessibilityPostNotification(*MEMORY[0x263F831C0], 0);
}

- (void)setAxis:(int64_t)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  self->_int64_t axis = a3;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v4 = self->_buttons;
  uint64_t v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v20, (uint64_t)v24, 16);
  if (v6)
  {
    uint64_t v10 = v6;
    uint64_t v11 = *(void *)v21;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v4);
        }
        uint64_t v13 = *(void **)(*((void *)&v20 + 1) + 8 * v12);
        uint64_t v14 = objc_msgSend__buttonLayoutAxis(self, v7, v8, v9, (void)v20);
        objc_msgSend_setAxis_(v13, v15, v14, v16);
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v7, (uint64_t)&v20, (uint64_t)v24, 16);
    }
    while (v10);
  }

  objc_msgSend_setNeedsLayout(self, v17, v18, v19);
}

- (void)setContentVerticalAlignment:(int64_t)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  v21.receiver = self;
  v21.super_class = (Class)AXCCExpandableButton;
  [(AXCCExpandableButton *)&v21 setContentVerticalAlignment:a3];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v4 = self->_buttons;
  uint64_t v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v17, (uint64_t)v22, 16);
  if (v6)
  {
    uint64_t v10 = v6;
    uint64_t v11 = *(void *)v18;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v4);
        }
        uint64_t v13 = *(void **)(*((void *)&v17 + 1) + 8 * v12);
        uint64_t v14 = objc_msgSend_contentVerticalAlignment(self, v7, v8, v9, (void)v17);
        objc_msgSend_setContentVerticalAlignment_(v13, v15, v14, v16);
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v7, (uint64_t)&v17, (uint64_t)v22, 16);
    }
    while (v10);
  }
}

- (void)setButtonImageSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v23 = *MEMORY[0x263EF8340];
  self->_buttonImageSize = a3;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v6 = self->_buttons;
  uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v18, (uint64_t)v22, 16);
  if (v8)
  {
    uint64_t v12 = v8;
    uint64_t v13 = *(void *)v19;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend_setImageSize_(*(void **)(*((void *)&v18 + 1) + 8 * v14++), v9, v10, v11, width, height, (void)v18);
      }
      while (v12 != v14);
      uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v9, (uint64_t)&v18, (uint64_t)v22, 16);
    }
    while (v12);
  }

  objc_msgSend_setNeedsLayout(self, v15, v16, v17);
}

- (void)setExpanded:(BOOL)a3
{
  if (self->_expanded != a3 && !self->_toggleEnabled)
  {
    self->_expanded = a3;
    if (objc_msgSend__isInAnimationBlock(MEMORY[0x263F82E00], a2, a3, v3))
    {
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = sub_24060F11C;
      v17[3] = &unk_2650C76D0;
      v17[4] = self;
      objc_msgSend_animateWithDuration_delay_options_animations_completion_(MEMORY[0x263F82E00], v5, 96, (uint64_t)v17, 0, 0.25, 0.0);
    }
    else
    {
      objc_msgSend__updateButtonsVisiblity(self, v5, v6, v7);
      objc_msgSend_updateVisualStyling(self, v11, v12, v13);
      objc_msgSend__updateSelectionVisiblity(self, v14, v15, v16);
    }
    objc_msgSend_setNeedsLayout(self, v8, v9, v10);
  }
}

- (void)setEnabled:(BOOL)a3
{
  v15.receiver = self;
  v15.super_class = (Class)AXCCExpandableButton;
  [(AXCCExpandableButton *)&v15 setEnabled:a3];
  objc_msgSend_updateVisualStyling(self, v4, v5, v6);
  objc_msgSend__updateButtonsVisiblity(self, v7, v8, v9);
  objc_msgSend__updateSelectionVisiblity(self, v10, v11, v12);
  objc_msgSend__animateGlyphStateSelected_(self, v13, 0, v14);
}

- (void)setHighlighted:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)AXCCExpandableButton;
  [(AXCCExpandableButton *)&v7 setHighlighted:a3];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = sub_24060F26C;
  v6[3] = &unk_2650C76D0;
  v6[4] = self;
  objc_msgSend_animateWithDuration_animations_(MEMORY[0x263F82E00], v4, (uint64_t)v6, v5, 0.15);
}

- (void)setAnimating:(BOOL)a3
{
  self->_animating = a3;
  objc_msgSend__animateGlyphStateSelected_(self, a2, 0, v3);
}

- (void)showMessage:(id)a3
{
  objc_msgSend_setText_(self->_messageLabel, a2, (uint64_t)a3, v3);
  self->_resetTracking = 1;
  objc_msgSend__layoutLabels(self, v5, v6, v7);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = sub_24060F340;
  v9[3] = &unk_2650C76D0;
  v9[4] = self;
  objc_msgSend_animateKeyframesWithDuration_delay_options_animations_completion_(MEMORY[0x263F82E00], v8, 0, (uint64_t)v9, 0, 2.5, 0.0);
}

- (void)setDisplayMessage:(BOOL)a3
{
  self->_displayMessage = a3;
  objc_msgSend__updateButtonsVisiblity(self, a2, a3, v3);

  objc_msgSend_updateVisualStyling(self, v5, v6, v7);
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  uint64_t v7 = objc_msgSend_backgroundView(self, a2, (uint64_t)a4, v4);
  objc_msgSend_frame(v7, v8, v9, v10);
  v13.CGFloat x = x;
  v13.CGFloat y = y;
  BOOL v11 = CGRectContainsPoint(v14, v13);

  return v11;
}

- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  return self->_expanded;
}

- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v5 = a3;
  if ((objc_msgSend__isPointerTouch(v5, v6, v7, v8) & 1) == 0)
  {
    int64_t axis = self->_axis;
    if (axis)
    {
      objc_msgSend_center(self->_selectionView, v9, v10, v11);
      double v14 = v13;
      objc_msgSend_locationInView_(v5, v15, (uint64_t)self, v16);
    }
    else
    {
      objc_msgSend_locationInView_(v5, v9, (uint64_t)self, v11);
      double v14 = v20;
      objc_msgSend_center(self->_selectionView, v21, v22, v23);
    }
    double v24 = v19;
    buttons = self->_buttons;
    v58[0] = MEMORY[0x263EF8330];
    v58[1] = 3221225472;
    v58[2] = sub_24060F738;
    v58[3] = &unk_2650C7858;
    *(double *)&v58[4] = v14;
    *(double *)&v58[5] = v19;
    uint64_t v26 = objc_msgSend_indexOfObjectPassingTest_(buttons, v17, (uint64_t)v58, v18);
    if (v26 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v30 = v26;
      selectedOptionIndeCGFloat x = self->_selectedOptionIndex;
      BOOL v32 = v26 != selectedOptionIndex;
      uint64_t v33 = objc_msgSend_count(self->_buttons, v27, v28, v29);
      if ((selectedOptionIndex & (unint64_t)~(selectedOptionIndex >> 63)) >= v33 - 1) {
        objc_msgSend_objectAtIndexedSubscript_(self->_buttons, v34, v33 - 1, v35);
      }
      else {
      uint64_t v36 = objc_msgSend_objectAtIndexedSubscript_(self->_buttons, v34, selectedOptionIndex & ~(selectedOptionIndex >> 63), v35);
      }
      objc_msgSend_center(v36, v37, v38, v39);
      double v41 = v40;
      double v43 = v42;

      double v46 = v24 - v43;
      uint64_t v49 = MEMORY[0x263EF8330];
      uint64_t v50 = 3221225472;
      uint64_t v51 = sub_24060F774;
      uint64_t v52 = &unk_2650C7880;
      uint64_t v53 = self;
      if (!axis) {
        double v46 = v14 - v41;
      }
      BOOL v56 = axis == 0;
      double v54 = v46;
      BOOL v57 = v32;
      uint64_t v55 = v30;
      objc_msgSend_animateWithDuration_animations_(MEMORY[0x263F82E00], v44, (uint64_t)&v49, v45, 0.1);
      if (v30 != selectedOptionIndex) {
        objc_msgSend_sendActionsForControlEvents_(self, v27, 4096, v29, v49, v50, v51, v52, v53);
      }
    }
    if (!self->_resetTracking)
    {
      BOOL v47 = 1;
      goto LABEL_16;
    }
    objc_msgSend__resetSelectionView(self, v27, v28, v29);
  }
  BOOL v47 = 0;
LABEL_16:

  return v47;
}

- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)AXCCExpandableButton;
  [(AXCCExpandableButton *)&v8 endTrackingWithTouch:a3 withEvent:a4];
  objc_msgSend__resetSelectionView(self, v5, v6, v7);
}

- (void)cancelTrackingWithEvent:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)AXCCExpandableButton;
  [(AXCCExpandableButton *)&v7 cancelTrackingWithEvent:a3];
  objc_msgSend__resetSelectionView(self, v4, v5, v6);
}

- (void)didTapButton:(id)a3
{
  uint64_t v5 = objc_msgSend_indexOfObject_(self->_buttons, a2, (uint64_t)a3, v3);
  if (self->_toggleEnabled)
  {
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = sub_24060FA14;
    v13[3] = &unk_2650C78A8;
    v13[4] = self;
    v13[5] = v5;
    objc_msgSend_animateWithDuration_animations_(MEMORY[0x263F82E00], v6, (uint64_t)v13, v7, 0.25);
LABEL_3:
    objc_msgSend__animateGlyphStateSelected_(self, v8, 1, v9);
    objc_msgSend_sendActionsForControlEvents_(self, v10, 4096, v11);
    return;
  }
  if (self->_expanded && self->_selectedOptionIndex != v5)
  {
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = sub_24060FA24;
    v12[3] = &unk_2650C78A8;
    v12[4] = self;
    v12[5] = v5;
    objc_msgSend__springAnimate_(self, v6, (uint64_t)v12, v7);
    goto LABEL_3;
  }

  objc_msgSend_sendActionsForControlEvents_(self, v6, 64, v7);
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  objc_msgSend_view(v4, v5, v6, v7);
  objc_super v8 = (AXCCExpandableButton *)objc_claimAutoreleasedReturnValue();
  if (v8 == self
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    || objc_msgSend_numberOfTouchesRequired(v4, v9, v10, v11) != 1)
  {

    goto LABEL_7;
  }
  uint64_t v15 = objc_msgSend_numberOfTapsRequired(v4, v12, v13, v14);

  if (v15 != 1)
  {
LABEL_7:
    BOOL v16 = 1;
    goto LABEL_8;
  }
  BOOL v16 = 0;
LABEL_8:

  return v16;
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  id v6 = a4;
  buttons = self->_buttons;
  v37[0] = MEMORY[0x263EF8330];
  v37[1] = 3221225472;
  v37[2] = sub_24060FC34;
  v37[3] = &unk_2650C78D0;
  id v8 = v6;
  id v38 = v8;
  uint64_t v11 = objc_msgSend_indexOfObjectPassingTest_(buttons, v9, (uint64_t)v37, v10);
  if (v11 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v14 = 0;
  }
  else
  {
    uint64_t v15 = v11;
    BOOL v16 = objc_msgSend_objectAtIndexedSubscript_(self->_buttons, v12, v11, v13);
    objc_msgSend_imageFrame(v16, v17, v18, v19);
    objc_msgSend_convertRect_fromView_(self, v20, (uint64_t)v16, v21);
    double v23 = v22;
    double v25 = v24;
    double v27 = v26;
    double v29 = v28;
    uint64_t v30 = (void *)MEMORY[0x263F82A80];
    uint64_t v33 = objc_msgSend_numberWithInteger_(NSNumber, v31, v15, v32);
    uint64_t v14 = objc_msgSend_regionWithRect_identifier_(v30, v34, (uint64_t)v33, v35, v23, v25, v27, v29);
  }

  return v14;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v5 = a4;
  uint64_t v9 = objc_msgSend_identifier(v5, v6, v7, v8);
  uint64_t v13 = objc_msgSend_integerValue(v9, v10, v11, v12);

  if (self->_toggleEnabled || !self->_expanded)
  {
    uint64_t v17 = (void *)MEMORY[0x263F824C0];
    objc_msgSend_rect(v5, v14, v15, v16);
    uint64_t v21 = objc_msgSend_bezierPathWithOvalInRect_(v17, v18, v19, v20);
    id v22 = objc_alloc_init(MEMORY[0x263F82AD0]);
    objc_msgSend_setShadowPath_(v22, v23, (uint64_t)v21, v24);
    id v25 = objc_alloc(MEMORY[0x263F82CC8]);
    id v27 = (id)objc_msgSend_initWithView_parameters_(v25, v26, (uint64_t)self, (uint64_t)v22);
    uint64_t v30 = objc_msgSend_effectWithPreview_(MEMORY[0x263F82A78], v28, (uint64_t)v27, v29);
    uint64_t v33 = objc_msgSend_shapeWithPath_(MEMORY[0x263F82A88], v31, (uint64_t)v21, v32);
    uint64_t v35 = objc_msgSend_styleWithEffect_shape_(MEMORY[0x263F82A90], v34, (uint64_t)v30, (uint64_t)v33);
LABEL_3:

    goto LABEL_4;
  }
  if (v13 != self->_selectedOptionIndex)
  {
    uint64_t v21 = objc_msgSend_objectAtIndexedSubscript_(self->_buttons, v14, v13, v16);
    double v54 = (void *)MEMORY[0x263F824C0];
    objc_msgSend_imageFrame(v21, v55, v56, v57);
    objc_msgSend_bezierPathWithOvalInRect_(v54, v58, v59, v60);
    id v22 = (id)objc_claimAutoreleasedReturnValue();
    id v27 = objc_alloc_init(MEMORY[0x263F82AD0]);
    objc_msgSend_setShadowPath_(v27, v61, (uint64_t)v22, v62);
    id v63 = objc_alloc(MEMORY[0x263F82CC8]);
    uint64_t v30 = objc_msgSend_initWithView_parameters_(v63, v64, (uint64_t)v21, (uint64_t)v27);
    uint64_t v33 = objc_msgSend_effectWithPreview_(MEMORY[0x263F82A60], v65, (uint64_t)v30, v66);
    double v69 = objc_msgSend_shapeWithPath_(MEMORY[0x263F82A88], v67, (uint64_t)v22, v68);
    uint64_t v35 = objc_msgSend_styleWithEffect_shape_(MEMORY[0x263F82A90], v70, (uint64_t)v33, (uint64_t)v69);

    goto LABEL_3;
  }
  id v37 = objc_alloc(MEMORY[0x263F82CC8]);
  uint64_t v21 = objc_msgSend_initWithView_(v37, v38, (uint64_t)self->_selectionView, v39);
  objc_msgSend_effectWithPreview_(MEMORY[0x263F82A78], v40, (uint64_t)v21, v41);
  id v22 = (id)objc_claimAutoreleasedReturnValue();
  double v42 = (void *)MEMORY[0x263F82A88];
  double v43 = (void *)MEMORY[0x263F824C0];
  objc_msgSend_bounds(self->_selectionView, v44, v45, v46);
  uint64_t v50 = objc_msgSend_bezierPathWithOvalInRect_(v43, v47, v48, v49);
  objc_msgSend_shapeWithPath_(v42, v51, (uint64_t)v50, v52);
  id v27 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v35 = objc_msgSend_styleWithEffect_shape_(MEMORY[0x263F82A90], v53, (uint64_t)v22, (uint64_t)v27);
LABEL_4:

  return v35;
}

- (void)pointerInteraction:(id)a3 willEnterRegion:(id)a4 animator:(id)a5
{
}

- (void)pointerInteraction:(id)a3 willExitRegion:(id)a4 animator:(id)a5
{
}

- (void)_updateButtonsVisiblity
{
  buttons = self->_buttons;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = sub_240610000;
  v4[3] = &unk_2650C78F8;
  v4[4] = self;
  objc_msgSend_enumerateObjectsUsingBlock_(buttons, a2, (uint64_t)v4, v2);
}

- (void)updateVisualStyling
{
  if (objc_msgSend_isEnabled(self, a2, v2, v3)) {
    objc_msgSend_setAlpha_(self->_backgroundView, v5, v6, v7, 1.0);
  }
  else {
    objc_msgSend_setAlpha_(self->_backgroundView, v5, v6, v7, 0.5);
  }
  stylingProvider = self->_stylingProvider;
  if (stylingProvider)
  {
    if (self->_displayMessage)
    {
      objc_msgSend_setAlpha_(self->_titleLabel, v8, v9, v10, 0.0);
      objc_msgSend_setAlpha_(self->_subtitleLabel, v12, v13, v14, 0.0);
      uint64_t v16 = self->_stylingProvider;
      messageLabel = self->_messageLabel;
      objc_msgSend_applyStyle_toView_(v16, v15, 0, (uint64_t)messageLabel);
      return;
    }
    if (self->_expanded) {
      goto LABEL_27;
    }
    char isEnabled = objc_msgSend_isEnabled(self, v8, v9, v10);
    stylingProvider = self->_stylingProvider;
    if ((isEnabled & 1) == 0)
    {
      objc_msgSend_applyStyle_toView_(stylingProvider, v8, 0, (uint64_t)self->_titleLabel);
      objc_msgSend_applyStyle_toView_(self->_stylingProvider, v34, 0, (uint64_t)self->_subtitleLabel);
      objc_msgSend_setAlpha_(self->_titleLabel, v35, v36, v37, 0.5);
      objc_msgSend_setAlpha_(self->_subtitleLabel, v38, v39, v40, 0.5);
      goto LABEL_21;
    }
    if (stylingProvider)
    {
LABEL_27:
      if (!self->_expanded)
      {
        objc_msgSend_applyStyle_toView_(stylingProvider, v8, 0, (uint64_t)self->_titleLabel);
        objc_msgSend_applyStyle_toView_(self->_stylingProvider, v26, 0, (uint64_t)self->_subtitleLabel);
LABEL_21:
        uint64_t v24 = self->_messageLabel;
        double v25 = 0.0;
        goto LABEL_22;
      }
LABEL_15:
      objc_msgSend_setAlpha_(self->_titleLabel, v8, v9, v10, 0.0);
      objc_msgSend_setAlpha_(self->_subtitleLabel, v27, v28, v29, 0.0);
      goto LABEL_21;
    }
LABEL_14:
    if (!self->_expanded)
    {
      objc_msgSend_setAlpha_(self->_titleLabel, v8, v9, v10, 1.0);
      objc_msgSend_setAlpha_(self->_subtitleLabel, v31, v32, v33, 1.0);
      goto LABEL_21;
    }
    goto LABEL_15;
  }
  if (!self->_displayMessage) {
    goto LABEL_14;
  }
  objc_msgSend_setAlpha_(self->_titleLabel, v8, v9, v10, 0.0);
  objc_msgSend_setAlpha_(self->_subtitleLabel, v18, v19, v20, 0.0);
  uint64_t v24 = self->_messageLabel;
  double v25 = 1.0;
LABEL_22:

  objc_msgSend_setAlpha_(v24, v21, v22, v23, v25);
}

- (void)_updateSelectionVisiblity
{
  id v5 = objc_msgSend_selectedOption(self, a2, v2, v3);
  objc_msgSend_selectedBackgroundColor(v5, v6, v7, v8);
  id v24 = (id)objc_claimAutoreleasedReturnValue();

  if (v24 && objc_msgSend_isEnabled(self, v9, v10, v11))
  {
    objc_msgSend_setBackgroundColor_(self->_selectionView, v9, (uint64_t)v24, v11);
LABEL_7:
    objc_msgSend_setAlpha_(self->_overlaySelectionView, v12, v13, v14, 0.0);
    goto LABEL_9;
  }
  if (!self->_expanded || self->_selectedOptionIndex == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v15 = objc_msgSend_clearColor(MEMORY[0x263F825C8], v9, v10, v11);
    objc_msgSend_setBackgroundColor_(self->_selectionView, v16, (uint64_t)v15, v17);

    goto LABEL_7;
  }
  uint64_t v18 = objc_msgSend_clearColor(MEMORY[0x263F825C8], v9, v10, v11);
  objc_msgSend_setBackgroundColor_(self->_selectionView, v19, (uint64_t)v18, v20);

  objc_msgSend_setAlpha_(self->_overlaySelectionView, v21, v22, v23, 0.2);
LABEL_9:
}

- (void)_layoutLabels
{
  objc_msgSend_bounds(self, a2, v2, v3);
  uint64_t v8 = objc_msgSend_backgroundView(self, v5, v6, v7);
  objc_msgSend_frame(v8, v9, v10, v11);
  CGRectGetMaxY(v56);
  UIRectInset();
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  double v17 = v16;
  double v19 = v18;

  objc_msgSend_sizeThatFits_(self->_titleLabel, v20, v21, v22, v17, v19);
  v57.origin.CGFloat x = v13;
  v57.origin.CGFloat y = v15;
  v57.size.double width = v17;
  v57.size.double height = v19;
  CGRectGetMinY(v57);
  UIRectCenteredXInRect();
  CGFloat v53 = v24;
  CGFloat v54 = v23;
  CGFloat v26 = v25;
  CGFloat v28 = v27;
  objc_msgSend_setFrame_(self->_titleLabel, v29, v30, v31);
  objc_msgSend_sizeThatFits_(self->_messageLabel, v32, v33, v34, v17, v19);
  v58.origin.CGFloat x = v13;
  v58.origin.CGFloat y = v15;
  v58.size.double width = v17;
  v58.size.double height = v19;
  CGRectGetMinY(v58);
  UIRectCenteredXInRect();
  objc_msgSend_setFrame_(self->_messageLabel, v35, v36, v37);
  v59.origin.CGFloat y = v53;
  v59.origin.CGFloat x = v54;
  v59.size.double width = v26;
  v59.size.double height = v28;
  CGRectGetHeight(v59);
  UIRectInset();
  CGFloat v39 = v38;
  CGFloat v41 = v40;
  CGFloat v43 = v42;
  CGFloat v45 = v44;
  objc_msgSend_sizeThatFits_(self->_subtitleLabel, v46, v47, v48, v42, v44);
  v60.origin.CGFloat x = v39;
  v60.origin.CGFloat y = v41;
  v60.size.double width = v43;
  v60.size.double height = v45;
  CGRectGetMinY(v60);
  UIRectCenteredXInRect();
  subtitleLabel = self->_subtitleLabel;

  objc_msgSend_setFrame_(subtitleLabel, v49, v50, v51);
}

- (void)_layoutSelectionView
{
  if (self->_selectedOptionIndex != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (objc_msgSend_count(self->_buttons, a2, v2, v3))
    {
      unint64_t v8 = objc_msgSend_count(self->_buttons, v5, v6, v7);
      selectedOptionIndeCGFloat x = self->_selectedOptionIndex;
      if (v8 > selectedOptionIndex)
      {
        objc_msgSend_objectAtIndexedSubscript_(self->_buttons, v9, selectedOptionIndex, v10);
        id v54 = (id)objc_claimAutoreleasedReturnValue();
        backgroundView = self->_backgroundView;
        objc_msgSend_imageFrame(v54, v13, v14, v15);
        objc_msgSend_convertRect_fromView_(backgroundView, v16, (uint64_t)v54, v17);
        double v22 = v21;
        double v24 = v23;
        double v26 = v25;
        double v28 = v27;
        if (self->_expanded)
        {
          int isHighlighted = objc_msgSend_isHighlighted(self, v18, v19, v20);
          double v30 = 4.0;
          if (isHighlighted) {
            double v30 = 2.0;
          }
          double v22 = v22 + v30;
          double v24 = v24 + v30;
          double v31 = v30 + v30;
          double v26 = v26 - v31;
          double v28 = v28 - v31;
        }
        UIRectCenteredAboutPoint();
        objc_msgSend_setBounds_(self->_selectionView, v32, v33, v34);
        v56.origin.CGFloat x = v22;
        v56.origin.CGFloat y = v24;
        v56.size.double width = v26;
        v56.size.double height = v28;
        double MidX = CGRectGetMidX(v56);
        v57.origin.CGFloat x = v22;
        v57.origin.CGFloat y = v24;
        v57.size.double width = v26;
        v57.size.double height = v28;
        CGFloat MidY = CGRectGetMidY(v57);
        objc_msgSend_setCenter_(self->_selectionView, v37, v38, v39, MidX, MidY);
        v58.origin.CGFloat x = v22;
        v58.origin.CGFloat y = v24;
        v58.size.double width = v26;
        v58.size.double height = v28;
        CGFloat Height = CGRectGetHeight(v58);
        objc_msgSend__setCornerRadius_(self->_selectionView, v41, v42, v43, Height * 0.5);
        v59.origin.CGFloat x = v22;
        v59.origin.CGFloat y = v24;
        v59.size.double width = v26;
        v59.size.double height = v28;
        CGFloat v44 = CGRectGetHeight(v59);
        objc_msgSend__setCornerRadius_(self->_overlaySelectionView, v45, v46, v47, v44 * 0.5);
        objc_msgSend_bounds(self->_selectionView, v48, v49, v50);
        objc_msgSend_setFrame_(self->_overlaySelectionView, v51, v52, v53);
      }
    }
  }
}

- (void)_springAnimate:(id)a3
{
  uint64_t v3 = (objc_class *)MEMORY[0x263F82E38];
  id v4 = a3;
  id v9 = objc_alloc_init(v3);
  objc_msgSend_setDampingRatio_response_(v9, v5, v6, v7, 0.8165, 0.51302);
  objc_msgSend__animateUsingSpringBehavior_tracking_animations_completion_(MEMORY[0x263F82E00], v8, (uint64_t)v9, 0, v4, 0);
}

- (void)_animateGlyphStateSelected:(BOOL)a3
{
  BOOL v4 = a3;
  if (objc_msgSend_isEnabled(self, a2, a3, v3)
    && self->_animating
    && (objc_msgSend_selectedOption(self, v6, v7, v8),
        id v9 = objc_claimAutoreleasedReturnValue(),
        char v13 = objc_msgSend_supportsAnimation(v9, v10, v11, v12),
        v9,
        (v13 & 1) != 0))
  {
    uint64_t v14 = @"animating";
  }
  else
  {
    int isEnabled = objc_msgSend_isEnabled(self, v6, v7, v8);
    uint64_t v14 = @"on";
    if ((isEnabled & v4) == 0) {
      uint64_t v14 = 0;
    }
  }
  buttons = self->_buttons;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = sub_240610A4C;
  v17[3] = &unk_2650C7920;
  v17[4] = self;
  double v18 = v14;
  objc_msgSend_enumerateObjectsUsingBlock_(buttons, v6, (uint64_t)v17, v8);
}

- (void)_resetSelectionView
{
  self->_resetTracking = 0;
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = sub_240610AF0;
  v3[3] = &unk_2650C76D0;
  v3[4] = self;
  objc_msgSend__springAnimate_(self, a2, (uint64_t)v3, v2);
}

- (int64_t)_buttonLayoutAxis
{
  if (self->_toggleEnabled) {
    return 0;
  }
  else {
    return self->_axis;
  }
}

- (void)updateContentSizeCategory
{
  uint64_t v3 = *MEMORY[0x263F83440];
  objc_msgSend__preferredFontForTextStyle_maximumContentSizeCategory_(MEMORY[0x263F81708], a2, *MEMORY[0x263F835D0], *MEMORY[0x263F83440]);
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = objc_msgSend__preferredFontForTextStyle_maximumContentSizeCategory_(MEMORY[0x263F81708], v4, *MEMORY[0x263F83588], v3);
  objc_msgSend_setFont_(self->_titleLabel, v6, (uint64_t)v12, v7);
  objc_msgSend_setFont_(self->_subtitleLabel, v8, (uint64_t)v5, v9);
  objc_msgSend_setFont_(self->_messageLabel, v10, (uint64_t)v12, v11);
}

- (BOOL)isAccessibilityElement
{
  return objc_msgSend_isExpanded(self, a2, v2, v3) ^ 1;
}

- (id)accessibilityLabel
{
  BOOL v4 = objc_msgSend_titleLabel(self, a2, v2, v3);
  uint64_t v8 = objc_msgSend_accessibilityLabel(v4, v5, v6, v7);

  return v8;
}

- (id)accessibilityValue
{
  id v5 = objc_msgSend_subtitleLabel(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_accessibilityLabel(v5, v6, v7, v8);

  char v13 = objc_msgSend_messageLabel(self, v10, v11, v12);
  uint64_t v17 = objc_msgSend_accessibilityLabel(v13, v14, v15, v16);

  if (objc_msgSend_length(v9, v18, v19, v20)) {
    id v24 = v9;
  }
  else {
    id v24 = 0;
  }
  if (objc_msgSend_length(v17, v21, v22, v23))
  {
    if (objc_msgSend_length(v24, v25, v26, v27))
    {
      double v30 = objc_msgSend_stringByAppendingString_(v24, v28, @", ", v29);

      objc_msgSend_stringByAppendingString_(v30, v31, (uint64_t)v17, v32);
      id v33 = (id)objc_claimAutoreleasedReturnValue();
      id v24 = v30;
    }
    else
    {
      id v33 = v17;
    }

    id v24 = v33;
  }

  return v24;
}

- (unint64_t)accessibilityTraits
{
  uint64_t v4 = *MEMORY[0x263F83260];
  int v5 = objc_msgSend_toggleEnabled(self, a2, v2, v3);
  uint64_t v6 = *MEMORY[0x263F83290];
  if (v5) {
    uint64_t v6 = 0;
  }
  return v6 | v4;
}

- (BOOL)accessibilityRespondsToUserInteraction
{
  return 1;
}

- (NSArray)options
{
  return self->_options;
}

- (int64_t)selectedOptionIndex
{
  return self->_selectedOptionIndex;
}

- (NSString)title
{
  return self->_title;
}

- (int64_t)axis
{
  return self->_axis;
}

- (BOOL)isExpanded
{
  return self->_expanded;
}

- (BOOL)isAnimating
{
  return self->_animating;
}

- (CGSize)maximumExpandedSize
{
  double width = self->_maximumExpandedSize.width;
  double height = self->_maximumExpandedSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setMaximumExpandedSize:(CGSize)a3
{
  self->_maximumExpandedSize = a3;
}

- (CGSize)buttonImageSize
{
  double width = self->_buttonImageSize.width;
  double height = self->_buttonImageSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (AXCCVisualStylingProvider)stylingProvider
{
  return self->_stylingProvider;
}

- (NSMutableArray)buttons
{
  return self->_buttons;
}

- (void)setButtons:(id)a3
{
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (UIView)overlaySelectionView
{
  return self->_overlaySelectionView;
}

- (void)setOverlaySelectionView:(id)a3
{
}

- (UIView)selectionView
{
  return self->_selectionView;
}

- (void)setSelectionView:(id)a3
{
}

- (UIView)clippingView
{
  return self->_clippingView;
}

- (void)setClippingView:(id)a3
{
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UILabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (void)setSubtitleLabel:(id)a3
{
}

- (UILabel)messageLabel
{
  return self->_messageLabel;
}

- (void)setMessageLabel:(id)a3
{
}

- (NSTimer)messageTimer
{
  return self->_messageTimer;
}

- (void)setMessageTimer:(id)a3
{
}

- (BOOL)toggleEnabled
{
  return self->_toggleEnabled;
}

- (void)setToggleEnabled:(BOOL)a3
{
  self->_toggleEnabled = a3;
}

- (BOOL)displayMessage
{
  return self->_displayMessage;
}

- (BOOL)resetTracking
{
  return self->_resetTracking;
}

- (void)setResetTracking:(BOOL)a3
{
  self->_resetTracking = a3;
}

- (BOOL)isControlCenter
{
  return self->_isControlCenter;
}

- (void)setIsControlCenter:(BOOL)a3
{
  self->_isControlCenter = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageTimer, 0);
  objc_storeStrong((id *)&self->_messageLabel, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_clippingView, 0);
  objc_storeStrong((id *)&self->_selectionView, 0);
  objc_storeStrong((id *)&self->_overlaySelectionView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_buttons, 0);
  objc_storeStrong((id *)&self->_stylingProvider, 0);
  objc_storeStrong((id *)&self->_title, 0);

  objc_storeStrong((id *)&self->_options, 0);
}

@end