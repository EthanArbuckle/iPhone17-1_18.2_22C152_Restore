@interface AMSMetricsActivity
- (AMSMetricsActivity)init;
- (AMSMetricsActivity)initWithLabel:(int64_t)a3;
- (AMSMetricsActivity)initWithLabel:(int64_t)a3 parent:(id)a4;
- (OS_nw_activity)nwActivity;
- (void)activate;
- (void)completeAfter:(id)a3;
@end

@implementation AMSMetricsActivity

- (void).cxx_destruct
{
}

- (AMSMetricsActivity)initWithLabel:(int64_t)a3
{
  return (AMSMetricsActivity *)MetricsActivity.init(label:)(a3);
}

- (void)completeAfter:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_18D702600(v4);
}

- (void)activate
{
  v2 = self;
  sub_18D702720();
}

- (OS_nw_activity)nwActivity
{
  v2 = (void *)sub_18D702764();
  return (OS_nw_activity *)v2;
}

- (AMSMetricsActivity)initWithLabel:(int64_t)a3 parent:(id)a4
{
  return (AMSMetricsActivity *)MetricsActivity.init(label:parent:)(a3);
}

- (AMSMetricsActivity)init
{
}

@end