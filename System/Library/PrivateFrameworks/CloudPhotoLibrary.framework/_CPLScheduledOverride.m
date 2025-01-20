@interface _CPLScheduledOverride
+ (BOOL)isBudgetTypeSupportedForProgressiveOverriding:(unint64_t)a3 withReason:(unint64_t)a4;
+ (double)nextTimeIntervalForOverridingBudget:(unint64_t)a3 withReason:(unint64_t)a4;
+ (double)nextTimeIntervalToUseGivenCurrent:(double)a3 expiryDate:(id)a4;
+ (id)_expirationDateStorageKeyForBudget:(unint64_t)a3;
+ (id)budgetOverrideReasonStorageKeyForBudget:(unint64_t)a3;
+ (id)currentBudgetOverrideTimeIntervalExpiryDateStorageKeyForBudget:(unint64_t)a3;
+ (id)currentBudgetOverrideTimeIntervalStorageKeyForBudget:(unint64_t)a3;
+ (unint64_t)_systemBudgetForBudgetKey:(id)a3;
- (BOOL)scheduleEndFromPersistedOverride;
- (BOOL)scheduleEndOfOverride;
- (NSDate)endDate;
- (NSString)status;
- (OS_dispatch_queue)queue;
- (_CPLScheduledOverride)initWithBudget:(unint64_t)a3 withReason:(unint64_t)a4 queue:(id)a5;
- (_CPLScheduledOverrideDelegate)delegate;
- (unint64_t)budget;
- (unint64_t)reason;
- (void)_scheduleEndWithTimeInterval:(double)a3;
- (void)cancel;
- (void)resetHeuristics;
- (void)setDelegate:(id)a3;
@end

@implementation _CPLScheduledOverride

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_overrideReasonKey, 0);
  objc_storeStrong((id *)&self->_expirationDateStorageKey, 0);
  objc_storeStrong((id *)&self->_timer, 0);
}

- (void)setDelegate:(id)a3
{
}

- (_CPLScheduledOverrideDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (_CPLScheduledOverrideDelegate *)WeakRetained;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (unint64_t)reason
{
  return self->_reason;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (unint64_t)budget
{
  return self->_budget;
}

- (NSString)status
{
  if (!self->_endDate)
  {
    v8 = @"ending very soon";
    goto LABEL_10;
  }
  v3 = [MEMORY[0x1E4F1C9C8] date];
  [(NSDate *)self->_endDate timeIntervalSinceDate:v3];
  if (v4 <= 1.0)
  {
    if (v4 >= -1.0)
    {
      v8 = @"ending very soon";
      goto LABEL_9;
    }
    id v9 = [NSString alloc];
    v6 = +[CPLDateFormatter stringFromDateAgo:self->_endDate now:v3];
    uint64_t v7 = [v9 initWithFormat:@"should have ended %@", v6];
  }
  else
  {
    id v5 = [NSString alloc];
    v6 = +[CPLDateFormatter stringFromDateAgo:self->_endDate now:v3];
    uint64_t v7 = [v5 initWithFormat:@"ending %@", v6];
  }
  v8 = (__CFString *)v7;

LABEL_9:
LABEL_10:
  return (NSString *)v8;
}

- (void)cancel
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_expirationDateStorageKey)
  {
    v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    [v3 removeObjectForKey:self->_expirationDateStorageKey];

    double v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    [v4 removeObjectForKey:self->_overrideReasonKey];

    timer = self->_timer;
    if (timer)
    {
      dispatch_source_cancel(timer);
      v6 = self->_timer;
      self->_timer = 0;
    }
  }
}

- (void)resetHeuristics
{
  if (self->_expirationDateStorageKey)
  {
    v3 = [(id)objc_opt_class() currentBudgetOverrideTimeIntervalStorageKeyForBudget:self->_budget];
    CFPreferencesSetAppValue(v3, 0, @"com.apple.mobileslideshow");
    CFPreferencesAppSynchronize(@"com.apple.mobileslideshow");

    double v4 = [(id)objc_opt_class() currentBudgetOverrideTimeIntervalExpiryDateStorageKeyForBudget:self->_budget];
    CFPreferencesSetAppValue(v4, 0, @"com.apple.mobileslideshow");
    CFPreferencesAppSynchronize(@"com.apple.mobileslideshow");
  }
}

- (BOOL)scheduleEndOfOverride
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  expirationDateStorageKey = self->_expirationDateStorageKey;
  if (expirationDateStorageKey)
  {
    if (self->_endDate)
    {
      if (!_CPLSilentLogging)
      {
        v23 = __CPLGenericOSLogDomain();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          v24 = NSStringFromSelector(a2);
          v25 = +[CPLEngineSystemMonitor descriptionForBudget:self->_budget];
          *(_DWORD *)buf = 138412546;
          double v31 = *(double *)&v24;
          __int16 v32 = 2112;
          uint64_t v33 = (uint64_t)v25;
          _os_log_impl(&dword_1B4CAC000, v23, OS_LOG_TYPE_ERROR, "%@ called to many times for %@", buf, 0x16u);
        }
      }
      v26 = [MEMORY[0x1E4F28B00] currentHandler];
      v27 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLEngineSystemMonitor.m"];
      v28 = NSStringFromSelector(a2);
      v29 = +[CPLEngineSystemMonitor descriptionForBudget:self->_budget];
      [v26 handleFailureInMethod:a2, self, v27, 1270, @"%@ called to many times for %@", v28, v29 object file lineNumber description];

      abort();
    }
    [(id)objc_opt_class() nextTimeIntervalForOverridingBudget:self->_budget withReason:self->_reason];
    if (v5 <= 0.0) {
      double v6 = 3600.0;
    }
    else {
      double v6 = v5;
    }
    double v7 = 86400.0;
    if (v6 <= 86400.0)
    {
      double v7 = v6;
    }
    else if (!_CPLSilentLogging)
    {
      v8 = __CPLSystemMonitorOSLogDomain();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218240;
        double v31 = v6;
        __int16 v32 = 2048;
        uint64_t v33 = 0x40F5180000000000;
        _os_log_impl(&dword_1B4CAC000, v8, OS_LOG_TYPE_ERROR, "Override duration is too long (%.0fs) - will cap at %.0fs", buf, 0x16u);
      }
    }
    id v9 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:v7];
    endDate = self->_endDate;
    self->_endDate = v9;

    v11 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    [v11 setObject:self->_endDate forKey:self->_expirationDateStorageKey];

    v12 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    v13 = v12;
    unint64_t v14 = self->_reason - 1;
    if (v14 > 3) {
      v15 = @"forced by user";
    }
    else {
      v15 = off_1E60AACE8[v14];
    }
    [v12 setObject:v15 forKey:self->_overrideReasonKey];

    if ([(id)objc_opt_class() isBudgetTypeSupportedForProgressiveOverriding:self->_budget withReason:self->_reason])
    {
      v16 = [(id)objc_opt_class() currentBudgetOverrideTimeIntervalStorageKeyForBudget:self->_budget];
      CFPreferencesSetAppValue(v16, 0, @"com.apple.mobileslideshow");
      CFPreferencesAppSynchronize(@"com.apple.mobileslideshow");
      v17 = [NSNumber numberWithUnsignedInteger:(unint64_t)v7];
      CFPreferencesSetAppValue(v16, v17, @"com.apple.mobileslideshow");

      CFPreferencesAppSynchronize(@"com.apple.mobileslideshow");
      v18 = [MEMORY[0x1E4F1C9C8] date];
      v19 = [v18 dateByAddingTimeInterval:259200.0];

      v20 = [(id)objc_opt_class() currentBudgetOverrideTimeIntervalExpiryDateStorageKeyForBudget:self->_budget];
      id v21 = v19;
      CFPreferencesSetAppValue(v20, 0, @"com.apple.mobileslideshow");
      CFPreferencesAppSynchronize(@"com.apple.mobileslideshow");
      CFPreferencesSetAppValue(v20, v21, @"com.apple.mobileslideshow");

      CFPreferencesAppSynchronize(@"com.apple.mobileslideshow");
    }
    [(_CPLScheduledOverride *)self _scheduleEndWithTimeInterval:v7];
  }
  return expirationDateStorageKey != 0;
}

- (BOOL)scheduleEndFromPersistedOverride
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->_expirationDateStorageKey) {
    return 0;
  }
  if (self->_endDate)
  {
    if (!_CPLSilentLogging)
    {
      v27 = __CPLGenericOSLogDomain();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v28 = (NSString *)objc_claimAutoreleasedReturnValue();
        v29 = +[CPLEngineSystemMonitor descriptionForBudget:self->_budget];
        *(_DWORD *)buf = 138412546;
        v35 = v28;
        __int16 v36 = 2112;
        uint64_t v37 = (uint64_t)v29;
        _os_log_impl(&dword_1B4CAC000, v27, OS_LOG_TYPE_ERROR, "%@ called to many times for %@", buf, 0x16u);
      }
    }
    v30 = [MEMORY[0x1E4F28B00] currentHandler];
    double v31 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLEngineSystemMonitor.m"];
    __int16 v32 = NSStringFromSelector(a2);
    uint64_t v33 = +[CPLEngineSystemMonitor descriptionForBudget:self->_budget];
    [v30 handleFailureInMethod:a2, self, v31, 1221, @"%@ called to many times for %@", v32, v33 object file lineNumber description];

    abort();
  }
  double v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  double v5 = [v4 objectForKey:self->_expirationDateStorageKey];
  endDate = self->_endDate;
  self->_endDate = v5;

  double v7 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  v8 = [v7 objectForKey:self->_overrideReasonKey];

  if (self->_endDate && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    if (!_CPLSilentLogging)
    {
      v12 = __CPLSystemMonitorOSLogDomain();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        expirationDateStorageKey = self->_expirationDateStorageKey;
        unint64_t v14 = self->_endDate;
        *(_DWORD *)buf = 138543874;
        v35 = expirationDateStorageKey;
        __int16 v36 = 2112;
        uint64_t v37 = (uint64_t)v14;
        __int16 v38 = 2114;
        id v39 = (id)objc_opt_class();
        id v15 = v39;
        _os_log_impl(&dword_1B4CAC000, v12, OS_LOG_TYPE_ERROR, "Incorrect value for %{public}@: %@ (%{public}@)", buf, 0x20u);
      }
    }
    v16 = self->_endDate;
    self->_endDate = 0;
  }
  else if (v8)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (self->_endDate)
      {
        unint64_t v9 = self->_reason - 1;
        v10 = v9 > 3 ? @"forced by user" : off_1E60AACE8[v9];
        if ([(__CFString *)v10 isEqualToString:v8])
        {
          [(NSDate *)self->_endDate timeIntervalSinceNow];
          if (v20 <= 0.0)
          {
            v24 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
            [v24 removeObjectForKey:self->_expirationDateStorageKey];

            v25 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
            [v25 removeObjectForKey:self->_overrideReasonKey];
          }
          else
          {
            double v21 = v20;
            double v22 = 86400.0;
            if (v20 <= 86400.0)
            {
              double v22 = v20;
            }
            else if (!_CPLSilentLogging)
            {
              v23 = __CPLSystemMonitorOSLogDomain();
              if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 134218240;
                v35 = *(NSString **)&v21;
                __int16 v36 = 2048;
                uint64_t v37 = 0x40F5180000000000;
                _os_log_impl(&dword_1B4CAC000, v23, OS_LOG_TYPE_ERROR, "Override duration is too long (%.0fs) - will cap at %.0fs", buf, 0x16u);
              }
            }
            [(_CPLScheduledOverride *)self _scheduleEndWithTimeInterval:v22];
          }
        }
      }
    }
    else
    {
      if (!_CPLSilentLogging)
      {
        v17 = __CPLSystemMonitorOSLogDomain();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          overrideReasonKey = self->_overrideReasonKey;
          *(_DWORD *)buf = 138543874;
          v35 = overrideReasonKey;
          __int16 v36 = 2112;
          uint64_t v37 = (uint64_t)v8;
          __int16 v38 = 2114;
          id v39 = (id)objc_opt_class();
          id v19 = v39;
          _os_log_impl(&dword_1B4CAC000, v17, OS_LOG_TYPE_ERROR, "Incorrect value for %{public}@: %@ (%{public}@)", buf, 0x20u);
        }
      }

      v8 = 0;
    }
  }
  BOOL v11 = self->_timer != 0;

  return v11;
}

- (void)_scheduleEndWithTimeInterval:(double)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (self->_timer)
  {
    if (!_CPLSilentLogging)
    {
      v12 = __CPLGenericOSLogDomain();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v13 = +[CPLEngineSystemMonitor descriptionForBudget:self->_budget];
        *(_DWORD *)buf = 138412290;
        double v21 = v13;
        _os_log_impl(&dword_1B4CAC000, v12, OS_LOG_TYPE_ERROR, "Timer for end of system budget override %@ called too many times", buf, 0xCu);
      }
    }
    unint64_t v14 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
    id v15 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLEngineSystemMonitor.m"];
    v16 = +[CPLEngineSystemMonitor descriptionForBudget:self->_budget];
    [v14 handleFailureInMethod:a2, self, v15, 1196, @"Timer for end of system budget override %@ called too many times", v16 object file lineNumber description];

    abort();
  }
  dispatch_source_t v5 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)self->_queue);
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __54___CPLScheduledOverride__scheduleEndWithTimeInterval___block_invoke;
  handler[3] = &unk_1E60A6728;
  double v6 = v5;
  v18 = v6;
  id v19 = self;
  dispatch_source_set_event_handler(v6, handler);
  uint64_t v7 = (uint64_t)a3;
  if ((uint64_t)a3 <= 1) {
    uint64_t v7 = 1;
  }
  dispatch_time_t v8 = dispatch_time(0xFFFFFFFFFFFFFFFELL, 1000000000 * v7);
  dispatch_source_set_timer(v6, v8, 0xFFFFFFFFFFFFFFFFLL, 0x989680uLL);
  dispatch_activate(v6);
  timer = self->_timer;
  self->_timer = (OS_dispatch_source *)v6;
  v10 = v6;
}

- (_CPLScheduledOverride)initWithBudget:(unint64_t)a3 withReason:(unint64_t)a4 queue:(id)a5
{
  id v9 = a5;
  v17.receiver = self;
  v17.super_class = (Class)_CPLScheduledOverride;
  v10 = [(_CPLScheduledOverride *)&v17 init];
  BOOL v11 = v10;
  if (v10)
  {
    v10->_budget = a3;
    objc_storeStrong((id *)&v10->_queue, a5);
    v11->_reason = a4;
    uint64_t v12 = +[_CPLScheduledOverride _expirationDateStorageKeyForBudget:a3];
    expirationDateStorageKey = v11->_expirationDateStorageKey;
    v11->_expirationDateStorageKey = (NSString *)v12;

    uint64_t v14 = +[_CPLScheduledOverride budgetOverrideReasonStorageKeyForBudget:a3];
    overrideReasonKey = v11->_overrideReasonKey;
    v11->_overrideReasonKey = (NSString *)v14;
  }
  return v11;
}

+ (double)nextTimeIntervalForOverridingBudget:(unint64_t)a3 withReason:(unint64_t)a4
{
  if ([(id)objc_opt_class() isBudgetTypeSupportedForProgressiveOverriding:a3 withReason:a4])
  {
    dispatch_source_t v5 = [(id)objc_opt_class() currentBudgetOverrideTimeIntervalStorageKeyForBudget:a3];
    double OverrideTimeIntervalFromSharedDefaults = _CPLSystemMonitorReadOverrideTimeIntervalFromSharedDefaults(v5);

    uint64_t v7 = [(id)objc_opt_class() currentBudgetOverrideTimeIntervalExpiryDateStorageKeyForBudget:a3];
    dispatch_time_t v8 = _CPLSystemMonitorReadOverrideTimeIntervalExpiryDateFromSharedDefaults(v7);

    [(id)objc_opt_class() nextTimeIntervalToUseGivenCurrent:v8 expiryDate:OverrideTimeIntervalFromSharedDefaults];
    double v10 = v9;

    return v10;
  }
  else
  {
    uint64_t v12 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    v13 = [v12 objectForKey:@"CPLOverrideBudgetExpirationSeconds"];
    [v13 doubleValue];
    double v15 = v14;

    double result = 3600.0;
    if (v15 > 0.0) {
      return v15;
    }
  }
  return result;
}

+ (id)_expirationDateStorageKeyForBudget:(unint64_t)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if ((uint64_t)a3 > 15)
  {
    if ((uint64_t)a3 > 2047)
    {
      if (a3 == 2048) {
        return @"CPLOverrideThermalModerateExpirationDate";
      }
      if (a3 == 0x4000) {
        return @"CPLOverrideAllOtherExpirationDate";
      }
    }
    else
    {
      if (a3 == 16) {
        return @"CPLOverrideLowDataModeBudgetExpirationDate";
      }
      if (a3 == 32) {
        return @"CPLOverrideLowPowerModeBudgetExpirationDate";
      }
    }
LABEL_15:
    if (!_CPLSilentLogging)
    {
      dispatch_source_t v5 = __CPLSystemMonitorOSLogDomain();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        double v6 = +[CPLEngineSystemMonitor descriptionForBudget:a3];
        int v7 = 138543362;
        dispatch_time_t v8 = v6;
        _os_log_impl(&dword_1B4CAC000, v5, OS_LOG_TYPE_ERROR, "Unknown system budget %{public}@", (uint8_t *)&v7, 0xCu);
      }
    }
    return 0;
  }
  else
  {
    id result = @"CPLOverrideDataBudgetExpirationDate";
    switch(a3)
    {
      case 1uLL:
        return result;
      case 2uLL:
        id result = @"CPLOverrideEnergyBudgetExpirationDate";
        break;
      case 4uLL:
        id result = @"CPLOverrideSignificantWorkBudgetExpirationDate";
        break;
      case 8uLL:
        id result = @"CPLOverrideForegroundBudgetExpirationDate";
        break;
      default:
        goto LABEL_15;
    }
  }
  return result;
}

+ (id)budgetOverrideReasonStorageKeyForBudget:(unint64_t)a3
{
  v3 = +[_CPLScheduledOverride _expirationDateStorageKeyForBudget:a3];
  if (v3)
  {
    double v4 = [NSString stringWithFormat:@"%@-overrideReason", v3];
  }
  else
  {
    double v4 = 0;
  }

  return v4;
}

+ (id)currentBudgetOverrideTimeIntervalExpiryDateStorageKeyForBudget:(unint64_t)a3
{
  v3 = +[_CPLScheduledOverride _expirationDateStorageKeyForBudget:a3];
  if (v3)
  {
    double v4 = [NSString stringWithFormat:@"%@-currentBudgetOverrideTimeIntervalExpiryDate", v3];
  }
  else
  {
    double v4 = 0;
  }

  return v4;
}

+ (id)currentBudgetOverrideTimeIntervalStorageKeyForBudget:(unint64_t)a3
{
  v3 = +[_CPLScheduledOverride _expirationDateStorageKeyForBudget:a3];
  if (v3)
  {
    double v4 = [NSString stringWithFormat:@"%@-currentBudgetOverrideTimeInterval", v3];
  }
  else
  {
    double v4 = 0;
  }

  return v4;
}

+ (BOOL)isBudgetTypeSupportedForProgressiveOverriding:(unint64_t)a3 withReason:(unint64_t)a4
{
  if (a4) {
    return 0;
  }
  BOOL result = 1;
  if ((uint64_t)a3 > 2047)
  {
    if (a3 != 0x4000) {
      return 0;
    }
  }
  else if (a3 > 0x20 || ((1 << a3) & 0x100010006) == 0)
  {
    return 0;
  }
  return result;
}

+ (unint64_t)_systemBudgetForBudgetKey:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"CPLOverrideDataBudgetExpirationDate"])
  {
    unint64_t v4 = 1;
  }
  else if ([v3 isEqualToString:@"CPLOverrideEnergyBudgetExpirationDate"])
  {
    unint64_t v4 = 2;
  }
  else if ([v3 isEqualToString:@"CPLOverrideSignificantWorkBudgetExpirationDate"])
  {
    unint64_t v4 = 4;
  }
  else if ([v3 isEqualToString:@"CPLOverrideForegroundBudgetExpirationDate"])
  {
    unint64_t v4 = 8;
  }
  else if ([v3 isEqualToString:@"CPLOverrideLowDataModeBudgetExpirationDate"])
  {
    unint64_t v4 = 16;
  }
  else if ([v3 isEqualToString:@"CPLOverrideLowPowerModeBudgetExpirationDate"])
  {
    unint64_t v4 = 32;
  }
  else if ([v3 isEqualToString:@"CPLOverrideThermalModerateExpirationDate"])
  {
    unint64_t v4 = 2048;
  }
  else if ([v3 isEqualToString:@"CPLOverrideAllOtherExpirationDate"])
  {
    unint64_t v4 = 0x4000;
  }
  else
  {
    unint64_t v4 = 0;
  }

  return v4;
}

+ (double)nextTimeIntervalToUseGivenCurrent:(double)a3 expiryDate:(id)a4
{
  id v5 = a4;
  if (nextTimeIntervalToUseGivenCurrent_expiryDate__onceToken != -1) {
    dispatch_once(&nextTimeIntervalToUseGivenCurrent_expiryDate__onceToken, &__block_literal_global_368_20965);
  }
  uint64_t v6 = [NSNumber numberWithDouble:a3];
  int v7 = (void *)v6;
  double v8 = 3600.0;
  if (v5)
  {
    if (v6)
    {
      uint64_t v9 = [MEMORY[0x1E4F1C9C8] date];
      uint64_t v10 = [v9 compare:v5];

      if (v10 != 1)
      {
        uint64_t v11 = [(id)nextTimeIntervalToUseGivenCurrent_expiryDate__budgetOverrideTimeIntervalHeuristics indexOfObject:v7];
        if (v11 != 0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v12 = v11;
          unint64_t v13 = v11 + 1;
          uint64_t v14 = [(id)nextTimeIntervalToUseGivenCurrent_expiryDate__budgetOverrideTimeIntervalHeuristics count];
          if (v13 < v14 - 1) {
            uint64_t v15 = v12 + 1;
          }
          else {
            uint64_t v15 = v14 - 1;
          }
          v16 = [(id)nextTimeIntervalToUseGivenCurrent_expiryDate__budgetOverrideTimeIntervalHeuristics objectAtIndexedSubscript:v15];
          [v16 doubleValue];
          double v8 = v17;
        }
      }
    }
  }

  return v8;
}

@end