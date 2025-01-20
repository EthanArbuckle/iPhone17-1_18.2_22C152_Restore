@interface UIScene(AVSecondScreenAdditions)
+ (id)avkit_secondScreenScenes;
- (BOOL)avkit_isForeground;
- (uint64_t)avkit_asWindowScene;
- (uint64_t)avkit_resetPreferredModeSwitchRequest;
- (uint64_t)avkit_screenHasWindowsExcludingWindow:()AVSecondScreenAdditions;
- (uint64_t)avkit_screenType;
- (uint64_t)avkit_setPreferredRefreshRate:()AVSecondScreenAdditions HDRMode:;
- (void)_avkit_setPreferredRefreshRate:()AVSecondScreenAdditions HDRMode:overscanCompensation:;
@end

@implementation UIScene(AVSecondScreenAdditions)

- (void)_avkit_setPreferredRefreshRate:()AVSecondScreenAdditions HDRMode:overscanCompensation:
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v0 = _AVLog();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    int v1 = 136315138;
    v2 = "-[UIScene(AVSecondScreenAdditions) _avkit_setPreferredRefreshRate:HDRMode:overscanCompensation:]";
    _os_log_impl(&dword_1B05B7000, v0, OS_LOG_TYPE_DEFAULT, "%s This feature requires a UIWindowScene.", (uint8_t *)&v1, 0xCu);
  }
}

- (uint64_t)avkit_setPreferredRefreshRate:()AVSecondScreenAdditions HDRMode:
{
  return objc_msgSend(a1, "_avkit_setPreferredRefreshRate:HDRMode:overscanCompensation:", a3, 0);
}

- (uint64_t)avkit_resetPreferredModeSwitchRequest
{
  return objc_msgSend(a1, "_avkit_setPreferredRefreshRate:HDRMode:overscanCompensation:", -1, -1, 0.0);
}

- (uint64_t)avkit_screenHasWindowsExcludingWindow:()AVSecondScreenAdditions
{
  return 0;
}

- (BOOL)avkit_isForeground
{
  return ![a1 activationState] || objc_msgSend(a1, "activationState") == 1;
}

- (uint64_t)avkit_screenType
{
  return 0;
}

- (uint64_t)avkit_asWindowScene
{
  return 0;
}

+ (id)avkit_secondScreenScenes
{
  v0 = [MEMORY[0x1E4FB1438] sharedApplication];
  int v1 = [v0 connectedScenes];
  v2 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_21292];
  uint64_t v3 = [v1 filteredSetUsingPredicate:v2];
  v4 = [v3 allObjects];

  return v4;
}

@end