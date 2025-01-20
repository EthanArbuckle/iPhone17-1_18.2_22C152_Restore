@interface HUMosaicCameraCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
@end

@implementation HUMosaicCameraCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HUMosaicCameraCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (id)accessibilityLabel
{
  char v12 = 0;
  objc_opt_class();
  v3 = [(HUMosaicCameraCellAccessibility *)self safeValueForKey:@"item"];
  v4 = __UIAccessibilityCastAsClass();

  v5 = [v4 latestResults];
  v6 = v5;
  if (v5)
  {
    v7 = [v5 objectForKeyedSubscript:*MEMORY[0x263F47A38]];
    v10 = [v6 objectForKeyedSubscript:*MEMORY[0x263F47A10]];
    v8 = __UIAXStringForVariables();
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)HUMosaicCameraCellAccessibility;
    v8 = [(HUMosaicCameraCellAccessibility *)&v11 accessibilityLabel];
  }

  return v8;
}

@end