@interface ClarityUIAdminSettingsOnboardingController
- (ClarityUIAdminSettingsOnboardingController)initWithCompletion:(id)a3;
- (id)completionHandler;
- (void)_cancelButtonTapped:(id)a3;
- (void)_nextButtonTapped:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)viewDidLoad;
@end

@implementation ClarityUIAdminSettingsOnboardingController

- (ClarityUIAdminSettingsOnboardingController)initWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = settingsLocString(@"CLARITY_ADMIN_SETTINGS_TITLE", @"ClarityUISettings");
  v6 = AXLocStringKeyForHomeButtonAndExclusiveModel();
  v7 = settingsLocString(v6, @"ClarityUISettings");
  v15.receiver = self;
  v15.super_class = (Class)ClarityUIAdminSettingsOnboardingController;
  v8 = [(ClarityUIAdminSettingsOnboardingController *)&v15 initWithTitle:v5 detailText:v7 icon:0 contentLayout:1];

  if (v8)
  {
    id v9 = objc_retainBlock(v4);
    id completionHandler = v8->_completionHandler;
    v8->_id completionHandler = v9;

    v11 = +[OBBoldTrayButton boldButton];
    v12 = settingsLocString(@"GET_STARTED", @"ClarityUISettings");
    [v11 setTitle:v12 forState:0];

    [v11 addTarget:v8 action:"_nextButtonTapped:" forControlEvents:0x2000];
    v13 = [(ClarityUIAdminSettingsOnboardingController *)v8 buttonTray];
    [v13 addButton:v11];
  }
  return v8;
}

- (void)viewDidLoad
{
  v12.receiver = self;
  v12.super_class = (Class)ClarityUIAdminSettingsOnboardingController;
  [(ClarityUIAdminSettingsOnboardingController *)&v12 viewDidLoad];
  id v3 = [objc_allocWithZone((Class)UIBarButtonItem) initWithBarButtonSystemItem:1 target:self action:"_cancelButtonTapped:"];
  id v4 = [(ClarityUIAdminSettingsOnboardingController *)self navigationItem];
  [v4 setRightBarButtonItem:v3];

  v5 = objc_alloc_init(ClarityOnboardingAdminPreviewView);
  [(ClarityOnboardingAdminPreviewView *)v5 setTranslatesAutoresizingMaskIntoConstraints:0];
  v6 = [(ClarityUIAdminSettingsOnboardingController *)self contentView];
  [v6 addSubview:v5];

  v7 = objc_opt_new();
  v8 = _NSDictionaryOfVariableBindings(@"previewView", v5, 0);
  id v9 = +[NSLayoutConstraint constraintsWithVisualFormat:@"|[previewView]|" options:0 metrics:0 views:v8];
  [v7 addObjectsFromArray:v9];

  v10 = _NSDictionaryOfVariableBindings(@"previewView", v5, 0);
  v11 = +[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[previewView]|" options:0 metrics:0 views:v10];
  [v7 addObjectsFromArray:v11];

  +[NSLayoutConstraint activateConstraints:v7];
}

- (void)_nextButtonTapped:(id)a3
{
}

- (void)_cancelButtonTapped:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end