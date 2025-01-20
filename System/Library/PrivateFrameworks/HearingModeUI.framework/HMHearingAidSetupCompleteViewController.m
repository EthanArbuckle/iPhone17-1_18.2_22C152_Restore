@interface HMHearingAidSetupCompleteViewController
- (HMHearingAidEnrollmentDelegate)delegate;
- (HMHearingAidSetupCompleteViewController)initWithDeviceName:(id)a3;
- (NSString)deviceName;
- (void)_showInstructionsForUse;
- (void)linkButtonTapped;
- (void)mainButtonTapped;
- (void)setDelegate:(id)a3;
- (void)setDeviceName:(id)a3;
- (void)updateButtonTray;
- (void)updateImage;
- (void)viewDidLoad;
@end

@implementation HMHearingAidSetupCompleteViewController

- (HMHearingAidSetupCompleteViewController)initWithDeviceName:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v6 = [v5 localizedStringForKey:@"Hearing Aid is Ready" value:&stru_27021F2D8 table:0];

  v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v8 = [v7 localizedStringForKey:@"If you ever feel your hearing is getting worse, you feel pain, or you’re getting dizzy, talk to your doctor.", &stru_27021F2D8, 0 value table];

  v9 = (void *)MEMORY[0x263F827E8];
  v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v11 = [v9 imageNamed:@"HearingAssistEarDone-Light" inBundle:v10];

  v16.receiver = self;
  v16.super_class = (Class)HMHearingAidSetupCompleteViewController;
  v12 = [(HMHearingAidSetupCompleteViewController *)&v16 initWithTitle:v6 detailText:v8 icon:v11];
  if (v12)
  {
    uint64_t v13 = [v4 copy];
    deviceName = v12->_deviceName;
    v12->_deviceName = (NSString *)v13;
  }
  return v12;
}

- (void)viewDidLoad
{
  v12[1] = *MEMORY[0x263EF8340];
  v11.receiver = self;
  v11.super_class = (Class)HMHearingAidSetupCompleteViewController;
  [(OBBaseWelcomeController *)&v11 viewDidLoad];
  [(HMHearingAidSetupCompleteViewController *)self updateImage];
  objc_initWeak(&location, self);
  v12[0] = objc_opt_class();
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:1];
  uint64_t v5 = MEMORY[0x263EF8330];
  uint64_t v6 = 3221225472;
  v7 = __54__HMHearingAidSetupCompleteViewController_viewDidLoad__block_invoke;
  v8 = &unk_265366008;
  objc_copyWeak(&v9, &location);
  id v4 = (id)[(HMHearingAidSetupCompleteViewController *)self registerForTraitChanges:v3 withHandler:&v5];

  [(HMHearingAidSetupCompleteViewController *)self updateButtonTray];
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __54__HMHearingAidSetupCompleteViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained updateImage];
}

- (void)updateButtonTray
{
  v3 = NSString;
  id v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v5 = [v4 localizedStringForKey:@"Hearing Aid will be used instead of Headphone Accommodations for \"%@\"" value:&stru_27021F2D8 table:0];
  uint64_t v6 = [(HMHearingAidSetupCompleteViewController *)self deviceName];
  objc_msgSend(v3, "localizedStringWithFormat:", v5, v6);
  id v16 = (id)objc_claimAutoreleasedReturnValue();

  v7 = [(HMHearingAidSetupCompleteViewController *)self buttonTray];
  [v7 setCaptionText:v16];

  v8 = [MEMORY[0x263F5B898] boldButton];
  id v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v10 = [v9 localizedStringForKey:@"Turn On Hearing Aid" value:&stru_27021F2D8 table:0];

  [v8 setTitle:v10 forState:0];
  [v8 addTarget:self action:sel_mainButtonTapped forControlEvents:64];
  objc_super v11 = [(HMHearingAidSetupCompleteViewController *)self buttonTray];
  [v11 addButton:v8];

  v12 = [MEMORY[0x263F5B8D0] linkButton];
  uint64_t v13 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v14 = [v13 localizedStringForKey:@"Not Now" value:&stru_27021F2D8 table:0];

  [v12 setTitle:v14 forState:0];
  [v12 addTarget:self action:sel_linkButtonTapped forControlEvents:64];
  v15 = [(HMHearingAidSetupCompleteViewController *)self buttonTray];
  [v15 addButton:v12];
}

- (void)mainButtonTapped
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained completeStep:2];
}

- (void)linkButtonTapped
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained completeStep:3];
}

- (void)_showInstructionsForUse
{
  id v2 = [(HMHearingAidSetupCompleteViewController *)self delegate];
  [v2 showInstructionForUse];
}

- (void)updateImage
{
  v3 = NSString;
  id v4 = [(HMHearingAidSetupCompleteViewController *)self traitCollection];
  uint64_t v5 = [v4 userInterfaceStyle];
  uint64_t v6 = "Light";
  if (v5 == 2) {
    uint64_t v6 = "Dark";
  }
  v7 = objc_msgSend(v3, "stringWithFormat:", @"HearingAssistEarDone-%s", v6);

  v8 = (void *)MEMORY[0x263F827E8];
  id v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v10 = [v8 imageNamed:v7 inBundle:v9];

  v12.receiver = self;
  v12.super_class = (Class)HMHearingAidSetupCompleteViewController;
  objc_super v11 = [(HMHearingAidSetupCompleteViewController *)&v12 headerView];
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

- (NSString)deviceName
{
  return self->_deviceName;
}

- (void)setDeviceName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceName, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end