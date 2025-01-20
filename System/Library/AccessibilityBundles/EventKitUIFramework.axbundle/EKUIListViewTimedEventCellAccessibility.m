@interface EKUIListViewTimedEventCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)accessibilityValue;
@end

@implementation EKUIListViewTimedEventCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"EKUIListViewTimedEventCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityValue
{
  objc_opt_class();
  v2 = __UIAccessibilityCastAsClass();
  v3 = [v2 event];
  if ([v3 status] == 3)
  {
    v4 = accessibilityLocalizedString(@"AX_IS_CANCELED");
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

@end