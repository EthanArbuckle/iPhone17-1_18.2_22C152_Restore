@interface MIOWriterStreamInput
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)lastAppendTimeStamp;
- (AVAssetWriterInput)mainAVInput;
- (BOOL)areAllInputsReady;
- (BOOL)canAppend;
- (BOOL)canBeConfigured;
- (BOOL)establishAssociationsWithError:(id *)a3;
- (BOOL)finalizeProcessing;
- (BOOL)observingIsReadyStatus;
- (BOOL)pendSample;
- (BOOL)prepareForAppendWithTimeStamp:(id *)a3 error:(id *)a4;
- (BOOL)prepareInputWithWriter:(id)a3 error:(id *)a4;
- (BOOL)registerForAssociating:(id)a3 trackRelation:(id)a4;
- (BOOL)setupInputsWithWriter:(id)a3 error:(id *)a4;
- (BOOL)shutDownOutError:(id *)a3;
- (BOOL)strictlyEnforceBufferCapacity;
- (BOOL)useOwnProcessingQueue;
- (BOOL)useOwnWritingThread;
- (BOOL)verifyNewAppendTimeStamp:(id *)a3 error:(id *)a4;
- (BOOL)writeNextItemFromFifo;
- (MIOFifoBuffer)fifoBuffer;
- (MIOThread)assignedWritingThread;
- (MIOWriter)writer;
- (MIOWriterStreamInput)init;
- (NSArray)associatedInputs;
- (NSArray)customMetadataItems;
- (NSArray)underlyingInputs;
- (NSDictionary)customMetadata;
- (NSString)streamId;
- (NSString)uuid;
- (OS_dispatch_queue)countingQueue;
- (OS_dispatch_queue)processingQueue;
- (OS_os_log)perfLogHandle;
- (id)allWriterInputs;
- (id)stats;
- (int)mediaTimeScale;
- (int64_t)mediaType;
- (int64_t)pendingSamples;
- (int64_t)threadingOption;
- (unint64_t)avfAppendSignPostID;
- (unint64_t)bufferingCapacity;
- (unint64_t)processingSignPostID;
- (void)finishProcessing;
- (void)finishProcessingInDispatchGroup:(id)a3;
- (void)invalidate;
- (void)observeIsReadyStatus;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)onAVInputsAvailable:(id)a3;
- (void)prepareInputFinished;
- (void)resolveSample;
- (void)setAssignedWritingThread:(id)a3;
- (void)setAvfAppendSignPostID:(unint64_t)a3;
- (void)setBufferingCapacity:(unint64_t)a3;
- (void)setCustomMetadata:(id)a3;
- (void)setCustomMetadataItems:(id)a3;
- (void)setLastAppendTimeStamp:(id *)a3;
- (void)setMediaTimeScale:(int)a3;
- (void)setMediaType:(int64_t)a3;
- (void)setObservingIsReadyStatus:(BOOL)a3;
- (void)setPerfLogHandle:(id)a3;
- (void)setProcessingSignPostID:(unint64_t)a3;
- (void)setStreamId:(id)a3;
- (void)setThreadingOption:(int64_t)a3;
- (void)setUseOwnProcessingQueue:(BOOL)a3;
- (void)setUseOwnWritingThread:(BOOL)a3;
- (void)setWriter:(id)a3;
- (void)setupSignPost;
- (void)stopObservingIsReadyStatus;
@end

@implementation MIOWriterStreamInput

- (MIOWriterStreamInput)init
{
  v9.receiver = self;
  v9.super_class = (Class)MIOWriterStreamInput;
  v2 = [(MIOWriterStreamInput *)&v9 init];
  v3 = v2;
  if (v2)
  {
    long long v7 = *MEMORY[0x263F01098];
    uint64_t v8 = *(void *)(MEMORY[0x263F01098] + 16);
    [(MIOWriterStreamInput *)v2 setLastAppendTimeStamp:&v7];
    v3->_initFifoCapacity = 10;
    v3->_mediaTimeScale = 0;
    v3->_threadingOption = 0;
    uint64_t v4 = objc_opt_new();
    associatedInputs = v3->_associatedInputs;
    v3->_associatedInputs = (NSMutableArray *)v4;
  }
  return v3;
}

- (BOOL)registerForAssociating:(id)a3 trackRelation:(id)a4
{
  v13[2] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [(MIOWriterStreamInput *)self canBeConfigured];
  if (v8)
  {
    objc_super v9 = [MEMORY[0x263F08D40] valueWithNonretainedObject:v6];
    v13[0] = v9;
    v13[1] = v7;
    v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:2];

    [(NSMutableArray *)self->_associatedInputs addObject:v10];
  }
  else
  {
    v11 = [(MIOWriterStreamInput *)self writer];
    [v11 reportWarning:@"Cannot register input for association after preparing.  No-op."];
  }
  return v8;
}

- (BOOL)establishAssociationsWithError:(id *)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  v5 = [(MIOWriterStreamInput *)self associatedInputs];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    v25 = a3;
    uint64_t v8 = *(void *)v27;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v27 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        v11 = [v10 objectAtIndexedSubscript:0];
        v12 = [v11 nonretainedObjectValue];

        v13 = [v10 objectAtIndexedSubscript:1];
        v14 = [v12 mainAVInput];
        v15 = [(MIOWriterStreamInput *)self mainAVInput];
        char v16 = [v14 canAddTrackAssociationWithTrackOfInput:v15 type:v13];

        if ((v16 & 1) == 0)
        {
          v20 = NSString;
          v21 = [v12 streamId];
          v22 = [(MIOWriterStreamInput *)self streamId];
          v23 = [v20 stringWithFormat:@"Cannot associate(%@) %@ with %@.", v13, v21, v22];

          [MEMORY[0x263F087E8] populateStreamError:v25 message:v23 code:13];
          BOOL v19 = 0;
          goto LABEL_11;
        }
        v17 = [v12 mainAVInput];
        v18 = [(MIOWriterStreamInput *)self mainAVInput];
        [v17 addTrackAssociationWithTrackOfInput:v18 type:v13];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v26 objects:v30 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v19 = 1;
LABEL_11:

  return v19;
}

- (NSArray)associatedInputs
{
  return (NSArray *)self->_associatedInputs;
}

- (BOOL)canBeConfigured
{
  v3 = [(MIOWriterStreamInput *)self writer];
  if (v3)
  {
    uint64_t v4 = [(MIOWriterStreamInput *)self writer];
    char v5 = [v4 checkStatus:1768843636];
  }
  else
  {
    char v5 = 1;
  }

  return v5;
}

- (void)setCustomMetadata:(id)a3
{
  id v6 = a3;
  if ([(MIOWriterStreamInput *)self canBeConfigured])
  {
    uint64_t v4 = (NSDictionary *)v6;
    customMetadata = self->_customMetadata;
    self->_customMetadata = v4;
  }
  else
  {
    customMetadata = [(MIOWriterStreamInput *)self writer];
    [customMetadata reportWarning:@"Cannot set input's customMetadata after preparing.  No-op."];
  }
}

- (void)setCustomMetadataItems:(id)a3
{
  id v6 = a3;
  if ([(MIOWriterStreamInput *)self canBeConfigured])
  {
    uint64_t v4 = (NSArray *)v6;
    customMetadataItems = self->_customMetadataItems;
    self->_customMetadataItems = v4;
  }
  else
  {
    customMetadataItems = [(MIOWriterStreamInput *)self writer];
    [customMetadataItems reportWarning:@"Cannot set input's customMetadataItems after preparing.  No-op."];
  }
}

- (void)setBufferingCapacity:(unint64_t)a3
{
  if ([(MIOWriterStreamInput *)self canBeConfigured])
  {
    if (self->_fifoBuffer)
    {
      id v5 = [MEMORY[0x263EFF940] exceptionWithName:@"FIFOAlreadyCreated", @"Fifo is already created, capacity cannot be changed anymore.", 0 reason userInfo];
      objc_exception_throw(v5);
    }
    self->_initFifoCapacity = a3;
  }
  else
  {
    id v6 = [(MIOWriterStreamInput *)self writer];
    [v6 reportWarning:@"Cannot set input's bufferingCapacity after preparing.  No-op."];
  }
}

- (void)setMediaTimeScale:(int)a3
{
  if ([(MIOWriterStreamInput *)self canBeConfigured])
  {
    self->_mediaTimeScale = a3;
  }
  else
  {
    id v5 = [(MIOWriterStreamInput *)self writer];
    [v5 reportWarning:@"Cannot set input's mediaTimeScale after preparing.  No-op."];
  }
}

- (void)setUseOwnWritingThread:(BOOL)a3
{
  if ([(MIOWriterStreamInput *)self canBeConfigured])
  {
    id v5 = [(MIOWriterStreamInput *)self assignedWritingThread];

    if (v5)
    {
      id v6 = [MEMORY[0x263EFF940] exceptionWithName:@"WritingThreadAlreadyAssigned", @"A writing thread is already assigned, cannot set usage of own writing thread.", 0 reason userInfo];
      objc_exception_throw(v6);
    }
    self->_useOwnWritingThread = a3;
  }
  else
  {
    id v7 = [(MIOWriterStreamInput *)self writer];
    [v7 reportWarning:@"Cannot set input's useOwnWritingThread after preparing.  No-op."];
  }
}

- (void)setUseOwnProcessingQueue:(BOOL)a3
{
  if ([(MIOWriterStreamInput *)self canBeConfigured])
  {
    if (self->_processingQueue)
    {
      id v5 = [MEMORY[0x263EFF940] exceptionWithName:@"ProcessingQueueAlreadyAssigned", @"A processing queue is already assigned, cannot set usage of own processing queue.", 0 reason userInfo];
      objc_exception_throw(v5);
    }
    self->_useOwnProcessingQueue = a3;
  }
  else
  {
    id v6 = [(MIOWriterStreamInput *)self writer];
    [v6 reportWarning:@"Cannot set input's useOwnProcessingQueue after preparing.  No-op."];
  }
}

- (void)setThreadingOption:(int64_t)a3
{
  if ([(MIOWriterStreamInput *)self canBeConfigured])
  {
    self->_threadingOption = a3;
  }
  else
  {
    id v5 = [(MIOWriterStreamInput *)self writer];
    [v5 reportWarning:@"Cannot set input's threadingOption after preparing.  No-op."];
  }
}

- (id)stats
{
  v3 = NSString;
  uint64_t v4 = [(MIOWriterStreamInput *)self uuid];
  int64_t v5 = [(MIOWriterStreamInput *)self pendingSamples];
  id v6 = [(MIOWriterStreamInput *)self fifoBuffer];
  id v7 = [v3 stringWithFormat:@"%@: PEND: %lld (FIFO: %zu) REDY: %d", v4, v5, objc_msgSend(v6, "usage"), -[MIOWriterStreamInput areAllInputsReady](self, "areAllInputsReady")];

  return v7;
}

- (void)onAVInputsAvailable:(id)a3
{
  self->_inputsAvailableHandler = (id)MEMORY[0x21D492700](a3, a2);

  MEMORY[0x270F9A758]();
}

- (int64_t)pendingSamples
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  v3 = [(MIOWriterStreamInput *)self countingQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __38__MIOWriterStreamInput_pendingSamples__block_invoke;
  v6[3] = &unk_2643AF490;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  int64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __38__MIOWriterStreamInput_pendingSamples__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 32);
  return result;
}

- (NSString)uuid
{
  uuid = self->_uuid;
  if (!uuid)
  {
    int64_t v4 = NSString;
    int64_t v5 = [(MIOWriterStreamInput *)self streamId];
    id v6 = [v4 stringWithFormat:@"%@_%ld", v5, -[MIOWriterStreamInput mediaType](self, "mediaType")];
    uint64_t v7 = self->_uuid;
    self->_uuid = v6;

    uuid = self->_uuid;
  }

  return uuid;
}

- (BOOL)verifyNewAppendTimeStamp:(id *)a3 error:(id *)a4
{
  [(MIOWriterStreamInput *)self lastAppendTimeStamp];
  if ((v16 & 1) == 0
    || ([(MIOWriterStreamInput *)self lastAppendTimeStamp],
        CMTime time2 = (CMTime)*a3,
        CMTimeCompare(&time1, &time2) < 0))
  {
    long long v11 = *(_OWORD *)&a3->var0;
    int64_t var3 = a3->var3;
    [(MIOWriterStreamInput *)self setLastAppendTimeStamp:&v11];
    return 1;
  }
  else
  {
    uint64_t v7 = NSString;
    CMTime time2 = (CMTime)*a3;
    Float64 Seconds = CMTimeGetSeconds(&time2);
    [(MIOWriterStreamInput *)self lastAppendTimeStamp];
    uint64_t v9 = objc_msgSend(v7, "stringWithFormat:", @"Invalid time stamp (%f). Time stamp must be higher than %f.", *(void *)&Seconds, CMTimeGetSeconds(&time));
    [MEMORY[0x263F087E8] populateWriterError:a4 message:v9 code:17];

    return 0;
  }
}

- (unint64_t)bufferingCapacity
{
  if (self->_fifoBuffer) {
    return [(MIOFifoBuffer *)self->_fifoBuffer capacity];
  }
  else {
    return self->_initFifoCapacity;
  }
}

- (BOOL)canAppend
{
  int64_t threadingOption = self->_threadingOption;
  if (threadingOption == 1)
  {
    uint64_t v10 = 0;
    long long v11 = &v10;
    uint64_t v12 = 0x2020000000;
    char v13 = 1;
    if ([(MIOWriterStreamInput *)self strictlyEnforceBufferCapacity])
    {
      id v6 = [(MIOWriterStreamInput *)self countingQueue];
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = __33__MIOWriterStreamInput_canAppend__block_invoke_2;
      v8[3] = &unk_2643AF490;
      v8[4] = self;
      v8[5] = &v10;
      dispatch_sync(v6, v8);
    }
    if (*((unsigned char *)v11 + 24)) {
      BOOL v2 = [(MIOWriterStreamInput *)self areAllInputsReady];
    }
    else {
      BOOL v2 = 0;
    }
    goto LABEL_9;
  }
  if (!threadingOption)
  {
    uint64_t v10 = 0;
    long long v11 = &v10;
    uint64_t v12 = 0x2020000000;
    char v13 = 0;
    int64_t v5 = [(MIOWriterStreamInput *)self countingQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __33__MIOWriterStreamInput_canAppend__block_invoke;
    block[3] = &unk_2643AF490;
    block[4] = self;
    block[5] = &v10;
    dispatch_sync(v5, block);

    BOOL v2 = *((unsigned char *)v11 + 24) != 0;
LABEL_9:
    _Block_object_dispose(&v10, 8);
  }
  return v2;
}

unint64_t __33__MIOWriterStreamInput_canAppend__block_invoke(uint64_t a1)
{
  BOOL v2 = *(void **)(a1 + 32);
  unint64_t v3 = v2[4] + 1;
  unint64_t result = [v2 bufferingCapacity];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3 <= result;
  return result;
}

unint64_t __33__MIOWriterStreamInput_canAppend__block_invoke_2(uint64_t a1)
{
  BOOL v2 = *(void **)(a1 + 32);
  unint64_t v3 = v2[4] + 1;
  unint64_t result = [v2 bufferingCapacity];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3 <= result;
  return result;
}

- (BOOL)pendSample
{
  BOOL v2 = self;
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  unint64_t v3 = [(MIOWriterStreamInput *)self countingQueue];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __34__MIOWriterStreamInput_pendSample__block_invoke;
  v5[3] = &unk_2643AF4B8;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

unint64_t __34__MIOWriterStreamInput_pendSample__block_invoke(uint64_t a1)
{
  BOOL v2 = *(void **)(a1 + 32);
  unint64_t v3 = v2[4] + 1;
  unint64_t result = [v2 bufferingCapacity];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  if (v3 <= result)
  {
    *(unsigned char *)(v5 + 24) = 1;
    ++*(void *)(*(void *)(a1 + 32) + 32);
  }
  else
  {
    *(unsigned char *)(v5 + 24) = 0;
  }
  return result;
}

- (void)resolveSample
{
  objc_initWeak(&location, self);
  unint64_t v3 = [(MIOWriterStreamInput *)self countingQueue];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __37__MIOWriterStreamInput_resolveSample__block_invoke;
  v4[3] = &unk_2643AF4E0;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __37__MIOWriterStreamInput_resolveSample__block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained) {
    --WeakRetained[4];
  }
}

- (BOOL)prepareForAppendWithTimeStamp:(id *)a3 error:(id *)a4
{
  uint64_t v7 = [(MIOWriterStreamInput *)self writer];
  char v8 = [v7 checkStatus:1919247481];

  if ((v8 & 1) == 0)
  {
    [MEMORY[0x263F087E8] populateWriterError:a4 message:@"Writer not in state MIOWriterReady. Cannot append" code:17];
LABEL_8:
    LOBYTE(v9) = 0;
    return v9;
  }
  long long v18 = *(_OWORD *)&a3->var0;
  int64_t var3 = a3->var3;
  BOOL v9 = [(MIOWriterStreamInput *)self verifyNewAppendTimeStamp:&v18 error:a4];
  if (!v9) {
    return v9;
  }
  if (self->_threadingOption == 1 && ![(MIOWriterStreamInput *)self areAllInputsReady])
  {
    v14 = NSString;
    v15 = [(MIOWriterStreamInput *)self streamId];
    char v16 = [v14 stringWithFormat:@"Stream: %@ inputs are not ready, dropping sample", v15];

    [MEMORY[0x263F087E8] populateWriterError:a4 message:v16 code:21];
    goto LABEL_8;
  }
  if (![(MIOWriterStreamInput *)self pendSample])
  {
    long long v11 = NSString;
    uint64_t v12 = [(MIOWriterStreamInput *)self streamId];
    char v13 = [v11 stringWithFormat:@"Stream: %@ buffering capacity reached (%zu), dropping sample", v12, -[MIOWriterStreamInput bufferingCapacity](self, "bufferingCapacity")];

    [MEMORY[0x263F087E8] populateWriterError:a4 message:v13 code:18];
    goto LABEL_8;
  }
  uint64_t v10 = [(MIOWriterStreamInput *)self writer];
  long long v18 = *(_OWORD *)&a3->var0;
  int64_t var3 = a3->var3;
  [v10 proposeSessionStartTime:&v18];

  LOBYTE(v9) = 1;
  return v9;
}

- (BOOL)prepareInputWithWriter:(id)a3 error:(id *)a4
{
  id v6 = a3;
  [(MIOWriterStreamInput *)self setWriter:v6];
  BOOL v7 = [(MIOWriterStreamInput *)self setupInputsWithWriter:v6 error:a4];

  if (v7)
  {
    inputsAvailableHandler = (void (**)(id, MIOWriterStreamInput *, void *))self->_inputsAvailableHandler;
    if (inputsAvailableHandler)
    {
      BOOL v9 = [(MIOWriterStreamInput *)self allWriterInputs];
      inputsAvailableHandler[2](inputsAvailableHandler, self, v9);
    }
    uint64_t v10 = NSString;
    long long v11 = [(MIOWriterStreamInput *)self uuid];
    uint64_t v12 = [v10 stringWithFormat:@"mio.counting.%@", v11];

    id v13 = v12;
    v14 = (OS_dispatch_queue *)dispatch_queue_create((const char *)[v13 UTF8String], 0);
    countingQueue = self->_countingQueue;
    self->_countingQueue = v14;

    char v16 = [[MIOFifoBuffer alloc] initWithCapacity:self->_initFifoCapacity];
    fifoBuffer = self->_fifoBuffer;
    self->_fifoBuffer = v16;

    [(MIOWriterStreamInput *)self setupSignPost];
    [(MIOWriterStreamInput *)self observeIsReadyStatus];
    [(MIOWriterStreamInput *)self prepareInputFinished];
  }
  return v7;
}

- (void)setupSignPost
{
  if ([(MIOWriterStreamInput *)self useOwnProcessingQueue])
  {
    unint64_t v3 = NSString;
    int64_t v4 = [(MIOWriterStreamInput *)self uuid];
    id v5 = [v3 stringWithFormat:@"com.apple.mio.processing.%@", v4];
  }
  else
  {
    id v5 = @"com.apple.mio.processing.default";
  }
  uint64_t v10 = v5;
  os_log_t v6 = os_log_create((const char *)[(__CFString *)v10 UTF8String], "PointsOfInterest");
  [(MIOWriterStreamInput *)self setPerfLogHandle:v6];

  BOOL v7 = [(MIOWriterStreamInput *)self perfLogHandle];
  [(MIOWriterStreamInput *)self setProcessingSignPostID:os_signpost_id_generate(v7)];

  char v8 = [(MIOWriterStreamInput *)self assignedWritingThread];
  BOOL v9 = [v8 perfLogHandle];
  [(MIOWriterStreamInput *)self setAvfAppendSignPostID:os_signpost_id_generate(v9)];
}

- (BOOL)finalizeProcessing
{
  int64_t v3 = [(MIOWriterStreamInput *)self threadingOption];
  if (v3 == 1)
  {
    return [(MIOWriterStreamInput *)self writeNextItemFromFifo];
  }
  else
  {
    if (!v3)
    {
      int64_t v4 = [(MIOWriterStreamInput *)self assignedWritingThread];
      [v4 proceed];
    }
    return 1;
  }
}

- (void)prepareInputFinished
{
}

- (BOOL)setupInputsWithWriter:(id)a3 error:(id *)a4
{
  id v4 = a3;
  __assert_rtn("-[MIOWriterStreamInput setupInputsWithWriter:error:]", "MIOWriterStreamInput.m", 354, "0");
}

- (void)finishProcessing
{
}

- (BOOL)writeNextItemFromFifo
{
}

- (id)allWriterInputs
{
}

- (BOOL)areAllInputsReady
{
}

- (BOOL)strictlyEnforceBufferCapacity
{
  return 0;
}

- (NSArray)underlyingInputs
{
  return (NSArray *)MEMORY[0x263EFFA68];
}

- (AVAssetWriterInput)mainAVInput
{
}

- (OS_dispatch_queue)processingQueue
{
  p_processingQueue = &self->_processingQueue;
  processingQueue = self->_processingQueue;
  if (!processingQueue)
  {
    id v5 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, -1);
    os_log_t v6 = v5;
    if (self->_useOwnProcessingQueue)
    {
      BOOL v7 = NSString;
      char v8 = [(MIOWriterStreamInput *)self uuid];
      BOOL v9 = [v7 stringWithFormat:@"mio.processing.%@", v8];

      id v10 = v9;
      long long v11 = (OS_dispatch_queue *)dispatch_queue_create((const char *)[v10 UTF8String], v6);
      uint64_t v12 = self->_processingQueue;
      self->_processingQueue = v11;
    }
    else
    {
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __39__MIOWriterStreamInput_processingQueue__block_invoke;
      block[3] = &unk_2643AF508;
      v15 = v5;
      if (processingQueue_onceToken != -1) {
        dispatch_once(&processingQueue_onceToken, block);
      }
      objc_storeStrong((id *)p_processingQueue, (id)processingQueue_proc);
    }
    processingQueue = *p_processingQueue;
  }

  return processingQueue;
}

uint64_t __39__MIOWriterStreamInput_processingQueue__block_invoke(uint64_t a1)
{
  processingQueue_proc = (uint64_t)dispatch_queue_create("mio.processing.shared", *(dispatch_queue_attr_t *)(a1 + 32));

  return MEMORY[0x270F9A758]();
}

- (void)finishProcessingInDispatchGroup:(id)a3
{
  id v4 = a3;
  if (self->_threadingOption != 1
    || [(MIOWriterStreamInput *)self strictlyEnforceBufferCapacity])
  {
    objc_initWeak(&location, self);
    id v5 = [(MIOWriterStreamInput *)self processingQueue];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __56__MIOWriterStreamInput_finishProcessingInDispatchGroup___block_invoke;
    v6[3] = &unk_2643AF4E0;
    objc_copyWeak(&v7, &location);
    dispatch_group_async(v4, v5, v6);

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

void __56__MIOWriterStreamInput_finishProcessingInDispatchGroup___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained finishProcessing];
    id WeakRetained = v2;
  }
}

- (BOOL)shutDownOutError:(id *)a3
{
  [(MIOWriterStreamInput *)self stopObservingIsReadyStatus];
  id v4 = [(MIOWriterStreamInput *)self fifoBuffer];
  [v4 emptyFifoBuffer];

  return 1;
}

- (void)invalidate
{
  [(MIOWriterStreamInput *)self stopObservingIsReadyStatus];
  id v3 = [(MIOWriterStreamInput *)self fifoBuffer];
  [v3 emptyFifoBuffer];
}

- (void)observeIsReadyStatus
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if (![(MIOWriterStreamInput *)self observingIsReadyStatus])
  {
    [(MIOWriterStreamInput *)self setObservingIsReadyStatus:1];
    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    id v3 = [(MIOWriterStreamInput *)self allWriterInputs];
    uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
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
          [*(id *)(*((void *)&v8 + 1) + 8 * v7++) addObserver:self forKeyPath:@"readyForMoreMediaData" options:1 context:0];
        }
        while (v5 != v7);
        uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      }
      while (v5);
    }
  }
}

- (void)stopObservingIsReadyStatus
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if ([(MIOWriterStreamInput *)self observingIsReadyStatus])
  {
    [(MIOWriterStreamInput *)self setObservingIsReadyStatus:0];
    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    id v3 = [(MIOWriterStreamInput *)self allWriterInputs];
    uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
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
          [*(id *)(*((void *)&v8 + 1) + 8 * v7++) removeObserver:self forKeyPath:@"readyForMoreMediaData"];
        }
        while (v5 != v7);
        uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      }
      while (v5);
    }
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v7 = objc_msgSend(a5, "objectForKey:", *MEMORY[0x263F081B8], a4);
  int v8 = [v7 BOOLValue];

  if (v8)
  {
    if ([(MIOWriterStreamInput *)self areAllInputsReady])
    {
      long long v9 = [(MIOWriterStreamInput *)self writer];
      int v10 = [v9 canWrite];

      if (v10)
      {
        id v11 = [(MIOWriterStreamInput *)self assignedWritingThread];
        [v11 proceed];
      }
    }
  }
}

- (int64_t)mediaType
{
  return self->_mediaType;
}

- (void)setMediaType:(int64_t)a3
{
  self->_mediaType = a3;
}

- (NSString)streamId
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (void)setStreamId:(id)a3
{
}

- (NSDictionary)customMetadata
{
  return self->_customMetadata;
}

- (NSArray)customMetadataItems
{
  return self->_customMetadataItems;
}

- (int)mediaTimeScale
{
  return self->_mediaTimeScale;
}

- (BOOL)useOwnWritingThread
{
  return self->_useOwnWritingThread;
}

- (BOOL)useOwnProcessingQueue
{
  return self->_useOwnProcessingQueue;
}

- (int64_t)threadingOption
{
  return self->_threadingOption;
}

- (OS_dispatch_queue)countingQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 112, 1);
}

- (MIOFifoBuffer)fifoBuffer
{
  return (MIOFifoBuffer *)objc_getProperty(self, a2, 120, 1);
}

- (MIOWriter)writer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_writer);

  return (MIOWriter *)WeakRetained;
}

- (void)setWriter:(id)a3
{
}

- (BOOL)observingIsReadyStatus
{
  return self->_observingIsReadyStatus;
}

- (void)setObservingIsReadyStatus:(BOOL)a3
{
  self->_observingIsReadyStatus = a3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)lastAppendTimeStamp
{
  objc_copyStruct(retstr, &self->_lastAppendTimeStamp, 24, 1, 0);
  return result;
}

- (void)setLastAppendTimeStamp:(id *)a3
{
}

- (MIOThread)assignedWritingThread
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_assignedWritingThread);

  return (MIOThread *)WeakRetained;
}

- (void)setAssignedWritingThread:(id)a3
{
}

- (OS_os_log)perfLogHandle
{
  return (OS_os_log *)objc_getProperty(self, a2, 144, 1);
}

- (void)setPerfLogHandle:(id)a3
{
}

- (unint64_t)processingSignPostID
{
  return self->_processingSignPostID;
}

- (void)setProcessingSignPostID:(unint64_t)a3
{
  self->_processingSignPostID = a3;
}

- (unint64_t)avfAppendSignPostID
{
  return self->_avfAppendSignPostID;
}

- (void)setAvfAppendSignPostID:(unint64_t)a3
{
  self->_avfAppendSignPostID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_perfLogHandle, 0);
  objc_destroyWeak((id *)&self->_assignedWritingThread);
  objc_destroyWeak((id *)&self->_writer);
  objc_storeStrong((id *)&self->_fifoBuffer, 0);
  objc_storeStrong((id *)&self->_countingQueue, 0);
  objc_storeStrong((id *)&self->_customMetadataItems, 0);
  objc_storeStrong((id *)&self->_customMetadata, 0);
  objc_storeStrong((id *)&self->_streamId, 0);
  objc_storeStrong((id *)&self->_associatedInputs, 0);
  objc_storeStrong(&self->_inputsAvailableHandler, 0);
  objc_storeStrong((id *)&self->_processingQueue, 0);

  objc_storeStrong((id *)&self->_uuid, 0);
}

@end