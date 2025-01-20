@interface UIWindowScene(AVSecondScreenAdditions)
- (BOOL)avkit_screenHasWindowsExcludingWindow:()AVSecondScreenAdditions;
- (uint64_t)_avkit_setPreferredRefreshRate:()AVSecondScreenAdditions HDRMode:overscanCompensation:;
- (uint64_t)avkit_screenType;
@end

@implementation UIWindowScene(AVSecondScreenAdditions)

- (uint64_t)_avkit_setPreferredRefreshRate:()AVSecondScreenAdditions HDRMode:overscanCompensation:
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v9 = _AVLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    if ((unint64_t)(a4 + 1) > 3) {
      v10 = @"SDR";
    }
    else {
      v10 = off_1E5FC3F20[a4 + 1];
    }
    v11 = @"Unknown";
    v14 = "-[UIWindowScene(AVSecondScreenAdditions) _avkit_setPreferredRefreshRate:HDRMode:overscanCompensation:]";
    __int16 v15 = 2048;
    int v13 = 136315906;
    double v16 = a2;
    if (!a5) {
      v11 = @"None";
    }
    __int16 v17 = 2112;
    v18 = v10;
    __int16 v19 = 2112;
    v20 = v11;
    _os_log_impl(&dword_1B05B7000, v9, OS_LOG_TYPE_DEFAULT, "%s Refresh: %.f HDRMode: %@ overscanCompensation: %@", (uint8_t *)&v13, 0x2Au);
  }

  return [a1 _setAVKitRequestedRefreshRate:a4 HDRMode:a5 overscanCompensation:a2];
}

- (BOOL)avkit_screenHasWindowsExcludingWindow:()AVSecondScreenAdditions
{
  id v4 = a3;
  v5 = [a1 windows];
  v6 = (void *)MEMORY[0x1E4F28F60];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __80__UIWindowScene_AVSecondScreenAdditions__avkit_screenHasWindowsExcludingWindow___block_invoke;
  v12[3] = &unk_1E5FC3EE0;
  id v13 = v4;
  id v7 = v4;
  v8 = [v6 predicateWithBlock:v12];
  v9 = [v5 filteredArrayUsingPredicate:v8];
  BOOL v10 = [v9 count] != 0;

  return v10;
}

- (uint64_t)avkit_screenType
{
  v2 = objc_msgSend(a1, "avkit_asWindowScene");
  v3 = [v2 screen];
  id v4 = [v3 displayConfiguration];
  v5 = [v4 name];

  v6 = objc_msgSend(a1, "avkit_asWindowScene");
  id v7 = [v6 screen];
  uint64_t v8 = [MEMORY[0x1E4FB1BA8] mainScreen];
  if (v7 == (void *)v8)
  {

    goto LABEL_6;
  }
  v9 = (void *)v8;
  char v10 = [v5 hasPrefix:@"LCD"];

  if (v10)
  {
LABEL_6:
    uint64_t v14 = 2;
    goto LABEL_7;
  }
  v11 = objc_msgSend(a1, "avkit_asWindowScene");
  v12 = [v11 screen];
  char v13 = [v12 _isCarScreen];

  if (v13)
  {
    uint64_t v14 = 1;
  }
  else
  {
    double v16 = [v5 lowercaseString];
    char v17 = [v16 hasPrefix:@"wireless"];

    if (v17)
    {
      uint64_t v14 = 4;
    }
    else if ([v5 hasPrefix:@"TVOut"])
    {
      uint64_t v14 = 3;
    }
    else
    {
      uint64_t v14 = 0;
    }
  }
LABEL_7:

  return v14;
}

@end