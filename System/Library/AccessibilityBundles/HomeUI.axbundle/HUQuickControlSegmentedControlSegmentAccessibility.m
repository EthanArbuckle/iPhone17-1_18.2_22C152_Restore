@interface HUQuickControlSegmentedControlSegmentAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (_NSRange)accessibilityRowRange;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation HUQuickControlSegmentedControlSegmentAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HUQuickControlSegmentedControlSegment";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (id)accessibilityLabel
{
  return (id)[(HUQuickControlSegmentedControlSegmentAccessibility *)self _accessibilityStringForLabelKeyValues:@"title"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  uint64_t v2 = *MEMORY[0x263F1CEE8];
  int v3 = [(HUQuickControlSegmentedControlSegmentAccessibility *)self safeBoolForKey:@"isSelected"];
  uint64_t v4 = *MEMORY[0x263F1CF38];
  if (!v3) {
    uint64_t v4 = 0;
  }
  return v4 | v2;
}

- (_NSRange)accessibilityRowRange
{
  int v3 = [(HUQuickControlSegmentedControlSegmentAccessibility *)self superview];
  uint64_t v4 = [v3 subviews];

  uint64_t v5 = [v4 indexOfObject:self];
  uint64_t v6 = [v4 count];

  NSUInteger v7 = v5;
  NSUInteger v8 = v6;
  result.length = v8;
  result.location = v7;
  return result;
}

@end