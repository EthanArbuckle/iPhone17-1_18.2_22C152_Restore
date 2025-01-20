@interface CollectionViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)_axNonHiddenViewForKey:(id)a3;
- (id)accessibilityElements;
- (id)accessibilityLabel;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation CollectionViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CollectionView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CollectionView", @"editing", "B", 0);
  [v3 validateClass:@"CollectionView" hasInstanceVariable:@"_titleLabel" withType:"UILabel"];
  [v3 validateClass:@"CollectionView" hasInstanceVariable:@"_subtitleLabel" withType:"UILabel"];
  [v3 validateClass:@"CollectionView" hasInstanceVariable:@"_newCollectionLabel" withType:"MapsThemeLabel"];
  [v3 validateClass:@"CollectionView" hasInstanceVariable:@"_imageView" withType:"CollectionImageView"];
  [v3 validateClass:@"CollectionImageView" hasInstanceVariable:@"_editButton" withType:"UIButton"];
  [v3 validateClass:@"CollectionView" hasInstanceVariable:@"_titleTextField" withType:"UITextField"];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v6.receiver = self;
  v6.super_class = (Class)CollectionViewAccessibility;
  [(CollectionViewAccessibility *)&v6 _accessibilityLoadAccessibilityInformation];
  id v3 = [(CollectionViewAccessibility *)self safeValueForKey:@"_imageView"];
  v4 = [v3 safeValueForKey:@"_editButton"];
  v5 = AXMapsLocString(@"EDIT_IMAGE");
  [v4 setAccessibilityLabel:v5];
}

- (BOOL)isAccessibilityElement
{
  return [(CollectionViewAccessibility *)self safeBoolForKey:@"editing"] ^ 1;
}

- (id)_axNonHiddenViewForKey:(id)a3
{
  id v3 = [(CollectionViewAccessibility *)self safeUIViewForKey:a3];
  if ([v3 isHidden]) {
    id v4 = 0;
  }
  else {
    id v4 = v3;
  }

  return v4;
}

- (id)accessibilityLabel
{
  id v3 = (void *)MEMORY[0x263EFF8C0];
  id v4 = [(CollectionViewAccessibility *)self _axNonHiddenViewForKey:@"_titleLabel"];
  v5 = [v4 accessibilityLabel];
  objc_super v6 = [(CollectionViewAccessibility *)self _axNonHiddenViewForKey:@"_subtitleLabel"];
  v7 = [(CollectionViewAccessibility *)self _axNonHiddenViewForKey:@"_newCollectionLabel"];
  v8 = objc_msgSend(v3, "axArrayByIgnoringNilElementsWithCount:", 3, v5, v6, v7);
  v9 = MEMORY[0x245653050]();

  return v9;
}

- (id)accessibilityElements
{
  id v3 = (void *)MEMORY[0x263EFF8C0];
  id v4 = [(CollectionViewAccessibility *)self _axNonHiddenViewForKey:@"_imageView"];
  v5 = [v4 safeValueForKey:@"_editButton"];
  objc_super v6 = [(CollectionViewAccessibility *)self _axNonHiddenViewForKey:@"_titleLabel"];
  v7 = [(CollectionViewAccessibility *)self _axNonHiddenViewForKey:@"_titleTextField"];
  v8 = [(CollectionViewAccessibility *)self _axNonHiddenViewForKey:@"_subtitleLabel"];
  v9 = [(CollectionViewAccessibility *)self _axNonHiddenViewForKey:@"_newCollectionLabel"];
  v10 = objc_msgSend(v3, "axArrayByIgnoringNilElementsWithCount:", 4, v5, v6, v7, v8, v9);

  return v10;
}

@end