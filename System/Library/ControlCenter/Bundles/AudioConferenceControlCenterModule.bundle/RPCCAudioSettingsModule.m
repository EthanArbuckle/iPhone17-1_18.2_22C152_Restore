@interface RPCCAudioSettingsModule
- (RPCCAudioSettingsModule)init;
- (id)backgroundViewControllerForContext:(id)a3;
- (id)contentViewControllerForContext:(id)a3;
- (void)dealloc;
- (void)setContentModuleContext:(id)a3;
@end

@implementation RPCCAudioSettingsModule

- (RPCCAudioSettingsModule)init
{
  v3.receiver = self;
  v3.super_class = (Class)RPCCAudioSettingsModule;
  return [(RPCCAudioSettingsModule *)&v3 init];
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)RPCCAudioSettingsModule;
  [(RPCCAudioSettingsModule *)&v2 dealloc];
}

- (id)contentViewControllerForContext:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = _os_feature_enabled_impl();
  v6 = (char *)[v4 environment];
  v7 = &off_28898;
  if (((v6 != (unsigned char *)&dword_0 + 1) & v5) == 0) {
    v7 = &off_28810;
  }
  id v8 = objc_alloc_init(*v7);
  objc_msgSend(v8, "setShouldLoadFromSensor:", objc_msgSend(v4, "environment") != (char *)&dword_0 + 2);
  [v8 setContentModuleContext:self->_contentModuleContext];
  objc_storeStrong((id *)&self->_currentContentViewController, v8);

  return v8;
}

- (id)backgroundViewControllerForContext:(id)a3
{
  id v4 = a3;
  char v5 = _os_feature_enabled_impl();
  if ([v4 environment] == (char *)&dword_0 + 1 || (v5 & 1) == 0)
  {
    v7 = objc_alloc_init(RPCCAudioSettingsModuleBackgroundViewController);
    -[RPCCAudioSettingsModuleBackgroundViewController setShouldLoadFromSensor:](v7, "setShouldLoadFromSensor:", [v4 environment] != (char *)&dword_0 + 2);
    [(RPCCAudioSettingsModuleBackgroundViewController *)v7 setContentModuleContext:self->_contentModuleContext];
    [(RPCCAudioSettingsModuleBackgroundViewController *)v7 setContentViewController:self->_currentContentViewController];
    backgroundViewController = self->_backgroundViewController;
    self->_backgroundViewController = v7;
    v9 = v7;

    v6 = self->_backgroundViewController;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)setContentModuleContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentModuleContext, 0);
  objc_storeStrong((id *)&self->_backgroundViewController, 0);

  objc_storeStrong((id *)&self->_currentContentViewController, 0);
}

@end