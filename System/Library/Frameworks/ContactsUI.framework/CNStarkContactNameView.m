@interface CNStarkContactNameView
- (CNAvatarViewController)avatarViewController;
- (CNContact)contact;
- (CNStarkContactNameView)initWithName:(id)a3;
- (UILabel)nameLabel;
- (void)setupAvatar;
- (void)setupConstraints;
- (void)setupNameLabel;
@end

@implementation CNStarkContactNameView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avatarViewController, 0);
  objc_storeStrong((id *)&self->_nameLabel, 0);

  objc_storeStrong((id *)&self->_contact, 0);
}

- (CNAvatarViewController)avatarViewController
{
  return self->_avatarViewController;
}

- (UILabel)nameLabel
{
  return self->_nameLabel;
}

- (CNContact)contact
{
  return self->_contact;
}

- (void)setupConstraints
{
  v41[3] = *MEMORY[0x1E4F143B8];
  v36 = [(CNStarkContactNameView *)self nameLabel];
  v34 = [v36 centerYAnchor];
  v32 = [(CNStarkContactNameView *)self centerYAnchor];
  v30 = [v34 constraintEqualToAnchor:v32];
  v41[0] = v30;
  v28 = [(CNStarkContactNameView *)self nameLabel];
  v3 = [v28 rightAnchor];
  v4 = [(CNStarkContactNameView *)self avatarViewController];
  v5 = [v4 view];
  v6 = [v5 leftAnchor];
  v7 = [v3 constraintEqualToAnchor:v6 constant:-8.0];
  v41[1] = v7;
  v8 = [(CNStarkContactNameView *)self nameLabel];
  v9 = [v8 widthAnchor];
  v10 = [(CNStarkContactNameView *)self widthAnchor];
  v11 = [v9 constraintLessThanOrEqualToAnchor:v10 multiplier:1.0 constant:-38.0];
  v41[2] = v11;
  v38 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:3];

  v37 = [(CNStarkContactNameView *)self avatarViewController];
  v35 = [v37 view];
  v33 = [v35 centerYAnchor];
  v31 = [(CNStarkContactNameView *)self centerYAnchor];
  v29 = [v33 constraintEqualToAnchor:v31];
  v40[0] = v29;
  v27 = [(CNStarkContactNameView *)self avatarViewController];
  v26 = [v27 view];
  v25 = [v26 rightAnchor];
  v24 = [(CNStarkContactNameView *)self rightAnchor];
  v12 = [v25 constraintEqualToAnchor:v24];
  v40[1] = v12;
  v13 = [(CNStarkContactNameView *)self avatarViewController];
  v14 = [v13 view];
  v15 = [v14 widthAnchor];
  v16 = [v15 constraintEqualToConstant:30.0];
  v40[2] = v16;
  v17 = [(CNStarkContactNameView *)self avatarViewController];
  v18 = [v17 view];
  v19 = [v18 heightAnchor];
  v20 = [v19 constraintEqualToConstant:30.0];
  v40[3] = v20;
  v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:4];

  v39[0] = v38;
  v39[1] = v23;
  v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:2];
  v22 = objc_msgSend(v21, "_cn_flatten");
  [(CNStarkContactNameView *)self addConstraints:v22];
}

- (void)setupAvatar
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v3 = [(CNStarkContactNameView *)self avatarViewController];
  v4 = [v3 view];
  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];

  v5 = [(CNStarkContactNameView *)self contact];
  v10[0] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  v7 = [(CNStarkContactNameView *)self avatarViewController];
  [v7 setContacts:v6];

  v8 = [(CNStarkContactNameView *)self avatarViewController];
  v9 = [v8 view];
  [(CNStarkContactNameView *)self addSubview:v9];
}

- (void)setupNameLabel
{
  v3 = [(CNStarkContactNameView *)self nameLabel];
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];

  v4 = +[CNUIFontRepository carPlayNavigationBarContactNameFont];
  v5 = [(CNStarkContactNameView *)self nameLabel];
  [v5 setFont:v4];

  v6 = +[CNUIColorRepository carPlayNavigationBarContactNameTextColor];
  v7 = [(CNStarkContactNameView *)self nameLabel];
  [v7 setTextColor:v6];

  v8 = [MEMORY[0x1E4FB1618] clearColor];
  v9 = [(CNStarkContactNameView *)self nameLabel];
  [v9 setBackgroundColor:v8];

  v10 = [(CNStarkContactNameView *)self nameLabel];
  [v10 setTextAlignment:2];

  v11 = [(CNStarkContactNameView *)self nameLabel];
  [v11 setLineBreakMode:4];

  v12 = (void *)MEMORY[0x1E4F1B910];
  v13 = [(CNStarkContactNameView *)self contact];
  v14 = [v12 stringFromContact:v13 style:0];
  v15 = [(CNStarkContactNameView *)self nameLabel];
  [v15 setText:v14];

  id v16 = [(CNStarkContactNameView *)self nameLabel];
  [(CNStarkContactNameView *)self addSubview:v16];
}

- (CNStarkContactNameView)initWithName:(id)a3
{
  id v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)CNStarkContactNameView;
  double v6 = *MEMORY[0x1E4F1DB28];
  double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  v10 = -[CNStarkContactNameView initWithFrame:](&v19, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], v7, v8, v9);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_contact, a3);
    uint64_t v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", v6, v7, v8, v9);
    nameLabel = v11->_nameLabel;
    v11->_nameLabel = (UILabel *)v12;

    v14 = [CNAvatarViewController alloc];
    v15 = +[CNAvatarViewControllerSettings defaultSettings];
    uint64_t v16 = [(CNAvatarViewController *)v14 initWithSettings:v15];
    avatarViewController = v11->_avatarViewController;
    v11->_avatarViewController = (CNAvatarViewController *)v16;

    [(CNStarkContactNameView *)v11 setupNameLabel];
    [(CNStarkContactNameView *)v11 setupAvatar];
    [(CNStarkContactNameView *)v11 setupConstraints];
  }

  return v11;
}

@end