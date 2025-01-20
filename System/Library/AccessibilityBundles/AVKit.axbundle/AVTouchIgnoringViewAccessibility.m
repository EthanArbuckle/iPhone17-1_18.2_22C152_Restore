@interface AVTouchIgnoringViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)_accessibilityObscuresScreen;
@end

@implementation AVTouchIgnoringViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"AVTouchIgnoringView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_accessibilityObscuresScreen
{
  return 0;
}

@end