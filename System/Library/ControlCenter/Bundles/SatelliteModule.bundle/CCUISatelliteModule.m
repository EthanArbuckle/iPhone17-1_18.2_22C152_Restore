@interface CCUISatelliteModule
- (CCUIContentModuleContext)contentModuleContext;
- (id)contentViewControllerForContext:(id)a3;
- (void)setContentModuleContext:(id)a3;
@end

@implementation CCUISatelliteModule

- (void)setContentModuleContext:(id)a3
{
}

- (id)contentViewControllerForContext:(id)a3
{
  v3 = [(CCUISatelliteModule *)self contentModuleContext];
  id v4 = [objc_alloc((Class)CCUISatelliteModuleViewController) initWithContentModuleContext:v3];

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