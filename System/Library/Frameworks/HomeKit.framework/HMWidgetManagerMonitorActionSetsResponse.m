@interface HMWidgetManagerMonitorActionSetsResponse
- (HMWidgetManagerMonitorActionSetsResponse)initWithIsOnByActionSetsUniqueIdentifier:(id)a3 didExecutionFailByActionSetUniqueIdentifier:(id)a4;
- (NSDictionary)didExecutionFailByActionSetUniqueIdentifier;
- (NSDictionary)isOnByActionSetUniqueIdentifier;
@end

@implementation HMWidgetManagerMonitorActionSetsResponse

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_didExecutionFailByActionSetUniqueIdentifier, 0);

  objc_storeStrong((id *)&self->_isOnByActionSetUniqueIdentifier, 0);
}

- (NSDictionary)didExecutionFailByActionSetUniqueIdentifier
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (NSDictionary)isOnByActionSetUniqueIdentifier
{
  return (NSDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (HMWidgetManagerMonitorActionSetsResponse)initWithIsOnByActionSetsUniqueIdentifier:(id)a3 didExecutionFailByActionSetUniqueIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMWidgetManagerMonitorActionSetsResponse;
  v9 = [(HMWidgetManagerMonitorActionSetsResponse *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_isOnByActionSetUniqueIdentifier, a3);
    objc_storeStrong((id *)&v10->_didExecutionFailByActionSetUniqueIdentifier, a4);
  }

  return v10;
}

@end