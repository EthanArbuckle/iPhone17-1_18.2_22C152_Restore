@interface CNCardSharedProfileCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
@end

@implementation CNCardSharedProfileCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CNCardSharedProfileCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

@end