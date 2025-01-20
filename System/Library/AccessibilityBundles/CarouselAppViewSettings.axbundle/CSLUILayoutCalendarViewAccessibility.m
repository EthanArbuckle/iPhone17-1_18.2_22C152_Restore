@interface CSLUILayoutCalendarViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)accessibilityLabel;
@end

@implementation CSLUILayoutCalendarViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CSLUILayoutCalendarView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(@"app.calendar");
}

@end