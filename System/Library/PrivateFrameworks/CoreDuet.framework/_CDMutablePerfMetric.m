@interface _CDMutablePerfMetric
+ (id)perfMetricForFetchRequest:(void *)a3 type:;
- (_CDMutablePerfMetric)initWithName:(id)a3 string:(id)a4 family:(id)a5;
- (id)description;
- (void)endTimingWithEvent:(_CDPerfEvent *)a3 resultCount:(unint64_t)a4 incrementErrorCount:(BOOL)a5;
@end

@implementation _CDMutablePerfMetric

+ (id)perfMetricForFetchRequest:(void *)a3 type:
{
  id v4 = a2;
  id v5 = a3;
  self;
  v6 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  if ([v6 BOOLForKey:@"CoreDuetQueryPerfMetricsEnabled"])
  {
    v7 = [v4 predicate];
    v8 = [v7 description];
    v9 = _CDNormalizedStringFromQueryString(v8);
    v10 = (void *)[v9 mutableCopy];

    v11 = [v4 sortDescriptors];
    uint64_t v12 = [v11 count];

    if (v12)
    {
      v13 = [v4 sortDescriptors];
      v14 = [v13 valueForKey:@"key"];
      v15 = [v14 componentsJoinedByString:@", "];

      v16 = [NSString stringWithFormat:@" ORDER BY %@", v15];
      [v10 appendString:v16];
    }
    if ([v4 fetchOffset])
    {
      v17 = [NSString stringWithFormat:@" OFFSET ?"];
      [v10 appendString:v17];
    }
    if ([v4 fetchLimit])
    {
      unint64_t v18 = [v4 fetchLimit];
      if (v18 < 2 || v18 == 0xFFFFFFFF)
      {
        v19 = [NSNumber numberWithUnsignedInteger:v18];
      }
      else
      {
        v21 = @"N";
        v22 = @"NN";
        v23 = @"NNN";
        v24 = @"NNNN";
        if (v18 >> 5 >= 0xC35) {
          v25 = @"NNNNNN+";
        }
        else {
          v25 = @"NNNNN";
        }
        if (v18 >> 4 >= 0x271) {
          v24 = v25;
        }
        if (v18 >= 0x3E8) {
          v23 = v24;
        }
        if (v18 >= 0x64) {
          v22 = v23;
        }
        if (v18 >= 0xA) {
          v21 = v22;
        }
        v19 = v21;
      }
      v26 = v19;
      v27 = v19;

      v28 = [NSString stringWithFormat:@" LIMIT %@", v27];
      [v10 appendString:v28];
    }
    v29 = +[_CDHashUtilities sha1ForString:v10];
    v30 = objc_msgSend(v29, "substringToIndex:", (unint64_t)objc_msgSend(v29, "length") >> 1);
    v31 = +[_CDPerfMetricFamily perfMetricFamilyWithName:v5];
    v20 = [v31 perfMetricWithName:v30 string:v10];
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (_CDMutablePerfMetric)initWithName:(id)a3 string:(id)a4 family:(id)a5
{
  v6.receiver = self;
  v6.super_class = (Class)_CDMutablePerfMetric;
  return [(_CDPerfMetric *)&v6 initWithName:a3 string:a4 family:a5];
}

- (void)endTimingWithEvent:(_CDPerfEvent *)a3 resultCount:(unint64_t)a4 incrementErrorCount:(BOOL)a5
{
  if (!a3) {
    return;
  }
  BOOL v5 = a5;
  p_lock = &self->super._lock;
  os_unfair_lock_lock(&self->super._lock);
  double var0 = a3->var0;
  double var1 = a3->var1;
  if (self->_os_activity)
  {
    os_activity_scope_leave(&self->_os_activity_scope_state);
    os_activity = self->_os_activity;
    self->_os_activity = 0;
  }
  double v13 = var1 - var0;
  eventStatsTimerCounter = self->_eventStatsTimerCounter;
  if (eventStatsTimerCounter) {
    -[_DKEventStatsTimerCounter addTimingWithTimeInterval:]((uint64_t)eventStatsTimerCounter, v13);
  }
  unint64_t count = self->super._count;
  self->super._unint64_t count = count + 1;
  double v16 = a3->var1;
  self->super._lastElapsedTime = v13;
  self->super._lastResultCount = a4;
  self->super._totalElapsedTime = v13 + self->super._totalElapsedTime;
  self->super._lastUpdateTime = v16;
  if (!count)
  {
    self->super._minimumElapsedTime = v13;
    p_maximumElapsedTime = &self->super._maximumElapsedTime;
    goto LABEL_16;
  }
  p_maximumElapsedTime = &self->super._minimumElapsedTime;
  if (v13 < self->super._minimumElapsedTime
    || (p_maximumElapsedTime = &self->super._maximumElapsedTime, v13 > self->super._maximumElapsedTime))
  {
LABEL_16:
    double *p_maximumElapsedTime = v13;
    if (!v5) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  if (v5) {
LABEL_10:
  }
    ++self->super._errorCount;
LABEL_11:
  os_unfair_lock_unlock(p_lock);
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  BOOL v5 = NSStringFromClass(v4);
  objc_super v6 = [(_CDPerfMetric *)self name];
  v7 = [(_CDPerfMetric *)self string];
  v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[_CDPerfMetric count](self, "count"));
  v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[_CDPerfMetric errorCount](self, "errorCount"));
  v10 = [v3 stringWithFormat:@"%@: { name=%@, text='%@', count=%@, errorCount=%@ }", v5, v6, v7, v8, v9];

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventStatsTimerCounter, 0);
  objc_storeStrong((id *)&self->_os_activity, 0);
}

@end