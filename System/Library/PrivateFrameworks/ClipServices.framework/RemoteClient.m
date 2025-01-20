@interface RemoteClient
+ (void)_didEndDownloadingAppForBundleID:(id)a3 error:(id)a4 completionHandler:(id)a5;
+ (void)_didEndOpenAppForURL:(id)a3 adamID:(id)a4 error:(id)a5 completionHandler:(id)a6;
+ (void)_didStartDownloadingAppForBundleID:(id)a3;
+ (void)_didStartOpenAppForURL:(id)a3 adamID:(id)a4;
- (AppManager)appManager;
- (BOOL)_canSkipShowingAppClipCardOnLaunchForSession:(id)a3;
- (RemoteClient)init;
- (RemoteClient)initWithConnection:(id)a3 appManager:(id)a4 clipMetadataManager:(id)a5;
- (id)_deducedInstalledFullAppBundleIDForSession:(id)a3;
- (id)_validateIngestedBundleID:(id)a3 forSession:(id)a4 appInstalled:(BOOL *)a5 clipRequestsLocationConfirmation:(BOOL *)a6 clipRequestsNotification:(BOOL *)a7;
- (void)_fetchClipMetadataAndImagesWithURL:(id)a3 prewarmClip:(BOOL)a4 reply:(id)a5;
- (void)_installClipWithURL:(id)a3 options:(id)a4 reply:(id)a5;
- (void)_logOpenAppClipEventForBundleID:(id)a3 session:(id)a4 didOpenFullApp:(BOOL)a5 requiresAppClipInstall:(BOOL)a6;
- (void)_openClipDirectlyWithURL:(id)a3 launchOptions:(id)a4 reply:(id)a5;
- (void)_openClipWithInvocationUIWithURL:(id)a3 reply:(id)a4;
- (void)_remoteClientDisconnected;
- (void)cancelPrewarmingClipWithURL:(id)a3 reply:(id)a4;
- (void)checkAndConsumeShowsAppAttributionBannerForBundleID:(id)a3 completion:(id)a4;
- (void)fetchABRMetadataForDiagnosticsWithURL:(id)a3 reply:(id)a4;
- (void)fetchAMPMetadataForDiagnosticsWithBundleID:(id)a3 reply:(id)a4;
- (void)fetchClipMetadataAndImagesWithURL:(id)a3 reply:(id)a4;
- (void)fetchClipMetadataWithURL:(id)a3 reply:(id)a4;
- (void)fetchClipURLWithURLHash:(id)a3 sourceBundleID:(id)a4 reply:(id)a5;
- (void)getLastLaunchOptionsWithBundleID:(id)a3 reply:(id)a4;
- (void)getUserNotificationConsentForBundleID:(id)a3 reply:(id)a4;
- (void)installClipWithURL:(id)a3 reply:(id)a4;
- (void)isClipURL:(id)a3 reply:(id)a4;
- (void)notifyWebClipActivationWithBundleID:(id)a3 referrerBundleID:(id)a4 reply:(id)a5;
- (void)openClipWithInvocationUIIfNeededWithURL:(id)a3 reply:(id)a4;
- (void)openClipWithURL:(id)a3 launchOptions:(id)a4 reply:(id)a5;
- (void)performValidationWithRequest:(id)a3 reply:(id)a4;
- (void)prewarmClipWithURL:(id)a3 reply:(id)a4;
- (void)registerSessionWithURL:(id)a3 configuration:(id)a4;
- (void)stopStallingCurrentInstallationWithReply:(id)a3;
- (void)uninstallClipWithURL:(id)a3 reply:(id)a4;
- (void)uninstallClipsWithBundleIDs:(id)a3 reply:(id)a4;
- (void)unregisterSessionWithURL:(id)a3;
@end

@implementation RemoteClient

- (RemoteClient)init
{
  return 0;
}

- (RemoteClient)initWithConnection:(id)a3 appManager:(id)a4 clipMetadataManager:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v26.receiver = self;
  v26.super_class = (Class)RemoteClient;
  v11 = [(RemoteClient *)&v26 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_appManager, a4);
    objc_storeStrong((id *)&v12->_clipMetadataManager, a5);
    if (qword_10001A300 != -1) {
      dispatch_once(&qword_10001A300, &stru_100014758);
    }
    [v8 setExportedInterface:qword_10001A2F8];
    [v8 setExportedObject:v12];
    v13 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___CPSSessionObserving];
    [v8 setRemoteObjectInterface:v13];

    v14 = sub_1000051D4();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      v28 = v12;
      __int16 v29 = 2112;
      id v30 = v8;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "RemoteClient (%p): connection established: %@", buf, 0x16u);
    }
    objc_initWeak((id *)buf, v12);
    objc_initWeak(&location, v8);
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_100005760;
    v22[3] = &unk_100014780;
    objc_copyWeak(&v23, (id *)buf);
    objc_copyWeak(&v24, &location);
    [v8 setInterruptionHandler:v22];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100005840;
    v19[3] = &unk_100014780;
    objc_copyWeak(&v20, (id *)buf);
    objc_copyWeak(&v21, &location);
    [v8 setInvalidationHandler:v19];
    [(RemoteClientNotEntitled *)v12 setConnection:v8];
    uint64_t v15 = +[CPSSessionRemoteObserver observerWithXPCProxy:v8];
    sessionObserver = v12->_sessionObserver;
    v12->_sessionObserver = (CPSSessionRemoteObserver *)v15;

    v17 = v12;
    objc_destroyWeak(&v21);
    objc_destroyWeak(&v20);
    objc_destroyWeak(&v24);
    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
    objc_destroyWeak((id *)buf);
  }

  return v12;
}

- (void)_remoteClientDisconnected
{
  [(RemoteClientNotEntitled *)self setConnection:0];
  v3 = +[CPSSessionManager sharedManager];
  v4 = [v3 allSessions];

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * (void)v9), "removeRemoteObjectProxy:", self->_sessionObserver, (void)v10);
        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)isClipURL:(id)a3 reply:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100005B28;
  v7[3] = &unk_1000147A8;
  uint64_t v8 = self;
  id v9 = a3;
  id v10 = a4;
  id v5 = v10;
  id v6 = v9;
  [(RemoteClient *)v8 fetchClipMetadataWithURL:v6 reply:v7];
}

- (void)prewarmClipWithURL:(id)a3 reply:(id)a4
{
}

- (void)fetchClipMetadataAndImagesWithURL:(id)a3 reply:(id)a4
{
}

- (void)_fetchClipMetadataAndImagesWithURL:(id)a3 prewarmClip:(BOOL)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  +[CPSSessionManager sharedManager];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100005D2C;
  v13[3] = &unk_100014820;
  v13[4] = self;
  id v14 = v8;
  BOOL v17 = a4;
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  id v16 = v9;
  id v10 = v15;
  id v11 = v8;
  id v12 = v9;
  [v10 getSessionWithURL:v11 completion:v13];
}

- (void)cancelPrewarmingClipWithURL:(id)a3 reply:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  +[CPSSessionManager sharedManager];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100006424;
  v9[3] = &unk_100014848;
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  id v11 = v5;
  id v7 = v10;
  id v8 = v5;
  [v7 getSessionWithURL:v6 completion:v9];
}

- (void)installClipWithURL:(id)a3 reply:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init((Class)CPSClipLaunchOptions);
  [v8 setSkipsLaunching:1];
  [(RemoteClient *)self _installClipWithURL:v7 options:v8 reply:v6];
}

- (void)openClipWithURL:(id)a3 launchOptions:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *))a5;
  id v11 = [v9 predefinedBundleID];

  if (!v11) {
    goto LABEL_5;
  }
  id v12 = [(RemoteClientNotEntitled *)self connection];
  long long v13 = [v12 valueForEntitlement:@"com.apple.private.ClipServices.request-install-clips"];

  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 && ([v13 BOOLValue])
  {

LABEL_5:
    id v14 = sub_1000051D4();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = v14;
      int v25 = 134218499;
      objc_super v26 = self;
      __int16 v27 = 2117;
      id v28 = v8;
      __int16 v29 = 1024;
      unsigned int v30 = [v9 skipsLaunching];
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "RemoteClient (%p): opening clip with URL (%{sensitive}@) skipLaunching: %d", (uint8_t *)&v25, 0x1Cu);
    }
    [(RemoteClient *)self _installClipWithURL:v8 options:v9 reply:v10];
    goto LABEL_11;
  }
  id v16 = sub_1000051D4();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
    sub_10000A4B4(v16, v17, v18, v19, v20, v21, v22, v23);
  }
  id v24 = +[NSError cps_errorWithCode:12];
  v10[2](v10, v24);

LABEL_11:
}

- (void)uninstallClipWithURL:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  id v8 = [(AppManager *)self->_appManager appLinkResolver];
  id v9 = [v8 appBundleIdentifierForURL:v6];

  if (v9)
  {
    id v12 = v9;
    id v10 = +[NSArray arrayWithObjects:&v12 count:1];
    [(RemoteClient *)self uninstallClipsWithBundleIDs:v10 reply:v7];
  }
  else
  {
    id v11 = sub_1000051D4();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218243;
      id v14 = self;
      __int16 v15 = 2117;
      id v16 = v6;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "RemoteClient (%p): uninstall clip for %{sensitive}@", buf, 0x16u);
    }
    id v10 = +[NSError cps_errorWithCode:2];
    if (v7) {
      v7[2](v7, v10);
    }
  }
}

- (void)uninstallClipsWithBundleIDs:(id)a3 reply:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[CPSClipCleanupManager sharedManager];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100006968;
  v9[3] = &unk_100014870;
  id v10 = v5;
  id v8 = v5;
  [v7 removeClipsByUser:v6 completionHandler:v9];
}

- (void)fetchClipMetadataWithURL:(id)a3 reply:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[CPSSessionManager sharedManager];
  id v8 = [v7 sessionWithURL:v6 createIfNoExist:1];

  id v9 = sub_1000051D4();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    sub_10000A4EC(v9, v10, v11, v12, v13, v14, v15, v16);
  }
  if (CPSClipMetadataFetchIgnoresCache()) {
    [v8 clearMetadataAndRefetch];
  }
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100006AEC;
  v18[3] = &unk_1000146C8;
  id v19 = v5;
  id v17 = v5;
  [v8 fetchMetadataWithCompletion:v18];
}

- (void)fetchClipURLWithURLHash:(id)a3 sourceBundleID:(id)a4 reply:(id)a5
{
}

- (void)openClipWithInvocationUIIfNeededWithURL:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[CPSSessionManager sharedManager];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100006BF8;
  v11[3] = &unk_100014898;
  id v12 = v6;
  id v13 = v7;
  v11[4] = self;
  id v9 = v6;
  id v10 = v7;
  [v8 getSessionWithURL:v9 completion:v11];
}

- (void)_openClipDirectlyWithURL:(id)a3 launchOptions:(id)a4 reply:(id)a5
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100006FB0;
  v9[3] = &unk_1000148C0;
  id v10 = self;
  id v11 = a3;
  id v12 = a5;
  id v7 = v12;
  id v8 = v11;
  [(RemoteClient *)v10 openClipWithURL:v8 launchOptions:a4 reply:v9];
}

- (void)_openClipWithInvocationUIWithURL:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[CPSOpenClipCardPresenter sharedPresenter];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100007104;
  v11[3] = &unk_1000148E8;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 showCardWithURL:v10 completionHandler:v11];
}

- (void)stopStallingCurrentInstallationWithReply:(id)a3
{
  v3 = (void (**)(id, id))a3;
  id v6 = +[CPSSessionManager sharedManager];
  v4 = [v6 legacyInstaller];

  if (v4) {
    [v6 legacyInstaller];
  }
  else {
  id v5 = [v6 clipInstaller];
  }
  v3[2](v3, [v5 stopStallingCurrentInstallation]);
}

- (id)_validateIngestedBundleID:(id)a3 forSession:(id)a4 appInstalled:(BOOL *)a5 clipRequestsLocationConfirmation:(BOOL *)a6 clipRequestsNotification:(BOOL *)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = v12;
  if (v11)
  {
    uint64_t v14 = [v12 configuration];
    unsigned __int8 v15 = [v14 usedByPPT];

    if (v15)
    {
LABEL_5:
      id v19 = v11;
      goto LABEL_7;
    }
    id v16 = [objc_alloc((Class)LSApplicationRecord) initWithBundleIdentifier:v11 allowPlaceholder:0 error:0];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = [v16 appClipMetadata];
      *a5 = 1;
      *a7 = [v18 wantsEphemeralNotifications];
      *a6 = [v18 wantsLocationConfirmation];

      goto LABEL_5;
    }
  }
  id v19 = 0;
LABEL_7:

  return v19;
}

- (id)_deducedInstalledFullAppBundleIDForSession:(id)a3
{
  id v3 = a3;
  v4 = [v3 configuration];
  id v5 = [v4 fallbackClipBundleID];

  id v6 = [v3 metadata];
  id v7 = [v6 fullAppBundleID];
  if (![v7 length])
  {
    id v8 = [v3 configuration];
    id v9 = [v8 launchReason];
    if ([v9 isEqualToString:CPSSessionLaunchReasonMessages])
    {
      id v10 = [v5 length];

      if (!v10 || (id v11 = [v5 rangeOfString:@"." options:4], v11 == (id)0x7FFFFFFFFFFFFFFFLL))
      {
        id v12 = 0;
        goto LABEL_9;
      }
      id v6 = [v5 substringToIndex:v11];
      id v7 = [objc_alloc((Class)LSApplicationRecord) initWithBundleIdentifier:v6 allowPlaceholder:0 error:0];
      if (v7)
      {
        uint64_t v14 = [v3 url];
        unsigned __int8 v15 = [v7 applicationIdentifier];
        unsigned int v16 = +[CPSUtilities validDomainAssociationWithAnyServiceTypeForURL:v14 applicationIdentifier:v15];

        if (v16) {
          id v17 = v6;
        }
        else {
          id v17 = 0;
        }
        id v12 = v17;
        goto LABEL_8;
      }
    }
    else
    {
    }
  }
  id v12 = 0;
LABEL_8:

LABEL_9:

  return v12;
}

- (void)_installClipWithURL:(id)a3 options:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  +[RemoteClient _didStartOpenAppForURL:v8 adamID:0];
  +[CPSSessionManager sharedManager];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100007668;
  v15[3] = &unk_100014A50;
  v15[4] = self;
  id v16 = v9;
  id v18 = (id)objc_claimAutoreleasedReturnValue();
  id v19 = v10;
  id v17 = v8;
  id v11 = v18;
  id v12 = v10;
  id v13 = v8;
  id v14 = v9;
  [v11 getSessionWithURL:v13 completion:v15];
}

- (BOOL)_canSkipShowingAppClipCardOnLaunchForSession:(id)a3
{
  id v4 = a3;
  id v5 = [(RemoteClient *)self _deducedInstalledFullAppBundleIDForSession:v4];

  if (v5)
  {
    unsigned __int8 v6 = 1;
  }
  else
  {
    char v11 = 0;
    id v7 = [v4 configuration];
    unsigned __int8 v6 = 0;
    if ([v7 mayLaunchWithoutInvocationUI])
    {
      id v8 = [v4 metadata];
      if (![v8 hasUpToDateVersionInstalledOnSystemIsPlaceholder:&v11] || v11)
      {
        id v9 = [v4 metadata];
        unsigned __int8 v6 = [v9 hasFullAppInstalledOnSystem];
      }
      else
      {
        unsigned __int8 v6 = 1;
      }
    }
  }

  return v6;
}

- (void)_logOpenAppClipEventForBundleID:(id)a3 session:(id)a4 didOpenFullApp:(BOOL)a5 requiresAppClipInstall:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v10 = a4;
  id v11 = a3;
  id v17 = +[CPSAnalyticsLogger sharedLogger];
  id v12 = [v10 configuration];
  id v13 = [v12 launchReason];
  uint64_t v14 = [(RemoteClient *)self _canSkipShowingAppClipCardOnLaunchForSession:v10] ^ 1;
  unsigned __int8 v15 = [v10 url];

  id v16 = objc_msgSend(v15, "cps_fallbackBundleIdentifier");
  [v17 recordDidOpenAppClipWithBundleID:v11 launchReason:v13 didShowCard:v14 didOpenFullApp:v7 didInstallAppClip:v6 isOutOfBoxURL:v16 != 0];
}

+ (void)_didStartDownloadingAppForBundleID:(id)a3
{
  id v4 = a3;
  id v5 = sub_1000051D4();
  if (os_signpost_enabled(v5))
  {
    LOWORD(v7) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "downloadAppAction", "start downloading app", (uint8_t *)&v7, 2u);
  }
  BOOL v6 = sub_1000051D4();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v7 = 134218243;
    id v8 = a1;
    __int16 v9 = 2113;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "RemoteClient (%p): downloading clip for bundleID: %{private}@", (uint8_t *)&v7, 0x16u);
  }
}

+ (void)_didEndDownloadingAppForBundleID:(id)a3 error:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, id))a5;
  id v11 = sub_1000051D4();
  if (os_signpost_enabled(v11))
  {
    LOWORD(v14) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "downloadAppAction", "end downloading app", (uint8_t *)&v14, 2u);
  }
  id v12 = sub_1000051D4();
  id v13 = v12;
  if (v9)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10000A688((uint64_t)a1, v13, v9);
    }
  }
  else if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    int v14 = 134218243;
    id v15 = a1;
    __int16 v16 = 2113;
    id v17 = v8;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "RemoteClient (%p): success in downloading clip for bundleID: %{private}@", (uint8_t *)&v14, 0x16u);
  }
  if (v10) {
    v10[2](v10, v9);
  }
}

+ (void)_didStartOpenAppForURL:(id)a3 adamID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_1000051D4();
  if (os_signpost_enabled(v8))
  {
    LOWORD(v12) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "openAppAction", "start open app", (uint8_t *)&v12, 2u);
  }
  id v9 = sub_1000051D4();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
  if (v6)
  {
    if (v10)
    {
      int v12 = 134218243;
      id v13 = a1;
      __int16 v14 = 2117;
      id v15 = v6;
      id v11 = "RemoteClient (%p): opening clip for %{sensitive}@";
LABEL_8:
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, v11, (uint8_t *)&v12, 0x16u);
    }
  }
  else if (v10)
  {
    int v12 = 134218243;
    id v13 = a1;
    __int16 v14 = 2117;
    id v15 = v7;
    id v11 = "RemoteClient (%p): opening clip for adamID: %{sensitive}@";
    goto LABEL_8;
  }
}

+ (void)_didEndOpenAppForURL:(id)a3 adamID:(id)a4 error:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void (**)(id, id))a6;
  __int16 v14 = sub_1000051D4();
  if (os_signpost_enabled(v14))
  {
    LOWORD(v19) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v14, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "openAppAction", "end open app", (uint8_t *)&v19, 2u);
  }
  if (v12)
  {
    id v15 = sub_1000051D4();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_10000A730((uint64_t)a1, v15, v12);
    }
  }
  else
  {
    __int16 v16 = sub_1000051D4();
    BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_INFO);
    if (v10)
    {
      if (!v17) {
        goto LABEL_12;
      }
      int v19 = 134218243;
      id v20 = a1;
      __int16 v21 = 2117;
      id v22 = v10;
      id v18 = "RemoteClient (%p): success in opening clip for %{sensitive}@";
    }
    else
    {
      if (!v17) {
        goto LABEL_12;
      }
      int v19 = 134218243;
      id v20 = a1;
      __int16 v21 = 2117;
      id v22 = v11;
      id v18 = "RemoteClient (%p): success in opening clip for adamID: %{sensitive}@";
    }
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, v18, (uint8_t *)&v19, 0x16u);
  }
LABEL_12:
  if (v13) {
    v13[2](v13, v12);
  }
}

- (void)registerSessionWithURL:(id)a3 configuration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (+[CPSClipURL isSupported])
  {
    id v8 = +[CPSSessionManager sharedManager];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000092F8;
    v10[3] = &unk_100014A78;
    id v11 = v6;
    id v12 = self;
    [v8 getSessionWithURL:v11 configuration:v7 completion:v10];
  }
  else
  {
    id v9 = sub_1000051D4();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "registerSessionWithURL: App clips are unsupported", buf, 2u);
    }
  }
}

- (void)unregisterSessionWithURL:(id)a3
{
  id v4 = a3;
  id v5 = +[CPSSessionManager sharedManager];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100009514;
  v7[3] = &unk_100014A78;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  [v5 getSessionWithURL:v6 completion:v7];
}

- (void)getUserNotificationConsentForBundleID:(id)a3 reply:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[CPSClipDataSQLiteStore defaultStore];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100009658;
  v9[3] = &unk_100014AA0;
  id v10 = v5;
  id v8 = v5;
  [v7 getAppClipRecordWithBundleID:v6 completion:v9];
}

- (void)notifyWebClipActivationWithBundleID:(id)a3 referrerBundleID:(id)a4 reply:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = a3;
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  id v11 = +[CPSWebClipStore sharedStore];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100009844;
  v14[3] = &unk_100014AF0;
  id v15 = v7;
  id v16 = v8;
  CFAbsoluteTime v17 = Current;
  id v12 = v7;
  id v13 = v8;
  [v11 getAppClipWithIdentifier:v9 receiveOnQueue:&_dispatch_main_q completionHandler:v14];
}

- (void)getLastLaunchOptionsWithBundleID:(id)a3 reply:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[CPSClipDataSQLiteStore defaultStore];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100009D94;
  v9[3] = &unk_100014AA0;
  id v10 = v5;
  id v8 = v5;
  [v7 getAppClipRecordWithBundleID:v6 completion:v9];
}

- (void)checkAndConsumeShowsAppAttributionBannerForBundleID:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[CPSWebClipStore sharedStore];
  id v8 = [v7 synchronouslyGetAppClipWithIdentifier:v6];

  if (v8)
  {
    id v9 = +[CPSSessionManager sharedManager];
    id v10 = [v8 pageURL];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100009F54;
    v11[3] = &unk_100014B18;
    id v12 = v5;
    [v9 getSessionWithURL:v10 completion:v11];
  }
  else
  {
    (*((void (**)(id, void))v5 + 2))(v5, 0);
  }
}

- (void)performValidationWithRequest:(id)a3 reply:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [objc_alloc((Class)CPSURLValidator) initWithRequest:v6];

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10000A068;
  v9[3] = &unk_100014B40;
  id v10 = v5;
  id v8 = v5;
  [v7 validateWithCompletion:v9];
}

- (void)fetchABRMetadataForDiagnosticsWithURL:(id)a3 reply:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_alloc_init((Class)CPSBusinessItemFetcher);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10000A144;
  v9[3] = &unk_1000146C8;
  id v10 = v5;
  id v8 = v5;
  [v7 fetchBusinessMetadataForURL:v6 availabilityHandler:0 completion:v9];
}

- (void)fetchAMPMetadataForDiagnosticsWithBundleID:(id)a3 reply:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init((Class)CPSAppInfoFetcher);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10000A22C;
  v10[3] = &unk_100014B68;
  void v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  [v8 lookUpClipMetadataByBundleID:v7 sourceBundleID:0 downloadIconIfNeeded:0 skipCaching:1 completionHandler:v10];
}

- (AppManager)appManager
{
  return self->_appManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appManager, 0);
  objc_storeStrong((id *)&self->_sessionObserver, 0);

  objc_storeStrong((id *)&self->_clipMetadataManager, 0);
}

@end