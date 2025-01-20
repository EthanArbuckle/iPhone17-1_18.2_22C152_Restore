@interface MKUserLocationAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)accessibilityLocality;
- (void)setLocation:(id)a3;
@end

@implementation MKUserLocationAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MKUserLocation";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLocality
{
  return (id)[(MKUserLocationAccessibility *)self _accessibilityValueForKey:@"AccessibilityDeterminedLocality"];
}

- (void)setLocation:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)MKUserLocationAccessibility;
  [(MKUserLocationAccessibility *)&v7 setLocation:v4];
  if (v4 && UIAccessibilityIsVoiceOverRunning())
  {
    id v5 = objc_alloc_init(MEMORY[0x263F00A40]);
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __43__MKUserLocationAccessibility_setLocation___block_invoke;
    v6[3] = &unk_26512C590;
    v6[4] = self;
    [v5 reverseGeocodeLocation:v4 completionHandler:v6];
  }
}

uint64_t __43__MKUserLocationAccessibility_setLocation___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = v5;
  if (!a3)
  {
    v15 = v5;
    id v5 = (id)[v5 count];
    id v6 = v15;
    if (v5)
    {
      objc_super v7 = [v15 objectAtIndex:0];
      v8 = [v7 name];
      v9 = [v7 thoroughfare];
      v10 = [v7 locality];
      if (v8 && v9)
      {
        if (([v8 hasPrefix:v9] & 1) != 0 || objc_msgSend(v8, "hasSuffix:", v9))
        {
          v13 = v10;
          v14 = @"__AXStringForVariablesSentinel";
        }
        else
        {
          v14 = v10;
          v13 = v9;
        }
        v11 = __UIAXStringForVariables();
        objc_msgSend(*(id *)(a1 + 32), "_accessibilitySetRetainedValue:forKey:", v11, @"AccessibilityDeterminedLocation", v13, v14);
      }
      [*(id *)(a1 + 32) _accessibilitySetRetainedValue:v10 forKey:@"AccessibilityDeterminedLocality"];

      id v6 = v15;
    }
  }

  return MEMORY[0x270F9A758](v5, v6);
}

@end