@interface SKStoreReviewPresentationWindowAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)accessibilityViewIsModal;
@end

@implementation SKStoreReviewPresentationWindowAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SKStoreReviewPresentationWindow";
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