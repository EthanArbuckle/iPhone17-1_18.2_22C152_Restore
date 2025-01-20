@interface CKAppGrabberCloseButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)accessibilityLabel;
@end

@implementation CKAppGrabberCloseButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CKAppGrabberCloseButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(@"close.button");
}

@end