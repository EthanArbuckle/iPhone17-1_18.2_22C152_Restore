@interface PLBatteryUISuggestionHeaderCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (unint64_t)accessibilityTraits;
@end

@implementation PLBatteryUISuggestionHeaderCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PLBatteryUISuggestionHeaderCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CEF8];
}

@end