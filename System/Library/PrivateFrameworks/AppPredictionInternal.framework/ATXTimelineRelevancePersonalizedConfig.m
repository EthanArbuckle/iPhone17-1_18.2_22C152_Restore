@interface ATXTimelineRelevancePersonalizedConfig
- (ATXTimelineRelevancePersonalizedConfig)init;
- (ATXTimelineRelevancePersonalizedConfig)initWithPersonalizedConfiguration:(id)a3;
- (id)_readPersonalizedConfiguration;
- (id)personalizedValueForParameter:(id)a3 forWidgetBundleIdentifier:(id)a4 kind:(id)a5;
- (void)_readPersonalizedConfiguration;
@end

@implementation ATXTimelineRelevancePersonalizedConfig

- (ATXTimelineRelevancePersonalizedConfig)init
{
  v7.receiver = self;
  v7.super_class = (Class)ATXTimelineRelevancePersonalizedConfig;
  v2 = [(ATXTimelineRelevancePersonalizedConfig *)&v7 init];
  v3 = v2;
  if (v2)
  {
    uint64_t v4 = [(ATXTimelineRelevancePersonalizedConfig *)v2 _readPersonalizedConfiguration];
    personalizedConfiguration = v3->_personalizedConfiguration;
    v3->_personalizedConfiguration = (NSDictionary *)v4;
  }
  return v3;
}

- (ATXTimelineRelevancePersonalizedConfig)initWithPersonalizedConfiguration:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXTimelineRelevancePersonalizedConfig;
  v6 = [(ATXTimelineRelevancePersonalizedConfig *)&v9 init];
  objc_super v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_personalizedConfiguration, a3);
  }

  return v7;
}

- (id)personalizedValueForParameter:(id)a3 forWidgetBundleIdentifier:(id)a4 kind:(id)a5
{
  id v8 = a3;
  personalizedConfiguration = self->_personalizedConfiguration;
  id v10 = a5;
  v11 = [(NSDictionary *)personalizedConfiguration objectForKeyedSubscript:a4];
  v12 = [v11 objectForKeyedSubscript:v10];

  v13 = v12;
  if (v12 || (v13 = v11) != 0)
  {
    v14 = [v13 objectForKeyedSubscript:v8];
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)_readPersonalizedConfiguration
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F4B650] appPredictionDirectoryFile:@"ATXTimelineRelevancePersonalizedConfig"];
  v3 = (void *)MEMORY[0x1D25F6CC0]();
  id v17 = 0;
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfFile:v2 options:0 error:&v17];
  id v5 = v17;
  if (v4)
  {
    id v6 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    objc_super v9 = objc_msgSend(v6, "initWithObjects:", v7, v8, objc_opt_class(), 0);
    id v10 = (void *)MEMORY[0x1D25F6CC0]();
    id v16 = v5;
    v11 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClasses:v9 fromData:v4 error:&v16];
    id v12 = v16;

    if (v11)
    {
      id v13 = v11;
    }
    else
    {
      v14 = __atxlog_handle_timeline();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
        [(ATXTimelineRelevancePersonalizedConfig *)(uint64_t)v2 _readPersonalizedConfiguration];
      }
    }
  }
  else
  {
    objc_super v9 = __atxlog_handle_timeline();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543618;
      v19 = v2;
      __int16 v20 = 2114;
      id v21 = v5;
      _os_log_impl(&dword_1D0FA3000, v9, OS_LOG_TYPE_INFO, "ATXTimelineRelevancePersonalizedConfig does not exist at path: %{public}@: %{public}@", buf, 0x16u);
    }
    v11 = 0;
    id v12 = v5;
  }

  return v11;
}

- (void).cxx_destruct
{
}

- (void)_readPersonalizedConfiguration
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_fault_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_FAULT, "Failed to read personalized configuration at path: %{public}@. Error: %{public}@", (uint8_t *)&v3, 0x16u);
}

@end