@interface NPHCellularSetupBridgeBuddyUIPrincipalClass
+ (BOOL)controllerNeedsToRun;
- (NPHCellularSetupBridgeBuddyUIPrincipalClass)init;
- (NPHCellularSetupViewController)cellularSetupViewController;
- (void)miniFlowStepComplete:(id)a3;
- (void)setCellularSetupViewController:(id)a3;
@end

@implementation NPHCellularSetupBridgeBuddyUIPrincipalClass

- (NPHCellularSetupBridgeBuddyUIPrincipalClass)init
{
  v6.receiver = self;
  v6.super_class = (Class)NPHCellularSetupBridgeBuddyUIPrincipalClass;
  v2 = [(NPHCellularSetupBridgeBuddyUIPrincipalClass *)&v6 init];
  if (v2)
  {
    id v3 = [objc_alloc((Class)NPHCellularSetupViewController) initWithConfiguration:2];
    [(NPHCellularSetupBridgeBuddyUIPrincipalClass *)v2 setCellularSetupViewController:v3];

    v4 = [(NPHCellularSetupBridgeBuddyUIPrincipalClass *)v2 cellularSetupViewController];
    [v4 setMiniFlowDelegate:v2];
  }
  return v2;
}

+ (BOOL)controllerNeedsToRun
{
  return +[NPHCellularSetupViewController controllerNeedsToRun];
}

- (void)miniFlowStepComplete:(id)a3
{
  id v4 = [(NPHCellularSetupBridgeBuddyUIPrincipalClass *)self delegate];
  [v4 buddyControllerDone:self];
}

- (NPHCellularSetupViewController)cellularSetupViewController
{
  return self->_cellularSetupViewController;
}

- (void)setCellularSetupViewController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end