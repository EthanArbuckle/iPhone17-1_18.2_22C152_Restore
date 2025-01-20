@interface MUPlacePhotoGalleryViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLabelAttributionButton;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)downloadImageForVisibleViews;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation MUPlacePhotoGalleryViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MUPlacePhotoGalleryViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MUPlacePhotoGalleryViewController", @"scrollView", "@", 0);
  [v3 validateClass:@"MUPlacePhotoGalleryViewController" isKindOfClass:@"UIViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MKMapItemPhoto", @"title", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MKMapItemPhoto", @"subtitle", "@", 0);
  [v3 validateClass:@"MUPlacePhotoGalleryViewController" hasInstanceVariable:@"_photoViews" withType:"NSArray"];
  [v3 validateClass:@"MUPlacePhotoGalleryViewController" hasInstanceVariable:@"_photos" withType:"NSArray"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MUPlacePhotoGalleryViewController", @"rapBarButtonView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MUPlacePhotoGalleryViewController", @"currentPhoto", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MKMapItemPhoto", @"attribution", "@", 0);
  [v3 validateClass:@"_MKMapItemPhotosAttribution" isKindOfClass:@"_MKMapItemAttribution"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_MKMapItemAttribution", @"providerName", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MUPlacePhotoGalleryViewController", @"attributionView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MUPlacePhotoGalleryAttributionView", @"accessoryButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MUPlacePhotoGalleryViewController", @"downloadImageForVisibleViews", "v", 0);
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MUPlacePhotoGalleryViewControllerAccessibility;
  [(MUPlacePhotoGalleryViewControllerAccessibility *)&v4 viewWillAppear:a3];
  [(MUPlacePhotoGalleryViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  v37.receiver = self;
  v37.super_class = (Class)MUPlacePhotoGalleryViewControllerAccessibility;
  [(MUPlacePhotoGalleryViewControllerAccessibility *)&v37 _accessibilityLoadAccessibilityInformation];
  v13 = [(MUPlacePhotoGalleryViewControllerAccessibility *)self safeUIViewForKey:@"scrollView"];
  [v13 setIsAccessibilityOpaqueElementProvider:1];
  v17 = [(MUPlacePhotoGalleryViewControllerAccessibility *)self safeArrayForKey:@"_photoViews"];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id obj = [(MUPlacePhotoGalleryViewControllerAccessibility *)self safeArrayForKey:@"_photos"];
  uint64_t v2 = [obj countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v2)
  {
    uint64_t v3 = 0;
    uint64_t v16 = *(void *)v34;
    do
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v34 != v16) {
          objc_enumerationMutation(obj);
        }
        v5 = *(void **)(*((void *)&v33 + 1) + 8 * v4);
        uint64_t v27 = 0;
        v28 = &v27;
        uint64_t v29 = 0x3032000000;
        v30 = __Block_byref_object_copy_;
        v31 = __Block_byref_object_dispose_;
        id v32 = 0;
        uint64_t v20 = MEMORY[0x263EF8330];
        uint64_t v21 = 3221225472;
        v22 = __92__MUPlacePhotoGalleryViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
        v23 = &unk_26512EFE0;
        v25 = &v27;
        id v24 = v17;
        uint64_t v26 = v3 + v4;
        AXPerformSafeBlock();
        id v6 = (id)v28[5];

        _Block_object_dispose(&v27, 8);
        v7 = [v5 safeStringForKey:@"title"];
        v8 = [v5 safeStringForKey:@"subtitle"];
        v9 = __UIAXStringForVariables();
        objc_msgSend(v6, "setAccessibilityLabel:", v9, v8, @"__AXStringForVariablesSentinel");

        ++v4;
      }
      while (v2 != v4);
      uint64_t v2 = [obj countByEnumeratingWithState:&v33 objects:v38 count:16];
      v3 += v4;
    }
    while (v2);
  }

  v10 = [(MUPlacePhotoGalleryViewControllerAccessibility *)self safeValueForKey:@"rapBarButtonView"];
  v11 = accessibilityLocalizedString(@"REPORT_A_PROBLEM");
  [v10 setAccessibilityLabel:v11];

  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __92__MUPlacePhotoGalleryViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2;
  v18[3] = &unk_26512F008;
  id v19 = v10;
  id v12 = v10;
  [v12 _setAccessibilityValueBlock:v18];
  [(MUPlacePhotoGalleryViewControllerAccessibility *)self _accessibilityLabelAttributionButton];
}

uint64_t __92__MUPlacePhotoGalleryViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) objectAtIndexedSubscript:*(void *)(a1 + 48)];

  return MEMORY[0x270F9A758]();
}

id __92__MUPlacePhotoGalleryViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2()
{
  objc_opt_class();
  v0 = __UIAccessibilityCastAsClass();
  v1 = [v0 customView];

  if (v1)
  {
    uint64_t v2 = accessibilityLocalizedString(@"REPORT_A_PROBLEM_LOADING");
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

- (void)downloadImageForVisibleViews
{
  v3.receiver = self;
  v3.super_class = (Class)MUPlacePhotoGalleryViewControllerAccessibility;
  [(MUPlacePhotoGalleryViewControllerAccessibility *)&v3 downloadImageForVisibleViews];
  [(MUPlacePhotoGalleryViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)_accessibilityLabelAttributionButton
{
  objc_super v3 = [(MUPlacePhotoGalleryViewControllerAccessibility *)self safeValueForKey:@"currentPhoto"];
  uint64_t v4 = [v3 safeValueForKey:@"attribution"];
  id v7 = [v4 safeStringForKey:@"providerName"];

  v5 = [(MUPlacePhotoGalleryViewControllerAccessibility *)self safeUIViewForKey:@"attributionView"];
  id v6 = [v5 safeUIViewForKey:@"accessoryButton"];
  [v6 setAccessibilityLabel:v7];
}

@end