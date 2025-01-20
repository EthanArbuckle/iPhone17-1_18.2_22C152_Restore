@interface SRAuthorizationConfirmationViewController
+ (void)initialize;
- (NSArray)authState;
- (NSArray)services;
- (NSBundle)appBundle;
- (SRAuthorizationStore)authStore;
- (id)cancelHandler;
- (id)completionHandler;
- (void)addHeaderToStackView:(id)a3 withSpacing:(double)a4 text:(id)a5;
- (void)addLabelToStackView:(id)a3 withSpacing:(double)a4 text:(id)a5 font:(id)a6;
- (void)cancelPrompt;
- (void)changeAuthorization:(id)a3;
- (void)dealloc;
- (void)prepareContentView;
- (void)setAppBundle:(id)a3;
- (void)setAuthState:(id)a3;
- (void)setAuthStore:(id)a3;
- (void)setCancelHandler:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setServices:(id)a3;
- (void)viewDidLoad;
@end

@implementation SRAuthorizationConfirmationViewController

+ (void)initialize
{
  if ((id)objc_opt_class() == a1) {
    qword_1000161E0 = (uint64_t)os_log_create("com.apple.SensorKit", "SRAuthorizationConfirmationViewController");
  }
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)SRAuthorizationConfirmationViewController;
  [(SRAuthorizationConfirmationViewController *)&v4 viewDidLoad];
  objc_msgSend(-[SRAuthorizationConfirmationViewController headerView](self, "headerView"), "setIcon:accessibilityLabel:", +[UIImage skui_imageNamed:bundle:imageDescriptor:](UIImage, "skui_imageNamed:bundle:imageDescriptor:", @"SensorKit", +[NSBundle skui_bundle](NSBundle, "skui_bundle"), +[ISImageDescriptor skui_imageDescriptorForAuthorization](ISImageDescriptor, "skui_imageDescriptorForAuthorization")), 0);
  [(SRAuthorizationConfirmationViewController *)self prepareContentView];
  id v3 = +[OBBoldTrayButton boldButton];
  objc_msgSend(v3, "setTitle:forState:", +[NSString srui_localizedStringForCode:](NSString, "srui_localizedStringForCode:", 82), 0);
  [v3 addTarget:self action:"changeAuthorization:" forControlEvents:64];
  objc_msgSend(-[SRAuthorizationConfirmationViewController buttonTray](self, "buttonTray"), "addButton:", v3);
  objc_msgSend(-[SRAuthorizationConfirmationViewController navigationItem](self, "navigationItem"), "setRightBarButtonItem:", objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithTitle:style:target:action:", +[NSString srui_localizedStringForCode:](NSString, "srui_localizedStringForCode:", 26), 0, self, "cancelPrompt"));
}

- (void)prepareContentView
{
  id v3 = +[NSMutableArray array];
  id v4 = +[NSMutableArray array];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100003B90;
  v15[3] = &unk_1000103E0;
  v15[4] = self;
  v15[5] = v3;
  v15[6] = v4;
  [(NSArray *)[(SRAuthorizationConfirmationViewController *)self authState] enumerateObjectsUsingBlock:v15];
  id v5 = objc_alloc_init((Class)UIStackView);
  [v5 setAxis:1];
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v5 setSpacing:22.0];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v10 = sub_100003C0C;
  v11 = &unk_100010408;
  v12 = self;
  id v13 = v5;
  id v14 = +[UIImage skui_bulletImage];
  if ([v3 count]) {
    ((void (*)(void *, id, uint64_t))v10)(v9, v3, 49);
  }
  if ([v4 count]) {
    ((void (*)(void *, id, uint64_t))v10)(v9, v4, 50);
  }
  [(SRAuthorizationConfirmationViewController *)self addHeaderToStackView:v5 withSpacing:+[NSString srui_localizedStringForCode:51] text:6.0];
  uint64_t v8 = 0;
  v6 = +[NSString stringWithValidatedFormat:[(NSBundle *)[(SRAuthorizationConfirmationViewController *)self appBundle] srui_localizedAuthorizationConfirmationDetail], @"%@", &v8, [(NSBundle *)[(SRAuthorizationConfirmationViewController *)self appBundle] sk_studyName] validFormatSpecifiers error];
  if (!v6)
  {
    v7 = qword_1000161E0;
    if (os_log_type_enabled((os_log_t)qword_1000161E0, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v18 = v8;
      _os_log_fault_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_FAULT, "Failed to localize string because %{public}@", buf, 0xCu);
    }
  }
  [(SRAuthorizationConfirmationViewController *)self addLabelToStackView:v5 withSpacing:v6 text:+[UIFont preferredFontForTextStyle:UIFontTextStyleBody] font:6.0];
  objc_msgSend(-[SRAuthorizationConfirmationViewController contentView](self, "contentView"), "addSubview:", v5);
  v16[0] = objc_msgSend(objc_msgSend(v5, "topAnchor"), "constraintEqualToAnchor:", objc_msgSend(objc_msgSend(-[SRAuthorizationConfirmationViewController contentView](self, "contentView"), "layoutMarginsGuide"), "topAnchor"));
  v16[1] = objc_msgSend(objc_msgSend(v5, "leadingAnchor"), "constraintEqualToAnchor:", objc_msgSend(objc_msgSend(-[SRAuthorizationConfirmationViewController contentView](self, "contentView"), "layoutMarginsGuide"), "leadingAnchor"));
  v16[2] = objc_msgSend(objc_msgSend(v5, "trailingAnchor"), "constraintEqualToAnchor:", objc_msgSend(objc_msgSend(-[SRAuthorizationConfirmationViewController contentView](self, "contentView"), "layoutMarginsGuide"), "trailingAnchor"));
  v16[3] = objc_msgSend(objc_msgSend(v5, "bottomAnchor"), "constraintEqualToAnchor:", objc_msgSend(objc_msgSend(-[SRAuthorizationConfirmationViewController contentView](self, "contentView"), "layoutMarginsGuide"), "bottomAnchor"));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", +[NSArray arrayWithObjects:v16 count:4]);
}

- (void)dealloc
{
  [(SRAuthorizationConfirmationViewController *)self setAuthState:0];
  [(SRAuthorizationConfirmationViewController *)self setServices:0];
  [(SRAuthorizationConfirmationViewController *)self setAppBundle:0];
  [(SRAuthorizationConfirmationViewController *)self setCompletionHandler:0];
  [(SRAuthorizationConfirmationViewController *)self setCancelHandler:0];
  [(SRAuthorizationConfirmationViewController *)self setAuthStore:0];
  v3.receiver = self;
  v3.super_class = (Class)SRAuthorizationConfirmationViewController;
  [(SRAuthorizationConfirmationViewController *)&v3 dealloc];
}

- (void)changeAuthorization:(id)a3
{
  id v5 = qword_1000161E0;
  if (os_log_type_enabled((os_log_t)qword_1000161E0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Button pressed to confirm authorization changes. Updating TCC...", buf, 2u);
  }
  [a3 setUserInteractionEnabled:0];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100003FF4;
  v7[3] = &unk_100010430;
  v7[4] = self;
  [(NSArray *)[(SRAuthorizationConfirmationViewController *)self authState] enumerateObjectsUsingBlock:v7];
  v6 = qword_1000161E0;
  if (os_log_type_enabled((os_log_t)qword_1000161E0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "TCC updates complete, telling delegate to continue", buf, 2u);
  }
  (*((void (**)(void))[(SRAuthorizationConfirmationViewController *)self completionHandler] + 2))();
}

- (void)cancelPrompt
{
  v2 = (void (*)(void))*((void *)[(SRAuthorizationConfirmationViewController *)self cancelHandler] + 2);

  v2();
}

- (void)addHeaderToStackView:(id)a3 withSpacing:(double)a4 text:(id)a5
{
  v9 = +[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", [+[UIFontDescriptor preferredFontDescriptorWithTextStyle:UIFontTextStyleBody] fontDescriptorWithSymbolicTraits:2], 0.0);

  [(SRAuthorizationConfirmationViewController *)self addLabelToStackView:a3 withSpacing:a5 text:v9 font:a4];
}

- (void)addLabelToStackView:(id)a3 withSpacing:(double)a4 text:(id)a5 font:(id)a6
{
  id v10 = objc_alloc_init((Class)UILabel);
  [v10 setText:a5];
  [v10 setTextAlignment:4];
  [v10 setLineBreakMode:0];
  [v10 setNumberOfLines:0];
  [v10 setFont:a6];
  [a3 addArrangedSubview:v10];
  [a3 setCustomSpacing:v10 afterView:a4];
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

- (NSArray)authState
{
  return self->_authState;
}

- (void)setAuthState:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (id)cancelHandler
{
  return self->_cancelHandler;
}

- (void)setCancelHandler:(id)a3
{
}

- (SRAuthorizationStore)authStore
{
  return (SRAuthorizationStore *)objc_getProperty(self, a2, 48, 1);
}

- (void)setAuthStore:(id)a3
{
}

@end