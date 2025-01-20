@interface GKDashboardChallengeDetailViewController
- (BOOL)shouldShowPlay;
- (GKAchievementIconView)iconView;
- (GKChallenge)challenge;
- (GKDashboardChallengeDetailViewController)initWithChallenge:(id)a3;
- (NSLayoutConstraint)iconHeightConstraint;
- (NSLayoutConstraint)speechToFromConstraint;
- (NSLayoutConstraint)topConstraint;
- (UIButton)declineButton;
- (UIButton)playButton;
- (UILabel)descriptionLabel;
- (UILabel)fromLabel;
- (UILabel)titleLabel;
- (double)topMargin;
- (id)delegate;
- (id)preferredFocusEnvironments;
- (void)challengeOK:(id)a3;
- (void)configureForChallenge;
- (void)decline:(id)a3;
- (void)play:(id)a3;
- (void)setChallenge:(id)a3;
- (void)setDeclineButton:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDescriptionLabel:(id)a3;
- (void)setFromLabel:(id)a3;
- (void)setIconHeightConstraint:(id)a3;
- (void)setIconView:(id)a3;
- (void)setPlayButton:(id)a3;
- (void)setShouldShowPlay:(BOOL)a3;
- (void)setSpeechToFromConstraint:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setTopConstraint:(id)a3;
- (void)setTopMargin:(double)a3;
- (void)updateLeaderboardImage;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation GKDashboardChallengeDetailViewController

- (GKDashboardChallengeDetailViewController)initWithChallenge:(id)a3
{
  id v4 = a3;
  v5 = [(id)objc_opt_class() _gkPlatformNibName];
  v6 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v9.receiver = self;
  v9.super_class = (Class)GKDashboardChallengeDetailViewController;
  v7 = [(GKDashboardCollectionViewController *)&v9 initWithNibName:v5 bundle:v6];

  if (v7) {
    [(GKDashboardChallengeDetailViewController *)v7 setChallenge:v4];
  }

  return v7;
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)GKDashboardChallengeDetailViewController;
  [(GKDetailViewController *)&v4 viewDidLoad];
  v3 = [MEMORY[0x1E4F637F8] reporter];
  [v3 reportEvent:*MEMORY[0x1E4F634E0] type:*MEMORY[0x1E4F630D0]];

  [(NSLayoutConstraint *)self->_topConstraint constant];
  -[GKDashboardChallengeDetailViewController setTopMargin:](self, "setTopMargin:");
  [(GKAchievementIconView *)self->_iconView setIsDetail:1];
  [(GKDashboardChallengeDetailViewController *)self configureForChallenge];
}

- (void)viewWillLayoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)GKDashboardChallengeDetailViewController;
  [(GKDashboardChallengeDetailViewController *)&v6 viewWillLayoutSubviews];
  double topMargin = self->_topMargin;
  objc_super v4 = [(GKDashboardChallengeDetailViewController *)self view];
  [v4 safeAreaInsets];
  [(NSLayoutConstraint *)self->_topConstraint setConstant:topMargin + v5];
}

- (id)preferredFocusEnvironments
{
  v4[1] = *MEMORY[0x1E4F143B8];
  if (self->_playButton)
  {
    v4[0] = self->_playButton;
    v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  }
  else
  {
    v2 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v2;
}

- (void)configureForChallenge
{
  v3 = [(GKChallenge *)self->_challenge detailFromText];
  objc_super v4 = [v3 stringByReplacingOccurrencesOfString:@"<friend>" withString:&stru_1F07B2408];

  id v19 = [v4 stringByReplacingOccurrencesOfString:@"</friend>" withString:&stru_1F07B2408];

  [(UILabel *)self->_fromLabel setText:v19];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  challenge = self->_challenge;
  if (isKindOfClass)
  {
    v7 = [(GKChallenge *)challenge achievement];
    v8 = [v7 title];
    [(UILabel *)self->_titleLabel setText:v8];

    objc_super v9 = [v7 unachievedDescription];
    [(UILabel *)self->_descriptionLabel setText:v9];

    [(GKAchievementIconView *)self->_iconView setupForAchievement:v7 localAchievement:v7];
  }
  else
  {
    v10 = challenge;
    v11 = [(GKChallenge *)v10 leaderboard];
    v12 = [v11 title];
    [(UILabel *)self->_titleLabel setText:v12];

    v13 = NSString;
    v14 = GKGameCenterUIFrameworkBundle();
    v15 = GKGetLocalizedStringFromTableInBundle();
    v16 = [(GKChallenge *)v10 score];
    v17 = [v16 formattedValue];
    v18 = objc_msgSend(v13, "stringWithFormat:", v15, v17);
    [(UILabel *)self->_descriptionLabel setText:v18];

    [(GKDashboardChallengeDetailViewController *)self updateLeaderboardImage];
  }
  [(UIButton *)self->_playButton setHidden:!self->_shouldShowPlay];
}

- (void)updateLeaderboardImage
{
  v3 = self->_challenge;
  objc_super v4 = [(GKChallenge *)v3 leaderboard];
  double v5 = [MEMORY[0x1E4F63A10] sharedTheme];
  objc_super v6 = [v5 iconLeaderboardListSource];

  v7 = [v4 identifier];
  v8 = [v6 cachedImageForIdentifier:v7];

  [(GKAchievementIconView *)self->_iconView setImage:v8];
  if (!v8)
  {
    objc_super v9 = [v4 imageURL];
    challenge = self->_challenge;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __66__GKDashboardChallengeDetailViewController_updateLeaderboardImage__block_invoke;
    v11[3] = &unk_1E5F640E8;
    v11[4] = self;
    id v12 = v6;
    [v12 loadImageForURLString:v9 reference:challenge queue:MEMORY[0x1E4F14428] handler:v11];
  }
}

void __66__GKDashboardChallengeDetailViewController_updateLeaderboardImage__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  double v5 = *(void **)(a1 + 32);
  id v6 = a3;
  v7 = [v5 challenge];
  int v8 = [v7 isEqual:v6];

  if (v8)
  {
    uint64_t v9 = (uint64_t)v10;
    if (!v10)
    {
      uint64_t v9 = [*(id *)(a1 + 40) defaultImage];
    }
    id v10 = (id)v9;
    [*(id *)(*(void *)(a1 + 32) + 1176) setImage:v9];
  }
}

- (void)play:(id)a3
{
  objc_super v4 = [(UIViewController *)self _gkExtensionViewController];
  [v4 finishAndPlayChallenge:self->_challenge];

  id WeakRetained = objc_loadWeakRetained(&self->_delegate);
  [WeakRetained userDidSelectPlay:self];
}

- (void)challengeOK:(id)a3
{
}

- (void)decline:(id)a3
{
  [(GKChallenge *)self->_challenge decline];
  id v4 = [(UIViewController *)self _gkOriginatingViewController];
  [(UIViewController *)self _gkRemoveViewController:self animated:1];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v4 setNeedsRefresh];
  }
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

- (GKAchievementIconView)iconView
{
  return self->_iconView;
}

- (void)setIconView:(id)a3
{
  self->_iconView = (GKAchievementIconView *)a3;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  self->_titleLabel = (UILabel *)a3;
}

- (UILabel)descriptionLabel
{
  return self->_descriptionLabel;
}

- (void)setDescriptionLabel:(id)a3
{
  self->_descriptionLabel = (UILabel *)a3;
}

- (UILabel)fromLabel
{
  return self->_fromLabel;
}

- (void)setFromLabel:(id)a3
{
  self->_fromLabel = (UILabel *)a3;
}

- (UIButton)playButton
{
  return self->_playButton;
}

- (void)setPlayButton:(id)a3
{
  self->_playButton = (UIButton *)a3;
}

- (UIButton)declineButton
{
  return self->_declineButton;
}

- (void)setDeclineButton:(id)a3
{
  self->_declineButton = (UIButton *)a3;
}

- (NSLayoutConstraint)topConstraint
{
  return self->_topConstraint;
}

- (void)setTopConstraint:(id)a3
{
  self->_topConstraint = (NSLayoutConstraint *)a3;
}

- (double)topMargin
{
  return self->_topMargin;
}

- (void)setTopMargin:(double)a3
{
  self->_double topMargin = a3;
}

- (NSLayoutConstraint)iconHeightConstraint
{
  return self->_iconHeightConstraint;
}

- (void)setIconHeightConstraint:(id)a3
{
  self->_iconHeightConstraint = (NSLayoutConstraint *)a3;
}

- (NSLayoutConstraint)speechToFromConstraint
{
  return self->_speechToFromConstraint;
}

- (void)setSpeechToFromConstraint:(id)a3
{
  self->_speechToFromConstraint = (NSLayoutConstraint *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_challenge, 0);

  objc_destroyWeak(&self->_delegate);
}

@end