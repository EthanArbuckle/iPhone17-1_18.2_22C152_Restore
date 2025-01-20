@interface MPAVRoutingTableViewCell
- (BOOL)_shouldShowSeparateBatteryPercentagesForBatteryLevel:(id)a3;
- (BOOL)isDisplayedAsPicked;
- (BOOL)isPendingSelection;
- (BOOL)isShowingVolumeSlider;
- (BOOL)mirroringSwitchVisible;
- (BOOL)provideOwnSeparator;
- (BOOL)useSmartAudioCheckmarkStyle;
- (MPAVRoutingTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (MPAVRoutingTableViewCellDelegate)delegate;
- (MPAVRoutingTableViewCellSubtitleTextState)subtitleTextState;
- (MPVolumeSlider)volumeSlider;
- (double)subtitleViewAlpha;
- (id)_batteryTextForRoute:(id)a3;
- (id)_checkmarkAccessibilityLabelForSmartAudio;
- (id)_checkmarkImageForSmartAudio;
- (id)_checkmarkImageNameForSmartAudio;
- (id)_iconImageForRoute:(id)a3;
- (id)_iconImageForRoutes:(id)a3;
- (id)_pairedDeviceTextForRoute:(id)a3;
- (id)iconView;
- (id)subtitleView;
- (id)titleView;
- (id)volumeView;
- (unint64_t)iconStyle;
- (unint64_t)mirroringStyle;
- (void)_animateSubtitleLabelToNextAvailableText;
- (void)_configureDetailLabel:(id)a3;
- (void)_configureLabel:(id)a3;
- (void)_updateAccessory;
- (void)_updateSpinnerColor;
- (void)_updateSubtitleTextLabelForRouteItem:(id)a3;
- (void)dealloc;
- (void)didTapToExpand;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setAccessoryType:(int64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setIconStyle:(unint64_t)a3;
- (void)setIsDisplayedAsPicked:(BOOL)a3;
- (void)setMirroringStyle:(unint64_t)a3;
- (void)setMirroringSwitchVisible:(BOOL)a3;
- (void)setPendingSelection:(BOOL)a3;
- (void)setProvideOwnSeparator:(BOOL)a3;
- (void)setShowingVolumeSlider:(BOOL)a3;
- (void)setSubtitleTextState:(id)a3;
- (void)setSubtitleViewAlpha:(double)a3;
- (void)setTintColor:(id)a3;
- (void)setUseSmartAudioCheckmarkStyle:(BOOL)a3;
- (void)setVolumeSlider:(id)a3;
- (void)updateForEndpoint:(id)a3 routeItem:(id)a4 inferLocalizedModelName:(BOOL)a5;
@end

@implementation MPAVRoutingTableViewCell

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitleTextState, 0);
  objc_storeStrong((id *)&self->_volumeSlider, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_expandTargetView, 0);
  objc_storeStrong((id *)&self->_chevronImageView, 0);
  objc_storeStrong((id *)&self->_checkmarkImageView, 0);
  objc_storeStrong((id *)&self->_smartAudioImageView, 0);
  objc_storeStrong((id *)&self->_spinnerView, 0);
  objc_storeStrong((id *)&self->_subtitleTextUpdateTimer, 0);
  objc_storeStrong((id *)&self->_subtitleTextLabel, 0);
  objc_storeStrong((id *)&self->_routeNameLabel, 0);

  objc_storeStrong((id *)&self->_iconImageView, 0);
}

- (void)setSubtitleTextState:(id)a3
{
}

- (MPAVRoutingTableViewCellSubtitleTextState)subtitleTextState
{
  return self->_subtitleTextState;
}

- (BOOL)isShowingVolumeSlider
{
  return self->_showingVolumeSlider;
}

- (MPVolumeSlider)volumeSlider
{
  return self->_volumeSlider;
}

- (void)setSubtitleViewAlpha:(double)a3
{
  self->_subtitleViewAlpha = a3;
}

- (double)subtitleViewAlpha
{
  return self->_subtitleViewAlpha;
}

- (void)setProvideOwnSeparator:(BOOL)a3
{
  self->_provideOwnSeparator = a3;
}

- (BOOL)provideOwnSeparator
{
  return self->_provideOwnSeparator;
}

- (BOOL)useSmartAudioCheckmarkStyle
{
  return self->_useSmartAudioCheckmarkStyle;
}

- (void)setIsDisplayedAsPicked:(BOOL)a3
{
  self->_isDisplayedAsPicked = a3;
}

- (BOOL)isDisplayedAsPicked
{
  return self->_isDisplayedAsPicked;
}

- (BOOL)isPendingSelection
{
  return self->_pendingSelection;
}

- (unint64_t)iconStyle
{
  return self->_iconStyle;
}

- (unint64_t)mirroringStyle
{
  return self->_mirroringStyle;
}

- (void)setMirroringSwitchVisible:(BOOL)a3
{
  self->_mirroringSwitchVisible = a3;
}

- (BOOL)mirroringSwitchVisible
{
  return self->_mirroringSwitchVisible;
}

- (void)setDelegate:(id)a3
{
}

- (MPAVRoutingTableViewCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MPAVRoutingTableViewCellDelegate *)WeakRetained;
}

- (void)didTapToExpand
{
  id v3 = [(MPAVRoutingTableViewCell *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v3 routingCellDidTapToExpand:self];
  }
}

- (void)_animateSubtitleLabelToNextAvailableText
{
  if ([(MPAVRoutingTableViewCellSubtitleTextState *)self->_subtitleTextState hasVisibleTextTypeToShow]&& [(MPAVRoutingTableViewCellSubtitleTextState *)self->_subtitleTextState hasVisibleTextTypeToTransitionTo])
  {
    [(MPAVRoutingTableViewCellSubtitleTextState *)self->_subtitleTextState setAnimating:1];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __68__MPAVRoutingTableViewCell__animateSubtitleLabelToNextAvailableText__block_invoke;
    v5[3] = &unk_1E57F9EA8;
    v5[4] = self;
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __68__MPAVRoutingTableViewCell__animateSubtitleLabelToNextAvailableText__block_invoke_2;
    v4[3] = &unk_1E57F9B98;
    v4[4] = self;
    [MEMORY[0x1E4FB1EB0] animateWithDuration:v5 animations:v4 completion:0.24];
  }
  else
  {
    [(NSTimer *)self->_subtitleTextUpdateTimer invalidate];
    subtitleTextUpdateTimer = self->_subtitleTextUpdateTimer;
    self->_subtitleTextUpdateTimer = 0;
  }
}

uint64_t __68__MPAVRoutingTableViewCell__animateSubtitleLabelToNextAvailableText__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1104) setAlpha:0.0];
}

uint64_t __68__MPAVRoutingTableViewCell__animateSubtitleLabelToNextAvailableText__block_invoke_2(uint64_t a1, char a2)
{
  id v3 = *(void **)(*(void *)(a1 + 32) + 1208);
  if (a2)
  {
    [v3 transitionToNextAvailableVisibleTextType];
    v4 = [*(id *)(*(void *)(a1 + 32) + 1208) stringForCurrentVisibleTextType];
    [*(id *)(*(void *)(a1 + 32) + 1104) setText:v4];

    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __68__MPAVRoutingTableViewCell__animateSubtitleLabelToNextAvailableText__block_invoke_3;
    v7[3] = &unk_1E57F9EA8;
    uint64_t v8 = *(void *)(a1 + 32);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __68__MPAVRoutingTableViewCell__animateSubtitleLabelToNextAvailableText__block_invoke_4;
    v6[3] = &unk_1E57F9B98;
    v6[4] = v8;
    return [MEMORY[0x1E4FB1EB0] animateWithDuration:v7 animations:v6 completion:0.24];
  }
  else
  {
    return [v3 setAnimating:0];
  }
}

uint64_t __68__MPAVRoutingTableViewCell__animateSubtitleLabelToNextAvailableText__block_invoke_3(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1104) setAlpha:*(double *)(*(void *)(a1 + 32) + 1192)];
}

uint64_t __68__MPAVRoutingTableViewCell__animateSubtitleLabelToNextAvailableText__block_invoke_4(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1208) setAnimating:0];
}

- (void)_updateSpinnerColor
{
  if (self->_iconStyle == 1)
  {
    uint64_t v3 = [MEMORY[0x1E4FB1618] whiteColor];
  }
  else
  {
    uint64_t v3 = 0;
  }
  id v4 = (id)v3;
  [(UIActivityIndicatorView *)self->_spinnerView setColor:v3];
}

- (void)_updateSubtitleTextLabelForRouteItem:(id)a3
{
  id v4 = a3;
  v5 = [v4 leader];
  v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    uint64_t v8 = [v4 routes];
    id v7 = [v8 firstObject];
  }
  v9 = [(MPAVRoutingTableViewCell *)self _batteryTextForRoute:v7];
  [(MPAVRoutingTableViewCellSubtitleTextState *)self->_subtitleTextState setBatteryText:v9];

  v10 = [(MPAVRoutingTableViewCell *)self _pairedDeviceTextForRoute:v7];
  [(MPAVRoutingTableViewCellSubtitleTextState *)self->_subtitleTextState setPairedDeviceText:v10];

  v11 = [v4 localizedSubtitle];
  [(MPAVRoutingTableViewCellSubtitleTextState *)self->_subtitleTextState setLocalizedSubtitle:v11];

  v12 = [v7 routeUID];
  v13 = [(MPAVRoutingTableViewCellSubtitleTextState *)self->_subtitleTextState routeUID];
  if (v12 == v13)
  {
    uint64_t v14 = [v4 type];

    if (v14 != 2) {
      goto LABEL_10;
    }
  }
  else
  {
  }
  v15 = [v7 routeUID];
  [(MPAVRoutingTableViewCellSubtitleTextState *)self->_subtitleTextState setRouteUID:v15];

  [(MPAVRoutingTableViewCellSubtitleTextState *)self->_subtitleTextState resetForNewRoute];
  if ([(MPAVRoutingTableViewCellSubtitleTextState *)self->_subtitleTextState isAnimating])
  {
    v16 = [(UILabel *)self->_subtitleTextLabel layer];
    [v16 removeAllAnimations];

    [(UILabel *)self->_subtitleTextLabel setAlpha:self->_subtitleViewAlpha];
  }
  [(NSTimer *)self->_subtitleTextUpdateTimer invalidate];
  subtitleTextUpdateTimer = self->_subtitleTextUpdateTimer;
  self->_subtitleTextUpdateTimer = 0;

LABEL_10:
  v18 = [(MPAVRoutingTableViewCellSubtitleTextState *)self->_subtitleTextState stringForCurrentVisibleTextType];
  [(UILabel *)self->_subtitleTextLabel setText:v18];

  if (!self->_subtitleTextUpdateTimer
    && [(MPAVRoutingTableViewCellSubtitleTextState *)self->_subtitleTextState hasVisibleTextTypeToShow]&& [(MPAVRoutingTableViewCellSubtitleTextState *)self->_subtitleTextState hasVisibleTextTypeToTransitionTo])
  {
    objc_initWeak(&location, self);
    v19 = (void *)MEMORY[0x1E4F1CB00];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __65__MPAVRoutingTableViewCell__updateSubtitleTextLabelForRouteItem___block_invoke;
    v22[3] = &unk_1E57EE2A0;
    objc_copyWeak(&v23, &location);
    v20 = [v19 scheduledTimerWithTimeInterval:1 repeats:v22 block:4.48];
    v21 = self->_subtitleTextUpdateTimer;
    self->_subtitleTextUpdateTimer = v20;

    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }
}

void __65__MPAVRoutingTableViewCell__updateSubtitleTextLabelForRouteItem___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _animateSubtitleLabelToNextAvailableText];
    id WeakRetained = v2;
  }
}

- (void)_updateAccessory
{
  if (self->_pendingSelection)
  {
    [(MPAVClippingTableViewCell *)self setAccessoryView:self->_spinnerView];
    spinnerView = self->_spinnerView;
    [(UIActivityIndicatorView *)spinnerView startAnimating];
    return;
  }
  if ([(MPAVRoutingTableViewCell *)self useSmartAudioCheckmarkStyle])
  {
    id v4 = [(MPAVRoutingTableViewCell *)self _checkmarkImageForSmartAudio];
    uint64_t v5 = 1128;
    [(UIImageView *)self->_smartAudioImageView setImage:v4];

    v6 = [(MPAVRoutingTableViewCell *)self _checkmarkAccessibilityLabelForSmartAudio];
    [(UIImageView *)self->_smartAudioImageView setAccessibilityLabel:v6];
  }
  else
  {
    if ([(MPAVRoutingTableViewCell *)self accessoryType] != 3)
    {
      uint64_t v8 = self;
      uint64_t v7 = 0;
      goto LABEL_11;
    }
    v6 = [MEMORY[0x1E4FB1818] systemImageNamed:@"checkmark"];
    uint64_t v5 = 1136;
    [(UIImageView *)self->_checkmarkImageView setImage:v6];
  }

  [*(id *)((char *)&self->super.super.super.super.super.isa + v5) sizeToFit];
  uint64_t v7 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa + v5);
  uint64_t v8 = self;
LABEL_11:

  [(MPAVClippingTableViewCell *)v8 setAccessoryView:v7];
}

- (id)_checkmarkImageForSmartAudio
{
  id v2 = (void *)MEMORY[0x1E4FB1818];
  uint64_t v3 = [(MPAVRoutingTableViewCell *)self _checkmarkImageNameForSmartAudio];
  id v4 = [v2 systemImageNamed:v3];

  return v4;
}

- (id)_checkmarkAccessibilityLabelForSmartAudio
{
  uint64_t v2 = [(MPAVRoutingTableViewCell *)self accessoryType];
  uint64_t v3 = @"circle";
  if (v2) {
    uint64_t v3 = 0;
  }
  if (v2 == 3) {
    return @"checkmark.circle.fill";
  }
  else {
    return v3;
  }
}

- (id)_checkmarkImageNameForSmartAudio
{
  uint64_t v2 = [(MPAVRoutingTableViewCell *)self accessoryType];
  uint64_t v3 = @"circle";
  if (v2) {
    uint64_t v3 = 0;
  }
  if (v2 == 3) {
    return @"checkmark.circle.fill";
  }
  else {
    return v3;
  }
}

- (id)_iconImageForRoute:(id)a3
{
  return +[MPAVRoutingController _iconImageForRoute:a3];
}

- (id)_iconImageForRoutes:(id)a3
{
  return +[MPAVRoutingController _iconImageForRoutes:a3];
}

- (id)_pairedDeviceTextForRoute:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (![v3 isPickedOnPairedDevice])
  {
    v12 = 0;
    goto LABEL_18;
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = [v3 auxiliaryDevices];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (!v5)
  {

    goto LABEL_15;
  }
  uint64_t v6 = v5;
  id v7 = 0;
  uint64_t v8 = *(void *)v18;
LABEL_4:
  uint64_t v9 = 0;
  v10 = v7;
  while (1)
  {
    if (*(void *)v18 != v8) {
      objc_enumerationMutation(v4);
    }
    id v7 = *(id *)(*((void *)&v17 + 1) + 8 * v9);

    if ([v7 isPlaying]) {
      break;
    }
    ++v9;
    v10 = v7;
    if (v6 == v9)
    {
      uint64_t v6 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v6) {
        goto LABEL_4;
      }
      break;
    }
  }

  if (!v7)
  {
LABEL_15:
    v11 = [v3 playingPairedDeviceName];
    if (!v11) {
      goto LABEL_12;
    }
LABEL_16:
    v13 = NSString;
    uint64_t v14 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.MediaPlayer"];
    v15 = [v14 localizedStringForKey:@"AIRPLAY_IN_USE_ON_PAIRED_DEVICE_%@" value:&stru_1EE680640 table:@"MediaPlayer"];
    v12 = objc_msgSend(v13, "stringWithFormat:", v15, v11);

    goto LABEL_17;
  }
  v11 = [v7 deviceName];

  if (v11) {
    goto LABEL_16;
  }
LABEL_12:
  v12 = 0;
LABEL_17:

LABEL_18:

  return v12;
}

- (id)_batteryTextForRoute:(id)a3
{
  id v4 = [a3 batteryLevel];
  id v5 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
  [v5 setNumberStyle:3];
  [v5 setUsesSignificantDigits:0];
  [v5 setUsesGroupingSeparator:0];
  uint64_t v6 = [v4 leftPercentage];
  if (!v6
    || (id v7 = (void *)v6,
        [v4 rightPercentage],
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        v8,
        v7,
        !v8))
  {
    long long v17 = [v4 leftPercentage];

    if (v17)
    {
      long long v18 = NSString;
      v10 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.MediaPlayer"];
      v11 = [v10 localizedStringForKey:@"AIRPLAY_DEVICE_BATTERY_LEVEL_LEFT_FORMAT_%@" value:&stru_1EE680640 table:@"MediaPlayer"];
      uint64_t v19 = [v4 leftPercentage];
    }
    else
    {
      long long v20 = [v4 rightPercentage];

      if (v20)
      {
        long long v18 = NSString;
        v10 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.MediaPlayer"];
        v11 = [v10 localizedStringForKey:@"AIRPLAY_DEVICE_BATTERY_LEVEL_RIGHT_FORMAT_%@" value:&stru_1EE680640 table:@"MediaPlayer"];
        uint64_t v19 = [v4 rightPercentage];
      }
      else
      {
        v27 = [v4 singlePercentage];

        if (!v27)
        {
          v16 = 0;
          goto LABEL_18;
        }
        long long v18 = NSString;
        v10 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.MediaPlayer"];
        v11 = [v10 localizedStringForKey:@"AIRPLAY_DEVICE_BATTERY_LEVEL_SINGLE_FORMAT_%@" value:&stru_1EE680640 table:@"MediaPlayer"];
        uint64_t v19 = [v4 singlePercentage];
      }
    }
    v12 = (void *)v19;
    v13 = [v5 stringFromNumber:v19];
    objc_msgSend(v18, "stringWithFormat:", v11, v13);
    goto LABEL_16;
  }
  if (![(MPAVRoutingTableViewCell *)self _shouldShowSeparateBatteryPercentagesForBatteryLevel:v4])
  {
    v21 = [v4 leftPercentage];
    [v21 floatValue];
    float v23 = v22;
    v24 = [v4 rightPercentage];
    [v24 floatValue];
    if (v23 < v25) {
      [v4 leftPercentage];
    }
    else {
    v10 = [v4 rightPercentage];
    }

    v26 = NSString;
    v11 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.MediaPlayer"];
    v12 = [v11 localizedStringForKey:@"AIRPLAY_DEVICE_BATTERY_LEVEL_SINGLE_FORMAT_%@" value:&stru_1EE680640 table:@"MediaPlayer"];
    v13 = [v5 stringFromNumber:v10];
    objc_msgSend(v26, "stringWithFormat:", v12, v13);
    v16 = LABEL_16:;
    goto LABEL_17;
  }
  uint64_t v9 = NSString;
  v10 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.MediaPlayer"];
  v11 = [v10 localizedStringForKey:@"AIRPLAY_DEVICE_BATTERY_LEVEL_COMBINED_FORMAT_%@_%@" value:&stru_1EE680640 table:@"MediaPlayer"];
  v12 = [v4 leftPercentage];
  v13 = [v5 stringFromNumber:v12];
  uint64_t v14 = [v4 rightPercentage];
  v15 = [v5 stringFromNumber:v14];
  v16 = objc_msgSend(v9, "stringWithFormat:", v11, v13, v15);

LABEL_17:
LABEL_18:
  v28 = [v4 casePercentage];

  if (!v28) {
    goto LABEL_22;
  }
  v29 = NSString;
  v30 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.MediaPlayer"];
  v31 = [v30 localizedStringForKey:@"AIRPLAY_DEVICE_BATTERY_LEVEL_CASE_%@" value:&stru_1EE680640 table:@"MediaPlayer"];
  v32 = [v4 casePercentage];
  v33 = [v5 stringFromNumber:v32];
  v28 = objc_msgSend(v29, "stringWithFormat:", v31, v33);

  if (!v16) {
    goto LABEL_22;
  }
  if (v28)
  {
    id v34 = [NSString stringWithFormat:@"%@  %@", v16, v28];
  }
  else
  {
LABEL_22:
    id v34 = v16;
  }
  v35 = v34;

  return v35;
}

- (BOOL)_shouldShowSeparateBatteryPercentagesForBatteryLevel:(id)a3
{
  id v3 = a3;
  id v4 = [v3 leftPercentage];
  if (v4)
  {
    id v5 = [v3 rightPercentage];
    if (v5)
    {
      uint64_t v6 = [v3 leftPercentage];
      [v6 floatValue];
      float v8 = v7;
      uint64_t v9 = [v3 rightPercentage];
      [v9 floatValue];
      BOOL v11 = vabds_f32(v8, v10) >= 0.1;
    }
    else
    {
      BOOL v11 = 0;
    }
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (void)_configureDetailLabel:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4FB1618];
  id v4 = a3;
  id v5 = [v3 whiteColor];
  [v4 setHighlightedTextColor:v5];

  [v4 setTextAlignment:4];
  id v6 = [MEMORY[0x1E4FB1618] lightGrayColor];
  [v4 setTextColor:v6];
}

- (void)_configureLabel:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4FB1618];
  id v6 = a3;
  id v4 = [v3 whiteColor];
  [v6 setHighlightedTextColor:v4];

  [v6 setTextAlignment:4];
  id v5 = [MEMORY[0x1E4FB1618] blackColor];
  [v6 setTextColor:v5];

  [v6 _setWantsUnderlineForAccessibilityButtonShapesEnabled:1];
}

- (void)setAccessoryType:(int64_t)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MPAVRoutingTableViewCell;
  [(MPAVRoutingTableViewCell *)&v4 setAccessoryType:a3];
  [(MPAVRoutingTableViewCell *)self _updateAccessory];
}

- (void)setIconStyle:(unint64_t)a3
{
  if (self->_iconStyle == a3) {
    return;
  }
  self->_unint64_t iconStyle = a3;
  [(MPAVRoutingTableViewCell *)self _updateSpinnerColor];
  unint64_t iconStyle = self->_iconStyle;
  if (iconStyle == 1)
  {
    uint64_t v5 = [MEMORY[0x1E4FB1618] whiteColor];
  }
  else
  {
    if (iconStyle)
    {
      id v6 = 0;
      goto LABEL_8;
    }
    uint64_t v5 = [MEMORY[0x1E4FB1618] blackColor];
  }
  id v6 = (void *)v5;
LABEL_8:
  id v7 = v6;
  [(UIImageView *)self->_iconImageView setTintColor:v6];
  [(UIImageView *)self->_chevronImageView setTintColor:v7];
}

- (void)setTintColor:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MPAVRoutingTableViewCell;
  [(MPAVRoutingTableViewCell *)&v11 setTintColor:v4];
  if (v4)
  {
    [(UILabel *)self->_routeNameLabel setTextColor:v4];
  }
  else
  {
    uint64_t v5 = [MEMORY[0x1E4FB1618] blackColor];
    [(UILabel *)self->_routeNameLabel setTextColor:v5];
  }
  id v6 = [MEMORY[0x1E4FB1618] blackColor];
  char v7 = [v4 isEqual:v6];

  if (v7)
  {
    uint64_t v8 = 0;
LABEL_8:
    [(MPAVRoutingTableViewCell *)self setIconStyle:v8];
    goto LABEL_9;
  }
  uint64_t v9 = [MEMORY[0x1E4FB1618] whiteColor];
  int v10 = [v4 isEqual:v9];

  if (v10)
  {
    uint64_t v8 = 1;
    goto LABEL_8;
  }
LABEL_9:
}

- (void)layoutSubviews
{
  [(MPAVRoutingTableViewCell *)self _updateAccessory];
  v128.receiver = self;
  v128.super_class = (Class)MPAVRoutingTableViewCell;
  [(MPAVClippingTableViewCell *)&v128 layoutSubviews];
  id v3 = [(MPAVRoutingTableViewCell *)self accessoryView];
  if (!v3)
  {
    id v3 = [(MPAVRoutingTableViewCell *)self _defaultAccessoryView];
  }
  [v3 setAlpha:1.0];
  id v4 = [(MPAVRoutingTableViewCell *)self contentView];
  [v4 bounds];
  CGFloat v121 = v6;
  CGFloat v122 = v5;
  CGFloat v120 = v7;
  CGFloat v119 = v8;

  uint64_t v9 = [(MPAVRoutingTableViewCell *)self traitCollection];
  [v9 displayScale];

  UIRoundToScale();
  UIRoundToScale();
  CGFloat v11 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  CGFloat v13 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v12 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  CGFloat v14 = v12;
  CGFloat v127 = v13;
  CGFloat v125 = *MEMORY[0x1E4F1DB28];
  double v126 = v11;
  double v15 = *MEMORY[0x1E4F1DB28];
  if (v3)
  {
    double v16 = v10;
    double v17 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    [v3 frame];
    CGFloat v19 = v18;
    CGFloat v21 = v20;
    CGFloat v23 = v22;
    CGFloat v25 = v24;
    [(MPAVRoutingTableViewCell *)self bounds];
    CGFloat v30 = MPRectByRemovingUserInterfaceLayoutDirectionInRect(v19, v21, v23, v25, v26, v27, v28, v29);
    CGFloat v32 = v31;
    CGFloat v13 = v33;
    CGFloat v14 = v34;
    [(MPAVRoutingTableViewCell *)self bounds];
    double v37 = v35 + v36;
    v129.origin.x = v30;
    CGFloat v11 = v32;
    v129.origin.y = v32;
    v129.size.width = v13;
    v129.size.height = v14;
    CGFloat Width = CGRectGetWidth(v129);
    double v12 = v17;
    double v15 = v37 - Width - v16;
  }
  CGFloat v124 = v12;
  if (self->_pendingSelection)
  {
    [(UIImageView *)self->_smartAudioImageView frame];
    double v39 = CGRectGetWidth(v130);
    [(UIImageView *)self->_checkmarkImageView frame];
    double v40 = CGRectGetWidth(v131);
    if (v39 < v40) {
      double v39 = v40;
    }
    [v3 frame];
    double v41 = v15 + (v39 - CGRectGetWidth(v132)) * -0.5;
    if (v41 >= 0.0) {
      double v15 = v41;
    }
    else {
      double v15 = 0.0;
    }
  }
  CGFloat v116 = v13;
  CGFloat v117 = v14;
  CGFloat v115 = v11;
  if ([(MPAVRoutingTableViewCell *)self accessoryType] == 3)
  {
    BOOL v42 = [(MPAVRoutingTableViewCell *)self useSmartAudioCheckmarkStyle];
    double v43 = v15 + -3.0;
    if (v15 + -3.0 < 0.0) {
      double v43 = 0.0;
    }
    if (v42) {
      CGFloat v44 = v15;
    }
    else {
      CGFloat v44 = v43;
    }
  }
  else
  {
    CGFloat v44 = v15;
  }
  UIRoundToScale();
  UIRectInset();
  UIRectCenteredYInRect();
  CGFloat v113 = v46;
  CGFloat v114 = v45;
  double v48 = v47;
  CGFloat v112 = v49;
  UIRoundToScale();
  UIRoundToScale();
  CGFloat v111 = v48;
  UIRectInset();
  double v51 = v50;
  double v53 = v52;
  double v55 = v54;
  double v118 = v56;
  if ([(MPAVRoutingTableViewCell *)self isShowingVolumeSlider]) {
    uint64_t v57 = 1;
  }
  else {
    uint64_t v57 = [(MPAVRoutingTableViewCellSubtitleTextState *)self->_subtitleTextState hasVisibleTextTypeToShow] ^ 1;
  }
  [(UILabel *)self->_subtitleTextLabel setHidden:v57];
  -[UILabel sizeThatFits:](self->_routeNameLabel, "sizeThatFits:", v53, v55);
  double v123 = v58;
  v59 = [(MPAVRoutingTableViewCell *)self traitCollection];
  v60 = [MEMORY[0x1E4FB1798] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8] compatibleWithTraitCollection:v59];
  [(UILabel *)self->_routeNameLabel setFont:v60];

  v61 = [MEMORY[0x1E4FB1798] preferredFontForTextStyle:*MEMORY[0x1E4FB28D8] compatibleWithTraitCollection:v59];
  [(UILabel *)self->_subtitleTextLabel setFont:v61];

  [(UILabel *)self->_routeNameLabel _baselineOffsetFromBottom];
  double v63 = v62;
  CGFloat v106 = v53;
  if ([(UILabel *)self->_subtitleTextLabel isHidden])
  {
    if ([(MPAVRoutingTableViewCell *)self isShowingVolumeSlider])
    {
      double v108 = v118 + -1.0;
      double v109 = v53 + -3.0;
      double v110 = v55 - (v123 + 0.0);
      v64 = [(MPAVRoutingTableViewCell *)self traitCollection];
      [v64 displayScale];
      UIRoundToScale();
      double v66 = v123 + v65;

      double v67 = (v55 - v66) * 0.5;
      if (v67 < 0.0) {
        double v67 = 0.0;
      }
      double v107 = v123 + v51 + v67 - v63;
      [(MPAVRoutingTableViewCell *)self bounds];
    }
    else
    {
      double v109 = v127;
      double v110 = v124;
      double v107 = v126;
      double v108 = v125;
      double v123 = v55;
      [(MPAVRoutingTableViewCell *)self bounds];
    }
  }
  else
  {
    -[UILabel sizeThatFits:](self->_subtitleTextLabel, "sizeThatFits:", v53, v55);
    double v109 = v127;
    double v110 = v124;
    double v73 = (v55 - (v123 + v72)) * 0.5;
    if (v73 < 0.0) {
      double v73 = 0.0;
    }
    double v107 = v126;
    double v108 = v125;
    CGFloat v124 = v72;
    CGFloat v127 = v53;
    CGFloat v125 = v118;
    double v126 = v123 + v51 + v73 + 4.0 - v63;
    [(MPAVRoutingTableViewCell *)self bounds];
  }
  objc_msgSend(v3, "setFrame:", MPRectByApplyingUserInterfaceLayoutDirectionInRect(v44, v115, v116, v117, v68, v69, v70, v71));
  [v3 center];
  double v75 = v74;
  [v3 frame];
  [(MPAVRoutingTableViewCell *)self bounds];
  UIRectCenteredYInRect();
  objc_msgSend(v3, "setFrame:");
  [v3 center];
  double v77 = v75 - v76;
  v78 = [v3 maskView];
  [v78 center];
  double v80 = v79;
  v81 = [v3 maskView];
  [v81 center];
  double v83 = v77 + v82;
  v84 = [v3 maskView];
  objc_msgSend(v84, "setCenter:", v80, v83);

  UIRectInset();
  CGFloat v86 = v85;
  CGFloat v88 = v87;
  CGFloat v90 = v89;
  CGFloat v92 = v91;
  [(UIImageView *)self->_iconImageView setFrame:MPRectByApplyingUserInterfaceLayoutDirectionInRect(v114, v113, v111, v112, v122, v121, v120, v119)];
  [(UIImageView *)self->_chevronImageView setFrame:MPRectByApplyingUserInterfaceLayoutDirectionInRect(v86, v88, v90, v92, v122, v121, v120, v119)];
  [(UIImageView *)self->_iconImageView frame];
  CGFloat v94 = v93;
  CGFloat v96 = v95;
  CGFloat v98 = v97;
  CGFloat v100 = v99;
  [(UIImageView *)self->_chevronImageView frame];
  v135.origin.x = v101;
  v135.origin.y = v102;
  v135.size.width = v103;
  v135.size.height = v104;
  v133.origin.x = v94;
  v133.origin.y = v96;
  v133.size.width = v98;
  v133.size.height = v100;
  CGRect v134 = CGRectUnion(v133, v135);
  -[UIView setFrame:](self->_expandTargetView, "setFrame:", v134.origin.x, v134.origin.y, v134.size.width, v134.size.height);
  [(UILabel *)self->_routeNameLabel setFrame:MPRectByApplyingUserInterfaceLayoutDirectionInRect(v118, v105, v106, v123, v122, v121, v120, v119)];
  [(UILabel *)self->_subtitleTextLabel setFrame:MPRectByApplyingUserInterfaceLayoutDirectionInRect(v125, v126, v127, v124, v122, v121, v120, v119)];
  [(MPVolumeSlider *)self->_volumeSlider setFrame:MPRectByApplyingUserInterfaceLayoutDirectionInRect(v108, v107, v109, v110, v122, v121, v120, v119)];
}

- (void)setShowingVolumeSlider:(BOOL)a3
{
  if (self->_showingVolumeSlider != a3)
  {
    self->_showingVolumeSlider = a3;
    [(MPVolumeSlider *)self->_volumeSlider setHidden:!a3];
    [(MPAVRoutingTableViewCell *)self setNeedsLayout];
  }
}

- (void)setVolumeSlider:(id)a3
{
  double v5 = (MPVolumeSlider *)a3;
  p_volumeSlider = &self->_volumeSlider;
  volumeSlider = self->_volumeSlider;
  double v15 = v5;
  if (volumeSlider == v5)
  {
    CGFloat v11 = [(MPVolumeSlider *)v5 superview];
    double v12 = [(MPAVRoutingTableViewCell *)self contentView];

    CGFloat v13 = v15;
    if (v11 == v12) {
      goto LABEL_8;
    }
    CGFloat v14 = [(MPAVRoutingTableViewCell *)self contentView];
    [v14 addSubview:v15];
  }
  else
  {
    double v8 = [(MPVolumeSlider *)volumeSlider superview];
    uint64_t v9 = [(MPAVRoutingTableViewCell *)self contentView];

    if (v8 == v9) {
      [(MPVolumeSlider *)*p_volumeSlider removeFromSuperview];
    }
    objc_storeStrong((id *)&self->_volumeSlider, a3);
    double v10 = [(MPAVRoutingTableViewCell *)self contentView];
    [v10 addSubview:*p_volumeSlider];

    [(MPVolumeSlider *)*p_volumeSlider setHidden:!self->_showingVolumeSlider];
    [(MPAVRoutingTableViewCell *)self setNeedsLayout];
  }
  CGFloat v13 = v15;
LABEL_8:
}

- (void)setUseSmartAudioCheckmarkStyle:(BOOL)a3
{
  if (self->_useSmartAudioCheckmarkStyle != a3)
  {
    self->_useSmartAudioCheckmarkStyle = a3;
    if (a3 && !self->_smartAudioImageView)
    {
      id v4 = objc_alloc(MEMORY[0x1E4FB1838]);
      double v5 = (UIImageView *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      smartAudioImageView = self->_smartAudioImageView;
      self->_smartAudioImageView = v5;

      double v7 = [MEMORY[0x1E4FB1830] configurationWithTextStyle:*MEMORY[0x1E4FB28C8] scale:3];
      [(UIImageView *)self->_smartAudioImageView setPreferredSymbolConfiguration:v7];
    }
    [(MPAVRoutingTableViewCell *)self _updateAccessory];
  }
}

- (void)setPendingSelection:(BOOL)a3
{
  if (self->_pendingSelection == a3) {
    return;
  }
  self->_pendingSelection = a3;
  spinnerView = self->_spinnerView;
  if (!spinnerView)
  {
    double v5 = (UIActivityIndicatorView *)[objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:100];
    double v6 = self->_spinnerView;
    self->_spinnerView = v5;

    [(MPAVRoutingTableViewCell *)self _updateSpinnerColor];
    spinnerView = self->_spinnerView;
    if (self->_pendingSelection) {
      goto LABEL_4;
    }
LABEL_6:
    [(UIActivityIndicatorView *)spinnerView stopAnimating];
    goto LABEL_7;
  }
  if (!a3) {
    goto LABEL_6;
  }
LABEL_4:
  [(UIActivityIndicatorView *)spinnerView startAnimating];
LABEL_7:

  [(MPAVRoutingTableViewCell *)self _updateAccessory];
}

- (void)setMirroringStyle:(unint64_t)a3
{
  self->_mirroringStyle = a3;
}

- (id)iconView
{
  return self->_iconImageView;
}

- (id)volumeView
{
  return self->_volumeSlider;
}

- (id)subtitleView
{
  return self->_subtitleTextLabel;
}

- (id)titleView
{
  return self->_routeNameLabel;
}

- (void)updateForEndpoint:(id)a3 routeItem:(id)a4 inferLocalizedModelName:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  double v8 = [v7 leader];
  uint64_t v9 = v8;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    CGFloat v11 = [v7 routes];
    id v10 = [v11 firstObject];
  }
  double v12 = os_log_create("com.apple.amp.mediaplayer", "Routing");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    int v21 = 134218242;
    double v22 = self;
    __int16 v23 = 2112;
    id v24 = v10;
    _os_log_impl(&dword_1952E8000, v12, OS_LOG_TYPE_INFO, "routingTableView %p updateForEndpoint: routeUpdate: %@", (uint8_t *)&v21, 0x16u);
  }

  if (v5 && ([v10 routeSubtype] == 1 || objc_msgSend(v10, "routeSubtype") == 3))
  {
    uint64_t v13 = MSVCopyLocalizedModelName();
  }
  else
  {
    uint64_t v13 = [v7 localizedTitle];
  }
  CGFloat v14 = (void *)v13;
  [(UILabel *)self->_routeNameLabel setText:v13];
  double v15 = [v7 image];

  if (v15 || !v10)
  {
    uint64_t v18 = [v7 image];
  }
  else
  {
    if ([v7 type] == 1)
    {
      double v16 = [v7 routes];
      double v17 = [(MPAVRoutingTableViewCell *)self _iconImageForRoutes:v16];
      [(UIImageView *)self->_iconImageView setImage:v17];

      goto LABEL_18;
    }
    uint64_t v18 = [(MPAVRoutingTableViewCell *)self _iconImageForRoute:v10];
  }
  double v16 = (void *)v18;
  [(UIImageView *)self->_iconImageView setImage:v18];
LABEL_18:

  CGFloat v19 = [(UIImageView *)self->_iconImageView image];
  if ([v19 isSymbolImage]) {
    uint64_t v20 = 4;
  }
  else {
    uint64_t v20 = 1;
  }
  [(UIImageView *)self->_iconImageView setContentMode:v20];

  -[UIImageView setHidden:](self->_chevronImageView, "setHidden:", [v7 type] != 1);
  [(MPAVRoutingTableViewCell *)self _updateSubtitleTextLabelForRouteItem:v7];
  -[MPAVRoutingTableViewCell setEnabled:](self, "setEnabled:", [v7 enabled]);
  [(MPAVRoutingTableViewCell *)self setNeedsLayout];
}

- (void)prepareForReuse
{
  v2.receiver = self;
  v2.super_class = (Class)MPAVRoutingTableViewCell;
  [(MPAVClippingTableViewCell *)&v2 prepareForReuse];
}

- (void)dealloc
{
  [(NSTimer *)self->_subtitleTextUpdateTimer invalidate];
  subtitleTextUpdateTimer = self->_subtitleTextUpdateTimer;
  self->_subtitleTextUpdateTimer = 0;

  v4.receiver = self;
  v4.super_class = (Class)MPAVRoutingTableViewCell;
  [(MPAVClippingTableViewCell *)&v4 dealloc];
}

- (MPAVRoutingTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v45.receiver = self;
  v45.super_class = (Class)MPAVRoutingTableViewCell;
  objc_super v4 = [(MPAVClippingTableViewCell *)&v45 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    double v6 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.5];
    [v5 setBackgroundColor:v6];

    [(MPAVRoutingTableViewCell *)v4 setSelectedBackgroundView:v5];
    id v7 = [MEMORY[0x1E4FB1618] clearColor];
    [(MPAVRoutingTableViewCell *)v4 setBackgroundColor:v7];

    double v8 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
    iconImageView = v4->_iconImageView;
    v4->_iconImageView = v8;

    id v10 = [MEMORY[0x1E4FB1618] clearColor];
    [(UIImageView *)v4->_iconImageView setBackgroundColor:v10];

    CGFloat v11 = [MEMORY[0x1E4FB1830] configurationWithPointSize:4 weight:3 scale:17.0];
    [(UIImageView *)v4->_iconImageView setPreferredSymbolConfiguration:v11];

    double v12 = [(MPAVRoutingTableViewCell *)v4 contentView];
    [v12 addSubview:v4->_iconImageView];

    uint64_t v13 = [MEMORY[0x1E4FB1618] blackColor];
    [(UIImageView *)v4->_iconImageView setTintColor:v13];

    uint64_t v14 = objc_opt_new();
    chevronImageView = v4->_chevronImageView;
    v4->_chevronImageView = (UIImageView *)v14;

    double v16 = [MEMORY[0x1E4FB1818] systemImageNamed:@"chevron.forward"];
    [(UIImageView *)v4->_chevronImageView setImage:v16];

    [(UIImageView *)v4->_chevronImageView setContentMode:4];
    double v17 = [MEMORY[0x1E4FB1618] blackColor];
    [(UIImageView *)v4->_chevronImageView setTintColor:v17];

    [(UIImageView *)v4->_chevronImageView setAlpha:0.7];
    uint64_t v18 = [(MPAVRoutingTableViewCell *)v4 contentView];
    [v18 addSubview:v4->_chevronImageView];

    CGFloat v19 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v19 addObserver:v4 selector:sel__handleContentSizeCategoryDidChangeNotification_ name:*MEMORY[0x1E4FB27A8] object:0];
    uint64_t v20 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    routeNameLabel = v4->_routeNameLabel;
    v4->_routeNameLabel = v20;

    double v22 = [MEMORY[0x1E4FB1618] whiteColor];
    [(UILabel *)v4->_routeNameLabel setHighlightedTextColor:v22];

    [(UILabel *)v4->_routeNameLabel setTextAlignment:4];
    __int16 v23 = [MEMORY[0x1E4FB1618] blackColor];
    [(UILabel *)v4->_routeNameLabel setTextColor:v23];

    [(UILabel *)v4->_routeNameLabel _setWantsUnderlineForAccessibilityButtonShapesEnabled:1];
    id v24 = [(MPAVRoutingTableViewCell *)v4 contentView];
    [v24 addSubview:v4->_routeNameLabel];

    uint64_t v25 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    subtitleTextLabel = v4->_subtitleTextLabel;
    v4->_subtitleTextLabel = v25;

    CGFloat v27 = [MEMORY[0x1E4FB1618] whiteColor];
    [(UILabel *)v4->_subtitleTextLabel setHighlightedTextColor:v27];

    [(UILabel *)v4->_subtitleTextLabel setTextAlignment:4];
    CGFloat v28 = [MEMORY[0x1E4FB1618] darkGrayColor];
    [(UILabel *)v4->_subtitleTextLabel setTextColor:v28];

    CGFloat v29 = [(MPAVRoutingTableViewCell *)v4 contentView];
    [v29 addSubview:v4->_subtitleTextLabel];

    [(UILabel *)v4->_subtitleTextLabel setHidden:1];
    CGFloat v30 = objc_alloc_init(MPAVRoutingTableViewCellSubtitleTextState);
    subtitleTextState = v4->_subtitleTextState;
    v4->_subtitleTextState = v30;

    id v32 = objc_alloc(MEMORY[0x1E4FB1838]);
    uint64_t v33 = objc_msgSend(v32, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    checkmarkImageView = v4->_checkmarkImageView;
    v4->_checkmarkImageView = (UIImageView *)v33;

    double v35 = [MEMORY[0x1E4FB17A0] defaultFontDescriptorWithTextStyle:*MEMORY[0x1E4FB28C8]];
    double v36 = [v35 fontDescriptorWithSymbolicTraits:2];

    double v37 = [MEMORY[0x1E4FB1798] fontWithDescriptor:v36 size:0.0];
    v38 = [MEMORY[0x1E4FB1830] configurationWithFont:v37 scale:2];
    [(UIImageView *)v4->_checkmarkImageView setPreferredSymbolConfiguration:v38];

    double v39 = [MEMORY[0x1E4FB1830] configurationWithFont:v37 scale:1];
    [(UIImageView *)v4->_chevronImageView setPreferredSymbolConfiguration:v39];

    v4->_subtitleViewAlpha = 1.0;
    double v40 = (void *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:v4 action:sel_didTapToExpand];
    uint64_t v41 = objc_opt_new();
    expandTargetView = v4->_expandTargetView;
    v4->_expandTargetView = (UIView *)v41;

    [(UIView *)v4->_expandTargetView addGestureRecognizer:v40];
    double v43 = [(MPAVRoutingTableViewCell *)v4 contentView];
    [v43 addSubview:v4->_expandTargetView];
  }
  return v4;
}

@end