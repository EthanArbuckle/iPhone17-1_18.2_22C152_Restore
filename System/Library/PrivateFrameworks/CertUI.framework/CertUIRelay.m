@interface CertUIRelay
- (CertUIRelay)init;
- (id)_relayCenter;
- (id)_uniqueDigest;
- (void)_centerDiedWithNotification:(id)a3;
- (void)_registerNewRequest;
- (void)_registerReply;
- (void)_showNextPrompt;
- (void)_shutdown;
- (void)_trustInfoMessageReceived:(id)a3 userInfo:(id)a4 auditToken:(id *)a5;
@end

@implementation CertUIRelay

- (id)_relayCenter
{
  return +[CPDistributedMessagingCenter centerNamed:kCertUIMessagingCenterRelayName];
}

- (void)_shutdown
{
  v3 = _CertUILogObjects[1];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "CertUIRelay shutting down", v6, 2u);
  }
  v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self];

  v5 = [(CertUIRelay *)self _relayCenter];
  [v5 stopServer];

  exit(0);
}

- (void)_centerDiedWithNotification:(id)a3
{
  id v4 = a3;
  v5 = _CertUILogObjects[1];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    v7 = [v4 object];
    v8 = [v7 name];
    int v9 = 138412290;
    v10 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Center died %@", (uint8_t *)&v9, 0xCu);
  }
  if (![(NSMutableDictionary *)self->_promptsForDigest count]) {
    [(CertUIRelay *)self _shutdown];
  }
}

- (void)_registerNewRequest
{
  int64_t outstandingRequestCount = self->_outstandingRequestCount;
  killTimer = self->_killTimer;
  self->_int64_t outstandingRequestCount = outstandingRequestCount + 1;
  [(NSTimer *)killTimer invalidate];
  v5 = self->_killTimer;
  self->_killTimer = 0;
}

- (void)_registerReply
{
  int64_t outstandingRequestCount = self->_outstandingRequestCount;
  self->_int64_t outstandingRequestCount = outstandingRequestCount - 1;
  if (outstandingRequestCount <= 1 && !self->_killTimer)
  {
    self->_killTimer = +[NSTimer scheduledTimerWithTimeInterval:self target:"_killTimerFired" selector:0 userInfo:0 repeats:5.0];
    _objc_release_x1();
  }
}

- (void)_showNextPrompt
{
  self->_waitingOnPrompt = 1;
  v3 = [(NSMutableDictionary *)self->_promptsForDigest allKeys];
  id v4 = [v3 objectAtIndex:0];

  v5 = [(NSMutableDictionary *)self->_promptsForDigest objectForKey:v4];
  v6 = [v5 objectAtIndex:0];
  dispatch_time_t v7 = dispatch_time(0, 0);
  if ([v4 isEqualToData:self->_previousPromptDigest]) {
    dispatch_time_t v7 = dispatch_time(0, 5000000000);
  }
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100005138;
  v13[3] = &unk_100008310;
  id v14 = v6;
  v15 = self;
  id v16 = v5;
  v8 = v4;
  v17 = v8;
  id v9 = v5;
  id v10 = v6;
  dispatch_after(v7, (dispatch_queue_t)&_dispatch_main_q, v13);
  previousPromptDigest = self->_previousPromptDigest;
  self->_previousPromptDigest = v8;
  v12 = v8;
}

- (id)_uniqueDigest
{
  CFUUIDRef v2 = CFUUIDCreate(0);
  v3 = (__CFString *)CFUUIDCreateString(0, v2);
  if (v3)
  {
    id v4 = v3;
    v5 = [(__CFString *)v3 dataUsingEncoding:4];
    CFRelease(v4);
    if (!v2) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  v5 = +[NSData data];
  if (v2) {
LABEL_3:
  }
    CFRelease(v2);
LABEL_4:

  return v5;
}

- (void)_trustInfoMessageReceived:(id)a3 userInfo:(id)a4 auditToken:(id *)a5
{
  id v7 = a4;
  v8 = +[CertUIUtilities bundleIDFromAuditToken:a5];
  id v9 = +[CertUIUtilities localizedAppTitleForBundleID:v8];
  id v10 = _CertUILogObjects[1];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 138543618;
    v20 = v8;
    __int16 v21 = 2114;
    v22 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Alert message received from app (%{public}@, %{public}@)", (uint8_t *)&v19, 0x16u);
  }
  [(CertUIRelay *)self _registerNewRequest];
  v11 = [(CertUIRelay *)self _relayCenter];
  v12 = [v11 delayReply];

  v13 = [[CertUIRelayPrompt alloc] initWithMessageInfo:v7 localizedOriginatingAppName:v9 replyContext:v12];
  id v14 = [(CertUIRelayPrompt *)v13 trustDigest];
  v15 = v14;
  if (v14)
  {
    id v16 = v14;
  }
  else
  {
    id v16 = [(CertUIRelay *)self _uniqueDigest];
  }
  v17 = v16;

  v18 = [(NSMutableDictionary *)self->_promptsForDigest objectForKey:v17];
  if (!v18)
  {
    v18 = +[NSMutableArray array];
    [(NSMutableDictionary *)self->_promptsForDigest setObject:v18 forKey:v17];
  }
  [v18 addObject:v13];
  if (!self->_waitingOnPrompt) {
    [(CertUIRelay *)self _showNextPrompt];
  }
}

- (CertUIRelay)init
{
  v14.receiver = self;
  v14.super_class = (Class)CertUIRelay;
  CFUUIDRef v2 = [(CertUIRelay *)&v14 init];
  if (v2)
  {
    v3 = _CertUILogObjects[1];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "CertUIRelay starting", v13, 2u);
    }
    id v4 = [(CertUIRelay *)v2 _relayCenter];
    [v4 registerForMessageName:kCertUIPresentTrustInfoMessage target:v2 selector:"_trustInfoMessageReceived:userInfo:auditToken:"];
    [v4 runServerOnCurrentThread];
    uint64_t v5 = +[NSTimer scheduledTimerWithTimeInterval:v2 target:"_killTimerFired" selector:0 userInfo:0 repeats:5.0];
    killTimer = v2->_killTimer;
    v2->_killTimer = (NSTimer *)v5;

    id v7 = +[NSNotificationCenter defaultCenter];
    [v7 addObserver:v2 selector:"_centerDiedWithNotification:" name:CPDistributedMessagingCenterServerDidTerminateNotification object:0];

    v8 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    promptsForDigest = v2->_promptsForDigest;
    v2->_promptsForDigest = v8;

    id v10 = (NSData *)objc_alloc_init((Class)NSData);
    previousPromptDigest = v2->_previousPromptDigest;
    v2->_previousPromptDigest = v10;
  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousPromptDigest, 0);
  objc_storeStrong((id *)&self->_killTimer, 0);

  objc_storeStrong((id *)&self->_promptsForDigest, 0);
}

@end