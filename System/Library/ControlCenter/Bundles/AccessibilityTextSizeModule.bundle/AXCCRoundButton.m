@interface AXCCRoundButton
- (AXCCRoundButton)initWithFrame:(CGRect)a3;
- (AXCCShadowView)shadowView;
- (AXCCVisualStylingProvider)stylingProvider;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)isAccessibilityElement;
- (BOOL)isLabelHidden;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (CCUICAPackageView)packageView;
- (CGRect)accessibilityFrame;
- (CGRect)imageFrame;
- (CGSize)imageSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)glyphState;
- (NSString)packageName;
- (NSString)title;
- (UIImage)glyphImage;
- (UIImage)image;
- (UIImageView)glyphImageView;
- (UILabel)titleLabel;
- (id)accessibilityLabel;
- (int64_t)axis;
- (unint64_t)accessibilityTraits;
- (void)controlCenterApplyPrimaryContentShadow;
- (void)layoutSubviews;
- (void)setAxis:(int64_t)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setGlyphImage:(id)a3;
- (void)setGlyphImageView:(id)a3;
- (void)setGlyphState:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setImage:(id)a3;
- (void)setImageSize:(CGSize)a3;
- (void)setLabelHidden:(BOOL)a3;
- (void)setPackageName:(id)a3;
- (void)setPackageView:(id)a3;
- (void)setSelected:(BOOL)a3;
- (void)setShadowView:(id)a3;
- (void)setStylingProvider:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateContentSizeCategory;
- (void)updateGlyphImageViewVisualStyling;
- (void)updateLabelVisualStyling;
- (void)updatePackageVisualStyling;
- (void)visualStylingProviderDidChange:(id)a3;
@end

@implementation AXCCRoundButton

- (AXCCRoundButton)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v66.receiver = self;
  v66.super_class = (Class)AXCCRoundButton;
  v7 = -[AXCCRoundButton initWithFrame:](&v66, sel_initWithFrame_);
  if (v7)
  {
    id v8 = objc_alloc(MEMORY[0x263F33C70]);
    uint64_t v12 = objc_msgSend_initWithFrame_(v8, v9, v10, v11, x, y, width, height);
    packageView = v7->_packageView;
    v7->_packageView = (CCUICAPackageView *)v12;

    objc_msgSend_setUserInteractionEnabled_(v7->_packageView, v14, 0, v15);
    objc_msgSend_addSubview_(v7, v16, (uint64_t)v7->_packageView, v17);
    v18 = (UIImageView *)objc_alloc_init(MEMORY[0x263F82828]);
    glyphImageView = v7->_glyphImageView;
    v7->_glyphImageView = v18;

    objc_msgSend_setContentMode_(v7->_glyphImageView, v20, 4, v21);
    objc_msgSend_setUserInteractionEnabled_(v7->_glyphImageView, v22, 0, v23);
    objc_msgSend_addSubview_(v7, v24, (uint64_t)v7->_glyphImageView, v25);
    id v26 = objc_alloc(MEMORY[0x263F828E0]);
    uint64_t v30 = objc_msgSend_initWithFrame_(v26, v27, v28, v29, x, y, width, height);
    titleLabel = v7->_titleLabel;
    v7->_titleLabel = (UILabel *)v30;

    objc_msgSend_setNumberOfLines_(v7->_titleLabel, v32, 3, v33);
    objc_msgSend_setTextAlignment_(v7->_titleLabel, v34, 1, v35);
    LODWORD(v36) = 1051931443;
    objc_msgSend__setHyphenationFactor_(v7->_titleLabel, v37, v38, v39, v36);
    v43 = objc_msgSend_labelColor(MEMORY[0x263F825C8], v40, v41, v42);
    objc_msgSend_setTextColor_(v7->_titleLabel, v44, (uint64_t)v43, v45);

    objc_msgSend_addSubview_(v7, v46, (uint64_t)v7->_titleLabel, v47);
    v51 = objc_msgSend_defaultCenter(MEMORY[0x263F08A00], v48, v49, v50);
    objc_msgSend_addObserver_selector_name_object_(v51, v52, (uint64_t)v7, (uint64_t)sel_updateContentSizeCategory, *MEMORY[0x263F83428], 0);

    objc_msgSend_updateContentSizeCategory(v7, v53, v54, v55);
    objc_msgSend_updatePackageVisualStyling(v7, v56, v57, v58);
    objc_msgSend_updateLabelVisualStyling(v7, v59, v60, v61);
    objc_msgSend_updateGlyphImageViewVisualStyling(v7, v62, v63, v64);
  }
  return v7;
}

- (void)layoutSubviews
{
  v63.receiver = self;
  v63.super_class = (Class)AXCCRoundButton;
  [(AXCCRoundButton *)&v63 layoutSubviews];
  objc_msgSend_bounds(self, v3, v4, v5);
  objc_msgSend_imageFrame(self, v6, v7, v8);
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  objc_msgSend_setFrame_(self->_packageView, v17, v18, v19);
  objc_msgSend_imageFrame(self, v20, v21, v22);
  objc_msgSend_setFrame_(self->_glyphImageView, v23, v24, v25);
  int64_t axis = self->_axis;
  if (axis == 1)
  {
    v66.origin.double x = v10;
    v66.origin.double y = v12;
    v66.size.double width = v14;
    v66.size.double height = v16;
    CGRectGetMaxX(v66);
    UIRectInset();
    CGFloat v46 = v45;
    CGFloat v48 = v47;
    CGFloat v50 = v49;
    CGFloat v52 = v51;
    objc_msgSend_sizeThatFits_(self->_titleLabel, v53, v54, v55, v49, v51);
    v67.origin.double x = v46;
    v67.origin.double y = v48;
    v67.size.double width = v50;
    v67.size.double height = v52;
    CGRectGetMinX(v67);
    UIRectCenteredYInRect();
  }
  else
  {
    if (axis) {
      return;
    }
    v64.origin.double x = v10;
    v64.origin.double y = v12;
    v64.size.double width = v14;
    v64.size.double height = v16;
    CGRectGetMaxY(v64);
    UIRectInset();
    CGFloat v28 = v27;
    CGFloat v30 = v29;
    CGFloat v32 = v31;
    CGFloat v34 = v33;
    objc_msgSend_sizeThatFits_(self->_titleLabel, v35, v36, v37, v31, v33);
    v65.origin.double x = v28;
    v65.origin.double y = v30;
    v65.size.double width = v32;
    v65.size.double height = v34;
    CGRectGetMinY(v65);
    UIRectCenteredXInRect();
  }
  double v56 = v41;
  double v57 = v42;
  double v58 = v43;
  double v59 = v44;
  objc_msgSend_setFrame_(self->_titleLabel, v38, v39, v40);
  objc_msgSend_setFrame_(self->_shadowView, v60, v61, v62, v56, v57, v58, v59);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  objc_msgSend_imageFrame(self, a2, v3, v4);
  double v13 = v11;
  double v14 = v12;
  int64_t axis = self->_axis;
  if (axis == 1)
  {
    objc_msgSend_sizeThatFits_(self->_titleLabel, v8, v9, v10, width - (v11 + 8.0), height - v12);
    double v13 = v13 + AXCCSizeCeilToViewScale(self);
    if (v14 < v18) {
      double v14 = v18;
    }
  }
  else if (!axis)
  {
    objc_msgSend_sizeThatFits_(self->_titleLabel, v8, v9, v10, width - v11, height - (v12 + 8.0));
    double v16 = AXCCSizeCeilToViewScale(self);
    if (v16 >= v13) {
      double v13 = v16;
    }
    double v14 = v14 + v17;
  }
  if (v13 >= width) {
    double v19 = width;
  }
  else {
    double v19 = v13;
  }
  if (v14 >= height) {
    double v20 = height;
  }
  else {
    double v20 = v14;
  }
  result.double height = v20;
  result.double width = v19;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  v23.receiver = self;
  v23.super_class = (Class)AXCCRoundButton;
  id v4 = a3;
  [(AXCCRoundButton *)&v23 traitCollectionDidChange:v4];
  uint64_t v8 = objc_msgSend_traitCollection(self, v5, v6, v7, v23.receiver, v23.super_class);
  uint64_t v12 = objc_msgSend_userInterfaceStyle(v8, v9, v10, v11);
  uint64_t v16 = objc_msgSend_userInterfaceStyle(v4, v13, v14, v15);

  if (v12 != v16)
  {
    objc_msgSend_updatePackageVisualStyling(self, v17, v18, v19);
    objc_msgSend_updateGlyphImageViewVisualStyling(self, v20, v21, v22);
  }
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
  id v5 = a3;
  objc_msgSend_setText_(self->_titleLabel, v6, (uint64_t)v5, v7);
  objc_msgSend_setAccessibilityLabel_(self, v8, (uint64_t)v5, v9);

  objc_msgSend_setNeedsLayout(self, v10, v11, v12);
}

- (void)setPackageName:(id)a3
{
  id v20 = a3;
  if ((objc_msgSend_isEqualToString_(self->_packageName, v5, (uint64_t)v20, v6) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_packageName, a3);
    uint64_t v7 = (void *)MEMORY[0x263F33C68];
    uint64_t v8 = (void *)MEMORY[0x263F086E0];
    uint64_t v9 = objc_opt_class();
    uint64_t v12 = objc_msgSend_bundleForClass_(v8, v10, v9, v11);
    uint64_t v14 = objc_msgSend_descriptionForPackageNamed_inBundle_(v7, v13, (uint64_t)v20, (uint64_t)v12);
    objc_msgSend_setPackageDescription_(self->_packageView, v15, (uint64_t)v14, v16);

    objc_msgSend_updatePackageVisualStyling(self, v17, v18, v19);
  }
}

- (void)setGlyphState:(id)a3
{
  id v9 = a3;
  if ((objc_msgSend_isEqualToString_(self->_glyphState, v5, (uint64_t)v9, v6) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_glyphState, a3);
    objc_msgSend_setStateName_(self->_packageView, v7, (uint64_t)v9, v8);
  }
}

- (void)setImage:(id)a3
{
  objc_msgSend_imageWithRenderingMode_(a3, a2, 0, v3);
  id v5 = (UIImage *)objc_claimAutoreleasedReturnValue();
  glyphImage = self->_glyphImage;
  self->_glyphImage = v5;

  objc_msgSend_setImage_(self->_glyphImageView, v7, (uint64_t)self->_glyphImage, v8);

  objc_msgSend_updateGlyphImageViewVisualStyling(self, v9, v10, v11);
}

- (CGRect)imageFrame
{
  uint64_t v5 = objc_msgSend_contentVerticalAlignment(self, a2, v2, v3);
  objc_msgSend_bounds(self, v6, v7, v8);
  if (v5) {
    UIRectCenteredXInRect();
  }
  else {
    UIRectCenteredIntegralRect();
  }
  result.size.double height = v12;
  result.size.double width = v11;
  result.origin.double y = v10;
  result.origin.double x = v9;
  return result;
}

- (void)setAxis:(int64_t)a3
{
  self->_int64_t axis = a3;
  if (a3) {
    objc_msgSend_setTextAlignment_(self->_titleLabel, a2, 4, v3);
  }
  else {
    objc_msgSend_setTextAlignment_(self->_titleLabel, a2, 1, v3);
  }

  objc_msgSend_setNeedsLayout(self, v5, v6, v7);
}

- (void)setStylingProvider:(id)a3
{
  uint64_t v5 = (const char *)a3;
  stylingProvider = (char *)self->_stylingProvider;
  if (stylingProvider != v5)
  {
    uint64_t v19 = v5;
    objc_msgSend_removeObserver_(stylingProvider, v5, (uint64_t)self, v6);
    objc_storeStrong((id *)&self->_stylingProvider, a3);
    objc_msgSend_addObserver_(self->_stylingProvider, v8, (uint64_t)self, v9);
    objc_msgSend_updateLabelVisualStyling(self, v10, v11, v12);
    objc_msgSend_updatePackageVisualStyling(self, v13, v14, v15);
    stylingProvider = (char *)objc_msgSend_updateGlyphImageViewVisualStyling(self, v16, v17, v18);
    uint64_t v5 = v19;
  }

  MEMORY[0x270F9A758](stylingProvider, v5);
}

- (void)setLabelHidden:(BOOL)a3
{
  self->_labelHidden = a3;
  objc_msgSend_updateLabelVisualStyling(self, a2, a3, v3);
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AXCCRoundButton;
  -[AXCCRoundButton setHighlighted:](&v9, sel_setHighlighted_);
  double v8 = 0.2;
  if (!v3) {
    double v8 = 1.0;
  }
  objc_msgSend_setAlpha_(self->_packageView, v5, v6, v7, v8);
}

- (void)setSelected:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)AXCCRoundButton;
  [(AXCCRoundButton *)&v7 setSelected:a3];
  objc_msgSend_updatePackageVisualStyling(self, v4, v5, v6);
}

- (void)setEnabled:(BOOL)a3
{
  v13.receiver = self;
  v13.super_class = (Class)AXCCRoundButton;
  [(AXCCRoundButton *)&v13 setEnabled:a3];
  objc_msgSend_updateLabelVisualStyling(self, v4, v5, v6);
  objc_msgSend_updatePackageVisualStyling(self, v7, v8, v9);
  objc_msgSend_updateGlyphImageViewVisualStyling(self, v10, v11, v12);
}

- (void)controlCenterApplyPrimaryContentShadow
{
  if (!self->_shadowView)
  {
    BOOL v3 = objc_alloc_init(AXCCShadowView);
    shadowView = self->_shadowView;
    self->_shadowView = v3;

    objc_msgSend_controlCenterApplyPrimaryContentShadow(self->_shadowView, v5, v6, v7);
    uint64_t v8 = self->_shadowView;
    titleLabel = self->_titleLabel;
    MEMORY[0x270F9A6D0](self, sel_insertSubview_below_, v8, titleLabel);
  }
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  objc_msgSend_imageFrame(self, a2, (uint64_t)a4, v4);
  CGFloat v11 = x;
  CGFloat v12 = y;

  return CGRectContainsPoint(*(CGRect *)&v7, *(CGPoint *)&v11);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  uint64_t v4 = objc_msgSend_titleLabel(self, a2, v2, v3);
  uint64_t v8 = objc_msgSend_accessibilityLabel(v4, v5, v6, v7);

  return v8;
}

- (CGRect)accessibilityFrame
{
  uint64_t v4 = objc_msgSend_packageView(self, a2, v2, v3);
  objc_msgSend_accessibilityFrame(v4, v5, v6, v7);
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;

  double v16 = v9;
  double v17 = v11;
  double v18 = v13;
  double v19 = v15;
  result.size.double height = v19;
  result.size.double width = v18;
  result.origin.CGFloat y = v17;
  result.origin.CGFloat x = v16;
  return result;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)AXCCRoundButton;
  return (*MEMORY[0x263F83260] | [(AXCCRoundButton *)&v3 accessibilityTraits]) & ~*MEMORY[0x263F83290];
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  objc_msgSend_view(v4, v5, v6, v7);
  double v8 = (AXCCRoundButton *)objc_claimAutoreleasedReturnValue();
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

- (void)visualStylingProviderDidChange:(id)a3
{
  objc_msgSend_updateLabelVisualStyling(self, a2, (uint64_t)a3, v3);
  objc_msgSend_updatePackageVisualStyling(self, v5, v6, v7);

  objc_msgSend_updateGlyphImageViewVisualStyling(self, v8, v9, v10);
}

- (void)updateLabelVisualStyling
{
  if (self->_labelHidden)
  {
    titleLabel = self->_titleLabel;
    double v6 = 0.0;
LABEL_13:
    objc_msgSend_setAlpha_(titleLabel, a2, v2, v3, v6);
    return;
  }
  if (!self->_stylingProvider) {
    goto LABEL_9;
  }
  char isEnabled = objc_msgSend_isEnabled(self, a2, v2, v3);
  stylingProvider = self->_stylingProvider;
  if ((isEnabled & 1) == 0)
  {
    objc_msgSend_applyStyle_toView_(stylingProvider, a2, 0, (uint64_t)self->_titleLabel);
    titleLabel = self->_titleLabel;
    goto LABEL_12;
  }
  if (!stylingProvider)
  {
LABEL_9:
    char v10 = objc_msgSend_isEnabled(self, a2, v2, v3);
    titleLabel = self->_titleLabel;
    if (v10)
    {
      double v6 = 1.0;
      goto LABEL_13;
    }
LABEL_12:
    double v6 = 0.5;
    goto LABEL_13;
  }
  uint64_t v9 = self->_titleLabel;

  objc_msgSend_applyStyle_toView_(stylingProvider, a2, 0, (uint64_t)v9);
}

- (void)updatePackageVisualStyling
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  if (objc_msgSend_isEnabled(self, a2, v2, v3)) {
    objc_msgSend_setAlpha_(self->_packageView, v5, v6, v7, 1.0);
  }
  else {
    objc_msgSend_setAlpha_(self->_packageView, v5, v6, v7, 0.5);
  }
  stylingProvider = self->_stylingProvider;
  if (stylingProvider)
  {
    double v12 = objc_msgSend_primaryColor(stylingProvider, v8, v9, v10);
  }
  else
  {
    if (objc_msgSend_isSelected(self, v8, v9, v10)) {
      objc_msgSend_systemWhiteColor(MEMORY[0x263F825C8], v13, v14, v15);
    }
    else {
    double v12 = objc_msgSend_systemGrayColor(MEMORY[0x263F825C8], v13, v14, v15);
    }
  }
  id v16 = v12;
  uint64_t v20 = objc_msgSend_CGColor(v16, v17, v18, v19);

  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  uint64_t v24 = objc_msgSend_package(self->_packageView, v21, v22, v23, 0);
  CGFloat v28 = objc_msgSend_publishedObjectNames(v24, v25, v26, v27);

  uint64_t v30 = objc_msgSend_countByEnumeratingWithState_objects_count_(v28, v29, (uint64_t)&v52, (uint64_t)v56, 16);
  if (v30)
  {
    uint64_t v33 = v30;
    uint64_t v34 = *(void *)v53;
    do
    {
      for (uint64_t i = 0; i != v33; ++i)
      {
        if (*(void *)v53 != v34) {
          objc_enumerationMutation(v28);
        }
        uint64_t v36 = *(void **)(*((void *)&v52 + 1) + 8 * i);
        if (objc_msgSend_hasSuffix_(v36, v31, @"-tint-shape", v32))
        {
          uint64_t v40 = objc_msgSend_package(self->_packageView, v37, v38, v39);
          double v43 = objc_msgSend_publishedObjectWithName_(v40, v41, (uint64_t)v36, v42);

          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            objc_msgSend_setFillColor_(v43, v44, v20, v45);
          }
        }
        else
        {
          if (!objc_msgSend_hasSuffix_(v36, v37, @"-tint-bg", v39)) {
            continue;
          }
          double v47 = objc_msgSend_package(self->_packageView, v31, v46, v32);
          double v43 = objc_msgSend_publishedObjectWithName_(v47, v48, (uint64_t)v36, v49);

          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            objc_msgSend_setBackgroundColor_(v43, v50, v20, v51);
          }
        }
      }
      uint64_t v33 = objc_msgSend_countByEnumeratingWithState_objects_count_(v28, v31, (uint64_t)&v52, (uint64_t)v56, 16);
    }
    while (v33);
  }
}

- (void)updateGlyphImageViewVisualStyling
{
  if (objc_msgSend_isEnabled(self, a2, v2, v3)) {
    objc_msgSend_setAlpha_(self->_glyphImageView, v5, v6, v7, 1.0);
  }
  else {
    objc_msgSend_setAlpha_(self->_glyphImageView, v5, v6, v7, 0.5);
  }
  if (objc_msgSend_isSelected(self, v8, v9, v10)) {
    objc_msgSend_systemDarkGrayColor(MEMORY[0x263F825C8], v11, v12, v13);
  }
  else {
    objc_msgSend_systemWhiteColor(MEMORY[0x263F825C8], v11, v12, v13);
  }
  uint64_t v18 = (char *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTintColor_(self->_glyphImageView, v18, (uint64_t)v18, v14);
  objc_msgSend_controlCenterApplyPrimaryContentShadow(self->_glyphImageView, v15, v16, v17);
}

- (void)updateContentSizeCategory
{
  objc_msgSend__preferredFontForTextStyle_maximumContentSizeCategory_(MEMORY[0x263F81708], a2, *MEMORY[0x263F835D0], *MEMORY[0x263F83440]);
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = (void *)MEMORY[0x263F81708];
  objc_msgSend_pointSize(v13, v4, v5, v6);
  uint64_t v10 = objc_msgSend_boldSystemFontOfSize_(v3, v7, v8, v9);
  objc_msgSend_setFont_(self->_titleLabel, v11, (uint64_t)v10, v12);
}

- (NSString)title
{
  return self->_title;
}

- (NSString)packageName
{
  return self->_packageName;
}

- (NSString)glyphState
{
  return self->_glyphState;
}

- (AXCCVisualStylingProvider)stylingProvider
{
  return self->_stylingProvider;
}

- (int64_t)axis
{
  return self->_axis;
}

- (UIImage)image
{
  return self->_image;
}

- (CGSize)imageSize
{
  double width = self->_imageSize.width;
  double height = self->_imageSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setImageSize:(CGSize)a3
{
  self->_imageSize = a3;
}

- (BOOL)isLabelHidden
{
  return self->_labelHidden;
}

- (CCUICAPackageView)packageView
{
  return self->_packageView;
}

- (void)setPackageView:(id)a3
{
}

- (UIImageView)glyphImageView
{
  return self->_glyphImageView;
}

- (void)setGlyphImageView:(id)a3
{
}

- (UIImage)glyphImage
{
  return self->_glyphImage;
}

- (void)setGlyphImage:(id)a3
{
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (AXCCShadowView)shadowView
{
  return self->_shadowView;
}

- (void)setShadowView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shadowView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_glyphImage, 0);
  objc_storeStrong((id *)&self->_glyphImageView, 0);
  objc_storeStrong((id *)&self->_packageView, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_stylingProvider, 0);
  objc_storeStrong((id *)&self->_glyphState, 0);
  objc_storeStrong((id *)&self->_packageName, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end