@interface AMSMetrics
+ (id)lib_sharedInstanceWithContainerId:(id)a3;
+ (id)lib_sharedMetricsQueue;
@end

@implementation AMSMetrics

+ (id)lib_sharedInstanceWithContainerId:(id)a3
{
  id v3 = a3;
  if (qword_10039F5A8 != -1) {
    dispatch_once(&qword_10039F5A8, &stru_1003574E8);
  }
  id v4 = [(id)qword_10039F5A0 objectForKey:v3];
  if (!v4)
  {
    id v5 = objc_alloc((Class)AMSMetrics);
    v6 = +[Bag defaultBag];
    id v4 = [v5 initWithContainerID:v3 bag:v6];

    [(id)qword_10039F5A0 setObject:v4 forKey:v3];
  }

  return v4;
}

+ (id)lib_sharedMetricsQueue
{
  if (qword_10039F5B8 != -1) {
    dispatch_once(&qword_10039F5B8, &stru_100357508);
  }
  v2 = (void *)qword_10039F5B0;

  return v2;
}

@end