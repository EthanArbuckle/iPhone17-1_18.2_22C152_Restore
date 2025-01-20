@interface HUMediaSelectionViewController
- (BOOL)_allowRowInteractionForIndexPath:(id)a3;
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (Class)cellClassForItem:(id)a3 indexPath:(id)a4;
- (HUMediaSelectionItemManager)mediaSelectionItemManager;
- (HUMediaSelectionViewController)initWithActionSetBuilder:(id)a3;
- (HUMediaSelectionViewControllerDelegate)delegate;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4;
- (unint64_t)lastTargetOptions;
- (void)_presentMediaPickerUnavailablePromptWithReason:(int64_t)a3 storeKitErrorObject:(id)a4;
- (void)_presentMediaPickerWithOptionsShowsLibraryContent:(BOOL)a3 pickingForExternalPlayer:(BOOL)a4;
- (void)applyAccessory:(int64_t)a3 toItem:(id)a4 onTableView:(id)a5;
- (void)itemManager:(id)a3 didUpdateResultsForItem:(id)a4 atIndexPath:(id)a5;
- (void)mediaPicker:(id)a3 didPickPlaybackArchive:(id)a4;
- (void)mediaPickerDidCancel:(id)a3;
- (void)mediaPickerDidPickPlaybackArchive:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setLastTargetOptions:(unint64_t)a3;
- (void)setMediaSelectionItemManager:(id)a3;
- (void)setupCell:(id)a3 forItem:(id)a4 indexPath:(id)a5;
- (void)sliderValueTableViewCell:(id)a3 didChangeValue:(double)a4;
- (void)switchCell:(id)a3 didTurnOn:(BOOL)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)updateCell:(id)a3 forItem:(id)a4 indexPath:(id)a5 animated:(BOOL)a6;
- (void)viewDidLoad;
@end

@implementation HUMediaSelectionViewController

- (HUMediaSelectionViewController)initWithActionSetBuilder:(id)a3
{
  id v4 = a3;
  v5 = [[HUMediaSelectionItemManager alloc] initWithDelegate:self mediaPlaybackActionBuilder:v4];

  v10.receiver = self;
  v10.super_class = (Class)HUMediaSelectionViewController;
  v6 = [(HUItemTableViewController *)&v10 initWithItemManager:v5 tableViewStyle:1];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_mediaSelectionItemManager, v5);
    v8 = _HULocalizedStringWithDefaultValue(@"HUMediaSelectionTitle", @"HUMediaSelectionTitle", 1);
    [(HUMediaSelectionViewController *)v7 setTitle:v8];
  }
  return v7;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)HUMediaSelectionViewController;
  [(HUItemTableViewController *)&v3 viewDidLoad];
  [(HUMediaSelectionViewController *)self setModalInPresentation:1];
}

- (Class)cellClassForItem:(id)a3 indexPath:(id)a4
{
  id v5 = a3;
  objc_opt_class();
  id v6 = v5;
  if (objc_opt_isKindOfClass()) {
    v7 = v6;
  }
  else {
    v7 = 0;
  }
  id v8 = v7;

  v9 = [(HUMediaSelectionViewController *)self mediaSelectionItemManager];
  id v10 = [v9 mediaPickerItem];

  if (v10 != v6)
  {
    if (!v8
      || ([(HUMediaSelectionViewController *)self mediaSelectionItemManager],
          v11 = objc_claimAutoreleasedReturnValue(),
          [v11 playbackOptionsItems],
          v12 = objc_claimAutoreleasedReturnValue(),
          char v13 = [v12 containsObject:v8],
          v12,
          v11,
          (v13 & 1) == 0))
    {
      v14 = [(HUMediaSelectionViewController *)self mediaSelectionItemManager];
      id v15 = [v14 chosenMediaItem];

      if (v15 != v6)
      {
        v16 = [(HUMediaSelectionViewController *)self mediaSelectionItemManager];
        [v16 volumeSliderItem];
      }
    }
  }
  v17 = objc_opt_class();

  return (Class)v17;
}

- (void)setupCell:(id)a3 forItem:(id)a4 indexPath:(id)a5
{
  id v32 = a3;
  id v7 = a4;
  id v8 = [(HUMediaSelectionViewController *)self mediaSelectionItemManager];
  v9 = [v8 playbackStateItems];
  int v10 = [v9 containsObject:v7];

  if (v10) {
    goto LABEL_10;
  }
  v11 = [(HUMediaSelectionViewController *)self mediaSelectionItemManager];
  uint64_t v12 = [v11 useCustomVolumeItem];
  if ((id)v12 == v7)
  {

    goto LABEL_10;
  }
  char v13 = (void *)v12;
  v14 = [(HUMediaSelectionViewController *)self mediaSelectionItemManager];
  id v15 = [v14 useCurrentVolumeItem];

  if (v15 == v7)
  {
LABEL_10:
    objc_opt_class();
    id v27 = v32;
    if (objc_opt_isKindOfClass()) {
      v28 = v27;
    }
    else {
      v28 = 0;
    }
    id v25 = v28;

    [v25 setHideIcon:1];
LABEL_14:

    goto LABEL_15;
  }
  v16 = [(HUMediaSelectionViewController *)self mediaSelectionItemManager];
  uint64_t v17 = [v16 selectedPlaybackStateItem];
  if ((id)v17 == v7)
  {
  }
  else
  {
    v18 = (void *)v17;
    v19 = [(HUMediaSelectionViewController *)self mediaSelectionItemManager];
    id v20 = [v19 selectedVolumeItem];

    if (v20 != v7)
    {
      v21 = [(HUMediaSelectionViewController *)self mediaSelectionItemManager];
      id v22 = [v21 volumeSliderItem];

      if (v22 == v7)
      {
        id v25 = v32;
        [v25 setDelegate:self];
        [v25 setMinimumValue:0.0];
        [v25 setMaximumValue:100.0];
        v29 = [MEMORY[0x1E4F42A80] _systemImageNamed:@"speaker.fill"];
        [v25 setMinimumValueImage:v29];

        v30 = [MEMORY[0x1E4F42A80] _systemImageNamed:@"speaker.wave.3.fill"];
        [v25 setMaximumValueImage:v30];

        v31 = [MEMORY[0x1E4F428B8] systemGrayColor];
        [v25 setTintColor:v31];

        [v25 setShowValue:0];
      }
      else
      {
        v23 = [(HUMediaSelectionViewController *)self mediaSelectionItemManager];
        id v24 = [v23 chosenMediaItem];

        if (v24 != v7) {
          goto LABEL_15;
        }
        id v25 = v32;
        [v25 setIconDisplayStyle:1];
        v26 = [v25 contentMetrics];
        objc_msgSend(v26, "setIconSize:", 64.0, 64.0);

        [v25 setHideDescriptionIcon:1];
        [v25 setSeparatorInsetLinesUpWithText:0];
      }
      goto LABEL_14;
    }
  }
  [v32 setAccessoryType:3];
LABEL_15:
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v32 setDelegate:self];
  }
}

- (void)updateCell:(id)a3 forItem:(id)a4 indexPath:(id)a5 animated:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  v32.receiver = self;
  v32.super_class = (Class)HUMediaSelectionViewController;
  [(HUItemTableViewController *)&v32 updateCell:v10 forItem:v11 indexPath:a5 animated:v6];
  uint64_t v12 = [(HUMediaSelectionViewController *)self mediaSelectionItemManager];
  id v13 = [v12 chosenMediaItem];

  if (v13 == v11)
  {
    [v10 updateUIWithAnimation:v6];
    goto LABEL_16;
  }
  v14 = [(HUMediaSelectionViewController *)self mediaSelectionItemManager];
  id v15 = [v14 playbackStateItems];
  int v16 = [v15 containsObject:v11];

  if (v16)
  {
    id v17 = v10;
    v18 = [(HUMediaSelectionViewController *)self mediaSelectionItemManager];
    v19 = [v18 selectedPlaybackStateItem];
LABEL_11:
    id v27 = v19;

    if (v27 == v11) {
      uint64_t v28 = 3;
    }
    else {
      uint64_t v28 = 0;
    }
    [v17 setAccessoryType:v28];
    goto LABEL_15;
  }
  id v20 = [(HUMediaSelectionViewController *)self mediaSelectionItemManager];
  uint64_t v21 = [v20 useCustomVolumeItem];
  if ((id)v21 == v11)
  {

    goto LABEL_10;
  }
  id v22 = (void *)v21;
  v23 = [(HUMediaSelectionViewController *)self mediaSelectionItemManager];
  id v24 = [v23 useCurrentVolumeItem];

  if (v24 == v11)
  {
LABEL_10:
    id v17 = v10;
    v18 = [(HUMediaSelectionViewController *)self mediaSelectionItemManager];
    v19 = [v18 selectedVolumeItem];
    goto LABEL_11;
  }
  id v25 = [(HUMediaSelectionViewController *)self mediaSelectionItemManager];
  id v26 = [v25 volumeSliderItem];

  if (v26 == v11)
  {
    id v29 = v10;
    id v17 = [v11 latestResults];
    v30 = [v17 objectForKeyedSubscript:@"HOMediaVolumeResultKey"];
    [v30 floatValue];
    [v29 setValue:v31];

LABEL_15:
    goto LABEL_16;
  }
  [v10 setAccessoryType:0];
LABEL_16:
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  id v6 = a3;
  if (([MEMORY[0x1E4F69758] supportsMediaPicker] & 1) == 0)
  {
    id v7 = [(HUMediaSelectionViewController *)self mediaSelectionItemManager];
    id v8 = [v7 playbackStatePlayItem];
    v9 = [v8 latestResults];
    id v10 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4F68A08]];
    int v11 = [v10 BOOLValue];

    uint64_t v12 = [(HUMediaSelectionViewController *)self delegate];
    id v13 = [v12 mediaSelectionViewControllerMessageForMediaActionPlayUnavailable:self];
    v14 = _HULocalizedStringWithDefaultValue(v13, v13, 1);

    id v15 = [(HUMediaSelectionViewController *)self mediaSelectionItemManager];
    int v16 = [v15 displayedSectionIdentifierForSectionIndex:a4];
    id v17 = v16;
    if (v11) {
      v18 = HOMediaSelectionActionSectionIdentifier;
    }
    else {
      v18 = HOMediaSelectionPickerSectionIdentifier;
    }
    char v19 = [v16 isEqualToString:*v18];

    if (v19) {
      goto LABEL_8;
    }
  }
  v21.receiver = self;
  v21.super_class = (Class)HUMediaSelectionViewController;
  v14 = [(HUItemTableViewController *)&v21 tableView:v6 titleForFooterInSection:a4];
LABEL_8:

  return v14;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  return [(HUMediaSelectionViewController *)self _allowRowInteractionForIndexPath:a4];
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  id v5 = a4;
  if ([(HUMediaSelectionViewController *)self _allowRowInteractionForIndexPath:v5])
  {
    id v6 = v5;
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v56.receiver = self;
  v56.super_class = (Class)HUMediaSelectionViewController;
  [(HUItemTableViewController *)&v56 tableView:v6 didSelectRowAtIndexPath:v7];
  id v8 = [(HUItemTableViewController *)self itemManager];
  v9 = [v8 displayedItemAtIndexPath:v7];

  objc_opt_class();
  id v10 = v9;
  if (objc_opt_isKindOfClass()) {
    int v11 = v10;
  }
  else {
    int v11 = 0;
  }
  id v12 = v11;

  id v13 = [v6 cellForRowAtIndexPath:v7];
  v14 = [(HUMediaSelectionViewController *)self mediaSelectionItemManager];
  id v15 = [v14 mediaPickerItem];

  if (v10 == v15)
  {
    if (_os_feature_enabled_impl())
    {
      id v27 = [HUMediaSourceListViewController alloc];
      uint64_t v28 = [(HUMediaSelectionItemManager *)self->_mediaSelectionItemManager actionSetBuilder];
      id v29 = [v28 mediaAction];
      [v29 mediaProfiles];
      float v31 = v30 = v13;
      id v32 = [(HUMediaSourceListViewController *)v27 initForMediaProfileContainers:v31 forTarget:0];

      id v13 = v30;
      [v32 setDelegate:self];
      v33 = (void *)[objc_alloc(MEMORY[0x1E4F42BF8]) initWithRootViewController:v32];
      [(HUMediaSelectionViewController *)self presentViewController:v33 animated:1 completion:0];
      [v6 deselectRowAtIndexPath:v7 animated:1];

      goto LABEL_25;
    }
    v55 = v13;
    v34 = [v10 latestResults];
    v35 = [v34 objectForKeyedSubscript:@"HOMediaPickerUnavailableReasonKey"];

    v36 = [v10 latestResults];
    id v20 = v36;
    if (v35)
    {
      v37 = [v36 objectForKeyedSubscript:@"HOMediaPickerUnavailableReasonKey"];
      uint64_t v38 = [v37 integerValue];
      v39 = [v10 latestResults];
      v40 = [v39 objectForKeyedSubscript:@"HUMediaPickerUnavailableReasonStoreKitErrorObjectKey"];
      [(HUMediaSelectionViewController *)self _presentMediaPickerUnavailablePromptWithReason:v38 storeKitErrorObject:v40];
    }
    else
    {
      v42 = [v36 objectForKeyedSubscript:@"HOMediaSelectionShowLibraryContentKey"];
      uint64_t v43 = [v42 BOOLValue];
      v44 = [v10 latestResults];
      v45 = [v44 objectForKeyedSubscript:@"HOMediaSelectionPickingForExternalPlayerKey"];
      -[HUMediaSelectionViewController _presentMediaPickerWithOptionsShowsLibraryContent:pickingForExternalPlayer:](self, "_presentMediaPickerWithOptionsShowsLibraryContent:pickingForExternalPlayer:", v43, [v45 BOOLValue]);
    }
    id v13 = v55;
    goto LABEL_21;
  }
  if (v12)
  {
    int v16 = [(HUMediaSelectionViewController *)self mediaSelectionItemManager];
    id v17 = [v16 playbackStateItems];
    int v18 = [v17 containsObject:v12];

    if (v18)
    {
      char v19 = [(HUMediaSelectionViewController *)self mediaSelectionItemManager];
      id v20 = [v19 selectedPlaybackStateItem];

      [v13 setAccessoryType:3];
      objc_super v21 = [(HUMediaSelectionViewController *)self mediaSelectionItemManager];
      [v21 setSelectedPlaybackStateItem:v12];
      goto LABEL_17;
    }
  }
  id v22 = [(HUMediaSelectionViewController *)self mediaSelectionItemManager];
  uint64_t v23 = [v22 useCustomVolumeItem];
  if ((id)v23 == v10)
  {

LABEL_16:
    v41 = [(HUMediaSelectionViewController *)self mediaSelectionItemManager];
    id v20 = [v41 selectedVolumeItem];

    [v13 setAccessoryType:3];
    objc_super v21 = [(HUMediaSelectionViewController *)self mediaSelectionItemManager];
    [v21 setSelectedVolumeItem:v12];
LABEL_17:

    [(HUMediaSelectionViewController *)self updateCell:v13 forItem:v10 indexPath:v7 animated:1];
    if (v20) {
      [(HUMediaSelectionViewController *)self applyAccessory:0 toItem:v20 onTableView:v6];
    }
LABEL_21:

    goto LABEL_22;
  }
  id v24 = (void *)v23;
  id v25 = [(HUMediaSelectionViewController *)self mediaSelectionItemManager];
  id v26 = [v25 useCurrentVolumeItem];

  if (v26 == v10) {
    goto LABEL_16;
  }
LABEL_22:
  v46 = [(HUMediaSelectionViewController *)self mediaSelectionItemManager];
  id v47 = [v46 playbackStateAdjustVolumeOnlyItem];

  if (v10 == v47)
  {
    v48 = [(HUMediaSelectionViewController *)self mediaSelectionItemManager];
    v49 = [v48 useCustomVolumeItem];
    v50 = [(HUMediaSelectionViewController *)self mediaSelectionItemManager];
    [v50 setSelectedVolumeItem:v49];

    v51 = [(HUMediaSelectionViewController *)self mediaSelectionItemManager];
    v52 = [v51 useCurrentVolumeItem];
    [(HUMediaSelectionViewController *)self applyAccessory:0 toItem:v52 onTableView:v6];

    v53 = [(HUMediaSelectionViewController *)self mediaSelectionItemManager];
    v54 = [v53 useCustomVolumeItem];
    [(HUMediaSelectionViewController *)self applyAccessory:3 toItem:v54 onTableView:v6];
  }
  [v6 deselectRowAtIndexPath:v7 animated:1];
LABEL_25:
}

- (void)applyAccessory:(int64_t)a3 toItem:(id)a4 onTableView:(id)a5
{
  id v12 = a4;
  id v8 = a5;
  v9 = [(HUMediaSelectionViewController *)self mediaSelectionItemManager];
  id v10 = [v9 indexPathForItem:v12];

  int v11 = [v8 cellForRowAtIndexPath:v10];

  [v11 setAccessoryType:a3];
  if (v11) {
    [(HUMediaSelectionViewController *)self updateCell:v11 forItem:v12 indexPath:v10 animated:1];
  }
}

- (BOOL)_allowRowInteractionForIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [(HUMediaSelectionViewController *)self mediaSelectionItemManager];
  id v6 = [v5 actionSetBuilder];
  id v7 = [v6 home];
  int v8 = objc_msgSend(v7, "hf_currentUserIsAdministrator");

  if (v8)
  {
    v9 = [(HUMediaSelectionViewController *)self mediaSelectionItemManager];
    objc_msgSend(v9, "displayedSectionIdentifierForSectionIndex:", objc_msgSend(v4, "section"));
    id v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

    int v11 = [(HUItemTableViewController *)self itemManager];
    id v12 = [v11 displayedItemAtIndexPath:v4];

    if (v10 == @"HOMediaSelectionActionSectionIdentifier"
      || v10 == @"HOMediaSelectionVolumeSelectionSectionIdentifier"
      || ([(HUMediaSelectionViewController *)self mediaSelectionItemManager],
          id v13 = objc_claimAutoreleasedReturnValue(),
          [v13 mediaPickerItem],
          v14 = objc_claimAutoreleasedReturnValue(),
          v14,
          v13,
          v12 == v14))
    {
      int v16 = [v12 latestResults];
      id v17 = [v16 objectForKeyedSubscript:*MEMORY[0x1E4F68A08]];
      int v15 = [v17 BOOLValue] ^ 1;
    }
    else
    {
      LOBYTE(v15) = 0;
    }
  }
  else
  {
    LOBYTE(v15) = 0;
  }

  return v15;
}

- (void)_presentMediaPickerWithOptionsShowsLibraryContent:(BOOL)a3 pickingForExternalPlayer:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  id v7 = [(HUMediaSelectionViewController *)self mediaSelectionItemManager];
  int v8 = [v7 pickedPlaybackArchive];
  -[HUMediaSelectionViewController setLastTargetOptions:](self, "setLastTargetOptions:", [v8 targetOptions]);

  uint64_t v27 = 0;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x2050000000;
  v9 = (void *)_MergedGlobals_5;
  uint64_t v30 = _MergedGlobals_5;
  if (!_MergedGlobals_5)
  {
    uint64_t v22 = MEMORY[0x1E4F143A8];
    uint64_t v23 = 3221225472;
    id v24 = __getMPMediaPickerControllerClass_block_invoke;
    id v25 = &unk_1E63852F0;
    id v26 = &v27;
    __getMPMediaPickerControllerClass_block_invoke((uint64_t)&v22);
    v9 = (void *)v28[3];
  }
  id v10 = v9;
  _Block_object_dispose(&v27, 8);
  int v11 = (void *)[[v10 alloc] initWithSupportedTypeIdentifiers:&unk_1F19B55D0 selectionMode:4];
  [v11 setShowsCloudItems:1];
  [v11 setShowsItemsWithProtectedAssets:1];
  [v11 setShowsCatalogContent:1];
  [v11 setShowsLibraryContent:v5];
  [v11 setPickingForExternalPlayer:v4];
  id v12 = [MEMORY[0x1E4F42D90] mainScreen];
  [v12 scale];
  double v14 = v13;

  uint64_t v27 = 0;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x2050000000;
  int v15 = (void *)qword_1EBA47268;
  uint64_t v30 = qword_1EBA47268;
  if (!qword_1EBA47268)
  {
    uint64_t v22 = MEMORY[0x1E4F143A8];
    uint64_t v23 = 3221225472;
    id v24 = __getMPPlaybackArchiveConfigurationClass_block_invoke;
    id v25 = &unk_1E63852F0;
    id v26 = &v27;
    __getMPPlaybackArchiveConfigurationClass_block_invoke((uint64_t)&v22);
    int v15 = (void *)v28[3];
  }
  if (v14 <= 4.0) {
    double v16 = 256.0;
  }
  else {
    double v16 = v14 * 64.0;
  }
  id v17 = v15;
  _Block_object_dispose(&v27, 8);
  int v18 = objc_msgSend([v17 alloc], "initWithPreferredArtworkSize:", v16, v16);
  [v11 setPlaybackArchiveConfiguration:v18];

  [v11 setDelegate:self];
  [v11 setModalPresentationStyle:2];
  char v19 = [(HUMediaSelectionViewController *)self view];
  [v19 frame];
  objc_msgSend(v11, "setPreferredContentSize:", v20, v21);

  [(HUMediaSelectionViewController *)self presentViewController:v11 animated:1 completion:0];
}

- (void)_presentMediaPickerUnavailablePromptWithReason:(int64_t)a3 storeKitErrorObject:(id)a4
{
  id v6 = a4;
  if (a3 == 2)
  {
    id v7 = 0;
    int v9 = 0;
    id v10 = 0;
    int v8 = @"HUAlertError";
  }
  else if (a3 == 1)
  {
    id v7 = [MEMORY[0x1E4F1CB10] URLWithString:@"music://subscribe"];
    int v8 = @"HUMediaPickerUnavailableMusicCatalogPlaybackDisabledPromptTitle";
    int v9 = 1;
    id v10 = @"HUMediaPickerUnavailableMusicCatalogPlaybackDisabledPromptGetAppleMusicButton";
  }
  else if (a3)
  {
    id v7 = 0;
    int v9 = 0;
    id v10 = 0;
    int v8 = 0;
  }
  else
  {
    id v7 = +[HUMediaAccountUtilities musicAppURL];
    int v8 = @"HUMediaPickerUnavailableMusicAppUninstalledPromptTitle";
    int v9 = 1;
    id v10 = @"HUMediaPickerUnavailableMusicAppUninstalledPromptOpenAppStoreButton";
  }
  int v11 = [(HUMediaSelectionViewController *)self delegate];
  id v12 = [v11 mediaSelectionViewController:self messageForMediaPickerUnavailableReason:a3];

  id v24 = v6;
  if (v12) {
    _HULocalizedStringWithDefaultValue(v12, v12, 1);
  }
  else {
  double v13 = objc_msgSend(v6, "localizedDescription", v6);
  }
  double v14 = (void *)MEMORY[0x1E4F42728];
  int v15 = _HULocalizedStringWithDefaultValue(v8, v8, 1);
  double v16 = [v14 alertControllerWithTitle:v15 message:v13 preferredStyle:1];

  id v17 = (void *)MEMORY[0x1E4F42720];
  int v18 = _HULocalizedStringWithDefaultValue(@"HUOkTitle", @"HUOkTitle", 1);
  char v19 = [v17 actionWithTitle:v18 style:0 handler:0];
  [v16 addAction:v19];

  if (v7) {
    int v20 = v9;
  }
  else {
    int v20 = 0;
  }
  if (v20 == 1)
  {
    double v21 = (void *)MEMORY[0x1E4F42720];
    uint64_t v22 = _HULocalizedStringWithDefaultValue(v10, v10, 1);
    uint64_t v26 = MEMORY[0x1E4F143A8];
    uint64_t v27 = 3221225472;
    uint64_t v28 = __101__HUMediaSelectionViewController__presentMediaPickerUnavailablePromptWithReason_storeKitErrorObject___block_invoke;
    uint64_t v29 = &unk_1E6385188;
    id v30 = v7;
    uint64_t v23 = [v21 actionWithTitle:v22 style:0 handler:&v26];
    [v16 addAction:v23];
  }
  -[HUMediaSelectionViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v16, 1, 0, v24, v26, v27, v28, v29);
}

void __101__HUMediaSelectionViewController__presentMediaPickerUnavailablePromptWithReason_storeKitErrorObject___block_invoke(uint64_t a1)
{
  id v3 = [MEMORY[0x1E4F69378] sharedInstance];
  id v2 = (id)[v3 openURL:*(void *)(a1 + 32)];
}

- (void)mediaPicker:(id)a3 didPickPlaybackArchive:(id)a4
{
  id v6 = (objc_class *)MEMORY[0x1E4F693D8];
  id v7 = a4;
  int v8 = (void *)[[v6 alloc] initWithMediaPlayerPlaybackArchive:v7];

  int v9 = [(HUMediaSelectionViewController *)self mediaSelectionItemManager];
  [v9 setPickedPlaybackArchive:v8];

  unint64_t v10 = [(HUMediaSelectionViewController *)self lastTargetOptions];
  int v11 = [(HUMediaSelectionViewController *)self mediaSelectionItemManager];
  id v12 = [v11 pickedPlaybackArchive];
  [v12 setTargetOptions:v10];

  double v13 = [(HUMediaSelectionViewController *)self mediaSelectionItemManager];
  double v14 = [v13 pickedPlaybackArchive];
  [v14 setAutoPlayEnabled:0];

  int v15 = (void *)MEMORY[0x1E4F1CA80];
  double v16 = [(HUMediaSelectionViewController *)self mediaSelectionItemManager];
  id v17 = [v16 playbackOptionsItems];
  id v22 = [v15 setWithArray:v17];

  int v18 = [(HUMediaSelectionViewController *)self mediaSelectionItemManager];
  char v19 = [v18 chosenMediaItem];
  [v22 addObject:v19];

  int v20 = [(HUMediaSelectionViewController *)self mediaSelectionItemManager];
  id v21 = (id)[v20 updateResultsForItems:v22 senderSelector:a2];

  [(HUMediaSelectionViewController *)self dismissViewControllerAnimated:1 completion:0];
}

- (void)mediaPickerDidCancel:(id)a3
{
}

- (void)mediaPickerDidPickPlaybackArchive:(id)a3
{
  BOOL v5 = (objc_class *)MEMORY[0x1E4F693D8];
  id v6 = a3;
  id v7 = (void *)[[v5 alloc] initWithMediaPlayerPlaybackArchive:v6];

  int v8 = [(HUMediaSelectionViewController *)self mediaSelectionItemManager];
  [v8 setPickedPlaybackArchive:v7];

  unint64_t v9 = [(HUMediaSelectionViewController *)self lastTargetOptions];
  unint64_t v10 = [(HUMediaSelectionViewController *)self mediaSelectionItemManager];
  int v11 = [v10 pickedPlaybackArchive];
  [v11 setTargetOptions:v9];

  id v12 = [(HUMediaSelectionViewController *)self mediaSelectionItemManager];
  double v13 = [v12 pickedPlaybackArchive];
  [v13 setAutoPlayEnabled:0];

  double v14 = (void *)MEMORY[0x1E4F1CA80];
  int v15 = [(HUMediaSelectionViewController *)self mediaSelectionItemManager];
  double v16 = [v15 playbackOptionsItems];
  id v21 = [v14 setWithArray:v16];

  id v17 = [(HUMediaSelectionViewController *)self mediaSelectionItemManager];
  int v18 = [v17 chosenMediaItem];
  [v21 addObject:v18];

  char v19 = [(HUMediaSelectionViewController *)self mediaSelectionItemManager];
  id v20 = (id)[v19 updateResultsForItems:v21 senderSelector:a2];

  [(HUMediaSelectionViewController *)self dismissViewControllerAnimated:1 completion:0];
}

- (void)switchCell:(id)a3 didTurnOn:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(HUItemTableViewController *)self itemManager];
  int v8 = [(HUMediaSelectionViewController *)self tableView];
  unint64_t v9 = [v8 indexPathForCell:v6];

  id v11 = [v7 displayedItemAtIndexPath:v9];

  unint64_t v10 = [(HUMediaSelectionViewController *)self mediaSelectionItemManager];
  [v10 mediaPlaybackOptionsItem:v11 switchedOn:v4];
}

- (void)sliderValueTableViewCell:(id)a3 didChangeValue:(double)a4
{
  id v5 = [(HUMediaSelectionViewController *)self mediaSelectionItemManager];
  [v5 mediaVolumeValueChanged:a4];
}

- (void)itemManager:(id)a3 didUpdateResultsForItem:(id)a4 atIndexPath:(id)a5
{
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)HUMediaSelectionViewController;
  [(HUItemTableViewController *)&v15 itemManager:a3 didUpdateResultsForItem:v8 atIndexPath:a5];
  unint64_t v9 = [(HUMediaSelectionViewController *)self mediaSelectionItemManager];
  id v10 = [v9 mediaPickerItem];
  if (v10 != v8)
  {

LABEL_3:
    goto LABEL_4;
  }
  id v11 = [v8 latestResults];
  uint64_t v12 = [v11 objectForKeyedSubscript:@"HOMediaPickerUnavailableReasonKey"];
  if (!v12)
  {

    goto LABEL_3;
  }
  double v13 = (void *)v12;
  double v14 = [(HUMediaSelectionViewController *)self presentedViewController];

  if (v14) {
    [(HUMediaSelectionViewController *)self dismissViewControllerAnimated:1 completion:0];
  }
LABEL_4:
}

- (HUMediaSelectionViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HUMediaSelectionViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (HUMediaSelectionItemManager)mediaSelectionItemManager
{
  return self->_mediaSelectionItemManager;
}

- (void)setMediaSelectionItemManager:(id)a3
{
}

- (unint64_t)lastTargetOptions
{
  return self->_lastTargetOptions;
}

- (void)setLastTargetOptions:(unint64_t)a3
{
  self->_lastTargetOptions = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaSelectionItemManager, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end