@interface CKLocationAttachmentItemAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)accessibilityLabel;
@end

@implementation CKLocationAttachmentItemAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CKLocationAttachmentItem";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(@"map.attachment");
}

@end