@interface AVMutableCompositionTrack
+ (BOOL)expectsPropertyRevisedNotifications;
- (BOOL)_insertTimeRange:(id *)a3 ofTrack:(id)a4 atTime:(id *)a5 fireKVO:(BOOL)a6 error:(id *)a7;
- (BOOL)insertTimeRange:(CMTimeRange *)timeRange ofTrack:(AVAssetTrack *)track atTime:(CMTime *)startTime error:(NSError *)outError;
- (BOOL)insertTimeRanges:(NSArray *)timeRanges ofTracks:(NSArray *)tracks atTime:(CMTime *)startTime error:(NSError *)outError;
- (BOOL)isEnabled;
- (BOOL)validateTrackSegments:(NSArray *)trackSegments error:(NSError *)outError;
- (CGAffineTransform)preferredTransform;
- (CMTimeScale)naturalTimeScale;
- (NSArray)segments;
- (NSString)extendedLanguageTag;
- (NSString)languageCode;
- (float)preferredVolume;
- (int64_t)alternateGroupID;
- (void)_insertEmptyTimeRange:(id *)a3 fireKVO:(BOOL)a4;
- (void)_notifyAssetThatDurationDidChangeWithSuccess:(BOOL)a3;
- (void)_notifyAssetThatDurationWillChange;
- (void)_notifySelfThatSegmentsDidChangeWithSuccess:(BOOL)a3;
- (void)_notifySelfThatSegmentsWillChange;
- (void)_removeTimeRange:(id *)a3 fireKVO:(BOOL)a4;
- (void)_setTrackReaderPropertyValue:(void *)a3 forKey:(__CFString *)a4;
- (void)_updateTrackAssociationToTrack:(id)a3 type:(id)a4 operation:(int64_t)a5;
- (void)addTrackAssociationToTrack:(AVCompositionTrack *)compositionTrack type:(AVTrackAssociationType)trackAssociationType;
- (void)insertEmptyTimeRange:(CMTimeRange *)timeRange;
- (void)removeTimeRange:(CMTimeRange *)timeRange;
- (void)removeTrackAssociationToTrack:(AVCompositionTrack *)compositionTrack type:(AVTrackAssociationType)trackAssociationType;
- (void)replaceFormatDescription:(CMFormatDescriptionRef)originalFormatDescription withFormatDescription:(CMFormatDescriptionRef)replacementFormatDescription;
- (void)scaleTimeRange:(CMTimeRange *)timeRange toDuration:(CMTime *)duration;
- (void)setAlternateGroupID:(int64_t)a3;
- (void)setEnabled:(BOOL)enabled;
- (void)setExtendedLanguageTag:(NSString *)extendedLanguageTag;
- (void)setLanguageCode:(NSString *)languageCode;
- (void)setMetadata:(id)a3;
- (void)setNaturalTimeScale:(CMTimeScale)naturalTimeScale;
- (void)setPreferredTransform:(CGAffineTransform *)preferredTransform;
- (void)setPreferredVolume:(float)preferredVolume;
- (void)setSegments:(NSArray *)segments;
@end

@implementation AVMutableCompositionTrack

- (void)_notifyAssetThatDurationWillChange
{
  v2 = [(AVAssetTrack *)self asset];
  [(AVAsset *)v2 willChangeValueForKey:@"duration"];
}

- (void)_notifyAssetThatDurationDidChangeWithSuccess:(BOOL)a3
{
  BOOL v3 = a3;
  [[(AVAssetTrack *)self asset] didChangeValueForKey:@"duration"];
  if (v3)
  {
    v5 = [(AVAssetTrack *)self asset];
    if (v5)
    {
      v6 = v5;
      v7 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
      [v7 postNotificationName:@"AVAssetDurationDidChangeNotification" object:v6];
    }
  }
}

- (void)_notifySelfThatSegmentsWillChange
{
  [(AVMutableCompositionTrack *)self _notifyAssetThatDurationWillChange];
  [(AVMutableCompositionTrack *)self willChangeValueForKey:@"segments"];
}

- (void)_notifySelfThatSegmentsDidChangeWithSuccess:(BOOL)a3
{
  BOOL v3 = a3;
  -[AVMutableCompositionTrack _notifyAssetThatDurationDidChangeWithSuccess:](self, "_notifyAssetThatDurationDidChangeWithSuccess:");
  [(AVMutableCompositionTrack *)self didChangeValueForKey:@"segments"];
  if (v3)
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "postNotificationName:object:", @"AVAssetTrackTimeRangeDidChangeNotification", self);
    v5 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 postNotificationName:@"AVAssetTrackSegmentsDidChangeNotification" object:self];
  }
}

- (BOOL)isEnabled
{
  v3.receiver = self;
  v3.super_class = (Class)AVMutableCompositionTrack;
  return [(AVCompositionTrack *)&v3 isEnabled];
}

- (void)setEnabled:(BOOL)enabled
{
  uint64_t v4 = [MEMORY[0x1E4F28ED0] numberWithBool:enabled];
  uint64_t v5 = *MEMORY[0x1E4F330C0];
  [(AVMutableCompositionTrack *)self _setTrackReaderPropertyValue:v4 forKey:v5];
}

- (NSArray)segments
{
  v3.receiver = self;
  v3.super_class = (Class)AVMutableCompositionTrack;
  return [(AVCompositionTrack *)&v3 segments];
}

- (void)setSegments:(NSArray *)segments
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(AVCompositionTrack *)self _mutableComposition];
  uint64_t v6 = [(NSArray *)segments count];
  [(AVMutableCompositionTrack *)self _notifyAssetThatDurationWillChange];
  if (v6 < 1)
  {
    v7 = 0;
  }
  else
  {
    v7 = (long long *)malloc_type_malloc(108 * v6, 0x1060040CB727B4DuLL);
    if (!v7)
    {
      BOOL v18 = 1;
      goto LABEL_21;
    }
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    uint64_t v8 = [(NSArray *)segments countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v26;
      v11 = v7;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v26 != v10) {
            objc_enumerationMutation(segments);
          }
          v13 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          if (v13)
          {
            [*(id *)(*((void *)&v25 + 1) + 8 * i) timeMapping];
          }
          else
          {
            long long v23 = 0u;
            long long v24 = 0u;
            long long v21 = 0u;
            long long v22 = 0u;
            long long v19 = 0u;
            long long v20 = 0u;
          }
          long long *v11 = v19;
          v11[1] = v20;
          v11[4] = v23;
          v11[5] = v24;
          v11[2] = v21;
          v11[3] = v22;
          *((void *)v11 + 12) = objc_msgSend(v13, "sourceURL", v19, v20, v21, v22, v23, v24);
          *((_DWORD *)v11 + 26) = [v13 sourceTrackID];
          v11 = (long long *)((char *)v11 + 108);
        }
        uint64_t v9 = [(NSArray *)segments countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v9);
    }
  }
  uint64_t v14 = [(AVAssetTrack *)self trackID];
  uint64_t v15 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v15) {
    uint64_t v16 = v15;
  }
  else {
    uint64_t v16 = 0;
  }
  v17 = *(unsigned int (**)(OpaqueFigMutableComposition *, uint64_t, uint64_t, long long *))(v16 + 48);
  if (v17) {
    BOOL v18 = v17(v5, v14, v6, v7) == 0;
  }
  else {
    BOOL v18 = 0;
  }
LABEL_21:
  free(v7);
  [(AVMutableCompositionTrack *)self _notifyAssetThatDurationDidChangeWithSuccess:v18];
}

- (BOOL)_insertTimeRange:(id *)a3 ofTrack:(id)a4 atTime:(id *)a5 fireKVO:(BOOL)a6 error:(id *)a7
{
  BOOL v8 = a6;
  v13 = [(AVCompositionTrack *)self _mutableComposition];
  uint64_t v14 = (void *)[a4 asset];
  uint64_t v15 = [v14 _absoluteURL];
  uint64_t v16 = [v14 _mutableComposition];
  if (v8) {
    [(AVMutableCompositionTrack *)self _notifySelfThatSegmentsWillChange];
  }
  if (v15)
  {
    uint64_t v17 = [v14 _figAsset];
    uint64_t v18 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v18) {
      uint64_t v19 = v18;
    }
    else {
      uint64_t v19 = 0;
    }
    long long v24 = *(uint64_t (**)(OpaqueFigMutableComposition *, uint64_t, uint64_t))(v19 + 176);
    if (v24)
    {
      signed int v25 = v24(v13, v15, v17);
      if (v25) {
        goto LABEL_21;
      }
      uint64_t v26 = [(AVAssetTrack *)self trackID];
      uint64_t v27 = [a4 trackID];
      long long v43 = *(_OWORD *)&a3->var0.var0;
      int64_t var3 = a3->var0.var3;
      long long v39 = *(_OWORD *)&a3->var1.var0;
      int64_t v41 = a3->var1.var3;
      long long v35 = *(_OWORD *)&a5->var0;
      int64_t v37 = a5->var3;
      uint64_t v28 = *(void *)(CMBaseObjectGetVTable() + 16);
      uint64_t v29 = v28 ? v28 : 0;
      v31 = *(uint64_t (**)(OpaqueFigMutableComposition *, uint64_t, uint64_t, uint64_t, long long *, long long *, long long *))(v29 + 88);
      if (v31)
      {
        long long v50 = v43;
        int64_t v51 = var3;
        long long v48 = v39;
        int64_t v49 = v41;
        long long v46 = v35;
        int64_t v47 = v37;
        signed int v25 = v31(v13, v26, v15, v27, &v50, &v48, &v46);
LABEL_21:
        signed int v32 = v25;
        if (!a7) {
          goto LABEL_26;
        }
        goto LABEL_24;
      }
    }
  }
  else
  {
    if (!v16)
    {
      signed int v25 = FigSignalErrorAt();
      goto LABEL_21;
    }
    uint64_t v20 = [(AVAssetTrack *)self trackID];
    uint64_t v21 = [a4 trackID];
    long long v42 = *(_OWORD *)&a3->var0.var0;
    int64_t v44 = a3->var0.var3;
    long long v38 = *(_OWORD *)&a3->var1.var0;
    int64_t v40 = a3->var1.var3;
    long long v34 = *(_OWORD *)&a5->var0;
    int64_t v36 = a5->var3;
    uint64_t v22 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v22) {
      uint64_t v23 = v22;
    }
    else {
      uint64_t v23 = 0;
    }
    uint64_t v30 = *(uint64_t (**)(OpaqueFigMutableComposition *, uint64_t, uint64_t, uint64_t, long long *, long long *, long long *))(v23 + 184);
    if (v30)
    {
      long long v50 = v42;
      int64_t v51 = v44;
      long long v48 = v38;
      int64_t v49 = v40;
      long long v46 = v34;
      int64_t v47 = v36;
      signed int v25 = v30(v13, v20, v16, v21, &v50, &v48, &v46);
      goto LABEL_21;
    }
  }
  signed int v32 = -12782;
  if (!a7) {
    goto LABEL_26;
  }
LABEL_24:
  if (v32) {
    *a7 = (id)AVLocalizedErrorWithUnderlyingOSStatus(v32, 0);
  }
LABEL_26:
  if (v8) {
    [(AVMutableCompositionTrack *)self _notifySelfThatSegmentsDidChangeWithSuccess:v32 == 0];
  }
  return v32 == 0;
}

- (BOOL)insertTimeRange:(CMTimeRange *)timeRange ofTrack:(AVAssetTrack *)track atTime:(CMTime *)startTime error:(NSError *)outError
{
  long long v6 = *(_OWORD *)&timeRange->start.epoch;
  v9[0] = *(_OWORD *)&timeRange->start.value;
  v9[1] = v6;
  v9[2] = *(_OWORD *)&timeRange->duration.timescale;
  CMTime v8 = *startTime;
  return [(AVMutableCompositionTrack *)self _insertTimeRange:v9 ofTrack:track atTime:&v8 fireKVO:1 error:outError];
}

- (BOOL)insertTimeRanges:(NSArray *)timeRanges ofTracks:(NSArray *)tracks atTime:(CMTime *)startTime error:(NSError *)outError
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  long long v50 = [(AVCompositionTrack *)self _mutableComposition];
  uint64_t v9 = (void *)[MEMORY[0x1E4F1CA48] array];
  int64_t v51 = (void *)[MEMORY[0x1E4F1CA48] array];
  uint64_t v10 = (void *)[MEMORY[0x1E4F1CA48] array];
  v11 = (void *)[MEMORY[0x1E4F1CA48] array];
  v45 = self;
  [(AVMutableCompositionTrack *)self _notifySelfThatSegmentsWillChange];
  NSUInteger v12 = [(NSArray *)timeRanges count];
  if (v12 != [(NSArray *)tracks count]) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"Count of timeRanges array and count of tracks array do not match." userInfo:0]);
  }
  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  uint64_t v13 = [(NSArray *)tracks countByEnumeratingWithState:&v58 objects:v63 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v59;
    uint64_t v47 = *(void *)v59;
    uint64_t v48 = *MEMORY[0x1E4F1D260];
    long long v46 = tracks;
    while (2)
    {
      uint64_t v16 = 0;
      uint64_t v49 = v14;
      do
      {
        if (*(void *)v59 != v15) {
          objc_enumerationMutation(tracks);
        }
        uint64_t v17 = *(void **)(*((void *)&v58 + 1) + 8 * v16);
        if (objc_msgSend(v17, "isEqual:", objc_msgSend(MEMORY[0x1E4F1CA98], "null")))
        {
          [v9 addObject:v48];
          objc_msgSend(v51, "addObject:", objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInt:", 0));
        }
        else
        {
          uint64_t v18 = (void *)[v17 asset];
          uint64_t v19 = [v18 _absoluteURL];
          uint64_t v20 = [v18 _mutableComposition];
          objc_msgSend(v51, "addObject:", objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInt:", objc_msgSend(v17, "trackID")));
          if (v19)
          {
            [v9 addObject:v19];
            uint64_t v21 = [v18 _figAsset];
            uint64_t v22 = *(void *)(CMBaseObjectGetVTable() + 16);
            if (v22) {
              uint64_t v23 = v22;
            }
            else {
              uint64_t v23 = 0;
            }
            uint64_t v15 = v47;
            uint64_t v14 = v49;
            long long v24 = *(uint64_t (**)(OpaqueFigMutableComposition *, uint64_t, uint64_t))(v23 + 176);
            if (!v24)
            {
              signed int v38 = -12782;
              goto LABEL_41;
            }
            signed int v25 = v24(v50, v19, v21);
            tracks = v46;
            if (v25) {
              goto LABEL_40;
            }
          }
          else
          {
            if (!v20)
            {
              signed int v25 = FigSignalErrorAt();
LABEL_40:
              signed int v38 = v25;
LABEL_41:
              long long v34 = v45;
              goto LABEL_42;
            }
            [v9 addObject:v20];
            tracks = v46;
            uint64_t v15 = v47;
            uint64_t v14 = v49;
          }
        }
        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [(NSArray *)tracks countByEnumeratingWithState:&v58 objects:v63 count:16];
      if (v14) {
        continue;
      }
      break;
    }
  }
  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  uint64_t v26 = -[NSArray countByEnumeratingWithState:objects:count:](timeRanges, "countByEnumeratingWithState:objects:count:", &v54, v62, 16, v9);
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v55;
    CFAllocatorRef v29 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    do
    {
      for (uint64_t i = 0; i != v27; ++i)
      {
        if (*(void *)v55 != v28) {
          objc_enumerationMutation(timeRanges);
        }
        v31 = *(void **)(*((void *)&v54 + 1) + 8 * i);
        memset(v53, 0, sizeof(v53));
        if (v31) {
          [v31 CMTimeRangeValue];
        }
        CMTime time = v53[0];
        CFDictionaryRef v32 = CMTimeCopyAsDictionary(&time, v29);
        CMTime time = v53[1];
        CFDictionaryRef v33 = CMTimeCopyAsDictionary(&time, v29);
        [v10 addObject:v32];
        [v11 addObject:v33];
        if (v32) {
          CFRelease(v32);
        }
        if (v33) {
          CFRelease(v33);
        }
      }
      uint64_t v27 = [(NSArray *)timeRanges countByEnumeratingWithState:&v54 objects:v62 count:16];
    }
    while (v27);
  }
  long long v34 = v45;
  uint64_t v35 = [(AVAssetTrack *)v45 trackID];
  CMTime time = *startTime;
  uint64_t v36 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v36) {
    uint64_t v37 = v36;
  }
  else {
    uint64_t v37 = 0;
  }
  long long v39 = *(uint64_t (**)(OpaqueFigMutableComposition *, uint64_t, uint64_t, void *, void *, void *, CMTime *))(v37 + 168);
  if (v39)
  {
    v53[0] = time;
    signed int v38 = v39(v50, v35, v42, v51, v10, v11, v53);
  }
  else
  {
    signed int v38 = -12782;
  }
LABEL_42:
  if (outError && v38) {
    *outError = (NSError *)AVLocalizedErrorWithUnderlyingOSStatus(v38, 0);
  }
  BOOL v40 = v38 == 0;
  [(AVMutableCompositionTrack *)v34 _notifySelfThatSegmentsDidChangeWithSuccess:v40];
  return v40;
}

- (void)_insertEmptyTimeRange:(id *)a3 fireKVO:(BOOL)a4
{
  BOOL v4 = a4;
  v7 = [(AVCompositionTrack *)self _mutableComposition];
  if (v4) {
    [(AVMutableCompositionTrack *)self _notifySelfThatSegmentsWillChange];
  }
  uint64_t v8 = [(AVAssetTrack *)self trackID];
  long long v15 = *(_OWORD *)&a3->var0.var0;
  int64_t var3 = a3->var0.var3;
  long long v13 = *(_OWORD *)&a3->var1.var0;
  int64_t v14 = a3->var1.var3;
  uint64_t v9 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v9) {
    uint64_t v10 = v9;
  }
  else {
    uint64_t v10 = 0;
  }
  v11 = *(uint64_t (**)(OpaqueFigMutableComposition *, uint64_t, long long *, long long *))(v10 + 104);
  if (!v11)
  {
    int v12 = -12782;
    if (!v4) {
      return;
    }
    goto LABEL_10;
  }
  long long v19 = v15;
  int64_t v20 = var3;
  long long v17 = v13;
  int64_t v18 = v14;
  int v12 = v11(v7, v8, &v19, &v17);
  if (v4) {
LABEL_10:
  }
    [(AVMutableCompositionTrack *)self _notifySelfThatSegmentsDidChangeWithSuccess:v12 == 0];
}

- (void)insertEmptyTimeRange:(CMTimeRange *)timeRange
{
  long long v3 = *(_OWORD *)&timeRange->start.epoch;
  v4[0] = *(_OWORD *)&timeRange->start.value;
  v4[1] = v3;
  v4[2] = *(_OWORD *)&timeRange->duration.timescale;
  [(AVMutableCompositionTrack *)self _insertEmptyTimeRange:v4 fireKVO:1];
}

- (void)_removeTimeRange:(id *)a3 fireKVO:(BOOL)a4
{
  BOOL v4 = a4;
  v7 = [(AVCompositionTrack *)self _mutableComposition];
  if (v4) {
    [(AVMutableCompositionTrack *)self _notifySelfThatSegmentsWillChange];
  }
  uint64_t v8 = [(AVAssetTrack *)self trackID];
  long long v15 = *(_OWORD *)&a3->var0.var0;
  int64_t var3 = a3->var0.var3;
  long long v13 = *(_OWORD *)&a3->var1.var0;
  int64_t v14 = a3->var1.var3;
  uint64_t v9 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v9) {
    uint64_t v10 = v9;
  }
  else {
    uint64_t v10 = 0;
  }
  v11 = *(uint64_t (**)(OpaqueFigMutableComposition *, uint64_t, long long *, long long *))(v10 + 120);
  if (!v11)
  {
    int v12 = -12782;
    if (!v4) {
      return;
    }
    goto LABEL_10;
  }
  long long v19 = v15;
  int64_t v20 = var3;
  long long v17 = v13;
  int64_t v18 = v14;
  int v12 = v11(v7, v8, &v19, &v17);
  if (v4) {
LABEL_10:
  }
    [(AVMutableCompositionTrack *)self _notifySelfThatSegmentsDidChangeWithSuccess:v12 == 0];
}

- (void)removeTimeRange:(CMTimeRange *)timeRange
{
  long long v3 = *(_OWORD *)&timeRange->start.epoch;
  v4[0] = *(_OWORD *)&timeRange->start.value;
  v4[1] = v3;
  v4[2] = *(_OWORD *)&timeRange->duration.timescale;
  [(AVMutableCompositionTrack *)self _removeTimeRange:v4 fireKVO:1];
}

- (void)scaleTimeRange:(CMTimeRange *)timeRange toDuration:(CMTime *)duration
{
  v7 = [(AVCompositionTrack *)self _mutableComposition];
  [(AVMutableCompositionTrack *)self _notifySelfThatSegmentsWillChange];
  uint64_t v8 = [(AVAssetTrack *)self trackID];
  long long v15 = *(_OWORD *)&timeRange->start.value;
  CMTimeEpoch epoch = timeRange->start.epoch;
  CMTime v14 = timeRange->duration;
  CMTime v13 = *duration;
  uint64_t v9 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v9) {
    uint64_t v10 = v9;
  }
  else {
    uint64_t v10 = 0;
  }
  v11 = *(unsigned int (**)(OpaqueFigMutableComposition *, uint64_t, long long *, CMTime *, CMTime *))(v10 + 136);
  if (v11)
  {
    long long v19 = v15;
    CMTimeEpoch v20 = epoch;
    CMTime v18 = v14;
    CMTime v17 = v13;
    BOOL v12 = v11(v7, v8, &v19, &v18, &v17) == 0;
  }
  else
  {
    BOOL v12 = 0;
  }
  -[AVMutableCompositionTrack _notifySelfThatSegmentsDidChangeWithSuccess:](self, "_notifySelfThatSegmentsDidChangeWithSuccess:", v12, *(_OWORD *)&v13.value, v13.epoch);
}

- (BOOL)validateTrackSegments:(NSArray *)trackSegments error:(NSError *)outError
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  long long v16 = *MEMORY[0x1E4F1FA48];
  CMTimeEpoch v6 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
  v27.CMTimeEpoch epoch = v6;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  *(_OWORD *)&v27.value = v16;
  uint64_t v7 = [(NSArray *)trackSegments countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    long long v15 = outError;
    uint64_t v9 = *(void *)v24;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(trackSegments);
        }
        v11 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        memset(v22, 0, sizeof(v22));
        long long v21 = 0u;
        long long v19 = 0u;
        memset(v20, 0, sizeof(v20));
        if (v11) {
          [v11 timeMapping];
        }
        *(_OWORD *)&time1.value = v21;
        time1.CMTimeEpoch epoch = *(void *)&v22[0];
        CMTime time2 = v27;
        if (CMTimeCompare(&time1, &time2))
        {
          uint64_t v13 = -11824;
LABEL_25:
          if (!v15) {
            return 0;
          }
          uint64_t v14 = [MEMORY[0x1E4F28C58] errorWithDomain:@"AVFoundationErrorDomain" code:v13 userInfo:0];
          BOOL result = 0;
          *long long v15 = (NSError *)v14;
          return result;
        }
        if ((BYTE4(v22[1]) & 0x1D) != 1
          || (CMTime time1 = *(CMTime *)((char *)v22 + 8),
              *(_OWORD *)&time2.value = v16,
              time2.CMTimeEpoch epoch = v6,
              CMTimeCompare(&time1, &time2) < 1))
        {
          uint64_t v13 = -11825;
          goto LABEL_25;
        }
        if ([v11 sourceURL])
        {
          if ((BYTE12(v19) & 0x1D) != 1
            || (*(_OWORD *)&time1.value = v19,
                time1.CMTimeEpoch epoch = *(void *)&v20[0],
                *(_OWORD *)&time2.value = v16,
                time2.CMTimeEpoch epoch = v6,
                CMTimeCompare(&time1, &time2) < 0))
          {
LABEL_22:
            uint64_t v13 = -11826;
            goto LABEL_25;
          }
          if ((BYTE4(v20[1]) & 0x1D) != 1
            || (CMTime time1 = *(CMTime *)((char *)v20 + 8),
                *(_OWORD *)&time2.value = v16,
                time2.CMTimeEpoch epoch = v6,
                CMTimeCompare(&time1, &time2) < 1))
          {
            uint64_t v13 = -11827;
            goto LABEL_25;
          }
        }
        else if (BYTE12(v19))
        {
          goto LABEL_22;
        }
        CMTime time1 = v27;
        CMTime time2 = *(CMTime *)((char *)v22 + 8);
        CMTimeAdd(&v27, &time1, &time2);
      }
      uint64_t v8 = [(NSArray *)trackSegments countByEnumeratingWithState:&v23 objects:v28 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  return 1;
}

- (void)_setTrackReaderPropertyValue:(void *)a3 forKey:(__CFString *)a4
{
  uint64_t v7 = [(AVCompositionTrack *)self _mutableComposition];
  uint64_t v8 = [(AVAssetTrack *)self trackID];
  uint64_t v9 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v9) {
    uint64_t v10 = v9;
  }
  else {
    uint64_t v10 = 0;
  }
  v11 = *(void (**)(OpaqueFigMutableComposition *, uint64_t, __CFString *, void *))(v10 + 80);
  if (v11)
  {
    v11(v7, v8, a4, a3);
  }
}

- (CMTimeScale)naturalTimeScale
{
  v3.receiver = self;
  v3.super_class = (Class)AVMutableCompositionTrack;
  return [(AVAssetTrack *)&v3 naturalTimeScale];
}

- (void)setNaturalTimeScale:(CMTimeScale)naturalTimeScale
{
  if (naturalTimeScale) {
    uint64_t v4 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInt:");
  }
  else {
    uint64_t v4 = 0;
  }
  uint64_t v5 = *MEMORY[0x1E4F34AB0];
  [(AVMutableCompositionTrack *)self _setTrackReaderPropertyValue:v4 forKey:v5];
}

- (NSString)languageCode
{
  v3.receiver = self;
  v3.super_class = (Class)AVMutableCompositionTrack;
  return [(AVAssetTrack *)&v3 languageCode];
}

- (void)setLanguageCode:(NSString *)languageCode
{
}

- (NSString)extendedLanguageTag
{
  v3.receiver = self;
  v3.super_class = (Class)AVMutableCompositionTrack;
  return [(AVAssetTrack *)&v3 extendedLanguageTag];
}

- (void)setExtendedLanguageTag:(NSString *)extendedLanguageTag
{
}

- (CGAffineTransform)preferredTransform
{
  v4.receiver = self;
  v4.super_class = (Class)AVMutableCompositionTrack;
  return (CGAffineTransform *)[(CGAffineTransform *)&v4 preferredTransform];
}

- (void)setPreferredTransform:(CGAffineTransform *)preferredTransform
{
  CGAffineTransform v5 = *preferredTransform;
  objc_super v4 = (const void *)FigCreate3x3MatrixArrayFromCGAffineTransform();
  -[AVMutableCompositionTrack _setTrackReaderPropertyValue:forKey:](self, "_setTrackReaderPropertyValue:forKey:", v4, *MEMORY[0x1E4F34A70], *(_OWORD *)&v5.a, *(_OWORD *)&v5.c, *(_OWORD *)&v5.tx);
  if (v4) {
    CFRelease(v4);
  }
}

- (float)preferredVolume
{
  v3.receiver = self;
  v3.super_class = (Class)AVMutableCompositionTrack;
  [(AVAssetTrack *)&v3 preferredVolume];
  return result;
}

- (void)setPreferredVolume:(float)preferredVolume
{
  uint64_t v4 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithFloat:");
  uint64_t v5 = *MEMORY[0x1E4F34AD8];
  [(AVMutableCompositionTrack *)self _setTrackReaderPropertyValue:v4 forKey:v5];
}

- (int64_t)alternateGroupID
{
  CFTypeRef cf = 0;
  __int16 valuePtr = 0;
  objc_super v3 = [(AVCompositionTrack *)self _mutableComposition];
  uint64_t v4 = [(AVAssetTrack *)self trackID];
  uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v5) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  uint64_t v7 = *(uint64_t (**)(OpaqueFigMutableComposition *, uint64_t, void, void, CFTypeRef *))(v6 + 72);
  if (v7)
  {
    int v8 = v7(v3, v4, *MEMORY[0x1E4F330B8], *MEMORY[0x1E4F1CF80], &cf);
    CFTypeRef v9 = cf;
    if (!v8)
    {
      if (!cf) {
        return valuePtr;
      }
      CFTypeID v10 = CFGetTypeID(cf);
      CFTypeID TypeID = CFNumberGetTypeID();
      CFTypeRef v9 = cf;
      if (v10 == TypeID && cf)
      {
        CFNumberGetValue((CFNumberRef)cf, kCFNumberSInt16Type, &valuePtr);
        CFTypeRef v9 = cf;
      }
    }
    if (v9) {
      CFRelease(v9);
    }
  }
  return valuePtr;
}

- (void)setAlternateGroupID:(int64_t)a3
{
  uint64_t v4 = [MEMORY[0x1E4F28ED0] numberWithInteger:a3];
  uint64_t v5 = *MEMORY[0x1E4F330B8];
  [(AVMutableCompositionTrack *)self _setTrackReaderPropertyValue:v4 forKey:v5];
}

- (void)_updateTrackAssociationToTrack:(id)a3 type:(id)a4 operation:(int64_t)a5
{
  *(_DWORD *)&valuePtr[8] = 0;
  *(void *)__int16 valuePtr = [(AVAssetTrack *)self trackID];
  CFAllocatorRef v9 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CFNumberRef v10 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], kCFNumberSInt32Type, valuePtr);
  int v34 = [a3 trackID];
  CFNumberRef v11 = CFNumberCreate(v9, kCFNumberSInt32Type, &v34);
  CFNumberRef v12 = v11;
  if (v10) {
    BOOL v13 = v11 == 0;
  }
  else {
    BOOL v13 = 1;
  }
  if (!v13)
  {
    [(AVCompositionTrack *)self _mutableComposition];
    uint64_t FigBaseObject = FigMutableCompositionGetFigBaseObject();
    uint64_t v15 = *(void *)(CMBaseObjectGetVTable() + 8);
    uint64_t v16 = v15 ? v15 : 0;
    CMTime v17 = *(unsigned int (**)(uint64_t))(v16 + 48);
    if (v17)
    {
      uint64_t v32 = *MEMORY[0x1E4F330B0];
      if (!v17(FigBaseObject))
      {
        CMTime v18 = *(void **)&valuePtr[4];
        long long v19 = (void *)[*(id *)&valuePtr[4] objectForKey:a4];
        uint64_t v20 = [v19 count];
        if (v19)
        {
          v33[0] = MEMORY[0x1E4F143A8];
          v33[1] = 3221225472;
          v33[2] = __75__AVMutableCompositionTrack__updateTrackAssociationToTrack_type_operation___block_invoke;
          v33[3] = &unk_1E57B43C0;
          v33[4] = v19;
          v33[5] = v20;
          v33[6] = v10;
          v33[7] = v12;
          uint64_t v21 = [v19 indexOfObjectPassingTest:v33];
        }
        else
        {
          uint64_t v21 = 0x7FFFFFFFFFFFFFFFLL;
        }
        BOOL v22 = v21 == 0x7FFFFFFFFFFFFFFFLL && a5 == 0;
        BOOL v23 = v21 != 0x7FFFFFFFFFFFFFFFLL && a5 == 1;
        if (v22 || v23)
        {
          id v24 = v18
              ? (id)[v18 mutableCopy]
              : (id)[MEMORY[0x1E4F1CA60] dictionary];
          long long v25 = v24;
          id v26 = v19
              ? (id)[v19 mutableCopy]
              : (id)[MEMORY[0x1E4F1CA48] array];
          CMTime v27 = v26;
          if (v25)
          {
            if (v26)
            {
              if (v22)
              {
                [v26 addObject:v10];
                [v27 addObject:v12];
              }
              else if (v23)
              {
                [v26 removeObjectAtIndex:v21];
                [v27 removeObjectAtIndex:v21];
              }
              [v25 setObject:v27 forKey:a4];
              [(AVCompositionTrack *)self _mutableComposition];
              uint64_t v28 = FigMutableCompositionGetFigBaseObject();
              uint64_t v29 = *(void *)(CMBaseObjectGetVTable() + 8);
              if (v29) {
                uint64_t v30 = v29;
              }
              else {
                uint64_t v30 = 0;
              }
              v31 = *(void (**)(uint64_t, uint64_t, void *))(v30 + 56);
              if (v31) {
                v31(v28, v32, v25);
              }
            }
          }
        }
      }
    }
  }
  if (*(void *)&valuePtr[4]) {
    CFRelease(*(CFTypeRef *)&valuePtr[4]);
  }
  if (v10) {
    CFRelease(v10);
  }
  if (v12) {
    CFRelease(v12);
  }
}

uint64_t __75__AVMutableCompositionTrack__updateTrackAssociationToTrack_type_operation___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  if (a3) {
    return 0;
  }
  uint64_t v5 = a3 + 1;
  if (*(void *)(a1 + 40) <= (unint64_t)(a3 + 1)) {
    return 0;
  }
  uint64_t result = [a2 isEqual:*(void *)(a1 + 48)];
  if (result)
  {
    uint64_t result = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", v5), "isEqual:", *(void *)(a1 + 56));
    if (result)
    {
      uint64_t result = 1;
      *a4 = 1;
    }
  }
  return result;
}

- (void)addTrackAssociationToTrack:(AVCompositionTrack *)compositionTrack type:(AVTrackAssociationType)trackAssociationType
{
}

- (void)removeTrackAssociationToTrack:(AVCompositionTrack *)compositionTrack type:(AVTrackAssociationType)trackAssociationType
{
}

- (void)setMetadata:(id)a3
{
  id v4 = +[AVMetadataItem _figMetadataPropertyFromMetadataItems:a3];
  uint64_t v5 = *MEMORY[0x1E4F330D0];
  [(AVMutableCompositionTrack *)self _setTrackReaderPropertyValue:v4 forKey:v5];
}

+ (BOOL)expectsPropertyRevisedNotifications
{
  return 0;
}

- (void)replaceFormatDescription:(CMFormatDescriptionRef)originalFormatDescription withFormatDescription:(CMFormatDescriptionRef)replacementFormatDescription
{
  v56[2] = *MEMORY[0x1E4F143B8];
  CFTypeRef cf = 0;
  uint64_t v8 = *MEMORY[0x1E4F1EE50];
  v56[0] = *MEMORY[0x1E4F1EE58];
  v56[1] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v56 count:2];
  if (!originalFormatDescription)
  {
    uint64_t v42 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v43 = *MEMORY[0x1E4F1C3C8];
    uint64_t v44 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"invalid parameter not satisfying: %s", v10, v11, v12, v13, v14, (uint64_t)"originalFormatDescription != NULL");
    goto LABEL_31;
  }
  if (originalFormatDescription == replacementFormatDescription) {
    return;
  }
  uint64_t v15 = (const void *)v9;
  if (replacementFormatDescription)
  {
    CMMediaType MediaType = CMFormatDescriptionGetMediaType(originalFormatDescription);
    if (MediaType != CMFormatDescriptionGetMediaType(replacementFormatDescription))
    {
      uint64_t v42 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v43 = *MEMORY[0x1E4F1C3C8];
      uint64_t v44 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"Media type of the new format description must match that of the existing format description", v17, v18, v19, v20, v21, v45);
LABEL_31:
      objc_exception_throw((id)[v42 exceptionWithName:v43 reason:v44 userInfo:0]);
    }
  }
  BOOL v22 = [(AVCompositionTrack *)self _mutableComposition];
  uint64_t v23 = [(AVAssetTrack *)self trackID];
  uint64_t v24 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v24) {
    uint64_t v25 = v24;
  }
  else {
    uint64_t v25 = 0;
  }
  id v26 = *(unsigned __int16 (**)(OpaqueFigMutableComposition *, uint64_t, void, void, CFTypeRef *))(v25 + 72);
  if (v26)
  {
    uint64_t v27 = *MEMORY[0x1E4F330C8];
    if (!v26(v22, v23, *MEMORY[0x1E4F330C8], *MEMORY[0x1E4F1CF80], &cf))
    {
      uint64_t v46 = v27;
      uint64_t v47 = self;
      uint64_t v28 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend((id)cf, "count"));
      long long v48 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      uint64_t v29 = (void *)cf;
      uint64_t v30 = [(id)cf countByEnumeratingWithState:&v48 objects:v55 count:16];
      if (v30)
      {
        uint64_t v31 = v30;
        uint64_t v32 = *(void *)v49;
        uint64_t v33 = *MEMORY[0x1E4F33090];
        do
        {
          for (uint64_t i = 0; i != v31; ++i)
          {
            if (*(void *)v49 != v32) {
              objc_enumerationMutation(v29);
            }
            uint64_t v35 = *(void **)(*((void *)&v48 + 1) + 8 * i);
            if (!CMFormatDescriptionEqualIgnoringExtensionKeys((CMFormatDescriptionRef)[v35 objectForKey:v33], originalFormatDescription, v15, 0))objc_msgSend(v28, "addObject:", v35); {
          }
            }
          uint64_t v31 = [v29 countByEnumeratingWithState:&v48 objects:v55 count:16];
        }
        while (v31);
      }
      if (replacementFormatDescription)
      {
        uint64_t v36 = *MEMORY[0x1E4F33088];
        v53[0] = *MEMORY[0x1E4F33090];
        v53[1] = v36;
        v54[0] = originalFormatDescription;
        v54[1] = replacementFormatDescription;
        objc_msgSend(v28, "addObject:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v54, v53, 2));
      }
      uint64_t v37 = [(AVCompositionTrack *)v47 _mutableComposition];
      uint64_t v38 = [(AVAssetTrack *)v47 trackID];
      uint64_t v39 = *(void *)(CMBaseObjectGetVTable() + 16);
      if (v39) {
        uint64_t v40 = v39;
      }
      else {
        uint64_t v40 = 0;
      }
      int64_t v41 = *(void (**)(uint64_t, uint64_t, uint64_t, void *))(v40 + 80);
      if (v41) {
        v41(v37, v38, v46, v28);
      }
      if (cf) {
        CFRelease(cf);
      }
    }
  }
}

@end