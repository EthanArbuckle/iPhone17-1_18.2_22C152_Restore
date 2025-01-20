@interface HUAccessoryListenerHelper
- (HUAccessoryListenerHelper)initWithListenerAddress:(id)a3 andDelegate:(id)a4;
- (void)addKey:(id)a3;
- (void)dealloc;
@end

@implementation HUAccessoryListenerHelper

- (HUAccessoryListenerHelper)initWithListenerAddress:(id)a3 andDelegate:(id)a4
{
  objc_initWeak(&location, a3);
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)HUAccessoryListenerHelper;
  v7 = [(HUAccessoryListenerHelper *)&v10 init];
  if (v7)
  {
    id v8 = objc_loadWeakRetained(&location);
    objc_storeWeak(&v7->_listenerAddress, v8);

    objc_storeWeak((id *)&v7->_delegate, v6);
  }

  objc_destroyWeak(&location);
  return v7;
}

- (void)addKey:(id)a3
{
  id v4 = a3;
  keys = self->_keys;
  id v8 = v4;
  if (!keys)
  {
    id v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_keys;
    self->_keys = v6;

    id v4 = v8;
    keys = self->_keys;
  }
  [(NSMutableArray *)keys addObject:v4];
}

- (void)dealloc
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v5 = objc_loadWeakRetained(&self->_listenerAddress);
  [WeakRetained registerLoggingBlock:0 withListener:v5];

  id v6 = objc_loadWeakRetained((id *)p_delegate);
  id v7 = objc_loadWeakRetained(&self->_listenerAddress);
  [v6 registerDiscoveryBlock:0 withListener:v7];

  id v8 = objc_loadWeakRetained((id *)p_delegate);
  id v9 = objc_loadWeakRetained(&self->_listenerAddress);
  [v8 registerUpdateBlock:0 forCharacteristicUUIDs:0 withListener:v9];

  id v10 = objc_loadWeakRetained((id *)p_delegate);
  id v11 = objc_loadWeakRetained(&self->_listenerAddress);
  [v10 registerBluetoothStateBlock:0 withListener:v11];

  v12.receiver = self;
  v12.super_class = (Class)HUAccessoryListenerHelper;
  [(HUAccessoryListenerHelper *)&v12 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keys, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_destroyWeak(&self->_listenerAddress);
}

@end