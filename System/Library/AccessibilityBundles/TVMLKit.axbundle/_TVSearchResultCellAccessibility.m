@interface _TVSearchResultCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)_accessibilitySupportsSemanticContext;
@end

@implementation _TVSearchResultCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_TVSearchResultCell";
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