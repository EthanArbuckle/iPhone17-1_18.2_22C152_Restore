@interface ATXFaceSuggestionConfiguredHomeScreenWidgetSignal
- (ATXFaceSuggestionConfiguredHomeScreenWidgetSignal)init;
- (double)valueForDescriptor:(id)a3;
- (double)weight;
- (void)_prepare;
@end

@implementation ATXFaceSuggestionConfiguredHomeScreenWidgetSignal

- (ATXFaceSuggestionConfiguredHomeScreenWidgetSignal)init
{
  v5.receiver = self;
  v5.super_class = (Class)ATXFaceSuggestionConfiguredHomeScreenWidgetSignal;
  v2 = [(ATXFaceSuggestionConfiguredHomeScreenWidgetSignal *)&v5 init];
  v3 = v2;
  if (v2) {
    [(ATXFaceSuggestionConfiguredHomeScreenWidgetSignal *)v2 _prepare];
  }
  return v3;
}

- (void)_prepare
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 136315394;
  v3 = "-[ATXFaceSuggestionConfiguredHomeScreenWidgetSignal _prepare]";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_ERROR, "%s: error loading home screen page configurations: %@", (uint8_t *)&v2, 0x16u);
}

- (double)valueForDescriptor:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  __int16 v4 = [a3 containerBundleIdentifier];
  if (v4)
  {
    int v5 = [(NSMutableSet *)self->_configuredWidgetContainerBundleIdentifiers containsObject:v4];
    uint64_t v6 = __atxlog_handle_lock_screen();
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    if (v5)
    {
      double v8 = 1.0;
      if (v7)
      {
        int v13 = 136315394;
        v14 = "-[ATXFaceSuggestionConfiguredHomeScreenWidgetSignal valueForDescriptor:]";
        __int16 v15 = 2112;
        v16 = v4;
        v9 = "%s: containerBundleId contains widgets on home screen: %@";
LABEL_9:
        v10 = v6;
        uint32_t v11 = 22;
        goto LABEL_10;
      }
    }
    else
    {
      double v8 = 0.0;
      if (v7)
      {
        int v13 = 136315394;
        v14 = "-[ATXFaceSuggestionConfiguredHomeScreenWidgetSignal valueForDescriptor:]";
        __int16 v15 = 2112;
        v16 = v4;
        v9 = "%s: containerBundleId does not contain widgets on home screen: %@";
        goto LABEL_9;
      }
    }
  }
  else
  {
    uint64_t v6 = __atxlog_handle_lock_screen();
    double v8 = 0.0;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 136315138;
      v14 = "-[ATXFaceSuggestionConfiguredHomeScreenWidgetSignal valueForDescriptor:]";
      v9 = "%s: no containerBundleId";
      v10 = v6;
      uint32_t v11 = 12;
LABEL_10:
      _os_log_impl(&dword_1D0FA3000, v10, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v13, v11);
    }
  }

  return v8;
}

- (double)weight
{
  return 10.0;
}

- (void).cxx_destruct
{
}

@end