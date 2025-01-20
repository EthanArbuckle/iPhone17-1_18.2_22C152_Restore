@interface HDXPCScheduler
+ (id)schedulerWithEventNamed:(id)a3 runBlock:(id)a4;
- (NSString)eventName;
- (id)_criteriaForInterval:(double)a3 gracePeriod:(double)a4;
- (id)_identifierForEventName:(id)a3;
- (id)_initWithEventNamed:(id)a3 runBlock:(id)a4;
- (id)runBlock;
- (void)_checkIn;
- (void)_dispatchBlock;
- (void)_registerWithCriteria:(id)a3;
- (void)scheduleWithInterval:(double)a3 gracePeriod:(double)a4;
- (void)setRunBlock:(id)a3;
- (void)unschedule;
@end

@implementation HDXPCScheduler

+ (id)schedulerWithEventNamed:(id)a3 runBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [objc_alloc((Class)a1) _initWithEventNamed:v7 runBlock:v6];

  return v8;
}

- (id)_initWithEventNamed:(id)a3 runBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HDXPCScheduler;
  id v8 = [(HDXPCScheduler *)&v14 init];
  if (v8)
  {
    v9 = (NSString *)[v6 copy];
    eventName = v8->_eventName;
    v8->_eventName = v9;

    id v11 = [v7 copy];
    id runBlock = v8->_runBlock;
    v8->_id runBlock = v11;

    [(HDXPCScheduler *)v8 _checkIn];
  }

  return v8;
}

- (void)scheduleWithInterval:(double)a3 gracePeriod:(double)a4
{
  if (a4 <= 0.0)
  {
    v12 = +[NSAssertionHandler currentHandler];
    [v12 handleFailureInMethod:a2, self, @"HDXPCScheduler.m", 45, @"Invalid parameter not satisfying: %@", @"gracePeriod > 0" object file lineNumber description];
  }
  if (a3 <= 0.0)
  {
    v13 = +[NSAssertionHandler currentHandler];
    [v13 handleFailureInMethod:a2, self, @"HDXPCScheduler.m", 46, @"Invalid parameter not satisfying: %@", @"interval > 0" object file lineNumber description];
  }
  _HKInitializeLogging();
  id v8 = (void *)HKLogHealthRecords;
  if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEBUG))
  {
    v10 = v8;
    id v11 = [(HDXPCScheduler *)self eventName];
    *(_DWORD *)buf = 138543874;
    v15 = v11;
    __int16 v16 = 2048;
    double v17 = a3;
    __int16 v18 = 2048;
    double v19 = a4;
    _os_log_debug_impl(&dword_0, v10, OS_LOG_TYPE_DEBUG, "Scheduling XPC trigger %{public}@ to fire after %f with grace period %f", buf, 0x20u);
  }
  v9 = [(HDXPCScheduler *)self _criteriaForInterval:a3 gracePeriod:a4];
  [(HDXPCScheduler *)self _registerWithCriteria:v9];
}

- (void)unschedule
{
  v3 = [(HDXPCScheduler *)self eventName];
  _HKInitializeLogging();
  v4 = HKLogHealthRecords;
  if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEBUG)) {
    sub_AC720((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);
  }
  id v11 = [(HDXPCScheduler *)self _identifierForEventName:v3];
  xpc_activity_unregister((const char *)[v11 UTF8String]);
}

- (void)_checkIn
{
}

- (void)_dispatchBlock
{
  v3 = [(HDXPCScheduler *)self runBlock];
  v3[2](v3, self);
}

- (void)_registerWithCriteria:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HDXPCScheduler *)self eventName];
  uint64_t v6 = [(HDXPCScheduler *)self _identifierForEventName:v5];
  objc_initWeak(&location, self);
  id v7 = v6;
  uint64_t v8 = (const char *)[v7 UTF8String];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_2929C;
  v11[3] = &unk_1129C8;
  id v9 = v5;
  id v12 = v9;
  objc_copyWeak(&v14, &location);
  id v10 = v7;
  id v13 = v10;
  xpc_activity_register(v8, v4, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (id)_criteriaForInterval:(double)a3 gracePeriod:(double)a4
{
  if (a3 <= 0.0)
  {
    id v10 = +[NSAssertionHandler currentHandler];
    [v10 handleFailureInMethod:a2, self, @"HDXPCScheduler.m", 107, @"Invalid parameter not satisfying: %@", @"interval > 0" object file lineNumber description];
  }
  xpc_object_t v6 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v6, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_UTILITY);
  xpc_dictionary_set_BOOL(v6, XPC_ACTIVITY_REQUIRES_CLASS_C, 1);
  xpc_dictionary_set_int64(v6, XPC_ACTIVITY_DELAY, vcvtpd_s64_f64(a3));
  xpc_dictionary_set_int64(v6, XPC_ACTIVITY_GRACE_PERIOD, vcvtpd_s64_f64(a4));

  return v6;
}

- (id)_identifierForEventName:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)NSString) initWithFormat:@"%@.%@", @"com.apple.healthd.healthrecords.scheduler", v3];

  return v4;
}

- (NSString)eventName
{
  return self->_eventName;
}

- (id)runBlock
{
  return self->_runBlock;
}

- (void)setRunBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_runBlock, 0);

  objc_storeStrong((id *)&self->_eventName, 0);
}

@end