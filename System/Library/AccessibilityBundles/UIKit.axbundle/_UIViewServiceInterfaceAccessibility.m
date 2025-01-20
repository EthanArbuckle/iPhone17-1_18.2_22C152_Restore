@interface _UIViewServiceInterfaceAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_terminateUnconditionallyThen:(id)a3;
@end

@implementation _UIViewServiceInterfaceAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_UIViewServiceInterface";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  v5 = location;
  id obj = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = @"_UIViewServiceInterface";
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:");
  [location[0] validateClass:@"_UIViewServiceInterface" hasInstanceVariable:@"_serviceProcessAssertion" withType:"BKSProcessAssertion"];
  [location[0] validateClass:@"BKSProcessAssertion" hasInstanceVariable:@"_target" withType:"RBSTarget"];
  [location[0] validateClass:@"RBSTarget" hasInstanceVariable:@"_processIdentifier" withType:"RBSProcessIdentifier"];
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"RBSProcessIdentifier", @"pid", "i", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"_UIConcreteRemoteViewService", @"plugin", "@", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, @"_terminateUnconditionallyThen:", "v", "@?", 0);
  objc_storeStrong(v5, obj);
}

- (void)_terminateUnconditionallyThen:(id)a3
{
  v21 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  char v18 = 0;
  objc_opt_class();
  id v11 = (id)[(_UIViewServiceInterfaceAccessibility *)v21 safeValueForKey:@"_serviceProcessAssertion"];
  id v17 = (id)__UIAccessibilityCastAsClass();

  id v16 = v17;
  objc_storeStrong(&v17, 0);
  id v19 = v16;
  id v9 = (id)[v16 safeValueForKey:@"_target"];
  id v8 = (id)[v9 safeValueForKey:@"_processIdentifier"];
  id v7 = (id)[v8 safeValueForKey:@"pid"];
  unsigned int v10 = [v7 longValue];

  unsigned int v15 = v10;
  if (v10)
  {
    id v14 = (id)[(_UIViewServiceInterfaceAccessibility *)v21 safeValueForKeyPath:@"_service.plugin"];
    if ([v14 conformsToProtocol:&unk_26F4BD2C0])
    {
      id v13 = v14;
      if (([v13 active] & 1) == 0)
      {
        v6 = +[_UIRemotePidManagerAccessibility sharedInstance];
        id v5 = (id)objc_msgSend(NSString, "stringWithFormat:", @"%p", v19);
        -[_UIRemotePidManagerAccessibility suspendPid:forAssertionPointer:](v6, "suspendPid:forAssertionPointer:", v15);
      }
      objc_storeStrong(&v13, 0);
    }
    else
    {
      v4 = +[_UIRemotePidManagerAccessibility sharedInstance];
      id v3 = (id)objc_msgSend(NSString, "stringWithFormat:", @"%p", v19);
      -[_UIRemotePidManagerAccessibility suspendPid:forAssertionPointer:](v4, "suspendPid:forAssertionPointer:", v15);
    }
    objc_storeStrong(&v14, 0);
  }
  v12.receiver = v21;
  v12.super_class = (Class)_UIViewServiceInterfaceAccessibility;
  [(_UIViewServiceInterfaceAccessibility *)&v12 _terminateUnconditionallyThen:location[0]];
  objc_storeStrong(&v19, 0);
  objc_storeStrong(location, 0);
}

@end