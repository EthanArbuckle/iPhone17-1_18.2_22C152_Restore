@interface HMHearingAidInstructionsForUseViewController
- (void)_dismissModalInstructions;
- (void)viewDidLoad;
@end

@implementation HMHearingAidInstructionsForUseViewController

- (void)viewDidLoad
{
  v30[4] = *MEMORY[0x263EF8340];
  v29.receiver = self;
  v29.super_class = (Class)HMHearingAidInstructionsForUseViewController;
  [(HMHearingAidInstructionsForUseViewController *)&v29 viewDidLoad];
  id v3 = objc_alloc_init(MEMORY[0x263F1FA58]);
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  v4 = [(HMHearingAidInstructionsForUseViewController *)self view];
  [v4 addSubview:v3];

  v28 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v27 = [NSURL URLWithString:@"https://www.apple.com/legal/ifu/haf"];
  v26 = [MEMORY[0x263F08BD8] requestWithURL:v27];
  id v5 = (id)[v3 loadRequest:v26];
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  v6 = [(HMHearingAidInstructionsForUseViewController *)self view];
  [v6 addSubview:v3];

  v17 = (void *)MEMORY[0x263F08938];
  v24 = [v3 topAnchor];
  v25 = [(HMHearingAidInstructionsForUseViewController *)self view];
  v23 = [v25 safeAreaLayoutGuide];
  v22 = [v23 topAnchor];
  v21 = [v24 constraintEqualToAnchor:v22];
  v30[0] = v21;
  v19 = [v3 bottomAnchor];
  v20 = [(HMHearingAidInstructionsForUseViewController *)self view];
  v18 = [v20 bottomAnchor];
  v16 = [v19 constraintEqualToAnchor:v18];
  v30[1] = v16;
  v7 = [v3 leadingAnchor];
  v8 = [(HMHearingAidInstructionsForUseViewController *)self view];
  v9 = [v8 leadingAnchor];
  v10 = [v7 constraintEqualToAnchor:v9];
  v30[2] = v10;
  v11 = [v3 trailingAnchor];
  v12 = [(HMHearingAidInstructionsForUseViewController *)self view];
  v13 = [v12 trailingAnchor];
  v14 = [v11 constraintEqualToAnchor:v13];
  v30[3] = v14;
  v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v30 count:4];
  [v17 activateConstraints:v15];
}

- (void)_dismissModalInstructions
{
}

@end