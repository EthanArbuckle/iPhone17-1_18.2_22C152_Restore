@interface CNMeCardSharingSettingsPreferenceMenuCell
+ (id)cellIdentifier;
- (CNMeCardSharingSettingsPreferenceMenuCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (CNMeCardSharingSettingsPreferenceMenuCellDelegate)delegate;
- (UIButton)menuButton;
- (UIButton)popupMenuButton;
- (id)alwaysAskMenuTitle;
- (id)contactsOnlyMenuTitle;
- (id)menu;
- (id)titleForSharingAudience:(unint64_t)a3;
- (void)configureAccessoryView;
- (void)layoutMenuButton;
- (void)layoutSubviews;
- (void)setDelegate:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setMenuButton:(id)a3;
- (void)setPopupMenuButton:(id)a3;
- (void)setSharingAudience:(unint64_t)a3;
- (void)updateContentConfigurationWithSecondaryText:(id)a3;
- (void)updateMenuButtonStatesWithSharingAudience:(unint64_t)a3;
@end

@implementation CNMeCardSharingSettingsPreferenceMenuCell

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_popupMenuButton, 0);
  objc_storeStrong((id *)&self->_menuButton, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setPopupMenuButton:(id)a3
{
}

- (UIButton)popupMenuButton
{
  return self->_popupMenuButton;
}

- (void)setMenuButton:(id)a3
{
}

- (UIButton)menuButton
{
  return self->_menuButton;
}

- (void)setDelegate:(id)a3
{
}

- (CNMeCardSharingSettingsPreferenceMenuCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CNMeCardSharingSettingsPreferenceMenuCellDelegate *)WeakRetained;
}

- (id)alwaysAskMenuTitle
{
  v2 = CNContactsUIBundle();
  v3 = [v2 localizedStringForKey:@"SHARING_AUDIENCE_ALWAYS_ASK" value:&stru_1ED8AC728 table:@"Localized"];

  return v3;
}

- (id)contactsOnlyMenuTitle
{
  v2 = CNContactsUIBundle();
  v3 = [v2 localizedStringForKey:@"SHARING_AUDIENCE_CONTACTS_ONLY" value:&stru_1ED8AC728 table:@"Localized"];

  return v3;
}

- (id)menu
{
  v21[2] = *MEMORY[0x1E4F143B8];
  objc_initWeak(&location, self);
  v3 = (void *)MEMORY[0x1E4FB13F0];
  v4 = [(CNMeCardSharingSettingsPreferenceMenuCell *)self contactsOnlyMenuTitle];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __49__CNMeCardSharingSettingsPreferenceMenuCell_menu__block_invoke;
  v18[3] = &unk_1E54998E0;
  objc_copyWeak(&v19, &location);
  v5 = [v3 actionWithTitle:v4 image:0 identifier:0 handler:v18];

  v6 = (void *)MEMORY[0x1E4FB13F0];
  v7 = [(CNMeCardSharingSettingsPreferenceMenuCell *)self alwaysAskMenuTitle];
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  v15 = __49__CNMeCardSharingSettingsPreferenceMenuCell_menu__block_invoke_2;
  v16 = &unk_1E54998E0;
  objc_copyWeak(&v17, &location);
  v8 = [v6 actionWithTitle:v7 image:0 identifier:0 handler:&v13];

  v9 = (void *)MEMORY[0x1E4FB1970];
  v21[0] = v5;
  v21[1] = v8;
  v10 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v21, 2, v13, v14, v15, v16);
  v11 = [v9 menuWithChildren:v10];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

  return v11;
}

void __49__CNMeCardSharingSettingsPreferenceMenuCell_menu__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = CNContactsUIBundle();
  v2 = [v1 localizedStringForKey:@"SHARING_AUDIENCE_CONTACTS_ONLY" value:&stru_1ED8AC728 table:@"Localized"];
  [WeakRetained updateContentConfigurationWithSecondaryText:v2];

  v3 = [WeakRetained delegate];
  [v3 sharingSettingsPreferenceMenuCell:WeakRetained didSelectSharingAudience:1];
}

void __49__CNMeCardSharingSettingsPreferenceMenuCell_menu__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = CNContactsUIBundle();
  v2 = [v1 localizedStringForKey:@"SHARING_AUDIENCE_ALWAYS_ASK" value:&stru_1ED8AC728 table:@"Localized"];
  [WeakRetained updateContentConfigurationWithSecondaryText:v2];

  v3 = [WeakRetained delegate];
  [v3 sharingSettingsPreferenceMenuCell:WeakRetained didSelectSharingAudience:2];
}

- (void)updateMenuButtonStatesWithSharingAudience:(unint64_t)a3
{
  if (a3 == 2)
  {
    uint64_t v4 = [(CNMeCardSharingSettingsPreferenceMenuCell *)self alwaysAskMenuTitle];
  }
  else
  {
    if (a3 != 1)
    {
      v5 = 0;
      goto LABEL_7;
    }
    uint64_t v4 = [(CNMeCardSharingSettingsPreferenceMenuCell *)self contactsOnlyMenuTitle];
  }
  v5 = (void *)v4;
LABEL_7:
  v6 = [(CNMeCardSharingSettingsPreferenceMenuCell *)self menuButton];
  v7 = [v6 menu];
  v8 = [v7 children];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __87__CNMeCardSharingSettingsPreferenceMenuCell_updateMenuButtonStatesWithSharingAudience___block_invoke;
  v10[3] = &unk_1E54998B8;
  id v11 = v5;
  id v9 = v5;
  objc_msgSend(v8, "_cn_each:", v10);
}

void __87__CNMeCardSharingSettingsPreferenceMenuCell_updateMenuButtonStatesWithSharingAudience___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  id v7 = v3;
  if (objc_opt_isKindOfClass()) {
    uint64_t v4 = v7;
  }
  else {
    uint64_t v4 = 0;
  }
  id v5 = v4;

  if (v5)
  {
    v6 = [v5 title];
    objc_msgSend(v5, "setState:", objc_msgSend(v6, "isEqualToString:", *(void *)(a1 + 32)));
  }
}

- (void)updateContentConfigurationWithSecondaryText:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x1E4FB1948];
  id v5 = a3;
  id v8 = [v4 valueCellConfiguration];
  v6 = CNContactsUIBundle();
  id v7 = [v6 localizedStringForKey:@"SHARING_AUDIENCE_SECTION_HEADER_SMALL_CAPS" value:&stru_1ED8AC728 table:@"Localized"];
  [v8 setText:v7];

  [v8 setSecondaryText:v5];
  [(CNMeCardSharingSettingsPreferenceMenuCell *)self setContentConfiguration:v8];
}

- (id)titleForSharingAudience:(unint64_t)a3
{
  if (a3 == 2)
  {
    id v3 = CNContactsUIBundle();
    uint64_t v4 = v3;
    id v5 = @"SHARING_AUDIENCE_ALWAYS_ASK";
    goto LABEL_5;
  }
  if (a3 == 1)
  {
    id v3 = CNContactsUIBundle();
    uint64_t v4 = v3;
    id v5 = @"SHARING_AUDIENCE_CONTACTS_ONLY";
LABEL_5:
    v6 = [v3 localizedStringForKey:v5 value:&stru_1ED8AC728 table:@"Localized"];

    goto LABEL_7;
  }
  v6 = &stru_1ED8AC728;
LABEL_7:

  return v6;
}

- (void)layoutMenuButton
{
  id v3 = [(CNMeCardSharingSettingsPreferenceMenuCell *)self contentView];
  [v3 frame];
  double v5 = v4;
  double v7 = v6;

  [(CNMeCardSharingSettingsPreferenceMenuCell *)self bounds];
  double v9 = v8;
  double v10 = 0.0;
  if (![(CNMeCardSharingSettingsPreferenceMenuCell *)self effectiveUserInterfaceLayoutDirection])
  {
    [(CNMeCardSharingSettingsPreferenceMenuCell *)self bounds];
    double v10 = v11 * 0.5;
  }
  v12 = [(CNMeCardSharingSettingsPreferenceMenuCell *)self menuButton];
  objc_msgSend(v12, "setFrame:", v10, v5, v9 * 0.5, v7);

  uint64_t v13 = [(CNMeCardSharingSettingsPreferenceMenuCell *)self popupMenuButton];
  [v13 frame];
  double v15 = v14;
  double v17 = v16;

  v18 = [(CNMeCardSharingSettingsPreferenceMenuCell *)self menuButton];
  objc_msgSend(v18, "setAnchorPoint:", v15, v17);

  id v19 = [(CNMeCardSharingSettingsPreferenceMenuCell *)self menuButton];
  [(CNMeCardSharingSettingsPreferenceMenuCell *)self bringSubviewToFront:v19];
}

- (void)configureAccessoryView
{
  id v7 = objc_alloc_init(MEMORY[0x1E4FB14D0]);
  id v3 = [MEMORY[0x1E4FB14D8] plainButtonConfiguration];
  objc_msgSend(v3, "setContentInsets:", *MEMORY[0x1E4FB12A8], *(double *)(MEMORY[0x1E4FB12A8] + 8), *(double *)(MEMORY[0x1E4FB12A8] + 16), *(double *)(MEMORY[0x1E4FB12A8] + 24));
  [v3 setIndicator:2];
  [v3 setIndicatorColorTransformer:&__block_literal_global_41324];
  double v4 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  [v3 setBaseForegroundColor:v4];

  [v7 setConfiguration:v3];
  [v7 sizeToFit];
  [v7 setEnabled:0];
  [(CNMeCardSharingSettingsPreferenceMenuCell *)self setPopupMenuButton:v7];
  [(CNMeCardSharingSettingsPreferenceMenuCell *)self setAccessoryView:v7];
  id v5 = objc_alloc_init(MEMORY[0x1E4FB14D0]);
  [v5 setShowsMenuAsPrimaryAction:1];
  double v6 = [(CNMeCardSharingSettingsPreferenceMenuCell *)self menu];
  [v5 setMenu:v6];

  [(CNMeCardSharingSettingsPreferenceMenuCell *)self addSubview:v5];
  [(CNMeCardSharingSettingsPreferenceMenuCell *)self setMenuButton:v5];
  [(CNMeCardSharingSettingsPreferenceMenuCell *)self layoutMenuButton];
}

id __67__CNMeCardSharingSettingsPreferenceMenuCell_configureAccessoryView__block_invoke()
{
  v0 = [MEMORY[0x1E4FB1618] tertiaryLabelColor];
  v1 = [v0 colorWithAlphaComponent:0.35];

  return v1;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)CNMeCardSharingSettingsPreferenceMenuCell;
  [(CNMeCardSharingSettingsPreferenceMenuCell *)&v4 layoutSubviews];
  id v3 = [(CNMeCardSharingSettingsPreferenceMenuCell *)self menuButton];

  if (v3) {
    [(CNMeCardSharingSettingsPreferenceMenuCell *)self layoutMenuButton];
  }
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  -[CNMeCardSharingSettingsPreferenceMenuCell setUserInteractionEnabled:](self, "setUserInteractionEnabled:");
  id v5 = [(CNMeCardSharingSettingsPreferenceMenuCell *)self menuButton];
  [v5 setEnabled:v3];
}

- (void)setSharingAudience:(unint64_t)a3
{
  id v5 = -[CNMeCardSharingSettingsPreferenceMenuCell titleForSharingAudience:](self, "titleForSharingAudience:");
  [(CNMeCardSharingSettingsPreferenceMenuCell *)self updateContentConfigurationWithSecondaryText:v5];

  [(CNMeCardSharingSettingsPreferenceMenuCell *)self updateMenuButtonStatesWithSharingAudience:a3];
}

- (CNMeCardSharingSettingsPreferenceMenuCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)CNMeCardSharingSettingsPreferenceMenuCell;
  objc_super v4 = [(CNMeCardSharingSettingsPreferenceMenuCell *)&v8 initWithStyle:a3 reuseIdentifier:a4];
  id v5 = v4;
  if (v4)
  {
    [(CNMeCardSharingSettingsPreferenceMenuCell *)v4 configureAccessoryView];
    double v6 = v5;
  }

  return v5;
}

+ (id)cellIdentifier
{
  return @"CNMeCardSharingSettingsPreferenceMenuTableViewCell";
}

@end