@interface UINavigationBar(DCI)
+ (BOOL)mf_shouldUseDesktopClassNavigationBarForTraitCollection:()DCI;
+ (uint64_t)mf_canUseDesktopClassNavigationBar;
@end

@implementation UINavigationBar(DCI)

+ (uint64_t)mf_canUseDesktopClassNavigationBar
{
  uint64_t result = _UIBarsDesktopNavigationBarEnabled();
  if (result)
  {
    v1 = (void *)MEMORY[0x1E4FB16C8];
    return objc_msgSend(v1, "mf_isPad");
  }
  return result;
}

+ (BOOL)mf_shouldUseDesktopClassNavigationBarForTraitCollection:()DCI
{
  id v3 = a3;
  if (objc_msgSend(MEMORY[0x1E4FB19D0], "mf_canUseDesktopClassNavigationBar")) {
    BOOL v4 = [v3 horizontalSizeClass] == 2;
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

@end