@interface RTRoutineManagerRegistrantScenarioTrigger
- (BOOL)registered;
- (NSDictionary)scenarioTriggerHandlers;
- (RTRoutineManagerRegistrantScenarioTrigger)init;
- (id)startMonitoringForScenarioTriggerTypes:(unint64_t)a3 handler:(id)a4;
- (id)stopMonitoringForScenarioTriggerTypes:(unint64_t)a3;
- (unint64_t)monitoredScenarioTriggerTypes;
- (void)onScenarioTriggers:(id)a3 error:(id)a4;
@end

@implementation RTRoutineManagerRegistrantScenarioTrigger

- (RTRoutineManagerRegistrantScenarioTrigger)init
{
  v6.receiver = self;
  v6.super_class = (Class)RTRoutineManagerRegistrantScenarioTrigger;
  v2 = [(RTRoutineManagerRegistrantScenarioTrigger *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    scenarioTriggerHandlers = v2->__scenarioTriggerHandlers;
    v2->__scenarioTriggerHandlers = (NSMutableDictionary *)v3;
  }
  return v2;
}

- (BOOL)registered
{
  return self->_registered;
}

- (id)startMonitoringForScenarioTriggerTypes:(unint64_t)a3 handler:(id)a4
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (v6)
  {
    while (a3)
    {
      v7 = [NSNumber numberWithUnsignedInteger:a3 & -(uint64_t)a3];
      scenarioTriggerHandlers = self->__scenarioTriggerHandlers;
      v9 = (void *)MEMORY[0x1AD0EBF30](v6);
      [(NSMutableDictionary *)scenarioTriggerHandlers setObject:v9 forKey:v7];

      self->_monitoredScenarioTriggerTypes |= a3 & -(uint64_t)a3;
      a3 &= a3 - 1;
    }
    v12 = 0;
    self->_registered = self->_monitoredScenarioTriggerTypes != 0;
  }
  else
  {
    v10 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v14 = *MEMORY[0x1E4F28568];
    v15[0] = @"Invalid parameter value for handler.  Requires non-nil value.";
    v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
    v12 = [v10 errorWithDomain:@"RTErrorDomain" code:7 userInfo:v11];
  }
  return v12;
}

- (id)stopMonitoringForScenarioTriggerTypes:(unint64_t)a3
{
  if (a3)
  {
    unint64_t v4 = a3;
    do
    {
      v5 = [NSNumber numberWithUnsignedInteger:v4 & -(uint64_t)v4];
      [(NSMutableDictionary *)self->__scenarioTriggerHandlers removeObjectForKey:v5];
      self->_monitoredScenarioTriggerTypes &= ~(v4 & -(uint64_t)v4);
      v4 &= v4 - 1;
    }
    while (v4);
  }
  self->_registered = self->_monitoredScenarioTriggerTypes != 0;
  return 0;
}

- (void)onScenarioTriggers:(id)a3 error:(id)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v28 = a4;
  unint64_t monitoredScenarioTriggerTypes = self->_monitoredScenarioTriggerTypes;
  v9 = objc_opt_new();
  while (monitoredScenarioTriggerTypes)
  {
    v10 = +[RTScenarioTrigger scenarioTriggerTypeToString:monitoredScenarioTriggerTypes & -(uint64_t)monitoredScenarioTriggerTypes];
    if (v10) {
      [v9 addObject:v10];
    }
    monitoredScenarioTriggerTypes &= monitoredScenarioTriggerTypes - 1;
  }
  v11 = _rt_log_facility_get_os_log(RTLogFacilityFramework);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = NSStringFromSelector(a2);
    if (self->_registered) {
      v13 = @"YES";
    }
    else {
      v13 = @"NO";
    }
    [v9 componentsJoinedByString:@", "];
    v15 = uint64_t v14 = v9;
    *(_DWORD *)buf = 138413314;
    v35 = v12;
    __int16 v36 = 2112;
    v37 = v13;
    __int16 v38 = 2112;
    v39 = v15;
    __int16 v40 = 2112;
    id v41 = v7;
    __int16 v42 = 2112;
    id v43 = v28;
    _os_log_impl(&dword_1A8FEF000, v11, OS_LOG_TYPE_INFO, "%@, registered, %@, monitoredScenarioTriggerTypes, %@, scenarioTriggers, %@, error, %@", buf, 0x34u);

    v9 = v14;
  }

  if (self->_registered)
  {
    v26 = v9;
    id v27 = v7;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v16 = v7;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v30 != v19) {
            objc_enumerationMutation(v16);
          }
          v21 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          unint64_t v22 = self->_monitoredScenarioTriggerTypes;
          if (([v21 type] & v22) != 0)
          {
            v23 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v21, "type"));
            uint64_t v24 = [(NSMutableDictionary *)self->__scenarioTriggerHandlers objectForKey:v23];
            v25 = (void *)v24;
            if (v24) {
              (*(void (**)(uint64_t, void *, id))(v24 + 16))(v24, v21, v28);
            }
          }
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v29 objects:v33 count:16];
      }
      while (v18);
    }

    v9 = v26;
    id v7 = v27;
  }
}

- (NSDictionary)scenarioTriggerHandlers
{
  return &self->__scenarioTriggerHandlers->super;
}

- (unint64_t)monitoredScenarioTriggerTypes
{
  return self->_monitoredScenarioTriggerTypes;
}

- (void).cxx_destruct
{
}

@end