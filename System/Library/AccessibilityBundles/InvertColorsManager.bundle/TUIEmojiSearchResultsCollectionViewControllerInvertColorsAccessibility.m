@interface TUIEmojiSearchResultsCollectionViewControllerInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)_accessibilityLoadInvertColors;
- (void)viewDidLoad;
@end

@implementation TUIEmojiSearchResultsCollectionViewControllerInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TUIEmojiSearchResultsCollectionViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_accessibilityLoadInvertColors
{
  id v2 = [(TUIEmojiSearchResultsCollectionViewControllerInvertColorsAccessibility *)self safeValueForKey:@"collectionView"];
  [v2 setAccessibilityIgnoresInvertColors:1];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)TUIEmojiSearchResultsCollectionViewControllerInvertColorsAccessibility;
  [(TUIEmojiSearchResultsCollectionViewControllerInvertColorsAccessibility *)&v3 viewDidLoad];
  [(TUIEmojiSearchResultsCollectionViewControllerInvertColorsAccessibility *)self _accessibilityLoadInvertColors];
}

@end