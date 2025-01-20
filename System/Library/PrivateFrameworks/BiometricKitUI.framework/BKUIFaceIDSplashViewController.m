@interface BKUIFaceIDSplashViewController
- (BKDevice)device;
- (BOOL)inBuddy;
- (OBAnimationController)animationController;
- (OBTrayButton)continueButton;
- (OBTrayButton)skipButton;
- (id)endEnrollActionPrimary;
- (id)endEnrollActionSecondary;
- (id)initInBuddy:(BOOL)a3 bkDevice:(id)a4 withEndEnrollmentActionPrimary:(id)a5 enrollmentActionSecondary:(id)a6;
- (id)initInBuddy:(BOOL)a3 isDemo:(BOOL)a4 bkDevice:(id)a5 withEndEnrollmentActionPrimary:(id)a6 enrollmentActionSecondary:(id)a7;
- (void)_didSelectEnroll;
- (void)_didSelectSkip;
- (void)setAnimationController:(id)a3;
- (void)setContinueButton:(id)a3;
- (void)setDevice:(id)a3;
- (void)setEndEnrollActionPrimary:(id)a3;
- (void)setEndEnrollActionSecondary:(id)a3;
- (void)setInBuddy:(BOOL)a3;
- (void)setSkipButton:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation BKUIFaceIDSplashViewController

- (id)initInBuddy:(BOOL)a3 isDemo:(BOOL)a4 bkDevice:(id)a5 withEndEnrollmentActionPrimary:(id)a6 enrollmentActionSecondary:(id)a7
{
  return [(BKUIFaceIDSplashViewController *)self initInBuddy:a3 bkDevice:a5 withEndEnrollmentActionPrimary:a6 enrollmentActionSecondary:a7];
}

- (id)initInBuddy:(BOOL)a3 bkDevice:(id)a4 withEndEnrollmentActionPrimary:(id)a5 enrollmentActionSecondary:(id)a6
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v15 = [v14 localizedStringForKey:@"FACE_ID" value:&stru_1F4081468 table:@"Pearl"];
  v24.receiver = self;
  v24.super_class = (Class)BKUIFaceIDSplashViewController;
  v16 = [(BKUIFaceIDSplashViewController *)&v24 initWithTitle:v15 detailText:&stru_1F4081468 icon:0 contentLayout:3];

  if (v16)
  {
    v16->_inBuddy = a3;
    v17 = _Block_copy(v12);
    id endEnrollActionPrimary = v16->_endEnrollActionPrimary;
    v16->_id endEnrollActionPrimary = v17;

    v19 = _Block_copy(v13);
    id endEnrollActionSecondary = v16->_endEnrollActionSecondary;
    v16->_id endEnrollActionSecondary = v19;

    objc_storeStrong((id *)&v16->_device, a4);
    v21 = [(BKUIFaceIDSplashViewController *)v16 headerView];
    v22 = [MEMORY[0x1E4F428B8] systemBlueColor];
    [v21 setTintColor:v22];
  }
  return v16;
}

- (void)viewDidLoad
{
  v35[2] = *MEMORY[0x1E4F143B8];
  v34.receiver = self;
  v34.super_class = (Class)BKUIFaceIDSplashViewController;
  [(OBBaseWelcomeController *)&v34 viewDidLoad];
  v3 = [(BKUIFaceIDSplashViewController *)self buttonTray];
  [v3 setPrivacyLinkForBundles:&unk_1F4094678];

  v4 = (void *)[objc_alloc(MEMORY[0x1E4F83A68]) initWithStateName:@"State 1" darkStateName:@"Dark 1" transitionDuration:0.01 transitionSpeed:1.0];
  v35[0] = v4;
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F83A68]) initWithStateName:@"State 2" darkStateName:@"Dark 2" transitionDuration:1.5 transitionSpeed:0.8];
  v35[1] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:2];

  id v7 = objc_alloc(MEMORY[0x1E4F83A60]);
  v8 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v9 = [v8 URLForResource:@"FaceID" withExtension:@"ca"];
  v10 = [(BKUIFaceIDSplashViewController *)self headerView];
  id v11 = [v10 animationView];
  id v12 = [v6 objectAtIndexedSubscript:0];
  id v13 = (void *)[v7 initWithUrlToPackage:v9 animationView:v11 animatedStates:v6 startAtFirstState:v12];
  [(BKUIFaceIDSplashViewController *)self setAnimationController:v13];

  v14 = +[BKUIDevice sharedInstance];
  LODWORD(v13) = [v14 isN69];

  if (v13) {
    double v15 = 0.0333333333;
  }
  else {
    double v15 = 0.0666666667;
  }
  v16 = [(BKUIFaceIDSplashViewController *)self headerView];
  v17 = [v16 animationView];
  [v17 defaultScale];
  double v19 = v15 + v18;
  v20 = [(BKUIFaceIDSplashViewController *)self headerView];
  v21 = [v20 animationView];
  [v21 setScale:v19];

  v22 = [MEMORY[0x1E4F83A80] boldButton];
  v23 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  objc_super v24 = [v23 localizedStringForKey:@"CONTINUE" value:&stru_1F4081468 table:@"Pearl"];
  [v22 setTitle:v24 forState:0];

  [v22 addTarget:self action:sel__didSelectEnroll forControlEvents:64];
  v25 = [(BKUIFaceIDSplashViewController *)self buttonTray];
  [v25 addButton:v22];

  if (![(BKUIFaceIDSplashViewController *)self inBuddy])
  {
    v26 = [(BKUIFaceIDSplashViewController *)self headerView];
    v27 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v28 = [MEMORY[0x1E4F42948] modelSpecificLocalizedStringKeyForKey:@"FACE_ID_DETAIL"];
    v29 = [v27 localizedStringForKey:v28 value:&stru_1F4081468 table:@"Pearl"];
    [v26 setDetailText:v29];
  }
  v30 = [MEMORY[0x1E4F83AB8] linkButton];
  v31 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v32 = [v31 localizedStringForKey:@"SET_UP_LATER" value:&stru_1F4081468 table:@"Pearl"];
  [v30 setTitle:v32 forState:0];

  [v30 addTarget:self action:sel__didSelectSkip forControlEvents:64];
  v33 = [(BKUIFaceIDSplashViewController *)self buttonTray];
  [v33 addButton:v30];
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)BKUIFaceIDSplashViewController;
  [(OBBaseWelcomeController *)&v5 viewDidAppear:a3];
  v4 = [(BKUIFaceIDSplashViewController *)self animationController];
  [v4 startAnimation];
}

- (void)_didSelectEnroll
{
  v3 = [(BKUIFaceIDSplashViewController *)self endEnrollActionPrimary];

  if (v3)
  {
    v4 = [(BKUIFaceIDSplashViewController *)self endEnrollActionPrimary];
    v4[2]();
  }
}

- (void)_didSelectSkip
{
  v3 = [(BKUIFaceIDSplashViewController *)self endEnrollActionSecondary];

  if (v3)
  {
    v4 = [(BKUIFaceIDSplashViewController *)self endEnrollActionSecondary];
    v4[2]();
  }
}

- (BOOL)inBuddy
{
  return self->_inBuddy;
}

- (void)setInBuddy:(BOOL)a3
{
  self->_inBuddy = a3;
}

- (OBTrayButton)skipButton
{
  return self->_skipButton;
}

- (void)setSkipButton:(id)a3
{
}

- (id)endEnrollActionPrimary
{
  return self->_endEnrollActionPrimary;
}

- (void)setEndEnrollActionPrimary:(id)a3
{
}

- (id)endEnrollActionSecondary
{
  return self->_endEnrollActionSecondary;
}

- (void)setEndEnrollActionSecondary:(id)a3
{
}

- (OBTrayButton)continueButton
{
  return self->_continueButton;
}

- (void)setContinueButton:(id)a3
{
}

- (BKDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
}

- (OBAnimationController)animationController
{
  return self->_animationController;
}

- (void)setAnimationController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animationController, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_continueButton, 0);
  objc_storeStrong(&self->_endEnrollActionSecondary, 0);
  objc_storeStrong(&self->_endEnrollActionPrimary, 0);

  objc_storeStrong((id *)&self->_skipButton, 0);
}

@end