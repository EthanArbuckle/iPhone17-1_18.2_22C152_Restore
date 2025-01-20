@interface CKActionMenuViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)accessibilityViewIsModal;
@end

@implementation CKActionMenuViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CKActionMenuView";
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