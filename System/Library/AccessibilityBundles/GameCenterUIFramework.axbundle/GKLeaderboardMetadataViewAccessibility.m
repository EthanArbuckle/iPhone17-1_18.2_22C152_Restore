@interface GKLeaderboardMetadataViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation GKLeaderboardMetadataViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"GKLeaderboardMetadataView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"GKLeaderboardMetadataView", @"rank", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"GKLeaderboardMetadataView", @"title", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"GKLeaderboardMetadataView", @"footnote", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  objc_opt_class();
  id v3 = [(GKLeaderboardMetadataViewAccessibility *)self safeValueForKey:@"rank"];
  v4 = __UIAccessibilityCastAsClass();

  if ([v4 _accessibilityViewIsVisible]) {
    v5 = @"rank, title, footnote";
  }
  else {
    v5 = @"title, footnote";
  }
  v6 = [(GKLeaderboardMetadataViewAccessibility *)self _accessibilityStringForLabelKeyValues:v5];

  return v6;
}

@end