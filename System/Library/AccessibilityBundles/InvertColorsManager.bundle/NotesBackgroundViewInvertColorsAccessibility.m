@interface NotesBackgroundViewInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)accessibilityAppliesInvertColorsInDarkUI;
@end

@implementation NotesBackgroundViewInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"NotesBackgroundView";
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