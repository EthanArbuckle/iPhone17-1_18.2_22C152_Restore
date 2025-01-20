@interface AXSpeechSettingsModelController
+ (void)partitionVoiceFootprints:(id)a3 intoStandardVoices:(id)a4 andNoveltyVoices:(id)a5;
+ (void)partitionVoiceFootprints:(id)a3 intoStandardVoices:(id)a4 noveltyVoices:(id)a5 personalVoices:(id)a6;
- (AVAudioPlayer)audioPlayer;
- (AVAudioSession)audioSessionForSamplePlayback;
- (AVSpeechSynthesizer)speechSynthesizer;
- (AXAssetsService)assetsService;
- (AXSpeechSettingsModelController)init;
- (BOOL)allowedToDownload;
- (BOOL)hasAnyUserDeletableResources:(id)a3;
- (BOOL)isResourceUserDeletable:(id)a3;
- (NSMutableDictionary)downloadProgessByVoiceID;
- (NSMutableDictionary)stoppedVoiceIds;
- (id)downloadProgressForVoiceIdCallback;
- (id)finishedDeletingResourceCallback;
- (id)finishedDownloadingResourceCallback;
- (id)getAllResources;
- (id)resourceCacheDidReceiveUpdateCallback;
- (id)resourceWithVoiceId:(id)a3;
- (id)selectedVoiceDidUpdateCallback;
- (id)selectedVoiceIdentifierForSpeechSourceKey:(id)a3;
- (id)selectedVoiceIdentifierForSpeechSourceKey:(id)a3 languageCode:(id)a4;
- (id)systemLanguageCode;
- (id)voiceIdentifierForLiveSpeechKeyboardID:(id)a3;
- (void)_playSampleForResource:(id)a3 url:(id)a4 completion:(id)a5;
- (void)addVoiceFootprintsToArray:(id)a3 dialect:(id)a4 selectedVoiceId:(id)a5 showSiriNeuralVoices:(BOOL)a6 showNeuralAXVoices:(BOOL)a7;
- (void)audioSessionForSamplePlayback;
- (void)dealloc;
- (void)deleteResource:(id)a3;
- (void)downloadProgressForVoiceId:(id)a3 progress:(float)a4 storageSize:(int64_t)a5 requiredDiskSpace:(BOOL)a6;
- (void)finishedDeletingResource:(id)a3;
- (void)finishedDownloadingResource:(id)a3 wasCancelled:(BOOL)a4;
- (void)playSampleForResource:(id)a3 completion:(id)a4;
- (void)refreshAssetCatalog:(BOOL)a3 downloadSamplesIfNeeded:(BOOL)a4 restartMigrationIfNeeded:(BOOL)a5;
- (void)resetResourcesCache;
- (void)resourceCacheDidReceiveUpdate;
- (void)setAssetsService:(id)a3;
- (void)setAudioPlayer:(id)a3;
- (void)setAudioSessionForSamplePlayback:(id)a3;
- (void)setDownloadProgessByVoiceID:(id)a3;
- (void)setDownloadProgressForVoiceIdCallback:(id)a3;
- (void)setFinishedDeletingResourceCallback:(id)a3;
- (void)setFinishedDownloadingResourceCallback:(id)a3;
- (void)setResourceCacheDidReceiveUpdateCallback:(id)a3;
- (void)setSelectedVoiceDidUpdateCallback:(id)a3;
- (void)setSpeechSynthesizer:(id)a3;
- (void)setStoppedVoiceIds:(id)a3;
- (void)startDownloadForResource:(id)a3;
- (void)stopDownloadForResource:(id)a3;
- (void)updateDownloadProgressFromNPS:(id)a3;
- (void)updateSelectedVoiceIdentifier:(id)a3 forSpeechSourceKey:(id)a4;
- (void)updateSelectedVoiceIdentifier:(id)a3 forSpeechSourceKey:(id)a4 languageCode:(id)a5;
@end

@implementation AXSpeechSettingsModelController

- (AXSpeechSettingsModelController)init
{
  v7.receiver = self;
  v7.super_class = (Class)AXSpeechSettingsModelController;
  v2 = [(AXSpeechSettingsModelController *)&v7 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F1CA60] dictionary];
    [(AXSpeechSettingsModelController *)v2 setDownloadProgessByVoiceID:v3];

    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    [(AXSpeechSettingsModelController *)v2 setStoppedVoiceIds:v4];

    v5 = [MEMORY[0x1E4FAF278] sharedInstance];
    [v5 addObserver:v2];
  }
  return v2;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4FAF278] sharedInstance];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)AXSpeechSettingsModelController;
  [(AXSpeechSettingsModelController *)&v4 dealloc];
}

- (AXAssetsService)assetsService
{
  assetsService = self->_assetsService;
  if (!assetsService)
  {
    objc_super v4 = (AXAssetsService *)objc_alloc_init(MEMORY[0x1E4F47E20]);
    v5 = self->_assetsService;
    self->_assetsService = v4;

    assetsService = self->_assetsService;
  }
  return assetsService;
}

- (void)refreshAssetCatalog:(BOOL)a3 downloadSamplesIfNeeded:(BOOL)a4 restartMigrationIfNeeded:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  if ((_checkedForCatalogUpdate & 1) == 0)
  {
    objc_super v7 = AXLogSpeechAssetDownload();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C39D1000, v7, OS_LOG_TYPE_INFO, "TTSAXResourceManager resource catalog may have an update. Attempting to force refresh catalog now", buf, 2u);
    }

    if (_AXCheckForCatalogUpdate_onceToken == -1)
    {
      if (v6) {
        goto LABEL_9;
      }
    }
    else
    {
      dispatch_once(&_AXCheckForCatalogUpdate_onceToken, &__block_literal_global_363);
      if (v6) {
        goto LABEL_9;
      }
    }
LABEL_3:
    if (!v5) {
      return;
    }
    goto LABEL_12;
  }
  if (!a4) {
    goto LABEL_3;
  }
LABEL_9:
  v8 = AXLogSpeechAssetDownload();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl(&dword_1C39D1000, v8, OS_LOG_TYPE_INFO, "TTSAXResourceManager. Will download samples if needed", v13, 2u);
  }

  v9 = [MEMORY[0x1E4FAF278] sharedInstance];
  [v9 downloadSamplesIfNecessary];

  if (v5)
  {
LABEL_12:
    v10 = AXLogSpeechAssetDownload();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_1C39D1000, v10, OS_LOG_TYPE_INFO, "TTSAXResourceMigrationUtilities. Resources may not have completed migration, attmpting to restart if needed", v12, 2u);
    }

    v11 = [MEMORY[0x1E4FAF280] sharedInstance];
    [v11 restartMigrationIfNeeded];
  }
}

- (void)addVoiceFootprintsToArray:(id)a3 dialect:(id)a4 selectedVoiceId:(id)a5 showSiriNeuralVoices:(BOOL)a6 showNeuralAXVoices:(BOOL)a7
{
}

- (id)resourceWithVoiceId:(id)a3
{
  v3 = (void *)MEMORY[0x1E4FAF278];
  id v4 = a3;
  BOOL v5 = [v3 sharedInstance];
  BOOL v6 = [v5 resourceWithVoiceId:v4];

  return v6;
}

- (id)getAllResources
{
  v2 = [MEMORY[0x1E4FAF278] sharedInstance];
  v3 = [v2 resourcesWithType:1 subType:1];

  return v3;
}

- (void)resetResourcesCache
{
  id v2 = [MEMORY[0x1E4FAF278] sharedInstance];
  [v2 resetResourcesCache];
}

- (id)voiceIdentifierForLiveSpeechKeyboardID:(id)a3
{
  id v4 = a3;
  BOOL v5 = [MEMORY[0x1E4F49458] sharedInstance];
  BOOL v6 = [v5 liveSpeechVoiceIdentifierForKeyboardID:v4];

  if (!v6)
  {
    BOOL v6 = [(AXSpeechSettingsModelController *)self selectedVoiceIdentifierForSpeechSourceKey:*MEMORY[0x1E4F481D8] languageCode:v4];
  }

  return v6;
}

- (id)selectedVoiceIdentifierForSpeechSourceKey:(id)a3
{
  return [(AXSpeechSettingsModelController *)self selectedVoiceIdentifierForSpeechSourceKey:a3 languageCode:0];
}

- (id)selectedVoiceIdentifierForSpeechSourceKey:(id)a3 languageCode:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    id v9 = [(AXSpeechSettingsModelController *)self systemLanguageCode];
  }
  v10 = v9;
  char v23 = 0;
  v11 = [MEMORY[0x1E4F49458] sharedInstance];
  v12 = [v11 speechVoiceIdentifierForLanguage:v10 sourceKey:v6 exists:&v23];

  if (!v23 && [v10 hasPrefix:@"zh"])
  {
    v13 = [MEMORY[0x1E4F49440] sharedInstance];
    v14 = [v13 userLocale];
    v15 = [v14 languageIdentifier];

    if ([v15 hasPrefix:@"zh"])
    {
      v16 = [MEMORY[0x1E4F49458] sharedInstance];
      uint64_t v17 = [v16 speechVoiceIdentifierForLanguage:v15 sourceKey:v6 exists:0];

      v12 = (void *)v17;
    }
  }
  v18 = [MEMORY[0x1E4FAF280] sharedInstance];
  v19 = [v18 convertIdentifierIfNeeded:v12];

  if ([v18 isMigrationComplete])
  {
    id v20 = v19;
  }
  else
  {
    id v20 = [v18 updatedIdentifierForLegacyIdentifier:v19 withLanguageCode:v10];
  }
  v21 = v20;

  return v21;
}

- (void)updateSelectedVoiceIdentifier:(id)a3 forSpeechSourceKey:(id)a4
{
}

- (id)systemLanguageCode
{
  id v2 = TTSPreferencesCopyDefaultOutputLanguageIdentifierForUserPreferences();
  v3 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"_-"];
  id v4 = [v2 componentsSeparatedByCharactersInSet:v3];
  BOOL v5 = [v4 firstObject];

  return v5;
}

- (void)updateSelectedVoiceIdentifier:(id)a3 forSpeechSourceKey:(id)a4 languageCode:(id)a5
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [MEMORY[0x1E4FAF278] sharedInstance];
  v12 = [v11 resourceWithVoiceId:v8];

  if (v10)
  {
    id v13 = v10;
  }
  else
  {
    id v13 = [(AXSpeechSettingsModelController *)self systemLanguageCode];
  }
  v14 = v13;
  v15 = AXLogCommon();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    v16 = [(AXSpeechSettingsModelController *)self systemLanguageCode];
    uint64_t v17 = [v12 speechVoice];
    v18 = [v17 identifier];
    int v25 = 138413314;
    id v26 = v9;
    __int16 v27 = 2112;
    id v28 = v10;
    __int16 v29 = 2112;
    v30 = v14;
    __int16 v31 = 2112;
    v32 = v16;
    __int16 v33 = 2112;
    v34 = v18;
    _os_log_impl(&dword_1C39D1000, v15, OS_LOG_TYPE_INFO, "AXSpeechSettingsUISupport: Updating selected voice identifier for key: %@, languageCode: %@, updatedLanguageCode: %@, generalLanguageID: %@, identifier: %@", (uint8_t *)&v25, 0x34u);
  }
  v19 = [MEMORY[0x1E4F49458] sharedInstance];
  id v20 = [v12 speechVoice];
  v21 = [v20 identifier];
  [v19 setSpeechVoiceIdentifier:v21 forLanguage:v14 sourceKey:v9];

  v22 = [MEMORY[0x1E4F49458] sharedInstance];
  [v22 setUserDidSelectVoiceForLanguage:v14 sourceKey:v9];

  if ([v12 type] == 3 || objc_msgSend(v12, "type") == 7)
  {
    char v23 = [(AXSpeechSettingsModelController *)self assetsService];
    [v23 informSiriVoiceSubscriptionsWithVoiceId:v8 addition:1];
  }
  if ([v12 type] == 4 && objc_msgSend(v12, "footprint") == 3)
  {
    v24 = [MEMORY[0x1E4FAF280] sharedInstance];
    [v24 downloadCompactResourceIfNeededForIdentifier:v8];
  }
}

- (void)startDownloadForResource:(id)a3
{
  v3 = (void *)MEMORY[0x1E4FAF278];
  id v4 = a3;
  id v6 = [v3 sharedInstance];
  BOOL v5 = [v4 voiceId];

  [v6 downloadResourceWithVoiceId:v5];
}

- (void)stopDownloadForResource:(id)a3
{
  v3 = (void *)MEMORY[0x1E4FAF278];
  id v4 = a3;
  id v6 = [v3 sharedInstance];
  BOOL v5 = [v4 voiceId];

  [v6 stopDownloadResourceWithVoiceId:v5];
}

- (void)deleteResource:(id)a3
{
  v3 = (void *)MEMORY[0x1E4FAF278];
  id v4 = a3;
  id v6 = [v3 sharedInstance];
  BOOL v5 = [v4 voiceId];

  [v6 deleteResourceWithVoiceId:v5];
}

- (BOOL)isResourceUserDeletable:(id)a3
{
  id v4 = a3;
  if ([v4 isInstalled])
  {
    BOOL v5 = [v4 speechVoice];
    char v6 = [v5 canBeDownloaded];

    if (v6)
    {
      if (AXResourceActivelyUsed())
      {
        id v7 = AXLogSpeechAssetDownload();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
          -[AXSpeechSettingsModelController isResourceUserDeletable:](v4);
        }
      }
      else
      {
        id v10 = [(AXSpeechSettingsModelController *)self downloadProgessByVoiceID];
        v11 = [v4 voiceId];
        id v7 = [v10 objectForKeyedSubscript:v11];

        if (!v7 || ([v7 floatValue], v12 >= 1.0))
        {
          BOOL v8 = 1;
          goto LABEL_11;
        }
        id v13 = AXLogSpeechAssetDownload();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
          -[AXSpeechSettingsModelController isResourceUserDeletable:](v4);
        }
      }
    }
    else
    {
      id v7 = AXLogSpeechAssetDownload();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
        -[AXSpeechSettingsModelController isResourceUserDeletable:](v4);
      }
    }
  }
  else
  {
    id v7 = AXLogSpeechAssetDownload();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[AXSpeechSettingsModelController isResourceUserDeletable:].cold.4(v4);
    }
  }
  BOOL v8 = 0;
LABEL_11:

  return v8;
}

- (BOOL)hasAnyUserDeletableResources:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        if (-[AXSpeechSettingsModelController isResourceUserDeletable:](self, "isResourceUserDeletable:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11))
        {
          BOOL v9 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v9 = 0;
LABEL_11:

  return v9;
}

- (void)updateDownloadProgressFromNPS:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(AXSpeechSettingsModelController *)self downloadProgessByVoiceID];
  char v6 = [v5 isEqualToDictionary:v4];

  if ((v6 & 1) == 0)
  {
    uint64_t v7 = (void *)[v4 mutableCopy];
    [(AXSpeechSettingsModelController *)self setDownloadProgessByVoiceID:v7];

    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __65__AXSpeechSettingsModelController_updateDownloadProgressFromNPS___block_invoke;
    v8[3] = &unk_1E649CB28;
    v8[4] = self;
    [v4 enumerateKeysAndObjectsUsingBlock:v8];
  }
}

void __65__AXSpeechSettingsModelController_updateDownloadProgressFromNPS___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v23 = a2;
  id v5 = a3;
  char v6 = [*(id *)(*(void *)(a1 + 32) + 16) valueForKey:v23];
  if (!v6 || (double Current = CFAbsoluteTimeGetCurrent(), [v6 doubleValue], Current - v8 >= 5.0))
  {
    BOOL v9 = [*(id *)(a1 + 32) resourceWithVoiceId:v23];
    id v10 = [*(id *)(a1 + 32) downloadProgressForVoiceIdCallback];

    if (v10)
    {
      long long v11 = [*(id *)(a1 + 32) downloadProgressForVoiceIdCallback];
      [v5 floatValue];
      float v13 = v12;
      long long v14 = [v9 voiceAsset];
      ((void (**)(void, id, uint64_t, uint64_t, float))v11)[2](v11, v23, [v14 fileSize], 1, v13);
    }
    [v5 floatValue];
    if (v15 == 1.0)
    {
      uint64_t v16 = [*(id *)(a1 + 32) finishedDownloadingResourceCallback];

      if (v16)
      {
        uint64_t v17 = [*(id *)(a1 + 32) finishedDownloadingResourceCallback];
        ((void (**)(void, void *, void))v17)[2](v17, v9, 0);
      }
    }
    [v5 floatValue];
    if (v18 == 0.0)
    {
      v19 = [*(id *)(a1 + 32) finishedDownloadingResourceCallback];

      if (v19)
      {
        id v20 = [*(id *)(a1 + 32) finishedDownloadingResourceCallback];
        ((void (**)(void, void *, uint64_t))v20)[2](v20, v9, 1);
      }
      v21 = [*(id *)(a1 + 32) finishedDeletingResourceCallback];

      if (v21)
      {
        v22 = [*(id *)(a1 + 32) finishedDeletingResourceCallback];
        ((void (**)(void, void *))v22)[2](v22, v9);
      }
    }
  }
}

- (AVAudioSession)audioSessionForSamplePlayback
{
  audioSessionForSamplePlayback = self->_audioSessionForSamplePlayback;
  if (!audioSessionForSamplePlayback)
  {
    id v4 = [MEMORY[0x1E4F153E0] auxiliarySession];
    id v5 = self->_audioSessionForSamplePlayback;
    self->_audioSessionForSamplePlayback = v4;

    char v6 = self->_audioSessionForSamplePlayback;
    uint64_t v7 = *MEMORY[0x1E4F14F98];
    uint64_t v8 = *MEMORY[0x1E4F15050];
    id v12 = 0;
    [(AVAudioSession *)v6 setCategory:v7 mode:v8 options:1 error:&v12];
    id v9 = v12;
    if (v9)
    {
      id v10 = AXTTSLogCommon();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[AXSpeechSettingsModelController audioSessionForSamplePlayback]();
      }
    }
    audioSessionForSamplePlayback = self->_audioSessionForSamplePlayback;
  }
  return audioSessionForSamplePlayback;
}

- (AVSpeechSynthesizer)speechSynthesizer
{
  speechSynthesizer = self->_speechSynthesizer;
  if (!speechSynthesizer)
  {
    id v4 = (AVSpeechSynthesizer *)objc_alloc_init(MEMORY[0x1E4F15480]);
    id v5 = self->_speechSynthesizer;
    self->_speechSynthesizer = v4;

    [(AVSpeechSynthesizer *)self->_speechSynthesizer setIsInternalSynth:1];
    [(AVSpeechSynthesizer *)self->_speechSynthesizer setUsesApplicationAudioSession:0];
    speechSynthesizer = self->_speechSynthesizer;
  }
  return speechSynthesizer;
}

- (void)playSampleForResource:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  uint64_t v8 = [MEMORY[0x1E4FAF278] sharedInstance];
  id v9 = [v6 voiceId];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __68__AXSpeechSettingsModelController_playSampleForResource_completion___block_invoke;
  v12[3] = &unk_1E649CB78;
  objc_copyWeak(&v15, &location);
  id v10 = v6;
  id v13 = v10;
  id v11 = v7;
  id v14 = v11;
  [v8 sampleURLForVoiceId:v9 completion:v12];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __68__AXSpeechSettingsModelController_playSampleForResource_completion___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __68__AXSpeechSettingsModelController_playSampleForResource_completion___block_invoke_2;
  v5[3] = &unk_1E649CB50;
  objc_copyWeak(&v9, a1 + 6);
  id v6 = a1[4];
  id v7 = v3;
  id v8 = a1[5];
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);

  objc_destroyWeak(&v9);
}

void __68__AXSpeechSettingsModelController_playSampleForResource_completion___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  [WeakRetained _playSampleForResource:*(void *)(a1 + 32) url:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

- (void)_playSampleForResource:(id)a3 url:(id)a4 completion:(id)a5
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(void))a5;
  if (!v9)
  {
    id v15 = AXTTSLogCommon();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[AXSpeechSettingsModelController _playSampleForResource:url:completion:]();
    }
    goto LABEL_12;
  }
  id v11 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v12 = [v9 path];
  int v13 = [v11 fileExistsAtPath:v12];

  id v14 = AXTTSLogCommon();
  id v15 = v14;
  if (!v13)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[AXSpeechSettingsModelController _playSampleForResource:url:completion:].cold.5(v8);
    }
LABEL_12:

    v22 = (void *)MEMORY[0x1E4F15470];
    id v23 = [v8 voiceId];
    id v17 = [v22 _voiceFromInternalVoiceListWithIdentifier:v23];

    if (v17)
    {
      v24 = [MEMORY[0x1E4FAF2A0] sharedInstance];
      int v25 = [v8 speechVoice];
      id v26 = [v25 identifier];
      __int16 v27 = [v24 sampleStringForVoiceIdentifier:v26];

      if (!v27)
      {
        id v28 = NSString;
        __int16 v29 = AXUILocalizedStringForKey(@"SAMPLE_STRING");
        v30 = [v8 name];
        __int16 v27 = objc_msgSend(v28, "localizedStringWithFormat:", v29, v30);
      }
      __int16 v31 = [MEMORY[0x1E4F15490] speechUtteranceWithString:v27];
      [v31 setVoice:v17];
      v32 = AXTTSLogCommon();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v36 = v27;
        __int16 v37 = 2112;
        id v38 = v17;
        _os_log_impl(&dword_1C39D1000, v32, OS_LOG_TYPE_INFO, "Will synthesize voice sample '%@'. voice: %@", buf, 0x16u);
      }

      __int16 v33 = [(AXSpeechSettingsModelController *)self speechSynthesizer];
      [v33 speakUtterance:v31];
    }
    else
    {
      __int16 v27 = AXTTSLogCommon();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        -[AXSpeechSettingsModelController _playSampleForResource:url:completion:](v8);
      }
    }

    goto LABEL_26;
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v36 = v9;
    _os_log_impl(&dword_1C39D1000, v15, OS_LOG_TYPE_DEFAULT, "Will play voice sample at URL: %@", buf, 0xCu);
  }

  id v34 = 0;
  uint64_t v16 = (AVAudioPlayer *)[objc_alloc(MEMORY[0x1E4F153C0]) initWithContentsOfURL:v9 error:&v34];
  id v17 = v34;
  audioPlayer = self->_audioPlayer;
  self->_audioPlayer = v16;

  v19 = [(AXSpeechSettingsModelController *)self audioSessionForSamplePlayback];
  [(AVAudioPlayer *)self->_audioPlayer setAudioSession:v19];

  LODWORD(v20) = 1.0;
  [(AVAudioPlayer *)self->_audioPlayer setVolume:v20];
  if (v17)
  {
    v21 = AXTTSLogCommon();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      -[AXSpeechSettingsModelController _playSampleForResource:url:completion:].cold.4();
    }
  }
  else
  {
    if ([(AVAudioPlayer *)self->_audioPlayer prepareToPlay])
    {
      [(AVAudioPlayer *)self->_audioPlayer play];
      goto LABEL_26;
    }
    v21 = AXTTSLogCommon();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      -[AXSpeechSettingsModelController _playSampleForResource:url:completion:](v21);
    }
  }

LABEL_26:
  if (v10) {
    v10[2](v10);
  }
}

- (BOOL)allowedToDownload
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2050000000;
  id v2 = (void *)getAXSettingsVoiceAssetManagerClass_softClass;
  uint64_t v11 = getAXSettingsVoiceAssetManagerClass_softClass;
  if (!getAXSettingsVoiceAssetManagerClass_softClass)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __getAXSettingsVoiceAssetManagerClass_block_invoke;
    v7[3] = &unk_1E649BF00;
    v7[4] = &v8;
    __getAXSettingsVoiceAssetManagerClass_block_invoke((uint64_t)v7);
    id v2 = (void *)v9[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v8, 8);
  id v4 = [v3 sharedInstance];
  char v5 = [v4 allowedToDownloadVoiceAssets];

  return v5;
}

- (void)downloadProgressForVoiceId:(id)a3 progress:(float)a4 storageSize:(int64_t)a5 requiredDiskSpace:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  uint64_t v11 = AXLogSpeechAssetDownload();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 138543874;
    id v18 = v10;
    __int16 v19 = 2048;
    double v20 = a4;
    __int16 v21 = 2048;
    int64_t v22 = a5;
    _os_log_impl(&dword_1C39D1000, v11, OS_LOG_TYPE_DEFAULT, "Download progress: %{public}@ progress: %f size: %lld", (uint8_t *)&v17, 0x20u);
  }

  *(float *)&double v12 = a4;
  int v13 = [NSNumber numberWithFloat:v12];
  id v14 = [(AXSpeechSettingsModelController *)self downloadProgessByVoiceID];
  [v14 setObject:v13 forKeyedSubscript:v10];

  id v15 = [(AXSpeechSettingsModelController *)self downloadProgressForVoiceIdCallback];

  if (v15)
  {
    uint64_t v16 = [(AXSpeechSettingsModelController *)self downloadProgressForVoiceIdCallback];
    ((void (**)(void, id, int64_t, BOOL, float))v16)[2](v16, v10, a5, v6, a4);
  }
}

- (void)finishedDownloadingResource:(id)a3 wasCancelled:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [v6 voiceId];

  if (v7)
  {
    if (v4) {
      uint64_t v8 = &unk_1F1F201F8;
    }
    else {
      uint64_t v8 = &unk_1F1F20210;
    }
    id v9 = [(AXSpeechSettingsModelController *)self downloadProgessByVoiceID];
    id v10 = [v6 voiceId];
    [v9 setObject:v8 forKeyedSubscript:v10];
  }
  if ([v6 type] == 3)
  {
    uint64_t v11 = [(AXSpeechSettingsModelController *)self assetsService];
    double v12 = [v6 voiceId];
    [v11 informSiriVoiceSubscriptionsWithVoiceId:v12 addition:1];
  }
  int v13 = AXLogSpeechAssetDownload();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = [v6 voiceId];
    id v15 = (void *)v14;
    uint64_t v16 = @"Sample asset";
    int v17 = @"finished successfully";
    if (v14) {
      uint64_t v16 = (__CFString *)v14;
    }
    if (v4) {
      int v17 = @"cancelled";
    }
    int v20 = 138412546;
    __int16 v21 = v16;
    __int16 v22 = 2114;
    uint64_t v23 = v17;
    _os_log_impl(&dword_1C39D1000, v13, OS_LOG_TYPE_DEFAULT, "Asset download %@ - reloading specs: %{public}@", (uint8_t *)&v20, 0x16u);
  }
  id v18 = [(AXSpeechSettingsModelController *)self finishedDownloadingResourceCallback];

  if (v18)
  {
    __int16 v19 = [(AXSpeechSettingsModelController *)self finishedDownloadingResourceCallback];
    ((void (**)(void, id, BOOL))v19)[2](v19, v6, v4);
  }
}

- (void)finishedDeletingResource:(id)a3
{
  id v8 = a3;
  BOOL v4 = [(AXSpeechSettingsModelController *)self downloadProgessByVoiceID];
  char v5 = [v8 voiceId];
  [v4 setObject:&unk_1F1F20228 forKeyedSubscript:v5];

  id v6 = [(AXSpeechSettingsModelController *)self finishedDeletingResourceCallback];

  if (v6)
  {
    id v7 = [(AXSpeechSettingsModelController *)self finishedDeletingResourceCallback];
    ((void (**)(void, id))v7)[2](v7, v8);
  }
}

- (void)resourceCacheDidReceiveUpdate
{
  id v3 = [(AXSpeechSettingsModelController *)self resourceCacheDidReceiveUpdateCallback];

  if (v3)
  {
    BOOL v4 = [(AXSpeechSettingsModelController *)self resourceCacheDidReceiveUpdateCallback];
    v4[2]();
  }
}

+ (void)partitionVoiceFootprints:(id)a3 intoStandardVoices:(id)a4 andNoveltyVoices:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v10 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v20 != v12) {
          objc_enumerationMutation(v7);
        }
        uint64_t v14 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        id v15 = [v14 resources];
        uint64_t v16 = [v15 firstObject];
        int v17 = [v16 isNoveltyVoice];

        if (v17) {
          id v18 = v9;
        }
        else {
          id v18 = v8;
        }
        [v18 addObject:v14];
      }
      uint64_t v11 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v11);
  }
}

+ (void)partitionVoiceFootprints:(id)a3 intoStandardVoices:(id)a4 noveltyVoices:(id)a5 personalVoices:(id)a6
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v24 = a4;
  id v10 = a5;
  id v11 = a6;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v12 = [v9 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v26 != v14) {
          objc_enumerationMutation(v9);
        }
        uint64_t v16 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        int v17 = [v16 resources];
        id v18 = [v17 firstObject];
        char v19 = [v18 isNoveltyVoice];

        long long v20 = v10;
        if ((v19 & 1) == 0)
        {
          long long v21 = [v16 resources];
          long long v22 = [v21 firstObject];
          int v23 = [v22 isPersonalVoice];

          if (v23) {
            long long v20 = v11;
          }
          else {
            long long v20 = v24;
          }
        }
        [v20 addObject:v16];
      }
      uint64_t v13 = [v9 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v13);
  }
}

- (NSMutableDictionary)downloadProgessByVoiceID
{
  return self->_downloadProgessByVoiceID;
}

- (void)setDownloadProgessByVoiceID:(id)a3
{
}

- (NSMutableDictionary)stoppedVoiceIds
{
  return self->_stoppedVoiceIds;
}

- (void)setStoppedVoiceIds:(id)a3
{
}

- (id)downloadProgressForVoiceIdCallback
{
  return self->_downloadProgressForVoiceIdCallback;
}

- (void)setDownloadProgressForVoiceIdCallback:(id)a3
{
}

- (id)finishedDownloadingResourceCallback
{
  return self->_finishedDownloadingResourceCallback;
}

- (void)setFinishedDownloadingResourceCallback:(id)a3
{
}

- (id)finishedDeletingResourceCallback
{
  return self->_finishedDeletingResourceCallback;
}

- (void)setFinishedDeletingResourceCallback:(id)a3
{
}

- (id)resourceCacheDidReceiveUpdateCallback
{
  return self->_resourceCacheDidReceiveUpdateCallback;
}

- (void)setResourceCacheDidReceiveUpdateCallback:(id)a3
{
}

- (id)selectedVoiceDidUpdateCallback
{
  return self->_selectedVoiceDidUpdateCallback;
}

- (void)setSelectedVoiceDidUpdateCallback:(id)a3
{
}

- (AVAudioPlayer)audioPlayer
{
  return self->_audioPlayer;
}

- (void)setAudioPlayer:(id)a3
{
}

- (void)setAssetsService:(id)a3
{
}

- (void)setAudioSessionForSamplePlayback:(id)a3
{
}

- (void)setSpeechSynthesizer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_speechSynthesizer, 0);
  objc_storeStrong((id *)&self->_audioSessionForSamplePlayback, 0);
  objc_storeStrong((id *)&self->_assetsService, 0);
  objc_storeStrong((id *)&self->_audioPlayer, 0);
  objc_storeStrong(&self->_selectedVoiceDidUpdateCallback, 0);
  objc_storeStrong(&self->_resourceCacheDidReceiveUpdateCallback, 0);
  objc_storeStrong(&self->_finishedDeletingResourceCallback, 0);
  objc_storeStrong(&self->_finishedDownloadingResourceCallback, 0);
  objc_storeStrong(&self->_downloadProgressForVoiceIdCallback, 0);
  objc_storeStrong((id *)&self->_stoppedVoiceIds, 0);
  objc_storeStrong((id *)&self->_downloadProgessByVoiceID, 0);
}

- (void)isResourceUserDeletable:(void *)a1 .cold.1(void *a1)
{
  v1 = [a1 voiceId];
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_1_0(&dword_1C39D1000, v2, v3, "Asset '%@' not deletable. Its being actively used", v4, v5, v6, v7, v8);
}

- (void)isResourceUserDeletable:(void *)a1 .cold.2(void *a1)
{
  v1 = [a1 voiceId];
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_1_0(&dword_1C39D1000, v2, v3, "Asset '%@' not deletable. Its being downloaded", v4, v5, v6, v7, v8);
}

- (void)isResourceUserDeletable:(void *)a1 .cold.3(void *a1)
{
  v1 = [a1 voiceId];
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_1_0(&dword_1C39D1000, v2, v3, "Asset '%@' not deletable. Not downloadable to begin with", v4, v5, v6, v7, v8);
}

- (void)isResourceUserDeletable:(void *)a1 .cold.4(void *a1)
{
  v1 = [a1 voiceId];
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_1_0(&dword_1C39D1000, v2, v3, "Asset '%@' not deletable. Not installed", v4, v5, v6, v7, v8);
}

- (void)audioSessionForSamplePlayback
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_0(&dword_1C39D1000, v0, v1, "Failed to set up aux session for sample playback: %@", v2, v3, v4, v5, v6);
}

- (void)_playSampleForResource:(void *)a1 url:completion:.cold.1(void *a1)
{
  uint64_t v1 = [a1 voiceId];
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_3_0(&dword_1C39D1000, v2, v3, "Error, unable to synthesize voice sample for %@. No AVSpeechSynthesisVoice could be created", v4, v5, v6, v7, v8);
}

- (void)_playSampleForResource:url:completion:.cold.2()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_0(&dword_1C39D1000, v0, v1, "Error while playing sample. URL was nil. Will attempt to synthesize sample. %@", v2, v3, v4, v5, v6);
}

- (void)_playSampleForResource:(os_log_t)log url:completion:.cold.3(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1C39D1000, log, OS_LOG_TYPE_ERROR, "failed to prepare audio player", v1, 2u);
}

- (void)_playSampleForResource:url:completion:.cold.4()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_0(&dword_1C39D1000, v0, v1, "Error while playing sample: %@", v2, v3, v4, v5, v6);
}

- (void)_playSampleForResource:(void *)a1 url:completion:.cold.5(void *a1)
{
  uint64_t v1 = [a1 voiceId];
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_3_0(&dword_1C39D1000, v2, v3, "Error, unable to find sample URL for %@, attempting to synthesize sample instead.", v4, v5, v6, v7, v8);
}

@end