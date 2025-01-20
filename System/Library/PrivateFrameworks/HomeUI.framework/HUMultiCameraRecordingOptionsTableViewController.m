@interface HUMultiCameraRecordingOptionsTableViewController
- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6;
- (HMHome)home;
- (HUMultiCameraRecordingOptionsItemManager)recordingOptionsItemManager;
- (HUMultiCameraRecordingOptionsTableViewController)initWithHome:(id)a3;
- (NSMutableArray)cameraSettingsModuleControllers;
- (id)itemModuleControllers;
- (void)dismissTextViewController;
- (void)setCameraSettingsModuleControllers:(id)a3;
- (void)setHome:(id)a3;
- (void)setRecordingOptionsItemManager:(id)a3;
- (void)viewDidLoad;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation HUMultiCameraRecordingOptionsTableViewController

- (HUMultiCameraRecordingOptionsTableViewController)initWithHome:(id)a3
{
  id v5 = a3;
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F69188]) initWithHome:v5];
  v7 = [(HFItemManager *)[HUMultiCameraRecordingOptionsItemManager alloc] initWithDelegate:self sourceItem:v6];
  v11.receiver = self;
  v11.super_class = (Class)HUMultiCameraRecordingOptionsTableViewController;
  v8 = [(HUItemTableViewController *)&v11 initWithItemManager:v7 tableViewStyle:2];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_home, a3);
    objc_storeStrong((id *)&v9->_recordingOptionsItemManager, v7);
  }

  return v9;
}

- (id)itemModuleControllers
{
  v3 = objc_opt_new();
  v12.receiver = self;
  v12.super_class = (Class)HUMultiCameraRecordingOptionsTableViewController;
  v4 = [(HUCameraRecordingOptionsTableViewController *)&v12 itemModuleControllers];
  [v3 unionSet:v4];

  id v5 = [(HUMultiCameraRecordingOptionsTableViewController *)self cameraSettingsModuleControllers];

  if (!v5)
  {
    v6 = [MEMORY[0x1E4F1CA48] array];
    [(HUMultiCameraRecordingOptionsTableViewController *)self setCameraSettingsModuleControllers:v6];

    v7 = [(HUMultiCameraRecordingOptionsTableViewController *)self recordingOptionsItemManager];
    v8 = [v7 cameraRecordingItemModules];

    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __73__HUMultiCameraRecordingOptionsTableViewController_itemModuleControllers__block_invoke;
    v11[3] = &unk_1E638F228;
    v11[4] = self;
    objc_msgSend(v8, "na_each:", v11);
  }
  v9 = [(HUMultiCameraRecordingOptionsTableViewController *)self cameraSettingsModuleControllers];
  [v3 addObjectsFromArray:v9];

  return v3;
}

void __73__HUMultiCameraRecordingOptionsTableViewController_itemModuleControllers__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = [[HUCameraSettingsModuleController alloc] initWithModule:v3];

  [(HUCameraSettingsModuleController *)v5 setUseProxSetupPresentationStyle:1];
  [(HUCameraSettingsModuleController *)v5 setHost:*(void *)(a1 + 32)];
  v4 = [*(id *)(a1 + 32) cameraSettingsModuleControllers];
  [v4 addObject:v5];
}

- (void)viewDidLoad
{
  v2.receiver = self;
  v2.super_class = (Class)HUMultiCameraRecordingOptionsTableViewController;
  [(HUCameraRecordingOptionsTableViewController *)&v2 viewDidLoad];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)HUMultiCameraRecordingOptionsTableViewController;
  id v7 = a4;
  -[HUCameraRecordingOptionsTableViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __103__HUMultiCameraRecordingOptionsTableViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v8[3] = &unk_1E6385548;
  v8[4] = self;
  [v7 animateAlongsideTransition:0 completion:v8];
}

void __103__HUMultiCameraRecordingOptionsTableViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) cameraSettingsModuleControllers];
  objc_msgSend(v1, "na_each:", &__block_literal_global_210);
}

uint64_t __103__HUMultiCameraRecordingOptionsTableViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 viewSizeDidChanged];
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  v8 = HFLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v24 = self;
    __int16 v25 = 2112;
    id v26 = v7;
    _os_log_impl(&dword_1BE345000, v8, OS_LOG_TYPE_DEFAULT, "%@: User tapped URL: %@", buf, 0x16u);
  }

  objc_super v9 = objc_msgSend(MEMORY[0x1E4F1CB10], "hf_cameraRecordingURL");
  int v10 = [v7 isEqual:v9];

  if (v10)
  {
    id v11 = objc_alloc(MEMORY[0x1E4F83AE8]);
    objc_super v12 = _HULocalizedStringWithDefaultValue(@"HUCameraAndRecordingLearnMoreTitle", @"HUCameraAndRecordingLearnMoreTitle", 1);
    v13 = _HULocalizedStringWithDefaultValue(@"HUCameraAndRecordingLearnMoreBody", @"HUCameraAndRecordingLearnMoreBody", 1);
    v14 = (void *)[v11 initWithTitle:v12 detailText:v13 symbolName:0 contentLayout:2];

    v15 = [MEMORY[0x1E4F83A80] boldButton];
    v16 = _HULocalizedStringWithDefaultValue(@"HUDoneTitle", @"HUDoneTitle", 1);
    [v15 setTitle:v16 forState:0];

    [v15 addTarget:self action:sel_dismissTextViewController forControlEvents:64];
    v17 = [v14 buttonTray];
    [v17 addButton:v15];

    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __103__HUMultiCameraRecordingOptionsTableViewController_textView_shouldInteractWithURL_inRange_interaction___block_invoke;
    v21[3] = &unk_1E63850E0;
    v21[4] = self;
    id v22 = v14;
    id v18 = v14;
    dispatch_async(MEMORY[0x1E4F14428], v21);
  }
  else
  {
    v15 = [MEMORY[0x1E4F69378] sharedInstance];
    id v19 = (id)[v15 openURL:v7];
  }

  return v10 ^ 1;
}

void __103__HUMultiCameraRecordingOptionsTableViewController_textView_shouldInteractWithURL_inRange_interaction___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) navigationController];
  [v2 presentViewController:*(void *)(a1 + 40) animated:1 completion:0];
}

- (void)dismissTextViewController
{
  id v2 = [(HUMultiCameraRecordingOptionsTableViewController *)self navigationController];
  [v2 dismissViewControllerAnimated:1 completion:0];
}

- (HUMultiCameraRecordingOptionsItemManager)recordingOptionsItemManager
{
  return self->_recordingOptionsItemManager;
}

- (void)setRecordingOptionsItemManager:(id)a3
{
}

- (NSMutableArray)cameraSettingsModuleControllers
{
  return self->_cameraSettingsModuleControllers;
}

- (void)setCameraSettingsModuleControllers:(id)a3
{
}

- (HMHome)home
{
  return self->_home;
}

- (void)setHome:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_cameraSettingsModuleControllers, 0);

  objc_storeStrong((id *)&self->_recordingOptionsItemManager, 0);
}

@end