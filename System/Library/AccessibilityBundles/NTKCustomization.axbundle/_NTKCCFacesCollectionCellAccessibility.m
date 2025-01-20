@interface _NTKCCFacesCollectionCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)_accessibilityRoleDescription;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unsigned)_accessibilityMediaAnalysisOptions;
@end

@implementation _NTKCCFacesCollectionCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_NTKCCFacesCollectionCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_NTKCCFacesCollectionCell", @"active", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_NTKCCFacesCollectionCell", @"faceView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NTKFaceView", @"delegate", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NTKFaceViewController", @"face", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_NTKCCFacesCollectionCell", @"name", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  unsigned int v3 = [(_NTKCCFacesCollectionCellAccessibility *)self safeBoolForKey:@"active"];
  objc_opt_class();
  v4 = [(_NTKCCFacesCollectionCellAccessibility *)self safeValueForKey:@"name"];
  v5 = __UIAccessibilityCastAsClass();

  objc_opt_class();
  v6 = [(_NTKCCFacesCollectionCellAccessibility *)self safeValueForKey:@"faceView"];
  v7 = [v6 safeValueForKey:@"delegate"];
  v8 = [v7 safeValueForKey:@"face"];
  v9 = __UIAccessibilityCastAsSafeCategory();

  v10 = [v9 _accessibilityFaceEditOptionsDescription];
  v11 = __UIAXStringForVariables();

  if (v3)
  {
    v14 = accessibilityLocalizedCustomizationString(@"myfaces.face.is.active");
    __UIAXStringForVariables();
    id v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v12 = v11;
  }

  return v12;
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  if (-[_NTKCCFacesCollectionCellAccessibility pointInside:withEvent:](self, "pointInside:withEvent:", v7, x, y))
  {
    v8 = self;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)_NTKCCFacesCollectionCellAccessibility;
    -[_NTKCCFacesCollectionCellAccessibility _accessibilityHitTest:withEvent:](&v11, "_accessibilityHitTest:withEvent:", v7, x, y);
    v8 = (_NTKCCFacesCollectionCellAccessibility *)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;

  return v9;
}

- (id)accessibilityValue
{
  v2 = [(_NTKCCFacesCollectionCellAccessibility *)self safeValueForKey:@"faceView"];
  unsigned int v3 = [v2 safeValueForKey:@"delegate"];
  v4 = [v3 safeValueForKey:@"face"];

  v5 = AXNTKFaceComplicationOverviewDescription(v4);

  return v5;
}

- (id)_accessibilityRoleDescription
{
  unsigned int v3 = [(_NTKCCFacesCollectionCellAccessibility *)self _accessibilityAncestorIsKindOf:objc_opt_class()];
  [v3 numberOfItemsInSection:0];
  v4 = [v3 indexPathForCell:self];
  [v4 item];

  v5 = accessibilityLocalizedCustomizationString(@"watch.face.role");
  v6 = accessibilityLocalizedCustomizationString(@"watch.x.of.x");
  id v7 = AXFormatInteger();
  v8 = AXFormatInteger();
  objc_super v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v6, v7, v8);
  v9 = __UIAXStringForVariables();

  return v9;
}

- (id)accessibilityHint
{
  return (id)accessibilityLocalizedCustomizationString(@"myfaces.face.hint");
}

- (unsigned)_accessibilityMediaAnalysisOptions
{
  return 0;
}

@end