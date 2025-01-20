@interface RPCCVideoSettingsModule
- (RPCCVideoSettingsModule)init;
- (id)backgroundViewControllerForContext:(id)a3;
- (id)contentViewControllerForContext:(id)a3;
- (void)dealloc;
- (void)setContentModuleContext:(id)a3;
- (void)updateBackgroundViewControllerAvailableLabel;
@end

@implementation RPCCVideoSettingsModule

- (RPCCVideoSettingsModule)init
{
  v3.receiver = self;
  v3.super_class = (Class)RPCCVideoSettingsModule;
  return [(RPCCVideoSettingsModule *)&v3 init];
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)RPCCVideoSettingsModule;
  [(RPCCVideoSettingsModule *)&v2 dealloc];
}

- (id)contentViewControllerForContext:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(RPCCVideoSettingsModuleViewController);
  id v6 = [v4 environment];

  [(RPCCVideoSettingsModuleViewController *)v5 setShouldLoadFromSensor:v6 == 0];
  [(RPCCVideoSettingsModuleViewController *)v5 setContentModuleContext:self->_contentModuleContext];
  [(RPCCVideoSettingsModuleViewController *)v5 setDelegate:self];
  objc_storeStrong((id *)&self->_currentContentViewController, v5);

  return v5;
}

- (id)backgroundViewControllerForContext:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(RPCCVideoSettingsModuleBackgroundViewController);
  id v6 = [v4 environment];

  [(RPCCVideoSettingsModuleBackgroundViewController *)v5 setShouldLoadFromSensor:v6 == 0];
  [(RPCCVideoSettingsModuleBackgroundViewController *)v5 setContentModuleContext:self->_contentModuleContext];
  [(RPCCVideoSettingsModuleBackgroundViewController *)v5 setContentViewController:self->_currentContentViewController];
  objc_storeStrong((id *)&self->_backgroundViewController, v5);

  return v5;
}

- (void)setContentModuleContext:(id)a3
{
}

- (void)updateBackgroundViewControllerAvailableLabel
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentModuleContext, 0);
  objc_storeStrong((id *)&self->_backgroundViewController, 0);

  objc_storeStrong((id *)&self->_currentContentViewController, 0);
}

@end