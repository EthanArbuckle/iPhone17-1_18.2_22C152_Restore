@interface AKAuthorizationScopeDetailTableViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)_accessibilitySupplementaryFooterViews;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation AKAuthorizationScopeDetailTableViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"AKAuthorizationScopeDetailTableViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AKAuthorizationScopeDetailTableViewCell", @"isChecked", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AKAuthorizationScopeDetailTableViewCell", @"scopeLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AKAuthorizationScopeDetailTableViewCell", @"mainLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AKAuthorizationScopeDetailTableViewCell", @"mainDetailLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AKAuthorizationScopeDetailTableViewCell", @"checkmarkStyle", "Q", 0);
  [v3 validateClass:@"AKAuthorizationScopeDetailTableViewCell" isKindOfClass:@"UITableViewCell"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  v7.receiver = self;
  v7.super_class = (Class)AKAuthorizationScopeDetailTableViewCellAccessibility;
  unint64_t v3 = *MEMORY[0x263F1CEE8] | [(AKAuthorizationScopeDetailTableViewCellAccessibility *)&v7 accessibilityTraits];
  int v4 = [(AKAuthorizationScopeDetailTableViewCellAccessibility *)self safeBoolForKey:@"isChecked"];
  uint64_t v5 = *MEMORY[0x263F1CF38];
  if (!v4) {
    uint64_t v5 = 0;
  }
  return v3 | v5;
}

- (id)accessibilityLabel
{
  return (id)[(AKAuthorizationScopeDetailTableViewCellAccessibility *)self _accessibilityStringForLabelKeyValues:@"scopeLabel, mainLabel, mainDetailLabel"];
}

- (id)_accessibilitySupplementaryFooterViews
{
  if ([(AKAuthorizationScopeDetailTableViewCellAccessibility *)self safeUnsignedIntegerForKey:@"checkmarkStyle"])
  {
    v6.receiver = self;
    v6.super_class = (Class)AKAuthorizationScopeDetailTableViewCellAccessibility;
    unint64_t v3 = [(AKAuthorizationScopeDetailTableViewCellAccessibility *)&v6 _accessibilitySupplementaryFooterViews];
  }
  else
  {
    int v4 = [(AKAuthorizationScopeDetailTableViewCellAccessibility *)self safeValueForKey:@"accessoryView"];
    unint64_t v3 = objc_msgSend(MEMORY[0x263EFF8C0], "axArrayByIgnoringNilElementsWithCount:", 1, v4);
  }

  return v3;
}

@end