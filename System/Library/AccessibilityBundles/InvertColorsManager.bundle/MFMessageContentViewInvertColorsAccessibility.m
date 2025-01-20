@interface MFMessageContentViewInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)accessibilityAppliesInvertColorsInDarkUI;
@end

@implementation MFMessageContentViewInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MFMessageContentView";
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