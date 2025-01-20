@interface STSingleLineDetailTextHeaderViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
@end

@implementation STSingleLineDetailTextHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"STSingleLineDetailTextHeaderView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"STSingleLineDetailTextHeaderView" isKindOfClass:@"STSingleLineHeaderView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"STSingleLineHeaderView", @"titleLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"STSingleLineDetailTextHeaderView", @"detailLabel", "@", 0);
}

- (id)accessibilityLabel
{
  return (id)[(STSingleLineDetailTextHeaderViewAccessibility *)self _accessibilityStringForLabelKeyValues:@"titleLabel, detailLabel"];
}

@end