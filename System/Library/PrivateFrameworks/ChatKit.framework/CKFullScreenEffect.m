@interface CKFullScreenEffect
+ (id)_monochromeDimmingFilterWithType:(int)a3;
+ (id)bigEmojiFilter;
+ (id)stickerFilter;
+ (id)tapBackFilter;
- (BOOL)_isPlaySoundEnabled;
- (BOOL)_supportsSoundEffects;
- (BOOL)effectIsDark;
- (BOOL)isForegroundEffect;
- (BOOL)shouldDrawOverNavigationBar;
- (BOOL)soundEffectHasHapticTrack;
- (BOOL)triggeredByResponseKit;
- (CKFullScreenEffectDelegate)delegate;
- (CKMessagePartChatItem)triggeringChatItem;
- (Class)effectViewClass;
- (NSString)identifier;
- (char)messageOrientation;
- (double)duration;
- (id)backgroundColor;
- (id)messageFilters;
- (id)soundEffectFileURL;
- (int)_filterTypeForCell:(id)a3 caresAboutOrientation:(BOOL *)a4 orientation:(char *)a5;
- (unint64_t)layerCount;
- (void)_audioSessionOptionsWillChange:(id)a3;
- (void)_didPrepareSoundEffect;
- (void)_ensureAudioPlayer;
- (void)animateFiltersForCell:(id)a3;
- (void)applyMessageFiltersToCells:(id)a3;
- (void)applyMessageFiltersToTriggeringCell:(id)a3;
- (void)audioController:(id)a3 mediaObjectProgressDidChange:(id)a4 currentTime:(double)a5 duration:(double)a6;
- (void)clearMessageFiltersFromCells:(id)a3;
- (void)dealloc;
- (void)playSoundEffect;
- (void)prepareSoundEffect;
- (void)setDelegate:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setMessageOrientation:(char)a3;
- (void)setTriggeredByResponseKit:(BOOL)a3;
- (void)setTriggeringChatItem:(id)a3;
- (void)stopSoundEffect;
@end

@implementation CKFullScreenEffect

- (unint64_t)layerCount
{
  return 0;
}

- (Class)effectViewClass
{
  return 0;
}

- (BOOL)shouldDrawOverNavigationBar
{
  return 0;
}

- (BOOL)isForegroundEffect
{
  return 0;
}

- (double)duration
{
  return 0.0;
}

- (id)backgroundColor
{
  return 0;
}

- (id)messageFilters
{
  return 0;
}

- (id)soundEffectFileURL
{
  return 0;
}

- (BOOL)soundEffectHasHapticTrack
{
  return 0;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v4 = +[CKAudioSessionController shareInstance];
  [v3 removeObserver:self name:@"CKAudioSessionControllerSessionOptionsWillChangeNotification" object:v4];

  v5.receiver = self;
  v5.super_class = (Class)CKFullScreenEffect;
  [(CKFullScreenEffect *)&v5 dealloc];
}

- (int)_filterTypeForCell:(id)a3 caresAboutOrientation:(BOOL *)a4 orientation:(char *)a5
{
  id v8 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = v8;
    objc_msgSend(v9, "setAnimatingInDarkEffect:", -[CKFullScreenEffect effectIsDark](self, "effectIsDark"));
    v10 = [v9 balloonView];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      if (a4) {
        *a4 = 1;
      }
      int v12 = 3;
      if (!a5) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
    v14 = [v9 balloonView];
    objc_opt_class();
    char v15 = objc_opt_isKindOfClass();

    if ((v15 & 1) != 0
      || ([v9 balloonView],
          v16 = objc_claimAutoreleasedReturnValue(),
          objc_opt_class(),
          char v17 = objc_opt_isKindOfClass(),
          v16,
          (v17 & 1) != 0))
    {
      if (a4) {
        *a4 = 1;
      }
      int v12 = 0;
      if (!a5) {
        goto LABEL_7;
      }
LABEL_6:
      v13 = [v9 balloonView];
      *a5 = [v13 orientation];

LABEL_7:
      goto LABEL_30;
    }
  }
  if (a4) {
    *a4 = 0;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v12 = 4;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v12 = 5;
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        int v12 = 2;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0
          || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
          || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
          || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
          || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
          || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          int v12 = 1;
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            int v12 = 1;
          }
          else {
            int v12 = 999;
          }
        }
      }
    }
  }
LABEL_30:

  return v12;
}

- (void)applyMessageFiltersToCells:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id obj = a3;
  uint64_t v20 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v20)
  {
    uint64_t v19 = *(void *)v28;
    do
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v28 != v19) {
          objc_enumerationMutation(obj);
        }
        uint64_t v21 = v4;
        objc_super v5 = *(void **)(*((void *)&v27 + 1) + 8 * v4);
        __int16 v26 = 0;
        int v6 = [(CKFullScreenEffect *)self _filterTypeForCell:v5 caresAboutOrientation:(char *)&v26 + 1 orientation:&v26];
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        v7 = [(CKFullScreenEffect *)self messageFilters];
        uint64_t v8 = [v7 countByEnumeratingWithState:&v22 objects:v31 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v23;
          do
          {
            for (uint64_t i = 0; i != v9; ++i)
            {
              if (*(void *)v23 != v10) {
                objc_enumerationMutation(v7);
              }
              int v12 = *(void **)(*((void *)&v22 + 1) + 8 * i);
              if ([v12 type] == v6)
              {
                if (HIBYTE(v26) && [v12 direction])
                {
                  int v13 = v26;
                  if ((_BYTE)v26) {
                    goto LABEL_17;
                  }
                  if ([v12 direction] != 2)
                  {
                    int v13 = v26;
LABEL_17:
                    if (v13 != 1 || [v12 direction] != 1) {
                      continue;
                    }
                  }
                }
                v14 = [(CKFullScreenEffect *)self identifier];
                int v15 = [v14 isEqualToString:@"com.apple.messages.effect.CKEchoEffect"];

                if (v15
                  && ((objc_opt_respondsToSelector() & 1) != 0
                   || (objc_opt_respondsToSelector() & 1) != 0
                   || (objc_opt_respondsToSelector() & 1) != 0))
                {
                  [(CKFullScreenEffect *)self animateFiltersForCell:v5];
                }
                [v5 addFilter:v12];
                continue;
              }
            }
            uint64_t v9 = [v7 countByEnumeratingWithState:&v22 objects:v31 count:16];
          }
          while (v9);
        }

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0
          || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
          || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
          || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
          || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
          || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          v16 = [v5 contentView];
          char v17 = [v16 layer];
          [v17 setAllowsGroupBlending:0];
        }
        uint64_t v4 = v21 + 1;
      }
      while (v21 + 1 != v20);
      uint64_t v20 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v20);
  }
}

- (void)animateFiltersForCell:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"filters.colorMatrix.inputColorMatrix"];
  objc_super v5 = (void *)MEMORY[0x1E4F1C978];
  *(_DWORD *)v37 = 1065353216;
  *(_OWORD *)&v37[4] = 0uLL;
  *(void *)&v37[20] = 0x3F80000000000000;
  *(_OWORD *)&v37[28] = 0uLL;
  *(_OWORD *)&v37[44] = 0x3F80000000000000uLL;
  *(void *)&v37[60] = 0;
  *(_DWORD *)&v37[68] = 0;
  *(void *)&v37[72] = 1065353216;
  int v6 = [MEMORY[0x1E4F29238] valueWithCAColorMatrix:v37];
  *(_OWORD *)v37 = xmmword_18F81CBE0;
  *(_OWORD *)&v37[16] = xmmword_18F81CBF0;
  *(_OWORD *)&v37[32] = xmmword_18F81CC00;
  *(_OWORD *)&v37[48] = xmmword_18F81CC10;
  *(_OWORD *)&v37[64] = xmmword_18F81CC20;
  v7 = [MEMORY[0x1E4F29238] valueWithCAColorMatrix:v37];
  *(_OWORD *)v37 = xmmword_18F81CBE0;
  *(_OWORD *)&v37[16] = xmmword_18F81CBF0;
  *(_OWORD *)&v37[32] = xmmword_18F81CC00;
  *(_OWORD *)&v37[48] = xmmword_18F81CC10;
  *(_OWORD *)&v37[64] = xmmword_18F81CC20;
  uint64_t v8 = [MEMORY[0x1E4F29238] valueWithCAColorMatrix:v37];
  *(_DWORD *)v37 = 1065353216;
  *(void *)&v37[12] = 0;
  *(void *)&v37[4] = 0;
  *(void *)&v37[20] = 0x3F80000000000000;
  *(_OWORD *)&v37[28] = 0uLL;
  *(_OWORD *)&v37[44] = 0x3F80000000000000uLL;
  *(void *)&v37[60] = 0;
  *(_DWORD *)&v37[68] = 0;
  *(void *)&v37[72] = 1065353216;
  uint64_t v9 = [MEMORY[0x1E4F29238] valueWithCAColorMatrix:v37];
  uint64_t v10 = objc_msgSend(v5, "arrayWithObjects:", v6, v7, v8, v9, 0);

  v11 = (void *)MEMORY[0x1E4F1C978];
  LODWORD(v12) = 1008981770;
  int v13 = [NSNumber numberWithFloat:v12];
  LODWORD(v14) = 1041865114;
  int v15 = [NSNumber numberWithFloat:v14];
  LODWORD(v16) = 0.75;
  char v17 = [NSNumber numberWithFloat:v16];
  LODWORD(v18) = 1065185444;
  uint64_t v19 = [NSNumber numberWithFloat:v18];
  uint64_t v20 = objc_msgSend(v11, "arrayWithObjects:", v13, v15, v17, v19, 0);

  uint64_t v21 = (void *)MEMORY[0x1E4F1C978];
  long long v22 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A490]];
  long long v23 = objc_msgSend(v21, "arrayWithObjects:", v22, 0);

  v36 = (void *)v10;
  [v4 setValues:v10];
  [v4 setKeyTimes:v20];
  [v4 setTimingFunctions:v23];
  [v4 setDuration:4.5];
  long long v24 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"opacity"];
  long long v25 = (void *)MEMORY[0x1E4F1C978];
  LODWORD(v26) = 1.0;
  long long v27 = [NSNumber numberWithFloat:v26];
  long long v28 = [NSNumber numberWithFloat:0.0];
  long long v29 = [NSNumber numberWithFloat:0.0];
  LODWORD(v30) = 1.0;
  v31 = [NSNumber numberWithFloat:v30];
  v32 = objc_msgSend(v25, "arrayWithObjects:", v27, v28, v29, v31, 0);

  [v24 setValues:v32];
  [v24 setKeyTimes:v20];
  [v24 setTimingFunctions:v23];
  [v24 setDuration:4.5];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v33 = [v3 imageView];
LABEL_5:
    v34 = v33;
    [v33 addAnimation:v4 forKey:@"matrixAnimation"];
    goto LABEL_6;
  }
  if (objc_opt_respondsToSelector())
  {
    uint64_t v33 = [v3 balloonView];
    goto LABEL_5;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    goto LABEL_7;
  }
  v34 = [v3 statusButton];
  v35 = [v34 layer];
  [v35 addAnimation:v24 forKey:@"opacityFade"];

LABEL_6:
LABEL_7:
}

- (void)applyMessageFiltersToTriggeringCell:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  objc_super v5 = [(CKFullScreenEffect *)self messageFilters];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if ([v10 type] == 6)
        {
          id v11 = v4;
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            double v12 = [v11 balloonView];
            objc_opt_class();
            char isKindOfClass = objc_opt_isKindOfClass();

            if (isKindOfClass) {
              [v11 addFilter:v10 fromTriggeringMessage:1];
            }
          }

          goto LABEL_14;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_14:
}

- (void)clearMessageFiltersFromCells:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        [v8 clearFilters];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) == 0) {
                    continue;
                  }
                }
              }
            }
          }
        }
        uint64_t v9 = [v8 contentView];
        uint64_t v10 = [v9 layer];
        [v10 setAllowsGroupBlending:1];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
}

- (void)_ensureAudioPlayer
{
  v12[1] = *MEMORY[0x1E4F143B8];
  if ([(CKFullScreenEffect *)self _supportsSoundEffects] && !self->_audioController)
  {
    id v3 = [(CKFullScreenEffect *)self soundEffectFileURL];
    if (v3)
    {
      uint64_t v4 = [[CKFullScreenEffectMediaObject alloc] initWithFullScreenEffectAudioFileURL:v3];
      uint64_t v5 = [CKAudioController alloc];
      v12[0] = v4;
      uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
      uint64_t v7 = [(CKAudioController *)v5 initWithMediaObjects:v6 conversation:0];
      audioController = self->_audioController;
      self->_audioController = v7;

      if ([(CKFullScreenEffect *)self soundEffectHasHapticTrack]) {
        uint64_t v9 = CKSupportsAdvancedHaptics();
      }
      else {
        uint64_t v9 = 0;
      }
      [(CKAudioController *)self->_audioController setShouldUseAVPlayer:v9];
      [(CKAudioController *)self->_audioController setDelegate:self];
      [(CKAudioController *)self->_audioController setShouldStopPlayingWhenSilent:1];
      [(CKAudioController *)self->_audioController setShouldDuckOthers:1];
      uint64_t v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
      long long v11 = +[CKAudioSessionController shareInstance];
      [v10 addObserver:self selector:sel__audioSessionOptionsWillChange_ name:@"CKAudioSessionControllerSessionOptionsWillChangeNotification" object:v11];
    }
  }
}

- (void)prepareSoundEffect
{
  if ([(CKFullScreenEffect *)self _supportsSoundEffects]
    && ([(CKFullScreenEffect *)self soundEffectFileURL],
        id v3 = objc_claimAutoreleasedReturnValue(),
        v3,
        v3))
  {
    [(CKFullScreenEffect *)self _ensureAudioPlayer];
    audioController = self->_audioController;
    [(CKAudioController *)audioController prepareToPlay];
  }
  else
  {
    [(CKFullScreenEffect *)self _didPrepareSoundEffect];
  }
}

- (BOOL)_isPlaySoundEnabled
{
  return *MEMORY[0x1E4F6CA08];
}

- (void)playSoundEffect
{
  if ([(CKFullScreenEffect *)self _isPlaySoundEnabled])
  {
    [(CKFullScreenEffect *)self _ensureAudioPlayer];
    self->_currentVolume = 0.0;
    audioController = self->_audioController;
    [(CKAudioController *)audioController play];
  }
}

- (void)stopSoundEffect
{
  if ([(CKFullScreenEffect *)self _isPlaySoundEnabled])
  {
    [(CKAudioController *)self->_audioController pause];
    audioController = self->_audioController;
    [(CKAudioController *)audioController stop];
  }
}

- (void)audioController:(id)a3 mediaObjectProgressDidChange:(id)a4 currentTime:(double)a5 duration:(double)a6
{
  if (self->_currentVolume <= 1.0)
  {
    -[CKAudioController setVolume:](self->_audioController, "setVolume:", a3, a4);
    float v7 = self->_currentVolume + 0.2;
    self->_currentVolume = v7;
  }
}

- (void)_didPrepareSoundEffect
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__CKFullScreenEffect__didPrepareSoundEffect__block_invoke;
  block[3] = &unk_1E5620C40;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __44__CKFullScreenEffect__didPrepareSoundEffect__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  if (objc_opt_respondsToSelector()) {
    [v2 fullScreenEffectDidPrepareSoundEffect:*(void *)(a1 + 32)];
  }
}

- (void)_audioSessionOptionsWillChange:(id)a3
{
  uint64_t v4 = [a3 userInfo];
  uint64_t v5 = [v4 objectForKeyedSubscript:@"CKAudioSessionControllerSessionNotificationOptionsKey"];

  if (v5 && ([v5 unsignedIntegerValue] & 2) == 0)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __53__CKFullScreenEffect__audioSessionOptionsWillChange___block_invoke;
    block[3] = &unk_1E5620C40;
    block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __53__CKFullScreenEffect__audioSessionOptionsWillChange___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) stopSoundEffect];
}

- (BOOL)_supportsSoundEffects
{
  if (_supportsSoundEffects_onceToken != -1) {
    dispatch_once(&_supportsSoundEffects_onceToken, &__block_literal_global_102);
  }
  return _supportsSoundEffects_supportsSoundEffects;
}

void __43__CKFullScreenEffect__supportsSoundEffects__block_invoke()
{
  _supportsSoundEffects_supportsSoundEffects = 1;
}

- (BOOL)effectIsDark
{
  double v6 = 0.0;
  double v7 = 0.0;
  id v3 = [(CKFullScreenEffect *)self backgroundColor];

  if (!v3) {
    return 0;
  }
  uint64_t v4 = [(CKFullScreenEffect *)self backgroundColor];
  [v4 getHue:0 saturation:0 brightness:&v7 alpha:&v6];

  return v7 < 0.5 && v6 > 0.5;
}

+ (id)_monochromeDimmingFilterWithType:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v8[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A040]];
  [v4 setValue:&unk_1EDF17108 forKey:@"inputBias"];
  [v4 setValue:&unk_1EDF17118 forKey:@"inputAmount"];
  uint64_t v5 = objc_alloc_init(CKFullscreenEffectMessageFilter);
  [(CKFullscreenEffectMessageFilter *)v5 setType:v3];
  [(CKFullscreenEffectMessageFilter *)v5 setContentAlpha:0.300000012];
  v8[0] = v4;
  double v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  [(CKFullscreenEffectMessageFilter *)v5 setBalloonFilters:v6];

  return v5;
}

+ (id)bigEmojiFilter
{
  return (id)[a1 _monochromeDimmingFilterWithType:3];
}

+ (id)tapBackFilter
{
  id v2 = objc_alloc_init(CKFullscreenEffectMessageFilter);
  [(CKFullscreenEffectMessageFilter *)v2 setType:4];
  [(CKFullscreenEffectMessageFilter *)v2 setContentAlpha:0.0];

  return v2;
}

+ (id)stickerFilter
{
  return (id)[a1 _monochromeDimmingFilterWithType:5];
}

- (char)messageOrientation
{
  return self->messageOrientation;
}

- (void)setMessageOrientation:(char)a3
{
  self->messageOrientation = a3;
}

- (BOOL)triggeredByResponseKit
{
  return self->_triggeredByResponseKit;
}

- (void)setTriggeredByResponseKit:(BOOL)a3
{
  self->_triggeredByResponseKit = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (CKMessagePartChatItem)triggeringChatItem
{
  return self->_triggeringChatItem;
}

- (void)setTriggeringChatItem:(id)a3
{
}

- (CKFullScreenEffectDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CKFullScreenEffectDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_triggeringChatItem, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_audioController, 0);
}

@end