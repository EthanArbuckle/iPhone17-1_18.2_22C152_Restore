@interface AMSFollowUpMetricsEvent
+ (id)eventFromMetricsDictionary:(id)a3;
@end

@implementation AMSFollowUpMetricsEvent

+ (id)eventFromMetricsDictionary:(id)a3
{
  id v3 = a3;
  v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithTopic:@"xp_amp_followup"];
  v5 = v4;
  if (v3) {
    [v4 addPropertiesWithDictionary:v3];
  }

  return v5;
}

@end