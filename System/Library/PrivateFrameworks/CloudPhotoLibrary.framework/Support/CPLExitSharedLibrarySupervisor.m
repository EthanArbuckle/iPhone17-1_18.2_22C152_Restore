@interface CPLExitSharedLibrarySupervisor
+ (id)descriptionForExitState:(int64_t)a3;
- (BOOL)shouldRunForceProcessingStagedScopesTaskNow;
- (BOOL)shouldRunForceProcessingStagedScopesTaskNowMovingToForeground;
- (BOOL)shouldScheduleForceProcessingStagedScopesTask;
- (CPLExitSharedLibrarySupervisor)initWithScopeIdentifier:(id)a3 exitState:(int64_t)a4 supervisorInfo:(id)a5;
- (NSDate)exitStartDate;
- (NSDate)lastForcedExitDate;
- (NSDate)nextForcedExitDate;
- (NSDictionary)supervisorInfo;
- (NSString)scopeIdentifier;
- (NSString)status;
- (int64_t)exitState;
- (void)noteServerHasChanges;
- (void)ping;
- (void)setExitState:(int64_t)a3;
- (void)updateLastForcedExitDate;
@end

@implementation CPLExitSharedLibrarySupervisor

- (CPLExitSharedLibrarySupervisor)initWithScopeIdentifier:(id)a3 exitState:(int64_t)a4 supervisorInfo:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v42.receiver = self;
  v42.super_class = (Class)CPLExitSharedLibrarySupervisor;
  v10 = [(CPLExitSharedLibrarySupervisor *)&v42 init];
  if (v10)
  {
    v11 = (NSString *)[v8 copy];
    scopeIdentifier = v10->_scopeIdentifier;
    v10->_scopeIdentifier = v11;

    if (v9)
    {
      id v13 = [v9 objectForKeyedSubscript:@"exitStartDate"];
      if (v13
        && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
        && ([v13 timeIntervalSinceNow], v14 <= 0.0))
      {
        v15 = (NSDate *)v13;
      }
      else
      {
        v15 = 0;
      }

      exitStartDate = v10->_exitStartDate;
      v10->_exitStartDate = v15;

      id v17 = [v9 objectForKeyedSubscript:@"lastForcedExitDate"];
      if (v17
        && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
        && ([v17 timeIntervalSinceNow], v18 <= 0.0))
      {
        v19 = (NSDate *)v17;
      }
      else
      {
        v19 = 0;
      }

      lastForcedExitDate = v10->_lastForcedExitDate;
      v10->_lastForcedExitDate = v19;

      v21 = [v9 objectForKeyedSubscript:@"nextForcedExitDate"];
      if (v10->_lastForcedExitDate) {
        double v22 = 86400.0;
      }
      else {
        double v22 = 60.0;
      }
      id v23 = v21;
      if (v23
        && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
        && ([v23 timeIntervalSinceNow], v24 <= v22))
      {
        v25 = (NSDate *)v23;
      }
      else
      {
        v25 = 0;
      }

      nextForcedExitDate = v10->_nextForcedExitDate;
      v10->_nextForcedExitDate = v25;
    }
    v27 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    supervisorInfo = v10->_supervisorInfo;
    v10->_supervisorInfo = v27;

    v29 = v10->_exitStartDate;
    if (!v29)
    {
      uint64_t v30 = +[NSDate date];
      v31 = v10->_exitStartDate;
      v10->_exitStartDate = (NSDate *)v30;

      [(NSMutableDictionary *)v10->_supervisorInfo setObject:v10->_exitStartDate forKeyedSubscript:@"exitStartDate"];
      v29 = v10->_exitStartDate;
    }
    [(NSMutableDictionary *)v10->_supervisorInfo setObject:v29 forKeyedSubscript:@"exitStartDate"];
    v32 = v10->_lastForcedExitDate;
    if (v32) {
      [(NSMutableDictionary *)v10->_supervisorInfo setObject:v32 forKeyedSubscript:@"lastForcedExitDate"];
    }
    if (v10->_nextForcedExitDate) {
      goto LABEL_34;
    }
    v33 = v10->_lastForcedExitDate;
    if (v33)
    {
      v34 = v33;
      double v35 = (double)arc4random_uniform(0x15180u);
      double v36 = 86400.0;
    }
    else
    {
      int64_t exitState = v10->_exitState;
      v34 = v10->_exitStartDate;
      if (exitState == 4)
      {
        double v38 = 10.0;
LABEL_33:
        uint64_t v39 = [(NSDate *)v34 dateByAddingTimeInterval:v38];

        v40 = v10->_nextForcedExitDate;
        v10->_nextForcedExitDate = (NSDate *)v39;

LABEL_34:
        v10->_int64_t exitState = a4;
        [(NSMutableDictionary *)v10->_supervisorInfo setObject:v10->_nextForcedExitDate forKeyedSubscript:@"nextForcedExitDate"];
        goto LABEL_35;
      }
      double v35 = (double)arc4random_uniform(0x3Cu);
      double v36 = 60.0;
    }
    double v38 = v35 + v36;
    goto LABEL_33;
  }
LABEL_35:

  return v10;
}

- (void)setExitState:(int64_t)a3
{
  if (self->_exitState == 4 && !self->_lastForcedExitDate)
  {
    nextForcedExitDate = self->_nextForcedExitDate;
    v6 = self->_exitStartDate;
    v7 = nextForcedExitDate;
    id v8 = [(NSDate *)v6 dateByAddingTimeInterval:10.0];
    id v9 = v8;
    if (!v7 || (id v10 = [(NSDate *)v8 compare:v7], v11 = v7, v10 != (id)1)) {
      v11 = v9;
    }
    v12 = v11;

    id v13 = self->_nextForcedExitDate;
    self->_nextForcedExitDate = v12;

    [(NSMutableDictionary *)self->_supervisorInfo setObject:self->_nextForcedExitDate forKeyedSubscript:@"nextForcedExitDate"];
  }
  self->_int64_t exitState = a3;
}

- (NSDictionary)supervisorInfo
{
  id v2 = [(NSMutableDictionary *)self->_supervisorInfo copy];
  return (NSDictionary *)v2;
}

- (BOOL)shouldScheduleForceProcessingStagedScopesTask
{
  int64_t exitState = self->_exitState;
  if ((unint64_t)(exitState - 1) < 3) {
    return 1;
  }
  if (exitState != 4) {
    return 0;
  }
  [(NSDate *)self->_exitStartDate timeIntervalSinceNow];
  return v4 >= -604800.0;
}

- (BOOL)shouldRunForceProcessingStagedScopesTaskNow
{
  BOOL v3 = [(CPLExitSharedLibrarySupervisor *)self shouldScheduleForceProcessingStagedScopesTask];
  if (v3)
  {
    [(NSDate *)self->_nextForcedExitDate timeIntervalSinceNow];
    LOBYTE(v3) = v4 < 10.0;
  }
  return v3;
}

- (BOOL)shouldRunForceProcessingStagedScopesTaskNowMovingToForeground
{
  BOOL v3 = [(CPLExitSharedLibrarySupervisor *)self shouldScheduleForceProcessingStagedScopesTask];
  if (v3)
  {
    lastForcedExitDate = self->_lastForcedExitDate;
    LOBYTE(v3) = !lastForcedExitDate
              || ([(NSDate *)lastForcedExitDate timeIntervalSinceNow], v5 < -3600.0);
  }
  return v3;
}

- (void)updateLastForcedExitDate
{
  BOOL v3 = +[NSDate date];
  lastForcedExitDate = self->_lastForcedExitDate;
  self->_lastForcedExitDate = v3;

  [(NSMutableDictionary *)self->_supervisorInfo setObject:self->_lastForcedExitDate forKeyedSubscript:@"lastForcedExitDate"];
  double v5 = self->_lastForcedExitDate;
  v6 = [(NSDate *)v5 dateByAddingTimeInterval:(double)arc4random_uniform(0x15180u) + 86400.0];

  nextForcedExitDate = self->_nextForcedExitDate;
  self->_nextForcedExitDate = v6;

  id v8 = self->_nextForcedExitDate;
  supervisorInfo = self->_supervisorInfo;
  [(NSMutableDictionary *)supervisorInfo setObject:v8 forKeyedSubscript:@"nextForcedExitDate"];
}

- (void)noteServerHasChanges
{
  lastForcedExitDate = self->_lastForcedExitDate;
  if (lastForcedExitDate)
  {
    nextForcedExitDate = self->_nextForcedExitDate;
    double v5 = lastForcedExitDate;
    v6 = nextForcedExitDate;
    v7 = [(NSDate *)v5 dateByAddingTimeInterval:10.0];
    id v8 = v7;
    if (!v6 || (id v9 = [(NSDate *)v7 compare:v6], v10 = v6, v9 != (id)1)) {
      id v10 = v8;
    }
    v11 = v10;

    v12 = self->_nextForcedExitDate;
    self->_nextForcedExitDate = v11;
  }
  else
  {
    id v13 = self->_exitStartDate;
    double v14 = [(NSDate *)v13 dateByAddingTimeInterval:10.0];

    v12 = self->_nextForcedExitDate;
    self->_nextForcedExitDate = v14;
  }

  v15 = self->_nextForcedExitDate;
  supervisorInfo = self->_supervisorInfo;
  [(NSMutableDictionary *)supervisorInfo setObject:v15 forKeyedSubscript:@"nextForcedExitDate"];
}

- (void)ping
{
  BOOL v3 = +[NSDate date];
  double v4 = self->_nextForcedExitDate;
  double v5 = [v3 dateByAddingTimeInterval:10.0];
  v6 = v5;
  if (!v4 || (v7 = [(NSDate *)v5 compare:v4], id v8 = v4, v7 != (id)1)) {
    id v8 = v6;
  }
  id v9 = v8;

  nextForcedExitDate = self->_nextForcedExitDate;
  self->_nextForcedExitDate = v9;

  v11 = self->_nextForcedExitDate;
  supervisorInfo = self->_supervisorInfo;
  [(NSMutableDictionary *)supervisorInfo setObject:v11 forKeyedSubscript:@"nextForcedExitDate"];
}

+ (id)descriptionForExitState:(int64_t)a3
{
  if ((unint64_t)a3 > 4) {
    return @"unknown";
  }
  else {
    return off_100277558[a3];
  }
}

- (NSString)status
{
  BOOL v3 = +[NSDate date];
  unsigned int v4 = [(CPLExitSharedLibrarySupervisor *)self shouldScheduleForceProcessingStagedScopesTask];
  id v5 = objc_alloc((Class)NSString);
  v6 = +[CPLExitSharedLibrarySupervisor descriptionForExitState:self->_exitState];
  uint64_t v7 = +[CPLDateFormatter stringFromDateAgo:self->_exitStartDate now:v3];
  id v8 = (void *)v7;
  if (v4)
  {
    id v9 = +[CPLDateFormatter stringFromDateAgo:self->_nextForcedExitDate now:v3];
    id v10 = [v5 initWithFormat:@"%@ - start: %@ - next retry: %@", v6, v8, v9];
  }
  else
  {
    id v10 = [v5 initWithFormat:@"%@ - start: %@ - no retry", v6, v7];
  }

  return (NSString *)v10;
}

- (NSString)scopeIdentifier
{
  return self->_scopeIdentifier;
}

- (int64_t)exitState
{
  return self->_exitState;
}

- (NSDate)exitStartDate
{
  return self->_exitStartDate;
}

- (NSDate)lastForcedExitDate
{
  return self->_lastForcedExitDate;
}

- (NSDate)nextForcedExitDate
{
  return self->_nextForcedExitDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nextForcedExitDate, 0);
  objc_storeStrong((id *)&self->_lastForcedExitDate, 0);
  objc_storeStrong((id *)&self->_exitStartDate, 0);
  objc_storeStrong((id *)&self->_scopeIdentifier, 0);
  objc_storeStrong((id *)&self->_supervisorInfo, 0);
}

@end