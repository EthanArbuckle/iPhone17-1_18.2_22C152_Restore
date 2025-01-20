@interface AMSDBackgroundActivityScheduler
- (AMSDBackgroundActivityScheduler)initWithIdentifier:(id)a3;
- (BOOL)allowBattery;
- (BOOL)repeats;
- (BOOL)requireInexpensiveNetworkConnection;
- (BOOL)requireNetworkConnection;
- (NSString)identifier;
- (double)interval;
- (id)activityBlock;
- (int64_t)qualityOfService;
- (void)checkIn;
- (void)invalidate;
- (void)schedule;
- (void)setActivityBlock:(id)a3;
- (void)setAllowBattery:(BOOL)a3;
- (void)setInterval:(double)a3;
- (void)setQualityOfService:(int64_t)a3;
- (void)setRepeats:(BOOL)a3;
- (void)setRequireInexpensiveNetworkConnection:(BOOL)a3;
- (void)setRequireNetworkConnection:(BOOL)a3;
@end

@implementation AMSDBackgroundActivityScheduler

- (AMSDBackgroundActivityScheduler)initWithIdentifier:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AMSDBackgroundActivityScheduler;
  v6 = [(AMSDBackgroundActivityScheduler *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_identifier, a3);
    v7->_qualityOfService = 9;
  }

  return v7;
}

- (void)setRequireInexpensiveNetworkConnection:(BOOL)a3
{
  if (self->_requireInexpensiveNetworkConnection != a3)
  {
    self->_requireInexpensiveNetworkConnection = a3;
    if (a3) {
      [(AMSDBackgroundActivityScheduler *)self setRequireNetworkConnection:1];
    }
  }
}

- (void)setRequireNetworkConnection:(BOOL)a3
{
  if (self->_requireNetworkConnection != a3)
  {
    self->_requireNetworkConnection = a3;
    if (!a3) {
      [(AMSDBackgroundActivityScheduler *)self setRequireInexpensiveNetworkConnection:0];
    }
  }
}

- (void)checkIn
{
  v3 = +[AMSLogConfig sharedAccountsDaemonConfig];
  if (!v3)
  {
    v3 = +[AMSLogConfig sharedConfig];
  }
  v4 = [v3 OSLogObject];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = objc_opt_class();
    v6 = AMSLogKey();
    v7 = [(AMSDBackgroundActivityScheduler *)self identifier];
    int v12 = 138543874;
    uint64_t v13 = v5;
    __int16 v14 = 2114;
    v15 = v6;
    __int16 v16 = 2114;
    v17 = v7;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] Checking in. identifier = %{public}@", (uint8_t *)&v12, 0x20u);
  }
  id v8 = objc_alloc((Class)NSBackgroundActivityScheduler);
  objc_super v9 = [(AMSDBackgroundActivityScheduler *)self identifier];
  id v10 = [v8 initWithIdentifier:v9];

  [v10 setPreregistered:1];
  v11 = [(AMSDBackgroundActivityScheduler *)self activityBlock];
  [v10 scheduleWithBlock:v11];
}

- (void)invalidate
{
  id v3 = objc_alloc((Class)NSBackgroundActivityScheduler);
  v4 = [(AMSDBackgroundActivityScheduler *)self identifier];
  id v5 = [v3 initWithIdentifier:v4];

  [v5 invalidate];
}

- (void)schedule
{
  id v3 = +[AMSLogConfig sharedAccountsDaemonConfig];
  if (!v3)
  {
    id v3 = +[AMSLogConfig sharedConfig];
  }
  v4 = [v3 OSLogObject];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = objc_opt_class();
    v6 = AMSLogKey();
    v7 = [(AMSDBackgroundActivityScheduler *)self identifier];
    int v48 = 138543874;
    uint64_t v49 = v5;
    __int16 v50 = 2114;
    v51 = v6;
    __int16 v52 = 2114;
    int64_t v53 = (int64_t)v7;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Scheduling a block for later execution. identifier = %{public}@ | options = {", (uint8_t *)&v48, 0x20u);
  }
  id v8 = +[AMSLogConfig sharedAccountsDaemonConfig];
  if (!v8)
  {
    id v8 = +[AMSLogConfig sharedConfig];
  }
  objc_super v9 = [v8 OSLogObject];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = objc_opt_class();
    v11 = AMSLogKey();
    if ([(AMSDBackgroundActivityScheduler *)self allowBattery]) {
      CFStringRef v12 = @"true";
    }
    else {
      CFStringRef v12 = @"false";
    }
    int v48 = 138543874;
    uint64_t v49 = v10;
    __int16 v50 = 2114;
    v51 = v11;
    __int16 v52 = 2114;
    int64_t v53 = (int64_t)v12;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@]   allowBattery = %{public}@", (uint8_t *)&v48, 0x20u);
  }
  uint64_t v13 = +[AMSLogConfig sharedAccountsDaemonConfig];
  if (!v13)
  {
    uint64_t v13 = +[AMSLogConfig sharedConfig];
  }
  __int16 v14 = [v13 OSLogObject];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v15 = objc_opt_class();
    __int16 v16 = AMSLogKey();
    [(AMSDBackgroundActivityScheduler *)self interval];
    int v48 = 138543874;
    uint64_t v49 = v15;
    __int16 v50 = 2114;
    v51 = v16;
    __int16 v52 = 2048;
    int64_t v53 = v17;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@]   interval = %lf", (uint8_t *)&v48, 0x20u);
  }
  v18 = +[AMSLogConfig sharedAccountsDaemonConfig];
  if (!v18)
  {
    v18 = +[AMSLogConfig sharedConfig];
  }
  v19 = [v18 OSLogObject];
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v20 = objc_opt_class();
    v21 = AMSLogKey();
    int64_t v22 = [(AMSDBackgroundActivityScheduler *)self qualityOfService];
    int v48 = 138543874;
    uint64_t v49 = v20;
    __int16 v50 = 2114;
    v51 = v21;
    __int16 v52 = 2048;
    int64_t v53 = v22;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@]   qualityOfService = %ld", (uint8_t *)&v48, 0x20u);
  }
  v23 = +[AMSLogConfig sharedAccountsDaemonConfig];
  if (!v23)
  {
    v23 = +[AMSLogConfig sharedConfig];
  }
  v24 = [v23 OSLogObject];
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v25 = objc_opt_class();
    v26 = AMSLogKey();
    if ([(AMSDBackgroundActivityScheduler *)self repeats]) {
      CFStringRef v27 = @"true";
    }
    else {
      CFStringRef v27 = @"false";
    }
    int v48 = 138543874;
    uint64_t v49 = v25;
    __int16 v50 = 2114;
    v51 = v26;
    __int16 v52 = 2114;
    int64_t v53 = (int64_t)v27;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@]   repeats = %{public}@", (uint8_t *)&v48, 0x20u);
  }
  v28 = +[AMSLogConfig sharedAccountsDaemonConfig];
  if (!v28)
  {
    v28 = +[AMSLogConfig sharedConfig];
  }
  v29 = [v28 OSLogObject];
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v30 = objc_opt_class();
    v31 = AMSLogKey();
    if ([(AMSDBackgroundActivityScheduler *)self requireInexpensiveNetworkConnection])
    {
      CFStringRef v32 = @"true";
    }
    else
    {
      CFStringRef v32 = @"false";
    }
    int v48 = 138543874;
    uint64_t v49 = v30;
    __int16 v50 = 2114;
    v51 = v31;
    __int16 v52 = 2114;
    int64_t v53 = (int64_t)v32;
    _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@]   requireInexpensiveNetworkConnection = %{public}@", (uint8_t *)&v48, 0x20u);
  }
  v33 = +[AMSLogConfig sharedAccountsDaemonConfig];
  if (!v33)
  {
    v33 = +[AMSLogConfig sharedConfig];
  }
  v34 = [v33 OSLogObject];
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v35 = objc_opt_class();
    v36 = AMSLogKey();
    if ([(AMSDBackgroundActivityScheduler *)self requireNetworkConnection]) {
      CFStringRef v37 = @"true";
    }
    else {
      CFStringRef v37 = @"false";
    }
    int v48 = 138543874;
    uint64_t v49 = v35;
    __int16 v50 = 2114;
    v51 = v36;
    __int16 v52 = 2114;
    int64_t v53 = (int64_t)v37;
    _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@]   requireNetworkConnection = %{public}@", (uint8_t *)&v48, 0x20u);
  }
  v38 = +[AMSLogConfig sharedAccountsDaemonConfig];
  if (!v38)
  {
    v38 = +[AMSLogConfig sharedConfig];
  }
  v39 = [v38 OSLogObject];
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v40 = objc_opt_class();
    v41 = AMSLogKey();
    int v48 = 138543618;
    uint64_t v49 = v40;
    __int16 v50 = 2114;
    v51 = v41;
    _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] }", (uint8_t *)&v48, 0x16u);
  }
  id v42 = objc_alloc((Class)NSBackgroundActivityScheduler);
  v43 = [(AMSDBackgroundActivityScheduler *)self identifier];
  id v44 = [v42 initWithIdentifier:v43];

  [(AMSDBackgroundActivityScheduler *)self interval];
  objc_msgSend(v44, "setInterval:", fmax(v45, 2.0));
  objc_msgSend(v44, "setQualityOfService:", -[AMSDBackgroundActivityScheduler qualityOfService](self, "qualityOfService"));
  objc_msgSend(v44, "setRepeats:", -[AMSDBackgroundActivityScheduler repeats](self, "repeats"));
  xpc_object_t v46 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v46, XPC_ACTIVITY_ALLOW_BATTERY, [(AMSDBackgroundActivityScheduler *)self allowBattery]);
  xpc_dictionary_set_BOOL(v46, XPC_ACTIVITY_REQUIRE_INEXPENSIVE_NETWORK_CONNECTIVITY, [(AMSDBackgroundActivityScheduler *)self requireInexpensiveNetworkConnection]);
  xpc_dictionary_set_BOOL(v46, XPC_ACTIVITY_REQUIRE_NETWORK_CONNECTIVITY, [(AMSDBackgroundActivityScheduler *)self requireNetworkConnection]);
  [v44 _setAdditionalXPCActivityProperties:v46];
  v47 = [(AMSDBackgroundActivityScheduler *)self activityBlock];
  [v44 scheduleWithBlock:v47];
}

- (id)activityBlock
{
  return self->_activityBlock;
}

- (void)setActivityBlock:(id)a3
{
}

- (BOOL)allowBattery
{
  return self->_allowBattery;
}

- (void)setAllowBattery:(BOOL)a3
{
  self->_allowBattery = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (double)interval
{
  return self->_interval;
}

- (void)setInterval:(double)a3
{
  self->_interval = a3;
}

- (int64_t)qualityOfService
{
  return self->_qualityOfService;
}

- (void)setQualityOfService:(int64_t)a3
{
  self->_qualityOfService = a3;
}

- (BOOL)repeats
{
  return self->_repeats;
}

- (void)setRepeats:(BOOL)a3
{
  self->_repeats = a3;
}

- (BOOL)requireInexpensiveNetworkConnection
{
  return self->_requireInexpensiveNetworkConnection;
}

- (BOOL)requireNetworkConnection
{
  return self->_requireNetworkConnection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong(&self->_activityBlock, 0);
}

@end