@interface AXAuditDeduplicator
+ (BOOL)isFrameworkAvailable;
+ (void)downloadUIUnderstandingAssetsIfNeeded;
- (AXAuditDeduplicator)init;
- (AXAuditDeduplicatorHeuristics)heuristics;
- (AXAuditDeduplicatorModels)models;
- (BOOL)modelsAvailableForPlatform:(id)a3;
- (CGImage)getCGImageForIssue:(id)a3;
- (OS_os_log)log;
- (int)findNewIssues:(id)a3 forPlatform:(id)a4;
- (void)setHeuristics:(id)a3;
- (void)setLog:(id)a3;
- (void)setModels:(id)a3;
@end

@implementation AXAuditDeduplicator

- (AXAuditDeduplicator)init
{
  v7.receiver = self;
  v7.super_class = (Class)AXAuditDeduplicator;
  v2 = [(AXAuditDeduplicator *)&v7 init];
  if (v2)
  {
    v3 = objc_alloc_init(AXAuditDeduplicatorModels);
    [(AXAuditDeduplicator *)v2 setModels:v3];

    v4 = objc_alloc_init(AXAuditDeduplicatorHeuristics);
    [(AXAuditDeduplicator *)v2 setHeuristics:v4];

    os_log_t v5 = os_log_create("AXAuditDeduplicator", "Muxer");
    [(AXAuditDeduplicator *)v2 setLog:v5];
  }
  return v2;
}

- (BOOL)modelsAvailableForPlatform:(id)a3
{
  id v3 = a3;
  BOOL v4 = ([v3 localizedCaseInsensitiveContainsString:@"iPhone"] & 1) != 0
    || [v3 localizedCaseInsensitiveContainsString:@"iPad"];

  return v4;
}

- (CGImage)getCGImageForIssue:(id)a3
{
  id v3 = a3;
  BOOL v4 = +[AXAuditScreenshotManager sharedManager];
  os_log_t v5 = [v3 timeStamp];

  id v6 = [v4 screenshotImageForTimestamp:v5];
  objc_super v7 = (CGImage *)[v6 CGImage];

  return v7;
}

- (int)findNewIssues:(id)a3 forPlatform:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [v7 firstObject];
  v9 = [(AXAuditDeduplicator *)self getCGImageForIssue:v8];

  BOOL v10 = [(AXAuditDeduplicator *)self modelsAvailableForPlatform:v6];
  v11 = [(AXAuditDeduplicator *)self log];
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (v10)
  {
    if (v12)
    {
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_247247000, v11, OS_LOG_TYPE_DEFAULT, "Deduplicating with models", v17, 2u);
    }

    v13 = [(AXAuditDeduplicator *)self models];
  }
  else
  {
    if (v12)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_247247000, v11, OS_LOG_TYPE_DEFAULT, "Deduplicating with heuristics", buf, 2u);
    }

    v13 = [(AXAuditDeduplicator *)self heuristics];
  }
  v14 = v13;
  int v15 = [v13 deduplicateIssues:v7 onImage:v9 forPlatform:v6];

  return v15;
}

+ (BOOL)isFrameworkAvailable
{
  return 1;
}

+ (void)downloadUIUnderstandingAssetsIfNeeded
{
  v2 = dispatch_queue_create("XRCAuditDeduplicator", 0);
  dispatch_async(v2, &__block_literal_global_19);
}

void __60__AXAuditDeduplicator_downloadUIUnderstandingAssetsIfNeeded__block_invoke()
{
  if (([MEMORY[0x263F83EC8] areModelsAvailable] & 1) == 0
    && ([MEMORY[0x263F83EC8] downloadModelSet:0 timeout:300.0] & 1) == 0
    && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    __60__AXAuditDeduplicator_downloadUIUnderstandingAssetsIfNeeded__block_invoke_cold_1();
  }
}

- (OS_os_log)log
{
  return (OS_os_log *)objc_getProperty(self, a2, 8, 1);
}

- (void)setLog:(id)a3
{
}

- (AXAuditDeduplicatorModels)models
{
  return (AXAuditDeduplicatorModels *)objc_getProperty(self, a2, 16, 1);
}

- (void)setModels:(id)a3
{
}

- (AXAuditDeduplicatorHeuristics)heuristics
{
  return (AXAuditDeduplicatorHeuristics *)objc_getProperty(self, a2, 24, 1);
}

- (void)setHeuristics:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heuristics, 0);
  objc_storeStrong((id *)&self->_models, 0);

  objc_storeStrong((id *)&self->_log, 0);
}

void __60__AXAuditDeduplicator_downloadUIUnderstandingAssetsIfNeeded__block_invoke_cold_1()
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_247247000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Failed to download UIUnderstandingAssets - do not dedupe issues", v0, 2u);
}

@end