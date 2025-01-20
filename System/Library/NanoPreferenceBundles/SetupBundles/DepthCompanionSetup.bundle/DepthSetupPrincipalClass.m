@interface DepthSetupPrincipalClass
+ (BOOL)controllerNeedsToRun;
+ (BOOL)skipControllerForExpressMode:(id)a3;
- (DepthSetupFirstController)firstController;
- (DepthSetupPrincipalClass)init;
- (id)viewController;
- (void)miniFlowStepComplete:(id)a3;
- (void)miniFlowStepComplete:(id)a3 nextControllerClass:(Class)a4;
- (void)setFirstController:(id)a3;
@end

@implementation DepthSetupPrincipalClass

- (DepthSetupPrincipalClass)init
{
  v6.receiver = self;
  v6.super_class = (Class)DepthSetupPrincipalClass;
  v2 = [(DepthSetupPrincipalClass *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(DepthSetupFirstController);
    firstController = v2->_firstController;
    v2->_firstController = v3;

    [(DepthSetupFirstController *)v2->_firstController setMiniFlowDelegate:v2];
  }
  return v2;
}

+ (BOOL)controllerNeedsToRun
{
  v2 = +[UIDevice currentDevice];
  unsigned int v3 = objc_msgSend(v2, "sf_isInternalInstall");

  if (v3) {
    BOOL v4 = CFPreferencesGetAppBooleanValue(@"kEnableCharonForTesting", @"com.apple.Bridge", 0) != 0;
  }
  else {
    BOOL v4 = 0;
  }
  v5 = +[NRPairedDeviceRegistry sharedInstance];
  objc_super v6 = +[NRPairedDeviceRegistry activeDeviceSelectorBlock];
  v7 = [v5 getAllDevicesWithArchivedAltAccountDevicesMatching:v6];
  v8 = [v7 firstObject];

  id v9 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"E553D9C1-2587-4142-B286-C556E89F51F3"];
  LOBYTE(v6) = [v8 supportsCapability:v9] | v4;

  return (char)v6;
}

+ (BOOL)skipControllerForExpressMode:(id)a3
{
  return 0;
}

- (id)viewController
{
  return self->_firstController;
}

- (void)miniFlowStepComplete:(id)a3
{
  id v4 = [(DepthSetupPrincipalClass *)self delegate];
  [v4 buddyControllerDone:self];
}

- (void)miniFlowStepComplete:(id)a3 nextControllerClass:(Class)a4
{
  if (a4)
  {
    id v5 = objc_alloc_init(a4);
    [v5 setMiniFlowDelegate:self];
    [(DepthSetupPrincipalClass *)self pushController:v5 animated:1];
  }
  else
  {
    id v5 = [(DepthSetupPrincipalClass *)self delegate];
    [v5 buddyControllerDone:self];
  }
}

- (DepthSetupFirstController)firstController
{
  return self->_firstController;
}

- (void)setFirstController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end