@interface PKImageWandOnboarding
+ (uint64_t)hasSeenOnboardingUI;
+ (void)setHasSeenOnboardingUI:(uint64_t)a1;
@end

@implementation PKImageWandOnboarding

+ (void)setHasSeenOnboardingUI:(uint64_t)a1
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  self;
  if (!_os_feature_enabled_impl() || PKIsDeviceLocked()) {
    goto LABEL_7;
  }
  v3 = [MEMORY[0x1E4F28B50] mainBundle];
  v4 = [v3 bundleIdentifier];
  int v5 = [v4 isEqualToString:@"com.apple.mobilenotes"];

  if (!v5 || PKIsQuickNoteOnPhone())
  {
    v6 = [MEMORY[0x1E4F28B50] mainBundle];
    v7 = [v6 bundleIdentifier];

    if ((os_variant_has_internal_diagnostics() & 1) == 0)
    {

      goto LABEL_7;
    }
    if (([v7 isEqualToString:@"com.apple.TestApp"] & 1) != 0
      || ([v7 isEqualToString:@"com.apple.ZoomTestApp"] & 1) != 0
      || [v7 isEqualToString:@"com.apple.PaperKitTestApp"])
    {
    }
    else
    {
      char v11 = [v7 isEqualToString:@"com.apple.pencilkit.MultiDrawingCanvasTestApp"];

      if ((v11 & 1) == 0)
      {
LABEL_7:
        v8 = os_log_create("com.apple.pencilkit", "PKImageWandOnboarding");
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          LOWORD(v12[0]) = 0;
            (uint8_t *)v12,
            2u);
        }
LABEL_9:

        return;
      }
    }
  }
  if (+[PKImageWandOnboarding hasSeenOnboardingUI]() != a2)
  {
    v9 = os_log_create("com.apple.pencilkit", "PKImageWandOnboarding");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v12[0] = 67109120;
      v12[1] = a2;
      _os_log_impl(&dword_1C44F8000, v9, OS_LOG_TYPE_DEFAULT, "Set hasSeenOnboardingUI to %{BOOL}d", (uint8_t *)v12, 8u);
    }

    v10 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    [v10 setBool:a2 forKey:@"PKHasSeenImageWandOnboardingUI"];

    v8 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    [v8 synchronize];
    goto LABEL_9;
  }
}

+ (uint64_t)hasSeenOnboardingUI
{
  self;
  if (_os_feature_enabled_impl() && !PKIsDeviceLocked())
  {
    v1 = [MEMORY[0x1E4F28B50] mainBundle];
    v2 = [v1 bundleIdentifier];
    int v3 = [v2 isEqualToString:@"com.apple.mobilenotes"];

    if (!v3 || PKIsQuickNoteOnPhone())
    {
      v4 = [MEMORY[0x1E4F28B50] mainBundle];
      int v5 = [v4 bundleIdentifier];

      if (!os_variant_has_internal_diagnostics())
      {
        uint64_t v0 = 0;
LABEL_13:

        return v0;
      }
      if (([v5 isEqualToString:@"com.apple.TestApp"] & 1) != 0
        || ([v5 isEqualToString:@"com.apple.ZoomTestApp"] & 1) != 0
        || [v5 isEqualToString:@"com.apple.PaperKitTestApp"])
      {
      }
      else
      {
        uint64_t v0 = [v5 isEqualToString:@"com.apple.pencilkit.MultiDrawingCanvasTestApp"];

        if (!v0) {
          return v0;
        }
      }
    }
    int v5 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    uint64_t v0 = [v5 BOOLForKey:@"PKHasSeenImageWandOnboardingUI"];
    goto LABEL_13;
  }
  return 0;
}

@end