@interface CHSMutableWidgetMetricsSpecification
- (NSMutableDictionary)alternatesByFamily;
- (NSMutableDictionary)metricsByFamily;
- (id)_initWithMetricsByFamily:(id)a3 alternates:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setAlternateMetrics:(id)a3 forFamily:(int64_t)a4;
- (void)setMetrics:(id)a3 forFamily:(int64_t)a4;
@end

@implementation CHSMutableWidgetMetricsSpecification

- (id)_initWithMetricsByFamily:(id)a3 alternates:(id)a4
{
  id v6 = a4;
  v7 = (void *)[a3 mutableCopy];
  v8 = (void *)[v6 mutableCopy];
  v11.receiver = self;
  v11.super_class = (Class)CHSMutableWidgetMetricsSpecification;
  id v9 = [(CHSWidgetMetricsSpecification *)&v11 _initWithMetricsByFamily:v7 alternates:v8];

  return v9;
}

- (void)setMetrics:(id)a3 forFamily:(int64_t)a4
{
  id v8 = a3;
  id v6 = [(CHSMutableWidgetMetricsSpecification *)self metricsByFamily];
  v7 = [MEMORY[0x1E4F28ED0] numberWithInteger:a4];
  if (v8) {
    [v6 setObject:v8 forKey:v7];
  }
  else {
    [v6 removeObjectForKey:v7];
  }
}

- (void)setAlternateMetrics:(id)a3 forFamily:(int64_t)a4
{
  id v8 = a3;
  id v6 = [(CHSMutableWidgetMetricsSpecification *)self alternatesByFamily];
  v7 = [MEMORY[0x1E4F28ED0] numberWithInteger:a4];
  if (v8) {
    [v6 setObject:v8 forKey:v7];
  }
  else {
    [v6 removeObjectForKey:v7];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[CHSWidgetMetricsSpecification allocWithZone:a3];
  return [(CHSWidgetMetricsSpecification *)v4 initWithMetricsSpecification:self];
}

- (NSMutableDictionary)metricsByFamily
{
  v4.receiver = self;
  v4.super_class = (Class)CHSMutableWidgetMetricsSpecification;
  v2 = [(CHSWidgetMetricsSpecification *)&v4 metricsByFamily];
  return (NSMutableDictionary *)v2;
}

- (NSMutableDictionary)alternatesByFamily
{
  v4.receiver = self;
  v4.super_class = (Class)CHSMutableWidgetMetricsSpecification;
  v2 = [(CHSWidgetMetricsSpecification *)&v4 alternatesByFamily];
  return (NSMutableDictionary *)v2;
}

@end