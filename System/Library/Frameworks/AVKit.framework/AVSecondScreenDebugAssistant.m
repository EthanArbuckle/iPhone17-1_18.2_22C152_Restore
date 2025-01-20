@interface AVSecondScreenDebugAssistant
- (AVObservationController)observationController;
- (AVPlayer)player;
- (AVSecondScreenDebugAssistant)init;
- (AVSecondScreenViewController)secondScreenViewController;
- (CADisplay)debugInfoDisplay;
- (NSString)debugText;
- (UIScene)scene;
- (id)_currentDisplay;
- (id)_currentEnabledVideoTrack;
- (id)_currentVideoDynamicRange;
- (void)_actuallyUpdateDebugLabelTextWithCurrentResolution:(id)a3 currentVideoDynamicRange:(id)a4;
- (void)_updateDebugLabelText;
- (void)dealloc;
- (void)setDebugInfoDisplay:(id)a3;
- (void)setDebugText:(id)a3;
- (void)setObservationController:(id)a3;
- (void)setPlayer:(id)a3;
- (void)setScene:(id)a3;
- (void)setSecondScreenViewController:(id)a3;
@end

@implementation AVSecondScreenDebugAssistant

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observationController, 0);
  objc_storeStrong((id *)&self->_debugInfoDisplay, 0);
  objc_destroyWeak((id *)&self->_secondScreenViewController);
  objc_storeStrong((id *)&self->_debugText, 0);
  objc_destroyWeak((id *)&self->_scene);

  objc_storeStrong((id *)&self->_player, 0);
}

- (void)setObservationController:(id)a3
{
}

- (AVObservationController)observationController
{
  return self->_observationController;
}

- (void)setDebugInfoDisplay:(id)a3
{
}

- (CADisplay)debugInfoDisplay
{
  return self->_debugInfoDisplay;
}

- (AVSecondScreenViewController)secondScreenViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_secondScreenViewController);

  return (AVSecondScreenViewController *)WeakRetained;
}

- (NSString)debugText
{
  return self->_debugText;
}

- (UIScene)scene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scene);

  return (UIScene *)WeakRetained;
}

- (void)setPlayer:(id)a3
{
}

- (AVPlayer)player
{
  return self->_player;
}

- (void)_actuallyUpdateDebugLabelTextWithCurrentResolution:(id)a3 currentVideoDynamicRange:(id)a4
{
  v71[9] = *MEMORY[0x1E4F143B8];
  id v67 = a4;
  id v65 = a3;
  v6 = [(AVSecondScreenDebugAssistant *)self player];
  v7 = [v6 currentItem];
  v8 = [v7 asset];
  v9 = [v8 preferredDisplayCriteria];

  unsigned int v10 = [v9 videoDynamicRange] - 1;
  if (v10 > 7) {
    v11 = @"Unknown";
  }
  else {
    v11 = off_1E5FC2D40[v10];
  }
  v64 = v11;
  v12 = [(AVSecondScreenDebugAssistant *)self player];
  v13 = [v12 currentItem];
  v14 = [v13 asset];
  [v14 maximumVideoResolution];
  objc_msgSend(NSString, "stringWithFormat:", @"%.0fx%0.f", v15, v16);
  v17 = (__CFString *)objc_claimAutoreleasedReturnValue();

  v18 = NSString;
  [v9 refreshRate];
  objc_msgSend(v18, "stringWithFormat:", @"%.0f", v19);
  v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {

    v20 = @"Unknown";
    v17 = @"Unknown";
  }
  v69 = v9;
  v70 = v20;
  if ([(__CFString *)v17 isEqualToString:@"0x0"])
  {

    v17 = @"Unknown";
  }
  v58 = v17;
  v21 = [(AVSecondScreenDebugAssistant *)self debugInfoDisplay];
  v22 = [v21 currentMode];
  uint64_t v23 = [v22 hdrMode];
  v63 = (void *)v23;

  v24 = [(AVSecondScreenDebugAssistant *)self debugInfoDisplay];
  v25 = [v24 currentMode];
  double v26 = (double)(unint64_t)[v25 width];
  v27 = [(AVSecondScreenDebugAssistant *)self _currentDisplay];
  v28 = [v27 currentMode];
  unint64_t v29 = [v28 height];
  uint64_t v30 = objc_msgSend(NSString, "stringWithFormat:", @"%.0fx%0.f", *(void *)&v26, (double)v29);
  v62 = (void *)v30;

  v31 = NSString;
  v32 = [(AVSecondScreenDebugAssistant *)self debugInfoDisplay];
  v33 = [v32 currentMode];
  [v33 refreshRate];
  uint64_t v35 = objc_msgSend(v31, "stringWithFormat:", @"%0.f", v34);
  v61 = (void *)v35;

  v36 = [(AVSecondScreenDebugAssistant *)self debugInfoDisplay];
  v37 = [v36 preferences];
  uint64_t v38 = [v37 preferredHdrMode];
  v39 = (void *)v38;
  v40 = @"Dolby";
  if (v38) {
    v40 = (__CFString *)v38;
  }
  v41 = v40;

  v60 = [NSString stringWithFormat:@"Current Display Mode: %@ %@ @ %@Hz", v30, v23, v35];
  v71[0] = v60;
  v71[1] = @"--------";
  v59 = [NSString stringWithFormat:@"Current Variant: %@ %@", v65, v67];

  v71[2] = v59;
  v68 = [NSString stringWithFormat:@"Best Variant: %@ %@", v17, v64];
  v71[3] = v68;
  v66 = [NSString stringWithFormat:@"Preferred Refresh Rate: %@Hz", v70];
  v71[4] = v66;
  v71[5] = @"--------";
  v42 = NSString;
  v43 = [(AVSecondScreenDebugAssistant *)self debugInfoDisplay];
  v44 = [v43 preferences];
  int v45 = [v44 matchContent];
  v46 = @"Disabled";
  if (v45) {
    v46 = @"Enabled";
  }
  v47 = [v42 stringWithFormat:@"Content Match: %@\nPreferred Color Mode: %@", v46, v41];

  v71[6] = v47;
  v71[7] = @"--------";
  v48 = NSString;
  v49 = [(AVSecondScreenDebugAssistant *)self scene];
  v50 = objc_msgSend(v49, "avkit_asWindowScene");
  v51 = [v50 screen];
  [v51 nativeBounds];
  v54 = objc_msgSend(NSString, "stringWithFormat:", @"%.0fx%0.f", v52, v53);
  v55 = [v48 stringWithFormat:@"UIScreen.nativeBounds.size: %@", v54];
  v71[8] = v55;
  v56 = [MEMORY[0x1E4F1C978] arrayWithObjects:v71 count:9];

  v57 = [v56 componentsJoinedByString:@"\n"];
  [(AVSecondScreenDebugAssistant *)self setDebugText:v57];
}

- (void)_updateDebugLabelText
{
  v3 = [(AVSecondScreenDebugAssistant *)self _currentEnabledVideoTrack];
  v4 = [v3 assetTrack];
  if ([v4 statusOfValueForKey:@"formatDescriptions" error:0] == 2)
  {
    v5 = [v3 assetTrack];
    uint64_t v6 = [v5 statusOfValueForKey:@"naturalSize" error:0];

    if (v6 == 2)
    {
      v7 = [v3 assetTrack];
      [v7 naturalSize];
      objc_msgSend(NSString, "stringWithFormat:", @"%.0fx%0.f", v8, v9);
      unsigned int v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

      v11 = [(AVSecondScreenDebugAssistant *)self _currentVideoDynamicRange];
      goto LABEL_8;
    }
  }
  else
  {
  }
  if (v3)
  {
    v12 = [v3 assetTrack];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __53__AVSecondScreenDebugAssistant__updateDebugLabelText__block_invoke;
    v13[3] = &unk_1E5FC3D18;
    id v14 = v3;
    uint64_t v15 = self;
    [v12 loadValuesAsynchronouslyForKeys:&unk_1F094A310 completionHandler:v13];
  }
  v11 = @"Unknown";
  unsigned int v10 = @"Unknown";
LABEL_8:
  [(AVSecondScreenDebugAssistant *)self _actuallyUpdateDebugLabelTextWithCurrentResolution:v10 currentVideoDynamicRange:v11];
}

void __53__AVSecondScreenDebugAssistant__updateDebugLabelText__block_invoke(uint64_t a1)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __53__AVSecondScreenDebugAssistant__updateDebugLabelText__block_invoke_2;
  v4[3] = &unk_1E5FC3D18;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v5 = v2;
  uint64_t v6 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v4);
}

void __53__AVSecondScreenDebugAssistant__updateDebugLabelText__block_invoke_2(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) _currentEnabledVideoTrack];
  LODWORD(v2) = [v2 isEqual:v3];

  if (v2)
  {
    v4 = [*(id *)(a1 + 32) assetTrack];
    [v4 naturalSize];
    objc_msgSend(NSString, "stringWithFormat:", @"%.0fx%0.f", v5, v6);
    id v8 = (id)objc_claimAutoreleasedReturnValue();

    v7 = [*(id *)(a1 + 40) _currentVideoDynamicRange];
    [*(id *)(a1 + 40) _actuallyUpdateDebugLabelTextWithCurrentResolution:v8 currentVideoDynamicRange:v7];
  }
}

- (id)_currentVideoDynamicRange
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(AVSecondScreenDebugAssistant *)self _currentEnabledVideoTrack];
  v4 = [v3 assetTrack];
  uint64_t v5 = [v4 statusOfValueForKey:@"formatDescriptions" error:0];

  if (v5 == 2)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v16 = 0u;
    uint64_t v6 = [(AVSecondScreenDebugAssistant *)self _currentEnabledVideoTrack];
    v7 = [v6 assetTrack];
    id v8 = [v7 formatDescriptions];

    uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      int VideoDynamicRange = 0;
      uint64_t v12 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v16 != v12) {
            objc_enumerationMutation(v8);
          }
          if (VideoDynamicRange <= (int)CMVideoFormatDescriptionGetVideoDynamicRange()) {
            int VideoDynamicRange = CMVideoFormatDescriptionGetVideoDynamicRange();
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v10);

      if ((VideoDynamicRange - 1) <= 7) {
        return off_1E5FC2D40[VideoDynamicRange - 1];
      }
    }
    else
    {
    }
  }
  return @"Unknown";
}

- (id)_currentDisplay
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id obj = [MEMORY[0x1E4F39B60] displays];
  uint64_t v2 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v18 != v4) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        v7 = [v6 uniqueId];
        id v8 = [(AVSecondScreenDebugAssistant *)self scene];
        uint64_t v9 = objc_msgSend(v8, "avkit_asWindowScene");
        uint64_t v10 = [v9 screen];
        v11 = [v10 _displayID];
        int v12 = [v7 isEqual:v11];

        if (v12)
        {
          id v13 = v6;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
  id v13 = 0;
LABEL_11:

  return v13;
}

- (id)_currentEnabledVideoTrack
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v2 = [(AVSecondScreenDebugAssistant *)self player];
  uint64_t v3 = [v2 currentItem];
  uint64_t v4 = [v3 tracks];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v17;
    uint64_t v8 = *MEMORY[0x1E4F15C18];
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if ([v10 isEnabled])
        {
          v11 = [v10 assetTrack];
          int v12 = [v11 mediaType];
          int v13 = [v12 isEqualToString:v8];

          if (v13)
          {
            id v14 = v10;
            goto LABEL_12;
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  id v14 = 0;
LABEL_12:

  return v14;
}

- (void)setSecondScreenViewController:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_secondScreenViewController);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_secondScreenViewController, obj);
    uint64_t v5 = [(AVSecondScreenDebugAssistant *)self debugText];
    [obj setDebugText:v5];
  }
}

- (void)setDebugText:(id)a3
{
  id v7 = a3;
  if (([v7 isEqualToString:self->_debugText] & 1) == 0)
  {
    uint64_t v4 = (NSString *)[v7 copy];
    debugText = self->_debugText;
    self->_debugText = v4;

    uint64_t v6 = [(AVSecondScreenDebugAssistant *)self secondScreenViewController];
    [v6 setDebugText:self->_debugText];
  }
}

- (void)setScene:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scene);

  uint64_t v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_scene, obj);
    uint64_t v6 = [(AVSecondScreenDebugAssistant *)self _currentDisplay];
    [(AVSecondScreenDebugAssistant *)self setDebugInfoDisplay:v6];

    uint64_t v5 = obj;
  }
}

- (void)dealloc
{
  uint64_t v3 = [(AVSecondScreenDebugAssistant *)self observationController];
  [v3 stopAllObservation];

  v4.receiver = self;
  v4.super_class = (Class)AVSecondScreenDebugAssistant;
  [(AVSecondScreenDebugAssistant *)&v4 dealloc];
}

- (AVSecondScreenDebugAssistant)init
{
  v12[4] = *MEMORY[0x1E4F143B8];
  v11.receiver = self;
  v11.super_class = (Class)AVSecondScreenDebugAssistant;
  uint64_t v2 = [(AVSecondScreenDebugAssistant *)&v11 init];
  if (AVSecondScreenDebugHUDEnabled_onceToken != -1) {
    dispatch_once(&AVSecondScreenDebugHUDEnabled_onceToken, &__block_literal_global_131);
  }
  if (!AVSecondScreenDebugHUDEnabled__Enabled)
  {
    uint64_t v3 = _AVLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v10 = 0;
      _os_log_error_impl(&dword_1B05B7000, v3, OS_LOG_TYPE_ERROR, "Don't initialize this unless AVSecondScreenDebugHUDEnabled()!", v10, 2u);
    }
  }
  if (v2)
  {
    objc_super v4 = [[AVObservationController alloc] initWithOwner:v2];
    observationController = v2->_observationController;
    v2->_observationController = v4;

    uint64_t v6 = v2->_observationController;
    v12[0] = @"debugInfoDisplay.currentMode";
    v12[1] = @"debugInfoDisplay.preferences";
    v12[2] = @"player.currentItem";
    v12[3] = @"player.currentItem.tracks";
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:4];
    id v8 = [(AVObservationController *)v6 startObserving:v2 keyPaths:v7 observationHandler:&__block_literal_global_9727];
  }
  return v2;
}

uint64_t __36__AVSecondScreenDebugAssistant_init__block_invoke(uint64_t a1, void *a2)
{
  return [a2 _updateDebugLabelText];
}

@end