@interface CNSensitiveContentHelpButtonView
- (CNSensitiveContentAnalysisManager)sensitiveContentAnalysisManager;
- (CNSensitiveContentHelpButtonView)initWithManager:(id)a3;
- (CNSensitiveContentHelpButtonViewDelegate)delegate;
- (SCUIMoreHelpMenu)moreHelpMenu;
- (UIButton)button;
- (UIVisualEffectView)vibrancyView;
- (id)hidePhotoAction;
- (int64_t)menuOptions;
- (void)addHidePhotoActionIfNeeded;
- (void)configureButton;
- (void)configureConstraints;
- (void)configureVibrancyView;
- (void)didAskForMoreHelp:(id)a3;
- (void)didBlockContact:(id)a3;
- (void)hideContent;
- (void)presentMoreHelpMenu;
- (void)setButton:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setMoreHelpMenu:(id)a3;
- (void)setSensitiveContentAnalysisManager:(id)a3;
- (void)setVibrancyView:(id)a3;
@end

@implementation CNSensitiveContentHelpButtonView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_moreHelpMenu, 0);
  objc_storeStrong((id *)&self->_vibrancyView, 0);
  objc_storeStrong((id *)&self->_button, 0);
  objc_storeStrong((id *)&self->_sensitiveContentAnalysisManager, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setMoreHelpMenu:(id)a3
{
}

- (SCUIMoreHelpMenu)moreHelpMenu
{
  return self->_moreHelpMenu;
}

- (void)setVibrancyView:(id)a3
{
}

- (UIVisualEffectView)vibrancyView
{
  return self->_vibrancyView;
}

- (void)setButton:(id)a3
{
}

- (UIButton)button
{
  return self->_button;
}

- (void)setSensitiveContentAnalysisManager:(id)a3
{
}

- (CNSensitiveContentAnalysisManager)sensitiveContentAnalysisManager
{
  return self->_sensitiveContentAnalysisManager;
}

- (void)setDelegate:(id)a3
{
}

- (CNSensitiveContentHelpButtonViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CNSensitiveContentHelpButtonViewDelegate *)WeakRetained;
}

- (void)didAskForMoreHelp:(id)a3
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F9A6A0]);
  v4 = [(CNSensitiveContentHelpButtonView *)self delegate];
  [v4 sensitiveContentHelpButtonView:self didRequestToPresentMoreHelp:v5];
}

- (void)didBlockContact:(id)a3
{
  id v4 = [(CNSensitiveContentHelpButtonView *)self delegate];
  [v4 sensitiveContentHelpButtonView:self didRequestToBlockContact:1];
}

- (void)addHidePhotoActionIfNeeded
{
  v16[1] = *MEMORY[0x1E4F143B8];
  v3 = [(CNSensitiveContentHelpButtonView *)self delegate];
  int v4 = [v3 canSensitiveContentHelpButtonViewHidePhoto:self];

  id v5 = [(CNSensitiveContentHelpButtonView *)self moreHelpMenu];
  v6 = v5;
  if (v4)
  {
    v7 = [v5 actions];
    v8 = [(CNSensitiveContentHelpButtonView *)self hidePhotoAction];
    char v9 = objc_msgSend(v7, "_cn_containsObject:", v8);

    if (v9) {
      return;
    }
    v6 = [(CNSensitiveContentHelpButtonView *)self moreHelpMenu];
    v10 = [(CNSensitiveContentHelpButtonView *)self hidePhotoAction];
    v16[0] = v10;
    v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
    v12 = [(CNSensitiveContentHelpButtonView *)self moreHelpMenu];
    v13 = [v12 actions];
    v14 = [v11 arrayByAddingObjectsFromArray:v13];
    [v6 _setActions:v14];
  }
  else
  {
    v10 = [(CNSensitiveContentHelpButtonView *)self moreHelpMenu];
    v11 = [v10 actions];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __62__CNSensitiveContentHelpButtonView_addHidePhotoActionIfNeeded__block_invoke;
    v15[3] = &unk_1E5498168;
    v15[4] = self;
    v12 = objc_msgSend(v11, "_cn_filter:", v15);
    [v6 _setActions:v12];
  }
}

BOOL __62__CNSensitiveContentHelpButtonView_addHidePhotoActionIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 hidePhotoAction];

  return v4 != v3;
}

- (void)presentMoreHelpMenu
{
  id v3 = objc_msgSend(MEMORY[0x1E4F9A690], "menuWithOptions:", -[CNSensitiveContentHelpButtonView menuOptions](self, "menuOptions"));
  [(CNSensitiveContentHelpButtonView *)self setMoreHelpMenu:v3];

  id v4 = [(CNSensitiveContentHelpButtonView *)self moreHelpMenu];
  [v4 setMenuDelegate:self];

  [(CNSensitiveContentHelpButtonView *)self addHidePhotoActionIfNeeded];
  id v5 = [(CNSensitiveContentHelpButtonView *)self delegate];
  [v5 sensitiveContentHelpButtonView:self didRequestToPresentMenu:self->_moreHelpMenu];
}

- (int64_t)menuOptions
{
  id v3 = [(CNSensitiveContentHelpButtonView *)self sensitiveContentAnalysisManager];
  int v4 = [v3 canShowBlockContactUI];

  if (!v4) {
    return 0;
  }
  id v5 = [(CNSensitiveContentHelpButtonView *)self delegate];
  unsigned int v6 = [v5 canSensitiveContentHelpButtonBlockContact:self];

  return v6;
}

- (void)hideContent
{
  id v3 = [(CNSensitiveContentHelpButtonView *)self delegate];
  [v3 sensitiveContentHelpButtonView:self didSetContentHidden:1];
}

- (id)hidePhotoAction
{
  id v3 = (void *)MEMORY[0x1E4FB1410];
  int v4 = CNContactsUIBundle();
  id v5 = [v4 localizedStringForKey:@"SENSITIVE_CONTENT_ACTION_HIDE_PHOTO_TITLE" value:&stru_1ED8AC728 table:@"Localized"];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __51__CNSensitiveContentHelpButtonView_hidePhotoAction__block_invoke;
  v8[3] = &unk_1E549B590;
  v8[4] = self;
  unsigned int v6 = [v3 actionWithTitle:v5 style:0 handler:v8];

  return v6;
}

uint64_t __51__CNSensitiveContentHelpButtonView_hidePhotoAction__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) hideContent];
}

- (void)configureConstraints
{
  v37[8] = *MEMORY[0x1E4F143B8];
  v23 = (void *)MEMORY[0x1E4F28DC8];
  v36 = [(CNSensitiveContentHelpButtonView *)self vibrancyView];
  v35 = [v36 topAnchor];
  v34 = [(CNSensitiveContentHelpButtonView *)self topAnchor];
  v33 = [v35 constraintEqualToAnchor:v34];
  v37[0] = v33;
  v32 = [(CNSensitiveContentHelpButtonView *)self vibrancyView];
  v31 = [v32 bottomAnchor];
  v30 = [(CNSensitiveContentHelpButtonView *)self bottomAnchor];
  v29 = [v31 constraintEqualToAnchor:v30];
  v37[1] = v29;
  v28 = [(CNSensitiveContentHelpButtonView *)self vibrancyView];
  v27 = [v28 leadingAnchor];
  v26 = [(CNSensitiveContentHelpButtonView *)self leadingAnchor];
  v25 = [v27 constraintEqualToAnchor:v26];
  v37[2] = v25;
  v24 = [(CNSensitiveContentHelpButtonView *)self vibrancyView];
  v22 = [v24 trailingAnchor];
  v21 = [(CNSensitiveContentHelpButtonView *)self trailingAnchor];
  v20 = [v22 constraintEqualToAnchor:v21];
  v37[3] = v20;
  v19 = [(CNSensitiveContentHelpButtonView *)self button];
  v18 = [v19 topAnchor];
  v17 = [(CNSensitiveContentHelpButtonView *)self topAnchor];
  v16 = [v18 constraintEqualToAnchor:v17];
  v37[4] = v16;
  v15 = [(CNSensitiveContentHelpButtonView *)self button];
  v14 = [v15 bottomAnchor];
  v13 = [(CNSensitiveContentHelpButtonView *)self bottomAnchor];
  id v3 = [v14 constraintEqualToAnchor:v13];
  v37[5] = v3;
  int v4 = [(CNSensitiveContentHelpButtonView *)self button];
  id v5 = [v4 leadingAnchor];
  unsigned int v6 = [(CNSensitiveContentHelpButtonView *)self leadingAnchor];
  v7 = [v5 constraintEqualToAnchor:v6];
  v37[6] = v7;
  v8 = [(CNSensitiveContentHelpButtonView *)self button];
  char v9 = [v8 trailingAnchor];
  v10 = [(CNSensitiveContentHelpButtonView *)self trailingAnchor];
  v11 = [v9 constraintEqualToAnchor:v10];
  v37[7] = v11;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:8];
  [v23 activateConstraints:v12];
}

- (void)configureVibrancyView
{
  id v7 = [MEMORY[0x1E4FB14C8] effectWithStyle:16];
  id v3 = (UIVisualEffectView *)[objc_alloc(MEMORY[0x1E4FB1F00]) initWithEffect:v7];
  [(UIVisualEffectView *)v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  int v4 = [(UIVisualEffectView *)v3 layer];
  [v4 setMasksToBounds:1];

  id v5 = [(UIVisualEffectView *)v3 layer];
  [v5 setCornerRadius:18.0];

  vibrancyView = self->_vibrancyView;
  self->_vibrancyView = v3;
}

- (void)configureButton
{
  id v9 = [MEMORY[0x1E4FB14D8] grayButtonConfiguration];
  [v9 setCornerStyle:4];
  id v3 = [MEMORY[0x1E4FB1618] whiteColor];
  [v9 setBaseForegroundColor:v3];

  [v9 setButtonSize:2];
  int v4 = CNContactsUIBundle();
  id v5 = [v4 localizedStringForKey:@"SENSITIVE_CONTENT_HELP_BUTTON_TITLE" value:&stru_1ED8AC728 table:@"Localized"];
  [v9 setTitle:v5];

  unsigned int v6 = [MEMORY[0x1E4FB1818] systemImageNamed:@"exclamationmark.triangle.fill"];
  [v9 setImage:v6];

  [v9 setImagePadding:2.0];
  objc_msgSend(v9, "setContentInsets:", 6.0, 10.0, 6.0, 10.0);
  id v7 = [MEMORY[0x1E4FB14D0] buttonWithConfiguration:v9 primaryAction:0];
  [(UIButton *)v7 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIButton *)v7 addTarget:self action:sel_didTapButton forControlEvents:64];
  button = self->_button;
  self->_button = v7;
}

- (CNSensitiveContentHelpButtonView)initWithManager:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CNSensitiveContentHelpButtonView;
  unsigned int v6 = -[CNSensitiveContentHelpButtonView initWithFrame:](&v11, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_sensitiveContentAnalysisManager, a3);
    [(CNSensitiveContentHelpButtonView *)v7 configureButton];
    [(CNSensitiveContentHelpButtonView *)v7 configureVibrancyView];
    v8 = [(UIVisualEffectView *)v7->_vibrancyView contentView];
    [v8 addSubview:v7->_button];

    [(CNSensitiveContentHelpButtonView *)v7 addSubview:v7->_vibrancyView];
    [(CNSensitiveContentHelpButtonView *)v7 configureConstraints];
    id v9 = v7;
  }

  return v7;
}

@end