@interface ASCompetitionGizmoDetailViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)_accessibilityHitTestShouldFallbackToNearestChild;
@end

@implementation ASCompetitionGizmoDetailViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ASCompetitionGizmoDetailView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_accessibilityHitTestShouldFallbackToNearestChild
{
  return 1;
}

@end