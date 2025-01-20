@interface CKDetailsChildViewControllerCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityScrollToVisibleWithChild:(id)a3;
@end

@implementation CKDetailsChildViewControllerCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CKDetailsChildViewControllerCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (BOOL)accessibilityScrollToVisibleWithChild:(id)a3
{
  v4 = [a3 _accessibilityParentView];
  NSClassFromString(&cfstr_Ckattachmentce_0.isa);
  char isKindOfClass = objc_opt_isKindOfClass();
  if (isKindOfClass)
  {
    v6 = [(CKDetailsChildViewControllerCellAccessibility *)self _accessibilityScrollParent];
    [v4 accessibilityFrameForScrolling];
    objc_msgSend(v6, "_accessibilityScrollToFrame:forView:", v4);
  }
  return isKindOfClass & 1;
}

@end