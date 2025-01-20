@interface CFXStageManagerWarningViewController
- (BOOL)isMultitasking;
- (BOOL)showDoneButton;
- (CFXStageManagerWarningViewControllerDelegate)delegate;
- (PUReviewScreenDoneButton)doneButton;
- (void)doneButtonTapped:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDoneButton:(id)a3;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation CFXStageManagerWarningViewController

- (void)viewDidLoad
{
  v42[3] = *MEMORY[0x263EF8340];
  v40.receiver = self;
  v40.super_class = (Class)CFXStageManagerWarningViewController;
  [(CFXStageManagerWarningViewController *)&v40 viewDidLoad];
  id v3 = [MEMORY[0x263F1C550] blackColor];
  uint64_t v4 = [v3 CGColor];
  v5 = [(CFXStageManagerWarningViewController *)self view];
  v6 = [v5 layer];
  [v6 setBackgroundColor:v4];

  id v7 = objc_alloc_init(MEMORY[0x263F1C768]);
  [v7 setTranslatesAutoresizingMaskIntoConstraints:0];
  v8 = [(CFXStageManagerWarningViewController *)self view];
  [v8 addSubview:v7];

  v33 = (void *)MEMORY[0x263F08938];
  v36 = [v7 centerXAnchor];
  v38 = [(CFXStageManagerWarningViewController *)self view];
  v35 = [v38 centerXAnchor];
  v34 = [v36 constraintEqualToAnchor:v35];
  v42[0] = v34;
  v32 = [v7 centerYAnchor];
  v9 = [(CFXStageManagerWarningViewController *)self view];
  v10 = [v9 centerYAnchor];
  v11 = [v32 constraintEqualToAnchor:v10];
  v42[1] = v11;
  v12 = [v7 widthAnchor];
  v13 = [(CFXStageManagerWarningViewController *)self view];
  v14 = [v13 widthAnchor];
  v15 = [v12 constraintEqualToAnchor:v14 constant:-32.0];
  v42[2] = v15;
  v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v42 count:3];
  [v33 activateConstraints:v16];

  v17 = [MEMORY[0x263F086E0] jfxBundle];
  v18 = [v17 localizedStringForKey:@"STAGEMANAGER_UNSUPPORTED_WARNING" value:&stru_26E7CDB50 table:0];
  [v7 setText:v18];

  v19 = [MEMORY[0x263F1C658] systemFontOfSize:24.0];
  [v7 setFont:v19];

  [v7 setNumberOfLines:3];
  [v7 setLineBreakMode:0];
  v20 = [MEMORY[0x263F1C550] whiteColor];
  [v7 setTextColor:v20];

  [v7 setTextAlignment:1];
  [v7 sizeToFit];
  v21 = [MEMORY[0x263F5E470] doneButton];
  v22 = [(CFXStageManagerWarningViewController *)self view];
  [v22 addSubview:v21];

  [v21 addTarget:self action:sel_doneButtonTapped_ forControlEvents:64];
  [v21 setTranslatesAutoresizingMaskIntoConstraints:0];
  v37 = (void *)MEMORY[0x263F08938];
  v39 = [v21 topAnchor];
  v31 = self;
  v23 = [(CFXStageManagerWarningViewController *)self view];
  v24 = [v23 topAnchor];
  v25 = [v39 constraintEqualToAnchor:v24 constant:16.0];
  v41[0] = v25;
  v26 = [v21 trailingAnchor];
  v27 = [(CFXStageManagerWarningViewController *)self view];
  v28 = [v27 trailingAnchor];
  v29 = [v26 constraintEqualToAnchor:v28 constant:-16.0];
  v41[1] = v29;
  v30 = [MEMORY[0x263EFF8C0] arrayWithObjects:v41 count:2];
  [v37 activateConstraints:v30];

  [(CFXStageManagerWarningViewController *)v31 setDoneButton:v21];
}

- (void)viewWillLayoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)CFXStageManagerWarningViewController;
  [(CFXStageManagerWarningViewController *)&v5 viewWillLayoutSubviews];
  id v3 = [(CFXStageManagerWarningViewController *)self view];
  objc_msgSend(v3, "setHidden:", -[CFXStageManagerWarningViewController isMultitasking](self, "isMultitasking") ^ 1);

  uint64_t v4 = [(CFXStageManagerWarningViewController *)self doneButton];
  objc_msgSend(v4, "setHidden:", -[CFXStageManagerWarningViewController showDoneButton](self, "showDoneButton") ^ 1);
}

- (BOOL)isMultitasking
{
  v2 = [(CFXStageManagerWarningViewController *)self view];
  id v3 = [v2 window];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;

  v8 = [MEMORY[0x263F1C920] mainScreen];
  [v8 bounds];
  double v10 = v9;
  double v12 = v11;

  return v7 != v12 || v5 != v10;
}

- (BOOL)showDoneButton
{
  id v3 = [(CFXStageManagerWarningViewController *)self delegate];

  if (v3)
  {
    double v4 = [(CFXStageManagerWarningViewController *)self delegate];
    char v5 = objc_opt_respondsToSelector();
  }
  else
  {
    char v5 = 0;
  }
  return v5 & 1;
}

- (void)doneButtonTapped:(id)a3
{
  id v8 = a3;
  double v4 = [(CFXStageManagerWarningViewController *)self delegate];
  if (v4)
  {
  }
  else
  {
    char v5 = [(CFXStageManagerWarningViewController *)self delegate];
    char v6 = objc_opt_respondsToSelector();

    if (v6) {
      goto LABEL_5;
    }
  }
  double v7 = [(CFXStageManagerWarningViewController *)self delegate];
  [v7 stageManagerWarningDoneButtonWasTapped:v8];

LABEL_5:
}

- (CFXStageManagerWarningViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CFXStageManagerWarningViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (PUReviewScreenDoneButton)doneButton
{
  return self->_doneButton;
}

- (void)setDoneButton:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_doneButton, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end