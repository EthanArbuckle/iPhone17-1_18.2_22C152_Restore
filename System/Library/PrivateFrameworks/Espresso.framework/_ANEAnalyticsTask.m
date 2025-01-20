@interface _ANEAnalyticsTask
+ (id)objectWithMetrics:(id)a3;
- (NSDictionary)metrics;
- (_ANEAnalyticsTask)initWithMetrics:(id)a3;
@end

@implementation _ANEAnalyticsTask

- (void).cxx_destruct
{
}

- (NSDictionary)metrics
{
  return self->_metrics;
}

- (_ANEAnalyticsTask)initWithMetrics:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_ANEAnalyticsTask;
  v6 = [(_ANEAnalyticsTask *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_metrics, a3);
  }

  return v7;
}

+ (id)objectWithMetrics:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc((Class)a1) initWithMetrics:v4];

  return v5;
}

@end