@interface AXMotionCuesLearnMoreController
+ (id)learnMoreController;
- (OBTrayButton)mainButton;
- (id)dismissHandler;
- (void)cancelButtonTapped:(id)a3;
- (void)continueButtonTapped;
- (void)setDismissHandler:(id)a3;
- (void)setMainButton:(id)a3;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation AXMotionCuesLearnMoreController

+ (id)learnMoreController
{
  v2 = [AXMotionCuesLearnMoreController alloc];
  v3 = settingsLocString(@"MotionCuesLearnMoreTitle", @"Accessibility-MotionCues");
  v4 = +[NSBundle bundleForClass:objc_opt_class()];
  v5 = +[UIImage imageNamed:@"MotionCuesIcon" inBundle:v4];
  v6 = [(AXMotionCuesLearnMoreController *)v2 initWithTitle:v3 detailText:0 icon:v5 contentLayout:2];

  return v6;
}

- (void)viewDidLoad
{
  id v23 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:1 target:self action:"cancelButtonTapped:"];
  v3 = [(AXMotionCuesLearnMoreController *)self navigationItem];
  [v3 setRightBarButtonItem:v23];

  v4 = [(AXMotionCuesLearnMoreController *)self navigationItem];
  [v4 setBackButtonDisplayMode:1];

  v5 = +[UIDevice currentDevice];
  if ([v5 userInterfaceIdiom] == (char *)&dword_0 + 1) {
    double v6 = 60.0;
  }
  else {
    double v6 = 40.0;
  }

  v7 = +[UIImageSymbolConfiguration configurationWithPointSize:5 weight:2 scale:v6];
  v8 = +[UIImage systemImageNamed:@"water.waves" withConfiguration:v7];
  v9 = +[UIImage systemImageNamed:@"arrow.up"];
  v10 = [v9 imageWithSymbolConfiguration:v7];

  v11 = +[UIImage systemImageNamed:@"switch.2"];
  v12 = [v11 imageWithSymbolConfiguration:v7];

  v13 = settingsLocString(@"MotionCuesLearnMoreItemMayReduceMotionSicknessTitle", @"Accessibility-MotionCues");
  v14 = AXLocStringKeyForModel();
  v15 = settingsLocString(v14, @"Accessibility-MotionCues");
  [(AXMotionCuesLearnMoreController *)self addBulletedListItemWithTitle:v13 description:v15 image:v8];

  v16 = settingsLocString(@"MotionCuesLearnMoreItemWorkBestWhenFacingForwardTitle", @"Accessibility-MotionCues");
  v17 = settingsLocString(@"MotionCuesLearnMoreItemWorkBestWhenFacingForwardDescription", @"Accessibility-MotionCues");
  [(AXMotionCuesLearnMoreController *)self addBulletedListItemWithTitle:v16 description:v17 image:v10];

  v18 = settingsLocString(@"MotionCuesLearnMoreItemControlCenterTitle", @"Accessibility-MotionCues");
  v19 = settingsLocString(@"MotionCuesLearnMoreItemControlCenterDescription", @"Accessibility-MotionCues");
  [(AXMotionCuesLearnMoreController *)self addBulletedListItemWithTitle:v18 description:v19 image:v12];

  v20 = +[OBBoldTrayButton boldButton];
  [v20 setTranslatesAutoresizingMaskIntoConstraints:0];
  v21 = settingsLocString(@"MotionCuesLearnMoreContinueButtonTitle", @"Accessibility-MotionCues");
  [v20 setTitle:v21 forState:0];

  [v20 addTarget:self action:"continueButtonTapped" forControlEvents:64];
  [(AXMotionCuesLearnMoreController *)self setMainButton:v20];
  v22 = [(AXMotionCuesLearnMoreController *)self buttonTray];
  [v22 addButton:v20];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AXMotionCuesLearnMoreController;
  [(AXMotionCuesLearnMoreController *)&v5 viewWillDisappear:a3];
  dismissHandler = (void (**)(void))self->_dismissHandler;
  if (dismissHandler) {
    dismissHandler[2]();
  }
}

- (void)cancelButtonTapped:(id)a3
{
}

- (void)continueButtonTapped
{
  v4 = [[AXMotionCuesLearnMorePageController alloc] initWithPage:1];
  v3 = [(AXMotionCuesLearnMoreController *)self navigationController];
  [v3 pushViewController:v4 animated:1];
}

- (id)dismissHandler
{
  return self->_dismissHandler;
}

- (void)setDismissHandler:(id)a3
{
}

- (OBTrayButton)mainButton
{
  return self->_mainButton;
}

- (void)setMainButton:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mainButton, 0);

  objc_storeStrong(&self->_dismissHandler, 0);
}

@end