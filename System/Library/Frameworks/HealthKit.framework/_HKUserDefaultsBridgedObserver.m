@interface _HKUserDefaultsBridgedObserver
- (HKObserverBridgeHandle)handle;
- (_HKUserDefaultsBridgedObserver)initWithHandle:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
@end

@implementation _HKUserDefaultsBridgedObserver

- (_HKUserDefaultsBridgedObserver)initWithHandle:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_HKUserDefaultsBridgedObserver;
  v6 = [(_HKUserDefaultsBridgedObserver *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_handle, a3);
  }

  return v7;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = [v12 objectForKeyedSubscript:*MEMORY[0x1E4F284C8]];
  if (v13)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {

      v13 = 0;
    }
  }
  if (![(HKObserverBridgeHandle *)self->_handle notifyObserversOfChangeForKey:v10 newValue:v13])
  {
    v14.receiver = self;
    v14.super_class = (Class)_HKUserDefaultsBridgedObserver;
    [(_HKUserDefaultsBridgedObserver *)&v14 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  }
}

- (HKObserverBridgeHandle)handle
{
  return self->_handle;
}

- (void).cxx_destruct
{
}

@end