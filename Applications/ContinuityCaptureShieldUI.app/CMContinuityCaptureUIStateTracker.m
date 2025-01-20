@interface CMContinuityCaptureUIStateTracker
+ (id)sharedInstance;
- (BOOL)active;
- (BOOL)isDedicatedSession;
- (BOOL)isInFaceTime;
- (CMContinuityCaptureUIConfiguration)activeConfiguration;
- (CMContinuityCaptureUIStateTracker)init;
- (int64_t)connectionType;
- (int64_t)uiState;
- (void)_aquireAppSuspendAssertion;
- (void)_refreshInFaceTime;
- (void)_releaseAppSuspendAssertion;
- (void)_sessionDidUpdateWithConfiguration:(id)a3;
- (void)_tearDownShield;
- (void)conversationManager:(id)a3 activeRemoteParticipantsChangedForConversation:(id)a4;
- (void)conversationManager:(id)a3 remoteMembersChangedForConversation:(id)a4;
- (void)neighborhoodActivityConduit:(id)a3 splitSessionEnded:(id)a4;
- (void)neighborhoodActivityConduit:(id)a3 splitSessionStarted:(id)a4;
- (void)serverXPCConnectionInterrupted;
- (void)sessionDidUpdateWithConfiguration:(id)a3;
- (void)setConnectionType:(int64_t)a3;
- (void)setUIConfiguration:(id)a3;
- (void)setUiState:(int64_t)a3;
- (void)tearDownShield;
@end

@implementation CMContinuityCaptureUIStateTracker

+ (id)sharedInstance
{
  if (qword_100024078 != -1) {
    dispatch_once(&qword_100024078, &stru_10001C7A0);
  }
  v2 = (void *)qword_100024080;

  return v2;
}

- (CMContinuityCaptureUIStateTracker)init
{
  v15.receiver = self;
  v15.super_class = (Class)CMContinuityCaptureUIStateTracker;
  v2 = [(CMContinuityCaptureUIStateTracker *)&v15 init];
  v3 = v2;
  if (v2)
  {
    v2->_uiState = 0;
    v4 = (CMContinuityCaptureUIConfiguration *)objc_alloc_init((Class)CMContinuityCaptureUIConfiguration);
    activeConfiguration = v3->_activeConfiguration;
    v3->_activeConfiguration = v4;

    v3->_active = 1;
    objc_storeStrong((id *)&v3->_queue, &_dispatch_main_q);
    v6 = +[TUCallCenter sharedInstance];
    v7 = [v6 neighborhoodActivityConduit];
    [v7 addDelegate:v3 queue:v3->_queue];

    v8 = +[TUCallCenter sharedInstance];
    v9 = [v8 conversationManager];
    [v9 addDelegate:v3 queue:v3->_queue];

    v10 = +[TUCallCenter sharedInstance];
    v11 = [v10 neighborhoodActivityConduit];
    v12 = [v11 activeSplitSessionTV];
    v3->_inFaceTime = v12 != 0;

    [(CMContinuityCaptureUIStateTracker *)v3 _aquireAppSuspendAssertion];
    v13 = +[CMContinuityCaptureXPCClientCCD sharedInstance];
    [v13 connectToContinuityCaptureServerWithDelegate:v3];
  }
  return v3;
}

- (void)_aquireAppSuspendAssertion
{
  v3 = +[RBSDomainAttribute attributeWithDomain:@"com.apple.ContinuityCaptureShieldUI" name:@"DoCapture"];
  v4 = +[RBSProcessIdentifier identifierForCurrentProcess];
  v5 = +[RBSTarget targetWithPid:](RBSTarget, "targetWithPid:", [v4 pid]);
  id v6 = objc_alloc((Class)RBSAssertion);
  v25 = v3;
  v7 = +[NSArray arrayWithObjects:&v25 count:1];
  v8 = (RBSAssertion *)[v6 initWithExplanation:@"Shield Terminate XPC" target:v5 attributes:v7];
  appSuspendAssertion = self->_appSuspendAssertion;
  self->_appSuspendAssertion = v8;

  v10 = self->_appSuspendAssertion;
  id v18 = 0;
  unsigned int v11 = [(RBSAssertion *)v10 acquireWithError:&v18];
  id v12 = v18;
  v13 = sub_10000AB00();
  BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
  if (v11)
  {
    if (v14)
    {
      *(_DWORD *)buf = 136315394;
      v20 = "-[CMContinuityCaptureUIStateTracker _aquireAppSuspendAssertion]";
      __int16 v21 = 2112;
      v22 = self;
      objc_super v15 = "%s: %@ Successfully acquired app suspend assertion";
      v16 = v13;
      uint32_t v17 = 22;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, v15, buf, v17);
    }
  }
  else if (v14)
  {
    *(_DWORD *)buf = 136315650;
    v20 = "-[CMContinuityCaptureUIStateTracker _aquireAppSuspendAssertion]";
    __int16 v21 = 2112;
    v22 = self;
    __int16 v23 = 2112;
    id v24 = v12;
    objc_super v15 = "%s: %@ Failed to acquire app suspend assertion with error %@";
    v16 = v13;
    uint32_t v17 = 32;
    goto LABEL_6;
  }
}

- (void)_releaseAppSuspendAssertion
{
  appSuspendAssertion = self->_appSuspendAssertion;
  if (appSuspendAssertion)
  {
    [(RBSAssertion *)appSuspendAssertion invalidate];
    v4 = self->_appSuspendAssertion;
    self->_appSuspendAssertion = 0;
  }
}

- (int64_t)uiState
{
  v2 = self;
  objc_sync_enter(v2);
  int64_t uiState = v2->_uiState;
  objc_sync_exit(v2);

  return uiState;
}

- (void)setUiState:(int64_t)a3
{
  obj = self;
  objc_sync_enter(obj);
  obj->_int64_t uiState = a3;
  objc_sync_exit(obj);
}

- (int64_t)connectionType
{
  v2 = self;
  objc_sync_enter(v2);
  int64_t connectionType = v2->_connectionType;
  objc_sync_exit(v2);

  return connectionType;
}

- (void)setConnectionType:(int64_t)a3
{
  obj = self;
  objc_sync_enter(obj);
  obj->_int64_t connectionType = a3;
  objc_sync_exit(obj);
}

- (CMContinuityCaptureUIConfiguration)activeConfiguration
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_activeConfiguration;
  objc_sync_exit(v2);

  if (!v3)
  {
    v4 = sub_10000AB00();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_10000FEA0();
    }
  }

  return v3;
}

- (BOOL)active
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL active = v2->_active;
  objc_sync_exit(v2);

  return active;
}

- (BOOL)isInFaceTime
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL inFaceTime = v2->_inFaceTime;
  objc_sync_exit(v2);

  return inFaceTime;
}

- (BOOL)isDedicatedSession
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = [(CMContinuityCaptureUIStateTracker *)v2 activeConfiguration];
  unsigned __int8 v4 = [v3 isDedicated];

  objc_sync_exit(v2);
  return v4;
}

- (void)setUIConfiguration:(id)a3
{
  id v6 = a3;
  unsigned __int8 v4 = [(CMContinuityCaptureUIStateTracker *)self activeConfiguration];
  unsigned __int8 v5 = [v4 isEqual:v6];

  if ((v5 & 1) == 0)
  {
    if (+[NSThread isMainThread]
      && (_UNKNOWN *)self->_queue == &_dispatch_main_q)
    {
      [(CMContinuityCaptureUIStateTracker *)self _sessionDidUpdateWithConfiguration:v6];
    }
    else
    {
      [(CMContinuityCaptureUIStateTracker *)self sessionDidUpdateWithConfiguration:v6];
    }
  }
}

- (void)_refreshInFaceTime
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  obj = self;
  objc_sync_enter(obj);
  v3 = +[TUCallCenter sharedInstance];
  unsigned __int8 v4 = [v3 conversationManager];
  unsigned __int8 v5 = [v4 activeConversations];
  id v6 = [v5 bs_firstObjectPassingTest:&stru_10001C7C0];

  v7 = +[TUCallCenter sharedInstance];
  v8 = [v7 neighborhoodActivityConduit];
  v9 = [v8 activeSplitSessionTV];
  if (v9)
  {
    v10 = +[TUCallCenter sharedInstance];
    unsigned int v11 = [v10 neighborhoodActivityConduit];
    unsigned int v12 = [v11 canPullBackConversation:v6];
  }
  else
  {
    unsigned int v12 = 0;
  }

  if ([v6 avMode]) {
    int v13 = 1;
  }
  else {
    int v13 = v12;
  }
  if (obj->_inFaceTime != v13)
  {
    [(CMContinuityCaptureUIStateTracker *)obj willChangeValueForKey:@"inFaceTime"];
    obj->_BOOL inFaceTime = v13;
    [(CMContinuityCaptureUIStateTracker *)obj didChangeValueForKey:@"inFaceTime"];
  }

  objc_sync_exit(obj);
}

- (void)neighborhoodActivityConduit:(id)a3 splitSessionStarted:(id)a4
{
}

- (void)neighborhoodActivityConduit:(id)a3 splitSessionEnded:(id)a4
{
}

- (void)conversationManager:(id)a3 remoteMembersChangedForConversation:(id)a4
{
}

- (void)conversationManager:(id)a3 activeRemoteParticipantsChangedForConversation:(id)a4
{
}

- (void)sessionDidUpdateWithConfiguration:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000B5B8;
  block[3] = &unk_10001C7E8;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)_sessionDidUpdateWithConfiguration:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = +[CMContinuityCaptureUIStateTracker sharedInstance];
  id v6 = [v5 activeConfiguration];

  v7 = sub_10000AB00();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 136315906;
    uint32_t v17 = "-[CMContinuityCaptureUIStateTracker _sessionDidUpdateWithConfiguration:]";
    __int16 v18 = 2112;
    v19 = self;
    __int16 v20 = 2114;
    __int16 v21 = v6;
    __int16 v22 = 2114;
    id v23 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s: %@ activeConfiguration change (%{public}@ -> %{public}@)", (uint8_t *)&v16, 0x2Au);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (v4)
  {
    [(CMContinuityCaptureUIStateTracker *)self willChangeValueForKey:@"activeConfiguration"];
    id v8 = self;
    objc_sync_enter(v8);
    if ([v4 clientDeviceModel]) {
      [v6 setClientDeviceModel:[v4 clientDeviceModel]];
    }
    id v9 = [v4 clientName];
    [v6 setClientName:v9];

    [v6 setCompositeState:[v4 compositeState]];
    v10 = [v4 applicationIdentifier];
    [v6 setApplicationIdentifier:v10];

    unsigned int v11 = [v6 placementStepSkipped];
    LODWORD(v10) = v11 == 0;

    if (v10) {
      [v6 setPlacementStepSkipped:&__kCFBooleanFalse];
    }
    unsigned int v12 = [v6 placementStepSkipped];
    unsigned __int8 v13 = [v12 BOOLValue];

    if ((v13 & 1) == 0)
    {
      BOOL v14 = [v4 placementStepSkipped];
      [v6 setPlacementStepSkipped:v14];
    }
    [v6 setIsDedicated:[v4 isDedicated]];
    objc_sync_exit(v8);

    [(CMContinuityCaptureUIStateTracker *)v8 didChangeValueForKey:@"activeConfiguration"];
  }
  else
  {
    objc_super v15 = sub_10000AB00();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_10000FF20();
    }
  }
}

- (void)tearDownShield
{
  v3 = sub_10000AB00();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v8 = "-[CMContinuityCaptureUIStateTracker tearDownShield]";
    __int16 v9 = 2112;
    v10 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s: %@ teardown shieldUI", buf, 0x16u);
  }

  objc_initWeak((id *)buf, self);
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000B9D0;
  block[3] = &unk_10001C678;
  objc_copyWeak(&v6, (id *)buf);
  dispatch_async(queue, block);
  objc_destroyWeak(&v6);
  objc_destroyWeak((id *)buf);
}

- (void)_tearDownShield
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  [(CMContinuityCaptureUIStateTracker *)self _releaseAppSuspendAssertion];
  [(CMContinuityCaptureUIStateTracker *)self willChangeValueForKey:@"active"];
  v3 = self;
  objc_sync_enter(v3);
  BOOL active = v3->_active;
  v3->_BOOL active = 0;
  objc_sync_exit(v3);

  [(CMContinuityCaptureUIStateTracker *)v3 didChangeValueForKey:@"active"];
  if (active)
  {
    unsigned __int8 v5 = +[TUCallCenter sharedInstance];
    id v6 = [v5 neighborhoodActivityConduit];
    [v6 removeDelegate:v3];

    id v8 = +[TUCallCenter sharedInstance];
    v7 = [v8 conversationManager];
    [v7 removeDelegate:v3];
  }
}

- (void)serverXPCConnectionInterrupted
{
  v3 = +[CMContinuityCaptureUIStateTracker sharedInstance];
  id v6 = [v3 activeConfiguration];

  id v4 = v6;
  if (v6)
  {
    id v5 = [v6 copy];
    [v5 setCompositeState:16];
    [(CMContinuityCaptureUIStateTracker *)self sessionDidUpdateWithConfiguration:v5];

    id v4 = v6;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appSuspendAssertion, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_activeConfiguration, 0);
}

@end