@interface SearchHintCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation SearchHintCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MusicApplication.SearchHintCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)SearchHintCellAccessibility;
  return *MEMORY[0x263F1CEE8] | [(SearchHintCellAccessibility *)&v3 accessibilityTraits];
}

- (id)accessibilityLabel
{
  return (id)MEMORY[0x270F80938](self, a2);
}

@end