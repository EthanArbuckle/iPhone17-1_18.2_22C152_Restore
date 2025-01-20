@interface CCUISensorAttributionSensorButton
- (BOOL)scalesLargeContentImage;
- (BOOL)showsLargeContentViewer;
- (CCUISensorActivityData)sensorActivityData;
- (CCUISensorAttributionSensorButton)initWithSensorActivityData:(id)a3;
- (CGRect)cachedExpandedRect;
- (CGSize)sizeThatFits:(CGSize)a3;
- (UILabel)descriptionLabel;
- (UIView)indicatorView;
- (UIView)sensorIconView;
- (double)_indicatorWidth;
- (id)_fontForTitleLabel;
- (id)largeContentTitle;
- (unint64_t)sensorType;
- (void)_enableUserInteractionForLargeContentViewerIfNeeded;
- (void)_layoutDescriptionLabel;
- (void)_layoutIndicatorView;
- (void)didMoveToWindow;
- (void)layoutSubviews;
- (void)setCachedExpandedRect:(CGRect)a3;
- (void)setIndicatorView:(id)a3;
@end

@implementation CCUISensorAttributionSensorButton

- (CCUISensorAttributionSensorButton)initWithSensorActivityData:(id)a3
{
  v53[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v52.receiver = self;
  v52.super_class = (Class)CCUISensorAttributionSensorButton;
  double v7 = *MEMORY[0x1E4F1DB28];
  double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v10 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  v11 = -[CCUISensorAttributionSensorButton initWithFrame:](&v52, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], v8, v9, v10);
  if (v11)
  {
    if (!v6)
    {
      v50 = [MEMORY[0x1E4F28B00] currentHandler];
      [v50 handleFailureInMethod:a2 object:v11 file:@"CCUISensorAttributionSensorButton.m" lineNumber:36 description:@"Need a nonnil sensorActivityData"];
    }
    v12 = [(CCUISensorAttributionSensorButton *)v11 traitCollection];
    v13 = [v12 preferredContentSizeCategory];
    BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v13);

    p_sensorActivityData = (id *)&v11->_sensorActivityData;
    objc_storeStrong((id *)&v11->_sensorActivityData, a3);
    uint64_t v16 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", v7, v8, v9, v10);
    descriptionLabel = v11->_descriptionLabel;
    v11->_descriptionLabel = (UILabel *)v16;

    v18 = v11->_descriptionLabel;
    v19 = [(CCUISensorAttributionSensorButton *)v11 _fontForTitleLabel];
    [(UILabel *)v18 setFont:v19];

    v20 = v11->_descriptionLabel;
    if (IsAccessibilityCategory)
    {
      [(UILabel *)v20 setAdjustsFontForContentSizeCategory:1];
      [(UILabel *)v11->_descriptionLabel setNumberOfLines:0];
    }
    else
    {
      [(UILabel *)v20 setAdjustsFontSizeToFitWidth:1];
    }
    [(UILabel *)v11->_descriptionLabel setMinimumScaleFactor:0.5];
    v21 = v11->_descriptionLabel;
    v22 = CCUILocalizedDescriptionForSensorActivityData(v6);
    [(UILabel *)v21 setText:v22];

    v23 = v11->_descriptionLabel;
    v24 = [MEMORY[0x1E4FB1618] colorWithWhite:0.85 alpha:1.0];
    [(UILabel *)v23 setTextColor:v24];

    v25 = [(UILabel *)v11->_descriptionLabel layer];
    v26 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A2E8]];
    [v25 setCompositingFilter:v26];

    v27 = [(UILabel *)v11->_descriptionLabel layer];
    [v27 setAllowsGroupBlending:0];

    [(CCUISensorAttributionSensorButton *)v11 addSubview:v11->_descriptionLabel];
    v28 = CCUIImageForSensorType([*p_sensorActivityData sensorType]);
    v29 = (void *)[objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v28];
    v30 = [MEMORY[0x1E4FB1618] systemWhiteColor];
    [v29 setTintColor:v30];

    CGAffineTransformMakeScale(&v51, 0.5, 0.5);
    [v29 setTransform:&v51];
    id v31 = objc_alloc(MEMORY[0x1E4FB1838]);
    v32 = CCUIPlainCircleImage();
    v33 = (void *)[v31 initWithImage:v32];

    v34 = CCUIIndicatorColorForSensorType([*p_sensorActivityData sensorType]);
    [v33 setTintColor:v34];

    id v35 = objc_alloc(MEMORY[0x1E4FB1EB0]);
    [v33 bounds];
    uint64_t v36 = objc_msgSend(v35, "initWithFrame:");
    indicatorView = v11->_indicatorView;
    v11->_indicatorView = (UIView *)v36;

    [(UIView *)v11->_indicatorView addSubview:v33];
    [(UIView *)v11->_indicatorView addSubview:v29];
    [(UIView *)v11->_indicatorView sendSubviewToBack:v33];
    v38 = [(UIView *)v11->_indicatorView layer];
    v39 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v39 scale];
    objc_msgSend(v38, "setRasterizationScale:");

    v40 = [(UIView *)v11->_indicatorView layer];
    [v40 setShouldRasterize:1];

    [v29 frame];
    [v33 bounds];
    UIRectCenteredRect();
    objc_msgSend(v29, "setFrame:");
    v41 = NSString;
    v42 = CCUIIdentifierForSensorType([v6 sensorType]);
    v43 = [v6 bundleIdentifier];
    v44 = [v41 stringWithFormat:@"%@-activity-data-button-%@", v42, v43];
    [(CCUISensorAttributionSensorButton *)v11 setAccessibilityIdentifier:v44];

    v45 = [(CCUISensorAttributionSensorButton *)v11 layer];
    [v45 setAllowsGroupBlending:0];

    [(CCUISensorAttributionSensorButton *)v11 addSubview:v11->_indicatorView];
    v46 = self;
    v53[0] = v46;
    v47 = [MEMORY[0x1E4F1C978] arrayWithObjects:v53 count:1];
    id v48 = (id)[(CCUISensorAttributionSensorButton *)v11 registerForTraitChanges:v47 withAction:sel__enableUserInteractionForLargeContentViewerIfNeeded];
  }
  return v11;
}

- (UIView)sensorIconView
{
  return self->_indicatorView;
}

- (unint64_t)sensorType
{
  return [(CCUISensorActivityData *)self->_sensorActivityData sensorType];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id v6 = [(CCUISensorAttributionSensorButton *)self traitCollection];
  double v7 = [v6 preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v7);

  [(CCUISensorAttributionSensorButton *)self _indicatorWidth];
  double v10 = v9;
  -[UILabel sizeThatFits:](self->_descriptionLabel, "sizeThatFits:", width - v9 + -4.0, height);
  double v12 = v11;
  double v14 = v13;
  v15 = [(UILabel *)self->_descriptionLabel font];
  [v15 lineHeight];
  double v17 = v14 / v16;

  [(UIView *)self->_indicatorView frame];
  double v18 = CGRectGetHeight(v22);
  if (v14 >= v18) {
    double v18 = v14;
  }
  if (height >= v18) {
    double v19 = height;
  }
  else {
    double v19 = v18;
  }
  if (height < v18) {
    double v18 = height;
  }
  if (!IsAccessibilityCategory || v17 <= 1.5) {
    double v19 = v18;
  }
  double v20 = v10 + v12 + 4.0;
  result.double height = v19;
  result.double width = v20;
  return result;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)CCUISensorAttributionSensorButton;
  [(CCUISensorAttributionSensorButton *)&v3 layoutSubviews];
  [(CCUISensorAttributionSensorButton *)self _layoutIndicatorView];
  [(CCUISensorAttributionSensorButton *)self _layoutDescriptionLabel];
}

- (void)didMoveToWindow
{
  v3.receiver = self;
  v3.super_class = (Class)CCUISensorAttributionSensorButton;
  [(CCUISensorAttributionSensorButton *)&v3 didMoveToWindow];
  [(CCUISensorAttributionSensorButton *)self _enableUserInteractionForLargeContentViewerIfNeeded];
}

- (void)_layoutIndicatorView
{
  indicatorView = self->_indicatorView;
  if (indicatorView)
  {
    [(UIView *)indicatorView frame];
    CGFloat v5 = v4;
    CGFloat v7 = v6;
    CGFloat v9 = v8;
    CGFloat v11 = v10;
    [(CCUISensorAttributionSensorButton *)self bounds];
    CGFloat v13 = v12;
    CGFloat v15 = v14;
    CGFloat v17 = v16;
    CGFloat v19 = v18;
    double v20 = [MEMORY[0x1E4FB1438] sharedApplication];
    if ([v20 userInterfaceLayoutDirection] == 1)
    {
      v23.origin.x = v13;
      v23.origin.y = v15;
      v23.size.double width = v17;
      v23.size.double height = v19;
      CGRectGetMaxX(v23);
      v24.origin.x = v5;
      v24.origin.y = v7;
      v24.size.double width = v9;
      v24.size.double height = v11;
      CGRectGetWidth(v24);
    }

    UIRectCenteredYInRect();
    v21 = self->_indicatorView;
    -[UIView setFrame:](v21, "setFrame:");
  }
}

- (void)_layoutDescriptionLabel
{
  descriptionLabel = self->_descriptionLabel;
  if (descriptionLabel)
  {
    [(UILabel *)descriptionLabel frame];
    [(CCUISensorAttributionSensorButton *)self bounds];
    double v5 = v4;
    double v7 = v6;
    [(CCUISensorAttributionSensorButton *)self _indicatorWidth];
    -[UILabel sizeThatFits:](self->_descriptionLabel, "sizeThatFits:", v5 - v8 + -4.0, v7);
    CGFloat v9 = [MEMORY[0x1E4FB1438] sharedApplication];
    if ([v9 userInterfaceLayoutDirection] != 1) {
      [(CCUISensorAttributionSensorButton *)self _indicatorWidth];
    }

    UIRectCenteredYInRect();
    double v10 = self->_descriptionLabel;
    -[UILabel setFrame:](v10, "setFrame:");
  }
}

- (double)_indicatorWidth
{
  [(UIView *)self->_indicatorView frame];

  return CGRectGetWidth(*(CGRect *)&v2);
}

- (id)_fontForTitleLabel
{
  uint64_t v2 = [MEMORY[0x1E4F4F8B8] defaultFontProvider];
  objc_super v3 = [v2 preferredFontForTextStyle:*MEMORY[0x1E4FB28F0] hiFontStyle:1];

  return v3;
}

- (void)_enableUserInteractionForLargeContentViewerIfNeeded
{
  objc_super v3 = [(CCUISensorAttributionSensorButton *)self traitCollection];
  double v4 = [v3 preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v4);

  [(CCUISensorAttributionSensorButton *)self setUserInteractionEnabled:IsAccessibilityCategory];
}

- (BOOL)scalesLargeContentImage
{
  return 1;
}

- (BOOL)showsLargeContentViewer
{
  return 1;
}

- (id)largeContentTitle
{
  return [(UILabel *)self->_descriptionLabel text];
}

- (UILabel)descriptionLabel
{
  return self->_descriptionLabel;
}

- (CGRect)cachedExpandedRect
{
  double x = self->_cachedExpandedRect.origin.x;
  double y = self->_cachedExpandedRect.origin.y;
  double width = self->_cachedExpandedRect.size.width;
  double height = self->_cachedExpandedRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setCachedExpandedRect:(CGRect)a3
{
  self->_cachedExpandedRect = a3;
}

- (UIView)indicatorView
{
  return self->_indicatorView;
}

- (void)setIndicatorView:(id)a3
{
}

- (CCUISensorActivityData)sensorActivityData
{
  return self->_sensorActivityData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sensorActivityData, 0);
  objc_storeStrong((id *)&self->_indicatorView, 0);

  objc_storeStrong((id *)&self->_descriptionLabel, 0);
}

@end