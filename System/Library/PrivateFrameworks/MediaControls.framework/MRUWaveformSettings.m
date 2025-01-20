@interface MRUWaveformSettings
+ (MRUWaveformSettings)ambientSettings;
+ (MRUWaveformSettings)currentSettings;
- (BOOL)supportsVariableFramerate;
- (NSArray)adjustmentCoefficients;
- (NSArray)stops;
- (float)amplitudeGain;
- (float)animationDuration;
- (float)artworkBlur;
- (float)artworkSaturation;
- (float)exponentialGain;
- (float)framerateThreshold;
- (float)frequencyExponent;
- (float)maxArtworkLuminance;
- (float)minArtworkLuminance;
- (float)opacity;
- (float)pausedAnimationDuration;
- (float)pausedSpringDamping;
- (float)samplingRefreshRate;
- (float)springDamping;
- (float)xScaleMultiplier;
- (id)initWithStops:(id *)a1;
- (int)lowPowerModeMaximumFramerate;
- (int)maximumFramerate;
- (int)minimumFramerate;
- (int)nonVariableFramerate;
- (void)setAdjustmentCoefficients:(id)a3;
- (void)setAmplitudeGain:(float)a3;
- (void)setAnimationDuration:(float)a3;
- (void)setArtworkBlur:(float)a3;
- (void)setArtworkSaturation:(float)a3;
- (void)setExponentialGain:(float)a3;
- (void)setFramerateThreshold:(float)a3;
- (void)setFrequencyExponent:(float)a3;
- (void)setLowPowerModeMaximumFramerate:(int)a3;
- (void)setMaxArtworkLuminance:(float)a3;
- (void)setMaximumFramerate:(int)a3;
- (void)setMinArtworkLuminance:(float)a3;
- (void)setMinimumFramerate:(int)a3;
- (void)setNonVariableFramerate:(int)a3;
- (void)setOpacity:(float)a3;
- (void)setPausedAnimationDuration:(float)a3;
- (void)setPausedSpringDamping:(float)a3;
- (void)setSamplingRefreshRate:(float)a3;
- (void)setSpringDamping:(float)a3;
- (void)setStops:(id)a3;
- (void)setSupportsVariableFramerate:(BOOL)a3;
- (void)setXScaleMultiplier:(float)a3;
@end

@implementation MRUWaveformSettings

+ (MRUWaveformSettings)currentSettings
{
  if (currentSettings_onceToken != -1) {
    dispatch_once(&currentSettings_onceToken, &__block_literal_global_0);
  }
  v2 = (void *)__MRUWaveformSettingsCurrent;

  return (MRUWaveformSettings *)v2;
}

void __38__MRUWaveformSettings_currentSettings__block_invoke()
{
  v0 = -[MRUWaveformSettings initWithStops:]((id *)[MRUWaveformSettings alloc], &unk_1F069F230);
  v1 = (void *)__MRUWaveformSettingsCurrent;
  __MRUWaveformSettingsCurrent = (uint64_t)v0;
}

- (id)initWithStops:(id *)a1
{
  id v4 = a2;
  if (a1)
  {
    v9.receiver = a1;
    v9.super_class = (Class)MRUWaveformSettings;
    v5 = (id *)objc_msgSendSuper2(&v9, sel_init);
    a1 = v5;
    if (v5)
    {
      objc_storeStrong(v5 + 11, a2);
      id v6 = a1[12];
      a1[12] = &unk_1F069F260;

      *(_OWORD *)((char *)a1 + 12) = xmmword_1AE9634E0;
      *(_OWORD *)((char *)a1 + 28) = xmmword_1AE9634F0;
      *((_DWORD *)a1 + 11) = 1059648963;
      *((unsigned char *)a1 + 8) = MRUDeviceSupportsVariableFrameRate();
      v7 = [MEMORY[0x1E4F77108] currentSettings];
      *((_DWORD *)a1 + 12) = [v7 waveformNonVariableFramerate];

      *(id *)((char *)a1 + 52) = (id)0x1E00000030;
      *((_DWORD *)a1 + 15) = 5;
      *((_OWORD *)a1 + 4) = xmmword_1AE963500;
      a1[10] = (id)0x3F8000003F000000;
    }
  }

  return a1;
}

+ (MRUWaveformSettings)ambientSettings
{
  if (ambientSettings_onceToken != -1) {
    dispatch_once(&ambientSettings_onceToken, &__block_literal_global_15);
  }
  v2 = (void *)__MRUWaveformSettingsAmbient;

  return (MRUWaveformSettings *)v2;
}

void __38__MRUWaveformSettings_ambientSettings__block_invoke()
{
  v0 = -[MRUWaveformSettings initWithStops:]((id *)[MRUWaveformSettings alloc], &unk_1F069F248);
  v1 = (void *)__MRUWaveformSettingsAmbient;
  __MRUWaveformSettingsAmbient = (uint64_t)v0;
}

- (NSArray)stops
{
  return self->_stops;
}

- (void)setStops:(id)a3
{
}

- (float)amplitudeGain
{
  return self->_amplitudeGain;
}

- (void)setAmplitudeGain:(float)a3
{
  self->_amplitudeGain = a3;
}

- (float)exponentialGain
{
  return self->_exponentialGain;
}

- (void)setExponentialGain:(float)a3
{
  self->_exponentialGain = a3;
}

- (float)frequencyExponent
{
  return self->_frequencyExponent;
}

- (void)setFrequencyExponent:(float)a3
{
  self->_frequencyExponent = a3;
}

- (float)samplingRefreshRate
{
  return self->_samplingRefreshRate;
}

- (void)setSamplingRefreshRate:(float)a3
{
  self->_samplingRefreshRate = a3;
}

- (NSArray)adjustmentCoefficients
{
  return self->_adjustmentCoefficients;
}

- (void)setAdjustmentCoefficients:(id)a3
{
}

- (float)animationDuration
{
  return self->_animationDuration;
}

- (void)setAnimationDuration:(float)a3
{
  self->_animationDuration = a3;
}

- (float)springDamping
{
  return self->_springDamping;
}

- (void)setSpringDamping:(float)a3
{
  self->_springDamping = a3;
}

- (float)pausedAnimationDuration
{
  return self->_pausedAnimationDuration;
}

- (void)setPausedAnimationDuration:(float)a3
{
  self->_pausedAnimationDuration = a3;
}

- (float)pausedSpringDamping
{
  return self->_pausedSpringDamping;
}

- (void)setPausedSpringDamping:(float)a3
{
  self->_pausedSpringDamping = a3;
}

- (float)xScaleMultiplier
{
  return self->_xScaleMultiplier;
}

- (void)setXScaleMultiplier:(float)a3
{
  self->_xScaleMultiplier = a3;
}

- (BOOL)supportsVariableFramerate
{
  return self->_supportsVariableFramerate;
}

- (void)setSupportsVariableFramerate:(BOOL)a3
{
  self->_supportsVariableFramerate = a3;
}

- (int)nonVariableFramerate
{
  return self->_nonVariableFramerate;
}

- (void)setNonVariableFramerate:(int)a3
{
  self->_nonVariableFramerate = a3;
}

- (int)maximumFramerate
{
  return self->_maximumFramerate;
}

- (void)setMaximumFramerate:(int)a3
{
  self->_maximumFramerate = a3;
}

- (int)lowPowerModeMaximumFramerate
{
  return self->_lowPowerModeMaximumFramerate;
}

- (void)setLowPowerModeMaximumFramerate:(int)a3
{
  self->_lowPowerModeMaximumFramerate = a3;
}

- (int)minimumFramerate
{
  return self->_minimumFramerate;
}

- (void)setMinimumFramerate:(int)a3
{
  self->_minimumFramerate = a3;
}

- (float)framerateThreshold
{
  return self->_framerateThreshold;
}

- (void)setFramerateThreshold:(float)a3
{
  self->_framerateThreshold = a3;
}

- (float)artworkBlur
{
  return self->_artworkBlur;
}

- (void)setArtworkBlur:(float)a3
{
  self->_artworkBlur = a3;
}

- (float)artworkSaturation
{
  return self->_artworkSaturation;
}

- (void)setArtworkSaturation:(float)a3
{
  self->_artworkSaturation = a3;
}

- (float)minArtworkLuminance
{
  return self->_minArtworkLuminance;
}

- (void)setMinArtworkLuminance:(float)a3
{
  self->_minArtworkLuminance = a3;
}

- (float)maxArtworkLuminance
{
  return self->_maxArtworkLuminance;
}

- (void)setMaxArtworkLuminance:(float)a3
{
  self->_maxArtworkLuminance = a3;
}

- (float)opacity
{
  return self->_opacity;
}

- (void)setOpacity:(float)a3
{
  self->_opacity = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_adjustmentCoefficients, 0);

  objc_storeStrong((id *)&self->_stops, 0);
}

@end