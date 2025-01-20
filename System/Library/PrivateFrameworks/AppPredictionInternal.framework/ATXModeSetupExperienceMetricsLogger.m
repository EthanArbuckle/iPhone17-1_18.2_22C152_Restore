@interface ATXModeSetupExperienceMetricsLogger
- (ATXModeConfigurationUIFlowLoggingBiomeStream)stream;
- (ATXModeSetupExperienceMetricsLogger)init;
- (NSURL)bookmarkURLPath;
- (id)generateBookmark;
- (id)generateBookmarkURLPath;
- (void)logMetrics;
- (void)setBookmarkURLPath:(id)a3;
- (void)setStream:(id)a3;
- (void)writeBookmarkToFile:(id)a3;
@end

@implementation ATXModeSetupExperienceMetricsLogger

- (ATXModeSetupExperienceMetricsLogger)init
{
  v6.receiver = self;
  v6.super_class = (Class)ATXModeSetupExperienceMetricsLogger;
  v2 = [(ATXModeSetupExperienceMetricsLogger *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    stream = v2->_stream;
    v2->_stream = (ATXModeConfigurationUIFlowLoggingBiomeStream *)v3;
  }
  return v2;
}

- (id)generateBookmarkURLPath
{
  bookmarkURLPath = self->_bookmarkURLPath;
  if (bookmarkURLPath)
  {
    uint64_t v3 = bookmarkURLPath;
  }
  else
  {
    v4 = (objc_class *)objc_opt_class();
    v5 = NSStringFromClass(v4);
    objc_super v6 = [MEMORY[0x1E4F4B650] metricsRootDirectory];
    id v7 = objc_alloc(MEMORY[0x1E4F1CB10]);
    v8 = [v6 stringByAppendingPathComponent:v5];
    uint64_t v3 = (NSURL *)[v7 initFileURLWithPath:v8];
  }
  return v3;
}

- (id)generateBookmark
{
  uint64_t v3 = (void *)MEMORY[0x1E4F4B618];
  v4 = [(ATXModeSetupExperienceMetricsLogger *)self generateBookmarkURLPath];
  v5 = [v3 bookmarkFromURLPath:v4 maxFileSize:3000000 versionNumber:&unk_1F27F18C0];

  if (!v5)
  {
    id v6 = objc_alloc(MEMORY[0x1E4F4B618]);
    id v7 = [(ATXModeSetupExperienceMetricsLogger *)self generateBookmarkURLPath];
    v5 = (void *)[v6 initWithURLPath:v7 versionNumber:&unk_1F27F18C0 bookmark:0 metadata:0];
  }
  return v5;
}

- (void)writeBookmarkToFile:(id)a3
{
  id v6 = 0;
  [a3 saveBookmarkWithError:&v6];
  id v4 = v6;
  if (v4)
  {
    v5 = __atxlog_handle_modes();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      [(ATXModeSetupExperienceMetricsLogger *)(uint64_t)self writeBookmarkToFile:v5];
    }
  }
}

- (void)logMetrics
{
  uint64_t v3 = [MEMORY[0x1E4F4AF78] sharedInstance];
  id v4 = [(ATXModeSetupExperienceMetricsLogger *)self generateBookmark];
  v5 = [(ATXModeSetupExperienceMetricsLogger *)self stream];
  id v6 = [v5 publisherFromStartTime:0.0];
  id v7 = [v6 filterWithIsIncluded:&__block_literal_global_146];
  v8 = [v4 bookmark];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __49__ATXModeSetupExperienceMetricsLogger_logMetrics__block_invoke_2;
  v14[3] = &unk_1E68B3440;
  id v15 = v4;
  v16 = self;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __49__ATXModeSetupExperienceMetricsLogger_logMetrics__block_invoke_11;
  v12[3] = &unk_1E68ABB70;
  id v13 = v3;
  id v9 = v3;
  id v10 = v4;
  id v11 = (id)[v7 sinkWithBookmark:v8 completion:v14 receiveInput:v12];
}

BOOL __49__ATXModeSetupExperienceMetricsLogger_logMetrics__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 eventBody];
  BOOL v3 = [v2 modeConfigurationUI] == 2;

  return v3;
}

void __49__ATXModeSetupExperienceMetricsLogger_logMetrics__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [v5 error];
  if (v7)
  {
  }
  else if (![v5 state])
  {
    goto LABEL_7;
  }
  v8 = __atxlog_handle_modes();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    __49__ATXModeSetupExperienceMetricsLogger_logMetrics__block_invoke_2_cold_1(v5, v8);
  }

LABEL_7:
  [*(id *)(a1 + 32) setBookmark:v6];
  [*(id *)(a1 + 40) writeBookmarkToFile:*(void *)(a1 + 32)];
}

void __49__ATXModeSetupExperienceMetricsLogger_logMetrics__block_invoke_11(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  id v16 = v3;
  id v5 = [v3 eventBody];
  id v6 = [v5 dndModeUUID];
  id v7 = [v4 dndModeForDNDModeWithUUID:v6];

  if (v7)
  {
    v8 = objc_opt_new();
    [v7 semanticType];
    id v9 = DNDModeSemanticTypeToString();
    [v8 setModeSemanticType:v9];

    id v10 = [v16 eventBody];
    id v11 = [v10 suggestedEntityIdentifiers];

    v12 = [v16 eventBody];
    id v13 = [v12 currentEntityIdentifiers];

    v14 = [v11 differenceFromArray:v13];
    int v15 = [v14 hasChanges];

    [v8 setOnboardingOutcome:v15 ^ 1u];
    [v8 sendToCoreAnalytics];
  }
}

- (ATXModeConfigurationUIFlowLoggingBiomeStream)stream
{
  return self->_stream;
}

- (void)setStream:(id)a3
{
}

- (NSURL)bookmarkURLPath
{
  return self->_bookmarkURLPath;
}

- (void)setBookmarkURLPath:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bookmarkURLPath, 0);
  objc_storeStrong((id *)&self->_stream, 0);
}

- (void)writeBookmarkToFile:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  int v6 = 138412546;
  id v7 = (id)objc_opt_class();
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  id v5 = v7;
  _os_log_error_impl(&dword_1D0FA3000, a3, OS_LOG_TYPE_ERROR, "%@: Unable to save bookmark due to : %@", (uint8_t *)&v6, 0x16u);
}

void __49__ATXModeSetupExperienceMetricsLogger_logMetrics__block_invoke_2_cold_1(void *a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = [a1 error];
  id v4 = [v3 localizedDescription];
  int v5 = 138412290;
  int v6 = v4;
  _os_log_error_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v5, 0xCu);
}

@end