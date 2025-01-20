@interface PKPaletteMoreOptionsViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)_isCellInstalled:(id)a3;
- (BOOL)_shouldInstallOpenPencilSettingsCell;
- (BOOL)_shouldInstallResetHandwritingEducationPanelCell;
- (BOOL)_shouldInstallTapToRadarCell;
- (BOOL)_shouldRemoveOpenPencilSettingsCell;
- (BOOL)_shouldRemoveResetHandwritingEducationPanelCell;
- (BOOL)_shouldRemoveTapToRadarCell;
- (BOOL)isAutoHideOn;
- (BOOL)isAutoRefineOn;
- (BOOL)isFingerDrawsOn;
- (BOOL)shouldShowAutoMinimizeOption;
- (BOOL)shouldShowFingerDrawsOption;
- (BOOL)shouldShowOpenPencilSettingsOption;
- (BOOL)shouldShowResetHandwritingEducationPane;
- (BOOL)shouldShowTapToRadarOption;
- (NSArray)stackViewPositioningConstraints;
- (PKPaletteMoreOptionsViewControllerDelegate)delegate;
- (PKPaletteOptionInfoCell)autoRefineNotReadyCell;
- (PKPaletteOptionSwitchCell)autoMinimizeCell;
- (PKPaletteOptionSwitchCell)autoRefineCell;
- (PKPaletteOptionSwitchCell)fingerDrawsCell;
- (PKPaletteOptionSwitchCell)shapesCell;
- (PKPaletteOptionTitleCell)openPencilSettingsCell;
- (PKPaletteOptionTitleCell)resetHandwritingEducationPaneCell;
- (PKPaletteOptionTitleCell)resetImageWandOnboardingPaneCell;
- (PKPaletteOptionTitleCell)tapToRadarCell;
- (UIStackView)stackView;
- (UITraitCollection)externalTraitCollection;
- (double)_contentSizeMinWidth;
- (void)_autoMinimizeCellDidChangeValue:(id)a3;
- (void)_autoRefineCellDidChangeValue:(id)a3;
- (void)_fingerDrawsCellDidChangeValue:(id)a3;
- (void)_handleOpenPencilSettingsCellTapped;
- (void)_handleResetHandwritingEducationPaneCellTapped;
- (void)_handleResetImageWandOnboardingCellTapped:(id)a3;
- (void)_handleTapToRadarCellTapped;
- (void)_reloadItems;
- (void)_reloadResetImageWandOnboardingCell;
- (void)_updateAutoMinimizeCell;
- (void)_updateAutoRefineCell;
- (void)_updateContentSize;
- (void)_updateFingerDrawsCell;
- (void)setAutoHideOn:(BOOL)a3;
- (void)setAutoMinimizeCell:(id)a3;
- (void)setAutoRefineCell:(id)a3;
- (void)setAutoRefineNotReadyCell:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setExternalTraitCollection:(id)a3;
- (void)setFingerDrawsCell:(id)a3;
- (void)setIsAutoRefineOn:(BOOL)a3;
- (void)setIsFingerDrawsOn:(BOOL)a3;
- (void)setOpenPencilSettingsCell:(id)a3;
- (void)setResetHandwritingEducationPaneCell:(id)a3;
- (void)setResetImageWandOnboardingPaneCell:(id)a3;
- (void)setShapesCell:(id)a3;
- (void)setShouldShowAutoMinimizeOption:(BOOL)a3;
- (void)setShouldShowFingerDrawsOption:(BOOL)a3;
- (void)setShouldShowOpenPencilSettingsOption:(BOOL)a3;
- (void)setShouldShowResetHandwritingEducationPane:(BOOL)a3;
- (void)setShouldShowTapToRadarOption:(BOOL)a3;
- (void)setStackView:(id)a3;
- (void)setStackViewPositioningConstraints:(id)a3;
- (void)setTapToRadarCell:(id)a3;
- (void)viewDidLoad;
@end

@implementation PKPaletteMoreOptionsViewController

- (void)viewDidLoad
{
  v44[4] = *MEMORY[0x1E4F143B8];
  v43.receiver = self;
  v43.super_class = (Class)PKPaletteMoreOptionsViewController;
  [(PKPaletteMoreOptionsViewController *)&v43 viewDidLoad];
  v3 = [MEMORY[0x1E4FB1618] clearColor];
  v4 = [(PKPaletteMoreOptionsViewController *)self view];
  [v4 setBackgroundColor:v3];

  id v5 = objc_alloc(MEMORY[0x1E4FB1C60]);
  v6 = objc_msgSend(v5, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(PKPaletteMoreOptionsViewController *)self setStackView:v6];

  v7 = [(PKPaletteMoreOptionsViewController *)self stackView];
  [v7 setDistribution:0];

  v8 = [(PKPaletteMoreOptionsViewController *)self stackView];
  [v8 setAlignment:0];

  v9 = [(PKPaletteMoreOptionsViewController *)self stackView];
  [v9 setAxis:1];

  v10 = [(PKPaletteMoreOptionsViewController *)self stackView];
  [v10 setTranslatesAutoresizingMaskIntoConstraints:0];

  v11 = [(PKPaletteMoreOptionsViewController *)self view];
  v12 = [(PKPaletteMoreOptionsViewController *)self stackView];
  [v11 addSubview:v12];

  v13 = [(PKPaletteMoreOptionsViewController *)self stackView];
  v14 = [v13 bottomAnchor];
  v15 = [(PKPaletteMoreOptionsViewController *)self view];
  v16 = [v15 safeAreaLayoutGuide];
  v17 = [v16 bottomAnchor];
  v18 = [v14 constraintEqualToAnchor:v17];

  LODWORD(v19) = 1144750080;
  v20 = v18;
  v35 = v18;
  [v18 setPriority:v19];
  v42 = [(PKPaletteMoreOptionsViewController *)self stackView];
  v40 = [v42 leadingAnchor];
  v41 = [(PKPaletteMoreOptionsViewController *)self view];
  v39 = [v41 safeAreaLayoutGuide];
  v38 = [v39 leadingAnchor];
  v37 = [v40 constraintEqualToAnchor:v38];
  v44[0] = v37;
  v36 = [(PKPaletteMoreOptionsViewController *)self stackView];
  v33 = [v36 trailingAnchor];
  v34 = [(PKPaletteMoreOptionsViewController *)self view];
  v32 = [v34 safeAreaLayoutGuide];
  v21 = [v32 trailingAnchor];
  v22 = [v33 constraintEqualToAnchor:v21];
  v44[1] = v22;
  v23 = [(PKPaletteMoreOptionsViewController *)self stackView];
  v24 = [v23 topAnchor];
  v25 = [(PKPaletteMoreOptionsViewController *)self view];
  v26 = [v25 safeAreaLayoutGuide];
  v27 = [v26 topAnchor];
  v28 = [v24 constraintEqualToAnchor:v27];
  v44[2] = v28;
  v44[3] = v20;
  v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:4];
  [(PKPaletteMoreOptionsViewController *)self setStackViewPositioningConstraints:v29];

  v30 = (void *)MEMORY[0x1E4F28DC8];
  v31 = [(PKPaletteMoreOptionsViewController *)self stackViewPositioningConstraints];
  [v30 activateConstraints:v31];

  [(PKPaletteMoreOptionsViewController *)self _reloadItems];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)setShouldShowFingerDrawsOption:(BOOL)a3
{
  if (self->_shouldShowFingerDrawsOption != a3)
  {
    self->_shouldShowFingerDrawsOption = a3;
    [(PKPaletteMoreOptionsViewController *)self _reloadItems];
  }
}

- (void)setIsFingerDrawsOn:(BOOL)a3
{
  if (self->_isFingerDrawsOn != a3)
  {
    BOOL v3 = a3;
    self->_isFingerDrawsOn = a3;
    v4 = [(PKPaletteMoreOptionsViewController *)self fingerDrawsCell];
    if (v4)
    {
      id v5 = v4;
      [v4[52] setOn:v3];
      v4 = v5;
    }
  }
}

- (void)setExternalTraitCollection:(id)a3
{
  id v5 = (UITraitCollection *)a3;
  if (self->_externalTraitCollection != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_externalTraitCollection, a3);
    [(PKPaletteMoreOptionsViewController *)self _updateContentSize];
    id v5 = v6;
  }
}

- (void)setAutoHideOn:(BOOL)a3
{
  if (self->_autoHideOn != a3)
  {
    self->_autoHideOn = a3;
    [(PKPaletteMoreOptionsViewController *)self _updateAutoMinimizeCell];
  }
}

- (void)_updateAutoMinimizeCell
{
  BOOL v3 = [(PKPaletteMoreOptionsViewController *)self isAutoHideOn];
  v4 = [(PKPaletteMoreOptionsViewController *)self autoMinimizeCell];
  if (v4)
  {
    id v5 = v4;
    [v4[52] setOn:v3];
    v4 = v5;
  }
}

- (void)_updateFingerDrawsCell
{
  BOOL v3 = [(PKPaletteMoreOptionsViewController *)self fingerDrawsCell];

  if (!v3)
  {
    v4 = _PencilKitBundle();
    id v5 = [v4 localizedStringForKey:@"Draw with Finger" value:@"Draw with Finger" table:@"Localizable"];

    v6 = -[PKPaletteOptionSwitchCell initWithTitle:subtitle:target:action:]([PKPaletteOptionSwitchCell alloc], v5, 0, self, (uint64_t)sel__fingerDrawsCellDidChangeValue_);
    [(PKPaletteMoreOptionsViewController *)self setFingerDrawsCell:v6];

    v7 = [(PKPaletteMoreOptionsViewController *)self fingerDrawsCell];
    [v7 setAccessibilityIdentifier:@"Draw-with-Finger-Switch"];
  }
  BOOL v8 = [(PKPaletteMoreOptionsViewController *)self isFingerDrawsOn];
  v9 = [(PKPaletteMoreOptionsViewController *)self fingerDrawsCell];
  if (v9)
  {
    v10 = v9;
    [v9[52] setOn:v8];
    v9 = v10;
  }
}

- (void)_updateAutoRefineCell
{
  BOOL v3 = [(PKPaletteMoreOptionsViewController *)self autoRefineCell];

  if (v3)
  {
    BOOL v4 = [(PKPaletteMoreOptionsViewController *)self isAutoRefineOn];
    id v5 = [(PKPaletteMoreOptionsViewController *)self autoRefineCell];
    if (v5)
    {
      v6 = v5;
      [v5[52] setOn:v4];
      id v5 = v6;
    }
  }
}

- (void)_autoMinimizeCellDidChangeValue:(id)a3
{
  self->_autoHideOn = [a3 isOn];
  [(PKPaletteMoreOptionsViewController *)self _updateAutoMinimizeCell];
  id v4 = [(PKPaletteMoreOptionsViewController *)self delegate];
  [v4 moreOptionsViewControllerDidToggleAutoHide:self];
}

- (void)_fingerDrawsCellDidChangeValue:(id)a3
{
  self->_isFingerDrawsOn = [a3 isOn];
  [(PKPaletteMoreOptionsViewController *)self _updateFingerDrawsCell];
  id v4 = [(PKPaletteMoreOptionsViewController *)self delegate];
  [v4 moreOptionsViewControllerDidToggleFingerDraws:self];
}

- (void)_autoRefineCellDidChangeValue:(id)a3
{
  self->_isAutoRefineOn = [a3 isOn];
  [(PKPaletteMoreOptionsViewController *)self _updateAutoRefineCell];
  id v4 = [(PKPaletteMoreOptionsViewController *)self delegate];
  [v4 moreOptionsViewControllerDidToggleAutoRefine:self];
}

- (void)setShouldShowTapToRadarOption:(BOOL)a3
{
  if (self->_shouldShowTapToRadarOption != a3)
  {
    self->_shouldShowTapToRadarOption = a3;
    [(PKPaletteMoreOptionsViewController *)self _reloadItems];
  }
}

- (BOOL)_shouldInstallTapToRadarCell
{
  if (os_variant_has_internal_diagnostics()
    && [(PKPaletteMoreOptionsViewController *)self shouldShowTapToRadarOption])
  {
    id v5 = [(PKPaletteMoreOptionsViewController *)self tapToRadarCell];
    BOOL v3 = ![(PKPaletteMoreOptionsViewController *)self _isCellInstalled:v5];
  }
  else
  {
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (BOOL)_shouldRemoveTapToRadarCell
{
  if ((os_variant_has_internal_diagnostics() & 1) != 0
    || [(PKPaletteMoreOptionsViewController *)self shouldShowTapToRadarOption])
  {
    return 0;
  }
  id v4 = [(PKPaletteMoreOptionsViewController *)self tapToRadarCell];
  BOOL v5 = [(PKPaletteMoreOptionsViewController *)self _isCellInstalled:v4];

  return v5;
}

- (void)_handleTapToRadarCellTapped
{
  BOOL v3 = [(PKPaletteMoreOptionsViewController *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(PKPaletteMoreOptionsViewController *)self delegate];
    [v5 moreOptionsViewControllerDidSelectTapToRadar:self];
  }
}

- (void)setShouldShowResetHandwritingEducationPane:(BOOL)a3
{
  if (self->_shouldShowResetHandwritingEducationPane != a3)
  {
    self->_shouldShowResetHandwritingEducationPane = a3;
    [(PKPaletteMoreOptionsViewController *)self _reloadItems];
  }
}

- (BOOL)_shouldInstallResetHandwritingEducationPanelCell
{
  if ([(PKPaletteMoreOptionsViewController *)self shouldShowResetHandwritingEducationPane])
  {
    BOOL v3 = [(PKPaletteMoreOptionsViewController *)self resetHandwritingEducationPaneCell];
    BOOL v4 = ![(PKPaletteMoreOptionsViewController *)self _isCellInstalled:v3];
  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (BOOL)_shouldRemoveResetHandwritingEducationPanelCell
{
  if ([(PKPaletteMoreOptionsViewController *)self shouldShowResetHandwritingEducationPane])
  {
    return 0;
  }
  BOOL v4 = [(PKPaletteMoreOptionsViewController *)self resetHandwritingEducationPaneCell];
  BOOL v5 = [(PKPaletteMoreOptionsViewController *)self _isCellInstalled:v4];

  return v5;
}

- (void)_handleResetHandwritingEducationPaneCellTapped
{
  BOOL v3 = [(PKPaletteMoreOptionsViewController *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(PKPaletteMoreOptionsViewController *)self delegate];
    [v5 moreOptionsViewControllerDidSelectResetHandwritingEducationPane:self];
  }
}

- (void)setShouldShowOpenPencilSettingsOption:(BOOL)a3
{
  if (self->_shouldShowOpenPencilSettingsOption != a3)
  {
    self->_shouldShowOpenPencilSettingsOption = a3;
    [(PKPaletteMoreOptionsViewController *)self _reloadItems];
  }
}

- (BOOL)_shouldInstallOpenPencilSettingsCell
{
  if ([(PKPaletteMoreOptionsViewController *)self shouldShowOpenPencilSettingsOption])
  {
    BOOL v3 = [(PKPaletteMoreOptionsViewController *)self openPencilSettingsCell];
    BOOL v4 = ![(PKPaletteMoreOptionsViewController *)self _isCellInstalled:v3];
  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (BOOL)_shouldRemoveOpenPencilSettingsCell
{
  if ([(PKPaletteMoreOptionsViewController *)self shouldShowOpenPencilSettingsOption])
  {
    return 0;
  }
  BOOL v4 = [(PKPaletteMoreOptionsViewController *)self openPencilSettingsCell];
  BOOL v5 = [(PKPaletteMoreOptionsViewController *)self _isCellInstalled:v4];

  return v5;
}

- (void)_handleOpenPencilSettingsCellTapped
{
  BOOL v3 = [(PKPaletteMoreOptionsViewController *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(PKPaletteMoreOptionsViewController *)self delegate];
    [v5 moreOptionsViewControllerDidSelectOpenPencilSettings:self];
  }
}

- (void)_reloadItems
{
  uint64_t v93 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(PKPaletteMoreOptionsViewController *)self stackView];

  if (!v3) {
    return;
  }
  long long v89 = 0u;
  long long v90 = 0u;
  long long v87 = 0u;
  long long v88 = 0u;
  char v4 = [(PKPaletteMoreOptionsViewController *)self stackView];
  id v5 = [v4 arrangedSubviews];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v87 objects:v92 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v88;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v88 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v87 + 1) + 8 * i);
        v11 = [(PKPaletteMoreOptionsViewController *)self stackView];
        [v11 removeArrangedSubview:v10];

        [v10 removeFromSuperview];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v87 objects:v92 count:16];
    }
    while (v7);
  }

  if ([(PKPaletteMoreOptionsViewController *)self shouldShowAutoMinimizeOption]
    && ([(PKPaletteMoreOptionsViewController *)self autoMinimizeCell],
        v12 = objc_claimAutoreleasedReturnValue(),
        BOOL v13 = [(PKPaletteMoreOptionsViewController *)self _isCellInstalled:v12],
        v12,
        !v13))
  {
    v17 = _PencilKitBundle();
    v18 = [v17 localizedStringForKey:@"Auto-minimize" value:@"Auto-minimize" table:@"Localizable"];

    double v19 = -[PKPaletteOptionSwitchCell initWithTitle:subtitle:target:action:]([PKPaletteOptionSwitchCell alloc], v18, 0, self, (uint64_t)sel__autoMinimizeCellDidChangeValue_);
    [(PKPaletteMoreOptionsViewController *)self setAutoMinimizeCell:v19];

    v20 = [(PKPaletteMoreOptionsViewController *)self autoMinimizeCell];
    [v20 setAccessibilityIdentifier:@"Auto-minimize-Switch"];

    v21 = [(PKPaletteMoreOptionsViewController *)self stackView];
    v22 = [(PKPaletteMoreOptionsViewController *)self autoMinimizeCell];
    [v21 addArrangedSubview:v22];
  }
  else if (![(PKPaletteMoreOptionsViewController *)self shouldShowAutoMinimizeOption])
  {
    v14 = [(PKPaletteMoreOptionsViewController *)self autoMinimizeCell];
    BOOL v15 = [(PKPaletteMoreOptionsViewController *)self _isCellInstalled:v14];

    if (v15)
    {
      v16 = [(PKPaletteMoreOptionsViewController *)self autoMinimizeCell];
      [v16 removeFromSuperview];

      [(PKPaletteMoreOptionsViewController *)self setAutoMinimizeCell:0];
    }
  }
  v23 = [(PKPaletteMoreOptionsViewController *)self autoMinimizeCell];
  BOOL v24 = [(PKPaletteMoreOptionsViewController *)self _isCellInstalled:v23];

  if (v24) {
    [(PKPaletteMoreOptionsViewController *)self _updateAutoMinimizeCell];
  }
  if ([(PKPaletteMoreOptionsViewController *)self shouldShowFingerDrawsOption])
  {
    [(PKPaletteMoreOptionsViewController *)self _updateFingerDrawsCell];
    v25 = [(PKPaletteMoreOptionsViewController *)self stackView];
    v26 = [(PKPaletteMoreOptionsViewController *)self fingerDrawsCell];
    [v25 addArrangedSubview:v26];
  }
  if (_os_feature_enabled_impl()
    && PKCurrentAppSupportsRefinement()
    && [(id)objc_opt_class() hasAutoRefineLocaleEnabled])
  {
    if (PKIsPadDevice() && CHGetPersonalizedSynthesisSupportState() >= 3)
    {
      v27 = [(PKPaletteMoreOptionsViewController *)self autoRefineNotReadyCell];
      BOOL v28 = [(PKPaletteMoreOptionsViewController *)self _isCellInstalled:v27];

      if (v28)
      {
        v29 = [(PKPaletteMoreOptionsViewController *)self autoRefineNotReadyCell];
        [v29 removeFromSuperview];

        [(PKPaletteMoreOptionsViewController *)self setAutoRefineNotReadyCell:0];
      }
      v30 = [(PKPaletteMoreOptionsViewController *)self autoRefineCell];

      if (!v30)
      {
        v31 = _PencilKitBundle();
        v32 = [v31 localizedStringForKey:@"Auto-refine Handwriting" value:@"Auto-refine Handwriting" table:@"Localizable"];

        v33 = -[PKPaletteOptionSwitchCell initWithTitle:subtitle:target:action:]([PKPaletteOptionSwitchCell alloc], v32, 0, self, (uint64_t)sel__autoRefineCellDidChangeValue_);
        [(PKPaletteMoreOptionsViewController *)self setAutoRefineCell:v33];

        v34 = [(PKPaletteMoreOptionsViewController *)self autoRefineCell];
        [v34 setAccessibilityIdentifier:@"Auto-refine-Switch"];
      }
      [(PKPaletteMoreOptionsViewController *)self _updateAutoRefineCell];
      v35 = [(PKPaletteMoreOptionsViewController *)self stackView];
      uint64_t v36 = [(PKPaletteMoreOptionsViewController *)self autoRefineCell];
    }
    else
    {
      uint64_t v37 = CHGetPersonalizedSynthesisSupportState();
      if (!PKIsPadDevice() || v37 < 1 || v37 > 2) {
        goto LABEL_46;
      }
      v38 = [(PKPaletteMoreOptionsViewController *)self autoRefineCell];
      BOOL v39 = [(PKPaletteMoreOptionsViewController *)self _isCellInstalled:v38];

      if (v39)
      {
        v40 = [(PKPaletteMoreOptionsViewController *)self autoRefineCell];
        [v40 removeFromSuperview];

        [(PKPaletteMoreOptionsViewController *)self setAutoRefineCell:0];
      }
      v41 = [(PKPaletteMoreOptionsViewController *)self autoRefineNotReadyCell];

      if (!v41)
      {
        BOOL v42 = PKIsPadDevice() && CHGetPersonalizedSynthesisSupportState() == 2;
        objc_super v43 = _PencilKitBundle();
        v44 = [v43 localizedStringForKey:@"Auto-refine Handwriting" value:@"Auto-refine Handwriting" table:@"Localizable"];

        if (v42)
        {
          v45 = _PencilKitBundle();
          v46 = v45;
          v47 = @"Auto-Refine will be available in a few minutes.";
        }
        else
        {
          int v48 = MGGetBoolAnswer();
          v45 = _PencilKitBundle();
          v46 = v45;
          if (v48) {
            v47 = @"Support for improving handwriting legibility will download when connected to WLAN.";
          }
          else {
            v47 = @"Support for improving handwriting legibility will download when connected to Wi-Fi.";
          }
        }
        v49 = [v45 localizedStringForKey:v47 value:v47 table:@"Localizable"];

        v50 = -[PKPaletteOptionInfoCell initWithTitle:detailText:]([PKPaletteOptionInfoCell alloc], v44, v49);
        [(PKPaletteMoreOptionsViewController *)self setAutoRefineNotReadyCell:v50];

        v51 = [(PKPaletteMoreOptionsViewController *)self autoRefineNotReadyCell];
        [v51 setAccessibilityIdentifier:@"Auto-refine-Info"];
      }
      v35 = [(PKPaletteMoreOptionsViewController *)self stackView];
      uint64_t v36 = [(PKPaletteMoreOptionsViewController *)self autoRefineNotReadyCell];
    }
    v52 = (void *)v36;
    [v35 addArrangedSubview:v36];
  }
LABEL_46:
  if ([(PKPaletteMoreOptionsViewController *)self _shouldInstallTapToRadarCell])
  {
    v53 = _PencilKitBundle();
    v54 = [v53 localizedStringForKey:@"Report a Problem…" value:@"Report a Problem…" table:@"Localizable"];

    v55 = -[PKPaletteOptionTitleCell initWithTitle:target:action:]([PKPaletteOptionTitleCell alloc], v54, self, (uint64_t)sel__handleTapToRadarCellTapped);
    [(PKPaletteMoreOptionsViewController *)self setTapToRadarCell:v55];

    v56 = [(PKPaletteMoreOptionsViewController *)self stackView];
    v57 = [(PKPaletteMoreOptionsViewController *)self tapToRadarCell];
    [v56 addArrangedSubview:v57];
  }
  else if ([(PKPaletteMoreOptionsViewController *)self _shouldRemoveTapToRadarCell])
  {
    v58 = [(PKPaletteMoreOptionsViewController *)self tapToRadarCell];
    [v58 removeFromSuperview];

    [(PKPaletteMoreOptionsViewController *)self setTapToRadarCell:0];
  }
  if ([(PKPaletteMoreOptionsViewController *)self _shouldInstallResetHandwritingEducationPanelCell])
  {
    v59 = _PencilKitBundle();
    v60 = [v59 localizedStringForKey:@"Reset Handwriting Education Pane" value:@"Reset Handwriting Education Pane" table:@"Localizable"];

    v61 = -[PKPaletteOptionTitleCell initWithTitle:target:action:]([PKPaletteOptionTitleCell alloc], v60, self, (uint64_t)sel__handleResetHandwritingEducationPaneCellTapped);
    [(PKPaletteMoreOptionsViewController *)self setResetHandwritingEducationPaneCell:v61];

    v62 = [(PKPaletteMoreOptionsViewController *)self stackView];
    v63 = [(PKPaletteMoreOptionsViewController *)self resetHandwritingEducationPaneCell];
    [v62 addArrangedSubview:v63];
  }
  else if ([(PKPaletteMoreOptionsViewController *)self _shouldRemoveResetHandwritingEducationPanelCell])
  {
    v64 = [(PKPaletteMoreOptionsViewController *)self resetHandwritingEducationPaneCell];
    [v64 removeFromSuperview];

    [(PKPaletteMoreOptionsViewController *)self setResetHandwritingEducationPaneCell:0];
  }
  [(PKPaletteMoreOptionsViewController *)self _reloadResetImageWandOnboardingCell];
  if ([(PKPaletteMoreOptionsViewController *)self _shouldInstallOpenPencilSettingsCell])
  {
    v65 = _PencilKitBundle();
    v66 = [v65 localizedStringForKey:@"Pencil Settings…" value:@"Pencil Settings…" table:@"Localizable"];

    v67 = -[PKPaletteOptionTitleCell initWithTitle:target:action:]([PKPaletteOptionTitleCell alloc], v66, self, (uint64_t)sel__handleOpenPencilSettingsCellTapped);
    [(PKPaletteMoreOptionsViewController *)self setOpenPencilSettingsCell:v67];

    v68 = [(PKPaletteMoreOptionsViewController *)self stackView];
    v69 = [(PKPaletteMoreOptionsViewController *)self openPencilSettingsCell];
    [v68 addArrangedSubview:v69];
  }
  else if ([(PKPaletteMoreOptionsViewController *)self _shouldRemoveOpenPencilSettingsCell])
  {
    v70 = [(PKPaletteMoreOptionsViewController *)self openPencilSettingsCell];
    [v70 removeFromSuperview];

    [(PKPaletteMoreOptionsViewController *)self setOpenPencilSettingsCell:0];
  }
  v71 = [(PKPaletteMoreOptionsViewController *)self stackView];
  v72 = [v71 arrangedSubviews];
  unint64_t v73 = [v72 count];

  if (v73 >= 2)
  {
    v74 = [(PKPaletteMoreOptionsViewController *)self stackView];
    v75 = [v74 arrangedSubviews];
    uint64_t v76 = [v75 count];

    if (v76 != 1)
    {
      unint64_t v77 = 0;
      do
      {
        v78 = objc_alloc_init(PKPaletteOptionCellDividerView);
        [(PKPaletteOptionCellDividerView *)v78 setTranslatesAutoresizingMaskIntoConstraints:0];
        v79 = [(PKPaletteMoreOptionsViewController *)self stackView];
        [v79 insertArrangedSubview:v78 atIndex:v77 + 1];

        v80 = (void *)MEMORY[0x1E4F28DC8];
        v81 = [(PKPaletteOptionCellDividerView *)v78 heightAnchor];
        v82 = [v81 constraintEqualToConstant:0.5];
        v91 = v82;
        v83 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v91 count:1];
        [v80 activateConstraints:v83];

        v77 += 2;
        v84 = [(PKPaletteMoreOptionsViewController *)self stackView];
        v85 = [v84 arrangedSubviews];
        unint64_t v86 = [v85 count] - 1;
      }
      while (v77 < v86);
    }
  }
  [(PKPaletteMoreOptionsViewController *)self _updateContentSize];
}

- (void)_reloadResetImageWandOnboardingCell
{
  BOOL v3 = +[PKInternalSettings sharedInstance]();
  int v4 = -[PKInternalSettings showResetImageWandOnboardingInPalette]((uint64_t)v3);

  BOOL v5 = [(PKPaletteMoreOptionsViewController *)self _isCellInstalled:self->_resetImageWandOnboardingPaneCell];
  if (!v4 || v5)
  {
    if ((v4 | !v5)) {
      return;
    }
    [(PKPaletteOptionTitleCell *)self->_resetImageWandOnboardingPaneCell removeFromSuperview];
    resetImageWandOnboardingPaneCell = self->_resetImageWandOnboardingPaneCell;
    self->_resetImageWandOnboardingPaneCell = 0;
  }
  else
  {
    uint64_t v6 = (PKPaletteOptionTitleCell *)-[PKPaletteOptionTitleCell initWithTitle:target:action:]([PKPaletteOptionTitleCell alloc], @"Reset Image Wand Onboarding", self, (uint64_t)sel__handleResetImageWandOnboardingCellTapped_);
    uint64_t v7 = self->_resetImageWandOnboardingPaneCell;
    self->_resetImageWandOnboardingPaneCell = v6;

    v9 = [(PKPaletteMoreOptionsViewController *)self stackView];
    [(PKPaletteOptionTitleCell *)v9 addArrangedSubview:self->_resetImageWandOnboardingPaneCell];
    resetImageWandOnboardingPaneCell = v9;
  }
}

- (void)_handleResetImageWandOnboardingCellTapped:(id)a3
{
  if (os_variant_has_internal_diagnostics())
  {
    +[PKImageWandOnboardingController resetOnboarding];
    [(PKPaletteMoreOptionsViewController *)self dismissViewControllerAnimated:1 completion:0];
  }
}

- (BOOL)_isCellInstalled:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v4 = a3;
  BOOL v5 = [(PKPaletteMoreOptionsViewController *)self stackView];
  uint64_t v6 = [v5 arrangedSubviews];
  char v7 = [v6 containsObject:v4];

  return v7;
}

- (void)_updateContentSize
{
  BOOL v3 = [(PKPaletteMoreOptionsViewController *)self stackView];

  if (v3)
  {
    id v4 = (void *)MEMORY[0x1E4F28DC8];
    BOOL v5 = [(PKPaletteMoreOptionsViewController *)self stackViewPositioningConstraints];
    [v4 deactivateConstraints:v5];

    uint64_t v6 = [(PKPaletteMoreOptionsViewController *)self stackView];
    objc_msgSend(v6, "systemLayoutSizeFittingSize:", *MEMORY[0x1E4FB2C68], *(double *)(MEMORY[0x1E4FB2C68] + 8));
    double v8 = v7;
    double v10 = v9;

    [(PKPaletteMoreOptionsViewController *)self _contentSizeMinWidth];
    if (v11 < v8) {
      double v11 = v8;
    }
    if (v11 > 500.0) {
      double v11 = 500.0;
    }
    -[PKPaletteMoreOptionsViewController setPreferredContentSize:](self, "setPreferredContentSize:", v11, v10);
    v12 = (void *)MEMORY[0x1E4F28DC8];
    id v13 = [(PKPaletteMoreOptionsViewController *)self stackViewPositioningConstraints];
    [v12 activateConstraints:v13];
  }
}

- (double)_contentSizeMinWidth
{
  v2 = [(PKPaletteMoreOptionsViewController *)self externalTraitCollection];
  if ([v2 horizontalSizeClass] == 1) {
    double v3 = 200.0;
  }
  else {
    double v3 = 250.0;
  }

  return v3;
}

- (void)setIsAutoRefineOn:(BOOL)a3
{
  if (self->_isAutoRefineOn != a3)
  {
    BOOL v3 = a3;
    self->_isAutoRefineOn = a3;
    id v4 = [(PKPaletteMoreOptionsViewController *)self autoRefineCell];
    if (v4)
    {
      BOOL v5 = v4;
      [v4[52] setOn:v3];
      id v4 = v5;
    }
  }
}

- (PKPaletteMoreOptionsViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKPaletteMoreOptionsViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)shouldShowAutoMinimizeOption
{
  return self->_shouldShowAutoMinimizeOption;
}

- (void)setShouldShowAutoMinimizeOption:(BOOL)a3
{
  self->_shouldShowAutoMinimizeOption = a3;
}

- (BOOL)shouldShowFingerDrawsOption
{
  return self->_shouldShowFingerDrawsOption;
}

- (BOOL)isAutoHideOn
{
  return self->_autoHideOn;
}

- (BOOL)isFingerDrawsOn
{
  return self->_isFingerDrawsOn;
}

- (BOOL)shouldShowTapToRadarOption
{
  return self->_shouldShowTapToRadarOption;
}

- (BOOL)shouldShowResetHandwritingEducationPane
{
  return self->_shouldShowResetHandwritingEducationPane;
}

- (BOOL)shouldShowOpenPencilSettingsOption
{
  return self->_shouldShowOpenPencilSettingsOption;
}

- (BOOL)isAutoRefineOn
{
  return self->_isAutoRefineOn;
}

- (UITraitCollection)externalTraitCollection
{
  return self->_externalTraitCollection;
}

- (NSArray)stackViewPositioningConstraints
{
  return self->_stackViewPositioningConstraints;
}

- (void)setStackViewPositioningConstraints:(id)a3
{
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
}

- (PKPaletteOptionSwitchCell)autoMinimizeCell
{
  return self->_autoMinimizeCell;
}

- (void)setAutoMinimizeCell:(id)a3
{
}

- (PKPaletteOptionSwitchCell)shapesCell
{
  return self->_shapesCell;
}

- (void)setShapesCell:(id)a3
{
}

- (PKPaletteOptionSwitchCell)fingerDrawsCell
{
  return self->_fingerDrawsCell;
}

- (void)setFingerDrawsCell:(id)a3
{
}

- (PKPaletteOptionTitleCell)tapToRadarCell
{
  return self->_tapToRadarCell;
}

- (void)setTapToRadarCell:(id)a3
{
}

- (PKPaletteOptionTitleCell)resetHandwritingEducationPaneCell
{
  return self->_resetHandwritingEducationPaneCell;
}

- (void)setResetHandwritingEducationPaneCell:(id)a3
{
}

- (PKPaletteOptionTitleCell)resetImageWandOnboardingPaneCell
{
  return self->_resetImageWandOnboardingPaneCell;
}

- (void)setResetImageWandOnboardingPaneCell:(id)a3
{
}

- (PKPaletteOptionTitleCell)openPencilSettingsCell
{
  return self->_openPencilSettingsCell;
}

- (void)setOpenPencilSettingsCell:(id)a3
{
}

- (PKPaletteOptionSwitchCell)autoRefineCell
{
  return self->_autoRefineCell;
}

- (void)setAutoRefineCell:(id)a3
{
}

- (PKPaletteOptionInfoCell)autoRefineNotReadyCell
{
  return self->_autoRefineNotReadyCell;
}

- (void)setAutoRefineNotReadyCell:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_autoRefineNotReadyCell, 0);
  objc_storeStrong((id *)&self->_autoRefineCell, 0);
  objc_storeStrong((id *)&self->_openPencilSettingsCell, 0);
  objc_storeStrong((id *)&self->_resetImageWandOnboardingPaneCell, 0);
  objc_storeStrong((id *)&self->_resetHandwritingEducationPaneCell, 0);
  objc_storeStrong((id *)&self->_tapToRadarCell, 0);
  objc_storeStrong((id *)&self->_fingerDrawsCell, 0);
  objc_storeStrong((id *)&self->_shapesCell, 0);
  objc_storeStrong((id *)&self->_autoMinimizeCell, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_stackViewPositioningConstraints, 0);
  objc_storeStrong((id *)&self->_externalTraitCollection, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end