@interface NTKCCLibraryListCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)setFaceView:(id)a3;
@end

@implementation NTKCCLibraryListCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"NTKCCLibraryListCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NTKCCLibraryListCell", @"faceView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NTKCCLibraryListCell", @"setFaceView:", "v", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v4.receiver = self;
  v4.super_class = (Class)NTKCCLibraryListCellAccessibility;
  [(NTKCCLibraryListCellAccessibility *)&v4 _accessibilityLoadAccessibilityInformation];
  id v3 = [(NTKCCLibraryListCellAccessibility *)self safeValueForKey:@"faceView"];
  [v3 setAccessibilityElementsHidden:1];
}

- (id)accessibilityLabel
{
  objc_opt_class();
  v2 = __UIAccessibilityCastAsClass();
  id v3 = [v2 textLabel];
  v6 = [v2 detailTextLabel];
  objc_super v4 = __UIAXStringForVariables();

  return v4;
}

- (void)setFaceView:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NTKCCLibraryListCellAccessibility;
  [(NTKCCLibraryListCellAccessibility *)&v4 setFaceView:a3];
  [(NTKCCLibraryListCellAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end