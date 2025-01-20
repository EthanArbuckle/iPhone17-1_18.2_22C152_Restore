@interface _MKPlaceInlineMapContentViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation _MKPlaceInlineMapContentViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_MKPlaceInlineMapContentView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  v3 = [(_MKPlaceInlineMapContentViewAccessibility *)self accessibilityUserDefinedLabel];

  if (v3) {
    [(_MKPlaceInlineMapContentViewAccessibility *)self accessibilityUserDefinedLabel];
  }
  else {
  v4 = AXMapKitLocString(@"MAP_PLAIN");
  }

  return v4;
}

- (id)accessibilityHint
{
  return AXMapKitLocString(@"MAP_OPEN_HINT");
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)_MKPlaceInlineMapContentViewAccessibility;
  return *MEMORY[0x263F1CEE8] | [(_MKPlaceInlineMapContentViewAccessibility *)&v3 accessibilityTraits];
}

@end