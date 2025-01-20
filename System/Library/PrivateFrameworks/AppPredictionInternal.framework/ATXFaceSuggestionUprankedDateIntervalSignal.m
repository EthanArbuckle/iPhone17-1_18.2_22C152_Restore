@interface ATXFaceSuggestionUprankedDateIntervalSignal
- (ATXFaceSuggestionUprankedDateIntervalSignal)initWithParameters:(id)a3;
- (double)valueForDescriptor:(id)a3;
- (double)weight;
@end

@implementation ATXFaceSuggestionUprankedDateIntervalSignal

- (ATXFaceSuggestionUprankedDateIntervalSignal)initWithParameters:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXFaceSuggestionUprankedDateIntervalSignal;
  v5 = [(ATXFaceSuggestionUprankedDateIntervalSignal *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 uprankedDateIntervals];
    uprankedDateIntervals = v5->_uprankedDateIntervals;
    v5->_uprankedDateIntervals = (NSDictionary *)v6;
  }
  return v5;
}

- (double)valueForDescriptor:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  uprankedDateIntervals = self->_uprankedDateIntervals;
  if (uprankedDateIntervals)
  {
    v7 = [v4 extensionBundleIdentifier];
    v8 = [(NSDictionary *)uprankedDateIntervals objectForKeyedSubscript:v7];

    if (v8)
    {
      objc_super v9 = objc_opt_new();
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __66__ATXFaceSuggestionUprankedDateIntervalSignal_valueForDescriptor___block_invoke;
      v16[3] = &unk_1E68B16F8;
      id v10 = v9;
      id v17 = v10;
      uint64_t v11 = [v8 bs_firstObjectPassingTest:v16];
      if (v11)
      {
        v12 = (void *)v11;
        v13 = __atxlog_handle_lock_screen();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          v19 = "-[ATXFaceSuggestionUprankedDateIntervalSignal valueForDescriptor:]";
          __int16 v20 = 2112;
          v21 = v12;
          __int16 v22 = 2112;
          v23 = v5;
          _os_log_impl(&dword_1D0FA3000, v13, OS_LOG_TYPE_DEFAULT, "%s: descriptor has valid interval: %@, %@", buf, 0x20u);
        }

        double v14 = 1.0;
      }
      else
      {
        double v14 = 0.0;
      }
    }
    else
    {
      double v14 = 0.0;
    }
  }
  else
  {
    v8 = __atxlog_handle_lock_screen();
    double v14 = 0.0;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[ATXFaceSuggestionUprankedDateIntervalSignal valueForDescriptor:](v8);
    }
  }

  return v14;
}

uint64_t __66__ATXFaceSuggestionUprankedDateIntervalSignal_valueForDescriptor___block_invoke(uint64_t a1, void *a2)
{
  return [a2 containsDate:*(void *)(a1 + 32)];
}

- (double)weight
{
  return 30.0;
}

- (void).cxx_destruct
{
}

- (void)valueForDescriptor:(os_log_t)log .cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136315138;
  v2 = "-[ATXFaceSuggestionUprankedDateIntervalSignal valueForDescriptor:]";
  _os_log_error_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_ERROR, "%s: no upranked date intervals found", (uint8_t *)&v1, 0xCu);
}

@end