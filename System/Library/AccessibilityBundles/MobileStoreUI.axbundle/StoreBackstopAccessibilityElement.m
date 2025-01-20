@interface StoreBackstopAccessibilityElement
- (BOOL)accessibilityActivate;
- (CGRect)accessibilityFrame;
@end

@implementation StoreBackstopAccessibilityElement

- (CGRect)accessibilityFrame
{
  v2 = [(StoreBackstopAccessibilityElement *)self accessibilityContainer];
  [v2 accessibilityFrame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (BOOL)accessibilityActivate
{
  v2 = (void *)MEMORY[0x263F1CB68];
  double v3 = [(StoreBackstopAccessibilityElement *)self accessibilityContainer];
  double v4 = [v2 viewControllerForView:v3];
  double v5 = __UIAccessibilitySafeClass();

  LOBYTE(v3) = [v5 accessibilityPerformEscape];
  return (char)v3;
}

@end