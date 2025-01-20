@interface ASTButtonCell
- (ASTButtonCell)initWithLocation:(id)a3 iconKey:(id)a4;
- (BOOL)isAccessibilityElement;
- (CGRect)accessibilityFrame;
- (NSLayoutConstraint)borderHeightConstraint;
- (NSLayoutConstraint)borderWidthConstraint;
- (NSString)iconKey;
- (NSString)location;
- (UIImageView)imageView;
- (UILabel)label;
- (UIView)borderView;
- (UIView)imageViewContainerView;
- (id)_iconColor;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (id)activateCellBlock;
- (void)_activate:(id)a3;
- (void)_traitCollectionDidChange:(id)a3;
- (void)_updateBorderConstraints;
- (void)_updateFont;
- (void)_updateImage;
- (void)setActivateCellBlock:(id)a3;
- (void)setBorderHeightConstraint:(id)a3;
- (void)setBorderWidthConstraint:(id)a3;
- (void)setIconKey:(id)a3;
- (void)setLocation:(id)a3;
@end

@implementation ASTButtonCell

- (ASTButtonCell)initWithLocation:(id)a3 iconKey:(id)a4
{
  id v72 = a3;
  id v73 = a4;
  v77.receiver = self;
  v77.super_class = (Class)ASTButtonCell;
  v6 = [(ASTButtonCell *)&v77 init];
  if (v6)
  {
    id v7 = objc_alloc((Class)AXDynamicTypeImageView);
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
    v11 = (AXDynamicTypeImageView *)objc_msgSend(v7, "initWithFrame:", CGRectZero.origin.x, y, width, height);
    imageView = v6->_imageView;
    v6->_imageView = v11;

    [(AXDynamicTypeImageView *)v6->_imageView setAccessibilityIdentifier:@"ASTButton"];
    [(AXDynamicTypeImageView *)v6->_imageView setTranslatesAutoresizingMaskIntoConstraints:0];
    v13 = +[AXAssistiveTouchLayoutView fontMetrics];
    [(AXDynamicTypeImageView *)v6->_imageView setFontMetrics:v13];

    v14 = +[AXAssistiveTouchLayoutView imageMinimumContentSizeCategory];
    [(AXDynamicTypeImageView *)v6->_imageView setMinimumContentSizeCategory:v14];

    v15 = +[AXAssistiveTouchLayoutView imageMaximumContentSizeCategory];
    [(AXDynamicTypeImageView *)v6->_imageView setMaximumContentSizeCategory:v15];

    [(ASTButtonCell *)v6 _updateImage];
    [(ASTButtonCell *)v6 addSubview:v6->_imageView];
    v16 = (UILabel *)objc_msgSend(objc_allocWithZone((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    label = v6->_label;
    v6->_label = v16;

    v18 = +[UIColor clearColor];
    [(UILabel *)v6->_label setBackgroundColor:v18];

    [(UILabel *)v6->_label setAdjustsFontSizeToFitWidth:1];
    [(UILabel *)v6->_label setMinimumScaleFactor:0.5];
    [(UILabel *)v6->_label setClipsToBounds:0];
    [(UILabel *)v6->_label setTextAlignment:1];
    [(UILabel *)v6->_label setLineBreakMode:4];
    [(ASTButtonCell *)v6 _updateFont];
    v19 = [(ASTButtonCell *)v6 _iconColor];
    [(UILabel *)v6->_label setTextColor:v19];

    [(UILabel *)v6->_label setNumberOfLines:0];
    [(UILabel *)v6->_label setIsAccessibilityElement:0];
    [(UILabel *)v6->_label setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v20) = 981668463;
    [(UILabel *)v6->_label _setHyphenationFactor:v20];
    [(ASTButtonCell *)v6 addSubview:v6->_label];
    v21 = +[NSBundle bundleForClass:objc_opt_class()];
    v22 = +[UIImage imageNamed:@"ASTCustomization_Selector" inBundle:v21];
    v71 = [v22 imageWithRenderingMode:2];

    v23 = (UIImageView *)[objc_alloc((Class)UIImageView) initWithImage:v71];
    borderView = v6->_borderView;
    v6->_borderView = v23;

    [(UIImageView *)v6->_borderView setTranslatesAutoresizingMaskIntoConstraints:0];
    uint64_t v25 = +[UIColor secondaryLabelColor];
    borderColor = v6->_borderColor;
    v6->_borderColor = (UIColor *)v25;

    [(UIImageView *)v6->_borderView setTintColor:v6->_borderColor];
    [(ASTButtonCell *)v6 addSubview:v6->_borderView];
    [(ASTButtonCell *)v6 setLocation:v72];
    [(ASTButtonCell *)v6 setIconKey:v73];
    v27 = [(UIImageView *)v6->_borderView widthAnchor];
    uint64_t v28 = [v27 constraintEqualToConstant:0.0];
    borderWidthConstraint = v6->_borderWidthConstraint;
    v6->_borderWidthConstraint = (NSLayoutConstraint *)v28;

    v30 = [(UIImageView *)v6->_borderView heightAnchor];
    uint64_t v31 = [v30 constraintEqualToConstant:0.0];
    borderHeightConstraint = v6->_borderHeightConstraint;
    v6->_borderHeightConstraint = (NSLayoutConstraint *)v31;

    [(ASTButtonCell *)v6 _updateBorderConstraints];
    v70 = [(UIImageView *)v6->_borderView topAnchor];
    v69 = [(ASTButtonCell *)v6 topAnchor];
    v68 = [v70 constraintEqualToAnchor:v69];
    v79[0] = v68;
    v79[1] = v6->_borderHeightConstraint;
    v67 = [(AXDynamicTypeImageView *)v6->_imageView centerYAnchor];
    v66 = [(UIImageView *)v6->_borderView centerYAnchor];
    v65 = [v67 constraintEqualToAnchor:v66];
    v79[2] = v65;
    v64 = [(UILabel *)v6->_label topAnchor];
    v63 = [(UIImageView *)v6->_borderView bottomAnchor];
    v62 = [v64 constraintEqualToAnchor:v63 constant:3.0];
    v79[3] = v62;
    v61 = [(UILabel *)v6->_label bottomAnchor];
    v60 = [(ASTButtonCell *)v6 bottomAnchor];
    v59 = [v61 constraintEqualToAnchor:v60];
    v79[4] = v59;
    v58 = [(UILabel *)v6->_label centerXAnchor];
    v57 = [(AXDynamicTypeImageView *)v6->_imageView centerXAnchor];
    v56 = [v58 constraintEqualToAnchor:v57];
    v79[5] = v56;
    v55 = [(AXDynamicTypeImageView *)v6->_imageView centerXAnchor];
    v54 = [(UIImageView *)v6->_borderView centerXAnchor];
    v53 = [v55 constraintEqualToAnchor:v54];
    v79[6] = v53;
    v79[7] = v6->_borderWidthConstraint;
    v52 = [(UIImageView *)v6->_borderView centerXAnchor];
    v51 = [(ASTButtonCell *)v6 centerXAnchor];
    v50 = [v52 constraintEqualToAnchor:v51];
    v79[8] = v50;
    v49 = [(UIImageView *)v6->_borderView leadingAnchor];
    v48 = [(ASTButtonCell *)v6 leadingAnchor];
    v47 = [v49 constraintGreaterThanOrEqualToAnchor:v48];
    v79[9] = v47;
    v46 = [(UILabel *)v6->_label leadingAnchor];
    v33 = [(ASTButtonCell *)v6 leadingAnchor];
    v34 = [v46 constraintGreaterThanOrEqualToAnchor:v33];
    v79[10] = v34;
    v35 = [(UIImageView *)v6->_borderView trailingAnchor];
    v36 = [(ASTButtonCell *)v6 trailingAnchor];
    v37 = [v35 constraintLessThanOrEqualToAnchor:v36];
    v79[11] = v37;
    v38 = [(UILabel *)v6->_label trailingAnchor];
    v39 = [(ASTButtonCell *)v6 trailingAnchor];
    v40 = [v38 constraintLessThanOrEqualToAnchor:v39];
    v79[12] = v40;
    v41 = +[NSArray arrayWithObjects:v79 count:13];
    +[NSLayoutConstraint activateConstraints:v41];

    objc_initWeak(&location, v6);
    v78[0] = objc_opt_class();
    v78[1] = objc_opt_class();
    v42 = +[NSArray arrayWithObjects:v78 count:2];
    v74[0] = _NSConcreteStackBlock;
    v74[1] = 3221225472;
    v74[2] = __42__ASTButtonCell_initWithLocation_iconKey___block_invoke;
    v74[3] = &unk_208A18;
    objc_copyWeak(&v75, &location);
    id v43 = [(ASTButtonCell *)v6 registerForTraitChanges:v42 withHandler:v74];

    v44 = v6;
    objc_destroyWeak(&v75);
    objc_destroyWeak(&location);
  }
  return v6;
}

void __42__ASTButtonCell_initWithLocation_iconKey___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v3 = (id *)(a1 + 32);
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained _traitCollectionDidChange:v4];
}

- (void)setIconKey:(id)a3
{
  if (self->_iconKey != a3)
  {
    objc_storeStrong((id *)&self->_iconKey, a3);
    [(ASTButtonCell *)self _updateImage];
    v5 = [(ASTButtonCell *)self iconKey];
    uint64_t v6 = AXUIAssistiveTouchStringForName();

    if (v6) {
      id v7 = (__CFString *)v6;
    }
    else {
      id v7 = &stru_20F6B8;
    }
    if ([(__CFString *)v7 containsString:@"\\n"])
    {
      uint64_t v8 = [(__CFString *)v7 stringByReplacingOccurrencesOfString:@"\\n" withString:@"\n"];

      id v7 = (__CFString *)v8;
    }
    [(UILabel *)self->_label setText:v7];
  }

  _objc_release_x1();
}

- (UIView)imageViewContainerView
{
  return (UIView *)self->_borderView;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (CGRect)accessibilityFrame
{
  [(UIImageView *)self->_borderView accessibilityFrame];
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.x = v2;
  return result;
}

- (id)accessibilityHint
{
  return settingsLocString(@"customization.hint", @"HandSettings");
}

- (id)accessibilityLabel
{
  return [(UILabel *)self->_label accessibilityLabel];
}

- (id)accessibilityValue
{
  double v3 = [(ASTButtonCell *)self location];
  unsigned __int8 v4 = [v3 isEqualToString:AXAssistiveTouchIconLocationTopLeft];

  if (v4)
  {
    double v5 = @"top.left.accessibility.description";
LABEL_19:
    v22 = settingsLocString(v5, @"HandSettings");
    goto LABEL_20;
  }
  uint64_t v6 = [(ASTButtonCell *)self location];
  unsigned __int8 v7 = [v6 isEqualToString:AXAssistiveTouchIconLocationTopMiddle];

  if (v7)
  {
    double v5 = @"top.middle.accessibility.description";
    goto LABEL_19;
  }
  uint64_t v8 = [(ASTButtonCell *)self location];
  unsigned __int8 v9 = [v8 isEqualToString:AXAssistiveTouchIconLocationTopRight];

  if (v9)
  {
    double v5 = @"top.right.accessibility.description";
    goto LABEL_19;
  }
  v10 = [(ASTButtonCell *)self location];
  unsigned __int8 v11 = [v10 isEqualToString:AXAssistiveTouchIconLocationMidLeft];

  if (v11)
  {
    double v5 = @"mid.left.accessibility.description";
    goto LABEL_19;
  }
  v12 = [(ASTButtonCell *)self location];
  unsigned __int8 v13 = [v12 isEqualToString:AXAssistiveTouchIconLocationMidMiddle];

  if (v13)
  {
    double v5 = @"mid.middle.accessibility.description";
    goto LABEL_19;
  }
  v14 = [(ASTButtonCell *)self location];
  unsigned __int8 v15 = [v14 isEqualToString:AXAssistiveTouchIconLocationMidRight];

  if (v15)
  {
    double v5 = @"mid.right.accessibility.description";
    goto LABEL_19;
  }
  v16 = [(ASTButtonCell *)self location];
  unsigned __int8 v17 = [v16 isEqualToString:AXAssistiveTouchIconLocationBottomLeft];

  if (v17)
  {
    double v5 = @"bottom.left.accessibility.description";
    goto LABEL_19;
  }
  v18 = [(ASTButtonCell *)self location];
  unsigned __int8 v19 = [v18 isEqualToString:AXAssistiveTouchIconLocationBottomMiddle];

  if (v19)
  {
    double v5 = @"bottom.center.accessibility.description";
    goto LABEL_19;
  }
  double v20 = [(ASTButtonCell *)self location];
  unsigned int v21 = [v20 isEqualToString:AXAssistiveTouchIconLocationBottomRight];

  if (v21)
  {
    double v5 = @"bottom.right.accessibility.description";
    goto LABEL_19;
  }
  v22 = 0;
LABEL_20:

  return v22;
}

- (void)_traitCollectionDidChange:(id)a3
{
  [(ASTButtonCell *)self _updateFont];
  [(ASTButtonCell *)self _updateImage];
  [(ASTButtonCell *)self _updateBorderConstraints];
  unsigned __int8 v4 = [(ASTButtonCell *)self _iconColor];
  [(UILabel *)self->_label setTextColor:v4];

  borderColor = self->_borderColor;
  borderView = self->_borderView;

  [(UIImageView *)borderView setTintColor:borderColor];
}

- (id)_iconColor
{
  return +[UIColor labelColor];
}

- (void)_activate:(id)a3
{
  unsigned __int8 v4 = [(ASTButtonCell *)self activateCellBlock];
  v4[2](v4, self);
}

- (void)_updateFont
{
  id v3 = +[AXAssistiveTouchLayoutView labelFont];
  [(UILabel *)self->_label setFont:v3];
}

- (void)_updateImage
{
  id v3 = [(ASTButtonCell *)self iconKey];
  unsigned int v4 = [v3 hasPrefix:@"__empty"];

  if (!v4) {
    goto LABEL_3;
  }
  double v5 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v6 = +[UIImage imageNamed:@"ASTCustomization_Add" inBundle:v5];
  unsigned __int8 v7 = [(ASTButtonCell *)self _iconColor];
  id v17 = [v6 imageWithTintColor:v7 renderingMode:1];

  if (!v17)
  {
LABEL_3:
    uint64_t v8 = [(ASTButtonCell *)self iconKey];
    id v9 = [v8 length];

    if (v9)
    {
      v10 = [(ASTButtonCell *)self iconKey];
      unsigned __int8 v11 = AXUIAssistiveTouchImageForName();
      v12 = [(ASTButtonCell *)self _iconColor];
      id v17 = [v11 imageWithTintColor:v12 renderingMode:1];
    }
    else
    {
      id v17 = 0;
    }
  }
  if ([(ASTButtonCell *)self effectiveUserInterfaceLayoutDirection] == (char *)&dword_0 + 1)
  {
    unsigned __int8 v13 = [(ASTButtonCell *)self iconKey];
    v14 = AXUIAssistiveTouchImageNameForName();
    int v15 = AXUIAssistiveTouchIconRequiresRTLFlipping();

    if (v15)
    {
      uint64_t v16 = [v17 imageWithHorizontallyFlippedOrientation];

      id v17 = (id)v16;
    }
  }
  [(AXDynamicTypeImageView *)self->_imageView setImage:v17];
}

- (void)_updateBorderConstraints
{
  id v3 = +[AXAssistiveTouchLayoutView fontMetrics];
  unsigned int v4 = +[AXAssistiveTouchLayoutView traitCollectionForImagePreferredContentSizeCategory];
  [v3 scaledValueForValue:v4 compatibleWithTraitCollection:65.0];
  double v6 = v5;

  unsigned __int8 v7 = [(ASTButtonCell *)self borderWidthConstraint];
  [v7 setConstant:v6];

  id v8 = [(ASTButtonCell *)self borderHeightConstraint];
  [v8 setConstant:v6];
}

- (UIImageView)imageView
{
  return (UIImageView *)self->_imageView;
}

- (UILabel)label
{
  return self->_label;
}

- (id)activateCellBlock
{
  return self->_activateCellBlock;
}

- (void)setActivateCellBlock:(id)a3
{
}

- (NSString)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
}

- (NSString)iconKey
{
  return self->_iconKey;
}

- (UIView)borderView
{
  return &self->_borderView->super;
}

- (NSLayoutConstraint)borderWidthConstraint
{
  return self->_borderWidthConstraint;
}

- (void)setBorderWidthConstraint:(id)a3
{
}

- (NSLayoutConstraint)borderHeightConstraint
{
  return self->_borderHeightConstraint;
}

- (void)setBorderHeightConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_borderHeightConstraint, 0);
  objc_storeStrong((id *)&self->_borderWidthConstraint, 0);
  objc_storeStrong((id *)&self->_iconKey, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong(&self->_activateCellBlock, 0);
  objc_storeStrong((id *)&self->_borderColor, 0);
  objc_storeStrong((id *)&self->_borderView, 0);
  objc_storeStrong((id *)&self->_label, 0);

  objc_storeStrong((id *)&self->_imageView, 0);
}

@end