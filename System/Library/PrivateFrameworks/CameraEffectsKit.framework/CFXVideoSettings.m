@interface CFXVideoSettings
+ (BOOL)canDecodeHEVC2160P;
+ (BOOL)screenCanShow2160P;
+ (double)imageScale;
@end

@implementation CFXVideoSettings

+ (BOOL)screenCanShow2160P
{
  if (screenCanShow2160P_onceToken != -1) {
    dispatch_once(&screenCanShow2160P_onceToken, &__block_literal_global_27);
  }
  return screenCanShow2160P_result;
}

void __38__CFXVideoSettings_screenCanShow2160P__block_invoke()
{
  v0 = [MEMORY[0x263F1C920] mainScreen];
  [v0 bounds];
  double v2 = v1;

  v3 = [MEMORY[0x263F1C920] mainScreen];
  [v3 bounds];
  double v5 = v4;

  if (v2 < v5) {
    double v2 = v5;
  }
  v6 = [MEMORY[0x263F1C920] mainScreen];
  [v6 scale];
  double v8 = v2 * v7;

  v9 = [MEMORY[0x263F1C5C0] currentDevice];
  uint64_t v10 = objc_msgSend(v9, "jfx_memorySize");

  BOOL v12 = v8 > 2500.0 && v10 > 1610612736;
  screenCanShow2160P_result = v12;
}

+ (BOOL)canDecodeHEVC2160P
{
  if (canDecodeHEVC2160P_onceToken != -1) {
    dispatch_once(&canDecodeHEVC2160P_onceToken, &__block_literal_global_3);
  }
  return (canDecodeHEVC2160P_result & 1) == 0;
}

uint64_t __38__CFXVideoSettings_canDecodeHEVC2160P__block_invoke()
{
  int v3 = 0;
  size_t v2 = 4;
  uint64_t result = sysctlbyname("hw.cpufamily", &v3, &v2, 0, 0);
  if (v3 == 933271106 || v3 == 747742334) {
    canDecodeHEVC2160P_uint64_t result = 1;
  }
  return result;
}

+ (double)imageScale
{
  if (imageScale_onceToken != -1) {
    dispatch_once(&imageScale_onceToken, &__block_literal_global_6);
  }
  return *(double *)&imageScale_imageScale;
}

void __30__CFXVideoSettings_imageScale__block_invoke()
{
  id v1 = [MEMORY[0x263F1C920] mainScreen];
  [v1 scale];
  imageScale_imageScale = v0;
}

@end