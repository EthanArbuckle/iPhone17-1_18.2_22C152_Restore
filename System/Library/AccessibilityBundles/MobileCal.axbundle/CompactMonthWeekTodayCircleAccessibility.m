@interface CompactMonthWeekTodayCircleAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)accessibilityElementsHidden;
@end

@implementation CompactMonthWeekTodayCircleAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CompactMonthWeekTodayCircle";
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