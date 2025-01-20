@interface SiriUISnippetControllerCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)_accessibilityShouldBeScannedIfAncestorCanScroll;
@end

@implementation SiriUISnippetControllerCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SiriUISnippetControllerCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_accessibilityShouldBeScannedIfAncestorCanScroll
{
  return 1;
}

@end