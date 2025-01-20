@interface ATXFaceSuggestionGlobalPopularitySignal
- (ATXFaceSuggestionGlobalPopularitySignal)initWithParameters:(id)a3;
- (double)valueForDescriptor:(id)a3;
- (double)weight;
@end

@implementation ATXFaceSuggestionGlobalPopularitySignal

- (ATXFaceSuggestionGlobalPopularitySignal)initWithParameters:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXFaceSuggestionGlobalPopularitySignal;
  v5 = [(ATXFaceSuggestionGlobalPopularitySignal *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 globalPopularityScores];
    globalPopularityScores = v5->_globalPopularityScores;
    v5->_globalPopularityScores = (NSDictionary *)v6;
  }
  return v5;
}

- (double)valueForDescriptor:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(NSDictionary *)self->_globalPopularityScores objectForKeyedSubscript:v4];
  uint64_t v6 = v5;
  if (v5)
  {
    [v5 doubleValue];
    double v8 = v7;
  }
  else
  {
    objc_super v9 = __atxlog_handle_lock_screen();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 136315394;
      v12 = "-[ATXFaceSuggestionGlobalPopularitySignal valueForDescriptor:]";
      __int16 v13 = 2112;
      id v14 = v4;
      _os_log_impl(&dword_1D0FA3000, v9, OS_LOG_TYPE_DEFAULT, "%s: no global popularity score present for descriptor: %@", (uint8_t *)&v11, 0x16u);
    }

    double v8 = 0.0;
  }

  return v8;
}

- (double)weight
{
  return 1.0;
}

- (void).cxx_destruct
{
}

@end