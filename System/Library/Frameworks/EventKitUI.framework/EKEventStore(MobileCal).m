@interface EKEventStore(MobileCal)
- (id)_uicolorFromString:()MobileCal;
- (id)colorNamesInRainbowOrder;
- (id)defaultCalendarColorsInRainbowOrder;
- (id)localizedStringForSymbolicColorName:()MobileCal;
- (id)stringForColor:()MobileCal;
- (id)symbolicNameForColor:()MobileCal;
- (id)symbolicNameToUIColors;
- (uint64_t)colorForCalendar:()MobileCal;
@end

@implementation EKEventStore(MobileCal)

- (id)colorNamesInRainbowOrder
{
  if (colorNamesInRainbowOrder_onceToken != -1) {
    dispatch_once(&colorNamesInRainbowOrder_onceToken, &__block_literal_global_29);
  }
  v0 = (void *)colorNamesInRainbowOrder___colorNames;

  return v0;
}

- (id)_uicolorFromString:()MobileCal
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = 0;
  int v7 = 0;
  sscanf((const char *)[a3 UTF8String], "#%02X%02X%02X", (char *)&v8 + 4, &v8, &v7);
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  *(float64x2_t *)components = vcvtq_f64_f32(vdiv_f32(vcvt_f32_s32((int32x2_t)__PAIR64__(v8, HIDWORD(v8))), (float32x2_t)vdup_n_s32(0x437F0000u)));
  double v10 = (float)((float)v7 / 255.0);
  uint64_t v11 = 0x3FF0000000000000;
  CGColorRef v4 = CGColorCreate(DeviceRGB, components);
  v5 = [MEMORY[0x1E4FB1618] colorWithCGColor:v4];
  CFRelease(DeviceRGB);
  CFRelease(v4);

  return v5;
}

- (id)symbolicNameToUIColors
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__EKEventStore_MobileCal__symbolicNameToUIColors__block_invoke;
  block[3] = &unk_1E6087570;
  block[4] = a1;
  if (symbolicNameToUIColors_onceToken != -1) {
    dispatch_once(&symbolicNameToUIColors_onceToken, block);
  }
  return (id)symbolicNameToUIColors___symbolicColorMapping;
}

- (id)defaultCalendarColorsInRainbowOrder
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__EKEventStore_MobileCal__defaultCalendarColorsInRainbowOrder__block_invoke;
  block[3] = &unk_1E6087570;
  block[4] = a1;
  if (defaultCalendarColorsInRainbowOrder_onceToken != -1) {
    dispatch_once(&defaultCalendarColorsInRainbowOrder_onceToken, block);
  }
  return (id)defaultCalendarColorsInRainbowOrder___orderedUIColors;
}

- (uint64_t)colorForCalendar:()MobileCal
{
  return [a3 uiColor];
}

- (id)localizedStringForSymbolicColorName:()MobileCal
{
  id v3 = a3;
  if (localizedStringForSymbolicColorName__onceToken != -1) {
    dispatch_once(&localizedStringForSymbolicColorName__onceToken, &__block_literal_global_35);
  }
  CGColorRef v4 = [(id)localizedStringForSymbolicColorName____localizedStringMapping objectForKeyedSubscript:v3];
  if (v4)
  {
    v5 = [(id)localizedStringForSymbolicColorName____localizedStringMapping objectForKeyedSubscript:v3];
  }
  else
  {
    v6 = EventKitUIBundle();
    v5 = [v6 localizedStringForKey:@"Custom" value:&stru_1F0CC2140 table:0];
  }

  return v5;
}

- (id)stringForColor:()MobileCal
{
  v2 = objc_msgSend(a1, "symbolicNameForColor:");
  id v3 = [a1 localizedStringForSymbolicColorName:v2];

  return v3;
}

- (id)symbolicNameForColor:()MobileCal
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  id v17 = 0;
  v5 = [a1 symbolicNameToUIColors];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __48__EKEventStore_MobileCal__symbolicNameForColor___block_invoke;
  v9[3] = &unk_1E6087F08;
  id v6 = v4;
  id v10 = v6;
  uint64_t v11 = &v12;
  [v5 enumerateKeysAndObjectsUsingBlock:v9];

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

@end