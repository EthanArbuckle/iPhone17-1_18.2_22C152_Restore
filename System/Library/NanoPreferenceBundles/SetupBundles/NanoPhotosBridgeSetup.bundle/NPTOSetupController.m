@interface NPTOSetupController
- (id)_instantiateViewControllerWithClass:(Class)a3;
- (id)viewController;
- (void)miniFlowStepComplete:(id)a3;
- (void)miniFlowStepComplete:(id)a3 nextControllerClass:(Class)a4;
@end

@implementation NPTOSetupController

- (id)viewController
{
  firstViewController = self->_firstViewController;
  if (!firstViewController)
  {
    v4 = [(NPTOSetupController *)self _instantiateViewControllerWithClass:objc_opt_class()];
    v5 = self->_firstViewController;
    self->_firstViewController = v4;

    firstViewController = self->_firstViewController;
  }

  return firstViewController;
}

- (void)miniFlowStepComplete:(id)a3
{
  id v4 = [(NPTOSetupController *)self delegate];
  [v4 buddyControllerDone:self];
}

- (void)miniFlowStepComplete:(id)a3 nextControllerClass:(Class)a4
{
  id v5 = [(NPTOSetupController *)self _instantiateViewControllerWithClass:a4];
  [(NPTOSetupController *)self pushController:v5 animated:1];
}

- (id)_instantiateViewControllerWithClass:(Class)a3
{
  id v4 = objc_alloc_init(a3);
  if ([v4 conformsToProtocol:&OBJC_PROTOCOL___BPSBuddyController])
  {
    id v5 = v4;
    v6 = [(NPTOSetupController *)self delegate];
    [v5 setDelegate:v6];
  }
  [v4 setMiniFlowDelegate:self];

  return v4;
}

- (void).cxx_destruct
{
}

@end