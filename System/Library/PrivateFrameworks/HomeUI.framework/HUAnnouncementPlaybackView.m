@interface HUAnnouncementPlaybackView
- (BOOL)_isProductTypeHomePod;
- (BOOL)fullyPlayed;
- (BOOL)isSiriEndpointAccessory;
- (CNAvatarView)avatarView;
- (HFAudioPlayer)audioPlayer;
- (HUAnnouncementPlaybackView)initWithFrame:(CGRect)a3;
- (HUIconView)iconView;
- (NSDictionary)announcementInfo;
- (NSLayoutConstraint)centerXConstraint;
- (NSLayoutConstraint)centerYConstraint;
- (NSLayoutConstraint)heightConstraint;
- (NSLayoutConstraint)widthConstraint;
- (NSMutableArray)audioWaveLayers;
- (NSURL)announcementURL;
- (UIImageView)genericAvatarView;
- (double)playbackFractionComplete;
- (id)_imageOrViewForServiceType:(id)a3;
- (id)_requiredKeyDescriptors;
- (id)description;
- (int)productType;
- (unint64_t)currentWaveLayerIndex;
- (void)_animateLayerWaveAtIndex:(unint64_t)a3 forAveragePower:(double)a4;
- (void)_configureAnnounceSender:(id)a3;
- (void)_generateRippleForAveragePower:(double)a3;
- (void)_setupAudioWaveLayers;
- (void)_updateIconViewForServiceType:(id)a3;
- (void)didUpdateAveragePower:(double)a3;
- (void)playbackStopped;
- (void)resumePlaybackAnimation;
- (void)setAnnouncementInfo:(id)a3;
- (void)setAnnouncementURL:(id)a3;
- (void)setAudioPlayer:(id)a3;
- (void)setAudioWaveLayers:(id)a3;
- (void)setAvatarView:(id)a3;
- (void)setCenterXConstraint:(id)a3;
- (void)setCenterYConstraint:(id)a3;
- (void)setCurrentWaveLayerIndex:(unint64_t)a3;
- (void)setFullyPlayed:(BOOL)a3;
- (void)setGenericAvatarView:(id)a3;
- (void)setHeightConstraint:(id)a3;
- (void)setIconView:(id)a3;
- (void)setIsSiriEndpointAccessory:(BOOL)a3;
- (void)setPlaybackFractionComplete:(double)a3;
- (void)setProductType:(int)a3;
- (void)setWidthConstraint:(id)a3;
- (void)updateConstraints;
@end

@implementation HUAnnouncementPlaybackView

- (HUAnnouncementPlaybackView)initWithFrame:(CGRect)a3
{
  v15.receiver = self;
  v15.super_class = (Class)HUAnnouncementPlaybackView;
  v3 = -[HUAnnouncementPlaybackView initWithFrame:](&v15, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_currentWaveLayerIndex = 0;
    v3->_playbackFractionComplete = 0.0;
    uint64_t v5 = objc_opt_new();
    audioWaveLayers = v4->_audioWaveLayers;
    v4->_audioWaveLayers = (NSMutableArray *)v5;

    v7 = (CNAvatarView *)objc_alloc_init(MEMORY[0x1E4F1BB38]);
    avatarView = v4->_avatarView;
    v4->_avatarView = v7;

    [(CNAvatarView *)v4->_avatarView setUserInteractionEnabled:0];
    [(CNAvatarView *)v4->_avatarView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(CNAvatarView *)v4->_avatarView setAlpha:0.0];
    [(HUAnnouncementPlaybackView *)v4 addSubview:v4->_avatarView];
    v9 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4F42AA0]);
    genericAvatarView = v4->_genericAvatarView;
    v4->_genericAvatarView = v9;

    [(UIImageView *)v4->_genericAvatarView setUserInteractionEnabled:0];
    [(UIImageView *)v4->_genericAvatarView setContentMode:1];
    [(UIImageView *)v4->_genericAvatarView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(HUAnnouncementPlaybackView *)v4 addSubview:v4->_genericAvatarView];
    id v11 = objc_alloc(MEMORY[0x1E4F6A428]);
    uint64_t v12 = objc_msgSend(v11, "initWithFrame:contentMode:", 1, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    iconView = v4->_iconView;
    v4->_iconView = (HUIconView *)v12;

    [(HUIconView *)v4->_iconView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(HUIconView *)v4->_iconView setAlpha:0.0];
    [(HUAnnouncementPlaybackView *)v4 addSubview:v4->_iconView];
    [(HUAnnouncementPlaybackView *)v4 setNeedsUpdateConstraints];
  }
  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = [(HUAnnouncementPlaybackView *)self announcementInfo];
  uint64_t v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F4A4E8]];
  v6 = [(HUAnnouncementPlaybackView *)self announcementInfo];
  v7 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F4A788]];
  BOOL v8 = [(HUAnnouncementPlaybackView *)self fullyPlayed];
  v9 = [(HUAnnouncementPlaybackView *)self audioPlayer];
  v10 = [v3 stringWithFormat:@"ID [%@], index [%@] - isFullyPlayed [%d] - isPlaying [%d]", v5, v7, v8, objc_msgSend(v9, "isPlaying")];

  return v10;
}

- (void)updateConstraints
{
  v58.receiver = self;
  v58.super_class = (Class)HUAnnouncementPlaybackView;
  [(HUAnnouncementPlaybackView *)&v58 updateConstraints];
  v3 = objc_opt_new();
  v4 = [(HUAnnouncementPlaybackView *)self avatarView];
  uint64_t v5 = [v4 centerXAnchor];
  v6 = [(HUAnnouncementPlaybackView *)self centerXAnchor];
  v7 = [v5 constraintEqualToAnchor:v6];
  [v3 addObject:v7];

  BOOL v8 = [(HUAnnouncementPlaybackView *)self avatarView];
  v9 = [v8 centerYAnchor];
  v10 = [(HUAnnouncementPlaybackView *)self centerYAnchor];
  id v11 = [v9 constraintEqualToAnchor:v10];
  [v3 addObject:v11];

  uint64_t v12 = [(HUAnnouncementPlaybackView *)self avatarView];
  v13 = [v12 heightAnchor];
  v14 = [(HUAnnouncementPlaybackView *)self heightAnchor];
  objc_super v15 = [v13 constraintEqualToAnchor:v14];
  [v3 addObject:v15];

  v16 = [(HUAnnouncementPlaybackView *)self avatarView];
  v17 = [v16 widthAnchor];
  v18 = [(HUAnnouncementPlaybackView *)self avatarView];
  v19 = [v18 heightAnchor];
  v20 = [v17 constraintEqualToAnchor:v19];
  [v3 addObject:v20];

  v21 = [(HUAnnouncementPlaybackView *)self genericAvatarView];
  v22 = [v21 centerXAnchor];
  v23 = [(HUAnnouncementPlaybackView *)self centerXAnchor];
  v24 = [v22 constraintEqualToAnchor:v23];
  [v3 addObject:v24];

  v25 = [(HUAnnouncementPlaybackView *)self genericAvatarView];
  v26 = [v25 centerYAnchor];
  v27 = [(HUAnnouncementPlaybackView *)self centerYAnchor];
  v28 = [v26 constraintEqualToAnchor:v27];
  [v3 addObject:v28];

  v29 = [(HUAnnouncementPlaybackView *)self genericAvatarView];
  v30 = [v29 widthAnchor];
  v31 = [(HUAnnouncementPlaybackView *)self heightAnchor];
  v32 = [v30 constraintEqualToAnchor:v31];
  [v3 addObject:v32];

  v33 = [(HUAnnouncementPlaybackView *)self genericAvatarView];
  v34 = [v33 heightAnchor];
  v35 = [(HUAnnouncementPlaybackView *)self genericAvatarView];
  v36 = [v35 widthAnchor];
  v37 = [v34 constraintEqualToAnchor:v36];
  [v3 addObject:v37];

  v38 = [(HUAnnouncementPlaybackView *)self iconView];
  v39 = [v38 centerXAnchor];
  v40 = [(HUAnnouncementPlaybackView *)self centerXAnchor];
  v41 = [v39 constraintEqualToAnchor:v40];
  [v3 addObject:v41];

  v42 = [(HUAnnouncementPlaybackView *)self iconView];
  v43 = [v42 centerYAnchor];
  v44 = [(HUAnnouncementPlaybackView *)self centerYAnchor];
  v45 = [v43 constraintEqualToAnchor:v44];
  [v3 addObject:v45];

  v46 = [(HUAnnouncementPlaybackView *)self iconView];
  v47 = [v46 widthAnchor];
  v48 = [(HUAnnouncementPlaybackView *)self heightAnchor];
  v49 = [v47 constraintEqualToAnchor:v48];
  [v3 addObject:v49];

  v50 = [(HUAnnouncementPlaybackView *)self iconView];
  v51 = [v50 heightAnchor];
  v52 = [(HUAnnouncementPlaybackView *)self iconView];
  v53 = [v52 widthAnchor];
  v54 = [v51 constraintEqualToAnchor:v53];
  [v3 addObject:v54];

  CGAffineTransformMakeScale(&v57, 0.75, 0.75);
  v55 = [(HUAnnouncementPlaybackView *)self iconView];
  CGAffineTransform v56 = v57;
  [v55 setTransform:&v56];

  [MEMORY[0x1E4F28DC8] activateConstraints:v3];
}

- (void)_configureAnnounceSender:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [(HUAnnouncementPlaybackView *)self avatarView];
    [v5 setAlpha:1.0];

    v6 = [(HUAnnouncementPlaybackView *)self genericAvatarView];
    [v6 setAlpha:0.0];

    v7 = [(HUAnnouncementPlaybackView *)self iconView];
    [v7 setAlpha:0.0];

    BOOL v8 = [(HUAnnouncementPlaybackView *)self avatarView];
    [v8 setContact:v4];
  }
  else
  {
    if ([(HUAnnouncementPlaybackView *)self isSiriEndpointAccessory])
    {
      v9 = HFLogForCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v30) = 0;
        _os_log_impl(&dword_1BE345000, v9, OS_LOG_TYPE_DEFAULT, "Now Configuring AvatarView for SiriEndpointAccessory", (uint8_t *)&v30, 2u);
      }

      v10 = [(HUAnnouncementPlaybackView *)self avatarView];
      [v10 setAlpha:0.0];

      id v11 = [(HUAnnouncementPlaybackView *)self iconView];
      [v11 setAlpha:0.0];

      uint64_t v12 = [(HUAnnouncementPlaybackView *)self genericAvatarView];
      [v12 setAlpha:1.0];

      v13 = [(HUAnnouncementPlaybackView *)self announcementInfo];
      BOOL v8 = [v13 objectForKeyedSubscript:*MEMORY[0x1E4F4A808]];

      v14 = [(HUAnnouncementPlaybackView *)self _imageOrViewForServiceType:v8];
      objc_super v15 = HFLogForCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        int v30 = 138412546;
        v31 = v8;
        __int16 v32 = 2112;
        v33 = v14;
        _os_log_impl(&dword_1BE345000, v15, OS_LOG_TYPE_DEFAULT, "imageOrViewForServiceType [%@] = [%@]", (uint8_t *)&v30, 0x16u);
      }

      objc_opt_class();
      id v16 = v14;
      if (objc_opt_isKindOfClass()) {
        v17 = v16;
      }
      else {
        v17 = 0;
      }
      id v18 = v17;

      objc_opt_class();
      id v19 = v16;
      if (objc_opt_isKindOfClass()) {
        v20 = v19;
      }
      else {
        v20 = 0;
      }
      id v21 = v20;

      if (v21)
      {
        uint64_t v22 = objc_msgSend(MEMORY[0x1E4F42A80], "hu_circleImageWithDiameter:", 120.0);

        [(HUAnnouncementPlaybackView *)self _updateIconViewForServiceType:v8];
        v23 = [(HUAnnouncementPlaybackView *)self iconView];
        [v23 setAlpha:1.0];

        id v18 = (id)v22;
      }
      v24 = [(HUAnnouncementPlaybackView *)self genericAvatarView];
      [v24 setImage:v18];
    }
    else
    {
      v25 = [(HUAnnouncementPlaybackView *)self avatarView];
      [v25 setAlpha:0.0];

      v26 = [(HUAnnouncementPlaybackView *)self iconView];
      [v26 setAlpha:0.0];

      v27 = [(HUAnnouncementPlaybackView *)self genericAvatarView];
      [v27 setAlpha:1.0];

      BOOL v8 = objc_msgSend(MEMORY[0x1E4F42A80], "hu_avatarImageWithSymbolNamed:textStyle:scale:diameter:", @"person.circle", *MEMORY[0x1E4F438B8], 3, 120.0);
      if ([(HUAnnouncementPlaybackView *)self _isProductTypeHomePod])
      {
        if ([(HUAnnouncementPlaybackView *)self productType] == 3348380076) {
          v28 = @"Intercom-HomePod-Mini-Light";
        }
        else {
          v28 = @"Intercom-HomePod-Original-Light";
        }
        uint64_t v29 = HUImageNamed(v28);

        BOOL v8 = (void *)v29;
      }
      id v19 = [(HUAnnouncementPlaybackView *)self genericAvatarView];
      [v19 setImage:v8];
    }
  }
  [(HUAnnouncementPlaybackView *)self setNeedsLayout];
}

- (void)setAnnouncementInfo:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  objc_storeStrong((id *)&self->_announcementInfo, a3);
  v6 = (void *)MEMORY[0x1E4F1CB10];
  v7 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F4A568]];
  BOOL v8 = [v6 fileURLWithPath:v7];

  [(HUAnnouncementPlaybackView *)self setAnnouncementURL:v8];
  v9 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F4A558]];
  v10 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
  id v11 = [v9 stringByTrimmingCharactersInSet:v10];

  if (v11) {
    char v12 = [v11 isEqualToString:&stru_1F18F92B8] ^ 1;
  }
  else {
    char v12 = 0;
  }
  v13 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F4A7E8]];
  -[HUAnnouncementPlaybackView setIsSiriEndpointAccessory:](self, "setIsSiriEndpointAccessory:", [v13 integerValue] == 1);

  v14 = HFLogForCategory();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v22[0] = 67109120;
    v22[1] = [(HUAnnouncementPlaybackView *)self isSiriEndpointAccessory];
    _os_log_impl(&dword_1BE345000, v14, OS_LOG_TYPE_DEFAULT, "isSiriEndpointAccessory = %{BOOL}d", (uint8_t *)v22, 8u);
  }

  objc_super v15 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F4A7D0]];
  uint64_t v16 = [v15 integerValue];

  if (v12)
  {
    if (objc_msgSend(v11, "hf_isEmail"))
    {
      v17 = [MEMORY[0x1E4F69090] defaultStore];
      id v18 = [(HUAnnouncementPlaybackView *)self _requiredKeyDescriptors];
      uint64_t v19 = [v17 contactForEmailAddress:v11 withKeys:v18];
    }
    else
    {
      if (!objc_msgSend(v11, "hf_isPhoneNumber"))
      {
        id v21 = 0;
        goto LABEL_21;
      }
      v17 = [MEMORY[0x1E4F69090] defaultStore];
      id v18 = [(HUAnnouncementPlaybackView *)self _requiredKeyDescriptors];
      uint64_t v19 = [v17 contactForPhoneNumber:v11 withKeys:v18];
    }
    id v21 = (void *)v19;

LABEL_21:
    [(HUAnnouncementPlaybackView *)self _configureAnnounceSender:v21];

    goto LABEL_22;
  }
  if (v16 <= 3348380075)
  {
    if (v16 != 1540760353)
    {
      uint64_t v20 = 2702125347;
      goto LABEL_17;
    }
LABEL_18:
    [(HUAnnouncementPlaybackView *)self setProductType:v16];
    goto LABEL_19;
  }
  if (v16 == 4240173202) {
    goto LABEL_18;
  }
  uint64_t v20 = 3348380076;
LABEL_17:
  if (v16 == v20) {
    goto LABEL_18;
  }
LABEL_19:
  [(HUAnnouncementPlaybackView *)self _configureAnnounceSender:0];
LABEL_22:
}

- (void)didUpdateAveragePower:(double)a3
{
  id v5 = [(HUAnnouncementPlaybackView *)self audioWaveLayers];
  uint64_t v6 = [v5 count];

  if (!v6)
  {
    [(HUAnnouncementPlaybackView *)self _setupAudioWaveLayers];
    [(HUAnnouncementPlaybackView *)self _generateRippleForAveragePower:a3];
  }
}

- (void)playbackStopped
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v3 = [(HUAnnouncementPlaybackView *)self audioWaveLayers];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        BOOL v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        [v8 removeAllAnimations];
        id v9 = [MEMORY[0x1E4F428B8] clearColor];
        objc_msgSend(v8, "setStrokeColor:", objc_msgSend(v9, "CGColor"));
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }

  v10 = [(HUAnnouncementPlaybackView *)self audioWaveLayers];
  [v10 makeObjectsPerformSelector:sel_removeFromSuperlayer];

  id v11 = [(HUAnnouncementPlaybackView *)self audioWaveLayers];
  [v11 removeAllObjects];
}

- (void)resumePlaybackAnimation
{
  [(HUAnnouncementPlaybackView *)self _setupAudioWaveLayers];

  [(HUAnnouncementPlaybackView *)self _generateRippleForAveragePower:0.5];
}

- (BOOL)_isProductTypeHomePod
{
  return [(HUAnnouncementPlaybackView *)self productType] == 4240173202
      || [(HUAnnouncementPlaybackView *)self productType] == 2702125347
      || [(HUAnnouncementPlaybackView *)self productType] == 3348380076
      || [(HUAnnouncementPlaybackView *)self productType] == 1540760353;
}

- (id)_requiredKeyDescriptors
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F1BB38] descriptorForRequiredKeysWithThreeDTouchEnabled:1];
  v6[0] = v2;
  v3 = [MEMORY[0x1E4F1B910] descriptorForRequiredKeysForStyle:0];
  v6[1] = v3;
  uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];

  return v4;
}

- (void)_setupAudioWaveLayers
{
  uint64_t v17 = self;
  double v2 = *MEMORY[0x1E4F1DAD8];
  double v3 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  uint64_t v4 = *MEMORY[0x1E4F3A458];
  uint64_t v5 = 3;
  do
  {
    uint64_t v6 = objc_opt_new();
    v7 = (void *)MEMORY[0x1E4F427D0];
    [(HUAnnouncementPlaybackView *)v17 bounds];
    objc_msgSend(v7, "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, v2, v3, v8 * 0.5, 0.0, 6.28318531);
    id v9 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setPath:", objc_msgSend(v9, "CGPath"));
    [v6 setLineWidth:2.0];
    id v10 = [MEMORY[0x1E4F428B8] clearColor];
    objc_msgSend(v6, "setStrokeColor:", objc_msgSend(v10, "CGColor"));

    id v11 = [MEMORY[0x1E4F428B8] clearColor];
    objc_msgSend(v6, "setFillColor:", objc_msgSend(v11, "CGColor"));

    [v6 setLineCap:v4];
    [(HUAnnouncementPlaybackView *)v17 frame];
    double v13 = v12 * 0.5;
    [(HUAnnouncementPlaybackView *)v17 frame];
    objc_msgSend(v6, "setPosition:", v13, v14 * 0.5);
    long long v15 = [(HUAnnouncementPlaybackView *)v17 layer];
    [v15 addSublayer:v6];

    uint64_t v16 = [(HUAnnouncementPlaybackView *)v17 audioWaveLayers];
    [v16 addObject:v6];

    --v5;
  }
  while (v5);
}

- (void)_generateRippleForAveragePower:(double)a3
{
  -[HUAnnouncementPlaybackView _animateLayerWaveAtIndex:forAveragePower:](self, "_animateLayerWaveAtIndex:forAveragePower:", 0);
  dispatch_time_t v5 = dispatch_time(0xFFFFFFFFFFFFFFFELL, 400000000);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __61__HUAnnouncementPlaybackView__generateRippleForAveragePower___block_invoke;
  void v6[3] = &unk_1E6385738;
  v6[4] = self;
  *(double *)&v6[5] = a3;
  dispatch_after(v5, MEMORY[0x1E4F14428], v6);
}

void __61__HUAnnouncementPlaybackView__generateRippleForAveragePower___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _animateLayerWaveAtIndex:1 forAveragePower:*(double *)(a1 + 40)];
  dispatch_time_t v2 = dispatch_time(0xFFFFFFFFFFFFFFFELL, 600000000);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __61__HUAnnouncementPlaybackView__generateRippleForAveragePower___block_invoke_2;
  v3[3] = &unk_1E6385738;
  v3[4] = *(void *)(a1 + 32);
  v3[5] = *(void *)(a1 + 40);
  dispatch_after(v2, MEMORY[0x1E4F14428], v3);
}

uint64_t __61__HUAnnouncementPlaybackView__generateRippleForAveragePower___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _animateLayerWaveAtIndex:2 forAveragePower:*(double *)(a1 + 40)];
}

- (void)_animateLayerWaveAtIndex:(unint64_t)a3 forAveragePower:(double)a4
{
  v21[3] = *MEMORY[0x1E4F143B8];
  uint64_t v6 = [(HUAnnouncementPlaybackView *)self audioWaveLayers];
  unint64_t v7 = [v6 count];

  if (v7 > a3)
  {
    double v8 = [(HUAnnouncementPlaybackView *)self audioWaveLayers];
    id v9 = [v8 objectAtIndexedSubscript:a3];

    [v9 removeAllAnimations];
    id v10 = [(HUAnnouncementPlaybackView *)self traitCollection];
    if ([v10 userInterfaceStyle] == 2) {
      [MEMORY[0x1E4F428B8] lightGrayColor];
    }
    else {
    id v11 = [MEMORY[0x1E4F428B8] systemWhiteColor];
    }
    objc_msgSend(v9, "setStrokeColor:", objc_msgSend(v11, "CGColor"));

    double v12 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"transform.scale"];
    [v12 setDuration:1.0];
    [v12 setFromValue:&unk_1F19B6060];
    [v12 setToValue:&unk_1F19B6070];
    [v12 setRepeatCount:3.53369517e72];
    uint64_t v13 = *MEMORY[0x1E4F3A498];
    double v14 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A498]];
    [v12 setTimingFunction:v14];

    [v9 addAnimation:v12 forKey:@"scale"];
    long long v15 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"opacity"];
    [v15 setDuration:1.0];
    [v15 setValues:&unk_1F19B55E8];
    [v15 setKeyTimes:&unk_1F19B5600];
    [v15 setRepeatCount:3.53369517e72];
    uint64_t v16 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A488]];
    [v15 setTimingFunction:v16];

    [v9 addAnimation:v15 forKey:@"opacity"];
    uint64_t v17 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"lineWidth"];
    [v17 setDuration:1.0];
    [v17 setValues:&unk_1F19B5618];
    [v17 setKeyTimes:&unk_1F19B5630];
    id v18 = [MEMORY[0x1E4F39C10] functionWithName:v13];
    [v17 setTimingFunction:v18];

    [v17 setRepeatCount:3.53369517e72];
    uint64_t v19 = [MEMORY[0x1E4F39B38] animation];
    v21[0] = v12;
    v21[1] = v15;
    v21[2] = v17;
    uint64_t v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:3];
    [v19 setAnimations:v20];

    [v9 addAnimation:v19 forKey:@"groupAnimation"];
  }
}

- (id)_imageOrViewForServiceType:(id)a3
{
  id v4 = a3;
  objc_msgSend(MEMORY[0x1E4F42A80], "hu_avatarImageWithSymbolNamed:textStyle:scale:diameter:", @"hifispeaker.fill", *MEMORY[0x1E4F438B8], 3, 120.0);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    uint64_t v6 = [MEMORY[0x1E4F69548] defaultIconDescriptorForServiceType:v4 serviceSubtype:*MEMORY[0x1E4F2DDA0]];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = [v6 imageIdentifierForSize:*MEMORY[0x1E4F68670]];
      uint64_t v8 = HUImageNamed(v7);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        double v12 = [(HUAnnouncementPlaybackView *)self iconView];

        goto LABEL_15;
      }
      id v7 = v6;
      if ([v7 isSystemImage])
      {
        id v9 = [v7 imageSymbolConfiguration];
        id v10 = v9;
        if (v9)
        {
          id v11 = v9;
        }
        else
        {
          id v11 = [MEMORY[0x1E4F42A98] configurationWithPointSize:6 weight:36.0];
        }
        uint64_t v13 = v11;

        double v14 = (void *)MEMORY[0x1E4F42A80];
        uint64_t v15 = [v7 imageIdentifier];
        uint64_t v8 = [v14 systemImageNamed:v15 withConfiguration:v13];

        id v5 = (id)v15;
      }
      else
      {
        uint64_t v13 = [v7 imageIdentifier];
        uint64_t v8 = HUImageNamed(v13);
      }

      id v5 = v13;
    }

    id v5 = (id)v8;
  }
  id v5 = v5;
  double v12 = v5;
LABEL_15:

  return v12;
}

- (void)_updateIconViewForServiceType:(id)a3
{
  id v10 = [MEMORY[0x1E4F69548] defaultIconDescriptorForServiceType:a3 serviceSubtype:*MEMORY[0x1E4F2DDA0]];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = (objc_class *)MEMORY[0x1E4F68F38];
    id v5 = v10;
    id v6 = [v4 alloc];
    id v7 = [v5 packageIdentifier];

    uint64_t v8 = (void *)[v6 initWithPackageIdentifier:v7 state:*MEMORY[0x1E4F68360]];
    id v9 = [(HUAnnouncementPlaybackView *)self iconView];
    [v9 updateWithIconDescriptor:v8 displayStyle:1 animated:1];
  }
  else
  {
    uint64_t v8 = [(HUAnnouncementPlaybackView *)self iconView];
    [v8 updateWithIconDescriptor:v10 displayStyle:1 animated:1];
  }
}

- (NSDictionary)announcementInfo
{
  return self->_announcementInfo;
}

- (NSLayoutConstraint)heightConstraint
{
  return self->_heightConstraint;
}

- (void)setHeightConstraint:(id)a3
{
}

- (NSLayoutConstraint)widthConstraint
{
  return self->_widthConstraint;
}

- (void)setWidthConstraint:(id)a3
{
}

- (NSLayoutConstraint)centerXConstraint
{
  return self->_centerXConstraint;
}

- (void)setCenterXConstraint:(id)a3
{
}

- (NSLayoutConstraint)centerYConstraint
{
  return self->_centerYConstraint;
}

- (void)setCenterYConstraint:(id)a3
{
}

- (BOOL)fullyPlayed
{
  return self->_fullyPlayed;
}

- (void)setFullyPlayed:(BOOL)a3
{
  self->_fullyPlayed = a3;
}

- (CNAvatarView)avatarView
{
  return self->_avatarView;
}

- (void)setAvatarView:(id)a3
{
}

- (UIImageView)genericAvatarView
{
  return self->_genericAvatarView;
}

- (void)setGenericAvatarView:(id)a3
{
}

- (HUIconView)iconView
{
  return self->_iconView;
}

- (void)setIconView:(id)a3
{
}

- (double)playbackFractionComplete
{
  return self->_playbackFractionComplete;
}

- (void)setPlaybackFractionComplete:(double)a3
{
  self->_playbackFractionComplete = a3;
}

- (NSURL)announcementURL
{
  return self->_announcementURL;
}

- (void)setAnnouncementURL:(id)a3
{
}

- (int)productType
{
  return *(void *)&self->_productType;
}

- (void)setProductType:(int)a3
{
  *(void *)&self->_productType = *(void *)&a3;
}

- (HFAudioPlayer)audioPlayer
{
  return self->_audioPlayer;
}

- (void)setAudioPlayer:(id)a3
{
}

- (NSMutableArray)audioWaveLayers
{
  return self->_audioWaveLayers;
}

- (void)setAudioWaveLayers:(id)a3
{
}

- (unint64_t)currentWaveLayerIndex
{
  return self->_currentWaveLayerIndex;
}

- (void)setCurrentWaveLayerIndex:(unint64_t)a3
{
  self->_currentWaveLayerIndex = a3;
}

- (BOOL)isSiriEndpointAccessory
{
  return self->_isSiriEndpointAccessory;
}

- (void)setIsSiriEndpointAccessory:(BOOL)a3
{
  self->_isSiriEndpointAccessory = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioWaveLayers, 0);
  objc_storeStrong((id *)&self->_audioPlayer, 0);
  objc_storeStrong((id *)&self->_announcementURL, 0);
  objc_storeStrong((id *)&self->_iconView, 0);
  objc_storeStrong((id *)&self->_genericAvatarView, 0);
  objc_storeStrong((id *)&self->_avatarView, 0);
  objc_storeStrong((id *)&self->_centerYConstraint, 0);
  objc_storeStrong((id *)&self->_centerXConstraint, 0);
  objc_storeStrong((id *)&self->_widthConstraint, 0);
  objc_storeStrong((id *)&self->_heightConstraint, 0);

  objc_storeStrong((id *)&self->_announcementInfo, 0);
}

@end