@interface AccountDetailCollectionViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation AccountDetailCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ASMessagesProvider.AccountDetailCollectionViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"AppStoreKitInternal.DynamicTypeLabel"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ASMessagesProvider.AccountDetailCollectionViewCell", @"accessibilityTitleLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ASMessagesProvider.AccountDetailCollectionViewCell", @"accessibilitySubtitleLabel", "@", 0);
  [v3 validateClass:@"ASMessagesProvider.AccountDetailCollectionViewCell" hasSwiftField:@"detailLabel" withSwiftType:"DynamicTypeLabel"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  id v3 = [(AccountDetailCollectionViewCellAccessibility *)self safeValueForKey:@"accessibilityAccessoryView"];
  v4 = [(AccountDetailCollectionViewCellAccessibility *)self safeSwiftValueForKey:@"detailLabel"];
  v5 = [(AccountDetailCollectionViewCellAccessibility *)self _accessibilityStringForLabelKeyValues:@"accessibilityTitleLabel, accessibilitySubtitleLabel"];
  MEMORY[0x24563EC60](@"AppStore.CountBadgeView");
  if (objc_opt_isKindOfClass())
  {
    v8 = [v3 safeValueForKey:@"accessibilityCountLabel"];
    v6 = __UIAXStringForVariables();
  }
  else
  {
    MEMORY[0x24563EC60](@"AppStoreKitInternal.DynamicTypeLabel");
    objc_opt_isKindOfClass();
    v6 = __UIAXStringForVariables();
  }

  return v6;
}

- (unint64_t)accessibilityTraits
{
  v5.receiver = self;
  v5.super_class = (Class)AccountDetailCollectionViewCellAccessibility;
  unint64_t v3 = *MEMORY[0x263F1CEE8] | [(AccountDetailCollectionViewCellAccessibility *)&v5 accessibilityTraits];
  if ([(AccountDetailCollectionViewCellAccessibility *)self safeBoolForKey:@"accessibilityDisabled"])return *MEMORY[0x263F1CF20] | v3; {
  else
  }
    return v3 & ~*MEMORY[0x263F1CF20];
}

@end