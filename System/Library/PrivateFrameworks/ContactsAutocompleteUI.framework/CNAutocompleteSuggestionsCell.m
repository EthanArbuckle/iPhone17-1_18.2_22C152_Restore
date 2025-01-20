@interface CNAutocompleteSuggestionsCell
+ (id)cellIdentifier;
- (BOOL)useAccessibleLayout;
- (CNAutocompleteSuggestionsCell)initWithFrame:(CGRect)a3;
- (NSString)displayString;
- (UIImage)image;
- (UIImageView)avatarView;
- (UILabel)nameLabel;
- (void)setAvatarView:(id)a3;
- (void)setDisplayString:(id)a3;
- (void)setImage:(id)a3;
- (void)setNameLabel:(id)a3;
- (void)setSelected:(BOOL)a3;
- (void)setupConstraints;
@end

@implementation CNAutocompleteSuggestionsCell

+ (id)cellIdentifier
{
  return @"CNAutocompleteSuggestionsCell";
}

- (CNAutocompleteSuggestionsCell)initWithFrame:(CGRect)a3
{
  v23.receiver = self;
  v23.super_class = (Class)CNAutocompleteSuggestionsCell;
  v3 = -[CNAutocompleteSuggestionsCell initWithFrame:](&v23, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x1E4F428B8] clearColor];
    [(CNAutocompleteSuggestionsCell *)v3 setBackgroundColor:v4];

    v5 = [CNAutocompleteSuggestionsImageView alloc];
    double v6 = *MEMORY[0x1E4F1DB28];
    double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    v10 = -[CNAutocompleteSuggestionsImageView initWithFrame:](v5, "initWithFrame:", *MEMORY[0x1E4F1DB28], v7, v8, v9);
    [(CNAutocompleteSuggestionsImageView *)v10 setTranslatesAutoresizingMaskIntoConstraints:0];
    v11 = [(CNAutocompleteSuggestionsCell *)v3 contentView];
    [v11 addSubview:v10];

    [(CNAutocompleteSuggestionsCell *)v3 setAvatarView:v10];
    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42B38]), "initWithFrame:", v6, v7, v8, v9);
    [v12 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v12 setNumberOfLines:2];
    v13 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4F43880]];
    [v12 setFont:v13];

    v14 = [MEMORY[0x1E4F428B8] labelColor];
    [v12 setTextColor:v14];

    v15 = [(CNAutocompleteSuggestionsCell *)v3 traitCollection];
    BOOL v16 = [v15 layoutDirection] == 1;

    if ([(CNAutocompleteSuggestionsCell *)v3 useAccessibleLayout]) {
      uint64_t v17 = 2 * v16;
    }
    else {
      uint64_t v17 = 1;
    }
    [v12 setTextAlignment:v17];
    [v12 setAdjustsFontSizeToFitWidth:1];
    [v12 setMinimumScaleFactor:0.949999988];
    [v12 setAllowsDefaultTighteningForTruncation:0];
    v18 = [(CNAutocompleteSuggestionsCell *)v3 contentView];
    [v18 addSubview:v12];

    [(CNAutocompleteSuggestionsCell *)v3 setNameLabel:v12];
    id v19 = objc_alloc_init(MEMORY[0x1E4F42B48]);
    v20 = [(CNAutocompleteSuggestionsCell *)v3 contentView];
    [v20 addLayoutGuide:v19];

    [(CNAutocompleteSuggestionsCell *)v3 setClipsToBounds:1];
    [(CNAutocompleteSuggestionsCell *)v3 setupConstraints];
    v21 = v3;
  }
  return v3;
}

- (BOOL)useAccessibleLayout
{
  v2 = [(CNAutocompleteSuggestionsCell *)self traitCollection];
  char v3 = isTraitCollectionAccessible(v2);

  return v3;
}

- (void)setupConstraints
{
  v63[7] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(CNAutocompleteSuggestionsCell *)self useAccessibleLayout];
  v61 = [(CNAutocompleteSuggestionsCell *)self avatarView];
  v4 = [v61 widthAnchor];
  v5 = [(CNAutocompleteSuggestionsCell *)self avatarView];
  double v6 = [v5 heightAnchor];
  uint64_t v7 = [v4 constraintEqualToAnchor:v6];
  double v8 = (void *)v7;
  if (v3)
  {
    v63[0] = v7;
    double v9 = [(CNAutocompleteSuggestionsCell *)self avatarView];
    v10 = [v9 topAnchor];
    v59 = [(CNAutocompleteSuggestionsCell *)self contentView];
    [v59 topAnchor];
    v58 = v60 = v10;
    v57 = objc_msgSend(v10, "constraintEqualToAnchor:constant:", 22.0);
    v63[1] = v57;
    v56 = [(CNAutocompleteSuggestionsCell *)self avatarView];
    v11 = [v56 bottomAnchor];
    v54 = [(CNAutocompleteSuggestionsCell *)self contentView];
    [v54 bottomAnchor];
    v53 = v55 = v11;
    v52 = objc_msgSend(v11, "constraintEqualToAnchor:constant:", -22.0);
    v63[2] = v52;
    v51 = [(CNAutocompleteSuggestionsCell *)self nameLabel];
    v12 = [v51 centerYAnchor];
    v49 = [(CNAutocompleteSuggestionsCell *)self avatarView];
    [v49 centerYAnchor];
    v48 = v50 = v12;
    v47 = objc_msgSend(v12, "constraintEqualToAnchor:");
    v63[3] = v47;
    v46 = [(CNAutocompleteSuggestionsCell *)self avatarView];
    v13 = [v46 leadingAnchor];
    v44 = [(CNAutocompleteSuggestionsCell *)self contentView];
    [v44 leadingAnchor];
    v43 = v45 = v13;
    v42 = objc_msgSend(v13, "constraintEqualToAnchor:");
    v63[4] = v42;
    v41 = [(CNAutocompleteSuggestionsCell *)self nameLabel];
    v14 = [v41 leadingAnchor];
    v39 = [(CNAutocompleteSuggestionsCell *)self avatarView];
    [v39 trailingAnchor];
    v38 = v40 = v14;
    v15 = objc_msgSend(v14, "constraintEqualToAnchor:constant:", 10.0);
    v63[5] = v15;
    BOOL v16 = [(CNAutocompleteSuggestionsCell *)self nameLabel];
    uint64_t v17 = [v16 trailingAnchor];
    v37 = [(CNAutocompleteSuggestionsCell *)self contentView];
    v36 = [v37 trailingAnchor];
    v18 = objc_msgSend(v17, "constraintEqualToAnchor:");
    v63[6] = v18;
    id v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v63 count:7];
  }
  else
  {
    v62[0] = v7;
    v32 = [(CNAutocompleteSuggestionsCell *)self avatarView];
    v20 = [v32 topAnchor];
    v59 = [(CNAutocompleteSuggestionsCell *)self contentView];
    [v59 topAnchor];
    v58 = v60 = v20;
    v57 = objc_msgSend(v20, "constraintEqualToAnchor:constant:", 0.0);
    v62[1] = v57;
    v56 = [(CNAutocompleteSuggestionsCell *)self nameLabel];
    v21 = [v56 topAnchor];
    v54 = [(CNAutocompleteSuggestionsCell *)self avatarView];
    [v54 bottomAnchor];
    v53 = v55 = v21;
    v52 = objc_msgSend(v21, "constraintEqualToAnchor:constant:", 10.0);
    v62[2] = v52;
    v51 = [(CNAutocompleteSuggestionsCell *)self avatarView];
    v22 = [v51 centerXAnchor];
    v49 = [(CNAutocompleteSuggestionsCell *)self contentView];
    [v49 centerXAnchor];
    v48 = v50 = v22;
    v47 = objc_msgSend(v22, "constraintEqualToAnchor:");
    v62[3] = v47;
    v46 = [(CNAutocompleteSuggestionsCell *)self nameLabel];
    objc_super v23 = [v46 leadingAnchor];
    v44 = [(CNAutocompleteSuggestionsCell *)self contentView];
    [v44 leadingAnchor];
    v43 = v45 = v23;
    v42 = objc_msgSend(v23, "constraintEqualToAnchor:constant:", 1.0);
    v62[4] = v42;
    v41 = [(CNAutocompleteSuggestionsCell *)self nameLabel];
    v24 = [v41 trailingAnchor];
    v39 = [(CNAutocompleteSuggestionsCell *)self contentView];
    [v39 trailingAnchor];
    v38 = v40 = v24;
    uint64_t v31 = objc_msgSend(v24, "constraintEqualToAnchor:constant:", -1.0);
    v62[5] = v31;
    BOOL v16 = [(CNAutocompleteSuggestionsCell *)self avatarView];
    uint64_t v17 = [v16 leadingAnchor];
    v37 = [(CNAutocompleteSuggestionsCell *)self contentView];
    v36 = [v37 leadingAnchor];
    v18 = objc_msgSend(v17, "constraintGreaterThanOrEqualToAnchor:constant:", 0.0);
    v62[6] = v18;
    [(CNAutocompleteSuggestionsCell *)self avatarView];
    v34 = v4;
    v25 = v35 = v5;
    [v25 trailingAnchor];
    v26 = v33 = v6;
    [(CNAutocompleteSuggestionsCell *)self contentView];
    v28 = v27 = v8;
    v29 = [v28 trailingAnchor];
    v30 = [v26 constraintLessThanOrEqualToAnchor:v29 constant:-0.0];
    v62[7] = v30;
    id v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v62 count:8];

    double v9 = v32;
    v15 = (void *)v31;

    double v8 = v27;
    double v6 = v33;

    v4 = v34;
    v5 = v35;
  }

  [MEMORY[0x1E4F28DC8] activateConstraints:v19];
}

- (void)setSelected:(BOOL)a3
{
  BOOL v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CNAutocompleteSuggestionsCell;
  -[CNAutocompleteSuggestionsCell setSelected:](&v8, sel_setSelected_);
  if (v3) {
    double v5 = 0.5;
  }
  else {
    double v5 = 1.0;
  }
  double v6 = [(CNAutocompleteSuggestionsCell *)self avatarView];
  [v6 setAlpha:v5];

  uint64_t v7 = [(CNAutocompleteSuggestionsCell *)self nameLabel];
  [v7 setAlpha:v5];
}

- (UIImage)image
{
  v2 = [(CNAutocompleteSuggestionsCell *)self avatarView];
  BOOL v3 = [v2 image];

  return (UIImage *)v3;
}

- (void)setImage:(id)a3
{
  id v4 = a3;
  id v5 = [(CNAutocompleteSuggestionsCell *)self avatarView];
  [v5 setImage:v4];
}

- (NSString)displayString
{
  return [(UILabel *)self->_nameLabel text];
}

- (void)setDisplayString:(id)a3
{
}

- (UIImageView)avatarView
{
  return self->_avatarView;
}

- (void)setAvatarView:(id)a3
{
}

- (UILabel)nameLabel
{
  return self->_nameLabel;
}

- (void)setNameLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nameLabel, 0);

  objc_storeStrong((id *)&self->_avatarView, 0);
}

@end