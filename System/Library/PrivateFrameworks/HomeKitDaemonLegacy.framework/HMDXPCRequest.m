@interface HMDXPCRequest
- (HMDXPCRequest)initWithName:(id)a3 qualityOfService:(int64_t)a4 timeoutDate:(id)a5 responseHandler:(id)a6;
- (NSDate)timeoutDate;
- (NSString)name;
- (id)responseHandler;
- (int64_t)qualityOfService;
@end

@implementation HMDXPCRequest

- (id)responseHandler
{
  return objc_getProperty(self, a2, 32, 1);
}

- (int64_t)qualityOfService
{
  return self->_qualityOfService;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (HMDXPCRequest)initWithName:(id)a3 qualityOfService:(int64_t)a4 timeoutDate:(id)a5 responseHandler:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  if (!v10)
  {
    _HMFPreconditionFailure();
    goto LABEL_8;
  }
  if (!v11)
  {
LABEL_8:
    _HMFPreconditionFailure();
    goto LABEL_9;
  }
  v13 = v12;
  if (!v12)
  {
LABEL_9:
    v22 = (HMDUserMessagePolicy *)_HMFPreconditionFailure();
    return (HMDXPCRequest *)[(HMDUserMessagePolicy *)v22 userPrivilege];
  }
  v24.receiver = self;
  v24.super_class = (Class)HMDXPCRequest;
  v14 = [(HMDXPCRequest *)&v24 init];
  if (v14)
  {
    uint64_t v15 = [v10 copy];
    name = v14->_name;
    v14->_name = (NSString *)v15;

    v14->_qualityOfService = a4;
    uint64_t v17 = [v11 copy];
    timeoutDate = v14->_timeoutDate;
    v14->_timeoutDate = (NSDate *)v17;

    uint64_t v19 = [v13 copy];
    id responseHandler = v14->_responseHandler;
    v14->_id responseHandler = (id)v19;
  }
  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_responseHandler, 0);
  objc_storeStrong((id *)&self->_timeoutDate, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (NSDate)timeoutDate
{
  return (NSDate *)objc_getProperty(self, a2, 24, 1);
}

@end