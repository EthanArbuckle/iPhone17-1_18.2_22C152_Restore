@interface UIImageViewAccessibility__PhotosUI__UIKit
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityIsPHAssetLocallyAvailable;
- (BOOL)_accessibilitySavePhotoLabel:(id)a3;
- (BOOL)_accessibilitySkipImageTraitDescription;
- (BOOL)_accessibilityZoomAtPoint:(CGPoint)a3 zoomIn:(BOOL)a4;
- (BOOL)accessibilityZoomInAtPoint:(CGPoint)a3;
- (BOOL)accessibilityZoomOutAtPoint:(CGPoint)a3;
- (id)_accessibilityElementStoredUserLabel;
- (id)_accessibilityPHAssetLocalIdentifier;
- (id)_accessibilityPhotoDescription;
- (id)_accessibilityPhotoLibraryURL;
- (id)_axPHAsset;
- (id)_liftableSubjectView;
- (id)accessibilityCustomContent;
- (id)accessibilityDragSourceDescriptors;
- (id)accessibilityLabel;
- (id)accessibilityURL;
- (id)accessibilityValue;
- (int64_t)_accessibilitySortPriority;
- (unint64_t)accessibilityTraits;
@end

@implementation UIImageViewAccessibility__PhotosUI__UIKit

+ (id)safeCategoryTargetClassName
{
  return @"UIImageView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUUserTransformView", @"_setEnabledInteractions:", "v", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUUserTransformView", @"setDesiredZoomScale:", "v", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUUserTransformView", @"_performZoomAndScrollChanges:", "v", "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUUserTransformView", @"_scrollView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PHAsset", @"mainFileURL", "@", 0);
  [v3 validateClass:@"PUTilingView"];
  [v3 validateClass:@"VKCImageSubjectHighlightView"];
}

- (id)_axPHAsset
{
  return (id)[(UIImageViewAccessibility__PhotosUI__UIKit *)self _accessibilityValueForKey:@"AXPHImageAsset"];
}

- (BOOL)_accessibilitySkipImageTraitDescription
{
  id v3 = [(UIImageViewAccessibility__PhotosUI__UIKit *)self _axPHAsset];
  if (v3)
  {
    BOOL v4 = 1;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)UIImageViewAccessibility__PhotosUI__UIKit;
    BOOL v4 = [(UIImageViewAccessibility__PhotosUI__UIKit *)&v6 _accessibilitySkipImageTraitDescription];
  }

  return v4;
}

- (BOOL)_accessibilitySavePhotoLabel:(id)a3
{
  id v4 = a3;
  v5 = [(UIImageViewAccessibility__PhotosUI__UIKit *)self _axPHAsset];
  char v6 = [v5 _accessibilitySavePhotoLabel:v4];

  return v6;
}

- (id)_accessibilityElementStoredUserLabel
{
  id v3 = [(UIImageViewAccessibility__PhotosUI__UIKit *)self _axPHAsset];
  id v4 = [v3 safeValueForKey:@"_accessibilityiCloudPhotoLabel"];

  if ([v4 length])
  {
    v5 = v4;
    goto LABEL_11;
  }
  char v6 = [(UIImageViewAccessibility__PhotosUI__UIKit *)self _axPHAsset];
  int v7 = [v6 safeBoolForKey:@"isPhoto"];

  if (v7)
  {
    v8 = [(UIImageViewAccessibility__PhotosUI__UIKit *)self accessibilityURL];
    uint64_t v9 = UIAccessibilityMetadataDescriptionForImage();
  }
  else
  {
    v10 = [(UIImageViewAccessibility__PhotosUI__UIKit *)self _axPHAsset];
    int v11 = [v10 safeBoolForKey:@"isVideo"];

    if (!v11)
    {
      v5 = &stru_26F42F3E0;
      goto LABEL_11;
    }
    v8 = [(UIImageViewAccessibility__PhotosUI__UIKit *)self accessibilityURL];
    uint64_t v9 = UIAccessibilityMetadataDescriptionForVideo();
  }
  v12 = (__CFString *)v9;

  if (v12) {
    v5 = v12;
  }
  else {
    v5 = &stru_26F42F3E0;
  }
LABEL_11:

  return v5;
}

- (id)accessibilityCustomContent
{
  v2 = [(UIImageViewAccessibility__PhotosUI__UIKit *)self _axPHAsset];
  id v3 = [v2 accessibilityCustomContent];

  return v3;
}

- (id)accessibilityLabel
{
  id v3 = [(UIImageViewAccessibility__PhotosUI__UIKit *)self _axPHAsset];
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 accessibilityLabel];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)UIImageViewAccessibility__PhotosUI__UIKit;
    uint64_t v5 = [(UIImageViewAccessibility__PhotosUI__UIKit *)&v8 accessibilityLabel];
  }
  char v6 = (void *)v5;

  return v6;
}

- (unint64_t)accessibilityTraits
{
  v8.receiver = self;
  v8.super_class = (Class)UIImageViewAccessibility__PhotosUI__UIKit;
  unint64_t v3 = [(UIImageViewAccessibility__PhotosUI__UIKit *)&v8 accessibilityTraits];
  id v4 = [(UIImageViewAccessibility__PhotosUI__UIKit *)self _axPHAsset];
  uint64_t v5 = *MEMORY[0x263F21B48];
  if (!v4) {
    uint64_t v5 = 0;
  }
  unint64_t v6 = v5 | v3;

  return v6;
}

- (BOOL)_accessibilityZoomAtPoint:(CGPoint)a3 zoomIn:(BOOL)a4
{
  uint64_t v5 = [(UIImageViewAccessibility__PhotosUI__UIKit *)self _axPHAsset];
  if (v5)
  {
    unint64_t v6 = [(UIImageViewAccessibility__PhotosUI__UIKit *)self _accessibilityAncestorIsKindOf:NSClassFromString(&cfstr_Putilingview.isa)];
    int v7 = [v6 _accessibilityFindDescendant:&__block_literal_global_13];

    id v8 = v7;
    AXPerformSafeBlock();
  }
  return v5 != 0;
}

- (BOOL)accessibilityZoomInAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  BOOL v6 = 1;
  if (!-[UIImageViewAccessibility__PhotosUI__UIKit _accessibilityZoomAtPoint:zoomIn:](self, "_accessibilityZoomAtPoint:zoomIn:", 1))
  {
    v8.receiver = self;
    v8.super_class = (Class)UIImageViewAccessibility__PhotosUI__UIKit;
    return -[UIImageViewAccessibility__PhotosUI__UIKit accessibilityZoomInAtPoint:](&v8, sel_accessibilityZoomInAtPoint_, x, y);
  }
  return v6;
}

- (BOOL)accessibilityZoomOutAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if (-[UIImageViewAccessibility__PhotosUI__UIKit _accessibilityZoomAtPoint:zoomIn:](self, "_accessibilityZoomAtPoint:zoomIn:", 0))
  {
    return 1;
  }
  v7.receiver = self;
  v7.super_class = (Class)UIImageViewAccessibility__PhotosUI__UIKit;
  return -[UIImageViewAccessibility__PhotosUI__UIKit accessibilityZoomInAtPoint:](&v7, sel_accessibilityZoomInAtPoint_, x, y);
}

- (id)accessibilityValue
{
  unint64_t v3 = [(UIImageViewAccessibility__PhotosUI__UIKit *)self _axPHAsset];
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 accessibilityValue];
    BOOL v6 = [(UIImageViewAccessibility__PhotosUI__UIKit *)self _liftableSubjectView];
    uint64_t v9 = [v6 accessibilityLabel];
    objc_super v7 = __AXStringForVariables();
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)UIImageViewAccessibility__PhotosUI__UIKit;
    objc_super v7 = [(UIImageViewAccessibility__PhotosUI__UIKit *)&v10 accessibilityValue];
  }

  return v7;
}

- (id)accessibilityDragSourceDescriptors
{
  unint64_t v3 = [(UIImageViewAccessibility__PhotosUI__UIKit *)self _liftableSubjectView];
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 accessibilityDragSourceDescriptors];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)UIImageViewAccessibility__PhotosUI__UIKit;
    uint64_t v5 = [(UIImageViewAccessibility__PhotosUI__UIKit *)&v8 accessibilityDragSourceDescriptors];
  }
  BOOL v6 = (void *)v5;

  return v6;
}

- (id)_liftableSubjectView
{
  unint64_t v3 = [(UIImageViewAccessibility__PhotosUI__UIKit *)self _axPHAsset];
  if (v3
    && ([(UIImageViewAccessibility__PhotosUI__UIKit *)self _accessibilityViewAncestorIsKindOf:NSClassFromString(&cfstr_Putilingview.isa)], (id v4 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v5 = v4;
    BOOL v6 = [v4 _accessibilityFindSubviewDescendant:&__block_literal_global_372];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)_accessibilityPhotoDescription
{
  unint64_t v3 = [(UIImageViewAccessibility__PhotosUI__UIKit *)self _axPHAsset];
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 _accessibilityPhotoDescription];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)UIImageViewAccessibility__PhotosUI__UIKit;
    uint64_t v5 = [(UIImageViewAccessibility__PhotosUI__UIKit *)&v8 _accessibilityPhotoDescription];
  }
  BOOL v6 = (void *)v5;

  return v6;
}

- (id)accessibilityURL
{
  unint64_t v3 = [(UIImageViewAccessibility__PhotosUI__UIKit *)self _axPHAsset];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v4 = [v3 accessibilityURL];
  }
  else
  {
    if (objc_opt_respondsToSelector())
    {
      char v9 = 0;
      uint64_t v5 = [v3 safeValueForKey:@"mainFileURL"];
      BOOL v6 = __UIAccessibilitySafeClass();

      goto LABEL_7;
    }
    v8.receiver = self;
    v8.super_class = (Class)UIImageViewAccessibility__PhotosUI__UIKit;
    uint64_t v4 = [(UIImageViewAccessibility__PhotosUI__UIKit *)&v8 accessibilityURL];
  }
  BOOL v6 = (void *)v4;
LABEL_7:

  return v6;
}

- (id)_accessibilityPHAssetLocalIdentifier
{
  v2 = [(UIImageViewAccessibility__PhotosUI__UIKit *)self _axPHAsset];
  unint64_t v3 = [v2 _accessibilityPHAssetLocalIdentifier];

  return v3;
}

- (id)_accessibilityPhotoLibraryURL
{
  v2 = [(UIImageViewAccessibility__PhotosUI__UIKit *)self _axPHAsset];
  unint64_t v3 = [v2 _accessibilityPhotoLibraryURL];

  return v3;
}

- (BOOL)_accessibilityIsPHAssetLocallyAvailable
{
  v2 = [(UIImageViewAccessibility__PhotosUI__UIKit *)self _axPHAsset];
  char v3 = [v2 _accessibilityIsPHAssetLocallyAvailable];

  return v3;
}

- (int64_t)_accessibilitySortPriority
{
  char v3 = [(UIImageViewAccessibility__PhotosUI__UIKit *)self _accessibilityAncestorIsKindOf:NSClassFromString(&cfstr_Putilingview.isa)];
  if (v3)
  {
    id v4 = (id)0x8000000000000000;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)UIImageViewAccessibility__PhotosUI__UIKit;
    id v4 = [(UIImageViewAccessibility__PhotosUI__UIKit *)&v6 _accessibilitySortPriority];
  }

  return (int64_t)v4;
}

@end