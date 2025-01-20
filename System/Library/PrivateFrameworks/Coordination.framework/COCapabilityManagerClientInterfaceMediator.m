@interface COCapabilityManagerClientInterfaceMediator
- (COCapabilityManager)manager;
- (COCapabilityManagerClientInterfaceMediator)initWithCapabilityManager:(id)a3;
- (void)availabilityChanged:(BOOL)a3 ofCapability:(id)a4 inCluster:(id)a5;
@end

@implementation COCapabilityManagerClientInterfaceMediator

- (COCapabilityManagerClientInterfaceMediator)initWithCapabilityManager:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)COCapabilityManagerClientInterfaceMediator;
  v5 = [(COCapabilityManagerClientInterfaceMediator *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_manager, v4);
  }

  return v6;
}

- (void)availabilityChanged:(BOOL)a3 ofCapability:(id)a4 inCluster:(id)a5
{
  BOOL v6 = a3;
  id v11 = a4;
  id v8 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_manager);
  v10 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained availabilityChanged:v6 ofCapability:v11 inCluster:v8];
  }
}

- (COCapabilityManager)manager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_manager);

  return (COCapabilityManager *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end