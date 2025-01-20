@interface SBHLibraryPodCategoryIconAccessibility
+ (BOOL)_isSerializableAccessibilityElement;
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)automationElements;
@end

@implementation SBHLibraryPodCategoryIconAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBHLibraryPodCategoryIcon";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBHLibraryPodCategoryIcon", @"category", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBHLibraryCategory", @"compactPodFolder", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBFolder", @"icons", "@", 0);
  [v3 validateClass:@"SBHLibraryCategoryFolder" isKindOfClass:@"SBFolder"];
}

- (id)automationElements
{
  v2 = [(SBHLibraryPodCategoryIconAccessibility *)self safeValueForKey:@"category"];
  id v3 = [v2 safeValueForKey:@"compactPodFolder"];
  v4 = [v3 safeArrayForKey:@"icons"];

  return v4;
}

+ (BOOL)_isSerializableAccessibilityElement
{
  return 1;
}

@end