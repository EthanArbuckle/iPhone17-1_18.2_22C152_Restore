@interface HMHearingAidIntroViewController
- (HMHearingAidEnrollmentDelegate)delegate;
- (HMHearingAidIntroViewController)init;
- (void)mainButtonTapped;
- (void)setDelegate:(id)a3;
- (void)updateButtonTray;
- (void)updateImage;
- (void)viewDidLoad;
@end

@implementation HMHearingAidIntroViewController

- (HMHearingAidIntroViewController)init
{
  v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v4 = [v3 localizedStringForKey:@"Hearing Aid" value:&stru_27021F2D8 table:0];

  v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v6 = [v5 localizedStringForKey:@"AirPods Pro can help with hearing loss." value:&stru_27021F2D8 table:0];

  v7 = (void *)MEMORY[0x263F827E8];
  v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v9 = [v7 imageNamed:@"HearingAssistEar-Light" inBundle:v8];

  v12.receiver = self;
  v12.super_class = (Class)HMHearingAidIntroViewController;
  v10 = [(HMHearingAidIntroViewController *)&v12 initWithTitle:v4 detailText:v6 icon:v9];

  return v10;
}

- (void)viewDidLoad
{
  v18[1] = *MEMORY[0x263EF8340];
  v17.receiver = self;
  v17.super_class = (Class)HMHearingAidIntroViewController;
  [(OBBaseWelcomeController *)&v17 viewDidLoad];
  [(HMHearingAidIntroViewController *)self updateImage];
  objc_initWeak(&location, self);
  v18[0] = objc_opt_class();
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:1];
  uint64_t v11 = MEMORY[0x263EF8330];
  uint64_t v12 = 3221225472;
  v13 = __46__HMHearingAidIntroViewController_viewDidLoad__block_invoke;
  v14 = &unk_265366008;
  objc_copyWeak(&v15, &location);
  id v4 = (id)[(HMHearingAidIntroViewController *)self registerForTraitChanges:v3 withHandler:&v11];

  v5 = objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class(), v11, v12, v13, v14);
  v6 = [v5 localizedStringForKey:@"Your AirPods Pro can be used as a clinical-grade hearing aid. They use the results of your hearing test to make adjustments that help you hear the voices and sounds around you." value:&stru_27021F2D8 table:0];

  v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v8 = [v7 localizedStringForKey:@"Your AirPods Pro can also make adjustments that help you hear media like music, videos, and phone calls.", &stru_27021F2D8, 0 value table];

  v9 = [MEMORY[0x263F825C8] systemBlueColor];
  [(HMHearingAidIntroViewController *)self addBulletedListItemWithTitle:v6 description:&stru_27021F2D8 symbolName:@"airpodspro" tintColor:v9];

  v10 = [MEMORY[0x263F825C8] systemBlueColor];
  [(HMHearingAidIntroViewController *)self addBulletedListItemWithTitle:v8 description:&stru_27021F2D8 symbolName:@"ear.badge.waveform" tintColor:v10];

  [(HMHearingAidIntroViewController *)self updateButtonTray];
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __46__HMHearingAidIntroViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained updateImage];
}

- (void)updateButtonTray
{
  id v9 = [MEMORY[0x263F5B898] boldButton];
  v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v4 = [v3 localizedStringForKey:@"Get Started" value:&stru_27021F2D8 table:0];

  [v9 setTitle:v4 forState:0];
  [v9 addTarget:self action:sel_mainButtonTapped forControlEvents:64];
  v5 = [(HMHearingAidIntroViewController *)self buttonTray];
  [v5 addButton:v9];

  v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v7 = [v6 localizedStringForKey:@"Note: If you have little to no hearing loss or severe hearing loss, Hearing Aid may not be right for you.\n", &stru_27021F2D8, 0 value table];

  v8 = [(HMHearingAidIntroViewController *)self buttonTray];
  [v8 setCaptionText:v7 instructionsForUseAction:&__block_literal_global_0];
}

void __51__HMHearingAidIntroViewController_updateButtonTray__block_invoke()
{
  id v1 = [MEMORY[0x263F01880] defaultWorkspace];
  v0 = [NSURL URLWithString:@"https://www.apple.com/legal/ifu/haf"];
  [v1 openSensitiveURL:v0 withOptions:0];
}

- (void)mainButtonTapped
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained completeStep:0];
}

- (void)updateImage
{
  v3 = NSString;
  id v4 = [(HMHearingAidIntroViewController *)self traitCollection];
  uint64_t v5 = [v4 userInterfaceStyle];
  v6 = "Light";
  if (v5 == 2) {
    v6 = "Dark";
  }
  v7 = objc_msgSend(v3, "stringWithFormat:", @"HearingAssistEar-%s", v6);

  v8 = (void *)MEMORY[0x263F827E8];
  id v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v10 = [v8 imageNamed:v7 inBundle:v9];

  v12.receiver = self;
  v12.super_class = (Class)HMHearingAidIntroViewController;
  uint64_t v11 = [(HMHearingAidIntroViewController *)&v12 headerView];
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