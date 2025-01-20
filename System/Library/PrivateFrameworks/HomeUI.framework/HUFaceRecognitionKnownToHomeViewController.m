@interface HUFaceRecognitionKnownToHomeViewController
- (Class)cellClassForItem:(id)a3 indexPath:(id)a4;
- (HFItemManager)knownPersonItemManager;
- (HFItemProvider)homePersonItemProvider;
- (HUFaceRecognitionKnownToHomeViewController)initWithHome:(id)a3;
- (HUFaceRecognitionKnownToHomeViewController)initWithItemManager:(id)a3 tableViewStyle:(int64_t)a4;
- (id)presentFaceRecognitionPersonSettingsForPerson:(id)a3 personManager:(id)a4 animated:(BOOL)a5;
- (unint64_t)automaticDisablingReasonsForItem:(id)a3;
- (void)personEditorViewController:(id)a3 didUpdateItem:(id)a4;
- (void)setHomePersonItemProvider:(id)a3;
- (void)setKnownPersonItemManager:(id)a3;
- (void)setupCell:(id)a3 forItem:(id)a4 indexPath:(id)a5;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
@end

@implementation HUFaceRecognitionKnownToHomeViewController

- (HUFaceRecognitionKnownToHomeViewController)initWithHome:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F69590]) initWithDelegate:self];
  v20.receiver = self;
  v20.super_class = (Class)HUFaceRecognitionKnownToHomeViewController;
  v6 = [(HUItemTableViewController *)&v20 initWithItemManager:v5 tableViewStyle:1];
  if (v6)
  {
    objc_initWeak(&location, v6);
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __59__HUFaceRecognitionKnownToHomeViewController_initWithHome___block_invoke;
    v17[3] = &unk_1E6385000;
    id v18 = v4;
    [v5 setHomeCreator:v17];
    if ([MEMORY[0x1E4F69758] isPressDemoModeEnabled]) {
      char v7 = 1;
    }
    else {
      char v7 = [MEMORY[0x1E4F69758] isRunningInStoreDemoMode];
    }
    uint64_t v11 = MEMORY[0x1E4F143A8];
    uint64_t v12 = 3221225472;
    v13 = __59__HUFaceRecognitionKnownToHomeViewController_initWithHome___block_invoke_2;
    v14 = &unk_1E638EEC0;
    objc_copyWeak(&v15, &location);
    char v16 = v7;
    [v5 setItemProviderCreator:&v11];
    v8 = objc_msgSend(MEMORY[0x1E4F695D8], "policyWithDecision:", 0, v11, v12, v13, v14);
    [v5 setReadPolicy:v8];

    v9 = _HULocalizedStringWithDefaultValue(@"HUFaceRecognitionKnownToHouseViewControllerTitle", @"HUFaceRecognitionKnownToHouseViewControllerTitle", 1);
    [(HUFaceRecognitionKnownToHomeViewController *)v6 setTitle:v9];

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }

  return v6;
}

uint64_t __59__HUFaceRecognitionKnownToHomeViewController_initWithHome___block_invoke(uint64_t a1)
{
  return [MEMORY[0x1E4F7A0D8] futureWithResult:*(void *)(a1 + 32)];
}

id __59__HUFaceRecognitionKnownToHomeViewController_initWithHome___block_invoke_2(uint64_t a1, void *a2)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v3 = (id *)(a1 + 32);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  if (*(unsigned char *)(a1 + 40))
  {
    v6 = (void *)[objc_alloc(MEMORY[0x1E4F690E8]) initForMode:1 home:v4];
  }
  else
  {
    v6 = (void *)[objc_alloc(MEMORY[0x1E4F691B0]) initWithHome:v4];

    [v6 setFilter:&__block_literal_global_206];
  }
  [WeakRetained setHomePersonItemProvider:v6];

  char v7 = [WeakRetained homePersonItemProvider];
  v10[0] = v7;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];

  return v8;
}

BOOL __59__HUFaceRecognitionKnownToHomeViewController_initWithHome___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  id v3 = v2;
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  v6 = [v5 name];
  BOOL v7 = v6 != 0;

  return v7;
}

- (HUFaceRecognitionKnownToHomeViewController)initWithItemManager:(id)a3 tableViewStyle:(int64_t)a4
{
  v6 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4);
  BOOL v7 = NSStringFromSelector(sel_initWithHome_);
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUFaceRecognitionKnownToHomeViewController.m", 60, @"%s is unavailable; use %@ instead",
    "-[HUFaceRecognitionKnownToHomeViewController initWithItemManager:tableViewStyle:]",
    v7);

  return 0;
}

- (unint64_t)automaticDisablingReasonsForItem:(id)a3
{
  return 1;
}

- (id)presentFaceRecognitionPersonSettingsForPerson:(id)a3 personManager:(id)a4 animated:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = [(HUItemTableViewController *)self hu_preloadContent];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __115__HUFaceRecognitionKnownToHomeViewController_presentFaceRecognitionPersonSettingsForPerson_personManager_animated___block_invoke;
  v15[3] = &unk_1E6386C98;
  id v16 = v8;
  id v17 = v9;
  id v18 = self;
  BOOL v19 = a5;
  id v11 = v9;
  id v12 = v8;
  v13 = [v10 flatMap:v15];

  return v13;
}

id __115__HUFaceRecognitionKnownToHomeViewController_presentFaceRecognitionPersonSettingsForPerson_personManager_animated___block_invoke(uint64_t a1)
{
  id v2 = [HUFaceRecognitionPersonEditorViewController alloc];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = [*(id *)(a1 + 48) itemManager];
  v6 = [v5 home];
  BOOL v7 = [(HUFaceRecognitionPersonEditorViewController *)v2 initWithPerson:v3 personManager:v4 home:v6];

  [(HUFaceRecognitionPersonEditorViewController *)v7 setDelegate:*(void *)(a1 + 48)];
  id v8 = [*(id *)(a1 + 48) navigationController];
  id v9 = objc_msgSend(v8, "hu_pushPreloadableViewController:animated:", v7, *(unsigned __int8 *)(a1 + 56));
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __115__HUFaceRecognitionKnownToHomeViewController_presentFaceRecognitionPersonSettingsForPerson_personManager_animated___block_invoke_2;
  v13[3] = &unk_1E6388A88;
  v14 = v7;
  v10 = v7;
  id v11 = [v9 flatMap:v13];

  return v11;
}

uint64_t __115__HUFaceRecognitionKnownToHomeViewController_presentFaceRecognitionPersonSettingsForPerson_personManager_animated___block_invoke_2(uint64_t a1)
{
  return [MEMORY[0x1E4F7A0D8] futureWithResult:*(void *)(a1 + 32)];
}

- (Class)cellClassForItem:(id)a3 indexPath:(id)a4
{
  uint64_t v4 = [a3 latestResults];
  [v4 objectForKeyedSubscript:*MEMORY[0x1E4F68860]];

  id v5 = objc_opt_class();

  return (Class)v5;
}

- (void)setupCell:(id)a3 forItem:(id)a4 indexPath:(id)a5
{
  id v6 = a3;
  BOOL v7 = (void *)MEMORY[0x1E4F42B58];
  id v8 = a4;
  id v9 = [v7 cellConfiguration];
  v10 = [v8 latestResults];
  id v11 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4F68AB8]];
  [v9 setText:v11];

  id v12 = [v8 latestResults];

  v13 = [v12 objectForKeyedSubscript:*MEMORY[0x1E4F68860]];
  [v9 setImage:v13];

  v14 = [v9 imageProperties];
  objc_msgSend(v14, "setMaximumSize:", 44.0, 44.0);

  id v15 = [v9 imageProperties];
  [v15 setCornerRadius:22.0];

  [v6 setContentConfiguration:v9];
  objc_opt_class();
  id v18 = v6;
  if (objc_opt_isKindOfClass()) {
    id v16 = v18;
  }
  else {
    id v16 = 0;
  }
  id v17 = v16;

  [v17 setAvatarSize:44.0];
  [v18 setAccessoryType:1];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  v14.receiver = self;
  v14.super_class = (Class)HUFaceRecognitionKnownToHomeViewController;
  id v6 = a4;
  [(HUItemTableViewController *)&v14 tableView:a3 didSelectRowAtIndexPath:v6];
  BOOL v7 = [(HUItemTableViewController *)self itemManager];
  id v8 = [v7 displayedItemAtIndexPath:v6];

  if ([v8 conformsToProtocol:&unk_1F1AD8FD0]) {
    id v9 = v8;
  }
  else {
    id v9 = 0;
  }
  id v10 = v9;

  id v11 = [[HUFaceRecognitionPersonEditorViewController alloc] initWithPersonLikeItem:v10];
  [(HUFaceRecognitionPersonEditorViewController *)v11 setDelegate:self];
  id v12 = [(HUFaceRecognitionKnownToHomeViewController *)self navigationController];
  id v13 = (id)objc_msgSend(v12, "hu_pushPreloadableViewController:animated:", v11, 1);
}

- (void)personEditorViewController:(id)a3 didUpdateItem:(id)a4
{
  id v14 = a4;
  if ([v14 conformsToProtocol:&unk_1F19E4798]) {
    id v6 = v14;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;
  id v8 = [v7 homeKitObject];

  id v9 = [(HUItemTableViewController *)self itemManager];
  id v10 = [v9 matchingItemForHomeKitObject:v8];

  if (v10)
  {
    id v11 = [(HUItemTableViewController *)self itemManager];
    id v12 = [MEMORY[0x1E4F1CAD0] setWithObject:v10];
    id v13 = (id)[v11 updateResultsForItems:v12 senderSelector:a2];
  }
}

- (HFItemProvider)homePersonItemProvider
{
  return self->_homePersonItemProvider;
}

- (void)setHomePersonItemProvider:(id)a3
{
}

- (HFItemManager)knownPersonItemManager
{
  return self->_knownPersonItemManager;
}

- (void)setKnownPersonItemManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_knownPersonItemManager, 0);

  objc_storeStrong((id *)&self->_homePersonItemProvider, 0);
}

@end