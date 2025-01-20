@interface CKUIThemeHUD
- (id)blue_sendButtonColor;
- (id)entryFieldAudioRecordingBalloonColor;
- (id)entryFieldButtonColor;
- (id)entryFieldCoverBorderColor;
- (id)entryFieldCoverFillColor;
- (id)entryFieldTextColor;
- (id)green_sendButtonColor;
- (id)siri_sendButtonColor;
- (int64_t)keyboardAppearance;
@end

@implementation CKUIThemeHUD

- (int64_t)keyboardAppearance
{
  int64_t v2 = [(CKUITheme *)self HUDStyle];
  if (keyboardAppearance_sHUDStyle == v2)
  {
    return (BOOL)keyboardAppearance_sBehavior_1752;
  }
  else
  {
    BOOL v3 = v2 != 2;
    keyboardAppearance_sBehavior_1752 = v2 != 2;
    keyboardAppearance_sHUDStyle = v2;
  }
  return v3;
}

- (id)green_sendButtonColor
{
  int64_t v3 = [(CKUITheme *)self HUDStyle];
  int v4 = UIAccessibilityDarkerSystemColorsEnabled();
  if (green_sendButtonColor_sHUDStyle != v3 || green_sendButtonColor_sIsIncreaseContrastEnabled != v4)
  {
    char v6 = v4;
    if (v3 == 2)
    {
      v11.receiver = self;
      v11.super_class = (Class)CKUIThemeHUD;
      uint64_t v7 = [(CKUITheme *)&v11 green_sendButtonColor];
    }
    else
    {
      uint64_t v7 = [MEMORY[0x1E4F428B8] whiteColor];
    }
    v8 = (void *)green_sendButtonColor_sBehavior_1753;
    green_sendButtonColor_sBehavior_1753 = v7;

    green_sendButtonColor_sHUDStyle = v3;
    green_sendButtonColor_sIsIncreaseContrastEnabled = v6;
  }
  v9 = (void *)green_sendButtonColor_sBehavior_1753;

  return v9;
}

- (id)blue_sendButtonColor
{
  int64_t v3 = [(CKUITheme *)self HUDStyle];
  int v4 = UIAccessibilityDarkerSystemColorsEnabled();
  if (blue_sendButtonColor_sHUDStyle != v3 || blue_sendButtonColor_sIsIncreaseContrastEnabled != v4)
  {
    char v6 = v4;
    if (v3 == 2)
    {
      v11.receiver = self;
      v11.super_class = (Class)CKUIThemeHUD;
      uint64_t v7 = [(CKUITheme *)&v11 blue_sendButtonColor];
    }
    else
    {
      uint64_t v7 = [MEMORY[0x1E4F428B8] whiteColor];
    }
    v8 = (void *)blue_sendButtonColor_sBehavior_1754;
    blue_sendButtonColor_sBehavior_1754 = v7;

    blue_sendButtonColor_sHUDStyle = v3;
    blue_sendButtonColor_sIsIncreaseContrastEnabled = v6;
  }
  v9 = (void *)blue_sendButtonColor_sBehavior_1754;

  return v9;
}

- (id)siri_sendButtonColor
{
  int64_t v3 = [(CKUITheme *)self HUDStyle];
  int v4 = UIAccessibilityDarkerSystemColorsEnabled();
  if (siri_sendButtonColor_sHUDStyle != v3 || siri_sendButtonColor_sIsIncreaseContrastEnabled != v4)
  {
    char v6 = v4;
    if (v3 == 2)
    {
      v11.receiver = self;
      v11.super_class = (Class)CKUIThemeHUD;
      uint64_t v7 = [(CKUITheme *)&v11 siri_sendButtonColor];
    }
    else
    {
      uint64_t v7 = [MEMORY[0x1E4F428B8] whiteColor];
    }
    v8 = (void *)siri_sendButtonColor_sBehavior_1756;
    siri_sendButtonColor_sBehavior_1756 = v7;

    siri_sendButtonColor_sHUDStyle = v3;
    siri_sendButtonColor_sIsIncreaseContrastEnabled = v6;
  }
  v9 = (void *)siri_sendButtonColor_sBehavior_1756;

  return v9;
}

- (id)entryFieldButtonColor
{
  int64_t v3 = [(CKUITheme *)self HUDStyle];
  int v4 = UIAccessibilityDarkerSystemColorsEnabled();
  if (entryFieldButtonColor_sHUDStyle != v3 || entryFieldButtonColor_sIsIncreaseContrastEnabled != v4)
  {
    char v6 = v4;
    if (v3 == 2)
    {
      v11.receiver = self;
      v11.super_class = (Class)CKUIThemeHUD;
      uint64_t v7 = [(CKUITheme *)&v11 entryFieldButtonColor];
    }
    else
    {
      uint64_t v7 = [MEMORY[0x1E4F428B8] whiteColor];
    }
    v8 = (void *)entryFieldButtonColor_sBehavior_1758;
    entryFieldButtonColor_sBehavior_1758 = v7;

    entryFieldButtonColor_sHUDStyle = v3;
    entryFieldButtonColor_sIsIncreaseContrastEnabled = v6;
  }
  v9 = (void *)entryFieldButtonColor_sBehavior_1758;

  return v9;
}

- (id)entryFieldCoverFillColor
{
  int64_t v3 = [(CKUITheme *)self HUDStyle];
  int v4 = UIAccessibilityDarkerSystemColorsEnabled();
  if (entryFieldCoverFillColor_sHUDStyle != v3
    || entryFieldCoverFillColor_sIsIncreaseContrastEnabled != v4)
  {
    char v6 = v4;
    if (v3 == 2)
    {
      v11.receiver = self;
      v11.super_class = (Class)CKUIThemeHUD;
      uint64_t v7 = [(CKUITheme *)&v11 entryFieldCoverFillColor];
    }
    else
    {
      uint64_t v7 = [MEMORY[0x1E4F428B8] colorWithWhite:1.0 alpha:0.2];
    }
    v8 = (void *)entryFieldCoverFillColor_sBehavior_1760;
    entryFieldCoverFillColor_sBehavior_1760 = v7;

    entryFieldCoverFillColor_sHUDStyle = v3;
    entryFieldCoverFillColor_sIsIncreaseContrastEnabled = v6;
  }
  v9 = (void *)entryFieldCoverFillColor_sBehavior_1760;

  return v9;
}

- (id)entryFieldCoverBorderColor
{
  int64_t v3 = [(CKUITheme *)self HUDStyle];
  int v4 = UIAccessibilityDarkerSystemColorsEnabled();
  if (entryFieldCoverBorderColor_sHUDStyle != v3
    || entryFieldCoverBorderColor_sIsIncreaseContrastEnabled != v4)
  {
    char v6 = v4;
    if (v3 == 2)
    {
      v11.receiver = self;
      v11.super_class = (Class)CKUIThemeHUD;
      uint64_t v7 = [(CKUITheme *)&v11 entryFieldCoverBorderColor];
      v8 = (void *)entryFieldCoverBorderColor_sBehavior_1762;
      entryFieldCoverBorderColor_sBehavior_1762 = v7;
    }
    else
    {
      v8 = (void *)entryFieldCoverBorderColor_sBehavior_1762;
      entryFieldCoverBorderColor_sBehavior_1762 = 0;
    }

    entryFieldCoverBorderColor_sHUDStyle = v3;
    entryFieldCoverBorderColor_sIsIncreaseContrastEnabled = v6;
  }
  v9 = (void *)entryFieldCoverBorderColor_sBehavior_1762;

  return v9;
}

- (id)entryFieldTextColor
{
  int64_t v3 = [(CKUITheme *)self HUDStyle];
  int v4 = UIAccessibilityDarkerSystemColorsEnabled();
  if (entryFieldTextColor_sHUDStyle != v3 || entryFieldTextColor_sIsIncreaseContrastEnabled != v4)
  {
    char v6 = v4;
    if (v3 == 2)
    {
      v11.receiver = self;
      v11.super_class = (Class)CKUIThemeHUD;
      uint64_t v7 = [(CKUITheme *)&v11 entryFieldTextColor];
    }
    else
    {
      uint64_t v7 = [MEMORY[0x1E4F428B8] whiteColor];
    }
    v8 = (void *)entryFieldTextColor_sBehavior_1764;
    entryFieldTextColor_sBehavior_1764 = v7;

    entryFieldTextColor_sHUDStyle = v3;
    entryFieldTextColor_sIsIncreaseContrastEnabled = v6;
  }
  v9 = (void *)entryFieldTextColor_sBehavior_1764;

  return v9;
}

- (id)entryFieldAudioRecordingBalloonColor
{
  int64_t v3 = [(CKUITheme *)self HUDStyle];
  int v4 = UIAccessibilityDarkerSystemColorsEnabled();
  if (entryFieldAudioRecordingBalloonColor_sHUDStyle != v3
    || entryFieldAudioRecordingBalloonColor_sIsIncreaseContrastEnabled != v4)
  {
    char v6 = v4;
    if (v3 == 2)
    {
      v11.receiver = self;
      v11.super_class = (Class)CKUIThemeHUD;
      uint64_t v7 = [(CKUITheme *)&v11 entryFieldAudioRecordingBalloonColor];
    }
    else
    {
      uint64_t v7 = [MEMORY[0x1E4F428B8] colorWithWhite:1.0 alpha:0.2];
    }
    v8 = (void *)entryFieldAudioRecordingBalloonColor_sBehavior_1766;
    entryFieldAudioRecordingBalloonColor_sBehavior_1766 = v7;

    entryFieldAudioRecordingBalloonColor_sHUDStyle = v3;
    entryFieldAudioRecordingBalloonColor_sIsIncreaseContrastEnabled = v6;
  }
  v9 = (void *)entryFieldAudioRecordingBalloonColor_sBehavior_1766;

  return v9;
}

@end