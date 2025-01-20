@interface AVPlayerItem(MediaPlaybackCore)
- (id)mpc_playerItemIdentifier;
- (id)mpc_setupDescription;
- (uint64_t)mpc_updateAVVariantPreferenceForPlayerAudioFormat:()MediaPlaybackCore spatialPreference:forceSpatial:maxResolution:;
- (uint64_t)mpc_updatePreferredMaximumAudioSampleRateForPlayerAudioFormat:()MediaPlaybackCore maxResolution:;
- (uint64_t)mpc_updatePrefersOfflinePlayableVariantForPlayerAudioFormat:()MediaPlaybackCore isDownloadedAsset:;
- (void)mpc_setReportingValue:()MediaPlaybackCore forKey:;
- (void)mpc_setupForHLSPlaybackWithPreferredFormat:()MediaPlaybackCore spatialPreference:forceSpatial:maxResolution:isDownloadedAsset:;
- (void)mpc_updateAVAudioSpatializationFormatsForPlayerAudioFormat:()MediaPlaybackCore spatialPreference:;
- (void)mpc_updatePreferredForwardBufferDurationForPlayerAudioFormat:()MediaPlaybackCore;
@end

@implementation AVPlayerItem(MediaPlaybackCore)

- (void)mpc_setReportingValue:()MediaPlaybackCore forKey:
{
  id v7 = a3;
  id v6 = a4;
  if (_NSIsNSNumber())
  {
    [a1 setReportingValueWithNumber:v7 forKey:v6];
  }
  else if (_NSIsNSString())
  {
    [a1 setReportingValueWithString:v7 forKey:v6];
  }
}

- (id)mpc_playerItemIdentifier
{
  v2 = NSString;
  v3 = [a1 asset];
  v4 = [v3 loggingIdentifier];
  v5 = [v2 stringWithFormat:@"%@ %p", v4, a1];

  return v5;
}

- (id)mpc_setupDescription
{
  v2 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:5];
  v3 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(a1, "prefersOfflinePlayableVariants"));
  [v2 setObject:v3 forKeyedSubscript:@"prefersOfflinePlayableVariants"];

  v4 = NSNumber;
  [a1 preferredMaximumAudioSampleRate];
  v5 = objc_msgSend(v4, "numberWithDouble:");
  [v2 setObject:v5 forKeyedSubscript:@"preferredMaximumAudioSampleRate"];

  id v6 = NSNumber;
  [a1 preferredForwardBufferDuration];
  id v7 = objc_msgSend(v6, "numberWithDouble:");
  [v2 setObject:v7 forKeyedSubscript:@"preferredForwardBufferDuration"];

  if ([a1 allowedAudioSpatializationFormats] == 4)
  {
    v8 = @"Multichannel";
  }
  else if ([a1 allowedAudioSpatializationFormats])
  {
    if ([a1 allowedAudioSpatializationFormats] == 3)
    {
      v8 = @"MonoAndStereo";
    }
    else
    {
      if ([a1 allowedAudioSpatializationFormats] != 7) {
        goto LABEL_10;
      }
      v8 = @"MonoStereoAndMultichannel";
    }
  }
  else
  {
    v8 = @"None";
  }
  [v2 setObject:v8 forKeyedSubscript:@"allowedAudioSpatializationFormats"];
LABEL_10:
  v9 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:4];
  if (([a1 variantPreferences] & 4) != 0)
  {
    v10 = [NSString stringWithFormat:@"GaplessAudioTransitions"];
    [v9 addObject:v10];
  }
  if (([a1 variantPreferences] & 8) != 0)
  {
    v11 = [NSString stringWithFormat:@"BinauralAudioForUnknownAudioDeviceTypes"];
    [v9 addObject:v11];
  }
  if ([a1 variantPreferences])
  {
    v12 = [NSString stringWithFormat:@"ScalabilityToLosslessAudio"];
    [v9 addObject:v12];
  }
  if (([a1 variantPreferences] & 2) != 0)
  {
    v13 = [NSString stringWithFormat:@"UnconstrainedAudioSampleRate"];
    [v9 addObject:v13];
  }
  v14 = NSString;
  v15 = [v9 componentsJoinedByString:@","];
  v16 = [v14 stringWithFormat:@"[%@]", v15];
  [v2 setObject:v16 forKeyedSubscript:@"variantPreferences"];

  v17 = [v2 description];

  return v17;
}

- (void)mpc_updatePreferredForwardBufferDurationForPlayerAudioFormat:()MediaPlaybackCore
{
  if ((unint64_t)([a3 tier] - 2) <= 2)
  {
    id v4 = [MEMORY[0x263F12178] standardUserDefaults];
    [v4 forwardBufferDuration];
    objc_msgSend(a1, "setPreferredForwardBufferDuration:");
  }
}

- (uint64_t)mpc_updatePrefersOfflinePlayableVariantForPlayerAudioFormat:()MediaPlaybackCore isDownloadedAsset:
{
  uint64_t result = [a3 tier];
  if ((unint64_t)(result - 2) <= 2)
  {
    return [a1 setPrefersOfflinePlayableVariants:a4];
  }
  return result;
}

- (uint64_t)mpc_updatePreferredMaximumAudioSampleRateForPlayerAudioFormat:()MediaPlaybackCore maxResolution:
{
  if (a4 <= 47999) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = a4;
  }
  uint64_t v6 = [a3 tier];
  uint64_t v7 = 192000;
  uint64_t v8 = 48000;
  if (v6 != 2) {
    uint64_t v8 = v5;
  }
  if (v6 != 3) {
    uint64_t v7 = v8;
  }

  return [a1 setPreferredMaximumAudioSampleRate:(double)v7];
}

- (void)mpc_updateAVAudioSpatializationFormatsForPlayerAudioFormat:()MediaPlaybackCore spatialPreference:
{
  id v8 = a3;
  if (MSVDeviceIsHomePod()) {
    [a1 setAutoSwitchAtmosStreamVariants:0];
  }
  if ([v8 tier] != 4 && (unint64_t)(a4 - 1) >= 2) {
    uint64_t v7 = 0;
  }
  else {
    uint64_t v7 = 4;
  }
  [a1 setAllowedAudioSpatializationFormats:v7];
}

- (uint64_t)mpc_updateAVVariantPreferenceForPlayerAudioFormat:()MediaPlaybackCore spatialPreference:forceSpatial:maxResolution:
{
  uint64_t v10 = [a3 tier];
  BOOL v11 = a4 == 1 || v10 == 4;
  int v12 = v11;
  BOOL v11 = (v12 & a5) == 0;
  uint64_t v13 = 20;
  if (!v11) {
    uint64_t v13 = 28;
  }
  if (a6 <= 47999) {
    uint64_t v14 = v13;
  }
  else {
    uint64_t v14 = v13 | 3;
  }

  return [a1 setVariantPreferences:v14];
}

- (void)mpc_setupForHLSPlaybackWithPreferredFormat:()MediaPlaybackCore spatialPreference:forceSpatial:maxResolution:isDownloadedAsset:
{
  id v12 = a3;
  objc_msgSend(a1, "mpc_updateAVAudioSpatializationFormatsForPlayerAudioFormat:spatialPreference:", v12, a4);
  objc_msgSend(a1, "mpc_updateAVVariantPreferenceForPlayerAudioFormat:spatialPreference:forceSpatial:maxResolution:", v12, a4, a5, a6);
  objc_msgSend(a1, "mpc_updatePreferredMaximumAudioSampleRateForPlayerAudioFormat:maxResolution:", v12, a6);
  objc_msgSend(a1, "mpc_updatePrefersOfflinePlayableVariantForPlayerAudioFormat:isDownloadedAsset:", v12, a7);
  objc_msgSend(a1, "mpc_updatePreferredForwardBufferDurationForPlayerAudioFormat:", v12);
}

@end