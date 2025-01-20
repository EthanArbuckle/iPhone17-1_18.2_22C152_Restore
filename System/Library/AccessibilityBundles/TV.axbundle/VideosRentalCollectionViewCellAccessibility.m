@interface VideosRentalCollectionViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
@end

@implementation VideosRentalCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"VideosRentalCollectionViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VideosPosterCollectionViewCell", @"artworkView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VideosArtworkView", @"placeholderTitle", "@", 0);
  [v3 validateClass:@"VideosRentalCollectionViewCell" hasProperty:@"titleLabel" withType:"@"];
}

- (id)accessibilityLabel
{
  objc_opt_class();
  id v3 = [(VideosRentalCollectionViewCellAccessibility *)self safeValueForKey:@"titleLabel"];
  v4 = __UIAccessibilityCastAsClass();

  v5 = [(VideosRentalCollectionViewCellAccessibility *)self safeValueForKey:@"artworkView"];
  v6 = [v5 safeValueForKey:@"placeholderTitle"];
  v9 = [v4 accessibilityLabel];
  v7 = __UIAXStringForVariables();

  return v7;
}

@end