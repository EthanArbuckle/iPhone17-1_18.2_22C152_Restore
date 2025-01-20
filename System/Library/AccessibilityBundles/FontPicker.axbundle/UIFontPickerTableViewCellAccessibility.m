@interface UIFontPickerTableViewCellAccessibility
@end

@implementation UIFontPickerTableViewCellAccessibility

id __85___UIFontPickerTableViewCellAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained transform];
  }
  else {
    memset(&t1, 0, sizeof(t1));
  }
  long long v3 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  *(_OWORD *)&v6.a = *MEMORY[0x263F000D0];
  *(_OWORD *)&v6.c = v3;
  *(_OWORD *)&v6.tx = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  CGAffineTransformEqualToTransform(&t1, &v6);

  v4 = UIKitAccessibilityLocalizedString();

  return v4;
}

@end