@interface ServiceProductPageViewController
+ (BOOL)_shouldForwardViewWillTransitionToSize;
+ (id)_exportedInterface;
+ (id)_remoteViewControllerInterface;
- (BOOL)_isClientEntitled;
- (BOOL)_shouldLayoutAsOverlayWithTraitCollection:(id)a3;
- (BOOL)isAskToBuy;
- (BOOL)isRemoteViewControllerReady;
- (NSCopying)extensionRequest;
- (NSExtension)extension;
- (NSMutableArray)configurationActions;
- (NSNumber)desiredPresentationStyle;
- (NSNumber)visibleInClientWindow;
- (NSString)hostApplicationBundleIdentifierOverride;
- (ServiceCardContainerViewController)cardContainerViewController;
- (ServiceProductPageViewController)init;
- (ServiceResilientRemoteViewContainerViewController)remoteContainerViewController;
- (UINavigationController)placeholderViewController;
- (UIViewController)errorViewController;
- (id)_hostApplicationBundleIdentifier;
- (id)_setupErrorViewController;
- (id)_setupProductPageViewController;
- (id)remoteLoadDidFinishCompletion;
- (void)_addConfigurationAction:(id)a3;
- (void)_cancelButtonAction:(id)a3;
- (void)_cleanUpExtension;
- (void)_didReceiveRemoteViewController:(id)a3 forItem:(id)a4 withParameters:(id)a5;
- (void)_executeConfigurationActionsWithServiceProductPage:(id)a3;
- (void)_loadProductWithIdentifier:(id)a3 parameters:(id)a4;
- (void)_loadProductWithIdentifier:(id)a3 parameters:(id)a4 completion:(id)a5;
- (void)_lookupItemWithIdentifier:(id)a3 success:(id)a4 failure:(id)a5;
- (void)_makeItemKindEventForItem:(id)a3 extension:(id)a4;
- (void)_requestRemoteViewControllerForItem:(id)a3 withParameters:(id)a4 completion:(id)a5;
- (void)_respondWithSuccess:(BOOL)a3;
- (void)_sendDidFinishWithResult:(int64_t)a3;
- (void)_sendUnentitledErrorResponse;
- (void)_setupChildViewController:(id)a3 animated:(BOOL)a4;
- (void)_showLegacyControllerForProductID:(id)a3 parameters:(id)a4;
- (void)_willAppearInRemoteViewController;
- (void)dealloc;
- (void)dismissViewControllerAnimated:(id)a3;
- (void)finishImmediately;
- (void)finishStarRatingPromptWithRating:(id)a3;
- (void)loadPlaceholder;
- (void)loadProductWithPageDictionary:(id)a3;
- (void)loadProductWithParameters:(id)a3;
- (void)loadProductWithRequest:(id)a3;
- (void)loadProductWithURL:(id)a3;
- (void)loadView;
- (void)presentationControllerDidDismiss:(id)a3;
- (void)productPageRemoteViewController:(id)a3 didTerminateWithError:(id)a4;
- (void)productPageRemoteViewController:(id)a3 finishWithResult:(unint64_t)a4 completion:(id)a5;
- (void)productPageRemoteViewController:(id)a3 userDidInteractWithProduct:(unint64_t)a4;
- (void)productPageRemoteViewControllerLoadDidFinish:(id)a3;
- (void)serviceProductPageViewControllerFinishWithResult:(int64_t)a3;
- (void)setAdditionalBuyParameters:(id)a3;
- (void)setAffiliateIdentifier:(id)a3;
- (void)setAskToBuy:(id)a3;
- (void)setCancelButtonTitle:(id)a3;
- (void)setCardContainerViewController:(id)a3;
- (void)setClientIdentifier:(id)a3;
- (void)setConfigurationActions:(id)a3;
- (void)setDesiredPresentationStyle:(id)a3;
- (void)setErrorViewController:(id)a3;
- (void)setExtension:(id)a3;
- (void)setExtensionRequest:(id)a3;
- (void)setHostApplicationBundleIdentifierOverride:(id)a3;
- (void)setHostBundleIdentifier:(id)a3;
- (void)setIsAskToBuy:(BOOL)a3;
- (void)setIsRemoteViewControllerReady:(BOOL)a3;
- (void)setPlaceholderViewController:(id)a3;
- (void)setPresentationStyle:(id)a3;
- (void)setPreview:(id)a3;
- (void)setProductPageStyle:(id)a3;
- (void)setPromptString:(id)a3;
- (void)setRemoteContainerViewController:(id)a3;
- (void)setRemoteLoadDidFinishCompletion:(id)a3;
- (void)setRightBarButtonTitle:(id)a3;
- (void)setScriptContextDictionary:(id)a3;
- (void)setShowsRightBarButton:(id)a3;
- (void)setShowsStoreButton:(id)a3;
- (void)setUsageContext:(id)a3;
- (void)setVisibleInClientWindow:(id)a3;
- (void)showErrorPageWithCompletion:(id)a3;
- (void)showPageForLookupResult:(id)a3 productID:(id)a4 parameters:(id)a5 logKey:(id)a6 completion:(id)a7;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4;
@end

@implementation ServiceProductPageViewController

+ (id)_exportedInterface
{
  return +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___SKUIServiceProductPageViewController];
}

+ (id)_remoteViewControllerInterface
{
  return +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___SKUIClientProductPageViewController];
}

+ (BOOL)_shouldForwardViewWillTransitionToSize
{
  return 1;
}

- (ServiceProductPageViewController)init
{
  v13.receiver = self;
  v13.super_class = (Class)ServiceProductPageViewController;
  v2 = [(ServiceProductPageViewController *)&v13 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    configurationActions = v2->_configurationActions;
    v2->_configurationActions = v3;

    v5 = objc_alloc_init(ServiceCardContainerViewController);
    cardContainerViewController = v2->_cardContainerViewController;
    v2->_cardContainerViewController = v5;

    v7 = +[NSUUID UUID];
    v8 = [v7 UUIDString];
    v9 = [v8 componentsSeparatedByString:@"-"];
    uint64_t v10 = [v9 firstObject];
    logKey = v2->_logKey;
    v2->_logKey = (NSString *)v10;
  }
  return v2;
}

- (void)dealloc
{
  v3 = +[SSLogConfig sharedConfig];
  unsigned int v4 = [v3 shouldLog];
  if ([v3 shouldLogToDisk]) {
    int v5 = v4 | 2;
  }
  else {
    int v5 = v4;
  }
  v6 = [v3 OSLogObject];
  if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
    v5 &= 2u;
  }
  if (!v5) {
    goto LABEL_9;
  }
  v7 = objc_opt_class();
  logKey = self->_logKey;
  int v13 = 138543618;
  v14 = v7;
  __int16 v15 = 2114;
  v16 = logKey;
  id v9 = v7;
  LODWORD(v11) = 22;
  uint64_t v10 = (void *)_os_log_send_and_compose_impl();

  if (v10)
  {
    v6 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v10, 4, &v13, v11);
    free(v10);
    SSFileLog();
LABEL_9:
  }
  [(ServiceProductPageViewController *)self _cleanUpExtension];
  v12.receiver = self;
  v12.super_class = (Class)ServiceProductPageViewController;
  [(ServiceProductPageViewController *)&v12 dealloc];
}

- (void)loadView
{
  id v4 = objc_alloc_init((Class)UIView);
  [v4 setAutoresizingMask:40];
  [(ServiceProductPageViewController *)self setView:v4];
  v3 = [(ServiceProductPageViewController *)self errorViewController];

  if (!v3) {
    [(ServiceProductPageViewController *)self loadPlaceholder];
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v19.receiver = self;
  v19.super_class = (Class)ServiceProductPageViewController;
  [(ServiceProductPageViewController *)&v19 viewDidAppear:a3];
  id v4 = [(ServiceProductPageViewController *)self view];
  int v5 = [v4 window];
  v6 = [v5 _rootSheetPresentationController];
  [v6 _setShouldScaleDownBehindDescendantSheets:0];

  v7 = [(ServiceProductPageViewController *)self desiredPresentationStyle];

  if (v7)
  {
    v8 = [(ServiceProductPageViewController *)self desiredPresentationStyle];
    id v9 = [v8 integerValue];
    uint64_t v10 = [(ServiceProductPageViewController *)self cardContainerViewController];
    [v10 setModalPresentationStyle:v9];
  }
  else
  {
    if (self->_preview) {
      uint64_t v11 = 0;
    }
    else {
      uint64_t v11 = -2;
    }
    v8 = [(ServiceProductPageViewController *)self cardContainerViewController];
    [v8 setModalPresentationStyle:v11];
  }

  objc_super v12 = [(ServiceProductPageViewController *)self cardContainerViewController];
  int v13 = [v12 presentationController];

  [v13 setDelegate:self];
  uint64_t v14 = [(ServiceProductPageViewController *)self cardContainerViewController];
  if (v14)
  {
    __int16 v15 = (void *)v14;
    v16 = [(ServiceProductPageViewController *)self cardContainerViewController];
    v17 = [v16 presentingViewController];

    if (!v17)
    {
      v18 = [(ServiceProductPageViewController *)self cardContainerViewController];
      [(ServiceProductPageViewController *)self presentViewController:v18 animated:!self->_preview completion:0];
    }
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = +[NSNotificationCenter defaultCenter];
  [v5 postNotificationName:SKUIVideoPreviewDismissNotification object:0];

  uint64_t v6 = [(ServiceProductPageViewController *)self cardContainerViewController];
  if (v6)
  {
    v7 = (void *)v6;
    v8 = [(ServiceProductPageViewController *)self cardContainerViewController];
    id v9 = [v8 presentingViewController];

    if (v9)
    {
      uint64_t v10 = [(ServiceProductPageViewController *)self cardContainerViewController];
      [v10 dismissViewControllerAnimated:1 completion:0];
    }
  }
  v11.receiver = self;
  v11.super_class = (Class)ServiceProductPageViewController;
  [(ServiceProductPageViewController *)&v11 viewDidDisappear:v3];
}

- (void)viewWillAppear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)ServiceProductPageViewController;
  [(ServiceProductPageViewController *)&v3 viewWillAppear:a3];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)ServiceProductPageViewController;
  [(ServiceProductPageViewController *)&v3 viewWillDisappear:a3];
}

- (void)presentationControllerDidDismiss:(id)a3
{
}

- (void)_willAppearInRemoteViewController
{
  objc_super v3 = [(ServiceProductPageViewController *)self _hostApplicationBundleIdentifier];
  unsigned int v4 = [(ServiceProductPageViewController *)self _isClientEntitled];
  int v5 = +[SSLogConfig sharedConfig];
  unsigned int v6 = [v5 shouldLog];
  if ([v5 shouldLogToDisk]) {
    int v7 = v6 | 2;
  }
  else {
    int v7 = v6;
  }
  v8 = [v5 OSLogObject];
  if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    v7 &= 2u;
  }
  if (v7)
  {
    id v9 = objc_opt_class();
    logKey = self->_logKey;
    *(_DWORD *)location = 138544130;
    *(void *)&location[4] = v9;
    __int16 v25 = 2114;
    v26 = logKey;
    __int16 v27 = 2112;
    v28 = v3;
    __int16 v29 = 1024;
    unsigned int v30 = v4;
    id v11 = v9;
    LODWORD(v19) = 38;
    objc_super v12 = (void *)_os_log_send_and_compose_impl();

    if (v12)
    {
      int v13 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v12, 4, location, v19);
      free(v12);
      SSFileLog();
    }
  }
  else
  {
  }
  uint64_t v14 = +[LSApplicationProxy applicationProxyForIdentifier:v3];
  unsigned int v15 = [v14 profileValidated];
  objc_initWeak((id *)location, self);
  id v16 = [(NSString *)self->_logKey copy];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10001C6A4;
  v21[3] = &unk_10004D760;
  objc_copyWeak(v23, (id *)location);
  v17 = (void *)v15;
  id v18 = v16;
  id v22 = v18;
  v23[1] = v17;
  [(ServiceProductPageViewController *)self _addConfigurationAction:v21];
  v20.receiver = self;
  v20.super_class = (Class)ServiceProductPageViewController;
  [(ServiceProductPageViewController *)&v20 _willAppearInRemoteViewController];

  objc_destroyWeak(v23);
  objc_destroyWeak((id *)location);
}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  v4.receiver = self;
  v4.super_class = (Class)ServiceProductPageViewController;
  [(ServiceProductPageViewController *)&v4 willTransitionToTraitCollection:a3 withTransitionCoordinator:a4];
}

- (void)productPageRemoteViewController:(id)a3 finishWithResult:(unint64_t)a4 completion:(id)a5
{
  if (a4 > 3) {
    uint64_t v5 = 1;
  }
  else {
    uint64_t v5 = qword_100038BA8[a4];
  }
  [(ServiceProductPageViewController *)self _sendDidFinishWithResult:v5];
}

- (void)productPageRemoteViewControllerLoadDidFinish:(id)a3
{
  uint64_t v5 = [(ServiceProductPageViewController *)self remoteContainerViewController];
  unsigned int v6 = [v5 remoteViewController];
  int v7 = [(ServiceProductPageViewController *)self cardContainerViewController];
  [v7 setRemoteViewController:v6];

  v8 = [(ServiceProductPageViewController *)self remoteContainerViewController];
  [(ServiceProductPageViewController *)self _setupChildViewController:v8 animated:0];

  id v9 = [(ServiceProductPageViewController *)self remoteLoadDidFinishCompletion];
  if (v9)
  {
    uint64_t v10 = v9;
    [(ServiceProductPageViewController *)self setRemoteLoadDidFinishCompletion:0];
    v10[2](v10, a3 == 0);
    id v9 = v10;
    if (!a3)
    {
      [(ServiceProductPageViewController *)self _cleanUpExtension];
      id v9 = v10;
    }
  }
}

- (void)productPageRemoteViewController:(id)a3 userDidInteractWithProduct:(unint64_t)a4
{
  id v6 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    logKey = self->_logKey;
    int v10 = 138543618;
    id v11 = self;
    __int16 v12 = 2114;
    int v13 = logKey;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[%{public}@][%{public}@]: Product page user did interact with product.", (uint8_t *)&v10, 0x16u);
  }
  if (a4 >= 3)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10002DC2C((uint64_t)self, a4);
    }
  }
  else if ([(ServiceProductPageViewController *)self _isClientEntitled])
  {
    v8 = [(ServiceProductPageViewController *)self _clientViewControllerProxy];
    id v9 = +[NSNumber numberWithUnsignedInteger:a4];
    [v8 userDidInteractWithProduct:v9];
  }
}

- (void)productPageRemoteViewController:(id)a3 didTerminateWithError:(id)a4
{
  id v5 = a3;
  id v6 = [(ServiceProductPageViewController *)self remoteContainerViewController];
  id v7 = [v6 remoteViewController];

  if (v7 == v5)
  {
    [(ServiceProductPageViewController *)self _sendDidFinishWithResult:1];
  }
}

- (void)finishImmediately
{
  if ([(ServiceProductPageViewController *)self _isClientEntitled])
  {
    [(ServiceProductPageViewController *)self _addConfigurationAction:&stru_10004D7A0];
  }
  else
  {
    [(ServiceProductPageViewController *)self _sendUnentitledErrorResponse];
  }
}

- (void)dismissViewControllerAnimated:(id)a3
{
  id v4 = a3;
  id v5 = [(ServiceProductPageViewController *)self cardContainerViewController];
  id v6 = [v4 BOOLValue];

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001CD00;
  v7[3] = &unk_10004CEB0;
  v7[4] = self;
  [v5 dismissViewControllerAnimated:v6 completion:v7];
}

- (void)finishStarRatingPromptWithRating:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10001CDD8;
  v5[3] = &unk_10004D7C8;
  id v6 = a3;
  id v4 = v6;
  [(ServiceProductPageViewController *)self _addConfigurationAction:v5];
}

- (void)loadPlaceholder
{
  if (!self->_isRemoteViewControllerReady && !self->_storeProductViewController)
  {
    id v3 = [objc_alloc((Class)SKUILoadingViewController) initWithClientContext:0];
    dispatch_time_t v4 = dispatch_time(0, 3000000000);
    id v9 = _NSConcreteStackBlock;
    uint64_t v10 = 3221225472;
    id v11 = sub_10001CF20;
    __int16 v12 = &unk_10004D2C0;
    int v13 = self;
    id v14 = v3;
    id v5 = v3;
    dispatch_after(v4, (dispatch_queue_t)&_dispatch_main_q, &v9);
    id v6 = objc_alloc((Class)UINavigationController);
    id v7 = [v6 initWithRootViewController:v5, v9, v10, v11, v12, v13];
    v8 = [v7 navigationBar];
    [v8 setAccessibilityIgnoresInvertColors:1];

    [(ServiceProductPageViewController *)self setPlaceholderViewController:v7];
    [(ServiceProductPageViewController *)self _setupChildViewController:v7 animated:0];
  }
}

- (void)loadProductWithPageDictionary:(id)a3
{
  id v4 = a3;
  if ([(ServiceProductPageViewController *)self _isClientEntitled])
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_10001D0EC;
    v5[3] = &unk_10004D7C8;
    id v6 = v4;
    [(ServiceProductPageViewController *)self _addConfigurationAction:v5];
  }
  else
  {
    [(ServiceProductPageViewController *)self _sendUnentitledErrorResponse];
  }
}

- (void)loadProductWithParameters:(id)a3
{
  id v4 = a3;
  id v5 = +[SSLogConfig sharedConfig];
  unsigned int v6 = [v5 shouldLog];
  if ([v5 shouldLogToDisk]) {
    int v7 = v6 | 2;
  }
  else {
    int v7 = v6;
  }
  v8 = [v5 OSLogObject];
  if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
    v7 &= 2u;
  }
  if (v7)
  {
    id v9 = objc_opt_class();
    logKey = self->_logKey;
    *(_DWORD *)v17 = 138543874;
    *(void *)&v17[4] = v9;
    *(_WORD *)&v17[12] = 2114;
    *(void *)&v17[14] = logKey;
    *(_WORD *)&v17[22] = 2112;
    id v18 = v4;
    id v11 = v9;
    LODWORD(v16) = 32;
    unsigned int v15 = v17;
    __int16 v12 = (void *)_os_log_send_and_compose_impl();

    if (!v12) {
      goto LABEL_10;
    }
    v8 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v12, 4, v17, v16, *(_OWORD *)v17, *(void *)&v17[16], v18);
    free(v12);
    unsigned int v15 = v8;
    SSFileLog();
  }

LABEL_10:
  int v13 = [v4 objectForKeyedSubscript:SKStoreProductParameterITunesItemIdentifier];
  if (v13
    && ((objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0) || [v13 length])
    && ((objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0) || [v13 integerValue]))
  {
    id v14 = [v4 mutableCopy];
    [v14 removeObjectForKey:SKStoreProductParameterITunesItemIdentifier];
    [(ServiceProductPageViewController *)self _loadProductWithIdentifier:v13 parameters:v14];
  }
  else
  {
    -[ServiceProductPageViewController _respondWithSuccess:](self, "_respondWithSuccess:", 0, v15);
  }
}

- (void)_loadProductWithIdentifier:(id)a3 parameters:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10001D458;
  v10[3] = &unk_10004D7F0;
  objc_copyWeak(&v13, &location);
  id v8 = v6;
  id v11 = v8;
  id v9 = v7;
  id v12 = v9;
  [(ServiceProductPageViewController *)self _loadProductWithIdentifier:v8 parameters:v9 completion:v10];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

- (void)_showLegacyControllerForProductID:(id)a3 parameters:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[SSLogConfig sharedConfig];
  unsigned int v9 = [v8 shouldLog];
  if ([v8 shouldLogToDisk]) {
    int v10 = v9 | 2;
  }
  else {
    int v10 = v9;
  }
  id v11 = [v8 OSLogObject];
  if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
    v10 &= 2u;
  }
  if (!v10) {
    goto LABEL_9;
  }
  id v12 = objc_opt_class();
  logKey = self->_logKey;
  *(_DWORD *)uint64_t v19 = 138543874;
  *(void *)&v19[4] = v12;
  *(_WORD *)&v19[12] = 2114;
  *(void *)&v19[14] = logKey;
  *(_WORD *)&v19[22] = 2114;
  id v20 = v6;
  id v14 = v12;
  LODWORD(v18) = 32;
  unsigned int v15 = (void *)_os_log_send_and_compose_impl();

  if (v15)
  {
    id v11 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v15, 4, v19, v18, *(_OWORD *)v19, *(void *)&v19[16], v20);
    free(v15);
    SSFileLog();
LABEL_9:
  }
  uint64_t v16 = [(ServiceProductPageViewController *)self _setupProductPageViewController];
  id v17 = [objc_alloc((Class)NSMutableDictionary) initWithDictionary:v7];

  [v17 setObject:v6 forKeyedSubscript:SKStoreProductParameterITunesItemIdentifier];
  [v16 loadProductWithParameters:v17];
}

- (void)loadProductWithRequest:(id)a3
{
  id v4 = a3;
  if ([(ServiceProductPageViewController *)self _isClientEntitled])
  {
    objc_initWeak(&location, self);
    id v5 = [(NSString *)self->_logKey copy];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10001D96C;
    v7[3] = &unk_10004D818;
    objc_copyWeak(&v10, &location);
    id v6 = v5;
    id v8 = v6;
    id v9 = v4;
    [(ServiceProductPageViewController *)self _addConfigurationAction:v7];

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
  else
  {
    [(ServiceProductPageViewController *)self _sendUnentitledErrorResponse];
  }
}

- (void)loadProductWithURL:(id)a3
{
  id v4 = a3;
  if ([(ServiceProductPageViewController *)self _isClientEntitled])
  {
    id v5 = [v4 lastPathComponent];
    id v6 = +[NSCharacterSet decimalDigitCharacterSet];
    id v7 = [v6 invertedSet];
    id v8 = [v5 stringByTrimmingCharactersInSet:v7];

    if (![v8 length])
    {
      [(ServiceProductPageViewController *)self _respondWithSuccess:0];
      goto LABEL_25;
    }
    id v9 = objc_alloc_init((Class)NSMutableDictionary);
    id v10 = +[NSURLComponents componentsWithURL:v4 resolvingAgainstBaseURL:1];
    id v11 = [v10 queryItems];
    id v12 = [v11 count];

    v33 = v10;
    if (v12)
    {
      long long v36 = 0u;
      long long v37 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      id v13 = [v10 queryItems];
      id v14 = [v13 countByEnumeratingWithState:&v34 objects:v46 count:16];
      if (v14)
      {
        id v15 = v14;
        uint64_t v16 = *(void *)v35;
        do
        {
          for (i = 0; i != v15; i = (char *)i + 1)
          {
            if (*(void *)v35 != v16) {
              objc_enumerationMutation(v13);
            }
            uint64_t v18 = *(void **)(*((void *)&v34 + 1) + 8 * i);
            uint64_t v19 = [v18 value];
            id v20 = [v18 name];
            [v9 setObject:v19 forKey:v20];
          }
          id v15 = [v13 countByEnumeratingWithState:&v34 objects:v46 count:16];
        }
        while (v15);
      }

      id v10 = v33;
    }
    v21 = +[SSLogConfig sharedConfig];
    unsigned int v22 = [v21 shouldLog];
    if ([v21 shouldLogToDisk]) {
      int v23 = v22 | 2;
    }
    else {
      int v23 = v22;
    }
    v24 = [v21 OSLogObject];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT)) {
      int v25 = v23;
    }
    else {
      int v25 = v23 & 2;
    }
    if (v25)
    {
      v26 = objc_opt_class();
      __int16 v27 = v8;
      logKey = self->_logKey;
      id v32 = v26;
      __int16 v29 = [v4 path];
      int v38 = 138544130;
      v39 = v26;
      id v10 = v33;
      __int16 v40 = 2114;
      v41 = logKey;
      id v8 = v27;
      __int16 v42 = 2112;
      v43 = v29;
      __int16 v44 = 2112;
      id v45 = v9;
      LODWORD(v31) = 42;
      unsigned int v30 = (void *)_os_log_send_and_compose_impl();

      if (!v30)
      {
LABEL_22:

        [(ServiceProductPageViewController *)self _loadProductWithIdentifier:v8 parameters:v9];
LABEL_25:

        goto LABEL_26;
      }
      v24 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v30, 4, &v38, v31);
      free(v30);
      SSFileLog();
    }

    goto LABEL_22;
  }
  [(ServiceProductPageViewController *)self _sendUnentitledErrorResponse];
LABEL_26:
}

- (void)setAdditionalBuyParameters:(id)a3
{
  id v4 = a3;
  if ([(ServiceProductPageViewController *)self _isClientEntitled])
  {
    id v5 = +[SSLogConfig sharedConfig];
    unsigned int v6 = [v5 shouldLog];
    if ([v5 shouldLogToDisk]) {
      int v7 = v6 | 2;
    }
    else {
      int v7 = v6;
    }
    id v8 = [v5 OSLogObject];
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      v7 &= 2u;
    }
    if (v7)
    {
      id v9 = objc_opt_class();
      logKey = self->_logKey;
      int v16 = 138543874;
      id v17 = v9;
      __int16 v18 = 2114;
      uint64_t v19 = logKey;
      __int16 v20 = 2112;
      id v21 = v4;
      id v11 = v9;
      LODWORD(v13) = 32;
      id v12 = (void *)_os_log_send_and_compose_impl();

      if (!v12)
      {
LABEL_11:

        v14[0] = _NSConcreteStackBlock;
        v14[1] = 3221225472;
        v14[2] = sub_10001E0E0;
        v14[3] = &unk_10004D7C8;
        id v15 = v4;
        [(ServiceProductPageViewController *)self _addConfigurationAction:v14];

        goto LABEL_12;
      }
      id v8 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v12, 4, &v16, v13);
      free(v12);
      SSFileLog();
    }

    goto LABEL_11;
  }
LABEL_12:
}

- (void)setAffiliateIdentifier:(id)a3
{
  id v4 = a3;
  if ([(ServiceProductPageViewController *)self _isClientEntitled])
  {
    id v5 = +[SSLogConfig sharedConfig];
    unsigned int v6 = [v5 shouldLog];
    if ([v5 shouldLogToDisk]) {
      int v7 = v6 | 2;
    }
    else {
      int v7 = v6;
    }
    id v8 = [v5 OSLogObject];
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      v7 &= 2u;
    }
    if (v7)
    {
      id v9 = objc_opt_class();
      logKey = self->_logKey;
      int v16 = 138543874;
      id v17 = v9;
      __int16 v18 = 2114;
      uint64_t v19 = logKey;
      __int16 v20 = 2112;
      id v21 = v4;
      id v11 = v9;
      LODWORD(v13) = 32;
      id v12 = (void *)_os_log_send_and_compose_impl();

      if (!v12)
      {
LABEL_11:

        v14[0] = _NSConcreteStackBlock;
        v14[1] = 3221225472;
        v14[2] = sub_10001E2F0;
        v14[3] = &unk_10004D7C8;
        id v15 = v4;
        [(ServiceProductPageViewController *)self _addConfigurationAction:v14];

        goto LABEL_12;
      }
      id v8 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v12, 4, &v16, v13);
      free(v12);
      SSFileLog();
    }

    goto LABEL_11;
  }
LABEL_12:
}

- (void)setAskToBuy:(id)a3
{
  id v4 = a3;
  if ([(ServiceProductPageViewController *)self _isClientEntitled])
  {
    id v5 = +[SSLogConfig sharedConfig];
    unsigned int v6 = [v5 shouldLog];
    if ([v5 shouldLogToDisk]) {
      int v7 = v6 | 2;
    }
    else {
      int v7 = v6;
    }
    id v8 = [v5 OSLogObject];
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      v7 &= 2u;
    }
    if (v7)
    {
      id v9 = objc_opt_class();
      logKey = self->_logKey;
      int v17 = 138543874;
      __int16 v18 = v9;
      __int16 v19 = 2114;
      __int16 v20 = logKey;
      __int16 v21 = 2112;
      id v22 = v4;
      id v11 = v9;
      LODWORD(v14) = 32;
      id v12 = (void *)_os_log_send_and_compose_impl();

      if (!v12)
      {
LABEL_11:

        v15[0] = _NSConcreteStackBlock;
        v15[1] = 3221225472;
        v15[2] = sub_10001E518;
        v15[3] = &unk_10004D7C8;
        id v13 = v4;
        id v16 = v13;
        [(ServiceProductPageViewController *)self _addConfigurationAction:v15];
        -[ServiceProductPageViewController setIsAskToBuy:](self, "setIsAskToBuy:", [v13 BOOLValue]);

        goto LABEL_12;
      }
      id v8 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v12, 4, &v17, v14);
      free(v12);
      SSFileLog();
    }

    goto LABEL_11;
  }
LABEL_12:
}

- (void)setCancelButtonTitle:(id)a3
{
  id v4 = a3;
  if ([(ServiceProductPageViewController *)self _isClientEntitled])
  {
    id v5 = +[SSLogConfig sharedConfig];
    unsigned int v6 = [v5 shouldLog];
    if ([v5 shouldLogToDisk]) {
      int v7 = v6 | 2;
    }
    else {
      int v7 = v6;
    }
    id v8 = [v5 OSLogObject];
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      v7 &= 2u;
    }
    if (v7)
    {
      id v9 = objc_opt_class();
      logKey = self->_logKey;
      int v16 = 138543874;
      int v17 = v9;
      __int16 v18 = 2114;
      __int16 v19 = logKey;
      __int16 v20 = 2112;
      id v21 = v4;
      id v11 = v9;
      LODWORD(v13) = 32;
      id v12 = (void *)_os_log_send_and_compose_impl();

      if (!v12)
      {
LABEL_11:

        v14[0] = _NSConcreteStackBlock;
        v14[1] = 3221225472;
        v14[2] = sub_10001E774;
        v14[3] = &unk_10004D7C8;
        id v15 = v4;
        [(ServiceProductPageViewController *)self _addConfigurationAction:v14];

        goto LABEL_12;
      }
      id v8 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v12, 4, &v16, v13);
      free(v12);
      SSFileLog();
    }

    goto LABEL_11;
  }
LABEL_12:
}

- (void)setClientIdentifier:(id)a3
{
  id v4 = a3;
  if ([(ServiceProductPageViewController *)self _isClientEntitled])
  {
    id v5 = +[SSLogConfig sharedConfig];
    unsigned int v6 = [v5 shouldLog];
    if ([v5 shouldLogToDisk]) {
      int v7 = v6 | 2;
    }
    else {
      int v7 = v6;
    }
    id v8 = [v5 OSLogObject];
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      v7 &= 2u;
    }
    if (v7)
    {
      id v9 = objc_opt_class();
      logKey = self->_logKey;
      int v16 = 138543874;
      int v17 = v9;
      __int16 v18 = 2114;
      __int16 v19 = logKey;
      __int16 v20 = 2112;
      id v21 = v4;
      id v11 = v9;
      LODWORD(v13) = 32;
      id v12 = (void *)_os_log_send_and_compose_impl();

      if (!v12)
      {
LABEL_11:

        v14[0] = _NSConcreteStackBlock;
        v14[1] = 3221225472;
        v14[2] = sub_10001E984;
        v14[3] = &unk_10004D7C8;
        id v15 = v4;
        [(ServiceProductPageViewController *)self _addConfigurationAction:v14];

        goto LABEL_12;
      }
      id v8 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v12, 4, &v16, v13);
      free(v12);
      SSFileLog();
    }

    goto LABEL_11;
  }
LABEL_12:
}

- (void)setHostBundleIdentifier:(id)a3
{
  id v5 = a3;
  if ([(ServiceProductPageViewController *)self _isClientEntitled])
  {
    unsigned int v6 = +[SSLogConfig sharedConfig];
    unsigned int v7 = [v6 shouldLog];
    if ([v6 shouldLogToDisk]) {
      int v8 = v7 | 2;
    }
    else {
      int v8 = v7;
    }
    id v9 = [v6 OSLogObject];
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      v8 &= 2u;
    }
    if (v8)
    {
      id v10 = objc_opt_class();
      logKey = self->_logKey;
      *(_DWORD *)id v15 = 138543874;
      *(void *)&void v15[4] = v10;
      *(_WORD *)&v15[12] = 2114;
      *(void *)&v15[14] = logKey;
      *(_WORD *)&v15[22] = 2112;
      id v16 = v5;
      id v12 = v10;
      LODWORD(v14) = 32;
      uint64_t v13 = (void *)_os_log_send_and_compose_impl();

      if (!v13)
      {
LABEL_11:

        objc_storeStrong((id *)&self->_hostApplicationBundleIdentifierOverride, a3);
        goto LABEL_12;
      }
      id v9 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v13, 4, v15, v14, *(_OWORD *)v15, *(void *)&v15[16], v16);
      free(v13);
      SSFileLog();
    }

    goto LABEL_11;
  }
LABEL_12:
}

- (void)setProductPageStyle:(id)a3
{
  id v4 = a3;
  if ([(ServiceProductPageViewController *)self _isClientEntitled])
  {
    id v5 = +[SSLogConfig sharedConfig];
    unsigned int v6 = [v5 shouldLog];
    if ([v5 shouldLogToDisk]) {
      int v7 = v6 | 2;
    }
    else {
      int v7 = v6;
    }
    int v8 = [v5 OSLogObject];
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      v7 &= 2u;
    }
    if (v7)
    {
      id v9 = objc_opt_class();
      logKey = self->_logKey;
      int v16 = 138543874;
      int v17 = v9;
      __int16 v18 = 2114;
      __int16 v19 = logKey;
      __int16 v20 = 2112;
      id v21 = v4;
      id v11 = v9;
      LODWORD(v13) = 32;
      id v12 = (void *)_os_log_send_and_compose_impl();

      if (!v12)
      {
LABEL_11:

        v14[0] = _NSConcreteStackBlock;
        v14[1] = 3221225472;
        v14[2] = sub_10001ED58;
        v14[3] = &unk_10004D7C8;
        id v15 = v4;
        [(ServiceProductPageViewController *)self _addConfigurationAction:v14];

        goto LABEL_12;
      }
      int v8 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v12, 4, &v16, v13);
      free(v12);
      SSFileLog();
    }

    goto LABEL_11;
  }
LABEL_12:
}

- (void)setPromptString:(id)a3
{
  id v4 = a3;
  if ([(ServiceProductPageViewController *)self _isClientEntitled])
  {
    id v5 = +[SSLogConfig sharedConfig];
    unsigned int v6 = [v5 shouldLog];
    if ([v5 shouldLogToDisk]) {
      int v7 = v6 | 2;
    }
    else {
      int v7 = v6;
    }
    int v8 = [v5 OSLogObject];
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      v7 &= 2u;
    }
    if (v7)
    {
      id v9 = objc_opt_class();
      logKey = self->_logKey;
      int v16 = 138543874;
      int v17 = v9;
      __int16 v18 = 2114;
      __int16 v19 = logKey;
      __int16 v20 = 2112;
      id v21 = v4;
      id v11 = v9;
      LODWORD(v13) = 32;
      id v12 = (void *)_os_log_send_and_compose_impl();

      if (!v12)
      {
LABEL_11:

        v14[0] = _NSConcreteStackBlock;
        v14[1] = 3221225472;
        v14[2] = sub_10001EF68;
        v14[3] = &unk_10004D7C8;
        id v15 = v4;
        [(ServiceProductPageViewController *)self _addConfigurationAction:v14];

        goto LABEL_12;
      }
      int v8 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v12, 4, &v16, v13);
      free(v12);
      SSFileLog();
    }

    goto LABEL_11;
  }
LABEL_12:
}

- (void)setRightBarButtonTitle:(id)a3
{
  id v4 = a3;
  if ([(ServiceProductPageViewController *)self _isClientEntitled])
  {
    id v5 = +[SSLogConfig sharedConfig];
    unsigned int v6 = [v5 shouldLog];
    if ([v5 shouldLogToDisk]) {
      int v7 = v6 | 2;
    }
    else {
      int v7 = v6;
    }
    int v8 = [v5 OSLogObject];
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      v7 &= 2u;
    }
    if (v7)
    {
      id v9 = objc_opt_class();
      logKey = self->_logKey;
      int v16 = 138543874;
      int v17 = v9;
      __int16 v18 = 2114;
      __int16 v19 = logKey;
      __int16 v20 = 2112;
      id v21 = v4;
      id v11 = v9;
      LODWORD(v13) = 32;
      id v12 = (void *)_os_log_send_and_compose_impl();

      if (!v12)
      {
LABEL_11:

        v14[0] = _NSConcreteStackBlock;
        v14[1] = 3221225472;
        v14[2] = sub_10001F178;
        v14[3] = &unk_10004D7C8;
        id v15 = v4;
        [(ServiceProductPageViewController *)self _addConfigurationAction:v14];

        goto LABEL_12;
      }
      int v8 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v12, 4, &v16, v13);
      free(v12);
      SSFileLog();
    }

    goto LABEL_11;
  }
LABEL_12:
}

- (void)setScriptContextDictionary:(id)a3
{
  id v4 = a3;
  if ([(ServiceProductPageViewController *)self _isClientEntitled])
  {
    id v5 = +[SSLogConfig sharedConfig];
    unsigned int v6 = [v5 shouldLog];
    if ([v5 shouldLogToDisk]) {
      int v7 = v6 | 2;
    }
    else {
      int v7 = v6;
    }
    int v8 = [v5 OSLogObject];
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      v7 &= 2u;
    }
    if (v7)
    {
      id v9 = objc_opt_class();
      logKey = self->_logKey;
      int v16 = 138543874;
      int v17 = v9;
      __int16 v18 = 2114;
      __int16 v19 = logKey;
      __int16 v20 = 2112;
      id v21 = v4;
      id v11 = v9;
      LODWORD(v13) = 32;
      id v12 = (void *)_os_log_send_and_compose_impl();

      if (!v12)
      {
LABEL_11:

        v14[0] = _NSConcreteStackBlock;
        v14[1] = 3221225472;
        v14[2] = sub_10001F388;
        v14[3] = &unk_10004D7C8;
        id v15 = v4;
        [(ServiceProductPageViewController *)self _addConfigurationAction:v14];

        goto LABEL_12;
      }
      int v8 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v12, 4, &v16, v13);
      free(v12);
      SSFileLog();
    }

    goto LABEL_11;
  }
LABEL_12:
}

- (void)setPreview:(id)a3
{
  id v4 = a3;
  id v5 = +[SSLogConfig sharedConfig];
  unsigned int v6 = [v5 shouldLog];
  if ([v5 shouldLogToDisk]) {
    int v7 = v6 | 2;
  }
  else {
    int v7 = v6;
  }
  int v8 = [v5 OSLogObject];
  if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    v7 &= 2u;
  }
  if (!v7) {
    goto LABEL_9;
  }
  id v9 = objc_opt_class();
  logKey = self->_logKey;
  int v17 = 138543874;
  __int16 v18 = v9;
  __int16 v19 = 2114;
  __int16 v20 = logKey;
  __int16 v21 = 2112;
  id v22 = v4;
  id v11 = v9;
  LODWORD(v14) = 32;
  id v12 = (void *)_os_log_send_and_compose_impl();

  if (v12)
  {
    int v8 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v12, 4, &v17, v14);
    free(v12);
    SSFileLog();
LABEL_9:
  }
  self->_preview = [v4 BOOLValue];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10001F5A4;
  v15[3] = &unk_10004D7C8;
  id v16 = v4;
  id v13 = v4;
  [(ServiceProductPageViewController *)self _addConfigurationAction:v15];
}

- (void)setPresentationStyle:(id)a3
{
  id v4 = a3;
  id v5 = +[SSLogConfig sharedConfig];
  unsigned int v6 = [v5 shouldLog];
  if ([v5 shouldLogToDisk]) {
    int v7 = v6 | 2;
  }
  else {
    int v7 = v6;
  }
  int v8 = [v5 OSLogObject];
  if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    v7 &= 2u;
  }
  if (!v7) {
    goto LABEL_9;
  }
  id v9 = objc_opt_class();
  logKey = self->_logKey;
  *(_DWORD *)uint64_t v14 = 138543874;
  *(void *)&void v14[4] = v9;
  *(_WORD *)&v14[12] = 2114;
  *(void *)&v14[14] = logKey;
  *(_WORD *)&v14[22] = 2112;
  id v15 = v4;
  id v11 = v9;
  LODWORD(v13) = 32;
  id v12 = (void *)_os_log_send_and_compose_impl();

  if (v12)
  {
    int v8 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v12, 4, v14, v13, *(_OWORD *)v14, *(void *)&v14[16], v15);
    free(v12);
    SSFileLog();
LABEL_9:
  }
  [(ServiceProductPageViewController *)self setDesiredPresentationStyle:v4];
}

- (void)setUsageContext:(id)a3
{
  id v4 = a3;
  if ([(ServiceProductPageViewController *)self _isClientEntitled])
  {
    id v5 = +[SSLogConfig sharedConfig];
    unsigned int v6 = [v5 shouldLog];
    if ([v5 shouldLogToDisk]) {
      int v7 = v6 | 2;
    }
    else {
      int v7 = v6;
    }
    int v8 = [v5 OSLogObject];
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      v7 &= 2u;
    }
    if (v7)
    {
      id v9 = objc_opt_class();
      logKey = self->_logKey;
      int v16 = 138543874;
      int v17 = v9;
      __int16 v18 = 2114;
      __int16 v19 = logKey;
      __int16 v20 = 2112;
      id v21 = v4;
      id v11 = v9;
      LODWORD(v13) = 32;
      id v12 = (void *)_os_log_send_and_compose_impl();

      if (!v12)
      {
LABEL_11:

        v14[0] = _NSConcreteStackBlock;
        v14[1] = 3221225472;
        v14[2] = sub_10001F958;
        v14[3] = &unk_10004D7C8;
        id v15 = v4;
        [(ServiceProductPageViewController *)self _addConfigurationAction:v14];

        goto LABEL_12;
      }
      int v8 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v12, 4, &v16, v13);
      free(v12);
      SSFileLog();
    }

    goto LABEL_11;
  }
LABEL_12:
}

- (void)setShowsRightBarButton:(id)a3
{
  id v4 = a3;
  if ([(ServiceProductPageViewController *)self _isClientEntitled])
  {
    id v5 = +[SSLogConfig sharedConfig];
    unsigned int v6 = [v5 shouldLog];
    if ([v5 shouldLogToDisk]) {
      int v7 = v6 | 2;
    }
    else {
      int v7 = v6;
    }
    int v8 = [v5 OSLogObject];
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      v7 &= 2u;
    }
    if (v7)
    {
      id v9 = objc_opt_class();
      logKey = self->_logKey;
      int v16 = 138543874;
      int v17 = v9;
      __int16 v18 = 2114;
      __int16 v19 = logKey;
      __int16 v20 = 2112;
      id v21 = v4;
      id v11 = v9;
      LODWORD(v13) = 32;
      id v12 = (void *)_os_log_send_and_compose_impl();

      if (!v12)
      {
LABEL_11:

        v14[0] = _NSConcreteStackBlock;
        v14[1] = 3221225472;
        v14[2] = sub_10001FB68;
        v14[3] = &unk_10004D7C8;
        id v15 = v4;
        [(ServiceProductPageViewController *)self _addConfigurationAction:v14];

        goto LABEL_12;
      }
      int v8 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v12, 4, &v16, v13);
      free(v12);
      SSFileLog();
    }

    goto LABEL_11;
  }
LABEL_12:
}

- (void)setShowsStoreButton:(id)a3
{
  id v4 = a3;
  if ([(ServiceProductPageViewController *)self _isClientEntitled])
  {
    id v5 = +[SSLogConfig sharedConfig];
    unsigned int v6 = [v5 shouldLog];
    if ([v5 shouldLogToDisk]) {
      int v7 = v6 | 2;
    }
    else {
      int v7 = v6;
    }
    int v8 = [v5 OSLogObject];
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      v7 &= 2u;
    }
    if (v7)
    {
      id v9 = objc_opt_class();
      logKey = self->_logKey;
      int v16 = 138543874;
      int v17 = v9;
      __int16 v18 = 2114;
      __int16 v19 = logKey;
      __int16 v20 = 2112;
      id v21 = v4;
      id v11 = v9;
      LODWORD(v13) = 32;
      id v12 = (void *)_os_log_send_and_compose_impl();

      if (!v12)
      {
LABEL_11:

        v14[0] = _NSConcreteStackBlock;
        v14[1] = 3221225472;
        v14[2] = sub_10001FDC4;
        v14[3] = &unk_10004D7C8;
        id v15 = v4;
        [(ServiceProductPageViewController *)self _addConfigurationAction:v14];

        goto LABEL_12;
      }
      int v8 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v12, 4, &v16, v13);
      free(v12);
      SSFileLog();
    }

    goto LABEL_11;
  }
LABEL_12:
}

- (void)setVisibleInClientWindow:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_visibleInClientWindow, a3);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001FED4;
  v7[3] = &unk_10004D7C8;
  id v8 = v5;
  id v6 = v5;
  [(ServiceProductPageViewController *)self _addConfigurationAction:v7];
}

- (void)_cancelButtonAction:(id)a3
{
  uint64_t v4 = [(ServiceProductPageViewController *)self isAskToBuy];

  [(ServiceProductPageViewController *)self _sendDidFinishWithResult:v4];
}

- (void)_loadProductWithIdentifier:(id)a3 parameters:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  id v11 = [(NSString *)self->_logKey copy];
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_100020138;
  v24[3] = &unk_10004D890;
  objc_copyWeak(&v29, &location);
  id v12 = v9;
  id v25 = v12;
  id v13 = v10;
  id v28 = v13;
  id v14 = v11;
  id v26 = v14;
  id v15 = v8;
  id v27 = v15;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100020568;
  v19[3] = &unk_10004D8B8;
  objc_copyWeak(&v23, &location);
  id v16 = v14;
  id v20 = v16;
  id v17 = v15;
  id v21 = v17;
  id v18 = v13;
  id v22 = v18;
  [(ServiceProductPageViewController *)self _lookupItemWithIdentifier:v17 success:v24 failure:v19];

  objc_destroyWeak(&v23);
  objc_destroyWeak(&v29);

  objc_destroyWeak(&location);
}

- (void)_lookupItemWithIdentifier:(id)a3 success:(id)a4 failure:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = +[SSLogConfig sharedConfig];
  unsigned int v12 = [v11 shouldLog];
  if ([v11 shouldLogToDisk]) {
    int v13 = v12 | 2;
  }
  else {
    int v13 = v12;
  }
  id v14 = [v11 OSLogObject];
  if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
    v13 &= 2u;
  }
  if (v13)
  {
    id v15 = objc_opt_class();
    logKey = self->_logKey;
    *(_DWORD *)id location = 138543874;
    *(void *)&location[4] = v15;
    __int16 v40 = 2114;
    v41 = logKey;
    __int16 v42 = 2114;
    id v43 = v8;
    id v17 = v15;
    LODWORD(v31) = 32;
    id v18 = (void *)_os_log_send_and_compose_impl();

    if (v18)
    {
      __int16 v19 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v18, 4, location, v31);
      free(v18);
      SSFileLog();
    }
  }
  else
  {
  }
  id v20 = +[AMSBag bagForProfile:@"appstored" profileVersion:@"1"];
  if ([(ServiceProductPageViewController *)self isAskToBuy]) {
    CFStringRef v21 = @"product-dv";
  }
  else {
    CFStringRef v21 = @"lockup-dv";
  }
  id v22 = [objc_alloc((Class)AMSLookup) initWithBag:v20 caller:@"com.apple.appstored" keyProfile:v21];
  [v22 setPlatform:@"omni"];
  id v23 = [objc_alloc((Class)AMSProcessInfo) initWithBundleIdentifier:@"com.apple.appstored"];
  [v22 setClientInfo:v23];
  id v38 = v8;
  v24 = +[NSArray arrayWithObjects:&v38 count:1];
  id v25 = [v22 performLookupWithBundleIdentifiers:0 itemIdentifiers:v24];

  id v26 = [(NSString *)self->_logKey copy];
  objc_initWeak((id *)location, self);
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_100020C50;
  v32[3] = &unk_10004D8E0;
  objc_copyWeak(&v37, (id *)location);
  id v27 = v26;
  id v33 = v27;
  id v28 = v8;
  id v34 = v28;
  id v29 = v10;
  id v35 = v29;
  id v30 = v9;
  id v36 = v30;
  [v25 addFinishBlock:v32];

  objc_destroyWeak(&v37);
  objc_destroyWeak((id *)location);
}

- (void)_requestRemoteViewControllerForItem:(id)a3 withParameters:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  [(ServiceProductPageViewController *)self _beginDelayingPresentation:&stru_10004D920 cancellationHandler:3.0];
  id v11 = [(ServiceProductPageViewController *)self remoteContainerViewController];

  if (v11)
  {
    [(ServiceProductPageViewController *)self _cleanUpExtension];
    unsigned int v12 = [(ServiceProductPageViewController *)self remoteContainerViewController];
    [v12 invalidate];

    [(ServiceProductPageViewController *)self setRemoteContainerViewController:0];
    int v13 = [(ServiceProductPageViewController *)self visibleInClientWindow];
    [(ServiceProductPageViewController *)self setVisibleInClientWindow:v13];
  }
  id v14 = [(NSString *)self->_logKey copy];
  objc_initWeak(&location, self);
  uint64_t v27 = NSExtensionPointName;
  CFStringRef v28 = @"com.apple.storekit.product-page";
  id v15 = +[NSDictionary dictionaryWithObjects:&v28 forKeys:&v27 count:1];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100021244;
  v20[3] = &unk_10004D9C0;
  objc_copyWeak(&v25, &location);
  id v16 = v10;
  id v24 = v16;
  id v17 = v8;
  id v21 = v17;
  id v18 = v14;
  id v22 = v18;
  id v19 = v9;
  id v23 = v19;
  +[NSExtension extensionsWithMatchingAttributes:v15 completion:v20];

  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);
}

- (void)_didReceiveRemoteViewController:(id)a3 forItem:(id)a4 withParameters:(id)a5
{
  id v15 = a3;
  id v8 = a4;
  id v9 = a5;
  [v15 setDelegate:self];
  [(ServiceProductPageViewController *)self _endDelayingPresentation];
  self->_isRemoteViewControllerReady = 1;
  id v10 = [(ServiceProductPageViewController *)self _hostApplicationBundleIdentifier];
  unsigned int v11 = [@"com.apple.Spotlight" isEqualToString:v10];

  unsigned int v12 = +[UIDevice currentDevice];
  id v13 = [v12 userInterfaceIdiom];

  if (v11 && v13 == (id)1) {
    [v15 _setViewClipsToBounds:0];
  }
  [(ServiceProductPageViewController *)self _executeConfigurationActionsWithServiceProductPage:v15];
  if (v8)
  {
    id v14 = [v15 serviceViewControllerProxy];
    [v14 clientLookupItemDidLoad:v8 parameters:v9];
  }
}

- (id)_setupErrorViewController
{
  id v3 = [[ServiceErrorViewController alloc] initWithActionBlock:0];
  uint64_t v4 = +[UIColor whiteColor];
  id v5 = [(ServiceErrorViewController *)v3 view];
  [v5 setBackgroundColor:v4];

  [(ServiceProductPageViewController *)self _setupChildViewController:v3 animated:0];
  [(ServiceProductPageViewController *)self setErrorViewController:v3];

  return v3;
}

- (void)_setupChildViewController:(id)a3 animated:(BOOL)a4
{
  id v9 = a3;
  id v5 = [(ServiceProductPageViewController *)self cardContainerViewController];
  char IsDescendent = SKUIViewControllerIsDescendent();

  if ((IsDescendent & 1) == 0)
  {
    int v7 = [(ServiceProductPageViewController *)self errorViewController];

    if (v7) {
      [(ServiceProductPageViewController *)self setErrorViewController:0];
    }
    id v8 = [(ServiceProductPageViewController *)self cardContainerViewController];
    [v8 setChildViewController:v9];
  }
}

- (void)_addConfigurationAction:(id)a3
{
  uint64_t v4 = (void (**)(id, void *))a3;
  unsigned int v11 = v4;
  if (self->_storeProductViewController)
  {
    ((void (*)(void (**)(id, void *)))v4[2])(v4);
  }
  else
  {
    id v5 = [(ServiceResilientRemoteViewContainerViewController *)self->_remoteContainerViewController remoteViewController];

    if (v5)
    {
      id v6 = [(ServiceResilientRemoteViewContainerViewController *)self->_remoteContainerViewController remoteViewController];
      v11[2](v11, v6);
    }
    else
    {
      configurationActions = self->_configurationActions;
      id v8 = v11;
      if (!configurationActions) {
        goto LABEL_8;
      }
      id v9 = [v11 copy];
      id v10 = objc_retainBlock(v9);
      [(NSMutableArray *)configurationActions addObject:v10];
    }
  }
  id v8 = v11;
LABEL_8:
}

- (void)_executeConfigurationActionsWithServiceProductPage:(id)a3
{
  id v4 = a3;
  id v5 = [(ServiceProductPageViewController *)self configurationActions];
  id v6 = objc_alloc_init((Class)NSMutableArray);
  [(ServiceProductPageViewController *)self setConfigurationActions:v6];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = v5;
  id v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      unsigned int v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v12 + 1) + 8 * (void)v11) + 16))(*(void *)(*((void *)&v12 + 1) + 8 * (void)v11));
        unsigned int v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (BOOL)_isClientEntitled
{
  [(ServiceProductPageViewController *)self _hostAuditToken];
  return sub_100010BA0(&v3, kSSITunesStorePrivateEntitlement);
}

- (id)_hostApplicationBundleIdentifier
{
  long long v3 = [(ServiceProductPageViewController *)self hostApplicationBundleIdentifierOverride];

  if (v3)
  {
    id v4 = [(ServiceProductPageViewController *)self hostApplicationBundleIdentifierOverride];
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)ServiceProductPageViewController;
    id v4 = [(ServiceProductPageViewController *)&v6 _hostApplicationBundleIdentifier];
  }

  return v4;
}

- (void)_sendDidFinishWithResult:(int64_t)a3
{
  id v5 = [(ServiceProductPageViewController *)self cardContainerViewController];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10002239C;
  v6[3] = &unk_10004D9E8;
  v6[4] = self;
  v6[5] = a3;
  [v5 dismissViewControllerAnimated:1 completion:v6];
}

- (void)_respondWithSuccess:(BOOL)a3
{
  if (a3)
  {
    id v5 = [(ServiceProductPageViewController *)self _clientViewControllerProxy];
    [v5 loadDidFinishWithResult:&__kCFBooleanTrue error:0];
  }
  else
  {
    id v5 = +[NSError errorWithDomain:SKErrorDomain code:5 userInfo:0];
    id v4 = [(ServiceProductPageViewController *)self _clientViewControllerProxy];
    [v4 loadDidFinishWithResult:&__kCFBooleanFalse error:v5];
  }
}

- (void)_sendUnentitledErrorResponse
{
  long long v3 = +[SSLogConfig sharedConfig];
  unsigned int v4 = [v3 shouldLog];
  if ([v3 shouldLogToDisk]) {
    int v5 = v4 | 2;
  }
  else {
    int v5 = v4;
  }
  objc_super v6 = [v3 OSLogObject];
  if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
    v5 &= 2u;
  }
  if (!v5) {
    goto LABEL_9;
  }
  id v7 = objc_opt_class();
  logKey = self->_logKey;
  id v9 = v7;
  [(ServiceProductPageViewController *)self _hostApplicationBundleIdentifier];
  int v14 = 138543874;
  long long v15 = v7;
  __int16 v16 = 2114;
  id v17 = logKey;
  __int16 v18 = 2112;
  id v19 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v13) = 32;
  uint64_t v10 = (void *)_os_log_send_and_compose_impl();

  if (v10)
  {
    objc_super v6 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v10, 4, &v14, v13);
    free(v10);
    SSFileLog();
LABEL_9:
  }
  unsigned int v11 = +[NSError errorWithDomain:SKErrorDomain code:5 userInfo:0];
  long long v12 = [(ServiceProductPageViewController *)self _clientViewControllerProxy];
  [v12 loadDidFinishWithResult:&__kCFBooleanFalse error:v11];
}

- (BOOL)_shouldLayoutAsOverlayWithTraitCollection:(id)a3
{
  id v3 = a3;
  unsigned int v4 = +[UIDevice currentDevice];
  unint64_t v5 = (unint64_t)[v4 userInterfaceIdiom];

  BOOL v6 = (v5 & 0xFFFFFFFFFFFFFFFBLL) == 1 && [v3 horizontalSizeClass] == (id)2;
  return v6;
}

- (void)_cleanUpExtension
{
  id v3 = [(ServiceProductPageViewController *)self extension];

  if (!v3) {
    return;
  }
  unsigned int v4 = +[SSLogConfig sharedConfig];
  unsigned int v5 = [v4 shouldLog];
  if ([v4 shouldLogToDisk]) {
    int v6 = v5 | 2;
  }
  else {
    int v6 = v5;
  }
  id v7 = [v4 OSLogObject];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
    int v8 = v6;
  }
  else {
    int v8 = v6 & 2;
  }
  if (!v8) {
    goto LABEL_11;
  }
  logKey = self->_logKey;
  int v16 = 138543618;
  id v17 = self;
  __int16 v18 = 2114;
  id v19 = logKey;
  LODWORD(v15) = 22;
  int v14 = &v16;
  uint64_t v10 = (void *)_os_log_send_and_compose_impl();

  if (v10)
  {
    id v7 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v10, 4, &v16, v15);
    free(v10);
    int v14 = (int *)v7;
    SSFileLog();
LABEL_11:
  }
  unsigned int v11 = [(ServiceProductPageViewController *)self extensionRequest];

  if (v11)
  {
    long long v12 = [(ServiceProductPageViewController *)self extension];
    [v12 cancelExtensionRequestWithIdentifier:self->_extensionRequest];
  }
  uint64_t v13 = [(ServiceProductPageViewController *)self extension];
  [v13 _kill:9];

  [(ServiceProductPageViewController *)self setExtension:0];
}

- (void)_makeItemKindEventForItem:(id)a3 extension:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  int v8 = +[SSLogConfig sharedConfig];
  unsigned int v9 = [v8 shouldLog];
  if ([v8 shouldLogToDisk]) {
    int v10 = v9 | 2;
  }
  else {
    int v10 = v9;
  }
  unsigned int v11 = [v8 OSLogObject];
  if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    v10 &= 2u;
  }
  if (!v10) {
    goto LABEL_9;
  }
  long long v12 = objc_opt_class();
  logKey = self->_logKey;
  *(_DWORD *)__int16 v18 = 138543618;
  *(void *)&v18[4] = v12;
  *(_WORD *)&v18[12] = 2114;
  *(void *)&v18[14] = logKey;
  id v14 = v12;
  LODWORD(v17) = 22;
  uint64_t v15 = (void *)_os_log_send_and_compose_impl();

  if (v15)
  {
    unsigned int v11 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v15, 4, v18, v17, *(_OWORD *)v18, *(void *)&v18[16]);
    free(v15);
    SSFileLog();
LABEL_9:
  }
  int v16 = objc_alloc_init(_TtC17StoreKitUIService18ProductLookupEvent);
  [(ProductLookupEvent *)v16 configureWithItem:v7 compatibleExtension:v6];

  +[objc_AnalyticsManager sendEvent:v16];
}

- (id)_setupProductPageViewController
{
  id v3 = [[ServiceStoreProductViewController alloc] initWithNibName:0 bundle:0];
  storeProductViewController = self->_storeProductViewController;
  self->_storeProductViewController = v3;

  [(ServiceStoreProductViewController *)self->_storeProductViewController setShouldShowOnboarding:1];
  [(ServiceProductPageViewController *)self _executeConfigurationActionsWithServiceProductPage:self->_storeProductViewController];
  [(ServiceStoreProductViewController *)self->_storeProductViewController setDelegate:self];
  unsigned int v5 = [(ServiceProductPageViewController *)self cardContainerViewController];
  id v6 = [v5 view];
  id v7 = +[UIColor whiteColor];
  [v6 setBackgroundColor:v7];

  [(ServiceProductPageViewController *)self _setupChildViewController:self->_storeProductViewController animated:0];
  int v8 = self->_storeProductViewController;

  return v8;
}

- (void)serviceProductPageViewControllerFinishWithResult:(int64_t)a3
{
  unsigned int v5 = +[SSLogConfig sharedConfig];
  unsigned int v6 = [v5 shouldLog];
  if ([v5 shouldLogToDisk]) {
    int v7 = v6 | 2;
  }
  else {
    int v7 = v6;
  }
  int v8 = [v5 OSLogObject];
  if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
    v7 &= 2u;
  }
  if (!v7) {
    goto LABEL_9;
  }
  unsigned int v9 = objc_opt_class();
  logKey = self->_logKey;
  *(_DWORD *)id v14 = 138543874;
  *(void *)&void v14[4] = v9;
  *(_WORD *)&v14[12] = 2114;
  *(void *)&v14[14] = logKey;
  *(_WORD *)&v14[22] = 2048;
  int64_t v15 = a3;
  id v11 = v9;
  LODWORD(v13) = 32;
  long long v12 = (void *)_os_log_send_and_compose_impl();

  if (v12)
  {
    int v8 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v12, 4, v14, v13, *(_OWORD *)v14, *(void *)&v14[16], v15);
    free(v12);
    SSFileLog();
LABEL_9:
  }
  [(ServiceProductPageViewController *)self _sendDidFinishWithResult:a3];
}

- (void)showPageForLookupResult:(id)a3 productID:(id)a4 parameters:(id)a5 logKey:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = [objc_alloc((Class)AMSLookupItem) initWithLookupDictionary:v12];
  objc_initWeak(&location, self);
  id v18 = [(NSString *)self->_logKey copy];
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_100022F64;
  v24[3] = &unk_10004DA38;
  objc_copyWeak(&v30, &location);
  id v19 = v18;
  id v25 = v19;
  id v20 = v15;
  id v26 = v20;
  id v21 = v13;
  id v27 = v21;
  id v22 = v16;
  id v29 = v22;
  id v23 = v14;
  id v28 = v23;
  [(ServiceProductPageViewController *)self _requestRemoteViewControllerForItem:v17 withParameters:v23 completion:v24];

  objc_destroyWeak(&v30);
  objc_destroyWeak(&location);
}

- (void)showErrorPageWithCompletion:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000234A0;
  v4[3] = &unk_10004DA60;
  v4[4] = self;
  id v5 = a3;
  id v3 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);
}

- (UIViewController)errorViewController
{
  return self->_errorViewController;
}

- (void)setErrorViewController:(id)a3
{
}

- (UINavigationController)placeholderViewController
{
  return self->_placeholderViewController;
}

- (void)setPlaceholderViewController:(id)a3
{
}

- (BOOL)isRemoteViewControllerReady
{
  return self->_isRemoteViewControllerReady;
}

- (void)setIsRemoteViewControllerReady:(BOOL)a3
{
  self->_isRemoteViewControllerReady = a3;
}

- (NSNumber)desiredPresentationStyle
{
  return self->_desiredPresentationStyle;
}

- (void)setDesiredPresentationStyle:(id)a3
{
}

- (NSMutableArray)configurationActions
{
  return self->_configurationActions;
}

- (void)setConfigurationActions:(id)a3
{
}

- (ServiceResilientRemoteViewContainerViewController)remoteContainerViewController
{
  return self->_remoteContainerViewController;
}

- (void)setRemoteContainerViewController:(id)a3
{
}

- (NSExtension)extension
{
  return self->_extension;
}

- (void)setExtension:(id)a3
{
}

- (NSCopying)extensionRequest
{
  return self->_extensionRequest;
}

- (void)setExtensionRequest:(id)a3
{
}

- (BOOL)isAskToBuy
{
  return self->_isAskToBuy;
}

- (void)setIsAskToBuy:(BOOL)a3
{
  self->_isAskToBuy = a3;
}

- (NSNumber)visibleInClientWindow
{
  return self->_visibleInClientWindow;
}

- (NSString)hostApplicationBundleIdentifierOverride
{
  return self->_hostApplicationBundleIdentifierOverride;
}

- (void)setHostApplicationBundleIdentifierOverride:(id)a3
{
}

- (ServiceCardContainerViewController)cardContainerViewController
{
  return self->_cardContainerViewController;
}

- (void)setCardContainerViewController:(id)a3
{
}

- (id)remoteLoadDidFinishCompletion
{
  return self->_remoteLoadDidFinishCompletion;
}

- (void)setRemoteLoadDidFinishCompletion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_remoteLoadDidFinishCompletion, 0);
  objc_storeStrong((id *)&self->_cardContainerViewController, 0);
  objc_storeStrong((id *)&self->_hostApplicationBundleIdentifierOverride, 0);
  objc_storeStrong((id *)&self->_visibleInClientWindow, 0);
  objc_storeStrong((id *)&self->_extensionRequest, 0);
  objc_storeStrong((id *)&self->_extension, 0);
  objc_storeStrong((id *)&self->_remoteContainerViewController, 0);
  objc_storeStrong((id *)&self->_configurationActions, 0);
  objc_storeStrong((id *)&self->_desiredPresentationStyle, 0);
  objc_storeStrong((id *)&self->_placeholderViewController, 0);
  objc_storeStrong((id *)&self->_errorViewController, 0);
  objc_storeStrong((id *)&self->_storeProductViewController, 0);

  objc_storeStrong((id *)&self->_logKey, 0);
}

@end