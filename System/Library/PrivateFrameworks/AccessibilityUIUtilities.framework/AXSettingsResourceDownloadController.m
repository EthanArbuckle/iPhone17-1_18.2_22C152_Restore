@interface AXSettingsResourceDownloadController
- (AXSettingsResourceDownloadController)init;
- (AXSpeechSettingsModelController)speechModelController;
- (BOOL)allowedToDownload;
- (BOOL)showPerVoiceSettings;
- (NSMutableDictionary)downloadProgessByVoiceID;
- (NSString)speechSourceKey;
- (id)getDialectPreferencesCallback;
- (id)getPerVoiceSettingsCallack;
- (id)getVoiceAllowedCallback;
- (id)getVoiceSettingsForVoice:(id)a3;
- (id)setDialectPreferencesCallback;
- (id)setPerVoiceSettingsCallack;
- (id)specifierForVoiceId:(id)a3;
- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4;
- (void)deleteResource:(id)a3;
- (void)openVoiceSettingsFor:(id)a3;
- (void)playSampleForResource:(id)a3 completion:(id)a4;
- (void)restoreDownloadProgress;
- (void)setGetDialectPreferencesCallback:(id)a3;
- (void)setGetPerVoiceSettingsCallack:(id)a3;
- (void)setGetVoiceAllowedCallback:(id)a3;
- (void)setSelectedSpecifier:(id)a3;
- (void)setSetDialectPreferencesCallback:(id)a3;
- (void)setSetPerVoiceSettingsCallack:(id)a3;
- (void)setShowPerVoiceSettings:(BOOL)a3;
- (void)setSpeechModelController:(id)a3;
- (void)setSpeechSourceKey:(id)a3;
- (void)startDownloadForResource:(id)a3;
- (void)stopDownloadForResource:(id)a3;
- (void)updateSettings;
- (void)voiceSettingsDidChangeForVoice:(id)a3 settings:(id)a4;
@end

@implementation AXSettingsResourceDownloadController

- (AXSettingsResourceDownloadController)init
{
  v3.receiver = self;
  v3.super_class = (Class)AXSettingsResourceDownloadController;
  result = [(AXUISettingsListController *)&v3 init];
  if (result) {
    result->_showPerVoiceSettings = 1;
  }
  return result;
}

- (BOOL)showPerVoiceSettings
{
  objc_super v3 = [(AXSettingsResourceDownloadController *)self specifier];
  v4 = [v3 propertyForKey:@"PVSettings"];

  if (v4) {
    char showPerVoiceSettings = [v4 BOOLValue];
  }
  else {
    char showPerVoiceSettings = self->_showPerVoiceSettings;
  }

  return showPerVoiceSettings;
}

- (AXSpeechSettingsModelController)speechModelController
{
  speechModelController = self->_speechModelController;
  if (!speechModelController)
  {
    v4 = [(AXSettingsResourceDownloadController *)self specifier];
    v5 = [v4 propertyForKey:@"speechModelController"];

    if (v5) {
      v6 = (objc_class *)objc_opt_class();
    }
    else {
      v6 = (objc_class *)AXSpeechSettingsModelController;
    }
    v7 = (AXSpeechSettingsModelController *)objc_alloc_init(v6);
    v8 = self->_speechModelController;
    self->_speechModelController = v7;

    speechModelController = self->_speechModelController;
  }
  return speechModelController;
}

- (NSMutableDictionary)downloadProgessByVoiceID
{
  v2 = [(AXSettingsResourceDownloadController *)self speechModelController];
  objc_super v3 = [v2 downloadProgessByVoiceID];

  return (NSMutableDictionary *)v3;
}

- (void)restoreDownloadProgress
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  [(AXSettingsResourceDownloadController *)self specifiers];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v20 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v20)
  {
    uint64_t v19 = *(void *)v28;
    do
    {
      uint64_t v3 = 0;
      do
      {
        if (*(void *)v28 != v19) {
          objc_enumerationMutation(obj);
        }
        uint64_t v21 = v3;
        v22 = *(void **)(*((void *)&v27 + 1) + 8 * v3);
        v4 = [v22 propertyForKey:@"Resources"];
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        uint64_t v5 = [v4 countByEnumeratingWithState:&v23 objects:v31 count:16];
        if (v5)
        {
          uint64_t v6 = v5;
          uint64_t v7 = *(void *)v24;
          do
          {
            for (uint64_t i = 0; i != v6; ++i)
            {
              if (*(void *)v24 != v7) {
                objc_enumerationMutation(v4);
              }
              v9 = *(void **)(*((void *)&v23 + 1) + 8 * i);
              uint64_t v10 = [v9 voiceId];
              if (v10)
              {
                v11 = (void *)v10;
                v12 = [(AXSettingsResourceDownloadController *)self downloadProgessByVoiceID];
                v13 = [v9 voiceId];
                v14 = [v12 objectForKeyedSubscript:v13];

                if (v14)
                {
                  v15 = [(AXSettingsResourceDownloadController *)self downloadProgessByVoiceID];
                  v16 = [v9 voiceId];
                  v17 = [v15 objectForKeyedSubscript:v16];
                  [v22 setProperty:v17 forKey:@"DownloadProgress"];
                }
              }
            }
            uint64_t v6 = [v4 countByEnumeratingWithState:&v23 objects:v31 count:16];
          }
          while (v6);
        }

        uint64_t v3 = v21 + 1;
      }
      while (v21 + 1 != v20);
      uint64_t v20 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v20);
  }
  [(AXSettingsResourceDownloadController *)self reloadSpecifiers];
}

- (void)startDownloadForResource:(id)a3
{
  id v4 = a3;
  id v5 = [(AXSettingsResourceDownloadController *)self speechModelController];
  [v5 startDownloadForResource:v4];
}

- (void)stopDownloadForResource:(id)a3
{
  id v4 = a3;
  id v5 = [(AXSettingsResourceDownloadController *)self speechModelController];
  [v5 stopDownloadForResource:v4];
}

- (void)deleteResource:(id)a3
{
  id v4 = a3;
  id v5 = [(AXSettingsResourceDownloadController *)self speechModelController];
  [v5 deleteResource:v4];
}

- (void)playSampleForResource:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(AXSettingsResourceDownloadController *)self speechModelController];
  [v8 playSampleForResource:v7 completion:v6];
}

- (BOOL)allowedToDownload
{
  v2 = [(AXSettingsResourceDownloadController *)self speechModelController];
  char v3 = [v2 allowedToDownload];

  return v3;
}

- (void)openVoiceSettingsFor:(id)a3
{
  id v4 = a3;
  id v8 = objc_alloc_init(AXSpeechSettingsPerVoicePreferencesController);
  [(AXSpeechSettingsPerVoicePreferencesController *)v8 setParentController:self];
  id v5 = [(AXSettingsResourceDownloadController *)self speechSourceKey];
  [(AXSpeechSettingsPerVoicePreferencesController *)v8 setSpeechSourceKey:v5];

  id v6 = [v4 speechVoice];

  id v7 = [v6 identifier];
  [(AXSpeechSettingsPerVoicePreferencesController *)v8 setVoiceIdentifier:v7];

  [(AXUISettingsSetupCapableListController *)self showController:v8 animate:1];
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(AXSettingsResourceDownloadController *)self specifierAtIndex:[(AXSettingsResourceDownloadController *)self indexForIndexPath:v6]];
  v9 = [v8 propertyForKey:@"Resources"];
  uint64_t v10 = [v7 cellForRowAtIndexPath:v6];

  [v10 accessibilityActivate];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && [v9 count] == 1
    && ([v9 firstObject],
        v11 = objc_claimAutoreleasedReturnValue(),
        int v12 = [v11 isInstalled],
        v11,
        !v12))
  {
    id v13 = 0;
  }
  else
  {
    id v13 = v6;
  }

  return v13;
}

- (void)setSelectedSpecifier:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = [(AXSettingsResourceDownloadController *)self specifiers];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    uint64_t v9 = MEMORY[0x1E4F1CC28];
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        [v11 setProperty:v9 forKey:@"IsSelected"];
        int v12 = [(AXUISettingsBaseListController *)self cellForSpecifier:v11];
        [v12 refreshCellContentsWithSpecifier:v11];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  [v4 setProperty:MEMORY[0x1E4F1CC38] forKey:@"IsSelected"];
  id v13 = [(AXUISettingsBaseListController *)self cellForSpecifier:v4];
  [v13 refreshCellContentsWithSpecifier:v4];
}

- (id)specifierForVoiceId:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = [(AXSettingsResourceDownloadController *)self specifiers];
  uint64_t v5 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v20 = *(void *)v27;
    id v21 = 0;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v27 != v20) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        uint64_t v9 = [v8 propertyForKey:@"Resources"];
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        id v10 = v9;
        uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v30 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v23;
          while (2)
          {
            for (uint64_t j = 0; j != v12; ++j)
            {
              if (*(void *)v23 != v13) {
                objc_enumerationMutation(v10);
              }
              long long v15 = [*(id *)(*((void *)&v22 + 1) + 8 * j) voiceId];
              int v16 = [v15 isEqualToString:v4];

              if (v16)
              {
                id v17 = v8;

                id v21 = v17;
                goto LABEL_16;
              }
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v22 objects:v30 count:16];
            if (v12) {
              continue;
            }
            break;
          }
        }
LABEL_16:
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v6);
  }
  else
  {
    id v21 = 0;
  }

  return v21;
}

- (void)updateSettings
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  char v3 = [(AXSettingsResourceDownloadController *)self parentViewController];

  if (v3)
  {
    id v4 = [(AXSettingsResourceDownloadController *)self specifier];
    uint64_t v5 = [v4 propertyForKey:@"Resources"];

    uint64_t v33 = self;
    uint64_t v6 = [(AXSettingsResourceDownloadController *)self speechModelController];
    v36 = [v6 getAllResources];

    v40 = [MEMORY[0x1E4F1CA60] dictionary];
    v39 = [MEMORY[0x1E4F1CA48] array];
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    id obj = v5;
    uint64_t v37 = [obj countByEnumeratingWithState:&v49 objects:v58 count:16];
    if (v37)
    {
      uint64_t v35 = *(void *)v50;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v50 != v35) {
            objc_enumerationMutation(obj);
          }
          uint64_t v38 = v7;
          uint64_t v8 = *(void **)(*((void *)&v49 + 1) + 8 * v7);
          long long v45 = 0u;
          long long v46 = 0u;
          long long v47 = 0u;
          long long v48 = 0u;
          id v9 = v36;
          uint64_t v10 = [v9 countByEnumeratingWithState:&v45 objects:v57 count:16];
          if (v10)
          {
            uint64_t v11 = v10;
            uint64_t v12 = *(void *)v46;
            do
            {
              for (uint64_t i = 0; i != v11; ++i)
              {
                if (*(void *)v46 != v12) {
                  objc_enumerationMutation(v9);
                }
                long long v14 = *(void **)(*((void *)&v45 + 1) + 8 * i);
                long long v15 = [v8 voiceId];
                int v16 = [v14 voiceId];
                if ([v15 isEqualToString:v16])
                {
                  id v17 = [v14 voiceId];
                  v18 = [v40 objectForKey:v17];

                  if (!v18)
                  {
                    int v19 = [v8 isInstalled];
                    if (v19 != [v14 isInstalled])
                    {
                      uint64_t v20 = [v14 voiceId];
                      [v40 setObject:v14 forKey:v20];
                    }
                    [v39 addObject:v14];
                  }
                }
                else
                {
                }
              }
              uint64_t v11 = [v9 countByEnumeratingWithState:&v45 objects:v57 count:16];
            }
            while (v11);
          }

          uint64_t v7 = v38 + 1;
        }
        while (v38 + 1 != v37);
        uint64_t v37 = [obj countByEnumeratingWithState:&v49 objects:v58 count:16];
      }
      while (v37);
    }

    id v21 = AXLogSpeechAssetDownload();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      long long v22 = [v40 allValues];
      *(_DWORD *)buf = 138543362;
      v56 = v22;
      _os_log_impl(&dword_1C39D1000, v21, OS_LOG_TYPE_DEFAULT, "Assets changed: using new updated voices: %{public}@", buf, 0xCu);
    }
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v23 = [v40 allKeys];
    uint64_t v24 = [v23 countByEnumeratingWithState:&v41 objects:v54 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v42;
      do
      {
        for (uint64_t j = 0; j != v25; ++j)
        {
          if (*(void *)v42 != v26) {
            objc_enumerationMutation(v23);
          }
          uint64_t v28 = *(void *)(*((void *)&v41 + 1) + 8 * j);
          long long v29 = [(AXSettingsResourceDownloadController *)v33 specifierForVoiceId:v28];
          long long v30 = [v40 objectForKeyedSubscript:v28];
          v53 = v30;
          v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v53 count:1];
          [v29 setProperty:v31 forKey:@"Resources"];

          [(AXSettingsResourceDownloadController *)v33 reloadSpecifier:v29];
        }
        uint64_t v25 = [v23 countByEnumeratingWithState:&v41 objects:v54 count:16];
      }
      while (v25);
    }

    uint64_t v32 = [(AXSettingsResourceDownloadController *)v33 specifier];
    [v32 setProperty:v39 forKey:@"Resources"];

    [(AXSettingsResourceDownloadController *)v33 manageEditButton];
  }
}

- (id)getVoiceSettingsForVoice:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(AXSettingsResourceDownloadController *)self parentController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    uint64_t v7 = [(AXSettingsResourceDownloadController *)self parentController];
    uint64_t v8 = [v7 getVoiceSettingsForVoice:v4];
LABEL_5:
    uint64_t v10 = (void *)v8;

    goto LABEL_7;
  }
  id v9 = [(AXSettingsResourceDownloadController *)self getPerVoiceSettingsCallack];

  if (v9)
  {
    uint64_t v7 = [(AXSettingsResourceDownloadController *)self getPerVoiceSettingsCallack];
    uint64_t v8 = ((void (**)(void, id))v7)[2](v7, v4);
    goto LABEL_5;
  }
  uint64_t v10 = (void *)MEMORY[0x1E4F1CC08];
LABEL_7:

  return v10;
}

- (void)voiceSettingsDidChangeForVoice:(id)a3 settings:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  uint64_t v7 = [(AXSettingsResourceDownloadController *)self parentController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v9 = [(AXSettingsResourceDownloadController *)self parentController];
    [v9 voiceSettingsDidChangeForVoice:v11 settings:v6];
  }
  else
  {
    uint64_t v10 = [(AXSettingsResourceDownloadController *)self setPerVoiceSettingsCallack];

    if (!v10) {
      goto LABEL_6;
    }
    id v9 = [(AXSettingsResourceDownloadController *)self setPerVoiceSettingsCallack];
    ((void (**)(void, id, id))v9)[2](v9, v11, v6);
  }

LABEL_6:
}

- (NSString)speechSourceKey
{
  char v3 = [(AXSettingsResourceDownloadController *)self parentController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    uint64_t v5 = [(AXSettingsResourceDownloadController *)self parentController];
    id v6 = [v5 speechSourceKey];
  }
  else
  {
    id v6 = self->_speechSourceKey;
  }
  return v6;
}

- (void)setShowPerVoiceSettings:(BOOL)a3
{
  self->_char showPerVoiceSettings = a3;
}

- (id)setDialectPreferencesCallback
{
  return self->_setDialectPreferencesCallback;
}

- (void)setSetDialectPreferencesCallback:(id)a3
{
}

- (id)getDialectPreferencesCallback
{
  return self->_getDialectPreferencesCallback;
}

- (void)setGetDialectPreferencesCallback:(id)a3
{
}

- (id)getVoiceAllowedCallback
{
  return self->_getVoiceAllowedCallback;
}

- (void)setGetVoiceAllowedCallback:(id)a3
{
}

- (void)setSpeechSourceKey:(id)a3
{
}

- (id)getPerVoiceSettingsCallack
{
  return self->_getPerVoiceSettingsCallack;
}

- (void)setGetPerVoiceSettingsCallack:(id)a3
{
}

- (id)setPerVoiceSettingsCallack
{
  return self->_setPerVoiceSettingsCallack;
}

- (void)setSetPerVoiceSettingsCallack:(id)a3
{
}

- (void)setSpeechModelController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_speechModelController, 0);
  objc_storeStrong(&self->_setPerVoiceSettingsCallack, 0);
  objc_storeStrong(&self->_getPerVoiceSettingsCallack, 0);
  objc_storeStrong((id *)&self->_speechSourceKey, 0);
  objc_storeStrong(&self->_getVoiceAllowedCallback, 0);
  objc_storeStrong(&self->_getDialectPreferencesCallback, 0);
  objc_storeStrong(&self->_setDialectPreferencesCallback, 0);
}

@end