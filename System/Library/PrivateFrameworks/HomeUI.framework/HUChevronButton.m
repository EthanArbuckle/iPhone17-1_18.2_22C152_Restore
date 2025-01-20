@interface HUChevronButton
- (HUChevronButton)initWithFrame:(CGRect)a3;
- (UIImageView)chevronImageView;
- (UILabel)titleLabel;
- (UIStackView)containerView;
- (void)setChevronImageView:(id)a3;
- (void)setContainerView:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setTitleLabel:(id)a3;
@end

@implementation HUChevronButton

- (HUChevronButton)initWithFrame:(CGRect)a3
{
  v59[2] = *MEMORY[0x1E4F143B8];
  v58.receiver = self;
  v58.super_class = (Class)HUChevronButton;
  v3 = -[HUChevronButton initWithFrame:](&v58, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F42B38]);
    double v5 = *MEMORY[0x1E4F1DB28];
    double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    v9 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], v6, v7, v8);
    [(HUChevronButton *)v3 setTitleLabel:v9];

    v10 = [(HUChevronButton *)v3 titleLabel];
    [v10 setUserInteractionEnabled:0];

    v11 = [(HUChevronButton *)v3 titleLabel];
    [v11 _setTextColorFollowsTintColor:1];

    v12 = [(HUChevronButton *)v3 titleLabel];
    [v12 setAdjustsFontSizeToFitWidth:1];

    v13 = [(HUChevronButton *)v3 titleLabel];
    [v13 setMinimumScaleFactor:0.7];

    v14 = [(HUChevronButton *)v3 titleLabel];
    [v14 setBaselineAdjustment:1];

    v15 = [MEMORY[0x1E4F428B8] systemWhiteColor];
    v16 = [(HUChevronButton *)v3 titleLabel];
    [v16 setTintColor:v15];

    v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42AA0]), "initWithFrame:", v5, v6, v7, v8);
    [(HUChevronButton *)v3 setChevronImageView:v17];

    v18 = [(HUChevronButton *)v3 chevronImageView];
    [v18 setUserInteractionEnabled:0];

    v19 = [MEMORY[0x1E4F42A80] imageNamed:@"edit-chevron"];
    v20 = [v19 imageWithRenderingMode:2];
    v21 = [(HUChevronButton *)v3 chevronImageView];
    [v21 setImage:v20];

    v22 = [(HUChevronButton *)v3 chevronImageView];
    LODWORD(v23) = 1144766464;
    [v22 setContentCompressionResistancePriority:0 forAxis:v23];

    v24 = [MEMORY[0x1E4F428B8] systemWhiteColor];
    v25 = [(HUChevronButton *)v3 chevronImageView];
    [v25 setTintColor:v24];

    id v26 = objc_alloc(MEMORY[0x1E4F42E20]);
    v27 = [(HUChevronButton *)v3 titleLabel];
    v59[0] = v27;
    v28 = [(HUChevronButton *)v3 chevronImageView];
    v59[1] = v28;
    v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v59 count:2];
    v30 = (void *)[v26 initWithArrangedSubviews:v29];
    [(HUChevronButton *)v3 setContainerView:v30];

    v31 = [(HUChevronButton *)v3 containerView];
    [v31 setUserInteractionEnabled:0];

    v32 = [(HUChevronButton *)v3 containerView];
    [v32 setTranslatesAutoresizingMaskIntoConstraints:0];

    v33 = [(HUChevronButton *)v3 containerView];
    [v33 setAlignment:3];

    v34 = [(HUChevronButton *)v3 containerView];
    [v34 setSpacing:4.0];

    v35 = [(HUChevronButton *)v3 containerView];
    [(HUChevronButton *)v3 addSubview:v35];

    v36 = [MEMORY[0x1E4F1CA48] array];
    v37 = [(HUChevronButton *)v3 containerView];
    v38 = [v37 topAnchor];
    v39 = [(HUChevronButton *)v3 topAnchor];
    v40 = [v38 constraintEqualToAnchor:v39 constant:6.0];
    [v36 addObject:v40];

    v41 = [(HUChevronButton *)v3 containerView];
    v42 = [v41 bottomAnchor];
    v43 = [(HUChevronButton *)v3 bottomAnchor];
    v44 = [v42 constraintEqualToAnchor:v43 constant:-6.0];
    [v36 addObject:v44];

    v45 = [(HUChevronButton *)v3 containerView];
    v46 = [v45 centerXAnchor];
    v47 = [(HUChevronButton *)v3 centerXAnchor];
    v48 = [v46 constraintEqualToAnchor:v47];
    [v36 addObject:v48];

    v49 = [(HUChevronButton *)v3 containerView];
    v50 = [v49 leadingAnchor];
    v51 = [(HUChevronButton *)v3 leadingAnchor];
    v52 = [v50 constraintGreaterThanOrEqualToAnchor:v51];
    [v36 addObject:v52];

    v53 = [(HUChevronButton *)v3 containerView];
    v54 = [v53 trailingAnchor];
    v55 = [(HUChevronButton *)v3 trailingAnchor];
    v56 = [v54 constraintLessThanOrEqualToAnchor:v55];
    [v36 addObject:v56];

    [MEMORY[0x1E4F28DC8] activateConstraints:v36];
  }
  return v3;
}

- (void)setHighlighted:(BOOL)a3
{
  v10.receiver = self;
  v10.super_class = (Class)HUChevronButton;
  -[HUChevronButton setHighlighted:](&v10, sel_setHighlighted_);
  if (a3) {
    [(HUChevronButton *)self tintColor];
  }
  else {
  double v5 = [MEMORY[0x1E4F428B8] systemWhiteColor];
  }
  double v6 = (void *)MEMORY[0x1E4F42FF0];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __34__HUChevronButton_setHighlighted___block_invoke;
  v8[3] = &unk_1E63850E0;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  [v6 animateWithDuration:v8 animations:0.25];
}

void __34__HUChevronButton_setHighlighted___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  v3 = [*(id *)(a1 + 32) titleLabel];
  [v3 setTintColor:v2];

  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = [*(id *)(a1 + 32) chevronImageView];
  [v5 setTintColor:v4];
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UIStackView)containerView
{
  return self->_containerView;
}

- (void)setContainerView:(id)a3
{
}

- (UIImageView)chevronImageView
{
  return self->_chevronImageView;
}

- (void)setChevronImageView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chevronImageView, 0);
  objc_storeStrong((id *)&self->_containerView, 0);

  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end