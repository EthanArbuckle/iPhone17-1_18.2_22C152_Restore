@interface _DKMDCSWorkoutMonitor
+ (id)entitlements;
+ (id)eventStream;
- (_DKMDCSWorkoutMonitor)init;
- (id)createWorkoutPredicate;
- (void)createWorkoutPredicate;
- (void)start;
- (void)stop;
@end

@implementation _DKMDCSWorkoutMonitor

+ (id)eventStream
{
  return @"MDCSWorkout";
}

+ (id)entitlements
{
  return (id)MEMORY[0x263EFFA68];
}

- (_DKMDCSWorkoutMonitor)init
{
  v6.receiver = self;
  v6.super_class = (Class)_DKMDCSWorkoutMonitor;
  v2 = [(_DKMonitor *)&v6 init];
  if (v2)
  {
    v3 = [MEMORY[0x263F34FB8] knowledgeChannel];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_225002000, v3, OS_LOG_TYPE_DEFAULT, "Enabling MDCS Workout monitor", v5, 2u);
    }
  }
  return v2;
}

- (void)start
{
}

- (void)stop
{
  v4.receiver = self;
  v4.super_class = (Class)_DKMDCSWorkoutMonitor;
  if ([(_DKMonitor *)&v4 instantMonitorNeedsDeactivation])
  {
    if (self->_registration)
    {
      -[_CDClientContext deregisterCallback:](self->_userContext, "deregisterCallback:");
      registration = self->_registration;
      self->_registration = 0;
    }
  }
}

- (id)createWorkoutPredicate
{
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x2050000000;
  v2 = (void *)getHKWorkoutClass_softClass;
  uint64_t v22 = getHKWorkoutClass_softClass;
  if (!getHKWorkoutClass_softClass)
  {
    HealthKitLibraryCore();
    v20[3] = (uint64_t)objc_getClass("HKWorkout");
    getHKWorkoutClass_softClass = v20[3];
    v2 = (void *)v20[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v19, 8);
  objc_super v4 = [v3 _allWorkoutActivityTypes];
  if (v4)
  {
    v5 = objc_opt_new();
    objc_super v6 = __HKWorkoutSessionStateName(2);
    [v5 addObject:v6];

    v7 = __HKWorkoutSessionStateName(3);
    [v5 addObject:v7];

    v8 = (void *)MEMORY[0x263F35218];
    v9 = [MEMORY[0x263EFFA08] setWithArray:v4];
    v10 = [v8 predicateForFirstPartyWorkoutMatchingTypes:v9 states:v5];
  }
  else
  {
    v5 = [MEMORY[0x263F34FB8] knowledgeChannel];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      [(_DKMDCSWorkoutMonitor *)v5 createWorkoutPredicate];
    }
    v10 = 0;
  }

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registration, 0);
  objc_storeStrong((id *)&self->_userContext, 0);
}

- (void)createWorkoutPredicate
{
}

@end