@interface HUGridActionSetTitleAndDescriptionView
+ (BOOL)requiresConstraintBasedLayout;
- (HUGridActionSetTitleAndDescriptionView)initWithFrame:(CGRect)a3 titleLabelSuperview:(id)a4;
- (NSArray)titleAndDescriptionConstraints;
- (NSLayoutConstraint)titleDescriptionSpacingConstraint;
- (UILabel)descriptionLabel;
- (UILabel)titleLabel;
- (double)titleDescriptionLineSpacing;
- (void)setDescriptionLabel:(id)a3;
- (void)setTitleAndDescriptionConstraints:(id)a3;
- (void)setTitleAndDescriptionLabelTintColor:(id)a3;
- (void)setTitleDescriptionLineSpacing:(double)a3;
- (void)setTitleDescriptionSpacingConstraint:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)updateConstraints;
- (void)updateTitleText:(id)a3 descriptionText:(id)a4;
@end

@implementation HUGridActionSetTitleAndDescriptionView

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

- (HUGridActionSetTitleAndDescriptionView)initWithFrame:(CGRect)a3 titleLabelSuperview:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  v23.receiver = self;
  v23.super_class = (Class)HUGridActionSetTitleAndDescriptionView;
  v10 = -[HUGridActionSetTitleAndDescriptionView initWithFrame:](&v23, sel_initWithFrame_, x, y, width, height);
  if (v10)
  {
    id v11 = objc_alloc_init(MEMORY[0x1E4F42B38]);
    [(HUGridActionSetTitleAndDescriptionView *)v10 setTitleLabel:v11];

    v12 = [(HUGridActionSetTitleAndDescriptionView *)v10 titleLabel];
    [v9 addSubview:v12];

    v13 = [(HUGridActionSetTitleAndDescriptionView *)v10 titleLabel];
    [v13 setTranslatesAutoresizingMaskIntoConstraints:0];

    v14 = [(HUGridActionSetTitleAndDescriptionView *)v10 titleLabel];
    [v14 setNumberOfLines:1];

    v15 = [MEMORY[0x1E4F428B8] systemBlackColor];
    v16 = [(HUGridActionSetTitleAndDescriptionView *)v10 titleLabel];
    [v16 setTextColor:v15];

    id v17 = objc_alloc_init(MEMORY[0x1E4F42B38]);
    [(HUGridActionSetTitleAndDescriptionView *)v10 setDescriptionLabel:v17];

    v18 = [(HUGridActionSetTitleAndDescriptionView *)v10 descriptionLabel];
    [(HUGridActionSetTitleAndDescriptionView *)v10 addSubview:v18];

    v19 = [(HUGridActionSetTitleAndDescriptionView *)v10 descriptionLabel];
    [v19 setTranslatesAutoresizingMaskIntoConstraints:0];

    v20 = [(HUGridActionSetTitleAndDescriptionView *)v10 descriptionLabel];
    [v20 setNumberOfLines:1];

    v21 = [(HUGridActionSetTitleAndDescriptionView *)v10 descriptionLabel];
    [v21 setHidden:1];
  }
  return v10;
}

- (void)updateTitleText:(id)a3 descriptionText:(id)a4
{
  id v24 = a3;
  id v6 = a4;
  v7 = [(HUGridActionSetTitleAndDescriptionView *)self titleLabel];
  v8 = [v7 attributedText];
  if ([v24 isEqualToAttributedString:v8])
  {
    id v9 = [(HUGridActionSetTitleAndDescriptionView *)self descriptionLabel];
    v10 = [v9 attributedText];
    char v11 = [v6 isEqualToAttributedString:v10];

    if (v11) {
      goto LABEL_9;
    }
  }
  else
  {
  }
  v12 = [(HUGridActionSetTitleAndDescriptionView *)self titleLabel];
  [v12 setAttributedText:v24];

  v13 = [(HUGridActionSetTitleAndDescriptionView *)self descriptionLabel];
  [v13 setAttributedText:v6];

  v14 = [(HUGridActionSetTitleAndDescriptionView *)self descriptionLabel];
  int v15 = [v14 isHidden];

  v16 = [(HUGridActionSetTitleAndDescriptionView *)self descriptionLabel];
  id v17 = [v16 text];
  BOOL v18 = [v17 length] == 0;
  v19 = [(HUGridActionSetTitleAndDescriptionView *)self descriptionLabel];
  [v19 setHidden:v18];

  v20 = [(HUGridActionSetTitleAndDescriptionView *)self descriptionLabel];
  LODWORD(v17) = [v20 isHidden];

  if (v15 != v17)
  {
    v21 = [(HUGridActionSetTitleAndDescriptionView *)self titleAndDescriptionConstraints];

    if (v21)
    {
      v22 = (void *)MEMORY[0x1E4F28DC8];
      objc_super v23 = [(HUGridActionSetTitleAndDescriptionView *)self titleAndDescriptionConstraints];
      [v22 deactivateConstraints:v23];
    }
    [(HUGridActionSetTitleAndDescriptionView *)self setTitleAndDescriptionConstraints:0];
    [(HUGridActionSetTitleAndDescriptionView *)self setTitleDescriptionSpacingConstraint:0];
    [(HUGridActionSetTitleAndDescriptionView *)self setNeedsUpdateConstraints];
  }
LABEL_9:
}

- (void)setTitleDescriptionLineSpacing:(double)a3
{
  self->_titleDescriptionLineSpacing = a3;
  id v4 = [(HUGridActionSetTitleAndDescriptionView *)self titleDescriptionSpacingConstraint];
  [v4 setConstant:a3];
}

- (void)setTitleAndDescriptionLabelTintColor:(id)a3
{
  id v4 = a3;
  v5 = [(HUGridActionSetTitleAndDescriptionView *)self titleLabel];
  [v5 setTextColor:v4];

  id v6 = [(HUGridActionSetTitleAndDescriptionView *)self descriptionLabel];
  [v6 setTextColor:v4];
}

- (void)updateConstraints
{
  v3 = [(HUGridActionSetTitleAndDescriptionView *)self titleAndDescriptionConstraints];

  if (!v3)
  {
    id v4 = [MEMORY[0x1E4F1CA48] array];
    v5 = [(HUGridActionSetTitleAndDescriptionView *)self titleLabel];
    id v6 = [v5 leadingAnchor];
    v7 = [(HUGridActionSetTitleAndDescriptionView *)self leadingAnchor];
    v8 = [v6 constraintEqualToAnchor:v7];
    [v4 addObject:v8];

    id v9 = [(HUGridActionSetTitleAndDescriptionView *)self titleLabel];
    v10 = [v9 trailingAnchor];
    char v11 = [(HUGridActionSetTitleAndDescriptionView *)self trailingAnchor];
    v12 = [v10 constraintEqualToAnchor:v11];
    [v4 addObject:v12];

    v13 = [(HUGridActionSetTitleAndDescriptionView *)self descriptionLabel];
    v14 = [v13 leadingAnchor];
    int v15 = [(HUGridActionSetTitleAndDescriptionView *)self leadingAnchor];
    v16 = [v14 constraintEqualToAnchor:v15];
    [v4 addObject:v16];

    id v17 = [(HUGridActionSetTitleAndDescriptionView *)self descriptionLabel];
    BOOL v18 = [v17 trailingAnchor];
    v19 = [(HUGridActionSetTitleAndDescriptionView *)self trailingAnchor];
    v20 = [v18 constraintEqualToAnchor:v19];
    [v4 addObject:v20];

    v21 = [(HUGridActionSetTitleAndDescriptionView *)self titleLabel];
    v22 = [v21 topAnchor];
    objc_super v23 = [(HUGridActionSetTitleAndDescriptionView *)self topAnchor];
    id v24 = [v22 constraintEqualToAnchor:v23];
    [v4 addObject:v24];

    v25 = [(HUGridActionSetTitleAndDescriptionView *)self descriptionLabel];
    LODWORD(v22) = [v25 isHidden];

    if (v22)
    {
      v26 = [(HUGridActionSetTitleAndDescriptionView *)self titleLabel];
      v27 = [v26 bottomAnchor];
      v28 = [(HUGridActionSetTitleAndDescriptionView *)self bottomAnchor];
      v29 = [v27 constraintEqualToAnchor:v28];
      [v4 addObject:v29];
    }
    else
    {
      v30 = [(HUGridActionSetTitleAndDescriptionView *)self descriptionLabel];
      v31 = [v30 bottomAnchor];
      v32 = [(HUGridActionSetTitleAndDescriptionView *)self bottomAnchor];
      v33 = [v31 constraintEqualToAnchor:v32];
      [v4 addObject:v33];

      int v34 = [MEMORY[0x1E4F69758] shouldUseControlCenterMaterials];
      v35 = [(HUGridActionSetTitleAndDescriptionView *)self descriptionLabel];
      v36 = [v35 firstBaselineAnchor];
      v37 = [(HUGridActionSetTitleAndDescriptionView *)self titleLabel];
      v38 = [v37 lastBaselineAnchor];
      if (v34)
      {
        [(HUGridActionSetTitleAndDescriptionView *)self titleDescriptionLineSpacing];
        objc_msgSend(v36, "constraintEqualToAnchor:constant:", v38);
      }
      else
      {
        [v36 constraintEqualToSystemSpacingBelowAnchor:v38 multiplier:1.0];
      v39 = };
      [(HUGridActionSetTitleAndDescriptionView *)self setTitleDescriptionSpacingConstraint:v39];

      v26 = [(HUGridActionSetTitleAndDescriptionView *)self titleDescriptionSpacingConstraint];
      [v4 addObject:v26];
    }

    [(HUGridActionSetTitleAndDescriptionView *)self setTitleAndDescriptionConstraints:v4];
    v40 = (void *)MEMORY[0x1E4F28DC8];
    v41 = [(HUGridActionSetTitleAndDescriptionView *)self titleAndDescriptionConstraints];
    [v40 activateConstraints:v41];
  }
  v42.receiver = self;
  v42.super_class = (Class)HUGridActionSetTitleAndDescriptionView;
  [(HUGridActionSetTitleAndDescriptionView *)&v42 updateConstraints];
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UILabel)descriptionLabel
{
  return self->_descriptionLabel;
}

- (void)setDescriptionLabel:(id)a3
{
}

- (double)titleDescriptionLineSpacing
{
  return self->_titleDescriptionLineSpacing;
}

- (NSArray)titleAndDescriptionConstraints
{
  return self->_titleAndDescriptionConstraints;
}

- (void)setTitleAndDescriptionConstraints:(id)a3
{
}

- (NSLayoutConstraint)titleDescriptionSpacingConstraint
{
  return self->_titleDescriptionSpacingConstraint;
}

- (void)setTitleDescriptionSpacingConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleDescriptionSpacingConstraint, 0);
  objc_storeStrong((id *)&self->_titleAndDescriptionConstraints, 0);
  objc_storeStrong((id *)&self->_descriptionLabel, 0);

  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end