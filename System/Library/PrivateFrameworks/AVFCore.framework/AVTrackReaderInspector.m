@interface AVTrackReaderInspector
- ($1CE2C3FC342086196D07C2B4E8C70800)timeRange;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)latentBaseDecodeTimeStampOfFirstTrackFragment;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)minSampleDuration;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)uneditedDuration;
- (BOOL)hasAudioSampleDependencies;
- (BOOL)hasSeamSamples;
- (BOOL)isDecodable;
- (BOOL)isEnabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)isExcludedFromAutoselectionInTrackGroup;
- (BOOL)isPlayable;
- (BOOL)isSelfContained;
- (BOOL)requiresFrameReordering;
- (CGAffineTransform)preferredTransform;
- (CGSize)dimensions;
- (CGSize)naturalSize;
- (OpaqueFigFormatReader)_figFormatReader;
- (OpaqueFigSampleCursorService)_getFigSampleCursorServiceReportingTimeAccuracy:(BOOL *)a3;
- (OpaqueFigTrackReader)_figTrackReader;
- (float)estimatedDataRate;
- (float)nominalFrameRate;
- (float)peakDataRate;
- (float)preferredVolume;
- (id)_initWithAsset:(id)a3 trackID:(int)a4 trackIndex:(int64_t)a5;
- (id)_segmentsPreferringNominalDurations:(BOOL)a3;
- (id)_trackReferences;
- (id)asset;
- (id)availableMetadataFormats;
- (id)commonMetadata;
- (id)extendedLanguageTag;
- (id)formatDescriptions;
- (id)languageCode;
- (id)loudnessInfo;
- (id)mediaCharacteristics;
- (id)mediaType;
- (id)metadataForFormat:(id)a3;
- (id)segments;
- (id)segmentsAsPresented;
- (int)decodabilityValidationResult;
- (int)naturalTimeScale;
- (int)playabilityValidationResult;
- (int)trackID;
- (int64_t)alternateGroupID;
- (int64_t)defaultAlternateGroupID;
- (int64_t)layer;
- (int64_t)provisionalAlternateGroupID;
- (int64_t)totalSampleDataLength;
- (unint64_t)hash;
- (unsigned)_figMediaType;
- (void)_valueAsCFTypeForProperty:(__CFString *)a3;
- (void)dealloc;
@end

@implementation AVTrackReaderInspector

- (id)_initWithAsset:(id)a3 trackID:(int)a4 trackIndex:(int64_t)a5
{
  uint64_t v6 = *(void *)&a4;
  int v21 = a4;
  v20.receiver = self;
  v20.super_class = (Class)AVTrackReaderInspector;
  v8 = -[AVAssetTrackInspector _initWithAsset:trackID:trackIndex:](&v20, sel__initWithAsset_trackID_trackIndex_);
  if (v8)
  {
    if (a3)
    {
      uint64_t v19 = 0;
      int v18 = 0;
      uint64_t v9 = [a3 _copyFormatReader];
      v8[4] = v9;
      if (v9)
      {
        uint64_t v10 = v9;
        if (v6)
        {
          uint64_t v11 = *(void *)(CMBaseObjectGetVTable() + 16);
          if (v11) {
            uint64_t v12 = v11;
          }
          else {
            uint64_t v12 = 0;
          }
          v15 = *(void (**)(uint64_t, uint64_t, uint64_t *, int *))(v12 + 56);
          if (v15) {
            v15(v10, v6, &v19, &v18);
          }
        }
        else if ((a5 & 0x8000000000000000) == 0)
        {
          uint64_t v13 = *(void *)(CMBaseObjectGetVTable() + 16);
          uint64_t v14 = v13 ? v13 : 0;
          v16 = *(void (**)(uint64_t, int64_t, uint64_t *, int *, int *))(v14 + 48);
          if (v16) {
            v16(v10, a5, &v19, &v18, &v21);
          }
        }
      }
      if (!v19) {
        goto LABEL_20;
      }
      v8[5] = v19;
      v8[6] = objc_alloc_init(AVDispatchOnce);
      *((_DWORD *)v8 + 17) = v21;
      *((_DWORD *)v8 + 18) = v18;
      *((unsigned char *)v8 + 88) = [a3 _prefersNominalDurations];
      v8[10] = (id)[a3 _weakReference];
    }
    if (!v8[5])
    {
LABEL_20:

      return 0;
    }
  }
  return v8;
}

- (void)dealloc
{
  formatReader = self->_formatReader;
  if (formatReader) {
    CFRelease(formatReader);
  }
  trackReader = self->_trackReader;
  if (trackReader) {
    CFRelease(trackReader);
  }

  figSampleCursorService = self->_figSampleCursorService;
  if (figSampleCursorService) {
    CFRelease(figSampleCursorService);
  }
  v6.receiver = self;
  v6.super_class = (Class)AVTrackReaderInspector;
  [(AVAssetTrackInspector *)&v6 dealloc];
}

- (id)asset
{
  return [(AVWeakReference *)self->_weakReferenceToAsset referencedObject];
}

- (int)trackID
{
  return self->_trackID;
}

- (unsigned)_figMediaType
{
  return self->_mediaType;
}

- (id)mediaType
{
  int v2 = bswap32(self->_mediaType);
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"%c%c%c%c", (char)v2, ((__int16)v2 >> 8), (v2 << 8 >> 24), (v2 >> 24));
}

- (OpaqueFigTrackReader)_figTrackReader
{
  return self->_trackReader;
}

- (OpaqueFigFormatReader)_figFormatReader
{
  return self->_formatReader;
}

- (OpaqueFigSampleCursorService)_getFigSampleCursorServiceReportingTimeAccuracy:(BOOL *)a3
{
  copySampleCursorServiceOnce = self->_copySampleCursorServiceOnce;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __74__AVTrackReaderInspector__getFigSampleCursorServiceReportingTimeAccuracy___block_invoke;
  v7[3] = &unk_1E57B1E80;
  v7[4] = self;
  [(AVDispatchOnce *)copySampleCursorServiceOnce runBlockOnce:v7];
  if (a3) {
    *a3 = self->_sampleCursorTimeAccuracyIsExact;
  }
  return self->_figSampleCursorService;
}

void __74__AVTrackReaderInspector__getFigSampleCursorServiceReportingTimeAccuracy___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(v1 + 40);
  if (v2)
  {
    uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v4) {
      uint64_t v5 = v4;
    }
    else {
      uint64_t v5 = 0;
    }
    objc_super v6 = *(void (**)(uint64_t, uint64_t))(v5 + 32);
    if (v6) {
      v6(v2, v1 + 56);
    }
    uint64_t v12 = 0;
    uint64_t FigBaseObject = FigFormatReaderGetFigBaseObject();
    uint64_t v8 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v8) {
      uint64_t v9 = v8;
    }
    else {
      uint64_t v9 = 0;
    }
    uint64_t v10 = *(void (**)(uint64_t, void, void, const void **))(v9 + 48);
    if (v10)
    {
      v10(FigBaseObject, *MEMORY[0x1E4F32B90], *MEMORY[0x1E4F1CF80], &v12);
      uint64_t v11 = v12;
    }
    else
    {
      uint64_t v11 = 0;
    }
    *(unsigned char *)(*(void *)(a1 + 32) + 64) = v11 == (const void *)*MEMORY[0x1E4F1CFD0];
    if (v11) {
      CFRelease(v11);
    }
  }
}

- (void)_valueAsCFTypeForProperty:(__CFString *)a3
{
  uint64_t v9 = 0;
  result = [(AVTrackReaderInspector *)self _figTrackReader];
  if (result)
  {
    uint64_t FigBaseObject = FigTrackReaderGetFigBaseObject();
    uint64_t v6 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v6) {
      uint64_t v7 = v6;
    }
    else {
      uint64_t v7 = 0;
    }
    uint64_t v8 = *(void (**)(uint64_t, __CFString *, void, void **))(v7 + 48);
    if (v8)
    {
      v8(FigBaseObject, a3, *MEMORY[0x1E4F1CF80], &v9);
      return v9;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (id)formatDescriptions
{
  return [(AVFigObjectInspector *)self _nonNilArrayForProperty:*MEMORY[0x1E4F34A10]];
}

- (BOOL)isEnabled
{
  return [(AVFigObjectInspector *)self _BOOLeanForProperty:*MEMORY[0x1E4F349D0]] != 0;
}

- (BOOL)isSelfContained
{
  return [(AVFigObjectInspector *)self _BOOLeanForProperty:*MEMORY[0x1E4F34AA8]] != 0;
}

- (BOOL)isPlayable
{
  return [(AVTrackReaderInspector *)self playabilityValidationResult] == 0;
}

- (int)playabilityValidationResult
{
  id v3 = +[AVURLAsset _avfValidationPlist];
  if (!v3) {
    return -50;
  }
  id v4 = v3;
  uint64_t v5 = [(AVTrackReaderInspector *)self _figTrackReader];
  if (!v5) {
    return -50;
  }
  uint64_t v6 = v5;
  formatReader = self->_formatReader;
  return MEMORY[0x1F40ED698](formatReader, v6, v4);
}

- (BOOL)isDecodable
{
  return [(AVTrackReaderInspector *)self decodabilityValidationResult] == 0;
}

- (int)decodabilityValidationResult
{
  id v3 = +[AVURLAsset _avfValidationPlist];
  if (!v3) {
    return -50;
  }
  id v4 = v3;
  uint64_t v5 = [(AVTrackReaderInspector *)self _figTrackReader];
  if (!v5) {
    return -50;
  }
  uint64_t v6 = v5;
  formatReader = self->_formatReader;
  return MEMORY[0x1F40ED6A0](formatReader, v6, v4);
}

- (int64_t)totalSampleDataLength
{
  return [(AVFigObjectInspector *)self _longLongForProperty:*MEMORY[0x1E4F34AC8]];
}

- ($1CE2C3FC342086196D07C2B4E8C70800)timeRange
{
  id v4 = [(AVTrackReaderInspector *)self segments];
  result = ($1CE2C3FC342086196D07C2B4E8C70800 *)[v4 count];
  uint64_t v6 = (char *)&result[-1].var1.var3 + 7;
  if (result == ($1CE2C3FC342086196D07C2B4E8C70800 *)1)
  {
    result = ($1CE2C3FC342086196D07C2B4E8C70800 *)[v4 objectAtIndex:0];
    if (result)
    {
      result = ($1CE2C3FC342086196D07C2B4E8C70800 *)[($1CE2C3FC342086196D07C2B4E8C70800 *)result timeMapping];
    }
    else
    {
      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
    }
    long long v11 = v30;
    *(_OWORD *)&retstr->var0.var0 = v29;
    *(_OWORD *)&retstr->var0.var3 = v11;
    long long v9 = v31;
    goto LABEL_10;
  }
  if (!result)
  {
    uint64_t v7 = MEMORY[0x1E4F1FA20];
    long long v8 = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 16);
    *(_OWORD *)&retstr->var0.var0 = *MEMORY[0x1E4F1FA20];
    *(_OWORD *)&retstr->var0.var3 = v8;
    long long v9 = *(_OWORD *)(v7 + 32);
LABEL_10:
    *(_OWORD *)&retstr->var1.var1 = v9;
    return result;
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v10 = (void *)[v4 objectAtIndex:0];
  if (v10)
  {
    [v10 timeMapping];
  }
  else
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
  }
  long long v18 = 0u;
  memset(&v19, 0, sizeof(v19));
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v12 = (void *)[v4 objectAtIndex:v6];
  if (v12)
  {
    [v12 timeMapping];
  }
  else
  {
    long long v18 = 0u;
    memset(&v19, 0, sizeof(v19));
    long long v16 = 0u;
    long long v17 = 0u;
  }
  CMTimeRange v13 = v19;
  CMTimeRangeGetEnd(&lhs, &v13);
  *(_OWORD *)&v13.start.value = v23;
  v13.start.epoch = v24;
  CMTimeSubtract(&duration, &lhs, &v13.start);
  *(_OWORD *)&v13.start.value = v23;
  v13.start.epoch = v24;
  return ($1CE2C3FC342086196D07C2B4E8C70800 *)CMTimeRangeMake((CMTimeRange *)retstr, &v13.start, &duration);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)uneditedDuration
{
  if (self) {
    return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)[($3CC8671D27C23BF42ADDB32F2B5E48AE *)self _timeForProperty:*MEMORY[0x1E4F34AC0]];
  }
  retstr->var0 = 0;
  *(void *)&retstr->var1 = 0;
  retstr->var3 = 0;
  return self;
}

- (BOOL)requiresFrameReordering
{
  return [(AVFigObjectInspector *)self _BOOLeanForProperty:*MEMORY[0x1E4F34A18]] != 0;
}

- (BOOL)hasAudioSampleDependencies
{
  if (objc_msgSend(-[AVTrackReaderInspector mediaType](self, "mediaType"), "isEqualToString:", @"soun"))return -[AVFigObjectInspector _BOOLeanForProperty:](self, "_BOOLeanForProperty:", *MEMORY[0x1E4F34A20]) != 0; {
  v4.receiver = self;
  }
  v4.super_class = (Class)AVTrackReaderInspector;
  return [(AVAssetTrackInspector *)&v4 hasAudioSampleDependencies];
}

- (int)naturalTimeScale
{
  return [(AVFigObjectInspector *)self _SInt32ForProperty:*MEMORY[0x1E4F34AB0]];
}

- (float)estimatedDataRate
{
  [(AVFigObjectInspector *)self _floatForProperty:*MEMORY[0x1E4F349E8]];
  return v2 * 8.0;
}

- (float)peakDataRate
{
  [(AVFigObjectInspector *)self _floatForProperty:*MEMORY[0x1E4F34A90]];
  return v2 * 8.0;
}

- (id)languageCode
{
  return [(AVFigObjectInspector *)self _stringForProperty:*MEMORY[0x1E4F34A40]];
}

- (id)mediaCharacteristics
{
  id v3 = [(AVFigObjectInspector *)self _arrayForProperty:*MEMORY[0x1E4F348A8]];
  int v4 = [(AVTrackReaderInspector *)self _figMediaType];
  return AVSynthesizeAVMediaCharacteristicsFromFigValues(v3, v4);
}

- (id)extendedLanguageTag
{
  return [(AVFigObjectInspector *)self _stringForProperty:*MEMORY[0x1E4F349F8]];
}

- (CGSize)naturalSize
{
  -[AVFigObjectInspector _sizeForProperty:defaultValue:](self, "_sizeForProperty:defaultValue:", *MEMORY[0x1E4F349A0], -1.0, -1.0);
  if (v3 == -1.0 && v4 == -1.0)
  {
    uint64_t v6 = *MEMORY[0x1E4F349B8];
    [(AVFigObjectInspector *)self _sizeForProperty:v6];
  }
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)dimensions
{
  [(AVFigObjectInspector *)self _sizeForProperty:*MEMORY[0x1E4F349B8]];
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGAffineTransform)preferredTransform
{
  if (self) {
    return (CGAffineTransform *)[(CGAffineTransform *)self _affineTransformForProperty:*MEMORY[0x1E4F34A70]];
  }
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  *(_OWORD *)&retstr->a = 0u;
  return self;
}

- (int64_t)layer
{
  return [(AVFigObjectInspector *)self _SInt16ForProperty:*MEMORY[0x1E4F34A50]];
}

- (float)preferredVolume
{
  if (objc_msgSend(-[AVTrackReaderInspector mediaType](self, "mediaType"), "isEqualToString:", @"soun"))
  {
    uint64_t v4 = *MEMORY[0x1E4F34AD8];
    LODWORD(v3) = 1.0;
    [(AVFigObjectInspector *)self _floatForProperty:v4 defaultValue:v3];
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)AVTrackReaderInspector;
    [(AVAssetTrackInspector *)&v6 preferredVolume];
  }
  return result;
}

- (id)loudnessInfo
{
  if (objc_msgSend(-[AVTrackReaderInspector mediaType](self, "mediaType"), "isEqualToString:", @"soun"))
  {
    uint64_t v3 = *MEMORY[0x1E4F34A60];
    return [(AVFigObjectInspector *)self _dictionaryForProperty:v3];
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)AVTrackReaderInspector;
    return [(AVAssetTrackInspector *)&v5 loudnessInfo];
  }
}

- (float)nominalFrameRate
{
  [(AVFigObjectInspector *)self _floatForProperty:*MEMORY[0x1E4F34A88]];
  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)minSampleDuration
{
  if (self)
  {
    uint64_t v3 = *MEMORY[0x1E4F348C0];
    long long v4 = *MEMORY[0x1E4F1F9F8];
    uint64_t v5 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
    return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)[($3CC8671D27C23BF42ADDB32F2B5E48AE *)self _timeForProperty:v3 defaultValue:&v4];
  }
  else
  {
    retstr->var0 = 0;
    *(void *)&retstr->var1 = 0;
    retstr->var3 = 0;
  }
  return self;
}

- (id)_segmentsPreferringNominalDurations:(BOOL)a3
{
  return [(AVAssetTrackInspector *)self _segmentsForSegmentData:0];
}

- (id)segments
{
  return [(AVTrackReaderInspector *)self _segmentsPreferringNominalDurations:self->_prefersNominalDurations];
}

- (id)segmentsAsPresented
{
  return [(AVTrackReaderInspector *)self _segmentsPreferringNominalDurations:0];
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)latentBaseDecodeTimeStampOfFirstTrackFragment
{
  CFDictionaryRef dictionaryRepresentation = 0;
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)*(void *)&MEMORY[0x1E4F1F9F8];
  uint64_t FigBaseObject = FigTrackReaderGetFigBaseObject();
  uint64_t VTable = CMBaseObjectGetVTable();
  uint64_t v8 = *(void *)(VTable + 8);
  float result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)(VTable + 8);
  uint64_t v7 = v8;
  if (v8) {
    uint64_t v9 = v7;
  }
  else {
    uint64_t v9 = 0;
  }
  uint64_t v10 = *(void (**)(uint64_t, void, void, CFDictionaryRef *))(v9 + 48);
  if (v10)
  {
    v10(FigBaseObject, *MEMORY[0x1E4F34A48], *MEMORY[0x1E4F1CF80], &dictionaryRepresentation);
    float result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)dictionaryRepresentation;
    if (dictionaryRepresentation)
    {
      CMTimeMakeFromDictionary(&v12, dictionaryRepresentation);
      *(_OWORD *)&retstr->var0 = *(_OWORD *)&v12.value;
      CFDictionaryRef v11 = dictionaryRepresentation;
      retstr->var3 = v12.epoch;
      CFRelease(v11);
    }
  }
  return result;
}

- (id)commonMetadata
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)[MEMORY[0x1E4F1CA48] array];
  CFTypeRef cf = 0;
  if (self->_trackReader)
  {
    if (!FigMetadataCopyTrackCommonMetadata())
    {
      long long v13 = 0u;
      long long v14 = 0u;
      long long v11 = 0u;
      long long v12 = 0u;
      long long v4 = (void *)cf;
      uint64_t v5 = [(id)cf countByEnumeratingWithState:&v11 objects:v16 count:16];
      if (v5)
      {
        uint64_t v6 = v5;
        uint64_t v7 = *(void *)v12;
        do
        {
          for (uint64_t i = 0; i != v6; ++i)
          {
            if (*(void *)v12 != v7) {
              objc_enumerationMutation(v4);
            }
            id v9 = +[AVMetadataItem _metadataItemWithFigMetadataDictionary:*(void *)(*((void *)&v11 + 1) + 8 * i)];
            if (v9) {
              [v3 addObject:v9];
            }
          }
          uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v16 count:16];
        }
        while (v6);
      }
    }
  }
  if (cf) {
    CFRelease(cf);
  }
  return v3;
}

- (id)availableMetadataFormats
{
  trackReader = self->_trackReader;
  CFTypeRef cf = 0;
  CFArrayRef theArray = 0;
  if (!trackReader) {
    goto LABEL_22;
  }
  uint64_t FigBaseObject = FigTrackReaderGetFigBaseObject();
  uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = *(unsigned int (**)(uint64_t, void, void, CFArrayRef *))(v5 + 48);
  if (!v6) {
    goto LABEL_25;
  }
  uint64_t v7 = *MEMORY[0x1E4F1CF80];
  if (v6(FigBaseObject, *MEMORY[0x1E4F34A78], *MEMORY[0x1E4F1CF80], &theArray)) {
    goto LABEL_25;
  }
  if (!theArray)
  {
    long long v11 = 0;
    goto LABEL_28;
  }
  CFIndex Count = CFArrayGetCount(theArray);
  if (Count >= 1)
  {
    CFIndex v9 = Count;
    CFIndex v10 = 0;
    long long v11 = 0;
    uint64_t v12 = *MEMORY[0x1E4F33078];
    do
    {
      CFArrayGetValueAtIndex(theArray, v10);
      uint64_t v13 = FigMetadataReaderGetFigBaseObject();
      uint64_t v14 = *(void *)(CMBaseObjectGetVTable() + 8);
      if (v14) {
        uint64_t v15 = v14;
      }
      else {
        uint64_t v15 = 0;
      }
      long long v16 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t, CFTypeRef *))(v15 + 48);
      if (v16 && !v16(v13, v12, v7, &cf))
      {
        if (!v11) {
          long long v11 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v9];
        }
        objc_msgSend(v11, "addObject:", cf, cf);
      }
      if (cf)
      {
        CFRelease(cf);
        CFTypeRef cf = 0;
      }
      ++v10;
    }
    while (v9 != v10);
  }
  else
  {
LABEL_22:
    long long v11 = 0;
  }
  if (objc_msgSend(v11, "count", cf)) {
    goto LABEL_26;
  }

LABEL_25:
  long long v11 = 0;
LABEL_26:
  if (theArray) {
    CFRelease(theArray);
  }
LABEL_28:
  if (cf) {
    CFRelease(cf);
  }
  if (v11) {
    return v11;
  }
  else {
    return (id)[MEMORY[0x1E4F1C978] array];
  }
}

- (id)metadataForFormat:(id)a3
{
  uint64_t v3 = 0;
  trackReader = self->_trackReader;
  CFTypeRef cf = 0;
  CFArrayRef theArray = 0;
  if (a3 && trackReader)
  {
    uint64_t FigBaseObject = FigTrackReaderGetFigBaseObject();
    uint64_t v7 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v7) {
      uint64_t v8 = v7;
    }
    else {
      uint64_t v8 = 0;
    }
    CFIndex v9 = *(unsigned int (**)(uint64_t, void, void, CFArrayRef *))(v8 + 48);
    if (!v9) {
      goto LABEL_20;
    }
    uint64_t v10 = *MEMORY[0x1E4F1CF80];
    if (v9(FigBaseObject, *MEMORY[0x1E4F34A78], *MEMORY[0x1E4F1CF80], &theArray)) {
      goto LABEL_20;
    }
    if (!theArray)
    {
      uint64_t v3 = 0;
      goto LABEL_23;
    }
    CFIndex Count = CFArrayGetCount(theArray);
    if (Count < 1)
    {
LABEL_20:
      uint64_t v3 = 0;
    }
    else
    {
      CFIndex v12 = Count;
      CFIndex v13 = 0;
      uint64_t v14 = *MEMORY[0x1E4F33078];
      while (1)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(theArray, v13);
        uint64_t v16 = FigMetadataReaderGetFigBaseObject();
        uint64_t v17 = *(void *)(CMBaseObjectGetVTable() + 8);
        uint64_t v18 = v17 ? v17 : 0;
        CMTimeRange v19 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t, CFTypeRef *))(v18 + 48);
        if (v19)
        {
          if (!v19(v16, v14, v10, &cf) && [a3 isEqualToString:cf]) {
            break;
          }
        }
        if (cf)
        {
          CFRelease(cf);
          CFTypeRef cf = 0;
        }
        if (v12 == ++v13) {
          goto LABEL_20;
        }
      }
      uint64_t v3 = (void *)[+[AVMetadataEnumerator metadataEnumeratorWithMetadataReader:ValueAtIndex] allObjects];
    }
  }
  if (theArray) {
    CFRelease(theArray);
  }
LABEL_23:
  if (cf) {
    CFRelease(cf);
  }
  if (!v3) {
    return (id)[MEMORY[0x1E4F1C978] array];
  }
  return v3;
}

- (int64_t)alternateGroupID
{
  return [(AVFigObjectInspector *)self _SInt16ForProperty:*MEMORY[0x1E4F34990]];
}

- (int64_t)defaultAlternateGroupID
{
  return [(AVFigObjectInspector *)self _SInt16ForProperty:*MEMORY[0x1E4F349A8]];
}

- (int64_t)provisionalAlternateGroupID
{
  return [(AVFigObjectInspector *)self _SInt16ForProperty:*MEMORY[0x1E4F34AA0]];
}

- (BOOL)hasSeamSamples
{
  return [(AVFigObjectInspector *)self _BOOLeanForProperty:*MEMORY[0x1E4F34A30]] != 0;
}

- (id)_trackReferences
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_msgSend(-[AVTrackReaderInspector asset](self, "asset"), "trackReferences");
  CFIndex v13 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  int v4 = [(AVTrackReaderInspector *)self trackID];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v5 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v10 = (void *)[v3 objectForKey:v9];
        v14[0] = MEMORY[0x1E4F143A8];
        v14[1] = 3221225472;
        v14[2] = __42__AVTrackReaderInspector__trackReferences__block_invoke;
        v14[3] = &unk_1E57B65D8;
        int v15 = v4;
        v14[4] = v10;
        long long v11 = (void *)[v10 indexesOfObjectsPassingTest:v14];
        if ([v11 count]) {
          objc_msgSend(v13, "setObject:forKey:", objc_msgSend(v10, "objectsAtIndexes:", v11), v9);
        }
      }
      uint64_t v6 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }
  return v13;
}

BOOL __42__AVTrackReaderInspector__trackReferences__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  BOOL result = 0;
  if (a3)
  {
    int v3 = *(_DWORD *)(a1 + 40);
    if (v3 == objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", a3 - 1), "intValue")) {
      return 1;
    }
  }
  return result;
}

- (BOOL)isExcludedFromAutoselectionInTrackGroup
{
  return [(AVFigObjectInspector *)self _BOOLeanForProperty:*MEMORY[0x1E4F349F0]] != 0;
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  uint64_t v5 = [(AVTrackReaderInspector *)self _figTrackReader];
  uint64_t v6 = [a3 _figTrackReader];
  if (v5 == (OpaqueFigTrackReader *)v6) {
    return 1;
  }
  uint64_t v7 = (const void *)v6;
  BOOL result = 0;
  if (v5)
  {
    if (v7) {
      return CFEqual(v5, v7) != 0;
    }
  }
  return result;
}

- (unint64_t)hash
{
  int v3 = [(AVTrackReaderInspector *)self _figTrackReader];
  if (v3)
  {
    return CFHash(v3);
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)AVTrackReaderInspector;
    return [(AVTrackReaderInspector *)&v5 hash];
  }
}

@end