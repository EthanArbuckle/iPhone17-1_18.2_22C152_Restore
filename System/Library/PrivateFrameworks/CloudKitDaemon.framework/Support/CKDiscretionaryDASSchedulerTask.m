@interface CKDiscretionaryDASSchedulerTask
+ (unint64_t)_priorityForState:(unint64_t)a3;
- (BOOL)requiresPastBuddy;
- (BOOL)rescheduling;
- (BOOL)running;
- (CKDiscretionaryDASSchedulerTask)initWithOperationID:(id)a3 group:(id)a4 bundleID:(id)a5 requiresPastBuddy:(BOOL)a6 options:(id)a7 state:(unint64_t)a8 queue:(id)a9 startHandler:(id)a10 suspendHandler:(id)a11;
- (CKDiscretionaryOptions)options;
- (NSDate)startAfter;
- (NSDate)startBefore;
- (NSString)bundleID;
- (NSString)group;
- (NSString)operationID;
- (OS_dispatch_queue)queue;
- (OS_os_activity)osActivity;
- (_DASActivity)dasActivity;
- (id)_activityName;
- (id)_nwEndpointDefault;
- (id)_nwParametersWithAllowsCellularAccess:(BOOL)a3 allowsExpensiveNetworkAccess:(BOOL)a4;
- (id)startHandler;
- (id)suspendHandler;
- (void)_schedule;
- (void)cancel;
- (void)finish;
- (void)setBundleID:(id)a3;
- (void)setDasActivity:(id)a3;
- (void)setGroup:(id)a3;
- (void)setOperationID:(id)a3;
- (void)setOptions:(id)a3;
- (void)setOsActivity:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRequiresPastBuddy:(BOOL)a3;
- (void)setRescheduling:(BOOL)a3;
- (void)setRunning:(BOOL)a3;
- (void)setStartAfter:(id)a3;
- (void)setStartBefore:(id)a3;
- (void)setStartHandler:(id)a3;
- (void)setState:(unint64_t)a3;
- (void)setSuspendHandler:(id)a3;
@end

@implementation CKDiscretionaryDASSchedulerTask

- (void)_schedule
{
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  v3 = [(CKDiscretionaryDASSchedulerTask *)self osActivity];
  os_activity_scope_enter(v3, &state);

  [(CKDiscretionaryDASSchedulerTask *)self cancel];
  id v4 = objc_msgSend((id)objc_opt_class(), "_priorityForState:", -[CKDiscretionarySchedulerTask state](self, "state"));
  v5 = [(CKDiscretionaryDASSchedulerTask *)self _activityName];
  uint64_t v6 = [(CKDiscretionaryDASSchedulerTask *)self startAfter];
  v7 = [(CKDiscretionaryDASSchedulerTask *)self startBefore];
  v8 = +[_DASActivity activityWithName:v5 priority:v4 duration:v4 startingAfter:v6 startingBefore:v7];

  v9 = [(CKDiscretionaryDASSchedulerTask *)self queue];
  [v8 setHandlerQueue:v9];

  v10 = [(CKDiscretionaryDASSchedulerTask *)self options];
  LOBYTE(v6) = [v10 requiresNetworkAccess];

  if (v6)
  {
    [v8 setRequiresNetwork:1];
    v11 = [(CKDiscretionaryDASSchedulerTask *)self options];
    objc_msgSend(v8, "setRequiresInexpensiveNetworking:", objc_msgSend(v11, "allowsExpensiveNetworkAccess") ^ 1);

    v12 = [(CKDiscretionaryDASSchedulerTask *)self options];
    id v13 = [v12 allowsCellularAccess];
    v14 = [(CKDiscretionaryDASSchedulerTask *)self options];
    v15 = -[CKDiscretionaryDASSchedulerTask _nwParametersWithAllowsCellularAccess:allowsExpensiveNetworkAccess:](self, "_nwParametersWithAllowsCellularAccess:allowsExpensiveNetworkAccess:", v13, [v14 allowsExpensiveNetworkAccess]);

    v16 = +[NWParameters parametersWithCParameters:v15];
    v17 = [(CKDiscretionaryDASSchedulerTask *)self _nwEndpointDefault];
    uint64_t v18 = +[NWEndpoint endpointWithCEndpoint:v17];
    v19 = (void *)v18;
    if (v18)
    {
      v43[0] = kNWEndpointKey;
      v43[1] = kNWParametersKey;
      v44[0] = v18;
      v44[1] = v16;
      v20 = +[NSDictionary dictionaryWithObjects:v44 forKeys:v43 count:2];
      [v8 setUserInfo:v20];
    }
  }
  else
  {
    [v8 setRequiresNetwork:0];
  }
  objc_msgSend(v8, "setRequiresBuddyComplete:", -[CKDiscretionaryDASSchedulerTask requiresPastBuddy](self, "requiresPastBuddy"));
  v21 = +[_DASFileProtection completeUntilFirstUserAuthentication];
  [v8 setFileProtection:v21];

  [v8 setCancelAfterDeadline:0];
  v22 = [(CKDiscretionaryDASSchedulerTask *)self options];
  v23 = [v22 applicationBundleIdentifierOverride];
  v24 = v23;
  if (!v23)
  {
    v24 = [(CKDiscretionaryDASSchedulerTask *)self bundleID];
  }
  [v8 setBundleId:v24];
  if (!v23) {

  }
  id v25 = objc_alloc_init((Class)NSMutableArray);
  v26 = [v8 bundleId];
  [v25 addObject:v26];

  v27 = [(CKDiscretionaryDASSchedulerTask *)self options];
  v28 = [v27 secondarySourceApplicationBundleId];

  if (v28)
  {
    v29 = [(CKDiscretionaryDASSchedulerTask *)self options];
    v30 = [v29 secondarySourceApplicationBundleId];
    [v25 addObject:v30];
  }
  [v8 setRelatedApplications:v25];
  [(CKDiscretionaryDASSchedulerTask *)self setDasActivity:v8];
  [(CKDiscretionaryDASSchedulerTask *)self setRescheduling:0];
  objc_initWeak(&location, self);
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472;
  v39[2] = sub_100007460;
  v39[3] = &unk_100010650;
  objc_copyWeak(&v40, &location);
  [v8 setStartHandler:v39];
  v34 = _NSConcreteStackBlock;
  uint64_t v35 = 3221225472;
  v36 = sub_1000075F4;
  v37 = &unk_100010650;
  objc_copyWeak(&v38, &location);
  [v8 setSuspendHandler:&v34];
  v31 = +[_DASScheduler sharedScheduler];
  v32 = [(CKDiscretionaryDASSchedulerTask *)self group];
  v33 = +[_DASActivityGroup groupWithName:v32 maxConcurrent:3];
  [v31 submitActivity:v8 inGroup:v33];

  objc_destroyWeak(&v38);
  objc_destroyWeak(&v40);
  objc_destroyWeak(&location);

  os_activity_scope_leave(&state);
}

- (NSDate)startBefore
{
  return self->_startBefore;
}

- (NSDate)startAfter
{
  return self->_startAfter;
}

- (void)setState:(unint64_t)a3
{
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  v5 = [(CKDiscretionaryDASSchedulerTask *)self osActivity];
  os_activity_scope_enter(v5, &state);

  uint64_t v6 = [(CKDiscretionaryDASSchedulerTask *)self queue];
  dispatch_assert_queue_V2(v6);

  v8.receiver = self;
  v8.super_class = (Class)CKDiscretionaryDASSchedulerTask;
  if ([(CKDiscretionarySchedulerTask *)&v8 state] != a3)
  {
    if ([(CKDiscretionaryDASSchedulerTask *)self running])
    {
      if (a3 == 3) {
        [(CKDiscretionaryDASSchedulerTask *)self cancel];
      }
    }
    else
    {
      v7.receiver = self;
      v7.super_class = (Class)CKDiscretionaryDASSchedulerTask;
      [(CKDiscretionarySchedulerTask *)&v7 setState:a3];
      [(CKDiscretionaryDASSchedulerTask *)self setRescheduling:1];
      [(CKDiscretionaryDASSchedulerTask *)self _schedule];
    }
  }
  os_activity_scope_leave(&state);
}

- (void)setRescheduling:(BOOL)a3
{
  self->_rescheduling = a3;
}

- (void)setDasActivity:(id)a3
{
}

- (BOOL)running
{
  return self->_running;
}

- (BOOL)requiresPastBuddy
{
  return self->_requiresPastBuddy;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (OS_os_activity)osActivity
{
  return self->_osActivity;
}

- (CKDiscretionaryOptions)options
{
  return self->_options;
}

- (NSString)group
{
  return self->_group;
}

- (_DASActivity)dasActivity
{
  return self->_dasActivity;
}

- (void)cancel
{
  v3 = [(CKDiscretionaryDASSchedulerTask *)self osActivity];
  os_activity_scope_enter(v3, &v8);

  id v4 = [(CKDiscretionaryDASSchedulerTask *)self dasActivity];

  if (v4)
  {
    v5 = [(CKDiscretionaryDASSchedulerTask *)self queue];
    dispatch_assert_queue_V2(v5);

    uint64_t v6 = +[_DASScheduler sharedScheduler];
    objc_super v7 = [(CKDiscretionaryDASSchedulerTask *)self dasActivity];
    [v6 activityCanceled:v7];

    [(CKDiscretionaryDASSchedulerTask *)self setDasActivity:0];
  }
  os_activity_scope_leave(&v8);
}

- (id)_nwParametersWithAllowsCellularAccess:(BOOL)a3 allowsExpensiveNetworkAccess:(BOOL)a4
{
  uint64_t v6 = nw_parameters_create();
  objc_super v7 = v6;
  if (v6)
  {
    if (!a3) {
      nw_parameters_prohibit_interface_type(v6, nw_interface_type_cellular);
    }
    if (!a4) {
      nw_parameters_set_prohibit_expensive(v7, 1);
    }
    os_activity_scope_state_s v8 = v7;
  }

  return v7;
}

- (id)_nwEndpointDefault
{
  nw_endpoint_t host = nw_endpoint_create_host("www.apple.com", "443");
  nw_endpoint_t v3 = host;
  if (host) {
    id v4 = host;
  }

  return v3;
}

- (id)_activityName
{
  return +[NSString stringWithFormat:@"ckdiscretionaryd.%@.%@", self->_bundleID, self->_operationID];
}

+ (unint64_t)_priorityForState:(unint64_t)a3
{
  if (a3 < 3)
  {
    nw_endpoint_t v3 = (unint64_t *)&_DASSchedulingPriorityUserInitiated;
    return *v3;
  }
  if (a3 == 3)
  {
    nw_endpoint_t v3 = (unint64_t *)&_DASSchedulingPriorityBackground;
    return *v3;
  }
  if (a3 == 4)
  {
    nw_endpoint_t v3 = (unint64_t *)&_DASSchedulingPriorityMaintenance;
    return *v3;
  }
  return 0;
}

- (CKDiscretionaryDASSchedulerTask)initWithOperationID:(id)a3 group:(id)a4 bundleID:(id)a5 requiresPastBuddy:(BOOL)a6 options:(id)a7 state:(unint64_t)a8 queue:(id)a9 startHandler:(id)a10 suspendHandler:(id)a11
{
  id v37 = a3;
  id v36 = a4;
  id v35 = a5;
  id v39 = a7;
  id v34 = a9;
  id v38 = a10;
  id v17 = a11;
  v41.receiver = self;
  v41.super_class = (Class)CKDiscretionaryDASSchedulerTask;
  uint64_t v18 = [(CKDiscretionarySchedulerTask *)&v41 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_operationID, a3);
    objc_storeStrong((id *)&v19->_group, a4);
    objc_storeStrong((id *)&v19->_queue, a9);
    objc_storeStrong((id *)&v19->_bundleID, a5);
    v19->_requiresPastBuddy = a6;
    objc_storeStrong((id *)&v19->_options, a7);
    v40.receiver = v19;
    v40.super_class = (Class)CKDiscretionaryDASSchedulerTask;
    [(CKDiscretionarySchedulerTask *)&v40 setState:a8];
    id v20 = [v38 copy];
    id startHandler = v19->_startHandler;
    v19->_id startHandler = v20;

    id v22 = [v17 copy];
    id suspendHandler = v19->_suspendHandler;
    v19->_id suspendHandler = v22;

    v24 = +[NSDate date];
    startAfter = v19->_startAfter;
    v19->_startAfter = v24;
    v26 = v24;

    [v39 timeoutIntervalForResource];
    -[NSDate dateByAddingTimeInterval:](v26, "dateByAddingTimeInterval:");
    v27 = (NSDate *)objc_claimAutoreleasedReturnValue();
    startBefore = v19->_startBefore;
    v19->_startBefore = v27;
    v29 = v27;

    os_activity_t v30 = _os_activity_create((void *)&_mh_execute_header, "internal/das-scheduler-task", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    osActivity = v19->_osActivity;
    v19->_osActivity = (OS_os_activity *)v30;
  }
  return v19;
}

- (void)finish
{
  nw_endpoint_t v3 = [(CKDiscretionaryDASSchedulerTask *)self osActivity];
  os_activity_scope_enter(v3, &v8);

  id v4 = [(CKDiscretionaryDASSchedulerTask *)self dasActivity];

  if (v4)
  {
    v5 = [(CKDiscretionaryDASSchedulerTask *)self queue];
    dispatch_assert_queue_V2(v5);

    uint64_t v6 = +[_DASScheduler sharedScheduler];
    objc_super v7 = [(CKDiscretionaryDASSchedulerTask *)self dasActivity];
    [v6 activityCompleted:v7];

    [(CKDiscretionaryDASSchedulerTask *)self setDasActivity:0];
  }
  os_activity_scope_leave(&v8);
}

- (NSString)operationID
{
  return self->_operationID;
}

- (void)setOperationID:(id)a3
{
}

- (void)setGroup:(id)a3
{
}

- (void)setQueue:(id)a3
{
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (void)setRequiresPastBuddy:(BOOL)a3
{
  self->_requiresPastBuddy = a3;
}

- (void)setOptions:(id)a3
{
}

- (void)setStartAfter:(id)a3
{
}

- (void)setStartBefore:(id)a3
{
}

- (void)setRunning:(BOOL)a3
{
  self->_running = a3;
}

- (BOOL)rescheduling
{
  return self->_rescheduling;
}

- (id)startHandler
{
  return self->_startHandler;
}

- (void)setStartHandler:(id)a3
{
}

- (id)suspendHandler
{
  return self->_suspendHandler;
}

- (void)setSuspendHandler:(id)a3
{
}

- (void)setOsActivity:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_osActivity, 0);
  objc_storeStrong((id *)&self->_dasActivity, 0);
  objc_storeStrong(&self->_suspendHandler, 0);
  objc_storeStrong(&self->_startHandler, 0);
  objc_storeStrong((id *)&self->_startBefore, 0);
  objc_storeStrong((id *)&self->_startAfter, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_group, 0);
  objc_storeStrong((id *)&self->_operationID, 0);
}

@end