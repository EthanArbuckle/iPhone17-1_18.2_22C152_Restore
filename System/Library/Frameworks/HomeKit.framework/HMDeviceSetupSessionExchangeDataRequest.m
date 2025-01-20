@interface HMDeviceSetupSessionExchangeDataRequest
- (HMDeviceSetupSessionExchangeDataRequest)initWithExchangeData:(id)a3 qualityOfService:(int64_t)a4 completionHandler:(id)a5;
- (NSData)exchangeData;
- (id)completionHandler;
- (int64_t)qos;
@end

@implementation HMDeviceSetupSessionExchangeDataRequest

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);

  objc_storeStrong((id *)&self->_exchangeData, 0);
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (int64_t)qos
{
  return self->_qos;
}

- (NSData)exchangeData
{
  return self->_exchangeData;
}

- (HMDeviceSetupSessionExchangeDataRequest)initWithExchangeData:(id)a3 qualityOfService:(int64_t)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v16.receiver = self;
  v16.super_class = (Class)HMDeviceSetupSessionExchangeDataRequest;
  v10 = [(HMDeviceSetupSessionExchangeDataRequest *)&v16 init];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    exchangeData = v10->_exchangeData;
    v10->_exchangeData = (NSData *)v11;

    v10->_qos = a4;
    v13 = _Block_copy(v9);
    id completionHandler = v10->_completionHandler;
    v10->_id completionHandler = v13;
  }
  return v10;
}

@end