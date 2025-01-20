@interface UIKeyboard(CKUtilities)
+ (BOOL)__ck_isUsingCompactHeightPredictionBar;
+ (uint64_t)__ck_isPredictionBarEnabled;
+ (void)__ck_appStripVerticalPadding;
@end

@implementation UIKeyboard(CKUtilities)

+ (BOOL)__ck_isUsingCompactHeightPredictionBar
{
  [MEMORY[0x1E4F42B08] predictionViewHeightForCurrentInputMode];
  return v0 <= 38.0;
}

+ (void)__ck_appStripVerticalPadding
{
  if ((objc_msgSend(MEMORY[0x1E4F42B08], "__ck_isUsingCompactHeightPredictionBar") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E4F42B08], "keyplanePadding", 4.5);
    if (CKMainScreenScale_once_18 != -1) {
      dispatch_once(&CKMainScreenScale_once_18, &__block_literal_global_1905);
    }
  }
}

+ (uint64_t)__ck_isPredictionBarEnabled
{
  double v0 = [MEMORY[0x1E4F42B20] activeInstance];
  if ([v0 predictionFromPreference])
  {
    char v1 = UIKeyboardPredictionEnabledForCurrentInputMode();

    if (v1) {
      return 1;
    }
  }
  else
  {
  }
  v3 = [MEMORY[0x1E4F42B20] activeInstance];
  uint64_t v4 = [v3 displaysCandidates];

  return v4;
}

@end