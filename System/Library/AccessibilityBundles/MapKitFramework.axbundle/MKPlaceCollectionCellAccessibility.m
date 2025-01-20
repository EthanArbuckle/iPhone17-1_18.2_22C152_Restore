@interface MKPlaceCollectionCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
- (unsigned)_accessibilityMediaAnalysisOptions;
@end

@implementation MKPlaceCollectionCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MKPlaceCollectionCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MKPlaceCollectionCell", @"collectionLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MKPlaceCollectionCell", @"savedView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MKPlaceCollectionCell", @"savedCollectionLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MKPlaceCollectionCell", @"item", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MKPlaceCollectionViewModel", @"placeCollection", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  id v3 = [(MKPlaceCollectionCellAccessibility *)self safeValueForKey:@"item"];
  v4 = [v3 safeValueForKey:@"placeCollection"];
  v5 = AXPublisherDescriptionForCollection(v4);

  v6 = [(MKPlaceCollectionCellAccessibility *)self safeValueForKey:@"collectionLabel"];
  v7 = [v6 accessibilityLabel];

  v8 = [(MKPlaceCollectionCellAccessibility *)self safeUIViewForKey:@"savedView"];
  if ([v8 isHidden])
  {
    v9 = 0;
  }
  else
  {
    v10 = [(MKPlaceCollectionCellAccessibility *)self safeValueForKey:@"savedCollectionLabel"];
    v9 = [v10 accessibilityLabel];
  }
  v11 = __UIAXStringForVariables();

  return v11;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CF00] | *MEMORY[0x263F1CEE8];
}

- (unsigned)_accessibilityMediaAnalysisOptions
{
  return 0;
}

@end