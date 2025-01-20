@interface ICImageAttachmentViewInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)accessibilityAppliesInvertColorsInDarkUI;
@end

@implementation ICImageAttachmentViewInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ICImageAttachmentView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)accessibilityAppliesInvertColorsInDarkUI
{
  return 1;
}

@end