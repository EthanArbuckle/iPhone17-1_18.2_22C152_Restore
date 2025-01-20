@interface ArticlePageViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)viewDidLoad;
@end

@implementation ArticlePageViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"AppStore.ArticlePageViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v5.receiver = self;
  v5.super_class = (Class)ArticlePageViewControllerAccessibility;
  [(ArticlePageViewControllerAccessibility *)&v5 _accessibilityLoadAccessibilityInformation];
  objc_opt_class();
  v3 = [(ArticlePageViewControllerAccessibility *)self safeValueForKey:@"collectionView"];
  v4 = __UIAccessibilityCastAsClass();

  [v4 setAccessibilityIdentifier:@"AXArticlePageViewCollectionView"];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)ArticlePageViewControllerAccessibility;
  [(ArticlePageViewControllerAccessibility *)&v3 viewDidLoad];
  [(ArticlePageViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end