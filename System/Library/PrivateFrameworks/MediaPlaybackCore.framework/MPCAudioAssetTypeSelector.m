@interface MPCAudioAssetTypeSelector
- (BOOL)networkBandwidthIsHigh;
- (BOOL)prefersHighQualityStereo;
- (BOOL)prefersHighResolutionLossless;
- (BOOL)prefersLossless;
- (BOOL)prefersLowQualityStereo;
- (BOOL)prefersSpatialOverLossless;
- (BOOL)prefersSpatialOverStereo:(id)a3;
- (BOOL)spatialIsAlwaysOn;
- (BOOL)spatialIsAutomatic;
- (BOOL)spatialIsOff;
- (ICEnvironmentMonitor)environmentMonitor;
- (MPCAudioAssetTypeSelector)initWithPlaybackEngine:(id)a3;
- (MPCAudioAssetTypeSelector)initWithPlaybackEngine:(id)a3 userDefaults:(id)a4 environmentMonitor:(id)a5;
- (MPCPlaybackEngine)playbackEngine;
- (MPPlaybackUserDefaults)defaults;
- (MSVABTestGenerator)outcomeGenerator;
- (MSVTrialExperiment)trialExperiment;
- (id)audioFormatMatchingAudioAssetType:(int64_t)a3 formats:(id)a4 route:(id)a5;
- (id)description;
- (id)descriptionForTiers:(unint64_t)a3;
- (id)descriptionForTraits:(unint64_t)a3;
- (id)environmentDescription;
- (id)experimentDescription;
- (id)preferencesDescription;
- (id)preferredAudioAssetTypeForItem:(id)a3;
- (id)preferredAudioAssetTypeForSongWithTrait:(unint64_t)a3 isStartItem:(BOOL)a4;
- (id)preferredAudioAssetTypeForSongWithTrait:(unint64_t)a3 isStartItem:(BOOL)a4 supportsVocalAttenuation:(BOOL)a5;
- (id)preferredAudioFormatForAudioFormats:(id)a3 route:(id)a4;
- (id)preferredPlayerAudioFormatForItem:(id)a3 route:(id)a4;
- (int64_t)maxResolution;
- (int64_t)nextAssetTypeOutcomeWithIsStartItem:(BOOL)a3;
- (int64_t)spatialPreference;
- (int64_t)tierMatchingAudioAssetType:(int64_t)a3;
- (unint64_t)audioFormatPreference;
- (void)handleExperimentDidReceiveUpdateNotification:(id)a3;
- (void)setDefaults:(id)a3;
- (void)setEnvironmentMonitor:(id)a3;
- (void)setTrialExperiment:(id)a3;
- (void)updateOutcomeGenerator;
- (void)updateProbabilityOfProgressiveDownloadAssets:(float)a3;
@end

@implementation MPCAudioAssetTypeSelector

- (BOOL)spatialIsAlwaysOn
{
  if (!MSVDeviceSupportsMultiChannelMusic()) {
    return 0;
  }
  v3 = [(MPCAudioAssetTypeSelector *)self defaults];
  BOOL v4 = [v3 spatialAudioPreference] == 1;

  return v4;
}

- (BOOL)spatialIsOff
{
  if (!MSVDeviceSupportsMultiChannelMusic()) {
    return 1;
  }
  v3 = [(MPCAudioAssetTypeSelector *)self defaults];
  BOOL v4 = [v3 spatialAudioPreference] == 0;

  return v4;
}

- (MPPlaybackUserDefaults)defaults
{
  return self->_defaults;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = [(MPCAudioAssetTypeSelector *)self outcomeGenerator];
  v6 = (void *)v5;
  if (v5) {
    v7 = (__CFString *)v5;
  }
  else {
    v7 = @"-";
  }
  v8 = [(MPCAudioAssetTypeSelector *)self trialExperiment];
  uint64_t v9 = [v8 treatmentID];
  v10 = (void *)v9;
  v11 = @"N/A";
  if (v9) {
    v11 = (__CFString *)v9;
  }
  v12 = [v3 stringWithFormat:@"<%@: %p %@ experimentTreatmentID:%@>", v4, self, v7, v11];

  return v12;
}

- (MSVTrialExperiment)trialExperiment
{
  return self->_trialExperiment;
}

- (MSVABTestGenerator)outcomeGenerator
{
  return self->_outcomeGenerator;
}

- (MPCAudioAssetTypeSelector)initWithPlaybackEngine:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x263F12178];
  id v5 = a3;
  v6 = [v4 standardUserDefaults];
  v7 = [MEMORY[0x263F89110] sharedMonitor];
  v8 = [(MPCAudioAssetTypeSelector *)self initWithPlaybackEngine:v5 userDefaults:v6 environmentMonitor:v7];

  return v8;
}

- (MPCAudioAssetTypeSelector)initWithPlaybackEngine:(id)a3 userDefaults:(id)a4 environmentMonitor:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)MPCAudioAssetTypeSelector;
  v11 = [(MPCAudioAssetTypeSelector *)&v18 init];
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_playbackEngine, v8);
    objc_storeStrong((id *)&v12->_defaults, a4);
    objc_storeStrong((id *)&v12->_environmentMonitor, a5);
    v13 = +[MPCPlaybackPerformanceController sharedController];
    uint64_t v14 = [v13 trialExperimentWithNamespaceName:@"MUSIC_PLAYBACK_PERFORMANCE_STEREO_HLS"];
    trialExperiment = v12->_trialExperiment;
    v12->_trialExperiment = (MSVTrialExperiment *)v14;

    if (v12->_trialExperiment)
    {
      v16 = [MEMORY[0x263F08A00] defaultCenter];
      [v16 addObserver:v12 selector:sel_handleExperimentDidReceiveUpdateNotification_ name:*MEMORY[0x263F54EB0] object:v12->_trialExperiment];
    }
    [(MPCAudioAssetTypeSelector *)v12 updateOutcomeGenerator];
  }

  return v12;
}

- (void)updateOutcomeGenerator
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v3 = [(MPPlaybackUserDefaults *)self->_defaults progressiveDownloadAssetRatio];
  [(MSVTrialExperiment *)self->_trialExperiment doubleForFactor:@"StereoHLSAssetRatio"];
  if (v4 > 1.0) {
    double v4 = 1.0;
  }
  if (v3)
  {
    id v5 = objc_alloc(MEMORY[0x263F54EB8]);
    [v3 floatValue];
    id v7 = v5;
LABEL_7:
    id v9 = (MSVABTestGenerator *)[v7 initWithProbabilityForOutcomeA:v6];
    outcomeGenerator = self->_outcomeGenerator;
    self->_outcomeGenerator = v9;
    goto LABEL_8;
  }
  if (v4 > 0.0)
  {
    double v8 = 1.0 - v4;
    id v7 = objc_alloc(MEMORY[0x263F54EB8]);
    *(float *)&double v6 = v8;
    goto LABEL_7;
  }
  outcomeGenerator = self->_outcomeGenerator;
  self->_outcomeGenerator = 0;
LABEL_8:

  v11 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138543362;
    v13 = self;
    _os_log_impl(&dword_21BB87000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ - Updated AB Test Outcome Generator", (uint8_t *)&v12, 0xCu);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trialExperiment, 0);
  objc_storeStrong((id *)&self->_outcomeGenerator, 0);
  objc_storeStrong((id *)&self->_environmentMonitor, 0);
  objc_destroyWeak((id *)&self->_playbackEngine);

  objc_storeStrong((id *)&self->_defaults, 0);
}

- (void)setTrialExperiment:(id)a3
{
}

- (void)setEnvironmentMonitor:(id)a3
{
}

- (ICEnvironmentMonitor)environmentMonitor
{
  return self->_environmentMonitor;
}

- (MPCPlaybackEngine)playbackEngine
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_playbackEngine);

  return (MPCPlaybackEngine *)WeakRetained;
}

- (void)setDefaults:(id)a3
{
}

- (int64_t)tierMatchingAudioAssetType:(int64_t)a3
{
  switch(a3)
  {
    case 0:
    case 1:
    case 2:
      int64_t result = [(MPCAudioAssetTypeSelector *)self prefersLowQualityStereo] ^ 1;
      break;
    case 3:
      int64_t result = 4;
      break;
    case 4:
      int64_t result = 2;
      break;
    case 5:
      int64_t result = 3;
      break;
    default:
      int64_t result = 1;
      break;
  }
  return result;
}

- (id)environmentDescription
{
  v25[4] = *MEMORY[0x263EF8340];
  uint64_t v3 = NSString;
  uint64_t v4 = [(MPCAudioAssetTypeSelector *)self environmentMonitor];
  uint64_t v5 = [v4 networkType];
  double v6 = @"Unknown";
  v24 = v4;
  if (v5 <= 99)
  {
    if ((unint64_t)(v5 - 1) >= 8) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  if (v5 > 1000)
  {
    switch(v5)
    {
      case 1001:
        double v6 = @"Bridged WiFi";
        break;
      case 2000:
        double v6 = @"Wired Ethernet";
        break;
      case 3000:
        double v6 = @"Other";
        break;
    }
  }
  else
  {
    switch(v5)
    {
      case 100:
LABEL_3:
        double v6 = @"Cellular";
        break;
      case 500:
        double v6 = @"Bluetooth";
        break;
      case 1000:
        double v6 = @"WiFi";
        break;
    }
  }
LABEL_4:
  v23 = [v3 stringWithFormat:@"Network: %@", v6];
  v25[0] = v23;
  id v7 = NSString;
  double v8 = NSNumber;
  id v9 = [(MPCAudioAssetTypeSelector *)self environmentMonitor];
  id v10 = objc_msgSend(v8, "numberWithBool:", objc_msgSend(v9, "isCurrentNetworkLinkExpensive"));
  v11 = [v7 stringWithFormat:@"Expensive: %@", v10];
  v25[1] = v11;
  int v12 = NSString;
  v13 = NSNumber;
  uint64_t v14 = [(MPCAudioAssetTypeSelector *)self environmentMonitor];
  v15 = objc_msgSend(v13, "numberWithBool:", objc_msgSend(v14, "isNetworkConstrained"));
  v16 = [v12 stringWithFormat:@"Constrained: %@", v15];
  v25[2] = v16;
  v17 = NSString;
  objc_super v18 = objc_msgSend(NSNumber, "numberWithBool:", -[MPCAudioAssetTypeSelector networkBandwidthIsHigh](self, "networkBandwidthIsHigh"));
  v19 = [v17 stringWithFormat:@"HighBandwidth: %@", v18];
  v25[3] = v19;
  v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:4];
  v21 = [v20 componentsJoinedByString:@" - "];

  return v21;
}

- (id)experimentDescription
{
  uint64_t v3 = [(MPCAudioAssetTypeSelector *)self trialExperiment];
  uint64_t v4 = [v3 treatmentID];

  if (v4)
  {
    uint64_t v5 = NSString;
    double v6 = [(MPCAudioAssetTypeSelector *)self trialExperiment];
    id v7 = [v6 experimentID];
    double v8 = [(MPCAudioAssetTypeSelector *)self trialExperiment];
    id v9 = [v8 treatmentID];
    id v10 = [(MPCAudioAssetTypeSelector *)self trialExperiment];
    v11 = [v10 deploymentID];
    int v12 = [v5 stringWithFormat:@"%@/%@/%@", v7, v9, v11];
  }
  else
  {
    int v12 = @"None";
  }

  return v12;
}

- (id)preferencesDescription
{
  v23[5] = *MEMORY[0x263EF8340];
  uint64_t v3 = NSString;
  v22 = objc_msgSend(NSNumber, "numberWithBool:", -[MPCAudioAssetTypeSelector prefersLowQualityStereo](self, "prefersLowQualityStereo"));
  v21 = [v3 stringWithFormat:@"LQStereo: %@", v22];
  v23[0] = v21;
  uint64_t v4 = NSString;
  v20 = objc_msgSend(NSNumber, "numberWithBool:", -[MPCAudioAssetTypeSelector prefersHighQualityStereo](self, "prefersHighQualityStereo"));
  v19 = [v4 stringWithFormat:@"HQStereo: %@", v20];
  v23[1] = v19;
  uint64_t v5 = NSString;
  double v6 = objc_msgSend(NSNumber, "numberWithBool:", -[MPCAudioAssetTypeSelector prefersLossless](self, "prefersLossless"));
  id v7 = [v5 stringWithFormat:@"Lossless: %@", v6];
  v23[2] = v7;
  double v8 = NSString;
  id v9 = objc_msgSend(NSNumber, "numberWithBool:", -[MPCAudioAssetTypeSelector prefersHighResolutionLossless](self, "prefersHighResolutionLossless"));
  id v10 = [v8 stringWithFormat:@"HRLossless: %@", v9];
  v23[3] = v10;
  v11 = NSString;
  int v12 = [(MPCAudioAssetTypeSelector *)self defaults];
  unint64_t v13 = [v12 spatialAudioPreference];
  if (v13 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Unknown preference:%ld", v13);
    uint64_t v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v14 = off_2643C3328[v13];
  }
  v15 = [v11 stringWithFormat:@"Spatial: %@", v14];
  v23[4] = v15;
  v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:5];
  v17 = [v16 componentsJoinedByString:@" - "];

  return v17;
}

- (id)descriptionForTiers:(unint64_t)a3
{
  v22[5] = *MEMORY[0x263EF8340];
  uint64_t v4 = NSString;
  v21 = [NSNumber numberWithBool:a3 & 1];
  v20 = [v4 stringWithFormat:@"LQStereo: %@", v21];
  v22[0] = v20;
  uint64_t v5 = NSString;
  v19 = [NSNumber numberWithBool:(a3 >> 1) & 1];
  double v6 = [v5 stringWithFormat:@"HQStereo: %@", v19];
  v22[1] = v6;
  id v7 = NSString;
  double v8 = [NSNumber numberWithBool:(a3 >> 2) & 1];
  id v9 = [v7 stringWithFormat:@"Lossless: %@", v8];
  v22[2] = v9;
  id v10 = NSString;
  v11 = [NSNumber numberWithBool:(a3 >> 3) & 1];
  int v12 = [v10 stringWithFormat:@"HighResLossless: %@", v11];
  v22[3] = v12;
  unint64_t v13 = NSString;
  uint64_t v14 = [NSNumber numberWithBool:(a3 >> 4) & 1];
  v15 = [v13 stringWithFormat:@"Spatial: %@", v14];
  v22[4] = v15;
  v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:5];
  v17 = [v16 componentsJoinedByString:@" - "];

  return v17;
}

- (id)descriptionForTraits:(unint64_t)a3
{
  unsigned int v3 = a3;
  v16[3] = *MEMORY[0x263EF8340];
  uint64_t v4 = NSString;
  uint64_t v5 = [NSNumber numberWithInt:(a3 >> 1) & 1];
  double v6 = [v4 stringWithFormat:@"Lossless: %@", v5];
  v16[0] = v6;
  id v7 = NSString;
  double v8 = [NSNumber numberWithInt:(v3 >> 2) & 1];
  id v9 = [v7 stringWithFormat:@"HRLossless: %@", v8];
  v16[1] = v9;
  id v10 = NSString;
  v11 = [NSNumber numberWithInt:(v3 >> 3) & 1];
  int v12 = [v10 stringWithFormat:@"Spatial: %@", v11];
  v16[2] = v12;
  unint64_t v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:3];
  uint64_t v14 = [v13 componentsJoinedByString:@" - "];

  return v14;
}

- (int64_t)spatialPreference
{
  v2 = [(MPCAudioAssetTypeSelector *)self defaults];
  int64_t v3 = [v2 spatialAudioPreference];

  return v3;
}

- (int64_t)maxResolution
{
  BOOL v3 = [(MPCAudioAssetTypeSelector *)self networkBandwidthIsHigh];
  uint64_t v4 = [(MPCAudioAssetTypeSelector *)self defaults];
  uint64_t v5 = v4;
  if (v3) {
    uint64_t v6 = [v4 preferredMusicHighBandwidthResolution];
  }
  else {
    uint64_t v6 = [v4 preferredMusicLowBandwidthResolution];
  }
  int64_t v7 = v6;

  int v8 = MSVDeviceSupportsLosslessMusic();
  if (v7 < 48000) {
    int v9 = 1;
  }
  else {
    int v9 = v8;
  }
  if (v9) {
    return v7;
  }
  else {
    return 256;
  }
}

- (BOOL)networkBandwidthIsHigh
{
  BOOL v3 = [(MPCAudioAssetTypeSelector *)self environmentMonitor];
  uint64_t v4 = [v3 networkType];

  if (ICEnvironmentNetworkTypeIsBluetooth())
  {
    LOBYTE(v5) = 0;
    return v5;
  }
  if (ICEnvironmentNetworkTypeIsWired())
  {
    LOBYTE(v5) = 1;
    return v5;
  }
  char IsWiFi = ICEnvironmentNetworkTypeIsWiFi();
  int64_t v7 = [(MPCAudioAssetTypeSelector *)self environmentMonitor];
  int v8 = v7;
  if (IsWiFi)
  {
LABEL_9:
    int v5 = [v8 isNetworkConstrained] ^ 1;

    return v5;
  }
  char v9 = [v7 isCurrentNetworkLinkExpensive];

  LOBYTE(v5) = 0;
  if ((v9 & 1) == 0 && v4 >= 3)
  {
    int v8 = [(MPCAudioAssetTypeSelector *)self environmentMonitor];
    goto LABEL_9;
  }
  return v5;
}

- (BOOL)prefersLowQualityStereo
{
  BOOL v3 = [(MPCAudioAssetTypeSelector *)self networkBandwidthIsHigh];
  uint64_t v4 = [(MPCAudioAssetTypeSelector *)self defaults];
  int v5 = v4;
  if (v3) {
    uint64_t v6 = [v4 preferredMusicHighBandwidthResolution];
  }
  else {
    uint64_t v6 = [v4 preferredMusicLowBandwidthResolution];
  }
  uint64_t v7 = v6;

  return v7 == 64;
}

- (BOOL)prefersHighQualityStereo
{
  BOOL v3 = [(MPCAudioAssetTypeSelector *)self networkBandwidthIsHigh];
  uint64_t v4 = [(MPCAudioAssetTypeSelector *)self defaults];
  int v5 = v4;
  if (v3) {
    uint64_t v6 = [v4 preferredMusicHighBandwidthResolution];
  }
  else {
    uint64_t v6 = [v4 preferredMusicLowBandwidthResolution];
  }
  uint64_t v7 = v6;

  return v7 == 256;
}

- (BOOL)prefersLossless
{
  if (!MSVDeviceSupportsLosslessMusic()) {
    return 0;
  }
  BOOL v3 = [(MPCAudioAssetTypeSelector *)self networkBandwidthIsHigh];
  uint64_t v4 = [(MPCAudioAssetTypeSelector *)self defaults];
  int v5 = v4;
  if (v3) {
    uint64_t v6 = [v4 preferredMusicHighBandwidthResolution];
  }
  else {
    uint64_t v6 = [v4 preferredMusicLowBandwidthResolution];
  }
  BOOL v7 = v6 > 47999;

  return v7;
}

- (BOOL)prefersHighResolutionLossless
{
  if (!MSVDeviceSupportsLosslessMusic()) {
    return 0;
  }
  BOOL v3 = [(MPCAudioAssetTypeSelector *)self networkBandwidthIsHigh];
  uint64_t v4 = [(MPCAudioAssetTypeSelector *)self defaults];
  int v5 = v4;
  if (v3) {
    uint64_t v6 = [v4 preferredMusicHighBandwidthResolution];
  }
  else {
    uint64_t v6 = [v4 preferredMusicLowBandwidthResolution];
  }
  BOOL v7 = v6 == 192000;

  return v7;
}

- (BOOL)prefersSpatialOverLossless
{
  if ([(MPCAudioAssetTypeSelector *)self spatialIsAutomatic]) {
    return 1;
  }

  return [(MPCAudioAssetTypeSelector *)self spatialIsAlwaysOn];
}

- (BOOL)prefersSpatialOverStereo:(id)a3
{
  id v4 = a3;
  if ([(MPCAudioAssetTypeSelector *)self spatialIsAlwaysOn]) {
    goto LABEL_5;
  }
  if (![(MPCAudioAssetTypeSelector *)self spatialIsOff])
  {
    if ([v4 type] != 1)
    {
      if (![v4 multiChannelSupport]
        || ([v4 isSpatializationEnabled] & 1) != 0
        || [v4 canStreamSpatial] && (objc_msgSend(v4, "canRenderSpatial") & 1) == 0)
      {
        BOOL v5 = [(MPCAudioAssetTypeSelector *)self spatialIsAutomatic];
        goto LABEL_6;
      }
      goto LABEL_3;
    }
LABEL_5:
    BOOL v5 = 1;
    goto LABEL_6;
  }
LABEL_3:
  BOOL v5 = 0;
LABEL_6:

  return v5;
}

- (BOOL)spatialIsAutomatic
{
  if (!MSVDeviceSupportsMultiChannelMusic()) {
    return 0;
  }
  BOOL v3 = [(MPCAudioAssetTypeSelector *)self defaults];
  BOOL v4 = [v3 spatialAudioPreference] == 2;

  return v4;
}

- (id)audioFormatMatchingAudioAssetType:(int64_t)a3 formats:(id)a4 route:(id)a5
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a5;
  id v10 = objc_opt_new();
  [v10 setFormat:0];
  [v10 setJustification:0];
  if (![v8 count])
  {
    [v10 setExplanation:@"No available audio formats"];
LABEL_22:
    id v22 = v10;
    goto LABEL_30;
  }
  v11 = [MEMORY[0x263F11D60] sharedCloudController];
  char v12 = [v11 isEnhancedAudioAvailable];

  if ((v12 & 1) == 0)
  {
    [v10 setExplanation:@"No enhanced audio available on this store front"];
    v21 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21BB87000, v21, OS_LOG_TYPE_DEFAULT, "[AL] - MPCAudioAssetTypeSelector - No enhanced audio available on this store front", buf, 2u);
    }

    goto LABEL_22;
  }
  unint64_t v13 = [(MPCAudioAssetTypeSelector *)self tierMatchingAudioAssetType:a3];
  if (v13 == 4)
  {
    if ([(MPCAudioAssetTypeSelector *)self prefersSpatialOverStereo:v9]) {
      unint64_t v13 = 4;
    }
    else {
      unint64_t v13 = 1;
    }
  }
  v36 = v9;
  v42[0] = MEMORY[0x263EF8330];
  v42[1] = 3221225472;
  v42[2] = __77__MPCAudioAssetTypeSelector_audioFormatMatchingAudioAssetType_formats_route___block_invoke;
  v42[3] = &__block_descriptor_40_e30_B16__0__MPCPlayerAudioFormat_8l;
  v42[4] = v13;
  uint64_t v14 = objc_msgSend(v8, "msv_firstWhere:", v42);
  if (!v14)
  {
    v41[0] = MEMORY[0x263EF8330];
    v41[1] = 3221225472;
    v41[2] = __77__MPCAudioAssetTypeSelector_audioFormatMatchingAudioAssetType_formats_route___block_invoke_2;
    v41[3] = &__block_descriptor_40_e30_B16__0__MPCPlayerAudioFormat_8l;
    unint64_t v13 = 1;
    v41[4] = 1;
    uint64_t v14 = objc_msgSend(v8, "msv_firstWhere:", v41);
    if (!v14)
    {
      uint64_t v14 = [v8 lastObject];
      unint64_t v13 = 1;
    }
  }
  v35 = (void *)v14;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v15 = v8;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v37 objects:v49 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = 0;
    uint64_t v19 = *(void *)v38;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v38 != v19) {
          objc_enumerationMutation(v15);
        }
        v18 |= 1 << [*(id *)(*((void *)&v37 + 1) + 8 * i) tier];
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v37 objects:v49 count:16];
    }
    while (v17);
  }
  else
  {
    uint64_t v18 = 0;
  }

  [v10 setFormat:v35];
  [v10 setExplanation:@"Audio format selection [from audio asset type & route]"];
  v47[0] = @"0.Environment";
  v23 = [(MPCAudioAssetTypeSelector *)self environmentDescription];
  v48[0] = v23;
  v47[1] = @"1.Formats";
  v24 = [(MPCAudioAssetTypeSelector *)self descriptionForTiers:v18];
  v48[1] = v24;
  v47[2] = @"2.Audio type";
  if ((unint64_t)(a3 - 1) > 4) {
    v25 = @"Unspecified";
  }
  else {
    v25 = off_2643C3300[a3 - 1];
  }
  id v9 = v36;
  v48[2] = v25;
  v47[3] = @"3.Route";
  v26 = [v36 humanDescription];
  v48[3] = v26;
  v47[4] = @"4.Matched tier";
  v27 = NSStringFromMPCPlayerAudioFormatTier(v13);
  v48[4] = v27;
  v47[5] = @"5.Outcome";
  v28 = [v35 humanDescription];
  v48[5] = v28;
  v29 = [NSDictionary dictionaryWithObjects:v48 forKeys:v47 count:6];
  [v10 setJustification:v29];

  v30 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    v31 = [v10 explanation];
    v32 = [v10 justification];
    *(_DWORD *)buf = 138543618;
    v44 = v31;
    __int16 v45 = 2114;
    v46 = v32;
    id v9 = v36;
    _os_log_impl(&dword_21BB87000, v30, OS_LOG_TYPE_DEFAULT, "[AL] - MPCAudioAssetTypeSelector - %{public}@: %{public}@", buf, 0x16u);
  }
  id v33 = v10;

LABEL_30:

  return v10;
}

BOOL __77__MPCAudioAssetTypeSelector_audioFormatMatchingAudioAssetType_formats_route___block_invoke(uint64_t a1, void *a2)
{
  return [a2 tier] == *(void *)(a1 + 32);
}

BOOL __77__MPCAudioAssetTypeSelector_audioFormatMatchingAudioAssetType_formats_route___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 tier] == *(void *)(a1 + 32);
}

- (id)preferredPlayerAudioFormatForItem:(id)a3 route:(id)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138543362;
    id v13 = v6;
    _os_log_impl(&dword_21BB87000, v8, OS_LOG_TYPE_DEFAULT, "[AL] - MPCAudioAssetTypeSelector - Starting audio format selection [from preferences & route] - item:%{public}@", (uint8_t *)&v12, 0xCu);
  }

  id v9 = [v6 availableSortedFormats];
  id v10 = [(MPCAudioAssetTypeSelector *)self preferredAudioFormatForAudioFormats:v9 route:v7];

  return v10;
}

- (id)preferredAudioFormatForAudioFormats:(id)a3 route:(id)a4
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_opt_new();
  [v8 setFormat:0];
  [v8 setExplanation:&stru_26CBCA930];
  [v8 setJustification:0];
  if (![v6 count])
  {
    [v8 setExplanation:@"No available audio formats"];
LABEL_15:
    id v18 = v8;
    goto LABEL_40;
  }
  id v9 = [MEMORY[0x263F11D60] sharedCloudController];
  char v10 = [v9 isEnhancedAudioAvailable];

  if ((v10 & 1) == 0)
  {
    [v8 setExplanation:@"No enhanced audio available on this store front"];
    uint64_t v17 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21BB87000, v17, OS_LOG_TYPE_DEFAULT, "[AL] - MPCAudioAssetTypeSelector - No enhanced audio available on this store front", buf, 2u);
    }

    goto LABEL_15;
  }
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v11 = v6;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v34 objects:v44 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = 0;
    uint64_t v15 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v35 != v15) {
          objc_enumerationMutation(v11);
        }
        v14 |= 1 << [*(id *)(*((void *)&v34 + 1) + 8 * i) tier];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v34 objects:v44 count:16];
    }
    while (v13);
  }
  else
  {
    uint64_t v14 = 0;
  }

  if (((v14 & 0x10) != 0 && (v14 & 0xC) != 0 || ((v14 & 0xC) == 0 ? (BOOL v19 = (v14 & 0x10) == 0) : (BOOL v19 = 1), !v19))
    && [(MPCAudioAssetTypeSelector *)self prefersSpatialOverStereo:v7])
  {
    uint64_t v20 = 4;
  }
  else if ((v14 & 8) != 0 {
         && [(MPCAudioAssetTypeSelector *)self prefersHighResolutionLossless])
  }
  {
    uint64_t v20 = 3;
  }
  else if ((v14 & 4) != 0 && [(MPCAudioAssetTypeSelector *)self prefersLossless])
  {
    uint64_t v20 = 2;
  }
  else if ((v14 & 2) != 0 && [(MPCAudioAssetTypeSelector *)self prefersHighQualityStereo])
  {
    uint64_t v20 = 1;
  }
  else
  {
    if (v14) {
      [(MPCAudioAssetTypeSelector *)self prefersLowQualityStereo];
    }
    uint64_t v20 = 0;
  }
  v33[0] = MEMORY[0x263EF8330];
  v33[1] = 3221225472;
  v33[2] = __71__MPCAudioAssetTypeSelector_preferredAudioFormatForAudioFormats_route___block_invoke;
  v33[3] = &__block_descriptor_40_e30_B16__0__MPCPlayerAudioFormat_8l;
  v33[4] = v20;
  v21 = objc_msgSend(v11, "msv_firstWhere:", v33);
  [v8 setFormat:v21];
  [v8 setExplanation:@"Audio format selection [from preferences & route]"];
  v42[0] = @"0.Environment";
  id v22 = [(MPCAudioAssetTypeSelector *)self environmentDescription];
  v43[0] = v22;
  v42[1] = @"1.Formats";
  v23 = [(MPCAudioAssetTypeSelector *)self descriptionForTiers:v14];
  v43[1] = v23;
  v42[2] = @"2.Preferences";
  v24 = [(MPCAudioAssetTypeSelector *)self preferencesDescription];
  v43[2] = v24;
  v42[3] = @"3.Route";
  v25 = [v7 humanDescription];
  v43[3] = v25;
  v42[4] = @"4.Outcome";
  v26 = [v21 humanDescription];
  v43[4] = v26;
  v27 = [NSDictionary dictionaryWithObjects:v43 forKeys:v42 count:5];
  [v8 setJustification:v27];

  v28 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    v29 = [v8 explanation];
    v30 = [v8 justification];
    *(_DWORD *)buf = 138543618;
    long long v39 = v29;
    __int16 v40 = 2114;
    v41 = v30;
    _os_log_impl(&dword_21BB87000, v28, OS_LOG_TYPE_DEFAULT, "[AL] - MPCAudioAssetTypeSelector - %{public}@: %{public}@", buf, 0x16u);
  }
  id v31 = v8;

LABEL_40:

  return v8;
}

BOOL __71__MPCAudioAssetTypeSelector_preferredAudioFormatForAudioFormats_route___block_invoke(uint64_t a1, void *a2)
{
  return [a2 tier] == *(void *)(a1 + 32);
}

- (id)preferredAudioAssetTypeForSongWithTrait:(unint64_t)a3 isStartItem:(BOOL)a4
{
  BOOL v4 = a4;
  void v25[5] = *MEMORY[0x263EF8340];
  id v7 = objc_opt_new();
  id v8 = [MEMORY[0x263F11D60] sharedCloudController];
  char v9 = [v8 isEnhancedAudioAvailable];

  if (v9)
  {
    BOOL v10 = [(MPCAudioAssetTypeSelector *)self prefersSpatialOverLossless];
    if ((a3 & 8) != 0 && v10)
    {
      int64_t v11 = 3;
    }
    else if ((a3 & 4) != 0 {
           && [(MPCAudioAssetTypeSelector *)self prefersHighResolutionLossless])
    }
    {
      int64_t v11 = 5;
    }
    else if ((a3 & 2) != 0 && [(MPCAudioAssetTypeSelector *)self prefersLossless])
    {
      int64_t v11 = 4;
    }
    else
    {
      int64_t v11 = [(MPCAudioAssetTypeSelector *)self nextAssetTypeOutcomeWithIsStartItem:v4];
    }
    [v7 setType:v11];
    [v7 setExplanation:@"Audio type selected from traits & preferences"];
    v24[0] = @"0.Environment";
    uint64_t v13 = [(MPCAudioAssetTypeSelector *)self environmentDescription];
    v25[0] = v13;
    v24[1] = @"1.Traits";
    uint64_t v14 = [(MPCAudioAssetTypeSelector *)self descriptionForTraits:a3];
    v25[1] = v14;
    v24[2] = @"2.Preferences";
    uint64_t v15 = [(MPCAudioAssetTypeSelector *)self preferencesDescription];
    v25[2] = v15;
    v24[3] = @"3.Experiment";
    uint64_t v16 = [(MPCAudioAssetTypeSelector *)self experimentDescription];
    v25[3] = v16;
    v24[4] = @"4.Outcome";
    if ((unint64_t)(v11 - 1) > 4) {
      uint64_t v17 = @"Unspecified";
    }
    else {
      uint64_t v17 = off_2643C3300[v11 - 1];
    }
    v25[4] = v17;
    id v18 = [NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:5];
    [v7 setJustification:v18];

    BOOL v19 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v20 = [v7 justification];
      int v22 = 138543362;
      v23 = v20;
      _os_log_impl(&dword_21BB87000, v19, OS_LOG_TYPE_DEFAULT, "[AL] - MPCAudioAssetTypeSelector - Audio type selection [from preferences]: %{public}@", (uint8_t *)&v22, 0xCu);
    }
  }
  else
  {
    uint64_t v12 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v22) = 0;
      _os_log_impl(&dword_21BB87000, v12, OS_LOG_TYPE_DEFAULT, "[AL] - MPCAudioAssetTypeSelector - No enhanced audio available on this store front", (uint8_t *)&v22, 2u);
    }

    objc_msgSend(v7, "setType:", -[MPCAudioAssetTypeSelector nextAssetTypeOutcomeWithIsStartItem:](self, "nextAssetTypeOutcomeWithIsStartItem:", v4));
    [v7 setExplanation:@"Enhanced audio is not available - type selected randomly"];
    [v7 setJustification:0];
  }

  return v7;
}

- (int64_t)nextAssetTypeOutcomeWithIsStartItem:(BOOL)a3
{
  BOOL v5 = [(MPCAudioAssetTypeSelector *)self outcomeGenerator];

  if (!v5) {
    return 1;
  }
  id v6 = [(MPCAudioAssetTypeSelector *)self outcomeGenerator];
  id v7 = v6;
  if (a3) {
    uint64_t v8 = [v6 nextOutcome];
  }
  else {
    uint64_t v8 = [v6 lastOutcome];
  }
  uint64_t v10 = v8;

  if (v10) {
    return 2;
  }
  else {
    return 1;
  }
}

- (id)preferredAudioAssetTypeForSongWithTrait:(unint64_t)a3 isStartItem:(BOOL)a4 supportsVocalAttenuation:(BOOL)a5
{
  BOOL v5 = a4;
  if (a5
    && ([(MPCAudioAssetTypeSelector *)self playbackEngine],
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        int v9 = [v8 isVocalAttenuationEnabled],
        v8,
        v9))
  {
    uint64_t v10 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v13 = 0;
      _os_log_impl(&dword_21BB87000, v10, OS_LOG_TYPE_DEFAULT, "[AL] - MPCAudioAssetTypeSelector - Vocal attenuation is active and item supports it", v13, 2u);
    }

    int64_t v11 = objc_opt_new();
    [v11 setType:1];
    [v11 setExplanation:@"Vocal attenuation is active and item supports it"];
  }
  else
  {
    int64_t v11 = [(MPCAudioAssetTypeSelector *)self preferredAudioAssetTypeForSongWithTrait:a3 isStartItem:v5];
  }

  return v11;
}

- (id)preferredAudioAssetTypeForItem:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (([v4 isAlwaysLive] & 1) != 0 || objc_msgSend(v4, "isRadioStreamPlayback"))
  {
    BOOL v5 = objc_opt_new();
    [v5 setType:0];
    id v6 = @"Live or radio streaming playback";
LABEL_4:
    [v5 setExplanation:v6];
    goto LABEL_5;
  }
  uint64_t v8 = [v4 genericObject];
  int v9 = [v8 flattenedGenericObject];
  uint64_t v10 = [v9 type];

  if (v10 != 1)
  {
    BOOL v5 = objc_opt_new();
    [v5 setType:0];
    id v6 = @"Object type is not a song";
    goto LABEL_4;
  }
  int64_t v11 = [v4 genericObject];
  uint64_t v12 = [v11 flattenedGenericObject];
  uint64_t v13 = [v12 song];
  uint64_t v14 = [v13 traits];

  if (MSVDeviceIsWatch())
  {
    BOOL v5 = objc_opt_new();
    [v5 setType:1];
    id v6 = @"Playback on watch only supports CRABS";
    goto LABEL_4;
  }
  if (!v14 && [v4 hasVideo])
  {
    BOOL v5 = objc_opt_new();
    [v5 setType:2];
    id v6 = @"Object is a video without traits";
    goto LABEL_4;
  }
  if ([v4 prioritizeStartupOverQuality])
  {
    BOOL v5 = objc_opt_new();
    [v5 setType:1];
    id v6 = @"Client requested to prioritize startup over quality";
    goto LABEL_4;
  }
  uint64_t v15 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16[0] = 67109378;
    v16[1] = [v4 supportsVocalAttenuation];
    __int16 v17 = 2114;
    id v18 = v4;
    _os_log_impl(&dword_21BB87000, v15, OS_LOG_TYPE_DEFAULT, "[AL] - MPCAudioAssetTypeSelector - Starting Audio type selection [from preferences - VA Supported: %{BOOL}u] - item:%{public}@", (uint8_t *)v16, 0x12u);
  }

  BOOL v5 = -[MPCAudioAssetTypeSelector preferredAudioAssetTypeForSongWithTrait:isStartItem:supportsVocalAttenuation:](self, "preferredAudioAssetTypeForSongWithTrait:isStartItem:supportsVocalAttenuation:", v14, [v4 isStartItem], objc_msgSend(v4, "supportsVocalAttenuation"));
LABEL_5:

  return v5;
}

- (unint64_t)audioFormatPreference
{
  if ([(MPCAudioAssetTypeSelector *)self prefersHighResolutionLossless])
  {
    unint64_t v3 = 8;
  }
  else if ([(MPCAudioAssetTypeSelector *)self prefersLossless])
  {
    unint64_t v3 = 4;
  }
  else if ([(MPCAudioAssetTypeSelector *)self prefersHighQualityStereo])
  {
    unint64_t v3 = 2;
  }
  else
  {
    unint64_t v3 = [(MPCAudioAssetTypeSelector *)self prefersLowQualityStereo];
  }
  if ([(MPCAudioAssetTypeSelector *)self spatialIsOff]) {
    return v3;
  }
  else {
    return v3 | 0x10;
  }
}

- (void)updateProbabilityOfProgressiveDownloadAssets:(float)a3
{
  outcomeGenerator = self->_outcomeGenerator;
  if (!outcomeGenerator
    || ([(MSVABTestGenerator *)outcomeGenerator probabilityForOutcomeA], v6 != a3))
  {
    id v7 = objc_alloc(MEMORY[0x263F54EB8]);
    *(float *)&double v8 = a3;
    int v9 = (MSVABTestGenerator *)[v7 initWithProbabilityForOutcomeA:v8];
    uint64_t v10 = self->_outcomeGenerator;
    self->_outcomeGenerator = v9;
  }
}

- (void)handleExperimentDidReceiveUpdateNotification:(id)a3
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __74__MPCAudioAssetTypeSelector_handleExperimentDidReceiveUpdateNotification___block_invoke;
  block[3] = &unk_2643C5FC8;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __74__MPCAudioAssetTypeSelector_handleExperimentDidReceiveUpdateNotification___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  [*(id *)(*(void *)(a1 + 32) + 40) refresh];
  v2 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(v3 + 40);
    int v6 = 138543618;
    uint64_t v7 = v3;
    __int16 v8 = 2114;
    uint64_t v9 = v4;
    _os_log_impl(&dword_21BB87000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ - Did update experiment: %{public}@", (uint8_t *)&v6, 0x16u);
  }

  return [*(id *)(a1 + 32) updateOutcomeGenerator];
}

@end