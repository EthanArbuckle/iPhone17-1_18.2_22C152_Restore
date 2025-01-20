@interface HUSiriTriggerPhraseSettingDetailsViewController
- (Class)cellClassForItem:(id)a3 indexPath:(id)a4;
- (HUSiriTriggerPhraseSettingDelegate)delegate;
- (HUSiriTriggerPhraseSettingDetailsItemManager)siriSettingsDetailsItemManager;
- (HUSiriTriggerPhraseSettingDetailsViewController)initWithAccessoryGroupItem:(id)a3;
- (HUSiriTriggerPhraseSettingDetailsViewController)initWithAccessorySettingItem:(id)a3;
- (HUSiriTriggerPhraseSettingDetailsViewController)initWithHome:(id)a3 delegate:(id)a4;
- (int64_t)inProgressTriggerPhraseUpdateIndex;
- (int64_t)selectedSiriTriggerPhraseIndex;
- (void)_clearSpinner;
- (void)_commonInit;
- (void)_preflightCheckToAllowSwitchingSiriTriggerForMediaItem:(id)a3 changingToOn:(BOOL)a4 withCompletion:(id)a5;
- (void)_updateFooterText;
- (void)setDelegate:(id)a3;
- (void)setInProgressTriggerPhraseUpdateIndex:(int64_t)a3;
- (void)setSelectedSiriTriggerPhraseIndex:(int64_t)a3;
- (void)setSiriSettingsDetailsItemManager:(id)a3;
- (void)setupCell:(id)a3 forItem:(id)a4 indexPath:(id)a5;
- (void)switchCell:(id)a3 didTurnOn:(BOOL)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)updateCell:(id)a3 forItem:(id)a4 indexPath:(id)a5 animated:(BOOL)a6;
@end

@implementation HUSiriTriggerPhraseSettingDetailsViewController

- (HUSiriTriggerPhraseSettingDetailsViewController)initWithAccessorySettingItem:(id)a3
{
  id v4 = a3;
  v5 = [[HUSiriTriggerPhraseSettingDetailsItemManager alloc] initWithSourceItem:v4 delegate:self];

  [(HUSiriTriggerPhraseSettingDetailsViewController *)self setSiriSettingsDetailsItemManager:v5];
  v6 = [(HUSiriTriggerPhraseSettingDetailsViewController *)self siriSettingsDetailsItemManager];
  v10.receiver = self;
  v10.super_class = (Class)HUSiriTriggerPhraseSettingDetailsViewController;
  v7 = [(HUItemTableViewController *)&v10 initWithItemManager:v6 tableViewStyle:1];

  if (v7)
  {
    v8 = _HULocalizedStringWithDefaultValue(@"HUSiriTriggerPhraseSelectionDetails_Title", @"HUSiriTriggerPhraseSelectionDetails_Title", 1);
    [(HUSiriTriggerPhraseSettingDetailsViewController *)v7 setTitle:v8];

    [(HUSiriTriggerPhraseSettingDetailsViewController *)v7 _commonInit];
  }
  return v7;
}

- (HUSiriTriggerPhraseSettingDetailsViewController)initWithHome:(id)a3 delegate:(id)a4
{
  id v6 = a4;
  v7 = (objc_class *)MEMORY[0x1E4F69188];
  id v8 = a3;
  v9 = (void *)[[v7 alloc] initWithHome:v8];

  objc_super v10 = [[HUSiriTriggerPhraseSettingDetailsItemManager alloc] initWithSourceItem:v9 delegate:self];
  [(HUSiriTriggerPhraseSettingDetailsViewController *)self setSiriSettingsDetailsItemManager:v10];

  v11 = [(HUSiriTriggerPhraseSettingDetailsViewController *)self siriSettingsDetailsItemManager];
  v14.receiver = self;
  v14.super_class = (Class)HUSiriTriggerPhraseSettingDetailsViewController;
  v12 = [(HUItemTableViewController *)&v14 initWithItemManager:v11 tableViewStyle:1];

  if (v12)
  {
    objc_storeWeak((id *)&v12->_delegate, v6);
    [(HUSiriTriggerPhraseSettingDetailsViewController *)v12 _commonInit];
  }

  return v12;
}

- (void)_commonInit
{
  self->_selectedSiriTriggerPhraseIndex = 0x7FFFFFFFFFFFFFFFLL;
  self->_inProgressTriggerPhraseUpdateIndex = 0x7FFFFFFFFFFFFFFFLL;
  [(HUItemTableViewController *)self setAutomaticallyUpdatesViewControllerTitle:0];
  _HULocalizedStringWithDefaultValue(@"HUSiriTriggerPhraseSelectionDetails_Title", @"HUSiriTriggerPhraseSelectionDetails_Title", 1);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [(HUSiriTriggerPhraseSettingDetailsViewController *)self setTitle:v3];
}

- (HUSiriTriggerPhraseSettingDetailsViewController)initWithAccessoryGroupItem:(id)a3
{
  v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  id v6 = NSStringFromSelector(sel_initWithAccessoryGroupItem_);
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUSiriTriggerPhraseSettingDetailsViewController.m", 76, @"%s is unavailable; use %@ instead",
    "-[HUSiriTriggerPhraseSettingDetailsViewController initWithAccessoryGroupItem:]",
    v6);

  return 0;
}

- (Class)cellClassForItem:(id)a3 indexPath:(id)a4
{
  id v4 = a3;
  objc_opt_class();
  objc_opt_isKindOfClass();

  v5 = objc_opt_class();

  return (Class)v5;
}

- (void)setupCell:(id)a3 forItem:(id)a4 indexPath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_opt_class();
  id v30 = v8;
  if (objc_opt_isKindOfClass()) {
    v11 = v30;
  }
  else {
    v11 = 0;
  }
  id v12 = v11;

  objc_opt_class();
  id v13 = v9;
  if (objc_opt_isKindOfClass()) {
    objc_super v14 = v13;
  }
  else {
    objc_super v14 = 0;
  }
  id v15 = v14;

  if (v15)
  {
    v16 = [v13 latestResults];
    uint64_t v17 = *MEMORY[0x1E4F68B40];
    v18 = [v16 objectForKeyedSubscript:*MEMORY[0x1E4F68B40]];
    uint64_t v19 = [v18 BOOLValue] ? 3 : 0;
    [v30 setAccessoryType:v19];

    v20 = [v13 latestResults];
    v21 = [v20 objectForKeyedSubscript:v17];
    int v22 = [v21 BOOLValue];

    if (v22) {
      -[HUSiriTriggerPhraseSettingDetailsViewController setSelectedSiriTriggerPhraseIndex:](self, "setSelectedSiriTriggerPhraseIndex:", [v10 row]);
    }
  }
  if (v12) {
    [v12 setDelegate:self];
  }
  v23 = [(HUItemTableViewController *)self itemManager];
  v24 = objc_msgSend(v23, "titleForSection:", objc_msgSend(v10, "section"));

  v25 = NSString;
  v26 = (objc_class *)objc_opt_class();
  v27 = NSStringFromClass(v26);
  v28 = [v24 stringByReplacingOccurrencesOfString:@" " withString:&stru_1F18F92B8];
  v29 = [v25 stringWithFormat:@"%@.SectionHeader-%@", v27, v28];
  [v30 setAccessibilityIdentifier:v29];
}

- (void)updateCell:(id)a3 forItem:(id)a4 indexPath:(id)a5 animated:(BOOL)a6
{
  uint64_t v6 = a6;
  id v10 = a3;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HUSiriTriggerPhraseSettingDetailsViewController;
  id v12 = a4;
  [(HUItemTableViewController *)&v15 updateCell:v10 forItem:v12 indexPath:v11 animated:v6];
  objc_opt_class();
  LOBYTE(v6) = objc_opt_isKindOfClass();

  if (v6)
  {
    uint64_t v13 = objc_msgSend(v11, "row", v15.receiver, v15.super_class);
    if (v13 == [(HUSiriTriggerPhraseSettingDetailsViewController *)self inProgressTriggerPhraseUpdateIndex])
    {
      objc_super v14 = (void *)[objc_alloc(MEMORY[0x1E4F42708]) initWithActivityIndicatorStyle:100];
      [v14 startAnimating];
      [v10 setAccessoryView:v14];
    }
    else
    {
      [v10 setAccessoryView:0];
    }
  }
}

- (void)switchCell:(id)a3 didTurnOn:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [(HUSiriTriggerPhraseSettingDetailsViewController *)self tableView];
  id v8 = [v7 indexPathForCell:v6];

  id v9 = [(HUItemTableViewController *)self itemManager];
  id v10 = [v9 displayedItemAtIndexPath:v8];

  objc_opt_class();
  id v11 = v10;
  if (objc_opt_isKindOfClass()) {
    id v12 = v11;
  }
  else {
    id v12 = 0;
  }
  id v13 = v12;

  objc_super v14 = [v13 sourceItem];
  objc_super v15 = &unk_1F1A3D2C0;
  if ([v14 conformsToProtocol:v15]) {
    v16 = v14;
  }
  else {
    v16 = 0;
  }
  id v17 = v16;

  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __72__HUSiriTriggerPhraseSettingDetailsViewController_switchCell_didTurnOn___block_invoke;
  v20[3] = &unk_1E638B740;
  id v21 = v6;
  id v22 = v17;
  BOOL v24 = v4;
  v23 = self;
  id v18 = v17;
  id v19 = v6;
  [(HUSiriTriggerPhraseSettingDetailsViewController *)self _preflightCheckToAllowSwitchingSiriTriggerForMediaItem:v18 changingToOn:v4 withCompletion:v20];
}

void __72__HUSiriTriggerPhraseSettingDetailsViewController_switchCell_didTurnOn___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    BOOL v4 = HFLogForCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      uint64_t v6 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      uint64_t v21 = v5;
      __int16 v22 = 2112;
      uint64_t v23 = v6;
      _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "(Switch) '%@/%@' running preflight check for Allow HS before changing...", buf, 0x16u);
    }

    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __72__HUSiriTriggerPhraseSettingDetailsViewController_switchCell_didTurnOn___block_invoke_84;
    v15[3] = &unk_1E638B718;
    id v16 = *(id *)(a1 + 40);
    char v19 = *(unsigned char *)(a1 + 56);
    id v7 = *(id *)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 48);
    id v17 = v7;
    uint64_t v18 = v8;
    id v9 = (id)[v3 addSuccessBlock:v15];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __72__HUSiriTriggerPhraseSettingDetailsViewController_switchCell_didTurnOn___block_invoke_2;
    v11[3] = &unk_1E6389DD8;
    id v12 = *(id *)(a1 + 40);
    id v13 = *(id *)(a1 + 32);
    char v14 = *(unsigned char *)(a1 + 56);
    id v10 = (id)[v3 addFailureBlock:v11];
  }
}

void __72__HUSiriTriggerPhraseSettingDetailsViewController_switchCell_didTurnOn___block_invoke_84(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  BOOL v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    if ([v3 BOOLValue]) {
      uint64_t v6 = @"passed";
    }
    else {
      uint64_t v6 = @"failed";
    }
    int v7 = [v3 BOOLValue];
    uint64_t v8 = @"NOT CHANGING";
    int v9 = *(unsigned __int8 *)(a1 + 56);
    if (v7) {
      uint64_t v8 = @"CHANGING";
    }
    id v10 = @"ON";
    *(_DWORD *)buf = 138413058;
    uint64_t v19 = v5;
    __int16 v20 = 2112;
    uint64_t v21 = v6;
    __int16 v22 = 2112;
    if (!v9) {
      id v10 = @"OFF";
    }
    uint64_t v23 = v8;
    __int16 v24 = 2112;
    v25 = v10;
    _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "(Switch) preflight returned check %@, %@ %@ to '%@'", buf, 0x2Au);
  }

  if ([v3 BOOLValue])
  {
    id v11 = [*(id *)(a1 + 32) setSiriDisabled:*(unsigned char *)(a1 + 56) == 0];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __72__HUSiriTriggerPhraseSettingDetailsViewController_switchCell_didTurnOn___block_invoke_103;
    v15[3] = &unk_1E63899B8;
    id v16 = *(id *)(a1 + 40);
    char v17 = *(unsigned char *)(a1 + 56);
    id v12 = (id)[v11 addFailureBlock:v15];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __72__HUSiriTriggerPhraseSettingDetailsViewController_switchCell_didTurnOn___block_invoke_105;
    v14[3] = &unk_1E63866E0;
    v14[4] = *(void *)(a1 + 48);
    id v13 = (id)[v11 addSuccessBlock:v14];
  }
}

void __72__HUSiriTriggerPhraseSettingDetailsViewController_switchCell_didTurnOn___block_invoke_103(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3) {
    [*(id *)(a1 + 32) setOn:*(unsigned char *)(a1 + 40) == 0];
  }
  BOOL v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = *(unsigned __int8 *)(a1 + 40);
    v6[0] = 67109120;
    v6[1] = v5;
    _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "Allow Hey Siri Setting FAILED to update with value %{BOOL}d. Reverting UI state.", (uint8_t *)v6, 8u);
  }
}

void __72__HUSiriTriggerPhraseSettingDetailsViewController_switchCell_didTurnOn___block_invoke_105(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) delegate];
  if (v2)
  {
    id v3 = (void *)v2;
    BOOL v4 = [*(id *)(a1 + 32) delegate];
    char v5 = objc_opt_respondsToSelector();

    if (v5)
    {
      id v6 = [*(id *)(a1 + 32) delegate];
      [v6 didUpdateSiriTriggerPhraseSetting];
    }
  }
}

uint64_t __72__HUSiriTriggerPhraseSettingDetailsViewController_switchCell_didTurnOn___block_invoke_2(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = HFLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl(&dword_1BE345000, v2, OS_LOG_TYPE_DEFAULT, "(Switch) preflight failed, NOT changing %@", (uint8_t *)&v5, 0xCu);
  }

  return [*(id *)(a1 + 40) setOn:*(unsigned char *)(a1 + 48) == 0 animated:1];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)HUSiriTriggerPhraseSettingDetailsViewController;
  [(HUItemTableViewController *)&v17 tableView:v6 didSelectRowAtIndexPath:v7];
  int64_t v8 = [(HUSiriTriggerPhraseSettingDetailsViewController *)self selectedSiriTriggerPhraseIndex];
  if (v8 != [v7 row])
  {
    int v9 = [(HUSiriTriggerPhraseSettingDetailsViewController *)self siriSettingsDetailsItemManager];
    id v10 = [v9 displayedItemAtIndexPath:v7];

    id v11 = [v6 cellForRowAtIndexPath:v7];
    id v12 = [(HUSiriTriggerPhraseSettingDetailsViewController *)self siriSettingsDetailsItemManager];
    id v13 = [v12 updateSiriTriggerPhrase:v10];

    -[HUSiriTriggerPhraseSettingDetailsViewController setInProgressTriggerPhraseUpdateIndex:](self, "setInProgressTriggerPhraseUpdateIndex:", [v7 row]);
    -[HUSiriTriggerPhraseSettingDetailsViewController setSelectedSiriTriggerPhraseIndex:](self, "setSelectedSiriTriggerPhraseIndex:", [v7 row]);
    char v14 = HFLogForCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v19 = "-[HUSiriTriggerPhraseSettingDetailsViewController tableView:didSelectRowAtIndexPath:]";
      __int16 v20 = 2112;
      uint64_t v21 = v11;
      _os_log_impl(&dword_1BE345000, v14, OS_LOG_TYPE_DEFAULT, "%s User Tapped [%@]", buf, 0x16u);
    }

    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __85__HUSiriTriggerPhraseSettingDetailsViewController_tableView_didSelectRowAtIndexPath___block_invoke;
    v16[3] = &unk_1E63850B8;
    v16[4] = self;
    id v15 = (id)[v13 addCompletionBlock:v16];
  }
  [v6 deselectRowAtIndexPath:v7 animated:1];
}

void __85__HUSiriTriggerPhraseSettingDetailsViewController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  [*(id *)(a1 + 32) _clearSpinner];
  if (!a3 && [v5 BOOLValue]) {
    [*(id *)(a1 + 32) _updateFooterText];
  }
}

- (void)_preflightCheckToAllowSwitchingSiriTriggerForMediaItem:(id)a3 changingToOn:(BOOL)a4 withCompletion:(id)a5
{
  BOOL v6 = a4;
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  if ([v8 isSiriEndpointAccessory] && v6)
  {
    id v10 = [v8 accessories];
    id v11 = [v10 anyObject];

    id v12 = objc_msgSend(v11, "hf_siriEndpointProfile");
    id v13 = [v12 currentAssistant];
    char v14 = HFLogForCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v46 = v13;
      __int16 v47 = 1024;
      int v48 = [v13 isSiriAssistant];
      _os_log_impl(&dword_1BE345000, v14, OS_LOG_TYPE_DEFAULT, "currentAssistant = %@, currentAssistant.isSiriAssistant = %{BOOL}d", buf, 0x12u);
    }

    if (v13 && ([v13 isSiriAssistant] & 1) == 0)
    {
      v40 = self;
      id v16 = HFLogForCategory();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v46 = v13;
        _os_log_impl(&dword_1BE345000, v16, OS_LOG_TYPE_DEFAULT, "Accessory has a different assistant = %@", buf, 0xCu);
      }

      objc_super v17 = [v13 name];
      id v15 = HULocalizedStringWithFormat(@"HUSiriEndpoint_TurnOffAssistant_AlertTitle", @"%@", v18, v19, v20, v21, v22, v23, (uint64_t)v17);

      __int16 v24 = [v13 name];
      v39 = HULocalizedStringWithFormat(@"HUSiriEndpoint_TurnOffAssistant_AlertMessage", @"%@", v25, v26, v27, v28, v29, v30, (uint64_t)v24);

      v31 = [MEMORY[0x1E4F42728] alertControllerWithTitle:v15 message:v39 preferredStyle:1];
      v32 = (void *)MEMORY[0x1E4F42720];
      v33 = _HULocalizedStringWithDefaultValue(@"HUSiriEndpoint_TurnOffAssistant_AlertButtonTitle", @"HUSiriEndpoint_TurnOffAssistant_AlertButtonTitle", 1);
      v43[0] = MEMORY[0x1E4F143A8];
      v43[1] = 3221225472;
      v43[2] = __134__HUSiriTriggerPhraseSettingDetailsViewController__preflightCheckToAllowSwitchingSiriTriggerForMediaItem_changingToOn_withCompletion___block_invoke;
      v43[3] = &unk_1E638B2B8;
      id v34 = v9;
      id v44 = v34;
      v35 = [v32 actionWithTitle:v33 style:0 handler:v43];
      [v31 addAction:v35];

      v36 = (void *)MEMORY[0x1E4F42720];
      v37 = _HULocalizedStringWithDefaultValue(@"HUAlertCancel", @"HUAlertCancel", 1);
      v41[0] = MEMORY[0x1E4F143A8];
      v41[1] = 3221225472;
      v41[2] = __134__HUSiriTriggerPhraseSettingDetailsViewController__preflightCheckToAllowSwitchingSiriTriggerForMediaItem_changingToOn_withCompletion___block_invoke_2;
      v41[3] = &unk_1E638B2B8;
      id v42 = v34;
      v38 = [v36 actionWithTitle:v37 style:1 handler:v41];
      [v31 addAction:v38];

      [(HUSiriTriggerPhraseSettingDetailsViewController *)v40 presentViewController:v31 animated:1 completion:0];
    }
    else
    {
      id v15 = [MEMORY[0x1E4F7A0D8] futureWithResult:MEMORY[0x1E4F1CC38]];
      (*((void (**)(id, void *))v9 + 2))(v9, v15);
    }
  }
  else
  {
    id v11 = [MEMORY[0x1E4F7A0D8] futureWithResult:MEMORY[0x1E4F1CC38]];
    (*((void (**)(id, void *))v9 + 2))(v9, v11);
  }
}

void __134__HUSiriTriggerPhraseSettingDetailsViewController__preflightCheckToAllowSwitchingSiriTriggerForMediaItem_changingToOn_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F7A0D8] futureWithResult:MEMORY[0x1E4F1CC38]];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __134__HUSiriTriggerPhraseSettingDetailsViewController__preflightCheckToAllowSwitchingSiriTriggerForMediaItem_changingToOn_withCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = (void *)MEMORY[0x1E4F7A0D8];
  objc_msgSend(MEMORY[0x1E4F28C58], "hf_errorWithCode:", 37);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [v2 futureWithError:v4];
  (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v3);
}

- (void)_clearSpinner
{
}

- (void)_updateFooterText
{
  uint64_t v3 = [(HUSiriTriggerPhraseSettingDetailsViewController *)self siriSettingsDetailsItemManager];
  [v3 recalculateVisibilityAndSortAllItems];

  id v4 = [(HUSiriTriggerPhraseSettingDetailsViewController *)self tableView];
  [v4 reloadData];
}

- (void)setInProgressTriggerPhraseUpdateIndex:(int64_t)a3
{
  if (self->_inProgressTriggerPhraseUpdateIndex != a3)
  {
    id v5 = objc_opt_new();
    BOOL v6 = [(HUSiriTriggerPhraseSettingDetailsViewController *)self siriSettingsDetailsItemManager];
    id v7 = [v6 displayedItemsInSection:0];
    int64_t v8 = [v7 count];

    int64_t inProgressTriggerPhraseUpdateIndex = self->_inProgressTriggerPhraseUpdateIndex;
    if (inProgressTriggerPhraseUpdateIndex != 0x7FFFFFFFFFFFFFFFLL && inProgressTriggerPhraseUpdateIndex < v8)
    {
      id v11 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForRow:inSection:");
      [v5 addObject:v11];
    }
    if (a3 != 0x7FFFFFFFFFFFFFFFLL && v8 > a3)
    {
      id v12 = [MEMORY[0x1E4F28D58] indexPathForRow:a3 inSection:0];
      [v5 addObject:v12];
    }
    self->_int64_t inProgressTriggerPhraseUpdateIndex = a3;
    if ([v5 count])
    {
      id v13 = [(HUItemTableViewController *)self itemManager];
      int v14 = [v13 diffableDataSourceDisabled];

      if (v14)
      {
        id v15 = [(HUSiriTriggerPhraseSettingDetailsViewController *)self tableView];
        [v15 reloadRowsAtIndexPaths:v5 withRowAnimation:5];
      }
      else
      {
        v18[0] = MEMORY[0x1E4F143A8];
        v18[1] = 3221225472;
        v18[2] = __89__HUSiriTriggerPhraseSettingDetailsViewController_setInProgressTriggerPhraseUpdateIndex___block_invoke;
        v18[3] = &unk_1E6389690;
        v18[4] = self;
        id v16 = objc_msgSend(v5, "na_map:", v18);
        objc_super v17 = [(HUSiriTriggerPhraseSettingDetailsViewController *)self siriSettingsDetailsItemManager];
        [v17 reloadUIRepresentationForItems:v16 withAnimation:0];
      }
    }
  }
}

id __89__HUSiriTriggerPhraseSettingDetailsViewController_setInProgressTriggerPhraseUpdateIndex___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 itemManager];
  id v5 = [v4 displayedItemAtIndexPath:v3];

  return v5;
}

- (HUSiriTriggerPhraseSettingDetailsItemManager)siriSettingsDetailsItemManager
{
  return self->_siriSettingsDetailsItemManager;
}

- (void)setSiriSettingsDetailsItemManager:(id)a3
{
}

- (HUSiriTriggerPhraseSettingDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HUSiriTriggerPhraseSettingDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)selectedSiriTriggerPhraseIndex
{
  return self->_selectedSiriTriggerPhraseIndex;
}

- (void)setSelectedSiriTriggerPhraseIndex:(int64_t)a3
{
  self->_selectedSiriTriggerPhraseIndex = a3;
}

- (int64_t)inProgressTriggerPhraseUpdateIndex
{
  return self->_inProgressTriggerPhraseUpdateIndex;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_siriSettingsDetailsItemManager, 0);
}

@end