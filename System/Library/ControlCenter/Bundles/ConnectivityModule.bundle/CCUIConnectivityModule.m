@interface CCUIConnectivityModule
- (CCUIConnectivityManager)connectivityManager;
- (CCUIConnectivityModule)init;
- (id)contentViewControllerForContext:(id)a3;
- (unint64_t)supportedGridSizeClasses;
- (void)setConnectivityManager:(id)a3;
- (void)setContentModuleContext:(id)a3;
@end

@implementation CCUIConnectivityModule

- (CCUIConnectivityModule)init
{
  v8.receiver = self;
  v8.super_class = (Class)CCUIConnectivityModule;
  v4 = [(CCUIConnectivityModule *)&v8 init];
  if (v4)
  {
    uint64_t v5 = objc_msgSend_sharedInstance(MEMORY[0x263F33C10], v2, v3);
    connectivityManager = v4->_connectivityManager;
    v4->_connectivityManager = (CCUIConnectivityManager *)v5;
  }
  return v4;
}

- (void)setContentModuleContext:(id)a3
{
}

- (id)contentViewControllerForContext:(id)a3
{
  v4 = [CCUIConnectivityModuleViewController alloc];
  v6 = objc_msgSend_initWithContentModuleContext_(v4, v5, (uint64_t)self->_contentModuleContext);

  return v6;
}

- (unint64_t)supportedGridSizeClasses
{
  return 1552;
}

- (CCUIConnectivityManager)connectivityManager
{
  return self->_connectivityManager;
}

- (void)setConnectivityManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectivityManager, 0);

  objc_storeStrong((id *)&self->_contentModuleContext, 0);
}

@end