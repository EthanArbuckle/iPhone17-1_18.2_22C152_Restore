@interface AVAssetTrack
+ (BOOL)expectsPropertyRevisedNotifications;
+ (id)keyPathsForValuesAffectingTimeRange;
+ (id)mediaCharacteristicsForMediaTypes;
- ($1CE2C3FC342086196D07C2B4E8C70800)gaplessSourceTimeRange;
- ($1CE2C3FC342086196D07C2B4E8C70800)mediaDecodeTimeRange;
- ($1CE2C3FC342086196D07C2B4E8C70800)mediaPresentationTimeRange;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)latentBaseDecodeTimeStampOfFirstTrackFragment;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)uneditedDuration;
- (AVAsset)asset;
- (AVAssetTrack)init;
- (AVAssetTrackSegment)segmentForTrackTime:(CMTime *)trackTime;
- (AVMediaType)mediaType;
- (AVSampleCursor)makeSampleCursorAtFirstSampleInDecodeOrder;
- (AVSampleCursor)makeSampleCursorAtLastSampleInDecodeOrder;
- (AVSampleCursor)makeSampleCursorWithPresentationTimeStamp:(CMTime *)presentationTimeStamp;
- (BOOL)_firstFormatDescriptionIsLPCM;
- (BOOL)_hasEmptyEdits;
- (BOOL)_hasMultipleDistinctFormatDescriptions;
- (BOOL)_hasMultipleEdits;
- (BOOL)_hasScaledEdits;
- (BOOL)_subtitleFormatDescriptionMatchesTextDisplayFlags:(unsigned int)a3 flagsMask:(unsigned int)a4;
- (BOOL)canProvideSampleCursors;
- (BOOL)hasAudibleBooksContent;
- (BOOL)hasAudioSampleDependencies;
- (BOOL)hasMediaCharacteristic:(AVMediaCharacteristic)mediaCharacteristic;
- (BOOL)hasMediaCharacteristics:(id)a3;
- (BOOL)hasProtectedContent;
- (BOOL)hasSeamSamples;
- (BOOL)isAudibleBooksContentAuthorized;
- (BOOL)isDecodable;
- (BOOL)isDefunct;
- (BOOL)isEnabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)isExcludedFromAutoselectionInTrackGroup;
- (BOOL)isPlayable;
- (BOOL)isSelfContained;
- (BOOL)requiresFrameReordering;
- (BOOL)segmentsExcludeAudioPrimingAndRemainderDurations;
- (CGAffineTransform)preferredTransform;
- (CGSize)dimensions;
- (CGSize)naturalSize;
- (CMPersistentTrackID)trackID;
- (CMTime)minFrameDuration;
- (CMTime)samplePresentationTimeForTrackTime:(SEL)a3;
- (CMTimeRange)timeRange;
- (CMTimeScale)naturalTimeScale;
- (NSArray)associatedTracksOfType:(AVTrackAssociationType)trackAssociationType;
- (NSArray)availableMetadataFormats;
- (NSArray)availableTrackAssociationTypes;
- (NSArray)commonMetadata;
- (NSArray)formatDescriptions;
- (NSArray)metadata;
- (NSArray)metadataForFormat:(AVMetadataFormat)format;
- (NSArray)segments;
- (NSString)description;
- (NSString)extendedLanguageTag;
- (NSString)languageCode;
- (OpaqueFigAssetTrack)_figAssetTrack;
- (OpaqueFigFormatReader)_figFormatReader;
- (OpaqueFigTrackReader)_figTrackReader;
- (float)estimatedDataRate;
- (float)nominalFrameRate;
- (float)peakDataRate;
- (float)preferredVolume;
- (id)_assetTrackInspector;
- (id)_fallbackTrack;
- (id)_firstAssociatedTrackWithAssociationType:(id)a3;
- (id)_initWithAsset:(id)a3 trackID:(int)a4;
- (id)_initWithAsset:(id)a3 trackID:(int)a4 trackIndex:(int64_t)a5;
- (id)_initWithAsset:(id)a3 trackIndex:(int64_t)a4;
- (id)_pairedForcedOnlySubtitlesTrack;
- (id)_trackReferences;
- (id)_weakReference;
- (id)locale;
- (id)loudnessInfo;
- (id)mediaCharacteristics;
- (id)segmentsAsPresented;
- (int)playabilityValidationResult;
- (int64_t)alternateGroupID;
- (int64_t)defaultAlternateGroupID;
- (int64_t)layer;
- (int64_t)provisionalAlternateGroupID;
- (int64_t)statusOfValueForKey:(id)a3;
- (int64_t)statusOfValueForKey:(id)a3 error:(id *)a4;
- (uint64_t)totalSampleDataLength;
- (unint64_t)hash;
- (void)_startListeningToFigAssetTrackNotifications;
- (void)_stopListeningToFigAssetTrackNotifications;
- (void)dealloc;
- (void)loadAssociatedTracksOfType:(AVTrackAssociationType)trackAssociationType completionHandler:(void *)completionHandler;
- (void)loadMetadataForFormat:(AVMetadataFormat)format completionHandler:(void *)completionHandler;
- (void)loadSamplePresentationTimeForTrackTime:(CMTime *)trackTime completionHandler:(void *)completionHandler;
- (void)loadSegmentForTrackTime:(CMTime *)trackTime completionHandler:(void *)completionHandler;
- (void)loadValuesAsynchronouslyForKeys:(id)a3 completionHandler:(id)a4;
@end

@implementation AVAssetTrack

- (id)_initWithAsset:(id)a3 trackIndex:(int64_t)a4
{
  return [(AVAssetTrack *)self _initWithAsset:a3 trackID:0 trackIndex:a4];
}

- (id)_initWithAsset:(id)a3 trackID:(int)a4 trackIndex:(int64_t)a5
{
  uint64_t v6 = *(void *)&a4;
  v13.receiver = self;
  v13.super_class = (Class)AVAssetTrack;
  v8 = [(AVAssetTrack *)&v13 init];
  if (v8)
  {
    v9 = +[AVAssetTrackInspector assetTrackInspectorWithAsset:a3 trackID:v6 trackIndex:a5];
    if (v9 && (v10 = v9, v11 = objc_alloc_init(AVAssetTrackInternal), (v8->_track = v11) != 0))
    {
      CFRetain(v11);
      v8->_track->trackInspector = v10;
      v8->_track->assetWeakReference = (AVWeakReference *)(id)[a3 _weakReference];
      v8->_track->weakReferenceToSelf = [[AVWeakReference alloc] initWithReferencedObject:v8];
      [(AVAssetTrack *)v8 _startListeningToFigAssetTrackNotifications];
    }
    else
    {

      return 0;
    }
  }
  return v8;
}

- (void)_startListeningToFigAssetTrackNotifications
{
  v3 = [(AVAssetTrack *)self _figAssetTrack];
  id v4 = [(AVAssetTrack *)self _weakReference];
  if (v3)
  {
    v5 = v4;
    if (v4)
    {
      self->_track->figAssetTrackNotificationSource = (OpaqueFigAssetTrack *)CFRetain(v3);
      self->_track->figAssetTrackNotificationListenerWeakReference = (AVWeakReference *)CFRetain(v5);
      id v6 = +[AVCMNotificationDispatcher notificationDispatcherForCMNotificationCenter:CMNotificationCenterGetDefaultLocalCenter()];
      track = self->_track;
      uint64_t v8 = *MEMORY[0x1E4F32468];
      figAssetTrackNotificationListenerWeakReference = track->figAssetTrackNotificationListenerWeakReference;
      figAssetTrackNotificationSource = track->figAssetTrackNotificationSource;
      [v6 addListenerWithWeakReference:figAssetTrackNotificationListenerWeakReference callback:assetTrackNotificationHandler name:v8 object:figAssetTrackNotificationSource flags:0];
    }
  }
}

- (id)_weakReference
{
  return self->_track->weakReferenceToSelf;
}

- (OpaqueFigAssetTrack)_figAssetTrack
{
  return [(AVAssetTrackInspector *)self->_track->trackInspector _figAssetTrack];
}

- (CMPersistentTrackID)trackID
{
  return [(AVAssetTrackInspector *)self->_track->trackInspector trackID];
}

+ (id)mediaCharacteristicsForMediaTypes
{
  if (mediaCharacteristicsForMediaTypes_onceToken != -1) {
    dispatch_once(&mediaCharacteristicsForMediaTypes_onceToken, &__block_literal_global_3);
  }
  return (id)mediaCharacteristicsForMediaTypes_sMediaCharacteristicsForMediaTypes;
}

void __49__AVAssetTrack_mediaCharacteristicsForMediaTypes__block_invoke()
{
  if (!mediaCharacteristicsForMediaTypes_sMediaCharacteristicsForMediaTypes)
  {
    id v6 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v5 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"AVMediaCharacteristicVisual", @"AVMediaCharacteristicFrameBased", 0);
    uint64_t v4 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"AVMediaCharacteristicAudible", 0);
    uint64_t v0 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"AVMediaCharacteristicVisual", @"AVMediaCharacteristicLegible", @"AVMediaCharacteristicFrameBased", 0);
    uint64_t v1 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"AVMediaCharacteristicVisual", @"AVMediaCharacteristicLegible", 0);
    uint64_t v2 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"AVMediaCharacteristicVisual", @"AVMediaCharacteristicLegible", @"AVMediaCharacteristicFrameBased", 0);
    uint64_t v3 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"AVMediaCharacteristicVisual", 0);
    mediaCharacteristicsForMediaTypes_sMediaCharacteristicsForMediaTypes = (uint64_t)(id)objc_msgSend(v6, "dictionaryWithObjectsAndKeys:", v5, @"vide", v4, @"soun", v0, @"text", v1, @"clcp", v2, @"sbtl", v3, @"tmcd", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"AVMediaCharacteristicFrameBased", 0), @"meta", 0);
  }
}

- (void)_stopListeningToFigAssetTrackNotifications
{
  track = self->_track;
  if (track->figAssetTrackNotificationSource && track->figAssetTrackNotificationListenerWeakReference)
  {
    objc_msgSend(+[AVCMNotificationDispatcher notificationDispatcherForCMNotificationCenter:](AVCMNotificationDispatcher, "notificationDispatcherForCMNotificationCenter:", CMNotificationCenterGetDefaultLocalCenter()), "removeListenerWithWeakReference:callback:name:object:", self->_track->figAssetTrackNotificationListenerWeakReference, assetTrackNotificationHandler, *MEMORY[0x1E4F32468], self->_track->figAssetTrackNotificationSource);
    track = self->_track;
  }
  figAssetTrackNotificationListenerWeakReference = track->figAssetTrackNotificationListenerWeakReference;
  if (figAssetTrackNotificationListenerWeakReference)
  {
    CFRelease(figAssetTrackNotificationListenerWeakReference);
    self->_track->figAssetTrackNotificationListenerWeakReference = 0;
    track = self->_track;
  }
  figAssetTrackNotificationSource = track->figAssetTrackNotificationSource;
  if (figAssetTrackNotificationSource)
  {
    CFRelease(figAssetTrackNotificationSource);
    self->_track->figAssetTrackNotificationSource = 0;
  }
}

- (AVAssetTrack)init
{
  return (AVAssetTrack *)[(AVAssetTrack *)self _initWithAsset:0 trackID:0 trackIndex:-1];
}

- (id)_initWithAsset:(id)a3 trackID:(int)a4
{
  return [(AVAssetTrack *)self _initWithAsset:a3 trackID:*(void *)&a4 trackIndex:-1];
}

- (void)dealloc
{
  if (self->_track)
  {
    [(AVAssetTrack *)self _stopListeningToFigAssetTrackNotifications];

    CFRelease(self->_track);
  }
  v3.receiver = self;
  v3.super_class = (Class)AVAssetTrack;
  [(AVAssetTrack *)&v3 dealloc];
}

- (NSString)description
{
  objc_super v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  return (NSString *)[v3 stringWithFormat:@"<%@: %p, trackID = %d, mediaType = %@>", NSStringFromClass(v4), self, -[AVAssetTrack trackID](self, "trackID"), -[AVAssetTrack mediaType](self, "mediaType")];
}

- (AVAsset)asset
{
  return (AVAsset *)[(AVWeakReference *)self->_track->assetWeakReference referencedObject];
}

- (id)_assetTrackInspector
{
  return self->_track->trackInspector;
}

- (OpaqueFigTrackReader)_figTrackReader
{
  return [(AVAssetTrackInspector *)self->_track->trackInspector _figTrackReader];
}

- (OpaqueFigFormatReader)_figFormatReader
{
  return [(AVAssetTrackInspector *)self->_track->trackInspector _figFormatReader];
}

- (int64_t)statusOfValueForKey:(id)a3
{
  return [(AVAssetTrack *)self statusOfValueForKey:a3 error:0];
}

- (int64_t)statusOfValueForKey:(id)a3 error:(id *)a4
{
  return [(AVAssetTrackInspector *)self->_track->trackInspector statusOfValueForKey:a3 error:a4];
}

- (void)loadValuesAsynchronouslyForKeys:(id)a3 completionHandler:(id)a4
{
}

- (AVMediaType)mediaType
{
  return [(AVAssetTrackInspector *)self->_track->trackInspector mediaType];
}

- (NSArray)formatDescriptions
{
  return [(AVAssetTrackInspector *)self->_track->trackInspector formatDescriptions];
}

- (BOOL)isPlayable
{
  return [(AVAssetTrackInspector *)self->_track->trackInspector isPlayable];
}

- (BOOL)isDecodable
{
  return [(AVAssetTrackInspector *)self->_track->trackInspector isDecodable];
}

- (int)playabilityValidationResult
{
  return [(AVAssetTrackInspector *)self->_track->trackInspector playabilityValidationResult];
}

- (BOOL)isEnabled
{
  return [(AVAssetTrackInspector *)self->_track->trackInspector isEnabled];
}

- (BOOL)isSelfContained
{
  return [(AVAssetTrackInspector *)self->_track->trackInspector isSelfContained];
}

- (uint64_t)totalSampleDataLength
{
  return [(AVAssetTrackInspector *)self->_track->trackInspector totalSampleDataLength];
}

- (BOOL)_subtitleFormatDescriptionMatchesTextDisplayFlags:(unsigned int)a3 flagsMask:(unsigned int)a4
{
  BOOL v7 = [(NSString *)[(AVAssetTrack *)self mediaType] isEqualToString:@"sbtl"];
  if (v7)
  {
    uint64_t v8 = [(AVAssetTrack *)self formatDescriptions];
    if ([(NSArray *)v8 count] == 1)
    {
      CMTextDisplayFlags displayFlagsOut = 0;
      v9 = [(NSArray *)v8 objectAtIndex:0];
      CMMediaType MediaType = CMFormatDescriptionGetMediaType(v9);
      LOBYTE(v7) = 0;
      if (MediaType == 1935832172)
      {
        if (CMTextFormatDescriptionGetDisplayFlags(v9, &displayFlagsOut)) {
          BOOL v11 = 0;
        }
        else {
          BOOL v11 = (displayFlagsOut & a4) == a3;
        }
        LOBYTE(v7) = v11;
      }
    }
    else
    {
      LOBYTE(v7) = 0;
    }
  }
  return v7;
}

- (BOOL)hasMediaCharacteristic:(AVMediaCharacteristic)mediaCharacteristic
{
  uint64_t v4 = [(AVAssetTrackInspector *)self->_track->trackInspector mediaCharacteristics];
  return [(NSArray *)v4 containsObject:mediaCharacteristic];
}

- (BOOL)hasMediaCharacteristics:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v12 != v7) {
        objc_enumerationMutation(a3);
      }
      BOOL v9 = [(AVAssetTrack *)self hasMediaCharacteristic:*(void *)(*((void *)&v11 + 1) + 8 * v8)];
      if (!v9) {
        break;
      }
      if (v6 == ++v8)
      {
        uint64_t v6 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v6) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    LOBYTE(v9) = 1;
  }
  return v9;
}

- (id)mediaCharacteristics
{
  return [(AVAssetTrackInspector *)self->_track->trackInspector mediaCharacteristics];
}

- (CMTimeRange)timeRange
{
  result = (CMTimeRange *)self->_track->trackInspector;
  if (result) {
    return (CMTimeRange *)[(CMTimeRange *)result timeRange];
  }
  *(_OWORD *)&retstr->start.epoch = 0u;
  *(_OWORD *)&retstr->duration.timescale = 0u;
  *(_OWORD *)&retstr->start.value = 0u;
  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)uneditedDuration
{
  result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)self->_track->trackInspector;
  if (result) {
    return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)[($3CC8671D27C23BF42ADDB32F2B5E48AE *)result uneditedDuration];
  }
  retstr->var0 = 0;
  *(void *)&retstr->var1 = 0;
  retstr->var3 = 0;
  return result;
}

- ($1CE2C3FC342086196D07C2B4E8C70800)mediaPresentationTimeRange
{
  result = ($1CE2C3FC342086196D07C2B4E8C70800 *)self->_track->trackInspector;
  if (result) {
    return ($1CE2C3FC342086196D07C2B4E8C70800 *)[($1CE2C3FC342086196D07C2B4E8C70800 *)result mediaPresentationTimeRange];
  }
  *(_OWORD *)&retstr->var0.var3 = 0u;
  *(_OWORD *)&retstr->var1.var1 = 0u;
  *(_OWORD *)&retstr->var0.var0 = 0u;
  return result;
}

- ($1CE2C3FC342086196D07C2B4E8C70800)mediaDecodeTimeRange
{
  result = ($1CE2C3FC342086196D07C2B4E8C70800 *)self->_track->trackInspector;
  if (result) {
    return ($1CE2C3FC342086196D07C2B4E8C70800 *)[($1CE2C3FC342086196D07C2B4E8C70800 *)result mediaDecodeTimeRange];
  }
  *(_OWORD *)&retstr->var0.var3 = 0u;
  *(_OWORD *)&retstr->var1.var1 = 0u;
  *(_OWORD *)&retstr->var0.var0 = 0u;
  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)latentBaseDecodeTimeStampOfFirstTrackFragment
{
  result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)self->_track->trackInspector;
  if (result) {
    return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)[($3CC8671D27C23BF42ADDB32F2B5E48AE *)result latentBaseDecodeTimeStampOfFirstTrackFragment];
  }
  retstr->var0 = 0;
  *(void *)&retstr->var1 = 0;
  retstr->var3 = 0;
  return result;
}

- (BOOL)requiresFrameReordering
{
  return [(AVAssetTrackInspector *)self->_track->trackInspector requiresFrameReordering];
}

- (BOOL)hasAudioSampleDependencies
{
  return [(AVAssetTrackInspector *)self->_track->trackInspector hasAudioSampleDependencies];
}

- (CMTimeScale)naturalTimeScale
{
  return [(AVAssetTrackInspector *)self->_track->trackInspector naturalTimeScale];
}

- (float)estimatedDataRate
{
  [(AVAssetTrackInspector *)self->_track->trackInspector estimatedDataRate];
  return result;
}

- (float)peakDataRate
{
  [(AVAssetTrackInspector *)self->_track->trackInspector peakDataRate];
  return result;
}

- (NSString)languageCode
{
  return [(AVAssetTrackInspector *)self->_track->trackInspector languageCode];
}

- (NSString)extendedLanguageTag
{
  return [(AVAssetTrackInspector *)self->_track->trackInspector extendedLanguageTag];
}

- (id)locale
{
  return [(AVAssetTrackInspector *)self->_track->trackInspector locale];
}

- (CGSize)naturalSize
{
  [(AVAssetTrackInspector *)self->_track->trackInspector naturalSize];
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)dimensions
{
  [(AVAssetTrackInspector *)self->_track->trackInspector dimensions];
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGAffineTransform)preferredTransform
{
  CGSize result = (CGAffineTransform *)self->_track->trackInspector;
  if (result) {
    return (CGAffineTransform *)[(CGAffineTransform *)result preferredTransform];
  }
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  *(_OWORD *)&retstr->a = 0u;
  return result;
}

- (int64_t)layer
{
  return [(AVAssetTrackInspector *)self->_track->trackInspector layer];
}

- (float)preferredVolume
{
  [(AVAssetTrackInspector *)self->_track->trackInspector preferredVolume];
  return result;
}

- (id)loudnessInfo
{
  return [(AVAssetTrackInspector *)self->_track->trackInspector loudnessInfo];
}

- (float)nominalFrameRate
{
  [(AVAssetTrackInspector *)self->_track->trackInspector nominalFrameRate];
  return result;
}

- (CMTime)minFrameDuration
{
  trackInspector = self->_track->trackInspector;
  if (trackInspector) {
    [(AVAssetTrackInspector *)trackInspector minSampleDuration];
  }
  float result = (CMTime *)objc_msgSend((id)objc_msgSend(+[AVAssetTrack mediaCharacteristicsForMediaTypes](AVAssetTrack, "mediaCharacteristicsForMediaTypes"), "objectForKey:", -[AVAssetTrack mediaType](self, "mediaType")), "containsObject:", @"AVMediaCharacteristicFrameBased");
  if (result)
  {
    *(_OWORD *)&retstr->value = 0uLL;
    CMTimeEpoch v7 = 0;
  }
  else
  {
    uint64_t v8 = MEMORY[0x1E4F1F9F8];
    *(_OWORD *)&retstr->value = *MEMORY[0x1E4F1F9F8];
    CMTimeEpoch v7 = *(void *)(v8 + 16);
  }
  retstr->epoch = v7;
  return result;
}

- (NSArray)segments
{
  return [(AVAssetTrackInspector *)self->_track->trackInspector segments];
}

- (AVAssetTrackSegment)segmentForTrackTime:(CMTime *)trackTime
{
  trackInspector = self->_track->trackInspector;
  CMTime v5 = *trackTime;
  return (AVAssetTrackSegment *)[(AVAssetTrackInspector *)trackInspector segmentForTrackTime:&v5];
}

- (void)loadSegmentForTrackTime:(CMTime *)trackTime completionHandler:(void *)completionHandler
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __58__AVAssetTrack_loadSegmentForTrackTime_completionHandler___block_invoke;
  v4[3] = &unk_1E57B33D8;
  CMTime v5 = *trackTime;
  v4[4] = self;
  v4[5] = completionHandler;
  AVLoadValueAsynchronously(self, @"segments", (uint64_t)v4);
}

uint64_t __58__AVAssetTrack_loadSegmentForTrackTime_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    double v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
    return v3();
  }
  else
  {
    CMTime v5 = *(void **)(a1 + 32);
    long long v6 = *(_OWORD *)(a1 + 48);
    uint64_t v7 = *(void *)(a1 + 64);
    [v5 segmentForTrackTime:&v6];
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (BOOL)segmentsExcludeAudioPrimingAndRemainderDurations
{
  return [(AVAssetTrackInspector *)self->_track->trackInspector segmentsExcludeAudioPrimingAndRemainderDurations];
}

- ($1CE2C3FC342086196D07C2B4E8C70800)gaplessSourceTimeRange
{
  float result = ($1CE2C3FC342086196D07C2B4E8C70800 *)self->_track->trackInspector;
  if (result) {
    return ($1CE2C3FC342086196D07C2B4E8C70800 *)[($1CE2C3FC342086196D07C2B4E8C70800 *)result gaplessSourceTimeRange];
  }
  *(_OWORD *)&retstr->var0.var3 = 0u;
  *(_OWORD *)&retstr->var1.var1 = 0u;
  *(_OWORD *)&retstr->var0.var0 = 0u;
  return result;
}

- (id)segmentsAsPresented
{
  return [(AVAssetTrackInspector *)self->_track->trackInspector segmentsAsPresented];
}

- (CMTime)samplePresentationTimeForTrackTime:(SEL)a3
{
  float result = (CMTime *)self->_track->trackInspector;
  if (result)
  {
    CMTime v5 = *trackTime;
    return (CMTime *)[(CMTime *)result samplePresentationTimeForTrackTime:&v5];
  }
  else
  {
    retstr->value = 0;
    *(void *)&retstr->timescale = 0;
    retstr->epoch = 0;
  }
  return result;
}

- (void)loadSamplePresentationTimeForTrackTime:(CMTime *)trackTime completionHandler:(void *)completionHandler
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __73__AVAssetTrack_loadSamplePresentationTimeForTrackTime_completionHandler___block_invoke;
  v4[3] = &unk_1E57B33D8;
  CMTime v5 = *trackTime;
  v4[4] = self;
  v4[5] = completionHandler;
  AVLoadValueAsynchronously(self, @"segments", (uint64_t)v4);
}

uint64_t __73__AVAssetTrack_loadSamplePresentationTimeForTrackTime_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t v3 = *(void *)(a1 + 40);
    uint64_t v4 = *(uint64_t (**)(uint64_t, long long *, uint64_t))(*(void *)(a1 + 40) + 16);
    long long v11 = *MEMORY[0x1E4F1F9F8];
    uint64_t v12 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
    return v4(v3, &v11, a2);
  }
  else
  {
    long long v11 = 0uLL;
    uint64_t v12 = 0;
    long long v6 = *(void **)(a1 + 32);
    if (v6)
    {
      long long v9 = *(_OWORD *)(a1 + 48);
      uint64_t v10 = *(void *)(a1 + 64);
      [v6 samplePresentationTimeForTrackTime:&v9];
    }
    uint64_t v7 = *(void *)(a1 + 40);
    uint64_t v8 = *(uint64_t (**)(uint64_t, long long *, void))(v7 + 16);
    long long v9 = v11;
    uint64_t v10 = v12;
    return v8(v7, &v9, 0);
  }
}

- (NSArray)commonMetadata
{
  return [(AVAssetTrackInspector *)self->_track->trackInspector commonMetadata];
}

- (NSArray)availableMetadataFormats
{
  double v2 = [(AVAssetTrackInspector *)self->_track->trackInspector availableMetadataFormats];
  if (!+[AVMetadataItem _clientExpectsISOUserDataKeysInQuickTimeUserDataKeySpace]|| ![(NSArray *)v2 containsObject:@"org.mp4ra"])
  {
    return v2;
  }
  return [(NSArray *)v2 arrayByAddingObject:@"com.apple.quicktime.udta"];
}

- (NSArray)metadataForFormat:(AVMetadataFormat)format
{
  CMTime v5 = -[AVAssetTrackInspector metadataForFormat:](self->_track->trackInspector, "metadataForFormat:");
  if (!+[AVMetadataItem _clientExpectsISOUserDataKeysInQuickTimeUserDataKeySpace]|| ![(NSString *)format isEqualToString:@"com.apple.quicktime.udta"])
  {
    return v5;
  }
  id v6 = +[AVMetadataItem _replaceQuickTimeUserDataKeySpaceWithISOUserDataKeySpaceIfRequired:[(NSArray *)v5 arrayByAddingObjectsFromArray:[(AVAssetTrackInspector *)self->_track->trackInspector metadataForFormat:@"org.mp4ra"]]];
  return [(NSArray *)v5 arrayByAddingObjectsFromArray:v6];
}

- (void)loadMetadataForFormat:(AVMetadataFormat)format completionHandler:(void *)completionHandler
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __56__AVAssetTrack_loadMetadataForFormat_completionHandler___block_invoke;
  v4[3] = &unk_1E57B3180;
  v4[4] = self;
  v4[5] = format;
  void v4[6] = completionHandler;
  AVLoadValueAsynchronously(self, @"availableMetadataFormats", (uint64_t)v4);
}

uint64_t __56__AVAssetTrack_loadMetadataForFormat_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  if (!a2) {
    [*(id *)(a1 + 32) metadataForFormat:*(void *)(a1 + 40)];
  }
  uint64_t v3 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
  return v3();
}

- (NSArray)metadata
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(AVAssetTrack *)self availableMetadataFormats];
  uint64_t v4 = (NSArray *)[MEMORY[0x1E4F1CA48] array];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v3);
        }
        [(NSArray *)v4 addObjectsFromArray:[(AVAssetTrack *)self metadataForFormat:*(void *)(*((void *)&v10 + 1) + 8 * v8++)]];
      }
      while (v6 != v8);
      uint64_t v6 = [(NSArray *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
  return v4;
}

- (int64_t)alternateGroupID
{
  return [(AVAssetTrackInspector *)self->_track->trackInspector alternateGroupID];
}

- (int64_t)defaultAlternateGroupID
{
  return [(AVAssetTrackInspector *)self->_track->trackInspector defaultAlternateGroupID];
}

- (int64_t)provisionalAlternateGroupID
{
  return [(AVAssetTrackInspector *)self->_track->trackInspector provisionalAlternateGroupID];
}

- (BOOL)isExcludedFromAutoselectionInTrackGroup
{
  return [(AVAssetTrackInspector *)self->_track->trackInspector isExcludedFromAutoselectionInTrackGroup];
}

- (id)_firstAssociatedTrackWithAssociationType:(id)a3
{
  uint64_t v3 = [(AVAssetTrack *)self associatedTracksOfType:a3];
  id result = [(NSArray *)v3 count];
  if (result)
  {
    return [(NSArray *)v3 objectAtIndex:0];
  }
  return result;
}

- (id)_fallbackTrack
{
  return [(AVAssetTrack *)self _firstAssociatedTrackWithAssociationType:@"fall"];
}

- (id)_pairedForcedOnlySubtitlesTrack
{
  return [(AVAssetTrack *)self _firstAssociatedTrackWithAssociationType:@"forc"];
}

+ (BOOL)expectsPropertyRevisedNotifications
{
  return 1;
}

- (id)_trackReferences
{
  return [(AVAssetTrackInspector *)self->_track->trackInspector _trackReferences];
}

- (BOOL)hasProtectedContent
{
  return [(AVAssetTrackInspector *)self->_track->trackInspector hasProtectedContent];
}

- (BOOL)hasAudibleBooksContent
{
  return [(AVAssetTrackInspector *)self->_track->trackInspector hasAudibleBooksContent];
}

- (BOOL)isAudibleBooksContentAuthorized
{
  return [(AVAssetTrackInspector *)self->_track->trackInspector isAudibleBooksContentAuthorized];
}

- (BOOL)hasSeamSamples
{
  return [(AVAssetTrackInspector *)self->_track->trackInspector hasSeamSamples];
}

- (NSArray)availableTrackAssociationTypes
{
  id v2 = [(AVAssetTrack *)self _trackReferences];
  return (NSArray *)[v2 allKeys];
}

- (NSArray)associatedTracksOfType:(AVTrackAssociationType)trackAssociationType
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = objc_msgSend(-[AVAssetTrack _trackReferences](self, "_trackReferences"), "objectForKey:", trackAssociationType);
  if (!v4) {
    return (NSArray *)[MEMORY[0x1E4F1C978] array];
  }
  uint64_t v5 = v4;
  uint64_t v6 = (NSArray *)objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v5);
        }
        long long v11 = -[AVAsset trackWithTrackID:](-[AVAssetTrack asset](self, "asset"), "trackWithTrackID:", [*(id *)(*((void *)&v13 + 1) + 8 * v10) intValue]);
        if (v11) {
          [(NSArray *)v6 addObject:v11];
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }
  if (!v6) {
    return (NSArray *)[MEMORY[0x1E4F1C978] array];
  }
  return v6;
}

- (void)loadAssociatedTracksOfType:(AVTrackAssociationType)trackAssociationType completionHandler:(void *)completionHandler
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __61__AVAssetTrack_loadAssociatedTracksOfType_completionHandler___block_invoke;
  v4[3] = &unk_1E57B3180;
  v4[4] = self;
  v4[5] = trackAssociationType;
  void v4[6] = completionHandler;
  AVLoadValueAsynchronously(self, @"availableTrackAssociationTypes", (uint64_t)v4);
}

uint64_t __61__AVAssetTrack_loadAssociatedTracksOfType_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  if (!a2) {
    [*(id *)(a1 + 32) associatedTracksOfType:*(void *)(a1 + 40)];
  }
  uint64_t v3 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
  return v3();
}

- (BOOL)canProvideSampleCursors
{
  return [(AVAssetTrackInspector *)self->_track->trackInspector canProvideSampleCursors];
}

- (AVSampleCursor)makeSampleCursorWithPresentationTimeStamp:(CMTime *)presentationTimeStamp
{
  trackInspector = self->_track->trackInspector;
  CMTime v5 = *presentationTimeStamp;
  return (AVSampleCursor *)[(AVAssetTrackInspector *)trackInspector makeSampleCursorWithPresentationTimeStamp:&v5];
}

- (AVSampleCursor)makeSampleCursorAtFirstSampleInDecodeOrder
{
  return (AVSampleCursor *)[(AVAssetTrackInspector *)self->_track->trackInspector makeSampleCursorAtFirstSampleInDecodeOrder];
}

- (AVSampleCursor)makeSampleCursorAtLastSampleInDecodeOrder
{
  return (AVSampleCursor *)[(AVAssetTrackInspector *)self->_track->trackInspector makeSampleCursorAtLastSampleInDecodeOrder];
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  id v5 = [(AVAssetTrack *)self _assetTrackInspector];
  uint64_t v6 = [a3 _assetTrackInspector];
  return [v5 isEqual:v6];
}

- (unint64_t)hash
{
  return [(AVAssetTrackInspector *)self->_track->trackInspector hash];
}

+ (id)keyPathsForValuesAffectingTimeRange
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"segments", 0);
}

- (BOOL)_hasMultipleEdits
{
  return [(NSArray *)[(AVAssetTrack *)self segments] count] > 1;
}

- (BOOL)_hasScaledEdits
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v2 = [(AVAssetTrack *)self segments];
  uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v15;
    while (2)
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v15 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v14 + 1) + 8 * v6);
        if (v7)
        {
          [*(id *)(*((void *)&v14 + 1) + 8 * v6) timeMapping];
          CMTime time1 = *(CMTime *)((char *)v12 + 8);
          [v7 timeMapping];
        }
        else
        {
          long long v11 = 0u;
          memset(v12, 0, sizeof(v12));
          *(_OWORD *)&time1.value = *(_OWORD *)((char *)v12 + 8);
          time1.epoch = 0;
          memset(v9, 0, sizeof(v9));
        }
        CMTime time2 = *(CMTime *)&v9[1];
        if (CMTimeCompare(&time1, &time2))
        {
          LOBYTE(v3) = 1;
          return v3;
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
      uint64_t v4 = v3;
      if (v3) {
        continue;
      }
      break;
    }
  }
  return v3;
}

- (BOOL)_hasEmptyEdits
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v2 = [(AVAssetTrack *)self segments];
  uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if (v7)
        {
          [v7 timeMapping];
          if (v9) {
            continue;
          }
        }
        LOBYTE(v3) = 1;
        return v3;
      }
      uint64_t v4 = [(NSArray *)v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
      LOBYTE(v3) = 0;
      if (v4) {
        continue;
      }
      break;
    }
  }
  return v3;
}

- (BOOL)_hasMultipleDistinctFormatDescriptions
{
  id v2 = [(AVAssetTrack *)self formatDescriptions];
  unint64_t v3 = [(NSArray *)v2 count];
  uint64_t v4 = [(NSArray *)v2 firstObject];
  if (v3 < 2) {
    return 0;
  }
  uint64_t v5 = v4;
  BOOL v6 = 1;
  if (CMFormatDescriptionEqual((CMFormatDescriptionRef)[(NSArray *)v2 objectAtIndex:1], v4))
  {
    uint64_t v7 = 2;
    do
    {
      unint64_t v8 = v7;
      if (v3 == v7) {
        break;
      }
      int v9 = CMFormatDescriptionEqual((CMFormatDescriptionRef)[(NSArray *)v2 objectAtIndex:v7], v5);
      uint64_t v7 = v8 + 1;
    }
    while (v9);
    return v8 < v3;
  }
  return v6;
}

- (BOOL)_firstFormatDescriptionIsLPCM
{
  id v2 = [(AVAssetTrack *)self formatDescriptions];
  uint64_t v3 = [(NSArray *)v2 count];
  if (v3) {
    LOBYTE(v3) = CMFormatDescriptionGetMediaSubType((CMFormatDescriptionRef)[(NSArray *)v2 firstObject]) == 1819304813;
  }
  return v3;
}

- (BOOL)isDefunct
{
  id v2 = [(AVAssetTrack *)self _assetTrackInspector];
  return [v2 _isDefunct];
}

@end