@interface UIScreen(HKAdditions)
+ (BOOL)hk_currentDeviceHas4InchScreen;
+ (BOOL)hk_currentDeviceHas4Point7InchScreen;
+ (BOOL)hk_currentDeviceHas5Point8InchScreen;
+ (BOOL)hk_currentDeviceHasDisplayZoomedEnabled;
+ (uint64_t)_screenHeightSizeClassForCurrentDevice;
@end

@implementation UIScreen(HKAdditions)

+ (BOOL)hk_currentDeviceHas4InchScreen
{
  return [MEMORY[0x1E4FB1BA8] _screenHeightSizeClassForCurrentDevice] == 0;
}

+ (BOOL)hk_currentDeviceHas4Point7InchScreen
{
  return [MEMORY[0x1E4FB1BA8] _screenHeightSizeClassForCurrentDevice] == 1;
}

+ (BOOL)hk_currentDeviceHas5Point8InchScreen
{
  return [MEMORY[0x1E4FB1BA8] _screenHeightSizeClassForCurrentDevice] == 2;
}

+ (BOOL)hk_currentDeviceHasDisplayZoomedEnabled
{
  v2 = [a1 mainScreen];
  [v2 scale];
  double v4 = v3;
  v5 = [a1 mainScreen];
  [v5 nativeScale];
  BOOL v7 = v4 < v6;

  return v7;
}

+ (uint64_t)_screenHeightSizeClassForCurrentDevice
{
  v2 = objc_opt_class();
  double v3 = [a1 mainScreen];
  [v3 nativeBounds];
  double v5 = v4;
  double v6 = [a1 mainScreen];
  [v6 scale];
  uint64_t v8 = [v2 screenHeightSizeClassForHeight:v5 scale:v7];

  return v8;
}

@end