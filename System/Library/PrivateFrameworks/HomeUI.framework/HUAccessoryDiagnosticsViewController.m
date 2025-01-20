@interface HUAccessoryDiagnosticsViewController
- (Class)cellClassForItem:(id)a3 indexPath:(id)a4;
- (HUAccessoryDiagnosticsItemManager)accessoryLogsItemManager;
- (HUAccessoryDiagnosticsViewController)initWithSourceItem:(id)a3;
- (void)generateNewLogs:(id)a3;
- (void)setAccessoryLogsItemManager:(id)a3;
- (void)showShareSheetForItem:(id)a3 withAnchorView:(id)a4;
- (void)switchCell:(id)a3 didTurnOn:(BOOL)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)updateCell:(id)a3 forItem:(id)a4 indexPath:(id)a5 animated:(BOOL)a6;
@end

@implementation HUAccessoryDiagnosticsViewController

- (HUAccessoryDiagnosticsViewController)initWithSourceItem:(id)a3
{
  id v4 = a3;
  v5 = [[HUAccessoryDiagnosticsItemManager alloc] initWithDelegate:self sourceItem:v4];

  v10.receiver = self;
  v10.super_class = (Class)HUAccessoryDiagnosticsViewController;
  v6 = [(HUItemTableViewController *)&v10 initWithItemManager:v5 tableViewStyle:1];
  v7 = v6;
  if (v6)
  {
    [(HUAccessoryDiagnosticsViewController *)v6 setAccessoryLogsItemManager:v5];
    [(HUItemTableViewController *)v7 setAutomaticallyUpdatesViewControllerTitle:0];
    v8 = _HULocalizedStringWithDefaultValue(@"HUAccessoryDiagnosticsTitle", @"HUAccessoryDiagnosticsTitle", 1);
    [(HUAccessoryDiagnosticsViewController *)v7 setTitle:v8];
  }
  return v7;
}

- (Class)cellClassForItem:(id)a3 indexPath:(id)a4
{
  id v5 = a3;
  v6 = [(HUAccessoryDiagnosticsViewController *)self accessoryLogsItemManager];
  v7 = [v6 fetchManufacturerSnapshotButtonItem];
  if ([v5 isEqual:v7]) {
    goto LABEL_4;
  }
  v8 = [(HUAccessoryDiagnosticsViewController *)self accessoryLogsItemManager];
  v9 = [v8 fetchADKSnapshotButtonItem];
  if ([v5 isEqual:v9])
  {

LABEL_4:
    goto LABEL_5;
  }
  v12 = [(HUAccessoryDiagnosticsViewController *)self accessoryLogsItemManager];
  v13 = [v12 fetchMatterSnapshotButtonItem];
  char v14 = [v5 isEqual:v13];

  if ((v14 & 1) == 0)
  {
    v15 = [(HUAccessoryDiagnosticsViewController *)self accessoryLogsItemManager];
    v16 = [v15 logCollectionFailedItem];
    char v17 = [v5 isEqual:v16];

    if ((v17 & 1) == 0)
    {
      v6 = [(HUAccessoryDiagnosticsViewController *)self accessoryLogsItemManager];
      v7 = [v6 enableVerboseLoggingItem];
      if ([v5 isEqual:v7]) {
        goto LABEL_4;
      }
      v18 = [(HUAccessoryDiagnosticsViewController *)self accessoryLogsItemManager];
      v19 = [v18 enableAudioClipLoggingItem];
      [v5 isEqual:v19];
    }
  }
LABEL_5:
  objc_super v10 = objc_opt_class();

  return (Class)v10;
}

- (void)updateCell:(id)a3 forItem:(id)a4 indexPath:(id)a5 animated:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HUAccessoryDiagnosticsViewController;
  [(HUItemTableViewController *)&v13 updateCell:v10 forItem:a4 indexPath:a5 animated:v6];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v10 setHideIcon:1];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v11 = v10;
      v12 = [(HUAccessoryDiagnosticsViewController *)self accessoryLogsItemManager];
      objc_msgSend(v11, "setShowSpinner:", objc_msgSend(v12, "collectionInProgress"));
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [v10 setDelegate:self];
      }
    }
  }
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  v36.receiver = self;
  v36.super_class = (Class)HUAccessoryDiagnosticsViewController;
  id v7 = a3;
  [(HUItemTableViewController *)&v36 tableView:v7 didSelectRowAtIndexPath:v6];
  objc_msgSend(v7, "deselectRowAtIndexPath:animated:", v6, 1, v36.receiver, v36.super_class);

  v8 = [(HUItemTableViewController *)self itemManager];
  v9 = [v8 displayedItemAtIndexPath:v6];

  id v10 = [(HUAccessoryDiagnosticsViewController *)self accessoryLogsItemManager];
  uint64_t v11 = [v10 fetchManufacturerSnapshotButtonItem];
  v12 = v9;
  if (v9 == (void *)v11) {
    goto LABEL_9;
  }
  objc_super v13 = (void *)v11;
  char v14 = [(HUAccessoryDiagnosticsViewController *)self accessoryLogsItemManager];
  uint64_t v15 = [v14 fetchADKSnapshotButtonItem];
  if (v9 == (void *)v15)
  {

    v12 = v13;
LABEL_9:

    goto LABEL_10;
  }
  v16 = (void *)v15;
  char v17 = [(HUAccessoryDiagnosticsViewController *)self accessoryLogsItemManager];
  v18 = [v17 fetchMatterSnapshotButtonItem];

  if (v9 != v18)
  {
    v19 = [(HUAccessoryDiagnosticsViewController *)self tableView];
    id v20 = [v19 cellForRowAtIndexPath:v6];

    objc_opt_class();
    id v21 = v9;
    if (objc_opt_isKindOfClass()) {
      v22 = v21;
    }
    else {
      v22 = 0;
    }
    id v23 = v22;

    [(HUAccessoryDiagnosticsViewController *)self showShareSheetForItem:v23 withAnchorView:v20];
    goto LABEL_20;
  }
LABEL_10:
  objc_opt_class();
  v24 = [(HUItemTableViewController *)self itemManager];
  if (objc_opt_isKindOfClass()) {
    v25 = v24;
  }
  else {
    v25 = 0;
  }
  id v20 = v25;

  v26 = [v20 sourceAccessory];
  if (!objc_msgSend(v26, "hf_isDirectlyReachable"))
  {
    v27 = [v20 sourceAccessory];
    if ([v27 supportsCHIP])
    {
      v28 = [v20 sourceAccessory];
      int v29 = [v28 isReachable];

      if (v29) {
        goto LABEL_17;
      }
    }
    else
    {
    }
    v30 = (void *)MEMORY[0x1E4F42728];
    v31 = _HULocalizedStringWithDefaultValue(@"HUAccessoryUnreachableAlertTitle", @"HUAccessoryUnreachableAlertTitle", 1);
    v32 = _HULocalizedStringWithDefaultValue(@"HUAccessoryUnreachableAlertMessage", @"HUAccessoryUnreachableAlertMessage", 1);
    id v23 = [v30 alertControllerWithTitle:v31 message:v32 preferredStyle:1];

    v33 = (void *)MEMORY[0x1E4F42720];
    v34 = _HULocalizedStringWithDefaultValue(@"HUOkTitle", @"HUOkTitle", 1);
    v35 = [v33 actionWithTitle:v34 style:0 handler:0];
    [v23 addAction:v35];

    [(HUAccessoryDiagnosticsViewController *)self presentViewController:v23 animated:1 completion:0];
LABEL_20:

    goto LABEL_21;
  }

LABEL_17:
  [(HUAccessoryDiagnosticsViewController *)self generateNewLogs:v9];
LABEL_21:
}

- (void)switchCell:(id)a3 didTurnOn:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [v6 item];
  v8 = [(HUAccessoryDiagnosticsViewController *)self accessoryLogsItemManager];
  v9 = [v8 enableVerboseLoggingItem];
  int v10 = [v7 isEqual:v9];

  uint64_t v11 = [(HUAccessoryDiagnosticsViewController *)self accessoryLogsItemManager];
  v12 = v11;
  if (v10)
  {
    [v11 setVerboseLoggingEnabled:v4];
  }
  else
  {
    objc_super v13 = [v11 enableAudioClipLoggingItem];
    int v14 = [v7 isEqual:v13];

    if (v14)
    {
      if (v4)
      {
        uint64_t v15 = _HULocalizedStringWithDefaultValue(@"HUAccessoryDiagnosticsAudioClipAlertTitle", @"HUAccessoryDiagnosticsAudioClipAlertTitle", 1);
        v16 = _HULocalizedStringWithDefaultValue(@"HUAccessoryDiagnosticsAudioClipAlertMessage", @"HUAccessoryDiagnosticsAudioClipAlertMessage", 1);
        char v17 = [MEMORY[0x1E4F42728] alertControllerWithTitle:v15 message:v16 preferredStyle:1];
        objc_initWeak(&location, self);
        v18 = (void *)MEMORY[0x1E4F42720];
        v19 = _HULocalizedStringWithDefaultValue(@"HUContinueTitle", @"HUContinueTitle", 1);
        v27[0] = MEMORY[0x1E4F143A8];
        v27[1] = 3221225472;
        v27[2] = __61__HUAccessoryDiagnosticsViewController_switchCell_didTurnOn___block_invoke;
        v27[3] = &unk_1E63914C0;
        objc_copyWeak(&v28, &location);
        BOOL v29 = v4;
        id v20 = [v18 actionWithTitle:v19 style:0 handler:v27];
        [v17 addAction:v20];

        id v21 = (void *)MEMORY[0x1E4F42720];
        v22 = _HULocalizedStringWithDefaultValue(@"HUCancelTitle", @"HUCancelTitle", 1);
        v25[0] = MEMORY[0x1E4F143A8];
        v25[1] = 3221225472;
        v25[2] = __61__HUAccessoryDiagnosticsViewController_switchCell_didTurnOn___block_invoke_2;
        v25[3] = &unk_1E6385188;
        id v26 = v6;
        id v23 = [v21 actionWithTitle:v22 style:1 handler:v25];
        [v17 addAction:v23];

        [(HUAccessoryDiagnosticsViewController *)self presentViewController:v17 animated:1 completion:0];
        objc_destroyWeak(&v28);
        objc_destroyWeak(&location);
      }
      else
      {
        v24 = [(HUAccessoryDiagnosticsViewController *)self accessoryLogsItemManager];
        [v24 setAudioClipLoggingEnabled:0];
      }
    }
  }
}

void __61__HUAccessoryDiagnosticsViewController_switchCell_didTurnOn___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained accessoryLogsItemManager];
  [v2 setAudioClipLoggingEnabled:*(unsigned __int8 *)(a1 + 40)];
}

uint64_t __61__HUAccessoryDiagnosticsViewController_switchCell_didTurnOn___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setOn:0 animated:1];
}

- (void)showShareSheetForItem:(id)a3 withAnchorView:(id)a4
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v6 isEligibleForUpload])
  {
    v8 = [[HUSendDiagnosticsToManufacturerActivity alloc] initWithDiagnosticItem:v6];
    v25[0] = v8;
    v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:1];
  }
  else
  {
    v9 = 0;
  }
  id v10 = objc_alloc(MEMORY[0x1E4F42718]);
  uint64_t v11 = [v6 fileURL];
  v24 = v11;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v24 count:1];
  objc_super v13 = (void *)[v10 initWithActivityItems:v12 applicationActivities:v9];

  [v13 setCompletionWithItemsHandler:&__block_literal_global_262];
  int v14 = [v13 popoverPresentationController];
  [v14 setSourceView:v7];

  [v7 frame];
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;

  id v23 = [v13 popoverPresentationController];
  objc_msgSend(v23, "setSourceRect:", v16, v18, v20, v22);

  [(HUAccessoryDiagnosticsViewController *)self presentViewController:v13 animated:1 completion:0];
}

void __77__HUAccessoryDiagnosticsViewController_showShareSheetForItem_withAnchorView___block_invoke(uint64_t a1, void *a2, int a3, uint64_t a4, void *a5)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a5;
  v9 = HFLogForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412802;
    id v11 = v7;
    __int16 v12 = 1024;
    int v13 = a3;
    __int16 v14 = 2112;
    id v15 = v8;
    _os_log_impl(&dword_1BE345000, v9, OS_LOG_TYPE_DEFAULT, "Finished export activity for activityType:%@ completed:%{BOOL}d with error:%@", (uint8_t *)&v10, 0x1Cu);
  }
}

- (void)generateNewLogs:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  id v5 = [(HUItemTableViewController *)self itemManager];
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v14 = v6;

  [v14 beginDiagnosticCollection:v4];
  id v7 = (void *)MEMORY[0x1E4F42728];
  id v8 = _HULocalizedStringWithDefaultValue(@"HUAccessoryDiagnosticsAlertTitle", @"HUAccessoryDiagnosticsAlertTitle", 1);
  v9 = _HULocalizedStringWithDefaultValue(@"HUAccessoryDiagnosticsAlertMessage", @"HUAccessoryDiagnosticsAlertMessage", 1);
  int v10 = [v7 alertControllerWithTitle:v8 message:v9 preferredStyle:1];

  id v11 = (void *)MEMORY[0x1E4F42720];
  __int16 v12 = _HULocalizedStringWithDefaultValue(@"HUOkTitle", @"HUOkTitle", 1);
  int v13 = [v11 actionWithTitle:v12 style:0 handler:0];
  [v10 addAction:v13];

  [(HUAccessoryDiagnosticsViewController *)self presentViewController:v10 animated:1 completion:0];
}

- (HUAccessoryDiagnosticsItemManager)accessoryLogsItemManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accessoryLogsItemManager);

  return (HUAccessoryDiagnosticsItemManager *)WeakRetained;
}

- (void)setAccessoryLogsItemManager:(id)a3
{
}

- (void).cxx_destruct
{
}

@end