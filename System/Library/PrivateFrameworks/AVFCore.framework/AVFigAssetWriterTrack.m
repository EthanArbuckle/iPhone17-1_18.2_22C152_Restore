@interface AVFigAssetWriterTrack
+ (AVFigAssetWriterTrack)assetWriterTrackWithFigAssetWriter:(OpaqueFigAssetWriter *)a3 mediaType:(id)a4 mediaFileType:(id)a5 formatSpecification:(id)a6 sourcePixelBufferAttributes:(id)a7 multiPass:(BOOL)a8 attachedAdaptor:(id)a9 error:(id *)a10;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)sampleBufferCoalescingInterval;
- (AVFigAssetWriterTrack)init;
- (AVFigAssetWriterTrack)initWithFigAssetWriter:(OpaqueFigAssetWriter *)a3 mediaType:(id)a4 mediaFileType:(id)a5 formatSpecification:(id)a6 sourcePixelBufferAttributes:(id)a7 multiPass:(BOOL)a8 error:(id *)a9;
- (AVMediaFileType)mediaFileType;
- (BOOL)addPixelBuffer:(__CVBuffer *)a3 atPresentationTime:(id *)a4 error:(id *)a5;
- (BOOL)addSampleBuffer:(opaqueCMSampleBuffer *)a3 error:(id *)a4;
- (BOOL)addTaggedPixelBufferGroup:(OpaqueCMTaggedBufferGroup *)a3 atPresentationTime:(id *)a4 error:(id *)a5;
- (BOOL)beginPassReturningError:(id *)a3;
- (BOOL)encoderSupportsMultiPass;
- (BOOL)isAboveHighWaterLevel;
- (BOOL)markEndOfDataReturningError:(id *)a3;
- (NSString)mediaType;
- (OpaqueFigAssetWriter)figAssetWriter;
- (__CVPixelBufferPool)pixelBufferPool;
- (int)_attachToFigAssetWriterUsingFormatSpecification:(id)a3 sourcePixelBufferAttributes:(id)a4 multiPass:(BOOL)a5 error:(id *)a6;
- (int)trackID;
- (void)_figAssetWriterDidDropBelowLowWaterLevelForTrackID:(int)a3;
- (void)_refreshAboveHighWaterLevel;
- (void)dealloc;
- (void)endPassWithCompletionHandler:(id)a3;
- (void)setAlternateGroupID:(signed __int16)a3;
- (void)setExcludeFromAutoSelection:(BOOL)a3;
- (void)setExtendedLanguageTag:(id)a3;
- (void)setFigDimensions:(id)a3;
- (void)setFigMetadata:(id)a3;
- (void)setFigTrackMatrix:(id)a3;
- (void)setFormatDescriptions:(id)a3;
- (void)setLanguageCode:(id)a3;
- (void)setLayer:(int64_t)a3;
- (void)setMarksOutputTrackAsEnabled:(BOOL)a3;
- (void)setMediaDataLocation:(id)a3;
- (void)setMediaTimeScale:(int)a3;
- (void)setPreferredChunkAlignment:(int64_t)a3;
- (void)setPreferredChunkDuration:(id *)a3;
- (void)setPreferredChunkSize:(int64_t)a3;
- (void)setProvisionalAlternateGroupID:(signed __int16)a3;
- (void)setSampleBufferCoalescingInterval:(id *)a3;
- (void)setSampleReferenceBaseURL:(id)a3;
- (void)setTrackVolume:(float)a3;
@end

@implementation AVFigAssetWriterTrack

+ (AVFigAssetWriterTrack)assetWriterTrackWithFigAssetWriter:(OpaqueFigAssetWriter *)a3 mediaType:(id)a4 mediaFileType:(id)a5 formatSpecification:(id)a6 sourcePixelBufferAttributes:(id)a7 multiPass:(BOOL)a8 attachedAdaptor:(id)a9 error:(id *)a10
{
  BOOL v10 = a8;
  if (([a4 isEqualToString:@"soun"] & 1) == 0
    && ([a4 isEqualToString:@"vide"] & 1) == 0
    && ([a4 isEqualToString:@"auxv"] & 1) == 0)
  {
    objc_opt_class();
    objc_opt_class();
  }
  v16 = (void *)[objc_alloc((Class)objc_opt_class()) initWithFigAssetWriter:a3 mediaType:a4 mediaFileType:a5 formatSpecification:a6 sourcePixelBufferAttributes:a7 multiPass:v10 error:a10];
  return (AVFigAssetWriterTrack *)v16;
}

- (AVFigAssetWriterTrack)init
{
  return [(AVFigAssetWriterTrack *)self initWithFigAssetWriter:0 mediaType:0 mediaFileType:0 formatSpecification:0 sourcePixelBufferAttributes:0 multiPass:0 error:0];
}

- (AVFigAssetWriterTrack)initWithFigAssetWriter:(OpaqueFigAssetWriter *)a3 mediaType:(id)a4 mediaFileType:(id)a5 formatSpecification:(id)a6 sourcePixelBufferAttributes:(id)a7 multiPass:(BOOL)a8 error:(id *)a9
{
  BOOL v9 = a8;
  v38.receiver = self;
  v38.super_class = (Class)AVFigAssetWriterTrack;
  v16 = [(AVFigAssetWriterTrack *)&v38 init];
  uint64_t v17 = objc_opt_class();
  AVRequireConcreteObject(v16, a2, v17);
  if (!a3)
  {
    v26 = v16;
    v32 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v33 = *MEMORY[0x1E4F1C3C8];
    v34 = "figAssetWriter != NULL";
    goto LABEL_12;
  }
  if (!a4)
  {
    v35 = v16;
    v32 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v33 = *MEMORY[0x1E4F1C3C8];
    v34 = "mediaType != nil";
    goto LABEL_12;
  }
  if (!a5)
  {
    v36 = v16;
    v32 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v33 = *MEMORY[0x1E4F1C3C8];
    v34 = "mediaFileType != nil";
LABEL_12:
    v37 = (void *)[v32 exceptionWithName:v33, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)v16, a2, @"invalid parameter not satisfying: %s", v27, v28, v29, v30, v31, (uint64_t)v34), 0 reason userInfo];
    objc_exception_throw(v37);
  }
  if (v16)
  {
    *((void *)v16 + 2) = CFRetain(a3);
    *((void *)v16 + 4) = objc_msgSend(a4, "copyWithZone:", objc_msgSend(v16, "zone"));
    *((void *)v16 + 5) = objc_msgSend(a5, "copyWithZone:", objc_msgSend(v16, "zone"));
    *((_DWORD *)v16 + 6) = [v16 _attachToFigAssetWriterUsingFormatSpecification:a6 sourcePixelBufferAttributes:a7 multiPass:v9 error:a9];
    *((void *)v16 + 1) = [[AVWeakReference alloc] initWithReferencedObject:v16];
    v18 = NSString;
    v19 = (objc_class *)objc_opt_class();
    v20 = (const char *)[(id)objc_msgSend(v18 stringWithFormat:@"<%@: %p> water level queue", NSStringFromClass(v19), v16), "UTF8String"];
    v21 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    *((void *)v16 + 6) = dispatch_queue_create(v20, v21);
    uint64_t v22 = MEMORY[0x1E4F1F9F8];
    *(_OWORD *)(v16 + 60) = *MEMORY[0x1E4F1F9F8];
    *(void *)(v16 + 76) = *(void *)(v22 + 16);
    id v23 = objc_alloc_init(MEMORY[0x1E4F28F08]);
    *((void *)v16 + 11) = v23;
    [v23 setName:@"com.apple.avfoundation.assetwriterinput"];
    id v24 = +[AVCMNotificationDispatcher notificationDispatcherForCMNotificationCenter:CMNotificationCenterGetDefaultLocalCenter()];
    CFRetain(*((CFTypeRef *)v16 + 1));
    [v24 addListenerWithWeakReference:*((void *)v16 + 1) callback:figAssetWriterTrackDidDropBelowLowWaterLevel name:*MEMORY[0x1E4F32548] object:*((void *)v16 + 2) flags:0];
    if (*((_DWORD *)v16 + 6))
    {
      [v16 _refreshAboveHighWaterLevel];
    }
    else
    {

      return 0;
    }
  }
  return (AVFigAssetWriterTrack *)v16;
}

- (void)dealloc
{
  if (self->_figAssetWriter)
  {
    objc_msgSend(+[AVCMNotificationDispatcher notificationDispatcherForCMNotificationCenter:](AVCMNotificationDispatcher, "notificationDispatcherForCMNotificationCenter:", CMNotificationCenterGetDefaultLocalCenter()), "removeListenerWithWeakReference:callback:name:object:", self->_weakReference, figAssetWriterTrackDidDropBelowLowWaterLevel, *MEMORY[0x1E4F32548], self->_figAssetWriter);
    CFRelease(self->_weakReference);
    CFRelease(self->_figAssetWriter);
  }
  aboveHighWaterLevelQueue = self->_aboveHighWaterLevelQueue;
  if (aboveHighWaterLevelQueue) {
    dispatch_release(aboveHighWaterLevelQueue);
  }

  v4.receiver = self;
  v4.super_class = (Class)AVFigAssetWriterTrack;
  [(AVFigAssetWriterTrack *)&v4 dealloc];
}

- (__CVPixelBufferPool)pixelBufferPool
{
  BOOL v10 = 0;
  v3 = [(AVFigAssetWriterTrack *)self figAssetWriter];
  uint64_t v4 = [(AVFigAssetWriterTrack *)self trackID];
  uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v5) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  v7 = *(void (**)(OpaqueFigAssetWriter *, uint64_t, void, void, __CVPixelBufferPool **))(v6 + 48);
  if (v7)
  {
    v7(v3, v4, *MEMORY[0x1E4F325A8], *MEMORY[0x1E4F1CF80], &v10);
    v8 = v10;
  }
  else
  {
    v8 = 0;
  }
  CVPixelBufferPoolRelease(v8);
  return v10;
}

- (void)_figAssetWriterDidDropBelowLowWaterLevelForTrackID:(int)a3
{
  if ([(AVFigAssetWriterTrack *)self trackID] == a3)
  {
    [(AVFigAssetWriterTrack *)self _refreshAboveHighWaterLevel];
  }
}

- (void)_refreshAboveHighWaterLevel
{
  v3 = [(AVFigAssetWriterTrack *)self figAssetWriter];
  uint64_t v4 = [(AVFigAssetWriterTrack *)self trackID];
  uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v5) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  v7 = *(uint64_t (**)(OpaqueFigAssetWriter *, uint64_t))(v6 + 96);
  if (!v7)
  {
    if (![(AVFigAssetWriterTrack *)self isAboveHighWaterLevel]) {
      return;
    }
    goto LABEL_8;
  }
  BOOL v8 = v7(v3, v4) == 0;
  if (((v8 ^ [(AVFigAssetWriterTrack *)self isAboveHighWaterLevel]) & 1) == 0)
  {
LABEL_8:
    [(AVFigAssetWriterTrack *)self willChangeValueForKey:@"aboveHighWaterLevel"];
    aboveHighWaterLevelQueue = self->_aboveHighWaterLevelQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __52__AVFigAssetWriterTrack__refreshAboveHighWaterLevel__block_invoke;
    block[3] = &unk_1E57B4738;
    block[4] = self;
    block[5] = v3;
    int v11 = v4;
    dispatch_sync(aboveHighWaterLevelQueue, block);
    [(AVFigAssetWriterTrack *)self didChangeValueForKey:@"aboveHighWaterLevel"];
  }
}

uint64_t __52__AVFigAssetWriterTrack__refreshAboveHighWaterLevel__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(unsigned int *)(a1 + 48);
  uint64_t VTable = CMBaseObjectGetVTable();
  uint64_t v7 = *(void *)(VTable + 16);
  uint64_t result = VTable + 16;
  uint64_t v6 = v7;
  if (v7) {
    uint64_t v8 = v6;
  }
  else {
    uint64_t v8 = 0;
  }
  BOOL v9 = *(uint64_t (**)(uint64_t, uint64_t))(v8 + 96);
  if (v9)
  {
    uint64_t result = v9(v2, v3);
    BOOL v10 = result != 0;
  }
  else
  {
    BOOL v10 = 0;
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 56) = v10;
  return result;
}

- (BOOL)encoderSupportsMultiPass
{
  CFBooleanRef BOOLean = 0;
  uint64_t v3 = [(AVFigAssetWriterTrack *)self figAssetWriter];
  uint64_t v4 = [(AVFigAssetWriterTrack *)self trackID];
  uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v5) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  uint64_t v7 = *(uint64_t (**)(OpaqueFigAssetWriter *, uint64_t, void, void, CFBooleanRef *))(v6 + 48);
  if (!v7) {
    return 0;
  }
  int v8 = v7(v3, v4, *MEMORY[0x1E4F32598], *MEMORY[0x1E4F1CF80], &BOOLean);
  CFBooleanRef v9 = BOOLean;
  if (v8)
  {
    BOOL v10 = 0;
    if (!BOOLean) {
      return v10;
    }
    goto LABEL_7;
  }
  BOOL v10 = CFBooleanGetValue(BOOLean) != 0;
  CFBooleanRef v9 = BOOLean;
  if (BOOLean) {
LABEL_7:
  }
    CFRelease(v9);
  return v10;
}

- (BOOL)isAboveHighWaterLevel
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  aboveHighWaterLevelQueue = self->_aboveHighWaterLevelQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __46__AVFigAssetWriterTrack_isAboveHighWaterLevel__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(aboveHighWaterLevelQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __46__AVFigAssetWriterTrack_isAboveHighWaterLevel__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 56);
  return result;
}

- (BOOL)beginPassReturningError:(id *)a3
{
  uint64_t v5 = [(AVFigAssetWriterTrack *)self figAssetWriter];
  uint64_t v6 = [(AVFigAssetWriterTrack *)self trackID];
  uint64_t v7 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v7) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = 0;
  }
  char v9 = *(uint64_t (**)(OpaqueFigAssetWriter *, uint64_t, void))(v8 + 136);
  if (v9)
  {
    signed int v10 = v9(v5, v6, 0);
    if (!a3) {
      return v10 == 0;
    }
  }
  else
  {
    signed int v10 = -12782;
    if (!a3) {
      return v10 == 0;
    }
  }
  if (v10) {
    *a3 = (id)AVLocalizedErrorWithUnderlyingOSStatus(v10, 0);
  }
  return v10 == 0;
}

- (BOOL)addSampleBuffer:(opaqueCMSampleBuffer *)a3 error:(id *)a4
{
  uint64_t v7 = [(AVFigAssetWriterTrack *)self figAssetWriter];
  uint64_t v8 = [(AVFigAssetWriterTrack *)self trackID];
  uint64_t v9 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v9) {
    uint64_t v10 = v9;
  }
  else {
    uint64_t v10 = 0;
  }
  int v11 = *(uint64_t (**)(OpaqueFigAssetWriter *, uint64_t, opaqueCMSampleBuffer *))(v10 + 80);
  if (v11)
  {
    uint64_t v12 = v11(v7, v8, a3);
    uint64_t v13 = v12;
    if ((int)v12 > -12143)
    {
      if (v12 == -12142)
      {
        v14 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v15 = *MEMORY[0x1E4F1C3B8];
        v16 = @"Must start a session (using -[AVAssetWriter startSessionAtSourceTime:) first";
        goto LABEL_16;
      }
      if (!v12)
      {
        id v17 = 0;
        goto LABEL_17;
      }
    }
    else
    {
      if (v12 == -12413)
      {
        v14 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v15 = *MEMORY[0x1E4F1C3C8];
        v16 = @"Input buffer must be in an uncompressed format when outputSettings is not nil";
        goto LABEL_16;
      }
      if (v12 == -12330)
      {
        v14 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v15 = *MEMORY[0x1E4F1C3C8];
        v16 = @"First input buffer must have an appropriate kCMSampleBufferAttachmentKey_TrimDurationAtStart since the codec has encoder delay";
LABEL_16:
        id v17 = (id)AVErrorForClientProgrammingError([v14 exceptionWithName:v15 reason:v16 userInfo:0]);
        LODWORD(v13) = -12413;
        goto LABEL_17;
      }
    }
  }
  else
  {
    uint64_t v13 = 4294954514;
  }
  id v17 = +[AVAssetWriter _errorForOSStatus:v13];
LABEL_17:
  [(AVFigAssetWriterTrack *)self _refreshAboveHighWaterLevel];
  if (a4 && v13) {
    *a4 = v17;
  }
  return v13 == 0;
}

- (BOOL)addPixelBuffer:(__CVBuffer *)a3 atPresentationTime:(id *)a4 error:(id *)a5
{
  uint64_t v9 = [(AVFigAssetWriterTrack *)self figAssetWriter];
  uint64_t v10 = [(AVFigAssetWriterTrack *)self trackID];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v25 = *a4;
  uint64_t v11 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v11) {
    uint64_t v12 = v11;
  }
  else {
    uint64_t v12 = 0;
  }
  uint64_t v13 = *(uint64_t (**)(OpaqueFigAssetWriter *, uint64_t, __CVBuffer *, $3CC8671D27C23BF42ADDB32F2B5E48AE *))(v12 + 88);
  if (v13)
  {
    $3CC8671D27C23BF42ADDB32F2B5E48AE v26 = v25;
    uint64_t v14 = v13(v9, v10, a3, &v26);
    if (v14 == -12142)
    {
      uint64_t v15 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v16 = *MEMORY[0x1E4F1C3B8];
      id v17 = (objc_class *)objc_opt_class();
      id v23 = (void *)[v15 exceptionWithName:v16, AVMethodExceptionReasonWithClassAndSelector(v17, sel_appendPixelBuffer_withPresentationTime_, @"Must start a session (using -[AVAssetWriter startSessionAtSourceTime:) before appending pixel buffers", v18, v19, v20, v21, v22, v25.var0), 0 reason userInfo];
      objc_exception_throw(v23);
    }
  }
  else
  {
    uint64_t v14 = 4294954514;
  }
  [(AVFigAssetWriterTrack *)self _refreshAboveHighWaterLevel];
  if (a5) {
    *a5 = +[AVAssetWriter _errorForOSStatus:v14];
  }
  return v14 == 0;
}

- (BOOL)addTaggedPixelBufferGroup:(OpaqueCMTaggedBufferGroup *)a3 atPresentationTime:(id *)a4 error:(id *)a5
{
  uint64_t v9 = [(AVFigAssetWriterTrack *)self figAssetWriter];
  uint64_t v10 = [(AVFigAssetWriterTrack *)self trackID];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v27 = *a4;
  uint64_t v11 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v11) {
    uint64_t v12 = v11;
  }
  else {
    uint64_t v12 = 0;
  }
  uint64_t v13 = *(uint64_t (**)(OpaqueFigAssetWriter *, uint64_t, OpaqueCMTaggedBufferGroup *, $3CC8671D27C23BF42ADDB32F2B5E48AE *))(v12 + 176);
  if (v13)
  {
    $3CC8671D27C23BF42ADDB32F2B5E48AE v28 = v27;
    uint64_t v14 = v13(v9, v10, a3, &v28);
    if (v14 == -15596)
    {
      uint64_t v16 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v17 = *MEMORY[0x1E4F1C3B8];
      uint64_t v18 = (objc_class *)objc_opt_class();
      id v24 = @"Must use IOSurface backed CVPixelBuffer for taggedPixelBufferGroup";
LABEL_13:
      $3CC8671D27C23BF42ADDB32F2B5E48AE v26 = objc_msgSend(v16, "exceptionWithName:reason:userInfo:", v17, AVMethodExceptionReasonWithClassAndSelector(v18, sel_appendTaggedPixelBufferGroup_withPresentationTime_, (uint64_t)v24, v19, v20, v21, v22, v23, v27.var0), 0);
      objc_exception_throw(v26);
    }
    uint64_t v15 = v14;
    if (v14 == -12142)
    {
      uint64_t v16 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v17 = *MEMORY[0x1E4F1C3B8];
      uint64_t v18 = (objc_class *)objc_opt_class();
      id v24 = @"Must start a session (using -[AVAssetWriter startSessionAtSourceTime:) before appending tagged buffer groups";
      goto LABEL_13;
    }
  }
  else
  {
    uint64_t v15 = 4294954514;
  }
  [(AVFigAssetWriterTrack *)self _refreshAboveHighWaterLevel];
  if (a5) {
    *a5 = +[AVAssetWriter _errorForOSStatus:v15];
  }
  return v15 == 0;
}

- (void)endPassWithCompletionHandler:(id)a3
{
  uint64_t v5 = [[AVAssetWriterInputFigAssetWriterEndPassOperation alloc] initWithFigAssetWriter:[(AVFigAssetWriterTrack *)self figAssetWriter] trackID:[(AVFigAssetWriterTrack *)self trackID]];
  [(AVAssetWriterInputFigAssetWriterEndPassOperation *)v5 setName:@"com.apple.avfoundation.assetwriterinput.endpass"];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __54__AVFigAssetWriterTrack_endPassWithCompletionHandler___block_invoke;
  v6[3] = &unk_1E57B4540;
  v6[4] = v5;
  v6[5] = a3;
  [(AVAssetWriterInputFigAssetWriterEndPassOperation *)v5 setCompletionBlock:v6];
  [(NSOperationQueue *)self->_operationQueue addOperation:v5];
}

uint64_t __54__AVFigAssetWriterTrack_endPassWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  BOOL v3 = [*(id *)(a1 + 32) status] == 2;
  uint64_t v4 = [*(id *)(a1 + 32) descriptionForNextPass];
  uint64_t v5 = [*(id *)(a1 + 32) error];
  uint64_t v6 = *(uint64_t (**)(uint64_t, BOOL, uint64_t, uint64_t))(v2 + 16);
  return v6(v2, v3, v4, v5);
}

- (BOOL)markEndOfDataReturningError:(id *)a3
{
  uint64_t v5 = [(AVFigAssetWriterTrack *)self figAssetWriter];
  uint64_t v6 = [(AVFigAssetWriterTrack *)self trackID];
  uint64_t v7 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v7) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = 0;
  }
  uint64_t v9 = *(uint64_t (**)(OpaqueFigAssetWriter *, uint64_t))(v8 + 104);
  if (v9)
  {
    uint64_t v10 = v9(v5, v6);
    if (!a3) {
      return v10 == 0;
    }
    goto LABEL_8;
  }
  uint64_t v10 = 4294954514;
  if (a3) {
LABEL_8:
  }
    *a3 = +[AVAssetWriter _errorForOSStatus:v10];
  return v10 == 0;
}

- (void)setFigMetadata:(id)a3
{
  uint64_t v5 = [(AVFigAssetWriterTrack *)self figAssetWriter];
  uint64_t v6 = [(AVFigAssetWriterTrack *)self trackID];
  uint64_t v7 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v7) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = 0;
  }
  uint64_t v9 = *(void (**)(OpaqueFigAssetWriter *, uint64_t, uint64_t, id))(v8 + 40);
  if (v9)
  {
    uint64_t v10 = *MEMORY[0x1E4F325A0];
    v9(v5, v6, v10, a3);
  }
}

- (void)setFigTrackMatrix:(id)a3
{
  uint64_t v5 = [(AVFigAssetWriterTrack *)self figAssetWriter];
  uint64_t v6 = [(AVFigAssetWriterTrack *)self trackID];
  uint64_t v7 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v7) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = 0;
  }
  uint64_t v9 = *(void (**)(OpaqueFigAssetWriter *, uint64_t, uint64_t, id))(v8 + 64);
  if (v9)
  {
    uint64_t v10 = *MEMORY[0x1E4F32F00];
    v9(v5, v6, v10, a3);
  }
}

- (void)setMediaTimeScale:(int)a3
{
  uint64_t v5 = [(AVFigAssetWriterTrack *)self figAssetWriter];
  uint64_t v6 = [(AVFigAssetWriterTrack *)self trackID];
  uint64_t v7 = [MEMORY[0x1E4F28ED0] numberWithInteger:a3];
  uint64_t v8 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v8) {
    uint64_t v9 = v8;
  }
  else {
    uint64_t v9 = 0;
  }
  uint64_t v10 = *(void (**)(OpaqueFigAssetWriter *, uint64_t, uint64_t, uint64_t))(v9 + 64);
  if (v10)
  {
    uint64_t v11 = *MEMORY[0x1E4F32E60];
    v10(v5, v6, v11, v7);
  }
}

- (void)setFigDimensions:(id)a3
{
  uint64_t v5 = [(AVFigAssetWriterTrack *)self figAssetWriter];
  uint64_t v6 = [(AVFigAssetWriterTrack *)self trackID];
  uint64_t v7 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v7) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = 0;
  }
  uint64_t v9 = *(void (**)(OpaqueFigAssetWriter *, uint64_t, uint64_t, id))(v8 + 64);
  if (v9)
  {
    uint64_t v10 = *MEMORY[0x1E4F32EF0];
    v9(v5, v6, v10, a3);
  }
}

- (void)setLanguageCode:(id)a3
{
  uint64_t v5 = [(AVFigAssetWriterTrack *)self figAssetWriter];
  uint64_t v6 = [(AVFigAssetWriterTrack *)self trackID];
  uint64_t v7 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v7) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = 0;
  }
  uint64_t v9 = *(void (**)(OpaqueFigAssetWriter *, uint64_t, uint64_t, id))(v8 + 64);
  if (v9)
  {
    uint64_t v10 = *MEMORY[0x1E4F32E48];
    v9(v5, v6, v10, a3);
  }
}

- (void)setExtendedLanguageTag:(id)a3
{
  uint64_t v5 = [(AVFigAssetWriterTrack *)self figAssetWriter];
  uint64_t v6 = [(AVFigAssetWriterTrack *)self trackID];
  uint64_t v7 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v7) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = 0;
  }
  uint64_t v9 = *(void (**)(OpaqueFigAssetWriter *, uint64_t, uint64_t, id))(v8 + 64);
  if (v9)
  {
    uint64_t v10 = *MEMORY[0x1E4F32DF8];
    v9(v5, v6, v10, a3);
  }
}

- (void)setMarksOutputTrackAsEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(AVFigAssetWriterTrack *)self figAssetWriter];
  uint64_t v6 = [(AVFigAssetWriterTrack *)self trackID];
  if (v3) {
    uint64_t v7 = (uint64_t *)MEMORY[0x1E4F1CFD0];
  }
  else {
    uint64_t v7 = (uint64_t *)MEMORY[0x1E4F1CFC8];
  }
  uint64_t v8 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v8) {
    uint64_t v9 = v8;
  }
  else {
    uint64_t v9 = 0;
  }
  uint64_t v10 = *(void (**)(OpaqueFigAssetWriter *, uint64_t, uint64_t, uint64_t))(v9 + 64);
  if (v10)
  {
    uint64_t v11 = *MEMORY[0x1E4F32DD8];
    uint64_t v12 = *v7;
    v10(v5, v6, v11, v12);
  }
}

- (void)setTrackVolume:(float)a3
{
  float valuePtr = a3;
  CFNumberRef v4 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], kCFNumberFloat32Type, &valuePtr);
  if (v4)
  {
    CFNumberRef v5 = v4;
    uint64_t v6 = [(AVFigAssetWriterTrack *)self figAssetWriter];
    uint64_t v7 = [(AVFigAssetWriterTrack *)self trackID];
    uint64_t v8 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v8) {
      uint64_t v9 = v8;
    }
    else {
      uint64_t v9 = 0;
    }
    uint64_t v10 = *(void (**)(OpaqueFigAssetWriter *, uint64_t, void, CFNumberRef))(v9 + 64);
    if (v10) {
      v10(v6, v7, *MEMORY[0x1E4F32F10], v5);
    }
    CFRelease(v5);
  }
}

- (void)setLayer:(int64_t)a3
{
  uint64_t v4 = [MEMORY[0x1E4F28ED0] numberWithInteger:a3];
  CFNumberRef v5 = [(AVFigAssetWriterTrack *)self figAssetWriter];
  uint64_t v6 = [(AVFigAssetWriterTrack *)self trackID];
  uint64_t v7 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v7) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = 0;
  }
  uint64_t v9 = *(void (**)(OpaqueFigAssetWriter *, uint64_t, uint64_t, uint64_t))(v8 + 64);
  if (v9)
  {
    uint64_t v10 = *MEMORY[0x1E4F34890];
    v9(v5, v6, v10, v4);
  }
}

- (void)setAlternateGroupID:(signed __int16)a3
{
  int v3 = a3;
  CFNumberRef v5 = [(AVFigAssetWriterTrack *)self figAssetWriter];
  uint64_t v6 = [(AVFigAssetWriterTrack *)self trackID];
  uint64_t v7 = [MEMORY[0x1E4F28ED0] numberWithInteger:v3];
  uint64_t v8 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v8) {
    uint64_t v9 = v8;
  }
  else {
    uint64_t v9 = 0;
  }
  uint64_t v10 = *(void (**)(OpaqueFigAssetWriter *, uint64_t, uint64_t, uint64_t))(v9 + 64);
  if (v10)
  {
    uint64_t v11 = *MEMORY[0x1E4F32DB8];
    v10(v5, v6, v11, v7);
  }
}

- (void)setProvisionalAlternateGroupID:(signed __int16)a3
{
  int v3 = a3;
  CFNumberRef v5 = [(AVFigAssetWriterTrack *)self figAssetWriter];
  uint64_t v6 = [(AVFigAssetWriterTrack *)self trackID];
  uint64_t v7 = [MEMORY[0x1E4F28ED0] numberWithInteger:v3];
  uint64_t v8 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v8) {
    uint64_t v9 = v8;
  }
  else {
    uint64_t v9 = 0;
  }
  uint64_t v10 = *(void (**)(OpaqueFigAssetWriter *, uint64_t, uint64_t, uint64_t))(v9 + 64);
  if (v10)
  {
    uint64_t v11 = *MEMORY[0x1E4F32EC0];
    v10(v5, v6, v11, v7);
  }
}

- (void)setExcludeFromAutoSelection:(BOOL)a3
{
  BOOL v3 = a3;
  CFNumberRef v5 = [(AVFigAssetWriterTrack *)self figAssetWriter];
  uint64_t v6 = [(AVFigAssetWriterTrack *)self trackID];
  if (v3) {
    uint64_t v7 = (uint64_t *)MEMORY[0x1E4F1CFD0];
  }
  else {
    uint64_t v7 = (uint64_t *)MEMORY[0x1E4F1CFC8];
  }
  uint64_t v8 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v8) {
    uint64_t v9 = v8;
  }
  else {
    uint64_t v9 = 0;
  }
  uint64_t v10 = *(void (**)(OpaqueFigAssetWriter *, uint64_t, uint64_t, uint64_t))(v9 + 64);
  if (v10)
  {
    uint64_t v11 = *MEMORY[0x1E4F32DE8];
    uint64_t v12 = *v7;
    v10(v5, v6, v11, v12);
  }
}

- (void)setPreferredChunkDuration:(id *)a3
{
  CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CMTime v11 = *(CMTime *)a3;
  CFDictionaryRef v5 = CMTimeCopyAsDictionary(&v11, v4);
  uint64_t v6 = [(AVFigAssetWriterTrack *)self figAssetWriter];
  uint64_t v7 = [(AVFigAssetWriterTrack *)self trackID];
  uint64_t v8 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v8) {
    uint64_t v9 = v8;
  }
  else {
    uint64_t v9 = 0;
  }
  uint64_t v10 = *(void (**)(OpaqueFigAssetWriter *, uint64_t, void, CFDictionaryRef))(v9 + 64);
  if (v10) {
    v10(v6, v7, *MEMORY[0x1E4F32E98], v5);
  }
  if (v5) {
    CFRelease(v5);
  }
}

- (void)setPreferredChunkAlignment:(int64_t)a3
{
  CFDictionaryRef v5 = [(AVFigAssetWriterTrack *)self figAssetWriter];
  uint64_t v6 = [(AVFigAssetWriterTrack *)self trackID];
  uint64_t v7 = [MEMORY[0x1E4F28ED0] numberWithInteger:a3];
  uint64_t v8 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v8) {
    uint64_t v9 = v8;
  }
  else {
    uint64_t v9 = 0;
  }
  uint64_t v10 = *(void (**)(OpaqueFigAssetWriter *, uint64_t, uint64_t, uint64_t))(v9 + 64);
  if (v10)
  {
    uint64_t v11 = *MEMORY[0x1E4F32E88];
    v10(v5, v6, v11, v7);
  }
}

- (void)setPreferredChunkSize:(int64_t)a3
{
  CFDictionaryRef v5 = [(AVFigAssetWriterTrack *)self figAssetWriter];
  uint64_t v6 = [(AVFigAssetWriterTrack *)self trackID];
  uint64_t v7 = [MEMORY[0x1E4F28ED0] numberWithInteger:a3];
  uint64_t v8 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v8) {
    uint64_t v9 = v8;
  }
  else {
    uint64_t v9 = 0;
  }
  uint64_t v10 = *(void (**)(OpaqueFigAssetWriter *, uint64_t, uint64_t, uint64_t))(v9 + 64);
  if (v10)
  {
    uint64_t v11 = *MEMORY[0x1E4F32EB0];
    v10(v5, v6, v11, v7);
  }
}

- (void)setMediaDataLocation:(id)a3
{
  v27[2] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = *MEMORY[0x1E4F1CFD0];
  if ([a3 isEqualToString:@"AVAssetWriterInputMediaDataLocationBeforeMainMediaDataNotInterleaved"])
  {
    uint64_t v6 = *MEMORY[0x1E4F34480];
    v26[0] = *MEMORY[0x1E4F34488];
    v26[1] = v6;
    v27[0] = &unk_1EE5E1848;
    v27[1] = &unk_1EE5E1860;
    uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:2];
    uint64_t v8 = 1;
  }
  else
  {
    int v9 = [a3 isEqualToString:@"AVAssetWriterInputMediaDataLocationSparselyInterleavedWithMainMediaData"];
    uint64_t v8 = 0;
    uint64_t v7 = 0;
    if (v9) {
      uint64_t v5 = *MEMORY[0x1E4F1CFC8];
    }
  }
  uint64_t v10 = [(AVFigAssetWriterTrack *)self figAssetWriter];
  uint64_t v11 = [(AVFigAssetWriterTrack *)self trackID];
  uint64_t v12 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v12) {
    uint64_t v13 = v12;
  }
  else {
    uint64_t v13 = 0;
  }
  uint64_t v14 = *(void (**)(OpaqueFigAssetWriter *, uint64_t, void, uint64_t))(v13 + 64);
  if (v14) {
    v14(v10, v11, *MEMORY[0x1E4F32EC8], v7);
  }
  uint64_t v15 = [(AVFigAssetWriterTrack *)self figAssetWriter];
  uint64_t v16 = [(AVFigAssetWriterTrack *)self trackID];
  uint64_t v17 = [MEMORY[0x1E4F28ED0] numberWithInt:v8];
  uint64_t v18 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v18) {
    uint64_t v19 = v18;
  }
  else {
    uint64_t v19 = 0;
  }
  uint64_t v20 = *(void (**)(OpaqueFigAssetWriter *, uint64_t, void, uint64_t))(v19 + 64);
  if (v20) {
    v20(v15, v16, *MEMORY[0x1E4F32E58], v17);
  }
  uint64_t v21 = [(AVFigAssetWriterTrack *)self figAssetWriter];
  uint64_t v22 = [(AVFigAssetWriterTrack *)self trackID];
  uint64_t v23 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v23) {
    uint64_t v24 = v23;
  }
  else {
    uint64_t v24 = 0;
  }
  $3CC8671D27C23BF42ADDB32F2B5E48AE v25 = *(void (**)(OpaqueFigAssetWriter *, uint64_t, void, uint64_t))(v24 + 64);
  if (v25) {
    v25(v21, v22, *MEMORY[0x1E4F32E20], v5);
  }
}

- (void)setSampleReferenceBaseURL:(id)a3
{
  uint64_t v5 = [(AVFigAssetWriterTrack *)self figAssetWriter];
  uint64_t v6 = [(AVFigAssetWriterTrack *)self trackID];
  uint64_t v7 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v7) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = 0;
  }
  int v9 = *(void (**)(OpaqueFigAssetWriter *, uint64_t, uint64_t, id))(v8 + 64);
  if (v9)
  {
    uint64_t v10 = *MEMORY[0x1E4F32EE0];
    v9(v5, v6, v10, a3);
  }
}

- (void)setFormatDescriptions:(id)a3
{
  uint64_t v5 = [(AVFigAssetWriterTrack *)self figAssetWriter];
  uint64_t v6 = [(AVFigAssetWriterTrack *)self trackID];
  uint64_t v7 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v7) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = 0;
  }
  int v9 = *(void (**)(OpaqueFigAssetWriter *, uint64_t, uint64_t, id))(v8 + 64);
  if (v9)
  {
    uint64_t v10 = *MEMORY[0x1E4F32E00];
    v9(v5, v6, v10, a3);
  }
}

- (int)_attachToFigAssetWriterUsingFormatSpecification:(id)a3 sourcePixelBufferAttributes:(id)a4 multiPass:(BOOL)a5 error:(id *)a6
{
  int v15 = 0;
  uint64_t v8 = [(AVFigAssetWriterTrack *)self figAssetWriter];
  uint64_t v9 = CMMediaTypeFromAVMediaType([(AVFigAssetWriterTrack *)self mediaType]);
  uint64_t v10 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v10) {
    uint64_t v11 = v10;
  }
  else {
    uint64_t v11 = 0;
  }
  uint64_t v12 = *(uint64_t (**)(OpaqueFigAssetWriter *, uint64_t, int *))(v11 + 8);
  if (v12)
  {
    int v13 = v12(v8, v9, &v15);
    if (!a6) {
      return v15;
    }
  }
  else
  {
    int v13 = -12782;
    if (!a6) {
      return v15;
    }
  }
  if (v13) {
    *a6 = +[AVAssetWriter _errorForOSStatus:](AVAssetWriter, "_errorForOSStatus:");
  }
  return v15;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)sampleBufferCoalescingInterval
{
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[2].var2;
  retstr->var3 = *(int64_t *)((char *)&self[3].var0 + 4);
  return self;
}

- (void)setSampleBufferCoalescingInterval:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  *(void *)&self->_sampleBufferCoalescingInterval.flags = a3->var3;
  *(_OWORD *)(&self->_aboveHighWaterLevel + 4) = v3;
}

- (OpaqueFigAssetWriter)figAssetWriter
{
  return self->_figAssetWriter;
}

- (int)trackID
{
  return self->_trackID;
}

- (NSString)mediaType
{
  return self->_mediaType;
}

- (AVMediaFileType)mediaFileType
{
  return self->_mediaFileType;
}

@end