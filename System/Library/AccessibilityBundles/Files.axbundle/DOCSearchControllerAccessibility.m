@interface DOCSearchControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)searchBarTextDidEndEditing:(id)a3;
@end

@implementation DOCSearchControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"Files.DOCSearchController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"Files.DOCSearchController", @"resultCollectionViewController", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"Files.DOCItemCollectionViewController", @"view", "@", 0);
}

- (void)searchBarTextDidEndEditing:(id)a3
{
  id v4 = a3;
  AXPerformSafeBlock();
  objc_opt_class();
  v5 = [(DOCSearchControllerAccessibility *)self safeValueForKey:@"resultCollectionViewController"];
  v6 = __UIAccessibilityCastAsClass();

  v7 = [v6 view];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], v7);
}

id __63__DOCSearchControllerAccessibility_searchBarTextDidEndEditing___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v3.receiver = *(id *)(a1 + 40);
  v3.super_class = (Class)DOCSearchControllerAccessibility;
  return objc_msgSendSuper2(&v3, sel_searchBarTextDidEndEditing_, v1);
}

@end