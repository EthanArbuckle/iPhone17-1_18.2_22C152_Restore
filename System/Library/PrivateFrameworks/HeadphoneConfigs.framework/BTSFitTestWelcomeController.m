@interface BTSFitTestWelcomeController
- (BTSDevice)currentDevice;
- (BTSFitTestWelcomeController)init;
- (void)cancelFitTest;
- (void)continueToFitTest;
- (void)deviceDisconnectedHandler:(id)a3;
- (void)loadView;
- (void)setCurrentDevice:(id)a3;
- (void)viewDidLoad;
@end

@implementation BTSFitTestWelcomeController

- (BTSFitTestWelcomeController)init
{
  if (!self) {
    return 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)BTSFitTestWelcomeController;
  v2 = [(BTSFitTestWelcomeController *)&v6 init];
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:v2 selector:sel_deviceDisconnectedHandler_ name:*MEMORY[0x1E4F50B18] object:0];

  v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 addObserver:v2 selector:sel_powerChangedHandler_ name:*MEMORY[0x1E4F50AE8] object:0];

  return v2;
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)BTSFitTestWelcomeController;
  [(BTSFitTestWelcomeController *)&v5 viewDidLoad];
  v3 = [(BTSFitTestWelcomeController *)self view];
  v4 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  [v3 setBackgroundColor:v4];
}

- (void)loadView
{
  v56.receiver = self;
  v56.super_class = (Class)BTSFitTestWelcomeController;
  [(BTSFitTestWelcomeController *)&v56 loadView];
  v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v4 = [v3 localizedStringForKey:@"FIT_TEST_WELCOME_DETAIL" value:&stru_1F4097960 table:@"DeviceConfig"];

  objc_super v5 = [(BTSFitTestWelcomeController *)self currentDevice];
  objc_super v6 = [v5 classicDevice];
  int v7 = [v6 productId];

  if (v7 == 8210)
  {
    v8 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v9 = [v8 localizedStringForKey:@"FIT_TEST_WELCOME_DETAIL" value:&stru_1F4097960 table:@"DeviceConfig-B494"];

    v4 = (void *)v9;
  }
  v10 = [(BTSFitTestWelcomeController *)self currentDevice];
  v11 = [v10 classicDevice];
  int v12 = [v11 productId];

  if (v12 == 8221)
  {
    v13 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v14 = [v13 localizedStringForKey:@"FIT_TEST_WELCOME_DETAIL" value:&stru_1F4097960 table:@"DeviceConfig-B498-v2"];

    v4 = (void *)v14;
  }
  v54 = v4;
  id v15 = objc_alloc(MEMORY[0x1E4F83AF8]);
  v16 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v17 = objc_msgSend(v16, "localizedStringForKey:value:table:", @"FIT_TEST_WELCOME_HEADER");
  v18 = (void *)[v15 initWithTitle:v17 detailText:v4 icon:0];

  v19 = [(BTSFitTestWelcomeController *)self view];
  [v19 bounds];
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;
  double v27 = v26;
  v28 = [v18 view];
  objc_msgSend(v28, "setFrame:", v21, v23, v25, v27);

  v29 = [v18 view];
  [v29 setAutoresizingMask:18];

  v30 = [(BTSFitTestWelcomeController *)self traitCollection];
  uint64_t v31 = [v30 userInterfaceStyle];

  if (v31 == 2) {
    v32 = "dark";
  }
  else {
    v32 = "light";
  }
  v55 = objc_msgSend(NSString, "stringWithFormat:", @"Bullet-AudioQuality-%s", v32);
  v33 = (void *)MEMORY[0x1E4FB1818];
  v34 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v53 = [v33 imageNamed:v55 inBundle:v34 compatibleWithTraitCollection:0];

  v35 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v36 = [v35 localizedStringForKey:@"FIT_TEST_WELCOME_BULLET1_HEADER" value:&stru_1F4097960 table:@"DeviceConfig"];
  v37 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v38 = [v37 localizedStringForKey:@"FIT_TEST_WELCOME_BULLET1_DETAIL" value:&stru_1F4097960 table:@"DeviceConfig"];
  [v18 addBulletedListItemWithTitle:v36 description:v38 image:v53];

  v39 = objc_msgSend(NSString, "stringWithFormat:", @"Bullet-ANC-%s", v32);
  v40 = (void *)MEMORY[0x1E4FB1818];
  v41 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v42 = [v40 imageNamed:v39 inBundle:v41 compatibleWithTraitCollection:0];

  v43 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v44 = [v43 localizedStringForKey:@"FIT_TEST_WELCOME_BULLET2_HEADER" value:&stru_1F4097960 table:@"DeviceConfig"];
  v45 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v46 = [v45 localizedStringForKey:@"FIT_TEST_WELCOME_BULLET2_DETAIL" value:&stru_1F4097960 table:@"DeviceConfig"];
  [v18 addBulletedListItemWithTitle:v44 description:v46 image:v42];

  v47 = [MEMORY[0x1E4F83A80] boldButton];
  v48 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v49 = [v48 localizedStringForKey:@"CONTINUE" value:&stru_1F4097960 table:@"DeviceConfig"];
  [v47 setTitle:v49 forState:0];

  [v47 addTarget:self action:sel_continueToFitTest forControlEvents:64];
  v50 = [v18 buttonTray];
  [v50 addButton:v47];

  [(BTSFitTestWelcomeController *)self addChildViewController:v18];
  v51 = [(BTSFitTestWelcomeController *)self view];
  v52 = [v18 view];
  [v51 addSubview:v52];
}

- (void)cancelFitTest
{
}

- (void)continueToFitTest
{
  id v11 = (id)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:1 target:self action:sel_cancelFitTest];
  v3 = [BTSFitTestController alloc];
  v4 = [(BTSFitTestWelcomeController *)self currentDevice];
  objc_super v5 = [v4 classicDevice];
  objc_super v6 = [(BTSFitTestController *)v3 initWithDevice:v5];

  int v7 = [(BTSFitTestController *)v6 navigationItem];
  [v7 setLeftBarButtonItem:v11];

  v8 = [(BTSFitTestController *)v6 navigationController];
  uint64_t v9 = [v8 navigationItem];
  [v9 setHidesBackButton:1];

  v10 = [(BTSFitTestWelcomeController *)self navigationController];
  [v10 pushViewController:v6 animated:1];
}

- (void)deviceDisconnectedHandler:(id)a3
{
  id v7 = [a3 object];
  v4 = [v7 address];
  objc_super v5 = [(BTSFitTestWelcomeController *)self currentDevice];
  objc_super v6 = [v5 identifier];

  if (v4 == v6) {
    [(BTSFitTestWelcomeController *)self cancelFitTest];
  }
}

- (BTSDevice)currentDevice
{
  return self->_currentDevice;
}

- (void)setCurrentDevice:(id)a3
{
}

- (void).cxx_destruct
{
}

@end