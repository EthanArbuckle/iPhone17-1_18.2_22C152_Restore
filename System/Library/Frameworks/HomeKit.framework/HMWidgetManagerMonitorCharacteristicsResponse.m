@interface HMWidgetManagerMonitorCharacteristicsResponse
- (HMWidgetManagerMonitorCharacteristicsResponse)initWithValueByCharacteristicUniqueIdentifier:(id)a3 reachabilityByAccessoryUniqueIdentifier:(id)a4;
- (NSDictionary)reachabilityByAccessoryUniqueIdentifier;
- (NSDictionary)valueByCharacteristicUniqueIdentifier;
@end

@implementation HMWidgetManagerMonitorCharacteristicsResponse

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reachabilityByAccessoryUniqueIdentifier, 0);

  objc_storeStrong((id *)&self->_valueByCharacteristicUniqueIdentifier, 0);
}

- (NSDictionary)reachabilityByAccessoryUniqueIdentifier
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (NSDictionary)valueByCharacteristicUniqueIdentifier
{
  return (NSDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (HMWidgetManagerMonitorCharacteristicsResponse)initWithValueByCharacteristicUniqueIdentifier:(id)a3 reachabilityByAccessoryUniqueIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HMWidgetManagerMonitorCharacteristicsResponse;
  v8 = [(HMWidgetManagerMonitorCharacteristicsResponse *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    valueByCharacteristicUniqueIdentifier = v8->_valueByCharacteristicUniqueIdentifier;
    v8->_valueByCharacteristicUniqueIdentifier = (NSDictionary *)v9;

    uint64_t v11 = [v7 copy];
    reachabilityByAccessoryUniqueIdentifier = v8->_reachabilityByAccessoryUniqueIdentifier;
    v8->_reachabilityByAccessoryUniqueIdentifier = (NSDictionary *)v11;
  }
  return v8;
}

@end