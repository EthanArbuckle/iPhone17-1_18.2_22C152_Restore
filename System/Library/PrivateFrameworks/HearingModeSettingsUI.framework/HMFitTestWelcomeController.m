@interface HMFitTestWelcomeController
- (BluetoothDevice)currentDevice;
- (HMFitTestWelcomeController)init;
- (void)cancelFitTest;
- (void)continueToFitTest;
- (void)deviceDisconnectedHandler:(id)a3;
- (void)loadView;
- (void)setCurrentDevice:(id)a3;
- (void)viewDidLoad;
@end

@implementation HMFitTestWelcomeController

- (HMFitTestWelcomeController)init
{
  if (!self) {
    return 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)HMFitTestWelcomeController;
  v2 = [(HMFitTestWelcomeController *)&v6 init];
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 addObserver:v2 selector:sel_deviceDisconnectedHandler_ name:*MEMORY[0x263F2B910] object:0];

  v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 addObserver:v2 selector:sel_powerChangedHandler_ name:*MEMORY[0x263F2B8E8] object:0];

  return v2;
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)HMFitTestWelcomeController;
  [(HMFitTestWelcomeController *)&v5 viewDidLoad];
  v3 = [(HMFitTestWelcomeController *)self view];
  v4 = [MEMORY[0x263F825C8] systemBackgroundColor];
  [v3 setBackgroundColor:v4];
}

- (void)loadView
{
  v45.receiver = self;
  v45.super_class = (Class)HMFitTestWelcomeController;
  [(HMFitTestWelcomeController *)&v45 loadView];
  v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v44 = [v3 localizedStringForKey:@"For the best acoustic performance, AirPods ear tips should create a complete seal when placed in your ears.", &stru_2702152D0, 0 value table];

  id v4 = objc_alloc(MEMORY[0x263F5B918]);
  objc_super v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  objc_super v6 = [v5 localizedStringForKey:@"Test the Fit of Your Ear Tips" value:&stru_2702152D0 table:0];
  v7 = (void *)[v4 initWithTitle:v6 detailText:v44 icon:0];

  v8 = [(HMFitTestWelcomeController *)self view];
  [v8 bounds];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  v17 = [v7 view];
  objc_msgSend(v17, "setFrame:", v10, v12, v14, v16);

  v18 = [v7 view];
  [v18 setAutoresizingMask:18];

  v19 = [(HMFitTestWelcomeController *)self traitCollection];
  uint64_t v20 = [v19 userInterfaceStyle];

  if (v20 == 2) {
    v21 = "dark";
  }
  else {
    v21 = "light";
  }
  v43 = objc_msgSend(NSString, "stringWithFormat:", @"Bullet-AudioQuality-%s", v21);
  v22 = (void *)MEMORY[0x263F827E8];
  v23 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v42 = [v22 imageNamed:v43 inBundle:v23 compatibleWithTraitCollection:0];

  v24 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v25 = [v24 localizedStringForKey:@"Audio Quality" value:&stru_2702152D0 table:0];
  v26 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v27 = [v26 localizedStringForKey:@"A good seal will improve overall audio quality with deeper bass and richer low frequencies." value:&stru_2702152D0 table:0];
  [v7 addBulletedListItemWithTitle:v25 description:v27 image:v42];

  v28 = objc_msgSend(NSString, "stringWithFormat:", @"Bullet-ANC-%s", v21);
  v29 = (void *)MEMORY[0x263F827E8];
  v30 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v31 = [v29 imageNamed:v28 inBundle:v30 compatibleWithTraitCollection:0];

  v32 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v33 = [v32 localizedStringForKey:@"Noise Cancellation" value:&stru_2702152D0 table:0];
  v34 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v35 = [v34 localizedStringForKey:@"A good seal will keep noise from leaking in or out and results in better noise cancellation." value:&stru_2702152D0 table:0];
  [v7 addBulletedListItemWithTitle:v33 description:v35 image:v31];

  v36 = [MEMORY[0x263F5B898] boldButton];
  v37 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v38 = [v37 localizedStringForKey:@"Continue" value:&stru_2702152D0 table:0];
  [v36 setTitle:v38 forState:0];

  [v36 addTarget:self action:sel_continueToFitTest forControlEvents:64];
  v39 = [v7 buttonTray];
  [v39 addButton:v36];

  [(HMFitTestWelcomeController *)self addChildViewController:v7];
  v40 = [(HMFitTestWelcomeController *)self view];
  v41 = [v7 view];
  [v40 addSubview:v41];
}

- (void)cancelFitTest
{
}

- (void)continueToFitTest
{
  id v10 = (id)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:1 target:self action:sel_cancelFitTest];
  v3 = [HMFitTestController alloc];
  id v4 = [(HMFitTestWelcomeController *)self currentDevice];
  objc_super v5 = [(HMFitTestController *)v3 initWithDevice:v4];

  objc_super v6 = [(HMFitTestController *)v5 navigationItem];
  [v6 setLeftBarButtonItem:v10];

  v7 = [(HMFitTestController *)v5 navigationController];
  v8 = [v7 navigationItem];
  [v8 setHidesBackButton:1];

  double v9 = [(HMFitTestWelcomeController *)self navigationController];
  [v9 pushViewController:v5 animated:1];
}

- (void)deviceDisconnectedHandler:(id)a3
{
  id v6 = [a3 object];
  id v4 = [v6 address];
  objc_super v5 = [(BluetoothDevice *)self->_currentDevice address];

  if (v4 == v5) {
    [(HMFitTestWelcomeController *)self cancelFitTest];
  }
}

- (BluetoothDevice)currentDevice
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