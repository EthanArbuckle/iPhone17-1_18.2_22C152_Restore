@interface SBHApplicationIconAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
@end

@implementation SBHApplicationIconAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBHApplicationIcon";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"SBHApplicationIcon" isKindOfClass:@"SBIcon"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBHApplicationIcon", @"applicationPlaceholder", "@", 0);
}

- (id)accessibilityLabel
{
  id v3 = [(SBHApplicationIconAccessibility *)self _accessibilityValueForKey:@"AXSpokenName"];
  if (!v3)
  {
    if (AXDoesRequestingClientDeserveAutomation())
    {
      id v3 = 0;
    }
    else
    {
      v4 = (void *)MEMORY[0x263F01868];
      v5 = [(SBHApplicationIconAccessibility *)self _accessibilityBundleIdentifier];
      v6 = [v4 applicationProxyForIdentifier:v5];
      v7 = [v6 bundleURL];
      AXSpokenNameLabelForBundleURL();
      id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();

      if (v3) {
        v8 = v3;
      }
      else {
        v8 = &stru_26F7E8EF8;
      }
      [(SBHApplicationIconAccessibility *)self _accessibilitySetRetainedValue:v8 forKey:@"AXSpokenName"];
    }
  }
  if ([(__CFString *)v3 length])
  {
    v9 = v3;
  }
  else
  {
    v10 = [(SBHApplicationIconAccessibility *)self safeValueForKey:@"applicationPlaceholder"];
    v11 = v10;
    if (v10) {
      [v10 accessibilityLabel];
    }
    else {
    v9 = [(SBHApplicationIconAccessibility *)self safeStringForKey:@"_axIconLabel"];
    }
  }

  return v9;
}

- (id)accessibilityValue
{
  id v3 = [(SBHApplicationIconAccessibility *)self safeValueForKey:@"applicationPlaceholder"];
  v4 = v3;
  if (v3) {
    [v3 accessibilityValue];
  }
  else {
  v5 = [(SBHApplicationIconAccessibility *)self safeStringForKey:@"_axIconValue"];
  }

  return v5;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)SBHApplicationIconAccessibility;
  return *MEMORY[0x263F813A0] | [(SBHApplicationIconAccessibility *)&v3 accessibilityTraits];
}

@end