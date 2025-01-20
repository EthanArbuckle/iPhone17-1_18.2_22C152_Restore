@interface GAXSpringBoardOverrideHandler
- (void)_initializeOverrides;
- (void)_validateAndInstall;
- (void)dealloc;
- (void)setUp;
@end

@implementation GAXSpringBoardOverrideHandler

- (void)dealloc
{
  [(GAXSpringBoardOverrideHandler *)self tearDown];
  v3.receiver = self;
  v3.super_class = (Class)GAXSpringBoardOverrideHandler;
  [(GAXSpringBoardOverrideHandler *)&v3 dealloc];
}

- (void)setUp
{
}

- (void)_validateAndInstall
{
  objc_super v3 = +[AXValidationManager sharedInstance];
  [v3 performValidations:&stru_28CC0 withPreValidationHandler:&stru_28CE0 postValidationHandler:0 safeCategoryInstallationHandler:&stru_28D20];

  v4 = +[AXBinaryMonitor sharedInstance];
  [v4 addHandler:&stru_28D40 forBundleName:@"ChatKit.servicebundle"];

  v5 = +[AXBinaryMonitor sharedInstance];
  [v5 addHandler:&stru_28DC0 forFramework:@"AssistantServices"];

  v6 = +[AXBinaryMonitor sharedInstance];
  [v6 addHandler:&stru_28E40 forFramework:@"AssistantUI"];

  [(GAXSpringBoardOverrideHandler *)self _initializeOverrides];
}

- (void)_initializeOverrides
{
  objc_opt_class();
  v2 = [(id)AXSafeClassFromString() safeValueForKey:@"sharedInstance"];
  objc_super v3 = __UIAccessibilityCastAsSafeCategory();

  [v3 _gaxInitializeOverride];
}

@end