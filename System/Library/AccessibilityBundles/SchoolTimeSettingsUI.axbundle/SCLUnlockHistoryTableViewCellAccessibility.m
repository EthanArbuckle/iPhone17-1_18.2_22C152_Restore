@interface SCLUnlockHistoryTableViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityElements;
@end

@implementation SCLUnlockHistoryTableViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SCLUnlockHistoryTableViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (id)accessibilityElements
{
  v2 = [(SCLUnlockHistoryTableViewCellAccessibility *)self safeValueForKey:@"_historyItemView"];
  v3 = +[NSArray axArrayByIgnoringNilElementsWithCount:](NSArray, "axArrayByIgnoringNilElementsWithCount:", 1, v2);

  return v3;
}

@end