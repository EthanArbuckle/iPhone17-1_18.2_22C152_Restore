@interface _AFDeviceContextServiceDelegateProxy
- (_AFDeviceContextServiceDelegateProxy)initWithConnection:(id)a3;
- (void)updateLocalDeviceContext:(id)a3;
@end

@implementation _AFDeviceContextServiceDelegateProxy

- (void).cxx_destruct
{
}

- (void)updateLocalDeviceContext:(id)a3
{
  p_connection = &self->_connection;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_connection);
  [WeakRetained _updateLocalDeviceContext:v4];
}

- (_AFDeviceContextServiceDelegateProxy)initWithConnection:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_AFDeviceContextServiceDelegateProxy;
  v5 = [(_AFDeviceContextServiceDelegateProxy *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_connection, v4);
  }

  return v6;
}

@end