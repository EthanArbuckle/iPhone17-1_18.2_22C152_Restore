@interface HistoryViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)accessibilityViewIsModal;
@end

@implementation HistoryViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"Measure.HistoryView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)accessibilityViewIsModal
{
  return 1;
}

@end