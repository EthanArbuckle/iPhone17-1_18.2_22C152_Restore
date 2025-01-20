@interface BPSWelcomeOptinViewController
+ (id)expressModeSettingsItem:(id)a3;
- (BOOL)hasDetailText;
- (BOOL)hasFinishedLoadingView;
- (BOOL)isDisplayingInSkippedMiniFlow;
- (BOOL)showAlternateButton;
- (BOOL)showOkayButton;
- (BOOL)showSuggestedButton;
- (BOOL)useBridgeStyling;
- (BOOL)wantsAlternateChoicePillButton;
- (BOOL)wantsAlternateChoiceSystemButton;
- (BOOL)wantsFollowUpNotification;
- (BOOL)wantsInternalFPOLabel;
- (BOOL)wantsLearnMoreButton;
- (BOOL)wantsLightenBlendedScreen;
- (BOOL)wantsOkayPillButton;
- (BOOL)wantsSuggestedChoiceLinkButton;
- (BOOL)wantsSuggestedChoicePillButton;
- (BOOL)wantsToShowWatchHW;
- (BPSBuddyControllerDelegate)delegate;
- (BPSIllustratedWatchView)illustratedWatchView;
- (BPSWatchView)watchView;
- (BPSWelcomeOptinViewController)init;
- (NSLayoutConstraint)watchViewBottomConstraint;
- (NSUserActivity)tapToRadarActivity;
- (OBHeaderAccessoryButton)learnMoreButton;
- (OBTrayButton)alternateChoiceButton;
- (OBTrayButton)okayButton;
- (OBTrayButton)suggestedChoiceButton;
- (id)_baseIdentifier;
- (id)alternateButtonTitle;
- (id)captionText;
- (id)detailAtrributedString;
- (id)detailString;
- (id)detailTitleString;
- (id)followUpActions;
- (id)followUpIdentifier;
- (id)imageResource;
- (id)imageResourceBundleIdentifier;
- (id)imageTintColor;
- (id)learnMoreButtonTitle;
- (id)localizedInformativeText;
- (id)localizedTitle;
- (id)okayButtonTitle;
- (id)optinLocalizationBundle;
- (id)optinLocalizationStringsFile;
- (id)privacyBundles;
- (id)suggestedButtonTitle;
- (id)tapToRadarMetadata;
- (id)titleAttributedString;
- (id)titleString;
- (unint64_t)style;
- (void)_addButtonObservers;
- (void)_didTapPrivacyAccept:(id)a3;
- (void)_endTapToRadarActivity;
- (void)_refreshButtonTray;
- (void)_removeButtonObservers;
- (void)_startTapToRadarActivity;
- (void)addFollowUpForPageAndDevice:(id)a3 withCompletion:(id)a4;
- (void)addFollowUpForPageWithCompletion:(id)a3;
- (void)alternateButtonPressed:(id)a3;
- (void)applyConfirmedOptin:(BOOL)a3;
- (void)dealloc;
- (void)learnMoreButtonPressed:(id)a3;
- (void)markPaneAsSkipped;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)okayButtonPressed:(id)a3;
- (void)openTapToRadar;
- (void)refreshViews;
- (void)removeFollowupForPageWithCompletion:(id)a3;
- (void)setAlternateChoiceButton:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHasDetailText:(BOOL)a3;
- (void)setHasFinishedLoadingView:(BOOL)a3;
- (void)setIllustratedWatchView:(id)a3;
- (void)setIsDisplayingInSkippedMiniFlow:(BOOL)a3;
- (void)setLearnMoreButton:(id)a3;
- (void)setOkayButton:(id)a3;
- (void)setShowAlternateButton:(BOOL)a3;
- (void)setShowOkayButton:(BOOL)a3;
- (void)setShowSuggestedButton:(BOOL)a3;
- (void)setStyle:(unint64_t)a3;
- (void)setSuggestedChoiceButton:(id)a3;
- (void)setTapToRadarActivity:(id)a3;
- (void)setWatchView:(id)a3;
- (void)setWatchViewBottomConstraint:(id)a3;
- (void)showOptinConfirmationAlert:(id)a3 optinChoice:(BOOL)a4;
- (void)suggestedButtonPressed:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation BPSWelcomeOptinViewController

- (BPSWelcomeOptinViewController)init
{
  v7.receiver = self;
  v7.super_class = (Class)BPSWelcomeOptinViewController;
  v2 = [(BPSWelcomeOptinViewController *)&v7 initWithTitle:&stru_26CCB36C8 detailText:0 icon:0 contentLayout:2];
  v3 = v2;
  if (v2
    && [(BPSWelcomeOptinViewController *)v2 wantsAlternateChoicePillButton]
    && [(BPSWelcomeOptinViewController *)v3 wantsAlternateChoiceSystemButton])
  {
    v4 = bps_setup_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_21C513000, v4, OS_LOG_TYPE_DEFAULT, "Declared CONFLICTING Alternate Button Choices! Choose either BPSWelcomeOptinLayoutStyleAlternateChoicePillButton or BPSWelcomeOptinLayoutStyleAlternateChoiceSystemButton", v6, 2u);
    }
  }
  return v3;
}

- (void)dealloc
{
  [(BPSWelcomeOptinViewController *)self _removeButtonObservers];
  v3.receiver = self;
  v3.super_class = (Class)BPSWelcomeOptinViewController;
  [(BPSWelcomeOptinViewController *)&v3 dealloc];
}

- (BOOL)wantsLightenBlendedScreen
{
  return 0;
}

- (id)suggestedButtonTitle
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  if ([(BPSWelcomeOptinViewController *)self wantsSuggestedChoicePillButton]
    || [(BPSWelcomeOptinViewController *)self wantsSuggestedChoiceLinkButton])
  {
    objc_super v3 = bps_setup_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315138;
      v6 = "-[BPSWelcomeOptinViewController suggestedButtonTitle]";
      _os_log_impl(&dword_21C513000, v3, OS_LOG_TYPE_DEFAULT, "Wants Suggested Choice Button so %s should be overridden by subclasses", (uint8_t *)&v5, 0xCu);
    }
  }
  return 0;
}

- (id)alternateButtonTitle
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  if ([(BPSWelcomeOptinViewController *)self wantsAlternateChoicePillButton]
    || [(BPSWelcomeOptinViewController *)self wantsAlternateChoiceSystemButton])
  {
    objc_super v3 = bps_setup_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315138;
      v6 = "-[BPSWelcomeOptinViewController alternateButtonTitle]";
      _os_log_impl(&dword_21C513000, v3, OS_LOG_TYPE_DEFAULT, "Wants Alternate Choice Button so %s should be overridden by subclasses", (uint8_t *)&v5, 0xCu);
    }
  }
  return 0;
}

- (id)learnMoreButtonTitle
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  if ([(BPSWelcomeOptinViewController *)self wantsLearnMoreButton])
  {
    v2 = bps_setup_log();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 136315138;
      int v5 = "-[BPSWelcomeOptinViewController learnMoreButtonTitle]";
      _os_log_impl(&dword_21C513000, v2, OS_LOG_TYPE_DEFAULT, "Wants Learn More Button so %s should be overridden by subclasses", (uint8_t *)&v4, 0xCu);
    }
  }
  return 0;
}

- (id)okayButtonTitle
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  if ([(BPSWelcomeOptinViewController *)self wantsOkayPillButton])
  {
    v2 = bps_setup_log();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 136315138;
      int v5 = "-[BPSWelcomeOptinViewController okayButtonTitle]";
      _os_log_impl(&dword_21C513000, v2, OS_LOG_TYPE_DEFAULT, "Wants OkayPillButton Button so %s should be overridden by subclasses", (uint8_t *)&v4, 0xCu);
    }
  }
  return 0;
}

- (void)suggestedButtonPressed:(id)a3
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  if ([(BPSWelcomeOptinViewController *)self wantsSuggestedChoicePillButton]
    || [(BPSWelcomeOptinViewController *)self wantsSuggestedChoiceLinkButton])
  {
    int v4 = bps_setup_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315138;
      uint64_t v6 = "-[BPSWelcomeOptinViewController suggestedButtonPressed:]";
      _os_log_impl(&dword_21C513000, v4, OS_LOG_TYPE_DEFAULT, "Wants Suggested Choice Button so %s should be overridden by subclasses", (uint8_t *)&v5, 0xCu);
    }
  }
}

- (void)alternateButtonPressed:(id)a3
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  if ([(BPSWelcomeOptinViewController *)self wantsAlternateChoicePillButton]
    && [(BPSWelcomeOptinViewController *)self wantsAlternateChoiceSystemButton])
  {
    int v4 = bps_setup_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315138;
      uint64_t v6 = "-[BPSWelcomeOptinViewController alternateButtonPressed:]";
      _os_log_impl(&dword_21C513000, v4, OS_LOG_TYPE_DEFAULT, "Wants Alternate Choice Button so %s should be overridden by subclasses", (uint8_t *)&v5, 0xCu);
    }
  }
}

- (void)learnMoreButtonPressed:(id)a3
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  if ([(BPSWelcomeOptinViewController *)self wantsLearnMoreButton])
  {
    objc_super v3 = bps_setup_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 136315138;
      int v5 = "-[BPSWelcomeOptinViewController learnMoreButtonPressed:]";
      _os_log_impl(&dword_21C513000, v3, OS_LOG_TYPE_DEFAULT, "Wants Learn More Button so %s should be overridden by subclasses", (uint8_t *)&v4, 0xCu);
    }
  }
}

- (void)okayButtonPressed:(id)a3
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  if ([(BPSWelcomeOptinViewController *)self wantsOkayPillButton])
  {
    objc_super v3 = bps_setup_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 136315138;
      int v5 = "-[BPSWelcomeOptinViewController okayButtonPressed:]";
      _os_log_impl(&dword_21C513000, v3, OS_LOG_TYPE_DEFAULT, "Wants OkayPillButton Button so %s should be overridden by subclasses", (uint8_t *)&v4, 0xCu);
    }
  }
}

- (BOOL)wantsInternalFPOLabel
{
  return 0;
}

- (id)titleString
{
  return 0;
}

- (id)titleAttributedString
{
  return 0;
}

- (id)detailTitleString
{
  return 0;
}

- (id)detailString
{
  return 0;
}

- (id)detailAtrributedString
{
  return 0;
}

- (id)imageResource
{
  return 0;
}

- (id)imageResourceBundleIdentifier
{
  return 0;
}

- (id)captionText
{
  return 0;
}

- (id)privacyBundles
{
  return 0;
}

- (void)viewDidLoad
{
  uint64_t v63 = *MEMORY[0x263EF8340];
  v60.receiver = self;
  v60.super_class = (Class)BPSWelcomeOptinViewController;
  [(OBBaseWelcomeController *)&v60 viewDidLoad];
  objc_super v3 = [(BPSWelcomeOptinViewController *)self headerView];
  LODWORD(v4) = 1036831949;
  [v3 setTitleHyphenationFactor:v4];

  if ([(BPSWelcomeOptinViewController *)self wantsToShowWatchHW])
  {
    int v5 = [BPSIllustratedWatchView alloc];
    uint64_t v6 = -[BPSIllustratedWatchView initWithFrame:](v5, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    illustratedWatchView = self->_illustratedWatchView;
    self->_illustratedWatchView = v6;

    v8 = [(BPSWelcomeOptinViewController *)self contentView];
    [v8 addSubview:self->_illustratedWatchView];

    [(BPSIllustratedWatchView *)self->_illustratedWatchView setTranslatesAutoresizingMaskIntoConstraints:0];
    v9 = [(BPSIllustratedWatchView *)self->_illustratedWatchView topAnchor];
    v10 = [(BPSWelcomeOptinViewController *)self contentView];
    v11 = [v10 topAnchor];
    v12 = [v9 constraintEqualToAnchor:v11];
    [v12 setActive:1];

    v13 = [(BPSIllustratedWatchView *)self->_illustratedWatchView bottomAnchor];
    v14 = [(BPSWelcomeOptinViewController *)self contentView];
    v15 = [v14 bottomAnchor];
    v16 = [v13 constraintEqualToAnchor:v15];
    watchViewBottomConstraint = self->_watchViewBottomConstraint;
    self->_watchViewBottomConstraint = v16;

    [(NSLayoutConstraint *)self->_watchViewBottomConstraint setActive:1];
    v18 = [(BPSIllustratedWatchView *)self->_illustratedWatchView centerXAnchor];
    v19 = [(BPSWelcomeOptinViewController *)self view];
    v20 = [v19 centerXAnchor];
    v21 = [v18 constraintEqualToAnchor:v20];
    [v21 setActive:1];
  }
  v59[0] = MEMORY[0x263EF8330];
  v59[1] = 3221225472;
  v59[2] = __44__BPSWelcomeOptinViewController_viewDidLoad__block_invoke;
  v59[3] = &unk_264408AA8;
  v59[4] = self;
  v22 = (void (**)(void, void))MEMORY[0x21D4A9390](v59);
  v23 = [(BPSWelcomeOptinViewController *)self suggestedButtonTitle];
  if (v23 || [(BPSWelcomeOptinViewController *)self wantsSuggestedChoicePillButton])
  {
  }
  else if (![(BPSWelcomeOptinViewController *)self wantsSuggestedChoiceLinkButton])
  {
    char v31 = 0;
    goto LABEL_12;
  }
  BOOL v24 = [(BPSWelcomeOptinViewController *)self wantsSuggestedChoicePillButton];
  if (v24)
  {
    v25 = [MEMORY[0x263F5B898] boldButton];
    [(BPSWelcomeOptinViewController *)self setSuggestedChoiceButton:v25];

    v26 = [(BPSWelcomeOptinViewController *)self suggestedChoiceButton];
    ((void (**)(void, void *))v22)[2](v22, v26);
  }
  else
  {
    v26 = [MEMORY[0x263F5B8D0] linkButton];
    [(BPSWelcomeOptinViewController *)self setSuggestedChoiceButton:v26];
  }

  v27 = [(BPSWelcomeOptinViewController *)self privacyBundles];
  uint64_t v28 = [v27 count];

  if (v28)
  {
    v29 = [(BPSWelcomeOptinViewController *)self suggestedChoiceButton];
    [v29 addTarget:self action:sel__didTapPrivacyAccept_ forEvents:64];
  }
  v30 = [(BPSWelcomeOptinViewController *)self suggestedChoiceButton];
  [v30 addTarget:self action:sel_suggestedButtonPressed_ forControlEvents:64];

  char v31 = !v24;
LABEL_12:
  v32 = [(BPSWelcomeOptinViewController *)self alternateButtonTitle];
  if (v32 || [(BPSWelcomeOptinViewController *)self wantsAlternateChoicePillButton])
  {
  }
  else if (![(BPSWelcomeOptinViewController *)self wantsAlternateChoiceSystemButton])
  {
    goto LABEL_20;
  }
  if ((v31 & 1) != 0
    || ![(BPSWelcomeOptinViewController *)self wantsAlternateChoicePillButton])
  {
    v34 = [MEMORY[0x263F5B8D0] linkButton];
    [(BPSWelcomeOptinViewController *)self setAlternateChoiceButton:v34];
    char v35 = 1;
  }
  else
  {
    v33 = [MEMORY[0x263F5B898] boldButton];
    [(BPSWelcomeOptinViewController *)self setAlternateChoiceButton:v33];

    v34 = [(BPSWelcomeOptinViewController *)self alternateChoiceButton];
    ((void (**)(void, void *))v22)[2](v22, v34);
    char v35 = 0;
  }

  v36 = [(BPSWelcomeOptinViewController *)self alternateChoiceButton];
  [v36 addTarget:self action:sel_alternateButtonPressed_ forControlEvents:64];

  v31 |= v35;
LABEL_20:
  v37 = [(BPSWelcomeOptinViewController *)self okayButtonTitle];
  if (v37)
  {

    goto LABEL_23;
  }
  if ([(BPSWelcomeOptinViewController *)self wantsOkayPillButton])
  {
LABEL_23:
    v38 = [(BPSWelcomeOptinViewController *)self suggestedChoiceButton];
    if (v38)
    {
    }
    else
    {
      v39 = [(BPSWelcomeOptinViewController *)self alternateChoiceButton];

      if (v39) {
        char v40 = 1;
      }
      else {
        char v40 = v31;
      }
      if ((v40 & 1) == 0 && [(BPSWelcomeOptinViewController *)self wantsOkayPillButton])
      {
        v41 = [MEMORY[0x263F5B898] boldButton];
        [(BPSWelcomeOptinViewController *)self setOkayButton:v41];

        v42 = [(BPSWelcomeOptinViewController *)self okayButton];
        ((void (**)(void, void *))v22)[2](v22, v42);
LABEL_32:

        v43 = [(BPSWelcomeOptinViewController *)self okayButton];
        [v43 addTarget:self action:sel_okayButtonPressed_ forControlEvents:64];

        goto LABEL_33;
      }
    }
    v42 = [MEMORY[0x263F5B8D0] linkButton];
    [(BPSWelcomeOptinViewController *)self setOkayButton:v42];
    goto LABEL_32;
  }
LABEL_33:
  [(BPSWelcomeOptinViewController *)self refreshViews];
  uint64_t v44 = [(BPSWelcomeOptinViewController *)self learnMoreButtonTitle];
  if (v44)
  {
    v45 = (void *)v44;
    BOOL v46 = [(BPSWelcomeOptinViewController *)self wantsLearnMoreButton];

    if (v46)
    {
      if ([(BPSWelcomeOptinViewController *)self hasDetailText])
      {
        v47 = [MEMORY[0x263F5B8B8] accessoryButton];
        [(BPSWelcomeOptinViewController *)self setLearnMoreButton:v47];

        v48 = [(BPSWelcomeOptinViewController *)self learnMoreButton];
        v49 = [(BPSWelcomeOptinViewController *)self learnMoreButtonTitle];
        [v48 setTitle:v49 forState:0];

        v50 = [(BPSWelcomeOptinViewController *)self learnMoreButton];
        [v50 addTarget:self action:sel_learnMoreButtonPressed_ forControlEvents:64];

        v51 = [(BPSWelcomeOptinViewController *)self headerView];
        v52 = [(BPSWelcomeOptinViewController *)self learnMoreButton];
        [v51 addAccessoryButton:v52];
      }
      else
      {
        v51 = bps_setup_log();
        if (!os_log_type_enabled(v51, OS_LOG_TYPE_ERROR) || !os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_45;
        }
        v53 = (objc_class *)objc_opt_class();
        v52 = NSStringFromClass(v53);
        *(_DWORD *)buf = 138412290;
        v62 = v52;
        _os_log_impl(&dword_21C513000, v51, OS_LOG_TYPE_DEFAULT, "Error: %@ wants learnMoreButton but no detail text was provided, this is not supported", buf, 0xCu);
      }

LABEL_45:
    }
  }
  v54 = [(BPSWelcomeOptinViewController *)self privacyBundles];
  uint64_t v55 = [v54 count];

  if (v55)
  {
    v56 = [(BPSWelcomeOptinViewController *)self buttonTray];
    v57 = [(BPSWelcomeOptinViewController *)self privacyBundles];
    [v56 addPrivacyLinkForBundles:v57];
LABEL_50:

    goto LABEL_51;
  }
  v58 = [(BPSWelcomeOptinViewController *)self captionText];

  if (v58)
  {
    v56 = [(BPSWelcomeOptinViewController *)self buttonTray];
    v57 = [(BPSWelcomeOptinViewController *)self captionText];
    [v56 addCaptionText:v57];
    goto LABEL_50;
  }
LABEL_51:
  [(BPSWelcomeOptinViewController *)self _addButtonObservers];
  self->_hasFinishedLoadingView = 1;
}

void __44__BPSWelcomeOptinViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  if ([*(id *)(a1 + 32) useBridgeStyling])
  {
    objc_super v3 = BPSPillSelectedColor();
    [v7 setTintColor:v3];

    double v4 = BPSPillDeselectedColor();
    int v5 = BPSPillButtonBackground(v4);
    [v7 setBackgroundImage:v5 forState:2];

    uint64_t v6 = [MEMORY[0x263F1C550] colorWithWhite:0.7 alpha:1.0];
    [v7 setTitleColor:v6 forState:2];
  }
}

- (void)refreshViews
{
  if (![(BPSWelcomeOptinViewController *)self isViewLoaded]) {
    return;
  }
  objc_super v3 = [(BPSWelcomeOptinViewController *)self headerView];
  double v4 = [(BPSWelcomeOptinViewController *)self titleString];
  [v3 setTitle:v4];

  int v5 = [(BPSWelcomeOptinViewController *)self detailString];
  uint64_t v6 = v5;
  if (v5)
  {
    id v35 = v5;
  }
  else
  {
    id v7 = [(BPSWelcomeOptinViewController *)self detailAtrributedString];
    id v35 = [v7 string];
  }
  v8 = [(BPSWelcomeOptinViewController *)self headerView];
  [v8 setDetailText:v35];

  [(BPSWelcomeOptinViewController *)self setHasDetailText:v35 != 0];
  v9 = [(BPSWelcomeOptinViewController *)self view];
  [v9 layoutIfNeeded];

  v10 = [(BPSWelcomeOptinViewController *)self suggestedChoiceButton];
  v11 = [(BPSWelcomeOptinViewController *)self suggestedButtonTitle];
  [v10 setTitle:v11 forState:0];

  v12 = [(BPSWelcomeOptinViewController *)self alternateChoiceButton];
  v13 = [(BPSWelcomeOptinViewController *)self alternateButtonTitle];
  [v12 setTitle:v13 forState:0];

  v14 = [(BPSWelcomeOptinViewController *)self okayButton];
  v15 = [(BPSWelcomeOptinViewController *)self okayButtonTitle];
  [v14 setTitle:v15 forState:0];

  [(BPSWelcomeOptinViewController *)self _refreshButtonTray];
  if ([(BPSWelcomeOptinViewController *)self wantsToShowWatchHW])
  {
    v16 = [(BPSWelcomeOptinViewController *)self imageResource];

    if (v16)
    {
      illustratedWatchView = self->_illustratedWatchView;
      v18 = [(BPSWelcomeOptinViewController *)self imageResourceBundleIdentifier];
      [(BPSIllustratedWatchView *)illustratedWatchView setScreenImageSearchBundleIdentifier:v18];

      v19 = self->_illustratedWatchView;
      v20 = [(BPSWelcomeOptinViewController *)self imageResource];
      [(BPSIllustratedWatchView *)v19 setScreenImageName:v20];
LABEL_17:

      goto LABEL_18;
    }
  }
  v21 = [(BPSWelcomeOptinViewController *)self imageResource];

  if (v21)
  {
    v20 = [MEMORY[0x263F086E0] mainBundle];
    v22 = [(BPSWelcomeOptinViewController *)self imageResourceBundleIdentifier];

    if (v22)
    {
      v23 = (void *)MEMORY[0x263F086E0];
      BOOL v24 = [(BPSWelcomeOptinViewController *)self imageResourceBundleIdentifier];
      uint64_t v25 = [v23 bundleWithIdentifier:v24];

      v20 = (void *)v25;
    }
    v26 = (void *)MEMORY[0x263F1C6B0];
    v27 = [(BPSWelcomeOptinViewController *)self imageResource];
    uint64_t v28 = [v26 imageNamed:v27 inBundle:v20];

    if (!v28)
    {
      v29 = (void *)MEMORY[0x263F1C6B0];
      v30 = [(BPSWelcomeOptinViewController *)self imageResource];
      uint64_t v28 = [v29 systemImageNamed:v30];
    }
    char v31 = [(BPSWelcomeOptinViewController *)self imageTintColor];

    if (v31)
    {
      v32 = [(BPSWelcomeOptinViewController *)self imageTintColor];
      uint64_t v33 = [v28 imageWithTintColor:v32];

      uint64_t v28 = (void *)v33;
    }
    v34 = [(BPSWelcomeOptinViewController *)self headerView];
    [v34 setIcon:v28 accessibilityLabel:0];

    goto LABEL_17;
  }
LABEL_18:
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)BPSWelcomeOptinViewController;
  [(OBBaseWelcomeController *)&v4 viewDidAppear:a3];
  [(BPSWelcomeOptinViewController *)self _startTapToRadarActivity];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)BPSWelcomeOptinViewController;
  [(BPSWelcomeOptinViewController *)&v4 viewWillDisappear:a3];
  [(BPSWelcomeOptinViewController *)self _endTapToRadarActivity];
}

- (void)_addButtonObservers
{
  objc_super v3 = [(BPSWelcomeOptinViewController *)self suggestedChoiceButton];
  [v3 addObserver:self forKeyPath:@"hidden" options:1 context:BPSWelcomeOptinViewControllerKVOContext];

  objc_super v4 = [(BPSWelcomeOptinViewController *)self alternateChoiceButton];
  [v4 addObserver:self forKeyPath:@"hidden" options:1 context:BPSWelcomeOptinViewControllerKVOContext];

  id v5 = [(BPSWelcomeOptinViewController *)self okayButton];
  [v5 addObserver:self forKeyPath:@"hidden" options:1 context:BPSWelcomeOptinViewControllerKVOContext];
}

- (void)_removeButtonObservers
{
  objc_super v3 = [(BPSWelcomeOptinViewController *)self suggestedChoiceButton];
  [v3 removeObserver:self forKeyPath:@"hidden"];

  objc_super v4 = [(BPSWelcomeOptinViewController *)self alternateChoiceButton];
  [v4 removeObserver:self forKeyPath:@"hidden"];

  id v5 = [(BPSWelcomeOptinViewController *)self okayButton];
  [v5 removeObserver:self forKeyPath:@"hidden"];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if ((void *)BPSWelcomeOptinViewControllerKVOContext == a6)
  {
    if (objc_msgSend(@"hidden", "isEqualToString:", a3, a4, a5))
    {
      [(BPSWelcomeOptinViewController *)self _refreshButtonTray];
    }
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)BPSWelcomeOptinViewController;
    -[BPSWelcomeOptinViewController observeValueForKeyPath:ofObject:change:context:](&v7, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

- (void)_refreshButtonTray
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  objc_super v3 = [(BPSWelcomeOptinViewController *)self suggestedButtonTitle];
  if (v3
    && ([(BPSWelcomeOptinViewController *)self wantsSuggestedChoicePillButton]
     || [(BPSWelcomeOptinViewController *)self wantsSuggestedChoiceLinkButton]))
  {
    objc_super v4 = [(BPSWelcomeOptinViewController *)self suggestedChoiceButton];
    uint64_t v5 = [v4 isHidden] ^ 1;
  }
  else
  {
    uint64_t v5 = 0;
  }

  uint64_t v6 = [(BPSWelcomeOptinViewController *)self alternateButtonTitle];
  if (v6
    && ([(BPSWelcomeOptinViewController *)self wantsAlternateChoiceSystemButton]
     || [(BPSWelcomeOptinViewController *)self wantsAlternateChoicePillButton]))
  {
    objc_super v7 = [(BPSWelcomeOptinViewController *)self alternateChoiceButton];
    uint64_t v8 = [v7 isHidden] ^ 1;
  }
  else
  {
    uint64_t v8 = 0;
  }

  v9 = [(BPSWelcomeOptinViewController *)self okayButtonTitle];
  if (v9 && [(BPSWelcomeOptinViewController *)self wantsOkayPillButton])
  {
    v10 = [(BPSWelcomeOptinViewController *)self okayButton];
    uint64_t v11 = [v10 isHidden] ^ 1;
  }
  else
  {
    uint64_t v11 = 0;
  }

  if (v5 == [(BPSWelcomeOptinViewController *)self showSuggestedButton]
    && v8 == [(BPSWelcomeOptinViewController *)self showAlternateButton]
    && v11 == [(BPSWelcomeOptinViewController *)self showOkayButton]
    && self->_hasFinishedLoadingView)
  {
    goto LABEL_50;
  }
  v12 = [(BPSWelcomeOptinViewController *)self suggestedChoiceButton];
  v13 = [v12 superview];

  if (v13)
  {
    v14 = [(BPSWelcomeOptinViewController *)self buttonTray];
    v15 = [(BPSWelcomeOptinViewController *)self suggestedChoiceButton];
    [v14 removeButton:v15];
  }
  v16 = [(BPSWelcomeOptinViewController *)self alternateChoiceButton];
  v17 = [v16 superview];

  if (v17)
  {
    v18 = [(BPSWelcomeOptinViewController *)self buttonTray];
    v19 = [(BPSWelcomeOptinViewController *)self alternateChoiceButton];
    [v18 removeButton:v19];
  }
  v20 = [(BPSWelcomeOptinViewController *)self okayButton];
  v21 = [v20 superview];

  if (v21)
  {
    v22 = [(BPSWelcomeOptinViewController *)self buttonTray];
    v23 = [(BPSWelcomeOptinViewController *)self okayButton];
    [v22 removeButton:v23];
  }
  if (!v5)
  {
    if (!v8) {
      goto LABEL_27;
    }
    goto LABEL_36;
  }
  BOOL v24 = [(BPSWelcomeOptinViewController *)self suggestedChoiceButton];

  if (v24)
  {
    uint64_t v25 = [(BPSWelcomeOptinViewController *)self buttonTray];
    v26 = [(BPSWelcomeOptinViewController *)self suggestedChoiceButton];
    [v25 addButton:v26];
LABEL_31:

    goto LABEL_35;
  }
  uint64_t v25 = bps_setup_log();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    v27 = (objc_class *)objc_opt_class();
    v26 = NSStringFromClass(v27);
    int v36 = 138412290;
    v37 = v26;
    _os_log_impl(&dword_21C513000, v25, OS_LOG_TYPE_DEFAULT, "Error: %@ wants suggestedChoiceButton but none was initialized", (uint8_t *)&v36, 0xCu);
    goto LABEL_31;
  }
LABEL_35:

  if (!v8)
  {
LABEL_27:
    if (!v11) {
      goto LABEL_50;
    }
LABEL_43:
    v32 = [(BPSWelcomeOptinViewController *)self okayButton];

    if (v32)
    {
      uint64_t v33 = [(BPSWelcomeOptinViewController *)self buttonTray];
      v34 = [(BPSWelcomeOptinViewController *)self okayButton];
      [v33 addButton:v34];
    }
    else
    {
      uint64_t v33 = bps_setup_log();
      if (!os_log_type_enabled(v33, OS_LOG_TYPE_ERROR) || !os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_49;
      }
      id v35 = (objc_class *)objc_opt_class();
      v34 = NSStringFromClass(v35);
      int v36 = 138412290;
      v37 = v34;
      _os_log_impl(&dword_21C513000, v33, OS_LOG_TYPE_DEFAULT, "Error: %@ wants okayButton but none was initialized", (uint8_t *)&v36, 0xCu);
    }

LABEL_49:
    goto LABEL_50;
  }
LABEL_36:
  uint64_t v28 = [(BPSWelcomeOptinViewController *)self alternateChoiceButton];

  if (v28)
  {
    v29 = [(BPSWelcomeOptinViewController *)self buttonTray];
    v30 = [(BPSWelcomeOptinViewController *)self alternateChoiceButton];
    [v29 addButton:v30];
LABEL_38:

    goto LABEL_42;
  }
  v29 = bps_setup_log();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    char v31 = (objc_class *)objc_opt_class();
    v30 = NSStringFromClass(v31);
    int v36 = 138412290;
    v37 = v30;
    _os_log_impl(&dword_21C513000, v29, OS_LOG_TYPE_DEFAULT, "Error: %@ wants alternateChoiceButton but none was initialized", (uint8_t *)&v36, 0xCu);
    goto LABEL_38;
  }
LABEL_42:

  if (v11) {
    goto LABEL_43;
  }
LABEL_50:
  [(BPSWelcomeOptinViewController *)self setShowSuggestedButton:v5];
  [(BPSWelcomeOptinViewController *)self setShowAlternateButton:v8];
  [(BPSWelcomeOptinViewController *)self setShowOkayButton:v11];
}

- (id)optinLocalizationStringsFile
{
  return @"OptinDescriptions";
}

- (id)optinLocalizationBundle
{
  return (id)[MEMORY[0x263F086E0] mainBundle];
}

- (id)localizedTitle
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v2 = bps_setup_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    uint64_t v5 = "-[BPSWelcomeOptinViewController localizedTitle]";
    _os_log_impl(&dword_21C513000, v2, OS_LOG_TYPE_DEFAULT, "%s should be overridden by subclasses", (uint8_t *)&v4, 0xCu);
  }

  return 0;
}

- (id)localizedInformativeText
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v2 = bps_setup_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    uint64_t v5 = "-[BPSWelcomeOptinViewController localizedInformativeText]";
    _os_log_impl(&dword_21C513000, v2, OS_LOG_TYPE_DEFAULT, "%s should be overridden by subclasses", (uint8_t *)&v4, 0xCu);
  }

  return 0;
}

- (void)showOptinConfirmationAlert:(id)a3 optinChoice:(BOOL)a4
{
  uint64_t v5 = NSString;
  id v6 = a3;
  uint64_t v7 = [v5 stringWithFormat:@"%@_ENABLE_ALERT_TITLE", v6];
  uint64_t v8 = [NSString stringWithFormat:@"%@_ENABLE_ALERT_BODY", v6];
  v29 = [NSString stringWithFormat:@"%@_ENABLE_ALERT_CANCEL", v6];
  v9 = [NSString stringWithFormat:@"%@_ENABLE_ALERT_OK", v6];

  v10 = (void *)MEMORY[0x263F1C3F8];
  uint64_t v11 = [(BPSWelcomeOptinViewController *)self optinLocalizationBundle];
  v12 = [(BPSWelcomeOptinViewController *)self optinLocalizationStringsFile];
  v32 = (void *)v7;
  v13 = [v11 localizedStringForKey:v7 value:&stru_26CCB36C8 table:v12];
  v14 = [(BPSWelcomeOptinViewController *)self optinLocalizationBundle];
  v15 = [(BPSWelcomeOptinViewController *)self optinLocalizationStringsFile];
  char v31 = (void *)v8;
  v16 = [v14 localizedStringForKey:v8 value:&stru_26CCB36C8 table:v15];
  v17 = [v10 alertControllerWithTitle:v13 message:v16 preferredStyle:1];

  v18 = (void *)MEMORY[0x263F1C3F0];
  v19 = [(BPSWelcomeOptinViewController *)self optinLocalizationBundle];
  v20 = [(BPSWelcomeOptinViewController *)self optinLocalizationStringsFile];
  v21 = [v19 localizedStringForKey:v29 value:&stru_26CCB36C8 table:v20];
  v22 = [v18 actionWithTitle:v21 style:1 handler:0];
  [v17 addAction:v22];

  v23 = (void *)MEMORY[0x263F1C3F0];
  BOOL v24 = [(BPSWelcomeOptinViewController *)self optinLocalizationBundle];
  uint64_t v25 = [(BPSWelcomeOptinViewController *)self optinLocalizationStringsFile];
  v26 = [v24 localizedStringForKey:v9 value:&stru_26CCB36C8 table:v25];
  v34[0] = MEMORY[0x263EF8330];
  v34[1] = 3221225472;
  v34[2] = __72__BPSWelcomeOptinViewController_showOptinConfirmationAlert_optinChoice___block_invoke;
  v34[3] = &unk_264408A58;
  v34[4] = self;
  BOOL v35 = a4;
  v27 = [v23 actionWithTitle:v26 style:0 handler:v34];
  [v17 addAction:v27];

  uint64_t v28 = bps_setup_log();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21C513000, v28, OS_LOG_TYPE_DEFAULT, "Presenting 'opt-in confirmation' alert", buf, 2u);
  }

  [(BPSWelcomeOptinViewController *)self presentViewController:v17 animated:1 completion:0];
}

uint64_t __72__BPSWelcomeOptinViewController_showOptinConfirmationAlert_optinChoice___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) applyConfirmedOptin:*(unsigned __int8 *)(a1 + 40)];
}

- (void)applyConfirmedOptin:(BOOL)a3
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  objc_super v3 = bps_setup_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    uint64_t v5 = "-[BPSWelcomeOptinViewController applyConfirmedOptin:]";
    _os_log_impl(&dword_21C513000, v3, OS_LOG_TYPE_DEFAULT, "%s should be overridden by subclasses", (uint8_t *)&v4, 0xCu);
  }
}

- (id)followUpIdentifier
{
  return 0;
}

- (BOOL)wantsFollowUpNotification
{
  return 0;
}

- (id)followUpActions
{
  return 0;
}

- (id)_baseIdentifier
{
  objc_super v3 = +[BPSFollowUpController baseDomainIdentifier];
  int v4 = [(BPSWelcomeOptinViewController *)self followUpIdentifier];
  if (v4)
  {
    uint64_t v5 = [NSString stringWithFormat:@"%@.%@", v3, v4];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (void)addFollowUpForPageAndDevice:(id)a3 withCompletion:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(BPSWelcomeOptinViewController *)self _baseIdentifier];
  if (v8)
  {
    v9 = [v6 valueForProperty:*MEMORY[0x263F57678]];
    v10 = [NSString stringWithFormat:@"%@.%@", v8, v9];
    uint64_t v11 = bps_setup_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v23 = v10;
      _os_log_impl(&dword_21C513000, v11, OS_LOG_TYPE_DEFAULT, "Add FollowUp for identifier %{public}@...", buf, 0xCu);
    }

    v12 = bps_setup_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v23 = v6;
      _os_log_impl(&dword_21C513000, v12, OS_LOG_TYPE_DEFAULT, "...for device: %{public}@", buf, 0xCu);
    }

    v20[0] = @"title";
    v13 = [(BPSWelcomeOptinViewController *)self localizedTitle];
    v21[0] = v13;
    v20[1] = @"description";
    v14 = [(BPSWelcomeOptinViewController *)self localizedInformativeText];
    v21[1] = v14;
    v20[2] = @"followUpActions";
    v15 = [(BPSWelcomeOptinViewController *)self followUpActions];
    v21[2] = v15;
    v16 = [NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:3];
    v17 = +[BPSFollowUpAttributes attributeWithOptions:v16];

    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __76__BPSWelcomeOptinViewController_addFollowUpForPageAndDevice_withCompletion___block_invoke;
    v18[3] = &unk_2644089C8;
    id v19 = v7;
    +[BPSFollowUpController addFollowUpForIdentifier:v10 withAttributes:v17 withCompletion:v18];
  }
  else
  {
    v9 = bps_setup_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21C513000, v9, OS_LOG_TYPE_DEFAULT, "Error!! Issuing a FollowUp requires dictating an identifier!", buf, 2u);
    }
  }
}

uint64_t __76__BPSWelcomeOptinViewController_addFollowUpForPageAndDevice_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)addFollowUpForPageWithCompletion:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(BPSWelcomeOptinViewController *)self _baseIdentifier];
  id v6 = bps_setup_log();
  id v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v17 = v5;
      _os_log_impl(&dword_21C513000, v7, OS_LOG_TYPE_DEFAULT, "Add Global FollowUp for %{public}@", buf, 0xCu);
    }

    v14[0] = @"title";
    uint64_t v8 = [(BPSWelcomeOptinViewController *)self localizedTitle];
    v15[0] = v8;
    v14[1] = @"description";
    v9 = [(BPSWelcomeOptinViewController *)self localizedInformativeText];
    v15[1] = v9;
    v14[2] = @"followUpActions";
    v10 = [(BPSWelcomeOptinViewController *)self followUpActions];
    v15[2] = v10;
    uint64_t v11 = [NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:3];
    id v7 = +[BPSFollowUpAttributes attributeWithOptions:v11];

    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __66__BPSWelcomeOptinViewController_addFollowUpForPageWithCompletion___block_invoke;
    v12[3] = &unk_2644089C8;
    id v13 = v4;
    +[BPSFollowUpController addFollowUpForIdentifier:v5 withAttributes:v7 withCompletion:v12];
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21C513000, v7, OS_LOG_TYPE_DEFAULT, "Error!! Issuing a FollowUp requires dictating an identifier!", buf, 2u);
  }
}

uint64_t __66__BPSWelcomeOptinViewController_addFollowUpForPageWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)removeFollowupForPageWithCompletion:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(BPSWelcomeOptinViewController *)self followUpIdentifier];
  id v6 = bps_setup_log();
  id v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v11 = v5;
      _os_log_impl(&dword_21C513000, v7, OS_LOG_TYPE_DEFAULT, "Remove identifier %{public}@", buf, 0xCu);
    }

    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __69__BPSWelcomeOptinViewController_removeFollowupForPageWithCompletion___block_invoke;
    v8[3] = &unk_2644089C8;
    v9 = v4;
    +[BPSFollowUpController removeFollowUpForIdentifier:v5 withCompletion:v8];
    id v7 = v9;
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21C513000, v7, OS_LOG_TYPE_DEFAULT, "Error!! Removing a FollowUp requires dictating an identifier!", buf, 2u);
  }
}

uint64_t __69__BPSWelcomeOptinViewController_removeFollowupForPageWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)markPaneAsSkipped
{
  if (![(BPSWelcomeOptinViewController *)self isDisplayingInSkippedMiniFlow])
  {
    uint64_t v2 = objc_opt_class();
    +[BPSFollowUpController markSkippedSetupPaneClassForCurrentDevice:v2];
  }
}

- (id)tapToRadarMetadata
{
  uint64_t v2 = [[BPSTTRMetadata alloc] initWithComponent:0];
  return v2;
}

- (void)openTapToRadar
{
  uint64_t v2 = [(BPSWelcomeOptinViewController *)self tapToRadarMetadata];
  if (v2)
  {
    +[BPSTapToRadarCoordinator openTapToRadarWithInitialMetadata:v2];
  }
  else
  {
    objc_super v3 = bps_setup_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl(&dword_21C513000, v3, OS_LOG_TYPE_DEFAULT, "Error!! Could not retrieve metadata for tap to radar!", v4, 2u);
    }
  }
}

- (void)_startTapToRadarActivity
{
  if (PBIsInternalInstall())
  {
    objc_super v3 = [(BPSWelcomeOptinViewController *)self tapToRadarMetadata];

    if (v3)
    {
      id v4 = [(BPSWelcomeOptinViewController *)self tapToRadarMetadata];
      uint64_t v5 = +[BPSTapToRadarCoordinator tapToRadarUserActivityWithInitialMetadata:v4];
      tapToRadarActivity = self->_tapToRadarActivity;
      self->_tapToRadarActivity = v5;

      id v7 = self->_tapToRadarActivity;
      if (v7)
      {
        [(NSUserActivity *)v7 becomeCurrent];
      }
      else
      {
        uint64_t v8 = bps_setup_log();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v9 = 0;
          _os_log_impl(&dword_21C513000, v8, OS_LOG_TYPE_DEFAULT, "Error: We're eligible to raise a TTR NSUserActivity but it could not be generated, so we're aborting.", v9, 2u);
        }
      }
    }
  }
}

- (void)_endTapToRadarActivity
{
  tapToRadarActivity = self->_tapToRadarActivity;
  if (tapToRadarActivity)
  {
    [(NSUserActivity *)tapToRadarActivity invalidate];
    id v4 = self->_tapToRadarActivity;
    self->_tapToRadarActivity = 0;
  }
}

- (void)_didTapPrivacyAccept:(id)a3
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v22 = a3;
  id v4 = [(BPSWelcomeOptinViewController *)self privacyBundles];

  if (v4)
  {
    uint64_t v5 = [(BPSWelcomeOptinViewController *)self delegate];
    id v23 = [v5 setupFlowUserInfo];

    id v6 = [v23 objectForKey:@"BPSPairingFlowIsTinkerPairing"];
    int v7 = [v6 BOOLValue];

    if (v7)
    {
      uint64_t v8 = [v23 objectForKey:@"BPSPairingFlowFamilyMember"];
      v9 = [v8 dsid];
      if (!v9
        || (objc_msgSend(MEMORY[0x263EFB210], "ams_sharedAccountStore"),
            v10 = objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v10, "ams_iTunesAccountWithDSID:", v9),
            uint64_t v11 = objc_claimAutoreleasedReturnValue(),
            v10,
            !v11))
      {
        uint64_t v12 = bps_setup_log();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21C513000, v12, OS_LOG_TYPE_DEFAULT, "Error acknowledging privacy bundle: alt account pairing but we could not map an alt ACAccount", buf, 2u);
        }

        uint64_t v11 = 0;
      }
    }
    else
    {
      id v13 = objc_alloc_init(MEMORY[0x263EFB210]);
      uint64_t v11 = objc_msgSend(v13, "aa_primaryAppleAccount");
    }
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id obj = [(BPSWelcomeOptinViewController *)self privacyBundles];
    uint64_t v14 = [obj countByEnumeratingWithState:&v26 objects:v39 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v27;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v27 != v15) {
            objc_enumerationMutation(obj);
          }
          uint64_t v17 = *(void *)(*((void *)&v26 + 1) + 8 * v16);
          uint64_t v35 = 0;
          int v36 = &v35;
          uint64_t v37 = 0x2050000000;
          uint64_t v18 = (void *)getAMSAcknowledgePrivacyTaskClass_softClass;
          uint64_t v38 = getAMSAcknowledgePrivacyTaskClass_softClass;
          if (!getAMSAcknowledgePrivacyTaskClass_softClass)
          {
            *(void *)buf = MEMORY[0x263EF8330];
            uint64_t v31 = 3221225472;
            v32 = __getAMSAcknowledgePrivacyTaskClass_block_invoke;
            uint64_t v33 = &unk_264408888;
            v34 = &v35;
            __getAMSAcknowledgePrivacyTaskClass_block_invoke((uint64_t)buf);
            uint64_t v18 = (void *)v36[3];
          }
          id v19 = v18;
          _Block_object_dispose(&v35, 8);
          v20 = (void *)[[v19 alloc] initWithPrivacyIdentifier:v17 account:v11];
          v21 = [v20 acknowledgePrivacy];
          v25[0] = MEMORY[0x263EF8330];
          v25[1] = 3221225472;
          v25[2] = __54__BPSWelcomeOptinViewController__didTapPrivacyAccept___block_invoke;
          v25[3] = &unk_264408AD0;
          v25[4] = v17;
          [v21 addFinishBlock:v25];

          ++v16;
        }
        while (v14 != v16);
        uint64_t v14 = [obj countByEnumeratingWithState:&v26 objects:v39 count:16];
      }
      while (v14);
    }
  }
}

void __54__BPSWelcomeOptinViewController__didTapPrivacyAccept___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = bps_setup_log();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v7)
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v11 = 138543362;
      uint64_t v12 = v8;
      _os_log_impl(&dword_21C513000, v6, OS_LOG_TYPE_DEFAULT, "Successfully acknowledged privacy for %{public}@", (uint8_t *)&v11, 0xCu);
    }
  }
  else if (v7)
  {
    uint64_t v9 = *(void *)(a1 + 32);
    v10 = [v5 localizedDescription];
    int v11 = 138543618;
    uint64_t v12 = v9;
    __int16 v13 = 2114;
    uint64_t v14 = v10;
    _os_log_impl(&dword_21C513000, v6, OS_LOG_TYPE_DEFAULT, "Error acknowledging privacy for %{public}@: %{public}@", (uint8_t *)&v11, 0x16u);
  }
}

+ (id)expressModeSettingsItem:(id)a3
{
  id v4 = a3;
  if (objc_opt_respondsToSelector())
  {
    id v5 = objc_opt_new();
    id v6 = [a1 expressModeSettingsString:v4];
    [v5 setTitle:v6];

    if (objc_opt_respondsToSelector())
    {
      BOOL v7 = [a1 imageForExpressSetting];
      [v5 setImage:v7];
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (BOOL)wantsSuggestedChoicePillButton
{
  return (LOBYTE(self->_style) >> 1) & 1;
}

- (BOOL)wantsSuggestedChoiceLinkButton
{
  return LOBYTE(self->_style) >> 7;
}

- (BOOL)wantsAlternateChoicePillButton
{
  return (LOBYTE(self->_style) >> 2) & 1;
}

- (BOOL)wantsAlternateChoiceSystemButton
{
  return (LOBYTE(self->_style) >> 3) & 1;
}

- (BOOL)wantsLearnMoreButton
{
  return (LOBYTE(self->_style) >> 4) & 1;
}

- (BOOL)wantsToShowWatchHW
{
  return (LOBYTE(self->_style) >> 6) & 1;
}

- (BOOL)wantsOkayPillButton
{
  return (LOBYTE(self->_style) >> 5) & 1;
}

- (id)imageTintColor
{
  return 0;
}

- (BOOL)useBridgeStyling
{
  return 1;
}

- (unint64_t)style
{
  return self->_style;
}

- (void)setStyle:(unint64_t)a3
{
  self->_style = a3;
}

- (BPSWatchView)watchView
{
  return self->_watchView;
}

- (void)setWatchView:(id)a3
{
}

- (BPSIllustratedWatchView)illustratedWatchView
{
  return self->_illustratedWatchView;
}

- (void)setIllustratedWatchView:(id)a3
{
}

- (BPSBuddyControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (BPSBuddyControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isDisplayingInSkippedMiniFlow
{
  return self->_isDisplayingInSkippedMiniFlow;
}

- (void)setIsDisplayingInSkippedMiniFlow:(BOOL)a3
{
  self->_isDisplayingInSkippedMiniFlow = a3;
}

- (OBTrayButton)suggestedChoiceButton
{
  return self->_suggestedChoiceButton;
}

- (void)setSuggestedChoiceButton:(id)a3
{
}

- (OBTrayButton)alternateChoiceButton
{
  return self->_alternateChoiceButton;
}

- (void)setAlternateChoiceButton:(id)a3
{
}

- (OBTrayButton)okayButton
{
  return self->_okayButton;
}

- (void)setOkayButton:(id)a3
{
}

- (OBHeaderAccessoryButton)learnMoreButton
{
  return self->_learnMoreButton;
}

- (void)setLearnMoreButton:(id)a3
{
}

- (NSLayoutConstraint)watchViewBottomConstraint
{
  return self->_watchViewBottomConstraint;
}

- (void)setWatchViewBottomConstraint:(id)a3
{
}

- (BOOL)showSuggestedButton
{
  return self->_showSuggestedButton;
}

- (void)setShowSuggestedButton:(BOOL)a3
{
  self->_showSuggestedButton = a3;
}

- (BOOL)showAlternateButton
{
  return self->_showAlternateButton;
}

- (void)setShowAlternateButton:(BOOL)a3
{
  self->_showAlternateButton = a3;
}

- (BOOL)showOkayButton
{
  return self->_showOkayButton;
}

- (void)setShowOkayButton:(BOOL)a3
{
  self->_showOkayButton = a3;
}

- (BOOL)hasFinishedLoadingView
{
  return self->_hasFinishedLoadingView;
}

- (void)setHasFinishedLoadingView:(BOOL)a3
{
  self->_hasFinishedLoadingView = a3;
}

- (BOOL)hasDetailText
{
  return self->_hasDetailText;
}

- (void)setHasDetailText:(BOOL)a3
{
  self->_hasDetailText = a3;
}

- (NSUserActivity)tapToRadarActivity
{
  return self->_tapToRadarActivity;
}

- (void)setTapToRadarActivity:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tapToRadarActivity, 0);
  objc_storeStrong((id *)&self->_watchViewBottomConstraint, 0);
  objc_storeStrong((id *)&self->_learnMoreButton, 0);
  objc_storeStrong((id *)&self->_okayButton, 0);
  objc_storeStrong((id *)&self->_alternateChoiceButton, 0);
  objc_storeStrong((id *)&self->_suggestedChoiceButton, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_illustratedWatchView, 0);
  objc_storeStrong((id *)&self->_watchView, 0);
}

@end