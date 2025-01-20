@interface NCHitTestTransparentViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)accessibilityViewIsModal;
@end

@implementation NCHitTestTransparentViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"NCHitTestTransparentView";
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