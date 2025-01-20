@interface HUMediaAccessoryAudioSettingsViewController
- (BOOL)automaticallyUpdatesViewControllerTitle;
- (BOOL)requiresPresentingViewControllerDismissal;
- (Class)cellClassForItem:(id)a3 indexPath:(id)a4;
- (HFMediaSystemBuilder)mediaSystemBuilder;
- (HUMediaAccessoryAudioSettingsViewController)initWithMediaSystemBuilder:(id)a3 mediaAccessoryItem:(id)a4;
- (HUPresentationDelegate)presentationDelegate;
- (NAFuture)accessoryIdentifyFuture;
- (id)_homePodStereoSwapperCell;
- (id)item;
- (void)_updateSwapperCell:(id)a3;
- (void)didPressSwapButton:(id)a3;
- (void)didTapSpeaker:(id)a3;
- (void)setAccessoryIdentifyFuture:(id)a3;
- (void)setPresentationDelegate:(id)a3;
- (void)setRequiresPresentingViewControllerDismissal:(BOOL)a3;
- (void)setupCell:(id)a3 forItem:(id)a4 indexPath:(id)a5;
- (void)updateCell:(id)a3 forItem:(id)a4 indexPath:(id)a5 animated:(BOOL)a6;
@end

@implementation HUMediaAccessoryAudioSettingsViewController

- (HUMediaAccessoryAudioSettingsViewController)initWithMediaSystemBuilder:(id)a3 mediaAccessoryItem:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  if (!v8)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"HUMediaAccessoryAudioSettingsViewController.m", 36, @"Invalid parameter not satisfying: %@", @"mediaSystemBuilder" object file lineNumber description];
  }
  v10 = [[HUMediaAccessoryAudioSettingsItemManager alloc] initWithMediaSystemBuilder:v8 sourceItem:v9 delegate:self];
  v16.receiver = self;
  v16.super_class = (Class)HUMediaAccessoryAudioSettingsViewController;
  v11 = [(HUItemTableViewController *)&v16 initWithItemManager:v10 tableViewStyle:1];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_mediaSystemBuilder, a3);
    v13 = _HULocalizedStringWithDefaultValue(@"HUMediaAccessoryAudioSettingsViewControllerTitle", @"HUMediaAccessoryAudioSettingsViewControllerTitle", 1);
    [(HUMediaAccessoryAudioSettingsViewController *)v12 setTitle:v13];
  }
  return v12;
}

- (BOOL)automaticallyUpdatesViewControllerTitle
{
  return 0;
}

- (id)item
{
  v2 = [(HUItemTableViewController *)self itemManager];
  v3 = [v2 sourceItem];

  return v3;
}

- (Class)cellClassForItem:(id)a3 indexPath:(id)a4
{
  id v5 = a3;
  v6 = [(HUItemTableViewController *)self itemManager];
  id v7 = [v6 audioSettingsItem];

  if (v7 == v5)
  {
    id v8 = objc_opt_class();
  }
  else
  {
    id v8 = 0;
  }

  return (Class)v8;
}

- (void)setupCell:(id)a3 forItem:(id)a4 indexPath:(id)a5
{
  id v15 = a3;
  id v7 = a4;
  id v8 = [(HUItemTableViewController *)self itemManager];
  id v9 = [v8 audioSettingsItem];

  if (v9 == v7)
  {
    id v10 = v15;
    objc_opt_class();
    v11 = [(HUItemTableViewController *)self itemManager];
    v12 = [v11 sourceItem];
    if (objc_opt_isKindOfClass()) {
      v13 = v12;
    }
    else {
      v13 = 0;
    }
    id v14 = v13;

    objc_msgSend(v10, "setHomePodVariant:", objc_msgSend(v14, "homePodVariant"));
    objc_msgSend(v10, "finishSetupWithDelegate:selectionStyle:homePodVariant:", self, 0, objc_msgSend(v14, "homePodVariant"));
  }
}

- (void)updateCell:(id)a3 forItem:(id)a4 indexPath:(id)a5 animated:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HUMediaAccessoryAudioSettingsViewController;
  id v11 = a4;
  [(HUItemTableViewController *)&v14 updateCell:v10 forItem:v11 indexPath:a5 animated:v6];
  v12 = [(HUItemTableViewController *)self itemManager];
  id v13 = [v12 audioSettingsItem];

  if (v13 == v11) {
    [(HUMediaAccessoryAudioSettingsViewController *)self _updateSwapperCell:v10];
  }
}

- (void)didTapSpeaker:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  BOOL v6 = HFLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = NSStringFromSelector(a2);
    uint64_t v8 = [v5 mediaSystemRole];
    id v9 = @"right";
    *(_DWORD *)v22 = 138412802;
    *(void *)&v22[4] = self;
    *(_WORD *)&v22[12] = 2112;
    if (v8 == 1) {
      id v9 = @"left";
    }
    *(void *)&v22[14] = v7;
    __int16 v23 = 2112;
    v24 = v9;
    _os_log_impl(&dword_1BE345000, v6, OS_LOG_TYPE_DEFAULT, "%@:%@ User tapped speaker icon: %@", v22, 0x20u);
  }
  uint64_t v10 = [(HUMediaAccessoryAudioSettingsViewController *)self accessoryIdentifyFuture];
  if (v10
    && (id v11 = (void *)v10,
        [(HUMediaAccessoryAudioSettingsViewController *)self accessoryIdentifyFuture],
        v12 = objc_claimAutoreleasedReturnValue(),
        char v13 = [v12 isFinished],
        v12,
        v11,
        (v13 & 1) == 0))
  {
    objc_super v14 = HFLogForCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v18 = NSStringFromSelector(a2);
      v19 = [(HUMediaAccessoryAudioSettingsViewController *)self accessoryIdentifyFuture];
      v20 = [(HUMediaAccessoryAudioSettingsViewController *)self accessoryIdentifyFuture];
      int v21 = [v20 isFinished];
      *(_DWORD *)v22 = 138413058;
      *(void *)&v22[4] = self;
      *(_WORD *)&v22[12] = 2112;
      *(void *)&v22[14] = v18;
      __int16 v23 = 2112;
      v24 = v19;
      __int16 v25 = 1024;
      int v26 = v21;
      _os_log_impl(&dword_1BE345000, v14, OS_LOG_TYPE_DEFAULT, "%@:%@ Ignoring because previous Identify future not completed: %@ isFinished = %{BOOL}d", v22, 0x26u);
    }
  }
  else
  {
    if (objc_msgSend(v5, "mediaSystemRole", *(_OWORD *)v22) == 1) {
      [MEMORY[0x1E4F2E938] leftRole];
    }
    else {
    objc_super v14 = [MEMORY[0x1E4F2E938] rightRole];
    }
    id v15 = [(HUMediaAccessoryAudioSettingsViewController *)self mediaSystemBuilder];
    objc_super v16 = [v15 accessoryForRole:v14];

    v17 = objc_msgSend(v16, "hf_identifyHomePod");
    [(HUMediaAccessoryAudioSettingsViewController *)self setAccessoryIdentifyFuture:v17];
  }
}

- (void)didPressSwapButton:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  BOOL v6 = HFLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    v18 = self;
    __int16 v19 = 2112;
    v20 = v7;
    _os_log_impl(&dword_1BE345000, v6, OS_LOG_TYPE_DEFAULT, "%@:%@ User tapped speaker swapper", buf, 0x16u);
  }
  uint64_t v8 = [(HUMediaAccessoryAudioSettingsViewController *)self mediaSystemBuilder];
  [v8 swapRoles];

  id v9 = [v5 swapButton];
  [v9 setUserInteractionEnabled:0];

  objc_initWeak((id *)buf, self);
  uint64_t v10 = [(HUMediaAccessoryAudioSettingsViewController *)self mediaSystemBuilder];
  id v11 = [v10 commitItem];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __66__HUMediaAccessoryAudioSettingsViewController_didPressSwapButton___block_invoke;
  v14[3] = &unk_1E6386150;
  objc_copyWeak(&v16, (id *)buf);
  id v12 = v5;
  id v15 = v12;
  id v13 = (id)[v11 addCompletionBlock:v14];

  objc_destroyWeak(&v16);
  objc_destroyWeak((id *)buf);
}

void __66__HUMediaAccessoryAudioSettingsViewController_didPressSwapButton___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _updateSwapperCell:0];
  v2 = [*(id *)(a1 + 32) swapButton];
  [v2 setUserInteractionEnabled:1];
}

- (void)_updateSwapperCell:(id)a3
{
  id v20 = a3;
  if (!v20)
  {
    id v20 = [(HUMediaAccessoryAudioSettingsViewController *)self _homePodStereoSwapperCell];
  }
  v4 = [(HUMediaAccessoryAudioSettingsViewController *)self mediaSystemBuilder];
  id v5 = [MEMORY[0x1E4F2E938] leftRole];
  BOOL v6 = [v4 accessoryForRole:v5];

  id v7 = [(HUMediaAccessoryAudioSettingsViewController *)self mediaSystemBuilder];
  uint64_t v8 = [MEMORY[0x1E4F2E938] rightRole];
  id v9 = [v7 accessoryForRole:v8];

  uint64_t v10 = objc_msgSend(v6, "hf_serviceNameComponents");
  id v11 = [v10 serviceName];
  id v12 = [v20 leftHomePod];
  [v12 setUnitName:v11];

  id v13 = objc_msgSend(v9, "hf_serviceNameComponents");
  objc_super v14 = [v13 serviceName];
  id v15 = [v20 rightHomePod];
  [v15 setUnitName:v14];

  id v16 = [(HUItemTableViewController *)self itemManager];
  v17 = [v16 home];
  LODWORD(v15) = objc_msgSend(v17, "hf_currentUserIsOwner");

  if (v15)
  {
    v18 = [v20 leftHomePod];
    [v18 setDelegate:self];

    __int16 v19 = [v20 rightHomePod];
    [v19 setDelegate:self];
  }
}

- (id)_homePodStereoSwapperCell
{
  v2 = [(HUMediaAccessoryAudioSettingsViewController *)self tableView];
  v3 = [v2 visibleCells];
  v4 = objc_msgSend(v3, "na_firstObjectPassingTest:", &__block_literal_global_69);

  return v4;
}

uint64_t __72__HUMediaAccessoryAudioSettingsViewController__homePodStereoSwapperCell__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (HUPresentationDelegate)presentationDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentationDelegate);

  return (HUPresentationDelegate *)WeakRetained;
}

- (void)setPresentationDelegate:(id)a3
{
}

- (BOOL)requiresPresentingViewControllerDismissal
{
  return self->_requiresPresentingViewControllerDismissal;
}

- (void)setRequiresPresentingViewControllerDismissal:(BOOL)a3
{
  self->_requiresPresentingViewControllerDismissal = a3;
}

- (HFMediaSystemBuilder)mediaSystemBuilder
{
  return self->_mediaSystemBuilder;
}

- (NAFuture)accessoryIdentifyFuture
{
  return self->_accessoryIdentifyFuture;
}

- (void)setAccessoryIdentifyFuture:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryIdentifyFuture, 0);
  objc_storeStrong((id *)&self->_mediaSystemBuilder, 0);

  objc_destroyWeak((id *)&self->_presentationDelegate);
}

@end