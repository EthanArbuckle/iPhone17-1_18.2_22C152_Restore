@interface ShareButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)accessibilityLabel;
@end

@implementation ShareButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"Measure.ShareButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(@"SHARE_BUTTON");
}

@end