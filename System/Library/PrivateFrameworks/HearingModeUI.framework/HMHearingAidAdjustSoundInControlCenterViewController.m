@interface HMHearingAidAdjustSoundInControlCenterViewController
- (BOOL)isiPad;
- (BSUICAPackageView)micaView;
- (HMHearingAidAdjustSoundInControlCenterViewController)init;
- (HMHearingAidEnrollmentDelegate)delegate;
- (void)addControlCenterModule;
- (void)mainButtonTapped;
- (void)setDelegate:(id)a3;
- (void)setMicaView:(id)a3;
- (void)updateButtonTray;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation HMHearingAidAdjustSoundInControlCenterViewController

- (HMHearingAidAdjustSoundInControlCenterViewController)init
{
  v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v4 = [v3 localizedStringForKey:@"You Can Make Adjustments in Control Center" value:&stru_27021F2D8 table:0];

  v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v6 = [v5 localizedStringForKey:@"Swipe down from the top right of your iPhone, then tap the ear icon and adjust the sliders.", &stru_27021F2D8, 0 value table];

  v9.receiver = self;
  v9.super_class = (Class)HMHearingAidAdjustSoundInControlCenterViewController;
  v7 = [(HMHearingAidAdjustSoundInControlCenterViewController *)&v9 initWithTitle:v4 detailText:v6 icon:0 contentLayout:1];

  return v7;
}

- (void)viewDidLoad
{
  v40[4] = *MEMORY[0x263EF8340];
  v39.receiver = self;
  v39.super_class = (Class)HMHearingAidAdjustSoundInControlCenterViewController;
  [(OBBaseWelcomeController *)&v39 viewDidLoad];
  [(HMHearingAidAdjustSoundInControlCenterViewController *)self updateButtonTray];
  [(HMHearingAidAdjustSoundInControlCenterViewController *)self addControlCenterModule];
  v3 = [(HMHearingAidAdjustSoundInControlCenterViewController *)self traitCollection];
  uint64_t v4 = [v3 userInterfaceStyle];

  if (v4 == 2) {
    v5 = @"dark";
  }
  else {
    v5 = @"light";
  }
  v6 = [@"Control_Center_Yodel_4_" stringByAppendingString:v5];
  if ([(HMHearingAidAdjustSoundInControlCenterViewController *)self isiPad]) {
    v7 = @"_iPad";
  }
  else {
    v7 = &stru_27021F2D8;
  }
  v38 = [v6 stringByAppendingString:v7];

  id v8 = objc_alloc(MEMORY[0x263F29D30]);
  objc_super v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v10 = (void *)[v8 initWithPackageName:v38 inBundle:v9];
  [(HMHearingAidAdjustSoundInControlCenterViewController *)self setMicaView:v10];

  v11 = [(HMHearingAidAdjustSoundInControlCenterViewController *)self micaView];
  [v11 setTranslatesAutoresizingMaskIntoConstraints:0];

  v12 = [(HMHearingAidAdjustSoundInControlCenterViewController *)self contentView];
  v13 = [(HMHearingAidAdjustSoundInControlCenterViewController *)self micaView];
  [v12 addSubview:v13];

  v14 = [MEMORY[0x263F825C8] clearColor];
  v15 = [(HMHearingAidAdjustSoundInControlCenterViewController *)self contentView];
  [v15 setBackgroundColor:v14];

  v28 = (void *)MEMORY[0x263F08938];
  v37 = [(HMHearingAidAdjustSoundInControlCenterViewController *)self micaView];
  v35 = [v37 leadingAnchor];
  v36 = [(HMHearingAidAdjustSoundInControlCenterViewController *)self contentView];
  v34 = [v36 leadingAnchor];
  v33 = [v35 constraintEqualToAnchor:v34];
  v40[0] = v33;
  v32 = [(HMHearingAidAdjustSoundInControlCenterViewController *)self micaView];
  v30 = [v32 trailingAnchor];
  v31 = [(HMHearingAidAdjustSoundInControlCenterViewController *)self contentView];
  v29 = [v31 trailingAnchor];
  v27 = [v30 constraintEqualToAnchor:v29];
  v40[1] = v27;
  v26 = [(HMHearingAidAdjustSoundInControlCenterViewController *)self micaView];
  v16 = [v26 topAnchor];
  v17 = [(HMHearingAidAdjustSoundInControlCenterViewController *)self contentView];
  v18 = [v17 topAnchor];
  v19 = [v16 constraintEqualToAnchor:v18];
  v40[2] = v19;
  v20 = [(HMHearingAidAdjustSoundInControlCenterViewController *)self micaView];
  v21 = [v20 bottomAnchor];
  v22 = [(HMHearingAidAdjustSoundInControlCenterViewController *)self contentView];
  v23 = [v22 bottomAnchor];
  v24 = [v21 constraintEqualToAnchor:v23];
  v40[3] = v24;
  v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:v40 count:4];
  [v28 activateConstraints:v25];
}

- (void)viewDidAppear:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)HMHearingAidAdjustSoundInControlCenterViewController;
  [(OBBaseWelcomeController *)&v9 viewDidAppear:a3];
  uint64_t v4 = [(HMHearingAidAdjustSoundInControlCenterViewController *)self micaView];
  v5 = [(HMHearingAidAdjustSoundInControlCenterViewController *)self micaView];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __70__HMHearingAidAdjustSoundInControlCenterViewController_viewDidAppear___block_invoke;
  v7[3] = &unk_265365FC0;
  id v8 = v4;
  id v6 = v4;
  [v5 setState:@"State 2" animated:1 transitionSpeed:v7 completion:1.0];
}

uint64_t __70__HMHearingAidAdjustSoundInControlCenterViewController_viewDidAppear___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setState:@"State 3" animated:1];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HMHearingAidAdjustSoundInControlCenterViewController;
  [(HMHearingAidAdjustSoundInControlCenterViewController *)&v5 viewDidDisappear:a3];
  uint64_t v4 = [(HMHearingAidAdjustSoundInControlCenterViewController *)self micaView];
  [v4 setState:@"State 1" animated:0];
}

- (void)updateButtonTray
{
  id v6 = [MEMORY[0x263F5B898] boldButton];
  v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v4 = [v3 localizedStringForKey:@"Done" value:&stru_27021F2D8 table:0];

  [v6 setTitle:v4 forState:0];
  [v6 addTarget:self action:sel_mainButtonTapped forControlEvents:64];
  objc_super v5 = [(HMHearingAidAdjustSoundInControlCenterViewController *)self buttonTray];
  [v5 addButton:v6];
}

- (void)mainButtonTapped
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained completeStep:4];
}

- (void)addControlCenterModule
{
  id v3 = (id)[objc_alloc(MEMORY[0x263F33BF8]) initWithIntent:2 moduleIdentifier:@"com.apple.accessibility.controlcenter.hearingdevices" containerBundleIdentifier:@"com.apple.Preferences" size:0];
  v2 = [MEMORY[0x263F33BF0] sharedInstance];
  [v2 handleIconElementRequest:v3 completionHandler:&__block_literal_global];
}

void __78__HMHearingAidAdjustSoundInControlCenterViewController_addControlCenterModule__block_invoke(uint64_t a1, char a2, void *a3)
{
  if ((a2 & 1) == 0)
  {
    id v4 = [a3 localizedDescription];
    NSLog(&cfstr_HearingAidAddc.isa, v4);
  }
}

- (BOOL)isiPad
{
  v2 = [MEMORY[0x263F82670] currentDevice];
  BOOL v3 = [v2 userInterfaceIdiom] == 1;

  return v3;
}

- (HMHearingAidEnrollmentDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HMHearingAidEnrollmentDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BSUICAPackageView)micaView
{
  return self->_micaView;
}

- (void)setMicaView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_micaView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end