@interface AFUIDisambiguationAnalyticsManager
+ (id)sharedManager;
- (AFDisambiguationAssistance)disambiguationAssistance;
- (AFUIDisambiguationAnalyticsManagerDataSource)dataSource;
- (NSArray)listItems;
- (id)_allListItems;
- (id)_listItemMatchingAceId:(id)a3;
- (void)_logDisambiguationSelectedEventWithListItem:(id)a3;
- (void)logDisambiguationDismissedEvent;
- (void)logDisambiguationItemSelected:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setDisambiguationAssistance:(id)a3;
- (void)setListItems:(id)a3;
@end

@implementation AFUIDisambiguationAnalyticsManager

+ (id)sharedManager
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __51__AFUIDisambiguationAnalyticsManager_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedManager_onceToken_0 != -1) {
    dispatch_once(&sharedManager_onceToken_0, block);
  }
  v2 = (void *)sharedManager_sharedManager_0;

  return v2;
}

uint64_t __51__AFUIDisambiguationAnalyticsManager_sharedManager__block_invoke(uint64_t a1)
{
  sharedManager_sharedManager_0 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return MEMORY[0x270F9A758]();
}

- (void)logDisambiguationItemSelected:(id)a3
{
  id v4 = a3;
  v5 = [v4 selectedAceId];
  v6 = [(AFUIDisambiguationAnalyticsManager *)self _listItemMatchingAceId:v5];

  if (v6)
  {
    v7 = [(AFUIDisambiguationAnalyticsManager *)self disambiguationAssistance];
    objc_msgSend(v7, "af_saveItemSelection:forType:", v6, 0);

    [(AFUIDisambiguationAnalyticsManager *)self _logDisambiguationSelectedEventWithListItem:v6];
  }
  else
  {
    v8 = (void *)*MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
      -[AFUIDisambiguationAnalyticsManager logDisambiguationItemSelected:](v8, v4);
    }
  }
}

- (void)logDisambiguationDismissedEvent
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  v3 = [(AFUIDisambiguationAnalyticsManager *)self _allListItems];
  id v4 = NSStringFromSelector(sel_sruif_appInfo);
  v5 = [v3 valueForKey:v4];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  v8 = v6;
  if (v7)
  {
    uint64_t v9 = v7;
    uint64_t v10 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v6);
        }
        v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v13 = objc_msgSend(v12, "metricsContext", (void)v17);
          if (v13)
          {
            v8 = (void *)v13;

            v14 = [(AFUIDisambiguationAnalyticsManager *)self _allListItems];
            v15 = [v14 firstObject];
            v16 = [v15 aceId];
            [(AFUIDisambiguationAnalyticsManager *)self _recordSASMetrics:v8 withSelectedBundleId:0 originalCommandId:v16];

            goto LABEL_12;
          }
        }
      }
      uint64_t v9 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v9) {
        continue;
      }
      break;
    }
    v8 = v6;
  }
LABEL_12:
}

- (void)_logDisambiguationSelectedEventWithListItem:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 aceId];
  id v6 = [v4 title];
  uint64_t v7 = [MEMORY[0x263F283F8] sharedAnalytics];
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __82__AFUIDisambiguationAnalyticsManager__logDisambiguationSelectedEventWithListItem___block_invoke;
  v28[3] = &unk_2646928F8;
  v28[4] = v5;
  v28[5] = v6;
  [v7 logEventWithType:1426 contextProvider:v28];

  v8 = objc_msgSend(v4, "sruif_appInfo");
  uint64_t v9 = [(AFUIDisambiguationAnalyticsManager *)self _allListItems];
  uint64_t v10 = NSStringFromSelector(sel_sruif_appInfo);
  v11 = [v9 valueForKey:v10];

  v12 = [v8 appIdentifyingInfo];
  uint64_t v13 = objc_msgSend(v12, "sruif_bundleId");

  if (v8)
  {
    id v14 = [v8 metricsContext];
    if (v14)
    {
LABEL_13:
      v21 = [v4 aceId];
      [(AFUIDisambiguationAnalyticsManager *)self _recordSASMetrics:v14 withSelectedBundleId:v13 originalCommandId:v21];
    }
    else
    {
      long long v26 = 0u;
      long long v27 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      id v14 = v11;
      uint64_t v15 = [v14 countByEnumeratingWithState:&v24 objects:v29 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v22 = self;
        v23 = v5;
        uint64_t v17 = *(void *)v25;
        while (2)
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v25 != v17) {
              objc_enumerationMutation(v14);
            }
            uint64_t v19 = objc_msgSend(*(id *)(*((void *)&v24 + 1) + 8 * i), "metricsContext", v22);
            if (v19)
            {
              long long v20 = (void *)v19;

              id v14 = v20;
              self = v22;
              v5 = v23;
              goto LABEL_13;
            }
          }
          uint64_t v16 = [v14 countByEnumeratingWithState:&v24 objects:v29 count:16];
          if (v16) {
            continue;
          }
          break;
        }
        v5 = v23;
      }
    }
  }
}

id __82__AFUIDisambiguationAnalyticsManager__logDisambiguationSelectedEventWithListItem___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  [v2 setObject:@"manual" forKey:@"type"];
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    [v2 setObject:v3 forKey:@"aceId"];
  }
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4) {
    [v2 setObject:v4 forKey:@"title"];
  }

  return v2;
}

- (id)_listItemMatchingAceId:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    v5 = [(AFUIDisambiguationAnalyticsManager *)self _allListItems];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v18;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v18 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          v11 = [v10 aceId];
          if ([v11 isEqualToString:v4])
          {

LABEL_15:
            id v15 = v10;
            goto LABEL_16;
          }
          v12 = objc_msgSend(v10, "sruif_appInfo");
          uint64_t v13 = [v12 aceId];
          char v14 = [v13 isEqualToString:v4];

          if (v14) {
            goto LABEL_15;
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
        id v15 = 0;
        if (v7) {
          continue;
        }
        break;
      }
    }
    else
    {
      id v15 = 0;
    }
LABEL_16:
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

- (id)_allListItems
{
  id v2 = [(AFUIDisambiguationAnalyticsManager *)self listItems];
  uint64_t v3 = [v2 valueForKeyPath:@"@unionOfArrays.self"];

  return v3;
}

- (AFUIDisambiguationAnalyticsManagerDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  return (AFUIDisambiguationAnalyticsManagerDataSource *)WeakRetained;
}

- (void)setDataSource:(id)a3
{
}

- (NSArray)listItems
{
  return self->_listItems;
}

- (void)setListItems:(id)a3
{
}

- (AFDisambiguationAssistance)disambiguationAssistance
{
  return self->_disambiguationAssistance;
}

- (void)setDisambiguationAssistance:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_disambiguationAssistance, 0);
  objc_storeStrong((id *)&self->_listItems, 0);

  objc_destroyWeak((id *)&self->_dataSource);
}

- (void)logDisambiguationItemSelected:(void *)a1 .cold.1(void *a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v3 = a1;
  id v4 = [a2 selectedAceId];
  int v5 = 136315394;
  uint64_t v6 = "-[AFUIDisambiguationAnalyticsManager logDisambiguationItemSelected:]";
  __int16 v7 = 2112;
  uint64_t v8 = v4;
  _os_log_error_impl(&dword_223099000, v3, OS_LOG_TYPE_ERROR, "%s Failed to log 'disambiguation selected' event with selected ace id: %@", (uint8_t *)&v5, 0x16u);
}

@end