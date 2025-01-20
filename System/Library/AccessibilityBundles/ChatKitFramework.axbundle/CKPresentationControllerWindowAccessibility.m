@interface CKPresentationControllerWindowAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)accessibilityViewIsModal;
@end

@implementation CKPresentationControllerWindowAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CKPresentationControllerWindow";
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