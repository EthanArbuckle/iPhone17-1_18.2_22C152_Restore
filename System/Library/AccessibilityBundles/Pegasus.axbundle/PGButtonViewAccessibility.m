@interface PGButtonViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (id)_accessibilityCustomActions;
@end

@implementation PGButtonViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PGButtonView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_accessibilityCustomActions
{
  return 0;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

@end