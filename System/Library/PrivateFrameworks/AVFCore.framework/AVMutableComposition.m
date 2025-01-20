@interface AVMutableComposition
+ (AVMutableComposition)composition;
+ (AVMutableComposition)compositionWithURLAssetInitializationOptions:(NSDictionary *)URLAssetInitializationOptions;
- (AVMutableCompositionTrack)addMutableTrackWithMediaType:(AVMediaType)mediaType preferredTrackID:(CMPersistentTrackID)preferredTrackID;
- (AVMutableCompositionTrack)mutableTrackCompatibleWithTrack:(AVAssetTrack *)track;
- (AVMutableCompositionTrack)trackWithTrackID:(CMPersistentTrackID)trackID;
- (BOOL)insertTimeRange:(CMTimeRange *)timeRange ofAsset:(AVAsset *)asset atTime:(CMTime *)startTime error:(NSError *)outError;
- (CGSize)naturalSize;
- (NSArray)tracks;
- (NSArray)tracksWithMediaCharacteristic:(AVMediaCharacteristic)mediaCharacteristic;
- (NSArray)tracksWithMediaType:(AVMediaType)mediaType;
- (id)_addMutableTrackWithMediaType:(id)a3 preferredTrackID:(int)a4 fireKVO:(BOOL)a5;
- (id)_initWithComposition:(id)a3;
- (id)_newTrackForIndex:(int64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)_notifyTracksThatSegmentsDidChange:(id)a3 successfully:(BOOL)a4;
- (void)_notifyTracksThatSegmentsWillChange:(id)a3;
- (void)_removeTrack:(id)a3 fireKVO:(BOOL)a4;
- (void)insertEmptyTimeRange:(CMTimeRange *)timeRange;
- (void)insertTimeRange:(CMTimeRange *)timeRange ofAsset:(AVAsset *)asset atTime:(CMTime *)startTime completionHandler:(void *)completionHandler;
- (void)removeTimeRange:(CMTimeRange *)timeRange;
- (void)removeTrack:(AVCompositionTrack *)track;
- (void)scaleTimeRange:(CMTimeRange *)timeRange toDuration:(CMTime *)duration;
- (void)setMetadata:(id)a3;
@end

@implementation AVMutableComposition

+ (AVMutableComposition)composition
{
  id v2 = objc_alloc_init((Class)a1);
  return (AVMutableComposition *)v2;
}

+ (AVMutableComposition)compositionWithURLAssetInitializationOptions:(NSDictionary *)URLAssetInitializationOptions
{
  v6 = (AVMutableComposition *)objc_alloc_init((Class)a1);
  id v18 = 0;
  if (!-[AVComposition _setURLAssetInitializationOptions:error:](v6, "_setURLAssetInitializationOptions:error:", URLAssetInitializationOptions, &v18)&& [v18 code] == -11999)
  {
    v8 = objc_msgSend((id)objc_msgSend(v18, "userInfo"), "objectForKey:", @"AVErrorExceptionKey");
    uint64_t v9 = [v8 reason];
    v10 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v16 = [v8 name];
    if (v9) {
      [NSString stringWithFormat:@": %@", v9];
    }
    v17 = (void *)[v10 exceptionWithName:v16, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)a1, a2, @"Cannot honor specified AVURLAsset initialization options for AVMutableComposition <%p>%@", v11, v12, v13, v14, v15, (uint64_t)a1), 0 reason userInfo];
    objc_exception_throw(v17);
  }
  return v6;
}

- (id)_initWithComposition:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AVMutableComposition;
  return [(AVComposition *)&v4 _initWithComposition:a3];
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v4 = +[AVComposition allocWithZone:a3];
  return [(AVComposition *)v4 _initWithComposition:self];
}

- (id)_newTrackForIndex:(int64_t)a3
{
  v5 = [AVMutableCompositionTrack alloc];
  return [(AVAssetTrack *)v5 _initWithAsset:self trackIndex:a3];
}

- (NSArray)tracks
{
  v3.receiver = self;
  v3.super_class = (Class)AVMutableComposition;
  return [(AVComposition *)&v3 tracks];
}

- (AVMutableCompositionTrack)trackWithTrackID:(CMPersistentTrackID)trackID
{
  v4.receiver = self;
  v4.super_class = (Class)AVMutableComposition;
  return (AVMutableCompositionTrack *)[(AVComposition *)&v4 trackWithTrackID:*(void *)&trackID];
}

- (NSArray)tracksWithMediaType:(AVMediaType)mediaType
{
  v4.receiver = self;
  v4.super_class = (Class)AVMutableComposition;
  return [(AVComposition *)&v4 tracksWithMediaType:mediaType];
}

- (NSArray)tracksWithMediaCharacteristic:(AVMediaCharacteristic)mediaCharacteristic
{
  v4.receiver = self;
  v4.super_class = (Class)AVMutableComposition;
  return [(AVComposition *)&v4 tracksWithMediaCharacteristic:mediaCharacteristic];
}

- (CGSize)naturalSize
{
  v4.receiver = self;
  v4.super_class = (Class)AVMutableComposition;
  [(AVComposition *)&v4 naturalSize];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setMetadata:(id)a3
{
  id v4 = +[AVMetadataItem _figMetadataPropertyFromMetadataItems:a3];
  [(AVComposition *)self _mutableComposition];
  uint64_t FigBaseObject = FigMutableCompositionGetFigBaseObject();
  uint64_t v6 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v6) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = 0;
  }
  v8 = *(void (**)(uint64_t, uint64_t, id))(v7 + 56);
  if (v8)
  {
    uint64_t v9 = *MEMORY[0x1E4F330A8];
    v8(FigBaseObject, v9, v4);
  }
}

- (BOOL)insertTimeRange:(CMTimeRange *)timeRange ofAsset:(AVAsset *)asset atTime:(CMTime *)startTime error:(NSError *)outError
{
  uint64_t v11 = [(AVComposition *)self _mutableComposition];
  uint64_t v12 = [(AVComposition *)self _copyFormatReader];
  id v13 = [(AVAsset *)asset _absoluteURL];
  v42 = [(AVAsset *)asset _mutableComposition];
  uint64_t v58 = 0;
  uint64_t v59 = 0;
  id v43 = [(AVComposition *)self _mutableTracks];
  id v14 = (id)[v43 copy];
  [(AVMutableComposition *)self willChangeValueForKey:@"duration"];
  [(AVMutableComposition *)self willChangeValueForKey:@"tracks"];
  id v15 = v14;
  [(AVMutableComposition *)self _notifyTracksThatSegmentsWillChange:v14];
  uint64_t v16 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v16) {
    uint64_t v17 = v16;
  }
  else {
    uint64_t v17 = 0;
  }
  id v18 = *(uint64_t (**)(OpaqueFigFormatReader *, uint64_t *))(v17 + 8);
  if (!v18)
  {
LABEL_38:
    signed int v19 = -12782;
    goto LABEL_39;
  }
  signed int v19 = v18(v12, &v59);
  if (v19) {
    goto LABEL_39;
  }
  if (!v13)
  {
    p_duration = &timeRange->duration;
    if (v11)
    {
      long long v52 = *(_OWORD *)&timeRange->start.value;
      CMTimeEpoch epoch = timeRange->start.epoch;
      long long v48 = *(_OWORD *)&p_duration->value;
      CMTimeEpoch v50 = timeRange->duration.epoch;
      long long v44 = *(_OWORD *)&startTime->value;
      CMTimeEpoch v46 = startTime->epoch;
      uint64_t v24 = *(void *)(CMBaseObjectGetVTable() + 16);
      v25 = v43;
      if (v24) {
        uint64_t v26 = v24;
      }
      else {
        uint64_t v26 = 0;
      }
      v32 = *(uint64_t (**)(OpaqueFigMutableComposition *, OpaqueFigMutableComposition *, long long *, long long *, long long *))(v26 + 192);
      if (!v32) {
        goto LABEL_38;
      }
      long long v64 = v52;
      CMTimeEpoch v65 = epoch;
      long long v62 = v48;
      CMTimeEpoch v63 = v50;
      long long v60 = v44;
      CMTimeEpoch v61 = v46;
      signed int v19 = v32(v11, v42, &v64, &v62, &v60);
      if (v19) {
        goto LABEL_39;
      }
      goto LABEL_30;
    }
    long long v60 = *(_OWORD *)&startTime->value;
    CMTimeEpoch v61 = startTime->epoch;
    long long v54 = *(_OWORD *)&p_duration->value;
    CMTimeEpoch v57 = timeRange->duration.epoch;
    uint64_t v30 = *(void *)(CMBaseObjectGetVTable() + 16);
    v25 = v43;
    if (v30) {
      uint64_t v31 = v30;
    }
    else {
      uint64_t v31 = 0;
    }
    v34 = *(uint64_t (**)(void, long long *, long long *))(v31 + 112);
    if (!v34) {
      goto LABEL_38;
    }
    long long v64 = v60;
    CMTimeEpoch v65 = v61;
    long long v62 = v54;
    CMTimeEpoch v63 = v57;
    signed int v19 = v34(0, &v64, &v62);
    if (!v19) {
      goto LABEL_30;
    }
LABEL_39:
    v39 = (NSError *)AVLocalizedErrorWithUnderlyingOSStatus(v19, 0);
    BOOL v40 = 0;
    goto LABEL_40;
  }
  v20 = [(AVAsset *)asset _figAsset];
  uint64_t v21 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v21) {
    uint64_t v22 = v21;
  }
  else {
    uint64_t v22 = 0;
  }
  v27 = *(uint64_t (**)(OpaqueFigMutableComposition *, id, OpaqueFigAsset *))(v22 + 176);
  if (!v27) {
    goto LABEL_38;
  }
  signed int v19 = v27(v11, v13, v20);
  if (v19) {
    goto LABEL_39;
  }
  long long v53 = *(_OWORD *)&timeRange->start.value;
  CMTimeEpoch v56 = timeRange->start.epoch;
  long long v49 = *(_OWORD *)&timeRange->duration.value;
  CMTimeEpoch v51 = timeRange->duration.epoch;
  long long v45 = *(_OWORD *)&startTime->value;
  CMTimeEpoch v47 = startTime->epoch;
  uint64_t v28 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v28) {
    uint64_t v29 = v28;
  }
  else {
    uint64_t v29 = 0;
  }
  v33 = *(uint64_t (**)(OpaqueFigMutableComposition *, id, long long *, long long *, long long *))(v29 + 96);
  if (!v33) {
    goto LABEL_38;
  }
  long long v64 = v53;
  CMTimeEpoch v65 = v56;
  long long v62 = v49;
  CMTimeEpoch v63 = v51;
  long long v60 = v45;
  CMTimeEpoch v61 = v47;
  signed int v19 = v33(v11, v13, &v64, &v62, &v60);
  v25 = v43;
  if (v19) {
    goto LABEL_39;
  }
LABEL_30:
  uint64_t v35 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v35) {
    uint64_t v36 = v35;
  }
  else {
    uint64_t v36 = 0;
  }
  v37 = *(uint64_t (**)(OpaqueFigFormatReader *, uint64_t *))(v36 + 8);
  if (!v37) {
    goto LABEL_38;
  }
  signed int v19 = v37(v12, &v58);
  if (v19) {
    goto LABEL_39;
  }
  for (uint64_t i = v59; i < v58; ++i)
    objc_msgSend(v25, "addObject:", -[AVMutableComposition _newTrackForIndex:](self, "_newTrackForIndex:", i));
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "postNotificationName:object:", @"AVAssetDurationDidChangeNotification", self);
  v39 = 0;
  BOOL v40 = 1;
LABEL_40:
  [(AVMutableComposition *)self didChangeValueForKey:@"tracks"];
  [(AVMutableComposition *)self didChangeValueForKey:@"duration"];
  [(AVMutableComposition *)self _notifyTracksThatSegmentsDidChange:v15 successfully:v40];
  if (outError) {
    *outError = v39;
  }
  if (v12) {
    CFRelease(v12);
  }
  return v40;
}

- (void)insertTimeRange:(CMTimeRange *)timeRange ofAsset:(AVAsset *)asset atTime:(CMTime *)startTime completionHandler:(void *)completionHandler
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  long long v6 = *(_OWORD *)&timeRange->start.epoch;
  long long v8 = *(_OWORD *)&timeRange->start.value;
  v7[2] = __73__AVMutableComposition_insertTimeRange_ofAsset_atTime_completionHandler___block_invoke;
  v7[3] = &unk_1E57B4398;
  long long v9 = v6;
  long long v10 = *(_OWORD *)&timeRange->duration.timescale;
  v7[4] = self;
  v7[5] = asset;
  CMTime v11 = *startTime;
  v7[6] = completionHandler;
  AVLoadValueAsynchronously(asset, @"tracks", (uint64_t)v7);
}

uint64_t __73__AVMutableComposition_insertTimeRange_ofAsset_atTime_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v10 = a2;
  if (!a2)
  {
    double v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    long long v5 = *(_OWORD *)(a1 + 72);
    v9[0] = *(_OWORD *)(a1 + 56);
    v9[1] = v5;
    v9[2] = *(_OWORD *)(a1 + 88);
    long long v7 = *(_OWORD *)(a1 + 104);
    uint64_t v8 = *(void *)(a1 + 120);
    [v3 insertTimeRange:v9 ofAsset:v4 atTime:&v7 error:&v10];
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)insertEmptyTimeRange:(CMTimeRange *)timeRange
{
  long long v5 = [(AVComposition *)self _mutableComposition];
  long long v6 = [(AVMutableComposition *)self tracks];
  [(AVMutableComposition *)self willChangeValueForKey:@"duration"];
  [(AVMutableComposition *)self _notifyTracksThatSegmentsWillChange:v6];
  long long v12 = *(_OWORD *)&timeRange->start.value;
  CMTimeEpoch epoch = timeRange->start.epoch;
  CMTime duration = timeRange->duration;
  uint64_t v7 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v7) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = 0;
  }
  long long v9 = *(unsigned int (**)(OpaqueFigMutableComposition *, long long *, CMTime *))(v8 + 112);
  if (!v9 || (v15 = v12, v16 = epoch, CMTime v14 = duration, v9(v5, &v15, &v14)))
  {
    uint64_t v10 = 0;
  }
  else
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "postNotificationName:object:", @"AVAssetDurationDidChangeNotification", self);
    uint64_t v10 = 1;
  }
  [(AVMutableComposition *)self didChangeValueForKey:@"duration", *(_OWORD *)&duration.value, duration.epoch];
  [(AVMutableComposition *)self _notifyTracksThatSegmentsDidChange:v6 successfully:v10];
}

- (void)removeTimeRange:(CMTimeRange *)timeRange
{
  long long v5 = [(AVComposition *)self _mutableComposition];
  long long v6 = [(AVMutableComposition *)self tracks];
  [(AVMutableComposition *)self willChangeValueForKey:@"duration"];
  [(AVMutableComposition *)self _notifyTracksThatSegmentsWillChange:v6];
  long long v12 = *(_OWORD *)&timeRange->start.value;
  CMTimeEpoch epoch = timeRange->start.epoch;
  CMTime duration = timeRange->duration;
  uint64_t v7 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v7) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = 0;
  }
  long long v9 = *(unsigned int (**)(OpaqueFigMutableComposition *, long long *, CMTime *))(v8 + 128);
  if (!v9 || (v15 = v12, v16 = epoch, CMTime v14 = duration, v9(v5, &v15, &v14)))
  {
    uint64_t v10 = 0;
  }
  else
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "postNotificationName:object:", @"AVAssetDurationDidChangeNotification", self);
    uint64_t v10 = 1;
  }
  [(AVMutableComposition *)self didChangeValueForKey:@"duration", *(_OWORD *)&duration.value, duration.epoch];
  [(AVMutableComposition *)self _notifyTracksThatSegmentsDidChange:v6 successfully:v10];
}

- (void)scaleTimeRange:(CMTimeRange *)timeRange toDuration:(CMTime *)duration
{
  uint64_t v7 = [(AVComposition *)self _mutableComposition];
  uint64_t v8 = [(AVMutableComposition *)self tracks];
  [(AVMutableComposition *)self willChangeValueForKey:@"duration"];
  [(AVMutableComposition *)self _notifyTracksThatSegmentsWillChange:v8];
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
  CMTime v11 = *(unsigned int (**)(OpaqueFigMutableComposition *, long long *, CMTime *, CMTime *))(v10 + 144);
  if (!v11 || (v19 = v15, v20 = epoch, CMTime v18 = v14, v17 = v13, v11(v7, &v19, &v18, &v17)))
  {
    uint64_t v12 = 0;
  }
  else
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "postNotificationName:object:", @"AVAssetDurationDidChangeNotification", self);
    uint64_t v12 = 1;
  }
  [(AVMutableComposition *)self didChangeValueForKey:@"duration", *(_OWORD *)&v13.value, v13.epoch];
  [(AVMutableComposition *)self _notifyTracksThatSegmentsDidChange:v8 successfully:v12];
}

- (id)_addMutableTrackWithMediaType:(id)a3 preferredTrackID:(int)a4 fireKVO:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v6 = *(void *)&a4;
  uint64_t v9 = [(AVComposition *)self _mutableComposition];
  unsigned int v20 = 0;
  id v10 = [(AVComposition *)self _mutableTracks];
  int v11 = [a3 getCString:v21 maxLength:5 encoding:1];
  unsigned int v12 = bswap32(v21[0]);
  if (v11) {
    uint64_t v13 = v12;
  }
  else {
    uint64_t v13 = 0;
  }
  uint64_t v14 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v14) {
    uint64_t v15 = v14;
  }
  else {
    uint64_t v15 = 0;
  }
  CMTimeEpoch v16 = *(unsigned int (**)(OpaqueFigMutableComposition *, uint64_t, void, uint64_t, unsigned int *))(v15 + 32);
  if (!v16 || v16(v9, v13, 0, v6, &v20)) {
    return 0;
  }
  if (v5) {
    [(AVMutableComposition *)self willChangeValueForKey:@"tracks"];
  }
  CMTime v17 = [AVMutableCompositionTrack alloc];
  id v18 = [(AVAssetTrack *)v17 _initWithAsset:self trackID:v20];
  if (v18) {
    [v10 addObject:v18];
  }
  if (v5) {
    [(AVMutableComposition *)self didChangeValueForKey:@"tracks"];
  }
  return v18;
}

- (AVMutableCompositionTrack)addMutableTrackWithMediaType:(AVMediaType)mediaType preferredTrackID:(CMPersistentTrackID)preferredTrackID
{
  return (AVMutableCompositionTrack *)[(AVMutableComposition *)self _addMutableTrackWithMediaType:mediaType preferredTrackID:*(void *)&preferredTrackID fireKVO:1];
}

- (void)_removeTrack:(id)a3 fireKVO:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v7 = [(AVComposition *)self _mutableComposition];
  id v8 = [(AVComposition *)self _mutableTracks];
  uint64_t v9 = [v8 indexOfObject:a3];
  if (a3)
  {
    if (v8)
    {
      uint64_t v10 = v9;
      if (v9 != 0x7FFFFFFFFFFFFFFFLL && (AVMutableComposition *)[a3 asset] == self)
      {
        if (v4) {
          [(AVMutableComposition *)self willChangeValueForKey:@"duration"];
        }
        uint64_t v11 = [a3 trackID];
        uint64_t v12 = *(void *)(CMBaseObjectGetVTable() + 16);
        if (v12) {
          uint64_t v13 = v12;
        }
        else {
          uint64_t v13 = 0;
        }
        uint64_t v14 = *(unsigned int (**)(OpaqueFigMutableComposition *, uint64_t))(v13 + 40);
        if (v14 && !v14(v7, v11))
        {
          if (v4)
          {
            [(AVMutableComposition *)self willChangeValueForKey:@"tracks"];
            [v8 removeObjectAtIndex:v10];
            [(AVMutableComposition *)self didChangeValueForKey:@"tracks"];
          }
          else
          {
            [v8 removeObjectAtIndex:v10];
          }
          objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "postNotificationName:object:", @"AVAssetDurationDidChangeNotification", self);
        }
      }
    }
  }
  if (v4)
  {
    [(AVMutableComposition *)self didChangeValueForKey:@"duration"];
  }
}

- (void)removeTrack:(AVCompositionTrack *)track
{
}

- (AVMutableCompositionTrack)mutableTrackCompatibleWithTrack:(AVAssetTrack *)track
{
  BOOL v5 = [(AVComposition *)self _mutableComposition];
  unsigned int v23 = 0;
  uint64_t v6 = [(AVAssetTrack *)track asset];
  uint64_t v7 = [(AVAsset *)v6 _absoluteURL];
  uint64_t v8 = [(AVAsset *)v6 _mutableComposition];
  if (track)
  {
    if (v7)
    {
      uint64_t v9 = [(AVAsset *)v6 _figAsset];
      uint64_t v10 = *(void *)(CMBaseObjectGetVTable() + 16);
      if (v10) {
        uint64_t v11 = v10;
      }
      else {
        uint64_t v11 = 0;
      }
      CMTimeEpoch v16 = *(unsigned int (**)(OpaqueFigMutableComposition *, uint64_t, uint64_t))(v11 + 176);
      if (v16 && !v16(v5, v7, v9))
      {
        uint64_t v17 = [(AVAssetTrack *)track trackID];
        uint64_t v18 = *(void *)(CMBaseObjectGetVTable() + 16);
        uint64_t v19 = v18 ? v18 : 0;
        uint64_t v21 = *(unsigned int (**)(OpaqueFigMutableComposition *, uint64_t, uint64_t, unsigned int *))(v19 + 24);
        if (v21)
        {
          if (!v21(v5, v7, v17, &v23)) {
            return [(AVMutableComposition *)self trackWithTrackID:v23];
          }
        }
      }
    }
    else
    {
      uint64_t v12 = v8;
      if (v8)
      {
        uint64_t v13 = [(AVAssetTrack *)track trackID];
        uint64_t v14 = *(void *)(CMBaseObjectGetVTable() + 16);
        uint64_t v15 = v14 ? v14 : 0;
        unsigned int v20 = *(unsigned int (**)(OpaqueFigMutableComposition *, uint64_t, uint64_t, unsigned int *))(v15 + 200);
        if (v20)
        {
          if (!v20(v5, v12, v13, &v23)) {
            return [(AVMutableComposition *)self trackWithTrackID:v23];
          }
        }
      }
    }
  }
  return 0;
}

- (void)_notifyTracksThatSegmentsWillChange:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v4 = [a3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(a3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * v7++) willChangeValueForKey:@"segments"];
      }
      while (v5 != v7);
      uint64_t v5 = [a3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)_notifyTracksThatSegmentsDidChange:(id)a3 successfully:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v6 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(a3);
        }
        long long v10 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        [v10 didChangeValueForKey:@"segments"];
        if (v4)
        {
          objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "postNotificationName:object:", @"AVAssetTrackTimeRangeDidChangeNotification", v10);
          objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "postNotificationName:object:", @"AVAssetTrackSegmentsDidChangeNotification", v10);
        }
      }
      uint64_t v7 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

@end