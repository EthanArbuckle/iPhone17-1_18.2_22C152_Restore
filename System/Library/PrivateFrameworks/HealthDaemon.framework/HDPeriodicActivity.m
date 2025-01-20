@interface HDPeriodicActivity
+ (void)registerDisabledPeriodicActivityWithName:(id)a3 loggingCategory:(id)a4;
- (BOOL)isWaitingToRun;
- (BOOL)shouldDefer;
- (HDPeriodicActivity)initWithProfile:(id)a3 name:(id)a4 interval:(double)a5 delegate:(id)a6 loggingCategory:(id)a7;
- (HDPeriodicActivityDelegate)delegate;
- (NSString)description;
- (NSString)name;
- (OS_os_log)loggingCategory;
- (OS_xpc_object)currentActivity;
- (double)interval;
- (id)_criteriaForInterval:(uint64_t)a1;
- (id)currentCriteria;
- (id)diagnosticDescription;
- (id)lastSuccessfulRunDate;
- (int64_t)errorCount;
- (uint64_t)_requiresProtectedData;
- (void)_updateCriteriaForActivity:(uint64_t)a1;
- (void)daemonActivated:(id)a3;
- (void)database:(id)a3 protectedDataDidBecomeAvailable:(BOOL)a4;
- (void)dealloc;
- (void)didPerformActivityWithResult:(int64_t)a3 minimumRetryInterval:(double)a4 activityStartDate:(id)a5 error:(id)a6;
- (void)reset;
- (void)resetInterval;
- (void)synthesizeActivityFire;
- (void)unitTest_setShouldDefer:(BOOL)a3;
- (void)updateCriteria;
@end

@implementation HDPeriodicActivity

- (HDPeriodicActivity)initWithProfile:(id)a3 name:(id)a4 interval:(double)a5 delegate:(id)a6 loggingCategory:(id)a7
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  v32.receiver = self;
  v32.super_class = (Class)HDPeriodicActivity;
  v16 = [(HDPeriodicActivity *)&v32 init];
  v17 = v16;
  if (v16)
  {
    objc_storeWeak((id *)&v16->_profile, v12);
    objc_initWeak(&location, v17);
    id v18 = objc_alloc(MEMORY[0x1E4F65DD0]);
    uint64_t v26 = MEMORY[0x1E4F143A8];
    uint64_t v27 = 3221225472;
    v28 = __77__HDPeriodicActivity_initWithProfile_name_interval_delegate_loggingCategory___block_invoke;
    v29 = &unk_1E6309788;
    objc_copyWeak(&v30, &location);
    uint64_t v19 = [v18 initWithName:v13 baseInterval:*MEMORY[0x1E4F14158] criteria:v15 loggingCategory:&v26 handler:a5];
    activity = v17->_activity;
    v17->_activity = (HDXPCPeriodicActivity *)v19;

    objc_storeWeak((id *)&v17->_delegate, v14);
    v21 = objc_msgSend(MEMORY[0x1E4F65CF8], "sharedDiagnosticManager", v26, v27, v28, v29);
    [v21 addObject:v17];

    _HKInitializeLogging();
    loggingCategory = v17->_loggingCategory;
    if (os_log_type_enabled(loggingCategory, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v34 = v13;
      _os_log_impl(&dword_1BCB7D000, loggingCategory, OS_LOG_TYPE_DEFAULT, "Starting up XPC service scheduler (%@)", buf, 0xCu);
    }
    id WeakRetained = objc_loadWeakRetained((id *)&v17->_profile);
    v24 = [WeakRetained daemon];
    [v24 registerDaemonActivatedObserver:v17 queue:0];

    objc_destroyWeak(&v30);
    objc_destroyWeak(&location);
  }

  return v17;
}

void __77__HDPeriodicActivity_initWithProfile_name_interval_delegate_loggingCategory___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained(v4);
  v7 = [v6 currentActivity];

  id v8 = v7;
  v9 = (void (**)(id, uint64_t, void, double))v5;
  if (WeakRetained)
  {
    if (-[HDPeriodicActivity _requiresProtectedData]((uint64_t)WeakRetained)
      && (id v10 = objc_loadWeakRetained(WeakRetained + 1),
          [v10 database],
          v11 = objc_claimAutoreleasedReturnValue(),
          char v12 = [v11 isProtectedDataAvailable],
          v11,
          v10,
          (v12 & 1) == 0))
    {
      v9[2](v9, 1, 0, 0.0);
      id v14 = objc_loadWeakRetained(WeakRetained + 6);
      char v15 = objc_opt_respondsToSelector();

      if (v15)
      {
        id v16 = objc_loadWeakRetained(WeakRetained + 6);
        objc_msgSend(v16, "unitTesting_runDeclinedForActivity:", WeakRetained);
      }
    }
    else
    {
      id v13 = objc_loadWeakRetained(WeakRetained + 6);
      uint64_t v19 = v9;
      id v18 = v8;
      objc_msgSend(v13, "performPeriodicActivity:completion:");
    }
  }
}

- (void)dealloc
{
  [(HDXPCPeriodicActivity *)self->_activity unregisterActivity];
  v3.receiver = self;
  v3.super_class = (Class)HDPeriodicActivity;
  [(HDPeriodicActivity *)&v3 dealloc];
}

+ (void)registerDisabledPeriodicActivityWithName:(id)a3 loggingCategory:(id)a4
{
}

- (void)didPerformActivityWithResult:(int64_t)a3 minimumRetryInterval:(double)a4 activityStartDate:(id)a5 error:(id)a6
{
  activity = self->_activity;
  if ((unint64_t)a3 > 3) {
    uint64_t v7 = 2;
  }
  else {
    uint64_t v7 = qword_1BD340DE0[a3];
  }
  [(HDXPCPeriodicActivity *)activity didPerformActivityWithResult:v7 minimumRetryInterval:a5 activityStartDate:a6 error:a4];
}

- (NSString)name
{
  return (NSString *)[(HDXPCPeriodicActivity *)self->_activity name];
}

- (int64_t)errorCount
{
  return [(HDXPCPeriodicActivity *)self->_activity errorCount];
}

- (BOOL)shouldDefer
{
  if (_HDIsUnitTesting) {
    return self->_unitTest_shouldDefer;
  }
  else {
    return [(HDXPCPeriodicActivity *)self->_activity shouldDefer];
  }
}

- (BOOL)isWaitingToRun
{
  return [(HDXPCPeriodicActivity *)self->_activity isWaiting];
}

- (id)lastSuccessfulRunDate
{
  return (id)[(HDXPCPeriodicActivity *)self->_activity lastSuccessfulRunDate];
}

- (void)updateCriteria
{
  objc_super v3 = [(HDPeriodicActivity *)self currentActivity];
  if (v3)
  {
    v4 = v3;
    -[HDPeriodicActivity _updateCriteriaForActivity:]((uint64_t)self, v3);
    objc_super v3 = v4;
  }
}

- (void)_updateCriteriaForActivity:(uint64_t)a1
{
  objc_super v3 = a2;
  if (a1)
  {
    activity = v3;
    [*(id *)(a1 + 16) modifiedIntervalForCurrentState];
    double v5 = v4;
    xpc_object_t v6 = xpc_activity_copy_criteria(activity);
    uint64_t v7 = -[HDPeriodicActivity _criteriaForInterval:](a1, v5);
    if (!v6 || !xpc_equal(v6, v7)) {
      xpc_activity_set_criteria(activity, v7);
    }

    objc_super v3 = activity;
  }
}

- (id)currentCriteria
{
  v2 = [(HDPeriodicActivity *)self currentActivity];
  objc_super v3 = v2;
  if (v2) {
    xpc_object_t v4 = xpc_activity_copy_criteria(v2);
  }
  else {
    xpc_object_t v4 = 0;
  }

  return v4;
}

- (void)resetInterval
{
  if (self) {
    [(HDXPCPeriodicActivity *)self->_activity modifiedIntervalForCurrentState];
  }
  else {
    double v3 = 0.0;
  }
  xpc_object_t v4 = -[HDPeriodicActivity _criteriaForInterval:]((uint64_t)self, v3);
  [(HDXPCPeriodicActivity *)self->_activity setCriteria:v4];

  [(HDXPCPeriodicActivity *)self->_activity unregisterActivity];
  activity = self->_activity;

  [(HDXPCPeriodicActivity *)activity registerActivity];
}

- (id)_criteriaForInterval:(uint64_t)a1
{
  if (a1)
  {
    xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
    double v5 = v4;
    if (a2 > 0.0) {
      xpc_dictionary_set_int64(v4, (const char *)*MEMORY[0x1E4F141C8], (uint64_t)a2);
    }
    if (-[HDPeriodicActivity _requiresProtectedData](a1)) {
      xpc_dictionary_set_BOOL(v5, (const char *)*MEMORY[0x1E4F14310], 1);
    }
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    [WeakRetained periodicActivity:a1 configureXPCActivityCriteria:v5];
  }
  else
  {
    double v5 = 0;
  }

  return v5;
}

- (void)reset
{
}

- (void)synthesizeActivityFire
{
}

- (void)unitTest_setShouldDefer:(BOOL)a3
{
  self->_unitTest_shouldDefer = a3;
}

- (void)daemonActivated:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  double v5 = [WeakRetained database];
  [v5 addProtectedDataObserver:self];

  if (self) {
    [(HDXPCPeriodicActivity *)self->_activity modifiedIntervalForCurrentState];
  }
  else {
    double v6 = 0.0;
  }
  -[HDPeriodicActivity _criteriaForInterval:]((uint64_t)self, v6);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [(HDXPCPeriodicActivity *)self->_activity setCriteria:v7];
  [(HDXPCPeriodicActivity *)self->_activity registerActivity];
}

- (void)database:(id)a3 protectedDataDidBecomeAvailable:(BOOL)a4
{
  if (a4) {
    [(HDXPCPeriodicActivity *)self->_activity externalConditionsChanged];
  }
}

- (NSString)description
{
  double v3 = NSString;
  xpc_object_t v4 = (objc_class *)objc_opt_class();
  double v5 = NSStringFromClass(v4);
  double v6 = [(HDXPCPeriodicActivity *)self->_activity name];
  [(HDXPCPeriodicActivity *)self->_activity baseInterval];
  id v8 = [v3 stringWithFormat:@"<%@:%p %@ (%0.2lfs)>", v5, self, v6, v7];

  return (NSString *)v8;
}

- (uint64_t)_requiresProtectedData
{
  v2 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  char v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0) {
    return 0;
  }
  id v5 = objc_loadWeakRetained(v2);
  uint64_t v6 = [v5 periodicActivityRequiresProtectedData:a1];

  return v6;
}

void __51__HDPeriodicActivity__fireWithActivity_completion___block_invoke(void *a1, unint64_t a2)
{
  uint64_t v4 = a1[6];
  if (a2 > 3) {
    uint64_t v5 = 2;
  }
  else {
    uint64_t v5 = qword_1BD340DE0[a2];
  }
  (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v4, v5);
  uint64_t v6 = (void *)a1[4];
  if (v6) {
    -[HDPeriodicActivity _updateCriteriaForActivity:](a1[5], v6);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1[5] + 48));
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    id v9 = objc_loadWeakRetained((id *)(a1[5] + 48));
    objc_msgSend(v9, "unitTesting_didPerformActivityWithResult:", a2);
  }
}

- (id)diagnosticDescription
{
  double v3 = NSString;
  uint64_t v4 = [(HDXPCPeriodicActivity *)self->_activity name];
  uint64_t v5 = [(HDXPCPeriodicActivity *)self->_activity lastSuccessfulRunDate];
  [(HDXPCPeriodicActivity *)self->_activity baseInterval];
  uint64_t v7 = v6;
  char v8 = [(HDXPCPeriodicActivity *)self->_activity earliestRunDate];
  id v9 = [v3 stringWithFormat:@"Activity: '%@'\nLast Successful Run: %@\nBase Interval: %lfs\nEarliest Run Date: %@\nError Count: %ld", v4, v5, v7, v8, -[HDXPCPeriodicActivity errorCount](self->_activity, "errorCount")];

  return v9;
}

- (OS_os_log)loggingCategory
{
  return self->_loggingCategory;
}

- (double)interval
{
  return self->_interval;
}

- (HDPeriodicActivityDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HDPeriodicActivityDelegate *)WeakRetained;
}

- (OS_xpc_object)currentActivity
{
  return (OS_xpc_object *)objc_getProperty(self, a2, 56, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentActivity, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_loggingCategory, 0);
  objc_storeStrong((id *)&self->_activity, 0);

  objc_destroyWeak((id *)&self->_profile);
}

@end