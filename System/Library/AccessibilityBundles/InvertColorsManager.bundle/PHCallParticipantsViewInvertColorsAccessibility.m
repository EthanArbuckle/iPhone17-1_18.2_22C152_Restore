@interface PHCallParticipantsViewInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)accessibilityIgnoresInvertColors;
@end

@implementation PHCallParticipantsViewInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PHCallParticipantsView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)accessibilityIgnoresInvertColors
{
  return 1;
}

@end