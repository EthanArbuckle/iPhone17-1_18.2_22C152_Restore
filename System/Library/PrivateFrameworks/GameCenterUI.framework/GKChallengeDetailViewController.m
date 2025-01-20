@interface GKChallengeDetailViewController
- (BOOL)shouldShowPlay;
- (GKButton)declineButton;
- (GKButton)playNowButton;
- (GKChallenge)challenge;
- (GKChallengeDetailViewController)initWithChallenge:(id)a3;
- (GKDashboardPlayerPhotoView)playerAvatarView;
- (NSLayoutConstraint)actionStackPortraitBottomConstraint;
- (NSLayoutConstraint)actionStackPortraitTopConstraint;
- (NSLayoutConstraint)artworkStackPortraitTopConstraint;
- (NSLayoutConstraint)artworkViewHeightConstraint;
- (NSLayoutConstraint)challengerStackLandscapeTopConstraint;
- (NSLayoutConstraint)challengerStackPortraitTopConstraint;
- (UILabel)categoryLabel;
- (UILabel)challengeByNameLabel;
- (UILabel)descriptionLabel;
- (UILabel)titleLabel;
- (UIStackView)actionStack;
- (UIStackView)artworkStack;
- (UIStackView)challengerStack;
- (UIView)iconView;
- (id)delegate;
- (id)title;
- (void)adjustFontSizeForLabel:(id)a3 withTextStyle:(id)a4;
- (void)adjustLabelFonts;
- (void)challengeOK:(id)a3;
- (void)configureButtons;
- (void)configureForChallenge;
- (void)declinePressed:(id)a3;
- (void)donePressed:(id)a3;
- (void)playNowPressed:(id)a3;
- (void)setActionStack:(id)a3;
- (void)setActionStackPortraitBottomConstraint:(id)a3;
- (void)setActionStackPortraitTopConstraint:(id)a3;
- (void)setArtworkStack:(id)a3;
- (void)setArtworkStackPortraitTopConstraint:(id)a3;
- (void)setArtworkViewHeightConstraint:(id)a3;
- (void)setCategoryLabel:(id)a3;
- (void)setChallenge:(id)a3;
- (void)setChallengeByNameLabel:(id)a3;
- (void)setChallengerStack:(id)a3;
- (void)setChallengerStackLandscapeTopConstraint:(id)a3;
- (void)setChallengerStackPortraitTopConstraint:(id)a3;
- (void)setDeclineButton:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDescriptionLabel:(id)a3;
- (void)setIconView:(id)a3;
- (void)setPlayNowButton:(id)a3;
- (void)setPlayerAvatarView:(id)a3;
- (void)setShouldShowPlay:(BOOL)a3;
- (void)setTitleLabel:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateIconViewWithSubView:(id)a3;
- (void)updateIconViewWithSubView:(id)a3 edgeInsets:(UIEdgeInsets)a4;
- (void)updateLeaderboardImage;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation GKChallengeDetailViewController

- (GKChallengeDetailViewController)initWithChallenge:(id)a3
{
  id v4 = a3;
  v5 = [(id)objc_opt_class() _gkPlatformNibName];
  v6 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v9.receiver = self;
  v9.super_class = (Class)GKChallengeDetailViewController;
  v7 = [(GKDashboardCollectionViewController *)&v9 initWithNibName:v5 bundle:v6];

  if (v7) {
    [(GKChallengeDetailViewController *)v7 setChallenge:v4];
  }

  return v7;
}

- (void)viewDidLoad
{
  v16.receiver = self;
  v16.super_class = (Class)GKChallengeDetailViewController;
  [(GKDashboardCollectionViewController *)&v16 viewDidLoad];
  v3 = [MEMORY[0x1E4F637F8] reporter];
  [v3 reportEvent:*MEMORY[0x1E4F634E0] type:*MEMORY[0x1E4F630D0]];

  id v4 = [MEMORY[0x1E4FB1618] clearColor];
  v5 = [(GKChallengeDetailViewController *)self view];
  [v5 setBackgroundColor:v4];

  v6 = [(GKChallengeDetailViewController *)self playerAvatarView];
  [v6 setBackgroundColor:0];

  v7 = [MEMORY[0x1E4FB1618] clearColor];
  v8 = [(GKChallengeDetailViewController *)self iconView];
  [v8 setBackgroundColor:v7];

  objc_super v9 = [MEMORY[0x1E4FB1618] _gkSpeechViewTintColor];
  v10 = [(GKChallengeDetailViewController *)self playerAvatarView];
  [v10 setTintColor:v9];

  [(GKChallengeDetailViewController *)self configureForChallenge];
  v11 = [(GKChallengeDetailViewController *)self navigationItem];
  [v11 _setAutoScrollEdgeTransitionDistance:40.0];

  v12 = [(GKChallengeDetailViewController *)self navigationItem];
  [v12 _setManualScrollEdgeAppearanceEnabled:1];

  v13 = [(GKChallengeDetailViewController *)self title];
  v14 = [(GKChallengeDetailViewController *)self navigationItem];
  [v14 setTitle:v13];

  v15 = [(GKChallengeDetailViewController *)self navigationItem];
  [v15 setLargeTitleDisplayMode:2];

  [(GKChallengeDetailViewController *)self configureButtons];
  [(GKChallengeDetailViewController *)self adjustLabelFonts];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)GKChallengeDetailViewController;
  [(GKDashboardCollectionViewController *)&v4 viewDidAppear:a3];
  v3 = [MEMORY[0x1E4F63660] reporter];
  [v3 recordPageWithID:@"challengeDetail" pageContext:@"dashboard" pageType:@"challenge"];
}

- (void)viewDidLayoutSubviews
{
  v3 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v4 = [v3 userInterfaceIdiom];

  if (v4 == 1)
  {
    v5 = [(GKChallengeDetailViewController *)self view];
    [v5 bounds];
    double Height = CGRectGetHeight(v17);
    v7 = [(GKChallengeDetailViewController *)self artworkStack];
    [v7 bounds];
    double v8 = Height - CGRectGetHeight(v18);
    objc_super v9 = [(GKChallengeDetailViewController *)self challengerStack];
    [v9 bounds];
    double v10 = v8 - CGRectGetHeight(v19);
    v11 = [(GKChallengeDetailViewController *)self actionStack];
    [v11 bounds];
    double v12 = v10 - CGRectGetHeight(v20);

    double v13 = v12 / 3.0;
    v14 = [(GKChallengeDetailViewController *)self artworkStackPortraitTopConstraint];
    [v14 setConstant:v13];

    id v15 = [(GKChallengeDetailViewController *)self actionStackPortraitBottomConstraint];
    [v15 setConstant:v13];
  }
}

- (void)adjustLabelFonts
{
  v3 = [(GKChallengeDetailViewController *)self challengeByNameLabel];
  uint64_t v4 = *MEMORY[0x1E4FB28C8];
  [(GKChallengeDetailViewController *)self adjustFontSizeForLabel:v3 withTextStyle:*MEMORY[0x1E4FB28C8]];

  v5 = [(GKChallengeDetailViewController *)self titleLabel];
  [(GKChallengeDetailViewController *)self adjustFontSizeForLabel:v5 withTextStyle:v4];

  v6 = [(GKChallengeDetailViewController *)self descriptionLabel];
  [(GKChallengeDetailViewController *)self adjustFontSizeForLabel:v6 withTextStyle:v4];

  v7 = [(GKChallengeDetailViewController *)self playNowButton];
  double v8 = [v7 titleLabel];
  [(GKChallengeDetailViewController *)self adjustFontSizeForLabel:v8 withTextStyle:v4];

  id v10 = [(GKChallengeDetailViewController *)self declineButton];
  objc_super v9 = [v10 titleLabel];
  [(GKChallengeDetailViewController *)self adjustFontSizeForLabel:v9 withTextStyle:v4];
}

- (void)adjustFontSizeForLabel:(id)a3 withTextStyle:(id)a4
{
  v5 = (void *)MEMORY[0x1E4FB08E0];
  id v7 = a3;
  v6 = [v5 preferredFontForTextStyle:a4];
  [v7 setFont:v6];

  [v7 setAdjustsFontForContentSizeCategory:1];
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v45.receiver = self;
  v45.super_class = (Class)GKChallengeDetailViewController;
  [(GKDashboardCollectionViewController *)&v45 traitCollectionDidChange:v4];
  v5 = [(GKChallengeDetailViewController *)self traitCollection];
  uint64_t v6 = [v5 horizontalSizeClass];
  if (v6 == [v4 horizontalSizeClass])
  {
    id v7 = [(GKChallengeDetailViewController *)self traitCollection];
    uint64_t v8 = [v7 layoutDirection];
    if (v8 == [v4 layoutDirection])
    {
      objc_super v9 = [(GKChallengeDetailViewController *)self traitCollection];
      id v10 = [v9 preferredContentSizeCategory];
      v11 = [v4 preferredContentSizeCategory];

      if (v10 == v11) {
        goto LABEL_15;
      }
      goto LABEL_7;
    }
  }
LABEL_7:
  double v12 = [(GKChallengeDetailViewController *)self traitCollection];
  double v13 = [v12 preferredContentSizeCategory];

  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v13);
  id v15 = [(GKChallengeDetailViewController *)self artworkStackPortraitTopConstraint];
  objc_super v16 = v15;
  if (IsAccessibilityCategory)
  {
    [v15 setConstant:0.0];

    if ([(NSString *)v13 isEqualToString:*MEMORY[0x1E4FB2778]]
      || [(NSString *)v13 isEqualToString:*MEMORY[0x1E4FB2780]])
    {
      CGRect v17 = [(GKChallengeDetailViewController *)self challengerStackLandscapeTopConstraint];
      [v17 setConstant:0.0];

      CGRect v18 = [(GKChallengeDetailViewController *)self challengerStackPortraitTopConstraint];
      [v18 setConstant:3.0];

      CGRect v19 = [(GKChallengeDetailViewController *)self actionStackPortraitTopConstraint];
      CGRect v20 = v19;
      double v21 = 0.0;
    }
    else
    {
      v33 = [(GKChallengeDetailViewController *)self challengerStackLandscapeTopConstraint];
      [v33 setConstant:60.0];

      v34 = [(GKChallengeDetailViewController *)self challengerStackPortraitTopConstraint];
      [v34 setConstant:30.0];

      CGRect v19 = [(GKChallengeDetailViewController *)self actionStackPortraitTopConstraint];
      CGRect v20 = v19;
      double v21 = 15.0;
    }
    [v19 setConstant:v21];

    v35 = [(GKChallengeDetailViewController *)self actionStackPortraitBottomConstraint];
    [v35 setConstant:0.0];

    v36 = [(GKChallengeDetailViewController *)self artworkViewHeightConstraint];
    [v36 setConstant:100.0];

    v37 = [(GKChallengeDetailViewController *)self artworkStack];
    [v37 setSpacing:0.0];

    v38 = [(GKChallengeDetailViewController *)self challengerStack];
    [v38 setSpacing:0.0];

    double v39 = *MEMORY[0x1E4FB2848];
    double v40 = *(double *)(MEMORY[0x1E4FB2848] + 8);
    double v41 = *(double *)(MEMORY[0x1E4FB2848] + 16);
    double v42 = *(double *)(MEMORY[0x1E4FB2848] + 24);
    v43 = [(GKChallengeDetailViewController *)self playNowButton];
    objc_msgSend(v43, "setTitleEdgeInsets:", v39, v40, v41, v42);

    v31 = [(GKChallengeDetailViewController *)self declineButton];
    objc_msgSend(v31, "setTitleEdgeInsets:", v39, v40, v41, v42);
  }
  else
  {
    [v15 setConstant:30.0];

    v22 = [(GKChallengeDetailViewController *)self artworkViewHeightConstraint];
    [v22 setConstant:200.0];

    v23 = [(GKChallengeDetailViewController *)self challengerStackLandscapeTopConstraint];
    [v23 setConstant:80.0];

    v24 = [(GKChallengeDetailViewController *)self challengerStackPortraitTopConstraint];
    [v24 setConstant:40.0];

    v25 = [(GKChallengeDetailViewController *)self actionStackPortraitTopConstraint];
    [v25 setConstant:25.0];

    v26 = [(GKChallengeDetailViewController *)self actionStackPortraitBottomConstraint];
    [v26 setConstant:25.0];

    v27 = [(GKChallengeDetailViewController *)self artworkStack];
    [v27 setSpacing:8.0];

    v28 = [(GKChallengeDetailViewController *)self challengerStack];
    [v28 setSpacing:10.0];

    v29 = [(GKChallengeDetailViewController *)self playNowButton];
    v30 = +[GKButtonStyle standardStyle];
    [v29 applyButtonStyle:v30];

    v31 = [(GKChallengeDetailViewController *)self declineButton];
    v32 = +[GKButtonStyle standardStyle];
    [v31 applyButtonStyle:v32];
  }
  v44 = [(GKChallengeDetailViewController *)self view];
  [v44 updateConstraintsIfNeeded];

LABEL_15:
}

- (id)title
{
  v2 = GKGameCenterUIFrameworkBundle();
  v3 = GKGetLocalizedStringFromTableInBundle();

  return v3;
}

- (void)configureForChallenge
{
  id v32 = [(GKChallenge *)self->_challenge issuingPlayer];
  v3 = [(GKChallengeDetailViewController *)self playerAvatarView];
  [v3 setPlayer:v32];

  id v4 = [(GKChallengeDetailViewController *)self challenge];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  challenge = self->_challenge;
  if (isKindOfClass)
  {
    id v7 = [(GKChallenge *)challenge achievement];
    uint64_t v8 = [v7 title];
    objc_super v9 = [(GKChallengeDetailViewController *)self titleLabel];
    [v9 setText:v8];

    id v10 = [v7 unachievedDescription];
    v11 = [(GKChallengeDetailViewController *)self descriptionLabel];
    [v11 setText:v10];

    double v12 = GKGameCenterUIFrameworkBundle();
    double v13 = GKGetLocalizedStringFromTableInBundle();
    v14 = [(GKChallengeDetailViewController *)self categoryLabel];
    [v14 setText:v13];

    id v15 = +[AchievementUtils achievementBadgeWithAchievement:v7];
    [(GKChallengeDetailViewController *)self updateIconViewWithSubView:v15];
  }
  else
  {
    objc_super v16 = challenge;
    CGRect v17 = [(GKChallenge *)v16 leaderboard];
    CGRect v18 = [v17 title];
    CGRect v19 = [(GKChallengeDetailViewController *)self titleLabel];
    [v19 setText:v18];

    CGRect v20 = [(GKChallenge *)v16 score];

    double v21 = [v20 formattedValue];
    v22 = [(GKChallengeDetailViewController *)self descriptionLabel];
    [v22 setText:v21];

    v23 = GKGameCenterUIFrameworkBundle();
    v24 = GKGetLocalizedStringFromTableInBundle();
    v25 = [(GKChallengeDetailViewController *)self categoryLabel];
    [v25 setText:v24];

    [(GKChallengeDetailViewController *)self updateLeaderboardImage];
  }
  v26 = NSString;
  v27 = GKGameCenterUIFrameworkBundle();
  v28 = GKGetLocalizedStringFromTableInBundle();
  v29 = [v32 alias];
  v30 = objc_msgSend(v26, "stringWithFormat:", v28, v29);
  v31 = [(GKChallengeDetailViewController *)self challengeByNameLabel];
  [v31 setText:v30];
}

- (void)configureButtons
{
  id v25 = [MEMORY[0x1E4FB14D0] _gkXmarkedCloseButtonWithTarget:self action:sel_donePressed_];
  v3 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithCustomView:v25];
  id v4 = [(GKChallengeDetailViewController *)self navigationItem];
  [v4 setRightBarButtonItem:v3];

  v5 = [(GKChallengeDetailViewController *)self playNowButton];
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];

  uint64_t v6 = [(GKChallengeDetailViewController *)self playNowButton];
  id v7 = +[GKButtonStyle standardStyle];
  [v6 applyButtonStyle:v7];

  uint64_t v8 = [(GKChallengeDetailViewController *)self declineButton];
  [v8 setTranslatesAutoresizingMaskIntoConstraints:0];

  objc_super v9 = [(GKChallengeDetailViewController *)self declineButton];
  id v10 = +[GKButtonStyle standardStyle];
  [v9 applyButtonStyle:v10];

  v11 = [(GKChallengeDetailViewController *)self playNowButton];
  double v12 = GKGameCenterUIFrameworkBundle();
  double v13 = GKGetLocalizedStringFromTableInBundle();
  [v11 setTitle:v13 forState:0];

  v14 = [(GKChallengeDetailViewController *)self playNowButton];
  id v15 = GKGameCenterUIFrameworkBundle();
  objc_super v16 = GKGetLocalizedStringFromTableInBundle();
  [v14 setTitle:v16 forState:4];

  CGRect v17 = [(GKChallengeDetailViewController *)self declineButton];
  CGRect v18 = GKGameCenterUIFrameworkBundle();
  CGRect v19 = GKGetLocalizedStringFromTableInBundle();
  [v17 setTitle:v19 forState:0];

  CGRect v20 = [(GKChallengeDetailViewController *)self declineButton];
  double v21 = GKGameCenterUIFrameworkBundle();
  v22 = GKGetLocalizedStringFromTableInBundle();
  [v20 setTitle:v22 forState:4];

  uint64_t v23 = [(GKChallengeDetailViewController *)self shouldShowPlay] ^ 1;
  v24 = [(GKChallengeDetailViewController *)self playNowButton];
  [v24 setHidden:v23];
}

- (void)donePressed:(id)a3
{
  id v3 = [(UIViewController *)self _gkExtensionViewController];
  [v3 finish];
}

- (void)playNowPressed:(id)a3
{
  id v4 = [(UIViewController *)self _gkExtensionViewController];
  [v4 finish];

  id v5 = [(UIViewController *)self _gkExtensionViewController];
  [v5 finishAndPlayChallenge:self->_challenge];
}

- (void)declinePressed:(id)a3
{
  id v4 = [(GKChallengeDetailViewController *)self challenge];
  [v4 decline];

  [(UIViewController *)self _gkRemoveViewController:self animated:1];
  id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 postNotificationName:*MEMORY[0x1E4F630C8] object:0];
}

- (void)challengeOK:(id)a3
{
}

- (void)updateLeaderboardImage
{
  id v3 = self->_challenge;
  id v4 = [(GKChallenge *)v3 leaderboard];
  id v5 = [MEMORY[0x1E4F63A10] sharedTheme];
  uint64_t v6 = [v5 iconLeaderboardListSource];

  id v7 = [v4 identifier];
  uint64_t v8 = [v6 cachedImageForIdentifier:v7];

  if (v8)
  {
    objc_super v9 = (void *)[objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v8];
    id v10 = [v9 layer];
    [v10 setCornerRadius:10.0];

    v11 = [v9 layer];
    [v11 setMasksToBounds:1];

    [(GKChallengeDetailViewController *)self updateIconViewWithSubView:v9];
  }
  else
  {
    double v12 = [v4 imageURL];
    challenge = self->_challenge;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __57__GKChallengeDetailViewController_updateLeaderboardImage__block_invoke;
    v14[3] = &unk_1E5F633D0;
    v14[4] = self;
    [v6 loadImageForURLString:v12 reference:challenge queue:MEMORY[0x1E4F14428] handler:v14];
  }
}

void __57__GKChallengeDetailViewController_updateLeaderboardImage__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v20 = a2;
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = [v5 challenge];
  int v8 = [v7 isEqual:v6];

  if (v8)
  {
    double v9 = *MEMORY[0x1E4FB2848];
    double v10 = *(double *)(MEMORY[0x1E4FB2848] + 8);
    double v11 = *(double *)(MEMORY[0x1E4FB2848] + 16);
    double v12 = *(double *)(MEMORY[0x1E4FB2848] + 24);
    if (!v20)
    {
      double v13 = [MEMORY[0x1E4FB1818] _systemImageNamed:@"list.bullet.below.star.filled"];
      id v20 = [v13 imageWithRenderingMode:2];
    }
    v14 = (void *)[objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v20];
    id v15 = [MEMORY[0x1E4FB1618] tertiaryLabelColor];
    [v14 setTintColor:v15];

    [v14 setContentMode:2];
    uint64_t v16 = *MEMORY[0x1E4F3A2E8];
    CGRect v17 = [v14 layer];
    [v17 setCompositingFilter:v16];

    CGRect v18 = [v14 layer];
    [v18 setCornerRadius:10.0];

    CGRect v19 = [v14 layer];
    [v19 setMasksToBounds:1];

    objc_msgSend(*(id *)(a1 + 32), "updateIconViewWithSubView:edgeInsets:", v14, v9, v10, v11, v12);
  }
}

- (void)updateIconViewWithSubView:(id)a3
{
}

- (void)updateIconViewWithSubView:(id)a3 edgeInsets:(UIEdgeInsets)a4
{
  double right = a4.right;
  double bottom = a4.bottom;
  double left = a4.left;
  double top = a4.top;
  id v9 = a3;
  double v10 = [(GKChallengeDetailViewController *)self iconView];
  [v10 addSubview:v9];

  [v9 setTranslatesAutoresizingMaskIntoConstraints:0];
  double v11 = [(GKChallengeDetailViewController *)self iconView];
  [v11 setClipsToBounds:0];

  double v12 = (void *)MEMORY[0x1E4F28DC8];
  id v13 = [(GKChallengeDetailViewController *)self iconView];
  objc_msgSend(v12, "_gkInstallEdgeConstraintsForView:containedWithinParentView:edgeInsets:", v9, v13, top, left, bottom, right);
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained(&self->_delegate);

  return WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)shouldShowPlay
{
  return self->_shouldShowPlay;
}

- (void)setShouldShowPlay:(BOOL)a3
{
  self->_shouldShowPlay = a3;
}

- (GKChallenge)challenge
{
  return self->_challenge;
}

- (void)setChallenge:(id)a3
{
}

- (UIView)iconView
{
  return self->_iconView;
}

- (void)setIconView:(id)a3
{
}

- (UILabel)categoryLabel
{
  return self->_categoryLabel;
}

- (void)setCategoryLabel:(id)a3
{
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

- (GKDashboardPlayerPhotoView)playerAvatarView
{
  return self->_playerAvatarView;
}

- (void)setPlayerAvatarView:(id)a3
{
}

- (UILabel)challengeByNameLabel
{
  return self->_challengeByNameLabel;
}

- (void)setChallengeByNameLabel:(id)a3
{
}

- (GKButton)playNowButton
{
  return self->_playNowButton;
}

- (void)setPlayNowButton:(id)a3
{
}

- (GKButton)declineButton
{
  return self->_declineButton;
}

- (void)setDeclineButton:(id)a3
{
}

- (UIStackView)artworkStack
{
  return self->_artworkStack;
}

- (void)setArtworkStack:(id)a3
{
}

- (UIStackView)challengerStack
{
  return self->_challengerStack;
}

- (void)setChallengerStack:(id)a3
{
}

- (UIStackView)actionStack
{
  return self->_actionStack;
}

- (void)setActionStack:(id)a3
{
}

- (NSLayoutConstraint)artworkStackPortraitTopConstraint
{
  return self->_artworkStackPortraitTopConstraint;
}

- (void)setArtworkStackPortraitTopConstraint:(id)a3
{
}

- (NSLayoutConstraint)artworkViewHeightConstraint
{
  return self->_artworkViewHeightConstraint;
}

- (void)setArtworkViewHeightConstraint:(id)a3
{
}

- (NSLayoutConstraint)challengerStackLandscapeTopConstraint
{
  return self->_challengerStackLandscapeTopConstraint;
}

- (void)setChallengerStackLandscapeTopConstraint:(id)a3
{
}

- (NSLayoutConstraint)challengerStackPortraitTopConstraint
{
  return self->_challengerStackPortraitTopConstraint;
}

- (void)setChallengerStackPortraitTopConstraint:(id)a3
{
}

- (NSLayoutConstraint)actionStackPortraitTopConstraint
{
  return self->_actionStackPortraitTopConstraint;
}

- (void)setActionStackPortraitTopConstraint:(id)a3
{
}

- (NSLayoutConstraint)actionStackPortraitBottomConstraint
{
  return self->_actionStackPortraitBottomConstraint;
}

- (void)setActionStackPortraitBottomConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionStackPortraitBottomConstraint, 0);
  objc_storeStrong((id *)&self->_actionStackPortraitTopConstraint, 0);
  objc_storeStrong((id *)&self->_challengerStackPortraitTopConstraint, 0);
  objc_storeStrong((id *)&self->_challengerStackLandscapeTopConstraint, 0);
  objc_storeStrong((id *)&self->_artworkViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_artworkStackPortraitTopConstraint, 0);
  objc_storeStrong((id *)&self->_actionStack, 0);
  objc_storeStrong((id *)&self->_challengerStack, 0);
  objc_storeStrong((id *)&self->_artworkStack, 0);
  objc_storeStrong((id *)&self->_declineButton, 0);
  objc_storeStrong((id *)&self->_playNowButton, 0);
  objc_storeStrong((id *)&self->_challengeByNameLabel, 0);
  objc_storeStrong((id *)&self->_playerAvatarView, 0);
  objc_storeStrong((id *)&self->_descriptionLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_categoryLabel, 0);
  objc_storeStrong((id *)&self->_iconView, 0);
  objc_storeStrong((id *)&self->_challenge, 0);

  objc_destroyWeak(&self->_delegate);
}

@end