@interface SRAuthorizationPerCategoryViewController
+ (id)perCategoryViewControllerWithBundle:(id)a3 services:(id)a4 authStore:(id)a5 completionHandler:(id)a6 cancelHandler:(id)a7;
+ (void)initialize;
- (NSArray)services;
- (NSBundle)appBundle;
- (NSLayoutConstraint)heightAnchor;
- (NSMutableArray)authState;
- (OBTrayButton)boldButton;
- (SRAuthorizationStore)authStore;
- (id)cancelHandler;
- (id)completionHandler;
- (id)currentAuthGroup;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int)authIndex;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)allow;
- (void)cancelPrompt;
- (void)dealloc;
- (void)deny;
- (void)setAppBundle:(id)a3;
- (void)setAuthIndex:(int)a3;
- (void)setAuthState:(id)a3;
- (void)setAuthStore:(id)a3;
- (void)setBoldButton:(id)a3;
- (void)setCancelHandler:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setHeightAnchor:(id)a3;
- (void)setServices:(id)a3;
- (void)showNextAuthFlowPerCategory:(BOOL)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation SRAuthorizationPerCategoryViewController

+ (void)initialize
{
  if ((id)objc_opt_class() == a1) {
    qword_1000161F8 = (uint64_t)os_log_create("com.apple.SensorKit", "SRAuthorizationPerCategoryViewController");
  }
}

+ (id)perCategoryViewControllerWithBundle:(id)a3 services:(id)a4 authStore:(id)a5 completionHandler:(id)a6 cancelHandler:(id)a7
{
  v12 = objc_alloc_init(SRAuthorizationPerCategoryViewController);
  [(SRAuthorizationPerCategoryViewController *)v12 setAppBundle:a3];
  [(SRAuthorizationPerCategoryViewController *)v12 setServices:a4];
  [(SRAuthorizationPerCategoryViewController *)v12 setAuthIndex:0];
  v13 = +[NSMutableArray arrayWithCapacity:[(NSArray *)[(SRAuthorizationPerCategoryViewController *)v12 services] count]];
  if ([(NSArray *)[(SRAuthorizationPerCategoryViewController *)v12 services] count])
  {
    unint64_t v14 = 0;
    do
    {
      [(NSMutableArray *)v13 addObject:&off_100010808];
      ++v14;
    }
    while (v14 < [(NSArray *)[(SRAuthorizationPerCategoryViewController *)v12 services] count]);
  }
  [(SRAuthorizationPerCategoryViewController *)v12 setAuthState:v13];
  [(SRAuthorizationPerCategoryViewController *)v12 setCompletionHandler:a6];
  [(SRAuthorizationPerCategoryViewController *)v12 setCancelHandler:a7];
  [(SRAuthorizationPerCategoryViewController *)v12 setAuthStore:a5];

  return v12;
}

- (void)viewDidLoad
{
  v9.receiver = self;
  v9.super_class = (Class)SRAuthorizationPerCategoryViewController;
  [(SRAuthorizationPerCategoryViewController *)&v9 viewDidLoad];
  objc_msgSend(-[SRAuthorizationPerCategoryViewController tableView](self, "tableView"), "layoutMargins");
  objc_msgSend(-[SRAuthorizationPerCategoryViewController tableView](self, "tableView"), "setLayoutMargins:", v3, 25.0, v4, 25.0);
  objc_msgSend(-[SRAuthorizationPerCategoryViewController tableView](self, "tableView"), "setDelaysContentTouches:", 0);
  uint64_t v8 = 0;
  objc_msgSend(-[SRAuthorizationPerCategoryViewController navigationItem](self, "navigationItem"), "setTitle:", +[NSString stringWithValidatedFormat:validFormatSpecifiers:error:](NSString, "stringWithValidatedFormat:validFormatSpecifiers:error:", +[NSString srui_localizedStringForCode:](NSString, "srui_localizedStringForCode:", 46), @"%d%lu", &v8, -[SRAuthorizationPerCategoryViewController authIndex](self, "authIndex") + 1, -[NSArray count](-[SRAuthorizationPerCategoryViewController services](self, "services"), "count")));
  if (!objc_msgSend(-[SRAuthorizationPerCategoryViewController navigationItem](self, "navigationItem"), "title"))
  {
    v5 = qword_1000161F8;
    if (os_log_type_enabled((os_log_t)qword_1000161F8, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v11 = v8;
      _os_log_fault_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_FAULT, "Failed to localize string because %{public}@", buf, 0xCu);
    }
  }
  objc_msgSend(-[SRAuthorizationPerCategoryViewController navigationItem](self, "navigationItem"), "setRightBarButtonItem:", objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithTitle:style:target:action:", +[NSString srui_localizedStringForCode:](NSString, "srui_localizedStringForCode:", 26), 0, self, "cancelPrompt"));
  objc_msgSend(-[SRAuthorizationPerCategoryViewController navigationItem](self, "navigationItem"), "setBackBarButtonItem:", objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithTitle:style:target:action:", +[NSString srui_localizedStringForCode:](NSString, "srui_localizedStringForCode:", 47), 0, 0, 0));
  id v6 = objc_alloc((Class)UIView);
  objc_msgSend(-[SRAuthorizationPerCategoryViewController tableView](self, "tableView"), "contentSize");
  objc_msgSend(-[SRAuthorizationPerCategoryViewController tableView](self, "tableView"), "setTableFooterView:", objc_msgSend(v6, "initWithFrame:", 0.0, 0.0, v7, 1.0));
}

- (void)viewWillAppear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SRAuthorizationPerCategoryViewController;
  [(SRAuthorizationPerCategoryViewController *)&v8 viewWillAppear:a3];
  id v4 = [(SRAuthorizationPerCategoryViewController *)self currentAuthGroup];
  objc_msgSend(-[SRAuthorizationPerCategoryViewController view](self, "view"), "frame");
  objc_msgSend(-[SRAuthorizationPerCategoryViewController tableView](self, "tableView"), "setTableHeaderView:", +[UIImageView skui_imageViewForAuthGroup:parentSize:](UIImageView, "skui_imageViewForAuthGroup:parentSize:", v4, v5, v6));
  id v7 = objc_msgSend(-[SRAuthorizationPerCategoryViewController navigationController](self, "navigationController"), "navigationBar");
  NSAttributedStringKey v9 = NSForegroundColorAttributeName;
  v10 = +[UIColor systemGrayColor];
  objc_msgSend(v7, "setTitleTextAttributes:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1));
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = objc_msgSend(-[SRAuthorizationPerCategoryViewController navigationController](self, "navigationController"), "navigationBar");
  NSAttributedStringKey v7 = NSForegroundColorAttributeName;
  objc_super v8 = +[UIColor labelColor];
  objc_msgSend(v5, "setTitleTextAttributes:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v8, &v7, 1));
  v6.receiver = self;
  v6.super_class = (Class)SRAuthorizationPerCategoryViewController;
  [(SRAuthorizationPerCategoryViewController *)&v6 viewWillDisappear:v3];
}

- (void)dealloc
{
  [(SRAuthorizationPerCategoryViewController *)self setAuthState:0];
  [(SRAuthorizationPerCategoryViewController *)self setServices:0];
  [(SRAuthorizationPerCategoryViewController *)self setAppBundle:0];
  [(SRAuthorizationPerCategoryViewController *)self setCompletionHandler:0];
  [(SRAuthorizationPerCategoryViewController *)self setCancelHandler:0];
  [(SRAuthorizationPerCategoryViewController *)self setBoldButton:0];
  [(SRAuthorizationPerCategoryViewController *)self setHeightAnchor:0];

  self->_currentAuthGroup = 0;
  [(SRAuthorizationPerCategoryViewController *)self setAuthStore:0];
  v3.receiver = self;
  v3.super_class = (Class)SRAuthorizationPerCategoryViewController;
  [(SRAuthorizationPerCategoryViewController *)&v3 dealloc];
}

- (id)currentAuthGroup
{
  id result = self->_currentAuthGroup;
  if (!result)
  {
    id result = +[SRAuthorizationGroup authorizationGroupWithServiceName:[(NSArray *)[(SRAuthorizationPerCategoryViewController *)self services] objectAtIndexedSubscript:[(SRAuthorizationPerCategoryViewController *)self authIndex]]];
    self->_currentAuthGroup = (SRAuthorizationGroup *)result;
  }
  return result;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 3;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  unsigned int v6 = [a4 row];
  switch(v6)
  {
    case 2u:
      id v12 = [(SRAuthorizationPerCategoryViewController *)self tableView];
      v13 = (objc_class *)objc_opt_class();
      NSAttributedStringKey v7 = (SRButtonTrayCell *)[v12 dequeueReusableCellWithIdentifier:NSStringFromClass(v13)];
      if (!v7)
      {
        unint64_t v14 = [SRButtonTrayCell alloc];
        v15 = (objc_class *)objc_opt_class();
        NSAttributedStringKey v7 = [(SRButtonTrayCell *)v14 initWithStyle:0 reuseIdentifier:NSStringFromClass(v15)];
        objc_msgSend(-[SRAuthorizationPerCategoryViewController tableView](self, "tableView"), "separatorInset");
        objc_msgSend(-[SRButtonTrayCell contentView](v7, "contentView"), "setLayoutMargins:", 40.0, v16, 0.0, v17);
      }
      [(UIButton *)[(SRButtonTrayCell *)v7 firstButton] setTitle:+[NSString srui_localizedStringForCode:1] forState:0];
      [(UIButton *)[(SRButtonTrayCell *)v7 secondButton] setTitle:+[NSString srui_localizedStringForCode:2] forState:0];
      [(UIButton *)[(SRButtonTrayCell *)v7 firstButton] addTarget:self action:"allow" forControlEvents:64];
      [(UIButton *)[(SRButtonTrayCell *)v7 secondButton] addTarget:self action:"deny" forControlEvents:64];
      return v7;
    case 1u:
      return +[UITableViewCell skui_tableViewCellForDataSample:a3];
    case 0u:
      NSAttributedStringKey v7 = (SRButtonTrayCell *)+[SRAuthorizationCategoryDetailCell categoryDetailCellForAuthGroup:bundle:titleFont:bodyFont:textColor:OBKStyle:](SRAuthorizationCategoryDetailCell, "categoryDetailCellForAuthGroup:bundle:titleFont:bodyFont:textColor:OBKStyle:", [(SRAuthorizationPerCategoryViewController *)self currentAuthGroup], [(SRAuthorizationPerCategoryViewController *)self appBundle], +[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", [+[UIFontDescriptor preferredFontDescriptorWithTextStyle:](UIFontDescriptor, "preferredFontDescriptorWithTextStyle:", UIFontTextStyleBody) fontDescriptorWithSymbolicTraits:2], 0.0), +[UIFont preferredFontForTextStyle:UIFontTextStyleBody],
                                 +[UIColor labelColor],
                                 1);
      objc_msgSend(-[SRButtonTrayCell categorySubTitleLabel](v7, "categorySubTitleLabel"), "setText:", objc_msgSend(-[SRAuthorizationPerCategoryViewController currentAuthGroup](self, "currentAuthGroup"), "localizedPlatforms"));
      id v8 = objc_msgSend(-[SRAuthorizationPerCategoryViewController currentAuthGroup](self, "currentAuthGroup"), "localizedDisplayName");
      if ([v8 length])
      {
        NSAttributedStringKey v9 = objc_opt_new();
        LODWORD(v10) = 0.5;
        [v9 setHyphenationFactor:v10];
        NSAttributedStringKey v22 = NSParagraphStyleAttributeName;
        v23 = v9;
        id v11 = objc_msgSend(objc_alloc((Class)NSAttributedString), "initWithString:attributes:", v8, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1));
      }
      else
      {
        id v11 = 0;
      }
      objc_msgSend(-[SRButtonTrayCell categoryTitleLabel](v7, "categoryTitleLabel"), "setAttributedText:", v11);
      objc_msgSend(-[SRAuthorizationPerCategoryViewController tableView](self, "tableView"), "separatorInset");
      objc_msgSend(-[SRButtonTrayCell contentView](v7, "contentView"), "setLayoutMargins:", 30.0, v19, 22.0, v20);
      return v7;
    default:
      v18 = objc_opt_new();
      return v18;
  }
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  if (objc_msgSend(a5, "row", a3) && objc_msgSend(a5, "row") != (id)1)
  {
    [a4 setSeparatorStyle:0];
  }
  else
  {
    [a4 setSeparatorStyle:1];
    double left = UIEdgeInsetsZero.left;
    double bottom = UIEdgeInsetsZero.bottom;
    double right = UIEdgeInsetsZero.right;
    objc_msgSend(a4, "setSeparatorInset:", UIEdgeInsetsZero.top, left, bottom, right);
  }
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  if ([a4 row] == (id)1) {
    objc_msgSend(-[SRAuthorizationPerCategoryViewController navigationController](self, "navigationController"), "pushViewController:animated:", +[SRSampleViewController sampleViewControllerForAuthGroup:](SRSampleViewController, "sampleViewControllerForAuthGroup:", -[SRAuthorizationPerCategoryViewController currentAuthGroup](self, "currentAuthGroup")), 1);
  }

  [a3 deselectRowAtIndexPath:a4 animated:0];
}

- (void)showNextAuthFlowPerCategory:(BOOL)a3
{
  [(NSMutableArray *)[(SRAuthorizationPerCategoryViewController *)self authState] setObject:+[NSNumber numberWithBool:a3] atIndexedSubscript:[(SRAuthorizationPerCategoryViewController *)self authIndex]];
  signed int v4 = [(SRAuthorizationPerCategoryViewController *)self authIndex];
  if ((char *)[(NSArray *)[(SRAuthorizationPerCategoryViewController *)self services] count] - 1 == (unsigned char *)v4)
  {
    id v5 = [[SRAuthorizationConfirmationViewController alloc] initWithTitle:+[NSString srui_localizedStringForCode:48]];
    [(SRAuthorizationConfirmationViewController *)v5 setAppBundle:[(SRAuthorizationPerCategoryViewController *)self appBundle]];
    [(SRAuthorizationConfirmationViewController *)v5 setServices:[(SRAuthorizationPerCategoryViewController *)self services]];
    [(SRAuthorizationConfirmationViewController *)v5 setAuthState:[(SRAuthorizationPerCategoryViewController *)self authState]];
    [(SRAuthorizationConfirmationViewController *)v5 setCompletionHandler:[(SRAuthorizationPerCategoryViewController *)self completionHandler]];
    [(SRAuthorizationConfirmationViewController *)v5 setCancelHandler:[(SRAuthorizationPerCategoryViewController *)self cancelHandler]];
    [(SRAuthorizationConfirmationViewController *)v5 setAuthStore:[(SRAuthorizationPerCategoryViewController *)self authStore]];
    id v6 = [(SRAuthorizationPerCategoryViewController *)self navigationController];
    [v6 pushViewController:v5 animated:1];
  }
  else
  {
    NSAttributedStringKey v7 = objc_alloc_init(SRAuthorizationPerCategoryViewController);
    [(SRAuthorizationPerCategoryViewController *)v7 setAppBundle:[(SRAuthorizationPerCategoryViewController *)self appBundle]];
    [(SRAuthorizationPerCategoryViewController *)v7 setServices:[(SRAuthorizationPerCategoryViewController *)self services]];
    [(SRAuthorizationPerCategoryViewController *)v7 setAuthState:[(SRAuthorizationPerCategoryViewController *)self authState]];
    [(SRAuthorizationPerCategoryViewController *)v7 setAuthIndex:[(SRAuthorizationPerCategoryViewController *)self authIndex] + 1];
    [(SRAuthorizationPerCategoryViewController *)v7 setCompletionHandler:[(SRAuthorizationPerCategoryViewController *)self completionHandler]];
    [(SRAuthorizationPerCategoryViewController *)v7 setCancelHandler:[(SRAuthorizationPerCategoryViewController *)self cancelHandler]];
    [(SRAuthorizationPerCategoryViewController *)v7 setAuthStore:[(SRAuthorizationPerCategoryViewController *)self authStore]];
    objc_msgSend(-[SRAuthorizationPerCategoryViewController navigationController](self, "navigationController"), "pushViewController:animated:", v7, 1);
  }
}

- (void)allow
{
}

- (void)deny
{
  objc_initWeak(&location, self);
  objc_super v3 = [(SRAuthorizationPerCategoryViewController *)self appBundle];
  id v4 = [(SRAuthorizationPerCategoryViewController *)self currentAuthGroup];
  id v6 = _NSConcreteStackBlock;
  uint64_t v7 = 3221225472;
  id v8 = sub_100008034;
  NSAttributedStringKey v9 = &unk_100010510;
  objc_copyWeak(&v10, &location);
  id v5 = +[UIAlertController skui_alertControllerForRequiredAuthorizationIfNeccesaryForBundle:v3 authGroup:v4 destructiveHandler:&v6];
  if (v5) {
    -[SRAuthorizationPerCategoryViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v5, 1, 0, v6, v7, v8, v9);
  }
  else {
    -[SRAuthorizationPerCategoryViewController showNextAuthFlowPerCategory:](self, "showNextAuthFlowPerCategory:", v6, v7, v8, v9);
  }
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)cancelPrompt
{
  v2 = (void (*)(void))*((void *)[(SRAuthorizationPerCategoryViewController *)self cancelHandler] + 2);

  v2();
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

- (NSMutableArray)authState
{
  return self->_authState;
}

- (void)setAuthState:(id)a3
{
}

- (int)authIndex
{
  return self->_authIndex;
}

- (void)setAuthIndex:(int)a3
{
  self->_authIndex = a3;
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
  return (SRAuthorizationStore *)objc_getProperty(self, a2, 64, 1);
}

- (void)setAuthStore:(id)a3
{
}

- (NSLayoutConstraint)heightAnchor
{
  return self->_heightAnchor;
}

- (void)setHeightAnchor:(id)a3
{
}

- (OBTrayButton)boldButton
{
  return self->_boldButton;
}

- (void)setBoldButton:(id)a3
{
}

@end