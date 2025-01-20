@interface SBSyncControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityWriteOutDataResetForAXSettings:(id)a3;
- (void)resetService:(id)a3 willBeginDataResetWithMode:(int64_t)a4;
@end

@implementation SBSyncControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBSyncController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)_accessibilityWriteOutDataResetForAXSettings:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = AXLogCommon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_242561000, v4, OS_LOG_TYPE_DEFAULT, "Begin right out of ax settings data", buf, 2u);
  }

  v5 = [MEMORY[0x263F08850] defaultManager];
  if (([v5 fileExistsAtPath:@"/var/mobile/Library/Accessibility/DataResetAccessibilityFeatureReenablement"] & 1) == 0&& (objc_msgSend(v5, "fileExistsAtPath:", @"/var/mobile/Library/Accessibility") & 1) == 0)
  {
    v6 = objc_msgSend(NSDictionary, "dictionaryWithObjectsAndKeys:", *MEMORY[0x263F080B0], *MEMORY[0x263F080A8], 0);
    id v20 = 0;
    [v5 createDirectoryAtPath:@"/var/mobile/Library/Accessibility" withIntermediateDirectories:1 attributes:v6 error:&v20];
    v7 = v20;
    v8 = AXLogCommon();
    v9 = v8;
    if (v7)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[SBSyncControllerAccessibility _accessibilityWriteOutDataResetForAXSettings:].cold.5();
      }

LABEL_32:
      goto LABEL_35;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_242561000, v9, OS_LOG_TYPE_DEFAULT, "Made directory to store data", buf, 2u);
    }
  }
  int v10 = open((const char *)[@"/var/mobile/Library/Accessibility/DataResetAccessibilityFeatureReenablement" fileSystemRepresentation], 1793, 384);
  v11 = AXLogCommon();
  v7 = v11;
  if ((v10 & 0x80000000) == 0)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v22 = @"/var/mobile/Library/Accessibility/DataResetAccessibilityFeatureReenablement";
      _os_log_impl(&dword_242561000, v7, OS_LOG_TYPE_DEFAULT, "Opened file to store data: %@", buf, 0xCu);
    }

    v6 = objc_msgSend(NSDictionary, "dictionaryWithObjectsAndKeys:", *MEMORY[0x263F080B0], *MEMORY[0x263F080A8], 0);
    id v19 = 0;
    [v5 setAttributes:v6 ofItemAtPath:@"/var/mobile/Library/Accessibility/DataResetAccessibilityFeatureReenablement" error:&v19];
    v7 = v19;
    if (v7)
    {
      v12 = AXLogCommon();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[SBSyncControllerAccessibility _accessibilityWriteOutDataResetForAXSettings:].cold.4();
      }
    }
    id v13 = v3;
    write(v10, (const void *)[v13 bytes], objc_msgSend(v13, "length"));
    fcntl(v10, 51, 0);
    close(v10);
    v14 = opendir((const char *)[@"/var/mobile/Library/Accessibility" fileSystemRepresentation]);
    v15 = v14;
    if (!v14 || dirfd(v14) == -1)
    {
      v17 = AXLogCommon();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        -[SBSyncControllerAccessibility _accessibilityWriteOutDataResetForAXSettings:]();
      }

      if (!v15) {
        goto LABEL_29;
      }
    }
    else if (fcntl(v10, 51, 0) == -1)
    {
      v16 = AXLogCommon();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        -[SBSyncControllerAccessibility _accessibilityWriteOutDataResetForAXSettings:]();
      }
    }
    closedir(v15);
LABEL_29:
    v18 = AXLogCommon();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v22 = @"/var/mobile/Library/Accessibility/DataResetAccessibilityFeatureReenablement";
      _os_log_impl(&dword_242561000, v18, OS_LOG_TYPE_DEFAULT, "Finished writing data: %@", buf, 0xCu);
    }

    goto LABEL_32;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    -[SBSyncControllerAccessibility _accessibilityWriteOutDataResetForAXSettings:]();
  }
LABEL_35:
}

- (void)resetService:(id)a3 willBeginDataResetWithMode:(int64_t)a4
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if ((unint64_t)(a4 - 3) <= 1)
  {
    if (MEMORY[0x245663010](*MEMORY[0x263F8B3E8], 0)) {
      BOOL v7 = 1;
    }
    else {
      BOOL v7 = _AXSVoiceOverTouchEnabled() != 0;
    }
    int v8 = MEMORY[0x245663010](*MEMORY[0x263F8B450], 0);
    if (_AXSAssistiveTouchEnabled()) {
      BOOL v9 = _AXSAssistiveTouchHardwareEnabled() != 0;
    }
    else {
      BOOL v9 = 0;
    }
    int v10 = _AXSAssistiveTouchScannerEnabled();
    v11 = AXLogCommon();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109888;
      *(_DWORD *)v27 = v7;
      *(_WORD *)&v27[4] = 1024;
      *(_DWORD *)&v27[6] = v8 != 0;
      __int16 v28 = 1024;
      BOOL v29 = v9;
      __int16 v30 = 1024;
      BOOL v31 = v10 != 0;
      _os_log_impl(&dword_242561000, v11, OS_LOG_TYPE_DEFAULT, "AX options will stay enabled: VO:%d, Zoom:%d, AST:%d, SC: %d", buf, 0x1Au);
    }
    BOOL v12 = v8 != 0;

    v24[0] = @"VoiceOverTouch";
    id v13 = [NSNumber numberWithBool:v7];
    v25[0] = v13;
    v24[1] = @"ZoomTouch";
    v14 = [NSNumber numberWithBool:v12];
    v25[1] = v14;
    v24[2] = @"AssistiveTouch";
    v15 = [NSNumber numberWithBool:v9];
    v25[2] = v15;
    v24[3] = @"SwitchControl";
    v16 = [NSNumber numberWithBool:v10 != 0];
    v25[3] = v16;
    v17 = [NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:4];

    id v23 = 0;
    v18 = [MEMORY[0x263F08910] archivedDataWithRootObject:v17 requiringSecureCoding:1 error:&v23];
    id v19 = v23;
    if (v19)
    {
      id v20 = AXMediaLogCommon();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        -[SBSyncControllerAccessibility resetService:willBeginDataResetWithMode:]();
      }
    }
    v21 = AXLogCommon();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)v27 = v17;
      _os_log_impl(&dword_242561000, v21, OS_LOG_TYPE_DEFAULT, "Writing out ax settings: %@", buf, 0xCu);
    }

    [(SBSyncControllerAccessibility *)self _accessibilityWriteOutDataResetForAXSettings:v18];
  }
  v22.receiver = self;
  v22.super_class = (Class)SBSyncControllerAccessibility;
  [(SBSyncControllerAccessibility *)&v22 resetService:v6 willBeginDataResetWithMode:a4];
}

- (void)_accessibilityWriteOutDataResetForAXSettings:.cold.1()
{
  v0 = __error();
  strerror(*v0);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_242561000, v1, v2, "Failed to open data reset State file. errno: %{public}s", v3, v4, v5, v6, v7);
}

- (void)_accessibilityWriteOutDataResetForAXSettings:.cold.2()
{
  v0 = __error();
  strerror(*v0);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_242561000, v1, v2, "Failed to open data reset state directory: %{public}s", v3, v4, v5, v6, v7);
}

- (void)_accessibilityWriteOutDataResetForAXSettings:.cold.3()
{
  v0 = __error();
  strerror(*v0);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_242561000, v1, v2, "failed to F_FULLSYNC data reset state directory: %{public}s", v3, v4, v5, v6, v7);
}

- (void)_accessibilityWriteOutDataResetForAXSettings:.cold.4()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_242561000, v0, v1, "Failed to set protection class on data reset State file: %{public}@", v2, v3, v4, v5, v6);
}

- (void)_accessibilityWriteOutDataResetForAXSettings:.cold.5()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_242561000, v0, v1, "Failed to create dir for reset state file: %{public}@", v2, v3, v4, v5, v6);
}

- (void)resetService:willBeginDataResetWithMode:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_242561000, v0, v1, "Failed to archive data: %@", v2, v3, v4, v5, v6);
}

@end