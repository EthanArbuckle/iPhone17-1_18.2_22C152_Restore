@interface AXForceTouchSensitivityTestViewController
- (UIButton)doneButton;
- (UIImageView)messageImageView;
- (unint64_t)supportedInterfaceOrientations;
- (void)animateDoneButtonSlideIn;
- (void)doneButtonTapped;
- (void)loadView;
- (void)setDoneButton:(id)a3;
- (void)setMessageImageView:(id)a3;
- (void)viewDidLayoutSubviews;
@end

@implementation AXForceTouchSensitivityTestViewController

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (void)loadView
{
  v22.receiver = self;
  v22.super_class = (Class)AXForceTouchSensitivityTestViewController;
  [(AXForceTouchSensitivityTestViewController *)&v22 loadView];
  id v3 = objc_alloc((Class)UIImageView);
  v4 = AXFlowersTestImage();
  id v5 = [v3 initWithImage:v4];
  [(AXForceTouchSensitivityTestViewController *)self setMessageImageView:v5];

  v6 = [(AXForceTouchSensitivityTestViewController *)self messageImageView];
  [v6 setContentMode:2];

  v7 = [(AXForceTouchSensitivityTestViewController *)self messageImageView];
  [v7 setAccessibilityIgnoresInvertColors:1];

  v8 = [(AXForceTouchSensitivityTestViewController *)self view];
  v9 = [(AXForceTouchSensitivityTestViewController *)self messageImageView];
  [v8 addSubview:v9];

  v10 = +[UIButton buttonWithType:1];
  [(AXForceTouchSensitivityTestViewController *)self setDoneButton:v10];

  v11 = [(AXForceTouchSensitivityTestViewController *)self doneButton];
  v12 = settingsLocString(@"FORCE_TOUCH_SENSITIVITY_TEST_DONE", @"Accessibility");
  [v11 setTitle:v12 forState:0];

  v13 = [(AXForceTouchSensitivityTestViewController *)self doneButton];
  [v13 addTarget:self action:"doneButtonTapped" forControlEvents:64];

  v14 = [(AXForceTouchSensitivityTestViewController *)self doneButton];
  v15 = +[UIColor whiteColor];
  [v14 setBackgroundColor:v15];

  v16 = [(AXForceTouchSensitivityTestViewController *)self doneButton];
  v17 = [v16 layer];
  [v17 setCornerRadius:10.0];

  v18 = [(AXForceTouchSensitivityTestViewController *)self doneButton];
  [v18 setClipsToBounds:1];

  v19 = [(AXForceTouchSensitivityTestViewController *)self doneButton];
  [v19 setHidden:1];

  v20 = [(AXForceTouchSensitivityTestViewController *)self view];
  v21 = [(AXForceTouchSensitivityTestViewController *)self doneButton];
  [v20 addSubview:v21];
}

- (void)viewDidLayoutSubviews
{
  v23.receiver = self;
  v23.super_class = (Class)AXForceTouchSensitivityTestViewController;
  [(AXForceTouchSensitivityTestViewController *)&v23 viewDidLayoutSubviews];
  id v3 = [(AXForceTouchSensitivityTestViewController *)self view];
  [v3 frame];
  double v5 = v4;
  double v7 = v6;

  v8 = [(AXForceTouchSensitivityTestViewController *)self doneButton];
  objc_msgSend(v8, "setFrame:", 10.0, v7 + -50.0 + -10.0, v5 + -20.0, 50.0);

  v9 = [(AXForceTouchSensitivityTestViewController *)self view];
  [v9 bounds];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  v18 = [(AXForceTouchSensitivityTestViewController *)self messageImageView];
  objc_msgSend(v18, "setFrame:", v11, v13, v15, v17);

  v19 = [(AXForceTouchSensitivityTestViewController *)self messageImageView];
  [v19 setClipsToBounds:1];

  v20 = [(AXForceTouchSensitivityTestViewController *)self messageImageView];
  [v20 setIsAccessibilityElement:1];

  v21 = settingsLocString(@"FORCE_TOUCH_SENSITIVITY_TEST_FLOWERS", @"Accessibility");
  objc_super v22 = [(AXForceTouchSensitivityTestViewController *)self messageImageView];
  [v22 setAccessibilityLabel:v21];
}

- (void)animateDoneButtonSlideIn
{
  id v3 = [(AXForceTouchSensitivityTestViewController *)self view];
  [v3 frame];
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = [(AXForceTouchSensitivityTestViewController *)self doneButton];
  [v12 setHidden:0];

  double v13 = [(AXForceTouchSensitivityTestViewController *)self doneButton];
  objc_msgSend(v13, "setFrame:", 10.0, v11, v9 + -20.0, 50.0);

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = __69__AXForceTouchSensitivityTestViewController_animateDoneButtonSlideIn__block_invoke;
  v14[3] = &unk_20BFE8;
  v14[4] = self;
  v14[5] = v5;
  v14[6] = v7;
  *(double *)&v14[7] = v9;
  *(double *)&v14[8] = v11;
  +[UIView animateWithDuration:0 delay:v14 usingSpringWithDamping:0 initialSpringVelocity:0.85 options:0.0 animations:0.6 completion:0.0];
}

void __69__AXForceTouchSensitivityTestViewController_animateDoneButtonSlideIn__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) doneButton];
  objc_msgSend(v2, "setFrame:", 10.0, *(double *)(a1 + 64) + -50.0 + -10.0, *(double *)(a1 + 56) + -20.0, 50.0);
}

- (void)doneButtonTapped
{
  id v3 = [(AXForceTouchSensitivityTestViewController *)self doneButton];
  [v3 setHidden:1];

  [(AXForceTouchSensitivityTestViewController *)self dismissViewControllerAnimated:1 completion:0];
}

- (UIImageView)messageImageView
{
  return self->_messageImageView;
}

- (void)setMessageImageView:(id)a3
{
}

- (UIButton)doneButton
{
  return self->_doneButton;
}

- (void)setDoneButton:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_doneButton, 0);

  objc_storeStrong((id *)&self->_messageImageView, 0);
}

@end