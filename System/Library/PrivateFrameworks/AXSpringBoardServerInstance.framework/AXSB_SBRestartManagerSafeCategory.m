@interface AXSB_SBRestartManagerSafeCategory
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)initializeAndRunStartupTransition:(id)a3;
@end

@implementation AXSB_SBRestartManagerSafeCategory

+ (id)safeCategoryTargetClassName
{
  return @"SBRestartManager";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)initializeAndRunStartupTransition:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __71__AXSB_SBRestartManagerSafeCategory_initializeAndRunStartupTransition___block_invoke;
  v7[3] = &unk_2647F0D88;
  id v8 = v4;
  v6.receiver = self;
  v6.super_class = (Class)AXSB_SBRestartManagerSafeCategory;
  id v5 = v4;
  [(AXSB_SBRestartManagerSafeCategory *)&v6 initializeAndRunStartupTransition:v7];
}

@end