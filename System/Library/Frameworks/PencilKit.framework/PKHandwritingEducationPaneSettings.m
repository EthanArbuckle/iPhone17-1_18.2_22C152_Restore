@interface PKHandwritingEducationPaneSettings
+ (id)sharedInstance;
- (BOOL)hasSetUserHasDrawn;
- (BOOL)isCurrentSystemVersionEqualToLastUserDrawn;
- (uint64_t)canShowResetPaneInPalette;
- (uint64_t)hasSeenPane;
- (void)setHasSeenPane:(uint64_t)a1;
- (void)setHasSetUserHasDrawn:(BOOL)a3;
- (void)userHasDrawn;
@end

@implementation PKHandwritingEducationPaneSettings

+ (id)sharedInstance
{
  self;
  if (_MergedGlobals_163 != -1) {
    dispatch_once(&_MergedGlobals_163, &__block_literal_global_90);
  }
  v0 = (void *)qword_1EB3C6360;

  return v0;
}

void __52__PKHandwritingEducationPaneSettings_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(PKHandwritingEducationPaneSettings);
  v1 = (void *)qword_1EB3C6360;
  qword_1EB3C6360 = (uint64_t)v0;
}

- (BOOL)isCurrentSystemVersionEqualToLastUserDrawn
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  v1 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  v2 = [v1 objectForKey:@"internalSettings.drawing.hasDrawnInNotes"];

  uint64_t v3 = objc_opt_class();
  v4 = PKDynamicCast(v3, v2);
  if ([v4 count] == 3)
  {
    uint64_t v5 = objc_opt_class();
    v6 = [v4 objectAtIndexedSubscript:0];
    v7 = PKDynamicCast(v5, v6);
    uint64_t v8 = [v7 integerValue];

    uint64_t v9 = objc_opt_class();
    v10 = [v4 objectAtIndexedSubscript:1];
    v11 = PKDynamicCast(v9, v10);
    uint64_t v12 = [v11 integerValue];

    uint64_t v13 = objc_opt_class();
    v14 = [v4 objectAtIndexedSubscript:2];
    v15 = PKDynamicCast(v13, v14);
    uint64_t v16 = [v15 integerValue];
  }
  else
  {
    uint64_t v8 = 0;
    uint64_t v12 = 0;
    uint64_t v16 = 0;
  }

  v17 = [MEMORY[0x1E4F28F80] processInfo];
  v18 = v17;
  if (v17) {
    [v17 operatingSystemVersion];
  }

  BOOL v19 = 0;
  if (!v8 && !v12) {
    BOOL v19 = v16 == 0;
  }
  v20 = os_log_create("com.apple.pencilkit", "PKHandwritingEducationPaneSettings");
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    BOOL v23 = v19;
    _os_log_impl(&dword_1C44F8000, v20, OS_LOG_TYPE_DEFAULT, "isCurrentSystemVersionNewerThanLastDrawnIn=%d", buf, 8u);
  }

  return v19;
}

- (void)userHasDrawn
{
  v12[3] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    if (([a1 hasSetUserHasDrawn] & 1) != 0
      || ([MEMORY[0x1E4F28B50] mainBundle],
          v2 = objc_claimAutoreleasedReturnValue(),
          [v2 bundleIdentifier],
          uint64_t v3 = objc_claimAutoreleasedReturnValue(),
          char v4 = [v3 isEqualToString:@"com.apple.mobilenotes"],
          v3,
          v2,
          (v4 & 1) == 0))
    {
      [a1 setHasSetUserHasDrawn:1];
    }
    else
    {
      uint64_t v5 = [MEMORY[0x1E4F28F80] processInfo];
      v6 = v5;
      if (v5) {
        [v5 operatingSystemVersion];
      }

      v7 = [NSNumber numberWithInteger:0];
      v12[0] = v7;
      uint64_t v8 = [NSNumber numberWithInteger:0];
      v12[1] = v8;
      uint64_t v9 = [NSNumber numberWithInteger:0];
      v12[2] = v9;
      v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:3];

      v11 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
      [v11 setObject:v10 forKey:@"internalSettings.drawing.hasDrawnInNotes"];

      [a1 setHasSetUserHasDrawn:1];
    }
  }
}

- (void)setHasSeenPane:(uint64_t)a1
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    char v4 = os_log_create("com.apple.pencilkit", "PKHandwritingEducationPaneSettings");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v9[0] = 67109120;
      v9[1] = a2;
      _os_log_impl(&dword_1C44F8000, v4, OS_LOG_TYPE_DEFAULT, "set has seen handwriting education pane: %{BOOL}d", (uint8_t *)v9, 8u);
    }

    uint64_t v5 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    [v5 setBool:a2 forKey:@"internalSettings.drawing.hasSeenHandwritingEducationPane"];

    v6 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    [v6 synchronize];

    v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v7 postNotificationName:@"PKHandwritingEducationPaneSettingsDidChangeNotification" object:a1 userInfo:0];

    if ((a2 & 1) == 0)
    {
      uint64_t v8 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
      [v8 removeObjectForKey:@"internalSettings.drawing.hasDrawnInNotes"];
    }
  }
}

- (uint64_t)hasSeenPane
{
  if (result)
  {
    v1 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    uint64_t v2 = [v1 BOOLForKey:@"internalSettings.drawing.hasSeenHandwritingEducationPane"];

    return v2;
  }
  return result;
}

- (uint64_t)canShowResetPaneInPalette
{
  if (!a1) {
    return 0;
  }
  if (!os_variant_has_internal_diagnostics()) {
    return 0;
  }
  uint64_t v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  int v4 = [v3 BOOLForKey:@"internalSettings.drawing.showResetHandwritingEducationPaneInPalette"];

  if (!v4) {
    return 0;
  }

  return -[PKHandwritingEducationPaneSettings hasSeenPane](a1);
}

- (BOOL)hasSetUserHasDrawn
{
  return self->_hasSetUserHasDrawn;
}

- (void)setHasSetUserHasDrawn:(BOOL)a3
{
  self->_hasSetUserHasDrawn = a3;
}

@end