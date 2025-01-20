@interface PRSPosterConfiguration(AmbientUI)
- (NSObject)amui_getConfiguredDisplayNameWithError:()AmbientUI;
@end

@implementation PRSPosterConfiguration(AmbientUI)

- (NSObject)amui_getConfiguredDisplayNameWithError:()AmbientUI
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  v5 = objc_msgSend(a1, "pr_loadOtherMetadataWithError:");
  v6 = v5;
  if (v5)
  {
    id v7 = [v5 displayNameLocalizationKey];
    if (!v7)
    {
      v8 = AMUILogSwitcher();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[PRSPosterConfiguration(AmbientUI) amui_getConfiguredDisplayNameWithError:].cold.5((uint64_t)a1, v8);
      }
    }
    v9 = objc_msgSend(a1, "pr_posterProvider");
    if (v9)
    {
      v10 = (void *)[objc_alloc(MEMORY[0x263F01858]) initWithBundleIdentifier:v9 error:a3];
      if (v10)
      {
        v11 = v10;
        v12 = [v10 URL];

        v13 = (void *)[objc_alloc(MEMORY[0x263F29C00]) initWithURL:v12];
        v14 = v13;
        if (v13)
        {
          v15 = [v13 localizedStringForKey:v7 value:0 table:0];
          v16 = v15;
          if (v15)
          {
            v16 = v15;
            v17 = v16;
          }
          else
          {
            v18 = AMUILogSwitcher();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            {
              int v20 = 138412802;
              id v21 = v7;
              __int16 v22 = 2112;
              v23 = v14;
              __int16 v24 = 2112;
              v25 = a1;
              _os_log_error_impl(&dword_247837000, v18, OS_LOG_TYPE_ERROR, "Failed to load display name localization key \"%@\" from bundle %@ for %@", (uint8_t *)&v20, 0x20u);
            }

            v17 = 0;
          }
        }
        else
        {
          v16 = AMUILogSwitcher();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
            -[PRSPosterConfiguration(AmbientUI) amui_getConfiguredDisplayNameWithError:].cold.4();
          }
          v17 = 0;
        }

        goto LABEL_29;
      }
      v12 = AMUILogSwitcher();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[PRSPosterConfiguration(AmbientUI) amui_getConfiguredDisplayNameWithError:]();
      }
    }
    else
    {
      v12 = AMUILogSwitcher();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[PRSPosterConfiguration(AmbientUI) amui_getConfiguredDisplayNameWithError:]((uint64_t)a1, v12);
      }
    }
    v17 = 0;
LABEL_29:

    goto LABEL_30;
  }
  if (a3) {
    id v7 = *a3;
  }
  else {
    id v7 = 0;
  }
  v9 = AMUILogSwitcher();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    -[PRSPosterConfiguration(AmbientUI) amui_getConfiguredDisplayNameWithError:]();
  }
  v17 = 0;
LABEL_30:

  return v17;
}

- (void)amui_getConfiguredDisplayNameWithError:()AmbientUI .cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_247837000, v0, v1, "Unable to load metadata for poster configuration %@: %@");
}

- (void)amui_getConfiguredDisplayNameWithError:()AmbientUI .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_247837000, a2, OS_LOG_TYPE_ERROR, "Missing poster provider from configuration %@", (uint8_t *)&v2, 0xCu);
}

- (void)amui_getConfiguredDisplayNameWithError:()AmbientUI .cold.3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_247837000, v0, v1, "No extension record for provider %@ configuration %@");
}

- (void)amui_getConfiguredDisplayNameWithError:()AmbientUI .cold.4()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_247837000, v0, v1, "Failed to load bundle %@ from %@");
}

- (void)amui_getConfiguredDisplayNameWithError:()AmbientUI .cold.5(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_247837000, a2, OS_LOG_TYPE_ERROR, "No display name localization key for configuration %@", (uint8_t *)&v2, 0xCu);
}

@end