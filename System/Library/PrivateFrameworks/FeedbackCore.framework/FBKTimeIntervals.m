@interface FBKTimeIntervals
+ (FBKTimeIntervals)sharedInstance;
+ (id)log;
- (FBKTimeIntervals)init;
- (NSMutableDictionary)events;
- (id)didEndEvent:(unint64_t)a3;
- (id)didEndEvent:(unint64_t)a3 context:(id)a4;
- (id)keyForEvent:(unint64_t)a3 context:(id)a4;
- (void)didStartEvent:(unint64_t)a3;
- (void)setEvents:(id)a3;
- (void)willStartEvent:(unint64_t)a3 context:(id)a4;
@end

@implementation FBKTimeIntervals

+ (id)log
{
  if (log_onceToken != -1) {
    dispatch_once(&log_onceToken, &__block_literal_global_46);
  }
  v2 = (void *)log_log;

  return v2;
}

uint64_t __23__FBKTimeIntervals_log__block_invoke()
{
  log_log = (uint64_t)os_log_create("com.apple.FeedbackCore", "time");

  return MEMORY[0x270F9A758]();
}

+ (FBKTimeIntervals)sharedInstance
{
  if (sharedInstance_onceToken_3 != -1) {
    dispatch_once(&sharedInstance_onceToken_3, &__block_literal_global_76);
  }
  v2 = (void *)sharedInstance_instance_0;

  return (FBKTimeIntervals *)v2;
}

uint64_t __34__FBKTimeIntervals_sharedInstance__block_invoke()
{
  sharedInstance_instance_0 = objc_opt_new();

  return MEMORY[0x270F9A758]();
}

- (FBKTimeIntervals)init
{
  v6.receiver = self;
  v6.super_class = (Class)FBKTimeIntervals;
  v2 = [(FBKTimeIntervals *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    events = v2->_events;
    v2->_events = (NSMutableDictionary *)v3;
  }
  return v2;
}

- (void)didStartEvent:(unint64_t)a3
{
}

- (void)willStartEvent:(unint64_t)a3 context:(id)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v6 = a4;
  v7 = [[FBKTimeIntervalEvent alloc] initWithType:a3];
  v8 = [(FBKTimeIntervals *)self keyForEvent:a3 context:v6];

  v9 = [(FBKTimeIntervals *)self events];
  [v9 setObject:v7 forKeyedSubscript:v8];

  v10 = [(id)objc_opt_class() log];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = [(FBKTimeIntervalEvent *)v7 description];
    int v12 = 138543362;
    v13 = v11;
    _os_log_impl(&dword_22A36D000, v10, OS_LOG_TYPE_INFO, "Event [%{public}@] has begun.", (uint8_t *)&v12, 0xCu);
  }
}

- (id)didEndEvent:(unint64_t)a3
{
  return [(FBKTimeIntervals *)self didEndEvent:a3 context:0];
}

- (id)didEndEvent:(unint64_t)a3 context:(id)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v6 = (__CFString *)a4;
  v7 = [(FBKTimeIntervals *)self keyForEvent:a3 context:v6];
  v8 = [(FBKTimeIntervals *)self events];
  v9 = [v8 objectForKeyedSubscript:v7];

  [v9 setEndTimeInterval:CACurrentMediaTime()];
  if (v9)
  {
    [v9 endTimeInterval];
    double v11 = v10;
    [v9 startTimeInterval];
    double v13 = v11 - v12;
    uint64_t v14 = [(id)objc_opt_class() log];
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
    if (v13 >= 1.0)
    {
      if (v15)
      {
        uint64_t v20 = [v9 description];
        v17 = (void *)v20;
        v21 = &stru_26DDF6A30;
        int v24 = 134218498;
        double v25 = v13;
        if (v6) {
          v21 = v6;
        }
        __int16 v26 = 2114;
        uint64_t v27 = v20;
        __int16 v28 = 2112;
        v29 = v21;
        v19 = "It took [%.2lfs] to %{public}@ %@";
        goto LABEL_11;
      }
    }
    else if (v15)
    {
      uint64_t v16 = [v9 description];
      v17 = (void *)v16;
      v18 = &stru_26DDF6A30;
      int v24 = 134218498;
      double v25 = v13 * 1000.0;
      if (v6) {
        v18 = v6;
      }
      __int16 v26 = 2114;
      uint64_t v27 = v16;
      __int16 v28 = 2112;
      v29 = v18;
      v19 = "It took [%.2lfms] to %{public}@ %@";
LABEL_11:
      _os_log_impl(&dword_22A36D000, v14, OS_LOG_TYPE_DEFAULT, v19, (uint8_t *)&v24, 0x20u);
    }
    v22 = [(FBKTimeIntervals *)self events];
    [v22 removeObjectForKey:v7];
  }

  return v9;
}

- (id)keyForEvent:(unint64_t)a3 context:(id)a4
{
  if (a4) {
    [NSString stringWithFormat:@"%lu-%@", a3, a4];
  }
  else {
  v4 = [NSNumber numberWithUnsignedInteger:a3];
  }

  return v4;
}

- (NSMutableDictionary)events
{
  return self->_events;
}

- (void)setEvents:(id)a3
{
}

- (void).cxx_destruct
{
}

@end