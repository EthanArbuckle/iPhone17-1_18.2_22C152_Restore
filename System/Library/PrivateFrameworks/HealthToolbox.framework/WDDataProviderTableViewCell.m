@interface WDDataProviderTableViewCell
- (BOOL)isActive;
- (CGSize)iconSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSLayoutConstraint)checkmarkLeadingConstraint;
- (WDDataProviderTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)_setupUI;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setActive:(BOOL)a3;
- (void)setCheckmarkLeadingConstraint:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)setIconImage:(id)a3;
@end

@implementation WDDataProviderTableViewCell

- (WDDataProviderTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)WDDataProviderTableViewCell;
  v4 = [(WDDataProviderTableViewCell *)&v7 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4) {
    [(WDDataProviderTableViewCell *)v4 _setupUI];
  }
  return v5;
}

- (void)_setupUI
{
  v3 = (UILabel *)objc_alloc_init(MEMORY[0x263F1C768]);
  inactiveLabel = self->_inactiveLabel;
  self->_inactiveLabel = v3;

  v5 = [(WDDataProviderTableViewCell *)self detailTextLabel];
  v6 = [v5 font];
  [(UILabel *)self->_inactiveLabel setFont:v6];

  [(UILabel *)self->_inactiveLabel setHidden:1];
  objc_super v7 = WDBundle();
  v8 = [v7 localizedStringForKey:@"INACTIVE" value:&stru_26D2EA890 table:@"WellnessDashboard-Localizable"];
  [(UILabel *)self->_inactiveLabel setText:v8];

  [(UILabel *)self->_inactiveLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UILabel *)self->_inactiveLabel setNumberOfLines:0];
  id v40 = [MEMORY[0x263F1C6B0] systemImageNamed:@"checkmark"];
  [v40 size];
  UIGraphicsBeginImageContext(v42);
  v9 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  v10 = (UIButton *)objc_alloc_init(MEMORY[0x263F1C488]);
  checkmarkButton = self->_checkmarkButton;
  self->_checkmarkButton = v10;

  [(UIButton *)self->_checkmarkButton setImage:v9 forState:0];
  [(UIButton *)self->_checkmarkButton setImage:v40 forState:4];
  v12 = self->_checkmarkButton;
  v13 = [MEMORY[0x263F1C550] labelColor];
  [(UIButton *)v12 setTitleColor:v13 forState:0];

  [(UIButton *)self->_checkmarkButton setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIButton *)self->_checkmarkButton setUserInteractionEnabled:0];
  v14 = [(WDDataProviderTableViewCell *)self contentView];
  [v14 addSubview:self->_inactiveLabel];

  v15 = [(WDDataProviderTableViewCell *)self contentView];
  [v15 addSubview:self->_checkmarkButton];

  v16 = [(UIButton *)self->_checkmarkButton widthAnchor];
  [(UIButton *)self->_checkmarkButton intrinsicContentSize];
  v17 = objc_msgSend(v16, "constraintEqualToConstant:");
  [v17 setActive:1];

  v18 = [(UIButton *)self->_checkmarkButton leadingAnchor];
  v19 = [(WDDataProviderTableViewCell *)self contentView];
  v20 = [v19 leadingAnchor];
  [(UIButton *)self->_checkmarkButton intrinsicContentSize];
  v22 = [v18 constraintEqualToAnchor:v20 constant:-v21];
  [(WDDataProviderTableViewCell *)self setCheckmarkLeadingConstraint:v22];

  v23 = [(WDDataProviderTableViewCell *)self checkmarkLeadingConstraint];
  [v23 setActive:1];

  [(UIButton *)self->_checkmarkButton setAlpha:0.0];
  v24 = [(UIButton *)self->_checkmarkButton centerYAnchor];
  v25 = [(WDDataProviderTableViewCell *)self imageView];
  v26 = [v25 centerYAnchor];
  v27 = [v24 constraintEqualToAnchor:v26];
  [v27 setActive:1];

  v28 = [(UILabel *)self->_inactiveLabel topAnchor];
  v29 = [(WDDataProviderTableViewCell *)self textLabel];
  v30 = [v29 bottomAnchor];
  v31 = [v28 constraintEqualToAnchor:v30];
  [v31 setActive:1];

  v32 = [(UILabel *)self->_inactiveLabel leadingAnchor];
  v33 = [(WDDataProviderTableViewCell *)self textLabel];
  v34 = [v33 leadingAnchor];
  v35 = [v32 constraintEqualToAnchor:v34];
  [v35 setActive:1];

  v36 = [(UILabel *)self->_inactiveLabel trailingAnchor];
  v37 = [(WDDataProviderTableViewCell *)self contentView];
  v38 = [v37 trailingAnchor];
  v39 = [v36 constraintEqualToAnchor:v38 constant:10.0];
  [v39 setActive:1];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  v11.receiver = self;
  v11.super_class = (Class)WDDataProviderTableViewCell;
  -[WDDataProviderTableViewCell sizeThatFits:](&v11, sel_sizeThatFits_, a3.width, a3.height);
  double v5 = v4;
  double v7 = v6;
  if (![(WDDataProviderTableViewCell *)self isActive])
  {
    -[UILabel sizeThatFits:](self->_inactiveLabel, "sizeThatFits:", v5, 0.0);
    double v7 = v7 + v8;
  }
  double v9 = v5;
  double v10 = v7;
  result.height = v10;
  result.width = v9;
  return result;
}

- (void)layoutSubviews
{
  v57.receiver = self;
  v57.super_class = (Class)WDDataProviderTableViewCell;
  [(WDDataProviderTableViewCell *)&v57 layoutSubviews];
  v3 = [(WDDataProviderTableViewCell *)self imageView];
  [v3 frame];
  double v5 = v4;
  double v51 = v6;
  double v55 = v8;
  double v56 = v7;

  double v9 = [(WDDataProviderTableViewCell *)self textLabel];
  [v9 frame];
  double v11 = v10;
  double v13 = v12;
  double v53 = v15;
  double v54 = v14;

  [(UILabel *)self->_inactiveLabel frame];
  double v17 = v16;
  CGFloat v50 = v18;
  double v20 = v19;
  double v22 = v21;
  BOOL v23 = [(WDDataProviderTableViewCell *)self isActive];
  if (v23)
  {
    v24 = [MEMORY[0x263F1C550] labelColor];
    v25 = [(WDDataProviderTableViewCell *)self textLabel];
    [v25 setTextColor:v24];
  }
  else
  {
    v26 = [MEMORY[0x263F1C550] secondaryLabelColor];
    v27 = [(WDDataProviderTableViewCell *)self textLabel];
    [v27 setTextColor:v26];

    v24 = [MEMORY[0x263F1C550] secondaryLabelColor];
    [(UILabel *)self->_inactiveLabel setTextColor:v24];
  }

  [(UILabel *)self->_inactiveLabel setHidden:v23];
  [(UIButton *)self->_checkmarkButton setSelected:v23];
  int v28 = [(WDDataProviderTableViewCell *)self isEditing];
  checkmarkButton = self->_checkmarkButton;
  double v30 = v22;
  if (v28)
  {
    [(UIButton *)checkmarkButton setAlpha:1.0];
    v31 = [(WDDataProviderTableViewCell *)self checkmarkLeadingConstraint];
    [v31 setConstant:10.0];

    uint64_t v32 = [(WDDataProviderTableViewCell *)self effectiveUserInterfaceLayoutDirection];
    v33 = [(WDDataProviderTableViewCell *)self checkmarkLeadingConstraint];
    [v33 constant];
    double v35 = v34;
    [(UIButton *)self->_checkmarkButton intrinsicContentSize];
    double v37 = v35 + v36;
    double v38 = v20;
    if (v32)
    {
      double v39 = v37 + -4.0;

      double v40 = 0.0;
      if (v39 >= 0.0) {
        double v40 = v39;
      }
      double v5 = v5 - v40;
      double v11 = v11 - v40;
    }
    else
    {
      double v44 = v37 + 4.0 - v5;

      double v45 = 0.0;
      if (v44 >= 0.0) {
        double v45 = v44;
      }
      double v5 = v5 + v45;
      double v11 = v11 + v45;
    }
  }
  else
  {
    double v38 = v20;
    [(UIButton *)checkmarkButton intrinsicContentSize];
    double v42 = -v41;
    v43 = [(WDDataProviderTableViewCell *)self checkmarkLeadingConstraint];
    [v43 setConstant:v42];

    [(UIButton *)self->_checkmarkButton setAlpha:0.0];
  }
  double v52 = v5;
  if ([(WDDataProviderTableViewCell *)self isActive])
  {
    double v46 = v51;
    double v47 = v13;
  }
  else
  {
    v58.origin.x = v17;
    v58.origin.y = v50;
    v58.size.width = v38;
    v58.size.height = v30;
    double v46 = v51 - CGRectGetHeight(v58) * 0.25;
    v59.origin.x = v17;
    v59.origin.y = v50;
    v59.size.width = v38;
    v59.size.height = v30;
    double v47 = v13 - CGRectGetHeight(v59) * 0.25;
  }
  v60.origin.x = v11;
  v60.origin.y = v47;
  v60.size.width = v54;
  v60.size.height = v53;
  -[UILabel setFrame:](self->_inactiveLabel, "setFrame:", v17, CGRectGetMaxY(v60), v38, v30);
  v48 = [(WDDataProviderTableViewCell *)self imageView];
  objc_msgSend(v48, "setFrame:", v52, v46, v56, v55);

  v49 = [(WDDataProviderTableViewCell *)self textLabel];
  objc_msgSend(v49, "setFrame:", v11, v47, v54, v53);
}

- (void)prepareForReuse
{
  v6.receiver = self;
  v6.super_class = (Class)WDDataProviderTableViewCell;
  [(WDDataProviderTableViewCell *)&v6 prepareForReuse];
  [(UIButton *)self->_checkmarkButton intrinsicContentSize];
  double v4 = -v3;
  double v5 = [(WDDataProviderTableViewCell *)self checkmarkLeadingConstraint];
  [v5 setConstant:v4];
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __51__WDDataProviderTableViewCell_setEditing_animated___block_invoke;
  v7[3] = &unk_26458EDC8;
  BOOL v8 = a3;
  v7[4] = self;
  uint64_t v5 = MEMORY[0x223C798A0](v7, a2);
  objc_super v6 = (void *)v5;
  if (v4) {
    [MEMORY[0x263F1CB60] animateWithDuration:v5 animations:0.25];
  }
  else {
    (*(void (**)(uint64_t))(v5 + 16))(v5);
  }
}

id __51__WDDataProviderTableViewCell_setEditing_animated___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(unsigned __int8 *)(a1 + 40);
  v3.receiver = *(id *)(a1 + 32);
  v3.super_class = (Class)WDDataProviderTableViewCell;
  return objc_msgSendSuper2(&v3, sel_setEditing_animated_, v1, 0);
}

- (CGSize)iconSize
{
  objc_super v3 = [(WDDataProviderTableViewCell *)self imageView];
  BOOL v4 = [v3 image];

  if (v4)
  {
    uint64_t v5 = [(WDDataProviderTableViewCell *)self imageView];
    objc_super v6 = [v5 image];
    [v6 size];
    double v8 = v7;
    double v10 = v9;
  }
  else
  {
    double v8 = *MEMORY[0x263F001B0];
    double v10 = *(double *)(MEMORY[0x263F001B0] + 8);
  }
  double v11 = v8;
  double v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (void)setDisplayName:(id)a3
{
  id v4 = a3;
  id v5 = [(WDDataProviderTableViewCell *)self textLabel];
  [v5 setText:v4];
}

- (void)setIconImage:(id)a3
{
  id v4 = a3;
  id v5 = [(WDDataProviderTableViewCell *)self imageView];
  [v5 setImage:v4];
}

- (BOOL)isActive
{
  return self->_active;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (NSLayoutConstraint)checkmarkLeadingConstraint
{
  return self->_checkmarkLeadingConstraint;
}

- (void)setCheckmarkLeadingConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_checkmarkLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_iconImageWidth, 0);
  objc_storeStrong((id *)&self->_checkmarkButton, 0);

  objc_storeStrong((id *)&self->_inactiveLabel, 0);
}

@end