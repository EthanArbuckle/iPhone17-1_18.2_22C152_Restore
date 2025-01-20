@interface _NTKCGalleryCollectionCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)_axFace;
- (id)accessibilityLabel;
- (id)accessibilityValue;
@end

@implementation _NTKCGalleryCollectionCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_NTKCGalleryCollectionCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"_NTKCGalleryCollectionCell" hasInstanceVariable:@"_nameLabel" withType:"UILabel"];
  [v3 validateClass:@"_NTKCGalleryCollectionCell" hasInstanceVariable:@"_faceContainerView" withType:"NTKCFaceContainerView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NTKCFaceContainerView", @"faceView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NTKFaceViewController", @"face", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NTKFaceViewController", @"faceView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NTKFaceView", @"delegate", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)_axFace
{
  v2 = [(_NTKCGalleryCollectionCellAccessibility *)self safeValueForKey:@"_faceContainerView"];
  id v3 = [v2 safeValueForKey:@"faceView"];

  v4 = [v3 safeValueForKey:@"delegate"];
  v5 = [v4 safeValueForKey:@"face"];

  return v5;
}

- (id)accessibilityValue
{
  v2 = [(_NTKCGalleryCollectionCellAccessibility *)self _axFace];
  id v3 = AXNTKFaceComplicationOverviewDescription(v2);

  return v3;
}

- (id)accessibilityLabel
{
  id v3 = [(_NTKCGalleryCollectionCellAccessibility *)self accessibilityUserDefinedLabel];

  if (v3)
  {
    id v4 = [(_NTKCGalleryCollectionCellAccessibility *)self accessibilityUserDefinedLabel];
  }
  else
  {
    objc_opt_class();
    v5 = [(_NTKCGalleryCollectionCellAccessibility *)self safeValueForKey:@"_nameLabel"];
    v6 = __UIAccessibilityCastAsClass();

    if (v6 && ([v6 isHidden] & 1) == 0)
    {
      v7 = [v6 accessibilityLabel];
      id v4 = [v7 length];

      if (v4)
      {
        v8 = [(_NTKCGalleryCollectionCellAccessibility *)self safeValueForKey:@"_faceContainerView"];
        v9 = [v8 safeValueForKey:@"faceView"];

        v10 = +[UIViewController viewControllerForView:v9];
        v11 = __UIAccessibilitySafeClass();

        objc_opt_class();
        v12 = [v11 safeValueForKey:@"face"];
        v13 = __UIAccessibilityCastAsSafeCategory();

        v14 = [v6 accessibilityLabel];
        v16 = [v13 _accessibilityFaceEditOptionsDescription];
        __UIAXStringForVariables();
        id v4 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      id v4 = 0;
    }
  }

  return v4;
}

@end