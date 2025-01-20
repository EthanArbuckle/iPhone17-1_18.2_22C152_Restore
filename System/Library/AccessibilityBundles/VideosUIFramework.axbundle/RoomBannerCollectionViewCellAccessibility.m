@interface RoomBannerCollectionViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)layoutSubviews;
@end

@implementation RoomBannerCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"VideosUI.RoomBannerCollectionViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"VideosUI.RoomBannerCollectionViewCell" hasSwiftField:@"bannerImage" withSwiftType:"Optional<VUIImageView>"];
  [v3 validateClass:@"VUIImageView" hasInstanceVariable:@"_imageView" withType:"UIImageView"];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v5.receiver = self;
  v5.super_class = (Class)RoomBannerCollectionViewCellAccessibility;
  [(RoomBannerCollectionViewCellAccessibility *)&v5 _accessibilityLoadAccessibilityInformation];
  id v3 = [(RoomBannerCollectionViewCellAccessibility *)self safeSwiftValueForKey:@"bannerImage"];
  v4 = [v3 safeValueForKey:@"_imageView"];
  [v4 setAccessibilityTraits:*MEMORY[0x263F1CF00]];
  [v4 _accessibilitySetUserDefinedMediaAnalysisOptions:&unk_26F833950];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)RoomBannerCollectionViewCellAccessibility;
  [(RoomBannerCollectionViewCellAccessibility *)&v3 layoutSubviews];
  [(RoomBannerCollectionViewCellAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end