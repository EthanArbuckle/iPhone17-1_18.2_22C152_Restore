@interface PHVoicemailMessageTableViewCellScrollViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)accessibilityElements;
@end

@implementation PHVoicemailMessageTableViewCellScrollViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PHVoicemailMessageTableViewCellScrollView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityElements
{
  v2 = [(PHVoicemailMessageTableViewCellScrollViewAccessibility *)self subviews];
  v3 = [v2 sortedArrayUsingSelector:sel_accessibilityCompareGeometry_];

  return v3;
}

@end