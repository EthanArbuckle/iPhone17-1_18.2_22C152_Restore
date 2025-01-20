@interface FamilyCircleServiceDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (FAFamilyFetchActivityScheduler)familyRefreshActivityScheduler;
- (FAMarqueeUpdateHandler)marqueeUpdateHandler;
- (FAQueueProvider)queueProvider;
- (FamilyCircleServiceDelegate)initWithQueueProvider:(id)a3;
- (id)_applyScreenTimeModel:(id)a3 dsid:(id)a4;
- (id)_familyGrandSlamSignerWithAccountStore:(id)a3;
- (id)_fetchFamilyCircleWithCachePolicy:(unint64_t)a3 signedInAccountShouldBeApprover:(BOOL)a4 clientProcess:(id)a5 context:(id)a6 promptUserToResolveAuthenticatonFailure:(BOOL)a7;
- (id)_grandSlamAccountForAccountStore:(id)a3;
- (id)_grandSlamSignerWithAccountStore:(id)a3;
- (id)_networkService;
- (id)_primaryAccount;
- (id)_turnOnScreentimeForDSID:(id)a3;
- (void)cacheObjectSettings:(id)a3 dsid:(id)a4 options:(id)a5 replyBlock:(id)a6;
- (void)cancelChildTransferRequest:(id)a3 replyBlock:(id)a4;
- (void)cancelInvitationWith:(id)a3 familyID:(id)a4 options:(id)a5 replyBlock:(id)a6;
- (void)clearFamilyCircleCacheWithReplyBlock:(id)a3;
- (void)clearPhotoCacheWithReplyBlock:(id)a3;
- (void)didAddAccount:(id)a3 replyBlock:(id)a4;
- (void)didDeleteAccount:(id)a3 replyBlock:(id)a4;
- (void)didReceiveFamilyEventPushNotificationWithPayload:(id)a3 options:(id)a4 replyBlock:(id)a5;
- (void)enableSettingsForMemberDSID:(id)a3 options:(id)a4 replyBlock:(id)a5;
- (void)enableSettingsForMemberDSID:(id)a3 screentimeModelCache:(id)a4 options:(id)a5 replyBlock:(id)a6;
- (void)familyChecklistRankingConfigWithCachePolicy:(unint64_t)a3 replyBlock:(id)a4;
- (void)fetchEligibilityForPropertyName:(id)a3 bundleID:(id)a4 completion:(id)a5;
- (void)fetchFamilyCircleWithCachePolicy:(unint64_t)a3 signedInAccountShouldBeApprover:(BOOL)a4 context:(id)a5 options:(id)a6 replyBlock:(id)a7;
- (void)fetchFamilyMemberPhotoWithDSID:(id)a3 hashedDSID:(id)a4 size:(int64_t)a5 localFallback:(BOOL)a6 options:(id)a7 replyBlock:(id)a8;
- (void)fetchFollowupsWithAltDSID:(id)a3 options:(id)a4 replyBlock:(id)a5;
- (void)fetchSettingsPresetsForAge:(id)a3 fromCache:(BOOL)a4 options:(id)a5 replyBlock:(id)a6;
- (void)fetchSettingsPresetsForMemberWithAltDSID:(id)a3 fromCache:(BOOL)a4 options:(id)a5 replyBlock:(id)a6;
- (void)handleContactsChanged;
- (void)launchICloudFamilySettingsWithOptions:(id)a3;
- (void)launchOutOfProcessFamilyWithOptions:(id)a3 completion:(id)a4;
- (void)registerPushToken:(id)a3 options:(id)a4 replyBlock:(id)a5;
- (void)removeFamilyMemberWithDSID:(id)a3 options:(id)a4 replyBlock:(id)a5;
- (void)removeFamilyWithReplyBlock:(id)a3;
- (void)resendChildTransferRequest:(id)a3 replyBlock:(id)a4;
- (void)runHeartbeatWithOptions:(id)a3 replyBlock:(id)a4;
- (void)setFamilyRefreshActivityScheduler:(id)a3;
- (void)setMarqueeUpdateHandler:(id)a3;
- (void)updateFamilyInviteStatusWith:(int64_t)a3 inviteCode:(id)a4 options:(id)a5 responseFormat:(int64_t)a6 additionalRequestParameters:(id)a7 replyBlock:(id)a8;
- (void)updateFamilyMemberFlagWithDSID:(id)a3 ephemeralAuthResults:(id)a4 flag:(id)a5 enabled:(BOOL)a6 replyBlock:(id)a7;
- (void)updateFamilyMemberFlagsWithDSID:(id)a3 flags:(id)a4 replyBlock:(id)a5;
@end

@implementation FamilyCircleServiceDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  v6 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___FAServiceProtocol];
  [v6 setClass:objc_opt_class() forSelector:"cacheObjectSettings:dsid:options:replyBlock:" argumentIndex:0 ofReply:0];
  [v5 setExportedInterface:v6];
  [v5 setExportedObject:self];
  [v5 resume];

  return 1;
}

- (id)_primaryAccount
{
  v2 = +[ACAccountStore defaultStore];
  v3 = objc_msgSend(v2, "aa_primaryAppleAccount");

  return v3;
}

- (id)_networkService
{
  v3 = objc_alloc_init(FADeviceInfo);
  v4 = [FANetworkService alloc];
  id v5 = [(FamilyCircleServiceDelegate *)self _primaryAccount];
  v6 = objc_opt_new();
  v7 = +[AAURLSession sharedSession];
  v8 = [(FamilyCircleServiceDelegate *)self familyRefreshActivityScheduler];
  v9 = [(FANetworkService *)v4 initWithAccount:v5 deviceInfo:v3 urlProvider:v6 urlSession:v7 familyRefreshActivityScheduler:v8];

  return v9;
}

- (void)fetchFamilyCircleWithCachePolicy:(unint64_t)a3 signedInAccountShouldBeApprover:(BOOL)a4 context:(id)a5 options:(id)a6 replyBlock:(id)a7
{
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  v15 = [(FamilyCircleServiceDelegate *)self queueProvider];
  v16 = [v15 requestQueueWithOptions:v13];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1000069D4;
  v20[3] = &unk_10004DE58;
  id v23 = v14;
  unint64_t v24 = a3;
  BOOL v25 = a4;
  v20[4] = self;
  id v21 = v13;
  id v22 = v12;
  id v17 = v14;
  id v18 = v12;
  id v19 = v13;
  dispatch_async(v16, v20);
}

- (id)_fetchFamilyCircleWithCachePolicy:(unint64_t)a3 signedInAccountShouldBeApprover:(BOOL)a4 clientProcess:(id)a5 context:(id)a6 promptUserToResolveAuthenticatonFailure:(BOOL)a7
{
  BOOL v24 = a7;
  BOOL v8 = a4;
  id v10 = a6;
  id v11 = a5;
  id v12 = [FAFamilyCircleCache alloc];
  id v13 = [(FamilyCircleServiceDelegate *)self _primaryAccount];
  id v14 = [(FAFamilyCircleCache *)v12 initWithAccount:v13];

  v15 = objc_alloc_init(FAMarqueeUpdateHandler);
  v16 = [FAFetchFamilyCircleOperation alloc];
  id v17 = [(FamilyCircleServiceDelegate *)self _networkService];
  id v18 = +[FARequestCoalescer sharedInstance];
  id v19 = [(FamilyCircleServiceDelegate *)self familyRefreshActivityScheduler];
  v20 = [(FAFetchFamilyCircleOperation *)v16 initWithNetworkService:v17 cache:v14 marqueeCacheHanlder:v15 requestCoalescer:v18 familyRefreshActivityScheduler:v19];

  [(FAFetchFamilyCircleOperation *)v20 setSignedInAccountShouldBeApprover:v8];
  [(FAFetchFamilyCircleOperation *)v20 setCachePolicy:a3];
  [(FAFetchFamilyCircleOperation *)v20 setClientProcess:v11];

  [(FAFetchFamilyCircleOperation *)v20 setContext:v10];
  [(FAFetchFamilyCircleOperation *)v20 setPromptUserToResolveAuthenticatonFailure:v24];
  id v21 = [(FAFetchFamilyCircleOperation *)v20 fetchFamilyCircle];

  return v21;
}

- (FAQueueProvider)queueProvider
{
  return self->_queueProvider;
}

- (FAFamilyFetchActivityScheduler)familyRefreshActivityScheduler
{
  return self->_familyRefreshActivityScheduler;
}

- (FamilyCircleServiceDelegate)initWithQueueProvider:(id)a3
{
  id v5 = a3;
  v26.receiver = self;
  v26.super_class = (Class)FamilyCircleServiceDelegate;
  v6 = [(FamilyCircleServiceDelegate *)&v26 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_queueProvider, a3);
    BOOL v8 = [[FAActivityManager alloc] initWithQueueProvider:v5];
    activityManager = v7->_activityManager;
    v7->_activityManager = v8;

    [(FAActivityManager *)v7->_activityManager checkinXPCActivities];
    objc_initWeak(&location, v7);
    id v10 = objc_alloc_init(FAMarqueeUpdateHandler);
    marqueeUpdateHandler = v7->_marqueeUpdateHandler;
    v7->_marqueeUpdateHandler = v10;

    id v12 = objc_alloc((Class)FAFamilyFetchActivityScheduler);
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_100014CF0;
    v23[3] = &unk_10004DDB8;
    objc_copyWeak(&v24, &location);
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_100014E10;
    v21[3] = &unk_10004DE08;
    id v13 = v7;
    id v22 = v13;
    id v14 = [v12 initWithFamilyCircleFetchBlock:v23 cacheLoadBlock:v21];
    id v15 = v13[3];
    v13[3] = v14;

    [v13[3] reschedule];
    +[FAFamilyCFUScheduler scheduleWakeupIfNeeded];
    v16 = [FAXPCEventObserver alloc];
    id v17 = objc_alloc_init(_TtC13familycircled16XPCStreamHandler);
    id v18 = [(FAXPCEventObserver *)v16 initWithStream:v17 delegate:v13];
    id v19 = v13[2];
    v13[2] = v18;

    [v13[2] start];
    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
  }

  return v7;
}

- (void)handleContactsChanged
{
  v2 = objc_alloc_init(FAMarqueeUpdateHandler);
  [(FAMarqueeUpdateHandler *)v2 updateMarqueeCache];
}

- (void)removeFamilyMemberWithDSID:(id)a3 options:(id)a4 replyBlock:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  id v11 = [(FamilyCircleServiceDelegate *)self queueProvider];
  id v12 = [v11 requestQueueWithOptions:v10];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100015054;
  block[3] = &unk_10004DBE0;
  block[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v12, block);
}

- (void)removeFamilyWithReplyBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(FamilyCircleServiceDelegate *)self queueProvider];
  v6 = [v5 requestQueueWithOptions:0];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10001528C;
  v8[3] = &unk_10004D878;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

- (void)fetchFamilyMemberPhotoWithDSID:(id)a3 hashedDSID:(id)a4 size:(int64_t)a5 localFallback:(BOOL)a6 options:(id)a7 replyBlock:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a7;
  id v17 = a8;
  id v18 = [(FamilyCircleServiceDelegate *)self queueProvider];
  id v19 = [v18 requestQueueWithOptions:v16];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100015528;
  block[3] = &unk_10004DF20;
  block[4] = self;
  id v25 = v14;
  BOOL v30 = a6;
  id v26 = v15;
  id v27 = v16;
  id v28 = v17;
  int64_t v29 = a5;
  id v20 = v17;
  id v21 = v16;
  id v22 = v15;
  id v23 = v14;
  dispatch_async(v19, block);
}

- (void)registerPushToken:(id)a3 options:(id)a4 replyBlock:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  id v11 = [(FamilyCircleServiceDelegate *)self queueProvider];
  id v12 = [v11 requestQueueWithOptions:v10];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000159FC;
  block[3] = &unk_10004DBE0;
  block[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v12, block);
}

- (void)clearFamilyCircleCacheWithReplyBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(FamilyCircleServiceDelegate *)self queueProvider];
  v6 = [v5 requestQueueWithOptions:0];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100015BC4;
  v8[3] = &unk_10004D878;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

- (void)clearPhotoCacheWithReplyBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(FamilyCircleServiceDelegate *)self queueProvider];
  v6 = [v5 requestQueueWithOptions:0];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100015E8C;
  block[3] = &unk_10004DF48;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, block);
}

- (void)didReceiveFamilyEventPushNotificationWithPayload:(id)a3 options:(id)a4 replyBlock:(id)a5
{
  id v6 = a5;
  id v7 = [(FamilyCircleServiceDelegate *)self _networkService];
  id v8 = [(FamilyCircleServiceDelegate *)self familyRefreshActivityScheduler];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000160FC;
  v10[3] = &unk_10004DE30;
  id v11 = v6;
  id v9 = v6;
  +[FAFamilyCircleDaemonChangeHandler handleDidReceivePushEventWithNetworkService:v7 familyRefreshActivityScheduler:v8 completion:v10];
}

- (void)updateFamilyMemberFlagWithDSID:(id)a3 ephemeralAuthResults:(id)a4 flag:(id)a5 enabled:(BOOL)a6 replyBlock:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  id v16 = [(FamilyCircleServiceDelegate *)self queueProvider];
  id v17 = [v16 requestQueueWithOptions:0];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100016258;
  v22[3] = &unk_10004DF98;
  id v23 = v13;
  id v24 = self;
  id v25 = v12;
  id v26 = v14;
  BOOL v28 = a6;
  id v27 = v15;
  id v18 = v15;
  id v19 = v14;
  id v20 = v12;
  id v21 = v13;
  dispatch_async(v17, v22);
}

- (void)updateFamilyMemberFlagsWithDSID:(id)a3 flags:(id)a4 replyBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(FamilyCircleServiceDelegate *)self queueProvider];
  id v12 = [v11 requestQueueWithOptions:0];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100016614;
  v16[3] = &unk_10004DC88;
  v16[4] = self;
  id v17 = v8;
  id v18 = v9;
  id v19 = v10;
  id v13 = v10;
  id v14 = v9;
  id v15 = v8;
  dispatch_async(v12, v16);
}

- (void)launchICloudFamilySettingsWithOptions:(id)a3
{
  id v3 = a3;
  id v5 = +[LSApplicationWorkspace defaultWorkspace];
  id v4 = +[NSURL URLWithString:@"prefs:root=APPLE_ACCOUNT&path=FAMILY"];
  [v5 openSensitiveURL:v4 withOptions:v3];
}

- (void)launchOutOfProcessFamilyWithOptions:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_alloc_init(FARemotePresenter);
  id v8 = _FALogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Presenting remote user interface", buf, 2u);
  }

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100016960;
  v11[3] = &unk_10004DFC0;
  id v12 = v7;
  id v13 = v5;
  id v9 = v7;
  id v10 = v5;
  [(FARemotePresenter *)v9 presentRemoteUserInterfaceWithOptions:v6 completion:v11];
}

- (void)fetchEligibilityForPropertyName:(id)a3 bundleID:(id)a4 completion:(id)a5
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100016A64;
  v10[3] = &unk_10004DFE8;
  id v11 = self;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v7 = v13;
  id v8 = v12;
  id v9 = v14;
  [(FamilyCircleServiceDelegate *)v11 fetchFamilyCircleWithCachePolicy:0 signedInAccountShouldBeApprover:0 context:0 options:0 replyBlock:v10];
}

- (void)fetchFollowupsWithAltDSID:(id)a3 options:(id)a4 replyBlock:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = [(FamilyCircleServiceDelegate *)self queueProvider];
  id v10 = [v9 requestQueueWithOptions:v8];

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100016C30;
  v12[3] = &unk_10004D878;
  v12[4] = self;
  id v13 = v7;
  id v11 = v7;
  dispatch_async(v10, v12);
}

- (void)didAddAccount:(id)a3 replyBlock:(id)a4
{
  if (a3 && a4) {
    -[FAActivityManager handleAccountAddition:completion:](self->_activityManager, "handleAccountAddition:completion:");
  }
  id v6 = objc_alloc_init((Class)FAURLConfiguration);
  [v6 fetchAAURLConfigurationWithCompletion:&stru_10004E028];
  id v5 = [(FamilyCircleServiceDelegate *)self marqueeUpdateHandler];
  [v5 updateMarqueeCache];
}

- (void)didDeleteAccount:(id)a3 replyBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v6 && v7) {
    [(FAActivityManager *)self->_activityManager handleAccountDeletion:v6 completion:v7];
  }
  id v9 = _FALogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    sub_1000358A8();
  }

  id v10 = +[PDSRegistrarService sharedInstance];
  [v10 removeRegistrationFromPDS];

  id v11 = +[NSUserDefaults standardUserDefaults];
  [v11 removeObjectForKey:FAFamilySettingRowFamilyCountKey];

  id v12 = +[NSUserDefaults standardUserDefaults];
  [v12 removeObjectForKey:FAFamilySettingRowPendingInvitesKey];

  id v13 = _FALogSystem();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    sub_100035874();
  }

  id v14 = objc_alloc((Class)FLFollowUpController);
  id v15 = [v14 initWithClientIdentifier:FAFollowUpClientIdentifier];
  id v20 = 0;
  unsigned __int8 v16 = [v15 clearPendingFollowUpItems:&v20];
  id v17 = v20;
  if ((v16 & 1) == 0)
  {
    id v18 = _FALogSystem();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_1000357E0(v17, v18);
    }
  }
  id v19 = [(FamilyCircleServiceDelegate *)self marqueeUpdateHandler];
  [v19 updateMarqueeCache];
}

- (id)_grandSlamAccountForAccountStore:(id)a3
{
  id v4 = a3;
  id v5 = [(FamilyCircleServiceDelegate *)self _primaryAccount];
  id v6 = objc_msgSend(v4, "aa_grandSlamAccountForiCloudAccount:", v5);

  return v6;
}

- (id)_grandSlamSignerWithAccountStore:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)AAGrandSlamSigner);
  id v6 = [(FamilyCircleServiceDelegate *)self _grandSlamAccountForAccountStore:v4];
  id v7 = [v5 initWithAccountStore:v4 grandSlamAccount:v6 appTokenID:AAGrandSlamAppTokenIDiCloudSettings];

  return v7;
}

- (id)_familyGrandSlamSignerWithAccountStore:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)AAGrandSlamSigner);
  id v6 = [(FamilyCircleServiceDelegate *)self _grandSlamAccountForAccountStore:v4];
  id v7 = [v5 initWithAccountStore:v4 grandSlamAccount:v6 appTokenID:AAGrandSlamAppTokenIDFamilySharing];

  [v7 setHeaderFieldKey:AAFamilyGrandSlamTokenHeaderKey];
  return v7;
}

- (void)runHeartbeatWithOptions:(id)a3 replyBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(FamilyCircleServiceDelegate *)self queueProvider];
  id v9 = [v8 requestQueueWithOptions:v7];

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000171FC;
  v11[3] = &unk_10004D878;
  void v11[4] = self;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(v9, v11);
}

- (void)fetchSettingsPresetsForMemberWithAltDSID:(id)a3 fromCache:(BOOL)a4 options:(id)a5 replyBlock:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = [(FamilyCircleServiceDelegate *)self queueProvider];
  id v14 = [v13 requestQueueWithOptions:v11];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000175A8;
  block[3] = &unk_10004E050;
  void block[4] = self;
  id v19 = v11;
  BOOL v22 = a4;
  id v20 = v10;
  id v21 = v12;
  id v15 = v12;
  id v16 = v10;
  id v17 = v11;
  dispatch_async(v14, block);
}

- (void)fetchSettingsPresetsForAge:(id)a3 fromCache:(BOOL)a4 options:(id)a5 replyBlock:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  id v12 = a5;
  id v13 = [(FamilyCircleServiceDelegate *)self queueProvider];
  id v14 = [v13 requestQueueWithOptions:v12];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000177F8;
  block[3] = &unk_10004E0B8;
  BOOL v20 = a4;
  id v18 = v10;
  id v19 = v11;
  id v15 = v11;
  id v16 = v10;
  dispatch_async(v14, block);
}

- (void)updateFamilyInviteStatusWith:(int64_t)a3 inviteCode:(id)a4 options:(id)a5 responseFormat:(int64_t)a6 additionalRequestParameters:(id)a7 replyBlock:(id)a8
{
  id v14 = a4;
  id v15 = a7;
  id v16 = a8;
  id v17 = a5;
  id v18 = [(FamilyCircleServiceDelegate *)self queueProvider];
  id v19 = [v18 requestQueueWithOptions:v17];

  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_1000179EC;
  v23[3] = &unk_10004E0E0;
  void v23[4] = self;
  id v24 = v14;
  int64_t v27 = a3;
  int64_t v28 = a6;
  id v25 = v15;
  id v26 = v16;
  id v20 = v16;
  id v21 = v15;
  id v22 = v14;
  dispatch_async(v19, v23);
}

- (void)cancelInvitationWith:(id)a3 familyID:(id)a4 options:(id)a5 replyBlock:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  id v12 = [(FamilyCircleServiceDelegate *)self queueProvider];
  id v13 = [v12 requestQueueWithOptions:0];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100017C50;
  v17[3] = &unk_10004DC88;
  v17[4] = self;
  id v18 = v9;
  id v19 = v10;
  id v20 = v11;
  id v14 = v11;
  id v15 = v10;
  id v16 = v9;
  dispatch_async(v13, v17);
}

- (void)cacheObjectSettings:(id)a3 dsid:(id)a4 options:(id)a5 replyBlock:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = a5;
  id v14 = [(FamilyCircleServiceDelegate *)self queueProvider];
  id v15 = [v14 requestQueueWithOptions:v13];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100017E68;
  block[3] = &unk_10004DBE0;
  id v20 = v11;
  id v21 = v10;
  id v22 = v12;
  id v16 = v12;
  id v17 = v10;
  id v18 = v11;
  dispatch_async(v15, block);
}

- (void)resendChildTransferRequest:(id)a3 replyBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[ACAccountStore defaultStore];
  id v9 = [FAResendChildTransferRequestOperation alloc];
  id v10 = [(FamilyCircleServiceDelegate *)self _networkService];
  id v11 = [(FamilyCircleServiceDelegate *)self _grandSlamSignerWithAccountStore:v8];
  id v12 = [(FamilyCircleServiceDelegate *)self _familyGrandSlamSignerWithAccountStore:v8];
  id v13 = [(FAResendChildTransferRequestOperation *)v9 initWithNetworkService:v10 grandSlamSigner:v11 familyGrandSlamSigner:v12 email:v7 isResend:1];

  id v14 = [(FamilyCircleServiceDelegate *)self queueProvider];
  id v15 = [v14 requestQueueWithOptions:0];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100018120;
  v18[3] = &unk_10004D878;
  id v19 = v13;
  id v20 = v6;
  id v16 = v6;
  id v17 = v13;
  dispatch_async(v15, v18);
}

- (void)cancelChildTransferRequest:(id)a3 replyBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[ACAccountStore defaultStore];
  id v9 = [FAResendChildTransferRequestOperation alloc];
  id v10 = [(FamilyCircleServiceDelegate *)self _networkService];
  id v11 = [(FamilyCircleServiceDelegate *)self _grandSlamSignerWithAccountStore:v8];
  id v12 = [(FamilyCircleServiceDelegate *)self _familyGrandSlamSignerWithAccountStore:v8];
  id v13 = [(FAResendChildTransferRequestOperation *)v9 initWithNetworkService:v10 grandSlamSigner:v11 familyGrandSlamSigner:v12 email:v7 isResend:1];

  id v14 = [(FamilyCircleServiceDelegate *)self queueProvider];
  id v15 = [v14 requestQueueWithOptions:0];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1000183DC;
  v18[3] = &unk_10004D878;
  id v19 = v13;
  id v20 = v6;
  id v16 = v6;
  id v17 = v13;
  dispatch_async(v15, v18);
}

- (void)familyChecklistRankingConfigWithCachePolicy:(unint64_t)a3 replyBlock:(id)a4
{
  id v6 = a4;
  id v7 = [(FamilyCircleServiceDelegate *)self queueProvider];
  id v8 = [v7 requestQueueWithOptions:0];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000185E4;
  block[3] = &unk_10004E130;
  id v11 = v6;
  unint64_t v12 = a3;
  void block[4] = self;
  id v9 = v6;
  dispatch_async(v8, block);
}

- (void)enableSettingsForMemberDSID:(id)a3 options:(id)a4 replyBlock:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  id v11 = [(FamilyCircleServiceDelegate *)self queueProvider];
  unint64_t v12 = [v11 requestQueueWithOptions:v10];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100018860;
  block[3] = &unk_10004DBE0;
  id v16 = v8;
  id v17 = self;
  id v18 = v9;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v12, block);
}

- (void)enableSettingsForMemberDSID:(id)a3 screentimeModelCache:(id)a4 options:(id)a5 replyBlock:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = a5;
  id v14 = [(FamilyCircleServiceDelegate *)self queueProvider];
  id v15 = [v14 requestQueueWithOptions:v13];

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100018BA4;
  v19[3] = &unk_10004DC88;
  v19[4] = self;
  id v20 = v10;
  id v21 = v11;
  id v22 = v12;
  id v16 = v12;
  id v17 = v11;
  id v18 = v10;
  dispatch_async(v15, v19);
}

- (id)_turnOnScreentimeForDSID:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc((Class)AAFPromise);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100018D64;
  v8[3] = &unk_10004D318;
  id v9 = v3;
  id v5 = v3;
  id v6 = [v4 initWithBlock:v8];

  return v6;
}

- (id)_applyScreenTimeModel:(id)a3 dsid:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc((Class)AAFPromise);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100019268;
  v12[3] = &unk_10004D2A0;
  id v13 = v5;
  id v14 = v6;
  id v8 = v6;
  id v9 = v5;
  id v10 = [v7 initWithBlock:v12];

  return v10;
}

- (void)setFamilyRefreshActivityScheduler:(id)a3
{
}

- (FAMarqueeUpdateHandler)marqueeUpdateHandler
{
  return self->_marqueeUpdateHandler;
}

- (void)setMarqueeUpdateHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_marqueeUpdateHandler, 0);
  objc_storeStrong((id *)&self->_queueProvider, 0);
  objc_storeStrong((id *)&self->_familyRefreshActivityScheduler, 0);
  objc_storeStrong((id *)&self->observer, 0);
  objc_storeStrong((id *)&self->_activityManager, 0);
}

@end