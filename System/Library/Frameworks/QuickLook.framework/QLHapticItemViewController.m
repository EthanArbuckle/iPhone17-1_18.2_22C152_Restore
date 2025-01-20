@interface QLHapticItemViewController
- (BOOL)_assetIsDecodable:(id)a3;
- (BOOL)canPlayHaptics;
- (BOOL)hasAudioCustom;
- (BOOL)play;
- (BOOL)usesScrubber;
- (double)elapsedTime;
- (double)remainingTime;
- (float)playerTimeObservationInterval;
- (id)filterPatternDictionary:(id)a3;
- (id)iconImageWithConfiguration:(id)a3;
- (id)imageAccessibilityIdentifer;
- (id)makeAVAssetFromAHAP:(id)a3 error:(id *)a4;
- (id)playbackObserverBlock;
- (id)player;
- (id)playerItem;
- (id)stringFromTimeInterval:(double)a3;
- (id)toolbarButtonsForTraitCollection:(id)a3;
- (int64_t)playbackTimeFormat;
- (opaqueCMSampleBuffer)createSampleBufferFromAHAP:(id)a3 error:(id *)a4;
- (void)_setupMissingAudioCustomLabel;
- (void)_updateContentUnavailableConfigurationUsingState:(id)a3;
- (void)loadPreviewControllerWithContents:(id)a3 context:(id)a4 completionHandler:(id)a5;
- (void)setHasAudioCustom:(BOOL)a3;
- (void)setupConstraints;
- (void)showTimeLabelIfNeeded;
- (void)viewDidLoad;
@end

@implementation QLHapticItemViewController

- (void)loadPreviewControllerWithContents:(id)a3 context:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = (NSObject **)MEMORY[0x263F62940];
  v12 = *MEMORY[0x263F62940];
  if (!*MEMORY[0x263F62940])
  {
    QLSInitLogging();
    v12 = *v11;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_217F61000, v12, OS_LOG_TYPE_INFO, "QLHapticItemViewController loadPreviewControllerWithContents #Media", (uint8_t *)buf, 2u);
  }
  [(QLHapticItemViewController *)self setHasAudioCustom:0];
  objc_initWeak(buf, self);
  id v13 = v8;
  objc_copyWeak(&v16, buf);
  id v15 = v10;
  id v14 = v9;
  QLRunInBackgroundThread();

  objc_destroyWeak(&v16);
  objc_destroyWeak(buf);
}

void __90__QLHapticItemViewController_loadPreviewControllerWithContents_context_completionHandler___block_invoke(id *a1)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  v2 = [a1[4] string];
  v3 = [v2 string];

  v4 = [v3 dataUsingEncoding:4];
  id WeakRetained = objc_loadWeakRetained(a1 + 8);
  id v19 = 0;
  v6 = [WeakRetained makeAVAssetFromAHAP:v4 error:&v19];
  id v7 = v19;

  if (!v6 || v7)
  {
    (*((void (**)(void))a1[7] + 2))();
  }
  else
  {
    id v8 = (id *)objc_loadWeakRetained(a1 + 8);
    id v9 = v8;
    if (v8)
    {
      objc_storeStrong(v8 + 143, v6);
      if ([v9 canPlayHaptics])
      {
        if ([v9 hasAudioCustom])
        {
          v17[1] = (id)MEMORY[0x263EF8330];
          v17[2] = (id)3221225472;
          v17[3] = __90__QLHapticItemViewController_loadPreviewControllerWithContents_context_completionHandler___block_invoke_1;
          v17[4] = &unk_2642F5AF8;
          objc_copyWeak(&v18, a1 + 8);
          QLRunInMainThread();
          objc_destroyWeak(&v18);
        }
        id v14 = v6;
        id v15 = a1[5];
        id v16 = a1[7];
        objc_copyWeak(v17, a1 + 8);
        QLRunInMainThread();
        objc_destroyWeak(v17);
      }
      else
      {
        v12 = (NSObject **)MEMORY[0x263F62940];
        id v13 = *MEMORY[0x263F62940];
        if (!*MEMORY[0x263F62940])
        {
          QLSInitLogging();
          id v13 = *v12;
        }
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_217F61000, v13, OS_LOG_TYPE_INFO, "Device does not support haptics. Calling for unavailable config #AnyItemViewController", buf, 2u);
        }
        [v9 _setNeedsUpdateContentUnavailableConfiguration];
        (*((void (**)(void))a1[7] + 2))();
      }
    }
    else
    {
      id v10 = (NSObject **)MEMORY[0x263F62940];
      v11 = *MEMORY[0x263F62940];
      if (!*MEMORY[0x263F62940])
      {
        QLSInitLogging();
        v11 = *v10;
      }
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v21 = "-[QLHapticItemViewController loadPreviewControllerWithContents:context:completionHandler:]_block_invoke";
        _os_log_impl(&dword_217F61000, v11, OS_LOG_TYPE_INFO, "%s: is not available #AnyItemViewController", buf, 0xCu);
      }
      [0 _setNeedsUpdateContentUnavailableConfiguration];
      (*((void (**)(void))a1[7] + 2))();
    }
  }
}

void __90__QLHapticItemViewController_loadPreviewControllerWithContents_context_completionHandler___block_invoke_1(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _setupMissingAudioCustomLabel];
}

void __90__QLHapticItemViewController_loadPreviewControllerWithContents_context_completionHandler___block_invoke_2(uint64_t a1)
{
  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 32);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __90__QLHapticItemViewController_loadPreviewControllerWithContents_context_completionHandler___block_invoke_3;
  v6[3] = &unk_2642F6520;
  id v7 = v2;
  id v8 = *(id *)(a1 + 56);
  objc_copyWeak(&v9, (id *)(a1 + 64));
  v5.receiver = v3;
  v5.super_class = (Class)QLHapticItemViewController;
  objc_msgSendSuper2(&v5, sel_loadPreviewControllerWithContents_context_completionHandler_, v4, v7, v6);
  objc_destroyWeak(&v9);
}

void __90__QLHapticItemViewController_loadPreviewControllerWithContents_context_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = (NSObject **)MEMORY[0x263F62940];
    objc_super v5 = *MEMORY[0x263F62940];
    if (!*MEMORY[0x263F62940])
    {
      QLSInitLogging();
      objc_super v5 = *v4;
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = *(void **)(a1 + 32);
      id v7 = v5;
      id v8 = [v6 previewTitle];
      int v13 = 138412546;
      id v14 = v8;
      __int16 v15 = 2112;
      id v16 = v3;
      _os_log_impl(&dword_217F61000, v7, OS_LOG_TYPE_ERROR, "Error while loading preview controller with preview item with name: %@: %@ #AnyItemViewController", (uint8_t *)&v13, 0x16u);
    }
    uint64_t v9 = *(void *)(a1 + 40);
    if (v9)
    {
      id v10 = *(void (**)(void))(v9 + 16);
LABEL_10:
      v10();
    }
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    [WeakRetained showTimeLabelIfNeeded];

    uint64_t v12 = *(void *)(a1 + 40);
    if (v12)
    {
      id v10 = *(void (**)(void))(v12 + 16);
      goto LABEL_10;
    }
  }
}

- (void)_setupMissingAudioCustomLabel
{
  id v3 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
  missingAudioCustomLabel = self->_missingAudioCustomLabel;
  self->_missingAudioCustomLabel = v3;

  objc_super v5 = self->_missingAudioCustomLabel;
  v6 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F835B8]];
  [(UILabel *)v5 setFont:v6];

  id v7 = self->_missingAudioCustomLabel;
  id v8 = [MEMORY[0x263F825C8] secondaryLabelColor];
  [(UILabel *)v7 setTextColor:v8];

  [(UILabel *)self->_missingAudioCustomLabel setAdjustsFontForContentSizeCategory:1];
  [(UILabel *)self->_missingAudioCustomLabel setTextAlignment:1];
  [(UILabel *)self->_missingAudioCustomLabel setNumberOfLines:0];
  [(UILabel *)self->_missingAudioCustomLabel setLineBreakMode:0];
  uint64_t v9 = self->_missingAudioCustomLabel;
  id v10 = [MEMORY[0x263F825C8] clearColor];
  [(UILabel *)v9 setBackgroundColor:v10];

  [(UILabel *)self->_missingAudioCustomLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  v11 = NSString;
  uint64_t v12 = QLLocalizedString();
  int v13 = [v11 localizedStringWithFormat:v12];
  [(UILabel *)self->_missingAudioCustomLabel setText:v13];

  id v14 = [(QLHapticItemViewController *)self view];
  [v14 addSubview:self->_missingAudioCustomLabel];
}

- (BOOL)canPlayHaptics
{
  v2 = [(QLHapticItemViewController *)self playerItem];
  char v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) == 0) {
    return 0;
  }
  uint64_t v4 = [MEMORY[0x263F00588] capabilitiesForHardware];
  char v5 = [v4 supportsHaptics];

  return v5;
}

- (id)iconImageWithConfiguration:(id)a3
{
  return (id)[MEMORY[0x263F827E8] _systemImageNamed:@"apple.haptics" withConfiguration:a3];
}

- (id)imageAccessibilityIdentifer
{
  return @"QLHapticItemViewControllerAhapconImageViewAccessibilityIdentifier";
}

- (BOOL)usesScrubber
{
  return 0;
}

- (id)playerItem
{
  playerItem = self->_playerItem;
  if (!playerItem)
  {
    if (self->super.super.super._mediaAsset)
    {
      objc_msgSend(MEMORY[0x263EFA800], "playerItemWithAsset:");
      uint64_t v4 = (AVPlayerItem *)objc_claimAutoreleasedReturnValue();
      char v5 = self->_playerItem;
      self->_playerItem = v4;

      playerItem = self->_playerItem;
    }
    else
    {
      playerItem = 0;
    }
  }

  return playerItem;
}

- (id)player
{
  player = self->super.super.super._player;
  if (!player)
  {
    if (self->super.super.super._mediaAsset)
    {
      uint64_t v4 = [(QLHapticItemViewController *)self playerItem];
      if (objc_opt_respondsToSelector()) {
        [v4 setPlayHapticTracks:1];
      }
      char v5 = [MEMORY[0x263EFA7F0] playerWithPlayerItem:v4];
      v6 = self->super.super.super._player;
      self->super.super.super._player = v5;

      player = self->super.super.super._player;
    }
    else
    {
      player = 0;
    }
  }

  return player;
}

- (int64_t)playbackTimeFormat
{
  return 1;
}

- (BOOL)_assetIsDecodable:(id)a3
{
  return 1;
}

- (void)showTimeLabelIfNeeded
{
  if ([(QLMediaItemBaseViewController *)self isFullScreen]) {
    return;
  }
  id v6 = [(QLItemViewController *)self appearance];
  if ([v6 presentationMode] != 4)
  {
    char v3 = [(QLItemViewController *)self appearance];
    if ([v3 presentationMode] != 3)
    {
      uint64_t v4 = [(QLItemViewController *)self appearance];
      if ([v4 presentationMode])
      {
        BOOL v5 = [(QLHapticItemViewController *)self canPlayHaptics];

        if (v5)
        {
          [(QLMediaItemViewController *)self showTimeLabel];
        }
        return;
      }
    }
  }
}

- (void)setupConstraints
{
  v47[3] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  missingAudioCustomLabel = self->_missingAudioCustomLabel;
  unint64_t v5 = 0x263EFF000;
  if (missingAudioCustomLabel)
  {
    id v6 = [(UILabel *)missingAudioCustomLabel topAnchor];
    id v7 = [(QLHapticItemViewController *)self view];
    id v8 = [v7 layoutMarginsGuide];
    uint64_t v9 = [v8 topAnchor];
    id v10 = [v6 constraintEqualToAnchor:v9 constant:8.0];

    v11 = [(UILabel *)self->_missingAudioCustomLabel leftAnchor];
    uint64_t v12 = [(QLHapticItemViewController *)self view];
    int v13 = [v12 layoutMarginsGuide];
    id v14 = [v13 leftAnchor];
    __int16 v15 = [v11 constraintEqualToAnchor:v14];

    id v16 = [(UILabel *)self->_missingAudioCustomLabel rightAnchor];
    uint64_t v17 = [(QLHapticItemViewController *)self view];
    id v18 = [v17 layoutMarginsGuide];
    id v19 = [v18 rightAnchor];
    v20 = [v16 constraintEqualToAnchor:v19];

    unint64_t v5 = 0x263EFF000uLL;
    [(UILabel *)self->_missingAudioCustomLabel sizeToFit];
    v47[0] = v10;
    v47[1] = v15;
    v47[2] = v20;
    v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:v47 count:3];
    [v3 addObjectsFromArray:v21];
  }
  backgroundIconImageView = self->super._backgroundIconImageView;
  if (backgroundIconImageView)
  {
    v23 = [(UIImageView *)backgroundIconImageView centerXAnchor];
    v24 = [(QLHapticItemViewController *)self view];
    v25 = [v24 centerXAnchor];
    v26 = [v23 constraintEqualToAnchor:v25];

    v27 = [(UIImageView *)self->super._backgroundIconImageView centerYAnchor];
    v28 = [(QLHapticItemViewController *)self view];
    v29 = [v28 centerYAnchor];
    v30 = [v27 constraintEqualToAnchor:v29];

    if (self->_missingAudioCustomLabel)
    {
      LODWORD(v31) = 1131741184;
      [v30 setPriority:v31];
      v32 = [(UIImageView *)self->super._backgroundIconImageView topAnchor];
      v33 = [(UILabel *)self->_missingAudioCustomLabel bottomAnchor];
      v34 = [v32 constraintGreaterThanOrEqualToAnchor:v33 constant:8.0];
      [v3 addObject:v34];
    }
    v46[0] = v26;
    v46[1] = v30;
    v35 = [*(id *)(v5 + 2240) arrayWithObjects:v46 count:2];
    [v3 addObjectsFromArray:v35];

    unint64_t v36 = v5;
    playButton = self->super._playButton;
    if (playButton)
    {
      v38 = [(QLOverlayPlayButton *)playButton centerYAnchor];
      v39 = [(UIImageView *)self->super._backgroundIconImageView centerYAnchor];
      v40 = [v38 constraintEqualToAnchor:v39];
      v41 = [(QLOverlayPlayButton *)self->super._playButton centerXAnchor];
      v42 = [(UIImageView *)self->super._backgroundIconImageView centerXAnchor];
      v43 = [v41 constraintEqualToAnchor:v42];
      v45[1] = v43;
      v44 = [*(id *)(v36 + 2240) arrayWithObjects:v45 count:2];
      [v3 addObjectsFromArray:v44];
    }
  }
  [MEMORY[0x263F08938] activateConstraints:v3];
}

- (void)viewDidLoad
{
  v9[2] = *MEMORY[0x263EF8340];
  v8.receiver = self;
  v8.super_class = (Class)QLHapticItemViewController;
  [(QLHapticItemViewController *)&v8 viewDidLoad];
  objc_initWeak(&location, self);
  v9[0] = objc_opt_class();
  v9[1] = objc_opt_class();
  id v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:2];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __41__QLHapticItemViewController_viewDidLoad__block_invoke;
  v5[3] = &unk_2642F5408;
  objc_copyWeak(&v6, &location);
  id v4 = (id)[(QLHapticItemViewController *)self registerForTraitChanges:v3 withHandler:v5];

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

uint64_t __41__QLHapticItemViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = (void *)WeakRetained[181];
  if (v2)
  {
    id v4 = WeakRetained;
    v2 = (void *)[v2 sizeToFit];
    id WeakRetained = v4;
  }

  return MEMORY[0x270F9A758](v2, WeakRetained);
}

- (void)_updateContentUnavailableConfigurationUsingState:(id)a3
{
  if (![(QLHapticItemViewController *)self canPlayHaptics])
  {
    id v10 = [MEMORY[0x263F82600] emptyProminentConfiguration];
    id v4 = NSString;
    unint64_t v5 = QLLocalizedString();
    id v6 = [v4 localizedStringWithFormat:v5];
    [v10 setText:v6];

    id v7 = NSString;
    objc_super v8 = QLLocalizedString();
    uint64_t v9 = [v7 localizedStringWithFormat:v8];
    [v10 setSecondaryText:v9];

    [(QLHapticItemViewController *)self _setContentUnavailableConfiguration:v10];
  }
}

- (BOOL)play
{
  BOOL v3 = [(QLMediaItemBaseViewController *)self isVisible];
  if (v3)
  {
    id v4 = [(QLHapticItemViewController *)self player];
    uint64_t v5 = [v4 status];

    if (v5 == 1)
    {
      id v6 = [(QLHapticItemViewController *)self player];
      long long v9 = *MEMORY[0x263F010E0];
      uint64_t v10 = *(void *)(MEMORY[0x263F010E0] + 16);
      [v6 seekToTime:&v9];

      id v7 = [(QLHapticItemViewController *)self player];
      [v7 play];

      LOBYTE(v3) = 1;
    }
    else
    {
      LOBYTE(v3) = 0;
    }
  }
  return v3;
}

- (float)playerTimeObservationInterval
{
  return 0.05;
}

- (id)playbackObserverBlock
{
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __51__QLHapticItemViewController_playbackObserverBlock__block_invoke;
  aBlock[3] = &unk_2642F6598;
  objc_copyWeak(&v6, &location);
  aBlock[4] = self;
  BOOL v3 = _Block_copy(aBlock);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);

  return v3;
}

void __51__QLHapticItemViewController_playbackObserverBlock__block_invoke(uint64_t a1, CMTime *a2)
{
  id v4 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  CMTime time = *a2;
  [WeakRetained observePlayingTime:&time];

  CMTime time = *a2;
  *(Float64 *)(*(void *)(a1 + 32) + 1456) = CMTimeGetSeconds(&time);
  id v6 = objc_loadWeakRetained(v4);
  id v7 = [v6 player];
  objc_super v8 = [v7 currentItem];
  long long v9 = [v8 asset];
  uint64_t v10 = v9;
  if (v9) {
    [v9 duration];
  }
  else {
    memset(&v14, 0, sizeof(v14));
  }
  double Seconds = CMTimeGetSeconds(&v14);
  id v12 = objc_loadWeakRetained(v4);
  [v12 elapsedTime];
  *(double *)(*(void *)(a1 + 32) + 1464) = Seconds - v13;
}

- (id)stringFromTimeInterval:(double)a3
{
  if (stringFromTimeInterval__onceToken != -1) {
    dispatch_once(&stringFromTimeInterval__onceToken, &__block_literal_global_7);
  }
  HIDWORD(v4) = 1078853632;
  if (a3 <= 60.0)
  {
    id v6 = (void *)stringFromTimeInterval__millisecondTimeFormatter;
    *(float *)&double v4 = a3;
    id v7 = [NSNumber numberWithFloat:v4];
    objc_super v8 = [v6 stringFromNumber:v7];

    long long v9 = NSString;
    uint64_t v10 = QLLocalizedStringWithDefaultValue();
    uint64_t v5 = objc_msgSend(v9, "localizedStringWithFormat:", v10, v8);
  }
  else
  {
    uint64_t v5 = [(id)stringFromTimeInterval__minuteSecondFormatter stringFromTimeInterval:a3];
  }

  return v5;
}

void __53__QLHapticItemViewController_stringFromTimeInterval___block_invoke()
{
  id v8 = [MEMORY[0x263EFF8F0] currentCalendar];
  id v0 = objc_alloc(MEMORY[0x263EFF960]);
  v1 = [MEMORY[0x263EFF960] autoupdatingCurrentLocale];
  v2 = [v1 localeIdentifier];
  BOOL v3 = (void *)[v0 initWithLocaleIdentifier:v2];

  [v8 setLocale:v3];
  id v4 = objc_alloc_init(MEMORY[0x263F08780]);
  uint64_t v5 = (void *)stringFromTimeInterval__minuteSecondFormatter;
  stringFromTimeInterval__minuteSecondFormatter = (uint64_t)v4;

  [(id)stringFromTimeInterval__minuteSecondFormatter setCalendar:v8];
  [(id)stringFromTimeInterval__minuteSecondFormatter setAllowedUnits:192];
  [(id)stringFromTimeInterval__minuteSecondFormatter setUnitsStyle:0];
  [(id)stringFromTimeInterval__minuteSecondFormatter setZeroFormattingBehavior:0x10000];
  [(id)stringFromTimeInterval__minuteSecondFormatter setAllowsFractionalUnits:1];
  id v6 = objc_alloc_init(MEMORY[0x263F08A30]);
  id v7 = (void *)stringFromTimeInterval__millisecondTimeFormatter;
  stringFromTimeInterval__millisecondTimeFormatter = (uint64_t)v6;

  [(id)stringFromTimeInterval__millisecondTimeFormatter setNumberStyle:1];
  [(id)stringFromTimeInterval__millisecondTimeFormatter setRoundingMode:5];
  [(id)stringFromTimeInterval__millisecondTimeFormatter setLocale:v3];
  [(id)stringFromTimeInterval__millisecondTimeFormatter setPaddingPosition:0];
  [(id)stringFromTimeInterval__millisecondTimeFormatter setPaddingCharacter:@"0"];
  [(id)stringFromTimeInterval__millisecondTimeFormatter setMinimumIntegerDigits:2];
  [(id)stringFromTimeInterval__millisecondTimeFormatter setMinimumFractionDigits:1];
  [(id)stringFromTimeInterval__millisecondTimeFormatter setMaximumFractionDigits:1];
}

- (id)toolbarButtonsForTraitCollection:(id)a3
{
  v8[1] = *MEMORY[0x263EF8340];
  if ([(QLMediaItemBaseViewController *)self shouldDisplayPlayButtonInNavigationBar]&& [(QLMediaItemBaseViewController *)self playable])
  {
    id v4 = (void *)[objc_alloc(MEMORY[0x263F629D0]) initWithIdentifier:@"togglePlay"];
    [v4 setPlacement:0];
    if ([(QLMediaItemBaseViewController *)self playingStatus] == 1)
    {
      [v4 setSymbolImageName:@"stop.fill"];
      uint64_t v5 = QLMediaItemViewControllerBarPlayButtonPlayingAccessibilityIdentifier;
    }
    else
    {
      [v4 setSymbolImageName:0];
      [v4 setSystemItem:17];
      uint64_t v5 = QLMediaItemViewControllerBarPlayButtonPausedAccessibilityIdentifier;
    }
    [v4 setAccessibilityIdentifier:*v5];
    v8[0] = v4;
    id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:1];
  }
  else
  {
    id v6 = (void *)MEMORY[0x263EFFA68];
  }

  return v6;
}

- (double)elapsedTime
{
  return self->_elapsedTime;
}

- (double)remainingTime
{
  return self->_remainingTime;
}

- (id)makeAVAssetFromAHAP:(id)a3 error:(id *)a4
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  uint64_t v5 = -[QLHapticItemViewController createSampleBufferFromAHAP:error:](self, "createSampleBufferFromAHAP:error:", a3);
  if (v5 && !*a4)
  {
    uint64_t v10 = v5;
    v11 = (void *)MEMORY[0x263EFA798];
    id v12 = [MEMORY[0x263EFF8F8] dataWithBytes:&movieHeaderMPEG4 length:148];
    double v13 = [v11 movieWithData:v12 options:0 error:a4];

    if (v13 && !*a4)
    {
      uint64_t v17 = [NSURL _QLCreateTemporaryDirectory:a4];
      if (v17 && !*a4)
      {
        v21 = [MEMORY[0x263F08C38] UUID];
        uint64_t v22 = [v21 UUIDString];
        v23 = [v17 URLByAppendingPathComponent:v22];

        v24 = (void *)[objc_alloc(MEMORY[0x263EFA720]) initWithURL:v23 options:0];
        [v13 setDefaultMediaDataStorage:v24];

        v25 = [v13 addMutableTrackWithMediaType:*MEMORY[0x263EF9D00] copySettingsFromTrack:0 options:0];
        if ([v25 appendSampleBuffer:v10 decodeTime:0 presentationTime:0 error:a4])
        {
          memset(&buf, 0, sizeof(buf));
          CMSampleBufferGetDuration(&duration, v10);
          *(_OWORD *)&start.start.value = *MEMORY[0x263F010E0];
          start.start.epoch = *(void *)(MEMORY[0x263F010E0] + 16);
          CMTimeRangeMake(&buf, &start.start, &duration);
          CMTimeRange start = buf;
          CMTimeRange v29 = buf;
          [v25 insertMediaTimeRange:&start intoTimeRange:&v29];
          id v9 = v13;
        }
        else
        {
          v26 = QLSLogHandle();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            id v27 = *a4;
            LODWORD(buf.start.value) = 138412290;
            *(CMTimeValue *)((char *)&buf.start.value + 4) = (CMTimeValue)v27;
            _os_log_impl(&dword_217F61000, v26, OS_LOG_TYPE_ERROR, "Failed to create an AVMutableMovieTrack for haptics: %@ #AnyItemViewController", (uint8_t *)&buf, 0xCu);
          }

          id v9 = 0;
        }
      }
      else
      {
        id v18 = (NSObject **)MEMORY[0x263F62940];
        id v19 = *MEMORY[0x263F62940];
        if (!*MEMORY[0x263F62940])
        {
          QLSInitLogging();
          id v19 = *v18;
        }
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          id v20 = *a4;
          LODWORD(buf.start.value) = 138412290;
          *(CMTimeValue *)((char *)&buf.start.value + 4) = (CMTimeValue)v20;
          _os_log_impl(&dword_217F61000, v19, OS_LOG_TYPE_ERROR, "Failed to create a temporary directory: %@ #AnyItemViewController", (uint8_t *)&buf, 0xCu);
        }
        id v9 = 0;
      }
    }
    else
    {
      CMTime v14 = (NSObject **)MEMORY[0x263F62940];
      __int16 v15 = *MEMORY[0x263F62940];
      if (!*MEMORY[0x263F62940])
      {
        QLSInitLogging();
        __int16 v15 = *v14;
      }
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        id v16 = *a4;
        LODWORD(buf.start.value) = 138412290;
        *(CMTimeValue *)((char *)&buf.start.value + 4) = (CMTimeValue)v16;
        _os_log_impl(&dword_217F61000, v15, OS_LOG_TYPE_ERROR, "Failed to create an AVMutableMovie: %@ #AnyItemViewController", (uint8_t *)&buf, 0xCu);
      }
      id v9 = 0;
    }
  }
  else
  {
    id v6 = (NSObject **)MEMORY[0x263F62940];
    id v7 = *MEMORY[0x263F62940];
    if (!*MEMORY[0x263F62940])
    {
      QLSInitLogging();
      id v7 = *v6;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v8 = *a4;
      LODWORD(buf.start.value) = 138412290;
      *(CMTimeValue *)((char *)&buf.start.value + 4) = (CMTimeValue)v8;
      _os_log_impl(&dword_217F61000, v7, OS_LOG_TYPE_ERROR, "Failed to create a sample buffer with AHAP contents: %@ #AnyItemViewController", (uint8_t *)&buf, 0xCu);
    }
    id v9 = 0;
  }

  return v9;
}

- (id)filterPatternDictionary:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 objectForKey:@"Pattern"];
  id v6 = [v5 indexesOfObjectsPassingTest:&__block_literal_global_78];
  if ([v6 count])
  {
    self->_hasAudioCustom = 1;
    id v7 = [MEMORY[0x263EFF980] arrayWithArray:v5];
    [v7 removeObjectsAtIndexes:v6];
    [v4 setObject:v7 forKey:@"Pattern"];
  }
  id v8 = (void *)[v4 copy];

  return v8;
}

uint64_t __54__QLHapticItemViewController_filterPatternDictionary___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 objectForKeyedSubscript:@"Event"];
  BOOL v3 = [v2 objectForKeyedSubscript:@"EventType"];
  uint64_t v4 = [v3 isEqualToString:@"AudioCustom"];

  return v4;
}

- (opaqueCMSampleBuffer)createSampleBufferFromAHAP:(id)a3 error:(id *)a4
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v6 = a3;
  CMFormatDescriptionRef formatDescriptionOut = 0;
  CFAllocatorRef v7 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  OSStatus v8 = CMFormatDescriptionCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], 0x68617074u, 0x61686172u, 0, &formatDescriptionOut);
  if (!v8)
  {
    double v13 = [MEMORY[0x263F08900] JSONObjectWithData:v6 options:4 error:a4];
    CMTime v14 = (void *)[v13 mutableCopy];
    __int16 v15 = [(QLHapticItemViewController *)self filterPatternDictionary:v14];

    id v16 = (void *)[objc_alloc(MEMORY[0x263F005A8]) initWithDictionary:v15 error:a4];
    memset(&v38, 0, sizeof(v38));
    [v16 duration];
    CMTimeMakeWithSeconds(&v38, v17, 10000);
    buf.CMTime duration = v38;
    long long v34 = *MEMORY[0x263F010E0];
    *(_OWORD *)&time2.value = *MEMORY[0x263F010E0];
    CMTimeEpoch v18 = *(void *)(MEMORY[0x263F010E0] + 16);
    time2.epoch = v18;
    if (CMTimeCompare(&buf.duration, &time2) <= 0)
    {
      uint64_t v41 = *MEMORY[0x263F08320];
      v42 = @"Computed negative pattern duration, which is not possible.";
      v26 = [NSDictionary dictionaryWithObjects:&v42 forKeys:&v41 count:1];
      id v27 = objc_alloc(MEMORY[0x263F087E8]);
      *a4 = (id)[v27 initWithDomain:*MEMORY[0x263F629F0] code:-1 userInfo:v26];
      v28 = (NSObject **)MEMORY[0x263F62940];
      CMTimeRange v29 = *MEMORY[0x263F62940];
      if (!*MEMORY[0x263F62940])
      {
        QLSInitLogging();
        CMTimeRange v29 = *v28;
      }
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf.duration.value) = 0;
        _os_log_impl(&dword_217F61000, v29, OS_LOG_TYPE_ERROR, "Duration cannot be less than 0. #AnyItemViewController", (uint8_t *)&buf, 2u);
      }

      goto LABEL_24;
    }
    CMBlockBufferRef theBuffer = 0;
    id v19 = v6;
    OSStatus v20 = CMBlockBufferCreateWithMemoryBlock(v7, (void *)[v19 bytes], objc_msgSend(v19, "length"), v7, 0, 0, objc_msgSend(v19, "length"), 0, &theBuffer);
    if (v20)
    {
      *a4 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:v20 userInfo:0];
      v21 = (NSObject **)MEMORY[0x263F62940];
      uint64_t v22 = *MEMORY[0x263F62940];
      if (!*MEMORY[0x263F62940])
      {
        QLSInitLogging();
        uint64_t v22 = *v21;
      }
      if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        goto LABEL_24;
      }
      id v23 = *a4;
      LODWORD(buf.duration.value) = 138412290;
      *(CMTimeValue *)((char *)&buf.duration.value + 4) = (CMTimeValue)v23;
      v24 = "Failed to allocate memory block: %@ #AnyItemViewController";
      p_CMSampleTimingInfo buf = &buf;
    }
    else
    {
      size_t sampleSizeArray = CMBlockBufferGetDataLength(theBuffer);
      buf.CMTime duration = v38;
      *(_OWORD *)&buf.presentationTimeStamp.value = v34;
      buf.presentationTimeStamp.epoch = v18;
      buf.decodeTimeStamp = *(CMTime *)*(void *)&MEMORY[0x263F01090];
      CMSampleBufferRef sampleBufferOut = 0;
      OSStatus v30 = CMSampleBufferCreateReady(v7, theBuffer, formatDescriptionOut, 1, 1, &buf, 1, &sampleSizeArray, &sampleBufferOut);
      if (!v30)
      {
        id v12 = sampleBufferOut;
        goto LABEL_25;
      }
      *a4 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:v30 userInfo:0];
      double v31 = (NSObject **)MEMORY[0x263F62940];
      uint64_t v22 = *MEMORY[0x263F62940];
      if (!*MEMORY[0x263F62940])
      {
        QLSInitLogging();
        uint64_t v22 = *v31;
      }
      if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
LABEL_24:
        id v12 = 0;
LABEL_25:

        goto LABEL_26;
      }
      id v32 = *a4;
      LODWORD(time2.value) = 138412290;
      *(CMTimeValue *)((char *)&time2.value + 4) = (CMTimeValue)v32;
      v24 = "Failed to create sample buffer: %@ #AnyItemViewController";
      p_CMSampleTimingInfo buf = (CMSampleTimingInfo *)&time2;
    }
    _os_log_impl(&dword_217F61000, v22, OS_LOG_TYPE_ERROR, v24, (uint8_t *)p_buf, 0xCu);
    goto LABEL_24;
  }
  *a4 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:v8 userInfo:0];
  id v9 = (NSObject **)MEMORY[0x263F62940];
  uint64_t v10 = *MEMORY[0x263F62940];
  if (!*MEMORY[0x263F62940])
  {
    QLSInitLogging();
    uint64_t v10 = *v9;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    id v11 = *a4;
    LODWORD(buf.duration.value) = 138412290;
    *(CMTimeValue *)((char *)&buf.duration.value + 4) = (CMTimeValue)v11;
    _os_log_impl(&dword_217F61000, v10, OS_LOG_TYPE_ERROR, "Failed to get format descriptor: %@ #AnyItemViewController", (uint8_t *)&buf, 0xCu);
  }
  id v12 = 0;
LABEL_26:

  return v12;
}

- (BOOL)hasAudioCustom
{
  return self->_hasAudioCustom;
}

- (void)setHasAudioCustom:(BOOL)a3
{
  self->_hasAudioCustom = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_missingAudioCustomLabel, 0);

  objc_storeStrong((id *)&self->_playerItem, 0);
}

@end