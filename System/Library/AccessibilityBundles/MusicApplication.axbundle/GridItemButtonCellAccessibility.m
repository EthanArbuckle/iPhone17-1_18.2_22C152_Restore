@interface GridItemButtonCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation GridItemButtonCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MusicApplication.GridItemButtonCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicApplication.GridItemButtonCell", @"buttonTitle", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicApplication.GridItemButtonCell", @"buttonSubtitle", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)[(GridItemButtonCellAccessibility *)self _accessibilityStringForLabelKeyValues:@"buttonTitle, buttonSubtitle"];
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)GridItemButtonCellAccessibility;
  return *MEMORY[0x263F1CEE8] | [(GridItemButtonCellAccessibility *)&v3 accessibilityTraits];
}

@end