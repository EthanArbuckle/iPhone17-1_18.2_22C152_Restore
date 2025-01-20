@interface SafariApplicationInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)_accessibilityInvertColorAdditionalVisitors;
@end

@implementation SafariApplicationInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"Application";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_accessibilityInvertColorAdditionalVisitors
{
  return [(SafariApplicationInvertColorsAccessibility *)self safeArrayForKey:@"browserControllers"];
}

@end