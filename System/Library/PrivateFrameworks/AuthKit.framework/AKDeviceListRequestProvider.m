@interface AKDeviceListRequestProvider
- (AKDeviceListRequestContext)deviceRequestContext;
- (unint64_t)expectedResponseType;
- (void)requestURLWithCompletion:(id)a3;
- (void)setDeviceRequestContext:(id)a3;
@end

@implementation AKDeviceListRequestProvider

- (void)requestURLWithCompletion:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10003DDCC;
  v5[3] = &unk_100227228;
  v6 = self;
  id v7 = a3;
  v4.receiver = v6;
  v4.super_class = (Class)AKDeviceListRequestProvider;
  id v3 = v7;
  [(AKURLRequestProviderImpl *)&v4 requestURLWithCompletion:v5];
}

- (unint64_t)expectedResponseType
{
  return 1;
}

- (AKDeviceListRequestContext)deviceRequestContext
{
  return self->_deviceRequestContext;
}

- (void)setDeviceRequestContext:(id)a3
{
}

- (void).cxx_destruct
{
}

@end