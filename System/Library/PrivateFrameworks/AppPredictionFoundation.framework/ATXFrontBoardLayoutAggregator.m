@interface ATXFrontBoardLayoutAggregator
- (ATXFrontBoardLayoutAggregator)init;
- (BOOL)_isAppWithBundleIdentifierVisible:(id)a3;
- (id)fetchActiveApps;
@end

@implementation ATXFrontBoardLayoutAggregator

- (ATXFrontBoardLayoutAggregator)init
{
  v7.receiver = self;
  v7.super_class = (Class)ATXFrontBoardLayoutAggregator;
  v2 = [(ATXFrontBoardLayoutAggregator *)&v7 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    bundleIdentifierToVisibilityMap = v2->_bundleIdentifierToVisibilityMap;
    v2->_bundleIdentifierToVisibilityMap = v3;

    v5 = v2;
  }

  return v2;
}

- (id)fetchActiveApps
{
  v3 = objc_opt_new();
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceNow:-86400.0];
  v5 = BiomeLibrary();
  v6 = [v5 FrontBoard];
  objc_super v7 = [v6 DisplayElement];
  v8 = (void *)[objc_alloc(MEMORY[0x1E4F503E8]) initWithStartDate:v4 endDate:0 maxEvents:100 lastN:100 reversed:0];
  v9 = [v7 publisherWithUseCase:@"ProactiveAppPrediction" options:v8];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __48__ATXFrontBoardLayoutAggregator_fetchActiveApps__block_invoke_4;
  v15[3] = &unk_1E68A37E0;
  v15[4] = self;
  id v10 = v3;
  id v16 = v10;
  id v11 = (id)[v9 sinkWithCompletion:&__block_literal_global_3 receiveInput:v15];

  v12 = v16;
  id v13 = v10;

  return v13;
}

void __48__ATXFrontBoardLayoutAggregator_fetchActiveApps__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 error];

  if (v3)
  {
    v4 = __atxlog_handle_default();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __48__ATXFrontBoardLayoutAggregator_fetchActiveApps__block_invoke_cold_1(v2, v4);
    }
  }
}

void __48__ATXFrontBoardLayoutAggregator_fetchActiveApps__block_invoke_4(uint64_t a1, void *a2)
{
  id v17 = a2;
  v3 = [v17 eventBody];
  if (![v3 isUIApplicationElement]) {
    goto LABEL_10;
  }
  v4 = [v17 eventBody];
  v5 = [v4 bundleIdentifier];

  v6 = v17;
  if (!v5) {
    goto LABEL_11;
  }
  objc_super v7 = [v17 eventBody];
  if ([v7 changeType] != 1)
  {

    id v11 = v17;
    goto LABEL_7;
  }
  v8 = *(void **)(a1 + 32);
  v9 = [v17 eventBody];
  id v10 = [v9 bundleIdentifier];
  LODWORD(v8) = [v8 _isAppWithBundleIdentifierVisible:v10];

  id v11 = v17;
  if (!v8)
  {
LABEL_7:
    v14 = [v11 eventBody];
    int v15 = [v14 changeType];

    v6 = v17;
    if (v15 != 3) {
      goto LABEL_11;
    }
    id v16 = *(void **)(a1 + 40);
    v3 = [v17 eventBody];
    id v13 = [v3 bundleIdentifier];
    [v16 removeObject:v13];
    goto LABEL_9;
  }
  v12 = *(void **)(a1 + 40);
  v3 = [v17 eventBody];
  id v13 = [v3 bundleIdentifier];
  [v12 addObject:v13];
LABEL_9:

LABEL_10:
  v6 = v17;
LABEL_11:
}

- (BOOL)_isAppWithBundleIdentifierVisible:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    v5 = self;
    objc_sync_enter(v5);
    v6 = [(NSMutableDictionary *)v5->_bundleIdentifierToVisibilityMap objectForKeyedSubscript:v4];
    objc_super v7 = v6;
    if (v6)
    {
      LOBYTE(v8) = [v6 BOOLValue];
    }
    else
    {
      id v14 = 0;
      v9 = (void *)[objc_alloc(MEMORY[0x1E4F223C8]) initWithBundleIdentifier:v4 allowPlaceholder:0 error:&v14];
      id v10 = v14;
      if (v9)
      {
        id v11 = [v9 appTags];
        uint64_t v8 = [v11 containsObject:@"hidden"] ^ 1;

        v12 = [NSNumber numberWithBool:v8];
        [(NSMutableDictionary *)v5->_bundleIdentifierToVisibilityMap setObject:v12 forKeyedSubscript:v4];
      }
      else
      {
        v12 = __atxlog_handle_default();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
          -[ATXFrontBoardLayoutAggregator _isAppWithBundleIdentifierVisible:]((uint64_t)v10, v12);
        }
        LOBYTE(v8) = 0;
      }
    }
    objc_sync_exit(v5);
  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (void).cxx_destruct
{
}

void __48__ATXFrontBoardLayoutAggregator_fetchActiveApps__block_invoke_cold_1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3 = [a1 error];
  int v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_1D0F2B000, a2, OS_LOG_TYPE_ERROR, "ATXFrontBoardLayoutAggregator: error fetching FrontBoard display elements: %@", (uint8_t *)&v4, 0xCu);
}

- (void)_isAppWithBundleIdentifierVisible:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D0F2B000, a2, OS_LOG_TYPE_ERROR, "ATXFrontBoardLayoutAggregator: could not obtain record: %@", (uint8_t *)&v2, 0xCu);
}

@end