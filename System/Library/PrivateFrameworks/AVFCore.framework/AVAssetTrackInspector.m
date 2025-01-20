@interface AVAssetTrackInspector
+ (AVAssetTrackInspector)assetTrackInspectorWithAsset:(id)a3 trackID:(int)a4 trackIndex:(int64_t)a5;
- ($1CE2C3FC342086196D07C2B4E8C70800)gaplessSourceTimeRange;
- ($1CE2C3FC342086196D07C2B4E8C70800)mediaDecodeTimeRange;
- ($1CE2C3FC342086196D07C2B4E8C70800)mediaPresentationTimeRange;
- ($1CE2C3FC342086196D07C2B4E8C70800)timeRange;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)latentBaseDecodeTimeStampOfFirstTrackFragment;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)minSampleDuration;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)samplePresentationTimeForTrackTime:(SEL)a3;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)uneditedDuration;
- (AVAssetTrackInspector)init;
- (BOOL)_isDefunct;
- (BOOL)canProvideSampleCursors;
- (BOOL)hasAudibleBooksContent;
- (BOOL)hasAudioSampleDependencies;
- (BOOL)hasProtectedContent;
- (BOOL)hasSeamSamples;
- (BOOL)isAudibleBooksContentAuthorized;
- (BOOL)isDecodable;
- (BOOL)isEnabled;
- (BOOL)isExcludedFromAutoselectionInTrackGroup;
- (BOOL)isPlayable;
- (BOOL)isSelfContained;
- (BOOL)requiresFrameReordering;
- (BOOL)segmentsExcludeAudioPrimingAndRemainderDurations;
- (CGAffineTransform)preferredTransform;
- (CGSize)dimensions;
- (CGSize)naturalSize;
- (NSArray)availableMetadataFormats;
- (NSArray)commonMetadata;
- (NSArray)formatDescriptions;
- (NSArray)mediaCharacteristics;
- (NSArray)segments;
- (NSDictionary)_trackReferences;
- (NSDictionary)loudnessInfo;
- (NSLocale)locale;
- (NSString)extendedLanguageTag;
- (NSString)languageCode;
- (NSString)mediaType;
- (OpaqueFigAssetTrack)_figAssetTrack;
- (OpaqueFigFormatReader)_figFormatReader;
- (OpaqueFigSampleCursorService)_getFigSampleCursorServiceReportingTimeAccuracy:(BOOL *)a3;
- (OpaqueFigTrackReader)_figTrackReader;
- (float)estimatedDataRate;
- (float)nominalFrameRate;
- (float)peakDataRate;
- (float)preferredVolume;
- (id)_initWithAsset:(id)a3 trackID:(int)a4;
- (id)_initWithAsset:(id)a3 trackID:(int)a4 trackIndex:(int64_t)a5;
- (id)_initWithAsset:(id)a3 trackIndex:(int64_t)a4;
- (id)_segmentsForSegmentData:(id)a3;
- (id)_weakReference;
- (id)makeSampleCursorAtFirstSampleInDecodeOrder;
- (id)makeSampleCursorAtLastSampleInDecodeOrder;
- (id)makeSampleCursorWithPresentationTimeStamp:(id *)a3;
- (id)metadataForFormat:(id)a3;
- (id)segmentForTrackTime:(id *)a3;
- (int)naturalTimeScale;
- (int)playabilityValidationResult;
- (int)trackID;
- (int64_t)alternateGroupID;
- (int64_t)defaultAlternateGroupID;
- (int64_t)layer;
- (int64_t)provisionalAlternateGroupID;
- (int64_t)statusOfValueForKey:(id)a3 error:(id *)a4;
- (int64_t)totalSampleDataLength;
- (unsigned)_figMediaType;
- (void)dealloc;
- (void)loadValuesAsynchronouslyForKeys:(id)a3 completionHandler:(id)a4;
@end

@implementation AVAssetTrackInspector

+ (AVAssetTrackInspector)assetTrackInspectorWithAsset:(id)a3 trackID:(int)a4 trackIndex:(int64_t)a5
{
  v5 = objc_msgSend(objc_alloc((Class)objc_msgSend(a3, "_classForTrackInspectors")), "_initWithAsset:trackID:trackIndex:", a3, *(void *)&a4, a5);
  return (AVAssetTrackInspector *)v5;
}

- (id)_weakReference
{
  return self->_weakReference;
}

- (id)_initWithAsset:(id)a3 trackID:(int)a4 trackIndex:(int64_t)a5
{
  v7.receiver = self;
  v7.super_class = (Class)AVAssetTrackInspector;
  v5 = [(AVAssetTrackInspector *)&v7 init];
  if (v5)
  {
    v5->_weakReference = [[AVWeakReference alloc] initWithReferencedObject:v5];
    v5->_synthesizeMediaCharacteristicsOnce = objc_alloc_init(AVDispatchOnce);
  }
  return v5;
}

- (id)_initWithAsset:(id)a3 trackID:(int)a4
{
  return [(AVAssetTrackInspector *)self _initWithAsset:a3 trackID:*(void *)&a4 trackIndex:-1];
}

- (id)_initWithAsset:(id)a3 trackIndex:(int64_t)a4
{
  return [(AVAssetTrackInspector *)self _initWithAsset:a3 trackID:0 trackIndex:a4];
}

- (AVAssetTrackInspector)init
{
  return (AVAssetTrackInspector *)[(AVAssetTrackInspector *)self _initWithAsset:0 trackID:0 trackIndex:-1];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AVAssetTrackInspector;
  [(AVAssetTrackInspector *)&v3 dealloc];
}

- (int64_t)statusOfValueForKey:(id)a3 error:(id *)a4
{
  if (a4) {
    *a4 = 0;
  }
  return 2;
}

- (void)loadValuesAsynchronouslyForKeys:(id)a3 completionHandler:(id)a4
{
  if (a4) {
    (*((void (**)(id))a4 + 2))(a4);
  }
}

- (int)trackID
{
  return 0;
}

- (unsigned)_figMediaType
{
  return 0;
}

- (OpaqueFigTrackReader)_figTrackReader
{
  return 0;
}

- (OpaqueFigAssetTrack)_figAssetTrack
{
  return 0;
}

- (OpaqueFigFormatReader)_figFormatReader
{
  return 0;
}

- (NSString)mediaType
{
  return 0;
}

- (NSArray)formatDescriptions
{
  return (NSArray *)[MEMORY[0x1E4F1C978] array];
}

- (BOOL)isPlayable
{
  return 1;
}

- (BOOL)isDecodable
{
  return 1;
}

- (int)playabilityValidationResult
{
  return 0;
}

- (BOOL)isEnabled
{
  return 0;
}

- (BOOL)isSelfContained
{
  return 0;
}

- (int64_t)totalSampleDataLength
{
  return 0;
}

- ($1CE2C3FC342086196D07C2B4E8C70800)timeRange
{
  uint64_t v3 = MEMORY[0x1E4F1FA20];
  long long v4 = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 16);
  *(_OWORD *)&retstr->var0.var0 = *MEMORY[0x1E4F1FA20];
  *(_OWORD *)&retstr->var0.var3 = v4;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)(v3 + 32);
  return self;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)uneditedDuration
{
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)*(void *)&MEMORY[0x1E4F1F9F8];
  return self;
}

- ($1CE2C3FC342086196D07C2B4E8C70800)mediaPresentationTimeRange
{
  uint64_t v3 = MEMORY[0x1E4F1FA20];
  long long v4 = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 16);
  *(_OWORD *)&retstr->var0.var0 = *MEMORY[0x1E4F1FA20];
  *(_OWORD *)&retstr->var0.var3 = v4;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)(v3 + 32);
  return self;
}

- ($1CE2C3FC342086196D07C2B4E8C70800)mediaDecodeTimeRange
{
  uint64_t v3 = MEMORY[0x1E4F1FA20];
  long long v4 = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 16);
  *(_OWORD *)&retstr->var0.var0 = *MEMORY[0x1E4F1FA20];
  *(_OWORD *)&retstr->var0.var3 = v4;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)(v3 + 32);
  return self;
}

- (BOOL)requiresFrameReordering
{
  return 0;
}

- (BOOL)hasAudioSampleDependencies
{
  return 0;
}

- (int)naturalTimeScale
{
  return 600;
}

- (float)estimatedDataRate
{
  return 0.0;
}

- (float)peakDataRate
{
  return 0.0;
}

- (NSString)languageCode
{
  return 0;
}

- (NSArray)mediaCharacteristics
{
  synthesizeMediaCharacteristicsOnce = self->_synthesizeMediaCharacteristicsOnce;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __45__AVAssetTrackInspector_mediaCharacteristics__block_invoke;
  v5[3] = &unk_1E57B1E80;
  v5[4] = self;
  [(AVDispatchOnce *)synthesizeMediaCharacteristicsOnce runBlockOnce:v5];
  return self->_cachedMediaCharacteristics;
}

void *__45__AVAssetTrackInspector_mediaCharacteristics__block_invoke(uint64_t a1)
{
  result = AVSynthesizeAVMediaCharacteristicsFromFigValues((void *)[*(id *)(a1 + 32) _arrayForProperty:*MEMORY[0x1E4F348A8]], objc_msgSend(*(id *)(a1 + 32), "_figMediaType"));
  *(void *)(*(void *)(a1 + 32) + 24) = result;
  return result;
}

- (NSString)extendedLanguageTag
{
  return 0;
}

- (NSLocale)locale
{
  CFStringRef v3 = [(AVAssetTrackInspector *)self extendedLanguageTag];
  if (v3 || (v4 = [(AVAssetTrackInspector *)self languageCode], (CFStringRef v3 = (const __CFString *)v4) != 0)) {
    long long v4 = (NSString *)CFLocaleCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v3);
  }
  return (NSLocale *)v4;
}

- (CGSize)naturalSize
{
  double v2 = 0.0;
  double v3 = 0.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)dimensions
{
  double v2 = 0.0;
  double v3 = 0.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGAffineTransform)preferredTransform
{
  uint64_t v3 = MEMORY[0x1E4F1DAB8];
  long long v4 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&retstr->c = v4;
  *(_OWORD *)&retstr->tx = *(_OWORD *)(v3 + 32);
  return self;
}

- (int64_t)layer
{
  return 0;
}

- (float)preferredVolume
{
  return 1.0;
}

- (NSDictionary)loudnessInfo
{
  return 0;
}

- (float)nominalFrameRate
{
  return 0.0;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)minSampleDuration
{
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)*(void *)&MEMORY[0x1E4F1F9F8];
  return self;
}

- (id)_segmentsForSegmentData:(id)a3
{
  unint64_t v4 = [a3 length];
  if (v4 < 0x60) {
    return (id)[MEMORY[0x1E4F1C978] array];
  }
  unint64_t v5 = v4 / 0x60;
  v6 = (_OWORD *)[a3 bytes];
  objc_super v7 = (void *)[MEMORY[0x1E4F1CA48] arrayWithCapacity:v5];
  if (v5 <= 1) {
    unint64_t v5 = 1;
  }
  do
  {
    v8 = [AVAssetTrackSegment alloc];
    long long v9 = v6[1];
    v14[0] = *v6;
    v14[1] = v9;
    long long v10 = v6[2];
    long long v11 = v6[3];
    long long v12 = v6[5];
    v14[4] = v6[4];
    v14[5] = v12;
    v14[2] = v10;
    v14[3] = v11;
    objc_msgSend(v7, "addObject:", -[AVAssetTrackSegment _initWithTimeMapping:](v8, "_initWithTimeMapping:", v14));
    v6 += 6;
    --v5;
  }
  while (v5);
  if (!v7) {
    return (id)[MEMORY[0x1E4F1C978] array];
  }
  return v7;
}

- (NSArray)segments
{
  return (NSArray *)[MEMORY[0x1E4F1C978] array];
}

- (BOOL)segmentsExcludeAudioPrimingAndRemainderDurations
{
  return 0;
}

- ($1CE2C3FC342086196D07C2B4E8C70800)gaplessSourceTimeRange
{
  uint64_t v3 = MEMORY[0x1E4F1FA20];
  long long v4 = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 16);
  *(_OWORD *)&retstr->var0.var0 = *MEMORY[0x1E4F1FA20];
  *(_OWORD *)&retstr->var0.var3 = v4;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)(v3 + 32);
  return self;
}

- (id)segmentForTrackTime:(id *)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  long long v4 = [(AVAssetTrackInspector *)self segments];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (!v5) {
    goto LABEL_26;
  }
  uint64_t v6 = v5;
  objc_super v7 = 0;
  uint64_t v8 = *(void *)v25;
  do
  {
    for (uint64_t i = 0; i != v6; ++i)
    {
      if (*(void *)v25 != v8) {
        objc_enumerationMutation(v4);
      }
      long long v10 = *(void **)(*((void *)&v24 + 1) + 8 * i);
      if (v10)
      {
        [*(id *)(*((void *)&v24 + 1) + 8 * i) timeMapping];
      }
      else
      {
        long long v22 = 0u;
        memset(&v23, 0, sizeof(v23));
        long long v20 = 0u;
        long long v21 = 0u;
      }
      CMTimeRange range = v23;
      CMTime time = (CMTime)*a3;
      if (CMTimeRangeContainsTime(&range, &time)) {
        objc_super v7 = v10;
      }
    }
    uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v24 objects:v28 count:16];
  }
  while (v6);
  if (!v7)
  {
LABEL_26:
    if ([(NSArray *)v4 count])
    {
      long long v17 = 0u;
      long long v18 = 0u;
      long long v16 = 0u;
      memset(&range, 0, sizeof(range));
      id v11 = [(NSArray *)v4 firstObject];
      if (v11)
      {
        [v11 timeMapping];
      }
      else
      {
        long long v17 = 0u;
        long long v18 = 0u;
        long long v16 = 0u;
        memset(&range, 0, sizeof(range));
      }
      CMTime time = (CMTime)*a3;
      *(_OWORD *)&v14.value = v16;
      v14.epoch = v17;
      if (CMTimeCompare(&time, &v14) < 0) {
        return [(NSArray *)v4 firstObject];
      }
      else {
        return [(NSArray *)v4 lastObject];
      }
    }
    else
    {
      return 0;
    }
  }
  return v7;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)samplePresentationTimeForTrackTime:(SEL)a3
{
  v14[0] = *a4;
  CGSize result = [(AVAssetTrackInspector *)self segmentForTrackTime:v14];
  if (!result) {
    goto LABEL_14;
  }
  memset(v16, 0, sizeof(v16));
  long long v15 = 0u;
  memset(v14, 0, sizeof(v14));
  CGSize result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)[($3CC8671D27C23BF42ADDB32F2B5E48AE *)result timeMapping];
  if ((v14[0].var2 & 1) == 0) {
    goto LABEL_14;
  }
  if ((v14[1].var2 & 1) == 0) {
    goto LABEL_14;
  }
  if (v14[1].var3) {
    goto LABEL_14;
  }
  if (v14[1].var0 < 0) {
    goto LABEL_14;
  }
  if ((BYTE12(v15) & 1) == 0) {
    goto LABEL_14;
  }
  if ((BYTE4(v16[1]) & 1) == 0) {
    goto LABEL_14;
  }
  if (*((void *)&v16[1] + 1)) {
    goto LABEL_14;
  }
  if ((*((void *)&v16[0] + 1) & 0x8000000000000000) != 0) {
    goto LABEL_14;
  }
  CMTime time = *(CMTime *)((char *)v16 + 8);
  double Seconds = CMTimeGetSeconds(&time);
  CMTime time = (CMTime)v14[1];
  double v8 = CMTimeGetSeconds(&time);
  memset(&time, 0, sizeof(time));
  CMTime lhs = (CMTime)*a4;
  *(_OWORD *)&rhs.value = v15;
  rhs.epoch = *(void *)&v16[0];
  CGSize result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMTimeSubtract(&time, &lhs, &rhs);
  if (Seconds <= 0.0) {
    goto LABEL_14;
  }
  if ((time.flags & 0x1D) == 1
    && (memset(&lhs, 0, sizeof(lhs)),
        CMTime rhs = time,
        CGSize result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMTimeMultiplyByFloat64(&lhs, &rhs, v8 / Seconds),
        (lhs.flags & 0x1D) == 1))
  {
    CMTime rhs = lhs;
    CMTime v10 = (CMTime)v14[0];
    return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMTimeAdd((CMTime *)retstr, &rhs, &v10);
  }
  else
  {
LABEL_14:
    uint64_t v9 = MEMORY[0x1E4F1F9F8];
    *(_OWORD *)&retstr->var0 = *MEMORY[0x1E4F1F9F8];
    retstr->var3 = *(void *)(v9 + 16);
  }
  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)latentBaseDecodeTimeStampOfFirstTrackFragment
{
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)*(void *)&MEMORY[0x1E4F1F9F8];
  return self;
}

- (NSArray)commonMetadata
{
  return (NSArray *)[MEMORY[0x1E4F1C978] array];
}

- (NSArray)availableMetadataFormats
{
  return (NSArray *)[MEMORY[0x1E4F1C978] array];
}

- (id)metadataForFormat:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E4F1C978], "array", a3);
}

- (int64_t)alternateGroupID
{
  return 0;
}

- (int64_t)defaultAlternateGroupID
{
  return 0;
}

- (int64_t)provisionalAlternateGroupID
{
  return 0;
}

- (BOOL)isExcludedFromAutoselectionInTrackGroup
{
  return 0;
}

- (NSDictionary)_trackReferences
{
  return (NSDictionary *)[MEMORY[0x1E4F1C9E8] dictionary];
}

- (BOOL)hasProtectedContent
{
  double v2 = [(AVAssetTrackInspector *)self formatDescriptions];
  if (v2)
  {
    CFArrayRef v3 = (const __CFArray *)v2;
    CFIndex Count = CFArrayGetCount((CFArrayRef)v2);
    if (Count < 1)
    {
      LOBYTE(v2) = 0;
    }
    else
    {
      CFIndex v5 = Count;
      CFArrayGetValueAtIndex(v3, 0);
      if (FigCPEIsSupportedFormatDescription())
      {
        LOBYTE(v2) = 1;
      }
      else
      {
        CFIndex v6 = 1;
        do
        {
          CFIndex v7 = v6;
          if (v5 == v6) {
            break;
          }
          CFArrayGetValueAtIndex(v3, v6);
          int v8 = FigCPEIsSupportedFormatDescription();
          CFIndex v6 = v7 + 1;
        }
        while (!v8);
        LOBYTE(v2) = v7 < v5;
      }
    }
  }
  return (char)v2;
}

- (BOOL)hasAudibleBooksContent
{
  return 0;
}

- (BOOL)isAudibleBooksContentAuthorized
{
  return 0;
}

- (BOOL)hasSeamSamples
{
  return 0;
}

- (BOOL)canProvideSampleCursors
{
  return [(AVAssetTrackInspector *)self _getFigSampleCursorServiceReportingTimeAccuracy:0] != 0;
}

- (id)makeSampleCursorWithPresentationTimeStamp:(id *)a3
{
  CFTypeRef cf = 0;
  char v14 = 0;
  long long v4 = [(AVAssetTrackInspector *)self _getFigSampleCursorServiceReportingTimeAccuracy:&v14];
  if (v4)
  {
    if (v14)
    {
      long long v12 = *(_OWORD *)&a3->var0;
      int64_t var3 = a3->var3;
      uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 16);
      if (v5) {
        uint64_t v6 = v5;
      }
      else {
        uint64_t v6 = 0;
      }
      uint64_t v9 = *(unsigned int (**)(OpaqueFigSampleCursorService *, long long *, CFTypeRef *, void, void))(v6 + 8);
      if (!v9 || (long long v16 = v12, v17 = var3, v9(v4, &v16, &cf, 0, 0)))
      {
LABEL_15:
        long long v4 = 0;
        goto LABEL_16;
      }
    }
    else
    {
      long long v12 = *(_OWORD *)&a3->var0;
      int64_t var3 = a3->var3;
      uint64_t v7 = *(void *)(CMBaseObjectGetVTable() + 16);
      if (v7) {
        uint64_t v8 = v7;
      }
      else {
        uint64_t v8 = 0;
      }
      CMTime v10 = *(unsigned int (**)(OpaqueFigSampleCursorService *, long long *, uint64_t, CFTypeRef *, void, void))(v8 + 16);
      if (!v10) {
        goto LABEL_15;
      }
      long long v16 = v12;
      int64_t v17 = var3;
      if (v10(v4, &v16, 1, &cf, 0, 0)) {
        goto LABEL_15;
      }
    }
    long long v4 = +[AVSampleCursor sampleCursorWithFigSampleCursor:](AVSampleCursor, "sampleCursorWithFigSampleCursor:", cf, v12, var3);
  }
LABEL_16:
  if (cf) {
    CFRelease(cf);
  }
  return v4;
}

- (id)makeSampleCursorAtFirstSampleInDecodeOrder
{
  CFTypeRef cf = 0;
  double v2 = [(AVAssetTrackInspector *)self _getFigSampleCursorServiceReportingTimeAccuracy:0];
  if (v2)
  {
    uint64_t v3 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v3) {
      uint64_t v4 = v3;
    }
    else {
      uint64_t v4 = 0;
    }
    uint64_t v5 = *(uint64_t (**)(OpaqueFigSampleCursorService *, CFTypeRef *))(v4 + 24);
    if (!v5) {
      return 0;
    }
    int v6 = v5(v2, &cf);
    CFTypeRef v7 = cf;
    if (v6)
    {
      double v2 = 0;
      if (!cf) {
        return v2;
      }
      goto LABEL_8;
    }
    double v2 = +[AVSampleCursor sampleCursorWithFigSampleCursor:cf];
    CFTypeRef v7 = cf;
    if (cf) {
LABEL_8:
    }
      CFRelease(v7);
  }
  return v2;
}

- (id)makeSampleCursorAtLastSampleInDecodeOrder
{
  CFTypeRef cf = 0;
  double v2 = [(AVAssetTrackInspector *)self _getFigSampleCursorServiceReportingTimeAccuracy:0];
  if (v2)
  {
    uint64_t v3 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v3) {
      uint64_t v4 = v3;
    }
    else {
      uint64_t v4 = 0;
    }
    uint64_t v5 = *(uint64_t (**)(OpaqueFigSampleCursorService *, CFTypeRef *))(v4 + 32);
    if (!v5) {
      return 0;
    }
    int v6 = v5(v2, &cf);
    CFTypeRef v7 = cf;
    if (v6)
    {
      double v2 = 0;
      if (!cf) {
        return v2;
      }
      goto LABEL_8;
    }
    double v2 = +[AVSampleCursor sampleCursorWithFigSampleCursor:cf];
    CFTypeRef v7 = cf;
    if (cf) {
LABEL_8:
    }
      CFRelease(v7);
  }
  return v2;
}

- (OpaqueFigSampleCursorService)_getFigSampleCursorServiceReportingTimeAccuracy:(BOOL *)a3
{
  return 0;
}

- (BOOL)_isDefunct
{
  return 0;
}

@end