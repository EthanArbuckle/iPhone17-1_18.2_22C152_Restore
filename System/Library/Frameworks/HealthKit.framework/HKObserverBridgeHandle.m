@interface HKObserverBridgeHandle
- (BOOL)notifyObserversOfChangeForKey:(id)a3 newValue:(id)a4;
- (HKObserverBridge)bridge;
- (HKObserverBridgeHandle)initWithBridge:(id)a3;
@end

@implementation HKObserverBridgeHandle

- (HKObserverBridgeHandle)initWithBridge:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HKObserverBridgeHandle;
  v5 = [(HKObserverBridgeHandle *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_bridge, v4);
  }

  return v6;
}

- (BOOL)notifyObserversOfChangeForKey:(id)a3 newValue:(id)a4
{
  p_bridge = &self->_bridge;
  id v6 = a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_bridge);
  char v9 = [WeakRetained notifyObserversOfChangeForKey:v7 newValue:v6];

  return v9;
}

- (HKObserverBridge)bridge
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_bridge);

  return (HKObserverBridge *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end