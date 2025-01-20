@interface CNContactSuggestionsCollectionViewCell
+ (id)cellIdentifier;
- (BOOL)useAccessibleLayout;
- (CNContactSuggestionsCollectionViewCell)initWithFrame:(CGRect)a3;
- (NSString)displayString;
- (UIImage)image;
- (UIImageView)avatarView;
- (UIImageView)checkImageBackgroundView;
- (UIImageView)checkImageView;
- (UILabel)nameLabel;
- (id)preferredLayoutAttributesFittingAttributes:(id)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setAvatarView:(id)a3;
- (void)setCheckImageBackgroundView:(id)a3;
- (void)setCheckImageView:(id)a3;
- (void)setCheckMarkHidden:(BOOL)a3;
- (void)setDisplayString:(id)a3;
- (void)setImage:(id)a3;
- (void)setNameLabel:(id)a3;
- (void)setSelected:(BOOL)a3;
- (void)setUpCheckMarkConstraints;
- (void)setupConstraints;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation CNContactSuggestionsCollectionViewCell

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nameLabel, 0);
  objc_storeStrong((id *)&self->_checkImageBackgroundView, 0);
  objc_storeStrong((id *)&self->_checkImageView, 0);

  objc_storeStrong((id *)&self->_avatarView, 0);
}

- (void)setNameLabel:(id)a3
{
}

- (UILabel)nameLabel
{
  return self->_nameLabel;
}

- (void)setCheckImageBackgroundView:(id)a3
{
}

- (UIImageView)checkImageBackgroundView
{
  return self->_checkImageBackgroundView;
}

- (void)setCheckImageView:(id)a3
{
}

- (UIImageView)checkImageView
{
  return self->_checkImageView;
}

- (void)setAvatarView:(id)a3
{
}

- (UIImageView)avatarView
{
  return self->_avatarView;
}

- (void)prepareForReuse
{
  v5.receiver = self;
  v5.super_class = (Class)CNContactSuggestionsCollectionViewCell;
  [(CNContactSuggestionsCollectionViewCell *)&v5 prepareForReuse];
  v3 = [(CNContactSuggestionsCollectionViewCell *)self avatarView];
  [v3 setImage:0];

  v4 = [(CNContactSuggestionsCollectionViewCell *)self nameLabel];
  [v4 setText:0];

  [(CNContactSuggestionsCollectionViewCell *)self setCheckMarkHidden:1];
}

- (void)setDisplayString:(id)a3
{
}

- (NSString)displayString
{
  return [(UILabel *)self->_nameLabel text];
}

- (void)setImage:(id)a3
{
  id v4 = a3;
  id v5 = [(CNContactSuggestionsCollectionViewCell *)self avatarView];
  [v5 setImage:v4];
}

- (UIImage)image
{
  v2 = [(CNContactSuggestionsCollectionViewCell *)self avatarView];
  v3 = [v2 image];

  return (UIImage *)v3;
}

- (void)setSelected:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)CNContactSuggestionsCollectionViewCell;
  -[CNContactSuggestionsCollectionViewCell setSelected:](&v5, sel_setSelected_);
  [(CNContactSuggestionsCollectionViewCell *)self setCheckMarkHidden:!v3];
}

- (id)preferredLayoutAttributesFittingAttributes:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CNContactSuggestionsCollectionViewCell;
  id v4 = [(CNContactSuggestionsCollectionViewCell *)&v7 preferredLayoutAttributesFittingAttributes:a3];
  if ([(CNContactSuggestionsCollectionViewCell *)self useAccessibleLayout])
  {
    objc_super v5 = +[CNUIFontRepository contactSuggestionsNameFont];
    [v5 lineHeight];

    [v4 size];
    objc_msgSend(v4, "setSize:");
  }

  return v4;
}

- (void)setUpCheckMarkConstraints
{
  v46[8] = *MEMORY[0x1E4F143B8];
  v45 = [(CNContactSuggestionsCollectionViewCell *)self checkImageView];
  v43 = [v45 widthAnchor];
  v44 = [(CNContactSuggestionsCollectionViewCell *)self checkImageView];
  v42 = [v44 heightAnchor];
  v41 = [v43 constraintEqualToAnchor:v42];
  v46[0] = v41;
  v40 = [(CNContactSuggestionsCollectionViewCell *)self checkImageView];
  v38 = [v40 widthAnchor];
  v39 = [(CNContactSuggestionsCollectionViewCell *)self avatarView];
  v37 = [v39 widthAnchor];
  v36 = [v38 constraintEqualToAnchor:v37 multiplier:0.4];
  v46[1] = v36;
  v35 = [(CNContactSuggestionsCollectionViewCell *)self checkImageView];
  v33 = [v35 bottomAnchor];
  v34 = [(CNContactSuggestionsCollectionViewCell *)self avatarView];
  v32 = [v34 bottomAnchor];
  v31 = [v33 constraintEqualToAnchor:v32 constant:4.0];
  v46[2] = v31;
  v30 = [(CNContactSuggestionsCollectionViewCell *)self checkImageView];
  v28 = [v30 trailingAnchor];
  v29 = [(CNContactSuggestionsCollectionViewCell *)self avatarView];
  v27 = [v29 trailingAnchor];
  v26 = [v28 constraintEqualToAnchor:v27 constant:4.0];
  v46[3] = v26;
  v25 = [(CNContactSuggestionsCollectionViewCell *)self checkImageBackgroundView];
  v23 = [v25 widthAnchor];
  v24 = [(CNContactSuggestionsCollectionViewCell *)self checkImageBackgroundView];
  v22 = [v24 heightAnchor];
  v20 = [v23 constraintEqualToAnchor:v22];
  v46[4] = v20;
  v19 = [(CNContactSuggestionsCollectionViewCell *)self checkImageBackgroundView];
  v17 = [v19 widthAnchor];
  v18 = [(CNContactSuggestionsCollectionViewCell *)self checkImageView];
  v16 = [v18 widthAnchor];
  v15 = [v17 constraintEqualToAnchor:v16 multiplier:0.75];
  v46[5] = v15;
  v14 = [(CNContactSuggestionsCollectionViewCell *)self checkImageBackgroundView];
  BOOL v3 = [v14 centerXAnchor];
  id v4 = [(CNContactSuggestionsCollectionViewCell *)self checkImageView];
  objc_super v5 = [v4 centerXAnchor];
  v6 = [v3 constraintEqualToAnchor:v5];
  v46[6] = v6;
  objc_super v7 = [(CNContactSuggestionsCollectionViewCell *)self checkImageBackgroundView];
  v8 = [v7 centerYAnchor];
  v9 = [(CNContactSuggestionsCollectionViewCell *)self checkImageView];
  v10 = [v9 centerYAnchor];
  v11 = [v8 constraintEqualToAnchor:v10];
  v46[7] = v11;
  v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v46 count:8];

  [MEMORY[0x1E4F28DC8] activateConstraints:v21];
  v12 = [(CNContactSuggestionsCollectionViewCell *)self constraints];
  id v13 = (id)[v12 arrayByAddingObjectsFromArray:v21];
}

- (void)setupConstraints
{
  v58[7] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(CNContactSuggestionsCollectionViewCell *)self useAccessibleLayout];
  id v4 = [(CNContactSuggestionsCollectionViewCell *)self avatarView];
  objc_super v5 = [v4 widthAnchor];
  v6 = [(CNContactSuggestionsCollectionViewCell *)self avatarView];
  objc_super v7 = [v6 heightAnchor];
  uint64_t v8 = [v5 constraintEqualToAnchor:v7];
  v9 = (void *)v8;
  if (v3)
  {
    v58[0] = v8;
    v32 = [(CNContactSuggestionsCollectionViewCell *)self avatarView];
    v30 = [v32 topAnchor];
    v31 = [(CNContactSuggestionsCollectionViewCell *)self contentView];
    v56 = [v31 topAnchor];
    v55 = objc_msgSend(v30, "constraintGreaterThanOrEqualToAnchor:constant:", 22.0);
    v58[1] = v55;
    v54 = [(CNContactSuggestionsCollectionViewCell *)self avatarView];
    v10 = [v54 centerYAnchor];
    v52 = [(CNContactSuggestionsCollectionViewCell *)self contentView];
    [v52 centerYAnchor];
    v51 = v53 = v10;
    v50 = objc_msgSend(v10, "constraintEqualToAnchor:");
    v58[2] = v50;
    v49 = [(CNContactSuggestionsCollectionViewCell *)self nameLabel];
    v11 = [v49 centerYAnchor];
    v47 = [(CNContactSuggestionsCollectionViewCell *)self contentView];
    [v47 centerYAnchor];
    v46 = v48 = v11;
    v45 = objc_msgSend(v11, "constraintEqualToAnchor:");
    v58[3] = v45;
    v44 = [(CNContactSuggestionsCollectionViewCell *)self avatarView];
    v12 = [v44 leadingAnchor];
    v42 = [(CNContactSuggestionsCollectionViewCell *)self contentView];
    [v42 leadingAnchor];
    v41 = v43 = v12;
    v40 = objc_msgSend(v12, "constraintEqualToAnchor:");
    v58[4] = v40;
    v38 = [(CNContactSuggestionsCollectionViewCell *)self nameLabel];
    id v13 = [v38 leadingAnchor];
    v36 = [(CNContactSuggestionsCollectionViewCell *)self avatarView];
    [v36 trailingAnchor];
    v35 = v37 = v13;
    v14 = objc_msgSend(v13, "constraintEqualToAnchor:constant:", 10.0);
    v58[5] = v14;
    [(CNContactSuggestionsCollectionViewCell *)self nameLabel];
    v15 = v34 = v4;
    [v15 trailingAnchor];
    v16 = v33 = v5;
    [(CNContactSuggestionsCollectionViewCell *)self contentView];
    v17 = v7;
    v19 = v18 = v6;
    [v19 trailingAnchor];
    v21 = v20 = v9;
    v22 = [v16 constraintEqualToAnchor:v21];
    v58[6] = v22;
    v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:v58 count:7];

    v23 = v31;
    v9 = v20;
    v24 = v30;

    v6 = v18;
    objc_super v7 = v17;
    v25 = v32;

    objc_super v5 = v33;
    id v4 = v34;
  }
  else
  {
    v57[0] = v8;
    v25 = [(CNContactSuggestionsCollectionViewCell *)self avatarView];
    v24 = [v25 topAnchor];
    v23 = [(CNContactSuggestionsCollectionViewCell *)self contentView];
    v56 = [v23 topAnchor];
    v55 = objc_msgSend(v24, "constraintEqualToAnchor:");
    v57[1] = v55;
    v54 = [(CNContactSuggestionsCollectionViewCell *)self nameLabel];
    v26 = [v54 topAnchor];
    v52 = [(CNContactSuggestionsCollectionViewCell *)self avatarView];
    [v52 bottomAnchor];
    v51 = v53 = v26;
    v50 = objc_msgSend(v26, "constraintEqualToAnchor:constant:", 10.0);
    v57[2] = v50;
    v49 = [(CNContactSuggestionsCollectionViewCell *)self avatarView];
    v27 = [v49 centerXAnchor];
    v47 = [(CNContactSuggestionsCollectionViewCell *)self contentView];
    [v47 centerXAnchor];
    v46 = v48 = v27;
    v45 = objc_msgSend(v27, "constraintEqualToAnchor:");
    v57[3] = v45;
    v44 = [(CNContactSuggestionsCollectionViewCell *)self nameLabel];
    v28 = [v44 leadingAnchor];
    v42 = [(CNContactSuggestionsCollectionViewCell *)self contentView];
    [v42 leadingAnchor];
    v41 = v43 = v28;
    v40 = objc_msgSend(v28, "constraintEqualToAnchor:constant:", -1.0);
    v57[4] = v40;
    v38 = [(CNContactSuggestionsCollectionViewCell *)self nameLabel];
    v29 = [v38 trailingAnchor];
    v36 = [(CNContactSuggestionsCollectionViewCell *)self contentView];
    [v36 trailingAnchor];
    v35 = v37 = v29;
    v14 = objc_msgSend(v29, "constraintEqualToAnchor:constant:", 1.0);
    v57[5] = v14;
    v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:v57 count:6];
  }

  [MEMORY[0x1E4F28DC8] activateConstraints:v39];
  [(CNContactSuggestionsCollectionViewCell *)self setUpCheckMarkConstraints];
}

- (BOOL)useAccessibleLayout
{
  v9[5] = *MEMORY[0x1E4F143B8];
  v2 = [(CNContactSuggestionsCollectionViewCell *)self traitCollection];
  uint64_t v3 = *MEMORY[0x1E4FB2790];
  v9[0] = *MEMORY[0x1E4FB2798];
  v9[1] = v3;
  uint64_t v4 = *MEMORY[0x1E4FB2780];
  v9[2] = *MEMORY[0x1E4FB2788];
  v9[3] = v4;
  v9[4] = *MEMORY[0x1E4FB2778];
  objc_super v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:5];
  v6 = [v2 preferredContentSizeCategory];
  char v7 = [v5 containsObject:v6];

  return v7;
}

- (void)layoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)CNContactSuggestionsCollectionViewCell;
  [(CNContactSuggestionsCollectionViewCell *)&v13 layoutSubviews];
  [MEMORY[0x1E4F39CF8] begin];
  uint64_t v3 = [(CNContactSuggestionsCollectionViewCell *)self checkImageBackgroundView];
  [v3 frame];
  double v5 = v4 * 0.5;
  v6 = [(CNContactSuggestionsCollectionViewCell *)self checkImageBackgroundView];
  char v7 = [v6 layer];
  [v7 setCornerRadius:v5];

  uint64_t v8 = [(CNContactSuggestionsCollectionViewCell *)self checkImageView];
  [v8 frame];
  double v10 = v9 * 0.5;
  v11 = [(CNContactSuggestionsCollectionViewCell *)self checkImageView];
  v12 = [v11 layer];
  [v12 setCornerRadius:v10];

  [MEMORY[0x1E4F39CF8] commit];
}

- (void)traitCollectionDidChange:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)CNContactSuggestionsCollectionViewCell;
  id v4 = a3;
  [(CNContactSuggestionsCollectionViewCell *)&v12 traitCollectionDidChange:v4];
  double v5 = [(CNContactSuggestionsCollectionViewCell *)self traitCollection];
  uint64_t v6 = [v5 userInterfaceStyle];
  uint64_t v7 = [v4 userInterfaceStyle];

  if (v6 != v7)
  {
    [MEMORY[0x1E4F39CF8] begin];
    id v8 = +[CNUIColorRepository contactSuggestionsCheckmarkBorderColor];
    uint64_t v9 = [v8 CGColor];
    double v10 = [(CNContactSuggestionsCollectionViewCell *)self checkImageView];
    v11 = [v10 layer];
    [v11 setBorderColor:v9];

    [MEMORY[0x1E4F39CF8] commit];
  }
}

- (void)setCheckMarkHidden:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = [(CNContactSuggestionsCollectionViewCell *)self checkImageBackgroundView];
  [v5 setHidden:v3];

  id v6 = [(CNContactSuggestionsCollectionViewCell *)self checkImageView];
  [v6 setHidden:v3];
}

- (CNContactSuggestionsCollectionViewCell)initWithFrame:(CGRect)a3
{
  v40.receiver = self;
  v40.super_class = (Class)CNContactSuggestionsCollectionViewCell;
  BOOL v3 = -[CNContactSuggestionsCollectionViewCell initWithFrame:](&v40, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = +[CNUIColorRepository contactSuggestionsBackgroundColor];
    [(CNContactSuggestionsCollectionViewCell *)v3 setBackgroundColor:v4];

    id v5 = objc_alloc(MEMORY[0x1E4FB1838]);
    double v6 = *MEMORY[0x1E4F1DB28];
    double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    double v10 = objc_msgSend(v5, "initWithFrame:", *MEMORY[0x1E4F1DB28], v7, v8, v9);
    [v10 setTranslatesAutoresizingMaskIntoConstraints:0];
    v11 = [(CNContactSuggestionsCollectionViewCell *)v3 contentView];
    [v11 addSubview:v10];

    [(CNContactSuggestionsCollectionViewCell *)v3 setAvatarView:v10];
    objc_super v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1838]), "initWithFrame:", v6, v7, v8, v9);
    [v12 setTranslatesAutoresizingMaskIntoConstraints:0];
    objc_super v13 = +[CNUIColorRepository contactSuggestionsCheckmarkBackgroundViewColor];
    [v12 setBackgroundColor:v13];

    v14 = [(CNContactSuggestionsCollectionViewCell *)v3 contentView];
    [v14 addSubview:v12];

    [(CNContactSuggestionsCollectionViewCell *)v3 setCheckImageBackgroundView:v12];
    v15 = [(CNContactSuggestionsCollectionViewCell *)v3 checkImageBackgroundView];
    [v15 frame];
    double v17 = v16 * 0.5;
    v18 = [(CNContactSuggestionsCollectionViewCell *)v3 checkImageBackgroundView];
    v19 = [v18 layer];
    [v19 setCornerRadius:v17];

    v20 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1838]), "initWithFrame:", v6, v7, v8, v9);
    [v20 setTranslatesAutoresizingMaskIntoConstraints:0];
    id v21 = +[CNUIColorRepository contactSuggestionsCheckmarkBorderColor];
    uint64_t v22 = [v21 CGColor];
    v23 = [v20 layer];
    [v23 setBorderColor:v22];

    v24 = [v20 layer];
    [v24 setBorderWidth:2.0];

    v25 = [(CNContactSuggestionsCollectionViewCell *)v3 contentView];
    [v25 addSubview:v20];

    v26 = [MEMORY[0x1E4FB1818] systemImageNamed:@"checkmark.circle.fill"];
    [v20 setImage:v26];

    [(CNContactSuggestionsCollectionViewCell *)v3 setCheckImageView:v20];
    v27 = [(CNContactSuggestionsCollectionViewCell *)v3 checkImageView];
    [v27 frame];
    double v29 = v28 * 0.5;
    v30 = [(CNContactSuggestionsCollectionViewCell *)v3 checkImageView];
    v31 = [v30 layer];
    [v31 setCornerRadius:v29];

    [(CNContactSuggestionsCollectionViewCell *)v3 setCheckMarkHidden:1];
    v32 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", v6, v7, v8, v9);
    [v32 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v32 setNumberOfLines:2];
    v33 = +[CNUIFontRepository contactSuggestionsNameFont];
    [v32 setFont:v33];

    v34 = +[CNUIColorRepository contactSuggestionsTextLabelColor];
    [v32 setTextColor:v34];

    objc_msgSend(v32, "setTextAlignment:", -[CNContactSuggestionsCollectionViewCell useAccessibleLayout](v3, "useAccessibleLayout") ^ 1);
    [v32 setAdjustsFontSizeToFitWidth:1];
    [v32 setMinimumScaleFactor:0.95];
    [v32 setAllowsDefaultTighteningForTruncation:0];
    v35 = [(CNContactSuggestionsCollectionViewCell *)v3 contentView];
    [v35 addSubview:v32];

    [(CNContactSuggestionsCollectionViewCell *)v3 setNameLabel:v32];
    id v36 = objc_alloc_init(MEMORY[0x1E4FB1940]);
    v37 = [(CNContactSuggestionsCollectionViewCell *)v3 contentView];
    [v37 addLayoutGuide:v36];

    [(CNContactSuggestionsCollectionViewCell *)v3 setClipsToBounds:1];
    [(CNContactSuggestionsCollectionViewCell *)v3 setupConstraints];
    v38 = v3;
  }
  return v3;
}

+ (id)cellIdentifier
{
  return @"CNContactSuggestionsCollectionViewCell";
}

@end