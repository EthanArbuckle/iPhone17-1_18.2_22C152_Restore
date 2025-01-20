@interface HUCameraRecordingOptionsTableViewController
- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6;
- (HUCameraRecordingOptionsItemManager)detailsItemManager;
- (HUCameraRecordingOptionsTableViewController)initWithServiceLikeItem:(id)a3;
- (HUCameraSettingsModuleController)cameraSettingsModuleController;
- (id)itemModuleControllers;
- (unint64_t)displayStyle;
- (void)dismissTextViewController;
- (void)setCameraSettingsModuleController:(id)a3;
- (void)setDetailsItemManager:(id)a3;
- (void)setDisplayStyle:(unint64_t)a3;
- (void)viewDidLoad;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation HUCameraRecordingOptionsTableViewController

- (HUCameraRecordingOptionsTableViewController)initWithServiceLikeItem:(id)a3
{
  id v4 = a3;
  v5 = [HUCameraRecordingOptionsItemManager alloc];
  v6 = (void *)[v4 copy];

  v7 = [(HFItemManager *)v5 initWithDelegate:self sourceItem:v6];
  [(HUCameraRecordingOptionsItemManager *)v7 setDisplayStyle:3];
  v11.receiver = self;
  v11.super_class = (Class)HUCameraRecordingOptionsTableViewController;
  v8 = [(HUItemTableViewController *)&v11 initWithItemManager:v7 tableViewStyle:1];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_detailsItemManager, v7);
    v9->_displayStyle = 3;
  }

  return v9;
}

- (id)itemModuleControllers
{
  v3 = objc_opt_new();
  v14.receiver = self;
  v14.super_class = (Class)HUCameraRecordingOptionsTableViewController;
  id v4 = [(HUItemTableViewController *)&v14 itemModuleControllers];
  [v3 unionSet:v4];

  v5 = [(HUCameraRecordingOptionsTableViewController *)self detailsItemManager];
  v6 = [v5 cameraRecordingItemModule];

  if (v6)
  {
    v7 = [(HUCameraRecordingOptionsTableViewController *)self cameraSettingsModuleController];

    if (!v7)
    {
      v8 = [[HUCameraSettingsModuleController alloc] initWithModule:v6];
      [(HUCameraRecordingOptionsTableViewController *)self setCameraSettingsModuleController:v8];

      BOOL v9 = [(HUCameraRecordingOptionsTableViewController *)self displayStyle] == 2;
      v10 = [(HUCameraRecordingOptionsTableViewController *)self cameraSettingsModuleController];
      [v10 setUseProxSetupPresentationStyle:v9];

      objc_super v11 = [(HUCameraRecordingOptionsTableViewController *)self cameraSettingsModuleController];
      [v11 setHost:self];
    }
  }
  v12 = [(HUCameraRecordingOptionsTableViewController *)self cameraSettingsModuleController];
  objc_msgSend(v3, "na_safeAddObject:", v12);

  return v3;
}

- (void)setDisplayStyle:(unint64_t)a3
{
  if (self->_displayStyle != a3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_detailsItemManager);
    [WeakRetained setDisplayStyle:a3];

    self->_displayStyle = a3;
  }
}

- (void)viewDidLoad
{
  v7.receiver = self;
  v7.super_class = (Class)HUCameraRecordingOptionsTableViewController;
  [(HUItemTableViewController *)&v7 viewDidLoad];
  id v3 = objc_alloc_init(MEMORY[0x1E4F42B38]);
  id v4 = _HULocalizedStringWithDefaultValue(@"HUServiceDetailsRecordingOptionsDisplayTitle", @"HUServiceDetailsRecordingOptionsDisplayTitle", 1);
  [v3 setText:v4];

  v5 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F438A0]];
  [v3 setFont:v5];

  v6 = [(HUCameraRecordingOptionsTableViewController *)self navigationItem];
  [v6 setTitleView:v3];

  [v3 setAccessibilityIdentifier:@"AccessoryDetails.RecordingOptionDisplayTitle"];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)HUCameraRecordingOptionsTableViewController;
  id v7 = a4;
  -[HUItemTableViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __98__HUCameraRecordingOptionsTableViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v8[3] = &unk_1E6385548;
  v8[4] = self;
  [v7 animateAlongsideTransition:0 completion:v8];
}

void __98__HUCameraRecordingOptionsTableViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) cameraSettingsModuleController];
  [v1 viewSizeDidChanged];
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
    v12 = _HULocalizedStringWithDefaultValue(@"HUCameraAndRecordingLearnMoreTitle", @"HUCameraAndRecordingLearnMoreTitle", 1);
    v13 = _HULocalizedStringWithDefaultValue(@"HUCameraAndRecordingLearnMoreBody", @"HUCameraAndRecordingLearnMoreBody", 1);
    objc_super v14 = (void *)[v11 initWithTitle:v12 detailText:v13 symbolName:0 contentLayout:2];

    v15 = [MEMORY[0x1E4F83A80] boldButton];
    v16 = _HULocalizedStringWithDefaultValue(@"HUDoneTitle", @"HUDoneTitle", 1);
    [v15 setTitle:v16 forState:0];

    [v15 addTarget:self action:sel_dismissTextViewController forControlEvents:64];
    [v15 setAccessibilityIdentifier:@"AccessoryDetails.DoneButton"];
    v17 = [v14 buttonTray];
    [v17 addButton:v15];

    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __98__HUCameraRecordingOptionsTableViewController_textView_shouldInteractWithURL_inRange_interaction___block_invoke;
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

void __98__HUCameraRecordingOptionsTableViewController_textView_shouldInteractWithURL_inRange_interaction___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) navigationController];
  [v2 presentViewController:*(void *)(a1 + 40) animated:1 completion:0];
}

- (void)dismissTextViewController
{
  id v2 = [(HUCameraRecordingOptionsTableViewController *)self navigationController];
  [v2 dismissViewControllerAnimated:1 completion:0];
}

- (unint64_t)displayStyle
{
  return self->_displayStyle;
}

- (HUCameraRecordingOptionsItemManager)detailsItemManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_detailsItemManager);

  return (HUCameraRecordingOptionsItemManager *)WeakRetained;
}

- (void)setDetailsItemManager:(id)a3
{
}

- (HUCameraSettingsModuleController)cameraSettingsModuleController
{
  return self->_cameraSettingsModuleController;
}

- (void)setCameraSettingsModuleController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cameraSettingsModuleController, 0);

  objc_destroyWeak((id *)&self->_detailsItemManager);
}

@end