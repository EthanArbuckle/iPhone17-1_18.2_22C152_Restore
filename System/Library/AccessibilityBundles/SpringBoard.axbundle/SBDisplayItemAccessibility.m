@interface SBDisplayItemAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
@end

@implementation SBDisplayItemAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBDisplayItem";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBDisplayItem", @"bundleIdentifier", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBApplicationController", @"applicationWithBundleIdentifier:", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBApplication", @"displayName", "@", 0);
}

- (id)accessibilityLabel
{
  id v3 = [(SBDisplayItemAccessibility *)self safeStringForKey:@"bundleIdentifier"];
  v4 = [(SBDisplayItemAccessibility *)self _accessibilityValueForKey:@"AXSpokenName"];
  if (!v4)
  {
    v5 = [MEMORY[0x263F01868] applicationProxyForIdentifier:v3];
    v6 = [v5 bundleURL];
    AXSpokenNameLabelForBundleURL();
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      v7 = AXSBApplicationControllerSharedInstance();
      v8 = [v7 applicationWithBundleIdentifier:v3];

      v4 = [v8 safeStringForKey:@"displayName"];
    }
    if (v4) {
      v9 = v4;
    }
    else {
      v9 = &stru_26F7D3690;
    }
    [(SBDisplayItemAccessibility *)self _accessibilitySetRetainedValue:v9 forKey:@"AXSpokenName"];
  }

  return v4;
}

@end