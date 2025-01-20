@interface BKUIJindoContainerScrollviewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)accessibilityViewIsModal;
@end

@implementation BKUIJindoContainerScrollviewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"BKUIJindoContainerScrollview";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)accessibilityViewIsModal
{
  return 1;
}

@end