@interface BCBatteryDevice
@end

@implementation BCBatteryDevice

void __65__BCBatteryDevice_BatteryCenterUI__batteryWidgetGlyphLargestSize__block_invoke(uint64_t a1)
{
  v1 = (void *)MEMORY[0x1E4FB1818];
  id v6 = [*(id *)(a1 + 32) _internalBatteryDeviceGlyphName];
  v2 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v3 = [v1 imageNamed:v6 inBundle:v2];
  [v3 size];
  batteryWidgetGlyphLargestSize___largestBatteryDeviceGlyphSize_0 = v4;
  batteryWidgetGlyphLargestSize___largestBatteryDeviceGlyphSize_1 = v5;
}

@end