@interface PKServiceTransactionAuthenticationPasscodeViewController
+ (BOOL)_isSecureForRemoteViewService;
+ (id)_exportedInterface;
+ (id)_remoteViewControllerInterface;
- (BOOL)_canShowWhileLocked;
- (BOOL)_isHostProcessEntitled;
- (unint64_t)supportedInterfaceOrientations;
- (void)_hostApplicationDidEnterBackground;
- (void)passcodeViewController:(id)a3 didGenerateEncryptedPasscode:(id)a4;
- (void)passcodeViewController:(id)a3 requestSessionExchangeToken:(id)a4;
- (void)passcodeViewControllerDidCancel:(id)a3;
- (void)passcodeViewControllerDidEndSessionExchange:(id)a3;
- (void)resetWithTransactionAuthenticationFailure:(int64_t)a3 completion:(id)a4;
- (void)setPassUniqueIdentifier:(id)a3 transactionIdentifier:(id)a4 archivedAnalyticsSessionToken:(id)a5 completionHandler:(id)a6;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation PKServiceTransactionAuthenticationPasscodeViewController

+ (id)_exportedInterface
{
  return (id)_PKServiceTransactionAuthenticationPasscodeViewControllerExportedInterface(a1, a2);
}

+ (id)_remoteViewControllerInterface
{
  return (id)_PKRemoteTransactionAuthenticationPasscodeViewControllerExportedInterface(a1, a2);
}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)_hostApplicationDidEnterBackground
{
  v4.receiver = self;
  v4.super_class = (Class)PKServiceTransactionAuthenticationPasscodeViewController;
  [(PKServiceTransactionAuthenticationPasscodeViewController *)&v4 _hostApplicationDidEnterBackground];
  v3 = [(PKServiceTransactionAuthenticationPasscodeViewController *)self _remoteViewControllerProxy];
  [v3 passcodeViewControllerDidCancel];
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKServiceTransactionAuthenticationPasscodeViewController;
  [(PKServiceTransactionAuthenticationPasscodeViewController *)&v5 viewWillAppear:a3];
  if (self->_archivedAnalyticsSessionToken)
  {
    +[PKAnalyticsReporter beginSubjectReporting:withArchivedParent:](PKAnalyticsReporter, "beginSubjectReporting:withArchivedParent:", PKAnalyticsSubjectSecureUIService);
    archivedAnalyticsSessionToken = self->_archivedAnalyticsSessionToken;
    self->_archivedAnalyticsSessionToken = 0;
  }
  else
  {
    +[PKAnalyticsReporter beginSubjectReporting:PKAnalyticsSubjectSecureUIService];
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)PKServiceTransactionAuthenticationPasscodeViewController;
  [(PKServiceTransactionAuthenticationPasscodeViewController *)&v3 viewDidDisappear:a3];
  +[PKAnalyticsReporter endSubjectReporting:PKAnalyticsSubjectSecureUIService];
}

- (void)setPassUniqueIdentifier:(id)a3 transactionIdentifier:(id)a4 archivedAnalyticsSessionToken:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if ([(PKServiceTransactionAuthenticationPasscodeViewController *)self _isHostProcessEntitled])
  {
    objc_storeStrong((id *)&self->_archivedAnalyticsSessionToken, a5);
    v14 = [[PKTransactionAuthenticationCollectPasscodeViewController alloc] initWithPassUniqueIdentifier:v10 transactionIdentifier:v11 delegate:self];
    collectPasscodeViewController = self->_collectPasscodeViewController;
    self->_collectPasscodeViewController = v14;

    objc_initWeak(location, self);
    v16 = self->_collectPasscodeViewController;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1000063CC;
    v18[3] = &unk_10000C610;
    objc_copyWeak(&v20, location);
    id v19 = v13;
    [(PKTransactionAuthenticationCollectPasscodeViewController *)v16 preflightWithCompletion:v18];

    objc_destroyWeak(&v20);
    objc_destroyWeak(location);
  }
  else
  {
    v17 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(location[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Host process is not entitled to request PIN view service.", (uint8_t *)location, 2u);
    }

    if (v13) {
      (*((void (**)(id, void))v13 + 2))(v13, 0);
    }
  }
}

- (void)resetWithTransactionAuthenticationFailure:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  v7 = v6;
  collectPasscodeViewController = self->_collectPasscodeViewController;
  if (collectPasscodeViewController)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100006670;
    v9[3] = &unk_10000C638;
    id v10 = v6;
    [(PKTransactionAuthenticationCollectPasscodeViewController *)collectPasscodeViewController resetWithTransactionAuthenticationFailure:a3 completion:v9];
  }
  else if (v6)
  {
    (*((void (**)(id, void))v6 + 2))(v6, 0);
  }
}

- (BOOL)_isHostProcessEntitled
{
  [(PKServiceTransactionAuthenticationPasscodeViewController *)self _hostAuditToken];
  v2 = SecTaskCreateWithAuditToken(0, &v7);
  if (!v2) {
    return 0;
  }
  objc_super v3 = v2;
  objc_super v4 = (void *)SecTaskCopyValueForEntitlement(v2, PKTransactionAuthenticationSecureUIServiceAccess, 0);
  unsigned __int8 v5 = [v4 BOOLValue];
  CFRelease(v3);

  return v5;
}

- (void)passcodeViewController:(id)a3 requestSessionExchangeToken:(id)a4
{
  id v5 = a4;
  id v6 = [(PKServiceTransactionAuthenticationPasscodeViewController *)self _remoteViewControllerProxy];
  [v6 passcodeViewControllerRequestSessionExchangeTokenWithHandler:v5];
}

- (void)passcodeViewControllerDidEndSessionExchange:(id)a3
{
  id v3 = [(PKServiceTransactionAuthenticationPasscodeViewController *)self _remoteViewControllerProxy];
  [v3 passcodeViewControllerDidEndSessionExchange];
}

- (void)passcodeViewControllerDidCancel:(id)a3
{
  id v3 = [(PKServiceTransactionAuthenticationPasscodeViewController *)self _remoteViewControllerProxy];
  [v3 passcodeViewControllerDidCancel];
}

- (void)passcodeViewController:(id)a3 didGenerateEncryptedPasscode:(id)a4
{
  id v5 = a4;
  id v6 = [(PKServiceTransactionAuthenticationPasscodeViewController *)self _remoteViewControllerProxy];
  [v6 passcodeViewControllerDidGenerateEncryptedPasscode:v5];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_archivedAnalyticsSessionToken, 0);

  objc_storeStrong((id *)&self->_collectPasscodeViewController, 0);
}

@end