@interface CCUIWiFiModule
- (CCUIContentModuleContext)contentModuleContext;
- (id)contentViewControllerForContext:(id)a3;
- (void)setContentModuleContext:(id)a3;
@end

@implementation CCUIWiFiModule

- (void)setContentModuleContext:(id)a3
{
}

- (id)contentViewControllerForContext:(id)a3
{
  v3 = [(CCUIWiFiModule *)self contentModuleContext];
  id v4 = [objc_alloc((Class)CCUIWiFiModuleViewController) initWithContentModuleContext:v3];

  return v4;
}

- (CCUIContentModuleContext)contentModuleContext
{
  return self->_contentModuleContext;
}

- (void).cxx_destruct
{
}

@end