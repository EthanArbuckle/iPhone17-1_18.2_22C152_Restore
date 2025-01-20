@interface SWTodayRowOrnamentControlAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
@end

@implementation SWTodayRowOrnamentControlAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SWTodayRowOrnamentControl";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

@end