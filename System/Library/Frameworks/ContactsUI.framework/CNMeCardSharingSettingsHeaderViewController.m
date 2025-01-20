@interface CNMeCardSharingSettingsHeaderViewController
+ (double)avatarEdgeLengthForTraitCollection:(id)a3;
- (CGRect)avatarViewControllerFrame;
- (CGRect)toggleAnimationButtonFrame;
- (CNMeCardSharingAvatarProvider)avatarProvider;
- (CNMeCardSharingAvatarViewController)avatarViewController;
- (CNMeCardSharingSettingsHeaderViewController)initWithAvatarProvider:(id)a3;
- (CNMeCardSharingSettingsHeaderViewController)initWithAvatarProvider:(id)a3 mode:(int64_t)a4;
- (CNMeCardSharingSettingsHeaderViewControllerDelegate)delegate;
- (UIButton)labelButton;
- (UIButton)toggleAnimationButton;
- (UIView)separatorView;
- (double)availableAvatarSpace;
- (double)desiredHeightForTraitCollection:(id)a3;
- (double)maxAvatarHeight;
- (double)maxHeight;
- (double)minAvatarHeight;
- (double)minBottomPadding;
- (double)minHeight;
- (double)separatorHeight;
- (id)toggleAnimationButtonImageName;
- (int64_t)mode;
- (void)avatarViewControllerDidUpdateImage:(id)a3 needsLayout:(BOOL)a4;
- (void)avatarViewControllerWasTapped:(id)a3;
- (void)labelButtonTapped:(id)a3;
- (void)reload;
- (void)setAvatarProvider:(id)a3;
- (void)setAvatarViewController:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setLabelButton:(id)a3;
- (void)setMode:(int64_t)a3;
- (void)setSeparatorView:(id)a3;
- (void)setToggleAnimationButton:(id)a3;
- (void)updateButtonLabel;
- (void)updateLabelButtonFrame;
- (void)updateWithAvatarProvider:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation CNMeCardSharingSettingsHeaderViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_separatorView, 0);
  objc_storeStrong((id *)&self->_labelButton, 0);
  objc_storeStrong((id *)&self->_toggleAnimationButton, 0);
  objc_storeStrong((id *)&self->_avatarViewController, 0);
  objc_storeStrong((id *)&self->_avatarProvider, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setSeparatorView:(id)a3
{
}

- (UIView)separatorView
{
  return self->_separatorView;
}

- (void)setLabelButton:(id)a3
{
}

- (UIButton)labelButton
{
  return self->_labelButton;
}

- (void)setToggleAnimationButton:(id)a3
{
}

- (UIButton)toggleAnimationButton
{
  return self->_toggleAnimationButton;
}

- (void)setAvatarViewController:(id)a3
{
}

- (CNMeCardSharingAvatarViewController)avatarViewController
{
  return self->_avatarViewController;
}

- (void)setMode:(int64_t)a3
{
  self->_mode = a3;
}

- (int64_t)mode
{
  return self->_mode;
}

- (void)setAvatarProvider:(id)a3
{
}

- (CNMeCardSharingAvatarProvider)avatarProvider
{
  return self->_avatarProvider;
}

- (void)setDelegate:(id)a3
{
}

- (CNMeCardSharingSettingsHeaderViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CNMeCardSharingSettingsHeaderViewControllerDelegate *)WeakRetained;
}

- (void)avatarViewControllerWasTapped:(id)a3
{
  id v4 = [(CNMeCardSharingSettingsHeaderViewController *)self delegate];
  [v4 sharingSettingsHeaderWasTapped:self];
}

- (void)avatarViewControllerDidUpdateImage:(id)a3 needsLayout:(BOOL)a4
{
  if (a4)
  {
    v5 = [(CNMeCardSharingSettingsHeaderViewController *)self view];
    [v5 setNeedsLayout];
  }

  [(CNMeCardSharingSettingsHeaderViewController *)self updateButtonLabel];
}

- (void)labelButtonTapped:(id)a3
{
  id v4 = [(CNMeCardSharingSettingsHeaderViewController *)self delegate];
  [v4 sharingSettingsHeaderWasTapped:self];
}

- (void)updateButtonLabel
{
  v3 = [(CNMeCardSharingSettingsHeaderViewController *)self avatarViewController];
  int v4 = [v3 showsPosterAnimation];

  BOOL v5 = [(CNMeCardSharingAvatarViewController *)self->_avatarViewController hasImage];
  if (v4)
  {
    if (v5
      || [(CNMeCardSharingAvatarViewController *)self->_avatarViewController isWaitingForPosterPreviews])
    {
      v6 = CNContactsUIBundle();
      v7 = v6;
      v8 = @"SNAP_SHARING_POSTER_EDIT";
    }
    else
    {
      v6 = CNContactsUIBundle();
      v7 = v6;
      v8 = @"SNAP_SHARING_POSTER_ADD";
    }
  }
  else if (v5 {
         || [(CNMeCardSharingAvatarViewController *)self->_avatarViewController isWaitingForPosterPreviews])
  }
  {
    v6 = CNContactsUIBundle();
    v7 = v6;
    v8 = @"SHARING_EDIT";
  }
  else
  {
    v6 = CNContactsUIBundle();
    v7 = v6;
    v8 = @"SHARING_ADD_PHOTO";
  }
  id v12 = [v6 localizedStringForKey:v8 value:&stru_1ED8AC728 table:@"Localized"];

  v9 = [(UIButton *)self->_labelButton titleLabel];
  v10 = [v9 text];
  char v11 = [v12 isEqualToString:v10];

  if ((v11 & 1) == 0)
  {
    [(UIButton *)self->_labelButton setTitle:v12 forState:0];
    [(CNMeCardSharingSettingsHeaderViewController *)self updateLabelButtonFrame];
  }
}

- (void)reload
{
}

- (void)updateWithAvatarProvider:(id)a3
{
}

- (double)minBottomPadding
{
  return 32.0;
}

- (double)maxHeight
{
  [(CNMeCardSharingSettingsHeaderViewController *)self maxAvatarHeight];
  double v4 = v3;
  BOOL v5 = [(CNMeCardSharingSettingsHeaderViewController *)self view];
  [v5 layoutIfNeeded];

  v6 = [(CNMeCardSharingSettingsHeaderViewController *)self view];
  [v6 bounds];
  CGFloat v7 = CGRectGetWidth(v15) + -40.0;

  -[UIButton sizeThatFits:](self->_labelButton, "sizeThatFits:", v7, 100.0);
  double v9 = v8;
  v10 = [(CNMeCardSharingSettingsHeaderViewController *)self view];
  [v10 safeAreaInsets];
  double v12 = v11;

  double v13 = 44.0;
  if (v12 >= 44.0) {
    double v13 = v12;
  }
  return v9 + v4 + v13 + 32.0;
}

- (double)minHeight
{
  [(CNMeCardSharingSettingsHeaderViewController *)self minAvatarHeight];
  double v4 = v3;
  BOOL v5 = [(CNMeCardSharingSettingsHeaderViewController *)self view];
  [v5 layoutIfNeeded];

  v6 = [(CNMeCardSharingSettingsHeaderViewController *)self view];
  [v6 bounds];
  CGFloat v7 = CGRectGetWidth(v15) + -40.0;

  -[UIButton sizeThatFits:](self->_labelButton, "sizeThatFits:", v7, 100.0);
  double v9 = v8;
  v10 = [(CNMeCardSharingSettingsHeaderViewController *)self view];
  [v10 safeAreaInsets];
  double v12 = v11;

  double v13 = 44.0;
  if (v12 >= 44.0) {
    double v13 = v12;
  }
  return v9 + v4 + v13 + 32.0;
}

- (double)maxAvatarHeight
{
  double v3 = [(CNMeCardSharingSettingsHeaderViewController *)self view];
  [v3 bounds];
  double v5 = v4 + -10.0;

  v6 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v7 = [v6 userInterfaceIdiom];

  if ((v7 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    if (v5 > 320.0) {
      return 320.0;
    }
  }
  else if (![(CNMeCardSharingSettingsHeaderViewController *)self mode])
  {
    double v8 = [(CNMeCardSharingSettingsHeaderViewController *)self view];
    [v8 bounds];
    double v5 = v9 + -40.0;
  }
  return v5;
}

- (double)minAvatarHeight
{
  double v3 = [(CNMeCardSharingSettingsHeaderViewController *)self avatarViewController];
  int v4 = [v3 showsPosterAnimation];

  if (!v4) {
    return 130.0;
  }
  double v5 = [(CNMeCardSharingSettingsHeaderViewController *)self delegate];
  [v5 viewHeight];
  double v7 = v6;

  return ceil(v7 / 3.0);
}

- (double)availableAvatarSpace
{
  double v3 = [(CNMeCardSharingSettingsHeaderViewController *)self view];
  [v3 frame];
  double v5 = v4;

  double result = 0.0;
  if (v5 > 0.0)
  {
    double v7 = [(CNMeCardSharingSettingsHeaderViewController *)self view];
    [v7 layoutIfNeeded];

    double v8 = [(CNMeCardSharingSettingsHeaderViewController *)self view];
    [v8 bounds];
    CGFloat v9 = CGRectGetWidth(v16) + -40.0;

    -[UIButton sizeThatFits:](self->_labelButton, "sizeThatFits:", v9, 100.0);
    double v11 = v10;
    double v12 = [(CNMeCardSharingSettingsHeaderViewController *)self view];
    [v12 safeAreaInsets];
    double v14 = v13;

    double v15 = 44.0;
    if (v14 >= 44.0) {
      double v15 = v14;
    }
    return v5 - v15 - v11 + -32.0;
  }
  return result;
}

- (double)desiredHeightForTraitCollection:(id)a3
{
  [(CNMeCardSharingSettingsHeaderViewController *)self avatarViewControllerFrame];
  double v5 = v4;
  double v6 = [(CNMeCardSharingSettingsHeaderViewController *)self view];
  [v6 layoutIfNeeded];

  double v7 = [(CNMeCardSharingSettingsHeaderViewController *)self view];
  [v7 bounds];
  CGFloat v8 = CGRectGetWidth(v16) + -40.0;

  -[UIButton sizeThatFits:](self->_labelButton, "sizeThatFits:", v8, 100.0);
  double v10 = v9;
  double v11 = [(CNMeCardSharingSettingsHeaderViewController *)self view];
  [v11 safeAreaInsets];
  double v13 = v12;

  double v14 = 44.0;
  if (v13 >= 44.0) {
    double v14 = v13;
  }
  return v10 + v5 + v14 + 32.0;
}

- (void)updateLabelButtonFrame
{
  if ([(CNMeCardSharingSettingsHeaderViewController *)self isViewLoaded]
    && self->_labelButton)
  {
    double v3 = [(CNMeCardSharingSettingsHeaderViewController *)self view];
    [v3 bounds];
    CGFloat v4 = CGRectGetWidth(v16) + -40.0;

    -[UIButton sizeThatFits:](self->_labelButton, "sizeThatFits:", v4, 100.0);
    double v6 = v5;
    double v8 = v7;
    double v9 = [(CNMeCardSharingSettingsHeaderViewController *)self avatarViewController];
    [v9 showsPosterAnimation];

    double v10 = v6 + 40.0;
    double v11 = [(CNMeCardSharingSettingsHeaderViewController *)self view];
    [v11 bounds];
    CGFloat v12 = (CGRectGetWidth(v17) - v10) * 0.5;
    double v13 = [(CNMeCardSharingAvatarViewController *)self->_avatarViewController view];
    [v13 frame];
    -[UIButton setFrame:](self->_labelButton, "setFrame:", v12, CGRectGetMaxY(v18) + 16.0, v10, v8);

    labelButton = self->_labelButton;
    [(UIButton *)labelButton _setCornerRadius:v8 * 0.5];
  }
}

- (void)viewDidLayoutSubviews
{
  [(CNMeCardSharingSettingsHeaderViewController *)self avatarViewControllerFrame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v11 = [(CNMeCardSharingAvatarViewController *)self->_avatarViewController view];
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  [(CNMeCardSharingSettingsHeaderViewController *)self toggleAnimationButtonFrame];
  double v13 = v12;
  -[UIButton setFrame:](self->_toggleAnimationButton, "setFrame:");
  double v14 = [(UIButton *)self->_toggleAnimationButton layer];
  [v14 setCornerRadius:v13 * 0.5];

  uint64_t v15 = 1;
  [(UIButton *)self->_toggleAnimationButton setClipsToBounds:1];
  if ([(CNMeCardSharingAvatarViewController *)self->_avatarViewController showsPosterAnimation]) {
    uint64_t v15 = [(CNMeCardSharingAvatarViewController *)self->_avatarViewController isPosterAnimationPausable] ^ 1;
  }
  [(UIButton *)self->_toggleAnimationButton setHidden:v15];
  [(CNMeCardSharingSettingsHeaderViewController *)self updateLabelButtonFrame];
  [(CNMeCardSharingSettingsHeaderViewController *)self separatorHeight];
  double v17 = v16;
  CGRect v18 = [(CNMeCardSharingSettingsHeaderViewController *)self view];
  [v18 bounds];
  CGFloat v19 = CGRectGetMaxY(v22) - v17;
  v20 = [(CNMeCardSharingSettingsHeaderViewController *)self view];
  [v20 bounds];
  -[UIView setFrame:](self->_separatorView, "setFrame:", 0.0, v19, CGRectGetWidth(v23), v17);

  v21.receiver = self;
  v21.super_class = (Class)CNMeCardSharingSettingsHeaderViewController;
  [(CNMeCardSharingSettingsHeaderViewController *)&v21 viewDidLayoutSubviews];
}

- (id)toggleAnimationButtonImageName
{
  v2 = [(CNMeCardSharingSettingsHeaderViewController *)self avatarViewController];
  if ([v2 isPosterAnimationPaused]) {
    double v3 = @"play.circle.fill";
  }
  else {
    double v3 = @"pause.circle.fill";
  }
  double v4 = v3;

  return v4;
}

- (CGRect)toggleAnimationButtonFrame
{
  double v3 = [(CNMeCardSharingSettingsHeaderViewController *)self avatarViewController];
  int v4 = [v3 isPosterAnimationPausable];

  if (v4)
  {
    [(CNMeCardSharingSettingsHeaderViewController *)self avatarViewControllerFrame];
    double v7 = v5 + v6 + -44.0 + -7.0;
    double v8 = [(CNMeCardSharingSettingsHeaderViewController *)self view];
    [v8 bounds];
    double v10 = v9 + -44.0 + -25.0;

    double v11 = 44.0;
    double v12 = 44.0;
  }
  else
  {
    double v10 = *MEMORY[0x1E4F1DB28];
    double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v11 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v12 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }
  double v13 = v10;
  double v14 = v7;
  result.size.height = v12;
  result.size.width = v11;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (CGRect)avatarViewControllerFrame
{
  double v3 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v3 bounds];
  double v5 = v4;

  double v6 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v6 bounds];
  double v8 = v7;

  [(CNMeCardSharingSettingsHeaderViewController *)self availableAvatarSpace];
  double v10 = v9;
  [(CNMeCardSharingSettingsHeaderViewController *)self maxAvatarHeight];
  double v12 = v11;
  [(CNMeCardSharingSettingsHeaderViewController *)self minAvatarHeight];
  if (v12 >= v10) {
    double v14 = v10;
  }
  else {
    double v14 = v12;
  }
  if (v13 >= v14) {
    double v15 = v13;
  }
  else {
    double v15 = v14;
  }
  double v16 = [(CNMeCardSharingSettingsHeaderViewController *)self avatarViewController];
  double v17 = v15;
  if ([v16 showsPosterAnimation])
  {
    double v18 = v5 / v8;
    if (v5 / v8 < v8 / v5) {
      double v18 = v8 / v5;
    }
    double v17 = v15 / v18;
  }

  CGFloat v19 = [(CNMeCardSharingSettingsHeaderViewController *)self view];
  [v19 bounds];
  double v20 = floor((CGRectGetWidth(v28) - v17) * 0.5);

  objc_super v21 = [(CNMeCardSharingSettingsHeaderViewController *)self view];
  [v21 safeAreaInsets];
  double v23 = v22;

  if (v23 >= 44.0) {
    double v24 = v23;
  }
  else {
    double v24 = 44.0;
  }
  double v25 = v20;
  double v26 = v17;
  double v27 = v15;
  result.size.height = v27;
  result.size.width = v26;
  result.origin.y = v24;
  result.origin.x = v25;
  return result;
}

- (double)separatorHeight
{
  double v3 = [(CNMeCardSharingSettingsHeaderViewController *)self view];
  double v4 = [v3 window];
  if (v4)
  {
    double v5 = [(CNMeCardSharingSettingsHeaderViewController *)self view];
    double v6 = [v5 window];
    double v7 = [v6 screen];
    [v7 scale];
    double v9 = 1.0 / v8;
  }
  else
  {
    double v9 = 1.0;
  }

  return v9;
}

- (void)viewDidLoad
{
  v35.receiver = self;
  v35.super_class = (Class)CNMeCardSharingSettingsHeaderViewController;
  [(CNMeCardSharingSettingsHeaderViewController *)&v35 viewDidLoad];
  double v3 = [MEMORY[0x1E4FB1618] systemGroupedBackgroundColor];
  double v4 = [(CNMeCardSharingSettingsHeaderViewController *)self view];
  [v4 setBackgroundColor:v3];

  double v5 = [[CNMeCardSharingAvatarViewController alloc] initWithAvatarProvider:self->_avatarProvider mode:self->_mode];
  avatarViewController = self->_avatarViewController;
  self->_avatarViewController = v5;

  [(CNMeCardSharingAvatarViewController *)self->_avatarViewController setDelegate:self];
  double v7 = [(CNMeCardSharingSettingsHeaderViewController *)self view];
  double v8 = [(CNMeCardSharingAvatarViewController *)self->_avatarViewController view];
  [v7 addSubview:v8];

  [(CNMeCardSharingSettingsHeaderViewController *)self addChildViewController:self->_avatarViewController];
  [(CNMeCardSharingAvatarViewController *)self->_avatarViewController didMoveToParentViewController:self];
  double v9 = [MEMORY[0x1E4FB14D8] plainButtonConfiguration];
  [v9 setButtonSize:3];
  double v10 = (void *)MEMORY[0x1E4FB1830];
  double v11 = [MEMORY[0x1E4FB1618] tintColor];
  double v12 = [v10 configurationWithHierarchicalColor:v11];
  double v13 = [MEMORY[0x1E4FB1830] configurationWithTextStyle:*MEMORY[0x1E4FB2928]];
  double v14 = [v12 configurationByApplyingConfiguration:v13];
  [v9 setPreferredSymbolConfigurationForImage:v14];

  double v15 = (void *)MEMORY[0x1E4FB1818];
  double v16 = [(CNMeCardSharingSettingsHeaderViewController *)self toggleAnimationButtonImageName];
  double v17 = [v15 systemImageNamed:v16];
  [v9 setImage:v17];

  objc_initWeak(&location, self);
  double v18 = (void *)MEMORY[0x1E4FB13F0];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __58__CNMeCardSharingSettingsHeaderViewController_viewDidLoad__block_invoke;
  v32[3] = &unk_1E54998E0;
  objc_copyWeak(&v33, &location);
  CGFloat v19 = [v18 actionWithHandler:v32];
  double v20 = [MEMORY[0x1E4FB14D0] buttonWithConfiguration:v9 primaryAction:v19];
  toggleAnimationButton = self->_toggleAnimationButton;
  self->_toggleAnimationButton = v20;

  [(UIButton *)self->_toggleAnimationButton setMaximumContentSizeCategory:*MEMORY[0x1E4FB27B0]];
  double v22 = self->_toggleAnimationButton;
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __58__CNMeCardSharingSettingsHeaderViewController_viewDidLoad__block_invoke_2;
  v30[3] = &unk_1E5498A88;
  objc_copyWeak(&v31, &location);
  [(UIButton *)v22 setConfigurationUpdateHandler:v30];
  double v23 = [(CNMeCardSharingSettingsHeaderViewController *)self view];
  [v23 addSubview:self->_toggleAnimationButton];

  double v24 = [MEMORY[0x1E4FB14D8] filledButtonConfiguration];
  [v24 setButtonSize:1];
  [v24 setCornerStyle:4];
  objc_msgSend(v24, "setContentInsets:", 8.0, 10.0, 8.0, 10.0);
  double v25 = [MEMORY[0x1E4FB1618] labelColor];
  [v24 setBaseForegroundColor:v25];

  double v26 = [MEMORY[0x1E4FB1618] tertiarySystemFillColor];
  [v24 setBaseBackgroundColor:v26];

  [v24 setTitleTextAttributesTransformer:&__block_literal_global_28743];
  double v27 = [MEMORY[0x1E4FB14D0] buttonWithConfiguration:v24 primaryAction:0];
  labelButton = self->_labelButton;
  self->_labelButton = v27;

  [(CNMeCardSharingSettingsHeaderViewController *)self updateButtonLabel];
  [(UIButton *)self->_labelButton addTarget:self action:sel_labelButtonTapped_ forControlEvents:64];
  v29 = [(CNMeCardSharingSettingsHeaderViewController *)self view];
  [v29 addSubview:self->_labelButton];

  objc_destroyWeak(&v31);
  objc_destroyWeak(&v33);
  objc_destroyWeak(&location);
}

void __58__CNMeCardSharingSettingsHeaderViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  double v3 = [WeakRetained avatarViewController];
  [v3 togglePosterAnimation];

  id v5 = objc_loadWeakRetained(v1);
  double v4 = [v5 toggleAnimationButton];
  [v4 setNeedsUpdateConfiguration];
}

void __58__CNMeCardSharingSettingsHeaderViewController_viewDidLoad__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v8 = [v3 configuration];
  double v4 = (void *)MEMORY[0x1E4FB1818];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  double v6 = [WeakRetained toggleAnimationButtonImageName];
  double v7 = [v4 systemImageNamed:v6];
  [v8 setImage:v7];

  [v3 setConfiguration:v8];
}

id __58__CNMeCardSharingSettingsHeaderViewController_viewDidLoad__block_invoke_3(uint64_t a1, void *a2)
{
  v2 = (void *)[a2 mutableCopy];
  id v3 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2908]];
  [v2 setObject:v3 forKeyedSubscript:*MEMORY[0x1E4FB06F8]];

  return v2;
}

- (CNMeCardSharingSettingsHeaderViewController)initWithAvatarProvider:(id)a3 mode:(int64_t)a4
{
  id v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CNMeCardSharingSettingsHeaderViewController;
  id v8 = [(CNMeCardSharingSettingsHeaderViewController *)&v12 initWithNibName:0 bundle:0];
  double v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_avatarProvider, a3);
    v9->_mode = a4;
    double v10 = v9;
  }

  return v9;
}

- (CNMeCardSharingSettingsHeaderViewController)initWithAvatarProvider:(id)a3
{
  return [(CNMeCardSharingSettingsHeaderViewController *)self initWithAvatarProvider:a3 mode:0];
}

+ (double)avatarEdgeLengthForTraitCollection:(id)a3
{
  uint64_t v3 = [a3 verticalSizeClass];
  double result = 168.0;
  if (v3 == 1) {
    return 120.0;
  }
  return result;
}

@end