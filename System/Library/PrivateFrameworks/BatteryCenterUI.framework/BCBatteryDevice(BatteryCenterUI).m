@interface BCBatteryDevice(BatteryCenterUI)
+ (double)batteryWidgetGlyphLargestSize;
+ (id)_internalBatteryDeviceGlyphName;
- (__CFString)batteryWidgetGlyphName:()BatteryCenterUI;
- (id)batteryWidgetGlyph;
@end

@implementation BCBatteryDevice(BatteryCenterUI)

+ (double)batteryWidgetGlyphLargestSize
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__BCBatteryDevice_BatteryCenterUI__batteryWidgetGlyphLargestSize__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (batteryWidgetGlyphLargestSize_onceToken[0] != -1) {
    dispatch_once(batteryWidgetGlyphLargestSize_onceToken, block);
  }
  return *(double *)&batteryWidgetGlyphLargestSize___largestBatteryDeviceGlyphSize_0;
}

+ (id)_internalBatteryDeviceGlyphName
{
  v0 = [MEMORY[0x1E4F442D8] _typeOfCurrentDevice];
  v1 = (void *)MEMORY[0x1E4F6F260];
  v2 = [v0 identifier];
  v3 = [v1 symbolForTypeIdentifier:v2 withResolutionStrategy:1 variantOptions:1 error:0];

  v4 = [v3 name];

  return v4;
}

- (__CFString)batteryWidgetGlyphName:()BatteryCenterUI
{
  uint64_t v2 = [a1 vendor];
  uint64_t v3 = [a1 accessoryCategory];
  uint64_t v4 = [a1 transportType];
  if (![a1 isInternal]
    || ([(id)objc_opt_class() _internalBatteryDeviceGlyphName],
        (v5 = (__CFString *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    if (v2 == 2)
    {
      v5 = @"beatslogo";
      goto LABEL_29;
    }
    if (v2 == 1)
    {
      uint64_t v6 = [a1 productIdentifier];
      uint64_t v7 = [a1 parts];
      switch(v4)
      {
        case 2:
          if (v6 == *MEMORY[0x1E4F4F9E8])
          {
            v5 = @"iphone.smartbatterycase.gen1";
            goto LABEL_29;
          }
          if (v6 == *MEMORY[0x1E4F4F9F0])
          {
            v5 = @"iphone.smartbatterycase.gen2";
            goto LABEL_29;
          }
          break;
        case 4:
          if (v6 == *MEMORY[0x1E4F4F9D8])
          {
            v5 = @"magsafe.batterypack.fill";
            goto LABEL_29;
          }
          break;
        case 3:
          uint64_t v8 = (unint64_t)(v7 - 1) >= 4 ? 1 : qword_1DADF83D0[v7 - 1];
          v11 = [MEMORY[0x1E4F442D8] _typeWithBluetoothProductID:v6 vendorID:76];
          v12 = (void *)MEMORY[0x1E4F6F260];
          v13 = [v11 identifier];
          v14 = [v12 symbolForTypeIdentifier:v13 withResolutionStrategy:1 variantOptions:v8 error:0];

          v5 = [v14 name];

          if (v5) {
            goto LABEL_29;
          }
          break;
      }
      uint64_t v9 = v3 - 1;
      if (unint64_t)(v3 - 1) < 0xA && ((0x3F7u >> v9))
      {
        v10 = off_1E6BE0CD0;
        goto LABEL_27;
      }
    }
    else
    {
      uint64_t v9 = v3 - 1;
      if (unint64_t)(v3 - 1) < 0xA && ((0x3B3u >> v9))
      {
        v10 = off_1E6BE0D20;
LABEL_27:
        v5 = v10[v9];
        goto LABEL_29;
      }
    }
    uint64_t v9 = v4 - 2;
    if ((unint64_t)(v4 - 2) < 3)
    {
      v10 = off_1E6BE0D70;
      goto LABEL_27;
    }
    v5 = 0;
  }
LABEL_29:

  return v5;
}

- (id)batteryWidgetGlyph
{
  char v6 = 0;
  v1 = [a1 batteryWidgetGlyphName:&v6];
  uint64_t v2 = (void *)MEMORY[0x1E4FB1818];
  if (v6)
  {
    uint64_t v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v4 = [v2 imageNamed:v1 inBundle:v3];
  }
  else
  {
    uint64_t v4 = [MEMORY[0x1E4FB1818] _systemImageNamed:v1];
  }

  return v4;
}

@end