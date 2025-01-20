@interface GKDashboardTurnDetailViewController
- (BOOL)shouldShowPlay;
- (BOOL)shouldShowQuit;
- (GKDashboardTurnDetailViewController)initWithTurnBasedMatch:(id)a3;
- (GKTurnBasedMatch)match;
- (NSLayoutConstraint)secondButtonCenteringConstraint;
- (UIButton)firstButton;
- (UIButton)secondButton;
- (UILabel)createdLabel;
- (UILabel)playingWithLabel;
- (UIView)contentVerticalCenteringView;
- (UIView)turnDetailContentView;
- (id)preferredFocusEnvironments;
- (void)acceptInvitation:(id)a3;
- (void)chooseMatch:(id)a3;
- (void)dealloc;
- (void)declineInvitation:(id)a3;
- (void)disableButtons;
- (void)handleTurnBasedEvent:(id)a3;
- (void)quitMatch:(id)a3;
- (void)refreshPresenter;
- (void)removeMatch:(id)a3;
- (void)setContentVerticalCenteringView:(id)a3;
- (void)setCreatedLabel:(id)a3;
- (void)setFirstButton:(id)a3;
- (void)setMatch:(id)a3;
- (void)setPlayingWithLabel:(id)a3;
- (void)setSecondButton:(id)a3;
- (void)setSecondButtonCenteringConstraint:(id)a3;
- (void)setShouldShowPlay:(BOOL)a3;
- (void)setShouldShowQuit:(BOOL)a3;
- (void)setTurnDetailContentView:(id)a3;
- (void)turnOK:(id)a3;
- (void)viewDidLoad;
@end

@implementation GKDashboardTurnDetailViewController

- (GKDashboardTurnDetailViewController)initWithTurnBasedMatch:(id)a3
{
  id v4 = a3;
  v5 = [(id)objc_opt_class() _gkPlatformNibName];
  v6 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v10.receiver = self;
  v10.super_class = (Class)GKDashboardTurnDetailViewController;
  v7 = [(GKDashboardCollectionViewController *)&v10 initWithNibName:v5 bundle:v6];

  if (v7)
  {
    [(GKDashboardTurnDetailViewController *)v7 setMatch:v4];
    v8 = [[GKDashboardTurnDetailDataSource alloc] initWithMatch:v4];
    [(GKCollectionDataSource *)v8 setOnDarkBackground:0];
    [(GKDashboardCollectionViewController *)v7 setDataSource:v8];
  }
  return v7;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28C40] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)GKDashboardTurnDetailViewController;
  [(GKDashboardCollectionViewController *)&v4 dealloc];
}

- (void)viewDidLoad
{
  v26.receiver = self;
  v26.super_class = (Class)GKDashboardTurnDetailViewController;
  [(GKDetailViewController *)&v26 viewDidLoad];
  [(UIViewController *)self _gkModifyTopConstraintToLayoutGuideForSubview:self->_playingWithLabel];
  v3 = [(GKDashboardCollectionViewController *)self collectionView];
  [v3 setAllowsSelection:0];
  objc_super v4 = [(GKDashboardTurnDetailViewController *)self match];
  v5 = [v4 matchTitle];
  [(UILabel *)self->_playingWithLabel setText:v5];

  v6 = NSString;
  v7 = GKGameCenterUIFrameworkBundle();
  v8 = GKGetLocalizedStringFromTableInBundle();
  v9 = [(GKTurnBasedMatch *)self->_match creationDate];
  objc_super v10 = [v9 _gkFormattedDateForStyle:2 relative:0];
  v11 = objc_msgSend(v6, "stringWithFormat:", v8, v10);
  [(UILabel *)self->_createdLabel setText:v11];

  p_firstButton = &self->_firstButton;
  [(UIButton *)self->_firstButton removeTarget:self action:0 forControlEvents:64];
  [(UIButton *)self->_secondButton removeTarget:self action:0 forControlEvents:64];
  [(UIButton *)self->_firstButton setHidden:1];
  [(UIButton *)self->_secondButton setHidden:1];
  BOOL shouldShowPlay = self->_shouldShowPlay;
  switch([(GKTurnBasedMatch *)self->_match state])
  {
    case 1u:
      v16 = GKGameCenterUIFrameworkBundle();
      v14 = GKGetLocalizedStringFromTableInBundle();
      v17 = &selRef_acceptInvitation_;
      goto LABEL_5;
    case 2u:
    case 3u:
    case 4u:
    case 5u:
    case 6u:
      v16 = GKGameCenterUIFrameworkBundle();
      v14 = GKGetLocalizedStringFromTableInBundle();
      v17 = &selRef_chooseMatch_;
LABEL_5:

      v15 = *v17;
      break;
    default:
      v14 = 0;
      v15 = 0;
      break;
  }
  switch([(GKTurnBasedMatch *)self->_match state])
  {
    case 1u:
      v22 = GKGameCenterUIFrameworkBundle();
      v19 = GKGetLocalizedStringFromTableInBundle();

      char v21 = 0;
      v20 = sel_declineInvitation_;
      if (v19) {
        goto LABEL_16;
      }
      break;
    case 2u:
    case 3u:
    case 4u:
    case 6u:
      v18 = GKGameCenterUIFrameworkBundle();
      v19 = GKGetLocalizedStringFromTableInBundle();

      v20 = sel_quitMatch_;
      if (self->_shouldShowQuit)
      {
        char v21 = 0;
        if (v19) {
          goto LABEL_16;
        }
      }
      else
      {
        char v21 = [(GKTurnBasedMatch *)self->_match isMyTurn];
        if (v19) {
          goto LABEL_16;
        }
      }
      break;
    case 5u:
      v23 = GKGameCenterUIFrameworkBundle();
      v19 = GKGetLocalizedStringFromTableInBundle();

      char v21 = 0;
      v20 = sel_removeMatch_;
      if (v19)
      {
LABEL_16:
        if ((v21 & 1) == 0)
        {
          if (v14) {
            p_secondButton = &self->_secondButton;
          }
          else {
            p_secondButton = &self->_firstButton;
          }
          v25 = *p_secondButton;
          [(UIButton *)v25 setTitle:v19 forState:0];
          [(UIButton *)v25 addTarget:self action:v20 forControlEvents:64];
          [(UIButton *)v25 setHidden:0];
        }
      }
      break;
    default:
      v19 = 0;
      break;
  }
  if (shouldShowPlay && v14)
  {
    [(UIButton *)*p_firstButton setTitle:v14 forState:0];
    [(UIButton *)*p_firstButton addTarget:self action:v15 forControlEvents:64];
    [(UIButton *)*p_firstButton setHidden:0];
  }
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

- (void)refreshPresenter
{
  id v2 = [(UIViewController *)self _gkOriginatingViewController];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v2 setNeedsRefresh];
  }
}

- (void)acceptInvitation:(id)a3
{
  id v4 = a3;
  if (!*MEMORY[0x1E4F63860]) {
    id v5 = (id)GKOSLoggers();
  }
  v6 = *MEMORY[0x1E4F63870];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63870], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AF250000, v6, OS_LOG_TYPE_INFO, "accepted invitation", buf, 2u);
  }
  match = self->_match;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __56__GKDashboardTurnDetailViewController_acceptInvitation___block_invoke;
  v8[3] = &unk_1E5F64588;
  v8[4] = self;
  [(GKTurnBasedMatch *)match acceptInviteWithCompletionHandler:v8];
}

void __56__GKDashboardTurnDetailViewController_acceptInvitation___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 _gkExtensionViewController];
  [v4 finishWithTurnBasedMatch:v3];
}

- (void)declineInvitation:(id)a3
{
  id v4 = a3;
  if (!*MEMORY[0x1E4F63860]) {
    id v5 = (id)GKOSLoggers();
  }
  v6 = *MEMORY[0x1E4F63870];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63870], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AF250000, v6, OS_LOG_TYPE_INFO, "declineInvitation", buf, 2u);
  }
  [(GKDashboardTurnDetailViewController *)self disableButtons];
  match = self->_match;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __57__GKDashboardTurnDetailViewController_declineInvitation___block_invoke;
  v8[3] = &unk_1E5F63240;
  v8[4] = self;
  [(GKTurnBasedMatch *)match declineInviteWithCompletionHandler:v8];
}

uint64_t __57__GKDashboardTurnDetailViewController_declineInvitation___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) refreshPresenter];
  id v2 = *(void **)(a1 + 32);

  return [v2 _gkRemoveViewController:v2 animated:1];
}

- (void)chooseMatch:(id)a3
{
  id v4 = a3;
  if (!*MEMORY[0x1E4F63860]) {
    id v5 = (id)GKOSLoggers();
  }
  v6 = *MEMORY[0x1E4F63870];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63870], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AF250000, v6, OS_LOG_TYPE_INFO, "chooseMatch", buf, 2u);
  }
  v7 = (void *)MEMORY[0x1E4F63818];
  v8 = [(GKTurnBasedMatch *)self->_match matchID];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __51__GKDashboardTurnDetailViewController_chooseMatch___block_invoke;
  v9[3] = &unk_1E5F64588;
  v9[4] = self;
  [v7 loadTurnBasedMatchWithDetailsForMatchID:v8 withCompletionHandler:v9];
}

void __51__GKDashboardTurnDetailViewController_chooseMatch___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 _gkExtensionViewController];
  [v4 finishWithTurnBasedMatch:v3];
}

- (void)disableButtons
{
  [(UIButton *)self->_firstButton setEnabled:0];
  [(UIButton *)self->_secondButton setEnabled:0];

  [(GKDashboardTurnDetailViewController *)self setNeedsFocusUpdate];
}

- (void)quitMatch:(id)a3
{
  id v4 = a3;
  id v5 = (NSObject **)MEMORY[0x1E4F63860];
  if (!*MEMORY[0x1E4F63860]) {
    id v6 = (id)GKOSLoggers();
  }
  v7 = *MEMORY[0x1E4F63870];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63870], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AF250000, v7, OS_LOG_TYPE_INFO, "quitMatch", buf, 2u);
  }
  [(GKDashboardTurnDetailViewController *)self disableButtons];
  p_match = &self->_match;
  if ([(GKTurnBasedMatch *)self->_match isMyTurn])
  {
    v9 = [MEMORY[0x1E4F28C40] defaultCenter];
    [v9 addObserver:self selector:sel_handleTurnBasedEvent_ name:*MEMORY[0x1E4F63228] object:0];

    objc_super v10 = [(UIViewController *)self _gkExtensionViewController];
    [v10 quitTurnBasedMatch:*p_match];
  }
  else
  {
    v11 = [(GKTurnBasedMatch *)*p_match localPlayerParticipant];
    uint64_t v12 = [v11 status];

    if (v12 == 4)
    {
      v13 = *v5;
      if (!*v5)
      {
        id v14 = (id)GKOSLoggers();
        v13 = *v5;
      }
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        -[GKDashboardTurnDetailViewController quitMatch:]((void **)&self->_match, v13);
      }
    }
    v15 = *p_match;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __49__GKDashboardTurnDetailViewController_quitMatch___block_invoke;
    v16[3] = &unk_1E5F63240;
    v16[4] = self;
    [(GKTurnBasedMatch *)v15 participantQuitOutOfTurnWithOutcome:1 withCompletionHandler:v16];
  }
}

uint64_t __49__GKDashboardTurnDetailViewController_quitMatch___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) refreshPresenter];
  id v2 = *(void **)(a1 + 32);

  return [v2 _gkRemoveViewController:v2 animated:1];
}

- (void)removeMatch:(id)a3
{
  id v4 = a3;
  if (!*MEMORY[0x1E4F63860]) {
    id v5 = (id)GKOSLoggers();
  }
  id v6 = *MEMORY[0x1E4F63870];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63870], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AF250000, v6, OS_LOG_TYPE_INFO, "removeMatch", buf, 2u);
  }
  [(GKDashboardTurnDetailViewController *)self disableButtons];
  match = self->_match;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __51__GKDashboardTurnDetailViewController_removeMatch___block_invoke;
  v8[3] = &unk_1E5F63240;
  v8[4] = self;
  [(GKTurnBasedMatch *)match removeWithCompletionHandler:v8];
}

uint64_t __51__GKDashboardTurnDetailViewController_removeMatch___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) refreshPresenter];
  id v2 = *(void **)(a1 + 32);

  return [v2 _gkRemoveViewController:v2 animated:1];
}

- (void)turnOK:(id)a3
{
}

- (void)handleTurnBasedEvent:(id)a3
{
  id v4 = [a3 object];
  id v5 = [(GKTurnBasedMatch *)self->_match matchID];
  int v6 = [v4 isEqualToString:v5];

  if (v6)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __60__GKDashboardTurnDetailViewController_handleTurnBasedEvent___block_invoke;
    block[3] = &unk_1E5F62EB0;
    block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __60__GKDashboardTurnDetailViewController_handleTurnBasedEvent___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) refreshPresenter];
  id v2 = *(void **)(a1 + 32);

  return [v2 _gkRemoveViewController:v2 animated:1];
}

- (GKTurnBasedMatch)match
{
  return self->_match;
}

- (void)setMatch:(id)a3
{
}

- (BOOL)shouldShowPlay
{
  return self->_shouldShowPlay;
}

- (void)setShouldShowPlay:(BOOL)a3
{
  self->_BOOL shouldShowPlay = a3;
}

- (BOOL)shouldShowQuit
{
  return self->_shouldShowQuit;
}

- (void)setShouldShowQuit:(BOOL)a3
{
  self->_shouldShowQuit = a3;
}

- (UIView)contentVerticalCenteringView
{
  return self->_contentVerticalCenteringView;
}

- (void)setContentVerticalCenteringView:(id)a3
{
  self->_contentVerticalCenteringView = (UIView *)a3;
}

- (UIView)turnDetailContentView
{
  return self->_turnDetailContentView;
}

- (void)setTurnDetailContentView:(id)a3
{
  self->_turnDetailContentView = (UIView *)a3;
}

- (UILabel)playingWithLabel
{
  return self->_playingWithLabel;
}

- (void)setPlayingWithLabel:(id)a3
{
  self->_playingWithLabel = (UILabel *)a3;
}

- (UILabel)createdLabel
{
  return self->_createdLabel;
}

- (void)setCreatedLabel:(id)a3
{
  self->_createdLabel = (UILabel *)a3;
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

- (NSLayoutConstraint)secondButtonCenteringConstraint
{
  return self->_secondButtonCenteringConstraint;
}

- (void)setSecondButtonCenteringConstraint:(id)a3
{
  self->_secondButtonCenteringConstraint = (NSLayoutConstraint *)a3;
}

- (void).cxx_destruct
{
}

- (void)quitMatch:(void *)a1 .cold.1(void **a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = *a1;
  id v4 = a2;
  id v5 = [v3 localPlayerParticipant];
  int v6 = *a1;
  int v7 = 138412546;
  v8 = v5;
  __int16 v9 = 2112;
  objc_super v10 = v6;
  _os_log_debug_impl(&dword_1AF250000, v4, OS_LOG_TYPE_DEBUG, "localParticipant: %@ has unexpected status for being active in match: %@", (uint8_t *)&v7, 0x16u);
}

@end