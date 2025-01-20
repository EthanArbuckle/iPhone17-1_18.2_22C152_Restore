@interface AppStoreUIVisualEffectViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityActivate;
- (BOOL)isAccessibilityElement;
- (BOOL)isArticleBackgroundView;
- (id)accessibilityHint;
- (id)accessibilityIdentifier;
- (id)accessibilityLabel;
- (id)accessibilityUserInputLabels;
- (int64_t)accessibilityContainerType;
@end

@implementation AppStoreUIVisualEffectViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIVisualEffectView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"AppStore.ArticlePagePresentationController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UITransitionView", @"delegate", "@", 0);
  [v3 validateClass:@"AppStore.ArticlePagePresentationController" isKindOfClass:@"UIPresentationController"];
}

- (BOOL)isArticleBackgroundView
{
  id v3 = [(AppStoreUIVisualEffectViewAccessibility *)self _accessibilityFindAncestor:&__block_literal_global_1 startWithSelf:0];

  if (!v3) {
    return 0;
  }
  [(AppStoreUIVisualEffectViewAccessibility *)self safeCGRectForKey:@"frame"];
  double v5 = v4;
  double v7 = v6;
  v8 = [MEMORY[0x263F1C920] mainScreen];
  [v8 bounds];
  double v10 = v9;
  double v12 = v11;

  return v7 == v12 && v5 == v10;
}

uint64_t __66__AppStoreUIVisualEffectViewAccessibility_isArticleBackgroundView__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = [v2 safeValueForKey:@"delegate"];
    MEMORY[0x245641130](@"AppStore.ArticlePagePresentationController");
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    char isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

- (BOOL)isAccessibilityElement
{
  if ([(AppStoreUIVisualEffectViewAccessibility *)self isArticleBackgroundView]) {
    return 1;
  }
  v4.receiver = self;
  v4.super_class = (Class)AppStoreUIVisualEffectViewAccessibility;
  return [(AppStoreUIVisualEffectViewAccessibility *)&v4 isAccessibilityElement];
}

- (int64_t)accessibilityContainerType
{
  if ([(AppStoreUIVisualEffectViewAccessibility *)self isArticleBackgroundView]) {
    return 4;
  }
  v4.receiver = self;
  v4.super_class = (Class)AppStoreUIVisualEffectViewAccessibility;
  return [(AppStoreUIVisualEffectViewAccessibility *)&v4 accessibilityContainerType];
}

- (id)accessibilityLabel
{
  if ([(AppStoreUIVisualEffectViewAccessibility *)self isArticleBackgroundView])
  {
    id v3 = accessibilityAppStoreLocalizedString(@"popover.view.dismiss.article");
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)AppStoreUIVisualEffectViewAccessibility;
    id v3 = [(AppStoreUIVisualEffectViewAccessibility *)&v5 accessibilityLabel];
  }

  return v3;
}

- (id)accessibilityIdentifier
{
  if ([(AppStoreUIVisualEffectViewAccessibility *)self isArticleBackgroundView])
  {
    id v3 = @"PopoverDismissArticle";
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)AppStoreUIVisualEffectViewAccessibility;
    id v3 = [(AppStoreUIVisualEffectViewAccessibility *)&v5 accessibilityIdentifier];
  }

  return v3;
}

- (id)accessibilityHint
{
  if ([(AppStoreUIVisualEffectViewAccessibility *)self isArticleBackgroundView])
  {
    id v3 = accessibilityAppStoreLocalizedString(@"popover.view.dismiss.article.hint");
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)AppStoreUIVisualEffectViewAccessibility;
    id v3 = [(AppStoreUIVisualEffectViewAccessibility *)&v5 accessibilityHint];
  }

  return v3;
}

- (id)accessibilityUserInputLabels
{
  id v2 = accessibilityAppStoreLocalizedString(@"popover.view.dismiss.article.user.input");
  id v3 = MEMORY[0x245641140]();

  return v3;
}

- (BOOL)accessibilityActivate
{
  id v2 = [(AppStoreUIVisualEffectViewAccessibility *)self _accessibilityFindAncestor:&__block_literal_global_312 startWithSelf:0];
  objc_opt_class();
  id v3 = [v2 safeValueForKey:@"delegate"];
  objc_super v4 = __UIAccessibilityCastAsClass();

  objc_super v5 = [v4 safeValueForKey:@"presentedViewController"];
  [v5 dismissViewControllerAnimated:1 completion:0];

  return 1;
}

uint64_t __64__AppStoreUIVisualEffectViewAccessibility_accessibilityActivate__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = [v2 safeValueForKey:@"delegate"];
    MEMORY[0x245641130](@"AppStore.ArticlePagePresentationController");
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    char isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

@end