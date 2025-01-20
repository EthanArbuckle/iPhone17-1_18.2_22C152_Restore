@interface _DASConfigurationLimiter
+ (id)intervalLimiterResponseForActivity:(id)a3;
+ (id)sharedLimiter;
- (BOOL)deleteLimitForActivity:(id)a3;
- (BOOL)limitedActivity:(id)a3 withLimitsResponses:(id)a4;
- (BOOL)limitsApplyToActivity:(id)a3;
- (BOOL)setLimitForActivity:(id)a3;
- (NSMutableArray)testingOverride;
- (NSString)limitationName;
- (OS_os_log)log;
- (_DASConfigurationLimiter)init;
- (id)responseWithActivityConfigurations:(id)a3;
- (id)shouldLimitActivityAtSubmission:(id)a3;
- (void)setLimitationName:(id)a3;
- (void)setLog:(id)a3;
- (void)setTestingOverride:(id)a3;
@end

@implementation _DASConfigurationLimiter

- (id)shouldLimitActivityAtSubmission:(id)a3
{
  id v4 = a3;
  if ([(_DASConfigurationLimiter *)self limitsApplyToActivity:v4])
  {
    v5 = [MEMORY[0x1E4F1CA48] array];
    v6 = +[_DASConfigurationLimiter intervalLimiterResponseForActivity:v4];
    v7 = v6;
    if (v6 && [v6 decision]) {
      [v5 addObject:v7];
    }
    v8 = [(_DASConfigurationLimiter *)self responseWithActivityConfigurations:v4];

    if (v8 && [v8 decision]) {
      [v5 addObject:v8];
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)responseWithActivityConfigurations:(id)a3
{
  id v3 = a3;
  if ([v3 requiresRemoteDeviceWake])
  {
    uint64_t v4 = [v3 remoteDevice];
    if (!v4 || (v5 = (void *)v4, uint64_t v6 = [v3 targetDevice], v5, !v6))
    {
      v12 = @"Requires Remote Device Wake && (!RemoteDevice || Target Device Local)";
LABEL_9:
      uint64_t v13 = 4;
LABEL_32:
      v21 = +[_DASLimiterResponse limitResponseWithDecision:v13 withLimiter:@"Configuration" validityDuration:v12 rationale:0.0];
      goto LABEL_33;
    }
  }
  uint64_t v7 = [v3 remoteDevice];
  if (v7)
  {
    v8 = (void *)v7;
    uint64_t v9 = [v3 targetDevice];

    if (!v9)
    {
      v12 = @"Remote Device && Target Device Local";
      goto LABEL_31;
    }
  }
  v10 = [v3 fileProtection];
  v11 = +[_DASFileProtection complete];
  if (v10 == v11)
  {
    int v14 = [v3 requiresPlugin];

    if (v14)
    {
      v12 = @"Class A && Plugged In";
LABEL_31:
      uint64_t v13 = 1;
      goto LABEL_32;
    }
  }
  else
  {
  }
  if ([v3 shouldWakeDevice])
  {
    unint64_t v15 = [v3 schedulingPriority];
    if (v15 < _DASSchedulingPriorityDefault)
    {
      v12 = @"Should Wake && Priority < Default";
      goto LABEL_31;
    }
  }
  v16 = [v3 fileProtection];
  v17 = +[_DASFileProtection complete];
  if (v16 != v17)
  {

    goto LABEL_20;
  }
  int v18 = [v3 requiresDeviceInactivity];

  if (v18)
  {
    v12 = @"Class A && Requires Inactivity";
    goto LABEL_9;
  }
LABEL_20:
  v19 = [v3 submittedFileProtection];
  v20 = +[_DASFileProtection none];
  if (v19 != v20)
  {

    goto LABEL_22;
  }
  v22 = [v3 producedResultIdentifiers];
  if ([v22 count])
  {

LABEL_30:
    v12 = @"Dependencies && Insufficient File Protection";
    goto LABEL_31;
  }
  v23 = [v3 dependencies];
  uint64_t v24 = [v23 count];

  if (v24) {
    goto LABEL_30;
  }
LABEL_22:
  v21 = [v3 fastPass];

  if (!v21) {
    goto LABEL_33;
  }
  if ([v3 requiresSignificantUserInactivity])
  {
    v12 = @"Fast Pass && Requires Significant Inactivity";
    goto LABEL_9;
  }
  if ([v3 requiresPlugin])
  {
    v12 = @"Fast Pass && Requires Plugin";
    goto LABEL_9;
  }
  unint64_t v26 = [v3 schedulingPriority];
  if (v26 < _DASSchedulingPriorityUtility)
  {
    v12 = @"Fast Pass && Priority < Utility";
    goto LABEL_9;
  }
  v21 = 0;
LABEL_33:

  return v21;
}

- (BOOL)limitsApplyToActivity:(id)a3
{
  id v3 = a3;
  unint64_t v4 = [v3 schedulingPriority];
  if (v4 <= _DASSchedulingPriorityDefault)
  {
    v5 = [v3 name];

    if (v5)
    {
      v5 = +[_DASPlistParser sharedInstance];
      char v6 = [v5 containsOverrideForActivity:v3 withLimitation:@"Configuration"];

      LOBYTE(v5) = v6 ^ 1;
    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return (char)v5;
}

+ (id)intervalLimiterResponseForActivity:(id)a3
{
  id v3 = a3;
  [v3 interval];
  if (v4 <= 0.0) {
    goto LABEL_20;
  }
  double v5 = v4;
  if (v4 >= 300.0)
  {
    int v8 = [v3 shouldWakeDevice];
    if (v5 < 3600.0 && v8 != 0)
    {
      char v6 = @"Waking with Interval < 1 hour";
LABEL_21:
      uint64_t v7 = 1;
      goto LABEL_22;
    }
    int v10 = [v3 preventDeviceSleep];
    if (v5 < 3600.0 && v10 != 0)
    {
      char v6 = @"Prevent Device Sleep with interval < 1 hour";
      goto LABEL_21;
    }
    int v12 = [v3 isIntensive];
    if (v5 < 86400.0 && v12 != 0)
    {
      char v6 = @"Intensive with interval < 1 day";
      goto LABEL_4;
    }
LABEL_20:
    int v14 = 0;
    goto LABEL_23;
  }
  char v6 = @"Repeating Interval < 5 mins";
LABEL_4:
  uint64_t v7 = 4;
LABEL_22:
  int v14 = +[_DASLimiterResponse limitResponseWithDecision:v7 withLimiter:@"Configuration" validityDuration:v6 rationale:0.0];
LABEL_23:

  return v14;
}

- (_DASConfigurationLimiter)init
{
  v8.receiver = self;
  v8.super_class = (Class)_DASConfigurationLimiter;
  v2 = [(_DASConfigurationLimiter *)&v8 init];
  id v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_limitationName, @"Configuration");
    os_log_t v4 = os_log_create((const char *)[@"com.apple.duetactivityscheduler" UTF8String], (const char *)objc_msgSend(@"configurationLimiter", "UTF8String"));
    log = v3->_log;
    v3->_log = (OS_os_log *)v4;

    testingOverride = v3->_testingOverride;
    v3->_testingOverride = 0;
  }
  return v3;
}

+ (id)sharedLimiter
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41___DASConfigurationLimiter_sharedLimiter__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedLimiter_onceToken_0 != -1) {
    dispatch_once(&sharedLimiter_onceToken_0, block);
  }
  v2 = (void *)sharedLimiter_limitation_0;

  return v2;
}

- (BOOL)deleteLimitForActivity:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [(NSMutableArray *)self->_testingOverride containsObject:v4];
  if (v5)
  {
    [(NSMutableArray *)self->_testingOverride removeObject:v4];
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      id v10 = v4;
      uint64_t v7 = "Removing override for %@";
LABEL_6:
      _os_log_impl(&dword_1B578B000, log, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v9, 0xCu);
    }
  }
  else
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      id v10 = v4;
      uint64_t v7 = "Failed to remove override for %@";
      goto LABEL_6;
    }
  }

  return v5;
}

- (BOOL)setLimitForActivity:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  testingOverride = self->_testingOverride;
  if (!testingOverride)
  {
    char v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_testingOverride;
    self->_testingOverride = v6;

    testingOverride = self->_testingOverride;
  }
  [(NSMutableArray *)testingOverride addObject:v4];
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v4;
    _os_log_impl(&dword_1B578B000, log, OS_LOG_TYPE_DEFAULT, "Adding %@ to override list", (uint8_t *)&v10, 0xCu);
  }

  return 1;
}

- (BOOL)limitedActivity:(id)a3 withLimitsResponses:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([(_DASConfigurationLimiter *)self limitsApplyToActivity:v6]
    && ((v8 = +[_DASLimiterResponse queryActivityDecision:fromResponses:](_DASLimiterResponse, "queryActivityDecision:fromResponses:", 4, v7), BOOL v9 = +[_DASLimiterResponse queryActivityDecision:1 fromResponses:v7], v8)|| v9))
  {
    id v11 = [v6 identifier];
    if (v11 && [(NSMutableArray *)self->_testingOverride containsObject:v11])
    {
      log = self->_log;
      BOOL v10 = 0;
      if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
      {
        int v14 = 138412546;
        id v15 = v6;
        __int16 v16 = 2112;
        id v17 = v7;
        _os_log_impl(&dword_1B578B000, log, OS_LOG_TYPE_DEFAULT, "%@ overrode configuration limit %@", (uint8_t *)&v14, 0x16u);
        BOOL v10 = 0;
      }
    }
    else
    {
      +[_DASLimiterResponse updateActivity:v6 withLimitResponse:v7];
      BOOL v10 = 1;
    }
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (NSString)limitationName
{
  return self->_limitationName;
}

- (void)setLimitationName:(id)a3
{
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
}

- (NSMutableArray)testingOverride
{
  return self->_testingOverride;
}

- (void)setTestingOverride:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_testingOverride, 0);
  objc_storeStrong((id *)&self->_log, 0);

  objc_storeStrong((id *)&self->_limitationName, 0);
}

@end