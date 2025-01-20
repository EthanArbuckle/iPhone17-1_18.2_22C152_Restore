@interface VideosUI_AttributionTextViewUIKitAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation VideosUI_AttributionTextViewUIKitAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"VideosUI.AttributionTextViewUIKit";
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
  v2 = [(VideosUI_AttributionTextViewUIKitAccessibility *)self subviews];
  v3 = objc_msgSend(v2, "ax_mappedArrayUsingBlock:", &__block_literal_global_9);
  v4 = AXLabelForElements();

  return v4;
}

@end