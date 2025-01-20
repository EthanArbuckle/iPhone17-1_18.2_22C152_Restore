@interface UIClassicWindowAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)_accessibilityWindowVisible;
@end

@implementation UIClassicWindowAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIClassicWindow";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_accessibilityWindowVisible
{
  return ([(UIClassicWindowAccessibility *)self isHidden] ^ 1) & 1;
}

@end