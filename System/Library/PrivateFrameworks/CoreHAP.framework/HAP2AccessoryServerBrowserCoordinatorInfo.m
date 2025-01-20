@interface HAP2AccessoryServerBrowserCoordinatorInfo
- (HAP2AccessoryServerBrowserCoordinatorInfo)initWithCoordinator:(id)a3;
- (HAP2AccessoryServerCoordinatorPrivate)coordinator;
- (NSError)error;
- (void)setError:(id)a3;
@end

@implementation HAP2AccessoryServerBrowserCoordinatorInfo

- (HAP2AccessoryServerCoordinatorPrivate)coordinator
{
  return self->_coordinator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);

  objc_storeStrong((id *)&self->_coordinator, 0);
}

- (void)setError:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (HAP2AccessoryServerBrowserCoordinatorInfo)initWithCoordinator:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HAP2AccessoryServerBrowserCoordinatorInfo;
  v6 = [(HAP2AccessoryServerBrowserCoordinatorInfo *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_coordinator, a3);
  }

  return v7;
}

@end