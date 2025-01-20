@interface MKPlacePhotosViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_axPhotoViews;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axAnnotateImageViews;
- (void)_axAnnotateViews;
- (void)_createImageViews;
@end

@implementation MKPlacePhotosViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MKPlacePhotosViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"MKPlacePhotosViewController" isKindOfClass:@"UIViewController"];
  [v3 validateClass:@"MKPlacePhotosViewController" hasInstanceVariable:@"_mapItem" withType:"MKMapItem"];
  [v3 validateClass:@"MKPlacePhotosViewController" hasInstanceVariable:@"_externalView" withType:"UIView"];
  [v3 validateClass:@"MKPlacePhotosViewController" hasInstanceVariable:@"_photoViews" withType:"NSArray"];
  [v3 validateClass:@"MKPlacePhotosViewController" hasInstanceVariable:@"_photosContainer" withType:"UIView"];
  [v3 validateClass:@"MKPlacePhotosViewController" hasInstanceVariable:@"_previousPageButton" withType:"UIButton"];
  [v3 validateClass:@"MKPlacePhotosViewController" hasInstanceVariable:@"_nextPageButton" withType:"UIButton"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MKPlacePhotosViewController", @"_createImageViews", "v", 0);
  [v3 validateClass:@"MKPlacePhotosViewController" hasInstanceVariable:@"_canUseFullscreenViewer" withType:"B"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MKMapItem", @"_photosAttribution", "@", 0);
  [v3 validateClass:@"_MKMapItemPhotosAttribution" isKindOfClass:@"_MKMapItemAttribution"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_MKMapItemAttribution", @"providerName", "@", 0);
}

- (id)_axPhotoViews
{
  return (id)[(MKPlacePhotosViewControllerAccessibility *)self safeArrayForKey:@"_photoViews"];
}

- (void)_axAnnotateViews
{
  objc_opt_class();
  id v3 = [(MKPlacePhotosViewControllerAccessibility *)self safeValueForKey:@"_previousPageButton"];
  v4 = __UIAccessibilityCastAsClass();

  objc_opt_class();
  v5 = [(MKPlacePhotosViewControllerAccessibility *)self safeValueForKey:@"_nextPageButton"];
  v6 = __UIAccessibilityCastAsClass();

  v7 = AXMapKitLocString(@"PREVIOUS_PAGE");
  [v4 setAccessibilityLabel:v7];

  v8 = AXMapKitLocString(@"NEXT_PAGE");
  [v6 setAccessibilityLabel:v8];
}

- (void)_axAnnotateImageViews
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  char v30 = 0;
  objc_opt_class();
  v25 = self;
  id v3 = [(MKPlacePhotosViewControllerAccessibility *)self safeValueForKey:@"_mapItem"];
  v4 = [v3 safeValueForKey:@"_photosAttribution"];
  v5 = [v4 safeValueForKey:@"providerName"];
  v6 = __UIAccessibilityCastAsClass();

  v23 = v6;
  if ([v6 length])
  {
    v7 = NSString;
    v8 = AXMapKitLocString(@"REVIEW_PHOTO_WITH_PROVIDER_FORMAT");
    v24 = objc_msgSend(v7, "stringWithFormat:", v8, v6, v6);
  }
  else
  {
    v24 = AXMapKitLocString(@"REVIEW_PHOTO");
  }
  v9 = [(MKPlacePhotosViewControllerAccessibility *)v25 _axPhotoViews];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v27;
    uint64_t v13 = *MEMORY[0x263F1CF00];
    uint64_t v14 = *MEMORY[0x263F1CEE8];
    uint64_t v15 = *MEMORY[0x263F1CF10];
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v27 != v12) {
          objc_enumerationMutation(v9);
        }
        v17 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v17 setIsAccessibilityElement:1];
          [v17 setAccessibilityLabel:v24];
          if ([(MKPlacePhotosViewControllerAccessibility *)v25 safeBoolForKey:@"_canUseFullscreenViewer"])uint64_t v18 = v14; {
          else
          }
            uint64_t v18 = v15;
          [v17 setAccessibilityTraits:v18 | v13];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v11);
  }
  id v19 = v9;
  v20 = [(MKPlacePhotosViewControllerAccessibility *)v25 safeValueForKey:@"_externalView"];
  v21 = v19;
  if (v20)
  {
    v21 = (void *)[v19 mutableCopy];
    [v21 insertObject:v20 atIndex:0];
  }
  v22 = [(MKPlacePhotosViewControllerAccessibility *)v25 safeUIViewForKey:@"_photosContainer"];
  [v22 setAccessibilityElements:v21];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v3.receiver = self;
  v3.super_class = (Class)MKPlacePhotosViewControllerAccessibility;
  [(MKPlacePhotosViewControllerAccessibility *)&v3 _accessibilityLoadAccessibilityInformation];
  [(MKPlacePhotosViewControllerAccessibility *)self _axAnnotateImageViews];
  [(MKPlacePhotosViewControllerAccessibility *)self _axAnnotateViews];
}

- (void)_createImageViews
{
  v3.receiver = self;
  v3.super_class = (Class)MKPlacePhotosViewControllerAccessibility;
  [(MKPlacePhotosViewControllerAccessibility *)&v3 _createImageViews];
  [(MKPlacePhotosViewControllerAccessibility *)self _axAnnotateImageViews];
}

@end