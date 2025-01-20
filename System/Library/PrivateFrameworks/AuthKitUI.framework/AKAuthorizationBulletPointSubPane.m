@interface AKAuthorizationBulletPointSubPane
- (AKAuthorizationBulletPointSubPane)initWithImage:(id)a3 title:(id)a4 message:(id)a5;
- (CGSize)_sizeForBulletImage:(id)a3;
- (NSString)message;
- (NSString)title;
- (UIImage)image;
- (UIImageView)bulletImageView;
- (UILabel)messageLabel;
- (UILabel)titleLabel;
- (UIStackView)messageStackView;
- (UIView)baseView;
- (id)_iconColor;
- (id)_imageViewWithImage:(id)a3;
- (id)_labelWithString:(id)a3 title:(BOOL)a4;
- (id)_verticalStackView;
- (void)addToConstraints:(id)a3 context:(id)a4;
- (void)setImage:(id)a3;
- (void)setMessage:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation AKAuthorizationBulletPointSubPane

- (AKAuthorizationBulletPointSubPane)initWithImage:(id)a3 title:(id)a4 message:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = objc_alloc(MEMORY[0x1E4F42FF0]);
  v12 = (UIView *)objc_msgSend(v11, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  baseView = self->_baseView;
  self->_baseView = v12;

  v14 = self->_baseView;
  v26.receiver = self;
  v26.super_class = (Class)AKAuthorizationBulletPointSubPane;
  v15 = [(AKAuthorizationSubPane *)&v26 initWithView:v14];
  v16 = v15;
  if (v15)
  {
    [(UIView *)v15->_baseView setTranslatesAutoresizingMaskIntoConstraints:0];
    uint64_t v17 = [(AKAuthorizationBulletPointSubPane *)v16 _imageViewWithImage:v8];
    bulletImageView = v16->_bulletImageView;
    v16->_bulletImageView = (UIImageView *)v17;

    [(UIView *)v16->_baseView addSubview:v16->_bulletImageView];
    uint64_t v19 = [(AKAuthorizationBulletPointSubPane *)v16 _verticalStackView];
    messageStackView = v16->_messageStackView;
    v16->_messageStackView = (UIStackView *)v19;

    [(UIView *)v16->_baseView addSubview:v16->_messageStackView];
    uint64_t v21 = [(AKAuthorizationBulletPointSubPane *)v16 _labelWithString:v9 title:1];
    titleLabel = v16->_titleLabel;
    v16->_titleLabel = (UILabel *)v21;

    uint64_t v23 = [(AKAuthorizationBulletPointSubPane *)v16 _labelWithString:v10 title:0];
    messageLabel = v16->_messageLabel;
    v16->_messageLabel = (UILabel *)v23;

    [(UIStackView *)v16->_messageStackView addArrangedSubview:v16->_titleLabel];
    [(UIStackView *)v16->_messageStackView addArrangedSubview:v16->_messageLabel];
  }

  return v16;
}

- (id)_labelWithString:(id)a3 title:(BOOL)a4
{
  v5 = (objc_class *)MEMORY[0x1E4F42B38];
  id v6 = a3;
  id v7 = objc_alloc_init(v5);
  [v7 setTranslatesAutoresizingMaskIntoConstraints:0];
  if (a4)
  {
    id v8 = +[AKAuthorizationAppearance bulletInfoLabelTitleFont];
    [v7 setFont:v8];

    [v7 setTextAlignment:4];
    [v7 setNumberOfLines:0];
    [v7 setAdjustsFontSizeToFitWidth:0];
    [v7 setAdjustsFontForContentSizeCategory:1];
    id v9 = [MEMORY[0x1E4F428B8] clearColor];
    [v7 setBackgroundColor:v9];

    [v7 setText:v6];
  }
  else
  {
    id v10 = +[AKAuthorizationAppearance bulletInfoLabelDescriptionFont];
    [v7 setFont:v10];

    [v7 setTextAlignment:4];
    [v7 setNumberOfLines:0];
    [v7 setAdjustsFontSizeToFitWidth:0];
    [v7 setAdjustsFontForContentSizeCategory:1];
    id v11 = [MEMORY[0x1E4F428B8] clearColor];
    [v7 setBackgroundColor:v11];

    [v7 setText:v6];
    id v6 = [MEMORY[0x1E4F428B8] secondaryLabelColor];
    [v7 setTextColor:v6];
  }

  return v7;
}

- (id)_verticalStackView
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F42E20]);
  [v2 setTranslatesAutoresizingMaskIntoConstraints:0];
  +[AKAuthorizationSubPaneMetrics bulletInfoTitleToDescriptionVerticalSpacing];
  objc_msgSend(v2, "setSpacing:");
  [v2 setAlignment:1];
  [v2 setAxis:1];
  [v2 setDistribution:0];
  v3 = [MEMORY[0x1E4F428B8] clearColor];
  [v2 setBackgroundColor:v3];

  return v2;
}

- (id)_imageViewWithImage:(id)a3
{
  id v4 = a3;
  [(AKAuthorizationBulletPointSubPane *)self _sizeForBulletImage:v4];
  v5 = objc_msgSend(v4, "ak_copyScaledToSize:");

  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F42AA0]) initWithImage:v5];
  [v6 setContentMode:5];
  id v7 = [(AKAuthorizationBulletPointSubPane *)self _iconColor];
  [v6 setTintColor:v7];

  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];

  return v6;
}

- (CGSize)_sizeForBulletImage:(id)a3
{
  id v3 = a3;
  [v3 size];
  double v5 = v4;
  [v3 size];
  double v7 = v6;
  [v3 size];
  double v9 = v8;
  double v11 = v10;

  +[AKAuthorizationSubPaneMetrics bulletImageSize];
  if (v5 <= v7)
  {
    +[AKSizing size:scaledForHeight:](AKSizing, "size:scaledForHeight:", v9, v11, v12);
  }
  else
  {
    +[AKSizing size:scaledForWidth:](AKSizing, "size:scaledForWidth:", v9, v11, v12);
  }
  result.height = v14;
  result.width = v13;
  return result;
}

- (void)addToConstraints:(id)a3 context:(id)a4
{
  v50[10] = *MEMORY[0x1E4F143B8];
  baseView = self->_baseView;
  id v7 = a4;
  id v48 = a3;
  v46 = [(UIView *)baseView leadingAnchor];
  v47 = [v7 stackView];
  v45 = [v47 leadingAnchor];
  v44 = [v46 constraintEqualToAnchor:v45];
  v50[0] = v44;
  v41 = [(UIView *)self->_baseView trailingAnchor];
  v43 = v7;
  v42 = [v7 stackView];
  v40 = [v42 trailingAnchor];
  v39 = [v41 constraintEqualToAnchor:v40];
  v50[1] = v39;
  v36 = [(UIView *)self->_baseView topAnchor];
  v38 = [v7 stackView];
  v37 = [v38 arrangedSubviews];
  v35 = [v37 lastObject];
  v34 = [v35 topAnchor];
  v33 = [v36 constraintEqualToAnchor:v34];
  v50[2] = v33;
  v31 = [(UIImageView *)self->_bulletImageView topAnchor];
  v30 = [(UILabel *)self->_titleLabel firstBaselineAnchor];
  v32 = [(UILabel *)self->_titleLabel font];
  [v32 ascender];
  double v9 = v8;
  +[AKAuthorizationSubPaneMetrics bulletImagePixelAdjustmentOffset];
  v29 = [v31 constraintEqualToAnchor:v30 constant:-(v9 - v10)];
  v50[3] = v29;
  v28 = [(UIImageView *)self->_bulletImageView leadingAnchor];
  v27 = [(UIView *)self->_baseView leadingAnchor];
  +[AKAuthorizationSubPaneMetrics bulletLeadingSpacing];
  objc_super v26 = objc_msgSend(v28, "constraintEqualToAnchor:constant:", v27);
  v50[4] = v26;
  v25 = [(UIImageView *)self->_bulletImageView widthAnchor];
  +[AKAuthorizationSubPaneMetrics bulletImageSize];
  v24 = objc_msgSend(v25, "constraintEqualToConstant:");
  v50[5] = v24;
  uint64_t v23 = [(UIStackView *)self->_messageStackView leadingAnchor];
  v22 = [(UIImageView *)self->_bulletImageView trailingAnchor];
  +[AKAuthorizationSubPaneMetrics bulletImageToInfoLabelSpacing];
  uint64_t v21 = objc_msgSend(v23, "constraintEqualToAnchor:constant:", v22);
  v50[6] = v21;
  v20 = [(UIStackView *)self->_messageStackView trailingAnchor];
  double v11 = [(UIView *)self->_baseView trailingAnchor];
  +[AKAuthorizationSubPaneMetrics bulletTrailingSpacing];
  double v12 = objc_msgSend(v20, "constraintEqualToAnchor:constant:", v11);
  v50[7] = v12;
  double v13 = [(UIStackView *)self->_messageStackView topAnchor];
  double v14 = [(UIView *)self->_baseView topAnchor];
  v15 = [v13 constraintEqualToAnchor:v14];
  v50[8] = v15;
  v16 = [(UIStackView *)self->_messageStackView bottomAnchor];
  uint64_t v17 = [(UIView *)self->_baseView bottomAnchor];
  v18 = [v16 constraintLessThanOrEqualToAnchor:v17];
  v50[9] = v18;
  uint64_t v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v50 count:10];
  [v48 addObjectsFromArray:v19];

  v49.receiver = self;
  v49.super_class = (Class)AKAuthorizationBulletPointSubPane;
  [(AKAuthorizationSubPane *)&v49 addToConstraints:v48 context:v43];
}

- (void)setImage:(id)a3
{
}

- (UIImage)image
{
  return [(UIImageView *)self->_bulletImageView image];
}

- (void)setTitle:(id)a3
{
}

- (NSString)title
{
  return [(UILabel *)self->_titleLabel text];
}

- (void)setMessage:(id)a3
{
}

- (NSString)message
{
  return [(UILabel *)self->_titleLabel text];
}

- (id)_iconColor
{
  id v2 = (void *)MEMORY[0x1E4F428B8];
  id v3 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AuthKitUI"];
  double v4 = [MEMORY[0x1E4F42F80] currentTraitCollection];
  double v5 = [v2 colorNamed:@"firstTimeColor" inBundle:v3 compatibleWithTraitCollection:v4];

  return v5;
}

- (UIView)baseView
{
  return self->_baseView;
}

- (UIImageView)bulletImageView
{
  return self->_bulletImageView;
}

- (UIStackView)messageStackView
{
  return self->_messageStackView;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (UILabel)messageLabel
{
  return self->_messageLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_messageStackView, 0);
  objc_storeStrong((id *)&self->_bulletImageView, 0);

  objc_storeStrong((id *)&self->_baseView, 0);
}

@end