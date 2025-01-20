@interface TKTokenConfigurationConnectionProxy
- (TKTokenConfigurationConnectionProxy)initWithConnection:(id)a3;
- (void)tokenConfigurationChanged:(id)a3;
@end

@implementation TKTokenConfigurationConnectionProxy

- (TKTokenConfigurationConnectionProxy)initWithConnection:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)TKTokenConfigurationConnectionProxy;
  v5 = [(TKTokenConfigurationConnectionProxy *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_weakConfigurationConnection, v4);
  }

  return v6;
}

- (void)tokenConfigurationChanged:(id)a3
{
  p_weakConfigurationConnection = &self->_weakConfigurationConnection;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_weakConfigurationConnection);
  [WeakRetained tokenConfigurationChanged:v4];
}

- (void).cxx_destruct
{
}

@end