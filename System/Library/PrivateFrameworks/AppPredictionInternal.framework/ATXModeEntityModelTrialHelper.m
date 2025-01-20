@interface ATXModeEntityModelTrialHelper
- (ATXModeEntityModelTrialHelper)init;
- (id)loadCoreMLModelFromTrialWithName:(id)a3;
@end

@implementation ATXModeEntityModelTrialHelper

- (ATXModeEntityModelTrialHelper)init
{
  v6.receiver = self;
  v6.super_class = (Class)ATXModeEntityModelTrialHelper;
  v2 = [(ATXModeEntityModelTrialHelper *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F4B180] sharedInstance];
    modeEntityTrialClientWrapper = v2->_modeEntityTrialClientWrapper;
    v2->_modeEntityTrialClientWrapper = (ATXModeEntityTrialClientWrapper *)v3;
  }
  return v2;
}

- (id)loadCoreMLModelFromTrialWithName:(id)a3
{
  id v4 = a3;
  v5 = [(ATXModeEntityTrialClientWrapper *)self->_modeEntityTrialClientWrapper directoryPathForTrialResource:v4];
  char v17 = 0;
  objc_super v6 = [MEMORY[0x1E4F28CB8] defaultManager];
  int v7 = [v6 fileExistsAtPath:v5 isDirectory:&v17];

  if (v7) {
    BOOL v8 = v17 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    v12 = 0;
    id v13 = 0;
  }
  else
  {
    v9 = objc_opt_new();
    [v9 setComputeUnits:0];
    v10 = (void *)MEMORY[0x1E4F1E968];
    v11 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v5];
    id v16 = 0;
    v12 = [v10 modelWithContentsOfURL:v11 configuration:v9 error:&v16];
    id v13 = v16;

    if (v13)
    {
      v14 = __atxlog_handle_default();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        [(ATXModeEntityModelTrialHelper *)(uint64_t)v4 loadCoreMLModelFromTrialWithName:v14];
      }
    }
  }

  return v12;
}

- (void).cxx_destruct
{
}

- (void)loadCoreMLModelFromTrialWithName:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_ERROR, "ATXModeEntityModelTrialHelper: Error initializing %@ model: %@", (uint8_t *)&v3, 0x16u);
}

@end