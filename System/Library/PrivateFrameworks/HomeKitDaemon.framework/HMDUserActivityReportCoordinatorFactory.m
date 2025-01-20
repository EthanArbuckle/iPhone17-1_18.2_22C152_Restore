@interface HMDUserActivityReportCoordinatorFactory
+ (id)coordinatorWithHome:(id)a3;
- (HMDUserActivityReportCoordinatorFactory)init;
@end

@implementation HMDUserActivityReportCoordinatorFactory

+ (id)coordinatorWithHome:(id)a3
{
  id v3 = a3;
  id v4 = sub_22F668574(v3);

  return v4;
}

- (HMDUserActivityReportCoordinatorFactory)init
{
  v3.receiver = self;
  v3.super_class = (Class)HMDUserActivityReportCoordinatorFactory;
  return [(HMDUserActivityReportCoordinatorFactory *)&v3 init];
}

@end