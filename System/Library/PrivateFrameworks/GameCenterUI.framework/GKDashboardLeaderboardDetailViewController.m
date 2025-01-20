@interface GKDashboardLeaderboardDetailViewController
- (GKDashboardLeaderboardDetailViewController)initWithScore:(id)a3 leaderboard:(id)a4;
- (GKDashboardPlayerPhotoView)playerView;
- (GKLeaderboard)leaderboard;
- (GKScore)score;
- (UIButton)firstButton;
- (UIButton)reportProblemButton;
- (UIButton)secondButton;
- (UILabel)descriptionLabel;
- (UILabel)earnedOnLabel;
- (UILabel)infoLabel;
- (UILabel)nameLabel;
- (id)preferredFocusEnvironments;
- (void)challenge:(id)a3;
- (void)configureForScore;
- (void)report:(id)a3;
- (void)setDescriptionLabel:(id)a3;
- (void)setEarnedOnLabel:(id)a3;
- (void)setFirstButton:(id)a3;
- (void)setInfoLabel:(id)a3;
- (void)setLeaderboard:(id)a3;
- (void)setNameLabel:(id)a3;
- (void)setPlayerView:(id)a3;
- (void)setReportProblemButton:(id)a3;
- (void)setScore:(id)a3;
- (void)setSecondButton:(id)a3;
- (void)share:(id)a3;
- (void)viewDidLoad;
@end

@implementation GKDashboardLeaderboardDetailViewController

- (GKDashboardLeaderboardDetailViewController)initWithScore:(id)a3 leaderboard:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(id)objc_opt_class() _gkPlatformNibName];
  v9 = [v6 player];
  if (([v9 isLocalPlayer] & 1) == 0 && (objc_msgSend(v9, "isFamiliarFriend") & 1) == 0)
  {
    uint64_t v10 = [v8 stringByAppendingString:@"NoBubbles"];

    v8 = (void *)v10;
  }
  v11 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v14.receiver = self;
  v14.super_class = (Class)GKDashboardLeaderboardDetailViewController;
  v12 = [(GKDashboardCollectionViewController *)&v14 initWithNibName:v8 bundle:v11];

  if (v12)
  {
    [(GKDashboardLeaderboardDetailViewController *)v12 setScore:v6];
    [(GKDashboardLeaderboardDetailViewController *)v12 setLeaderboard:v7];
  }

  return v12;
}

- (void)viewDidLoad
{
  v20.receiver = self;
  v20.super_class = (Class)GKDashboardLeaderboardDetailViewController;
  [(GKDetailViewController *)&v20 viewDidLoad];
  v3 = [(GKScore *)self->_score player];
  int v4 = [v3 isLocalPlayer];

  if (v4)
  {
    v5 = [MEMORY[0x1E4F637F8] reporter];
    uint64_t v6 = *MEMORY[0x1E4F634E0];
    [v5 reportEvent:*MEMORY[0x1E4F634E0] type:*MEMORY[0x1E4F630E8]];

    id v7 = [MEMORY[0x1E4F637F8] reporter];
    v8 = (uint64_t *)MEMORY[0x1E4F63100];
  }
  else
  {
    v9 = [(GKScore *)self->_score player];
    int v10 = [v9 isFamiliarFriend];

    v11 = [MEMORY[0x1E4F637F8] reporter];
    v12 = v11;
    uint64_t v6 = *MEMORY[0x1E4F634E0];
    if (v10)
    {
      [v11 reportEvent:*MEMORY[0x1E4F634E0] type:*MEMORY[0x1E4F630D8]];

      id v7 = [MEMORY[0x1E4F637F8] reporter];
      v8 = (uint64_t *)MEMORY[0x1E4F630F8];
    }
    else
    {
      [v11 reportEvent:*MEMORY[0x1E4F634E0] type:*MEMORY[0x1E4F630F0]];

      id v7 = [MEMORY[0x1E4F637F8] reporter];
      v8 = (uint64_t *)MEMORY[0x1E4F63108];
    }
  }
  uint64_t v13 = *v8;
  objc_super v14 = objc_msgSend(NSNumber, "numberWithInteger:", -[GKScore rank](self->_score, "rank"));
  [v7 reportEvent:v6 type:v13 scoreRank:v14];

  [(UIViewController *)self _gkModifyTopConstraintToLayoutGuideForSubview:self->_playerView];
  if (!self->_reportProblemButton)
  {
    id v15 = objc_alloc(MEMORY[0x1E4FB14A8]);
    v16 = GKGameCenterUIFrameworkBundle();
    v17 = GKGetLocalizedStringFromTableInBundle();
    v18 = (void *)[v15 initWithTitle:v17 style:2 target:self action:sel_report_];
    v19 = [(GKDashboardLeaderboardDetailViewController *)self navigationItem];
    [v19 setRightBarButtonItem:v18];
  }
  [(GKDashboardLeaderboardDetailViewController *)self configureForScore];
}

- (id)preferredFocusEnvironments
{
  v4[1] = *MEMORY[0x1E4F143B8];
  if (self->_firstButton)
  {
    v4[0] = self->_firstButton;
    v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  }
  else
  {
    v2 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v2;
}

- (void)configureForScore
{
  v3 = [(GKScore *)self->_score formattedValue];
  [(UILabel *)self->_descriptionLabel setText:v3];

  int v4 = NSString;
  v5 = GKGameCenterUIFrameworkBundle();
  uint64_t v6 = GKGetLocalizedStringFromTableInBundle();
  [(GKScore *)self->_score rank];
  id v7 = GKFormattedStringFromInteger();
  v8 = [(GKScore *)self->_score date];
  [v8 timeIntervalSince1970];
  v9 = GKAbsoluteTimeAsWhenString();
  int v10 = objc_msgSend(v4, "stringWithFormat:", v6, v7, v9);
  [(UILabel *)self->_earnedOnLabel setText:v10];

  id v33 = [MEMORY[0x1E4F63760] localPlayer];
  v11 = [(GKScore *)self->_score player];
  [(GKDashboardPlayerPhotoView *)self->_playerView setPlayer:v11];
  v12 = [v11 displayNameWithOptions:0];
  [(UILabel *)self->_nameLabel setText:v12];

  p_firstButton = &self->_firstButton;
  [(UIButton *)self->_firstButton setHidden:1];
  [(UIButton *)self->_secondButton setHidden:1];
  [(UIButton *)self->_firstButton removeTarget:self action:0 forControlEvents:64];
  [(UIButton *)self->_secondButton removeTarget:self action:0 forControlEvents:64];
  char v14 = [v33 isUnderage];
  [(UILabel *)self->_infoLabel setHidden:1];
  int v15 = [v11 isLocalPlayer];
  if (v15)
  {
    if ([v33 numberOfFriends])
    {
      v16 = GKGameCenterUIFrameworkBundle();
      v17 = GKGetLocalizedStringFromTableInBundle();

      v18 = 0;
      if (v14)
      {
        uint64_t v19 = 0;
        goto LABEL_19;
      }
    }
    else
    {
      v17 = 0;
      if (v14)
      {
        uint64_t v19 = 0;
        v18 = 0;
        goto LABEL_24;
      }
      v18 = 0;
    }
    goto LABEL_15;
  }
  if (![v11 isFamiliarFriend])
  {
    v17 = 0;
    v18 = 0;
    uint64_t v19 = 1;
    goto LABEL_24;
  }
  objc_super v20 = [(GKLeaderboard *)self->_leaderboard localPlayerScore];

  if (v20)
  {
    v21 = GKGameCenterUIFrameworkBundle();
    v17 = GKGetLocalizedStringFromTableInBundle();

    v18 = 0;
    if (v14)
    {
      uint64_t v19 = 1;
      goto LABEL_19;
    }
LABEL_15:
    uint64_t v19 = v15 ^ 1u;
    if (v17) {
      p_secondButton = &self->_secondButton;
    }
    else {
      p_secondButton = &self->_firstButton;
    }
    v26 = *p_secondButton;
    v27 = GKGameCenterUIFrameworkBundle();
    v28 = GKGetLocalizedStringFromTableInBundle();
    [(UIButton *)v26 setTitle:v28 forState:0];

    [(UIButton *)v26 addTarget:self action:sel_share_ forControlEvents:64];
    [(UIButton *)v26 setHidden:0];

LABEL_19:
    if (v17)
    {
      uint64_t v29 = [v17 stringByReplacingOccurrencesOfString:@"\n" withString:@" "];

      [(UIButton *)*p_firstButton setTitle:v29 forState:0];
      [(UIButton *)*p_firstButton addTarget:self action:sel_challenge_ forControlEvents:64];
      [(UIButton *)*p_firstButton setHidden:0];
      v17 = (void *)v29;
    }
    goto LABEL_21;
  }
  v22 = NSString;
  v32 = GKGameCenterUIFrameworkBundle();
  v23 = GKGetLocalizedStringFromTableInBundle();
  v24 = [(GKLeaderboard *)self->_leaderboard localizedTitle];
  v18 = objc_msgSend(v22, "stringWithFormat:", v23, v24);

  v17 = 0;
  if ((v14 & 1) == 0) {
    goto LABEL_15;
  }
  uint64_t v19 = 1;
LABEL_21:
  if (v18 && !v17)
  {
    [(UILabel *)self->_infoLabel setText:v18];
    [(UILabel *)self->_infoLabel setHidden:0];
  }
LABEL_24:
  [(UIButton *)self->_reportProblemButton setEnabled:v19];
  if (!self->_reportProblemButton)
  {
    v30 = [(GKDashboardLeaderboardDetailViewController *)self navigationItem];
    v31 = [v30 rightBarButtonItem];
    [v31 setEnabled:v19];
  }
}

- (void)challenge:(id)a3
{
  v16[1] = *MEMORY[0x1E4F143B8];
  int v4 = (void *)MEMORY[0x1E4F63800];
  v5 = [(GKScore *)self->_score game];
  uint64_t v6 = [MEMORY[0x1E4F63760] localPlayer];
  id v7 = [(GKLeaderboard *)self->_leaderboard localPlayerScore];
  v8 = [v4 challengeForGame:v5 andPlayer:v6 withScore:v7];

  v9 = [(GKLeaderboard *)self->_leaderboard internal];
  int v10 = [v8 internal];
  [v10 setLeaderboard:v9];

  v11 = [(GKScore *)self->_score player];
  if (v11)
  {
    v12 = [(GKScore *)self->_score player];
    v16[0] = v12;
    uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
  }
  else
  {
    uint64_t v13 = 0;
  }

  char v14 = [[GKChallengePlayerPickerViewController alloc] initWithChallenge:v8 initiallySelectedPlayers:v13];
  int v15 = [(UIViewController *)self _gkOriginatingViewController];
  [v15 _gkPushViewController:v14 replaceCurrent:0 animated:1];
}

- (void)share:(id)a3
{
  id v15 = a3;
  int v4 = [(GKScore *)self->_score player];
  int v5 = [v4 isLocalPlayer];

  if (v5)
  {
    uint64_t v6 = [MEMORY[0x1E4F637F8] reporter];
    uint64_t v7 = *MEMORY[0x1E4F634E0];
    [v6 reportEvent:*MEMORY[0x1E4F634E0] type:*MEMORY[0x1E4F63130]];

    v8 = [MEMORY[0x1E4F637F8] reporter];
    v9 = (uint64_t *)MEMORY[0x1E4F63118];
  }
  else
  {
    int v10 = [(GKScore *)self->_score player];
    int v11 = [v10 isFamiliarFriend];

    if (!v11) {
      goto LABEL_6;
    }
    v12 = [MEMORY[0x1E4F637F8] reporter];
    uint64_t v7 = *MEMORY[0x1E4F634E0];
    [v12 reportEvent:*MEMORY[0x1E4F634E0] type:*MEMORY[0x1E4F63128]];

    v8 = [MEMORY[0x1E4F637F8] reporter];
    v9 = (uint64_t *)MEMORY[0x1E4F63110];
  }
  uint64_t v13 = *v9;
  char v14 = objc_msgSend(NSNumber, "numberWithInteger:", -[GKScore rank](self->_score, "rank"));
  [v8 reportEvent:v7 type:v13 scoreRank:v14];

LABEL_6:
  [(GKDetailViewController *)self shareScore:self->_score fromLeaderboard:self->_leaderboard sendingView:v15];
}

- (void)report:(id)a3
{
  id v4 = [(GKScore *)self->_score player];
  [(GKDetailViewController *)self reportProblemAboutPlayer:v4];
}

- (GKDashboardPlayerPhotoView)playerView
{
  return self->_playerView;
}

- (void)setPlayerView:(id)a3
{
  self->_playerView = (GKDashboardPlayerPhotoView *)a3;
}

- (UILabel)nameLabel
{
  return self->_nameLabel;
}

- (void)setNameLabel:(id)a3
{
  self->_nameLabel = (UILabel *)a3;
}

- (UILabel)descriptionLabel
{
  return self->_descriptionLabel;
}

- (void)setDescriptionLabel:(id)a3
{
  self->_descriptionLabel = (UILabel *)a3;
}

- (UILabel)earnedOnLabel
{
  return self->_earnedOnLabel;
}

- (void)setEarnedOnLabel:(id)a3
{
  self->_earnedOnLabel = (UILabel *)a3;
}

- (UILabel)infoLabel
{
  return self->_infoLabel;
}

- (void)setInfoLabel:(id)a3
{
  self->_infoLabel = (UILabel *)a3;
}

- (UIButton)firstButton
{
  return self->_firstButton;
}

- (void)setFirstButton:(id)a3
{
  self->_firstButton = (UIButton *)a3;
}

- (UIButton)secondButton
{
  return self->_secondButton;
}

- (void)setSecondButton:(id)a3
{
  self->_secondButton = (UIButton *)a3;
}

- (UIButton)reportProblemButton
{
  return self->_reportProblemButton;
}

- (void)setReportProblemButton:(id)a3
{
  self->_reportProblemButton = (UIButton *)a3;
}

- (GKLeaderboard)leaderboard
{
  return self->_leaderboard;
}

- (void)setLeaderboard:(id)a3
{
}

- (GKScore)score
{
  return self->_score;
}

- (void)setScore:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_score, 0);

  objc_storeStrong((id *)&self->_leaderboard, 0);
}

@end