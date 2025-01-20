@interface ATXBestAppDataSource
- (ATXBestAppDataSource)initWithDevice:(id)a3;
- (void)bestAppSuggestionWithCallback:(id)a3;
@end

@implementation ATXBestAppDataSource

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bestAppSuggestionManager, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

- (ATXBestAppDataSource)initWithDevice:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ATXBestAppDataSource;
  v6 = [(ATXBestAppDataSource *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_device, a3);
    uint64_t v8 = objc_opt_new();
    bestAppSuggestionManager = v7->_bestAppSuggestionManager;
    v7->_bestAppSuggestionManager = (UABestAppSuggestionManager *)v8;
  }
  return v7;
}

- (void)bestAppSuggestionWithCallback:(id)a3
{
  v4 = (void (**)(id, void *, void))a3;
  id v5 = [(UABestAppSuggestionManager *)self->_bestAppSuggestionManager bestAppSuggestion];
  if (!v5)
  {
    v6 = __atxlog_handle_heuristic();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1D0F43000, v6, OS_LOG_TYPE_DEFAULT, "bestAppSuggestionWithCallback: no bestApp suggestion (nil)", v7, 2u);
    }
  }
  v4[2](v4, v5, 0);
}

@end