@interface AXCCMotionCuesModule
- (AXCCMotionCuesModule)init;
- (AXCCMotionCuesModuleViewController)contentViewController;
- (void)setContentViewController:(id)a3;
@end

@implementation AXCCMotionCuesModule

- (AXCCMotionCuesModule)init
{
  v7.receiver = self;
  v7.super_class = (Class)AXCCMotionCuesModule;
  v2 = [(AXCCMotionCuesModule *)&v7 init];
  if (v2)
  {
    v3 = [(CCUIMenuModuleViewController *)[AXCCMotionCuesModuleViewController alloc] initWithNibName:0 bundle:0];
    contentViewController = v2->_contentViewController;
    v2->_contentViewController = v3;

    [(AXCCMotionCuesModuleViewController *)v2->_contentViewController setModule:v2];
    v5 = v2;
  }

  return v2;
}

- (AXCCMotionCuesModuleViewController)contentViewController
{
  return self->_contentViewController;
}

- (void)setContentViewController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end