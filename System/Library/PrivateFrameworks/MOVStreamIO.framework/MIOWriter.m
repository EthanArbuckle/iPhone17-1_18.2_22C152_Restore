@interface MIOWriter
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)movieFragmentInterval;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)sessionStartTime;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timeWithSeconds:(SEL)a3;
- (AVAssetWriter)avWriter;
- (BOOL)addInput:(id)a3;
- (BOOL)addInput:(id)a3 error:(id *)a4;
- (BOOL)canWrite;
- (BOOL)checkStatus:(unsigned int)a3;
- (BOOL)drainWritingThreads;
- (BOOL)enableAVEHighPerformanceProfile;
- (BOOL)forceFinishWritingThreads;
- (BOOL)inProcessRecording;
- (BOOL)preferCustomCompression;
- (BOOL)preserveSessionStartTime;
- (BOOL)realTime;
- (BOOL)setTrackMetadata:(id)a3 forMetadataStream:(id)a4 error:(id *)a5;
- (BOOL)setTrackMetadata:(id)a3 forStream:(id)a4 error:(id *)a5;
- (BOOL)setVideoTransform:(CGAffineTransform *)a3 forStream:(id)a4;
- (BOOL)shouldOptimizeForNetworkUse;
- (BOOL)startSession;
- (BOOL)startWriting;
- (MIOMovieMetadataUtility)movieMetadataUtility;
- (MIOOrderedKeysMutableMap)inputs;
- (MIOWriter)initWithFilePath:(id)a3 error:(id *)a4;
- (MIOWriter)initWithURL:(id)a3 andExpectedFrameRate:(double)a4;
- (NSArray)customMOVMetadata;
- (NSString)filePath;
- (NSString)timeRangeMetadataKeyHint;
- (OS_dispatch_queue)defaultNotificationQueue;
- (double)defaultFrameRate;
- (id)description;
- (id)getFailHandler;
- (id)getWarningHandler;
- (id)newWritingThreadWithName:(id)a3;
- (id)writerInputs;
- (id)writerInputsWithMediaType:(int64_t)a3;
- (id)writerInputsWithMediaType:(int64_t)a3 streamId:(id)a4;
- (int)baseMediaTimeScale;
- (int)bufferCacheMode;
- (unsigned)status;
- (void)addMetadataTrack:(id)a3;
- (void)addTrackForStreamWithIdentifier:(id)a3 formatDescription:(opaqueCMFormatDescription *)a4 recordingConfiguration:(id)a5;
- (void)appendMetadata:(id)a3 withTimeStamp:(id *)a4 toStream:(id)a5;
- (void)appendPixelBuffer:(__CVBuffer *)a3 presentationTime:(id *)a4 toStreamId:(id)a5;
- (void)cancelRecordingWithCompletionHandler:(id)a3;
- (void)dealloc;
- (void)fail;
- (void)finishRecording;
- (void)finishWithCompletionHandler:(id)a3;
- (void)finishWithEndTime:(id *)a3 completionHandler:(id)a4;
- (void)finishWithTimeout:(double)a3 completionHandler:(id)a4;
- (void)finishWithTimeout:(double)a3 endTime:(id *)a4 completionHandler:(id)a5;
- (void)prepareToRecordWithMovieMetadata:(id)a3;
- (void)prepareWriterWithCompletionHandler:(id)a3;
- (void)proposeSessionStartTime:(id *)a3;
- (void)reportError:(id)a3;
- (void)reportWarning:(id)a3;
- (void)setAvWriter:(id)a3;
- (void)setBaseMediaTimeScale:(int)a3;
- (void)setBufferCacheMode:(int)a3;
- (void)setCustomMOVMetadata:(id)a3;
- (void)setDefaultFrameRate:(double)a3;
- (void)setDefaultNotificationQueue:(id)a3;
- (void)setDrainWritingThreads:(BOOL)a3;
- (void)setEnableAVEHighPerformanceProfile:(BOOL)a3;
- (void)setFailHandler:(id)a3;
- (void)setFifoBufferCapacity:(unint64_t)a3;
- (void)setForceFinishWritingThreads:(BOOL)a3;
- (void)setInProcessRecording:(BOOL)a3;
- (void)setMovieFragmentInterval:(id *)a3;
- (void)setPreferCustomCompression:(BOOL)a3;
- (void)setPreserveSessionStartTime:(BOOL)a3;
- (void)setRealTime:(BOOL)a3;
- (void)setSessionStartTime:(id *)a3;
- (void)setShouldOptimizeForNetworkUse:(BOOL)a3;
- (void)setStatus:(unsigned int)a3;
- (void)setTimeRangeMetadataKeyHint:(id)a3;
- (void)setWarningHandler:(id)a3;
- (void)signalWritingThreadsProceed;
- (void)simulateFailure;
@end

@implementation MIOWriter

- (MIOWriter)initWithURL:(id)a3 andExpectedFrameRate:(double)a4
{
  v5 = objc_msgSend(a3, "path", a4);
  v6 = [(MIOWriter *)self initWithFilePath:v5 error:0];

  return v6;
}

- (void)finishRecording
{
}

- (void)prepareToRecordWithMovieMetadata:(id)a3
{
  [(MIOWriter *)self setCustomMOVMetadata:a3];

  [(MIOWriter *)self prepareWriterWithCompletionHandler:&__block_literal_global_2];
}

- (void)addTrackForStreamWithIdentifier:(id)a3 formatDescription:(opaqueCMFormatDescription *)a4 recordingConfiguration:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  v10 = [[MIOWriterPixelBufferStreamInput alloc] initWithStreamId:v9 format:a4 recordingConfig:v8];

  [(MIOWriter *)self addInput:v10 error:0];
}

- (BOOL)setTrackMetadata:(id)a3 forStream:(id)a4 error:(id *)a5
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  [(MIOWriter *)self writerInputsWithMediaType:0];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v22;
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v22 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        v16 = [v15 streamId];
        int v17 = [v16 isEqualToString:v9];

        if (v17)
        {
          [v15 setCustomMetadata:v8];
          BOOL v19 = 1;
          v18 = v10;
          goto LABEL_12;
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }

  if (a5)
  {
    v18 = [NSString stringWithFormat:@"Unknown stream %@.", v9];
    [MEMORY[0x263F087E8] internalErrorWithMessage:v18 code:7];
    BOOL v19 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_12:
  }
  else
  {
    BOOL v19 = 0;
  }

  return v19;
}

- (void)addMetadataTrack:(id)a3
{
  id v4 = a3;
  v5 = [[MIOWriterDataStreamInput alloc] initWithStreamId:v4];

  [(MIOWriter *)self addInput:v5 error:0];
}

- (BOOL)setTrackMetadata:(id)a3 forMetadataStream:(id)a4 error:(id *)a5
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  [(MIOWriter *)self writerInputsWithMediaType:2];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v22;
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v22 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        v16 = [v15 streamId];
        int v17 = [v16 isEqualToString:v9];

        if (v17)
        {
          [v15 setCustomMetadata:v8];
          BOOL v19 = 1;
          v18 = v10;
          goto LABEL_12;
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }

  if (a5)
  {
    v18 = [NSString stringWithFormat:@"Unknown stream %@.", v9];
    [MEMORY[0x263F087E8] internalErrorWithMessage:v18 code:7];
    BOOL v19 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_12:
  }
  else
  {
    BOOL v19 = 0;
  }

  return v19;
}

- (void)setFifoBufferCapacity:(unint64_t)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = [(MIOWriter *)self writerInputs];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v8++) setBufferingCapacity:a3];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)appendPixelBuffer:(__CVBuffer *)a3 presentationTime:(id *)a4 toStreamId:(id)a5
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v8 = a5;
  [(MIOWriter *)self writerInputsWithMediaType:0];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (!v10)
  {
LABEL_9:

    [NSString stringWithFormat:@"Unknown video stream '%@'", v8];
    goto LABEL_13;
  }
  uint64_t v11 = v10;
  uint64_t v12 = *(void *)v24;
LABEL_3:
  uint64_t v13 = 0;
  while (1)
  {
    if (*(void *)v24 != v12) {
      objc_enumerationMutation(v9);
    }
    uint64_t v14 = *(void **)(*((void *)&v23 + 1) + 8 * v13);
    v15 = [v14 streamId];
    int v16 = [v15 isEqualToString:v8];

    if (v16) {
      break;
    }
    if (v11 == ++v13)
    {
      uint64_t v11 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (!v11) {
        goto LABEL_9;
      }
      goto LABEL_3;
    }
  }
  long long v20 = *(_OWORD *)&a4->var0;
  int64_t var3 = a4->var3;
  id v22 = 0;
  char v17 = [v14 appendPixelBuffer:a3 pts:&v20 error:&v22];
  id v18 = v22;
  if ((v17 & 1) == 0)
  {
    [NSString stringWithFormat:@"%@", v18];
LABEL_13:
    id v19 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498] reason:objc_claimAutoreleasedReturnValue() userInfo:0];
    objc_exception_throw(v19);
  }
}

- (void)appendMetadata:(id)a3 withTimeStamp:(id *)a4 toStream:(id)a5
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  [(MIOWriter *)self writerInputsWithMediaType:2];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = [v10 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (!v11)
  {
LABEL_9:

    [NSString stringWithFormat:@"Unknown metadata stream '%@'", v9];
    goto LABEL_13;
  }
  uint64_t v12 = v11;
  uint64_t v13 = *(void *)v25;
LABEL_3:
  uint64_t v14 = 0;
  while (1)
  {
    if (*(void *)v25 != v13) {
      objc_enumerationMutation(v10);
    }
    v15 = *(void **)(*((void *)&v24 + 1) + 8 * v14);
    int v16 = [v15 streamId];
    int v17 = [v16 isEqualToString:v9];

    if (v17) {
      break;
    }
    if (v12 == ++v14)
    {
      uint64_t v12 = [v10 countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (!v12) {
        goto LABEL_9;
      }
      goto LABEL_3;
    }
  }
  long long v21 = *(_OWORD *)&a4->var0;
  int64_t var3 = a4->var3;
  id v23 = 0;
  char v18 = [v15 appendMetadata:v8 withTimeStamp:&v21 error:&v23];
  id v19 = v23;
  if ((v18 & 1) == 0)
  {
    [NSString stringWithFormat:@"%@", v19];
LABEL_13:
    id v20 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498] reason:objc_claimAutoreleasedReturnValue() userInfo:0];
    objc_exception_throw(v20);
  }
}

- (BOOL)setVideoTransform:(CGAffineTransform *)a3 forStream:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a4;
  [(MIOWriter *)self writerInputsWithMediaType:0];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v20;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v13 = [v12 streamId];
        int v14 = [v13 isEqualToString:v6];

        if (v14)
        {
          long long v16 = *(_OWORD *)&a3->c;
          v18[0] = *(_OWORD *)&a3->a;
          v18[1] = v16;
          v18[2] = *(_OWORD *)&a3->tx;
          [v12 setTransform:v18];
          BOOL v15 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  BOOL v15 = 0;
LABEL_11:

  return v15;
}

- (MIOWriter)initWithFilePath:(id)a3 error:(id *)a4
{
  id v7 = a3;
  uint64_t v8 = v7;
  if (!v7)
  {
    long long v27 = (void *)MEMORY[0x263F087E8];
    uint64_t v28 = @"MIOWriter file path cannot be nil.";
LABEL_13:
    [v27 populateStreamError:a4 message:v28 code:5];
    goto LABEL_14;
  }
  if (![v7 length])
  {
    long long v27 = (void *)MEMORY[0x263F087E8];
    uint64_t v28 = @"MIOWriter file path cannot be empty string.";
    goto LABEL_13;
  }
  unsigned __int8 v33 = 0;
  uint64_t v9 = [MEMORY[0x263F08850] defaultManager];
  int v10 = [v9 fileExistsAtPath:v8 isDirectory:&v33];
  int v11 = v33;

  if (v10) {
    BOOL v12 = v11 == 0;
  }
  else {
    BOOL v12 = 1;
  }
  if (!v12)
  {
    uint64_t v29 = [NSString stringWithFormat:@"File path '%@' is an existing directory", v8];
    [MEMORY[0x263F087E8] populateStreamError:a4 message:v29 code:5];

LABEL_14:
    long long v26 = 0;
    goto LABEL_15;
  }
  v32.receiver = self;
  v32.super_class = (Class)MIOWriter;
  uint64_t v13 = [(MIOWriter *)&v32 init];
  int v14 = v13;
  if (v13)
  {
    *((void *)v13 + 8) = 0x403E000000000000;
    v13[16] = 0;
    uint64_t v15 = MEMORY[0x263F01098];
    long long v31 = *MEMORY[0x263F01098];
    *(_OWORD *)(v13 + 20) = *MEMORY[0x263F01098];
    uint64_t v16 = *(void *)(v15 + 16);
    *(void *)(v13 + 36) = v16;
    *((_DWORD *)v13 + 26) = 1768843636;
    objc_storeStrong((id *)v13 + 19, a3);
    uint64_t v17 = objc_opt_new();
    char v18 = (void *)v14[21];
    v14[21] = v17;

    *((_OWORD *)v14 + 11) = v31;
    v14[24] = v16;
    dispatch_queue_t v19 = dispatch_queue_create("mio.writer.notifications", 0);
    long long v20 = (void *)v14[20];
    v14[20] = v19;

    dispatch_queue_t v21 = dispatch_queue_create("mio.writer.status", 0);
    long long v22 = (void *)v14[12];
    v14[12] = v21;

    v14[16] = 0x403E000000000000;
    *((unsigned char *)v14 + 112) = 0;
    *((_DWORD *)v14 + 29) = 16800;
    *((unsigned char *)v14 + 110) = 0;
    *((_WORD *)v14 + 54) = 1;
    dispatch_group_t v23 = dispatch_group_create();
    uint64_t v24 = (void *)v14[10];
    v14[10] = v23;

    long long v25 = (void *)v14[11];
    v14[11] = 0;
  }
  self = v14;
  long long v26 = self;
LABEL_15:

  return v26;
}

- (void)dealloc
{
  NSLog(&cfstr_MiowriterDeall.isa, a2);
  v3.receiver = self;
  v3.super_class = (Class)MIOWriter;
  [(MIOWriter *)&v3 dealloc];
}

- (MIOMovieMetadataUtility)movieMetadataUtility
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if ([(MIOWriter *)self checkStatus:1685024357] && !self->_movieMetadataUtility)
  {
    objc_super v3 = [MIOMovieMetadataUtility alloc];
    id v4 = [(MIOWriter *)self avWriter];
    uint64_t v5 = [v4 outputURL];
    id v12 = 0;
    id v6 = [(MIOMovieMetadataUtility *)v3 initWithURL:v5 error:&v12];
    id v7 = v12;
    movieMetadataUtility = self->_movieMetadataUtility;
    self->_movieMetadataUtility = v6;

    if (!self->_movieMetadataUtility)
    {
      uint64_t v9 = +[MIOLog defaultLog];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v14 = v7;
        _os_log_impl(&dword_21B5ED000, v9, OS_LOG_TYPE_ERROR, "Error creating movieMetadataUtility: %{public}@.", buf, 0xCu);
      }
    }
  }
  int v10 = self->_movieMetadataUtility;

  return v10;
}

- (id)writerInputs
{
  return [(MIOOrderedKeysMutableMap *)self->_inputs allValues];
}

- (id)writerInputsWithMediaType:(int64_t)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_opt_new();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = [(MIOOrderedKeysMutableMap *)self->_inputs allValues];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        int v11 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ([v11 mediaType] == a3) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)writerInputsWithMediaType:(int64_t)a3 streamId:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a4;
  [(MIOWriter *)self writerInputsWithMediaType:a3];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  id v8 = (id)[v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v8; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v7);
        }
        int v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        id v12 = objc_msgSend(v11, "streamId", (void)v15);
        char v13 = [v12 isEqualToString:v6];

        if (v13)
        {
          id v8 = v11;
          goto LABEL_11;
        }
      }
      id v8 = (id)[v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v8;
}

- (unsigned)status
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  int v11 = 1970170734;
  objc_initWeak(&location, self);
  statusQueue = self->_statusQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __19__MIOWriter_status__block_invoke;
  block[3] = &unk_2643AF848;
  objc_copyWeak(&v6, &location);
  block[4] = &v8;
  dispatch_sync(statusQueue, block);
  LODWORD(statusQueue) = *((_DWORD *)v9 + 6);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v8, 8);
  return statusQueue;
}

void __19__MIOWriter_status__block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained) {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = WeakRetained[26];
  }
}

- (void)setStatus:(unsigned int)a3
{
  objc_initWeak(&location, self);
  statusQueue = self->_statusQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __23__MIOWriter_setStatus___block_invoke;
  block[3] = &unk_2643AF870;
  objc_copyWeak(&v7, &location);
  unsigned int v8 = a3;
  dispatch_async(statusQueue, block);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __23__MIOWriter_setStatus___block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained) {
    WeakRetained[26] = *(_DWORD *)(a1 + 40);
  }
}

- (BOOL)checkStatus:(unsigned int)a3
{
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  objc_initWeak(&location, self);
  statusQueue = self->_statusQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __25__MIOWriter_checkStatus___block_invoke;
  v7[3] = &unk_2643AF898;
  objc_copyWeak(&v8, &location);
  v7[4] = &v11;
  unsigned int v9 = a3;
  dispatch_sync(statusQueue, v7);
  LOBYTE(a3) = *((unsigned char *)v12 + 24);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v11, 8);
  return a3;
}

void __25__MIOWriter_checkStatus___block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = WeakRetained[26] == *(_DWORD *)(a1 + 48);
  }
}

- (void)setBaseMediaTimeScale:(int)a3
{
  if ([(MIOWriter *)self checkStatus:1768843636])
  {
    self->_baseMediaTimeScale = a3;
  }
  else
  {
    [(MIOWriter *)self reportWarning:@"Cannot set baseMediaTimeScale after preparing.  No-op."];
  }
}

- (void)setSessionStartTime:(id *)a3
{
  obj = self;
  objc_sync_enter(obj);
  if (obj->_sessionStarted)
  {
    objc_sync_exit(obj);

    [(MIOWriter *)obj reportWarning:@"Cannot set sessionStartTime after session was started.  No-op."];
  }
  else
  {
    long long v4 = *(_OWORD *)&a3->var0;
    *(void *)&obj->_sessionStartTime.flags = a3->var3;
    *(_OWORD *)(&obj->_sessionStarted + 4) = v4;
    objc_sync_exit(obj);
  }
}

- (void)setRealTime:(BOOL)a3
{
  if ([(MIOWriter *)self checkStatus:1768843636])
  {
    self->_realTime = a3;
  }
  else
  {
    [(MIOWriter *)self reportWarning:@"Cannot set realTime after preparing.  No-op."];
  }
}

- (void)setInProcessRecording:(BOOL)a3
{
  if ([(MIOWriter *)self checkStatus:1768843636])
  {
    self->_inProcessRecording = a3;
  }
  else
  {
    [(MIOWriter *)self reportWarning:@"Cannot set inProcessRecording after preparing.  No-op."];
  }
}

- (void)setShouldOptimizeForNetworkUse:(BOOL)a3
{
  if ([(MIOWriter *)self checkStatus:1768843636])
  {
    self->_shouldOptimizeForNetworkUse = a3;
  }
  else
  {
    [(MIOWriter *)self reportWarning:@"Cannot set shouldOptimizeForNetworkUse after preparing.  No-op."];
  }
}

- (void)setPreferCustomCompression:(BOOL)a3
{
  if ([(MIOWriter *)self checkStatus:1768843636])
  {
    self->_preferCustomCompression = a3;
  }
  else
  {
    [(MIOWriter *)self reportWarning:@"Cannot set preferCustomCompression after preparing.  No-op."];
  }
}

- (void)setEnableAVEHighPerformanceProfile:(BOOL)a3
{
  if ([(MIOWriter *)self checkStatus:1768843636])
  {
    self->_enableAVEHighPerformanceProfile = a3;
  }
  else
  {
    [(MIOWriter *)self reportWarning:@"Cannot set enableAVEHighPerformanceProfile after preparing.  No-op."];
  }
}

- (void)setDefaultFrameRate:(double)a3
{
  if ([(MIOWriter *)self checkStatus:1768843636])
  {
    self->_defaultFrameRate = a3;
  }
  else
  {
    [(MIOWriter *)self reportWarning:@"Cannot set defaultFrameRate after preparing.  No-op."];
  }
}

- (void)setCustomMOVMetadata:(id)a3
{
  id v5 = a3;
  if ([(MIOWriter *)self checkStatus:1768843636]) {
    objc_storeStrong((id *)&self->_customMOVMetadata, a3);
  }
  else {
    [(MIOWriter *)self reportWarning:@"Cannot set customMOVMetadata after preparing.  No-op."];
  }
}

- (void)setBufferCacheMode:(int)a3
{
  if ([(MIOWriter *)self checkStatus:1768843636])
  {
    self->_bufferCacheMode = a3;
  }
  else
  {
    [(MIOWriter *)self reportWarning:@"Cannot set bufferCacheMode after preparing.  No-op."];
  }
}

- (void)setMovieFragmentInterval:(id *)a3
{
  if ([(MIOWriter *)self checkStatus:1768843636])
  {
    long long v5 = *(_OWORD *)&a3->var0;
    self->_movieFragmentInterval.epoch = a3->var3;
    *(_OWORD *)&self->_movieFragmentInterval.value = v5;
  }
  else
  {
    [(MIOWriter *)self reportWarning:@"Cannot set movieFragmentInterval after preparing.  No-op."];
  }
}

- (void)setPreserveSessionStartTime:(BOOL)a3
{
  if ([(MIOWriter *)self checkStatus:1768843636])
  {
    self->_preserveSessionStartTime = a3;
  }
  else
  {
    [(MIOWriter *)self reportWarning:@"Cannot set preserveSessionStartTime after preparing.  No-op."];
  }
}

- (BOOL)canWrite
{
  if ([(MIOWriter *)self checkStatus:1919247481]) {
    return 1;
  }

  return [(MIOWriter *)self checkStatus:1718186856];
}

- (void)setFailHandler:(id)a3
{
  self->_failHandler = (id)MEMORY[0x21D492700](a3, a2);

  MEMORY[0x270F9A758]();
}

- (void)setWarningHandler:(id)a3
{
  self->_warningHandler = (id)MEMORY[0x21D492700](a3, a2);

  MEMORY[0x270F9A758]();
}

- (id)getFailHandler
{
  v2 = (void *)MEMORY[0x21D492700](self->_failHandler, a2);

  return v2;
}

- (id)getWarningHandler
{
  v2 = (void *)MEMORY[0x21D492700](self->_warningHandler, a2);

  return v2;
}

- (void)reportError:(id)a3
{
  id v4 = a3;
  [(MIOWriter *)self fail];
  objc_initWeak(&location, self);
  long long v5 = [(MIOWriter *)self defaultNotificationQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __25__MIOWriter_reportError___block_invoke;
  block[3] = &unk_2643AF8C0;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __25__MIOWriter_reportError___block_invoke(uint64_t a1)
{
  v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  long long v5 = [WeakRetained getFailHandler];

  if (v5)
  {
    id v4 = objc_loadWeakRetained(v2);
    v5[2](v5, v4, *(void *)(a1 + 32));
  }
}

- (void)reportWarning:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v5 = +[MIOLog defaultLog];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v12 = v4;
    _os_log_impl(&dword_21B5ED000, v5, OS_LOG_TYPE_ERROR, "WARNING: %@", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  id v6 = [(MIOWriter *)self defaultNotificationQueue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __27__MIOWriter_reportWarning___block_invoke;
  v8[3] = &unk_2643AF8C0;
  objc_copyWeak(&v10, (id *)buf);
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak((id *)buf);
}

void __27__MIOWriter_reportWarning___block_invoke(uint64_t a1)
{
  v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  long long v5 = [WeakRetained getWarningHandler];

  if (v5)
  {
    id v4 = objc_loadWeakRetained(v2);
    v5[2](v5, v4, *(void *)(a1 + 32));
  }
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timeWithSeconds:(SEL)a3
{
  int32_t v6 = [(MIOWriter *)self baseMediaTimeScale];

  return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMTimeMakeWithSeconds((CMTime *)retstr, a4, v6);
}

- (BOOL)addInput:(id)a3
{
  return [(MIOWriter *)self addInput:a3 error:0];
}

- (BOOL)addInput:(id)a3 error:(id *)a4
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (![(MIOWriter *)self checkStatus:1768843636])
  {
    [MEMORY[0x263F087E8] populateStreamError:a4, @"MIOWriter status not MIOWriterInit, cannot add input.", 13 message code];
    goto LABEL_26;
  }
  inputs = self->_inputs;
  id v8 = [v6 uuid];
  id v9 = [(MIOOrderedKeysMutableMap *)inputs objectForKey:v8];

  if (v9)
  {
    id v10 = NSString;
    uint64_t v11 = [v6 streamId];
    id v12 = [v10 stringWithFormat:@"Stream '%@' with same media type already exists.", v11];

    [MEMORY[0x263F087E8] populateStreamError:a4 message:v12 code:13];
LABEL_26:
    BOOL v25 = 0;
    goto LABEL_27;
  }
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  uint64_t v13 = [v6 underlyingInputs];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v35 objects:v40 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v36;
    while (2)
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v36 != v16) {
          objc_enumerationMutation(v13);
        }
        if (![(MIOWriter *)self addInput:*(void *)(*((void *)&v35 + 1) + 8 * i) error:a4])
        {
LABEL_25:

          goto LABEL_26;
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v35 objects:v40 count:16];
      if (v15) {
        continue;
      }
      break;
    }
  }

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    uint64_t v13 = [(MIOWriter *)self writerInputs];
    uint64_t v18 = [v13 countByEnumeratingWithState:&v31 objects:v39 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v32;
      while (2)
      {
        for (uint64_t j = 0; j != v19; ++j)
        {
          if (*(void *)v32 != v20) {
            objc_enumerationMutation(v13);
          }
          long long v22 = *(void **)(*((void *)&v31 + 1) + 8 * j);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            long long v26 = NSString;
            long long v27 = [v22 streamId];
            uint64_t v28 = [v6 streamId];
            uint64_t v29 = [v26 stringWithFormat:@"Input of type 'MIOWriterTimeRangeMetadataStreamInput' ('%@') was already added. Cannot add input '%@'.", v27, v28];

            [MEMORY[0x263F087E8] populateStreamError:a4 message:v29 code:13];
            goto LABEL_25;
          }
        }
        uint64_t v19 = [v13 countByEnumeratingWithState:&v31 objects:v39 count:16];
        if (v19) {
          continue;
        }
        break;
      }
    }
  }
  dispatch_group_t v23 = self->_inputs;
  uint64_t v24 = [v6 uuid];
  [(MIOOrderedKeysMutableMap *)v23 setObject:v6 forKey:v24];

  BOOL v25 = 1;
LABEL_27:

  return v25;
}

- (void)prepareWriterWithCompletionHandler:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([(MIOWriter *)self checkStatus:1768843636])
  {
    long long v22 = v4;
    [(MIOWriter *)self setStatus:2];
    dispatch_group_t v23 = objc_opt_new();
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v5 = self;
    id v6 = [(MIOWriter *)self writerInputs];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      id v9 = 0;
      uint64_t v10 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v29 != v10) {
            objc_enumerationMutation(v6);
          }
          id v12 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          if ([v12 threadingOption] != 1)
          {
            if ([v12 useOwnWritingThread])
            {
              uint64_t v13 = NSString;
              uint64_t v14 = [v12 streamId];
              uint64_t v15 = [v13 stringWithFormat:@"mio.writing.%@.%ld", v14, objc_msgSend(v12, "mediaType")];

              id v16 = [(MIOWriter *)v5 newWritingThreadWithName:v15];
              [v23 addObject:v16];
            }
            else
            {
              if (!v9)
              {
                long long v17 = [NSString stringWithFormat:@"mio.writing.default"];
                id v9 = [(MIOWriter *)v5 newWritingThreadWithName:v17];
                [v23 addObject:v9];
              }
              id v16 = v9;
              id v9 = v16;
            }
            [v12 setAssignedWritingThread:v16];
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v28 objects:v32 count:16];
      }
      while (v8);
    }
    else
    {
      id v9 = 0;
    }

    uint64_t v19 = [v23 copy];
    writingThreads = v5->_writingThreads;
    v5->_writingThreads = (NSArray *)v19;

    dispatch_queue_t v21 = dispatch_queue_create("mio.writer.prepare", 0);
    objc_initWeak(&location, v5);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __48__MIOWriter_prepareWriterWithCompletionHandler___block_invoke;
    block[3] = &unk_2643AF8E8;
    objc_copyWeak(&v26, &location);
    id v4 = v22;
    void block[4] = v5;
    id v25 = v22;
    dispatch_async(v21, block);

    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
  }
  else
  {
    uint64_t v18 = [MEMORY[0x263F087E8] writerErrorWithMessage:@"Writer not in MIOWriterInit state." code:17];
    [(MIOWriter *)self setStatus:1717660012];
    (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v18);
  }
}

void __48__MIOWriter_prepareWriterWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v85 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x21D4924B0]();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    v59 = v2;
    uint64_t v60 = a1;
    long long v5 = NSURL;
    id v6 = [WeakRetained filePath];
    v63 = [v5 fileURLWithPath:v6];

    uint64_t v7 = [MEMORY[0x263F08850] defaultManager];
    [v7 removeItemAtURL:v63 error:0];

    id v62 = (id)*MEMORY[0x263EF9898];
    uint64_t v8 = [v63 pathExtension];
    id v9 = [v8 lowercaseString];
    int v10 = [v9 isEqual:@"mp4"];

    if (v10)
    {
      id v11 = (id)*MEMORY[0x263EF9888];

      id v12 = +[MIOLog defaultLog];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21B5ED000, v12, OS_LOG_TYPE_INFO, "⚠️⚠️⚠️ WARNING [MOVStreamIO]: Selected output file type is 'mp4'. Be aware that this can and will cause data loss. If you can please use QuickTime Movie('.mov'). ⚠️⚠️⚠️", buf, 2u);
      }

      id v62 = v11;
    }
    id v80 = 0;
    uint64_t v13 = (void *)[objc_alloc(MEMORY[0x263EFA518]) initWithURL:v63 fileType:v62 error:&v80];
    id v14 = v80;
    [v4 setAvWriter:v13];

    if (v14)
    {
      [v4 setStatus:1717660012];
      (*(void (**)(void))(*(void *)(v60 + 40) + 16))();
    }
    else
    {
      if ([*(id *)(v60 + 32) inProcessRecording])
      {
        uint64_t v15 = +[MIOLog defaultLog];
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21B5ED000, v15, OS_LOG_TYPE_INFO, "AVAssetWriter set requiresInProcessOperation = YES", buf, 2u);
        }

        id v16 = [v4 avWriter];
        [v16 setValue:MEMORY[0x263EFFA88] forKey:@"requiresInProcessOperation"];

        long long v17 = [v4 avWriter];
        uint64_t v18 = [v17 valueForKey:@"requiresInProcessOperation"];

        uint64_t v19 = +[MIOLog defaultLog];
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          int v20 = [v18 intValue];
          *(_DWORD *)buf = 67109120;
          int v84 = v20;
          _os_log_impl(&dword_21B5ED000, v19, OS_LOG_TYPE_INFO, "Check AVAssetWriter.requiresInProcessOperation is %d", buf, 8u);
        }
      }
      [v4 movieFragmentInterval];
      if (v79)
      {
        [v4 movieFragmentInterval];
        dispatch_queue_t v21 = [v4 avWriter];
        long long v75 = v77;
        uint64_t v76 = v78;
        [v21 setMovieFragmentInterval:&v75];
      }
      uint64_t v22 = [v4 shouldOptimizeForNetworkUse];
      dispatch_group_t v23 = [v4 avWriter];
      [v23 setShouldOptimizeForNetworkUse:v22];

      long long v73 = 0u;
      long long v74 = 0u;
      long long v71 = 0u;
      long long v72 = 0u;
      uint64_t v24 = [v4 inputs];
      id v25 = [v24 allOrderedKeys];

      id v14 = 0;
      uint64_t v26 = [v25 countByEnumeratingWithState:&v71 objects:v82 count:16];
      if (v26)
      {
        uint64_t v27 = *(void *)v72;
        while (2)
        {
          uint64_t v28 = 0;
          long long v29 = v14;
          do
          {
            if (*(void *)v72 != v27) {
              objc_enumerationMutation(v25);
            }
            uint64_t v30 = *(void *)(*((void *)&v71 + 1) + 8 * v28);
            long long v31 = [v4 inputs];
            long long v32 = [v31 objectForKey:v30];

            id v70 = v29;
            LODWORD(v31) = [v32 prepareInputWithWriter:v4 error:&v70];
            id v14 = v70;

            if (!v31)
            {
              [v4 setStatus:1717660012];
              (*(void (**)(void))(*(void *)(v60 + 40) + 16))();

              goto LABEL_46;
            }

            ++v28;
            long long v29 = v14;
          }
          while (v26 != v28);
          uint64_t v26 = [v25 countByEnumeratingWithState:&v71 objects:v82 count:16];
          if (v26) {
            continue;
          }
          break;
        }
      }

      long long v68 = 0u;
      long long v69 = 0u;
      long long v66 = 0u;
      long long v67 = 0u;
      uint64_t v33 = [v4 inputs];
      obuint64_t j = [v33 allOrderedKeys];

      uint64_t v34 = [obj countByEnumeratingWithState:&v66 objects:v81 count:16];
      if (v34)
      {
        uint64_t v35 = *(void *)v67;
        while (2)
        {
          for (uint64_t i = 0; i != v34; ++i)
          {
            if (*(void *)v67 != v35) {
              objc_enumerationMutation(obj);
            }
            uint64_t v37 = *(void *)(*((void *)&v66 + 1) + 8 * i);
            long long v38 = [v4 inputs];
            v39 = [v38 objectForKey:v37];

            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v40 = v39;
              id v65 = v14;
              int v41 = [v40 establishAssociationsWithError:&v65];
              id v42 = v65;

              if (!v41)
              {
                [v4 setStatus:1717660012];
                (*(void (**)(void))(*(void *)(v60 + 40) + 16))();

                id v14 = v42;
                goto LABEL_46;
              }

              id v14 = v42;
            }
          }
          uint64_t v34 = [obj countByEnumeratingWithState:&v66 objects:v81 count:16];
          if (v34) {
            continue;
          }
          break;
        }
      }

      v43 = [MEMORY[0x263EFA748] mioMovieMetadataItem];
      v44 = [MEMORY[0x263EFF980] arrayWithObject:v43];
      v45 = [v4 customMOVMetadata];
      BOOL v46 = [v45 count] == 0;

      if (!v46)
      {
        v47 = [v4 customMOVMetadata];
        [v44 addObjectsFromArray:v47];
      }
      v48 = [v4 timeRangeMetadataKeyHint];

      if (v48)
      {
        v49 = (void *)MEMORY[0x263EFA748];
        v50 = [v4 timeRangeMetadataKeyHint];
        id v64 = v14;
        v51 = [v49 movMetadataItemWithTimeRangeMetadataKeyHint:v50 error:&v64];
        id v52 = v64;

        if (v51) {
          [v44 addObject:v51];
        }

        id v14 = v52;
      }
      v53 = (void *)[v44 copy];
      uint64_t v54 = [v4 avWriter];
      [(id)v54 setMetadata:v53];

      v55 = [v4 avWriter];
      LOBYTE(v54) = [v55 startWriting];

      if (v54)
      {
        [v4 setStatus:1919247481];
        [v4 startWriting];

        (*(void (**)(void))(*(void *)(v60 + 40) + 16))();
        id v4 = 0;
      }
      else
      {
        [v4 setStatus:1717660012];
        uint64_t v56 = *(void *)(v60 + 40);
        v57 = [v4 avWriter];
        v58 = [v57 error];
        (*(void (**)(uint64_t, void, void *))(v56 + 16))(v56, 0, v58);
      }
    }
LABEL_46:

    v2 = v59;
  }
}

- (void)finishWithCompletionHandler:(id)a3
{
  double finishStepDefaultTimeout = self->_finishStepDefaultTimeout;
  long long v4 = *MEMORY[0x263F01098];
  uint64_t v5 = *(void *)(MEMORY[0x263F01098] + 16);
  [(MIOWriter *)self finishWithTimeout:&v4 endTime:a3 completionHandler:finishStepDefaultTimeout];
}

- (void)finishWithEndTime:(id *)a3 completionHandler:(id)a4
{
  double finishStepDefaultTimeout = self->_finishStepDefaultTimeout;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v5 = *a3;
  [(MIOWriter *)self finishWithTimeout:&v5 endTime:a4 completionHandler:finishStepDefaultTimeout];
}

- (void)finishWithTimeout:(double)a3 completionHandler:(id)a4
{
  long long v4 = *MEMORY[0x263F01098];
  uint64_t v5 = *(void *)(MEMORY[0x263F01098] + 16);
  [(MIOWriter *)self finishWithTimeout:&v4 endTime:a4 completionHandler:a3];
}

- (void)finishWithTimeout:(double)a3 endTime:(id *)a4 completionHandler:(id)a5
{
  id v8 = a5;
  if ([(MIOWriter *)self checkStatus:1919247481])
  {
    [(MIOWriter *)self setStatus:1718186856];
    objc_initWeak(&location, self);
    id v9 = dispatch_queue_create("mio.writer.finish", 0);
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __57__MIOWriter_finishWithTimeout_endTime_completionHandler___block_invoke;
    v11[3] = &unk_2643AF938;
    objc_copyWeak(v13, &location);
    v13[1] = *(id *)&a3;
    long long v14 = *(_OWORD *)&a4->var0;
    int64_t var3 = a4->var3;
    v11[4] = self;
    id v12 = v8;
    dispatch_async(v9, v11);

    objc_destroyWeak(v13);
    objc_destroyWeak(&location);
  }
  else
  {
    int v10 = [MEMORY[0x263F087E8] writerErrorWithMessage:@"Writer not in MIOWriterReady state." code:17];
    (*((void (**)(id, void, void *))v8 + 2))(v8, 0, v10);
  }
}

void __57__MIOWriter_finishWithTimeout_endTime_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v25 = (void *)MEMORY[0x21D4924B0]();
    NSLog(&cfstr_Finish0Process.isa);
    v1 = dispatch_group_create();
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    v2 = [WeakRetained inputs];
    objc_super v3 = [v2 allValues];

    uint64_t v4 = [v3 countByEnumeratingWithState:&v39 objects:v48 count:16];
    if (v4)
    {
      uint64_t v5 = *(void *)v40;
      do
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v40 != v5) {
            objc_enumerationMutation(v3);
          }
          [*(id *)(*((void *)&v39 + 1) + 8 * i) finishProcessingInDispatchGroup:v1];
        }
        uint64_t v4 = [v3 countByEnumeratingWithState:&v39 objects:v48 count:16];
      }
      while (v4);
    }

    dispatch_time_t v7 = dispatch_time(0, (uint64_t)(*(double *)(a1 + 56) * 1000000000.0));
    if (dispatch_group_wait(v1, v7)) {
      NSLog(&cfstr_CouldNotDrainT.isa);
    }
    NSLog(&cfstr_Finish1Fifos.isa);
    [WeakRetained setDrainWritingThreads:1];
    [WeakRetained signalWritingThreadsProceed];
    id v8 = WeakRetained[10];
    dispatch_time_t v9 = dispatch_time(0, (uint64_t)(*(double *)(a1 + 56) * 1000000000.0));
    if (dispatch_group_wait(v8, v9))
    {
      NSLog(&cfstr_CouldNotDrainT_0.isa);
      [WeakRetained setForceFinishWritingThreads:1];
      [WeakRetained signalWritingThreadsProceed];
    }
    if (*(unsigned char *)(a1 + 76))
    {
      int v10 = [WeakRetained avWriter];
      long long v37 = *(_OWORD *)(a1 + 64);
      uint64_t v38 = *(void *)(a1 + 80);
      [v10 endSessionAtSourceTime:&v37];
    }
    NSLog(&cfstr_Finish2ShutDow.isa);
    context = (void *)MEMORY[0x21D4924B0]();
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v11 = [WeakRetained inputs];
    id v12 = [v11 allValues];

    uint64_t v13 = [v12 countByEnumeratingWithState:&v33 objects:v47 count:16];
    if (v13)
    {
      long long v14 = 0;
      uint64_t v15 = *(void *)v34;
      do
      {
        for (uint64_t j = 0; j != v13; ++j)
        {
          if (*(void *)v34 != v15) {
            objc_enumerationMutation(v12);
          }
          long long v17 = *(void **)(*((void *)&v33 + 1) + 8 * j);
          id v32 = v14;
          char v18 = [v17 shutDownOutError:&v32];
          id v19 = v32;

          long long v14 = v19;
          if ((v18 & 1) == 0)
          {
            int v20 = +[MIOLog defaultLog];
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            {
              dispatch_queue_t v21 = [v17 streamId];
              *(_DWORD *)buf = 138543618;
              v44 = v21;
              __int16 v45 = 2114;
              id v46 = v19;
              _os_log_impl(&dword_21B5ED000, v20, OS_LOG_TYPE_ERROR, "Error on shutdown %{public}@ : %{public}@", buf, 0x16u);
            }
          }
        }
        uint64_t v13 = [v12 countByEnumeratingWithState:&v33 objects:v47 count:16];
      }
      while (v13);

      if (v19)
      {
        [WeakRetained setStatus:1717660012];
        (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
LABEL_30:

        goto LABEL_31;
      }
    }
    else
    {
    }
    NSLog(&cfstr_Finish3Avasset.isa);
    uint64_t v22 = [WeakRetained avWriter];
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __57__MIOWriter_finishWithTimeout_endTime_completionHandler___block_invoke_112;
    v28[3] = &unk_2643AF910;
    long long v29 = WeakRetained;
    id v23 = *(id *)(a1 + 40);
    uint64_t v30 = *(void *)(a1 + 32);
    id v31 = v23;
    [v22 finishWritingWithCompletionHandler:v28];

    long long v14 = v29;
    goto LABEL_30;
  }
LABEL_31:
}

void __57__MIOWriter_finishWithTimeout_endTime_completionHandler___block_invoke_112(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) avWriter];
  uint64_t v3 = [v2 status];

  if (v3 == 3)
  {
    [*(id *)(a1 + 32) setStatus:1717660012];
    uint64_t v4 = *(void *)(a1 + 48);
    id v12 = [*(id *)(a1 + 32) avWriter];
    uint64_t v5 = [v12 error];
    (*(void (**)(uint64_t, void, void *))(v4 + 16))(v4, 0, v5);
  }
  else
  {
    if ([*(id *)(a1 + 40) preserveSessionStartTime])
    {
      id v6 = *(void **)(a1 + 32);
      if (v6)
      {
        [v6 sessionStartTime];
        id v6 = *(void **)(a1 + 32);
      }
      else
      {
        memset(v14, 0, sizeof(v14));
      }
      dispatch_time_t v7 = [v6 avWriter];
      id v8 = [v7 outputURL];
      id v13 = 0;
      BOOL v9 = +[MOVStreamIOUtility saveSessionStartTime:v14 toMovieAtURL:v8 error:&v13];
      id v10 = v13;

      if (!v9)
      {
        id v11 = +[MIOLog defaultLog];
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          id v16 = v10;
          _os_log_impl(&dword_21B5ED000, v11, OS_LOG_TYPE_ERROR, "Error on saving session start time: %{public}@", buf, 0xCu);
        }
      }
    }
    [*(id *)(a1 + 32) setStatus:1685024357];
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (void)cancelRecordingWithCompletionHandler:(id)a3
{
  id v4 = a3;
  if ([(MIOWriter *)self checkStatus:1919247481])
  {
    [(MIOWriter *)self setStatus:1718186856];
    double finishStepDefaultTimeout = self->_finishStepDefaultTimeout;
    objc_initWeak(&location, self);
    id v6 = dispatch_queue_create("mio.writer.cancel", 0);
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __50__MIOWriter_cancelRecordingWithCompletionHandler___block_invoke;
    v7[3] = &unk_2643AF960;
    objc_copyWeak(v9, &location);
    v9[1] = *(id *)&finishStepDefaultTimeout;
    id v8 = v4;
    dispatch_async(v6, v7);

    objc_destroyWeak(v9);
    objc_destroyWeak(&location);
  }
}

void __50__MIOWriter_cancelRecordingWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v3 = (void *)MEMORY[0x21D4924B0]();
    NSLog(&cfstr_Cancel0Process.isa);
    id v4 = dispatch_group_create();
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    uint64_t v5 = [WeakRetained inputs];
    id v6 = [v5 allValues];

    uint64_t v7 = [v6 countByEnumeratingWithState:&v26 objects:v31 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v27;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v27 != v9) {
            objc_enumerationMutation(v6);
          }
          [*(id *)(*((void *)&v26 + 1) + 8 * v10++) finishProcessingInDispatchGroup:v4];
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v26 objects:v31 count:16];
      }
      while (v8);
    }

    dispatch_time_t v11 = dispatch_time(0, (uint64_t)(*(double *)(a1 + 48) * 1000000000.0));
    if (dispatch_group_wait(v4, v11)) {
      NSLog(&cfstr_CouldNotDrainT.isa);
    }
    NSLog(&cfstr_Cancel1Invalid.isa);
    id v12 = (void *)MEMORY[0x21D4924B0]();
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v13 = objc_msgSend(WeakRetained, "inputs", 0);
    long long v14 = [v13 allValues];

    uint64_t v15 = [v14 countByEnumeratingWithState:&v22 objects:v30 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v23;
      do
      {
        uint64_t v18 = 0;
        do
        {
          if (*(void *)v23 != v17) {
            objc_enumerationMutation(v14);
          }
          [*(id *)(*((void *)&v22 + 1) + 8 * v18++) invalidate];
        }
        while (v16 != v18);
        uint64_t v16 = [v14 countByEnumeratingWithState:&v22 objects:v30 count:16];
      }
      while (v16);
    }

    [WeakRetained setForceFinishWritingThreads:1];
    [WeakRetained signalWritingThreadsProceed];
    id v19 = WeakRetained[10];
    dispatch_time_t v20 = dispatch_time(0, (uint64_t)(*(double *)(a1 + 48) * 1000000000.0));
    if (dispatch_group_wait(v19, v20)) {
      NSLog(&cfstr_CouldNotCloseW.isa);
    }
    NSLog(&cfstr_Cancel2Avasset.isa);
    dispatch_queue_t v21 = [WeakRetained avWriter];
    [v21 cancelWriting];

    [WeakRetained setStatus:1668178796];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)proposeSessionStartTime:(id *)a3
{
  if ((self->_sessionStartTime.timescale & 1) == 0)
  {
    long long v3 = *(_OWORD *)&a3->var0;
    *(void *)&self->_sessionStartTime.flags = a3->var3;
    *(_OWORD *)(&self->_sessionStarted + 4) = v3;
  }
}

- (BOOL)startSession
{
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_sessionStarted)
  {
    [(MIOWriter *)v2 sessionStartTime];
    if ((v7[36] & 0x1D) != 1)
    {
      id v6 = [MEMORY[0x263F087E8] writerErrorWithMessage:@"Writer invalid sessionStartTime, startSession failed.", 16 code];
      [(MIOWriter *)v2 reportError:v6];

      BOOL v4 = 0;
      goto LABEL_5;
    }
    v2->_sessionStarted = 1;
    avWriter = v2->_avWriter;
    [(MIOWriter *)v2 sessionStartTime];
    [(AVAssetWriter *)avWriter startSessionAtSourceTime:v7];
  }
  BOOL v4 = 1;
LABEL_5:
  objc_sync_exit(v2);

  return v4;
}

- (void)fail
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  [(MIOWriter *)self setStatus:1717660012];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v3 = [(MIOOrderedKeysMutableMap *)self->_inputs allValues];
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
        [*(id *)(*((void *)&v8 + 1) + 8 * v7++) invalidate];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)signalWritingThreadsProceed
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = self->_writingThreads;
  uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "proceed", (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [(NSArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (id)newWritingThreadWithName:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  uint64_t v5 = [MIOThread alloc];
  uint64_t v8 = MEMORY[0x263EF8330];
  uint64_t v9 = 3221225472;
  long long v10 = __38__MIOWriter_newWritingThreadWithName___block_invoke;
  long long v11 = &unk_2643AF4E0;
  objc_copyWeak(&v12, &location);
  uint64_t v6 = [(MIOThread *)v5 initWithName:v4 block:&v8];
  -[MIOThread setQualityOfService:](v6, "setQualityOfService:", 33, v8, v9, v10, v11);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

  return v6;
}

void __38__MIOWriter_newWritingThreadWithName___block_invoke(uint64_t a1)
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F08B88] currentThread];
  uint64_t v3 = [v2 perfLogHandle];
  os_signpost_id_t spid = os_signpost_id_generate(v3);
  __int16 v45 = v3;
  os_signpost_id_t v46 = os_signpost_id_generate(v3);
  if (([MEMORY[0x263F08B88] setThreadPriority:1.0] & 1) == 0)
  {
    id v4 = +[MIOLog defaultLog];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21B5ED000, v4, OS_LOG_TYPE_ERROR, "Cannot set writing thread priority to 1.0. Continue with default priority...", buf, 2u);
    }
  }
  uint64_t v5 = (void *)MEMORY[0x21D4924B0]();
  id location = (id *)(a1 + 32);
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    long long v7 = WeakRetained;
    group = WeakRetained[10];
    dispatch_group_enter(group);
    int v8 = [v7 canWrite];

    if (v8)
    {
      unint64_t v9 = spid - 1;
      unint64_t v10 = v46 - 1;
      unint64_t v44 = spid - 1;
      while (1)
      {
        long long v11 = v45;
        id v12 = v11;
        if (v9 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_21B5ED000, v12, OS_SIGNPOST_INTERVAL_BEGIN, spid, "mio.write.thread", (const char *)&unk_21B668A56, buf, 2u);
        }

        v47 = v12;
        while (1)
        {
          uint64_t v13 = v12;
          long long v14 = v13;
          if (v10 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_21B5ED000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v46, "mio.write.fifo.samples", (const char *)&unk_21B668A56, buf, 2u);
          }

          uint64_t v15 = (void *)MEMORY[0x21D4924B0]();
          id v16 = objc_loadWeakRetained(location);
          if (!v16) {
            break;
          }
          context = v15;
          v51 = v14;
          long long v55 = 0u;
          long long v56 = 0u;
          long long v53 = 0u;
          long long v54 = 0u;
          uint64_t v49 = v16;
          uint64_t v17 = [v16 inputs];
          uint64_t v18 = [v17 allValues];

          uint64_t v19 = [v18 countByEnumeratingWithState:&v53 objects:v58 count:16];
          if (v19)
          {
            uint64_t v20 = v19;
            char v21 = 0;
            uint64_t v22 = *(void *)v54;
            BOOL v52 = 1;
            do
            {
              for (uint64_t i = 0; i != v20; ++i)
              {
                if (*(void *)v54 != v22) {
                  objc_enumerationMutation(v18);
                }
                long long v24 = *(void **)(*((void *)&v53 + 1) + 8 * i);
                long long v25 = objc_msgSend(v24, "assignedWritingThread", group);

                if (v25 == v2)
                {
                  long long v26 = v2;
                  long long v27 = (void *)MEMORY[0x21D4924B0]();
                  long long v28 = [v24 fifoBuffer];
                  uint64_t v29 = [v28 usage];

                  if (v29)
                  {
                    if ([v24 writeNextItemFromFifo]) {
                      char v21 = 1;
                    }
                    if (v52)
                    {
                      uint64_t v30 = [v24 fifoBuffer];
                      BOOL v52 = [v30 usage] == 0;
                    }
                    else
                    {
                      BOOL v52 = 0;
                    }
                  }
                  v2 = v26;
                }
              }
              uint64_t v20 = [v18 countByEnumeratingWithState:&v53 objects:v58 count:16];
            }
            while (v20);
          }
          else
          {
            char v21 = 0;
            BOOL v52 = 1;
          }

          long long v14 = v51;
          id v31 = v51;
          uint64_t v32 = v31;
          unint64_t v10 = v46 - 1;
          if (v46 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v31))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_21B5ED000, v32, OS_SIGNPOST_INTERVAL_END, v46, "mio.write.fifo.samples", (const char *)&unk_21B668A56, buf, 2u);
          }

          id v12 = v47;
          if ((v21 & 1) == 0) {
            goto LABEL_39;
          }
        }
        BOOL v52 = 1;
LABEL_39:
        long long v33 = (void *)MEMORY[0x21D4924B0]();
        id v34 = objc_loadWeakRetained(location);
        long long v35 = v34;
        if (!v34) {
          break;
        }
        if ([v34 drainWritingThreads] && v52)
        {
          long long v39 = v14;
          if (v44 <= 0xFFFFFFFFFFFFFFFDLL)
          {
            long long v40 = v39;
            if (os_signpost_enabled(v39))
            {
              *(_WORD *)buf = 0;
              goto LABEL_55;
            }
          }
LABEL_56:

          break;
        }
        unint64_t v9 = spid - 1;
        if (objc_msgSend(v35, "forceFinishWritingThreads", group))
        {
          long long v41 = v14;
          if (v44 <= 0xFFFFFFFFFFFFFFFDLL)
          {
            long long v40 = v41;
            if (os_signpost_enabled(v41))
            {
              *(_WORD *)buf = 0;
LABEL_55:
              _os_signpost_emit_with_name_impl(&dword_21B5ED000, v40, OS_SIGNPOST_INTERVAL_END, spid, "mio.write.thread", (const char *)&unk_21B668A56, buf, 2u);
            }
          }
          goto LABEL_56;
        }
        [v2 waitWithTimeout:30.0];
        long long v36 = v14;
        long long v37 = v36;
        if (v44 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v36))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_21B5ED000, v37, OS_SIGNPOST_INTERVAL_END, spid, "mio.write.thread", (const char *)&unk_21B668A56, buf, 2u);
        }

        char v38 = [v35 canWrite];
        if ((v38 & 1) == 0) {
          goto LABEL_58;
        }
      }
    }
LABEL_58:
    dispatch_group_leave(group);
  }
  else
  {
  }
}

- (BOOL)startWriting
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  BOOL v3 = [(MIOWriter *)self canWrite];
  if (v3)
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v4 = self->_writingThreads;
    uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v10 objects:v15 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v11;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(v4);
          }
          objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "start", (void)v10);
        }
        uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v10 objects:v15 count:16];
      }
      while (v6);
    }
  }
  else
  {
    id v4 = +[MIOLog defaultLog];
    if (os_log_type_enabled(&v4->super, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21B5ED000, &v4->super, OS_LOG_TYPE_INFO, "startWriting canceled because writer is not in state that allows writing.", buf, 2u);
    }
  }

  return v3;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"MIOWriter {\n Filepath: %@ \n}", self->_filePath];
}

- (void)simulateFailure
{
  id v3 = [MEMORY[0x263F087E8] streamErrorWithMessage:@"SIMULATED ERROR FOR TESTING" code:0];
  [(MIOWriter *)self reportError:v3];
}

- (int)baseMediaTimeScale
{
  return self->_baseMediaTimeScale;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)sessionStartTime
{
  *(_OWORD *)&retstr->var0 = *(_OWORD *)((char *)&self->var3 + 4);
  retstr->int64_t var3 = *(void *)&self[1].var2;
  return self;
}

- (BOOL)realTime
{
  return self->_realTime;
}

- (BOOL)inProcessRecording
{
  return self->_inProcessRecording;
}

- (BOOL)shouldOptimizeForNetworkUse
{
  return self->_shouldOptimizeForNetworkUse;
}

- (BOOL)preferCustomCompression
{
  return self->_preferCustomCompression;
}

- (BOOL)enableAVEHighPerformanceProfile
{
  return self->_enableAVEHighPerformanceProfile;
}

- (double)defaultFrameRate
{
  return self->_defaultFrameRate;
}

- (NSArray)customMOVMetadata
{
  return self->_customMOVMetadata;
}

- (int)bufferCacheMode
{
  return self->_bufferCacheMode;
}

- (NSString)timeRangeMetadataKeyHint
{
  return self->_timeRangeMetadataKeyHint;
}

- (void)setTimeRangeMetadataKeyHint:(id)a3
{
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)movieFragmentInterval
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 176);
  return self;
}

- (BOOL)preserveSessionStartTime
{
  return self->_preserveSessionStartTime;
}

- (NSString)filePath
{
  return (NSString *)objc_getProperty(self, a2, 152, 1);
}

- (OS_dispatch_queue)defaultNotificationQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 160, 1);
}

- (void)setDefaultNotificationQueue:(id)a3
{
}

- (AVAssetWriter)avWriter
{
  return (AVAssetWriter *)objc_getProperty(self, a2, 8, 1);
}

- (void)setAvWriter:(id)a3
{
}

- (BOOL)drainWritingThreads
{
  return self->_drainWritingThreads;
}

- (void)setDrainWritingThreads:(BOOL)a3
{
  self->_drainWritingThreads = a3;
}

- (BOOL)forceFinishWritingThreads
{
  return self->_forceFinishWritingThreads;
}

- (void)setForceFinishWritingThreads:(BOOL)a3
{
  self->_forceFinishWritingThreads = a3;
}

- (MIOOrderedKeysMutableMap)inputs
{
  return (MIOOrderedKeysMutableMap *)objc_getProperty(self, a2, 168, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputs, 0);
  objc_storeStrong((id *)&self->_defaultNotificationQueue, 0);
  objc_storeStrong((id *)&self->_filePath, 0);
  objc_storeStrong((id *)&self->_timeRangeMetadataKeyHint, 0);
  objc_storeStrong((id *)&self->_customMOVMetadata, 0);
  objc_storeStrong((id *)&self->_statusQueue, 0);
  objc_storeStrong((id *)&self->_movieMetadataUtility, 0);
  objc_storeStrong((id *)&self->_writingThreadsGroup, 0);
  objc_storeStrong((id *)&self->_writingThreads, 0);
  objc_storeStrong(&self->_warningHandler, 0);
  objc_storeStrong(&self->_failHandler, 0);

  objc_storeStrong((id *)&self->_avWriter, 0);
}

@end