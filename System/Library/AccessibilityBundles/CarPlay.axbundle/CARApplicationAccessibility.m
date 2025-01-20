@interface CARApplicationAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)_accessibilityIsStarkElement;
@end

@implementation CARApplicationAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CARApplication";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_accessibilityIsStarkElement
{
  return 1;
}

@end