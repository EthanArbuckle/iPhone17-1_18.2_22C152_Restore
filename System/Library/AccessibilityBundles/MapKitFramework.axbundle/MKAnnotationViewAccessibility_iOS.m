@interface MKAnnotationViewAccessibility_iOS
+ (Class)safeCategoryBaseClass;
+ (id)_disclosureCalloutButton;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (id)accessibilityLocality;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
@end

@implementation MKAnnotationViewAccessibility_iOS

+ (id)safeCategoryTargetClassName
{
  return @"MKAnnotationView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (id)accessibilityHint
{
  v2 = [(MKAnnotationViewAccessibility_iOS *)self safeValueForKey:@"annotation"];
  NSClassFromString(&cfstr_Fmfsamapannota.isa);
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v4 = 0;
  }
  else
  {
    v4 = AXMapKitLocString(@"MAP_PIN_HINT");
  }

  return v4;
}

- (id)accessibilityLabel
{
  v13.receiver = self;
  v13.super_class = (Class)MKAnnotationViewAccessibility_iOS;
  v3 = [(MKAnnotationViewAccessibility_iOS *)&v13 accessibilityLabel];
  if (!v3)
  {
    v4 = [(MKAnnotationViewAccessibility_iOS *)self annotation];
    if (objc_opt_respondsToSelector())
    {
      v5 = [v4 title];
      v6 = [v5 accessibilityLabel];

      if (v6)
      {
        uint64_t v7 = [v5 accessibilityLabel];

        v5 = (void *)v7;
      }
    }
    else
    {
      v5 = 0;
    }
    if (objc_opt_respondsToSelector())
    {
      v8 = [v4 subtitle];
      v9 = [v8 accessibilityLabel];

      if (v9)
      {
        uint64_t v10 = [v8 accessibilityLabel];

        v8 = (void *)v10;
      }
    }
    else
    {
      v8 = 0;
    }
    v3 = __UIAXStringForVariables();
    if (!objc_msgSend(v3, "length", v8, @"__AXStringForVariablesSentinel"))
    {
      uint64_t v11 = AXMapKitLocString(@"MAP_PIN_TITLE");

      v3 = (void *)v11;
    }
  }

  return v3;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)MKAnnotationViewAccessibility_iOS;
  return *MEMORY[0x263F21B48] | [(MKAnnotationViewAccessibility_iOS *)&v3 accessibilityTraits];
}

- (BOOL)isAccessibilityElement
{
  v2 = [(MKAnnotationViewAccessibility_iOS *)self isAccessibilityUserDefinedElement];
  objc_super v3 = v2;
  if (v2) {
    char v4 = [v2 BOOLValue];
  }
  else {
    char v4 = 1;
  }

  return v4;
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  if ([(MKAnnotationViewAccessibility_iOS *)self isAccessibilityElement]
    && -[MKAnnotationViewAccessibility_iOS pointInside:withEvent:](self, "pointInside:withEvent:", v7, x, y))
  {
    v8 = self;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)MKAnnotationViewAccessibility_iOS;
    -[MKAnnotationViewAccessibility_iOS _accessibilityHitTest:withEvent:](&v11, sel__accessibilityHitTest_withEvent_, v7, x, y);
    v8 = (MKAnnotationViewAccessibility_iOS *)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;

  return v9;
}

- (id)accessibilityValue
{
  v6.receiver = self;
  v6.super_class = (Class)MKAnnotationViewAccessibility_iOS;
  objc_super v3 = [(MKAnnotationViewAccessibility_iOS *)&v6 accessibilityValue];
  if (!v3)
  {
    char v4 = [(MKAnnotationViewAccessibility_iOS *)self annotation];
    objc_super v3 = [v4 _accessibilityValueForKey:@"AccessibilityDeterminedLocation"];
  }

  return v3;
}

- (id)accessibilityLocality
{
  v2 = [(MKAnnotationViewAccessibility_iOS *)self annotation];
  objc_super v3 = [v2 _accessibilityValueForKey:@"AccessibilityDeterminedLocality"];

  return v3;
}

+ (id)_disclosureCalloutButton
{
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___MKAnnotationViewAccessibility_iOS;
  v2 = objc_msgSendSuper2(&v4, sel__disclosureCalloutButton);
  [v2 setAccessibilityIdentifier:@"AccessibilityMoreInfoButtonIdentifier"];

  return v2;
}

@end