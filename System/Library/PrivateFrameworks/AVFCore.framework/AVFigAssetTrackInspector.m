@interface AVFigAssetTrackInspector
- ($1CE2C3FC342086196D07C2B4E8C70800)gaplessSourceTimeRange;
- ($1CE2C3FC342086196D07C2B4E8C70800)mediaDecodeTimeRange;
- ($1CE2C3FC342086196D07C2B4E8C70800)mediaPresentationTimeRange;
- ($1CE2C3FC342086196D07C2B4E8C70800)timeRange;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)latentBaseDecodeTimeStampOfFirstTrackFragment;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)minSampleDuration;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)uneditedDuration;
- (BOOL)_isDefunct;
- (BOOL)hasAudibleBooksContent;
- (BOOL)hasProtectedContent;
- (BOOL)hasSeamSamples;
- (BOOL)isAudibleBooksContentAuthorized;
- (BOOL)isDecodable;
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
- (OpaqueFigAssetTrack)_figAssetTrack;
- (OpaqueFigFormatReader)_figFormatReader;
- (OpaqueFigSampleCursorService)_getFigSampleCursorServiceReportingTimeAccuracy:(BOOL *)a3;
- (OpaqueFigSimpleMutex)_loadingMutex;
- (OpaqueFigTrackReader)_figTrackReader;
- (__CFString)figAssetPropertyForSegments;
- (float)estimatedDataRate;
- (float)nominalFrameRate;
- (float)peakDataRate;
- (float)preferredVolume;
- (id)_initWithAsset:(id)a3 trackID:(int)a4 trackIndex:(int64_t)a5;
- (id)_loadingBatches;
- (id)_segmentsForProperty:(__CFString *)a3;
- (id)_trackReferences;
- (id)asset;
- (id)availableMetadataFormats;
- (id)commonMetadata;
- (id)extendedLanguageTag;
- (id)formatDescriptions;
- (id)languageCode;
- (id)loudnessInfo;
- (id)mediaType;
- (id)metadataForFormat:(id)a3;
- (id)segmentForTrackTime:(id *)a3;
- (id)segments;
- (id)segmentsAsPresented;
- (int)decodabilityValidationResult;
- (int)naturalTimeScale;
- (int)playabilityValidationResult;
- (int)trackID;
- (int64_t)_loadStatusForFigAssetTrackProperty:(id)a3 error:(id *)a4;
- (int64_t)alternateGroupID;
- (int64_t)defaultAlternateGroupID;
- (int64_t)layer;
- (int64_t)provisionalAlternateGroupID;
- (int64_t)statusOfValueForKey:(id)a3 error:(id *)a4;
- (int64_t)totalSampleDataLength;
- (unint64_t)hash;
- (unsigned)_figMediaType;
- (void)_addFigNotifications;
- (void)_ensureAllDependenciesOfKeyAreLoaded:(id)a3;
- (void)_invokeCompletionHandlerForLoadingBatches:(id)a3;
- (void)_removeFigNotifications;
- (void)_valueAsCFTypeForProperty:(__CFString *)a3;
- (void)dealloc;
- (void)loadValuesAsynchronouslyForKeys:(id)a3 completionHandler:(id)a4;
@end

@implementation AVFigAssetTrackInspector

- (OpaqueFigAssetTrack)_figAssetTrack
{
  return self->_figAssetTrack;
}

- (id)_initWithAsset:(id)a3 trackID:(int)a4 trackIndex:(int64_t)a5
{
  uint64_t v6 = *(void *)&a4;
  v33.receiver = self;
  v33.super_class = (Class)AVFigAssetTrackInspector;
  v8 = -[AVAssetTrackInspector _initWithAsset:trackID:trackIndex:](&v33, sel__initWithAsset_trackID_trackIndex_);
  if (v8)
  {
    if (a3)
    {
      CFTypeRef ValueAtIndex = 0;
      CFTypeRef v9 = (CFTypeRef)[a3 _figAsset];
      int v31 = 0;
      if (v9)
      {
        v10 = v9;
        if (v6)
        {
          uint64_t v11 = *(void *)(CMBaseObjectGetVTable() + 16);
          if (v11) {
            uint64_t v12 = v11;
          }
          else {
            uint64_t v12 = 0;
          }
          v16 = *(void (**)(const void *, uint64_t, CFTypeRef *))(v12 + 40);
          if (v16) {
            v16(v10, v6, &ValueAtIndex);
          }
        }
        else if ((a5 & 0x8000000000000000) == 0)
        {
          CFTypeRef cf = 0;
          uint64_t CMBaseObject = FigAssetGetCMBaseObject();
          uint64_t v14 = *(void *)(CMBaseObjectGetVTable() + 8);
          uint64_t v15 = v14 ? v14 : 0;
          v17 = *(uint64_t (**)(uint64_t, void, void, CFTypeRef *))(v15 + 48);
          if (v17)
          {
            int v18 = v17(CMBaseObject, *MEMORY[0x1E4F32310], *MEMORY[0x1E4F1CF80], &cf);
            CFTypeRef v19 = cf;
            if (!v18)
            {
              if (cf)
              {
                CFTypeID v20 = CFGetTypeID(cf);
                CFTypeID TypeID = CFArrayGetTypeID();
                CFTypeRef v19 = cf;
                if (v20 == TypeID)
                {
                  CFIndex Count = CFArrayGetCount((CFArrayRef)cf);
                  CFTypeRef v19 = cf;
                  if (Count > a5)
                  {
                    CFTypeRef ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)cf, a5);
                    CFTypeRef v19 = cf;
                  }
                }
              }
            }
            if (v19) {
              CFRelease(v19);
            }
          }
        }
        CFTypeRef v23 = ValueAtIndex;
        if (ValueAtIndex)
        {
          uint64_t v24 = *(void *)(CMBaseObjectGetVTable() + 16);
          uint64_t v25 = v24 ? v24 : 0;
          v26 = *(void (**)(CFTypeRef, void, int *))(v25 + 32);
          if (v26) {
            v26(v23, 0, &v31);
          }
        }
        CFTypeRef v27 = CFRetain(v10);
        CFTypeRef v9 = ValueAtIndex;
        v8[4] = v27;
        if (v9) {
          CFTypeRef v9 = CFRetain(v9);
        }
      }
      else
      {
        v8[4] = 0;
      }
      v8[5] = v9;
      v8[6] = objc_alloc_init(AVDispatchOnce);
      v8[8] = objc_alloc_init(AVDispatchOnce);
      v8[10] = objc_alloc_init(AVDispatchOnce);
      *((_DWORD *)v8 + 32) = v31;
      *((unsigned char *)v8 + 144) = [a3 _prefersNominalDurations];
      v8[17] = (id)[a3 _weakReference];
      v8[13] = FigSimpleMutexCreate();
      v8[15] = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:0];
      v28 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v8[14] = dispatch_queue_create("com.apple.avfoundation.avassettrack.completionsQueue", v28);
      [v8 _addFigNotifications];
    }
    if (!v8[4] || !v8[5] || !v8[13] || !v8[15] || !v8[14])
    {

      return 0;
    }
  }
  return v8;
}

- (void)_addFigNotifications
{
  if (self->_figAsset && self->_figAssetTrack)
  {
    id v3 = +[AVCMNotificationDispatcher notificationDispatcherForCMNotificationCenter:CMNotificationCenterGetDefaultLocalCenter()];
    id v4 = [(AVAssetTrackInspector *)self _weakReference];
    CFRetain(v4);
    [v3 addListenerWithWeakReference:v4 callback:handleFigAssetTrackNotification name:*MEMORY[0x1E4F32460] object:self->_figAssetTrack flags:0];
    uint64_t v5 = *MEMORY[0x1E4F31EE8];
    figAsset = self->_figAsset;
    [v3 addListenerWithWeakReference:v4 callback:handleFigAssetNotification name:v5 object:figAsset flags:0];
  }
}

- (int)trackID
{
  int v7 = 0;
  figAssetTrack = self->_figAssetTrack;
  uint64_t v3 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v3) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = 0;
  }
  uint64_t v5 = *(void (**)(OpaqueFigAssetTrack *, int *, void))(v4 + 32);
  if (!v5) {
    return 0;
  }
  v5(figAssetTrack, &v7, 0);
  return v7;
}

- (void)dealloc
{
  [(AVFigAssetTrackInspector *)self _removeFigNotifications];

  completionHandlerQueue = self->_completionHandlerQueue;
  if (completionHandlerQueue) {
    dispatch_release(completionHandlerQueue);
  }
  if (self->_loadingMutex) {
    FigSimpleMutexDestroy();
  }
  figAsset = self->_figAsset;
  if (figAsset) {
    CFRelease(figAsset);
  }
  figAssetTrack = self->_figAssetTrack;
  if (figAssetTrack) {
    CFRelease(figAssetTrack);
  }
  figFormatReader = self->_figFormatReader;
  if (figFormatReader) {
    CFRelease(figFormatReader);
  }
  figTrackReader = self->_figTrackReader;
  if (figTrackReader) {
    CFRelease(figTrackReader);
  }

  figSampleCursorService = self->_figSampleCursorService;
  if (figSampleCursorService) {
    CFRelease(figSampleCursorService);
  }
  v9.receiver = self;
  v9.super_class = (Class)AVFigAssetTrackInspector;
  [(AVAssetTrackInspector *)&v9 dealloc];
}

- (void)_removeFigNotifications
{
  if (self->_figAsset && self->_figAssetTrack)
  {
    id v3 = +[AVCMNotificationDispatcher notificationDispatcherForCMNotificationCenter:CMNotificationCenterGetDefaultLocalCenter()];
    id v4 = [(AVAssetTrackInspector *)self _weakReference];
    [v3 removeListenerWithWeakReference:v4 callback:handleFigAssetTrackNotification name:*MEMORY[0x1E4F32460] object:self->_figAssetTrack];
    [v3 removeListenerWithWeakReference:v4 callback:handleFigAssetNotification name:*MEMORY[0x1E4F31EE8] object:self->_figAsset];
    CFRelease(v4);
  }
}

- (int64_t)_loadStatusForFigAssetTrackProperty:(id)a3 error:(id *)a4
{
  id v14 = 0;
  uint64_t v15 = 0;
  figAssetTrack = self->_figAssetTrack;
  uint64_t v7 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v7) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = 0;
  }
  objc_super v9 = *(uint64_t (**)(OpaqueFigAssetTrack *, id, char *, uint64_t *, id *))(v8 + 8);
  if (!v9)
  {
    id v11 = 0;
    signed int v10 = -12782;
LABEL_9:
    int64_t v12 = 3;
    if (!a4) {
      return v12;
    }
LABEL_10:
    if (v12 == 3)
    {
      *a4 = (id)AVErrorWithNSErrorAndOSStatus((uint64_t)v11, v10, 0);
      return 3;
    }
    return v12;
  }
  signed int v10 = v9(figAssetTrack, a3, (char *)&v15 + 4, &v15, &v14);
  id v11 = v14;
  if (v10) {
    goto LABEL_9;
  }
  if (v15 == -12844) {
    return 2;
  }
  int64_t v12 = SHIDWORD(v15);
  if (HIDWORD(v15) == 3) {
    signed int v10 = v15;
  }
  else {
    signed int v10 = 0;
  }
  if (a4) {
    goto LABEL_10;
  }
  return v12;
}

- (int64_t)statusOfValueForKey:(id)a3 error:(id *)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v24 = 0;
  BOOL prefersNominalDurations = self->_prefersNominalDurations;
  if (dictionaryOfFigAssetTrackPropertiesForTrackKeys_buildFigAssetTrackPropertiesForTrackKeysOnce != -1) {
    dispatch_once(&dictionaryOfFigAssetTrackPropertiesForTrackKeys_buildFigAssetTrackPropertiesForTrackKeysOnce, &__block_literal_global_31);
  }
  uint64_t v8 = &dictionaryOfFigAssetTrackPropertiesForTrackKeys_sLegacyFigAssetTrackPropertiesForTrackKeys;
  if (!prefersNominalDurations) {
    uint64_t v8 = &dictionaryOfFigAssetTrackPropertiesForTrackKeys_sFigAssetTrackPropertiesForTrackKeys;
  }
  uint64_t v9 = [(id)*v8 objectForKey:a3];
  if (v9)
  {
    signed int v10 = (void *)v9;
    MEMORY[0x199715030](self->_loadingMutex);
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v21;
      int64_t v14 = 2;
LABEL_8:
      uint64_t v15 = 0;
      while (1)
      {
        if (*(void *)v21 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v16 = [(AVFigAssetTrackInspector *)self _loadStatusForFigAssetTrackProperty:*(void *)(*((void *)&v20 + 1) + 8 * v15) error:&v24];
        uint64_t v17 = v16 == 3 ? 3 : v14;
        int64_t v14 = v16 <= 1 ? v16 : v17;
        if (v16 < 2 || v16 == 3) {
          break;
        }
        if (v12 == ++v15)
        {
          uint64_t v12 = [v10 countByEnumeratingWithState:&v20 objects:v25 count:16];
          if (v12) {
            goto LABEL_8;
          }
          break;
        }
      }
    }
    else
    {
      int64_t v14 = 2;
    }
    MEMORY[0x199715040](self->_loadingMutex);
    if (a4 && v14 == 3) {
      *a4 = v24;
    }
  }
  else
  {
    NSLog(&cfstr_AvassettrackSt.isa, a3);
    return 2;
  }
  return v14;
}

- (void)loadValuesAsynchronouslyForKeys:(id)a3 completionHandler:(id)a4
{
  MEMORY[0x199715030](self->_loadingMutex, a2);
  if (a3)
  {
    uint64_t v7 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithCapacity:0];
    BOOL prefersNominalDurations = self->_prefersNominalDurations;
    if (dictionaryOfFigAssetTrackPropertiesForTrackKeys_buildFigAssetTrackPropertiesForTrackKeysOnce != -1) {
      dispatch_once(&dictionaryOfFigAssetTrackPropertiesForTrackKeys_buildFigAssetTrackPropertiesForTrackKeysOnce, &__block_literal_global_31);
    }
    uint64_t v9 = &dictionaryOfFigAssetTrackPropertiesForTrackKeys_sLegacyFigAssetTrackPropertiesForTrackKeys;
    if (!prefersNominalDurations) {
      uint64_t v9 = &dictionaryOfFigAssetTrackPropertiesForTrackKeys_sFigAssetTrackPropertiesForTrackKeys;
    }
    uint64_t v10 = *v9;
    uint64_t v11 = (void *)[MEMORY[0x1E4F1CA80] setWithCapacity:0];
    uint64_t v12 = (void *)[MEMORY[0x1E4F1CA80] setWithCapacity:0];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __78__AVFigAssetTrackInspector_loadValuesAsynchronouslyForKeys_completionHandler___block_invoke;
    v23[3] = &unk_1E57B65B0;
    v23[4] = v10;
    v23[5] = v12;
    v23[6] = v11;
    [a3 enumerateObjectsUsingBlock:v23];
    if ([v11 count]) {
      NSLog(&cfstr_AvassettrackLo.isa, [v11 allObjects]);
    }
    uint64_t v13 = (void *)[v12 allObjects];
    if ([v13 count])
    {
      int valuePtr = 0;
      char v21 = 0;
      figAssetTrack = self->_figAssetTrack;
      uint64_t v15 = *(void *)(CMBaseObjectGetVTable() + 16);
      uint64_t v16 = v15 ? v15 : 0;
      uint64_t v17 = *(unsigned int (**)(OpaqueFigAssetTrack *, void *, char *, int *))(v16 + 16);
      if (v17)
      {
        if (!v17(figAssetTrack, v13, &v21, &valuePtr) && !v21)
        {
          CFNumberRef v18 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], kCFNumberSInt32Type, &valuePtr);
          if (v18)
          {
            CFNumberRef v19 = v18;
            [v7 setObject:v18 forKey:0x1EE5A3478];
            CFRelease(v19);
          }
        }
      }
    }
  }
  else
  {
    uint64_t v7 = 0;
  }
  if ([v7 count])
  {
    if (a4)
    {
      long long v20 = (void *)[a4 copy];
      [v7 setObject:v20 forKey:0x1EE5A3498];
    }
    [(NSMutableArray *)self->_loadingBatches addObject:v7];
    MEMORY[0x199715040](self->_loadingMutex);
  }
  else
  {
    MEMORY[0x199715040](self->_loadingMutex);
    if (a4) {
      (*((void (**)(id))a4 + 2))(a4);
    }
  }
}

uint64_t __78__AVFigAssetTrackInspector_loadValuesAsynchronouslyForKeys_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = [*(id *)(a1 + 32) objectForKey:a2];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void **)(a1 + 40);
    return [v6 addObjectsFromArray:v5];
  }
  else
  {
    uint64_t v8 = *(void **)(a1 + 48);
    return [v8 addObject:a2];
  }
}

- (void)_ensureAllDependenciesOfKeyAreLoaded:(id)a3
{
  if ([(AVFigAssetTrackInspector *)self statusOfValueForKey:a3 error:0] <= 1)
  {
    dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObject:a3];
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __65__AVFigAssetTrackInspector__ensureAllDependenciesOfKeyAreLoaded___block_invoke;
      v8[3] = &unk_1E57B1E80;
      v8[4] = v6;
      [(AVFigAssetTrackInspector *)self loadValuesAsynchronouslyForKeys:v7 completionHandler:v8];
      dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
      dispatch_release(v6);
    }
  }
}

intptr_t __65__AVFigAssetTrackInspector__ensureAllDependenciesOfKeyAreLoaded___block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)asset
{
  return [(AVWeakReference *)self->_weakReferenceToAsset referencedObject];
}

- (OpaqueFigFormatReader)_figFormatReader
{
  copyFigFormatReaderOnce = self->_copyFigFormatReaderOnce;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __44__AVFigAssetTrackInspector__figFormatReader__block_invoke;
  v5[3] = &unk_1E57B1E80;
  v5[4] = self;
  [(AVDispatchOnce *)copyFigFormatReaderOnce runBlockOnce:v5];
  return self->_figFormatReader;
}

uint64_t __44__AVFigAssetTrackInspector__figFormatReader__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t result = *(void *)(v1 + 32);
  if (result)
  {
    uint64_t CMBaseObject = FigAssetGetCMBaseObject();
    uint64_t VTable = CMBaseObjectGetVTable();
    uint64_t v6 = *(void *)(VTable + 8);
    uint64_t result = VTable + 8;
    uint64_t v5 = v6;
    uint64_t v7 = v6 ? v5 : 0;
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v7 + 48);
    if (v8)
    {
      uint64_t v9 = *MEMORY[0x1E4F32230];
      uint64_t v10 = *MEMORY[0x1E4F1CF80];
      return v8(CMBaseObject, v9, v10, v1 + 56);
    }
  }
  return result;
}

- (OpaqueFigTrackReader)_figTrackReader
{
  copyFigTrackReaderOnce = self->_copyFigTrackReaderOnce;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __43__AVFigAssetTrackInspector__figTrackReader__block_invoke;
  v5[3] = &unk_1E57B1E80;
  v5[4] = self;
  [(AVDispatchOnce *)copyFigTrackReaderOnce runBlockOnce:v5];
  return self->_figTrackReader;
}

uint64_t __43__AVFigAssetTrackInspector__figTrackReader__block_invoke(uint64_t a1)
{
  unsigned int v17 = 0;
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 40);
  uint64_t VTable = CMBaseObjectGetVTable();
  uint64_t v6 = *(void *)(VTable + 16);
  uint64_t result = VTable + 16;
  uint64_t v5 = v6;
  if (v6) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = 0;
  }
  uint64_t v8 = *(uint64_t (**)(uint64_t, unsigned int *, void))(v7 + 32);
  if (v8)
  {
    uint64_t result = v8(v2, &v17, 0);
    if (!result)
    {
      uint64_t result = [*(id *)(a1 + 32) _figFormatReader];
      if (result)
      {
        uint64_t v9 = result;
        uint64_t v10 = v17;
        uint64_t v11 = *(void *)(a1 + 32);
        uint64_t v12 = CMBaseObjectGetVTable();
        uint64_t v14 = *(void *)(v12 + 16);
        uint64_t result = v12 + 16;
        uint64_t v13 = v14;
        if (v14) {
          uint64_t v15 = v13;
        }
        else {
          uint64_t v15 = 0;
        }
        uint64_t v16 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, void))(v15 + 56);
        if (v16) {
          return v16(v9, v10, v11 + 72, 0);
        }
      }
    }
  }
  return result;
}

- (OpaqueFigSimpleMutex)_loadingMutex
{
  return self->_loadingMutex;
}

- (id)_loadingBatches
{
  return self->_loadingBatches;
}

- (unsigned)_figMediaType
{
  return self->_mediaType;
}

- (id)mediaType
{
  int v2 = bswap32([(AVFigAssetTrackInspector *)self _figMediaType]);
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"%c%c%c%c", (char)v2, ((__int16)v2 >> 8), (v2 << 8 >> 24), (v2 >> 24));
}

- (OpaqueFigSampleCursorService)_getFigSampleCursorServiceReportingTimeAccuracy:(BOOL *)a3
{
  copySampleCursorServiceOnce = self->_copySampleCursorServiceOnce;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __76__AVFigAssetTrackInspector__getFigSampleCursorServiceReportingTimeAccuracy___block_invoke;
  v7[3] = &unk_1E57B1E80;
  v7[4] = self;
  [(AVDispatchOnce *)copySampleCursorServiceOnce runBlockOnce:v7];
  if (a3) {
    *a3 = self->_sampleCursorTimeAccuracyIsExact;
  }
  return self->_figSampleCursorService;
}

void __76__AVFigAssetTrackInspector__getFigSampleCursorServiceReportingTimeAccuracy___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _figTrackReader];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v5) {
      uint64_t v6 = v5;
    }
    else {
      uint64_t v6 = 0;
    }
    uint64_t v7 = *(void (**)(uint64_t, uint64_t))(v6 + 32);
    if (v7) {
      v7(v3, v4 + 88);
    }
    if ([*(id *)(a1 + 32) _figFormatReader])
    {
      uint64_t v13 = 0;
      uint64_t FigBaseObject = FigFormatReaderGetFigBaseObject();
      uint64_t v9 = *(void *)(CMBaseObjectGetVTable() + 8);
      if (v9) {
        uint64_t v10 = v9;
      }
      else {
        uint64_t v10 = 0;
      }
      uint64_t v11 = *(void (**)(uint64_t, void, void, const void **))(v10 + 48);
      if (v11)
      {
        v11(FigBaseObject, *MEMORY[0x1E4F32B90], *MEMORY[0x1E4F1CF80], &v13);
        uint64_t v12 = v13;
      }
      else
      {
        uint64_t v12 = 0;
      }
      *(unsigned char *)(*(void *)(a1 + 32) + 96) = v12 == (const void *)*MEMORY[0x1E4F1CFD0];
      if (v12) {
        CFRelease(v12);
      }
    }
  }
}

- (void)_valueAsCFTypeForProperty:(__CFString *)a3
{
  uint64_t v9 = 0;
  uint64_t result = [(AVFigAssetTrackInspector *)self _figAssetTrack];
  if (result)
  {
    uint64_t CMBaseObject = FigAssetTrackGetCMBaseObject();
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
      v8(CMBaseObject, a3, *MEMORY[0x1E4F1CF80], &v9);
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
  return [(AVFigObjectInspector *)self _nonNilArrayForProperty:*MEMORY[0x1E4F34868]];
}

- (BOOL)isPlayable
{
  return [(AVFigObjectInspector *)self _SInt32ForProperty:*MEMORY[0x1E4F324B0]] == 0;
}

- (int)playabilityValidationResult
{
  return [(AVFigObjectInspector *)self _SInt32ForProperty:*MEMORY[0x1E4F324B0]];
}

- (BOOL)isDecodable
{
  return [(AVFigObjectInspector *)self _SInt32ForProperty:*MEMORY[0x1E4F324A8]] == 0;
}

- (int)decodabilityValidationResult
{
  return [(AVFigObjectInspector *)self _SInt32ForProperty:*MEMORY[0x1E4F324A8]];
}

- (BOOL)isEnabled
{
  return [(AVFigObjectInspector *)self _BOOLeanForProperty:*MEMORY[0x1E4F34870]] != 0;
}

- (BOOL)isSelfContained
{
  return [(AVFigObjectInspector *)self _BOOLeanForProperty:*MEMORY[0x1E4F34880]] != 0;
}

- (int64_t)totalSampleDataLength
{
  return [(AVFigObjectInspector *)self _longLongForProperty:*MEMORY[0x1E4F34900]];
}

- ($1CE2C3FC342086196D07C2B4E8C70800)timeRange
{
  if (self) {
    return ($1CE2C3FC342086196D07C2B4E8C70800 *)[($1CE2C3FC342086196D07C2B4E8C70800 *)self _timeRangeForProperty:*MEMORY[0x1E4F348F8]];
  }
  *(_OWORD *)&retstr->var0.var3 = 0u;
  *(_OWORD *)&retstr->var1.var1 = 0u;
  *(_OWORD *)&retstr->var0.var0 = 0u;
  return self;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)uneditedDuration
{
  CFDictionaryRef dictionaryRepresentation = 0;
  if ([(AVFigAssetTrackInspector *)self _figTrackReader]
    && ((FigBaseObject = FigTrackReaderGetFigBaseObject(), (uint64_t v6 = *(void *)(CMBaseObjectGetVTable() + 8)) == 0)
      ? (uint64_t v7 = 0)
      : (uint64_t v7 = v6),
        (uint64_t v8 = *(void (**)(uint64_t, void, void, CFDictionaryRef *))(v7 + 48)) != 0
     && (v8(FigBaseObject, *MEMORY[0x1E4F34AC0], *MEMORY[0x1E4F1CF80], &dictionaryRepresentation),
         (CFDictionaryRef v9 = dictionaryRepresentation) != 0)))
  {
    retstr->var0 = 0;
    *(void *)&retstr->var1 = 0;
    retstr->var3 = 0;
    CMTimeMakeFromDictionary((CMTime *)retstr, v9);
    CFRelease(dictionaryRepresentation);
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)AVFigAssetTrackInspector;
    return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)[($3CC8671D27C23BF42ADDB32F2B5E48AE *)&v11 uneditedDuration];
  }
  return result;
}

- ($1CE2C3FC342086196D07C2B4E8C70800)mediaPresentationTimeRange
{
  if (self) {
    return ($1CE2C3FC342086196D07C2B4E8C70800 *)[($1CE2C3FC342086196D07C2B4E8C70800 *)self _timeRangeForProperty:*MEMORY[0x1E4F348B8]];
  }
  *(_OWORD *)&retstr->var0.var3 = 0u;
  *(_OWORD *)&retstr->var1.var1 = 0u;
  *(_OWORD *)&retstr->var0.var0 = 0u;
  return self;
}

- ($1CE2C3FC342086196D07C2B4E8C70800)mediaDecodeTimeRange
{
  if (self) {
    return ($1CE2C3FC342086196D07C2B4E8C70800 *)[($1CE2C3FC342086196D07C2B4E8C70800 *)self _timeRangeForProperty:*MEMORY[0x1E4F348B0]];
  }
  *(_OWORD *)&retstr->var0.var3 = 0u;
  *(_OWORD *)&retstr->var1.var1 = 0u;
  *(_OWORD *)&retstr->var0.var0 = 0u;
  return self;
}

- (BOOL)requiresFrameReordering
{
  if (![(AVFigAssetTrackInspector *)self _figTrackReader]) {
    return 0;
  }
  CFTypeRef cf = 0;
  uint64_t FigBaseObject = FigTrackReaderGetFigBaseObject();
  uint64_t v3 = *(void *)(CMBaseObjectGetVTable() + 8);
  uint64_t v4 = v3 ? v3 : 0;
  uint64_t v5 = *(unsigned int (**)(uint64_t, void, void, CFTypeRef *))(v4 + 48);
  if (!v5) {
    return 0;
  }
  if (v5(FigBaseObject, *MEMORY[0x1E4F34A18], *MEMORY[0x1E4F1CF80], &cf)) {
    BOOL v6 = 0;
  }
  else {
    BOOL v6 = cf == (CFTypeRef)*MEMORY[0x1E4F1CFD0];
  }
  BOOL v7 = v6;
  if (cf) {
    CFRelease(cf);
  }
  return v7;
}

- (int)naturalTimeScale
{
  return [(AVFigObjectInspector *)self _SInt32ForProperty:*MEMORY[0x1E4F348D0]];
}

- (float)estimatedDataRate
{
  [(AVFigObjectInspector *)self _floatForProperty:*MEMORY[0x1E4F34858]];
  return v2 * 8.0;
}

- (float)peakDataRate
{
  [(AVFigObjectInspector *)self _floatForProperty:*MEMORY[0x1E4F348E0]];
  return v2 * 8.0;
}

- (id)languageCode
{
  return [(AVFigObjectInspector *)self _stringForProperty:*MEMORY[0x1E4F34888]];
}

- (id)extendedLanguageTag
{
  return [(AVFigObjectInspector *)self _stringForProperty:*MEMORY[0x1E4F34860]];
}

- (CGSize)naturalSize
{
  [(AVFigObjectInspector *)self _sizeForProperty:*MEMORY[0x1E4F348C8]];
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)dimensions
{
  [(AVFigObjectInspector *)self _sizeForProperty:*MEMORY[0x1E4F34850]];
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGAffineTransform)preferredTransform
{
  if (self) {
    return (CGAffineTransform *)[(CGAffineTransform *)self _affineTransformForProperty:*MEMORY[0x1E4F348E8]];
  }
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  *(_OWORD *)&retstr->a = 0u;
  return self;
}

- (int64_t)layer
{
  return [(AVFigObjectInspector *)self _SInt16ForProperty:*MEMORY[0x1E4F34890]];
}

- (float)preferredVolume
{
  LODWORD(v2) = 1.0;
  [(AVFigObjectInspector *)self _floatForProperty:*MEMORY[0x1E4F34908] defaultValue:v2];
  return result;
}

- (id)loudnessInfo
{
  return [(AVFigObjectInspector *)self _dictionaryForProperty:*MEMORY[0x1E4F348A0]];
}

- (float)nominalFrameRate
{
  [(AVFigObjectInspector *)self _floatForProperty:*MEMORY[0x1E4F348D8]];
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

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)latentBaseDecodeTimeStampOfFirstTrackFragment
{
  if (self)
  {
    uint64_t v3 = *MEMORY[0x1E4F324A0];
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

- (id)_segmentsForProperty:(__CFString *)a3
{
  id v4 = [(AVFigObjectInspector *)self _dataForProperty:a3];
  return [(AVAssetTrackInspector *)self _segmentsForSegmentData:v4];
}

- (__CFString)figAssetPropertyForSegments
{
  if (self->_prefersNominalDurations) {
    double v2 = (__CFString **)MEMORY[0x1E4F32478];
  }
  else {
    double v2 = (__CFString **)MEMORY[0x1E4F324B8];
  }
  return *v2;
}

- (id)segments
{
  uint64_t v3 = [(AVFigAssetTrackInspector *)self figAssetPropertyForSegments];
  return [(AVFigAssetTrackInspector *)self _segmentsForProperty:v3];
}

- (id)segmentForTrackTime:(id *)a3
{
  id v4 = [(AVFigObjectInspector *)self _dataForProperty:[(AVFigAssetTrackInspector *)self figAssetPropertyForSegments]];
  unint64_t v5 = [v4 length];
  if (v5 < 0x60) {
    return 0;
  }
  unint64_t v7 = v5 / 0x60;
  uint64_t v8 = [v4 bytes];
  uint64_t v9 = v8;
  unint64_t v10 = v7 - 1;
  if (v7 <= 1) {
    uint64_t v11 = 1;
  }
  else {
    uint64_t v11 = v7;
  }
  uint64_t v12 = v8;
  while (1)
  {
    CMTimeRange time2 = *(CMTimeRange *)(v12 + 48);
    CMTimeRange v25 = time2;
    CMTime time = (CMTime)*a3;
    if (CMTimeRangeContainsTime(&v25, &time)) {
      break;
    }
    v12 += 96;
    if (!--v11) {
      goto LABEL_11;
    }
  }
  uint64_t v13 = [AVAssetTrackSegment alloc];
  long long v14 = *(_OWORD *)(v12 + 16);
  *(_OWORD *)&v25.start.value = *(_OWORD *)v12;
  *(_OWORD *)&v25.start.epoch = v14;
  long long v15 = *(_OWORD *)(v12 + 32);
  long long v16 = *(_OWORD *)(v12 + 48);
  long long v17 = *(_OWORD *)(v12 + 80);
  long long v27 = *(_OWORD *)(v12 + 64);
  long long v28 = v17;
  *(_OWORD *)&v25.duration.timescale = v15;
  long long v26 = v16;
  id result = [(AVAssetTrackSegment *)v13 _initWithTimeMapping:&v25];
  if (result) {
    return result;
  }
LABEL_11:
  *(_OWORD *)&v25.start.value = *(_OWORD *)&a3->var0;
  v25.start.epoch = a3->var3;
  *(_OWORD *)&time2.start.value = *(_OWORD *)(v9 + 48);
  time2.start.epoch = *(void *)(v9 + 64);
  if (CMTimeCompare(&v25.start, &time2.start) < 0) {
    unint64_t v18 = 0;
  }
  else {
    unint64_t v18 = v10;
  }
  CFNumberRef v19 = [AVAssetTrackSegment alloc];
  long long v20 = (_OWORD *)(v9 + 96 * v18);
  long long v21 = v20[1];
  *(_OWORD *)&v25.start.value = *v20;
  *(_OWORD *)&v25.start.epoch = v21;
  long long v22 = v20[2];
  long long v23 = v20[3];
  long long v24 = v20[5];
  long long v27 = v20[4];
  long long v28 = v24;
  *(_OWORD *)&v25.duration.timescale = v22;
  long long v26 = v23;
  return [(AVAssetTrackSegment *)v19 _initWithTimeMapping:&v25];
}

- (BOOL)segmentsExcludeAudioPrimingAndRemainderDurations
{
  return [(AVFigObjectInspector *)self _BOOLeanForProperty:*MEMORY[0x1E4F32480]] != 0;
}

- ($1CE2C3FC342086196D07C2B4E8C70800)gaplessSourceTimeRange
{
  if (self) {
    return ($1CE2C3FC342086196D07C2B4E8C70800 *)[($1CE2C3FC342086196D07C2B4E8C70800 *)self _timeRangeForProperty:*MEMORY[0x1E4F32490]];
  }
  *(_OWORD *)&retstr->var0.var3 = 0u;
  *(_OWORD *)&retstr->var1.var1 = 0u;
  *(_OWORD *)&retstr->var0.var0 = 0u;
  return self;
}

- (id)segmentsAsPresented
{
  return [(AVFigAssetTrackInspector *)self _segmentsForProperty:*MEMORY[0x1E4F324B8]];
}

- (id)commonMetadata
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [(AVFigObjectInspector *)self _nonNilArrayForProperty:*MEMORY[0x1E4F34840]];
  uint64_t v3 = (void *)[MEMORY[0x1E4F1CA48] arrayWithCapacity:0];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v2);
        }
        id v8 = +[AVMetadataItem _metadataItemWithFigMetadataDictionary:*(void *)(*((void *)&v10 + 1) + 8 * v7)];
        if (v8) {
          [v3 addObject:v8];
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
  return v3;
}

- (id)availableMetadataFormats
{
  [(AVFigAssetTrackInspector *)self _ensureAllDependenciesOfKeyAreLoaded:@"availableMetadataFormats"];
  uint64_t v3 = *MEMORY[0x1E4F34838];
  return [(AVFigObjectInspector *)self _nonNilArrayForProperty:v3];
}

- (id)metadataForFormat:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (void *)[MEMORY[0x1E4F1CA48] arrayWithCapacity:0];
  if ([a3 isEqualToString:@"com.apple.quicktime.udta"])
  {
    uint64_t v6 = (uint64_t *)MEMORY[0x1E4F324D0];
LABEL_5:
    uint64_t v7 = *v6;
    goto LABEL_9;
  }
  if ([a3 isEqualToString:@"org.mp4ra"])
  {
    uint64_t v6 = (uint64_t *)MEMORY[0x1E4F32498];
    goto LABEL_5;
  }
  if ([a3 isEqualToString:@"com.apple.quicktime.mdta"]) {
    uint64_t v7 = *MEMORY[0x1E4F324C8];
  }
  else {
    uint64_t v7 = 0;
  }
LABEL_9:
  id v8 = [(AVFigObjectInspector *)self _nonNilArrayForProperty:v7];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = +[AVMetadataItem _metadataItemWithFigMetadataDictionary:*(void *)(*((void *)&v15 + 1) + 8 * v12)];
        if (v13) {
          [v5 addObject:v13];
        }
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }
  return v5;
}

- (int64_t)alternateGroupID
{
  return [(AVFigObjectInspector *)self _SInt16ForProperty:*MEMORY[0x1E4F34830]];
}

- (int64_t)defaultAlternateGroupID
{
  return [(AVFigObjectInspector *)self _SInt16ForProperty:*MEMORY[0x1E4F34848]];
}

- (int64_t)provisionalAlternateGroupID
{
  return [(AVFigObjectInspector *)self _SInt16ForProperty:*MEMORY[0x1E4F348F0]];
}

- (BOOL)isExcludedFromAutoselectionInTrackGroup
{
  return [(AVFigObjectInspector *)self _BOOLeanForProperty:*MEMORY[0x1E4F34878]] != 0;
}

- (id)_trackReferences
{
  return [(AVFigObjectInspector *)self _nonNilDictionaryForProperty:*MEMORY[0x1E4F324D8]];
}

- (BOOL)hasProtectedContent
{
  return [(AVFigObjectInspector *)self _BOOLeanForProperty:*MEMORY[0x1E4F324C0]] != 0;
}

- (BOOL)hasAudibleBooksContent
{
  return [(AVFigObjectInspector *)self _BOOLeanForProperty:*MEMORY[0x1E4F324E0]] != 0;
}

- (BOOL)isAudibleBooksContentAuthorized
{
  return [(AVFigObjectInspector *)self _BOOLeanForProperty:*MEMORY[0x1E4F32470]] != 0;
}

- (BOOL)hasSeamSamples
{
  if (![(AVFigAssetTrackInspector *)self _figTrackReader]) {
    return 0;
  }
  CFTypeRef cf = 0;
  uint64_t FigBaseObject = FigTrackReaderGetFigBaseObject();
  uint64_t v3 = *(void *)(CMBaseObjectGetVTable() + 8);
  uint64_t v4 = v3 ? v3 : 0;
  uint64_t v5 = *(unsigned int (**)(uint64_t, void, void, CFTypeRef *))(v4 + 48);
  if (!v5) {
    return 0;
  }
  if (v5(FigBaseObject, *MEMORY[0x1E4F34A30], *MEMORY[0x1E4F1CF80], &cf)) {
    BOOL v6 = 0;
  }
  else {
    BOOL v6 = cf == (CFTypeRef)*MEMORY[0x1E4F1CFD0];
  }
  BOOL v7 = v6;
  if (cf) {
    CFRelease(cf);
  }
  return v7;
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  uint64_t v5 = [(AVFigAssetTrackInspector *)self _figAssetTrack];
  uint64_t v6 = [a3 _figAssetTrack];
  if (v5 == (OpaqueFigAssetTrack *)v6) {
    return 1;
  }
  BOOL v7 = (const void *)v6;
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
  uint64_t v3 = [(AVFigAssetTrackInspector *)self _figAssetTrack];
  if (v3)
  {
    return CFHash(v3);
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)AVFigAssetTrackInspector;
    return [(AVFigAssetTrackInspector *)&v5 hash];
  }
}

- (void)_invokeCompletionHandlerForLoadingBatches:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = [a3 countByEnumeratingWithState:&v10 objects:v14 count:16];
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
          objc_enumerationMutation(a3);
        }
        uint64_t v9 = (void *)[*(id *)(*((void *)&v10 + 1) + 8 * v8) objectForKey:0x1EE5A3498];
        if (v9) {
          dispatch_async((dispatch_queue_t)self->_completionHandlerQueue, v9);
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [a3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (BOOL)_isDefunct
{
  unsigned __int8 v9 = 0;
  id v2 = [(AVFigAssetTrackInspector *)self _figAssetTrack];
  uint64_t v3 = *(void **)(CMBaseObjectGetVTable() + 8);
  if (v3) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = 0;
  }
  if (*v4 < 5uLL)
  {
    int v6 = 0;
    LOBYTE(v5) = 0;
  }
  else
  {
    uint64_t v5 = (unsigned int (*)(OpaqueFigAssetTrack *, unsigned __int8 *))v4[11];
    if (v5)
    {
      LOBYTE(v5) = v5(v2, &v9) == 0;
      int v6 = v9;
    }
    else
    {
      int v6 = 0;
    }
  }
  if (v5) {
    int v7 = v6;
  }
  else {
    int v7 = 1;
  }
  if (!v6) {
    int v6 = v7;
  }
  return v6 == 1;
}

@end