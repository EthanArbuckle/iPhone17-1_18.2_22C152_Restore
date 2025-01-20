@interface PSSpecifier
- (id)hprf_workoutActivityType;
- (unint64_t)hprf_metricType;
- (void)hprf_setMetricType:(unint64_t)a3;
- (void)hprf_setWorkoutActivityOption:(id)a3;
@end

@implementation PSSpecifier

- (unint64_t)hprf_metricType
{
  v2 = [(PSSpecifier *)self propertyForKey:@"HPRFMetricTypeKey"];
  id v3 = [v2 integerValue];

  return (unint64_t)v3;
}

- (void)hprf_setMetricType:(unint64_t)a3
{
  id v4 = +[NSNumber numberWithUnsignedInteger:a3];
  [(PSSpecifier *)self setProperty:v4 forKey:@"HPRFMetricTypeKey"];
}

- (id)hprf_workoutActivityType
{
  return [(PSSpecifier *)self propertyForKey:@"HPRFWorkoutActivityTypeKey"];
}

- (void)hprf_setWorkoutActivityOption:(id)a3
{
}

@end