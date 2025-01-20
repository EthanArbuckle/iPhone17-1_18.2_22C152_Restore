@interface InformationCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
@end

@implementation InformationCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ShelfKitCollectionViews.InformationCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"ShelfKitCollectionViews.InformationCell" isKindOfClass:@"UICollectionViewListCell"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UICollectionViewCell", @"contentConfiguration", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIListContentConfiguration", @"text", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIListContentConfiguration", @"secondaryText", "@", 0);
}

- (id)accessibilityLabel
{
  v2 = [(InformationCellAccessibility *)self safeValueForKey:@"contentConfiguration"];
  id v3 = [v2 safeStringForKey:@"text"];
  v6 = [v2 safeStringForKey:@"secondaryText"];
  v4 = __UIAXStringForVariables();

  return v4;
}

@end