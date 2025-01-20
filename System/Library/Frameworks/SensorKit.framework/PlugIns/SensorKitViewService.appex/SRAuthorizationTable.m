@interface SRAuthorizationTable
+ (void)initialize;
- (BOOL)migrationMode;
- (NSArray)services;
- (NSBundle)appBundle;
- (SRAuthorizationStore)authStore;
- (SRAuthorizationTable)initWithServices:(id)a3 appBundle:(id)a4 authStore:(id)a5 migrationMode:(BOOL)a6;
- (SRAuthorizationTableDelegate)delegate;
- (void)cancelPrompt;
- (void)completePrompt;
- (void)dealloc;
- (void)openPrivacy;
- (void)prepareContentView;
- (void)setAppBundle:(id)a3;
- (void)setAuthStore:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setMigrationMode:(BOOL)a3;
- (void)setServices:(id)a3;
- (void)showAuthFlowPerCategory;
- (void)showMigrationReceipt;
- (void)showSensorKitPrivacyPage;
- (void)viewDidLoad;
@end

@implementation SRAuthorizationTable

+ (void)initialize
{
  if ((id)objc_opt_class() == a1) {
    qword_100016200 = (uint64_t)os_log_create("com.apple.SensorKit", "AuthorizationTable");
  }
}

- (SRAuthorizationTable)initWithServices:(id)a3 appBundle:(id)a4 authStore:(id)a5 migrationMode:(BOOL)a6
{
  BOOL v6 = a6;
  if (a6)
  {
    uint64_t v17 = 0;
    v11 = +[NSString stringWithValidatedFormat:validFormatSpecifiers:error:](NSString, "stringWithValidatedFormat:validFormatSpecifiers:error:", +[NSString srui_localizedStringForCode:](NSString, "srui_localizedStringForCode:", 88), @"%@", &v17, objc_msgSend(a4, "sk_studyName"));
    if (!v11)
    {
      v12 = qword_100016200;
      if (os_log_type_enabled((os_log_t)qword_100016200, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138543362;
        uint64_t v19 = v17;
        _os_log_fault_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_FAULT, "Failed to localize string because %{public}@", buf, 0xCu);
      }

      return 0;
    }
  }
  else
  {
    v11 = (NSString *)+[NSString srui_localizedStringForCode:71];
  }
  v16.receiver = self;
  v16.super_class = (Class)SRAuthorizationTable;
  v14 = [(SRAuthorizationTable *)&v16 initWithTitle:v11 detailText:0 icon:+[UIImage skui_imageNamed:bundle:imageDescriptor:](UIImage, "skui_imageNamed:bundle:imageDescriptor:", @"SensorKit", +[NSBundle skui_bundle](NSBundle, "skui_bundle"), +[ISImageDescriptor skui_imageDescriptorForAuthorization])];
  v13 = v14;
  if (v14)
  {
    [(SRAuthorizationTable *)v14 setMigrationMode:v6];
    [(SRAuthorizationTable *)v13 setAppBundle:a4];
    [(SRAuthorizationTable *)v13 setServices:a3];
    [(SRAuthorizationTable *)v13 setAuthStore:a5];
  }
  return v13;
}

- (void)viewDidLoad
{
  v7.receiver = self;
  v7.super_class = (Class)SRAuthorizationTable;
  [(SRAuthorizationTable *)&v7 viewDidLoad];
  [(SRAuthorizationTable *)self prepareContentView];
  id v3 = +[OBBoldTrayButton boldButton];
  if ([(SRAuthorizationTable *)self migrationMode]) {
    uint64_t v4 = 87;
  }
  else {
    uint64_t v4 = 72;
  }
  objc_msgSend(v3, "setTitle:forState:", +[NSString srui_localizedStringForCode:](NSString, "srui_localizedStringForCode:", v4), 0);
  unsigned int v5 = [(SRAuthorizationTable *)self migrationMode];
  BOOL v6 = &selRef_showMigrationReceipt;
  if (!v5) {
    BOOL v6 = &selRef_showAuthFlowPerCategory;
  }
  [v3 addTarget:self action:*v6 forControlEvents:64];
  objc_msgSend(-[SRAuthorizationTable buttonTray](self, "buttonTray"), "addButton:", v3);
  objc_msgSend(-[SRAuthorizationTable navigationItem](self, "navigationItem"), "setRightBarButtonItem:", objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithTitle:style:target:action:", +[NSString srui_localizedStringForCode:](NSString, "srui_localizedStringForCode:", 26), 0, self, "cancelPrompt"));
}

- (void)dealloc
{
  [(SRAuthorizationTable *)self setAppBundle:0];
  [(SRAuthorizationTable *)self setServices:0];
  [(SRAuthorizationTable *)self setAuthStore:0];
  v3.receiver = self;
  v3.super_class = (Class)SRAuthorizationTable;
  [(SRAuthorizationTable *)&v3 dealloc];
}

- (void)prepareContentView
{
  objc_super v3 = (UIButton *)objc_alloc_init((Class)UILabel);
  [(UIButton *)v3 setTextAlignment:4];
  [(UIButton *)v3 setLineBreakMode:0];
  [(UIButton *)v3 setNumberOfLines:0];
  v31 = self;
  if ([(SRAuthorizationTable *)self migrationMode])
  {
    uint64_t v4 = (NSString *)+[NSString srui_localizedStringForCode:89];
  }
  else
  {
    uint64_t v39 = 0;
    unsigned int v5 = +[NSString stringWithValidatedFormat:validFormatSpecifiers:error:](NSString, "stringWithValidatedFormat:validFormatSpecifiers:error:", +[NSString srui_localizedStringForCode:74], @"%@", &v39, [(NSBundle *)[(SRAuthorizationTable *)self appBundle] sk_studyName]);
    if (!v5)
    {
      BOOL v6 = qword_100016200;
      if (os_log_type_enabled((os_log_t)qword_100016200, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138543362;
        uint64_t v42 = v39;
        _os_log_fault_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_FAULT, "Failed to localize string because %{public}@", buf, 0xCu);
      }
    }
    uint64_t v4 = +[NSString stringWithValidatedFormat:validFormatSpecifiers:error:](NSString, "stringWithValidatedFormat:validFormatSpecifiers:error:", +[NSString srui_localizedStringForCode:73], @"%@", &v39, v5);
    if (!v4)
    {
      objc_super v7 = qword_100016200;
      if (os_log_type_enabled((os_log_t)qword_100016200, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138543362;
        uint64_t v42 = v39;
        _os_log_fault_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_FAULT, "Failed to localize string because %{public}@", buf, 0xCu);
      }
    }
  }
  [(UIButton *)v3 setText:v4];
  [(UIButton *)v3 setFont:+[UIFont preferredFontForTextStyle:UIFontTextStyleBody]];
  id v8 = +[NSMutableArray array];
  v30 = v3;
  [v8 addObject:v3];
  id v9 = +[NSMutableArray array];
  if ([(SRAuthorizationTable *)self migrationMode])
  {
    v10 = 0;
    UIAccessibilityTraits v34 = UIAccessibilityTraitLink;
  }
  else
  {
    v10 = +[UIButton buttonWithType:1];
    [(UILabel *)[(UIButton *)v10 titleLabel] setFont:+[UIFont preferredFontForTextStyle:UIFontTextStyleBody]];
    [(UILabel *)[(UIButton *)v10 titleLabel] setTextAlignment:4];
    [(UIButton *)v10 setTitle:+[NSString srui_localizedStringForCode:75] forState:0];
    [(UIButton *)v10 addTarget:self action:"showSensorKitPrivacyPage" forControlEvents:64];
    UIAccessibilityTraits v34 = UIAccessibilityTraitLink;
    -[UIButton setAccessibilityTraits:](v10, "setAccessibilityTraits:");
    [(UILabel *)[(UIButton *)v10 titleLabel] setLineBreakMode:0];
    [(UILabel *)[(UIButton *)v10 titleLabel] setNumberOfLines:0];
    [(UIButton *)v10 setContentHorizontalAlignment:4];
    [(UIButton *)v10 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v8 addObject:v10];
    objc_msgSend(v9, "addObject:", objc_msgSend(-[UIButton topAnchor](v10, "topAnchor"), "constraintEqualToAnchor:", -[UILabel topAnchor](-[UIButton titleLabel](v10, "titleLabel"), "topAnchor")));
    objc_msgSend(v9, "addObject:", objc_msgSend(-[UIButton bottomAnchor](v10, "bottomAnchor"), "constraintEqualToAnchor:", -[UILabel bottomAnchor](-[UIButton titleLabel](v10, "titleLabel"), "bottomAnchor")));
  }
  v11 = +[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", [+[UIFontDescriptor preferredFontDescriptorWithTextStyle:UIFontTextStyleBody] fontDescriptorWithSymbolicTraits:2], 0.0);
  id v12 = (id)objc_opt_new();
  [v12 setTextAlignment:4];
  [v12 setLineBreakMode:0];
  [v12 setNumberOfLines:0];
  objc_msgSend(v12, "setText:", -[NSBundle srui_localizedResearchPurpose](-[SRAuthorizationTable appBundle](self, "appBundle"), "srui_localizedResearchPurpose"));
  obj = v11;
  [v12 setFont:v11];
  [v8 addObject:v12];
  id v13 = objc_alloc_init((Class)UILabel);
  [v13 setTextAlignment:4];
  [v13 setLineBreakMode:0];
  [v13 setNumberOfLines:0];
  objc_msgSend(v13, "setText:", -[NSBundle sk_usageDescription](-[SRAuthorizationTable appBundle](self, "appBundle"), "sk_usageDescription"));
  objc_msgSend(v13, "setFont:", +[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleBody));
  [v8 addObject:v13];
  v14 = +[UIButton buttonWithType:1];
  [(UILabel *)[(UIButton *)v14 titleLabel] setFont:+[UIFont preferredFontForTextStyle:UIFontTextStyleBody]];
  [(UIButton *)v14 setTitle:+[NSString stringWithFormat:@"\n%@", [(NSBundle *)[(SRAuthorizationTable *)self appBundle] srui_localizedPrivacyPolicyLinkTitle]] forState:0];
  [(UIButton *)v14 addTarget:self action:"openPrivacy" forControlEvents:64];
  [(UIButton *)v14 setAccessibilityTraits:v34];
  [(UILabel *)[(UIButton *)v14 titleLabel] setLineBreakMode:0];
  [(UILabel *)[(UIButton *)v14 titleLabel] setNumberOfLines:0];
  [(UILabel *)[(UIButton *)v14 titleLabel] setTextAlignment:4];
  if ((id)+[UIView userInterfaceLayoutDirectionForSemanticContentAttribute:](UIView, "userInterfaceLayoutDirectionForSemanticContentAttribute:", objc_msgSend(+[UIView appearance](UIView, "appearance"), "semanticContentAttribute")) == (id)1)uint64_t v15 = 2; {
  else
  }
    uint64_t v15 = 1;
  [(UIButton *)v14 setContentHorizontalAlignment:v15];
  [v8 addObject:v14];
  objc_msgSend(v9, "addObject:", objc_msgSend(-[UIButton topAnchor](v14, "topAnchor"), "constraintEqualToAnchor:", -[UILabel topAnchor](-[UIButton titleLabel](v14, "titleLabel"), "topAnchor")));
  objc_msgSend(v9, "addObject:", objc_msgSend(-[UIButton bottomAnchor](v14, "bottomAnchor"), "constraintEqualToAnchor:", -[UILabel bottomAnchor](-[UIButton titleLabel](v14, "titleLabel"), "bottomAnchor")));
  id v16 = 0;
  if (![(SRAuthorizationTable *)self migrationMode])
  {
    id v16 = objc_alloc_init((Class)UILabel);
    [v16 setTextAlignment:4];
    [v16 setLineBreakMode:0];
    [v16 setNumberOfLines:0];
    objc_msgSend(v16, "setText:", +[NSString srui_localizedStringForCode:](NSString, "srui_localizedStringForCode:", 78));
    [v16 setFont:obj];
    [v8 addObject:v16];
  }
  id v17 = [objc_alloc((Class)UIStackView) initWithArrangedSubviews:v8];
  [v17 setAxis:1];
  unsigned __int8 v18 = [(SRAuthorizationTable *)self migrationMode];
  uint64_t v19 = v30;
  if ((v18 & 1) == 0)
  {
    [v17 setCustomSpacing:v30 afterView:6.0];
    uint64_t v19 = v10;
  }
  [v17 setCustomSpacing:v19 afterView:37.0];
  [v17 setCustomSpacing:v12 afterView:6.0];
  [v17 setCustomSpacing:v13 afterView:6.0];
  [v17 setCustomSpacing:v14 afterView:22.0];
  if (v16) {
    [v17 setCustomSpacing:v16 afterView:16.0];
  }
  v28 = v16;
  [v17 setTranslatesAutoresizingMaskIntoConstraints:0];
  objc_msgSend(v9, "addObject:", objc_msgSend(objc_msgSend(v17, "topAnchor"), "constraintEqualToAnchor:", objc_msgSend(objc_msgSend(-[SRAuthorizationTable contentView](self, "contentView"), "layoutMarginsGuide"), "topAnchor")));
  objc_msgSend(v9, "addObject:", objc_msgSend(objc_msgSend(v17, "leadingAnchor"), "constraintEqualToAnchor:", objc_msgSend(objc_msgSend(-[SRAuthorizationTable contentView](self, "contentView"), "layoutMarginsGuide"), "leadingAnchor")));
  objc_msgSend(v9, "addObject:", objc_msgSend(objc_msgSend(v17, "trailingAnchor"), "constraintEqualToAnchor:", objc_msgSend(objc_msgSend(-[SRAuthorizationTable contentView](self, "contentView"), "layoutMarginsGuide"), "trailingAnchor")));
  id v29 = v9;
  objc_msgSend(v9, "addObject:", objc_msgSend(objc_msgSend(v17, "bottomAnchor"), "constraintEqualToAnchor:", objc_msgSend(objc_msgSend(-[SRAuthorizationTable contentView](self, "contentView"), "layoutMarginsGuide"), "bottomAnchor")));
  if (![(SRAuthorizationTable *)self migrationMode])
  {
    id v20 = +[UIImage skui_bulletImage];
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    obja = [(SRAuthorizationTable *)self services];
    id v21 = [(NSArray *)obja countByEnumeratingWithState:&v35 objects:v40 count:16];
    if (v21)
    {
      id v22 = v21;
      uint64_t v23 = *(void *)v36;
      do
      {
        for (i = 0; i != v22; i = (char *)i + 1)
        {
          if (*(void *)v36 != v23) {
            objc_enumerationMutation(obja);
          }
          uint64_t v25 = *(void *)(*((void *)&v35 + 1) + 8 * i);
          v27 = [[SRBulletedListItem alloc] initWithTitle:[+[SRAuthorizationGroup authorizationGroupWithServiceName:v25] localizedDisplayName] description:0 image:v20 textStyle:UIFontTextStyleBody];
          [v17 addArrangedSubview:v27];
          objc_msgSend(v17, "setCustomSpacing:afterView:", objc_msgSend(objc_msgSend(v17, "arrangedSubviews"), "lastObject"), 16.0);
        }
        id v22 = [(NSArray *)obja countByEnumeratingWithState:&v35 objects:v40 count:16];
      }
      while (v22);
    }
  }
  objc_msgSend(-[SRAuthorizationTable contentView](v31, "contentView"), "addSubview:", v17);
  +[NSLayoutConstraint activateConstraints:v29];
}

- (void)openPrivacy
{
  id v3 = [(NSBundle *)[(SRAuthorizationTable *)self appBundle] sk_privacyURL];
  if (v3)
  {
    id v4 = v3;
    unsigned int v5 = [(SRAuthorizationTable *)self delegate];
    [(SRAuthorizationTableDelegate *)v5 authorizationTable:self openURL:v4];
  }
}

- (void)showAuthFlowPerCategory
{
  objc_initWeak(&location, self);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100009080;
  v5[3] = &unk_100010538;
  objc_copyWeak(&v6, &location);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000090AC;
  v3[3] = &unk_100010538;
  objc_copyWeak(&v4, &location);
  objc_msgSend(-[SRAuthorizationTable navigationController](self, "navigationController"), "pushViewController:animated:", +[SRAuthorizationPerCategoryViewController perCategoryViewControllerWithBundle:services:authStore:completionHandler:cancelHandler:](SRAuthorizationPerCategoryViewController, "perCategoryViewControllerWithBundle:services:authStore:completionHandler:cancelHandler:", -[SRAuthorizationTable appBundle](self, "appBundle"), -[SRAuthorizationTable services](self, "services"), -[SRAuthorizationTable authStore](self, "authStore"), v5, v3), 1);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (void)showMigrationReceipt
{
  objc_initWeak(&location, self);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000093A0;
  v14[3] = &unk_100010538;
  objc_copyWeak(&v15, &location);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000093CC;
  v12[3] = &unk_100010538;
  objc_copyWeak(&v13, &location);
  id v3 = +[NSMutableArray arrayWithCapacity:[(NSArray *)[(SRAuthorizationTable *)self services] count]];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v9 = 0u;
  id v4 = [(SRAuthorizationTable *)self services];
  unsigned int v5 = (char *)[(NSArray *)v4 countByEnumeratingWithState:&v8 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v9;
    while (1)
    {
      if (*(void *)v9 != v6) {
        objc_enumerationMutation(v4);
      }
      [(NSMutableArray *)v3 addObject:&__kCFBooleanTrue];
      if (!--v5)
      {
        unsigned int v5 = (char *)[(NSArray *)v4 countByEnumeratingWithState:&v8 objects:v17 count:16];
        if (!v5) {
          break;
        }
      }
    }
  }
  objc_super v7 = [[SRAuthorizationConfirmationViewController alloc] initWithTitle:+[NSString srui_localizedStringForCode:48]];
  [(SRAuthorizationConfirmationViewController *)v7 setAppBundle:[(SRAuthorizationTable *)self appBundle]];
  [(SRAuthorizationConfirmationViewController *)v7 setServices:[(SRAuthorizationTable *)self services]];
  [(SRAuthorizationConfirmationViewController *)v7 setAuthState:v3];
  [(SRAuthorizationConfirmationViewController *)v7 setCompletionHandler:v14];
  [(SRAuthorizationConfirmationViewController *)v7 setCancelHandler:v12];
  [(SRAuthorizationConfirmationViewController *)v7 setAuthStore:[(SRAuthorizationTable *)self authStore]];
  objc_msgSend(-[SRAuthorizationTable navigationController](self, "navigationController"), "pushViewController:animated:", v7, 1);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

- (void)cancelPrompt
{
  id v3 = [(SRAuthorizationTable *)self delegate];
  [(SRAuthorizationTableDelegate *)v3 authorizationTable:self foundIssueWithApp:+[NSError errorWithDomain:SRErrorDomain code:8196 userInfo:0]];

  [(SRAuthorizationTableDelegate *)v3 authorizationTableCompletedPromptSuccessfully:self];
}

- (void)completePrompt
{
  id v3 = [(SRAuthorizationTable *)self delegate];

  [(SRAuthorizationTableDelegate *)v3 authorizationTableCompletedPromptSuccessfully:self];
}

- (void)showSensorKitPrivacyPage
{
  id v3 = +[OBPrivacyPresenter srui_presenterForPrivacySplash];
  [v3 setPresentingViewController:self];

  [v3 present];
}

- (SRAuthorizationTableDelegate)delegate
{
  return (SRAuthorizationTableDelegate *)objc_loadWeak((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)migrationMode
{
  return self->_migrationMode;
}

- (void)setMigrationMode:(BOOL)a3
{
  self->_migrationMode = a3;
}

- (NSBundle)appBundle
{
  return self->_appBundle;
}

- (void)setAppBundle:(id)a3
{
}

- (NSArray)services
{
  return self->_services;
}

- (void)setServices:(id)a3
{
}

- (SRAuthorizationStore)authStore
{
  return (SRAuthorizationStore *)objc_getProperty(self, a2, 40, 1);
}

- (void)setAuthStore:(id)a3
{
}

- (void).cxx_destruct
{
}

@end