@interface SRFirstRunOnboardingController
+ (void)initialize;
- (SRAuthorizationTableDelegate)delegate;
- (int64_t)step;
- (void)addNextButton;
- (void)cancelPrompt:(id)a3;
- (void)completePrompt:(id)a3;
- (void)dealloc;
- (void)disableSensorKit:(id)a3;
- (void)enableSensorKit:(id)a3;
- (void)loadPrivacy;
- (void)loadTurnOn;
- (void)loadWelcome;
- (void)presentNextStep:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setStep:(int64_t)a3;
- (void)showSensorKitPrivacyPage:(id)a3;
- (void)viewDidLoad;
@end

@implementation SRFirstRunOnboardingController

+ (void)initialize
{
  if ((id)objc_opt_class() == a1) {
    qword_100016208 = (uint64_t)os_log_create("com.apple.SensorKit", "SRLogFirstRunOnboardingController");
  }
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)SRFirstRunOnboardingController;
  [(SRFirstRunOnboardingController *)&v2 dealloc];
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)SRFirstRunOnboardingController;
  [(SRFirstRunOnboardingController *)&v5 viewDidLoad];
  int64_t step = self->_step;
  switch(step)
  {
    case 2:
      [(SRFirstRunOnboardingController *)self loadTurnOn];
      break;
    case 1:
      [(SRFirstRunOnboardingController *)self loadPrivacy];
      break;
    case 0:
      [(SRFirstRunOnboardingController *)self loadWelcome];
      break;
  }
  id v4 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithTitle:style:target:action:", +[NSString srui_localizedStringForCode:](NSString, "srui_localizedStringForCode:", 26), 0, self, "cancelPrompt:");
  objc_msgSend(-[SRFirstRunOnboardingController navigationItem](self, "navigationItem"), "setRightBarButtonItem:", v4);
}

- (void)addNextButton
{
  id v3 = +[OBBoldTrayButton boldButton];
  objc_msgSend(v3, "setTitle:forState:", +[NSString srui_localizedStringForCode:](NSString, "srui_localizedStringForCode:", 58), 0);
  [v3 addTarget:self action:"presentNextStep:" forControlEvents:64];
  id v4 = [(SRFirstRunOnboardingController *)self buttonTray];

  [v4 addButton:v3];
}

- (void)loadWelcome
{
  objc_msgSend(-[SRFirstRunOnboardingController headerView](self, "headerView"), "setIcon:accessibilityLabel:", +[UIImage skui_imageNamed:bundle:imageDescriptor:](UIImage, "skui_imageNamed:bundle:imageDescriptor:", @"SensorKit", +[NSBundle skui_bundle](NSBundle, "skui_bundle"), +[ISImageDescriptor skui_imageDescriptorForAuthorization](ISImageDescriptor, "skui_imageDescriptorForAuthorization")), 0);
  objc_msgSend(-[SRFirstRunOnboardingController headerView](self, "headerView"), "setDetailText:", +[NSString srui_localizedStringForCode:](NSString, "srui_localizedStringForCode:", 59));

  [(SRFirstRunOnboardingController *)self addNextButton];
}

- (void)loadPrivacy
{
  id v2 = objc_alloc_init((Class)UIStackView);
  [v2 setAxis:1];
  for (uint64_t i = 60; i != 64; ++i)
  {
    objc_super v5 = [[SRBulletedListItem alloc] initWithTitle:+[NSString srui_localizedStringForCode:](NSString, "srui_localizedStringForCode:", i) description:0 image:+[UIImage imageNamed:inBundle:withConfiguration:](UIImage, "imageNamed:inBundle:withConfiguration:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"bullet_%ld", i - 59), +[NSBundle skui_bundle], 0) textStyle:UIFontTextStyleHeadline];
    [v2 addArrangedSubview:v5];
    objc_msgSend(v2, "setCustomSpacing:afterView:", objc_msgSend(objc_msgSend(v2, "arrangedSubviews"), "lastObject"), 26.0);
  }
  v6 = +[UIButton buttonWithType:1];
  [(UILabel *)[(UIButton *)v6 titleLabel] setFont:+[UIFont preferredFontForTextStyle:UIFontTextStyleBody]];
  [(UIButton *)v6 setTitle:+[NSString srui_localizedStringForCode:64] forState:0];
  [(UIButton *)v6 addTarget:self action:"showSensorKitPrivacyPage:" forControlEvents:64];
  [(UIButton *)v6 setAccessibilityTraits:UIAccessibilityTraitLink];
  [(UILabel *)[(UIButton *)v6 titleLabel] setLineBreakMode:0];
  [(UILabel *)[(UIButton *)v6 titleLabel] setNumberOfLines:0];
  [(UIButton *)v6 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UILabel *)[(UIButton *)v6 titleLabel] setTextAlignment:4];
  [v2 addArrangedSubview:v6];
  [v2 setTranslatesAutoresizingMaskIntoConstraints:0];
  objc_msgSend(-[SRFirstRunOnboardingController contentView](self, "contentView"), "addSubview:", v2);
  v8[0] = objc_msgSend(-[UIButton topAnchor](v6, "topAnchor"), "constraintEqualToAnchor:", -[UILabel topAnchor](-[UIButton titleLabel](v6, "titleLabel"), "topAnchor"));
  v8[1] = objc_msgSend(-[UIButton bottomAnchor](v6, "bottomAnchor"), "constraintEqualToAnchor:", -[UILabel bottomAnchor](-[UIButton titleLabel](v6, "titleLabel"), "bottomAnchor"));
  v8[2] = objc_msgSend(-[UILabel widthAnchor](-[UIButton titleLabel](v6, "titleLabel"), "widthAnchor"), "constraintEqualToAnchor:", -[UIButton widthAnchor](v6, "widthAnchor"));
  v8[3] = objc_msgSend(objc_msgSend(v2, "topAnchor"), "constraintEqualToAnchor:", objc_msgSend(objc_msgSend(-[SRFirstRunOnboardingController contentView](self, "contentView"), "layoutMarginsGuide"), "topAnchor"));
  v8[4] = objc_msgSend(objc_msgSend(v2, "leadingAnchor"), "constraintEqualToAnchor:", objc_msgSend(objc_msgSend(-[SRFirstRunOnboardingController contentView](self, "contentView"), "layoutMarginsGuide"), "leadingAnchor"));
  v8[5] = objc_msgSend(objc_msgSend(v2, "trailingAnchor"), "constraintEqualToAnchor:", objc_msgSend(objc_msgSend(-[SRFirstRunOnboardingController contentView](self, "contentView"), "layoutMarginsGuide"), "trailingAnchor"));
  v8[6] = objc_msgSend(objc_msgSend(v2, "bottomAnchor"), "constraintEqualToAnchor:", objc_msgSend(objc_msgSend(-[SRFirstRunOnboardingController contentView](self, "contentView"), "layoutMarginsGuide"), "bottomAnchor"));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", +[NSArray arrayWithObjects:v8 count:7]);

  [(SRFirstRunOnboardingController *)self addNextButton];
}

- (void)showSensorKitPrivacyPage:(id)a3
{
  id v4 = qword_100016208;
  if (os_log_type_enabled((os_log_t)qword_100016208, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Showing Privacy Page", v6, 2u);
  }
  id v5 = +[OBPrivacyPresenter srui_presenterForPrivacySplash];
  [v5 setPresentingViewController:self];
  [v5 present];
}

- (void)loadTurnOn
{
  id v3 = +[OBLinkTrayButton linkButton];
  objc_msgSend(v3, "setBackgroundColor:", +[UIColor tertiarySystemFillColor](UIColor, "tertiarySystemFillColor"));
  [v3 setClipsToBounds:1];
  objc_msgSend(objc_msgSend(v3, "layer"), "setCornerRadius:", 14.0);
  objc_msgSend(v3, "setTitle:forState:", +[NSString srui_localizedStringForCode:](NSString, "srui_localizedStringForCode:", 65), 0);
  [v3 addTarget:self action:"enableSensorKit:" forControlEvents:64];
  objc_msgSend(-[SRFirstRunOnboardingController buttonTray](self, "buttonTray"), "addButton:", v3);
  id v4 = +[OBLinkTrayButton linkButton];
  objc_msgSend(v4, "setBackgroundColor:", +[UIColor tertiarySystemFillColor](UIColor, "tertiarySystemFillColor"));
  [v4 setClipsToBounds:1];
  objc_msgSend(objc_msgSend(v4, "layer"), "setCornerRadius:", 14.0);
  objc_msgSend(v4, "setTitle:forState:", +[NSString srui_localizedStringForCode:](NSString, "srui_localizedStringForCode:", 66), 0);
  [v4 addTarget:self action:"disableSensorKit:" forControlEvents:64];
  id v5 = [(SRFirstRunOnboardingController *)self buttonTray];

  [v5 addButton:v4];
}

- (void)enableSensorKit:(id)a3
{
  [+[SRAuthorizationClient sharedInstance] setFirstRunOnboardingCompleted:1];
  [+[SRAuthorizationClient sharedInstance] setDataCollectionEnabled:1];

  [(SRFirstRunOnboardingController *)self completePrompt:a3];
}

- (void)disableSensorKit:(id)a3
{
  [+[SRAuthorizationClient sharedInstance] setFirstRunOnboardingCompleted:0];
  [+[SRAuthorizationClient sharedInstance] setDataCollectionEnabled:0];

  [(SRFirstRunOnboardingController *)self completePrompt:a3];
}

- (void)presentNextStep:(id)a3
{
  int64_t step = self->_step;
  if (step >= 2)
  {
    id v4 = qword_100016208;
    if (os_log_type_enabled((os_log_t)qword_100016208, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_FAULT, "Trying to go past the last step", buf, 2u);
    }
    return;
  }
  if (step)
  {
    if (step != 1)
    {
      id v7 = 0;
      goto LABEL_10;
    }
    uint64_t v6 = 55;
  }
  else
  {
    uint64_t v6 = 54;
  }
  id v7 = +[NSString srui_localizedStringForCode:v6];
  if (!step)
  {
    uint64_t v8 = 56;
    goto LABEL_14;
  }
LABEL_10:
  if (step != 1)
  {
    id v9 = 0;
    goto LABEL_16;
  }
  uint64_t v8 = 57;
LABEL_14:
  id v9 = +[NSString srui_localizedStringForCode:v8];
LABEL_16:
  v12 = [[SRFirstRunOnboardingController alloc] initWithTitle:v7 detailText:v9 icon:0 contentLayout:2];
  id v10 = [(SRFirstRunOnboardingController *)v12 headerView];
  LODWORD(v11) = 1036831949;
  [v10 setTitleHyphenationFactor:v11];
  [(SRFirstRunOnboardingController *)v12 setStep:step + 1];
  [(SRFirstRunOnboardingController *)v12 setDelegate:[(SRFirstRunOnboardingController *)self delegate]];
  objc_msgSend(-[SRFirstRunOnboardingController navigationController](self, "navigationController"), "pushViewController:animated:", v12, 1);
}

- (void)cancelPrompt:(id)a3
{
  id v3 = [(SRFirstRunOnboardingController *)self delegate];
  [(SRAuthorizationTableDelegate *)v3 authorizationTable:0 foundIssueWithApp:+[NSError errorWithDomain:SRErrorDomain code:8196 userInfo:0]];

  [(SRAuthorizationTableDelegate *)v3 authorizationTableCompletedPromptSuccessfully:0];
}

- (void)completePrompt:(id)a3
{
  id v3 = [(SRFirstRunOnboardingController *)self delegate];

  [(SRAuthorizationTableDelegate *)v3 authorizationTableCompletedPromptSuccessfully:0];
}

- (SRAuthorizationTableDelegate)delegate
{
  return (SRAuthorizationTableDelegate *)objc_loadWeak((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)step
{
  return self->_step;
}

- (void)setStep:(int64_t)a3
{
  self->_int64_t step = a3;
}

- (void).cxx_destruct
{
}

@end