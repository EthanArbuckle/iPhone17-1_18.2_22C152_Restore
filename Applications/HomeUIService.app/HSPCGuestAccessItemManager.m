@interface HSPCGuestAccessItemManager
- (HFPinCodeManager)pinCodeManager;
- (HMAccessory)accessory;
- (HMHome)overrideHome;
- (HSPCGuestAccessItemManager)initWithDelegate:(id)a3;
- (HSPCGuestAccessItemManager)initWithDelegate:(id)a3 sourceItem:(id)a4;
- (HSPCGuestAccessItemManager)initWithPinCodeManager:(id)a3 delegate:(id)a4 home:(id)a5 forAccessory:(id)a6;
- (id)_buildItemProvidersForHome:(id)a3;
- (id)_homeFuture;
- (id)_itemsToHideInSet:(id)a3;
- (void)_registerForExternalUpdates;
- (void)_unregisterForExternalUpdates;
- (void)setAccessory:(id)a3;
- (void)setPinCodeManager:(id)a3;
@end

@implementation HSPCGuestAccessItemManager

- (HSPCGuestAccessItemManager)initWithDelegate:(id)a3 sourceItem:(id)a4
{
  v6 = +[NSAssertionHandler currentHandler];
  v7 = NSStringFromSelector("initWithPinCodeManager:delegate:home:forAccessory:");
  [v6 handleFailureInMethod:a2 object:self file:@"HSPCGuestAccessItemManager.m" lineNumber:26 description:@"%s is unavailable; use %@ instead"];
    "-[HSPCGuestAccessItemManager initWithDelegate:sourceItem:]",
    v7);

  return 0;
}

- (HSPCGuestAccessItemManager)initWithDelegate:(id)a3
{
  v5 = +[NSAssertionHandler currentHandler];
  v6 = NSStringFromSelector("initWithPinCodeManager:delegate:home:forAccessory:");
  [v5 handleFailureInMethod:a2 object:self file:@"HSPCGuestAccessItemManager.m" lineNumber:31 description:@"%s is unavailable; use %@ instead"];
    "-[HSPCGuestAccessItemManager initWithDelegate:]",
    v6);

  return 0;
}

- (HSPCGuestAccessItemManager)initWithPinCodeManager:(id)a3 delegate:(id)a4 home:(id)a5 forAccessory:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)HSPCGuestAccessItemManager;
  v14 = [(HSPCGuestAccessItemManager *)&v17 initWithDelegate:a4 sourceItem:0];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_pinCodeManager, a3);
    objc_storeStrong((id *)&v15->_overrideHome, a5);
    objc_storeStrong((id *)&v15->_accessory, a6);
  }

  return v15;
}

- (id)_buildItemProvidersForHome:(id)a3
{
  id v4 = objc_alloc((Class)HFPinCodeItemProvider);
  v5 = [(HSPCGuestAccessItemManager *)self home];
  v6 = [(HSPCGuestAccessItemManager *)self pinCodeManager];
  v7 = [(HSPCGuestAccessItemManager *)self accessory];
  id v8 = [v4 initWithHome:v5 pinCodeManager:v6 listType:2 forAccessory:v7];

  id v11 = v8;
  v9 = +[NSArray arrayWithObjects:&v11 count:1];

  return v9;
}

- (id)_itemsToHideInSet:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)HSPCGuestAccessItemManager;
  id v3 = a3;
  id v4 = [(HSPCGuestAccessItemManager *)&v8 _itemsToHideInSet:v3];
  id v5 = [v4 mutableCopy];

  v6 = [v3 na_filter:&stru_1000A9EC8];

  [v5 unionSet:v6];

  return v5;
}

- (void)_registerForExternalUpdates
{
  v4.receiver = self;
  v4.super_class = (Class)HSPCGuestAccessItemManager;
  [(HSPCGuestAccessItemManager *)&v4 _registerForExternalUpdates];
  id v3 = [(HSPCGuestAccessItemManager *)self pinCodeManager];
  [v3 addObserver:self];
}

- (void)_unregisterForExternalUpdates
{
  v4.receiver = self;
  v4.super_class = (Class)HSPCGuestAccessItemManager;
  [(HSPCGuestAccessItemManager *)&v4 _unregisterForExternalUpdates];
  id v3 = [(HSPCGuestAccessItemManager *)self pinCodeManager];
  [v3 removeObserver:self];
}

- (id)_homeFuture
{
  v2 = [(HSPCGuestAccessItemManager *)self overrideHome];
  id v3 = +[NAFuture futureWithResult:v2];

  return v3;
}

- (HFPinCodeManager)pinCodeManager
{
  return self->_pinCodeManager;
}

- (void)setPinCodeManager:(id)a3
{
}

- (HMAccessory)accessory
{
  return self->_accessory;
}

- (void)setAccessory:(id)a3
{
}

- (HMHome)overrideHome
{
  return self->_overrideHome;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideHome, 0);
  objc_storeStrong((id *)&self->_accessory, 0);

  objc_storeStrong((id *)&self->_pinCodeManager, 0);
}

@end