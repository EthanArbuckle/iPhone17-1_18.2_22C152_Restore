@interface CNWatchdog
+ (CNWatchdog)defaultWatchdog;
- (CNWatchdog)init;
- (unint64_t)statusForEvent:(id)a3;
- (void)recordExceptionForEvent:(id)a3;
- (void)setStatus:(unint64_t)a3 forEvent:(id)a4;
@end

@implementation CNWatchdog

+ (CNWatchdog)defaultWatchdog
{
  v2 = objc_alloc_init(CNWatchdog);

  return v2;
}

- (CNWatchdog)init
{
  v7.receiver = self;
  v7.super_class = (Class)CNWatchdog;
  v2 = [(CNWatchdog *)&v7 init];
  if (v2)
  {
    uint64_t v3 = +[CNCache atomicCache];
    events = v2->_events;
    v2->_events = (CNCache *)v3;

    v5 = v2;
  }

  return v2;
}

- (void)recordExceptionForEvent:(id)a3
{
}

- (void)setStatus:(unint64_t)a3 forEvent:(id)a4
{
  if (a3)
  {
    v5 = NSNumber;
    id v6 = a4;
    id v10 = +[CNEnvironmentBase currentEnvironment];
    objc_super v7 = [v10 timeProvider];
    [v7 timestamp];
    v8 = objc_msgSend(v5, "numberWithDouble:");
    [(CNCache *)self->_events setObject:v8 forKeyedSubscript:v6];
  }
  else
  {
    events = self->_events;
    id v10 = a4;
    -[CNCache setObject:forKeyedSubscript:](events, "setObject:forKeyedSubscript:", 0);
  }
}

- (unint64_t)statusForEvent:(id)a3
{
  uint64_t v3 = [(CNCache *)self->_events objectForKeyedSubscript:a3];
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "_cn_timeIntervalValue");
    double v6 = v5;
    objc_super v7 = +[CNEnvironmentBase currentEnvironment];
    v8 = [v7 timeProvider];
    [v8 timestamp];
    double v10 = v9 - v6;

    unint64_t v11 = v10 < 60.0;
  }
  else
  {
    unint64_t v11 = 0;
  }

  return v11;
}

- (void).cxx_destruct
{
}

@end