@interface CNFaceTimeCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)_accessibilityHitTestReverseOrder;
@end

@implementation CNFaceTimeCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CNFaceTimeCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_accessibilityHitTestReverseOrder
{
  return 1;
}

@end