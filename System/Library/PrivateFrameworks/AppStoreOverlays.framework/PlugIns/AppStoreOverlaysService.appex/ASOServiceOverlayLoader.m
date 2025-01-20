@interface ASOServiceOverlayLoader
+ (OS_os_log)log;
- (ASOOverlayAppConfiguration)config;
- (ASOServiceContext)serviceContext;
- (BOOL)didInitiateDownload;
- (NSTimer)attributionTimer;
- (id)loadOverlayForConfiguration:(id)a3 delegate:(id)a4 serviceContext:(id)a5 metricsReporter:(id)a6;
- (id)processReengagement;
- (void)recordClickThroughImpressionWithDidInitiateDownload:(BOOL)a3;
- (void)serviceOverlayPresenterDidFinishDismissing;
- (void)serviceOverlayPresenterDidFinishPresenting;
- (void)setAttributionTimer:(id)a3;
- (void)setConfig:(id)a3;
- (void)setDidInitiateDownload:(BOOL)a3;
- (void)setServiceContext:(id)a3;
@end

@implementation ASOServiceOverlayLoader

+ (OS_os_log)log
{
  if (qword_10002CB20 != -1) {
    dispatch_once(&qword_10002CB20, &stru_100024F08);
  }
  v2 = (void *)qword_10002CB28;

  return (OS_os_log *)v2;
}

- (id)loadOverlayForConfiguration:(id)a3 delegate:(id)a4 serviceContext:(id)a5 metricsReporter:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = +[ASOServiceOverlayLoader log];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Finding provider to use to load overlay", buf, 2u);
  }

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v15 = +[ASOServiceOverlayLoader log];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v25 = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Using ASOServiceOverlayAppLockupProvider", v25, 2u);
    }

    [(ASOServiceOverlayLoader *)self setConfig:v10];
    [(ASOServiceOverlayLoader *)self setServiceContext:v12];
    v16 = objc_alloc_init(ASOServiceOverlayAppLockupProvider);
    [(ASOServiceOverlayAppLockupProvider *)v16 setAdInteractionAttributor:self];
    v17 = (ASOServiceOverlayAppClipLockupProvider *)v16;
LABEL_11:
    uint64_t v21 = [(ASOServiceOverlayAppClipLockupProvider *)v17 loadOverlayForConfiguration:v10 delegate:v11 serviceContext:v12 metricsReporter:v13];
    goto LABEL_15;
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  v19 = +[ASOServiceOverlayLoader log];
  v20 = v19;
  if (isKindOfClass)
  {
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v24 = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "Using ASOServiceOverlayAppClipLockupProvider", v24, 2u);
    }

    v17 = objc_alloc_init(ASOServiceOverlayAppClipLockupProvider);
    v16 = (ASOServiceOverlayAppLockupProvider *)v17;
    goto LABEL_11;
  }
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
    sub_10001822C(v20);
  }

  v16 = +[NSError errorWithDomain:@"ASOErrorDomain" code:1 userInfo:0];
  uint64_t v21 = +[AMSPromise promiseWithError:v16];
LABEL_15:
  v22 = (void *)v21;

  return v22;
}

- (void)serviceOverlayPresenterDidFinishPresenting
{
  v3 = [(ASOServiceOverlayLoader *)self config];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    objc_initWeak(&location, self);
    v6 = _NSConcreteStackBlock;
    uint64_t v7 = 3221225472;
    v8 = sub_100007A3C;
    v9 = &unk_100024F30;
    objc_copyWeak(&v10, &location);
    v5 = +[NSTimer scheduledTimerWithTimeInterval:0 repeats:&v6 block:3.0];
    -[ASOServiceOverlayLoader setAttributionTimer:](self, "setAttributionTimer:", v5, v6, v7, v8, v9);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

- (void)serviceOverlayPresenterDidFinishDismissing
{
  v3 = [(ASOServiceOverlayLoader *)self config];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    id v5 = [(ASOServiceOverlayLoader *)self attributionTimer];
    [v5 invalidate];
  }
}

- (void)recordClickThroughImpressionWithDidInitiateDownload:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(ASOServiceOverlayLoader *)self config];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    uint64_t v7 = [(ASOServiceOverlayLoader *)self attributionTimer];
    [v7 invalidate];

    v8 = [(ASOServiceOverlayLoader *)self config];
    v9 = [v8 storage];
    id v10 = [(ASOServiceOverlayLoader *)self config];
    id v11 = [v10 appIdentifier];
    id v12 = [(ASOServiceOverlayLoader *)self serviceContext];
    id v13 = [v12 hostAdamID];
    v14 = [(ASOServiceOverlayLoader *)self serviceContext];
    [v14 hostBundleIdentifier];
    v15 = BOOL v16 = v3;
    +[ASOServiceAdAttribution recordImpressionWithParameters:v9 storeIdentifier:v11 hostAdamID:v13 clientBundleId:v15 interactionType:1];

    if (v16)
    {
      [(ASOServiceOverlayLoader *)self setDidInitiateDownload:1];
    }
  }
}

- (id)processReengagement
{
  BOOL v3 = [(ASOServiceOverlayLoader *)self config];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
LABEL_6:
    v6 = 0;
    goto LABEL_8;
  }
  if ([(ASOServiceOverlayLoader *)self didInitiateDownload])
  {
    id v5 = +[ASOServiceOverlayLoader log];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100018270(v5);
    }

    goto LABEL_6;
  }
  uint64_t v7 = [(ASOServiceOverlayLoader *)self attributionTimer];
  [v7 invalidate];

  v8 = [(ASOServiceOverlayLoader *)self config];
  v9 = [v8 storage];
  id v10 = [(ASOServiceOverlayLoader *)self config];
  id v11 = [v10 appIdentifier];
  id v12 = [(ASOServiceOverlayLoader *)self serviceContext];
  id v13 = [v12 hostBundleIdentifier];
  v6 = +[ASOServiceAdAttribution processReengagementWithParameters:v9 storeIdentifier:v11 clientBundleID:v13];

LABEL_8:

  return v6;
}

- (NSTimer)attributionTimer
{
  return self->_attributionTimer;
}

- (void)setAttributionTimer:(id)a3
{
}

- (BOOL)didInitiateDownload
{
  return self->_didInitiateDownload;
}

- (void)setDidInitiateDownload:(BOOL)a3
{
  self->_didInitiateDownload = a3;
}

- (ASOOverlayAppConfiguration)config
{
  return self->_config;
}

- (void)setConfig:(id)a3
{
}

- (ASOServiceContext)serviceContext
{
  return self->_serviceContext;
}

- (void)setServiceContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceContext, 0);
  objc_storeStrong((id *)&self->_config, 0);

  objc_storeStrong((id *)&self->_attributionTimer, 0);
}

@end