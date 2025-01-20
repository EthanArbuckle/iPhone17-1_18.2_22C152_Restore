@interface CKSearchViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)loadView;
- (void)setCollectionViewAXLabelForSearch:(id)a3;
- (void)setSearchText:(id)a3;
@end

@implementation CKSearchViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CKSearchViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"CKSearchViewController" isKindOfClass:@"UIViewController"];
  [v3 validateClass:@"CKSearchViewController" hasProperty:@"collectionView" withType:"@"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKSearchViewController", @"setSearchText:", "v", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v3.receiver = self;
  v3.super_class = (Class)CKSearchViewControllerAccessibility;
  [(CKSearchViewControllerAccessibility *)&v3 _accessibilityLoadAccessibilityInformation];
  [(CKSearchViewControllerAccessibility *)self setCollectionViewAXLabelForSearch:0];
}

- (void)setCollectionViewAXLabelForSearch:(id)a3
{
  id v8 = a3;
  v4 = [(CKSearchViewControllerAccessibility *)self safeValueForKey:@"collectionView"];
  if ([v8 length])
  {
    v5 = NSString;
    v6 = accessibilityLocalizedString(@"group.search.collection");
    v7 = objc_msgSend(v5, "stringWithFormat:", v6, v8);
    [v4 setAccessibilityLabel:v7];
  }
  else
  {
    v6 = accessibilityLocalizedString(@"group.suggestions.collection");
    [v4 setAccessibilityLabel:v6];
  }
}

- (void)loadView
{
  v3.receiver = self;
  v3.super_class = (Class)CKSearchViewControllerAccessibility;
  [(CKSearchViewControllerAccessibility *)&v3 loadView];
  [(CKSearchViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)setSearchText:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CKSearchViewControllerAccessibility;
  id v4 = a3;
  [(CKSearchViewControllerAccessibility *)&v5 setSearchText:v4];
  -[CKSearchViewControllerAccessibility setCollectionViewAXLabelForSearch:](self, "setCollectionViewAXLabelForSearch:", v4, v5.receiver, v5.super_class);
}

@end