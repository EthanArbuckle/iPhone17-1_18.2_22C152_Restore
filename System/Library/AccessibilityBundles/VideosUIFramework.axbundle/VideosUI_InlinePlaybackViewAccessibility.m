@interface VideosUI_InlinePlaybackViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation VideosUI_InlinePlaybackViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"VideosUI.InlinePlaybackView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"VideosUI.InlinePlaybackView" hasProperty:@"accessibilityPlaybackView" withType:"@"];
  [v3 validateClass:@"VideosUI.InlinePlaybackView" hasProperty:@"accessibilityImageView" withType:"@"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  id v3 = [(VideosUI_InlinePlaybackViewAccessibility *)self safeValueForKey:@"accessibilityPlaybackView"];
  v4 = [v3 accessibilityLabel];
  v5 = [(VideosUI_InlinePlaybackViewAccessibility *)self safeValueForKey:@"accessibilityImageView"];
  v8 = [v5 accessibilityLabel];
  v6 = __UIAXStringForVariables();

  return v6;
}

@end