@interface _UICollectionViewListHeaderFooterAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation _UICollectionViewListHeaderFooterAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_UICollectionViewListHeaderFooter";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  v4 = location;
  id obj = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"_UICollectionViewListHeaderFooter", @"_contentViewConfiguration", "@", 0);
  objc_storeStrong(v4, obj);
}

- (id)accessibilityLabel
{
  v9 = self;
  v8[1] = (id)a2;
  v7.receiver = self;
  v7.super_class = (Class)_UICollectionViewListHeaderFooterAccessibility;
  v8[0] = [(_UICollectionViewListHeaderFooterAccessibility *)&v7 accessibilityLabel];
  if (![v8[0] length])
  {
    id v6 = (id)[(_UICollectionViewListHeaderFooterAccessibility *)v9 safeValueForKey:@"_contentViewConfiguration"];
    id v2 = (id)[v6 accessibilityLabel];
    id v3 = v8[0];
    v8[0] = v2;
  }
  id v5 = v8[0];
  objc_storeStrong(v8, 0);

  return v5;
}

- (BOOL)isAccessibilityElement
{
  id v3 = [(_UICollectionViewListHeaderFooterAccessibility *)self accessibilityLabel];
  BOOL v4 = [v3 length] != 0;

  return v4;
}

- (unint64_t)accessibilityTraits
{
  v8 = self;
  SEL v7 = a2;
  v6.receiver = self;
  v6.super_class = (Class)_UICollectionViewListHeaderFooterAccessibility;
  unint64_t v3 = [(_UICollectionViewListHeaderFooterAccessibility *)&v6 accessibilityTraits];
  id v4 = (id)[(_UICollectionViewListHeaderFooterAccessibility *)v8 safeValueForKey:@"_contentViewConfiguration"];
  unint64_t v5 = v3 | [v4 accessibilityTraits];

  return v5;
}

@end