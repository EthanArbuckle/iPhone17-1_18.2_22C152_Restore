@interface _TVProductCollectionViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)_accessibilitySupportsSemanticContext;
@end

@implementation _TVProductCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_TVProductCollectionViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_accessibilitySupportsSemanticContext
{
  return 0;
}

@end