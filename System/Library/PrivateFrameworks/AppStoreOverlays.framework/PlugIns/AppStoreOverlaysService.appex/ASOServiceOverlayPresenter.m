@interface ASOServiceOverlayPresenter
+ (id)log;
- (AMSPromise)overlayPromise;
- (ASOOverlayConfiguration)configuration;
- (ASORemoteAppOverlayDelegate)remoteDelegate;
- (ASOServiceContext)serviceContext;
- (ASOServiceOverlay)loadedOverlay;
- (ASOServiceOverlay)unlockedLoadedOverlay;
- (ASOServiceOverlayContainerConfiguration)containerConfiguration;
- (ASOServiceOverlayLoader)overlayLoader;
- (ASOServiceOverlayPresenter)initWithConfiguration:(id)a3 remoteDelegate:(id)a4 serviceContext:(id)a5 overlayLoader:(id)a6;
- (ASOServiceViewMetricsReporter)viewMetricsReporter;
- (NSRecursiveLock)stateLock;
- (id)convertErrorIfNeeded:(id)a3;
- (id)loadOverlayIfNeeded;
- (id)makeMetricsActivity;
- (void)didFailToLoadWithError:(id)a3;
- (void)didFinishDismissal:(id)a3;
- (void)didFinishPresentation:(id)a3;
- (void)hostApplicationDidEnterBackground;
- (void)hostApplicationWillEnterForeground;
- (void)postAppearMetrics;
- (void)postDisappearMetrics;
- (void)setConfiguration:(id)a3;
- (void)setLoadedOverlay:(id)a3;
- (void)setOverlayPromise:(id)a3;
- (void)setRemoteDelegate:(id)a3;
- (void)setServiceContext:(id)a3;
- (void)setUnlockedLoadedOverlay:(id)a3;
- (void)setViewMetricsReporter:(id)a3;
- (void)willStartDismissal:(id)a3 executeBlock:(id)a4;
- (void)willStartPresentation:(id)a3 executeBlock:(id)a4;
- (void)withLock:(id)a3;
@end

@implementation ASOServiceOverlayPresenter

- (void)withLock:(id)a3
{
  v6 = (void (**)(void))a3;
  v4 = [(ASOServiceOverlayPresenter *)self stateLock];
  [v4 lock];

  v6[2]();
  v5 = [(ASOServiceOverlayPresenter *)self stateLock];
  [v5 unlock];
}

+ (id)log
{
  if (qword_10002CB30 != -1) {
    dispatch_once(&qword_10002CB30, &stru_100024F50);
  }
  v2 = (void *)qword_10002CB38;

  return v2;
}

- (ASOServiceOverlayPresenter)initWithConfiguration:(id)a3 remoteDelegate:(id)a4 serviceContext:(id)a5 overlayLoader:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v23.receiver = self;
  v23.super_class = (Class)ASOServiceOverlayPresenter;
  v15 = [(ASOServiceOverlayPresenter *)&v23 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_configuration, a3);
    objc_storeStrong((id *)&v16->_remoteDelegate, a4);
    objc_storeWeak((id *)&v16->_serviceContext, v13);
    objc_storeStrong((id *)&v16->_overlayLoader, a6);
    v17 = [ASOServiceViewMetricsReporter alloc];
    v18 = [(ASOServiceOverlayPresenter *)v16 makeMetricsActivity];
    v19 = [(ASOServiceViewMetricsReporter *)v17 initWithActivity:v18];
    viewMetricsReporter = v16->_viewMetricsReporter;
    v16->_viewMetricsReporter = v19;

    unlockedLoadedOverlay = v16->_unlockedLoadedOverlay;
    v16->_unlockedLoadedOverlay = 0;
  }
  return v16;
}

- (id)makeMetricsActivity
{
  v3 = objc_opt_new();
  v4 = [(ASOServiceOverlayPresenter *)self serviceContext];
  if ([v4 isAppClip]) {
    CFStringRef v5 = @"clip";
  }
  else {
    CFStringRef v5 = @"app";
  }
  [v3 setObject:v5 forKeyedSubscript:@"hostAppKind"];

  v6 = [(ASOServiceOverlayPresenter *)self serviceContext];
  v7 = [v6 hostAdamID];
  if (v7)
  {
    v8 = [(ASOServiceOverlayPresenter *)self serviceContext];
    v9 = [v8 hostAdamID];
    [v3 setObject:v9 forKeyedSubscript:@"hostItemId"];
  }
  else
  {
    [v3 setObject:&stru_100025880 forKeyedSubscript:@"hostItemId"];
  }

  v10 = [(ASOServiceOverlayPresenter *)self serviceContext];
  id v11 = [v10 hostBundleIdentifier];

  if (v11)
  {
    [v3 setObject:v11 forKeyedSubscript:ASCMetricsActivityKeyHostApp];
    [v3 setObject:v11 forKeyedSubscript:ASCMetricsActivityKeyPageContext];
  }
  id v12 = [objc_alloc((Class)ASCMetricsActivity) initWithFields:v3];

  return v12;
}

- (id)loadOverlayIfNeeded
{
  v3 = +[ASCOverlaySettings sharedSettings];
  uint64_t v4 = [v3 overlaysLoadTimeout];

  if (v4) {
    CFStringRef v5 = (_UNKNOWN **)v4;
  }
  else {
    CFStringRef v5 = &off_100025B58;
  }
  v6 = +[ASOServiceOverlayPresenter log];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    [v5 doubleValue];
    *(_DWORD *)buf = 134217984;
    uint64_t v28 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Loading overlay with timeout: %f", buf, 0xCu);
  }

  v8 = [(ASOServiceOverlayPresenter *)self overlayPromise];
  BOOL v9 = v8 == 0;

  if (v9)
  {
    v10 = [(ASOServiceOverlayPresenter *)self overlayLoader];
    id v11 = [(ASOServiceOverlayPresenter *)self configuration];
    id v12 = [(ASOServiceOverlayPresenter *)self remoteDelegate];
    id v13 = [(ASOServiceOverlayPresenter *)self serviceContext];
    id v14 = [(ASOServiceOverlayPresenter *)self viewMetricsReporter];
    v15 = [v10 loadOverlayForConfiguration:v11 delegate:v12 serviceContext:v13 metricsReporter:v14];
    [v5 doubleValue];
    v16 = objc_msgSend(v15, "promiseWithTimeout:");
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_10000868C;
    v26[3] = &unk_100024F78;
    v26[4] = self;
    v17 = [v16 catchWithBlock:v26];
    [(ASOServiceOverlayPresenter *)self setOverlayPromise:v17];

    objc_initWeak((id *)buf, self);
    v18 = [(ASOServiceOverlayPresenter *)self overlayPromise];
    v21 = _NSConcreteStackBlock;
    uint64_t v22 = 3221225472;
    objc_super v23 = sub_1000086F0;
    v24 = &unk_100024FE0;
    objc_copyWeak(&v25, (id *)buf);
    [v18 addSuccessBlock:&v21];

    objc_destroyWeak(&v25);
    objc_destroyWeak((id *)buf);
  }
  v19 = [(ASOServiceOverlayPresenter *)self overlayPromise];

  return v19;
}

- (ASOServiceOverlayContainerConfiguration)containerConfiguration
{
  v2 = [(ASOServiceOverlayPresenter *)self loadedOverlay];
  v3 = [v2 containerConfiguration];

  return (ASOServiceOverlayContainerConfiguration *)v3;
}

- (void)setLoadedOverlay:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100008908;
  v4[3] = &unk_100025008;
  CFStringRef v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(ASOServiceOverlayPresenter *)v5 withLock:v4];
}

- (ASOServiceOverlay)loadedOverlay
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  v8 = sub_100008A10;
  BOOL v9 = sub_100008A20;
  id v10 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100008A28;
  v4[3] = &unk_100025030;
  void v4[4] = self;
  v4[5] = &v5;
  [(ASOServiceOverlayPresenter *)self withLock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (ASOServiceOverlay *)v2;
}

- (void)didFailToLoadWithError:(id)a3
{
  id v4 = a3;
  id v5 = [(ASOServiceOverlayPresenter *)self remoteDelegate];
  [v5 remoteStoreOverlayDidFailToLoadWithError:v4];
}

- (void)willStartPresentation:(id)a3 executeBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(ASOServiceOverlayPresenter *)self remoteDelegate];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100008B9C;
  v10[3] = &unk_100025058;
  id v11 = v6;
  id v9 = v6;
  [v8 remoteStoreOverlayWillStartPresenting:v7 executeBlock:v10];
}

- (void)didFinishPresentation:(id)a3
{
  id v4 = a3;
  [(ASOServiceOverlayPresenter *)self postAppearMetrics];
  id v5 = [(ASOServiceOverlayPresenter *)self overlayLoader];
  [v5 serviceOverlayPresenterDidFinishPresenting];

  id v6 = [(ASOServiceOverlayPresenter *)self remoteDelegate];
  [v6 remoteStoreOverlayDidFinishPresentation:v4];
}

- (void)willStartDismissal:(id)a3 executeBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(ASOServiceOverlayPresenter *)self remoteDelegate];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100008DF4;
  v10[3] = &unk_100025058;
  id v11 = v6;
  id v9 = v6;
  [v8 remoteStoreOverlayWillStartDismissing:v7 executeBlock:v10];
}

- (void)didFinishDismissal:(id)a3
{
  id v4 = a3;
  [(ASOServiceOverlayPresenter *)self postDisappearMetrics];
  id v5 = [(ASOServiceOverlayPresenter *)self overlayLoader];
  [v5 serviceOverlayPresenterDidFinishDismissing];

  id v6 = [(ASOServiceOverlayPresenter *)self remoteDelegate];
  [v6 remoteStoreOverlayDidFinishDismissal:v4];
}

- (void)hostApplicationDidEnterBackground
{
  id v3 = +[ASOServiceOverlayPresenter log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Host application did enter background", v4, 2u);
  }

  [(ASOServiceOverlayPresenter *)self postDisappearMetrics];
}

- (void)hostApplicationWillEnterForeground
{
  id v3 = +[ASOServiceOverlayPresenter log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Host application will enter foreground", v4, 2u);
  }

  [(ASOServiceOverlayPresenter *)self postAppearMetrics];
}

- (void)postDisappearMetrics
{
  id v3 = [(ASOServiceOverlayPresenter *)self loadedOverlay];
  id v5 = [v3 viewMetrics];

  if (v5)
  {
    id v4 = [(ASOServiceOverlayPresenter *)self viewMetricsReporter];
    [v4 reportDisappearWithViewMetrics:v5];
  }
}

- (void)postAppearMetrics
{
  id v3 = [(ASOServiceOverlayPresenter *)self loadedOverlay];
  id v5 = [v3 viewMetrics];

  if (v5)
  {
    id v4 = [(ASOServiceOverlayPresenter *)self viewMetricsReporter];
    [v4 reportAppearWithViewMetrics:v5];
  }
}

- (id)convertErrorIfNeeded:(id)a3
{
  id v3 = a3;
  id v4 = [v3 domain];
  id v5 = v4;
  if (v4 == (void *)AMSErrorDomain)
  {
    id v6 = [v3 code];

    if (v6 == (id)1)
    {
      NSErrorUserInfoKey v10 = NSLocalizedDescriptionKey;
      CFStringRef v11 = @"Overlay timed out";
      id v7 = +[NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];
      id v8 = +[NSError errorWithDomain:@"ASOErrorDomain" code:6 userInfo:v7];

      goto LABEL_6;
    }
  }
  else
  {
  }
  id v8 = v3;
LABEL_6:

  return v8;
}

- (ASOOverlayConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (ASOServiceOverlayLoader)overlayLoader
{
  return self->_overlayLoader;
}

- (ASORemoteAppOverlayDelegate)remoteDelegate
{
  return self->_remoteDelegate;
}

- (void)setRemoteDelegate:(id)a3
{
}

- (ASOServiceContext)serviceContext
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_serviceContext);

  return (ASOServiceContext *)WeakRetained;
}

- (void)setServiceContext:(id)a3
{
}

- (NSRecursiveLock)stateLock
{
  return self->_stateLock;
}

- (AMSPromise)overlayPromise
{
  return self->_overlayPromise;
}

- (void)setOverlayPromise:(id)a3
{
}

- (ASOServiceOverlay)unlockedLoadedOverlay
{
  return self->_unlockedLoadedOverlay;
}

- (void)setUnlockedLoadedOverlay:(id)a3
{
}

- (ASOServiceViewMetricsReporter)viewMetricsReporter
{
  return self->_viewMetricsReporter;
}

- (void)setViewMetricsReporter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewMetricsReporter, 0);
  objc_storeStrong((id *)&self->_unlockedLoadedOverlay, 0);
  objc_storeStrong((id *)&self->_overlayPromise, 0);
  objc_storeStrong((id *)&self->_stateLock, 0);
  objc_destroyWeak((id *)&self->_serviceContext);
  objc_storeStrong((id *)&self->_remoteDelegate, 0);
  objc_storeStrong((id *)&self->_overlayLoader, 0);

  objc_storeStrong((id *)&self->_configuration, 0);
}

@end