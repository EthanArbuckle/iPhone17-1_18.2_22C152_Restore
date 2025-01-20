@interface _SFSettingsAlertButton
- (BOOL)isEnabled;
- (BOOL)isSelected;
- (BOOL)limitToSingleLine;
- (BOOL)showsIndicatorDot;
- (NSArray)componentsArrangement;
- (NSString)textStyle;
- (UIImageView)imageView;
- (UIImageView)statusImageView;
- (UILabel)textLabel;
- (UIView)accessoryView;
- (UIView)trailingView;
- (_SFSettingsAlertButton)initWithFrame:(CGRect)a3;
- (id)_arrangedSubviews;
- (id)attributedDetailText;
- (id)attributedText;
- (id)detailText;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)image;
- (id)text;
- (void)_didChangeContents;
- (void)_hover:(id)a3;
- (void)_updateHasDetailText;
- (void)_updateTintColor;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (void)layoutSubviews;
- (void)pressesBegan:(id)a3 withEvent:(id)a4;
- (void)setAccessoryView:(id)a3;
- (void)setAttributedDetailText:(id)a3;
- (void)setAttributedText:(id)a3;
- (void)setComponentsArrangement:(id)a3;
- (void)setDetailText:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setImage:(id)a3;
- (void)setLimitToSingleLine:(BOOL)a3;
- (void)setSelected:(BOOL)a3;
- (void)setShowsIndicatorDot:(BOOL)a3;
- (void)setStatusImageView:(id)a3;
- (void)setText:(id)a3;
- (void)setTextStyle:(id)a3;
- (void)updateConstraints;
@end

@implementation _SFSettingsAlertButton

- (_SFSettingsAlertButton)initWithFrame:(CGRect)a3
{
  v37[4] = *MEMORY[0x1E4F143B8];
  v35.receiver = self;
  v35.super_class = (Class)_SFSettingsAlertButton;
  v3 = -[_SFSettingsAlertControl initWithFrame:](&v35, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x1E4FB1940]);
    textGuide = v3->_textGuide;
    v3->_textGuide = v4;

    [(_SFSettingsAlertButton *)v3 addLayoutGuide:v3->_textGuide];
    v6 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    textLabel = v3->_textLabel;
    v3->_textLabel = v6;

    [(UILabel *)v3->_textLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v3->_textLabel setNumberOfLines:v3->_limitToSingleLine];
    LODWORD(v8) = 1132003328;
    [(UILabel *)v3->_textLabel setContentHuggingPriority:0 forAxis:v8];
    LODWORD(v9) = 1144733696;
    [(UILabel *)v3->_textLabel setContentCompressionResistancePriority:0 forAxis:v9];
    v10 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
    imageView = v3->_imageView;
    v3->_imageView = v10;

    [(UIImageView *)v3->_imageView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIImageView *)v3->_imageView setAdjustsImageSizeForAccessibilityContentSizeCategory:1];
    v12 = [MEMORY[0x1E4FB1830] configurationWithTextStyle:*MEMORY[0x1E4FB28C8]];
    [(UIImageView *)v3->_imageView setPreferredSymbolConfiguration:v12];

    LODWORD(v13) = 1147207680;
    [(UIImageView *)v3->_imageView setContentHuggingPriority:0 forAxis:v13];
    v14 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    dotView = v3->_dotView;
    v3->_dotView = v14;

    v16 = [MEMORY[0x1E4FB1618] systemBlueColor];
    [(UIView *)v3->_dotView setBackgroundColor:v16];

    [(UIView *)v3->_dotView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)v3->_dotView _setContinuousCornerRadius:2.0];
    v17 = [(_SFSettingsAlertButton *)v3 heightAnchor];
    v18 = [v17 constraintEqualToConstant:44.0];

    LODWORD(v19) = 1111752704;
    [v18 setPriority:v19];
    v20 = (void *)MEMORY[0x1E4F28DC8];
    v21 = [(_SFSettingsAlertButton *)v3 heightAnchor];
    v22 = [v21 constraintGreaterThanOrEqualToConstant:44.0];
    v37[0] = v22;
    v37[1] = v18;
    v34 = v18;
    v23 = [(UIView *)v3->_dotView heightAnchor];
    v24 = [v23 constraintEqualToConstant:4.0];
    v37[2] = v24;
    v25 = [(UIView *)v3->_dotView widthAnchor];
    v26 = [(UIView *)v3->_dotView heightAnchor];
    v27 = [v25 constraintEqualToAnchor:v26];
    v37[3] = v27;
    v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:4];
    [v20 activateConstraints:v28];

    if (([MEMORY[0x1E4F98AF8] isBrowsingAssistantEnabled] & 1) == 0)
    {
      v29 = (void *)[objc_alloc(MEMORY[0x1E4FB1800]) initWithTarget:v3 action:sel__hover_];
      [(_SFSettingsAlertButton *)v3 addGestureRecognizer:v29];
    }
    [(_SFSettingsAlertButton *)v3 setFocusEffect:0];
    uint64_t v36 = objc_opt_class();
    v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v36 count:1];
    id v31 = (id)[(_SFSettingsAlertButton *)v3 registerForTraitChanges:v30 withTarget:v3 action:sel_setNeedsLayout];

    v32 = v3;
  }

  return v3;
}

- (void)setText:(id)a3
{
  v4 = (NSString *)a3;
  text = self->_text;
  if (text != v4)
  {
    v11 = v4;
    BOOL v6 = [(NSString *)text isEqualToString:v4];
    v4 = v11;
    if (!v6)
    {
      v7 = (NSString *)[(NSString *)v11 copy];
      double v8 = self->_text;
      self->_text = v7;

      [(UILabel *)self->_textLabel setText:v11];
      [(UILabel *)self->_textLabel _setTextColorFollowsTintColor:1];
      NSUInteger v9 = [(NSString *)self->_text length];
      v10 = [(UILabel *)self->_textLabel superview];

      if (v9)
      {
        if (!v10) {
          [(_SFSettingsAlertButton *)self addSubview:self->_textLabel];
        }
      }
      else if (v10)
      {
        [(UILabel *)self->_textLabel removeFromSuperview];
      }
      [(_SFSettingsAlertButton *)self _didChangeContents];
      v4 = v11;
    }
  }
}

- (id)text
{
  text = self->_text;
  if (text)
  {
    v3 = text;
  }
  else
  {
    v3 = [(NSAttributedString *)self->_attributedText string];
  }

  return v3;
}

- (void)setDetailText:(id)a3
{
  v4 = (NSString *)a3;
  detailText = self->_detailText;
  if (detailText != v4)
  {
    v10 = v4;
    BOOL v6 = [(NSString *)detailText isEqualToString:v4];
    v4 = v10;
    if (!v6)
    {
      v7 = (NSString *)[(NSString *)v10 copy];
      double v8 = self->_detailText;
      self->_detailText = v7;

      attributedDetailText = self->_attributedDetailText;
      self->_attributedDetailText = 0;

      [(_SFSettingsAlertButton *)self _updateHasDetailText];
      [(UILabel *)self->_detailTextLabel setText:self->_detailText];
      [(_SFSettingsAlertButton *)self _didChangeContents];
      v4 = v10;
    }
  }
}

- (void)_updateHasDetailText
{
  NSUInteger v3 = [(NSString *)self->_detailText length];
  v4 = [(UILabel *)self->_detailTextLabel superview];

  if (v3)
  {
    if (!v4)
    {
      detailTextLabel = self->_detailTextLabel;
      if (!detailTextLabel)
      {
        BOOL v6 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
        v7 = self->_detailTextLabel;
        self->_detailTextLabel = v6;

        [(UILabel *)self->_detailTextLabel setTranslatesAutoresizingMaskIntoConstraints:0];
        double v8 = [MEMORY[0x1E4FB1798] preferredFontForTextStyle:*MEMORY[0x1E4FB2950]];
        [(UILabel *)self->_detailTextLabel setFont:v8];

        [(UILabel *)self->_detailTextLabel setAdjustsFontForContentSizeCategory:1];
        NSUInteger v9 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
        [(UILabel *)self->_detailTextLabel setTextColor:v9];

        [(UILabel *)self->_detailTextLabel setNumberOfLines:self->_limitToSingleLine];
        detailTextLabel = self->_detailTextLabel;
      }
      [(_SFSettingsAlertButton *)self addSubview:detailTextLabel];
    }
  }
  else if (v4)
  {
    [(UILabel *)self->_detailTextLabel removeFromSuperview];
    v10 = self->_detailTextLabel;
    self->_detailTextLabel = 0;
  }
}

- (void)layoutSubviews
{
  v9.receiver = self;
  v9.super_class = (Class)_SFSettingsAlertButton;
  [(_SFSettingsAlertButton *)&v9 layoutSubviews];
  NSUInteger v3 = [(_SFSettingsAlertButton *)self traitCollection];
  v4 = [v3 preferredContentSizeCategory];
  double v5 = 9.0;
  if (UIContentSizeCategoryIsAccessibilityCategory(v4))
  {
    BOOL v6 = [MEMORY[0x1E4FB17A8] metricsForTextStyle:*MEMORY[0x1E4FB28C8]];
    [v6 scaledValueForValue:11.0];
    double v5 = v7;
  }
  -[_SFSettingsAlertButton setLayoutMargins:](self, "setLayoutMargins:", v5, 16.0, v5, 16.0);

  double v8 = [MEMORY[0x1E4FB1798] preferredFontForTextStyle:self->_textStyle];
  [(UILabel *)self->_textLabel setFont:v8];

  if (self->_attributedText) {
    -[UILabel setAttributedText:](self->_textLabel, "setAttributedText:");
  }
}

- (void)_didChangeContents
{
  [(_SFSettingsAlertButton *)self setNeedsUpdateConstraints];
  id v3 = [(_SFSettingsAlertControl *)self delegate];
  [v3 alertItemViewContentSizeDidChange:self];
}

- (void)setAttributedText:(id)a3
{
  v4 = (NSAttributedString *)a3;
  attributedText = self->_attributedText;
  if (attributedText != v4)
  {
    v11 = v4;
    BOOL v6 = [(NSAttributedString *)attributedText isEqualToAttributedString:v4];
    v4 = v11;
    if (!v6)
    {
      double v7 = (NSAttributedString *)[(NSAttributedString *)v11 copy];
      double v8 = self->_attributedText;
      self->_attributedText = v7;

      [(UILabel *)self->_textLabel setAttributedText:v11];
      [(UILabel *)self->_textLabel _setTextColorFollowsTintColor:0];
      NSUInteger v9 = [(NSAttributedString *)self->_attributedText length];
      v10 = [(UILabel *)self->_textLabel superview];

      if (v9)
      {
        if (!v10) {
          [(_SFSettingsAlertButton *)self addSubview:self->_textLabel];
        }
      }
      else if (v10)
      {
        [(UILabel *)self->_textLabel removeFromSuperview];
      }
      [(_SFSettingsAlertButton *)self _didChangeContents];
      v4 = v11;
    }
  }
}

- (id)attributedText
{
  attributedText = self->_attributedText;
  if (attributedText || !self->_text) {
    id v3 = attributedText;
  }
  else {
    id v3 = (NSAttributedString *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:self->_text];
  }

  return v3;
}

- (void)setAttributedDetailText:(id)a3
{
  id v8 = a3;
  if ((WBSIsEqual() & 1) == 0)
  {
    v4 = (NSAttributedString *)[v8 copy];
    attributedDetailText = self->_attributedDetailText;
    self->_attributedDetailText = v4;

    BOOL v6 = [v8 string];
    detailText = self->_detailText;
    self->_detailText = v6;

    [(_SFSettingsAlertButton *)self _updateHasDetailText];
    [(UILabel *)self->_detailTextLabel setAttributedText:self->_attributedDetailText];
    [(_SFSettingsAlertButton *)self _didChangeContents];
  }
}

- (id)attributedDetailText
{
  attributedDetailText = self->_attributedDetailText;
  if (attributedDetailText)
  {
    id v3 = attributedDetailText;
  }
  else if (self->_detailText)
  {
    id v3 = (NSAttributedString *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:self->_detailText];
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

- (void)setImage:(id)a3
{
  double v5 = (UIImage *)a3;
  p_image = &self->_image;
  image = self->_image;
  if (image != v5)
  {
    v10 = v5;
    char v8 = [(UIImage *)image isEqual:v5];
    double v5 = v10;
    if ((v8 & 1) == 0)
    {
      BOOL v9 = *p_image == 0;
      objc_storeStrong((id *)&self->_image, a3);
      [(UIImageView *)self->_imageView setImage:*p_image];
      double v5 = v10;
      if (((v9 ^ (*p_image != 0)) & 1) == 0)
      {
        if (*p_image) {
          [(_SFSettingsAlertButton *)self addSubview:self->_imageView];
        }
        else {
          [(UIImageView *)self->_imageView removeFromSuperview];
        }
        [(_SFSettingsAlertButton *)self _didChangeContents];
        double v5 = v10;
      }
    }
  }
}

- (void)setShowsIndicatorDot:(BOOL)a3
{
  if (self->_showsIndicatorDot != a3)
  {
    if (a3 && self->_image) {
      [(_SFSettingsAlertButton *)self addSubview:self->_dotView];
    }
    else {
      [(UIView *)self->_dotView removeFromSuperview];
    }
  }
}

- (void)setAccessoryView:(id)a3
{
  double v5 = (UIView *)a3;
  p_accessoryView = &self->_accessoryView;
  accessoryView = self->_accessoryView;
  if (accessoryView != v5)
  {
    char v8 = v5;
    [(UIView *)accessoryView removeFromSuperview];
    objc_storeStrong((id *)&self->_accessoryView, a3);
    if (*p_accessoryView)
    {
      [(UIView *)*p_accessoryView setTranslatesAutoresizingMaskIntoConstraints:0];
      [(_SFSettingsAlertButton *)self addSubview:*p_accessoryView];
    }
    [(_SFSettingsAlertButton *)self _didChangeContents];
    double v5 = v8;
  }
}

- (void)setStatusImageView:(id)a3
{
  double v5 = (UIImageView *)a3;
  statusImageView = self->_statusImageView;
  if (statusImageView != v5)
  {
    double v7 = v5;
    [(UIImageView *)statusImageView removeFromSuperview];
    objc_storeStrong((id *)&self->_statusImageView, a3);
    if (self->_statusImageView) {
      -[_SFSettingsAlertButton addSubview:](self, "addSubview:");
    }
    [(_SFSettingsAlertButton *)self _didChangeContents];
    double v5 = v7;
  }
}

- (void)setComponentsArrangement:(id)a3
{
  v4 = (NSArray *)a3;
  double v5 = v4;
  if (self->_componentsArrangement != v4)
  {
    BOOL v9 = v4;
    char v6 = -[NSArray isEqual:](v4, "isEqual:");
    double v5 = v9;
    if ((v6 & 1) == 0)
    {
      double v7 = (NSArray *)[(NSArray *)v9 copy];
      componentsArrangement = self->_componentsArrangement;
      self->_componentsArrangement = v7;

      [(_SFSettingsAlertButton *)self setNeedsUpdateConstraints];
      double v5 = v9;
    }
  }
}

- (NSArray)componentsArrangement
{
  componentsArrangement = self->_componentsArrangement;
  if (componentsArrangement) {
    id v3 = componentsArrangement;
  }
  else {
    id v3 = (NSArray *)&unk_1EFBDF940;
  }

  return v3;
}

- (UIView)trailingView
{
  v2 = [(_SFSettingsAlertButton *)self _arrangedSubviews];
  if ([v2 count] == 1)
  {
    id v3 = 0;
  }
  else
  {
    id v3 = [v2 lastObject];
  }

  return (UIView *)v3;
}

- (void)setLimitToSingleLine:(BOOL)a3
{
  if (self->_limitToSingleLine != a3)
  {
    self->_limitToSingleLine = a3;
    BOOL v4 = a3;
    [(UILabel *)self->_textLabel setNumberOfLines:a3];
    [(UILabel *)self->_detailTextLabel setNumberOfLines:v4];
    [(_SFSettingsAlertButton *)self _didChangeContents];
  }
}

- (void)updateConstraints
{
  v71.receiver = self;
  v71.super_class = (Class)_SFSettingsAlertButton;
  [(_SFSettingsAlertButton *)&v71 updateConstraints];
  if (self->_contentConstraints)
  {
    objc_msgSend(MEMORY[0x1E4F28DC8], "deactivateConstraints:");
    contentConstraints = self->_contentConstraints;
    self->_contentConstraints = 0;
  }
  BOOL v4 = [(_SFSettingsAlertButton *)self _arrangedSubviews];
  if ([v4 count])
  {
    double v5 = [(_SFSettingsAlertButton *)self layoutMarginsGuide];
    char v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = [v4 count];
    v65[0] = MEMORY[0x1E4F143A8];
    v65[1] = 3221225472;
    v65[2] = __43___SFSettingsAlertButton_updateConstraints__block_invoke;
    v65[3] = &unk_1E5C76820;
    char v8 = v6;
    v66 = v8;
    id v64 = v5;
    id v67 = v64;
    id v9 = v4;
    id v68 = v9;
    v69 = self;
    uint64_t v70 = v7;
    [v9 enumerateObjectsUsingBlock:v65];
    if ([(UIImage *)self->_image hasBaseline]
      && ([(UILabel *)self->_textLabel superview],
          v10 = objc_claimAutoreleasedReturnValue(),
          v10,
          v10))
    {
      v11 = [(UIImageView *)self->_imageView firstBaselineAnchor];
      v12 = [(UILabel *)self->_textLabel firstBaselineAnchor];
      double v13 = [v11 constraintEqualToAnchor:v12];
      [(NSArray *)v8 addObject:v13];

      int v14 = 1;
    }
    else
    {
      int v14 = 0;
    }
    p_detailTextLabel = &self->_detailTextLabel;
    uint64_t v16 = [(UILabel *)self->_detailTextLabel superview];
    if (v16)
    {
      v17 = (void *)v16;
      char v18 = [v9 containsObject:*p_detailTextLabel];

      if ((v18 & 1) == 0)
      {
        double v19 = [(UILabel *)*p_detailTextLabel leadingAnchor];
        v20 = [(UILabel *)self->_textLabel leadingAnchor];
        v21 = [v19 constraintEqualToAnchor:v20];
        [(NSArray *)v8 addObject:v21];

        if (v14
          && (uint64_t v22 = [v9 indexOfObject:self->_imageView],
              v22 == [v9 indexOfObject:self->_textLabel] + 1))
        {
          v23 = [(UILabel *)*p_detailTextLabel trailingAnchor];
          v24 = [(UIImageView *)self->_imageView trailingAnchor];
          uint64_t v25 = [v23 constraintLessThanOrEqualToAnchor:v24];
        }
        else
        {
          v23 = [(UILabel *)*p_detailTextLabel trailingAnchor];
          v24 = [(UILabel *)self->_textLabel trailingAnchor];
          uint64_t v25 = [v23 constraintEqualToAnchor:v24];
        }
        v26 = (void *)v25;
        [(NSArray *)v8 addObject:v25];

        v27 = [(UILabel *)*p_detailTextLabel topAnchor];
        v28 = [(UILabel *)self->_textLabel bottomAnchor];
        v29 = [v27 constraintEqualToAnchor:v28];
        [(NSArray *)v8 addObject:v29];

        v30 = [(UILabel *)*p_detailTextLabel bottomAnchor];
        id v31 = [v64 bottomAnchor];
        v32 = [v30 constraintLessThanOrEqualToAnchor:v31];
        [(NSArray *)v8 addObject:v32];
      }
    }
    p_textLabel = &self->_textLabel;
    v34 = [(UILabel *)self->_textLabel superview];

    if (v34)
    {
      objc_super v35 = [(UILabel *)*p_textLabel widthAnchor];
      uint64_t v36 = [v64 widthAnchor];
      v37 = [v35 constraintEqualToAnchor:v36 multiplier:1.0];

      LODWORD(v38) = 1132068864;
      [v37 setPriority:v38];
      [(NSArray *)v8 addObject:v37];
    }
    v39 = [(UILabel *)*p_textLabel superview];
    if (v39)
    {
    }
    else
    {
      v40 = [(UILabel *)*p_detailTextLabel superview];

      if (!v40) {
        goto LABEL_27;
      }
    }
    v41 = [(UILabel *)*p_textLabel superview];
    if (v41) {
      v42 = &self->_textLabel;
    }
    else {
      v42 = &self->_detailTextLabel;
    }
    v43 = *v42;

    v44 = [(UILabel *)*p_detailTextLabel superview];
    if (v44) {
      v45 = &self->_detailTextLabel;
    }
    else {
      v45 = &self->_textLabel;
    }
    v46 = *v45;

    v47 = [(UILayoutGuide *)self->_textGuide topAnchor];
    v48 = [(UILabel *)v43 topAnchor];
    v49 = [v47 constraintEqualToAnchor:v48];
    [(NSArray *)v8 addObject:v49];

    v50 = [(UILayoutGuide *)self->_textGuide bottomAnchor];
    v51 = [(UILabel *)v46 bottomAnchor];
    v52 = [v50 constraintEqualToAnchor:v51];
    [(NSArray *)v8 addObject:v52];

LABEL_27:
    uint64_t v53 = [(UIView *)self->_dotView superview];
    if (v53)
    {
      v54 = (void *)v53;
      v55 = [(UIImageView *)self->_imageView superview];

      if (v55)
      {
        v56 = [(UIView *)self->_dotView leadingAnchor];
        v57 = [(UIImageView *)self->_imageView trailingAnchor];
        v58 = [v56 constraintEqualToAnchor:v57 constant:-1.0];
        [(NSArray *)v8 addObject:v58];

        v59 = [(UIView *)self->_dotView topAnchor];
        v60 = [(UIImageView *)self->_imageView topAnchor];
        v61 = [v59 constraintEqualToAnchor:v60];
        [(NSArray *)v8 addObject:v61];
      }
    }
    v62 = self->_contentConstraints;
    self->_contentConstraints = v8;
    v63 = v8;

    [MEMORY[0x1E4F28DC8] activateConstraints:self->_contentConstraints];
  }
}

- (id)_arrangedSubviews
{
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __43___SFSettingsAlertButton__arrangedSubviews__block_invoke;
  v10[3] = &unk_1E5C76848;
  v10[4] = self;
  id v3 = (void *)MEMORY[0x1AD0C36A0](v10, a2);
  BOOL v4 = [(_SFSettingsAlertButton *)self componentsArrangement];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __43___SFSettingsAlertButton__arrangedSubviews__block_invoke_2;
  v8[3] = &unk_1E5C76870;
  id v9 = v3;
  id v5 = v3;
  char v6 = objc_msgSend(v4, "safari_mapAndFilterObjectsUsingBlock:", v8);

  return v6;
}

- (void)_hover:(id)a3
{
  BOOL v4 = (unint64_t)([a3 state] - 1) < 2;

  [(_SFSettingsAlertControl *)self setHighlighted:v4];
}

- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  v19.receiver = self;
  v19.super_class = (Class)_SFSettingsAlertButton;
  id v6 = a3;
  [(_SFSettingsAlertButton *)&v19 endTrackingWithTouch:v6 withEvent:a4];
  [(_SFSettingsAlertButton *)self bounds];
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  [v6 locationInView:self];
  CGFloat v16 = v15;
  CGFloat v18 = v17;

  v21.origin.x = v8;
  v21.origin.y = v10;
  v21.size.width = v12;
  v21.size.height = v14;
  v20.x = v16;
  v20.y = v18;
  if (CGRectContainsPoint(v21, v20)) {
    [(_SFSettingsAlertButton *)self sendActionsForControlEvents:0x2000];
  }
}

- (void)setSelected:(BOOL)a3
{
  BOOL v3 = a3;
  self->_selected = a3;
  id v5 = [(_SFSettingsAlertControl *)self item];
  uint64_t v6 = [v5 type];

  if (v6 == 4)
  {
    id v7 = [(_SFSettingsAlertButton *)self imageView];
    [v7 setAlpha:(double)v3];
  }
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
  [(_SFSettingsAlertButton *)self _updateTintColor];
}

- (void)_updateTintColor
{
  if ([(_SFSettingsAlertButton *)self isEnabled]
    || ([MEMORY[0x1E4FB1618] secondaryLabelColor], (uint64_t v3 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    id v5 = 0;
    BOOL v4 = self->_attributedText == 0;
  }
  else
  {
    id v5 = (id)v3;
    BOOL v4 = 1;
  }
  [(UILabel *)self->_textLabel _setTextColorFollowsTintColor:v4];
  [(UILabel *)self->_textLabel setTintColor:v5];
  [(UIImageView *)self->_imageView setTintColor:v5];
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  -[UIView convertPoint:fromView:](self->_accessoryView, "convertPoint:fromView:", self, x, y);
  double v9 = v8;
  double v11 = v10;
  if ([(UIView *)self->_accessoryView isUserInteractionEnabled]
    && -[UIView pointInside:withEvent:](self->_accessoryView, "pointInside:withEvent:", v7, v9, v11))
  {
    uint64_t v12 = -[UIView hitTest:withEvent:](self->_accessoryView, "hitTest:withEvent:", v7, v9, v11);
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)_SFSettingsAlertButton;
    uint64_t v12 = -[_SFSettingsAlertButton hitTest:withEvent:](&v15, sel_hitTest_withEvent_, v7, x, y);
  }
  double v13 = (void *)v12;

  return v13;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v8 = a3;
  id v5 = [v8 previouslyFocusedView];
  if (v5 == self)
  {
  }
  else
  {
    uint64_t v6 = v5;
    id v7 = [v8 nextFocusedView];

    if (v7 != self) {
      goto LABEL_6;
    }
  }
  [(_SFSettingsAlertControl *)self _updateBackgroundView];
LABEL_6:
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (SFShouldHandleSelectionForPresses())
  {
    [(_SFSettingsAlertButton *)self sendActionsForControlEvents:0x2000];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)_SFSettingsAlertButton;
    [(_SFSettingsAlertButton *)&v8 pressesBegan:v6 withEvent:v7];
  }
}

- (id)detailText
{
  return self->_detailText;
}

- (id)image
{
  return self->_image;
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (NSString)textStyle
{
  return self->_textStyle;
}

- (void)setTextStyle:(id)a3
{
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (UIView)accessoryView
{
  return self->_accessoryView;
}

- (UIImageView)statusImageView
{
  return self->_statusImageView;
}

- (BOOL)limitToSingleLine
{
  return self->_limitToSingleLine;
}

- (BOOL)showsIndicatorDot
{
  return self->_showsIndicatorDot;
}

- (UILabel)textLabel
{
  return self->_textLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textLabel, 0);
  objc_storeStrong((id *)&self->_statusImageView, 0);
  objc_storeStrong((id *)&self->_accessoryView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_textStyle, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_attributedDetailText, 0);
  objc_storeStrong((id *)&self->_detailText, 0);
  objc_storeStrong((id *)&self->_attributedText, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_dotView, 0);
  objc_storeStrong((id *)&self->_textGuide, 0);
  objc_storeStrong((id *)&self->_detailTextLabel, 0);
  objc_storeStrong((id *)&self->_componentsArrangement, 0);

  objc_storeStrong((id *)&self->_contentConstraints, 0);
}

@end