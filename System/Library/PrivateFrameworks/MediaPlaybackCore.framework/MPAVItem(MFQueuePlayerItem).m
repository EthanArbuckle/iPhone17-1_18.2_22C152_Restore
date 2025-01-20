@interface MPAVItem(MFQueuePlayerItem)
- (BOOL)_isInContiguousAlbumWith:()MFQueuePlayerItem;
- (BOOL)isMovieOrTVShow;
- (BOOL)isSpokenAudio;
- (BOOL)isVideoContent;
- (BOOL)shouldPerformGaplessTransitionWith:()MFQueuePlayerItem;
- (double)effectivePlaybackStartTime;
- (double)playbackStartTime;
- (double)playbackStartTimeOverride;
- (double)time;
- (id)activeFormat;
- (id)avPlayerItem;
- (id)gaplessParameters;
- (id)playbackRequestUserIdentity;
- (uint64_t)hasLoadableAsset;
- (uint64_t)isFullyDownloaded;
- (uint64_t)playerItemType;
- (uint64_t)prepareForReuse;
- (uint64_t)reset;
- (uint64_t)setCurrentItemTransition:()MFQueuePlayerItem;
- (uint64_t)shouldPerformOverlappingTransitionWith:()MFQueuePlayerItem;
- (void)setPlaybackStartTimeOverride:()MFQueuePlayerItem;
@end

@implementation MPAVItem(MFQueuePlayerItem)

- (double)effectivePlaybackStartTime
{
  v1 = [a1 initialPlaybackStartTime];
  [v1 doubleValue];
  double v3 = v2;

  return v3;
}

- (uint64_t)hasLoadableAsset
{
  return [a1 isPlaceholder] ^ 1;
}

- (BOOL)isMovieOrTVShow
{
  return ([a1 mediaType] & 0x300) != 0;
}

- (BOOL)isSpokenAudio
{
  return [a1 mediaType] == 2 || objc_msgSend(a1, "mediaType") == 1024;
}

- (uint64_t)setCurrentItemTransition:()MFQueuePlayerItem
{
  if ((unint64_t)(a3 + 1) > 6) {
    uint64_t v3 = -2;
  }
  else {
    uint64_t v3 = qword_21BEF18D8[a3 + 1];
  }
  return [a1 setLastChangeDirection:v3];
}

- (double)time
{
  if (![a1 isAssetLoaded] || !objc_msgSend(a1, "canUseLoadedAsset")) {
    goto LABEL_11;
  }
  uint64_t v2 = (int)*MEMORY[0x263F12368];
  id v3 = *(id *)&a1[v2];
  v4 = [v3 contentItemID];
  v5 = [a1 contentItemID];
  if (![v4 isEqualToString:v5])
  {

    goto LABEL_10;
  }
  char v6 = [a1 canReusePlayerItem];

  if (v6) {
    goto LABEL_10;
  }
  if (!v3)
  {
    uint64_t v12 = 0;
    uint64_t v13 = 0;
    uint64_t v14 = 0;
    goto LABEL_10;
  }
  [v3 currentTime];
  if ((v13 & 0x100000000) == 0)
  {
LABEL_10:

LABEL_11:
    [a1 effectivePlaybackStartTime];
    return v8;
  }
  v7 = *(void **)&a1[v2];
  if (v7) {
    [v7 currentTime];
  }
  else {
    memset(&v11, 0, sizeof(v11));
  }
  double Seconds = CMTimeGetSeconds(&v11);

  return Seconds;
}

- (uint64_t)playerItemType
{
  return 2;
}

- (id)playbackRequestUserIdentity
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v2 = [a1 playbackRequestUserIdentity];
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

- (BOOL)_isInContiguousAlbumWith:()MFQueuePlayerItem
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    id v5 = v4;
    char v6 = [a1 modelGenericObject];
    v7 = [v6 flattenedGenericObject];

    double v8 = [v5 modelGenericObject];
    v9 = [v8 flattenedGenericObject];

    if ([v7 type] == 1 && objc_msgSend(v9, "type") == 1)
    {
      v10 = [v7 song];
      CMTime v11 = [v9 song];
      uint64_t v12 = [v11 album];
      uint64_t v13 = [v12 identifiers];
      v21 = v10;
      uint64_t v14 = [v10 album];
      v15 = [v14 identifiers];
      LODWORD(v10) = [v13 intersectsSet:v15];

      if (v10)
      {
        uint64_t v16 = [v11 discNumber];
        v17 = v21;
        if (v16 == [v21 discNumber])
        {
          uint64_t v18 = [v11 trackNumber];
          BOOL v19 = v18 == [v21 trackNumber] + 1;
        }
        else
        {
          BOOL v19 = 0;
        }
      }
      else
      {
        BOOL v19 = 0;
        v17 = v21;
      }
    }
    else
    {
      BOOL v19 = 0;
    }
  }
  else
  {
    BOOL v19 = 0;
  }

  return v19;
}

- (id)activeFormat
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v2 = [a1 activeFormat];
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

- (uint64_t)shouldPerformOverlappingTransitionWith:()MFQueuePlayerItem
{
  id v4 = a3;
  if (!_os_feature_enabled_impl()
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    || ([a1 isConfiguredForVocalAttenuation] & 1) != 0
    || ([v4 isConfiguredForVocalAttenuation] & 1) != 0
    || ([a1 isVideoContent] & 1) != 0
    || ([v4 isVideoContent] & 1) != 0)
  {
    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v5 = [a1 _isInContiguousAlbumWith:v4] ^ 1;
  }

  return v5;
}

- (BOOL)shouldPerformGaplessTransitionWith:()MFQueuePlayerItem
{
  if (!objc_msgSend(a1, "_isInContiguousAlbumWith:")) {
    return 0;
  }
  uint64_t v2 = [a1 gaplessParameters];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)gaplessParameters
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v2 = [a1 gaplessInfo];
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

- (uint64_t)prepareForReuse
{
  objc_opt_class();
  uint64_t result = objc_opt_isKindOfClass();
  if (result)
  {
    return [a1 resetPlaybackStartTimeForReuse];
  }
  return result;
}

- (uint64_t)reset
{
  uint64_t result = [a1 isPreloadedAsset];
  if ((result & 1) == 0)
  {
    return [a1 _clearAssetNow];
  }
  return result;
}

- (double)playbackStartTime
{
  v1 = [a1 playbackInfoStartTime];
  [v1 doubleValue];
  double v3 = v2;

  return v3;
}

- (void)setPlaybackStartTimeOverride:()MFQueuePlayerItem
{
  objc_msgSend(NSNumber, "numberWithDouble:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [a1 setInitialPlaybackStartTimeOverride:v2];
}

- (double)playbackStartTimeOverride
{
  v1 = [a1 initialPlaybackStartTimeOverride];
  [v1 doubleValue];
  double v3 = v2;

  return v3;
}

- (BOOL)isVideoContent
{
  return [a1 type] == 2;
}

- (uint64_t)isFullyDownloaded
{
  if (![a1 isAssetLoaded]) {
    return 0;
  }
  double v2 = [a1 asset];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v3 = [a1 asset];
    id v4 = [v3 URL];
    uint64_t v5 = [v4 isFileURL];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (id)avPlayerItem
{
  return *(id *)(a1 + (int)*MEMORY[0x263F12368]);
}

@end