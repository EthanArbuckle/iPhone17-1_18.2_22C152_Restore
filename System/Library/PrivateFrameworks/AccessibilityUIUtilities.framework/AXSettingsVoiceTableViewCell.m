@interface AXSettingsVoiceTableViewCell
- (AXResourceDownloadInformationDelegate)infoDelegate;
- (AXSettingsVoiceTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (BOOL)_axDownload;
- (BOOL)_axPerVoiceSettings;
- (BOOL)accessibilityActivate;
- (BOOL)indentsForVoiceGraphic;
- (BOOL)isAccessibilityElement;
- (BOOL)showsInfoLabel;
- (BOOL)showsPerVoiceSettingsButton;
- (BOOL)showsPlayButton;
- (BOOL)showsUsageInfo;
- (UIImageView)siriImageView;
- (id)accessibilityCustomActions;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (id)colorFromHexString:(id)a3 alpha:(float)a4;
- (id)infoLabel;
- (id)resources;
- (unint64_t)accessibilityTraits;
- (void)_axPlaySample;
- (void)_axShowCloudImageFor:(id)a3;
- (void)_updateInfoLabelText;
- (void)itemOfferButtonDidAnimateTransition:(id)a3;
- (void)layoutSubviews;
- (void)refreshCellContentsWithSpecifier:(id)a3;
- (void)setIndentsForVoiceGraphic:(BOOL)a3;
- (void)setInfoDelegate:(id)a3;
- (void)setShowsInfoLabel:(BOOL)a3;
- (void)setShowsPerVoiceSettingsButton:(BOOL)a3;
- (void)setShowsPlayButton:(BOOL)a3;
- (void)setShowsUsageInfo:(BOOL)a3;
- (void)setSiriImageView:(id)a3;
- (void)updateInformation;
@end

@implementation AXSettingsVoiceTableViewCell

- (AXSettingsVoiceTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  v31.receiver = self;
  v31.super_class = (Class)AXSettingsVoiceTableViewCell;
  v5 = [(PSTableCell *)&v31 initWithStyle:a3 reuseIdentifier:a4 specifier:a5];
  if (v5)
  {
    id v6 = objc_alloc((Class)getSUUIItemOfferButtonClass());
    double v7 = *MEMORY[0x1E4F1DB28];
    double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v10 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    uint64_t v11 = objc_msgSend(v6, "initWithFrame:", *MEMORY[0x1E4F1DB28], v8, v9, v10);
    downloadButton = v5->_downloadButton;
    v5->_downloadButton = (SUUIItemOfferButton *)v11;

    [(SUUIItemOfferButton *)v5->_downloadButton setDelegate:v5];
    [(SUUIItemOfferButton *)v5->_downloadButton setHidden:1];
    [(SUUIItemOfferButton *)v5->_downloadButton addTarget:v5 action:sel__axDownload forControlEvents:64];
    v13 = [MEMORY[0x1E4FB1618] clearColor];
    [(SUUIItemOfferButton *)v5->_downloadButton setBackgroundColor:v13];

    v14 = [(AXSettingsVoiceTableViewCell *)v5 contentView];
    [v14 addSubview:v5->_downloadButton];

    uint64_t v15 = objc_msgSend(objc_alloc((Class)getSUUIItemOfferButtonClass()), "initWithFrame:", v7, v8, v9, v10);
    sampleButton = v5->_sampleButton;
    v5->_sampleButton = (SUUIItemOfferButton *)v15;

    [(SUUIItemOfferButton *)v5->_sampleButton setDelegate:v5];
    [(SUUIItemOfferButton *)v5->_sampleButton addTarget:v5 action:sel__axPlaySample forControlEvents:64];
    v17 = [MEMORY[0x1E4FB1618] clearColor];
    [(SUUIItemOfferButton *)v5->_sampleButton setBackgroundColor:v17];

    v18 = [(AXSettingsVoiceTableViewCell *)v5 contentView];
    [v18 addSubview:v5->_sampleButton];

    uint64_t v19 = [MEMORY[0x1E4FB14D0] buttonWithType:3];
    perVoiceSettingsButton = v5->_perVoiceSettingsButton;
    v5->_perVoiceSettingsButton = (UIButton *)v19;

    v21 = v5->_perVoiceSettingsButton;
    v22 = [MEMORY[0x1E4FB1818] systemImageNamed:@"info.circle"];
    [(UIButton *)v21 setImage:v22 forState:0];

    [(UIButton *)v5->_perVoiceSettingsButton addTarget:v5 action:sel__axPerVoiceSettings forControlEvents:64];
    v23 = [MEMORY[0x1E4FB1618] clearColor];
    [(UIButton *)v5->_perVoiceSettingsButton setBackgroundColor:v23];

    [(UIButton *)v5->_perVoiceSettingsButton setHidden:1];
    v24 = [(AXSettingsVoiceTableViewCell *)v5 contentView];
    [v24 addSubview:v5->_perVoiceSettingsButton];

    uint64_t v25 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", v7, v8, v9, v10);
    infoLabel = v5->_infoLabel;
    v5->_infoLabel = (UILabel *)v25;

    v27 = [MEMORY[0x1E4FB1798] preferredFontForTextStyle:*MEMORY[0x1E4FB28D8]];
    [(UILabel *)v5->_infoLabel setFont:v27];

    v28 = [(AXSettingsVoiceTableViewCell *)v5 contentView];
    [v28 addSubview:v5->_infoLabel];

    v29 = [MEMORY[0x1E4FB1618] clearColor];
    [(UILabel *)v5->_infoLabel setBackgroundColor:v29];

    [(UILabel *)v5->_infoLabel setHidden:1];
  }
  return v5;
}

- (id)infoLabel
{
  return self->_infoLabel;
}

- (id)resources
{
  v2 = [(PSTableCell *)self specifier];
  v3 = [v2 propertyForKey:@"Resources"];

  return v3;
}

- (void)updateInformation
{
}

uint64_t __49__AXSettingsVoiceTableViewCell_updateInformation__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutSubviews];
}

- (void)_updateInfoLabelText
{
  v2 = self;
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  [(UILabel *)self->_infoLabel setAdjustsFontSizeToFitWidth:1];
  if ([(AXSettingsVoiceTableViewCell *)v2 showsInfoLabel]
    || [(AXSettingsVoiceTableViewCell *)v2 showsUsageInfo])
  {
    v3 = [(AXSettingsVoiceTableViewCell *)v2 resources];
    uint64_t v4 = [v3 count];

    if (v4 == 1)
    {
      v5 = [(AXSettingsVoiceTableViewCell *)v2 resources];
      id v6 = [v5 firstObject];
      double v7 = [v6 speechVoice];
      int v8 = [v7 canBeDownloaded];

      if (v8)
      {
        double v9 = [(AXSettingsVoiceTableViewCell *)v2 resources];
        double v10 = [v9 firstObject];
        int v11 = [v10 isInstalled];

        if (v11)
        {
          if ([(AXSettingsVoiceTableViewCell *)v2 showsUsageInfo])
          {
            v12 = [(AXSettingsVoiceTableViewCell *)v2 resources];
            v13 = [v12 firstObject];
            int v14 = AXResourceActivelyUsed();

            if (v14)
            {
              uint64_t v15 = [(AXSettingsVoiceTableViewCell *)v2 resources];
              v16 = [v15 firstObject];
              v17 = AXClientsForSiriResource();

              long long v74 = 0u;
              long long v75 = 0u;
              long long v72 = 0u;
              long long v73 = 0u;
              id v18 = v17;
              uint64_t v19 = [v18 countByEnumeratingWithState:&v72 objects:v76 count:16];
              p_isa = (id *)&v2->super.super.super.super.super.isa;
              if (v19)
              {
                uint64_t v20 = v19;
                v21 = 0;
                uint64_t v22 = *(void *)v73;
                do
                {
                  for (uint64_t i = 0; i != v20; ++i)
                  {
                    v24 = v21;
                    if (*(void *)v73 != v22) {
                      objc_enumerationMutation(v18);
                    }
                    uint64_t v25 = *(void **)(*((void *)&v72 + 1) + 8 * i);
                    v26 = AXAppNameForBundleId(v25);
                    if (!v26)
                    {
                      char v27 = [v25 isEqualToString:@"com.apple.AssistantServices"];
                      v28 = @"SIRI_CLIENT";
                      if ((v27 & 1) != 0
                        || (char v29 = [v25 isEqualToString:@"com.apple.MapsSupport"],
                            v28 = @"MAPS_CLIENT",
                            (v29 & 1) != 0)
                        || (char v30 = [v25 isEqualToString:@"com.apple.translationd"],
                            v28 = @"TRANSLATE_CLIENT",
                            (v30 & 1) != 0)
                        || (char v31 = [v25 isEqualToString:@"com.apple.accessibility.AccessibilityUIServer"], v28 = @"UNKNOWN_CLIENT", (v31 & 1) == 0))
                      {
                        v26 = AXUILocalizedStringForKey(v28);
                      }
                      else
                      {
                        v26 = 0;
                      }
                    }
                    v21 = __AXStringForVariables();
                  }
                  uint64_t v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v72, v76, 16, v26, @"__AXStringForVariablesSentinel");
                }
                while (v20);
              }
              else
              {
                v21 = 0;
              }

              v41 = [MEMORY[0x1E4F49458] sharedInstance];
              v42 = [v41 selectedSpeechVoiceIdentifiersForSourceKey:*MEMORY[0x1E4F481F8]];

              v43 = [MEMORY[0x1E4F49458] sharedInstance];
              v71 = [v43 selectedSpeechVoiceIdentifiersForSourceKey:*MEMORY[0x1E4F481E0]];

              v44 = [MEMORY[0x1E4F49458] sharedInstance];
              v45 = [v44 selectedSpeechVoiceIdentifiersForSourceKey:*MEMORY[0x1E4F481E8]];

              v2 = (AXSettingsVoiceTableViewCell *)p_isa;
              v46 = [p_isa resources];
              v47 = [v46 firstObject];
              v48 = [v47 voiceId];
              int v49 = [v42 containsObject:v48];

              if (v49)
              {
                v65 = AXUILocalizedStringForKey(@"VOICEOVER_CLIENT");
                v68 = @"__AXStringForVariablesSentinel";
                uint64_t v50 = __AXStringForVariables();

                v21 = (void *)v50;
              }
              v51 = objc_msgSend(p_isa, "resources", v65, v68);
              v52 = [v51 firstObject];
              v53 = [v52 voiceId];
              int v54 = [v71 containsObject:v53];

              if (v54)
              {
                v66 = AXUILocalizedStringForKey(@"SPOKEN_CONTENT_CLIENT");
                v69 = @"__AXStringForVariablesSentinel";
                uint64_t v55 = __AXStringForVariables();

                v21 = (void *)v55;
              }
              v56 = objc_msgSend(p_isa, "resources", v66, v69);
              v57 = [v56 firstObject];
              v58 = [v57 voiceId];
              int v59 = [v45 containsObject:v58];

              if (v59)
              {
                v67 = AXUILocalizedStringForKey(@"SWITCH_CONTROL_CLIENT");
                uint64_t v60 = __AXStringForVariables();

                v21 = (void *)v60;
              }
              v61 = NSString;
              v62 = AXUILocalizedStringForKey(@"VOICE_USAGE");
              v63 = objc_msgSend(v61, "stringWithFormat:", v62, v21);
              [p_isa[152] setText:v63];

              goto LABEL_38;
            }
          }
          v37 = [(AXSettingsVoiceTableViewCell *)v2 resources];
          v38 = [v37 firstObject];
          uint64_t v39 = [v38 assetSize];

          if (v39)
          {
            id v18 = [(AXSettingsVoiceTableViewCell *)v2 resources];
            v21 = [v18 firstObject];
            v40 = AXLocalizedTileForResourceOnDiskSizeUsed(v21);
            [(UILabel *)v2->_infoLabel setText:v40];

LABEL_38:
          }
        }
        else
        {
          v33 = (void *)MEMORY[0x1E4F28B68];
          v34 = [(AXSettingsVoiceTableViewCell *)v2 resources];
          v35 = [v34 firstObject];
          v36 = objc_msgSend(v33, "stringFromByteCount:countStyle:", objc_msgSend(v35, "assetSize"), 0);
          [(UILabel *)v2->_infoLabel setText:v36];
        }
        [(UILabel *)v2->_infoLabel setHidden:0];
        [(UILabel *)v2->_infoLabel sizeToFit];
      }
    }
    else
    {
      [(UILabel *)v2->_infoLabel setHidden:1];
      [(UILabel *)v2->_infoLabel setText:0];
    }
    v64 = [(PSTableCell *)v2 titleLabel];
    [v64 sizeToFit];

    return;
  }
  [(UILabel *)v2->_infoLabel setHidden:1];
  infoLabel = v2->_infoLabel;
  [(UILabel *)infoLabel setText:0];
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AXSettingsVoiceTableViewCell;
  [(PSTableCell *)&v4 refreshCellContentsWithSpecifier:a3];
  [(AXSettingsVoiceTableViewCell *)self layoutSubviews];
}

- (id)accessibilityCustomActions
{
  v3 = [(AXSettingsVoiceTableViewCell *)self resources];
  if ([v3 count] != 1
    || ![(SUUIItemOfferButton *)self->_sampleButton isEnabled])
  {
    v5 = 0;
LABEL_6:

    goto LABEL_7;
  }
  char v4 = [(SUUIItemOfferButton *)self->_sampleButton isHidden];

  if (v4)
  {
    v5 = 0;
    goto LABEL_7;
  }
  v5 = [MEMORY[0x1E4F1CA48] array];
  id v7 = objc_alloc(MEMORY[0x1E4FB13B8]);
  int v8 = AXUILocalizedStringForKey(@"PLAY_VOICE_SAMPLE");
  double v9 = (void *)[v7 initWithName:v8 target:self selector:sel__axPlaySample];
  [v5 addObject:v9];

  if ([(AXSettingsVoiceTableViewCell *)self showsPerVoiceSettingsButton])
  {
    v3 = [(AXSettingsVoiceTableViewCell *)self resources];
    double v10 = [v3 firstObject];
    if (![v10 isInstalled])
    {
LABEL_14:

      goto LABEL_6;
    }
    int v11 = [(AXSettingsVoiceTableViewCell *)self resources];
    v12 = [v11 firstObject];
    v13 = [v12 speechVoice];
    int v14 = [v13 synthesisProviderVoice];
    int v15 = [v14 hasPerVoiceSettings];

    if (v15)
    {
      id v16 = objc_alloc(MEMORY[0x1E4FB13B8]);
      v3 = AXUILocalizedStringForKey(@"OPEN_PER_VOICE_SETTINGS");
      double v10 = (void *)[v16 initWithName:v3 target:self selector:sel__axPerVoiceSettings];
      [v5 addObject:v10];
      goto LABEL_14;
    }
  }
LABEL_7:
  return v5;
}

- (BOOL)_axPerVoiceSettings
{
  v3 = [(AXSettingsVoiceTableViewCell *)self infoDelegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    v5 = [(AXSettingsVoiceTableViewCell *)self infoDelegate];
    id v6 = [(AXSettingsVoiceTableViewCell *)self resources];
    id v7 = [v6 firstObject];
    [v5 openVoiceSettingsFor:v7];
  }
  return 0;
}

- (BOOL)_axDownload
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (![(SUUIItemOfferButton *)self->_downloadButton isEnabled]) {
    return 0;
  }
  uint64_t v3 = [(SUUIItemOfferButton *)self->_downloadButton progressType];
  if (v3 != 2)
  {
    if (!v3)
    {
      char v4 = AXLogSpeechAssetDownload();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C39D1000, v4, OS_LOG_TYPE_DEFAULT, "No status, start downloading", buf, 2u);
      }

      BOOL v5 = 1;
      [(SUUIItemOfferButton *)self->_downloadButton setProgress:1 animated:0.0];
      [(SUUIItemOfferButton *)self->_downloadButton setProgressType:2 animated:1];
      id v6 = [(AXSettingsVoiceTableViewCell *)self infoDelegate];
      id v7 = [(AXSettingsVoiceTableViewCell *)self resources];
      int v8 = [v7 firstObject];
      [v6 startDownloadForResource:v8];

      LODWORD(v6) = *MEMORY[0x1E4FB2418];
      double v9 = NSString;
      double v10 = AXUILocalizedStringForKey(@"STARTED_DOWNLOAD");
      int v11 = [(PSTableCell *)self titleLabel];
      v12 = [v11 accessibilityLabel];
      v13 = objc_msgSend(v9, "stringWithFormat:", v10, v12);
      UIAccessibilityPostNotification((UIAccessibilityNotifications)v6, v13);

      AXPerformBlockOnMainThreadAfterDelay();
      return v5;
    }
    return 0;
  }
  int v15 = AXLogSpeechAssetDownload();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    id v16 = [(AXSettingsVoiceTableViewCell *)self resources];
    v17 = [v16 firstObject];
    *(_DWORD *)buf = 138543362;
    uint64_t v22 = v17;
    _os_log_impl(&dword_1C39D1000, v15, OS_LOG_TYPE_DEFAULT, "Asset downloading, stop it %{public}@", buf, 0xCu);
  }
  id v18 = [(AXSettingsVoiceTableViewCell *)self infoDelegate];
  uint64_t v19 = [(AXSettingsVoiceTableViewCell *)self resources];
  uint64_t v20 = [v19 firstObject];
  [v18 stopDownloadForResource:v20];

  [(SUUIItemOfferButton *)self->_downloadButton removeButtonStateAnimations];
  BOOL v5 = 1;
  [(SUUIItemOfferButton *)self->_downloadButton setProgressType:0 animated:1];
  [(AXSettingsVoiceTableViewCell *)self _axShowCloudImageFor:self->_downloadButton];
  [(SUUIItemOfferButton *)self->_downloadButton layoutSubviews];
  return v5;
}

void __43__AXSettingsVoiceTableViewCell__axDownload__block_invoke()
{
}

- (void)_axPlaySample
{
  if ([(SUUIItemOfferButton *)self->_sampleButton isEnabled])
  {
    uint64_t v3 = [(AXSettingsVoiceTableViewCell *)self infoDelegate];
    char v4 = [(AXSettingsVoiceTableViewCell *)self resources];
    BOOL v5 = [v4 firstObject];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __45__AXSettingsVoiceTableViewCell__axPlaySample__block_invoke;
    v6[3] = &unk_1E649BED8;
    v6[4] = self;
    [v3 playSampleForResource:v5 completion:v6];
  }
}

uint64_t __45__AXSettingsVoiceTableViewCell__axPlaySample__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 1200) removeButtonStateAnimations];
  [*(id *)(*(void *)(a1 + 32) + 1200) setProgressType:5 animated:1];
  v2 = *(void **)(*(void *)(a1 + 32) + 1200);
  return [v2 layoutSubviews];
}

- (id)colorFromHexString:(id)a3 alpha:(float)a4
{
  id v5 = a3;
  if ([v5 length])
  {
    id v6 = 0;
    if ([v5 characterAtIndex:0] == 35)
    {
      int v9 = 0;
      id v7 = [MEMORY[0x1E4F28FE8] scannerWithString:v5];
      [v7 setScanLocation:1];
      [v7 scanHexInt:&v9];
      id v6 = [MEMORY[0x1E4FB1618] colorWithRed:(double)BYTE2(v9) / 255.0 green:(double)BYTE1(v9) / 255.0 blue:(double)v9 / 255.0 alpha:a4];
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (void)layoutSubviews
{
  uint64_t v153 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(PSTableCell *)self specifier];
  [(AXSettingsVoiceTableViewCell *)self _updateInfoLabelText];
  char v4 = [v3 propertyForKey:@"IsSelected"];
  uint64_t v5 = [v4 BOOLValue];

  [(PSTableCell *)self setChecked:v5];
  v144.receiver = self;
  v144.super_class = (Class)AXSettingsVoiceTableViewCell;
  [(PSTableCell *)&v144 layoutSubviews];
  uint64_t v6 = [(AXSettingsVoiceTableViewCell *)self effectiveUserInterfaceLayoutDirection];
  id v7 = [(AXSettingsVoiceTableViewCell *)self resources];
  if ([v7 count] != 1) {
    goto LABEL_68;
  }
  int v8 = [(AXSettingsVoiceTableViewCell *)self infoDelegate];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0) {
    goto LABEL_69;
  }
  [(SUUIItemOfferButton *)self->_downloadButton setHidden:0];
  double v10 = [v3 propertyForKey:@"DownloadProgress"];
  [v10 doubleValue];
  double v12 = v11;

  v13 = AXLogSpeechAssetDownload();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = [(AXSettingsVoiceTableViewCell *)self resources];
    int v15 = [v14 objectAtIndexedSubscript:0];
    id v16 = [v3 properties];
    BOOL v17 = [(AXSettingsVoiceTableViewCell *)self showsPlayButton];
    *(_DWORD *)buf = 138412802;
    v148 = v15;
    __int16 v149 = 2112;
    v150 = v16;
    __int16 v151 = 1024;
    BOOL v152 = v17;
    _os_log_impl(&dword_1C39D1000, v13, OS_LOG_TYPE_DEFAULT, "Voice: %@: %@ (show play: %d)", buf, 0x1Cu);
  }
  id v18 = [(AXSettingsVoiceTableViewCell *)self resources];
  uint64_t v19 = [v18 firstObject];
  int v20 = [v19 isInstalled];

  if (v20)
  {
    if (v12 != 0.0) {
      goto LABEL_16;
    }
    v21 = [(AXSettingsVoiceTableViewCell *)self resources];
    uint64_t v22 = [v21 firstObject];
    uint64_t v23 = [v22 speechVoice];
    int v24 = [v23 canBeDownloaded];

    if (v24)
    {
      [(SUUIItemOfferButton *)self->_downloadButton setProgressType:1];
      [(UIButton *)self->_perVoiceSettingsButton setHidden:1];
    }
    else
    {
LABEL_16:
      char v31 = AXLogSpeechAssetDownload();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v148 = self;
        _os_log_impl(&dword_1C39D1000, v31, OS_LOG_TYPE_DEFAULT, "Hiding download button, voice does not show play button: %@", buf, 0xCu);
      }

      [(SUUIItemOfferButton *)self->_downloadButton setHidden:1];
    }
    goto LABEL_35;
  }
  if (v12 == 0.0)
  {
    uint64_t v25 = [(AXSettingsVoiceTableViewCell *)self resources];
    v26 = [v25 firstObject];
    char v27 = [v26 speechVoice];
    if ([v27 canBeDownloaded])
    {
      BOOL v28 = [(SUUIItemOfferButton *)self->_downloadButton progressType] == 2;

      if (!v28)
      {
        char v29 = AXLogSpeechAssetDownload();
        char v30 = v29;
        if (v5)
        {
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1C39D1000, v30, OS_LOG_TYPE_DEFAULT, "Hiding download button, swapping maui identifier in progress.", buf, 2u);
          }

          [(SUUIItemOfferButton *)self->_downloadButton setHidden:1];
        }
        else
        {
          if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1C39D1000, v30, OS_LOG_TYPE_INFO, "No progress, setting type back to none", buf, 2u);
          }

          [(SUUIItemOfferButton *)self->_downloadButton setProgress:0 animated:0.0];
          [(SUUIItemOfferButton *)self->_downloadButton setProgressType:0];
          [(AXSettingsVoiceTableViewCell *)self _axShowCloudImageFor:self->_downloadButton];
          uint64_t v39 = dispatch_get_global_queue(17, 0);
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __46__AXSettingsVoiceTableViewCell_layoutSubviews__block_invoke;
          block[3] = &unk_1E649BED8;
          block[4] = self;
          dispatch_async(v39, block);
        }
        goto LABEL_35;
      }
    }
    else
    {
    }
  }
  if (v12 >= 1.0) {
    goto LABEL_25;
  }
  v32 = [(AXSettingsVoiceTableViewCell *)self resources];
  v33 = [v32 firstObject];
  v34 = [v33 speechVoice];
  int v35 = [v34 canBeDownloaded];

  if (v35)
  {
    v36 = AXLogSpeechAssetDownload();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
    {
      v37 = [NSNumber numberWithDouble:v12];
      *(_DWORD *)buf = 138412290;
      v148 = v37;
      _os_log_impl(&dword_1C39D1000, v36, OS_LOG_TYPE_INFO, "Set download progress to: %@", buf, 0xCu);
    }
    [(SUUIItemOfferButton *)self->_downloadButton setProgress:1 animated:v12];
    [(SUUIItemOfferButton *)self->_downloadButton setProgressType:2];
  }
  else
  {
LABEL_25:
    if (v12 == 1.0)
    {
      if ([(SUUIItemOfferButton *)self->_downloadButton progressType] == 2)
      {
        v38 = AXLogSpeechAssetDownload();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1C39D1000, v38, OS_LOG_TYPE_INFO, "Progress done, completed download", buf, 2u);
        }
      }
      else if (![(SUUIItemOfferButton *)self->_downloadButton progressType])
      {
        [(SUUIItemOfferButton *)self->_downloadButton setProgressType:1];
      }
    }
  }
LABEL_35:
  v40 = [(AXSettingsVoiceTableViewCell *)self contentView];
  [v40 frame];
  double v42 = v41;

  if ([(AXSettingsVoiceTableViewCell *)self showsPlayButton])
  {
    [(SUUIItemOfferButton *)self->_sampleButton setHidden:0];
    [(SUUIItemOfferButton *)self->_sampleButton setProgressType:5];
    -[SUUIItemOfferButton layoutSizeThatFits:](self->_sampleButton, "layoutSizeThatFits:", 100.0, 100.0);
    double v44 = v43;
    double v46 = v45;
    sampleButton = self->_sampleButton;
    [(AXSettingsVoiceTableViewCell *)self frame];
    if (v6 == 1)
    {
      double v49 = v42 - v44 + -20.0;
      double v50 = v48 * 0.5 - v46 * 0.5;
    }
    else
    {
      double v50 = v48 * 0.5 - v46 * 0.5;
      double v49 = 20.0;
    }
    -[SUUIItemOfferButton setFrame:](sampleButton, "setFrame:", v49, v50, v44, v46);
    v51 = AXUILocalizedStringForKey(@"PLAY_VOICE_SAMPLE");
    [(SUUIItemOfferButton *)self->_sampleButton setAccessibilityLabel:v51];

    objc_initWeak((id *)buf, self);
    objc_initWeak(&location, self->_sampleButton);
    v52 = [MEMORY[0x1E4FAF278] sharedInstance];
    v53 = [(AXSettingsVoiceTableViewCell *)self resources];
    int v54 = [v53 firstObject];
    uint64_t v55 = [v54 voiceId];
    v139[0] = MEMORY[0x1E4F143A8];
    v139[1] = 3221225472;
    v139[2] = __46__AXSettingsVoiceTableViewCell_layoutSubviews__block_invoke_351;
    v139[3] = &unk_1E649C7D0;
    objc_copyWeak(&v140, (id *)buf);
    objc_copyWeak(&v141, &location);
    [v52 sampleURLForVoiceId:v55 completion:v139];

    objc_destroyWeak(&v141);
    objc_destroyWeak(&v140);
    objc_destroyWeak(&location);
    objc_destroyWeak((id *)buf);
  }
  if (![(AXSettingsVoiceTableViewCell *)self showsPerVoiceSettingsButton])
  {
LABEL_49:
    -[SUUIItemOfferButton layoutSizeThatFits:](self->_downloadButton, "layoutSizeThatFits:", 100.0, 100.0);
    double v72 = v75;
    double v74 = v76;
    if (v6 == 1) {
      goto LABEL_50;
    }
    goto LABEL_52;
  }
  v56 = [(AXSettingsVoiceTableViewCell *)self resources];
  v57 = [v56 firstObject];
  if (([v57 isInstalled] & 1) == 0)
  {

    goto LABEL_49;
  }
  v58 = [(AXSettingsVoiceTableViewCell *)self resources];
  int v59 = [v58 firstObject];
  uint64_t v60 = [v59 speechVoice];
  v61 = [v60 synthesisProviderVoice];
  int v62 = [v61 hasPerVoiceSettings];

  if (!v62) {
    goto LABEL_49;
  }
  [(UIButton *)self->_perVoiceSettingsButton setHidden:0];
  v63 = AXUILocalizedStringForKey(@"OPEN_PER_VOICE_SETTINGS");
  [(UIButton *)self->_perVoiceSettingsButton setAccessibilityLabel:v63];

  -[UIButton sizeThatFits:](self->_perVoiceSettingsButton, "sizeThatFits:", 100.0, 100.0);
  double v65 = v64;
  double v67 = v66;
  if ([(PSTableCell *)self isChecked]) {
    double v68 = 0.0;
  }
  else {
    double v68 = 20.0;
  }
  if (v6 == 1)
  {
    perVoiceSettingsButton = self->_perVoiceSettingsButton;
    [(AXSettingsVoiceTableViewCell *)self frame];
    -[UIButton setFrame:](perVoiceSettingsButton, "setFrame:", v68, v70 * 0.5 - v67 * 0.5, v65, v67);
    -[SUUIItemOfferButton layoutSizeThatFits:](self->_downloadButton, "layoutSizeThatFits:", 100.0, 100.0);
    double v72 = v71;
    double v74 = v73;
LABEL_50:
    downloadButton = self->_downloadButton;
    [(AXSettingsVoiceTableViewCell *)self frame];
    -[SUUIItemOfferButton setFrame:](downloadButton, "setFrame:", 20.0, v78 * 0.5 - v74 * 0.5, v72, v74);
    goto LABEL_53;
  }
  v79 = self->_perVoiceSettingsButton;
  [(AXSettingsVoiceTableViewCell *)self frame];
  -[UIButton setFrame:](v79, "setFrame:", v42 - v65 - v68, v80 * 0.5 - v67 * 0.5, v65, v67);
  -[SUUIItemOfferButton layoutSizeThatFits:](self->_downloadButton, "layoutSizeThatFits:", 100.0, 100.0);
  double v72 = v81;
  double v74 = v82;
LABEL_52:
  v83 = self->_downloadButton;
  [(AXSettingsVoiceTableViewCell *)self frame];
  -[SUUIItemOfferButton setFrame:](v83, "setFrame:", v42 - v72 + -20.0, v84 * 0.5 - v74 * 0.5, v72, v74);
LABEL_53:
  v85 = [(PSTableCell *)self titleLabel];
  [v85 frame];
  double v87 = v86;
  double v89 = v88;
  CGFloat v91 = v90;
  double v93 = v92;

  [(SUUIItemOfferButton *)self->_downloadButton frame];
  double v95 = v42 + -20.0 - v94;
  if (v6 == 1)
  {
    v154.origin.x = v87;
    v154.origin.y = v89;
    v154.size.width = v91;
    v154.size.height = v93;
    double v87 = v87 - (v95 - CGRectGetWidth(v154));
  }
  v96 = [(AXSettingsVoiceTableViewCell *)self siriImageView];
  BOOL v97 = v96 == 0;

  if (!v97)
  {
    v98 = [(AXSettingsVoiceTableViewCell *)self siriImageView];
    [v98 frame];
    double v100 = v99;

    double v101 = -(v100 + 20.0);
    if (v6 != 1) {
      double v101 = v100 + 20.0;
    }
    double v87 = v87 + v101;
    double v95 = v95 - (v100 + 20.0);
  }
  [(SUUIItemOfferButton *)self->_sampleButton frame];
  double v103 = v102 + 20.0;
  if (v6 == 1)
  {
    [(SUUIItemOfferButton *)self->_downloadButton frame];
    double v104 = CGRectGetMaxX(v155) + 20.0;
    if (v87 < v104) {
      double v87 = v104;
    }
    if ([(SUUIItemOfferButton *)self->_sampleButton isHidden]) {
      goto LABEL_67;
    }
    double v87 = v87 - v103;
    goto LABEL_66;
  }
  if (([(SUUIItemOfferButton *)self->_sampleButton isHidden] & 1) == 0)
  {
    double v87 = v87 + v103;
LABEL_66:
    double v95 = v95 - v103;
  }
LABEL_67:
  id v7 = [(PSTableCell *)self titleLabel];
  objc_msgSend(v7, "setFrame:", v87, v89, v95, v93);
LABEL_68:

LABEL_69:
  v105 = [(UILabel *)self->_infoLabel text];
  BOOL v106 = v105 == 0;

  if (!v106)
  {
    BOOL v107 = v6 == 1;
    v108 = [(PSTableCell *)self titleLabel];
    [v108 frame];
    double v110 = v109;
    double v112 = v111;
    double v114 = v113;

    v115 = [(AXSettingsVoiceTableViewCell *)self contentView];
    [v115 frame];
    double v117 = v116;

    v118 = [(PSTableCell *)self titleLabel];
    double v119 = v117 * 0.5 + v114 * -0.85;
    objc_msgSend(v118, "setFrame:", v110, v119, v112, v114);

    [(UILabel *)self->_infoLabel frame];
    double v121 = v120;
    [(SUUIItemOfferButton *)self->_downloadButton frame];
    if (v107)
    {
      double MaxX = CGRectGetMaxX(*(CGRect *)&v122);
      v156.origin.x = v110;
      v156.origin.y = v119;
      v156.size.width = v112;
      v156.size.height = v114;
      double v127 = CGRectGetMaxX(v156) - MaxX;
    }
    else
    {
      double v127 = v122 - v110;
      double MaxX = v110;
    }
    v157.origin.x = v110;
    v157.origin.y = v119;
    v157.size.width = v112;
    v157.size.height = v114;
    -[UILabel setFrame:](self->_infoLabel, "setFrame:", MaxX, CGRectGetMaxY(v157), v127, v121);
    v128 = [(PSTableCell *)self titleLabel];
    v129 = [v128 attributedText];
    v130 = [v129 attributesAtIndex:0 effectiveRange:0];
    uint64_t v131 = *MEMORY[0x1E4FB12D0];
    v132 = [v130 objectForKey:*MEMORY[0x1E4FB12D0]];

    [v132 firstLineHeadIndent];
    if (v133 > 0.0)
    {
      id v134 = objc_alloc(MEMORY[0x1E4F28B18]);
      p_infoLabel = &self->_infoLabel;
      v136 = [(UILabel *)self->_infoLabel text];
      uint64_t v145 = v131;
      v146 = v132;
      v137 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v146 forKeys:&v145 count:1];
      v138 = (void *)[v134 initWithString:v136 attributes:v137];
      [(UILabel *)*p_infoLabel setAttributedText:v138];

      [(UILabel *)*p_infoLabel _setOverallWritingDirectionFollowsLayoutDirection:1];
    }
  }
}

void __46__AXSettingsVoiceTableViewCell_layoutSubviews__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) infoDelegate];
  char v3 = [v2 allowedToDownload];

  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __46__AXSettingsVoiceTableViewCell_layoutSubviews__block_invoke_2;
  v4[3] = &unk_1E649C780;
  v4[4] = *(void *)(a1 + 32);
  char v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v4);
}

uint64_t __46__AXSettingsVoiceTableViewCell_layoutSubviews__block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1192) setEnabled:*(unsigned __int8 *)(a1 + 40)];
}

void __46__AXSettingsVoiceTableViewCell_layoutSubviews__block_invoke_351(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__AXSettingsVoiceTableViewCell_layoutSubviews__block_invoke_2_352;
  block[3] = &unk_1E649C7A8;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  id v6 = v3;
  id v4 = v3;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  dispatch_async(MEMORY[0x1E4F14428], block);
  objc_destroyWeak(&v8);

  objc_destroyWeak(&v7);
}

void __46__AXSettingsVoiceTableViewCell_layoutSubviews__block_invoke_2_352(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 5);
  v2 = [WeakRetained resources];
  id v3 = [v2 firstObject];
  if ([v3 isInstalled])
  {
  }
  else
  {
    id v4 = [MEMORY[0x1E4F28CB8] defaultManager];
    char v5 = [a1[4] path];
    char v6 = [v4 fileExistsAtPath:v5];

    if (v6) {
      return;
    }
    id WeakRetained = objc_loadWeakRetained(a1 + 6);
    [WeakRetained setEnabled:0];
  }
}

- (unint64_t)accessibilityTraits
{
  v16.receiver = self;
  v16.super_class = (Class)AXSettingsVoiceTableViewCell;
  unint64_t v3 = [(AXSettingsVoiceTableViewCell *)&v16 accessibilityTraits];
  id v4 = [(PSTableCell *)self specifier];
  char v5 = [v4 propertyForKey:@"IsSelected"];
  int v6 = [v5 BOOLValue];

  uint64_t v7 = *MEMORY[0x1E4FB2590];
  if (!v6) {
    uint64_t v7 = 0;
  }
  unint64_t v8 = v7 | v3;
  if (([(SUUIItemOfferButton *)self->_downloadButton isHidden] & 1) == 0)
  {
    int v9 = [(AXSettingsVoiceTableViewCell *)self resources];
    double v10 = [v9 firstObject];
    char v11 = [v10 isInstalled];

    if ((v11 & 1) == 0) {
      v8 |= [(SUUIItemOfferButton *)self->_downloadButton accessibilityTraits];
    }
  }
  int v12 = [(SUUIItemOfferButton *)self->_downloadButton isEnabled];
  uint64_t v13 = *MEMORY[0x1E4FB2578];
  if (v12) {
    uint64_t v13 = 0;
  }
  unint64_t v14 = v13 | v8;

  return v14;
}

- (void)itemOfferButtonDidAnimateTransition:(id)a3
{
}

- (id)accessibilityValue
{
  v7.receiver = self;
  v7.super_class = (Class)AXSettingsVoiceTableViewCell;
  unint64_t v3 = [(AXSettingsVoiceTableViewCell *)&v7 accessibilityValue];
  int v6 = [(SUUIItemOfferButton *)self->_downloadButton accessibilityValue];
  id v4 = __AXStringForVariables();

  return v4;
}

- (id)accessibilityLabel
{
  if (([(SUUIItemOfferButton *)self->_downloadButton isHidden] & 1) != 0
    || ([(AXSettingsVoiceTableViewCell *)self resources],
        unint64_t v3 = objc_claimAutoreleasedReturnValue(),
        [v3 firstObject],
        id v4 = objc_claimAutoreleasedReturnValue(),
        char v5 = [v4 isInstalled],
        v4,
        v3,
        (v5 & 1) != 0))
  {
    int v6 = [(PSTableCell *)self titleLabel];
    objc_super v7 = [v6 accessibilityLabel];
    unint64_t v8 = [(UILabel *)self->_infoLabel accessibilityLabel];
    int v9 = __AXStringForVariables();
  }
  else
  {
    double v10 = NSString;
    if ([(SUUIItemOfferButton *)self->_downloadButton progressType]) {
      char v11 = @"STOP_DOWNLOAD_NAME";
    }
    else {
      char v11 = @"DOWNLOAD_NAME";
    }
    int v6 = AXUILocalizedStringForKey(v11);
    objc_super v7 = [(PSTableCell *)self titleLabel];
    unint64_t v8 = [v7 accessibilityLabel];
    int v12 = objc_msgSend(v10, "localizedStringWithFormat:", v6, v8);
    unint64_t v14 = [(UILabel *)self->_infoLabel accessibilityLabel];
    int v9 = __AXStringForVariables();
  }
  return v9;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (BOOL)accessibilityActivate
{
  int v3 = [(SUUIItemOfferButton *)self->_downloadButton isEnabled];
  if (v3)
  {
    if (([(SUUIItemOfferButton *)self->_downloadButton isHidden] & 1) != 0
      || ([(AXSettingsVoiceTableViewCell *)self resources],
          id v4 = objc_claimAutoreleasedReturnValue(),
          [v4 firstObject],
          char v5 = objc_claimAutoreleasedReturnValue(),
          char v6 = [v5 isInstalled],
          v5,
          v4,
          (v6 & 1) != 0))
    {
      LOBYTE(v3) = 0;
    }
    else
    {
      [(SUUIItemOfferButton *)self->_downloadButton sendActionsForControlEvents:64];
      LOBYTE(v3) = 1;
    }
  }
  return v3;
}

- (void)_axShowCloudImageFor:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4FB1818];
  id v5 = a3;
  id v8 = [v4 systemImageNamed:@"icloud.and.arrow.down"];
  char v6 = [(AXSettingsVoiceTableViewCell *)self tintColor];
  objc_super v7 = [v8 imageWithTintColor:v6];
  [v5 setImage:v7];
}

- (BOOL)showsInfoLabel
{
  return self->_showsInfoLabel;
}

- (void)setShowsInfoLabel:(BOOL)a3
{
  self->_showsInfoLabel = a3;
}

- (BOOL)showsUsageInfo
{
  return self->_showsUsageInfo;
}

- (void)setShowsUsageInfo:(BOOL)a3
{
  self->_showsUsageInfo = a3;
}

- (BOOL)showsPlayButton
{
  return self->_showsPlayButton;
}

- (void)setShowsPlayButton:(BOOL)a3
{
  self->_showsPlayButton = a3;
}

- (BOOL)indentsForVoiceGraphic
{
  return self->_indentsForVoiceGraphic;
}

- (void)setIndentsForVoiceGraphic:(BOOL)a3
{
  self->_indentsForVoiceGraphic = a3;
}

- (BOOL)showsPerVoiceSettingsButton
{
  return self->_showsPerVoiceSettingsButton;
}

- (void)setShowsPerVoiceSettingsButton:(BOOL)a3
{
  self->_showsPerVoiceSettingsButton = a3;
}

- (AXResourceDownloadInformationDelegate)infoDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_infoDelegate);
  return (AXResourceDownloadInformationDelegate *)WeakRetained;
}

- (void)setInfoDelegate:(id)a3
{
}

- (UIImageView)siriImageView
{
  return self->_siriImageView;
}

- (void)setSiriImageView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_siriImageView, 0);
  objc_destroyWeak((id *)&self->_infoDelegate);
  objc_storeStrong((id *)&self->_infoLabel, 0);
  objc_storeStrong((id *)&self->_perVoiceSettingsButton, 0);
  objc_storeStrong((id *)&self->_sampleButton, 0);
  objc_storeStrong((id *)&self->_downloadButton, 0);
}

@end