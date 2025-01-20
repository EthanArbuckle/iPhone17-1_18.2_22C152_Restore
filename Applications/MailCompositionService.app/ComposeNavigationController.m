@interface ComposeNavigationController
+ (Class)placeholderFactoryClass;
+ (OS_os_log)log;
+ (id)_dockedViewWithTitle:(id)a3 andFrame:(CGRect)a4;
+ (id)dockedViewForUserActivity:(id)a3 withFrame:(CGRect)a4;
- (BOOL)canBeDocked;
- (BOOL)isDirty;
- (BOOL)isQuickReply;
- (BOOL)shouldAutorotate;
- (CGRect)frameForAttachmentWithIdentifier:(id)a3;
- (ComposeNavigationController)initWithComposition:(id)a3;
- (ComposeNavigationController)initWithComposition:(id)a3 mailComposeControllerOptions:(unint64_t)a4;
- (ComposeNavigationController)initWithUserActivity:(id)a3 scene:(id)a4;
- (EMObjectID)originalMessageObjectID;
- (MFMailComposeViewControllerDelegate)mailComposeDelegate;
- (NSString)autosaveIdentifier;
- (id)_mailComposeController;
- (id)_mailComposeView;
- (id)composeTitle;
- (id)dockIdentifier;
- (id)dockedViewWithFrame:(CGRect)a3;
- (id)documentID;
- (id)userActivityForRestoration;
- (int64_t)resolution;
- (void)_setCompositionContext:(id)a3;
- (void)autosaveWithHandler:(id)a3;
- (void)didCompleteDocking;
- (void)scrollToTopAnimated:(BOOL)a3;
- (void)securityScopeForURL:(id)a3 withHandler:(id)a4;
- (void)serializedPlaceholderForFileName:(id)a3 fileSize:(int64_t)a4 mimeType:(id)a5 contentID:(id)a6 withHandler:(id)a7;
- (void)setContentVisible:(BOOL)a3;
- (void)setInitialTitle:(id)a3;
- (void)setMailComposeDelegate:(id)a3;
- (void)setQuickReply:(BOOL)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewWillDisappear:(BOOL)a3;
- (void)willBeginDocking;
@end

@implementation ComposeNavigationController

+ (OS_os_log)log
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100003C68;
  block[3] = &unk_1000184E8;
  block[4] = a1;
  if (qword_10001F928 != -1) {
    dispatch_once(&qword_10001F928, block);
  }
  v2 = (void *)qword_10001F920;

  return (OS_os_log *)v2;
}

+ (Class)placeholderFactoryClass
{
  return (Class)objc_opt_class();
}

- (ComposeNavigationController)initWithComposition:(id)a3
{
  return [(ComposeNavigationController *)self initWithComposition:a3 mailComposeControllerOptions:0];
}

- (ComposeNavigationController)initWithComposition:(id)a3 mailComposeControllerOptions:(unint64_t)a4
{
  id v6 = a3;
  if (MFIsMobileMail()) {
    uint64_t v7 = objc_opt_class();
  }
  else {
    uint64_t v7 = 0;
  }
  v13.receiver = self;
  v13.super_class = (Class)ComposeNavigationController;
  v8 = [(ComposeNavigationController *)&v13 initWithNavigationBarClass:v7 toolbarClass:0];
  if (v8)
  {
    if (+[UIDevice mf_isPad]) {
      [(ComposeNavigationController *)v8 setModalPresentationStyle:1];
    }
    id v9 = [objc_alloc((Class)MFMailComposeController) initWithCompositionContext:v6 options:a4];
    v10 = [v6 originatingBundleID];
    [v9 setOriginatingBundleID:v10];

    [v9 setSourceAccountManagement:[v6 sourceAccountManagement]];
    [(ComposeNavigationController *)v8 pushViewController:v9 animated:0];
    composeViewController = v8->_composeViewController;
    v8->_composeViewController = (MFMailComposeController *)v9;
  }
  return v8;
}

- (ComposeNavigationController)initWithUserActivity:(id)a3 scene:(id)a4
{
  v5 = sub_100003EE0((uint64_t)ComposeNavigationController, a3, a4);
  id v6 = [(ComposeNavigationController *)self initWithComposition:v5];

  return v6;
}

- (void)viewDidLayoutSubviews
{
  v23.receiver = self;
  v23.super_class = (Class)ComposeNavigationController;
  [(ComposeNavigationController *)&v23 viewDidLayoutSubviews];
  [(ComposeNavigationController *)self systemMinimumLayoutMargins];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = [(ComposeNavigationController *)self view];
  [v11 setDirectionalLayoutMargins:v4, v6, v8, v10];

  v12 = [(ComposeNavigationController *)self view];
  [v12 directionalLayoutMargins];
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  v21 = [(ComposeNavigationController *)self topViewController];
  v22 = [v21 view];
  [v22 setDirectionalLayoutMargins:v14, v16, v18, v20];
}

- (void)viewDidAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)ComposeNavigationController;
  [(ComposeNavigationController *)&v7 viewDidAppear:a3];
  uint64_t v4 = MSAccessibilityIdentifierComposeContainerView;
  double v5 = [(ComposeNavigationController *)self view];
  [v5 setAccessibilityIdentifier:v4];

  if (objc_opt_respondsToSelector()) {
    [(MFMailComposeController *)self->_composeViewController mf_updateAlertSuppressionContextsForReason:@"compose did appear"];
  }
  double v6 = [(ComposeNavigationController *)self _mailComposeView];
  [v6 didAppear];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ComposeNavigationController;
  [(ComposeNavigationController *)&v6 viewWillDisappear:a3];
  uint64_t v4 = [(ComposeNavigationController *)self _mailComposeView];
  [v4 willDisappear];

  if ([(ComposeNavigationController *)self isQuickReply])
  {
    double v5 = [(ComposeNavigationController *)self _mailComposeController];
    [v5 backUpDraft];
  }
}

- (MFMailComposeViewControllerDelegate)mailComposeDelegate
{
  return (MFMailComposeViewControllerDelegate *)[(MFMailComposeController *)self->_composeViewController delegate];
}

- (void)setMailComposeDelegate:(id)a3
{
}

- (void)setContentVisible:(BOOL)a3
{
}

- (void)setInitialTitle:(id)a3
{
}

- (void)_setCompositionContext:(id)a3
{
}

- (CGRect)frameForAttachmentWithIdentifier:(id)a3
{
  id v4 = a3;
  double v5 = self->_composeViewController;
  objc_super v6 = v5;
  if (v5)
  {
    [(MFMailComposeController *)v5 frameForAttachmentWithIdentifier:v4];
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    double v15 = [(ComposeNavigationController *)self view];
    double v16 = [(MFMailComposeController *)v6 view];
    [v15 convertRect:v16 fromView:v8];
    CGFloat x = v17;
    CGFloat y = v19;
    CGFloat width = v21;
    CGFloat height = v23;
  }
  else
  {
    CGFloat x = CGRectZero.origin.x;
    CGFloat y = CGRectZero.origin.y;
    CGFloat width = CGRectZero.size.width;
    CGFloat height = CGRectZero.size.height;
  }

  double v25 = x;
  double v26 = y;
  double v27 = width;
  double v28 = height;
  result.size.CGFloat height = v28;
  result.size.CGFloat width = v27;
  result.origin.CGFloat y = v26;
  result.origin.CGFloat x = v25;
  return result;
}

- (id)_mailComposeController
{
  return self->_composeViewController;
}

- (id)_mailComposeView
{
  return [(MFMailComposeController *)self->_composeViewController mailComposeView];
}

- (BOOL)isDirty
{
  return [(MFMailComposeController *)self->_composeViewController isDirty];
}

- (int64_t)resolution
{
  return (int64_t)[(MFMailComposeController *)self->_composeViewController resolution];
}

- (void)autosaveWithHandler:(id)a3
{
}

- (id)userActivityForRestoration
{
  id v3 = objc_alloc((Class)NSUserActivity);
  id v4 = [v3 initWithActivityType:MSMailActivityHandoffTypeComposeWithStreams];
  double v5 = [(ComposeNavigationController *)self _mailComposeController];
  objc_super v6 = [v5 autosaveIdentifier];

  double v7 = MSMailComposeWindowTargetContentIdentifierWithIdentifier();
  [v4 setTargetContentIdentifier:v7];

  v17[0] = MSMailActivityHandoffTypeKey;
  v17[1] = MSMailActivityHandoffComposeKeyAutosaveID;
  v18[0] = MSMailActivityHandoffTypeComposeSansStreams;
  v18[1] = v6;
  double v8 = +[NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:2];
  double v9 = +[NSMutableDictionary dictionaryWithDictionary:v8];

  if (sub_100004930(self))
  {
    double v10 = [(ComposeNavigationController *)self composeTitle];
    [v9 setObject:v10 forKeyedSubscript:MSMailActivityHandoffComposeKeySubject];
  }
  double v11 = [(MFMailComposeController *)self->_composeViewController compositionContext];
  double v12 = [v11 preferredSendingEmailAddress];
  if (v12) {
    [v9 setObject:v12 forKeyedSubscript:MSMailActivityHandoffComposeKeyPreferredSendingEmailAddress];
  }
  double v13 = [v11 originalMessage];
  if ((*(unsigned int (**)(void, void *))(EFIsNotNull + 16))(EFIsNotNull, v13))
  {
    double v14 = [v13 objectID];
    double v15 = [v14 serializedRepresentation];
    [v9 setObject:v15 forKeyedSubscript:MSMailActivityHandoffComposeKeyOriginalMessageObjectID];
  }
  [v4 setUserInfo:v9];

  return v4;
}

- (BOOL)canBeDocked
{
  return +[UIDevice mf_isPad] ^ 1;
}

- (id)dockIdentifier
{
  v2 = [(ComposeNavigationController *)self _mailComposeController];
  id v3 = [v2 autosaveIdentifier];

  return v3;
}

+ (id)_dockedViewWithTitle:(id)a3 andFrame:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v8 = a3;
  double v9 = -[DockedPlaceholderView initWithFrame:]([DockedPlaceholderView alloc], "initWithFrame:", x, y, width, height);
  double v10 = +[UIColor mailDockedPlaceholderViewBackgroundColor];
  [(DockedPlaceholderView *)v9 setBackgroundColor:v10];

  double v11 = sub_100004B44(v8);
  double v12 = [(DockedPlaceholderView *)v9 headerView];
  [v12 setTitle:v11];

  return v9;
}

+ (id)dockedViewForUserActivity:(id)a3 withFrame:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  double v9 = [a3 userInfo];
  double v10 = [v9 objectForKeyedSubscript:MSMailActivityHandoffComposeKeySubject];

  double v11 = sub_100004B44(v10);
  double v12 = [a1 _dockedViewWithTitle:v11 andFrame:x, y, width, height];

  return v12;
}

- (id)dockedViewWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v8 = objc_opt_class();
  double v9 = [(ComposeNavigationController *)self composeTitle];
  double v10 = [v8 _dockedViewWithTitle:v9 andFrame:x, y, width, height];

  return v10;
}

- (void)willBeginDocking
{
  id v3 = [(ComposeNavigationController *)self _mailComposeController];
  [v3 saveFirstResponder];

  id v4 = [(ComposeNavigationController *)self _mailComposeController];
  [v4 autosaveIfNecessaryWithHandler:0];
}

- (void)didCompleteDocking
{
  id v3 = [(ComposeNavigationController *)self _mailComposeController];
  [v3 backUpDraft];

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100004EB4;
  v4[3] = &unk_100018510;
  v4[4] = self;
  sub_100004FBC(self, v4);
}

- (id)composeTitle
{
  v2 = [(ComposeNavigationController *)self _mailComposeController];
  id v3 = [v2 navigationBarTitle];

  return v3;
}

- (id)documentID
{
  v2 = [(ComposeNavigationController *)self _mailComposeController];
  id v3 = [v2 documentID];

  return v3;
}

- (BOOL)shouldAutorotate
{
  if (+[UIDevice mf_isPad])
  {
    id v3 = [(ComposeNavigationController *)self parentViewController];
    id v4 = v3;
    if (v3) {
      unsigned __int8 v5 = [v3 shouldAutorotate];
    }
    else {
      unsigned __int8 v5 = 1;
    }
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)ComposeNavigationController;
    return [(ComposeNavigationController *)&v7 shouldAutorotate];
  }
  return v5;
}

- (void)scrollToTopAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(MFMailComposeController *)self->_composeViewController mailComposeView];
  [v4 scrollToTopAnimated:v3];
}

- (void)serializedPlaceholderForFileName:(id)a3 fileSize:(int64_t)a4 mimeType:(id)a5 contentID:(id)a6 withHandler:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  double v16 = [(ComposeNavigationController *)self _mailComposeController];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  void v18[2] = sub_1000053E8;
  v18[3] = &unk_100018560;
  id v17 = v15;
  id v19 = v17;
  [v16 serializedPlaceholderForFileName:v12 fileSize:a4 mimeType:v13 contentID:v14 withHandler:v18];
}

- (void)securityScopeForURL:(id)a3 withHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(ComposeNavigationController *)self _mailComposeController];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000054E8;
  v10[3] = &unk_100018560;
  id v9 = v7;
  id v11 = v9;
  [v8 securityScopeForURL:v6 withHandler:v10];
}

- (NSString)autosaveIdentifier
{
  v2 = [(ComposeNavigationController *)self _mailComposeController];
  BOOL v3 = [v2 autosaveIdentifier];

  return (NSString *)v3;
}

- (EMObjectID)originalMessageObjectID
{
  v2 = [(ComposeNavigationController *)self _mailComposeController];
  BOOL v3 = [v2 originalMessageObjectID];

  return (EMObjectID *)v3;
}

- (BOOL)isQuickReply
{
  return self->_quickReply;
}

- (void)setQuickReply:(BOOL)a3
{
  self->_quickRepldouble y = a3;
}

- (void).cxx_destruct
{
}

@end