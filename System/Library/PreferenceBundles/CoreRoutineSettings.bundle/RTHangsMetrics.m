@interface RTHangsMetrics
- (RTHangsMetrics)init;
- (void)submitToCoreAnalytics:(id)a3 type:(int64_t)a4 duration:(double)a5;
@end

@implementation RTHangsMetrics

- (RTHangsMetrics)init
{
  v3.receiver = self;
  v3.super_class = (Class)RTHangsMetrics;
  return [(RTHangsMetrics *)&v3 init];
}

- (void)submitToCoreAnalytics:(id)a3 type:(int64_t)a4 duration:(double)a5
{
  label = dispatch_queue_get_label(0);
  id v9 = a3;
  v10 = +[NSString stringWithCString:label encoding:4];
  v11 = +[NSCharacterSet characterSetWithCharactersInString:@"- "];
  v12 = [v10 componentsSeparatedByCharactersInSet:v11];
  id v19 = [v12 objectAtIndexedSubscript:0];

  v13 = objc_opt_new();
  [v13 setObject:v9 forKeyedSubscript:@"hungObject"];

  v14 = +[NSNumber numberWithInteger:a4];
  [v13 setObject:v14 forKeyedSubscript:@"hangType"];

  v15 = +[NSNumber numberWithDouble:a5];
  [v13 setObject:v15 forKeyedSubscript:@"hangDuration"];

  [v13 setObject:v19 forKeyedSubscript:@"hungQueue"];
  id v16 = objc_alloc((Class)NSString);
  id v17 = [v16 initWithCString:off_21EC8 encoding:1];
  sub_13C6C(v17, v13);
  v18 = +[NSString stringWithFormat:@"com.apple.%@", v17];
  AnalyticsSendEvent();
}

@end