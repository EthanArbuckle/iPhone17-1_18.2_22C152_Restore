@interface NicknameFieldCollectionViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilitySupportsHandwriting;
- (BOOL)isAccessibilityElement;
- (_NSRange)_accessibilityRangeForLineNumberAndColumn:(id)a3;
- (id)_accessibilityLineNumberAndColumnForPoint:(CGPoint)a3;
- (id)_accessibilitySupplementaryFooterViews;
- (id)_accessibilityTextViewTextOperationResponder;
- (id)accessibilityIdentifier;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)_accessibilityAutomationType;
- (unint64_t)accessibilityTraits;
- (void)_accessibilitySetSelectedTextRange:(_NSRange)a3;
@end

@implementation NicknameFieldCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"GameCenterUI.NicknameFieldCollectionViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"GameCenterUI.NicknameFieldCollectionViewCell", @"accessibilityTextLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UITextField", @"isEditing", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UITextField", @"_clearButton", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)_accessibilityTextViewTextOperationResponder
{
  return (id)[(NicknameFieldCollectionViewCellAccessibility *)self safeValueForKey:@"accessibilityTextLabel"];
}

- (id)accessibilityLabel
{
  v2 = [(NicknameFieldCollectionViewCellAccessibility *)self _accessibilityTextViewTextOperationResponder];
  id v3 = [v2 accessibilityLabel];

  return v3;
}

- (id)accessibilityValue
{
  v2 = [(NicknameFieldCollectionViewCellAccessibility *)self _accessibilityTextViewTextOperationResponder];
  id v3 = [v2 accessibilityValue];

  return v3;
}

- (id)_accessibilityLineNumberAndColumnForPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  v5 = [(NicknameFieldCollectionViewCellAccessibility *)self _accessibilityTextViewTextOperationResponder];
  v6 = objc_msgSend(v5, "_accessibilityLineNumberAndColumnForPoint:", x, y);

  return v6;
}

- (_NSRange)_accessibilityRangeForLineNumberAndColumn:(id)a3
{
  id v4 = a3;
  v5 = [(NicknameFieldCollectionViewCellAccessibility *)self _accessibilityTextViewTextOperationResponder];
  uint64_t v6 = [v5 _accessibilityRangeForLineNumberAndColumn:v4];
  NSUInteger v8 = v7;

  NSUInteger v9 = v6;
  NSUInteger v10 = v8;
  result.length = v10;
  result.location = v9;
  return result;
}

- (void)_accessibilitySetSelectedTextRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v5 = [(NicknameFieldCollectionViewCellAccessibility *)self _accessibilityTextViewTextOperationResponder];
  objc_msgSend(v5, "_accessibilitySetSelectedTextRange:", location, length);
}

- (unint64_t)accessibilityTraits
{
  uint64_t v2 = *MEMORY[0x263F21B60] | *MEMORY[0x263F81408];
  id v3 = [(NicknameFieldCollectionViewCellAccessibility *)self _accessibilityTextViewTextOperationResponder];
  int v4 = [v3 safeBoolForKey:@"isEditing"];

  uint64_t v5 = *MEMORY[0x263F81398];
  if (!v4) {
    uint64_t v5 = 0;
  }
  return v2 | v5;
}

- (BOOL)_accessibilitySupportsHandwriting
{
  unint64_t v3 = [(NicknameFieldCollectionViewCellAccessibility *)self accessibilityTraits];
  if ((*MEMORY[0x263F81398] & ~v3) == 0) {
    return 1;
  }
  v5.receiver = self;
  v5.super_class = (Class)NicknameFieldCollectionViewCellAccessibility;
  return [(NicknameFieldCollectionViewCellAccessibility *)&v5 _accessibilitySupportsHandwriting];
}

- (unint64_t)_accessibilityAutomationType
{
  return 52;
}

- (id)accessibilityIdentifier
{
  return @"Nickname Field";
}

- (id)_accessibilitySupplementaryFooterViews
{
  v8[1] = *MEMORY[0x263EF8340];
  unint64_t v3 = [(NicknameFieldCollectionViewCellAccessibility *)self _accessibilityTextViewTextOperationResponder];
  if ([v3 safeBoolForKey:@"isEditing"])
  {
    int v4 = [v3 safeValueForKey:@"_clearButton"];
    v8[0] = v4;
    objc_super v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:1];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)NicknameFieldCollectionViewCellAccessibility;
    objc_super v5 = [(NicknameFieldCollectionViewCellAccessibility *)&v7 _accessibilitySupplementaryFooterViews];
  }

  return v5;
}

@end