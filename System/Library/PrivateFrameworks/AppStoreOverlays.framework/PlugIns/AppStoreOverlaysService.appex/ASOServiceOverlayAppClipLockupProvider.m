@interface ASOServiceOverlayAppClipLockupProvider
+ (id)configureLockupView:(id)a3 forAppClipWithConfiguration:(id)a4 serviceContext:(id)a5 metricsReporter:(id)a6;
+ (id)log;
- (id)loadOverlayForConfiguration:(id)a3 delegate:(id)a4 serviceContext:(id)a5 metricsReporter:(id)a6;
- (id)loadOverlayFromDefinition:(id)a3 configuration:(id)a4 serviceContext:(id)a5 metricsReporter:(id)a6;
- (id)lockupDefinitionForConfiguration:(id)a3 serviceContext:(id)a4;
- (id)parentAppLockupRequestForConfiguration:(id)a3 serviceContext:(id)a4;
@end

@implementation ASOServiceOverlayAppClipLockupProvider

+ (id)log
{
  if (qword_10002CAF0 != -1) {
    dispatch_once(&qword_10002CAF0, &stru_100024DB8);
  }
  v2 = (void *)qword_10002CAF8;

  return v2;
}

- (id)loadOverlayForConfiguration:(id)a3 delegate:(id)a4 serviceContext:(id)a5 metricsReporter:(id)a6
{
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  v12 = +[ASOServiceOverlayAppClipLockupProvider log];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    sub_1000180B4();
  }

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v13 = v9;
    v14 = [v13 additionalValueForKey:ASOOverlayConfigurationPrivateParameterOverrideIsAppClip serviceContext:v10];
    unsigned __int8 v15 = [v10 isAppClip];
    if (v14) {
      unsigned __int8 v15 = [v14 BOOLValue];
    }
    if (v15)
    {
      v16 = [(ASOServiceOverlayAppClipLockupProvider *)self lockupDefinitionForConfiguration:v13 serviceContext:v10];
      if (v16)
      {
        v17 = [(ASOServiceOverlayAppClipLockupProvider *)self loadOverlayFromDefinition:v16 configuration:v13 serviceContext:v10 metricsReporter:v11];
        v23[0] = _NSConcreteStackBlock;
        v23[1] = 3221225472;
        v23[2] = sub_1000051C0;
        v23[3] = &unk_100024DE0;
        id v24 = v13;
        id v25 = v10;
        v26 = self;
        id v27 = v11;
        id v28 = v17;
        id v18 = v17;
        v19 = [v18 catchWithBlock:v23];
      }
      else
      {
        v21 = +[ASOServiceOverlayAppClipLockupProvider log];
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
          sub_100017FFC();
        }

        id v18 = +[NSError errorWithDomain:@"ASOErrorDomain" code:3 userInfo:0];
        v19 = +[AMSPromise promiseWithError:v18];
      }
    }
    else
    {
      v20 = +[ASOServiceOverlayAppClipLockupProvider log];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        sub_10001803C((uint64_t)v13, v20);
      }

      v16 = +[NSError errorWithDomain:@"ASOErrorDomain" code:3 userInfo:0];
      v19 = +[AMSPromise promiseWithError:v16];
    }
  }
  else
  {
    id v13 = +[NSError errorWithDomain:@"ASOErrorDomain" code:1 userInfo:0];
    v19 = +[AMSPromise promiseWithError:v13];
  }

  return v19;
}

- (id)loadOverlayFromDefinition:(id)a3 configuration:(id)a4 serviceContext:(id)a5 metricsReporter:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = objc_alloc_init((Class)AMSMutablePromise);
  v14 = +[ASOServiceOverlayAppClipLockupProvider log];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    sub_1000180E8();
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100005410;
  block[3] = &unk_100024E08;
  id v24 = v10;
  id v25 = v9;
  id v26 = v12;
  id v15 = v13;
  id v27 = v15;
  id v28 = v11;
  id v16 = v11;
  id v17 = v12;
  id v18 = v9;
  id v19 = v10;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  v20 = v28;
  id v21 = v15;

  return v21;
}

+ (id)configureLockupView:(id)a3 forAppClipWithConfiguration:(id)a4 serviceContext:(id)a5 metricsReporter:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = [v10 additionalValueForKey:ASOOverlayConfigurationPrivateParameterOverrideIsArcadeApp serviceContext:v11];
  v14 = [v9 loadLockupPromise];
  id v15 = [v14 promiseAdapter];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_1000057BC;
  v23[3] = &unk_100024E30;
  id v24 = v10;
  id v25 = v12;
  id v26 = v9;
  id v27 = v11;
  id v28 = v13;
  id v16 = v13;
  id v17 = v11;
  id v18 = v9;
  id v19 = v12;
  id v20 = v10;
  id v21 = [v15 thenWithBlock:v23];

  return v21;
}

- (id)lockupDefinitionForConfiguration:(id)a3 serviceContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(ASOServiceOverlayAppClipLockupProvider *)self parentAppLockupRequestForConfiguration:v6 serviceContext:v7];
  if (!v8)
  {
    id v11 = [v6 additionalValueForKey:ASOOverlayConfigurationPrivateParameterOverrideIsDevelopment serviceContext:v7];
    unsigned int v12 = [v7 isDevelopmentApp];
    if (v11) {
      unsigned int v12 = [v11 BOOLValue];
    }
    unsigned int v13 = v12;
    v14 = [v6 additionalValueForKey:ASOOverlayConfigurationPrivateParameterOverrideIsBetaApp serviceContext:v7];
    unsigned int v15 = [v7 isBetaApp];
    if (v14) {
      unsigned int v15 = [v14 BOOLValue];
    }
    if (((v13 | v15) & 1) == 0)
    {
      id v17 = +[ASOServiceOverlayAppClipLockupProvider log];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        LOWORD(v23) = 0;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Stopping lockup definition search because this is a production app.", (uint8_t *)&v23, 2u);
      }
      id v10 = 0;
      goto LABEL_24;
    }
    uint64_t v16 = +[ASOServiceOverlayDevelopmentLockupProvider parentAppDevelopmentLockupForConfiguration:v6 serviceContext:v7];
    if (v16)
    {
      id v17 = v16;
      id v18 = +[ASOServiceOverlayAppClipLockupProvider log];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        int v23 = 138412290;
        id v24 = v6;
        id v19 = "Using parent app development lockup: %@";
LABEL_22:
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, v19, (uint8_t *)&v23, 0xCu);
      }
    }
    else
    {
      uint64_t v20 = +[ASOServiceOverlayDevelopmentLockupProvider appDevelopmentLockupForConfiguration:v6 serviceContext:v7];
      if (!v20)
      {
        uint64_t v21 = +[ASOServiceOverlayDevelopmentLockupProvider placeholderAppDevelopmentLockupForConfiguration:v6 serviceContext:v7];
        if (!v21)
        {
          id v10 = 0;
          goto LABEL_25;
        }
        id v17 = v21;
        id v18 = +[ASOServiceOverlayAppClipLockupProvider log];
        if (!os_log_type_enabled(v18, OS_LOG_TYPE_INFO)) {
          goto LABEL_23;
        }
        int v23 = 138412290;
        id v24 = v6;
        id v19 = "Using placeholder app development lockup: %@";
        goto LABEL_22;
      }
      id v17 = v20;
      id v18 = +[ASOServiceOverlayAppClipLockupProvider log];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        int v23 = 138412290;
        id v24 = v6;
        id v19 = "Using app development lockup: %@";
        goto LABEL_22;
      }
    }
LABEL_23:

    id v10 = [[ASOServiceLockupDefinition alloc] initWithLockup:v17];
LABEL_24:

LABEL_25:
    goto LABEL_26;
  }
  id v9 = +[ASOServiceOverlayAppClipLockupProvider log];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    int v23 = 138412290;
    id v24 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Using parent app production lockup: %@", (uint8_t *)&v23, 0xCu);
  }

  id v10 = [[ASOServiceLockupDefinition alloc] initWithRequest:v8];
LABEL_26:

  return v10;
}

- (id)parentAppLockupRequestForConfiguration:(id)a3 serviceContext:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 additionalValueForKey:ASOOverlayConfigurationPrivateParameterIgnoreAdamID serviceContext:v6];
  unsigned __int8 v8 = [v7 BOOLValue];

  if (v8)
  {
    id v9 = 0;
  }
  else
  {
    id v10 = [v5 additionalValueForKey:ASOOverlayConfigurationPrivateParameterOverrideParentAppAdamID serviceContext:v6];
    if (!v10)
    {
      id v10 = [v6 hostAdamID];
    }
    id v11 = +[ASOServiceOverlayAppClipLockupProvider log];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      id v25 = v10;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Parent app adam ID is: %{public}@", buf, 0xCu);
    }

    if (v10)
    {
      int v23 = [v6 applicationRecord];
      id v22 = [objc_alloc((Class)ASCAdamID) initWithStringValue:v10];
      unsigned int v12 = [v23 iTunesMetadata];
      unsigned int v13 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v12 versionIdentifier]);
      v14 = [v13 stringValue];

      id v15 = objc_alloc((Class)ASCLockupRequest);
      uint64_t v16 = ASCLockupKindApp;
      uint64_t v17 = ASCLockupContextOverlayClip;
      id v18 = [v5 latestReleaseID];
      id v19 = [v5 productVariantID];
      id v9 = [v15 _initWithID:v22 kind:v16 context:v17 minExternalVersionID:v14 latestReleaseID:v18 productVariantID:v19];

      uint64_t v20 = v23;
    }
    else
    {
      uint64_t v20 = +[ASOServiceOverlayAppClipLockupProvider log];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v25 = v5;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "Unable to build lockup request for parent app: %@", buf, 0xCu);
      }
      id v9 = 0;
    }
  }

  return v9;
}

@end