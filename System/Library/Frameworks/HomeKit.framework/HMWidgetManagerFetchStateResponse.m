@interface HMWidgetManagerFetchStateResponse
- (HMWidgetManagerFetchStateResponse)initWithValueByCharacteristicUniqueIdentifier:(id)a3;
- (NSDictionary)valueByCharacteristicUniqueIdentifier;
@end

@implementation HMWidgetManagerFetchStateResponse

- (void).cxx_destruct
{
}

- (NSDictionary)valueByCharacteristicUniqueIdentifier
{
  return (NSDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (HMWidgetManagerFetchStateResponse)initWithValueByCharacteristicUniqueIdentifier:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMWidgetManagerFetchStateResponse;
  v5 = [(HMWidgetManagerFetchStateResponse *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    valueByCharacteristicUniqueIdentifier = v5->_valueByCharacteristicUniqueIdentifier;
    v5->_valueByCharacteristicUniqueIdentifier = (NSDictionary *)v6;
  }
  return v5;
}

@end