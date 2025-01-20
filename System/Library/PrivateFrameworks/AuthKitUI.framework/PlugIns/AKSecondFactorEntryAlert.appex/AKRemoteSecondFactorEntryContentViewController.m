@interface AKRemoteSecondFactorEntryContentViewController
+ (id)_exportedInterface;
+ (id)_remoteViewControllerInterface;
- (void)_didEnterNewCode;
- (void)_invalidatePreferredContentSize;
- (void)dealloc;
- (void)getPreferredContentSizeWithReplyBlock:(id)a3;
- (void)loadView;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation AKRemoteSecondFactorEntryContentViewController

- (void)getPreferredContentSizeWithReplyBlock:(id)a3
{
  if (a3)
  {
    id v5 = a3;
    [(AKRemoteSecondFactorEntryContentViewController *)self preferredContentSize];
    (*((void (**)(id))a3 + 2))(v5);
  }
}

- (void)loadView
{
  v8.receiver = self;
  v8.super_class = (Class)AKRemoteSecondFactorEntryContentViewController;
  [(AKSecondFactorCodeEntryContentViewController *)&v8 loadView];
  v3 = [(AKRemoteSecondFactorEntryContentViewController *)self view];
  [v3 setTranslatesAutoresizingMaskIntoConstraints:1];

  v4 = [(AKRemoteSecondFactorEntryContentViewController *)self view];
  objc_msgSend(v4, "systemLayoutSizeFittingSize:", UILayoutFittingExpandedSize.width, UILayoutFittingExpandedSize.height);
  double v6 = v5;

  -[AKRemoteSecondFactorEntryContentViewController setPreferredContentSize:](self, "setPreferredContentSize:", 270.0, v6);
  v7 = +[NSNotificationCenter defaultCenter];
  [v7 addObserver:self selector:"_didEnterNewCode" name:@"AKSecondFactorCodeEntryContentViewControllerDidEnterCodeNotification" object:0];
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:@"AKSecondFactorCodeEntryContentViewControllerDidEnterCodeNotification" object:0];

  v4.receiver = self;
  v4.super_class = (Class)AKRemoteSecondFactorEntryContentViewController;
  [(AKSecondFactorCodeEntryContentViewController *)&v4 dealloc];
}

- (void)_didEnterNewCode
{
  v3 = _AKLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v4 = [(AKSecondFactorCodeEntryContentViewController *)self generatedCode];
    int v9 = 138412290;
    v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Login code has been entered. Notifying. %@", (uint8_t *)&v9, 0xCu);
  }
  double v5 = [(AKSecondFactorCodeEntryContentViewController *)self generatedCode];

  if (v5)
  {
    CFStringRef v6 = (const __CFString *)_AKAppleIDLoginCodeKey;
    v7 = [(AKSecondFactorCodeEntryContentViewController *)self generatedCode];
    CFPreferencesSetAppValue(v6, v7, kCFPreferencesAnyApplication);

    CFPreferencesSynchronize(kCFPreferencesAnyApplication, kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
  }
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, _AKAppleIDLoginCodeWasEnteredNotification, 0, 0, 1u);
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)AKRemoteSecondFactorEntryContentViewController;
  [(AKRemoteSecondFactorEntryContentViewController *)&v3 viewDidLayoutSubviews];
  [(AKRemoteSecondFactorEntryContentViewController *)self _invalidatePreferredContentSize];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)AKRemoteSecondFactorEntryContentViewController;
  [(AKRemoteSecondFactorEntryContentViewController *)&v3 viewDidLoad];
  [(AKRemoteSecondFactorEntryContentViewController *)self _invalidatePreferredContentSize];
}

- (void)_invalidatePreferredContentSize
{
  id v3 = [(AKRemoteSecondFactorEntryContentViewController *)self _remoteViewControllerProxy];
  [(AKRemoteSecondFactorEntryContentViewController *)self preferredContentSize];
  objc_msgSend(v3, "setPreferredContentSize:");
}

+ (id)_remoteViewControllerInterface
{
  return +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___SBSUIRemoteAlertItemContentHostInterface];
}

+ (id)_exportedInterface
{
  return +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___SBSUIRemoteAlertItemContentServiceInterface];
}

@end