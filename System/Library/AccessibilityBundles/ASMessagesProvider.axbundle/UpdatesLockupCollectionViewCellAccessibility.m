@interface UpdatesLockupCollectionViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)_accessibilitySupplementaryFooterViews;
- (id)accessibilityCustomContent;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation UpdatesLockupCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ASMessagesProvider.UpdatesLockupCollectionViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ASMessagesProvider.UpdatesLockupCollectionViewCell", @"accessibilitytLockupView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ASMessagesProvider.UpdatesLockupCollectionViewCell", @"accessibilityExpandableTextView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ASMessagesProvider.UpdatesLockupCollectionViewCell", @"accessibilityVersionMetadata", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)[(UpdatesLockupCollectionViewCellAccessibility *)self _accessibilityStringForLabelKeyValues:@"accessibilitytLockupView, accessibilityVersionMetadata"];
}

- (id)accessibilityCustomContent
{
  id v3 = [MEMORY[0x263EFF980] array];
  v4 = [(UpdatesLockupCollectionViewCellAccessibility *)self _accessibilityStringForLabelKeyValues:@"accessibilityExpandableTextView"];
  if ([v4 length])
  {
    v5 = [MEMORY[0x263EFABD0] customContentWithLabel:&stru_26F5E9A18 value:v4];
    [v3 axSafelyAddObject:v5];
  }

  return v3;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)UpdatesLockupCollectionViewCellAccessibility;
  return *MEMORY[0x263F1CEE8] | [(UpdatesLockupCollectionViewCellAccessibility *)&v3 accessibilityTraits];
}

- (id)_accessibilitySupplementaryFooterViews
{
  objc_super v3 = [MEMORY[0x263EFF980] array];
  v4 = [(UpdatesLockupCollectionViewCellAccessibility *)self safeValueForKey:@"accessibilitytLockupView"];
  v5 = [v4 _accessibilitySupplementaryFooterViews];

  if ([v5 count])
  {
    v6 = [v5 objectAtIndexedSubscript:0];
    [v3 axSafelyAddObject:v6];
  }
  v7 = [(UpdatesLockupCollectionViewCellAccessibility *)self safeValueForKey:@"accessibilityExpandableTextView"];
  [v3 axSafelyAddObject:v7];

  return v3;
}

@end