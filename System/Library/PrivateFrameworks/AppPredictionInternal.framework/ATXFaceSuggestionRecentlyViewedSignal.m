@interface ATXFaceSuggestionRecentlyViewedSignal
- (ATXFaceSuggestionRecentlyViewedSignal)init;
- (double)valueForDescriptor:(id)a3;
- (double)weight;
@end

@implementation ATXFaceSuggestionRecentlyViewedSignal

- (ATXFaceSuggestionRecentlyViewedSignal)init
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v16.receiver = self;
  v16.super_class = (Class)ATXFaceSuggestionRecentlyViewedSignal;
  v2 = [(ATXFaceSuggestionRecentlyViewedSignal *)&v16 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    recentlyViewedFeaturedDescriptorKeys = v2->_recentlyViewedFeaturedDescriptorKeys;
    v2->_recentlyViewedFeaturedDescriptorKeys = (NSCountedSet *)v3;

    v5 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    v6 = objc_opt_new();
    v7 = [v5 dateByAddingUnit:16 value:-7 toDate:v6 options:0];

    v8 = objc_opt_new();
    [v7 timeIntervalSinceReferenceDate];
    v9 = objc_msgSend(v8, "publisherFromStartTime:");

    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __45__ATXFaceSuggestionRecentlyViewedSignal_init__block_invoke_14;
    v14[3] = &unk_1E68ABB70;
    v15 = v2;
    id v10 = (id)[v9 sinkWithCompletion:&__block_literal_global_232 receiveInput:v14];
    v11 = __atxlog_handle_lock_screen();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = v2->_recentlyViewedFeaturedDescriptorKeys;
      *(_DWORD *)buf = 136315394;
      v18 = "-[ATXFaceSuggestionRecentlyViewedSignal init]";
      __int16 v19 = 2112;
      v20 = v12;
      _os_log_impl(&dword_1D0FA3000, v11, OS_LOG_TYPE_DEFAULT, "%s: recently viewed descriptors: %@", buf, 0x16u);
    }
  }
  return v2;
}

void __45__ATXFaceSuggestionRecentlyViewedSignal_init__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  uint64_t v3 = [v2 state];
  if (!v3)
  {
    v4 = __atxlog_handle_lock_screen();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315138;
      v6 = "-[ATXFaceSuggestionRecentlyViewedSignal init]_block_invoke";
      _os_log_impl(&dword_1D0FA3000, v4, OS_LOG_TYPE_DEFAULT, "%s: successfully sinked face gallery biome stream publisher", (uint8_t *)&v5, 0xCu);
    }
    goto LABEL_7;
  }
  if (v3 == 1)
  {
    v4 = __atxlog_handle_lock_screen();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __45__ATXFaceSuggestionRecentlyViewedSignal_init__block_invoke_cold_1(v2, v4);
    }
LABEL_7:
  }
}

void __45__ATXFaceSuggestionRecentlyViewedSignal_init__block_invoke_14(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = [v3 eventBody];
  uint64_t v5 = [v4 eventType];

  if (v5 == 1)
  {
    v6 = [v3 eventBody];
    uint64_t v7 = [v6 configuration];

    if ([v7 source] == 1)
    {
      uint64_t v21 = v7;
      v8 = [v7 sections];
      v9 = objc_msgSend(v8, "bs_firstObjectPassingTest:", &__block_literal_global_17_6);

      long long v24 = 0u;
      long long v25 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      v20 = v9;
      id v10 = [v9 items];
      uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v23;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v23 != v13) {
              objc_enumerationMutation(v10);
            }
            v15 = *(void **)(*((void *)&v22 + 1) + 8 * i);
            objc_super v16 = *(void **)(*(void *)(a1 + 32) + 8);
            v17 = [v15 extensionBundleIdentifier];
            v18 = [v15 descriptorIdentifier];
            __int16 v19 = descriptorKey(v17, v18);
            [v16 addObject:v19];
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
        }
        while (v12);
      }

      uint64_t v7 = v21;
    }
  }
}

BOOL __45__ATXFaceSuggestionRecentlyViewedSignal_init__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 semanticType] == 1;
}

- (double)valueForDescriptor:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 extensionBundleIdentifier];
  v6 = [v4 identifier];
  uint64_t v7 = descriptorKey(v5, v6);

  unint64_t v8 = [(NSCountedSet *)self->_recentlyViewedFeaturedDescriptorKeys countForObject:v7];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v9 = self->_recentlyViewedFeaturedDescriptorKeys;
  uint64_t v10 = [(NSCountedSet *)v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (!v10)
  {

LABEL_11:
    double v15 = 0.0;
    goto LABEL_12;
  }
  uint64_t v11 = v10;
  unint64_t v12 = 0;
  uint64_t v13 = *(void *)v18;
  do
  {
    for (uint64_t i = 0; i != v11; ++i)
    {
      if (*(void *)v18 != v13) {
        objc_enumerationMutation(v9);
      }
      v12 += -[NSCountedSet countForObject:](self->_recentlyViewedFeaturedDescriptorKeys, "countForObject:", *(void *)(*((void *)&v17 + 1) + 8 * i), (void)v17);
    }
    uint64_t v11 = [(NSCountedSet *)v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  }
  while (v11);

  if (!v12) {
    goto LABEL_11;
  }
  double v15 = (double)v8 / (double)v12;
LABEL_12:

  return v15;
}

- (double)weight
{
  return -50.0;
}

- (void).cxx_destruct
{
}

void __45__ATXFaceSuggestionRecentlyViewedSignal_init__block_invoke_cold_1(void *a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = [a1 error];
  int v4 = 136315394;
  uint64_t v5 = "-[ATXFaceSuggestionRecentlyViewedSignal init]_block_invoke";
  __int16 v6 = 2112;
  uint64_t v7 = v3;
  _os_log_error_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_ERROR, "%s: error while sinking face gallery biome stream publisher: %@", (uint8_t *)&v4, 0x16u);
}

@end