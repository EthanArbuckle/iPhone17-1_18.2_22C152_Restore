@interface ATXWidgetLogUploadAllowList
- (ATXWidgetLogUploadAllowList)init;
- (ATXWidgetLogUploadAllowList)initWithAssets:(id)a3;
- (BOOL)logUploadAllowedForWidgetBundleId:(id)a3;
@end

@implementation ATXWidgetLogUploadAllowList

- (ATXWidgetLogUploadAllowList)init
{
  v3 = [MEMORY[0x1E4F4AF08] dictionaryForClass:objc_opt_class()];
  v4 = [(ATXWidgetLogUploadAllowList *)self initWithAssets:v3];

  return v4;
}

- (ATXWidgetLogUploadAllowList)initWithAssets:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ATXWidgetLogUploadAllowList;
  v5 = [(ATXWidgetLogUploadAllowList *)&v13 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"allowListEnabled"];
    v5->_allowListEnabled = [v6 BOOLValue];

    v7 = [v4 objectForKeyedSubscript:@"allowedWidgetBundleIds"];

    if (v7)
    {
      id v8 = objc_alloc(MEMORY[0x1E4F1CAD0]);
      v9 = [v4 objectForKeyedSubscript:@"allowedWidgetBundleIds"];
      uint64_t v10 = [v8 initWithArray:v9];
      allowedWidgetBundleIds = v5->_allowedWidgetBundleIds;
      v5->_allowedWidgetBundleIds = (NSSet *)v10;
    }
  }

  return v5;
}

- (BOOL)logUploadAllowedForWidgetBundleId:(id)a3
{
  return !self->_allowListEnabled || [(NSSet *)self->_allowedWidgetBundleIds containsObject:a3];
}

- (void).cxx_destruct
{
}

@end