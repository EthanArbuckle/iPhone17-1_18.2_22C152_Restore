@interface AVPlayerItemTrack
+ (AVPlayerItemTrack)playerItemTrackWithFigPlaybackItem:(OpaqueFigPlaybackItem *)a3 readyForInspection:(BOOL)a4 trackID:(int)a5 asset:(id)a6 playerItem:(id)a7;
- (AVAssetTrack)assetTrack;
- (BOOL)_figPlaybackItemIsReadyForInspection;
- (BOOL)disableColorMatching;
- (BOOL)isEnabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)mutesHaptics;
- (BOOL)willTrimShortDurationAudioSamples;
- (NSArray)outputs;
- (float)currentVideoFrameRate;
- (float)hapticVolume;
- (id)_initWithFigPlaybackItem:(OpaqueFigPlaybackItem *)a3 readyForInspection:(BOOL)a4 trackID:(int)a5 asset:(id)a6 playerItem:(id)a7;
- (id)_playerItem;
- (id)_weakReferenceToPlayerItem;
- (id)description;
- (id)effectiveLoudnessInfo;
- (id)fallbackTrack;
- (id)loudnessInfo;
- (id)videoEnhancementFilterOptions;
- (int)effectiveEQPreset;
- (int)trackID;
- (int64_t)activeHapticChannelIndex;
- (unint64_t)hash;
- (void)_attachToFigPlaybackItemOfPlayerItem:(id)a3;
- (void)_respondToFigPlaybackItemBecomingReadyForInpection;
- (void)_transferActiveHapticChannelIndexToFig;
- (void)_transferDisableColorMatchingToFig;
- (void)_transferEnabledToFig;
- (void)_transferHapticVolumeToFig;
- (void)_transferLoudnessInfoToFig;
- (void)_transferMutesHapticsToFig;
- (void)_transferVideoEnhancementOptionsToFig;
- (void)_updateTrackExtractionIDArrayProperty;
- (void)addOutput:(id)a3;
- (void)dealloc;
- (void)removeOutput:(id)a3;
- (void)setActiveHapticChannelIndex:(int64_t)a3;
- (void)setDisableColorMatching:(BOOL)a3;
- (void)setEnabled:(BOOL)enabled;
- (void)setHapticVolume:(float)a3;
- (void)setLoudnessInfo:(id)a3;
- (void)setMutesHaptics:(BOOL)a3;
- (void)setVideoEnhancementFilterOptions:(id)a3;
@end

@implementation AVPlayerItemTrack

+ (AVPlayerItemTrack)playerItemTrackWithFigPlaybackItem:(OpaqueFigPlaybackItem *)a3 readyForInspection:(BOOL)a4 trackID:(int)a5 asset:(id)a6 playerItem:(id)a7
{
  id v7 = [[AVPlayerItemTrack alloc] _initWithFigPlaybackItem:a3 readyForInspection:a4 trackID:*(void *)&a5 asset:a6 playerItem:a7];
  return (AVPlayerItemTrack *)v7;
}

- (id)_initWithFigPlaybackItem:(OpaqueFigPlaybackItem *)a3 readyForInspection:(BOOL)a4 trackID:(int)a5 asset:(id)a6 playerItem:(id)a7
{
  FigNote_AllowInternalDefaultLogs();
  fig_note_initialize_category_with_default_work();
  fig_note_initialize_category_with_default_work();
  v17.receiver = self;
  v17.super_class = (Class)AVPlayerItemTrack;
  v12 = [(AVPlayerItemTrack *)&v17 init];
  if (v12)
  {
    v13 = objc_alloc_init(AVPlayerItemTrackInternal);
    v12->_playerItemTrack = v13;
    if (!v13) {
      goto LABEL_7;
    }
    CFRetain(v13);
    v12->_playerItemTrack->weakReferenceToPlayerItem = (AVWeakReference *)(id)[a7 _weakReference];
    v14 = a3 ? (OpaqueFigPlaybackItem *)CFRetain(a3) : 0;
    v12->_playerItemTrack->figPlaybackItem = v14;
    v12->_playerItemTrack->figPlaybackItemIsReadyForInspection = a4;
    v12->_playerItemTrack->asset = (AVAsset *)a6;
    v12->_playerItemTrack->trackID = a5;
    v12->_playerItemTrack->disableColorMatching = 0;
    v12->_playerItemTrack->disableColorMatchingWasSet = 0;
    v12->_playerItemTrack->activeHapticChannelIndex = 1;
    v12->_playerItemTrack->activeHapticChannelIndexWasSet = 0;
    v12->_playerItemTrack->sampleBufferOutputs = 0;
    v12->_playerItemTrack->hapticVolume = 1.0;
    v12->_playerItemTrack->hapticVolumeWasSet = 0;
    v12->_playerItemTrack->mutesHaptics = 0;
    v12->_playerItemTrack->mutesHapticsWasSet = 0;
    v12->_playerItemTrack->ivarAccessQueue = (OS_dispatch_queue *)av_readwrite_dispatch_queue_create("com.apple.avplayeritemtrack.ivars");
    if (!a5)
    {
LABEL_7:

      return 0;
    }
  }
  return v12;
}

- (void)dealloc
{
  playerItemTrack = self->_playerItemTrack;
  if (playerItemTrack)
  {
    figPlaybackItem = playerItemTrack->figPlaybackItem;
    if (figPlaybackItem)
    {
      CFRelease(figPlaybackItem);
      playerItemTrack = self->_playerItemTrack;
    }

    v5 = (dispatch_object_t *)self->_playerItemTrack;
    if (v5[14])
    {
      dispatch_release(v5[14]);
      v5 = (dispatch_object_t *)self->_playerItemTrack;
    }
    CFRelease(v5);
  }
  v6.receiver = self;
  v6.super_class = (Class)AVPlayerItemTrack;
  [(AVPlayerItemTrack *)&v6 dealloc];
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  return (id)[v3 stringWithFormat:@"<%@: %p, assetTrack = %@>", NSStringFromClass(v4), self, -[AVPlayerItemTrack assetTrack](self, "assetTrack")];
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  BOOL result = 0;
  if (objc_opt_isKindOfClass())
  {
    int v5 = [(AVPlayerItemTrack *)self trackID];
    if (v5 == [a3 trackID])
    {
      weakReferenceToPlayerItem = self->_playerItemTrack->weakReferenceToPlayerItem;
      if (weakReferenceToPlayerItem == (AVWeakReference *)[a3 _weakReferenceToPlayerItem]) {
        return 1;
      }
    }
  }
  return result;
}

- (unint64_t)hash
{
  playerItemTrack = self->_playerItemTrack;
  uint64_t trackID = playerItemTrack->trackID;
  return [(AVWeakReference *)playerItemTrack->weakReferenceToPlayerItem hash] ^ trackID;
}

- (id)_weakReferenceToPlayerItem
{
  return self->_playerItemTrack->weakReferenceToPlayerItem;
}

- (id)_playerItem
{
  return [(AVWeakReference *)self->_playerItemTrack->weakReferenceToPlayerItem referencedObject];
}

- (int)trackID
{
  return self->_playerItemTrack->trackID;
}

- (AVAssetTrack)assetTrack
{
  AVTelemetryGenerateID();
  playerItemTrack = self->_playerItemTrack;
  asset = playerItemTrack->asset;
  uint64_t trackID = playerItemTrack->trackID;
  return [(AVAsset *)asset trackWithTrackID:trackID];
}

- (BOOL)isEnabled
{
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x2020000000;
  char v30 = 0;
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x2020000000;
  char v26 = 0;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 0;
  ivarAccessQueue = self->_playerItemTrack->ivarAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __30__AVPlayerItemTrack_isEnabled__block_invoke;
  block[3] = &unk_1E57B40C8;
  block[4] = self;
  block[5] = &v27;
  block[6] = &v23;
  block[7] = &v19;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, block);
  if (!*((unsigned char *)v24 + 24) && *((unsigned char *)v20 + 24))
  {
    CFTypeRef cf = 0;
    playerItemTrack = self->_playerItemTrack;
    figPlaybackItem = playerItemTrack->figPlaybackItem;
    uint64_t trackID = playerItemTrack->trackID;
    uint64_t v9 = *(void *)(CMBaseObjectGetVTable() + 16);
    uint64_t v10 = v9 ? v9 : 0;
    v11 = *(uint64_t (**)(OpaqueFigPlaybackItem *, uint64_t, void, void, CFTypeRef *))(v10 + 40);
    if (v11)
    {
      int v12 = v11(figPlaybackItem, trackID, *MEMORY[0x1E4F33DB0], *MEMORY[0x1E4F1CF80], &cf);
      CFTypeRef v13 = cf;
      if (!v12)
      {
        if (!cf) {
          goto LABEL_2;
        }
        char v14 = [(id)cf BOOLValue];
        *((unsigned char *)v28 + 24) = v14;
        v15 = self->_playerItemTrack->ivarAccessQueue;
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __30__AVPlayerItemTrack_isEnabled__block_invoke_2;
        v16[3] = &unk_1E57B2160;
        v16[4] = self;
        v16[5] = &v27;
        av_readwrite_dispatch_queue_write(v15, v16);
        CFTypeRef v13 = cf;
      }
      if (v13) {
        CFRelease(v13);
      }
    }
  }
LABEL_2:
  char v4 = *((unsigned char *)v28 + 24);
  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v27, 8);
  return v4;
}

void *__30__AVPlayerItemTrack_isEnabled__block_invoke(void *result)
{
  *(unsigned char *)(*(void *)(result[5] + 8) + 24) = *(unsigned char *)(*(void *)(result[4] + 8) + 72);
  *(unsigned char *)(*(void *)(result[6] + 8) + 24) = *(unsigned char *)(*(void *)(result[4] + 8) + 73);
  uint64_t v1 = *(void *)(result[4] + 8);
  if (*(void *)(v1 + 16))
  {
    if (*(unsigned char *)(v1 + 24)) {
      *(unsigned char *)(*(void *)(result[7] + 8) + 24) = 1;
    }
  }
  return result;
}

uint64_t __30__AVPlayerItemTrack_isEnabled__block_invoke_2(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 72) = *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8)
                                                                            + 24);
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 73) = 1;
  return result;
}

- (void)_transferEnabledToFig
{
  uint64_t v3 = objc_msgSend(-[AVPlayerItemTrack _playerItem](self, "_playerItem"), "_copyStateDispatchQueue");
  if (v3)
  {
    char v4 = v3;
    playerItemTrack = self->_playerItemTrack;
    figPlaybackItem = playerItemTrack->figPlaybackItem;
    if (figPlaybackItem)
    {
      uint64_t trackID = playerItemTrack->trackID;
      v8 = (void *)([(AVPlayerItemTrack *)self isEnabled] ? MEMORY[0x1E4F1CFD0] : MEMORY[0x1E4F1CFC8]);
      uint64_t v9 = *(void *)(CMBaseObjectGetVTable() + 16);
      uint64_t v10 = v9 ? v9 : 0;
      v11 = *(void (**)(OpaqueFigPlaybackItem *, uint64_t, void, void))(v10 + 112);
      if (v11) {
        v11(figPlaybackItem, trackID, *MEMORY[0x1E4F33DB0], *v8);
      }
    }
    dispatch_release(v4);
  }
}

- (void)setEnabled:(BOOL)enabled
{
  ivarAccessQueue = self->_playerItemTrack->ivarAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __32__AVPlayerItemTrack_setEnabled___block_invoke;
  block[3] = &unk_1E57B20E8;
  block[4] = self;
  BOOL v9 = enabled;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  int v5 = objc_msgSend(-[AVPlayerItemTrack _playerItem](self, "_playerItem"), "_copyStateDispatchQueue");
  if (v5)
  {
    objc_super v6 = v5;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __32__AVPlayerItemTrack_setEnabled___block_invoke_2;
    v7[3] = &unk_1E57B1E80;
    v7[4] = self;
    AVSerializeOnQueueAsyncIfNecessary(v5, v7);
    dispatch_release(v6);
  }
}

uint64_t __32__AVPlayerItemTrack_setEnabled___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 72) = *(unsigned char *)(result + 40);
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 73) = 1;
  return result;
}

uint64_t __32__AVPlayerItemTrack_setEnabled___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _transferEnabledToFig];
}

- (id)fallbackTrack
{
  uint64_t v3 = objc_msgSend(-[AVAssetTrack _fallbackTrack](-[AVPlayerItemTrack assetTrack](self, "assetTrack"), "_fallbackTrack"), "trackID");
  id v4 = [(AVPlayerItemTrack *)self _playerItem];
  return (id)[v4 _trackWithTrackID:v3];
}

- (float)currentVideoFrameRate
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x2020000000;
  char v27 = 0;
  ivarAccessQueue = self->_playerItemTrack->ivarAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__AVPlayerItemTrack_currentVideoFrameRate__block_invoke;
  block[3] = &unk_1E57B2160;
  block[4] = self;
  void block[5] = &v24;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, block);
  if (!*((unsigned char *)v25 + 24))
  {
    float v9 = 0.0;
    goto LABEL_20;
  }
  CFTypeRef cf = 0;
  playerItemTrack = self->_playerItemTrack;
  figPlaybackItem = playerItemTrack->figPlaybackItem;
  uint64_t trackID = playerItemTrack->trackID;
  uint64_t v7 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v7) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = 0;
  }
  uint64_t v10 = *(uint64_t (**)(OpaqueFigPlaybackItem *, uint64_t, void, void, CFTypeRef *))(v8 + 40);
  float v9 = 0.0;
  if (!v10) {
    goto LABEL_17;
  }
  CFAllocatorRef v11 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  int v12 = v10(figPlaybackItem, trackID, *MEMORY[0x1E4F33D90], *MEMORY[0x1E4F1CF80], &cf);
  CFTypeRef v13 = cf;
  if (!v12 && cf)
  {
    CFTypeID TypeID = CFNumberGetTypeID();
    if (TypeID != CFGetTypeID(cf))
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
      Mutable = CFStringCreateMutable(v11, 0);
      objc_super v17 = (const void *)FigCFCopyCompactDescription();
      CFStringAppendFormat(Mutable, 0, @"<rdar://100445728> CurrentVideoFrameRate type is not CFNumberRef, value = {%@}\n", v17);
      if (v17) {
        CFRelease(v17);
      }
      v28 = 0;
      uint64_t CStringPtrAndBufferToFree = FigCFStringGetCStringPtrAndBufferToFree();
      uint64_t v19 = "<rdar://100445728> failed to get content of CurrentVideoFrameRate";
      if (CStringPtrAndBufferToFree) {
        uint64_t v19 = (const char *)CStringPtrAndBufferToFree;
      }
      qword_1E93565C0 = (uint64_t)v19;
      free(v28);
      if (Mutable) {
        CFRelease(Mutable);
      }
    }
    [(id)cf floatValue];
    float v9 = v20;
LABEL_17:
    CFTypeRef v13 = cf;
  }
  if (v13) {
    CFRelease(v13);
  }
LABEL_20:
  _Block_object_dispose(&v24, 8);
  return v9;
}

uint64_t __42__AVPlayerItemTrack_currentVideoFrameRate__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(*(void *)(result + 32) + 8);
  if (*(void *)(v1 + 16))
  {
    if (*(unsigned char *)(v1 + 24)) {
      *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = 1;
    }
  }
  return result;
}

- (id)loudnessInfo
{
  return self->_playerItemTrack->loudnessInfo;
}

- (id)effectiveLoudnessInfo
{
  if (!self->_playerItemTrack->figPlaybackItem
    || ![(AVPlayerItemTrack *)self _figPlaybackItemIsReadyForInspection])
  {
    return 0;
  }
  CFAllocatorRef v11 = 0;
  playerItemTrack = self->_playerItemTrack;
  figPlaybackItem = playerItemTrack->figPlaybackItem;
  uint64_t trackID = playerItemTrack->trackID;
  uint64_t v6 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v6) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = 0;
  }
  float v9 = *(void (**)(OpaqueFigPlaybackItem *, uint64_t, void, void, void **))(v7 + 40);
  if (v9)
  {
    v9(figPlaybackItem, trackID, *MEMORY[0x1E4F33DA8], *MEMORY[0x1E4F1CF80], &v11);
    uint64_t v10 = v11;
  }
  else
  {
    uint64_t v10 = 0;
  }
  return v10;
}

- (void)_transferLoudnessInfoToFig
{
  playerItemTrack = self->_playerItemTrack;
  figPlaybackItem = playerItemTrack->figPlaybackItem;
  if (figPlaybackItem)
  {
    uint64_t trackID = playerItemTrack->trackID;
    loudnessInfo = playerItemTrack->loudnessInfo;
    uint64_t v6 = *(void *)(CMBaseObjectGetVTable() + 16);
    uint64_t v7 = v6 ? v6 : 0;
    uint64_t v8 = *(void (**)(OpaqueFigPlaybackItem *, uint64_t, uint64_t, NSDictionary *))(v7 + 112);
    if (v8)
    {
      uint64_t v9 = *MEMORY[0x1E4F33DD8];
      v8(figPlaybackItem, trackID, v9, loudnessInfo);
    }
  }
}

- (void)setLoudnessInfo:(id)a3
{
  loudnessInfo = self->_playerItemTrack->loudnessInfo;
  if (loudnessInfo != a3)
  {

    self->_playerItemTrack->loudnessInfo = (NSDictionary *)[a3 copy];
    [(AVPlayerItemTrack *)self _transferLoudnessInfoToFig];
  }
}

- (int)effectiveEQPreset
{
  if (!self->_playerItemTrack->figPlaybackItem
    || ![(AVPlayerItemTrack *)self _figPlaybackItemIsReadyForInspection])
  {
    return -1;
  }
  CFTypeRef cf = 0;
  playerItemTrack = self->_playerItemTrack;
  figPlaybackItem = playerItemTrack->figPlaybackItem;
  uint64_t trackID = playerItemTrack->trackID;
  uint64_t v6 = *(void *)(CMBaseObjectGetVTable() + 16);
  uint64_t v7 = v6 ? v6 : 0;
  uint64_t v8 = *(unsigned int (**)(OpaqueFigPlaybackItem *, uint64_t, void, void, CFTypeRef *))(v7 + 40);
  if (!v8 || v8(figPlaybackItem, trackID, *MEMORY[0x1E4F33DA0], *MEMORY[0x1E4F1CF80], &cf)) {
    return -1;
  }
  int v9 = [(id)cf intValue];
  if (cf) {
    CFRelease(cf);
  }
  return v9;
}

- (BOOL)willTrimShortDurationAudioSamples
{
  if (!self->_playerItemTrack->figPlaybackItem
    || ![(AVPlayerItemTrack *)self _figPlaybackItemIsReadyForInspection])
  {
    return 1;
  }
  CFBooleanRef BOOLean = 0;
  playerItemTrack = self->_playerItemTrack;
  figPlaybackItem = playerItemTrack->figPlaybackItem;
  uint64_t trackID = playerItemTrack->trackID;
  uint64_t v6 = *(void *)(CMBaseObjectGetVTable() + 16);
  uint64_t v7 = v6 ? v6 : 0;
  uint64_t v8 = *(unsigned int (**)(OpaqueFigPlaybackItem *, uint64_t, void, void, CFBooleanRef *))(v7 + 40);
  if (!v8 || v8(figPlaybackItem, trackID, *MEMORY[0x1E4F33E08], *MEMORY[0x1E4F1CF80], &BOOLean)) {
    return 1;
  }
  BOOL v9 = CFBooleanGetValue(BOOLean) != 0;
  if (BOOLean) {
    CFRelease(BOOLean);
  }
  return v9;
}

- (id)videoEnhancementFilterOptions
{
  return self->_playerItemTrack->videoEnhancementFilterOptions;
}

- (void)_transferVideoEnhancementOptionsToFig
{
  playerItemTrack = self->_playerItemTrack;
  figPlaybackItem = playerItemTrack->figPlaybackItem;
  if (figPlaybackItem)
  {
    uint64_t trackID = playerItemTrack->trackID;
    videoEnhancementFilterOptions = playerItemTrack->videoEnhancementFilterOptions;
    uint64_t v6 = *(void *)(CMBaseObjectGetVTable() + 16);
    uint64_t v7 = v6 ? v6 : 0;
    uint64_t v8 = *(void (**)(OpaqueFigPlaybackItem *, uint64_t, __CFString *, NSDictionary *))(v7 + 112);
    if (v8)
    {
      v8(figPlaybackItem, trackID, @"VideoEnhancementFilterOptions", videoEnhancementFilterOptions);
    }
  }
}

- (void)setVideoEnhancementFilterOptions:(id)a3
{
  videoEnhancementFilterOptions = self->_playerItemTrack->videoEnhancementFilterOptions;
  if (videoEnhancementFilterOptions != a3)
  {

    self->_playerItemTrack->videoEnhancementFilterOptions = (NSDictionary *)[a3 copy];
    [(AVPlayerItemTrack *)self _transferVideoEnhancementOptionsToFig];
  }
}

- (BOOL)disableColorMatching
{
  playerItemTrack = self->_playerItemTrack;
  return playerItemTrack->disableColorMatchingWasSet && playerItemTrack->disableColorMatching;
}

- (void)_transferDisableColorMatchingToFig
{
  playerItemTrack = self->_playerItemTrack;
  figPlaybackItem = playerItemTrack->figPlaybackItem;
  if (figPlaybackItem && playerItemTrack->disableColorMatchingWasSet)
  {
    uint64_t trackID = playerItemTrack->trackID;
    int v5 = (uint64_t *)(playerItemTrack->disableColorMatching ? MEMORY[0x1E4F1CFD0] : MEMORY[0x1E4F1CFC8]);
    uint64_t v6 = *(void *)(CMBaseObjectGetVTable() + 16);
    uint64_t v7 = v6 ? v6 : 0;
    uint64_t v8 = *(void (**)(OpaqueFigPlaybackItem *, uint64_t, __CFString *, uint64_t))(v7 + 112);
    if (v8)
    {
      uint64_t v9 = *v5;
      v8(figPlaybackItem, trackID, @"DisableColorMatching", v9);
    }
  }
}

- (void)setDisableColorMatching:(BOOL)a3
{
  self->_playerItemTrack->disableColorMatching = a3;
  self->_playerItemTrack->disableColorMatchingWasSet = 1;
  [(AVPlayerItemTrack *)self _transferDisableColorMatchingToFig];
}

- (void)setActiveHapticChannelIndex:(int64_t)a3
{
  self->_playerItemTrack->activeHapticChannelIndex = a3;
  self->_playerItemTrack->activeHapticChannelIndexWasSet = 1;
  [(AVPlayerItemTrack *)self _transferActiveHapticChannelIndexToFig];
}

- (int64_t)activeHapticChannelIndex
{
  return self->_playerItemTrack->activeHapticChannelIndex;
}

- (void)_transferActiveHapticChannelIndexToFig
{
  playerItemTrack = self->_playerItemTrack;
  figPlaybackItem = playerItemTrack->figPlaybackItem;
  if (figPlaybackItem && playerItemTrack->activeHapticChannelIndexWasSet)
  {
    uint64_t trackID = playerItemTrack->trackID;
    uint64_t v5 = [MEMORY[0x1E4F28ED0] numberWithInteger:playerItemTrack->activeHapticChannelIndex];
    uint64_t v6 = *(void *)(CMBaseObjectGetVTable() + 16);
    uint64_t v7 = v6 ? v6 : 0;
    uint64_t v8 = *(void (**)(OpaqueFigPlaybackItem *, uint64_t, __CFString *, uint64_t))(v7 + 112);
    if (v8)
    {
      v8(figPlaybackItem, trackID, @"ActiveHapticChannelIndex", v5);
    }
  }
}

- (void)setHapticVolume:(float)a3
{
  self->_playerItemTrack->hapticVolume = a3;
  self->_playerItemTrack->hapticVolumeWasSet = 1;
  [(AVPlayerItemTrack *)self _transferHapticVolumeToFig];
}

- (float)hapticVolume
{
  return self->_playerItemTrack->hapticVolume;
}

- (void)setMutesHaptics:(BOOL)a3
{
  self->_playerItemTrack->mutesHaptics = a3;
  self->_playerItemTrack->mutesHapticsWasSet = 1;
  [(AVPlayerItemTrack *)self _transferMutesHapticsToFig];
}

- (BOOL)mutesHaptics
{
  return self->_playerItemTrack->mutesHaptics;
}

- (void)_transferHapticVolumeToFig
{
  playerItemTrack = self->_playerItemTrack;
  figPlaybackItem = playerItemTrack->figPlaybackItem;
  if (figPlaybackItem && playerItemTrack->hapticVolumeWasSet)
  {
    uint64_t trackID = playerItemTrack->trackID;
    *(float *)&double v2 = playerItemTrack->hapticVolume;
    uint64_t v6 = [MEMORY[0x1E4F28ED0] numberWithFloat:v2];
    uint64_t v7 = *(void *)(CMBaseObjectGetVTable() + 16);
    uint64_t v8 = v7 ? v7 : 0;
    uint64_t v9 = *(void (**)(OpaqueFigPlaybackItem *, uint64_t, __CFString *, uint64_t))(v8 + 112);
    if (v9)
    {
      v9(figPlaybackItem, trackID, @"Volume", v6);
    }
  }
}

- (void)_transferMutesHapticsToFig
{
  playerItemTrack = self->_playerItemTrack;
  figPlaybackItem = playerItemTrack->figPlaybackItem;
  if (figPlaybackItem && playerItemTrack->mutesHapticsWasSet)
  {
    uint64_t trackID = playerItemTrack->trackID;
    uint64_t v5 = (uint64_t *)(playerItemTrack->mutesHaptics ? MEMORY[0x1E4F1CFD0] : MEMORY[0x1E4F1CFC8]);
    uint64_t v6 = *(void *)(CMBaseObjectGetVTable() + 16);
    uint64_t v7 = v6 ? v6 : 0;
    uint64_t v8 = *(void (**)(OpaqueFigPlaybackItem *, uint64_t, __CFString *, uint64_t))(v7 + 112);
    if (v8)
    {
      uint64_t v9 = *v5;
      v8(figPlaybackItem, trackID, @"Muted", v9);
    }
  }
}

- (void)_updateTrackExtractionIDArrayProperty
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  playerItemTrack = self->_playerItemTrack;
  if (playerItemTrack->figPlaybackItem && playerItemTrack->sampleBufferOutputs)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    sampleBufferOutputs = self->_playerItemTrack->sampleBufferOutputs;
    uint64_t v6 = [(NSMutableArray *)sampleBufferOutputs countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v17 != v8) {
            objc_enumerationMutation(sampleBufferOutputs);
          }
          objc_msgSend(v4, "addObject:", objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInt:", objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "_extractionID")));
        }
        uint64_t v7 = [(NSMutableArray *)sampleBufferOutputs countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v7);
    }
    uint64_t v10 = self->_playerItemTrack;
    figPlaybackItem = v10->figPlaybackItem;
    uint64_t trackID = v10->trackID;
    uint64_t v13 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v13) {
      uint64_t v14 = v13;
    }
    else {
      uint64_t v14 = 0;
    }
    v15 = *(void (**)(OpaqueFigPlaybackItem *, uint64_t, void, id))(v14 + 112);
    if (v15) {
      v15(figPlaybackItem, trackID, *MEMORY[0x1E4F33DC0], v4);
    }
  }
}

- (void)_attachToFigPlaybackItemOfPlayerItem:(id)a3
{
  uint64_t v5 = objc_msgSend(-[AVPlayerItemTrack _playerItem](self, "_playerItem"), "_copyStateDispatchQueue");
  if (v5) {
    dispatch_release(v5);
  }
  if (!self->_playerItemTrack->figPlaybackItem)
  {
    self->_playerItemTrack->figPlaybackItem = (OpaqueFigPlaybackItem *)[a3 _copyFigPlaybackItem];
    playerItemTrack = self->_playerItemTrack;
    if (playerItemTrack->enabledWasSet)
    {
      [(AVPlayerItemTrack *)self _transferEnabledToFig];
      playerItemTrack = self->_playerItemTrack;
    }
    if (playerItemTrack->loudnessInfo)
    {
      [(AVPlayerItemTrack *)self _transferLoudnessInfoToFig];
      playerItemTrack = self->_playerItemTrack;
    }
    if (playerItemTrack->videoEnhancementFilterOptions)
    {
      [(AVPlayerItemTrack *)self _transferVideoEnhancementOptionsToFig];
      playerItemTrack = self->_playerItemTrack;
    }
    if (playerItemTrack->disableColorMatchingWasSet)
    {
      [(AVPlayerItemTrack *)self _transferDisableColorMatchingToFig];
      playerItemTrack = self->_playerItemTrack;
    }
    if (playerItemTrack->activeHapticChannelIndexWasSet)
    {
      [(AVPlayerItemTrack *)self _transferActiveHapticChannelIndexToFig];
      playerItemTrack = self->_playerItemTrack;
    }
    if (playerItemTrack->hapticVolumeWasSet)
    {
      [(AVPlayerItemTrack *)self _transferHapticVolumeToFig];
      playerItemTrack = self->_playerItemTrack;
    }
    if (playerItemTrack->mutesHapticsWasSet) {
      [(AVPlayerItemTrack *)self _transferMutesHapticsToFig];
    }
    [(AVPlayerItemTrack *)self _updateTrackExtractionIDArrayProperty];
  }
}

- (BOOL)_figPlaybackItemIsReadyForInspection
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  ivarAccessQueue = self->_playerItemTrack->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __57__AVPlayerItemTrack__figPlaybackItemIsReadyForInspection__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __57__AVPlayerItemTrack__figPlaybackItemIsReadyForInspection__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8)
                                                                            + 24);
  return result;
}

- (void)_respondToFigPlaybackItemBecomingReadyForInpection
{
  ivarAccessQueue = self->_playerItemTrack->ivarAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__AVPlayerItemTrack__respondToFigPlaybackItemBecomingReadyForInpection__block_invoke;
  block[3] = &unk_1E57B1E80;
  block[4] = self;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
}

uint64_t __71__AVPlayerItemTrack__respondToFigPlaybackItemBecomingReadyForInpection__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
  return result;
}

- (void)addOutput:(id)a3
{
  v25[1] = *MEMORY[0x1E4F143B8];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    char v22 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"Cannot add any AVPlayerItemOutput other than AVPlayerItemSampleBufferOutput to AVPlayerItemTrack", v6, v7, v8, v9, v10, v23), 0 reason userInfo];
    objc_exception_throw(v22);
  }
  sampleBufferOutputs = self->_playerItemTrack->sampleBufferOutputs;
  if (!sampleBufferOutputs)
  {
    self->_playerItemTrack->sampleBufferOutputs = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    sampleBufferOutputs = self->_playerItemTrack->sampleBufferOutputs;
  }
  if (([(NSMutableArray *)sampleBufferOutputs containsObject:a3] & 1) == 0)
  {
    [(NSMutableArray *)self->_playerItemTrack->sampleBufferOutputs addObject:a3];
    [a3 _setTrackID:self->_playerItemTrack->trackID];
    uint64_t v12 = FigAtomicAdd32();
    [a3 _setExtractionID:v12];
    [a3 _attachToPlayerItemTrack:self figPlaybackItem:self->_playerItemTrack->figPlaybackItem];
    [a3 _advanceInterval];
    if (v13 > 0.0)
    {
      uint64_t v24 = [MEMORY[0x1E4F28ED0] numberWithInt:v12];
      uint64_t v14 = (void *)MEMORY[0x1E4F28ED0];
      [a3 _advanceInterval];
      v25[0] = objc_msgSend(v14, "numberWithDouble:");
      uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:&v24 count:1];
      playerItemTrack = self->_playerItemTrack;
      figPlaybackItem = playerItemTrack->figPlaybackItem;
      uint64_t trackID = playerItemTrack->trackID;
      uint64_t v19 = *(void *)(CMBaseObjectGetVTable() + 16);
      if (v19) {
        uint64_t v20 = v19;
      }
      else {
        uint64_t v20 = 0;
      }
      uint64_t v21 = *(void (**)(OpaqueFigPlaybackItem *, uint64_t, void, uint64_t))(v20 + 112);
      if (v21) {
        v21(figPlaybackItem, trackID, *MEMORY[0x1E4F33DC8], v15);
      }
    }
    [(AVPlayerItemTrack *)self _updateTrackExtractionIDArrayProperty];
    objc_msgSend(a3, "_setTimebase:", objc_msgSend(-[AVPlayerItemTrack _playerItem](self, "_playerItem"), "unfoldedTimebase"));
  }
}

- (void)removeOutput:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    CFAllocatorRef v11 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"Cannot remove any AVPlayerItemOutput other than AVPlayerItemSampleBufferOutput from AVPlayerItemTrack", v6, v7, v8, v9, v10, v12), 0 reason userInfo];
    objc_exception_throw(v11);
  }
  if ([(NSMutableArray *)self->_playerItemTrack->sampleBufferOutputs containsObject:a3])
  {
    [(NSMutableArray *)self->_playerItemTrack->sampleBufferOutputs removeObject:a3];
    [a3 _detachFromPlayerItemTrack];
    [a3 _setTimebase:0];
    [(AVPlayerItemTrack *)self _updateTrackExtractionIDArrayProperty];
  }
}

- (NSArray)outputs
{
  sampleBufferOutputs = self->_playerItemTrack->sampleBufferOutputs;
  if (sampleBufferOutputs)
  {
    char v3 = (void *)[(NSMutableArray *)sampleBufferOutputs copy];
    return (NSArray *)v3;
  }
  else
  {
    uint64_t v5 = (void *)MEMORY[0x1E4F1C978];
    return (NSArray *)[v5 array];
  }
}

@end