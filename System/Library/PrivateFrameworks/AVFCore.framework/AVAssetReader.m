@interface AVAssetReader
+ (AVAssetReader)assetReaderWithAsset:(AVAsset *)asset error:(NSError *)outError;
+ (id)_errorForOSStatus:(int)a3;
+ (void)initialize;
- (AVAsset)asset;
- (AVAssetReader)init;
- (AVAssetReader)initWithAsset:(AVAsset *)asset error:(NSError *)outError;
- (AVAssetReader)initWithAsset:(id)a3 options:(id)a4 error:(id *)a5;
- (AVAssetReaderStatus)status;
- (BOOL)_canAddOutput:(id)a3 exceptionReason:(id *)a4;
- (BOOL)_readSingleSample;
- (BOOL)canAddOutput:(AVAssetReaderOutput *)output;
- (BOOL)isDefunct;
- (BOOL)preparesMediaDataForRealTimeConsumption;
- (BOOL)startReading;
- (CMTimeRange)timeRange;
- (NSArray)outputs;
- (NSError)error;
- (NSString)description;
- (OpaqueFigAssetReader)_figAssetReader;
- (id)_commonInitWithAsset:(id)a3 options:(id)a4 error:(id *)a5;
- (void)_failWithError:(id)a3;
- (void)_handleServerDiedNotification;
- (void)_outputDidFinish:(id)a3;
- (void)_setReadSingleSample:(BOOL)a3;
- (void)_tearDownFigAssetReader;
- (void)_transitionToStatus:(int64_t)a3 failureError:(id)a4;
- (void)addOutput:(AVAssetReaderOutput *)output;
- (void)cancelReading;
- (void)dealloc;
- (void)setPreparesMediaDataForRealTimeConsumption:(BOOL)a3;
- (void)setTimeRange:(CMTimeRange *)timeRange;
@end

@implementation AVAssetReader

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    MEMORY[0x1F40DED88]();
  }
}

+ (AVAssetReader)assetReaderWithAsset:(AVAsset *)asset error:(NSError *)outError
{
  v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithAsset:asset error:outError];
  return (AVAssetReader *)v4;
}

- (AVAssetReader)init
{
  return [(AVAssetReader *)self initWithAsset:0 error:0];
}

- (AVAssetReader)initWithAsset:(AVAsset *)asset error:(NSError *)outError
{
  v7.receiver = self;
  v7.super_class = (Class)AVAssetReader;
  result = [(AVAssetReader *)&v7 init];
  if (result) {
    return (AVAssetReader *)[(AVAssetReader *)result _commonInitWithAsset:asset options:0 error:outError];
  }
  return result;
}

- (AVAssetReader)initWithAsset:(id)a3 options:(id)a4 error:(id *)a5
{
  v9.receiver = self;
  v9.super_class = (Class)AVAssetReader;
  result = [(AVAssetReader *)&v9 init];
  if (result) {
    return (AVAssetReader *)[(AVAssetReader *)result _commonInitWithAsset:a3 options:a4 error:a5];
  }
  return result;
}

- (id)_commonInitWithAsset:(id)a3 options:(id)a4 error:(id *)a5
{
  v5 = self;
  v41[1] = *MEMORY[0x1E4F143B8];
  v39 = 0;
  if (!a3)
  {
    v28 = self;
    v34 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)v5, a2, @"invalid parameter not satisfying: %s", v29, v30, v31, v32, v33, (uint64_t)"asset != nil"), 0 reason userInfo];
    objc_exception_throw(v34);
  }
  if (!self)
  {
LABEL_20:
    v19 = 0;
    if (!a5) {
      goto LABEL_28;
    }
LABEL_27:
    *a5 = v39;
    goto LABEL_28;
  }
  objc_super v9 = objc_alloc_init(AVAssetReaderInternal);
  v5->_priv = v9;
  if (!v9)
  {
LABEL_19:

    v5 = 0;
    goto LABEL_20;
  }
  CFRetain(v9);
  v5->_priv->weakReference = [[AVWeakReference alloc] initWithReferencedObject:v5];
  v5->_priv->outputFinishedCallbackInvokers = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v5->_priv->asset = (AVAsset *)a3;
  v5->_priv->outputs = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  priv = v5->_priv;
  CMTime start = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
  CMTime duration = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA10];
  CMTimeRangeMake(&v38, &start, &duration);
  long long v12 = *(_OWORD *)&v38.start.epoch;
  long long v11 = *(_OWORD *)&v38.duration.timescale;
  *(_OWORD *)&priv->timeRange.start.value = *(_OWORD *)&v38.start.value;
  *(_OWORD *)&priv->timeRange.start.epoch = v12;
  *(_OWORD *)&priv->timeRange.duration.timescale = v11;
  v5->_priv->status = 0;
  v35.receiver = v5;
  v35.super_class = (Class)AVAssetReader;
  v13 = (const char *)[(id)objc_msgSend(NSString stringWithFormat:@"%@ status read/write queue", -[AVAssetReader description](&v35, sel_description)), "UTF8String"];
  v5->_priv->statusReadWriteQueue = (OS_dispatch_queue *)av_readwrite_dispatch_queue_create(v13);
  v5->_priv->realTime = 0;
  uint64_t v14 = [a3 _absoluteURL];
  BOOL v15 = [(AVAsset *)v5->_priv->asset _requiresInProcessOperation];
  uint64_t v16 = *MEMORY[0x1E4F1CFD0];
  if (v15) {
    uint64_t v17 = *MEMORY[0x1E4F1CFD0];
  }
  else {
    uint64_t v17 = *MEMORY[0x1E4F1CFC8];
  }
  v18 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithObject:v17 forKey:*MEMORY[0x1E4F32340]];
  if (([a3 _hasResourceLoaderDelegate] & 1) != 0
    || objc_msgSend((id)objc_msgSend(a4, "valueForKey:", @"AssetReaderOption_PermitNonLocalURL"), "BOOLValue"))
  {
    [v18 setObject:v16 forKey:*MEMORY[0x1E4F32330]];
    goto LABEL_10;
  }
  if (v14 && !FigCFURLIsLocalResource())
  {
    uint64_t v40 = *MEMORY[0x1E4F1D138];
    v22 = NSString;
    v23 = (objc_class *)objc_opt_class();
    v41[0] = [v22 stringWithFormat:@"Cannot initialize an instance of %@ with an asset at non-local URL '%@'", NSStringFromClass(v23), v14];
    v39 = (void *)AVLocalizedError(@"AVFoundationErrorDomain", -11838, (void *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v41 forKeys:&v40 count:1]);
    goto LABEL_19;
  }
LABEL_10:
  v19 = (const void *)[a3 _copyFormatReader];
  if ([a3 statusOfValueForKey:@"formatReader" error:&v39] == 3 || !v19)
  {
    if (v39) {
      goto LABEL_26;
    }
    id v21 = (id)AVLocalizedError(@"AVFoundationErrorDomain", -11838, 0);
LABEL_25:
    v39 = v21;
LABEL_26:

    v5 = 0;
    if (!a5) {
      goto LABEL_28;
    }
    goto LABEL_27;
  }
  CFRunLoopGetCurrent();
  if (v15) {
    uint64_t v20 = FigAssetReaderCreateWithURLAndFormatReader();
  }
  else {
    uint64_t v20 = FigAssetReaderRemoteCreateWithURLAndFormatReader();
  }
  if (v20 || (v25 = v5->_priv, !v25->figAssetReader))
  {
    id v21 = +[AVAssetReader _errorForOSStatus:v20];
    goto LABEL_25;
  }
  CFRetain(v25->weakReference);
  id v26 = +[AVCMNotificationDispatcher notificationDispatcherForCMNotificationCenter:CMNotificationCenterGetDefaultLocalCenter()];
  [v26 addListenerWithWeakReference:v5->_priv->weakReference callback:AVAssetReaderHandleServerDiedNotification name:*MEMORY[0x1E4F323B0] object:v5->_priv->figAssetReader flags:0];
  [v26 addListenerWithWeakReference:v5->_priv->weakReference callback:AVAssetReaderHandleServerDiedNotification name:*MEMORY[0x1E4F21770] object:v5->_priv->figAssetReader flags:0];
  if (a5) {
    goto LABEL_27;
  }
LABEL_28:
  if (v19) {
    CFRelease(v19);
  }
  return v5;
}

- (void)dealloc
{
  priv = self->_priv;
  if (priv)
  {

    [(AVAssetReader *)self _tearDownFigAssetReader];
    v4 = self->_priv;
    statusReadWriteQueue = v4->statusReadWriteQueue;
    if (statusReadWriteQueue)
    {
      dispatch_release(statusReadWriteQueue);
      v4 = self->_priv;
    }

    CFRelease(self->_priv);
  }
  v6.receiver = self;
  v6.super_class = (Class)AVAssetReader;
  [(AVAssetReader *)&v6 dealloc];
}

- (void)_tearDownFigAssetReader
{
  if (self->_priv->figAssetReader)
  {
    id v3 = +[AVCMNotificationDispatcher notificationDispatcherForCMNotificationCenter:CMNotificationCenterGetDefaultLocalCenter()];
    [v3 removeListenerWithWeakReference:self->_priv->weakReference callback:AVAssetReaderHandleServerDiedNotification name:*MEMORY[0x1E4F323B0] object:self->_priv->figAssetReader];
    [v3 removeListenerWithWeakReference:self->_priv->weakReference callback:AVAssetReaderHandleServerDiedNotification name:*MEMORY[0x1E4F21770] object:self->_priv->figAssetReader];
    uint64_t FigBaseObject = FigAssetReaderGetFigBaseObject();
    if (FigBaseObject)
    {
      uint64_t v5 = FigBaseObject;
      uint64_t v6 = *(void *)(CMBaseObjectGetVTable() + 8);
      if (v6) {
        uint64_t v7 = v6;
      }
      else {
        uint64_t v7 = 0;
      }
      v8 = *(void (**)(uint64_t))(v7 + 24);
      if (v8) {
        v8(v5);
      }
    }
    CFRelease(self->_priv->weakReference);
    CFRelease(self->_priv->figAssetReader);
    self->_priv->figAssetReader = 0;
  }
}

- (NSString)description
{
  id v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  return (NSString *)[v3 stringWithFormat:@"<%@: %p, asset = %@, outputs = %@>", NSStringFromClass(v4), self, -[AVAssetReader asset](self, "asset"), -[AVAssetReader outputs](self, "outputs")];
}

- (AVAsset)asset
{
  return self->_priv->asset;
}

- (AVAssetReaderStatus)status
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  statusReadWriteQueue = self->_priv->statusReadWriteQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __23__AVAssetReader_status__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(statusReadWriteQueue, v5);
  AVAssetReaderStatus v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __23__AVAssetReader_status__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(*(void *)(result + 32)
                                                                                          + 8)
                                                                              + 104);
  return result;
}

+ (id)_errorForOSStatus:(int)a3
{
  if (!a3) {
    return 0;
  }
  if (a3 == -12785) {
    return (id)AVLocalizedError(@"AVFoundationErrorDomain", -11847, 0);
  }
  return (id)AVLocalizedErrorWithUnderlyingOSStatus(a3, 0);
}

- (void)_transitionToStatus:(int64_t)a3 failureError:(id)a4
{
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v16 = 0;
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x2020000000;
  uint64_t v12 = 0;
  [(AVAssetReader *)self willChangeValueForKey:@"status"];
  [(AVAssetReader *)self willChangeValueForKey:@"error"];
  statusReadWriteQueue = self->_priv->statusReadWriteQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__AVAssetReader__transitionToStatus_failureError___block_invoke;
  block[3] = &unk_1E57B43F0;
  block[4] = self;
  block[5] = a4;
  block[6] = &v13;
  block[7] = &v9;
  block[8] = a3;
  av_readwrite_dispatch_queue_write(statusReadWriteQueue, block);
  [(AVAssetReader *)self didChangeValueForKey:@"error"];
  [(AVAssetReader *)self didChangeValueForKey:@"status"];
  if (v14[3] <= 1 && v10[3] >= 2) {
    [(AVAssetReader *)self _tearDownFigAssetReader];
  }
  _Block_object_dispose(&v9, 8);
  _Block_object_dispose(&v13, 8);
}

uint64_t __50__AVAssetReader__transitionToStatus_failureError___block_invoke(uint64_t result)
{
  uint64_t v1 = result;
  *(void *)(*(void *)(*(void *)(result + 48) + 8) + 24) = *(void *)(*(void *)(*(void *)(result + 32)
                                                                                          + 8)
                                                                              + 104);
  uint64_t v2 = *(void *)(result + 64);
  uint64_t v3 = *(void *)(*(void *)(*(void *)(result + 48) + 8) + 24);
  if (v2 != v3 && v3 <= 1)
  {
    uint64_t v5 = *(void *)(*(void *)(result + 32) + 8);
    uint64_t v6 = *(void *)(v5 + 120);
    if (v2 != 3 || v3)
    {
      if (v6)
      {
        *(void *)(v5 + 104) = 3;
        result = [*(id *)(*(void *)(*(void *)(result + 32) + 8) + 120) copy];
      }
      else
      {
        *(void *)(v5 + 104) = v2;
        result = *(void *)(result + 32);
        if (*(void *)(*(void *)(result + 8) + 112)) {
          goto LABEL_14;
        }
        result = objc_msgSend(*(id *)(v1 + 40), "copyWithZone:", objc_msgSend((id)result, "zone"));
      }
      uint64_t v7 = 112;
    }
    else
    {
      if (v6) {
        goto LABEL_14;
      }
      result = [*(id *)(result + 40) copy];
      uint64_t v7 = 120;
    }
    *(void *)(*(void *)(*(void *)(v1 + 32) + 8) + v7) = result;
  }
LABEL_14:
  *(void *)(*(void *)(*(void *)(v1 + 56) + 8) + 24) = *(void *)(*(void *)(*(void *)(v1 + 32) + 8)
                                                                          + 104);
  return result;
}

- (NSError)error
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000;
  uint64_t v9 = __Block_byref_object_copy__9;
  v10 = __Block_byref_object_dispose__9;
  uint64_t v11 = 0;
  statusReadWriteQueue = self->_priv->statusReadWriteQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __22__AVAssetReader_error__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(statusReadWriteQueue, v5);
  uint64_t v3 = (NSError *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __22__AVAssetReader_error__block_invoke(uint64_t a1)
{
  id result = *(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 112);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)_failWithError:(id)a3
{
}

- (CMTimeRange)timeRange
{
  uint64_t v3 = *(_OWORD **)&self->start.timescale;
  long long v4 = v3[3];
  *(_OWORD *)&retstr->start.value = v3[2];
  *(_OWORD *)&retstr->start.epoch = v4;
  *(_OWORD *)&retstr->duration.timescale = v3[4];
  return self;
}

- (void)setTimeRange:(CMTimeRange *)timeRange
{
  if ([(AVAssetReader *)self status] >= AVAssetReaderStatusReading)
  {
    uint64_t v14 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"cannot be called after reading has started", v6, v7, v8, v9, v10, v15), 0 reason userInfo];
    objc_exception_throw(v14);
  }
  priv = self->_priv;
  long long v12 = *(_OWORD *)&timeRange->start.value;
  long long v13 = *(_OWORD *)&timeRange->duration.timescale;
  *(_OWORD *)&priv->timeRange.start.epoch = *(_OWORD *)&timeRange->start.epoch;
  *(_OWORD *)&priv->timeRange.duration.timescale = v13;
  *(_OWORD *)&priv->timeRange.start.value = v12;
}

- (BOOL)_readSingleSample
{
  return self->_priv->readSingleSample;
}

- (void)_setReadSingleSample:(BOOL)a3
{
  if ([(AVAssetReader *)self status] >= AVAssetReaderStatusReading)
  {
    uint64_t v11 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"cannot be called after reading has started", v6, v7, v8, v9, v10, v12), 0 reason userInfo];
    objc_exception_throw(v11);
  }
  self->_priv->readSingleSample = a3;
}

- (NSArray)outputs
{
  return (NSArray *)[MEMORY[0x1E4F1C978] arrayWithArray:self->_priv->outputs];
}

- (BOOL)_canAddOutput:(id)a3 exceptionReason:(id *)a4
{
  BOOL v7 = [(NSArray *)[(AVAssetReader *)self outputs] containsObject:a3];
  AVAssetReaderStatus v8 = [(AVAssetReader *)self status];
  BOOL v9 = -[AVAsset isEqual:](-[AVAssetReader asset](self, "asset"), "isEqual:", [a3 _asset]);
  if (a4)
  {
    uint64_t v10 = @"cannot add an output that has already been added to the receiver";
    if (!v7) {
      uint64_t v10 = 0;
    }
    if (v8 >= AVAssetReaderStatusReading) {
      uint64_t v10 = @"cannot add an output after reading has started";
    }
    if (!v9) {
      uint64_t v10 = @"cannot add an output that has already been added to another AVAssetReader";
    }
    *a4 = v10;
  }
  BOOL v11 = v8 < AVAssetReaderStatusReading && v9;
  return v11 && !v7;
}

- (BOOL)canAddOutput:(AVAssetReaderOutput *)output
{
  if (!output)
  {
    uint64_t v10 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"invalid parameter not satisfying: %s", v3, v4, v5, v6, v7, (uint64_t)"output != nil"), 0 reason userInfo];
    objc_exception_throw(v10);
  }
  return -[AVAssetReader _canAddOutput:exceptionReason:](self, "_canAddOutput:exceptionReason:");
}

- (void)addOutput:(AVAssetReaderOutput *)output
{
  if (!output)
  {
    uint64_t v17 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v18 = *MEMORY[0x1E4F1C3C8];
    uint64_t v19 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"invalid parameter not satisfying: %s", v3, v4, v5, v6, v7, (uint64_t)"output != nil");
    goto LABEL_6;
  }
  uint64_t v22 = 0;
  if (![(AVAssetReader *)self _canAddOutput:output exceptionReason:&v22])
  {
    uint64_t v17 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v18 = *MEMORY[0x1E4F1C3B8];
    uint64_t v19 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, v22, v11, v12, v13, v14, v15, v20);
LABEL_6:
    objc_exception_throw((id)[v17 exceptionWithName:v18 reason:v19 userInfo:0]);
  }
  [(AVAssetReaderOutput *)output _attachToWeakReferenceToAssetReader:self->_priv->weakReference];
  [(NSMutableArray *)self->_priv->outputs addObject:output];
  id v16 = +[AVKVODispatcher sharedKVODispatcher];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __27__AVAssetReader_addOutput___block_invoke;
  v21[3] = &unk_1E57B4418;
  v21[4] = output;
  -[NSMutableSet addObject:](self->_priv->outputFinishedCallbackInvokers, "addObject:", objc_msgSend(v16, "startObservingValueAtKeyPath:ofObject:options:usingBlock:", @"finished", output, 0, +[AVObservationBlockFactory observationBlockForWeakObserver:passedToBlock:](AVObservationBlockFactory, "observationBlockForWeakObserver:passedToBlock:", self, v21)));
}

uint64_t __27__AVAssetReader_addOutput___block_invoke(uint64_t a1, void *a2)
{
  return [a2 _outputDidFinish:*(void *)(a1 + 32)];
}

- (void)_outputDidFinish:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v4 = [(AVAssetReader *)self outputs];
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (!v5) {
    goto LABEL_9;
  }
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)v11;
  int v8 = 1;
  do
  {
    for (uint64_t i = 0; i != v6; ++i)
    {
      if (*(void *)v11 != v7) {
        objc_enumerationMutation(v4);
      }
      v8 &= [*(id *)(*((void *)&v10 + 1) + 8 * i) _isFinished];
    }
    uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  }
  while (v6);
  if (v8) {
LABEL_9:
  }
    [(AVAssetReader *)self _transitionToStatus:2 failureError:0];
}

- (BOOL)startReading
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v35 = 0;
  if ([(AVAssetReader *)self status] >= AVAssetReaderStatusReading)
  {
    v25 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"cannot be called again after reading has already started", v4, v5, v6, v7, v8, v26), 0 reason userInfo];
    objc_exception_throw(v25);
  }
  memset(&v34, 0, sizeof(v34));
  if (self) {
    [(AVAssetReader *)self timeRange];
  }
  BOOL v9 = [(AVAssetReader *)self outputs];
  if (![(NSArray *)v9 count])
  {
    [(AVAssetReader *)self _transitionToStatus:2 failureError:0];
    return 1;
  }
  [(AVAssetReader *)self _transitionToStatus:1 failureError:0];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v30 objects:v37 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v31;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v31 != v12) {
          objc_enumerationMutation(v9);
        }
        if (![*(id *)(*((void *)&v30 + 1) + 8 * i) _prepareForReadingReturningError:&v35])
        {
          id v18 = v35;
          goto LABEL_28;
        }
      }
      uint64_t v11 = [(NSArray *)v9 countByEnumeratingWithState:&v30 objects:v37 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }
  BOOL v14 = [(AVAssetReader *)self _readSingleSample];
  figAssetReader = self->_priv->figAssetReader;
  if (v14)
  {
    CMTime start = v34.start;
    uint64_t v16 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v16) {
      uint64_t v17 = v16;
    }
    else {
      uint64_t v17 = 0;
    }
    uint64_t v22 = *(uint64_t (**)(OpaqueFigAssetReader *, CMTimeRange *))(v17 + 144);
    if (v22)
    {
      range.CMTime start = start;
      int v23 = v22(figAssetReader, &range);
      goto LABEL_26;
    }
LABEL_27:
    id v18 = +[AVAssetReader _errorForOSStatus:(void)v26];
    id v35 = v18;
LABEL_28:
    [(AVAssetReader *)self _transitionToStatus:3 failureError:v18];
    return [(AVAssetReader *)self status] != AVAssetReaderStatusFailed;
  }
  CMTimeRange range = v34;
  CMTimeRangeGetEnd(&v29, &range);
  long long v26 = *(_OWORD *)&v34.start.value;
  CMTimeEpoch epoch = v34.start.epoch;
  uint64_t v20 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v20) {
    uint64_t v21 = v20;
  }
  else {
    uint64_t v21 = 0;
  }
  v24 = *(uint64_t (**)(OpaqueFigAssetReader *, CMTimeRange *, CMTime *))(v21 + 96);
  if (!v24) {
    goto LABEL_27;
  }
  *(_OWORD *)&range.start.value = v26;
  range.start.CMTimeEpoch epoch = epoch;
  CMTime start = v29;
  int v23 = v24(figAssetReader, &range, &start);
LABEL_26:
  if (v23) {
    goto LABEL_27;
  }
  return [(AVAssetReader *)self status] != AVAssetReaderStatusFailed;
}

- (void)cancelReading
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v3 = [(AVAssetReader *)self outputs];
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
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
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * v7++) _cancelReading];
      }
      while (v5 != v7);
      uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
  [(AVAssetReader *)self _transitionToStatus:4 failureError:0];
}

- (void)_handleServerDiedNotification
{
  uint64_t v3 = AVLocalizedError(@"AVFoundationErrorDomain", -11819, 0);
  [(AVAssetReader *)self _transitionToStatus:3 failureError:v3];
}

- (OpaqueFigAssetReader)_figAssetReader
{
  return self->_priv->figAssetReader;
}

- (void)setPreparesMediaDataForRealTimeConsumption:(BOOL)a3
{
  if ([(AVAssetReader *)self status] >= AVAssetReaderStatusReading)
  {
    id v18 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"cannot be called after reading has started", v6, v7, v8, v9, v10, v19), 0 reason userInfo];
    objc_exception_throw(v18);
  }
  self->_priv->realTime = a3;
  if (self->_priv->realTime) {
    long long v11 = (uint64_t *)MEMORY[0x1E4F1CFD0];
  }
  else {
    long long v11 = (uint64_t *)MEMORY[0x1E4F1CFC8];
  }
  uint64_t FigBaseObject = FigAssetReaderGetFigBaseObject();
  uint64_t v13 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v13) {
    uint64_t v14 = v13;
  }
  else {
    uint64_t v14 = 0;
  }
  uint64_t v15 = *(void (**)(uint64_t, uint64_t, uint64_t))(v14 + 56);
  if (v15)
  {
    uint64_t v16 = *MEMORY[0x1E4F323B8];
    uint64_t v17 = *v11;
    v15(FigBaseObject, v16, v17);
  }
}

- (BOOL)preparesMediaDataForRealTimeConsumption
{
  return self->_priv->realTime;
}

- (BOOL)isDefunct
{
  unsigned __int8 v9 = 0;
  uint64_t v2 = [(AVAssetReader *)self _figAssetReader];
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
    uint64_t v5 = (unsigned int (*)(OpaqueFigAssetReader *, unsigned __int8 *))v4[11];
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