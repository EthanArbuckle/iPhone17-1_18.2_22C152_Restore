@interface AXBridgeSpeechSettingsModelController
- (AXBridgeSpeechSettingsModelController)init;
- (BOOL)isResourceUserDeletable:(id)a3;
- (NSArray)resources;
- (NSString)selectedVoiceKey;
- (NSString)speechSourceKey;
- (id)deleteDownloadKey;
- (id)downloadProgressKey;
- (id)getAllResources;
- (id)resourceWithVoiceId:(id)a3;
- (id)selectedVoiceIdentifierForSpeechSourceKey:(id)a3;
- (id)startDownloadKey;
- (id)stopDownloadKey;
- (void)_registerForNotifications;
- (void)_updateDownloadProgress;
- (void)_updateResources;
- (void)addVoiceFootprintsToArray:(id)a3 dialect:(id)a4 selectedVoiceId:(id)a5 showSiriNeuralVoices:(BOOL)a6 showNeuralAXVoices:(BOOL)a7;
- (void)deleteResource:(id)a3;
- (void)getAllResources;
- (void)selectedVoiceKey;
- (void)setResources:(id)a3;
- (void)setSelectedVoiceKey:(id)a3;
- (void)setSpeechSourceKey:(id)a3;
- (void)speechSourceKey;
- (void)startDownloadForResource:(id)a3;
- (void)stopDownloadForResource:(id)a3;
- (void)updateSelectedVoiceIdentifier:(id)a3 forSpeechSourceKey:(id)a4;
@end

@implementation AXBridgeSpeechSettingsModelController

- (AXBridgeSpeechSettingsModelController)init
{
  v5.receiver = self;
  v5.super_class = (Class)AXBridgeSpeechSettingsModelController;
  v2 = [(AXSpeechSettingsModelController *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(AXBridgeSpeechSettingsModelController *)v2 _registerForNotifications];
    [(AXBridgeSpeechSettingsModelController *)v3 _updateDownloadProgress];
  }
  return v3;
}

- (NSArray)resources
{
  resources = self->_resources;
  if (!resources || ![(NSArray *)resources count]) {
    [(AXBridgeSpeechSettingsModelController *)self _updateResources];
  }
  v4 = self->_resources;

  return v4;
}

- (NSString)speechSourceKey
{
  v2 = AXLogSettings();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT)) {
    -[AXBridgeSpeechSettingsModelController speechSourceKey](v2);
  }

  return 0;
}

- (NSString)selectedVoiceKey
{
  v2 = AXLogSettings();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT)) {
    -[AXBridgeSpeechSettingsModelController selectedVoiceKey](v2);
  }

  return 0;
}

- (id)downloadProgressKey
{
  return (id)*MEMORY[0x263F22B68];
}

- (id)startDownloadKey
{
  return (id)*MEMORY[0x263F22B78];
}

- (id)stopDownloadKey
{
  return (id)*MEMORY[0x263F22B80];
}

- (id)deleteDownloadKey
{
  return (id)*MEMORY[0x263F22B70];
}

- (void)_registerForNotifications
{
  objc_initWeak(&location, self);
  v2 = [MEMORY[0x263F08A00] defaultCenter];
  v3 = [MEMORY[0x263F08A48] mainQueue];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __66__AXBridgeSpeechSettingsModelController__registerForNotifications__block_invoke;
  v5[3] = &unk_2651F22B8;
  objc_copyWeak(&v6, &location);
  id v4 = (id)[v2 addObserverForName:@"AXNanoPreferencesSettingsChangedNotification" object:0 queue:v3 usingBlock:v5];

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __66__AXBridgeSpeechSettingsModelController__registerForNotifications__block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateDownloadProgress];

  id v3 = objc_loadWeakRetained(v1);
  [v3 _updateResources];

  id v4 = objc_loadWeakRetained(v1);
  [v4 updateSelectedVoice];
}

- (void)_updateResources
{
  id v3 = [(AXBridgeSpeechSettingsModelController *)self getAllResources];
  resources = self->_resources;
  self->_resources = v3;

  objc_super v5 = [(AXSpeechSettingsModelController *)self resourceCacheDidReceiveUpdateCallback];

  if (v5)
  {
    id v6 = [(AXSpeechSettingsModelController *)self resourceCacheDidReceiveUpdateCallback];
    v6[2]();
  }
}

- (void)_updateDownloadProgress
{
  id v3 = +[AccessibilityBridgeBaseController accessibilityDomainAccessor];
  id v4 = [(AXBridgeSpeechSettingsModelController *)self downloadProgressKey];
  id v5 = [v3 dictionaryForKey:v4];

  [(AXSpeechSettingsModelController *)self updateDownloadProgressFromNPS:v5];
}

- (void)addVoiceFootprintsToArray:(id)a3 dialect:(id)a4 selectedVoiceId:(id)a5 showSiriNeuralVoices:(BOOL)a6 showNeuralAXVoices:(BOOL)a7
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = [(AXBridgeSpeechSettingsModelController *)self resources];
  AXAddVoiceFootprintsToArrayForDialectWithResources();
}

- (id)resourceWithVoiceId:(id)a3
{
  id v4 = a3;
  id v5 = [(AXBridgeSpeechSettingsModelController *)self resources];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __61__AXBridgeSpeechSettingsModelController_resourceWithVoiceId___block_invoke;
  v10[3] = &unk_2651F22E0;
  id v11 = v4;
  id v6 = v4;
  v7 = objc_msgSend(v5, "ax_filteredArrayUsingBlock:", v10);

  v8 = [v7 firstObject];

  return v8;
}

uint64_t __61__AXBridgeSpeechSettingsModelController_resourceWithVoiceId___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 voiceId];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (id)getAllResources
{
  v14[5] = *MEMORY[0x263EF8340];
  v2 = +[AccessibilityBridgeBaseController accessibilityDomainAccessor];
  id v3 = [v2 dataForKey:*MEMORY[0x263F22AD8]];

  uint64_t v4 = (void *)MEMORY[0x263EFFA08];
  v14[0] = objc_opt_class();
  v14[1] = objc_opt_class();
  v14[2] = objc_opt_class();
  v14[3] = objc_opt_class();
  v14[4] = objc_opt_class();
  id v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:5];
  id v6 = [v4 setWithArray:v5];

  id v13 = 0;
  v7 = [MEMORY[0x263F08928] unarchivedObjectOfClasses:v6 fromData:v3 error:&v13];
  id v8 = v13;
  if (v8)
  {
    v9 = AXTTSLogCommon();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      [(AXBridgeSpeechSettingsModelController *)(uint64_t)v8 getAllResources];
    }
  }
  if (v7) {
    id v10 = v7;
  }
  else {
    id v10 = (void *)MEMORY[0x263EFFA68];
  }
  id v11 = v10;

  return v11;
}

- (void)updateSelectedVoiceIdentifier:(id)a3 forSpeechSourceKey:(id)a4
{
}

- (void)startDownloadForResource:(id)a3
{
  id v5 = [a3 voiceId];
  uint64_t v4 = [(AXBridgeSpeechSettingsModelController *)self startDownloadKey];
  +[AccessibilityBridgeBaseController setGizmoAccessibilityPref:v5 forKey:v4];
}

- (void)stopDownloadForResource:(id)a3
{
  id v4 = a3;
  id v5 = [(AXSpeechSettingsModelController *)self stoppedVoiceIds];
  id v6 = [NSNumber numberWithDouble:CFAbsoluteTimeGetCurrent()];
  v7 = [v4 voiceId];
  [v5 setObject:v6 forKey:v7];

  id v9 = [v4 voiceId];

  id v8 = [(AXBridgeSpeechSettingsModelController *)self stopDownloadKey];
  +[AccessibilityBridgeBaseController setGizmoAccessibilityPref:v9 forKey:v8];
}

- (void)deleteResource:(id)a3
{
  id v5 = [a3 voiceId];
  id v4 = [(AXBridgeSpeechSettingsModelController *)self deleteDownloadKey];
  +[AccessibilityBridgeBaseController setGizmoAccessibilityPref:v5 forKey:v4];
}

- (id)selectedVoiceIdentifierForSpeechSourceKey:(id)a3
{
  return [(AXSpeechSettingsModelController *)self selectedVoiceIdentifierForSpeechSourceKey:a3 languageCode:0];
}

- (BOOL)isResourceUserDeletable:(id)a3
{
  id v4 = a3;
  if (![v4 isInstalled]) {
    goto LABEL_4;
  }
  id v5 = [v4 speechVoice];
  int v6 = [v5 canBeDownloaded];

  if (!v6) {
    goto LABEL_4;
  }
  v7 = [v4 voiceId];
  id v8 = [(AXBridgeSpeechSettingsModelController *)self speechSourceKey];
  id v9 = [(AXBridgeSpeechSettingsModelController *)self selectedVoiceIdentifierForSpeechSourceKey:v8];
  char v10 = [v7 isEqualToString:v9];

  if ((v10 & 1) == 0)
  {
    id v13 = [(AXSpeechSettingsModelController *)self downloadProgessByVoiceID];
    v14 = [v4 voiceId];
    v15 = [v13 objectForKeyedSubscript:v14];

    BOOL v11 = 1;
    if (v15)
    {
      [v15 floatValue];
      if (v16 < 1.0)
      {
        [v15 floatValue];
        if (v17 > 0.0) {
          BOOL v11 = 0;
        }
      }
    }
  }
  else
  {
LABEL_4:
    BOOL v11 = 0;
  }

  return v11;
}

- (void)setResources:(id)a3
{
}

- (void)setSpeechSourceKey:(id)a3
{
}

- (void)setSelectedVoiceKey:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedVoiceKey, 0);
  objc_storeStrong((id *)&self->_speechSourceKey, 0);

  objc_storeStrong((id *)&self->_resources, 0);
}

- (void)speechSourceKey
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_246A39000, log, OS_LOG_TYPE_FAULT, "AXBridgeSpeechSettingsModelController Subclass must override speechSourceKey", v1, 2u);
}

- (void)selectedVoiceKey
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_246A39000, log, OS_LOG_TYPE_FAULT, "AXBridgeSpeechSettingsModelController Subclass must override selectedVoiceKey", v1, 2u);
}

- (void)getAllResources
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_246A39000, a2, OS_LOG_TYPE_ERROR, "Error, unable to decode available resources from watch: %@", (uint8_t *)&v2, 0xCu);
}

@end