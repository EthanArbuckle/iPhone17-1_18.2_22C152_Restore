@interface HMDNotificationRegistryCoreDataCharacteristicsRequestResult
- (BOOL)didModify;
- (BOOL)didModifyThresholdOnly;
- (BOOL)didSucceed;
- (BOOL)isEqual:(id)a3;
- (HMDNotificationRegistryCoreDataCharacteristicsRequest)coreDataRequest;
- (HMDNotificationRegistryCoreDataCharacteristicsRequestResult)initWithCoreDataRequest:(id)a3 didSucceed:(BOOL)a4 didModify:(BOOL)a5 didModifyThresholdOnly:(BOOL)a6 modifiedCharacteristics:(id)a7;
- (NSArray)modifiedCharacteristics;
@end

@implementation HMDNotificationRegistryCoreDataCharacteristicsRequestResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modifiedCharacteristics, 0);
  objc_storeStrong((id *)&self->_coreDataRequest, 0);
}

- (NSArray)modifiedCharacteristics
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (BOOL)didModifyThresholdOnly
{
  return self->_didModifyThresholdOnly;
}

- (BOOL)didModify
{
  return self->_didModify;
}

- (BOOL)didSucceed
{
  return self->_didSucceed;
}

- (HMDNotificationRegistryCoreDataCharacteristicsRequest)coreDataRequest
{
  return (HMDNotificationRegistryCoreDataCharacteristicsRequest *)objc_getProperty(self, a2, 16, 1);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;
  v7 = v6;
  if (v6)
  {
    coreDataRequest = self->_coreDataRequest;
    v9 = [v6 coreDataRequest];
    BOOL v10 = [(HMDNotificationRegistryCoreDataCharacteristicsRequest *)coreDataRequest isEqual:v9];
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (HMDNotificationRegistryCoreDataCharacteristicsRequestResult)initWithCoreDataRequest:(id)a3 didSucceed:(BOOL)a4 didModify:(BOOL)a5 didModifyThresholdOnly:(BOOL)a6 modifiedCharacteristics:(id)a7
{
  id v13 = a3;
  id v14 = a7;
  v18.receiver = self;
  v18.super_class = (Class)HMDNotificationRegistryCoreDataCharacteristicsRequestResult;
  v15 = [(HMDNotificationRegistryCoreDataCharacteristicsRequestResult *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_coreDataRequest, a3);
    v16->_didSucceed = a4;
    v16->_didModify = a5;
    objc_storeStrong((id *)&v16->_modifiedCharacteristics, a7);
    v16->_didModifyThresholdOnly = a6;
  }

  return v16;
}

@end