@interface PKRulerViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation PKRulerViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PKRulerView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (id)accessibilityLabel
{
  return accessibilityPencilKitLocalizedString(@"ruler.name");
}

@end