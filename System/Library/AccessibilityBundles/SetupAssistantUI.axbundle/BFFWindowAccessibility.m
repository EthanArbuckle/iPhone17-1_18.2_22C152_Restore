@interface BFFWindowAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)_accessibilityIsUserInteractionEnabled;
@end

@implementation BFFWindowAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"BFFWindow";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_accessibilityIsUserInteractionEnabled
{
  return 1;
}

@end