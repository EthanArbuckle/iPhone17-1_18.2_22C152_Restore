@interface ACSportsAthleteStatGroupViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)shouldGroupAccessibilityChildren;
@end

@implementation ACSportsAthleteStatGroupViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ACSportsAthleteStatGroupView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)shouldGroupAccessibilityChildren
{
  return 1;
}

@end