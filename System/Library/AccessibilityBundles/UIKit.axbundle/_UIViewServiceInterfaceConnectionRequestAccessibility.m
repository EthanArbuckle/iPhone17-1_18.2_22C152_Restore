@interface _UIViewServiceInterfaceConnectionRequestAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_cancelUnconditionallyThen:(id)a3;
- (void)_didConnectToService;
@end

@implementation _UIViewServiceInterfaceConnectionRequestAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_UIViewServiceInterfaceConnectionRequest";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  v6 = location;
  id obj = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = @"_UIViewServiceInterfaceConnectionRequest";
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:");
  [location[0] validateClass:@"BKSProcessAssertion" hasInstanceVariable:@"_target" withType:"RBSTarget"];
  [location[0] validateClass:@"RBSTarget" hasInstanceVariable:@"_processIdentifier" withType:"RBSProcessIdentifier"];
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"RBSProcessIdentifier", @"pid", "i", 0);
  v4 = "v";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, @"_cancelUnconditionallyThen:", "@?", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, @"_didConnectToService", v4, 0);
  objc_storeStrong(v6, obj);
}

- (void)_cancelUnconditionallyThen:(id)a3
{
  v17 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  char v14 = 0;
  objc_opt_class();
  id v9 = (id)[(_UIViewServiceInterfaceConnectionRequestAccessibility *)v17 safeValueForKey:@"_serviceProcessAssertion"];
  id v13 = (id)__UIAccessibilityCastAsClass();

  id v12 = v13;
  objc_storeStrong(&v13, 0);
  id v15 = v12;
  id v7 = (id)[v12 safeValueForKey:@"_target"];
  id v6 = (id)[v7 safeValueForKey:@"_processIdentifier"];
  id v5 = (id)[v6 safeValueForKey:@"pid"];
  unsigned int v8 = [v5 longValue];

  unsigned int v11 = v8;
  if (v8)
  {
    v4 = +[_UIRemotePidManagerAccessibility sharedInstance];
    id v3 = (id)objc_msgSend(NSString, "stringWithFormat:", @"%p", v15);
    -[_UIRemotePidManagerAccessibility suspendPid:forAssertionPointer:](v4, "suspendPid:forAssertionPointer:", v11);
  }
  v10.receiver = v17;
  v10.super_class = (Class)_UIViewServiceInterfaceConnectionRequestAccessibility;
  [(_UIViewServiceInterfaceConnectionRequestAccessibility *)&v10 _cancelUnconditionallyThen:location[0]];
  objc_storeStrong(&v15, 0);
  objc_storeStrong(location, 0);
}

- (void)_didConnectToService
{
  id v15 = self;
  v14[1] = (id)a2;
  char v13 = 0;
  objc_opt_class();
  id v8 = (id)[(_UIViewServiceInterfaceConnectionRequestAccessibility *)v15 safeValueForKey:@"_serviceProcessAssertion"];
  id v12 = (id)__UIAccessibilityCastAsClass();

  id v11 = v12;
  objc_storeStrong(&v12, 0);
  v14[0] = v11;
  id v6 = (id)[v11 safeValueForKey:@"_target"];
  id v5 = (id)[v6 safeValueForKey:@"_processIdentifier"];
  id v4 = (id)[v5 safeValueForKey:@"pid"];
  unsigned int v7 = [v4 longValue];

  unsigned int v10 = v7;
  if (v7)
  {
    id v3 = +[_UIRemotePidManagerAccessibility sharedInstance];
    id v2 = (id)objc_msgSend(NSString, "stringWithFormat:", @"%p", v14[0]);
    -[_UIRemotePidManagerAccessibility unsuspendPid:forAssertionPointer:](v3, "unsuspendPid:forAssertionPointer:", v10);
  }
  v9.receiver = v15;
  v9.super_class = (Class)_UIViewServiceInterfaceConnectionRequestAccessibility;
  [(_UIViewServiceInterfaceConnectionRequestAccessibility *)&v9 _didConnectToService];
  objc_storeStrong(v14, 0);
}

@end