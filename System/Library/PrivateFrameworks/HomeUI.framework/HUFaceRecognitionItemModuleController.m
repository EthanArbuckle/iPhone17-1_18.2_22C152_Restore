@interface HUFaceRecognitionItemModuleController
- (Class)cellClassForItem:(id)a3;
- (id)presentFaceRecognitionAddPersonSettingsForUnknownPersonEvent:(id)a3 animated:(BOOL)a4;
- (id)presentFaceRecognitionPersonSettingsForPerson:(id)a3 personManager:(id)a4 animated:(BOOL)a5;
- (unint64_t)didSelectItem:(id)a3;
- (void)setupCell:(id)a3 forItem:(id)a4;
- (void)updateCell:(id)a3 forItem:(id)a4 animated:(BOOL)a5;
@end

@implementation HUFaceRecognitionItemModuleController

- (id)presentFaceRecognitionPersonSettingsForPerson:(id)a3 personManager:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  objc_opt_class();
  v10 = [(HUItemModuleController *)self module];
  if (objc_opt_isKindOfClass()) {
    v11 = v10;
  }
  else {
    v11 = 0;
  }
  id v12 = v11;

  v13 = [HUFaceRecognitionLibraryListViewController alloc];
  v14 = [v12 home];

  v15 = [(HUFaceRecognitionLibraryListViewController *)v13 initWithHome:v14];
  v16 = +[HUViewControllerPresentationRequest requestWithViewController:v15];
  [v16 setAnimated:v5];
  [v16 setPreferredPresentationType:1];
  v17 = [(HUItemModuleController *)self host];
  v18 = [v17 moduleController:self presentViewControllerForRequest:v16];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __110__HUFaceRecognitionItemModuleController_presentFaceRecognitionPersonSettingsForPerson_personManager_animated___block_invoke;
  v24[3] = &unk_1E638EE70;
  id v25 = v8;
  id v26 = v9;
  v27 = v15;
  BOOL v28 = v5;
  id v19 = v8;
  id v20 = v9;
  v21 = v15;
  v22 = [v18 flatMap:v24];

  return v22;
}

id __110__HUFaceRecognitionItemModuleController_presentFaceRecognitionPersonSettingsForPerson_personManager_animated___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32) && *(void *)(a1 + 40))
  {
    v1 = objc_msgSend(*(id *)(a1 + 48), "presentFaceRecognitionPersonSettingsForPerson:personManager:animated:");
  }
  else
  {
    v1 = [MEMORY[0x1E4F7A0D8] futureWithResult:*(void *)(a1 + 48)];
  }

  return v1;
}

- (id)presentFaceRecognitionAddPersonSettingsForUnknownPersonEvent:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  objc_opt_class();
  v7 = [(HUItemModuleController *)self module];
  if (objc_opt_isKindOfClass()) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }
  id v9 = v8;

  v10 = [HUFaceRecognitionLibraryListViewController alloc];
  v11 = [v9 home];

  id v12 = [(HUFaceRecognitionLibraryListViewController *)v10 initWithHome:v11];
  v13 = +[HUViewControllerPresentationRequest requestWithViewController:v12];
  [v13 setAnimated:v4];
  [v13 setPreferredPresentationType:1];
  v14 = [(HUItemModuleController *)self host];
  v15 = [v14 moduleController:self presentViewControllerForRequest:v13];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __111__HUFaceRecognitionItemModuleController_presentFaceRecognitionAddPersonSettingsForUnknownPersonEvent_animated___block_invoke;
  v20[3] = &unk_1E638EE98;
  v21 = v12;
  id v22 = v6;
  BOOL v23 = v4;
  v16 = v12;
  id v17 = v6;
  v18 = [v15 flatMap:v20];

  return v18;
}

uint64_t __111__HUFaceRecognitionItemModuleController_presentFaceRecognitionAddPersonSettingsForUnknownPersonEvent_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) presentFaceRecognitionAddPersonSettingsForUnknownPersonEvent:*(void *)(a1 + 40) animated:*(unsigned __int8 *)(a1 + 48)];
}

- (Class)cellClassForItem:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = [(HUItemModuleController *)self module];
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  id v8 = [v7 faceRecognitionCellItem];

  if (v8 != v4) {
    NSLog(&cfstr_ForgotToDeclar.isa);
  }
  id v9 = objc_opt_class();

  return (Class)v9;
}

- (void)setupCell:(id)a3 forItem:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  objc_opt_class();
  id v7 = [(HUItemModuleController *)self module];
  if (objc_opt_isKindOfClass()) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }
  id v9 = v8;

  id v10 = [v9 faceRecognitionCellItem];

  if (v10 == v6)
  {
    objc_opt_class();
    id v11 = v14;
    if (objc_opt_isKindOfClass()) {
      id v12 = v11;
    }
    else {
      id v12 = 0;
    }
    id v13 = v12;

    [v13 setAccessoryType:1];
    [v13 setHideIcon:1];
  }
}

- (void)updateCell:(id)a3 forItem:(id)a4 animated:(BOOL)a5
{
  id v15 = a3;
  id v7 = a4;
  objc_opt_class();
  id v8 = [(HUItemModuleController *)self module];
  if (objc_opt_isKindOfClass()) {
    id v9 = v8;
  }
  else {
    id v9 = 0;
  }
  id v10 = v9;

  id v11 = [v10 faceRecognitionCellItem];

  if (v11 == v7)
  {
    id v12 = [v7 latestResults];
    id v13 = [v12 objectForKeyedSubscript:*MEMORY[0x1E4F68A08]];
    int v14 = [v13 BOOLValue];

    [v15 setAccessoryType:v14 ^ 1u];
  }
}

- (unint64_t)didSelectItem:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = [(HUItemModuleController *)self module];
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  id v8 = [v7 faceRecognitionCellItem];
  int v9 = [v4 isEqual:v8];

  unint64_t v10 = 0;
  if (v9)
  {
    id v11 = [HUFaceRecognitionLibraryListViewController alloc];
    id v12 = [v7 home];
    id v13 = [(HUFaceRecognitionLibraryListViewController *)v11 initWithHome:v12];

    int v14 = +[HUViewControllerPresentationRequest requestWithViewController:v13];
    unint64_t v10 = 1;
    [v14 setPreferredPresentationType:1];
    id v15 = [(HUItemModuleController *)self host];
    id v16 = (id)[v15 moduleController:self presentViewControllerForRequest:v14];
  }
  return v10;
}

@end