@interface CKVideoCancelActionMenuItemAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)accessibilityLabel;
@end

@implementation CKVideoCancelActionMenuItemAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CKVideoCancelActionMenuItem";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(@"cancel.button");
}

@end