@interface CCUIBluetoothModule
- (CCUIContentModuleContext)contentModuleContext;
- (id)contentViewControllerForContext:(id)a3;
- (void)setContentModuleContext:(id)a3;
@end

@implementation CCUIBluetoothModule

- (void)setContentModuleContext:(id)a3
{
}

- (id)contentViewControllerForContext:(id)a3
{
  v3 = [(CCUIBluetoothModule *)self contentModuleContext];
  id v4 = [objc_alloc((Class)CCUIBluetoothModuleViewController) initWithContentModuleContext:v3];

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