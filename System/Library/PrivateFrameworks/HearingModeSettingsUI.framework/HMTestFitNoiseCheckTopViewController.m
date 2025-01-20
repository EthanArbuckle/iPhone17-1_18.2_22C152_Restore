@interface HMTestFitNoiseCheckTopViewController
- (unint64_t)_fitNoiseCheckTopTestingViewHeight;
- (void)viewDidLoad;
@end

@implementation HMTestFitNoiseCheckTopViewController

- (void)viewDidLoad
{
  v30[5] = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263F47310] fitNoiseCheckTopTestingView];
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  v4 = [(HMTestFitNoiseCheckTopViewController *)self view];
  [v4 addSubview:v3];

  v23 = (void *)MEMORY[0x263F08938];
  v29 = [v3 heightAnchor];
  v28 = objc_msgSend(v29, "constraintLessThanOrEqualToConstant:", (double)-[HMTestFitNoiseCheckTopViewController _fitNoiseCheckTopTestingViewHeight](self, "_fitNoiseCheckTopTestingViewHeight"));
  v30[0] = v28;
  v26 = [v3 leadingAnchor];
  v27 = [(HMTestFitNoiseCheckTopViewController *)self view];
  v25 = [v27 leadingAnchor];
  v24 = [v26 constraintEqualToAnchor:v25];
  v30[1] = v24;
  v21 = [v3 trailingAnchor];
  v22 = [(HMTestFitNoiseCheckTopViewController *)self view];
  v20 = [v22 trailingAnchor];
  v19 = [v21 constraintEqualToAnchor:v20];
  v30[2] = v19;
  v18 = [v3 centerXAnchor];
  v5 = [(HMTestFitNoiseCheckTopViewController *)self view];
  v6 = [v5 centerXAnchor];
  v7 = [v18 constraintEqualToAnchor:v6];
  v30[3] = v7;
  v8 = [v3 centerYAnchor];
  v9 = [(HMTestFitNoiseCheckTopViewController *)self view];
  v10 = [v9 centerYAnchor];
  v11 = [v8 constraintEqualToAnchor:v10];
  v30[4] = v11;
  v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v30 count:5];
  [v23 activateConstraints:v12];

  v13 = [(HMTestFitNoiseCheckTopViewController *)self view];
  v14 = [v13 layer];
  v15 = [MEMORY[0x263F825C8] redColor];
  objc_msgSend(v14, "setBorderColor:", objc_msgSend(v15, "cgColor"));

  v16 = [(HMTestFitNoiseCheckTopViewController *)self view];
  v17 = [v16 layer];
  [v17 setBorderWidth:1.0];
}

- (unint64_t)_fitNoiseCheckTopTestingViewHeight
{
  Boolean keyExistsAndHasValidFormat = 0;
  CFPreferencesAppSynchronize(@"com.apple.ConnectedAudio");
  unint64_t result = CFPreferencesGetAppIntegerValue(@"fitNoiseCheckTopTestingViewHeight", @"com.apple.ConnectedAudio", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    BOOL v3 = result == 0;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3) {
    return 300;
  }
  return result;
}

- (void).cxx_destruct
{
}

@end