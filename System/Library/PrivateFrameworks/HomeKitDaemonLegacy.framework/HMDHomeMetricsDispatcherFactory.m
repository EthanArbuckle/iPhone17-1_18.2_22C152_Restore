@interface HMDHomeMetricsDispatcherFactory
- (id)createHomeMetricsDispatcherWithIdentifier:(id)a3 logEventSubmitter:(id)a4;
@end

@implementation HMDHomeMetricsDispatcherFactory

- (id)createHomeMetricsDispatcherWithIdentifier:(id)a3 logEventSubmitter:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [[HMDHomeMetricsDispatcher alloc] initWithIdentifier:v6 logEventSubmitter:v5];

  return v7;
}

@end