@interface CSLPRFAppViewChoiceCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)accessibilityLabel;
@end

@implementation CSLPRFAppViewChoiceCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CSLPRFAppViewChoiceCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(@"APP_LAYOUT_CHOICES");
}

@end