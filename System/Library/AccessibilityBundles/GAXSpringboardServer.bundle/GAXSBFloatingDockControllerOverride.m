@interface GAXSBFloatingDockControllerOverride
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_canPresentFloatingDock;
- (void)handlePresentFloatingDockHoverGesture:(id)a3;
@end

@implementation GAXSBFloatingDockControllerOverride

+ (id)safeCategoryTargetClassName
{
  return @"SBFloatingDockController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBFloatingDockController", @"_canPresentFloatingDock", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBFloatingDockController", @"handlePresentFloatingDockHoverGesture:", "v", "@", 0);
}

- (BOOL)_canPresentFloatingDock
{
  id v3 = +[GAXSpringboard sharedInstance];
  if ([v3 isActive])
  {
    BOOL v4 = 0;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)GAXSBFloatingDockControllerOverride;
    BOOL v4 = [(GAXSBFloatingDockControllerOverride *)&v6 _canPresentFloatingDock];
  }

  return v4;
}

- (void)handlePresentFloatingDockHoverGesture:(id)a3
{
  id v4 = a3;
  v5 = +[GAXSpringboard sharedInstance];
  if ([v5 isActive])
  {
  }
  else
  {
    objc_super v6 = +[GAXSpringboard sharedInstance];
    unsigned __int8 v7 = [v6 isInWorkspace];

    if ((v7 & 1) == 0)
    {
      v8.receiver = self;
      v8.super_class = (Class)GAXSBFloatingDockControllerOverride;
      [(GAXSBFloatingDockControllerOverride *)&v8 handlePresentFloatingDockHoverGesture:v4];
    }
  }
}

@end