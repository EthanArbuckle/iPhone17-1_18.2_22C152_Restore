@interface SubmissionController
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (OSASubmissionPolicy)policy;
- (SubmissionController)init;
- (void)handleOptInChange;
- (void)setPolicy:(id)a3;
- (void)submitWithOptions:(id)a3 resultsCallback:(id)a4;
@end

@implementation SubmissionController

- (SubmissionController)init
{
  v18.receiver = self;
  v18.super_class = (Class)SubmissionController;
  v2 = [(SubmissionController *)&v18 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.OTACrashCopier.requestQueue", 0);
    requestQueue = v2->_requestQueue;
    v2->_requestQueue = (OS_dispatch_queue *)v3;

    v5 = (OSASubmissionPolicy *)objc_alloc_init((Class)OSASubmissionPolicy);
    policy = v2->_policy;
    v2->_policy = v5;

    v7 = objc_alloc_init(ConnectionInfo);
    connectionInfo = v2->_connectionInfo;
    v2->_connectionInfo = v7;

    id v9 = objc_alloc((Class)NSUserDefaults);
    id v10 = [v9 initWithSuiteName:kOSASubmissionDomain];
    id v11 = [v10 BOOLForKey:@"UATSubmissionServer"];

    v12 = (OSASubmitter *)[objc_alloc((Class)OSAHttpSubmitter) initWithEndpoint:v11];
    submitter = v2->_submitter;
    v2->_submitter = v12;

    uint64_t v14 = objc_opt_new();
    one_shot_events = v2->_one_shot_events;
    v2->_one_shot_events = (NSMutableDictionary *)v14;

    v16 = +[NSDate date];
    [(NSMutableDictionary *)v2->_one_shot_events setObject:v16 forKeyedSubscript:@"launch"];
  }
  return v2;
}

- (void)handleOptInChange
{
  dispatch_queue_t v3 = +[OSASystemConfiguration sharedInstance];
  unsigned int v4 = [v3 optInApple];

  v5 = +[NSDate date];
  one_shot_events = self->_one_shot_events;
  if (v4)
  {
    [(NSMutableDictionary *)one_shot_events setObject:v5 forKeyedSubscript:@"opt-in"];

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Submission preference opt-in; retiring existing logs.",
        buf,
        2u);
    }
  }
  else
  {
    [(NSMutableDictionary *)one_shot_events setObject:v5 forKeyedSubscript:@"opt-out"];

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Submission preference opt-out; cancelling pending submissions and retiring logs",
        buf,
        2u);
    }
    [(OSASubmitter *)self->_submitter abort];
  }
  v7 = +[OSASystemConfiguration sharedInstance];
  v8 = [v7 logDomain];

  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = +[OSASystemConfiguration sharedInstance];
    unsigned int v10 = [v9 optInApple];
    CFStringRef v11 = @"OUT";
    if (v10) {
      CFStringRef v11 = @"IN";
    }
    *(_DWORD *)buf = 138412290;
    CFStringRef v36 = v11;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "OptInChange (%@); purging logs", buf, 0xCu);
  }
  v12 = +[OSASystemConfiguration sharedInstance];
  v13 = [v12 pathSubmission];
  v34 = v13;
  uint64_t v14 = +[NSArray arrayWithObjects:&v34 count:1];
  v15 = +[OSASystemConfiguration sharedInstance];
  v16 = [v15 pathSubmission];
  v17 = +[OSALog scanProxies:v16];
  objc_super v18 = [v14 arrayByAddingObjectsFromArray:v17];

  if (+[OSALog isDataVaultEnabled])
  {
    v19 = +[OSASystemConfiguration sharedInstance];
    v20 = [v19 pathSubmissionDataVault];

    if (v20)
    {
      id v21 = [v18 arrayByAddingObject:v20];
      v22 = +[OSALog scanProxies:v20];
      id v23 = [v18 arrayByAddingObjectsFromArray:v22];
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_100002628();
    }
  }
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v24 = v18;
  id v25 = [v24 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v25)
  {
    id v26 = v25;
    uint64_t v27 = *(void *)v30;
    do
    {
      v28 = 0;
      do
      {
        if (*(void *)v30 != v27) {
          objc_enumerationMutation(v24);
        }
        +[OSALog purgeLogs:](OSALog, "purgeLogs:", *(void *)(*((void *)&v29 + 1) + 8 * (void)v28), (void)v29);
        v28 = (char *)v28 + 1;
      }
      while (v26 != v28);
      id v26 = [v24 countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v26);
  }
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  v6 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___OSASubmissionServices];
  [v5 setExportedInterface:v6];

  [v5 setExportedObject:self];
  [v5 _setQueue:&_dispatch_main_q];
  [v5 resume];

  return 1;
}

- (void)submitWithOptions:(id)a3 resultsCallback:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 objectForKeyedSubscript:@"checkEntitlement"];
  if (([v8 BOOLValue] & 1) == 0)
  {

    goto LABEL_7;
  }
  id v9 = +[NSXPCConnection currentConnection];
  unsigned int v10 = [v9 valueForEntitlement:@"com.apple.private.osanalytics.SubmitLogs.allow"];
  unsigned __int8 v11 = [v10 BOOLValue];

  if (v11)
  {
LABEL_7:
    requestQueue = self->_requestQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100001FC8;
    block[3] = &unk_100004318;
    id v14 = v6;
    v15 = self;
    id v16 = v7;
    dispatch_async(requestQueue, block);

    goto LABEL_8;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_1000026A8();
    if (!v7) {
      goto LABEL_8;
    }
    goto LABEL_5;
  }
  if (v7) {
LABEL_5:
  }
    (*((void (**)(id, _UNKNOWN **))v7 + 2))(v7, &off_100004690);
LABEL_8:
}

- (OSASubmissionPolicy)policy
{
  return (OSASubmissionPolicy *)objc_getProperty(self, a2, 48, 1);
}

- (void)setPolicy:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_policy, 0);
  objc_storeStrong((id *)&self->_requestQueue, 0);
  objc_storeStrong((id *)&self->_one_shot_events, 0);
  objc_storeStrong((id *)&self->_submitter, 0);

  objc_storeStrong((id *)&self->_connectionInfo, 0);
}

@end