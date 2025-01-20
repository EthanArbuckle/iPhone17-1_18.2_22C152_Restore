@interface CNMeCardSharedProfileCellContentView
+ (id)log;
- (CNAvatarView)avatarView;
- (CNContact)meContact;
- (CNMeCardSharedProfileCellContentView)init;
- (NSArray)constraints;
- (UILabel)titleLabel;
- (UILabel)valueLabel;
- (UIStackView)labelStackView;
- (id)displayStringForSharingAudience;
- (void)setAvatarHidden:(BOOL)a3;
- (void)setAvatarView:(id)a3;
- (void)setConstraints:(id)a3;
- (void)setLabelStackView:(id)a3;
- (void)setLabelTextAttributes:(id)a3;
- (void)setMeContact:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setUpAvatarView;
- (void)setUpLabels;
- (void)setValueLabel:(id)a3;
- (void)setupConstraints;
- (void)setupViews;
- (void)updateAvatarViewContact;
- (void)updateConstraints;
- (void)updateView;
@end

@implementation CNMeCardSharedProfileCellContentView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_valueLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_labelStackView, 0);
  objc_storeStrong((id *)&self->_avatarView, 0);

  objc_storeStrong((id *)&self->_meContact, 0);
}

- (void)setConstraints:(id)a3
{
}

- (NSArray)constraints
{
  return self->_constraints;
}

- (void)setValueLabel:(id)a3
{
}

- (UILabel)valueLabel
{
  return self->_valueLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setLabelStackView:(id)a3
{
}

- (UIStackView)labelStackView
{
  return self->_labelStackView;
}

- (void)setAvatarView:(id)a3
{
}

- (CNAvatarView)avatarView
{
  return self->_avatarView;
}

- (CNContact)meContact
{
  return self->_meContact;
}

- (void)setLabelTextAttributes:(id)a3
{
  id v10 = [a3 objectForKeyedSubscript:*MEMORY[0x1E4FB06F8]];
  if (v10)
  {
    v4 = [(CNMeCardSharedProfileCellContentView *)self titleLabel];
    id v5 = [v4 font];

    if (v5 != v10)
    {
      v6 = [(CNMeCardSharedProfileCellContentView *)self titleLabel];
      [v6 setFont:v10];
    }
    v7 = [(CNMeCardSharedProfileCellContentView *)self valueLabel];
    id v8 = [v7 font];

    if (v8 != v10)
    {
      v9 = [(CNMeCardSharedProfileCellContentView *)self valueLabel];
      [v9 setFont:v10];
    }
  }
}

- (void)updateView
{
  v3 = [(CNMeCardSharedProfileCellContentView *)self displayStringForSharingAudience];
  v4 = [(CNMeCardSharedProfileCellContentView *)self valueLabel];
  [v4 setText:v3];

  [(CNMeCardSharedProfileCellContentView *)self updateAvatarViewContact];
}

- (void)setupConstraints
{
  if (((*(uint64_t (**)(void))(*MEMORY[0x1E4F5A258] + 16))() & 1) == 0) {
    [MEMORY[0x1E4F28DC8] deactivateConstraints:self->_constraints];
  }
  v3 = (NSArray *)objc_opt_new();
  v4 = [(CNMeCardSharedProfileCellContentView *)self labelStackView];
  id v5 = [v4 centerYAnchor];
  v6 = [(CNMeCardSharedProfileCellContentView *)self centerYAnchor];
  v7 = [v5 constraintEqualToAnchor:v6];
  [(NSArray *)v3 addObject:v7];

  id v8 = [(CNMeCardSharedProfileCellContentView *)self labelStackView];
  v9 = [v8 topAnchor];
  id v10 = [(CNMeCardSharedProfileCellContentView *)self topAnchor];
  v11 = [v9 constraintGreaterThanOrEqualToAnchor:v10];
  [(NSArray *)v3 addObject:v11];

  v12 = [(CNMeCardSharedProfileCellContentView *)self labelStackView];
  v13 = [v12 bottomAnchor];
  v14 = [(CNMeCardSharedProfileCellContentView *)self bottomAnchor];
  v15 = [v13 constraintLessThanOrEqualToAnchor:v14];
  [(NSArray *)v3 addObject:v15];

  v16 = [(CNMeCardSharedProfileCellContentView *)self labelStackView];
  v17 = [v16 trailingAnchor];
  v18 = [(CNMeCardSharedProfileCellContentView *)self trailingAnchor];
  v19 = [v17 constraintEqualToAnchor:v18];
  [(NSArray *)v3 addObject:v19];

  if (objc_msgSend(MEMORY[0x1E4FB08E0], "ab_preferredContentSizeCategoryIsAccessibilityCategory"))
  {
    v20 = [(CNMeCardSharedProfileCellContentView *)self labelStackView];
    v21 = [v20 leadingAnchor];
    v22 = [(CNMeCardSharedProfileCellContentView *)self leadingAnchor];
    v23 = [v21 constraintEqualToAnchor:v22];
    [(NSArray *)v3 addObject:v23];
  }
  else
  {
    v24 = [(CNMeCardSharedProfileCellContentView *)self avatarView];
    v25 = [v24 centerYAnchor];
    v26 = [(CNMeCardSharedProfileCellContentView *)self centerYAnchor];
    v27 = [v25 constraintEqualToAnchor:v26];
    [(NSArray *)v3 addObject:v27];

    v28 = [(CNMeCardSharedProfileCellContentView *)self avatarView];
    v29 = [v28 leadingAnchor];
    v30 = [(CNMeCardSharedProfileCellContentView *)self leadingAnchor];
    v31 = [v29 constraintEqualToAnchor:v30];
    [(NSArray *)v3 addObject:v31];

    v32 = [(CNMeCardSharedProfileCellContentView *)self avatarView];
    v33 = [v32 heightAnchor];
    v34 = [(CNMeCardSharedProfileCellContentView *)self avatarView];
    v35 = [v34 widthAnchor];
    v36 = [v33 constraintEqualToAnchor:v35];
    [(NSArray *)v3 addObject:v36];

    v37 = [(CNMeCardSharedProfileCellContentView *)self avatarView];
    v38 = [v37 heightAnchor];
    v39 = [v38 constraintEqualToConstant:40.0];
    [(NSArray *)v3 addObject:v39];

    v20 = [(CNMeCardSharedProfileCellContentView *)self labelStackView];
    v21 = [v20 leadingAnchor];
    v22 = [(CNMeCardSharedProfileCellContentView *)self avatarView];
    v23 = [v22 trailingAnchor];
    v40 = [v21 constraintEqualToSystemSpacingAfterAnchor:v23 multiplier:1.0];
    [(NSArray *)v3 addObject:v40];
  }
  constraints = self->_constraints;
  self->_constraints = v3;
  v42 = v3;

  [MEMORY[0x1E4F28DC8] activateConstraints:v42];
}

- (void)updateConstraints
{
  v3.receiver = self;
  v3.super_class = (Class)CNMeCardSharedProfileCellContentView;
  [(CNMeCardSharedProfileCellContentView *)&v3 updateConstraints];
  -[CNMeCardSharedProfileCellContentView setAvatarHidden:](self, "setAvatarHidden:", objc_msgSend(MEMORY[0x1E4FB08E0], "ab_preferredContentSizeCategoryIsAccessibilityCategory"));
}

- (void)setAvatarHidden:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(CNMeCardSharedProfileCellContentView *)self avatarView];
  int v6 = [v5 isHidden];

  if (v6 != v3)
  {
    v7 = [(CNMeCardSharedProfileCellContentView *)self avatarView];
    [v7 setHidden:v3];

    [(CNMeCardSharedProfileCellContentView *)self setupConstraints];
  }
}

- (void)setMeContact:(id)a3
{
  id v5 = (CNContact *)a3;
  if (self->_meContact != v5)
  {
    int v6 = v5;
    objc_storeStrong((id *)&self->_meContact, a3);
    [(CNMeCardSharedProfileCellContentView *)self updateView];
    id v5 = v6;
  }
}

- (void)updateAvatarViewContact
{
  BOOL v3 = [MEMORY[0x1E4F5A3D8] currentEnvironment];
  v4 = [v3 nicknameProvider];
  char v5 = [v4 isNicknameSharingEnabled];

  if (v5)
  {
    objc_initWeak(location, self);
    int v6 = [MEMORY[0x1E4F5A3D8] currentEnvironment];
    v7 = [v6 nicknameProvider];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __63__CNMeCardSharedProfileCellContentView_updateAvatarViewContact__block_invoke;
    v12[3] = &unk_1E5498450;
    objc_copyWeak(&v13, location);
    [v7 fetchPersonalNicknameAsContactWithCompletion:v12];

    objc_destroyWeak(&v13);
    objc_destroyWeak(location);
  }
  else
  {
    id v8 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      LOWORD(location[0]) = 0;
      _os_log_impl(&dword_18B625000, v8, OS_LOG_TYPE_INFO, "Sharing is disabled, using Me contact for shared profile row", (uint8_t *)location, 2u);
    }

    v9 = [(CNMeCardSharedProfileCellContentView *)self meContact];

    if (v9)
    {
      id v10 = [(CNMeCardSharedProfileCellContentView *)self avatarView];
      v11 = [(CNMeCardSharedProfileCellContentView *)self meContact];
      [v10 setContact:v11];
    }
  }
}

void __63__CNMeCardSharedProfileCellContentView_updateAvatarViewContact__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (v3)
  {
    id v5 = v3;
LABEL_7:
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __63__CNMeCardSharedProfileCellContentView_updateAvatarViewContact__block_invoke_20;
    v9[3] = &unk_1E549BF80;
    v9[4] = WeakRetained;
    id v10 = v5;
    id v8 = v5;
    dispatch_async(MEMORY[0x1E4F14428], v9);

    goto LABEL_8;
  }
  int v6 = [(id)objc_opt_class() log];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18B625000, v6, OS_LOG_TYPE_INFO, "No personal nickname contact found, using Me contact for shared profile row", buf, 2u);
  }

  v7 = [WeakRetained meContact];

  if (v7)
  {
    id v5 = [WeakRetained meContact];
    goto LABEL_7;
  }
LABEL_8:
}

void __63__CNMeCardSharedProfileCellContentView_updateAvatarViewContact__block_invoke_20(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) avatarView];
  [v2 setContact:*(void *)(a1 + 40)];
}

- (id)displayStringForSharingAudience
{
  id v2 = [MEMORY[0x1E4F5A3D8] currentEnvironment];
  id v3 = [v2 nicknameProvider];
  char v4 = [v3 isNicknameSharingEnabled];

  if (v4)
  {
    objc_opt_class();
    id v5 = [MEMORY[0x1E4F5A3D8] currentEnvironment];
    int v6 = [v5 nicknameProvider];
    if (objc_opt_isKindOfClass()) {
      v7 = v6;
    }
    else {
      v7 = 0;
    }
    id v8 = v7;

    uint64_t v9 = [v8 sharingAudienceDisplayString];
  }
  else
  {
    CNContactsUIBundle();
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = [v8 localizedStringForKey:@"SNAP_DISPLAY_PREFERENCE_DISABLED" value:&stru_1ED8AC728 table:@"Localized"];
  }
  id v10 = (void *)v9;

  return v10;
}

- (void)setUpLabels
{
  v17[2] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4FB1930]);
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  uint64_t v4 = *MEMORY[0x1E4FB28C8];
  id v5 = objc_msgSend(MEMORY[0x1E4FB08E0], "ab_preferredFontForTextStyle:", *MEMORY[0x1E4FB28C8]);
  [v3 setFont:v5];

  [v3 setNumberOfLines:0];
  int v6 = CNContactsUIBundle();
  v7 = [v6 localizedStringForKey:@"SNAP_DISPLAY_PREFERENCE_CONTACT_CARD_TITLE" value:&stru_1ED8AC728 table:@"Localized"];
  [v3 setText:v7];

  [(CNMeCardSharedProfileCellContentView *)self addSubview:v3];
  [(CNMeCardSharedProfileCellContentView *)self setTitleLabel:v3];
  id v8 = objc_alloc_init(MEMORY[0x1E4FB1930]);
  [v8 setTranslatesAutoresizingMaskIntoConstraints:0];
  uint64_t v9 = objc_msgSend(MEMORY[0x1E4FB08E0], "ab_preferredFontForTextStyle:", v4);
  [v8 setFont:v9];

  [v8 setNumberOfLines:0];
  id v10 = [(CNMeCardSharedProfileCellContentView *)self displayStringForSharingAudience];
  [v8 setText:v10];

  v11 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  [v8 setTextColor:v11];

  [(CNMeCardSharedProfileCellContentView *)self addSubview:v8];
  [(CNMeCardSharedProfileCellContentView *)self setValueLabel:v8];
  id v12 = objc_alloc(MEMORY[0x1E4FB1C60]);
  id v13 = [(CNMeCardSharedProfileCellContentView *)self titleLabel];
  v17[0] = v13;
  v14 = [(CNMeCardSharedProfileCellContentView *)self valueLabel];
  v17[1] = v14;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
  v16 = (void *)[v12 initWithArrangedSubviews:v15];

  [v16 setAxis:1];
  [v16 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(CNMeCardSharedProfileCellContentView *)self addSubview:v16];
  [(CNMeCardSharedProfileCellContentView *)self setLabelStackView:v16];
}

- (void)setUpAvatarView
{
  id v3 = objc_alloc_init(CNAvatarView);
  [(CNAvatarView *)v3 setShouldFetchSharedMeContactPhoto:1];
  [(CNAvatarView *)v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(CNMeCardSharedProfileCellContentView *)self addSubview:v3];
  [(CNMeCardSharedProfileCellContentView *)self setAvatarView:v3];
}

- (void)setupViews
{
  [(CNMeCardSharedProfileCellContentView *)self setUpAvatarView];

  [(CNMeCardSharedProfileCellContentView *)self setUpLabels];
}

- (CNMeCardSharedProfileCellContentView)init
{
  v6.receiver = self;
  v6.super_class = (Class)CNMeCardSharedProfileCellContentView;
  id v2 = -[CNMeCardSharedProfileCellContentView initWithFrame:](&v6, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  id v3 = v2;
  if (v2)
  {
    [(CNMeCardSharedProfileCellContentView *)v2 setupViews];
    [(CNMeCardSharedProfileCellContentView *)v3 setupConstraints];
    uint64_t v4 = v3;
  }

  return v3;
}

+ (id)log
{
  if (log_cn_once_token_1_25469 != -1) {
    dispatch_once(&log_cn_once_token_1_25469, &__block_literal_global_25470);
  }
  id v2 = (void *)log_cn_once_object_1_25471;

  return v2;
}

void __43__CNMeCardSharedProfileCellContentView_log__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.contactsui", "CNMeCardSharedProfileCellContentView");
  v1 = (void *)log_cn_once_object_1_25471;
  log_cn_once_object_1_25471 = (uint64_t)v0;
}

@end