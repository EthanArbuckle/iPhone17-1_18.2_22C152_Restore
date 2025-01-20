@interface HKReferenceRangeView
- (BOOL)_hasReferenceRange;
- (CGRect)_assureLabelFrameWithinBounds:(CGRect)a3;
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (HKReferenceRangeDotView)currentValueView;
- (HKReferenceRangeView)initWithFrame:(CGRect)a3 configuration:(id)a4;
- (HKReferenceRangeViewConfiguration)configuration;
- (HKReferenceRangeViewData)data;
- (NSString)multiValueSeparator;
- (UIFont)dynamicTypeAnchorFont;
- (UIFont)overriddenValueFont;
- (UIFont)unitFont;
- (UIFont)valueFont;
- (UILabel)currentValueLabel;
- (UILabel)highValueLabel;
- (UILabel)lowValueLabel;
- (UILabel)outOfRangeLabel;
- (UIView)referenceRangeContainerView;
- (UIView)referenceRangeView;
- (id)_configuredPreferredFontForTextStyle:(id)a3 symbolicTraits:(unsigned int)a4;
- (id)_generateAttributedValueStringWithOverrideColor:(id)a3;
- (id)_generateMultilineAttributedValueStringForOriginalString:(id)a3;
- (id)_outOfRangeColor;
- (id)unitLabelFont;
- (id)valueLabelFont;
- (void)_applyNormalizedValuesToView;
- (void)_dynamicUserInterfaceTraitDidChange;
- (void)_layoutCurrentValueOnly;
- (void)_layoutFullReferenceRange;
- (void)_normalizeValuesIfNeeded;
- (void)_setupSubviews;
- (void)_updateContainerBorderColors;
- (void)layoutSubviews;
- (void)setCurrentValueLabel:(id)a3;
- (void)setCurrentValueView:(id)a3;
- (void)setData:(id)a3;
- (void)setDynamicTypeAnchorFont:(id)a3;
- (void)setHighValueLabel:(id)a3;
- (void)setLowValueLabel:(id)a3;
- (void)setMultiValueSeparator:(id)a3;
- (void)setOutOfRangeLabel:(id)a3;
- (void)setOverriddenValueFont:(id)a3;
- (void)setReferenceRangeContainerView:(id)a3;
- (void)setReferenceRangeView:(id)a3;
- (void)setUnitFont:(id)a3;
- (void)setValueFont:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateWithData:(id)a3;
@end

@implementation HKReferenceRangeView

- (HKReferenceRangeView)initWithFrame:(CGRect)a3 configuration:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v10 = a4;
  v15.receiver = self;
  v15.super_class = (Class)HKReferenceRangeView;
  v11 = -[HKReferenceRangeView initWithFrame:](&v15, sel_initWithFrame_, x, y, width, height);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_configuration, a4);
    [(HKReferenceRangeView *)v12 _setupSubviews];
    multiValueSeparator = v12->_multiValueSeparator;
    v12->_multiValueSeparator = (NSString *)@" ";
  }
  return v12;
}

- (CGSize)intrinsicContentSize
{
  BOOL v3 = [(HKReferenceRangeView *)self _hasReferenceRange];
  double v4 = 160.0;
  if (!v3) {
    double v4 = 1.79769313e308;
  }
  [(HKReferenceRangeView *)self sizeThatFits:v4];
  result.double height = v6;
  result.double width = v5;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  if ([(HKReferenceRangeView *)self _hasReferenceRange])
  {
    double intrinsicHeight = self->_intrinsicHeight;
    if (intrinsicHeight == 0.0)
    {
      [(HKReferenceRangeView *)self layoutIfNeeded];
      double intrinsicHeight = self->_intrinsicHeight;
    }
    *(double *)&uint64_t v7 = 160.0;
  }
  else
  {
    v8 = [(HKReferenceRangeView *)self currentValueLabel];
    v9 = [v8 attributedText];

    objc_msgSend(v9, "boundingRectWithSize:options:context:", 1, 0, width, height);
    double v11 = v10;
    v12 = [(HKReferenceRangeView *)self valueLabelFont];
    [v12 lineHeight];
    double v14 = v13 * 1.25;

    if (v14 < v11)
    {
      objc_super v15 = [(HKReferenceRangeView *)self _generateMultilineAttributedValueStringForOriginalString:v9];

      v16 = [(HKReferenceRangeView *)self currentValueLabel];
      [v16 setAttributedText:v15];

      objc_msgSend(v15, "boundingRectWithSize:options:context:", 1, 0, width, height);
      v9 = v15;
    }
    UICeilToViewScale();
    uint64_t v7 = v17;
    UICeilToViewScale();
    double intrinsicHeight = v18;
  }
  double v19 = *(double *)&v7;
  double v20 = intrinsicHeight;
  result.double height = v20;
  result.double width = v19;
  return result;
}

- (UIFont)dynamicTypeAnchorFont
{
  if (!self->_dynamicTypeAnchorFont)
  {
    BOOL v3 = [(HKReferenceRangeViewConfiguration *)self->_configuration dynamicTypeAnchorFont];

    if (v3) {
      [(HKReferenceRangeViewConfiguration *)self->_configuration dynamicTypeAnchorFont];
    }
    else {
      objc_msgSend(MEMORY[0x1E4FB08E0], "hk_preferredFontForTextStyle:symbolicTraits:", *MEMORY[0x1E4FB28C8], 0);
    }
    double v4 = (UIFont *)objc_claimAutoreleasedReturnValue();
    dynamicTypeAnchorFont = self->_dynamicTypeAnchorFont;
    self->_dynamicTypeAnchorFont = v4;
  }
  double v6 = self->_dynamicTypeAnchorFont;
  return v6;
}

- (id)valueLabelFont
{
  if (!self->_valueFont)
  {
    uint64_t v3 = [(HKReferenceRangeViewConfiguration *)self->_configuration currentValueValueFontWithRange];
    if (v3
      && (double v4 = (void *)v3,
          BOOL v5 = [(HKReferenceRangeView *)self _hasReferenceRange],
          v4,
          v5))
    {
      double v6 = [(HKReferenceRangeViewConfiguration *)self->_configuration currentValueValueFontWithRange];
    }
    else
    {
      uint64_t v7 = [(HKReferenceRangeViewConfiguration *)self->_configuration currentValueValueFontWithoutRange];
      if (v7
        && (v8 = (void *)v7,
            BOOL v9 = [(HKReferenceRangeView *)self _hasReferenceRange],
            v8,
            !v9))
      {
        double v6 = [(HKReferenceRangeViewConfiguration *)self->_configuration currentValueValueFontWithoutRange];
      }
      else
      {
        objc_msgSend(MEMORY[0x1E4FB08E0], "hk_chrValueCellPrimaryFont");
        double v6 = (UIFont *)objc_claimAutoreleasedReturnValue();
      }
    }
    valueFont = self->_valueFont;
    self->_valueFont = v6;
  }
  double v11 = self->_valueFont;
  return v11;
}

- (id)unitLabelFont
{
  if (!self->_unitFont)
  {
    uint64_t v3 = [(HKReferenceRangeViewConfiguration *)self->_configuration currentValueUnitFont];

    if (v3) {
      [(HKReferenceRangeViewConfiguration *)self->_configuration currentValueUnitFont];
    }
    else {
    double v4 = [MEMORY[0x1E4FB08E0] _preferredFontForTextStyle:*MEMORY[0x1E4FB2950] variant:1280];
    }
    unitFont = self->_unitFont;
    self->_unitFont = v4;
  }
  double v6 = self->_unitFont;
  return v6;
}

- (void)layoutSubviews
{
  v9.receiver = self;
  v9.super_class = (Class)HKReferenceRangeView;
  [(HKReferenceRangeView *)&v9 layoutSubviews];
  if ([(HKReferenceRangeView *)self _hasReferenceRange])
  {
    [(HKReferenceRangeView *)self _layoutFullReferenceRange];
    if ([(HKReferenceRangeViewConfiguration *)self->_configuration hideReferenceRangeValues])
    {
      uint64_t v3 = [(HKReferenceRangeView *)self referenceRangeContainerView];
      [v3 frame];
      self->_double intrinsicHeight = CGRectGetMaxY(v10);
    }
    else
    {
      double v4 = [(HKReferenceRangeView *)self lowValueLabel];
      [v4 frame];
      double MaxY = CGRectGetMaxY(v11);

      double v6 = [(HKReferenceRangeView *)self highValueLabel];
      [v6 frame];
      double v7 = CGRectGetMaxY(v12);

      if (MaxY >= v7) {
        double v8 = MaxY;
      }
      else {
        double v8 = v7;
      }
      self->_double intrinsicHeight = v8;
    }
  }
  else
  {
    [(HKReferenceRangeView *)self _layoutCurrentValueOnly];
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)HKReferenceRangeView;
  id v4 = a3;
  [(HKReferenceRangeView *)&v8 traitCollectionDidChange:v4];
  BOOL v5 = objc_msgSend(v4, "preferredContentSizeCategory", v8.receiver, v8.super_class);

  double v6 = [(HKReferenceRangeView *)self traitCollection];
  double v7 = [v6 preferredContentSizeCategory];

  if (v5 != v7) {
    [(HKReferenceRangeView *)self _applyNormalizedValuesToView];
  }
}

- (void)_dynamicUserInterfaceTraitDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)HKReferenceRangeView;
  [(HKReferenceRangeView *)&v3 _dynamicUserInterfaceTraitDidChange];
  [(HKReferenceRangeView *)self _updateContainerBorderColors];
  [(HKReferenceRangeView *)self _applyNormalizedValuesToView];
}

- (void)_layoutFullReferenceRange
{
  if (self->_lowValueLabel) {
    BOOL v3 = self->_highValueLabel != 0;
  }
  else {
    BOOL v3 = 0;
  }
  [(HKReferenceRangeView *)self bounds];
  double v5 = v4;
  double v6 = [(HKReferenceRangeView *)self lowValueLabel];
  [v6 sizeToFit];

  double v7 = [(HKReferenceRangeView *)self highValueLabel];
  [v7 sizeToFit];

  objc_super v8 = [(HKReferenceRangeView *)self currentValueLabel];
  [v8 sizeToFit];

  objc_super v9 = [(HKReferenceRangeView *)self outOfRangeLabel];
  [v9 sizeToFit];

  CGRect v10 = [(HKReferenceRangeViewConfiguration *)self->_configuration referenceRangeViewBorderColor];

  CGRect v11 = [(HKReferenceRangeView *)self dynamicTypeAnchorFont];
  [(HKReferenceRangeViewConfiguration *)self->_configuration referenceRangeViewHeight];
  objc_msgSend(v11, "_scaledValueForValue:");
  UIRoundToViewScale();

  UIRoundToViewScale();
  double v12 = 2.0;
  if (!v10) {
    double v12 = 1.5;
  }
  CGFloat v130 = v12;
  double v13 = [(HKReferenceRangeView *)self currentValueLabel];
  [v13 frame];
  CGRectGetHeight(v135);
  [(HKReferenceRangeViewConfiguration *)self->_configuration currentValueToReferenceValuePadding];

  double v14 = [(HKReferenceRangeView *)self referenceRangeContainerView];
  [v14 frame];

  [(HKReferenceRangeViewConfiguration *)self->_configuration horizontalPadding];
  double v15 = hk_rectRoundToViewScale(self);
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  v22 = [(HKReferenceRangeView *)self referenceRangeContainerView];
  objc_msgSend(v22, "setFrame:", v15, v17, v19, v21);

  v23 = [(HKReferenceRangeView *)self referenceRangeContainerView];
  v24 = [v23 layer];
  [v24 setCornerRadius:v21 * 0.5];

  v25 = [(HKReferenceRangeView *)self referenceRangeContainerView];
  [v25 setHidden:0];

  BOOL showOutOfRangeIndicator = self->_showOutOfRangeIndicator;
  v27 = [(HKReferenceRangeView *)self outOfRangeLabel];
  v28 = v27;
  double v128 = v5;
  double v131 = v17;
  double v132 = v15;
  if (showOutOfRangeIndicator)
  {
    [v27 frame];
    double v30 = v29;
    double v32 = v31;

    if (self->_valueDirection) {
      double v33 = v15 + v19 + -7.5 - v30;
    }
    else {
      double v33 = v15 + 7.5;
    }
    v34 = [(HKReferenceRangeView *)self outOfRangeLabel];
    objc_msgSend(v34, "setFrame:", v33, v17 + (v21 - v32) * 0.5, v30, v32);

    v35 = [(HKReferenceRangeView *)self outOfRangeLabel];
    [v35 setHidden:0];

    v36 = [(HKReferenceRangeView *)self currentValueView];
    v37 = v36;
    uint64_t v38 = 1;
  }
  else
  {
    [v27 setHidden:1];

    v36 = [(HKReferenceRangeView *)self currentValueView];
    v37 = v36;
    uint64_t v38 = 0;
  }
  [v36 setHidden:v38];

  v39 = [(HKReferenceRangeView *)self referenceRangeView];
  [v39 frame];

  if (self->_showOutOfRangeIndicator)
  {
    if (self->_valueDirection)
    {
      BOOL v40 = 0;
    }
    else
    {
      referenceRangeContainerView = self->_referenceRangeContainerView;
      [(UILabel *)self->_outOfRangeLabel frame];
      -[UIView convertRect:fromView:](referenceRangeContainerView, "convertRect:fromView:", self);
      CGRectGetMaxX(v136);
      BOOL v40 = !self->_showOutOfRangeIndicator;
    }
  }
  else
  {
    BOOL v40 = 1;
  }
  if (!v40 && self->_valueDirection == 2)
  {
    v42 = self->_referenceRangeContainerView;
    [(UILabel *)self->_outOfRangeLabel frame];
    -[UIView convertRect:fromView:](v42, "convertRect:fromView:", self);
    CGRectGetMinX(v137);
  }
  double v43 = hk_rectRoundToViewScale(self);
  double v45 = v44;
  double v47 = v46;
  double v49 = v48;
  v50 = [(HKReferenceRangeView *)self referenceRangeView];
  objc_msgSend(v50, "setFrame:", v43, v45, v47, v49);

  v51 = [(HKReferenceRangeView *)self referenceRangeView];
  v52 = [v51 layer];
  [v52 setCornerRadius:v49 * 0.5];

  double v127 = v43;
  v138.origin.double x = v43;
  v138.origin.double y = v45;
  CGFloat rect = v47;
  v138.size.double width = v47;
  v138.size.double height = v49;
  CGRectInset(v138, v130, v130);
  UIRoundToViewScale();
  double v53 = hk_rectRoundToViewScale(self);
  double v55 = v54;
  double v57 = v56;
  double v59 = v58;
  v60 = [(HKReferenceRangeView *)self currentValueView];
  objc_msgSend(v60, "setFrame:", v53, v55, v57, v59);

  v61 = [(HKReferenceRangeView *)self currentValueView];
  v62 = [v61 layer];
  [v62 setCornerRadius:v59 * 0.5];

  if (v3)
  {
    v63 = [(HKReferenceRangeView *)self lowValueLabel];
    [v63 frame];
    double v65 = v64;
    double v67 = v66;

    v68 = [(HKReferenceRangeView *)self referenceRangeContainerView];
    [v68 frame];
    double MaxY = CGRectGetMaxY(v139);
    v70 = [(HKReferenceRangeView *)self dynamicTypeAnchorFont];
    [(HKReferenceRangeViewConfiguration *)self->_configuration referenceValueYOffset];
    objc_msgSend(v70, "_scaledValueForValue:");
    double v72 = MaxY + v71;

    -[HKReferenceRangeView _assureLabelFrameWithinBounds:](self, "_assureLabelFrameWithinBounds:", v132 + v43, v72, v65, v67);
    double v74 = v73;
    double v76 = v75;
    double v78 = v77;
    double v80 = v79;
    v81 = [(HKReferenceRangeView *)self lowValueLabel];
    objc_msgSend(v81, "setFrame:", v74, v76, v78, v80);

    v82 = [(HKReferenceRangeView *)self lowValueLabel];
    [v82 setHidden:0];

    v83 = [(HKReferenceRangeView *)self highValueLabel];
    [v83 frame];
    double v85 = v84;
    double v87 = v86;

    v140.origin.double x = v43;
    v140.origin.double y = v45;
    v140.size.double width = rect;
    v140.size.double height = v49;
    double v88 = v132 + CGRectGetMaxX(v140) - v85;
    v89 = [(HKReferenceRangeView *)self lowValueLabel];
    [v89 frame];
    double v91 = v90;

    -[HKReferenceRangeView _assureLabelFrameWithinBounds:](self, "_assureLabelFrameWithinBounds:", v88, v91, v85, v87);
    double v93 = v92;
    double v95 = v94;
    double v97 = v96;
    double v99 = v98;
    v100 = [(HKReferenceRangeView *)self highValueLabel];
    objc_msgSend(v100, "setFrame:", v93, v95, v97, v99);

    v101 = [(HKReferenceRangeView *)self highValueLabel];
    [v101 setHidden:0];
  }
  v102 = [(HKReferenceRangeView *)self currentValueLabel];
  [v102 frame];
  CGFloat v104 = v103;
  CGFloat v106 = v105;
  double v108 = v107;
  double v110 = v109;

  v141.origin.double x = v104;
  v141.origin.double y = v106;
  v141.size.double width = v108;
  v141.size.double height = v110;
  double v111 = v131 - CGRectGetHeight(v141);
  [(HKReferenceRangeViewConfiguration *)self->_configuration currentValueToReferenceValuePadding];
  double v113 = v111 - v112;
  int64_t valueDirection = self->_valueDirection;
  [(HKReferenceRangeViewConfiguration *)self->_configuration horizontalPadding];
  double v116 = v115;
  if (valueDirection == 1)
  {
    v142.origin.double x = v104;
    v142.origin.double y = v113;
    v142.size.double width = v108;
    v142.size.double height = v110;
    CGRectGetWidth(v142);
    UIRoundToViewScale();
    if (v116 >= v117) {
      double v117 = v116;
    }
  }
  else
  {
    double v117 = v115 + 7.5;
    double v108 = v128 + (v116 + 7.5) * -2.0;
  }
  -[HKReferenceRangeView _assureLabelFrameWithinBounds:](self, "_assureLabelFrameWithinBounds:", v117, v113, v108, v110);
  double v119 = v118;
  double v121 = v120;
  double v123 = v122;
  double v125 = v124;
  v126 = [(HKReferenceRangeView *)self currentValueLabel];
  objc_msgSend(v126, "setFrame:", v119, v121, v123, v125);

  id v133 = [(HKReferenceRangeView *)self currentValueLabel];
  [v133 setHidden:0];
}

- (CGRect)_assureLabelFrameWithinBounds:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat v7 = fmax(a3.origin.x, 0.0);
  [(HKReferenceRangeView *)self bounds];
  CGRectGetWidth(v13);
  v14.origin.double x = v7;
  v14.origin.CGFloat y = y;
  v14.size.CGFloat width = width;
  v14.size.CGFloat height = height;
  CGRectGetWidth(v14);
  [(HKReferenceRangeView *)self bounds];
  CGRectGetWidth(v15);
  double v8 = hk_rectRoundToViewScale(self);
  result.size.CGFloat height = v11;
  result.size.CGFloat width = v10;
  result.origin.CGFloat y = v9;
  result.origin.double x = v8;
  return result;
}

- (void)_layoutCurrentValueOnly
{
  BOOL v3 = [(HKReferenceRangeView *)self currentValueView];
  [v3 setHidden:1];

  double v4 = [(HKReferenceRangeView *)self referenceRangeContainerView];
  [v4 setHidden:1];

  double v5 = [(HKReferenceRangeView *)self lowValueLabel];
  [v5 setHidden:1];

  double v6 = [(HKReferenceRangeView *)self highValueLabel];
  [v6 setHidden:1];

  CGFloat v7 = [(HKReferenceRangeView *)self outOfRangeLabel];
  [v7 setHidden:1];

  [(HKReferenceRangeView *)self bounds];
  double v9 = v8;
  [(HKReferenceRangeView *)self bounds];
  double v11 = v10;
  id v12 = [(HKReferenceRangeView *)self currentValueLabel];
  objc_msgSend(v12, "setFrame:", 0.0, 0.0, v9, v11);
}

- (void)updateWithData:(id)a3
{
  [(HKReferenceRangeView *)self setData:a3];
  [(HKReferenceRangeView *)self setValueFont:0];
  [(HKReferenceRangeView *)self setOverriddenValueFont:0];
  [(HKReferenceRangeView *)self _applyNormalizedValuesToView];
}

- (BOOL)_hasReferenceRange
{
  BOOL v3 = [(HKReferenceRangeViewData *)self->_data rangeLow];
  if (v3)
  {
    BOOL v4 = 1;
  }
  else
  {
    double v5 = [(HKReferenceRangeViewData *)self->_data rangeHigh];
    BOOL v4 = v5 != 0;
  }
  return v4;
}

- (void)setMultiValueSeparator:(id)a3
{
  if (self->_multiValueSeparator != a3)
  {
    BOOL v4 = (NSString *)[a3 copy];
    multiValueSeparator = self->_multiValueSeparator;
    self->_multiValueSeparator = v4;

    [(HKReferenceRangeView *)self _applyNormalizedValuesToView];
  }
}

- (void)_updateContainerBorderColors
{
  BOOL v3 = [(HKReferenceRangeViewConfiguration *)self->_configuration referenceRangeViewBorderColor];

  if (v3)
  {
    id v7 = [(HKReferenceRangeViewConfiguration *)self->_configuration referenceRangeViewBorderColor];
    uint64_t v4 = [v7 CGColor];
    double v5 = [(HKReferenceRangeView *)self referenceRangeContainerView];
    double v6 = [v5 layer];
    [v6 setBorderColor:v4];
  }
}

- (void)_setupSubviews
{
  id v3 = objc_alloc(MEMORY[0x1E4FB1EB0]);
  double v4 = *MEMORY[0x1E4F1DB28];
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  double v8 = objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], v5, v6, v7);
  [(HKReferenceRangeView *)self setReferenceRangeContainerView:v8];

  double v9 = [(HKReferenceRangeViewConfiguration *)self->_configuration referenceRangeViewColor];
  double v10 = [(HKReferenceRangeView *)self referenceRangeContainerView];
  [v10 setBackgroundColor:v9];

  double v11 = [(HKReferenceRangeViewConfiguration *)self->_configuration referenceRangeViewBorderColor];
  if (v11) {
    double v12 = 1.0;
  }
  else {
    double v12 = 0.0;
  }
  CGRect v13 = [(HKReferenceRangeView *)self referenceRangeContainerView];
  CGRect v14 = [v13 layer];
  [v14 setBorderWidth:v12];

  [(HKReferenceRangeView *)self _updateContainerBorderColors];
  CGRect v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", v4, v5, v6, v7);
  [(HKReferenceRangeView *)self setReferenceRangeView:v15];

  double v16 = [MEMORY[0x1E4FB1618] opaqueSeparatorColor];
  double v17 = [(HKReferenceRangeView *)self referenceRangeView];
  [v17 setBackgroundColor:v16];

  double v18 = -[HKReferenceRangeDotView initWithFrame:]([HKReferenceRangeDotView alloc], "initWithFrame:", v4, v5, v6, v7);
  [(HKReferenceRangeView *)self setCurrentValueView:v18];

  if (![(HKReferenceRangeViewConfiguration *)self->_configuration hideReferenceRangeValues])
  {
    double v19 = objc_msgSend(objc_alloc(-[HKReferenceRangeViewConfiguration labelClass](self->_configuration, "labelClass")), "initWithFrame:", v4, v5, v6, v7);
    [(HKReferenceRangeView *)self setLowValueLabel:v19];

    double v20 = (void *)MEMORY[0x1E4FB08E0];
    double v21 = [(HKReferenceRangeViewConfiguration *)self->_configuration referenceRangeTextStyle];
    v22 = objc_msgSend(v20, "hk_preferredFontForTextStyle:symbolicTraits:", v21, 2);
    v23 = [(HKReferenceRangeView *)self lowValueLabel];
    [v23 setFont:v22];

    v24 = [(HKReferenceRangeViewConfiguration *)self->_configuration referenceValueTextColor];
    v25 = [(HKReferenceRangeView *)self lowValueLabel];
    [v25 setTextColor:v24];

    v26 = objc_msgSend(objc_alloc(-[HKReferenceRangeViewConfiguration labelClass](self->_configuration, "labelClass")), "initWithFrame:", v4, v5, v6, v7);
    [(HKReferenceRangeView *)self setHighValueLabel:v26];

    v27 = (void *)MEMORY[0x1E4FB08E0];
    v28 = [(HKReferenceRangeViewConfiguration *)self->_configuration referenceRangeTextStyle];
    double v29 = objc_msgSend(v27, "hk_preferredFontForTextStyle:symbolicTraits:", v28, 2);
    double v30 = [(HKReferenceRangeView *)self highValueLabel];
    [v30 setFont:v29];

    double v31 = [(HKReferenceRangeViewConfiguration *)self->_configuration referenceValueTextColor];
    double v32 = [(HKReferenceRangeView *)self highValueLabel];
    [v32 setTextColor:v31];
  }
  double v33 = objc_msgSend(objc_alloc(-[HKReferenceRangeViewConfiguration labelClass](self->_configuration, "labelClass")), "initWithFrame:", v4, v5, v6, v7);
  [(HKReferenceRangeView *)self setCurrentValueLabel:v33];

  v34 = [(HKReferenceRangeViewConfiguration *)self->_configuration currentValueTextColor];
  v35 = [(HKReferenceRangeView *)self currentValueLabel];
  [v35 setTextColor:v34];

  v36 = objc_msgSend(objc_alloc(-[HKReferenceRangeViewConfiguration labelClass](self->_configuration, "labelClass")), "initWithFrame:", v4, v5, v6, v7);
  [(HKReferenceRangeView *)self setOutOfRangeLabel:v36];

  v37 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  uint64_t v38 = [v37 localizedStringForKey:@"RECORDS_OUT_OF_RANGE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
  v39 = [v38 localizedUppercaseString];
  BOOL v40 = [(HKReferenceRangeView *)self outOfRangeLabel];
  [v40 setText:v39];

  v41 = objc_msgSend(MEMORY[0x1E4FB08E0], "hk_preferredFontIgnoringAccessibilitySizeForTextStyle:symbolicTraits:", *MEMORY[0x1E4FB28D8], 2);
  v42 = [(HKReferenceRangeView *)self outOfRangeLabel];
  [v42 setFont:v41];

  double v43 = [(HKReferenceRangeView *)self _outOfRangeColor];
  double v44 = [(HKReferenceRangeView *)self outOfRangeLabel];
  [v44 setTextColor:v43];

  double v45 = [(HKReferenceRangeView *)self outOfRangeLabel];
  [v45 setHidden:1];

  double v46 = [(HKReferenceRangeView *)self referenceRangeContainerView];
  [(HKReferenceRangeView *)self addSubview:v46];

  double v47 = [(HKReferenceRangeView *)self referenceRangeContainerView];
  double v48 = [(HKReferenceRangeView *)self referenceRangeView];
  [v47 addSubview:v48];

  double v49 = [(HKReferenceRangeView *)self referenceRangeContainerView];
  v50 = [(HKReferenceRangeView *)self currentValueView];
  [v49 addSubview:v50];

  if (self->_lowValueLabel && self->_highValueLabel)
  {
    v51 = [(HKReferenceRangeView *)self lowValueLabel];
    [(HKReferenceRangeView *)self addSubview:v51];

    v52 = [(HKReferenceRangeView *)self highValueLabel];
    [(HKReferenceRangeView *)self addSubview:v52];
  }
  double v53 = [(HKReferenceRangeView *)self currentValueLabel];
  [(HKReferenceRangeView *)self addSubview:v53];

  id v54 = [(HKReferenceRangeView *)self outOfRangeLabel];
  [(HKReferenceRangeView *)self addSubview:v54];
}

- (void)_normalizeValuesIfNeeded
{
  if ([(HKReferenceRangeView *)self _hasReferenceRange])
  {
    id v3 = [(HKReferenceRangeViewData *)self->_data rangeLow];

    double v4 = [(HKReferenceRangeViewData *)self->_data rangeHigh];

    double v5 = [(HKReferenceRangeViewData *)self->_data value];
    [v5 doubleValue];
    double v7 = v6;
    double v8 = v6;

    double v9 = v8;
    if (v3)
    {
      double v10 = [(HKReferenceRangeViewData *)self->_data rangeLow];
      [v10 doubleValue];
      double v9 = v11;
    }
    if (v4)
    {
      double v12 = [(HKReferenceRangeViewData *)self->_data rangeHigh];
      [v12 doubleValue];
      double v8 = v13;
    }
    self->_lowValueXPosition = 0.25;
    self->_highValueXPosition = 0.75;
    if (!v3)
    {
      self->_lowValueXPosition = 0.0;
      double v14 = vabdd_f64(v8, v7);
      double v9 = v14 <= 2.22044605e-16 ? v8 + -1.0 : v8 + v14 * -2.0;
      if (v8 - v7 >= 2.22044605e-16)
      {
        double v19 = self->_highValueXPosition * 0.5;
        goto LABEL_31;
      }
    }
    if (!v4)
    {
      self->_highValueXPosition = 1.0;
      double v15 = vabdd_f64(v9, v7);
      double v8 = v15 <= 2.22044605e-16 ? v9 + 1.0 : v9 + v15 * 2.0;
      if (v7 - v9 >= 2.22044605e-16)
      {
        double v19 = self->_lowValueXPosition + (1.0 - self->_lowValueXPosition) * 0.5;
        goto LABEL_31;
      }
    }
    if (v8 >= v7) {
      double v16 = v8;
    }
    else {
      double v16 = v7;
    }
    if (v9 >= v7) {
      double v17 = v7;
    }
    else {
      double v17 = v9;
    }
    double v18 = v8 - v9;
    if (HKUIEqualDoubles(v16 - v17, v18))
    {
      double v19 = self->_lowValueXPosition + (v7 - v9) / v18 * 0.5;
LABEL_31:
      self->_currentValueXPosition = v19;
      self->_int64_t valueDirection = 1;
      self->_BOOL showOutOfRangeIndicator = 0;
      return;
    }
    self->_int64_t valueDirection = 2 * (v7 >= v9);
    self->_BOOL showOutOfRangeIndicator = 1;
    int64_t valueDirection = self->_valueDirection;
    if (valueDirection == 2)
    {
      double v22 = 0.5;
      if (v3)
      {
        if ([(HKReferenceRangeViewConfiguration *)self->_configuration hideReferenceRangeValues])
        {
          self->_lowValueXPosition = 0.0;
        }
        else
        {
          double v23 = self->_lowValueXPosition + -0.1;
          self->_lowValueXPosition = 0.1;
          double v22 = self->_highValueXPosition - v23;
        }
      }
      self->_highValueXPosition = v22;
      self->_currentValueXPosition = 0.0;
    }
    else if (!valueDirection)
    {
      if (v4)
      {
        if ([(HKReferenceRangeViewConfiguration *)self->_configuration hideReferenceRangeValues])
        {
          self->_lowValueXPosition = 0.5;
          double v21 = 1.0;
        }
        else
        {
          self->_lowValueXPosition = self->_lowValueXPosition + self->_lowValueXPosition + -0.1;
          double v21 = 0.9;
        }
        self->_highValueXPosition = v21;
      }
      else
      {
        self->_lowValueXPosition = 0.5;
      }
      self->_currentValueXPosition = 1.0;
    }
  }
}

- (void)_applyNormalizedValuesToView
{
  if ([(HKReferenceRangeView *)self _hasReferenceRange])
  {
    [(HKReferenceRangeView *)self _normalizeValuesIfNeeded];
    id v3 = [(HKReferenceRangeViewData *)self->_data rangeLowString];
    double v4 = [(HKReferenceRangeView *)self lowValueLabel];
    [v4 setText:v3];

    double v5 = [(HKReferenceRangeViewData *)self->_data rangeHighString];
    double v6 = [(HKReferenceRangeView *)self highValueLabel];
    [v6 setText:v5];

    if (self->_valueDirection == 1)
    {
      double v7 = [(HKReferenceRangeView *)self currentValueLabel];
      [v7 setTextAlignment:4];
      id v23 = 0;
    }
    else
    {
      id v23 = [(HKReferenceRangeView *)self _outOfRangeColor];
      int64_t valueDirection = self->_valueDirection;
      double v9 = [(HKReferenceRangeView *)self currentValueLabel];
      double v7 = v9;
      if (valueDirection) {
        uint64_t v10 = 2;
      }
      else {
        uint64_t v10 = 0;
      }
      [v9 setTextAlignment:v10];
    }

    double v17 = [(HKReferenceRangeViewConfiguration *)self->_configuration currentValueTextColor];
    double v18 = [(HKReferenceRangeView *)self currentValueView];
    [v18 setDotColor:v17];

    double v19 = [(HKReferenceRangeView *)self currentValueLabel];
    [v19 setNumberOfLines:1];

    double v20 = [(HKReferenceRangeView *)self currentValueLabel];
    [v20 setLineBreakMode:4];

    double v21 = [(HKReferenceRangeView *)self _generateAttributedValueStringWithOverrideColor:v23];
    double v22 = [(HKReferenceRangeView *)self currentValueLabel];
    [v22 setAttributedText:v21];

    double v15 = [(HKReferenceRangeView *)self currentValueLabel];
    [v15 sizeToFit];
  }
  else
  {
    if ([(HKReferenceRangeViewData *)self->_data useOutOfRangeValueColor])
    {
      id v23 = [(HKReferenceRangeView *)self _outOfRangeColor];
    }
    else
    {
      id v23 = 0;
    }
    int64_t v11 = [(HKReferenceRangeViewConfiguration *)self->_configuration currentValueNumLinesIfNoRange];
    double v12 = [(HKReferenceRangeView *)self currentValueLabel];
    [v12 setNumberOfLines:v11];

    double v13 = [(HKReferenceRangeView *)self currentValueLabel];
    [v13 setTextAlignment:4];

    double v14 = [(HKReferenceRangeView *)self currentValueLabel];
    [v14 setLineBreakMode:0];

    double v15 = [(HKReferenceRangeView *)self _generateAttributedValueStringWithOverrideColor:v23];
    double v16 = [(HKReferenceRangeView *)self currentValueLabel];
    [v16 setAttributedText:v15];
  }
  [(HKReferenceRangeView *)self invalidateIntrinsicContentSize];
  [(HKReferenceRangeView *)self setNeedsLayout];
}

- (id)_generateAttributedValueStringWithOverrideColor:(id)a3
{
  v40[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  double v6 = [(HKReferenceRangeViewData *)self->_data valueString];
  uint64_t v7 = [v6 length];
  double v8 = (void *)MEMORY[0x1E4FB06F8];
  double v9 = (void *)MEMORY[0x1E4FB0700];
  if (v7)
  {
    if (v4)
    {
      id v10 = v4;
    }
    else
    {
      id v10 = [(HKReferenceRangeViewConfiguration *)self->_configuration currentValueTextColor];
    }
    int64_t v11 = v10;
    v39[0] = *v8;
    double v12 = [(HKReferenceRangeView *)self valueLabelFont];
    v39[1] = *v9;
    v40[0] = v12;
    v40[1] = v11;
    [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v40 forKeys:v39 count:2];
    v14 = double v13 = v9;

    double v15 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v6 attributes:v14];
    [v5 addObject:v15];

    double v9 = v13;
  }
  double v16 = [(HKReferenceRangeViewData *)self->_data unitString];
  if ([v16 length])
  {
    v34 = v6;
    if (v4)
    {
      unint64_t v17 = 0x1E4F28000;
      id v18 = v4;
    }
    else
    {
      double v19 = v9;
      double v20 = [(HKReferenceRangeViewConfiguration *)self->_configuration currentValueUnitTextColor];
      double v21 = v20;
      if (v20)
      {
        id v22 = v20;
      }
      else
      {
        id v22 = [(HKReferenceRangeViewConfiguration *)self->_configuration currentValueTextColor];
      }
      id v18 = v22;
      unint64_t v17 = 0x1E4F28000uLL;

      double v9 = v19;
    }
    v37[0] = *v8;
    uint64_t v23 = v37[0];
    v24 = [(HKReferenceRangeView *)self unitLabelFont];
    uint64_t v25 = *v9;
    v38[0] = v24;
    v38[1] = v18;
    uint64_t v26 = *MEMORY[0x1E4FB0710];
    v37[1] = v25;
    v37[2] = v26;
    v38[2] = &unk_1F3C229E0;
    v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:v37 count:3];

    v28 = (void *)[objc_alloc(*(Class *)(v17 + 2840)) initWithString:@" " attributes:v27];
    [v5 addObject:v28];
    v35[0] = v23;
    double v29 = [(HKReferenceRangeView *)self unitLabelFont];
    v35[1] = v25;
    v36[0] = v29;
    v36[1] = v18;
    double v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:v35 count:2];

    double v31 = (void *)[objc_alloc(*(Class *)(v17 + 2840)) initWithString:v16 attributes:v30];
    [v5 addObject:v31];

    double v6 = v34;
  }
  if ([v5 count])
  {
    double v32 = HKUIJoinAttributedStringsForLocale(v5);
  }
  else
  {
    double v32 = 0;
  }

  return v32;
}

- (id)_generateMultilineAttributedValueStringForOriginalString:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  if (self->_overriddenValueFont)
  {
    id v6 = v4;
  }
  else
  {
    uint64_t v7 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
    [(HKReferenceRangeView *)self setOverriddenValueFont:v7];
    id v6 = (id)[v5 mutableCopy];
    uint64_t v10 = *MEMORY[0x1E4FB06F8];
    v11[0] = v7;
    double v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
    objc_msgSend(v6, "setAttributes:range:", v8, 0, objc_msgSend(v5, "length"));
  }
  return v6;
}

- (id)_configuredPreferredFontForTextStyle:(id)a3 symbolicTraits:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v5 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:a3];
  id v6 = [v5 fontDescriptor];
  uint64_t v7 = [v6 fontDescriptorWithSymbolicTraits:v4];

  double v8 = (void *)MEMORY[0x1E4FB08E0];
  [v5 pointSize];
  double v9 = objc_msgSend(v8, "fontWithDescriptor:size:", v7);

  return v9;
}

- (id)_outOfRangeColor
{
  return (id)[MEMORY[0x1E4FB1618] systemRedColor];
}

- (HKReferenceRangeViewConfiguration)configuration
{
  return self->_configuration;
}

- (NSString)multiValueSeparator
{
  return self->_multiValueSeparator;
}

- (HKReferenceRangeViewData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
}

- (UIView)referenceRangeView
{
  return self->_referenceRangeView;
}

- (void)setReferenceRangeView:(id)a3
{
}

- (UIView)referenceRangeContainerView
{
  return self->_referenceRangeContainerView;
}

- (void)setReferenceRangeContainerView:(id)a3
{
}

- (HKReferenceRangeDotView)currentValueView
{
  return self->_currentValueView;
}

- (void)setCurrentValueView:(id)a3
{
}

- (UILabel)lowValueLabel
{
  return self->_lowValueLabel;
}

- (void)setLowValueLabel:(id)a3
{
}

- (UILabel)highValueLabel
{
  return self->_highValueLabel;
}

- (void)setHighValueLabel:(id)a3
{
}

- (UILabel)currentValueLabel
{
  return self->_currentValueLabel;
}

- (void)setCurrentValueLabel:(id)a3
{
}

- (void)setDynamicTypeAnchorFont:(id)a3
{
}

- (UIFont)valueFont
{
  return self->_valueFont;
}

- (void)setValueFont:(id)a3
{
}

- (UIFont)overriddenValueFont
{
  return self->_overriddenValueFont;
}

- (void)setOverriddenValueFont:(id)a3
{
}

- (UIFont)unitFont
{
  return self->_unitFont;
}

- (void)setUnitFont:(id)a3
{
}

- (UILabel)outOfRangeLabel
{
  return self->_outOfRangeLabel;
}

- (void)setOutOfRangeLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outOfRangeLabel, 0);
  objc_storeStrong((id *)&self->_unitFont, 0);
  objc_storeStrong((id *)&self->_overriddenValueFont, 0);
  objc_storeStrong((id *)&self->_valueFont, 0);
  objc_storeStrong((id *)&self->_dynamicTypeAnchorFont, 0);
  objc_storeStrong((id *)&self->_currentValueLabel, 0);
  objc_storeStrong((id *)&self->_highValueLabel, 0);
  objc_storeStrong((id *)&self->_lowValueLabel, 0);
  objc_storeStrong((id *)&self->_currentValueView, 0);
  objc_storeStrong((id *)&self->_referenceRangeContainerView, 0);
  objc_storeStrong((id *)&self->_referenceRangeView, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_multiValueSeparator, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end