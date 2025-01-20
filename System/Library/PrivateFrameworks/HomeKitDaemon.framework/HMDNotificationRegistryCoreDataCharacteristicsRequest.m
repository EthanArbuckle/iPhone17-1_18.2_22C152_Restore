@interface HMDNotificationRegistryCoreDataCharacteristicsRequest
- (BOOL)isEqual:(id)a3;
- (HMDNotificationRegistryCharacteristicsRequest)request;
- (HMDNotificationRegistryCoreDataCharacteristicsRequest)initWithRequest:(id)a3 characteristicThresholds:(id)a4;
- (NSArray)characteristicThresholds;
@end

@implementation HMDNotificationRegistryCoreDataCharacteristicsRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_characteristicThresholds, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

- (NSArray)characteristicThresholds
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (HMDNotificationRegistryCharacteristicsRequest)request
{
  return (HMDNotificationRegistryCharacteristicsRequest *)objc_getProperty(self, a2, 8, 1);
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HMDNotificationRegistryCoreDataCharacteristicsRequest *)a3;
  if (v4 == self)
  {
    char v12 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v5 = v4;
    }
    else {
      v5 = 0;
    }
    v6 = v5;
    v7 = v6;
    if (v6)
    {
      request = self->_request;
      v9 = [(HMDNotificationRegistryCoreDataCharacteristicsRequest *)v6 request];
      if ([(HMDNotificationRegistryCharacteristicsRequest *)request isEqual:v9])
      {
        characteristicThresholds = self->_characteristicThresholds;
        v11 = [(HMDNotificationRegistryCoreDataCharacteristicsRequest *)v7 characteristicThresholds];
        char v12 = [(NSArray *)characteristicThresholds isEqual:v11];
      }
      else
      {
        char v12 = 0;
      }
    }
    else
    {
      char v12 = 0;
    }
  }
  return v12;
}

- (HMDNotificationRegistryCoreDataCharacteristicsRequest)initWithRequest:(id)a3 characteristicThresholds:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMDNotificationRegistryCoreDataCharacteristicsRequest;
  v9 = [(HMDNotificationRegistryCoreDataCharacteristicsRequest *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_request, a3);
    objc_storeStrong((id *)&v10->_characteristicThresholds, a4);
  }

  return v10;
}

@end