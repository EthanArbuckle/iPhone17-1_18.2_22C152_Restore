@interface CAMZoomButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)accessibilityPath;
@end

@implementation CAMZoomButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CAMZoomButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityPath
{
  [(CAMZoomButtonAccessibility *)self accessibilityFrame];
  v2 = (void *)MEMORY[0x263F1C478];

  return (id)objc_msgSend(v2, "bezierPathWithRoundedRect:cornerRadius:");
}

@end