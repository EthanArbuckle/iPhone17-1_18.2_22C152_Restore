@interface WeekDayInitialsHeaderViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)accessibilityElementsHidden;
@end

@implementation WeekDayInitialsHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"WeekDayInitialsHeaderView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)accessibilityElementsHidden
{
  return 1;
}

@end