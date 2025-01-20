@interface HUCameraActivityZoneEditorViewController
- (BOOL)hasActivityZoneChanges;
- (BOOL)initialSettingDetectsInclusionZones;
- (HMCameraProfile)cameraProfile;
- (HUCameraActivityZoneCanvasView)activityZoneCanvas;
- (HUCameraActivityZoneEditorViewController)initWithCameraProfile:(id)a3;
- (HUCameraLiveStreamViewController)liveStreamViewController;
- (NSArray)initialActivityZones;
- (UILabel)tutorialLabel;
- (id)_addZoneButton;
- (void)_displayProgressIndicatorWhileLoading;
- (void)_refreshUI;
- (void)_updateNavigationBar;
- (void)_updateToolbar;
- (void)_updateTutorialText;
- (void)_updateViewsForTraitCollection;
- (void)cancelEditing;
- (void)commitChangesAndDismissEditor;
- (void)dealloc;
- (void)didUpdateActivityZone:(id)a3;
- (void)displayActivityZoneState;
- (void)displayAlertWithTitle:(id)a3 message:(id)a4;
- (void)displayErrorAlert;
- (void)displayLineOverlapAlert;
- (void)displayMoveOverlapAlert;
- (void)displayUnCommittedChangesAlert;
- (void)displayZoneOverlapAlert;
- (void)invertZones;
- (void)setActivityZoneCanvas:(id)a3;
- (void)setCameraProfile:(id)a3;
- (void)setInitialActivityZones:(id)a3;
- (void)setInitialSettingDetectsInclusionZones:(BOOL)a3;
- (void)setLiveStreamViewController:(id)a3;
- (void)setTutorialLabel:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation HUCameraActivityZoneEditorViewController

- (HUCameraActivityZoneEditorViewController)initWithCameraProfile:(id)a3
{
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)HUCameraActivityZoneEditorViewController;
  v6 = [(HUCameraActivityZoneEditorViewController *)&v16 init];
  if (v6)
  {
    v7 = [[HUCameraLiveStreamViewController alloc] initWithCameraProfile:v5];
    liveStreamViewController = v6->_liveStreamViewController;
    v6->_liveStreamViewController = v7;

    [(HUCameraLiveStreamViewController *)v6->_liveStreamViewController setLiveStreamControllerDelegate:v6];
    [(HUCameraLiveStreamViewController *)v6->_liveStreamViewController setShouldRespectAspectRatio:1];
    objc_storeStrong((id *)&v6->_cameraProfile, a3);
    v9 = [v5 userSettings];
    v10 = [v9 activityZones];
    uint64_t v11 = [v10 allObjects];
    initialActivityZones = v6->_initialActivityZones;
    v6->_initialActivityZones = (NSArray *)v11;

    if ([(NSArray *)v6->_initialActivityZones count])
    {
      v13 = [(HUCameraActivityZoneEditorViewController *)v6 cameraProfile];
      v14 = [v13 userSettings];
      v6->_initialSettingDetectsInclusionZones = [v14 areActivityZonesIncludedForSignificantEventDetection];
    }
    else
    {
      v6->_initialSettingDetectsInclusionZones = 1;
    }
  }

  return v6;
}

- (void)viewDidAppear:(BOOL)a3
{
  v22.receiver = self;
  v22.super_class = (Class)HUCameraActivityZoneEditorViewController;
  [(HUCameraActivityZoneEditorViewController *)&v22 viewDidAppear:a3];
  if ([MEMORY[0x1E4F69758] isAMac])
  {
    v4 = [(HUCameraActivityZoneEditorViewController *)self view];
    [v4 bounds];
    double v6 = v5;
    double v8 = v7;
    v9 = [(HUCameraActivityZoneEditorViewController *)self view];
    v10 = [v9 window];
    uint64_t v11 = [v10 windowScene];
    v12 = [v11 sizeRestrictions];
    objc_msgSend(v12, "setMinimumSize:", v6, v8);

    v13 = [(HUCameraActivityZoneEditorViewController *)self view];
    [v13 bounds];
    double v15 = v14;
    double v17 = v16;
    v18 = [(HUCameraActivityZoneEditorViewController *)self view];
    v19 = [v18 window];
    v20 = [v19 windowScene];
    v21 = [v20 sizeRestrictions];
    objc_msgSend(v21, "setMaximumSize:", v15, v17);
  }
}

- (void)viewDidLoad
{
  v34.receiver = self;
  v34.super_class = (Class)HUCameraActivityZoneEditorViewController;
  [(HUCameraActivityZoneEditorViewController *)&v34 viewDidLoad];
  v3 = [MEMORY[0x1E4F428B8] systemBackgroundColor];
  v4 = [(HUCameraActivityZoneEditorViewController *)self view];
  [v4 setBackgroundColor:v3];

  double v5 = [(HUCameraActivityZoneEditorViewController *)self view];
  double v6 = [(HUCameraActivityZoneEditorViewController *)self liveStreamViewController];
  double v7 = [v6 view];
  [v5 addSubview:v7];

  double v8 = [(HUCameraActivityZoneEditorViewController *)self liveStreamViewController];
  [(HUCameraActivityZoneEditorViewController *)self addChildViewController:v8];

  v9 = [(HUCameraActivityZoneEditorViewController *)self liveStreamViewController];
  [v9 didMoveToParentViewController:self];

  id v10 = objc_alloc_init(MEMORY[0x1E4F42B38]);
  uint64_t v11 = 1;
  v12 = _HULocalizedStringWithDefaultValue(@"HUCameraActivityZoneEditorTitle", @"HUCameraActivityZoneEditorTitle", 1);
  [v10 setText:v12];

  v13 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F438A0]];
  [v10 setFont:v13];

  double v14 = [(HUCameraActivityZoneEditorViewController *)self navigationItem];
  [v14 setTitleView:v10];

  double v15 = [(HUCameraActivityZoneEditorViewController *)self view];
  double v16 = [(HUCameraActivityZoneEditorViewController *)self activityZoneCanvas];
  [v15 addSubview:v16];

  double v17 = [(HUCameraActivityZoneEditorViewController *)self view];
  [v17 center];
  double v19 = v18;
  double v21 = v20;
  objc_super v22 = [(HUCameraActivityZoneEditorViewController *)self activityZoneCanvas];
  objc_msgSend(v22, "setCenter:", v19, v21);

  v23 = [(HUCameraActivityZoneEditorViewController *)self view];
  v24 = [(HUCameraActivityZoneEditorViewController *)self tutorialLabel];
  [v23 addSubview:v24];

  v25 = [(HUCameraActivityZoneEditorViewController *)self cameraProfile];
  v26 = [v25 accessory];
  v27 = [v26 home];
  char v28 = objc_msgSend(v27, "hf_currentUserIsAdministrator");

  if ((v28 & 1) == 0)
  {
    v29 = HFLogForCategory();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v33 = 0;
      _os_log_impl(&dword_1BE345000, v29, OS_LOG_TYPE_INFO, "Bypassing admin controls for shared users", v33, 2u);
    }

    v30 = [(HUCameraActivityZoneEditorViewController *)self activityZoneCanvas];
    [v30 setUserInteractionEnabled:0];

    [(HUCameraActivityZoneEditorViewController *)self displayActivityZoneState];
    uint64_t v11 = 0;
  }
  v31 = (void *)[objc_alloc(MEMORY[0x1E4F427C0]) initWithBarButtonSystemItem:v11 target:self action:sel_cancelEditing];
  v32 = [(HUCameraActivityZoneEditorViewController *)self navigationItem];
  [v32 setLeftBarButtonItem:v31];

  [(HUCameraActivityZoneEditorViewController *)self _refreshUI];
}

- (void)didUpdateActivityZone:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_1BE345000, v5, OS_LOG_TYPE_DEFAULT, "Did receive update for activity zone:%@", (uint8_t *)&v6, 0xCu);
  }

  [(HUCameraActivityZoneEditorViewController *)self _refreshUI];
}

- (void)_refreshUI
{
  v3 = [(HUCameraActivityZoneEditorViewController *)self cameraProfile];
  id v4 = [v3 accessory];
  double v5 = [v4 home];
  int v6 = objc_msgSend(v5, "hf_currentUserIsAdministrator");

  if (v6)
  {
    [(HUCameraActivityZoneEditorViewController *)self _updateToolbar];
    [(HUCameraActivityZoneEditorViewController *)self _updateNavigationBar];
    [(HUCameraActivityZoneEditorViewController *)self _updateTutorialText];
  }
}

- (void)_updateToolbar
{
  v19[1] = *MEMORY[0x1E4F143B8];
  v3 = [(HUCameraActivityZoneEditorViewController *)self activityZoneCanvas];
  id v4 = [v3 activityZones];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x1E4F427C0]);
    if (v5 == 1) {
      id v7 = @"HUCameraActivityZoneInvertZoneText";
    }
    else {
      id v7 = @"HUCameraActivityZoneInvertZonesText";
    }
    uint64_t v8 = _HULocalizedStringWithDefaultValue(v7, v7, 1);
    id v18 = (id)[v6 initWithTitle:v8 style:2 target:self action:sel_invertZones];

    v9 = (void *)[objc_alloc(MEMORY[0x1E4F427C0]) initWithBarButtonSystemItem:5 target:0 action:0];
    id v10 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithObjects:", v9, v18, 0);
    uint64_t v11 = [(HUCameraActivityZoneEditorViewController *)self activityZoneCanvas];
    int v12 = [v11 isCreatingActivityZone];

    if (v12)
    {
      v13 = [(HUCameraActivityZoneEditorViewController *)self _addZoneButton];
      [v10 insertObject:v13 atIndex:0];
    }
    [(HUCameraActivityZoneEditorViewController *)self setToolbarItems:v10];
  }
  else
  {
    double v14 = [(HUCameraActivityZoneEditorViewController *)self activityZoneCanvas];
    int v15 = [v14 isCreatingActivityZone];

    if (v15)
    {
      double v16 = [(HUCameraActivityZoneEditorViewController *)self _addZoneButton];
      v19[0] = v16;
      double v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
      [(HUCameraActivityZoneEditorViewController *)self setToolbarItems:v17];
    }
    else
    {
      [(HUCameraActivityZoneEditorViewController *)self setToolbarItems:0];
    }
  }
}

- (void)_updateNavigationBar
{
  if ([(HUCameraActivityZoneEditorViewController *)self hasActivityZoneChanges])
  {
    [(HUCameraActivityZoneEditorViewController *)self setModalInPresentation:1];
    id v4 = (id)[objc_alloc(MEMORY[0x1E4F427C0]) initWithBarButtonSystemItem:0 target:self action:sel_commitChangesAndDismissEditor];
    v3 = [(HUCameraActivityZoneEditorViewController *)self navigationItem];
    [v3 setRightBarButtonItem:v4];
  }
  else
  {
    [(HUCameraActivityZoneEditorViewController *)self setModalInPresentation:0];
    id v4 = [(HUCameraActivityZoneEditorViewController *)self navigationItem];
    [v4 setRightBarButtonItem:0];
  }
}

- (void)_updateTutorialText
{
  v3 = [(HUCameraActivityZoneEditorViewController *)self activityZoneCanvas];
  id v4 = [v3 activityZones];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    [(HUCameraActivityZoneEditorViewController *)self displayActivityZoneState];
  }
  else
  {
    _HULocalizedStringWithDefaultValue(@"HUCameraActivityZoneTutorialLabelText", @"HUCameraActivityZoneTutorialLabelText", 1);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    id v6 = [(HUCameraActivityZoneEditorViewController *)self tutorialLabel];
    [v6 setText:v7];
  }
}

- (void)displayActivityZoneState
{
  v3 = [(HUCameraActivityZoneEditorViewController *)self activityZoneCanvas];
  id v4 = [v3 activityZones];
  uint64_t v5 = [v4 count];

  id v6 = [(HUCameraActivityZoneEditorViewController *)self activityZoneCanvas];
  LODWORD(v4) = [v6 displaysInclusionZones];

  if (v4)
  {
    if (v5 == 1) {
      id v7 = @"HUCameraActivityZoneInclusionZoneText";
    }
    else {
      id v7 = @"HUCameraActivityZoneInclusionZonesText";
    }
  }
  else if (v5 == 1)
  {
    id v7 = @"HUCameraActivityZoneExclusionZoneText";
  }
  else
  {
    id v7 = @"HUCameraActivityZoneExclusionZonesText";
  }
  _HULocalizedStringWithDefaultValue(v7, v7, 1);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = [(HUCameraActivityZoneEditorViewController *)self tutorialLabel];
  [v8 setText:v9];
}

- (id)_addZoneButton
{
  id v3 = objc_alloc(MEMORY[0x1E4F427C0]);
  id v4 = _HULocalizedStringWithDefaultValue(@"HUCameraActivityZoneAddZoneText", @"HUCameraActivityZoneAddZoneText", 1);
  uint64_t v5 = [(HUCameraActivityZoneEditorViewController *)self activityZoneCanvas];
  id v6 = (void *)[v3 initWithTitle:v4 style:2 target:v5 action:sel_createActivityZone];

  return v6;
}

- (void)displayUnCommittedChangesAlert
{
  id v3 = (void *)MEMORY[0x1E4F42728];
  id v4 = _HULocalizedStringWithDefaultValue(@"HUCameraActivityZonesCancelWithoutSavingAlertTitle", @"HUCameraActivityZonesCancelWithoutSavingAlertTitle", 1);
  uint64_t v5 = _HULocalizedStringWithDefaultValue(@"HUCameraActivityZonesCancelWithoutSavingAlertMessage", @"HUCameraActivityZonesCancelWithoutSavingAlertMessage", 1);
  id v6 = [v3 alertControllerWithTitle:v4 message:v5 preferredStyle:1];

  id v7 = [(HUCameraActivityZoneEditorViewController *)self view];
  uint64_t v8 = [v6 popoverPresentationController];
  [v8 setSourceView:v7];

  id v9 = [(HUCameraActivityZoneEditorViewController *)self navigationController];
  id v10 = [v9 toolbar];
  [v10 frame];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v19 = [v6 popoverPresentationController];
  objc_msgSend(v19, "setSourceRect:", v12, v14, v16, v18);

  double v20 = (void *)MEMORY[0x1E4F42720];
  double v21 = _HULocalizedStringWithDefaultValue(@"HUCameraActivityZonesProceedWithoutSavingText", @"HUCameraActivityZonesProceedWithoutSavingText", 1);
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __74__HUCameraActivityZoneEditorViewController_displayUnCommittedChangesAlert__block_invoke;
  v27[3] = &unk_1E6385188;
  v27[4] = self;
  objc_super v22 = [v20 actionWithTitle:v21 style:2 handler:v27];

  [v6 addAction:v22];
  v23 = (void *)MEMORY[0x1E4F42720];
  v24 = _HULocalizedStringWithDefaultValue(@"HUCameraActivityZonesSaveBeforeProceedingText", @"HUCameraActivityZonesSaveBeforeProceedingText", 1);
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __74__HUCameraActivityZoneEditorViewController_displayUnCommittedChangesAlert__block_invoke_2;
  v26[3] = &unk_1E6385188;
  v26[4] = self;
  v25 = [v23 actionWithTitle:v24 style:1 handler:v26];

  [v6 addAction:v25];
  [(HUCameraActivityZoneEditorViewController *)self presentViewController:v6 animated:1 completion:0];
}

uint64_t __74__HUCameraActivityZoneEditorViewController_displayUnCommittedChangesAlert__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) dismissViewControllerAnimated:1 completion:0];
}

uint64_t __74__HUCameraActivityZoneEditorViewController_displayUnCommittedChangesAlert__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) commitChangesAndDismissEditor];
}

- (void)displayAlertWithTitle:(id)a3 message:(id)a4
{
  id v8 = [MEMORY[0x1E4F42728] alertControllerWithTitle:a3 message:a4 preferredStyle:1];
  uint64_t v5 = (void *)MEMORY[0x1E4F42720];
  id v6 = _HULocalizedStringWithDefaultValue(@"HUOkTitle", @"HUOkTitle", 1);
  id v7 = [v5 actionWithTitle:v6 style:0 handler:0];
  [v8 addAction:v7];

  [(HUCameraActivityZoneEditorViewController *)self presentViewController:v8 animated:1 completion:0];
}

- (void)displayErrorAlert
{
  _HULocalizedStringWithDefaultValue(@"HUCameraActivityZoneEditorErrorTitle", @"HUCameraActivityZoneEditorErrorTitle", 1);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = _HULocalizedStringWithDefaultValue(@"HUCameraActivityZoneEditorErrorMessage", @"HUCameraActivityZoneEditorErrorMessage", 1);
  [(HUCameraActivityZoneEditorViewController *)self displayAlertWithTitle:v4 message:v3];
}

- (void)displayZoneOverlapAlert
{
  _HULocalizedStringWithDefaultValue(@"HUCameraActivityZoneEditorZoneOverlapErrorTitle", @"HUCameraActivityZoneEditorZoneOverlapErrorTitle", 1);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = _HULocalizedStringWithDefaultValue(@"HUCameraActivityZoneEditorZoneOverlapErrorMessage", @"HUCameraActivityZoneEditorZoneOverlapErrorMessage", 1);
  [(HUCameraActivityZoneEditorViewController *)self displayAlertWithTitle:v4 message:v3];
}

- (void)displayLineOverlapAlert
{
  _HULocalizedStringWithDefaultValue(@"HUCameraActivityZoneEditorLineOverlapErrorTitle", @"HUCameraActivityZoneEditorLineOverlapErrorTitle", 1);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = _HULocalizedStringWithDefaultValue(@"HUCameraActivityZoneEditorLineOverlapErrorMessage", @"HUCameraActivityZoneEditorLineOverlapErrorMessage", 1);
  [(HUCameraActivityZoneEditorViewController *)self displayAlertWithTitle:v4 message:v3];
}

- (void)displayMoveOverlapAlert
{
  _HULocalizedStringWithDefaultValue(@"HUCameraActivityZoneEditorMoveOverlapErrorTitle", @"HUCameraActivityZoneEditorMoveOverlapErrorTitle", 1);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = _HULocalizedStringWithDefaultValue(@"HUCameraActivityZoneEditorMoveOverlapErrorMessage", @"HUCameraActivityZoneEditorMoveOverlapErrorMessage", 1);
  [(HUCameraActivityZoneEditorViewController *)self displayAlertWithTitle:v4 message:v3];
}

- (void)_updateViewsForTraitCollection
{
  id v3 = [(HUCameraActivityZoneEditorViewController *)self tutorialLabel];
  [v3 frame];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;

  id v10 = [(HUCameraActivityZoneEditorViewController *)self traitCollection];
  if (objc_msgSend(v10, "hu_hasExtendedWidth")) {
    double v11 = 40.0;
  }
  else {
    double v11 = 60.0;
  }

  double v12 = [(HUCameraActivityZoneEditorViewController *)self tutorialLabel];
  objc_msgSend(v12, "setFrame:", v5, v11, v7, v9);

  double v13 = [(HUCameraActivityZoneEditorViewController *)self view];
  [v13 bounds];
  double v15 = v14;
  v61.origin.x = v5;
  v61.origin.y = v11;
  v61.size.width = v7;
  v61.size.height = v9;
  double v16 = v15 - CGRectGetMaxY(v61);

  double v17 = [(HUCameraActivityZoneEditorViewController *)self view];
  [v17 bounds];
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;

  if (v23 >= v25) {
    double v26 = v25;
  }
  else {
    double v26 = v23;
  }
  if (v26 >= v16) {
    double v27 = v16;
  }
  else {
    double v27 = v26;
  }
  char v28 = [(HUCameraActivityZoneEditorViewController *)self cameraProfile];
  v29 = [v28 snapshotControl];
  v30 = [v29 mostRecentSnapshot];
  [v30 aspectRatio];
  if (v31 == 0.0) {
    double v32 = 1.0;
  }
  else {
    double v32 = v31;
  }

  if (v32 == 1.0)
  {
    v33 = HFLogForCategory();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v60 = 0;
      _os_log_error_impl(&dword_1BE345000, v33, OS_LOG_TYPE_ERROR, "Invalid aspect ratio. Using 1:1.", v60, 2u);
    }
  }
  if (v32 >= 1.0) {
    double v34 = v27 / v32;
  }
  else {
    double v34 = v27 * v32;
  }
  v35 = [(HUCameraActivityZoneEditorViewController *)self liveStreamViewController];
  v36 = [v35 view];
  objc_msgSend(v36, "setFrame:", v19, v21, v27, v34);

  v37 = [(HUCameraActivityZoneEditorViewController *)self view];
  [v37 center];
  double v39 = v38;
  double v41 = v40;
  v42 = [(HUCameraActivityZoneEditorViewController *)self liveStreamViewController];
  v43 = [v42 view];
  objc_msgSend(v43, "setCenter:", v39, v41);

  v44 = [(HUCameraActivityZoneEditorViewController *)self liveStreamViewController];
  [v44 setShouldRespectAspectRatio:1];

  if (v32 < 1.0) {
    double v27 = v32 * v34;
  }
  v45 = [(HUCameraActivityZoneEditorViewController *)self activityZoneCanvas];
  objc_msgSend(v45, "setFrame:", v19, v21, v27, v34);

  v46 = [(HUCameraActivityZoneEditorViewController *)self view];
  [v46 center];
  double v48 = v47;
  double v50 = v49;
  v51 = [(HUCameraActivityZoneEditorViewController *)self activityZoneCanvas];
  objc_msgSend(v51, "setCenter:", v48, v50);

  v52 = [(HUCameraActivityZoneEditorViewController *)self activityZoneCanvas];
  [v52 updateAfterVideoBoundsChange];

  v53 = [(HUCameraActivityZoneEditorViewController *)self view];
  [v53 center];
  double v55 = v54;
  double v57 = v56;
  v58 = [(HUCameraActivityZoneEditorViewController *)self liveStreamViewController];
  v59 = [v58 view];
  objc_msgSend(v59, "setCenter:", v55, v57);
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)HUCameraActivityZoneEditorViewController;
  [(HUCameraActivityZoneEditorViewController *)&v3 viewDidLayoutSubviews];
  [(HUCameraActivityZoneEditorViewController *)self _updateViewsForTraitCollection];
}

- (void)invertZones
{
  objc_super v3 = [(HUCameraActivityZoneEditorViewController *)self activityZoneCanvas];
  uint64_t v4 = [v3 displaysInclusionZones] ^ 1;
  double v5 = [(HUCameraActivityZoneEditorViewController *)self activityZoneCanvas];
  [v5 setDisplaysInclusionZones:v4];

  [(HUCameraActivityZoneEditorViewController *)self _updateTutorialText];

  [(HUCameraActivityZoneEditorViewController *)self _updateNavigationBar];
}

- (void)cancelEditing
{
  if ([(HUCameraActivityZoneEditorViewController *)self hasActivityZoneChanges])
  {
    [(HUCameraActivityZoneEditorViewController *)self displayUnCommittedChangesAlert];
  }
  else
  {
    [(HUCameraActivityZoneEditorViewController *)self dismissViewControllerAnimated:1 completion:0];
  }
}

- (BOOL)hasActivityZoneChanges
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  int v3 = [(HUCameraActivityZoneEditorViewController *)self initialSettingDetectsInclusionZones];
  uint64_t v4 = [(HUCameraActivityZoneEditorViewController *)self activityZoneCanvas];
  int v5 = [v4 displaysInclusionZones];

  if (v3 != v5) {
    return 1;
  }
  double v7 = [(HUCameraActivityZoneEditorViewController *)self initialActivityZones];
  uint64_t v8 = [v7 count];
  double v9 = [(HUCameraActivityZoneEditorViewController *)self activityZoneCanvas];
  id v10 = [v9 activityZones];
  uint64_t v11 = [v10 count];

  if (v8 == v11)
  {
    double v12 = [(HUCameraActivityZoneEditorViewController *)self activityZoneCanvas];
    double v13 = [v12 activityZones];

    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    char v25 = 0;
    double v14 = [(HUCameraActivityZoneEditorViewController *)self initialActivityZones];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __66__HUCameraActivityZoneEditorViewController_hasActivityZoneChanges__block_invoke;
    v21[3] = &unk_1E6386E20;
    double v15 = v13;
    double v22 = v15;
    double v23 = buf;
    [v14 enumerateObjectsUsingBlock:v21];

    BOOL v6 = *(unsigned char *)(*(void *)&buf[8] + 24) != 0;
    _Block_object_dispose(buf, 8);
  }
  else
  {
    double v15 = HFLogForCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      double v16 = [(HUCameraActivityZoneEditorViewController *)self initialActivityZones];
      uint64_t v17 = [v16 count];
      double v18 = [(HUCameraActivityZoneEditorViewController *)self activityZoneCanvas];
      double v19 = [v18 activityZones];
      *(_DWORD *)buf = 134218240;
      *(void *)&buf[4] = v17;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = [v19 count];
      _os_log_impl(&dword_1BE345000, v15, OS_LOG_TYPE_DEFAULT, "Activity zones have changed. Total count changed from:%lu to:%lu", buf, 0x16u);
    }
    BOOL v6 = 1;
  }

  return v6;
}

void __66__HUCameraActivityZoneEditorViewController_hasActivityZoneChanges__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  uint64_t v8 = [*(id *)(a1 + 32) objectAtIndex:a3];
  double v9 = [v7 points];
  uint64_t v10 = [v9 count];
  uint64_t v11 = [v8 count];

  if (v10 == v11)
  {
    double v12 = [v7 points];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __66__HUCameraActivityZoneEditorViewController_hasActivityZoneChanges__block_invoke_88;
    v17[3] = &unk_1E6386DF8;
    id v13 = v8;
    uint64_t v14 = *(void *)(a1 + 40);
    id v18 = v13;
    uint64_t v19 = v14;
    [v12 enumerateObjectsUsingBlock:v17];
  }
  else
  {
    double v15 = HFLogForCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      double v16 = [v7 points];
      *(_DWORD *)buf = 134218240;
      uint64_t v21 = [v16 count];
      __int16 v22 = 2048;
      uint64_t v23 = [v8 count];
      _os_log_impl(&dword_1BE345000, v15, OS_LOG_TYPE_DEFAULT, "Activity zones have changed. Number of points changed from:%lu to:%lu", buf, 0x16u);
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
}

void __66__HUCameraActivityZoneEditorViewController_hasActivityZoneChanges__block_invoke_88(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  uint64_t v8 = [*(id *)(a1 + 32) objectAtIndex:a3];
  [v8 point];
  double v10 = v9;
  [v7 point];
  if (vabdd_f64(v10, v11) > 0.001)
  {
    [v8 point];
    double v13 = v12;
    [v7 point];
    if (vabdd_f64(v13, v14) > 0.001)
    {
      double v15 = HFLogForCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        int v16 = 138412802;
        id v17 = v7;
        __int16 v18 = 2112;
        uint64_t v19 = v8;
        __int16 v20 = 2048;
        uint64_t v21 = a3;
        _os_log_impl(&dword_1BE345000, v15, OS_LOG_TYPE_DEFAULT, "Activity zone has changed. Points differ:%@ vs %@ at index:%lu.", (uint8_t *)&v16, 0x20u);
      }

      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
      *a4 = 1;
    }
  }
}

- (void)commitChangesAndDismissEditor
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if ([(HUCameraActivityZoneEditorViewController *)self hasActivityZoneChanges])
  {
    int v3 = [MEMORY[0x1E4F1CA80] set];
    uint64_t v4 = [(HUCameraActivityZoneEditorViewController *)self activityZoneCanvas];
    int v5 = [v4 activityZones];

    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __73__HUCameraActivityZoneEditorViewController_commitChangesAndDismissEditor__block_invoke;
    v18[3] = &unk_1E6386E48;
    id v6 = v3;
    id v19 = v6;
    [v5 enumerateObjectsUsingBlock:v18];
    [(HUCameraActivityZoneEditorViewController *)self _displayProgressIndicatorWhileLoading];
    id v7 = HFLogForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = [(HUCameraActivityZoneEditorViewController *)self activityZoneCanvas];
      int v9 = [v8 displaysInclusionZones];
      *(_DWORD *)buf = 138412802;
      uint64_t v21 = self;
      __int16 v22 = 1024;
      int v23 = v9;
      __int16 v24 = 2112;
      id v25 = v6;
      _os_log_impl(&dword_1BE345000, v7, OS_LOG_TYPE_DEFAULT, "%@ Editor: Submitting zoneType inclusion:%{BOOL}d zones:%@", buf, 0x1Cu);
    }
    objc_initWeak((id *)buf, self);
    double v10 = [(HUCameraActivityZoneEditorViewController *)self cameraProfile];
    double v11 = [v10 userSettings];
    double v12 = [(HUCameraActivityZoneEditorViewController *)self activityZoneCanvas];
    uint64_t v13 = [v12 displaysInclusionZones];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __73__HUCameraActivityZoneEditorViewController_commitChangesAndDismissEditor__block_invoke_94;
    v15[3] = &unk_1E6386E70;
    objc_copyWeak(&v17, (id *)buf);
    id v14 = v6;
    id v16 = v14;
    [v11 updateActivityZones:v14 areActivityZonesIncludedForSignificantEventDetection:v13 completionHandler:v15];

    objc_destroyWeak(&v17);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    [(HUCameraActivityZoneEditorViewController *)self dismissViewControllerAnimated:1 completion:0];
  }
}

void __73__HUCameraActivityZoneEditorViewController_commitChangesAndDismissEditor__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([v3 count])
  {
    uint64_t v4 = [v3 firstObject];
    int v5 = [v3 lastObject];
    char v6 = [v4 isEqual:v5];

    if ((v6 & 1) == 0)
    {
      id v7 = HFLogForCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 138412290;
        id v11 = v3;
        _os_log_impl(&dword_1BE345000, v7, OS_LOG_TYPE_DEFAULT, "Editor: Appending first point to the end of the array of points:%@", (uint8_t *)&v10, 0xCu);
      }

      uint64_t v8 = [v3 firstObject];
      [v3 addObject:v8];
    }
    int v9 = (void *)[objc_alloc(MEMORY[0x1E4F2E6B8]) initWithPoints:v3];
    [*(id *)(a1 + 32) addObject:v9];
  }
}

void __73__HUCameraActivityZoneEditorViewController_commitChangesAndDismissEditor__block_invoke_94(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  int v5 = HFLogForCategory();
  char v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138412290;
      uint64_t v9 = (uint64_t)v3;
      _os_log_error_impl(&dword_1BE345000, v6, OS_LOG_TYPE_ERROR, "Failure to update activity zones with error:%@", (uint8_t *)&v8, 0xCu);
    }

    [WeakRetained _updateNavigationBar];
    [WeakRetained displayErrorAlert];
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = [*(id *)(a1 + 32) count];
      int v8 = 134217984;
      uint64_t v9 = v7;
      _os_log_impl(&dword_1BE345000, v6, OS_LOG_TYPE_DEFAULT, "Saved activity zones %lu without error.", (uint8_t *)&v8, 0xCu);
    }

    [WeakRetained dismissViewControllerAnimated:1 completion:0];
  }
}

- (void)_displayProgressIndicatorWhileLoading
{
  id v5 = (id)[objc_alloc(MEMORY[0x1E4F42708]) initWithActivityIndicatorStyle:100];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F427C0]) initWithCustomView:v5];
  uint64_t v4 = [(HUCameraActivityZoneEditorViewController *)self navigationItem];
  [v4 setRightBarButtonItem:v3];

  [v5 startAnimating];
}

- (HUCameraActivityZoneCanvasView)activityZoneCanvas
{
  activityZoneCanvas = self->_activityZoneCanvas;
  if (!activityZoneCanvas)
  {
    uint64_t v4 = [HUCameraActivityZoneCanvasView alloc];
    id v5 = [(HUCameraActivityZoneEditorViewController *)self view];
    [v5 bounds];
    char v6 = -[HUCameraActivityZoneCanvasView initWithFrame:](v4, "initWithFrame:");

    [(HUCameraActivityZoneCanvasView *)v6 setDelegate:self];
    [(HUCameraActivityZoneCanvasView *)v6 setDisplaysInclusionZones:[(HUCameraActivityZoneEditorViewController *)self initialSettingDetectsInclusionZones]];
    uint64_t v7 = [(HUCameraActivityZoneEditorViewController *)self initialActivityZones];
    [(HUCameraActivityZoneCanvasView *)v6 loadActivityZones:v7];

    int v8 = self->_activityZoneCanvas;
    self->_activityZoneCanvas = v6;

    activityZoneCanvas = self->_activityZoneCanvas;
  }

  return activityZoneCanvas;
}

- (UILabel)tutorialLabel
{
  tutorialLabel = self->_tutorialLabel;
  if (!tutorialLabel)
  {
    uint64_t v4 = [(HUCameraActivityZoneEditorViewController *)self view];
    [v4 bounds];
    double v6 = v5 + -20.0;

    uint64_t v7 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x1E4F42B38]), "initWithFrame:", 10.0, 60.0, v6, 50.0);
    int v8 = _HULocalizedStringWithDefaultValue(@"HUCameraActivityZoneTutorialLabelText", @"HUCameraActivityZoneTutorialLabelText", 1);
    [(UILabel *)v7 setText:v8];

    [(UILabel *)v7 setTextAlignment:1];
    [(UILabel *)v7 setNumberOfLines:0];
    uint64_t v9 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F43870]];
    [(UILabel *)v7 setFont:v9];

    [(UILabel *)v7 setAdjustsFontSizeToFitWidth:1];
    [(UILabel *)v7 setAutoresizingMask:2];
    uint64_t v10 = self->_tutorialLabel;
    self->_tutorialLabel = v7;

    tutorialLabel = self->_tutorialLabel;
  }

  return tutorialLabel;
}

- (void)dealloc
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = HFLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    double v6 = self;
    _os_log_impl(&dword_1BE345000, v3, OS_LOG_TYPE_DEFAULT, "%@ Editing complete. Dealloc.", buf, 0xCu);
  }

  v4.receiver = self;
  v4.super_class = (Class)HUCameraActivityZoneEditorViewController;
  [(HUCameraActivityZoneEditorViewController *)&v4 dealloc];
}

- (HMCameraProfile)cameraProfile
{
  return self->_cameraProfile;
}

- (void)setCameraProfile:(id)a3
{
}

- (void)setActivityZoneCanvas:(id)a3
{
}

- (void)setTutorialLabel:(id)a3
{
}

- (HUCameraLiveStreamViewController)liveStreamViewController
{
  return self->_liveStreamViewController;
}

- (void)setLiveStreamViewController:(id)a3
{
}

- (NSArray)initialActivityZones
{
  return self->_initialActivityZones;
}

- (void)setInitialActivityZones:(id)a3
{
}

- (BOOL)initialSettingDetectsInclusionZones
{
  return self->_initialSettingDetectsInclusionZones;
}

- (void)setInitialSettingDetectsInclusionZones:(BOOL)a3
{
  self->_initialSettingDetectsInclusionZones = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initialActivityZones, 0);
  objc_storeStrong((id *)&self->_liveStreamViewController, 0);
  objc_storeStrong((id *)&self->_tutorialLabel, 0);
  objc_storeStrong((id *)&self->_activityZoneCanvas, 0);

  objc_storeStrong((id *)&self->_cameraProfile, 0);
}

@end