@interface HMHearingAidTimeToAdjustInfoViewController
- (HMHearingAidEnrollmentDelegate)delegate;
- (HMHearingAidTimeToAdjustInfoViewController)init;
- (void)mainButtonTapped;
- (void)setDelegate:(id)a3;
- (void)updateButtonTray;
- (void)updateImage;
- (void)viewDidLoad;
@end

@implementation HMHearingAidTimeToAdjustInfoViewController

- (HMHearingAidTimeToAdjustInfoViewController)init
{
  v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v4 = [v3 localizedStringForKey:@"Hearing Aid Can Take Time to Get Used To" value:&stru_27021F2D8 table:0];

  v5 = (void *)MEMORY[0x263F827E8];
  v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v7 = [v5 imageNamed:@"Calendar-Light" inBundle:v6];

  v10.receiver = self;
  v10.super_class = (Class)HMHearingAidTimeToAdjustInfoViewController;
  v8 = [(HMHearingAidTimeToAdjustInfoViewController *)&v10 initWithTitle:v4 detailText:0 icon:v7];

  return v8;
}

- (void)viewDidLoad
{
  v21[1] = *MEMORY[0x263EF8340];
  v20.receiver = self;
  v20.super_class = (Class)HMHearingAidTimeToAdjustInfoViewController;
  [(OBBaseWelcomeController *)&v20 viewDidLoad];
  [(HMHearingAidTimeToAdjustInfoViewController *)self updateImage];
  objc_initWeak(&location, self);
  v21[0] = objc_opt_class();
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:1];
  uint64_t v14 = MEMORY[0x263EF8330];
  uint64_t v15 = 3221225472;
  v16 = __57__HMHearingAidTimeToAdjustInfoViewController_viewDidLoad__block_invoke;
  v17 = &unk_265366008;
  objc_copyWeak(&v18, &location);
  id v4 = (id)[(HMHearingAidTimeToAdjustInfoViewController *)self registerForTraitChanges:v3 withHandler:&v14];

  v5 = objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class(), v14, v15, v16, v17);
  v6 = [v5 localizedStringForKey:@"Your hearing may need to get used to the new sound of your AirPods Pro. This is normal and can take a few weeks." value:&stru_27021F2D8 table:0];

  v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v8 = [v7 localizedStringForKey:@"You can speed up the adjustment by consistently wearing your AirPods when you find it difficult to hear." value:&stru_27021F2D8 table:0];

  v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  objc_super v10 = [v9 localizedStringForKey:@"You can always adjust the sound in AirPods settings and Control Center." value:&stru_27021F2D8 table:0];

  v11 = [MEMORY[0x263F825C8] systemBlueColor];
  [(HMHearingAidTimeToAdjustInfoViewController *)self addBulletedListItemWithTitle:v6 description:&stru_27021F2D8 symbolName:@"calendar" tintColor:v11];

  v12 = [MEMORY[0x263F825C8] systemBlueColor];
  [(HMHearingAidTimeToAdjustInfoViewController *)self addBulletedListItemWithTitle:v8 description:&stru_27021F2D8 symbolName:@"airpodspro" tintColor:v12];

  v13 = [MEMORY[0x263F825C8] systemBlueColor];
  [(HMHearingAidTimeToAdjustInfoViewController *)self addBulletedListItemWithTitle:v10 description:&stru_27021F2D8 symbolName:@"slider.horizontal.below.waveform" tintColor:v13];

  [(HMHearingAidTimeToAdjustInfoViewController *)self updateButtonTray];
  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

void __57__HMHearingAidTimeToAdjustInfoViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained updateImage];
}

- (void)updateButtonTray
{
  id v6 = [MEMORY[0x263F5B898] boldButton];
  v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v4 = [v3 localizedStringForKey:@"Next" value:&stru_27021F2D8 table:0];

  [v6 setTitle:v4 forState:0];
  [v6 addTarget:self action:sel_mainButtonTapped forControlEvents:64];
  v5 = [(HMHearingAidTimeToAdjustInfoViewController *)self buttonTray];
  [v5 addButton:v6];
}

- (void)mainButtonTapped
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained completeStep:1];
}

- (void)updateImage
{
  v3 = NSString;
  id v4 = [(HMHearingAidTimeToAdjustInfoViewController *)self traitCollection];
  uint64_t v5 = [v4 userInterfaceStyle];
  id v6 = "Light";
  if (v5 == 2) {
    id v6 = "Dark";
  }
  v7 = objc_msgSend(v3, "stringWithFormat:", @"Calendar-%s", v6);

  v8 = (void *)MEMORY[0x263F827E8];
  v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  objc_super v10 = [v8 imageNamed:v7 inBundle:v9];

  v12.receiver = self;
  v12.super_class = (Class)HMHearingAidTimeToAdjustInfoViewController;
  v11 = [(HMHearingAidTimeToAdjustInfoViewController *)&v12 headerView];
  [v11 setIcon:v10 accessibilityLabel:&stru_27021F2D8];
}

- (HMHearingAidEnrollmentDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HMHearingAidEnrollmentDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end