@interface ASOServiceOverlayAppLockupProvider
+ (OS_os_log)log;
+ (id)configureLockupView:(id)a3 forAppWithConfiguration:(id)a4 serviceContext:(id)a5 metricsReporter:(id)a6;
- (ASOServiceAdInteractionAttributor)adInteractionAttributor;
- (id)loadOverlayForConfiguration:(id)a3 delegate:(id)a4 serviceContext:(id)a5 metricsReporter:(id)a6;
- (id)lockupDefinitionForConfiguration:(id)a3 serviceContext:(id)a4;
- (void)setAdInteractionAttributor:(id)a3;
@end

@implementation ASOServiceOverlayAppLockupProvider

+ (OS_os_log)log
{
  if (qword_10002CB00 != -1) {
    dispatch_once(&qword_10002CB00, &stru_100024E50);
  }
  v2 = (void *)qword_10002CB08;

  return (OS_os_log *)v2;
}

- (id)loadOverlayForConfiguration:(id)a3 delegate:(id)a4 serviceContext:(id)a5 metricsReporter:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = +[ASOServiceOverlayAppLockupProvider log];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    sub_1000181C4();
  }

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v15 = v10;
    v16 = [v15 appIdentifier];

    if (v16)
    {
      v17 = [v12 hostAdamID];
      if ([v12 isAppClip]
        && v17
        && ([v15 appIdentifier],
            v18 = objc_claimAutoreleasedReturnValue(),
            unsigned int v19 = [v17 isEqualToString:v18],
            v18,
            v19))
      {
        id v20 = (id)objc_opt_new();
        id v21 = [v20 loadOverlayForConfiguration:v15 delegate:v11 serviceContext:v12 metricsReporter:v13];
      }
      else
      {
        v22 = [(ASOServiceOverlayAppLockupProvider *)self lockupDefinitionForConfiguration:v15 serviceContext:v12];
        id v23 = objc_alloc_init((Class)AMSMutablePromise);
        v24 = +[ASOServiceOverlayAppLockupProvider log];
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
          sub_1000180E8();
        }

        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_1000064DC;
        block[3] = &unk_100024E78;
        id v30 = v15;
        id v31 = v22;
        id v32 = v13;
        id v25 = v23;
        id v33 = v25;
        v34 = self;
        id v35 = v30;
        id v36 = v12;
        id v20 = v22;
        dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
        v26 = v36;
        id v21 = v25;
      }
    }
    else
    {
      v27 = +[ASOServiceOverlayAppLockupProvider log];
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
        sub_100018190();
      }

      v17 = +[NSError errorWithDomain:@"ASOErrorDomain" code:2 userInfo:0];
      id v21 = +[AMSPromise promiseWithError:v17];
    }
  }
  else
  {
    id v15 = +[NSError errorWithDomain:@"ASOErrorDomain" code:1 userInfo:0];
    id v21 = +[AMSPromise promiseWithError:v15];
  }

  return v21;
}

- (id)lockupDefinitionForConfiguration:(id)a3 serviceContext:(id)a4
{
  id v4 = a3;
  id v5 = objc_alloc((Class)ASCAdamID);
  v6 = [v4 appIdentifier];
  id v7 = [v5 initWithStringValue:v6];

  id v8 = objc_alloc((Class)ASCLockupRequest);
  uint64_t v9 = ASCLockupKindApp;
  uint64_t v10 = ASCLockupContextOverlay;
  id v11 = [v4 latestReleaseID];
  id v12 = [v4 productVariantID];

  id v13 = [v8 _initWithID:v7 kind:v9 context:v10 minExternalVersionID:0 latestReleaseID:v11 productVariantID:v12];
  v14 = [[ASOServiceLockupDefinition alloc] initWithRequest:v13];

  return v14;
}

+ (id)configureLockupView:(id)a3 forAppWithConfiguration:(id)a4 serviceContext:(id)a5 metricsReporter:(id)a6
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a6;
  id v11 = [v8 loadLockupPromise];
  id v12 = [v11 promiseAdapter];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100006964;
  v18[3] = &unk_100024EC8;
  id v19 = v9;
  id v20 = v10;
  id v21 = v8;
  id v13 = v8;
  id v14 = v10;
  id v15 = v9;
  v16 = [v12 thenWithBlock:v18];

  return v16;
}

- (ASOServiceAdInteractionAttributor)adInteractionAttributor
{
  return self->_adInteractionAttributor;
}

- (void)setAdInteractionAttributor:(id)a3
{
  self->_adInteractionAttributor = (ASOServiceAdInteractionAttributor *)a3;
}

@end