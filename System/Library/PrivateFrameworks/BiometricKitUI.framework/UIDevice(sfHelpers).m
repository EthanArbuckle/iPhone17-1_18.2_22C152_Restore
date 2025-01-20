@interface UIDevice(sfHelpers)
- (BOOL)bkui_isRTL;
- (uint64_t)bkui_IsInternalInstall;
@end

@implementation UIDevice(sfHelpers)

- (uint64_t)bkui_IsInternalInstall
{
  if (bkui_IsInternalInstall___onceToken != -1) {
    dispatch_once(&bkui_IsInternalInstall___onceToken, &__block_literal_global_10);
  }
  return bkui_IsInternalInstall___internalInstall;
}

- (BOOL)bkui_isRTL
{
  v0 = [MEMORY[0x1E4F42738] sharedApplication];
  BOOL v1 = [v0 userInterfaceLayoutDirection] == 1;

  return v1;
}

@end