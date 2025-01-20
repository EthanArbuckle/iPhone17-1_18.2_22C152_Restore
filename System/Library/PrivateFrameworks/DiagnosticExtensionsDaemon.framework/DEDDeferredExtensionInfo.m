@interface DEDDeferredExtensionInfo
+ (BOOL)supportsSecureCoding;
+ (double)recommendedGracePeriodForDate:(id)a3;
+ (id)activityStringForBugSessionIdentifier:(id)a3 dedIdentifier:(id)a4;
+ (id)allInfo;
+ (id)archivedClasses;
+ (id)log;
+ (void)allInfo;
+ (void)checkIn;
- (BOOL)isEqual:(id)a3;
- (BOOL)isOverdue;
- (BOOL)requiresClassBDataAccess;
- (BOOL)scheduled;
- (DEDDeferredExtensionInfo)initWithBugSessionIdentifier:(id)a3 dedIdentifier:(id)a4 runOnDate:(id)a5 withGracePeriod:(double)a6;
- (DEDDeferredExtensionInfo)initWithCoder:(id)a3;
- (DEDExtensionIdentifier)dedIdentifier;
- (NSDate)triggerDate;
- (NSDictionary)parameters;
- (NSString)activityString;
- (NSString)bugSessionIdentifier;
- (double)gracePeriod;
- (id)criteria;
- (void)addToStore;
- (void)encodeWithCoder:(id)a3;
- (void)removeFromStore;
- (void)run;
- (void)schedule;
- (void)setGracePeriod:(double)a3;
- (void)setParameters:(id)a3;
- (void)setRequiresClassBDataAccess:(BOOL)a3;
- (void)setScheduled:(BOOL)a3;
- (void)setTriggerDate:(id)a3;
- (void)unschedule;
@end

@implementation DEDDeferredExtensionInfo

+ (id)log
{
  if (log_onceToken_4 != -1) {
    dispatch_once(&log_onceToken_4, &__block_literal_global_22);
  }
  v2 = (void *)log__log;
  return v2;
}

void __31__DEDDeferredExtensionInfo_log__block_invoke()
{
  id v2 = +[DEDConfiguration sharedInstance];
  os_log_t v0 = os_log_create((const char *)[v2 loggingSubsystem], "ded-deferred-info");
  v1 = (void *)log__log;
  log__log = (uint64_t)v0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (double)recommendedGracePeriodForDate:(id)a3
{
  [a3 timeIntervalSinceNow];
  double v4 = 10.0;
  if (v3 > 60.0)
  {
    double v4 = 30.0;
    if (v3 > 300.0)
    {
      if (v3 <= 1800.0)
      {
        return 60.0;
      }
      else if (v3 <= 3600.0)
      {
        return 600.0;
      }
      else if (v3 <= 21600.0)
      {
        return 900.0;
      }
      else
      {
        return dbl_21FE7B0A0[v3 > 43200.0];
      }
    }
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  bugSessionIdentifier = self->_bugSessionIdentifier;
  id v5 = a3;
  [v5 encodeObject:bugSessionIdentifier forKey:@"bugSessionIdentifier"];
  [v5 encodeObject:self->_dedIdentifier forKey:@"dedIdentifier"];
  [v5 encodeObject:self->_triggerDate forKey:@"triggerDate"];
  [v5 encodeObject:self->_parameters forKey:@"parameters"];
  [v5 encodeDouble:@"gracePeriod" forKey:self->_gracePeriod];
  [v5 encodeBool:self->_scheduled forKey:@"scheduled"];
  [v5 encodeBool:self->_requiresClassBDataAccess forKey:@"requiresClassBDataAccess"];
}

- (DEDDeferredExtensionInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)DEDDeferredExtensionInfo;
  id v5 = [(DEDDeferredExtensionInfo *)&v23 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bugSessionIdentifier"];
    bugSessionIdentifier = v5->_bugSessionIdentifier;
    v5->_bugSessionIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dedIdentifier"];
    dedIdentifier = v5->_dedIdentifier;
    v5->_dedIdentifier = (DEDExtensionIdentifier *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"triggerDate"];
    triggerDate = v5->_triggerDate;
    v5->_triggerDate = (NSDate *)v10;

    [v4 decodeDoubleForKey:@"gracePeriod"];
    v5->_gracePeriod = v12;
    v5->_scheduled = [v4 decodeBoolForKey:@"scheduled"];
    v5->_requiresClassBDataAccess = [v4 decodeBoolForKey:@"requiresClassBDataAccess"];
    v13 = (void *)MEMORY[0x263EFFA08];
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = objc_opt_class();
    uint64_t v16 = objc_opt_class();
    uint64_t v17 = objc_opt_class();
    uint64_t v18 = objc_opt_class();
    v19 = objc_msgSend(v13, "setWithObjects:", v14, v15, v16, v17, v18, objc_opt_class(), 0);
    uint64_t v20 = [v4 decodeObjectOfClasses:v19 forKey:@"parameters"];
    parameters = v5->_parameters;
    v5->_parameters = (NSDictionary *)v20;
  }
  return v5;
}

+ (id)archivedClasses
{
  id v2 = (void *)MEMORY[0x263EFF9C0];
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_msgSend(v2, "setWithObjects:", v3, v4, v5, v6, v7, objc_opt_class(), 0);
  v9 = +[DEDExtensionIdentifier archivedClasses];
  [v8 unionSet:v9];

  return v8;
}

- (DEDDeferredExtensionInfo)initWithBugSessionIdentifier:(id)a3 dedIdentifier:(id)a4 runOnDate:(id)a5 withGracePeriod:(double)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)DEDDeferredExtensionInfo;
  uint64_t v14 = [(DEDDeferredExtensionInfo *)&v17 init];
  uint64_t v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_bugSessionIdentifier, a3);
    objc_storeStrong((id *)&v15->_dedIdentifier, a4);
    objc_storeStrong((id *)&v15->_triggerDate, a5);
    v15->_gracePeriod = a6;
    v15->_scheduled = 0;
  }

  return v15;
}

- (void)setTriggerDate:(id)a3
{
}

- (void)setGracePeriod:(double)a3
{
  self->_gracePeriod = a3;
}

+ (id)allInfo
{
  uint64_t v3 = [MEMORY[0x263EFFA40] standardUserDefaults];
  uint64_t v4 = [v3 objectForKey:@"deferred-execution-info"];
  if (v4)
  {
    uint64_t v5 = (void *)MEMORY[0x263F08928];
    uint64_t v6 = [a1 archivedClasses];
    id v14 = 0;
    uint64_t v7 = [v5 unarchivedObjectOfClasses:v6 fromData:v4 error:&v14];
    id v8 = v14;

    if (v8)
    {
      v9 = [a1 log];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        +[DEDDeferredExtensionInfo allInfo];
      }

      id v10 = [NSDictionary dictionary];
    }
    else
    {
      id v10 = v7;
    }
    id v12 = v10;
  }
  else
  {
    id v11 = [a1 log];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21FE04000, v11, OS_LOG_TYPE_INFO, "Creating dictionary for deferred execution info", buf, 2u);
    }

    id v12 = [NSDictionary dictionary];
  }

  return v12;
}

- (void)addToStore
{
  v1 = [a1 activityString];
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_1_3(&dword_21FE04000, v2, v3, "Archiving failed for extension: %{public}@\nReason:%{public}@", v4, v5, v6, v7, v8);
}

- (void)removeFromStore
{
  v1 = [a1 activityString];
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_1_3(&dword_21FE04000, v2, v3, "Archiving failed for extension: %{public}@\nReason: %{public}@", v4, v5, v6, v7, v8);
}

+ (void)checkIn
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v3 = (void *)*MEMORY[0x263EF8188];
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __35__DEDDeferredExtensionInfo_checkIn__block_invoke;
  handler[3] = &__block_descriptor_40_e33_v16__0__NSObject_OS_xpc_object__8l;
  handler[4] = a1;
  xpc_activity_register("com.apple.diagnosticextensionsd.reschedule", v3, handler);
  uint64_t v4 = [a1 log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21FE04000, v4, OS_LOG_TYPE_DEFAULT, "Rescheduling all activities", buf, 2u);
  }

  uint64_t v5 = [(id)objc_opt_class() allInfo];
  +[DEDAnalytics didCheckInDeferredExtensionsWithCount:](DEDAnalytics, "didCheckInDeferredExtensionsWithCount:", [v5 count]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v6 = objc_msgSend(v5, "allValues", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * v10++) schedule];
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v17 count:16];
    }
    while (v8);
  }
}

void __35__DEDDeferredExtensionInfo_checkIn__block_invoke(uint64_t a1, xpc_activity_t activity)
{
  if (!xpc_activity_get_state(activity))
  {
    uint64_t v3 = [*(id *)(a1 + 32) log];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl(&dword_21FE04000, v3, OS_LOG_TYPE_DEFAULT, "Reschedule activity checking in.", v4, 2u);
    }
  }
}

- (id)criteria
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v3, (const char *)*MEMORY[0x263EF82A0], 0);
  if ([(DEDDeferredExtensionInfo *)self requiresClassBDataAccess])
  {
    xpc_dictionary_set_BOOL(v3, (const char *)*MEMORY[0x263EF82B0], 1);
  }
  else
  {
    uint64_t v4 = [(DEDDeferredExtensionInfo *)self triggerDate];
    [v4 timeIntervalSinceNow];
    double v6 = v5;

    xpc_dictionary_set_int64(v3, (const char *)*MEMORY[0x263EF81A0], (uint64_t)v6);
  }
  uint64_t v7 = (const char *)*MEMORY[0x263EF81C0];
  [(DEDDeferredExtensionInfo *)self gracePeriod];
  xpc_dictionary_set_int64(v3, v7, (uint64_t)v8);
  xpc_dictionary_set_string(v3, (const char *)*MEMORY[0x263EF8280], (const char *)*MEMORY[0x263EF8290]);
  return v3;
}

- (void)schedule
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  [(DEDDeferredExtensionInfo *)self setScheduled:1];
  xpc_object_t v3 = NSString;
  uint64_t v4 = [(DEDDeferredExtensionInfo *)self activityString];
  double v5 = [v3 stringWithFormat:@"transaction.%@", v4];

  id v6 = v5;
  [v6 UTF8String];
  uint64_t v7 = (void *)os_transaction_create();
  double v8 = [(id)objc_opt_class() log];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = [(DEDDeferredExtensionInfo *)self activityString];
    *(_DWORD *)buf = 138543362;
    uint64_t v18 = v9;
    _os_log_impl(&dword_21FE04000, v8, OS_LOG_TYPE_DEFAULT, "Scheduling deferred DE: %{public}@", buf, 0xCu);
  }
  id v10 = [(DEDDeferredExtensionInfo *)self activityString];
  long long v11 = (const char *)[v10 UTF8String];
  long long v12 = (void *)*MEMORY[0x263EF8188];
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __36__DEDDeferredExtensionInfo_schedule__block_invoke;
  handler[3] = &unk_26453AEF8;
  id v15 = v7;
  uint64_t v16 = self;
  id v13 = v7;
  xpc_activity_register(v11, v12, handler);

  [(DEDDeferredExtensionInfo *)self addToStore];
}

void __36__DEDDeferredExtensionInfo_schedule__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  xpc_object_t v3 = a2;
  xpc_activity_state_t state = xpc_activity_get_state(v3);
  if (state)
  {
    if (state == 2)
    {
      double v5 = [(id)objc_opt_class() log];
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        id v6 = [*(id *)(a1 + 40) activityString];
        int v10 = 138543362;
        long long v11 = v6;
        _os_log_impl(&dword_21FE04000, v5, OS_LOG_TYPE_DEFAULT, "Deferred DE is now executing (%{public}@)", (uint8_t *)&v10, 0xCu);
      }
      [*(id *)(a1 + 40) run];
    }
  }
  else
  {
    uint64_t v7 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      double v8 = [*(id *)(a1 + 40) activityString];
      int v10 = 138543362;
      long long v11 = v8;
      _os_log_impl(&dword_21FE04000, v7, OS_LOG_TYPE_DEFAULT, "Deferred DE is checking in (%{public}@)", (uint8_t *)&v10, 0xCu);
    }
    uint64_t v9 = [*(id *)(a1 + 40) criteria];
    xpc_activity_set_criteria(v3, v9);
  }
}

- (void)run
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  xpc_object_t v3 = +[DEDDaemon sharedInstance];
  uint64_t v4 = [v3 controller];
  double v5 = [(DEDDeferredExtensionInfo *)self bugSessionIdentifier];
  id v6 = [v4 sessionForIdentifier:v5];

  uint64_t v7 = [(id)objc_opt_class() log];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    double v8 = [v6 prettyDescription];
    int v11 = 138543362;
    uint64_t v12 = v8;
    _os_log_impl(&dword_21FE04000, v7, OS_LOG_TYPE_DEFAULT, "Starting deferred DE for bug session: %{public}@", (uint8_t *)&v11, 0xCu);
  }
  uint64_t v9 = [(DEDDeferredExtensionInfo *)self dedIdentifier];
  int v10 = [(DEDDeferredExtensionInfo *)self parameters];
  [v6 finallyStartDiagnosticWithIdentifier:v9 parameters:v10 completion:0];
}

- (void)unschedule
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  xpc_object_t v3 = [(id)objc_opt_class() log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    id v6 = "-[DEDDeferredExtensionInfo unschedule]";
    _os_log_impl(&dword_21FE04000, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v5, 0xCu);
  }

  [(DEDDeferredExtensionInfo *)self setScheduled:0];
  [(DEDDeferredExtensionInfo *)self removeFromStore];
  id v4 = [(DEDDeferredExtensionInfo *)self activityString];
  xpc_activity_unregister((const char *)[v4 UTF8String]);
}

- (BOOL)isOverdue
{
  uint64_t v2 = self;
  xpc_object_t v3 = [(DEDDeferredExtensionInfo *)self triggerDate];
  id v4 = [MEMORY[0x263EFF910] date];
  int v5 = [v3 earlierDate:v4];
  id v6 = [(DEDDeferredExtensionInfo *)v2 triggerDate];
  LOBYTE(v2) = v5 == v6;

  return (char)v2;
}

- (NSString)activityString
{
  activityString = self->_activityString;
  if (!activityString)
  {
    id v4 = objc_opt_class();
    int v5 = [(DEDDeferredExtensionInfo *)self bugSessionIdentifier];
    id v6 = [(DEDDeferredExtensionInfo *)self dedIdentifier];
    uint64_t v7 = [v4 activityStringForBugSessionIdentifier:v5 dedIdentifier:v6];
    double v8 = self->_activityString;
    self->_activityString = v7;

    activityString = self->_activityString;
  }
  return activityString;
}

+ (id)activityStringForBugSessionIdentifier:(id)a3 dedIdentifier:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v6 extensionIdentifier];
  double v8 = [v7 componentsSeparatedByString:@"."];
  uint64_t v9 = (void *)[v8 mutableCopy];

  int v10 = objc_msgSend(v9, "ded_mapWithBlock:", &__block_literal_global_60_0);
  int v11 = objc_msgSend(v10, "ded_rejectItemsPassingTest:", &__block_literal_global_63);

  if ((unint64_t)[v11 count] >= 3)
  {
    uint64_t v12 = objc_msgSend(v11, "subarrayWithRange:", objc_msgSend(v11, "count") - 2, 2);

    int v11 = (void *)v12;
  }
  if ([v11 count])
  {
    if ([v6 invocationNumber])
    {
      uint64_t v13 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v6, "invocationNumber"));
      long long v14 = [v13 stringValue];
      uint64_t v15 = [v11 arrayByAddingObject:v14];

      int v11 = (void *)v15;
    }
    uint64_t v16 = [v11 componentsJoinedByString:@"."];

    uint64_t v7 = (void *)v16;
  }
  objc_super v17 = [NSString stringWithFormat:@"com.apple.diagnosticextensionsd.%@.%@", v5, v7];

  return v17;
}

uint64_t __80__DEDDeferredExtensionInfo_activityStringForBugSessionIdentifier_dedIdentifier___block_invoke(uint64_t a1, void *a2)
{
  return [a2 lowercaseString];
}

uint64_t __80__DEDDeferredExtensionInfo_activityStringForBugSessionIdentifier_dedIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (([v2 isEqualToString:@"com"] & 1) != 0
    || ([v2 isEqualToString:@"apple"] & 1) != 0
    || ([v2 isEqualToString:@"diagnosticextension"] & 1) != 0)
  {
    uint64_t v3 = 1;
  }
  else
  {
    uint64_t v3 = [v2 isEqualToString:@"diagnosticextensions"];
  }

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    id v6 = [(DEDDeferredExtensionInfo *)self activityString];
    uint64_t v7 = [v5 activityString];

    char v8 = [v6 isEqualToString:v7];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (NSString)bugSessionIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (DEDExtensionIdentifier)dedIdentifier
{
  return (DEDExtensionIdentifier *)objc_getProperty(self, a2, 32, 1);
}

- (NSDate)triggerDate
{
  return self->_triggerDate;
}

- (BOOL)requiresClassBDataAccess
{
  return self->_requiresClassBDataAccess;
}

- (void)setRequiresClassBDataAccess:(BOOL)a3
{
  self->_requiresClassBDataAccess = a3;
}

- (double)gracePeriod
{
  return self->_gracePeriod;
}

- (NSDictionary)parameters
{
  return (NSDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (void)setParameters:(id)a3
{
}

- (BOOL)scheduled
{
  return self->_scheduled;
}

- (void)setScheduled:(BOOL)a3
{
  self->_scheduled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_triggerDate, 0);
  objc_storeStrong((id *)&self->_dedIdentifier, 0);
  objc_storeStrong((id *)&self->_bugSessionIdentifier, 0);
  objc_storeStrong((id *)&self->_activityString, 0);
}

+ (void)allInfo
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21FE04000, a2, OS_LOG_TYPE_ERROR, "Unarchiving failed for reason: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end