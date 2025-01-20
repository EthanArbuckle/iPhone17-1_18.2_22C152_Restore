@interface MPCModelMediaClipAVItem
+ (id)requiredMediaClipProperties;
- (BOOL)_allowsCellularPlayback;
- (BOOL)_isVideoAsset;
- (BOOL)allowsAirPlayFromCloud;
- (BOOL)allowsExternalPlayback;
- (BOOL)isAssetURLValid;
- (BOOL)isStreamable;
- (BOOL)isValidPlayerSubstituteForItem:(id)a3;
- (BOOL)prefersSeekOverSkip;
- (BOOL)supportsRateChange;
- (MPCModelMediaClipAVItem)initWithMediaClip:(id)a3;
- (MPModelMediaClip)mediaClip;
- (double)durationFromExternalMetadata;
- (id)_currentPreferredStaticAsset;
- (id)artworkCatalogBlock;
- (id)description;
- (id)mainTitle;
- (id)modelGenericObject;
- (id)rtcReportingServiceIdentifier;
- (void)_applyLoudnessInfo;
- (void)loadAssetAndPlayerItemWithTask:(id)a3 completion:(id)a4;
- (void)reevaluateType;
@end

@implementation MPCModelMediaClipAVItem

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaClip, 0);

  objc_storeStrong((id *)&self->_modelGenericObject, 0);
}

- (MPModelMediaClip)mediaClip
{
  return self->_mediaClip;
}

- (BOOL)_isVideoAsset
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  [(MPModelMediaClip *)self->_mediaClip staticAssets];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        if (objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * i), "mediaType", (void)v7) == 2)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (id)_currentPreferredStaticAsset
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  uint64_t v3 = [MEMORY[0x263F89110] sharedMonitor];
  uint64_t v4 = [v3 networkType];

  if (CFPreferencesGetAppBooleanValue(@"AlwaysUse64kbpsQuality", @"com.apple.mobileipod", 0)) {
    goto LABEL_2;
  }
  if (CFPreferencesGetAppBooleanValue(@"AlwaysUse256kbpsQuality", @"com.apple.mobileipod", 0)) {
    goto LABEL_4;
  }
  if ((ICEnvironmentNetworkTypeIsBluetooth() & 1) == 0)
  {
    if (![(MPCModelMediaClipAVItem *)self _isVideoAsset])
    {
      if ((ICEnvironmentNetworkTypeIsWired() & 1) == 0)
      {
        if (ICEnvironmentNetworkTypeIsWiFi())
        {
          v24 = [MEMORY[0x263F89110] sharedMonitor];
          char v25 = [v24 isNetworkConstrained];

          if (v25) {
            goto LABEL_2;
          }
        }
        else
        {
          v27 = [MEMORY[0x263F12178] standardUserDefaults];
          if ([v27 preferredVideoLowBandwidthResolution] >= 256)
          {

            if (v4 <= 2) {
              goto LABEL_2;
            }
          }
          else
          {
            v28 = [MEMORY[0x263F89110] sharedMonitor];
            char v29 = [v28 isCurrentNetworkLinkExpensive];

            if ((v29 & 1) != 0 || v4 < 3) {
              goto LABEL_2;
            }
          }
          v30 = [MEMORY[0x263F89110] sharedMonitor];
          int v31 = [v30 isNetworkConstrained];

          if (v31) {
            goto LABEL_2;
          }
        }
      }
LABEL_4:
      id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
LABEL_5:
      [v5 addObject:&unk_26CC18DB0];
      [v5 addObject:&unk_26CC18DC8];
      goto LABEL_6;
    }
    if ((ICEnvironmentNetworkTypeIsWiFi() & 1) != 0
      || ICEnvironmentNetworkTypeIsWired()
      || v4 >= 3
      && ([MEMORY[0x263F89110] sharedMonitor],
          v18 = objc_claimAutoreleasedReturnValue(),
          char v19 = [v18 isCurrentNetworkLinkExpensive],
          v18,
          (v19 & 1) == 0))
    {
      v22 = [MEMORY[0x263F12178] standardUserDefaults];
      uint64_t v23 = [v22 preferredVideoHighBandwidthResolution];
    }
    else
    {
      v20 = [MEMORY[0x263F12178] standardUserDefaults];
      uint64_t v21 = [v20 preferredVideoLowBandwidthResolution];

      if (v21 < 1) {
        goto LABEL_2;
      }
      v22 = [MEMORY[0x263F12178] standardUserDefaults];
      uint64_t v23 = [v22 preferredVideoLowBandwidthResolution];
    }
    uint64_t v26 = v23;

    if (v26)
    {
      id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
      if (v26 != 1000000) {
        goto LABEL_6;
      }
      goto LABEL_5;
    }
  }
LABEL_2:
  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
LABEL_6:
  [v5 addObject:&unk_26CC18DE0];
  v6 = [(MPModelMediaClip *)self->_mediaClip staticAssets];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (!v7) {
    goto LABEL_18;
  }
  uint64_t v8 = v7;
  v32 = 0;
  uint64_t v9 = *(void *)v34;
  uint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
  do
  {
    for (uint64_t i = 0; i != v8; ++i)
    {
      if (*(void *)v34 != v9) {
        objc_enumerationMutation(v6);
      }
      uint64_t v12 = *(void **)(*((void *)&v33 + 1) + 8 * i);
      v13 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v12, "flavorType"));
      uint64_t v14 = [v5 indexOfObject:v13];

      if (v14 != 0x7FFFFFFFFFFFFFFFLL && (v10 == 0x7FFFFFFFFFFFFFFFLL || v14 < v10))
      {
        id v15 = v12;

        v32 = v15;
        uint64_t v10 = v14;
      }
    }
    uint64_t v8 = [v6 countByEnumeratingWithState:&v33 objects:v37 count:16];
  }
  while (v8);
  v16 = v32;
  if (!v32)
  {
LABEL_18:
    v16 = [v6 firstObject];
  }

  return v16;
}

- (void)_applyLoudnessInfo
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  if ([(MPCModelMediaClipAVItem *)self isAssetLoaded])
  {
    uint64_t v3 = [(MPCModelMediaClipAVItem *)self asset];
    uint64_t v4 = [v3 statusOfValueForKey:@"tracks" error:0];

    if (v4 == 2)
    {
      uint64_t v5 = *MEMORY[0x263F28E88];
      id v6 = objc_alloc_init(MEMORY[0x263EFF9A0]);
      uint64_t v7 = v6;
      if (v5) {
        [v6 setObject:v5 forKey:*MEMORY[0x263F28E68]];
      }
      uint64_t v8 = [(MPCModelMediaClipAVItem *)self playerItem];
      uint64_t v9 = [v8 tracks];
      long long v14 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v15;
        do
        {
          uint64_t v13 = 0;
          do
          {
            if (*(void *)v15 != v12) {
              objc_enumerationMutation(v9);
            }
            [*(id *)(*((void *)&v14 + 1) + 8 * v13++) setLoudnessInfo:v7];
          }
          while (v11 != v13);
          uint64_t v11 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
        }
        while (v11);
      }
    }
  }
}

- (BOOL)_allowsCellularPlayback
{
  BOOL v2 = [(MPCModelMediaClipAVItem *)self _isVideoAsset];
  uint64_t v3 = [MEMORY[0x263F12178] standardUserDefaults];
  uint64_t v4 = v3;
  if (v2) {
    uint64_t v5 = [v3 preferredVideoLowBandwidthResolution];
  }
  else {
    uint64_t v5 = [v3 preferredMusicLowBandwidthResolution];
  }
  uint64_t v6 = v5;

  return v6 > 0;
}

- (id)rtcReportingServiceIdentifier
{
  return @"app.music.media-clip";
}

- (id)artworkCatalogBlock
{
  BOOL v2 = self->_mediaClip;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __46__MPCModelMediaClipAVItem_artworkCatalogBlock__block_invoke;
  aBlock[3] = &unk_2643C5EC0;
  uint64_t v7 = v2;
  uint64_t v3 = v2;
  uint64_t v4 = _Block_copy(aBlock);

  return v4;
}

uint64_t __46__MPCModelMediaClipAVItem_artworkCatalogBlock__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) previewArtworkCatalog];
}

- (BOOL)allowsExternalPlayback
{
  return 1;
}

- (BOOL)allowsAirPlayFromCloud
{
  return 1;
}

- (BOOL)supportsRateChange
{
  return 0;
}

- (void)reevaluateType
{
  v3.receiver = self;
  v3.super_class = (Class)MPCModelMediaClipAVItem;
  [(MPCModelMediaClipAVItem *)&v3 reevaluateType];
  [(MPCModelMediaClipAVItem *)self _applyLoudnessInfo];
}

- (BOOL)prefersSeekOverSkip
{
  return 1;
}

- (id)modelGenericObject
{
  modelGenericObject = self->_modelGenericObject;
  if (!modelGenericObject)
  {
    id v4 = objc_alloc(MEMORY[0x263F11EE0]);
    uint64_t v5 = [MEMORY[0x263F11DB0] emptyIdentifierSet];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __45__MPCModelMediaClipAVItem_modelGenericObject__block_invoke;
    v9[3] = &unk_2643C5DF8;
    v9[4] = self;
    uint64_t v6 = (MPModelGenericObject *)[v4 initWithIdentifiers:v5 block:v9];
    uint64_t v7 = self->_modelGenericObject;
    self->_modelGenericObject = v6;

    modelGenericObject = self->_modelGenericObject;
  }

  return modelGenericObject;
}

uint64_t __45__MPCModelMediaClipAVItem_modelGenericObject__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setMediaClip:*(void *)(*(void *)(a1 + 32) + 536)];
}

- (id)mainTitle
{
  return (id)[(MPModelMediaClip *)self->_mediaClip title];
}

- (void)loadAssetAndPlayerItemWithTask:(id)a3 completion:(id)a4
{
  v22 = (void (**)(id, uint64_t, void))a4;
  uint64_t v5 = [MEMORY[0x263F89110] sharedMonitor];
  [v5 networkType];

  BOOL v6 = [(MPCModelMediaClipAVItem *)self _allowsCellularPlayback];
  int IsCellular = ICEnvironmentNetworkTypeIsCellular();
  if ((ICEnvironmentNetworkTypeIsWiFi() & 1) != 0
    || (int IsWired = ICEnvironmentNetworkTypeIsWired(), IsCellular ^ 1 | v6)
    || IsWired)
  {
    uint64_t v9 = [(MPCModelMediaClipAVItem *)self _currentPreferredStaticAsset];
    if (v9)
    {
      id v10 = objc_alloc_init(MEMORY[0x263EFF9A0]);
      uint64_t v11 = [NSNumber numberWithBool:v6];
      [v10 setObject:v11 forKey:*MEMORY[0x263EFA1D0]];

      id v12 = objc_alloc_init(MEMORY[0x263EFF9A0]);
      uint64_t v13 = [(MPCModelMediaClipAVItem *)self rtcReportingServiceIdentifier];
      if (v13) {
        [v12 setObject:v13 forKey:*MEMORY[0x263EFA200]];
      }
      [v10 setObject:v12 forKey:*MEMORY[0x263EFA1F8]];
      [v10 setObject:&unk_26CC18D98 forKeyedSubscript:*MEMORY[0x263EFA2B8]];
      long long v14 = (void *)MEMORY[0x263EFA8D0];
      long long v15 = [v9 url];
      long long v16 = [v14 URLAssetWithURL:v15 options:v10];
      uint64_t v17 = (int)*MEMORY[0x263F12360];
      v18 = *(Class *)((char *)&self->super.super.isa + v17);
      *(Class *)((char *)&self->super.super.isa + v17) = v16;

      uint64_t v19 = [MEMORY[0x263EFA800] playerItemWithAsset:*(Class *)((char *)&self->super.super.isa + v17)];
      [v19 setAudioTimePitchAlgorithm:*MEMORY[0x263EF95E0]];
      [(MPCModelMediaClipAVItem *)self setPlayerItem:v19];
    }
  }
  uint64_t v20 = (int)*MEMORY[0x263F12368];
  uint64_t v21 = *(uint64_t *)((char *)&self->super.super.isa + v20);
  if (!v21)
  {
    [(MPCModelMediaClipAVItem *)self setItemError:0];
    uint64_t v21 = *(uint64_t *)((char *)&self->super.super.isa + v20);
  }
  v22[2](v22, v21, 0);
}

- (BOOL)isValidPlayerSubstituteForItem:(id)a3
{
  id v4 = (MPCModelMediaClipAVItem *)a3;
  if (self == v4)
  {
    BOOL v6 = 1;
  }
  else
  {
    uint64_t v5 = objc_opt_class();
    if (v5 == objc_opt_class())
    {
      mediaClip = self->_mediaClip;
      uint64_t v8 = [(MPCModelMediaClipAVItem *)v4 mediaClip];
      BOOL v6 = mediaClip == v8;
    }
    else
    {
      BOOL v6 = 0;
    }
  }

  return v6;
}

- (BOOL)isStreamable
{
  return 1;
}

- (BOOL)isAssetURLValid
{
  objc_super v3 = [MEMORY[0x263F89110] sharedMonitor];
  [v3 networkType];

  if (ICEnvironmentNetworkTypeIsWiFi() & 1) != 0 || (ICEnvironmentNetworkTypeIsWired())
  {
    LOBYTE(IsCellular) = 1;
  }
  else
  {
    int IsCellular = ICEnvironmentNetworkTypeIsCellular();
    if (IsCellular)
    {
      LOBYTE(IsCellular) = [(MPCModelMediaClipAVItem *)self _allowsCellularPlayback];
    }
  }
  return IsCellular;
}

- (double)durationFromExternalMetadata
{
  BOOL v2 = [(MPModelMediaClip *)self->_mediaClip staticAssets];
  objc_super v3 = [v2 firstObject];
  [v3 duration];
  double v5 = v4;

  return v5;
}

- (id)description
{
  objc_super v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)MPCModelMediaClipAVItem;
  double v4 = [(MPCModelMediaClipAVItem *)&v8 description];
  double v5 = [(MPCModelMediaClipAVItem *)self mainTitle];
  BOOL v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (MPCModelMediaClipAVItem)initWithMediaClip:(id)a3
{
  id v5 = a3;
  BOOL v6 = [(MPCModelMediaClipAVItem *)self init];
  uint64_t v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_mediaClip, a3);
  }

  return v7;
}

+ (id)requiredMediaClipProperties
{
  v16[2] = *MEMORY[0x263EF8340];
  id v2 = objc_alloc(MEMORY[0x263F12180]);
  uint64_t v3 = *MEMORY[0x263F115A0];
  v16[0] = *MEMORY[0x263F115A8];
  v16[1] = v3;
  double v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:2];
  uint64_t v14 = *MEMORY[0x263F11A38];
  id v5 = (void *)MEMORY[0x263F12180];
  uint64_t v6 = *MEMORY[0x263F118C0];
  v13[0] = *MEMORY[0x263F118B0];
  v13[1] = v6;
  uint64_t v7 = *MEMORY[0x263F118B8];
  v13[2] = *MEMORY[0x263F118C8];
  v13[3] = v7;
  objc_super v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:4];
  uint64_t v9 = [v5 propertySetWithProperties:v8];
  long long v15 = v9;
  id v10 = [NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
  uint64_t v11 = (void *)[v2 initWithProperties:v4 relationships:v10];

  return v11;
}

@end