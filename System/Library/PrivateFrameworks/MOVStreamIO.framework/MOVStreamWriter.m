@interface MOVStreamWriter
+ (id)getMOVStreamIOMetadataItem;
+ (id)getTimeRangeMetadataKeyHintMetadataItem:(id)a3 error:(id *)a4;
+ (unsigned)getPixelFormatFromStreamData:(StreamRecordingData *)a3;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)movieFragmentInterval;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)sessionStartTime;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timeWithSeconds:(SEL)a3;
- (BOOL)activateNewState:(id)a3 byEvent:(id)a4;
- (BOOL)canWriteData;
- (BOOL)checkIfFifoAreEmpty;
- (BOOL)enableAVEHighPerformanceProfile;
- (BOOL)encoder:(id)a3 configureSessionOverride:(OpaqueVTCompressionSession *)a4 streamId:(id)a5;
- (BOOL)fifoDropsEnabled:(StreamRecordingData *)a3;
- (BOOL)finalConsume;
- (BOOL)finishingMode;
- (BOOL)inProcessRecording;
- (BOOL)isAudioStream:(StreamRecordingData *)a3;
- (BOOL)isCustomTrackMetadataCompatibleObject:(id)a3;
- (BOOL)isOrWasCanceled;
- (BOOL)isReadyForMoreDataForStreamId:(id)a3 fromMap:(void *)a4;
- (BOOL)legacyKeysMode;
- (BOOL)marksOutputTracksAsEnabledForStream:()basic_string<char fromMap:()std:(std::allocator<char>> *)a3 :char_traits<char>;
- (BOOL)multiplexWritingDisabled;
- (BOOL)preserveSessionStartTime;
- (BOOL)relateStream:(id)a3 toStream:(id)a4 relationSpecifier:(id)a5;
- (BOOL)relateStream:(id)a3 toStream:(id)a4 relationSpecifier:(id)a5 error:(id *)a6;
- (BOOL)setExpectedFrameRate:(double)a3;
- (BOOL)setMediaTimeScale:(int)a3 forMetadataStream:(id)a4 error:(id *)a5;
- (BOOL)setMediaTimeScale:(int)a3 forStream:(id)a4 error:(id *)a5;
- (BOOL)setRealTimeCapture:(BOOL)a3;
- (BOOL)setShouldOptimizeForNetworkUse:(BOOL)a3;
- (BOOL)setTrackMetadata:(id)a3 forMetadataStream:(id)a4;
- (BOOL)setTrackMetadata:(id)a3 forMetadataStream:(id)a4 error:(id *)a5;
- (BOOL)setTrackMetadata:(id)a3 forStream:(id)a4;
- (BOOL)setTrackMetadata:(id)a3 forStream:(id)a4 error:(id *)a5;
- (BOOL)setTrackMetadataItems:(id)a3 forStream:(id)a4 error:(id *)a5;
- (BOOL)setVideoTransform:(CGAffineTransform *)a3;
- (BOOL)setVideoTransformFromOrientation:(int)a3;
- (BOOL)setWritingThreadPriority:(double)a3 error:(id *)a4;
- (BOOL)shouldOptimizeForNetworkUse;
- (BOOL)startSessionWithFallbackSampleTime:(id *)a3 streamId:(id)a4 mediaType:(int64_t)a5 writerDelegate:(id)a6 delegateCallbackQueue:(id)a7 error:(id *)a8;
- (BOOL)writeVideoFrameStreamAttachmentsData:(id)a3 toMetadataAdaptor:(id)a4 ofStream:(id)a5 signpost:(unint64_t)a6;
- (CGAffineTransform)getVideoTransformForStream:(SEL)a3;
- (MIOMovieMetadataUtility)movieMetadataUtility;
- (MOVStreamCustomEncoderConfigDelegate)customEncoderConfigDelegate;
- (MOVStreamWriter)initWithURL:(id)a3 andExpectedFrameRate:(double)a4;
- (MOVStreamWriterDelegate)delegate;
- (MOVStreamWriterState)state;
- (NSArray)movMetadataItems;
- (NSError)criticalError;
- (NSString)timeRangeMetadataKeyHint;
- (double)finishingTimeout;
- (double)getExpectedFrameRateForStream:(id)a3;
- (double)writingThreadPriority;
- (id).cxx_construct;
- (id)createRelatedToStreamMetadata:(id)a3;
- (id)createRelationSpecifierMetadata:(id)a3;
- (id)customMetadataTrackMetadataForStream:(id)a3 fromMap:(void *)a4;
- (id)customTrackMetadataForStream:(id)a3 fromMap:(void *)a4;
- (id)encoder:(id)a3 overrideVideoEncoderSpecificationForStreamId:(id)a4;
- (id)getAudioMetadataForBuffer:(opaqueCMSampleBuffer *)a3;
- (id)getLegacyTrackEncodedPixelFormatMetadataForStream:(id)a3 fromMap:(void *)a4;
- (id)getLegacyTrackInputPixelFormatMetadataForStream:(id)a3 fromMap:(void *)a4;
- (id)getLegacyTrackMetadataForAttachmentsSerializationMode:(id)a3 fromMap:(void *)a4;
- (id)getLegacyTrackMetadataForStream:(id)a3;
- (id)getMetadataGroupForBuffer:(__CVBuffer *)a3 stream:(id)a4 presentationTime:(id *)a5 serializationMode:(int)a6;
- (id)getTrackEncodedPixelFormatMetadataForStream:(id)a3 fromMap:(void *)a4;
- (id)getTrackInputPixelFormatMetadataForStream:(id)a3 fromMap:(void *)a4;
- (id)getTrackMetadataForAttachmentsSerializationMode:(id)a3 fromMap:(void *)a4;
- (id)getTrackMetadataForExactBytesPerRow:(id)a3 fromMap:(void *)a4 error:(id *)a5;
- (id)getTrackMetadataForRawBayerRearrangeType:(id)a3 fromMap:(void *)a4;
- (id)getTrackMetadataForStream:(id)a3;
- (id)getTrackMetadataForTimeRangeMetadata:(id)a3 fromMap:(void *)a4;
- (id)getTrackMetadataForTrackTypeInfo:(id)a3 fromMap:(void *)a4;
- (id)startWritingThreadForMetadata;
- (id)startWritingThreadForNonMetadataOnlyThreadId:(unsigned __int8)a3;
- (int)attachmentSerializationModeForStream:()basic_string<char withDefaultMode:()std:(std::allocator<char>> *)a3 :char_traits<char>;
- (int)attachmentSerializationModeForStream:()basic_string<char withDefaultMode:()std:(std::allocator<char>> *)a3 :char_traits<char> fromMap:;
- (int)baseMediaTimeScale;
- (int)bufferCacheMode;
- (int)encoderTypeForStream:(id)a3;
- (int)getCountByPriorityForFifo:(unint64_t)a3 capacity:(unint64_t)a4;
- (int64_t)status;
- (opaqueCMFormatDescription)createMetadataFormatDescription:(id)a3;
- (unint64_t)defaultAudioWritingBufferCapacity;
- (unint64_t)defaultMetadataWritingBufferCapacity;
- (unint64_t)defaultWritingBufferCapacity;
- (unint64_t)fifoBufferSizeForStream:(id)a3;
- (unint64_t)writeThreadCount;
- (unint64_t)writingBufferCapacityForAudioStream:(id)a3;
- (unint64_t)writingBufferCapacityForMetadataStream:(id)a3;
- (unint64_t)writingBufferCapacityForStream:(id)a3;
- (unint64_t)writingBufferUsageForAudioStream:(id)a3;
- (unint64_t)writingBufferUsageForMetadataStream:(id)a3;
- (unint64_t)writingBufferUsageForStream:(id)a3;
- (unint64_t)writingThreadsCount;
- (unsigned)encoder:(id)a3 codecTypeOverrideForstreamId:(id)a4;
- (unsigned)getPixelFormatForStream:(id)a3 fromMap:(void *)a4;
- (void)addAudioTrackForStreamWithIdentifier:(id)a3 audioFormat:(id)a4 additionalSettings:(id)a5;
- (void)addIsReadyObservers;
- (void)addMetadataTrack:(id)a3;
- (void)addMetadataTrack:(id)a3 copyData:(BOOL)a4;
- (void)addMetadataTrack:(id)a3 formatDescription:(opaqueCMFormatDescription *)a4;
- (void)addMetadataTrackAssociatedWith:(id)a3 withIdentifier:(id)a4 withFormatDescription:(opaqueCMFormatDescription *)a5;
- (void)addTimeRangeMetadataTrack:(id)a3;
- (void)addTrackForStreamWithIdentifier:(id)a3 formatDescription:(opaqueCMFormatDescription *)a4 recordingConfiguration:(id)a5;
- (void)appendAudioBuffer:(opaqueCMSampleBuffer *)a3 forStream:(id)a4;
- (void)appendMetadata:(id)a3 associatedWith:(id)a4 toStream:(id)a5;
- (void)appendMetadata:(id)a3 withTimeStamp:(id *)a4 toStream:(id)a5;
- (void)appendPixelBuffer:(__CVBuffer *)a3 presentationTime:(id *)a4 toStreamId:(id)a5;
- (void)appendSampleBuffer:(opaqueCMSampleBuffer *)a3 attachments:(id)a4 streamId:(id)a5;
- (void)appendTimeCode:(CVSMPTETime *)a3 startTime:(unint64_t)a4 endTime:(unint64_t)a5 withTimeStamp:(id *)a6 toStream:(id)a7;
- (void)appendTimeMetadataGroup:(id)a3 toStream:(id)a4;
- (void)appendVideoSampleBuffer:(opaqueCMSampleBuffer *)a3 attachmentMetadata:(id)a4 streamId:(id)a5;
- (void)asyncWriteAssociatedMetadata:(id)a3 metadataKey:()basic_string<char associatedStreamKey:()std:(std::allocator<char>> *)a4 :char_traits<char>;
- (void)cancelRecording;
- (void)cancelTimeoutBlock;
- (void)checkForFinishing;
- (void)clearAllFifoQueues;
- (void)closeEncodersAfterFailure;
- (void)consumeMetadatOfMetadataStream:(id)a3;
- (void)consumeSamplesOfVideoAudioStream:(id)a3;
- (void)dealloc;
- (void)deleteFileOnCancel;
- (void)deleteMOVFile;
- (void)encoder:(id)a3 encodedSampleBuffer:(opaqueCMSampleBuffer *)a4 metadata:(id)a5 presentationTime:(id *)a6 streamId:(id)a7;
- (void)encoder:(id)a3 encodingFailedForStream:(id)a4;
- (void)executePrepareToRecordWithMovieMetadata:(id)a3;
- (void)finishAVWriter;
- (void)finishAndDrainFifoFirst;
- (void)finishRecording;
- (void)forceFinishRecording;
- (void)informDelegateAboutError:(id)a3;
- (void)informDelegateAboutFinishingTimeout;
- (void)informDelegateAboutIsReady:(BOOL)a3 forStream:(id)a4;
- (void)informDelegateAboutMediaWrittenForStream:(id)a3 mediaType:(int64_t)a4;
- (void)logFifoUsage;
- (void)newSampleReady:(opaqueCMSampleBuffer *)a3 metadata:(id)a4 presentationTime:(id *)a5 streamKey:()basic_string<char streamId:()std:(std::allocator<char>> *)a6 :char_traits<char> isAudioSample:;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)prepareToRecord;
- (void)prepareToRecordWithMovieMetadata:(id)a3;
- (void)processCancelRecording;
- (void)processFinishRecording;
- (void)processForceFinishRecording;
- (void)queueMetadataGroup:(id)a3 stream:(id)a4;
- (void)removeIsReadyObservers;
- (void)resetTimeoutRefTime;
- (void)resubmitTimeoutBlock;
- (void)setBaseMediaTimeScale:(int)a3;
- (void)setBufferCacheMode:(int)a3;
- (void)setCanWriteData:(BOOL)a3;
- (void)setCriticalError:(id)a3;
- (void)setCustomEncoderConfigDelegate:(id)a3;
- (void)setDefaultAudioWritingBufferCapacity:(unint64_t)a3;
- (void)setDefaultMetadataWritingBufferCapacity:(unint64_t)a3;
- (void)setDefaultWritingBufferCapacity:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setDelegate:(id)a3 callbackQueue:(id)a4;
- (void)setFifoBufferCapacity:(unint64_t)a3;
- (void)setFinalConsume:(BOOL)a3;
- (void)setFinishingMode:(BOOL)a3;
- (void)setFinishingTimeout:(double)a3;
- (void)setInProcessRecording:(BOOL)a3;
- (void)setIsOrWasCanceled:(BOOL)a3;
- (void)setLegacyKeysMode:(BOOL)a3;
- (void)setMovMetadataItems:(id)a3;
- (void)setMovieFragmentInterval:(id *)a3;
- (void)setMultiplexWritingDisabled:(BOOL)a3;
- (void)setPreserveSessionStartTime:(BOOL)a3;
- (void)setSessionStartTime:(id *)a3;
- (void)setState:(id)a3;
- (void)setTimeRangeMetadataKeyHint:(id)a3;
- (void)setWriteThreadCount:(unint64_t)a3;
- (void)setWritingBufferCapacity:(unint64_t)a3 forAudioStream:(id)a4;
- (void)setWritingBufferCapacity:(unint64_t)a3 forMetadataStream:(id)a4;
- (void)setWritingBufferCapacity:(unint64_t)a3 forStream:(id)a4;
- (void)setupAssetWriterStreamInputsWithError:(id *)a3;
- (void)setupAssociatedMetadataInputsWithError:(id *)a3;
- (void)setupMetadataInputsWithError:(id *)a3;
- (void)simulateFailure;
- (void)startFinishingTimeoutTimer;
- (void)startWritingThread;
- (void)triggerWritingThread;
- (void)writeMetadata:(id)a3 forStreamId:(id)a4;
- (void)writeSampleBuffer:(opaqueCMSampleBuffer *)a3 andMetadata:(id)a4 forStreamId:(id)a5 signpost:(unint64_t)a6;
- (void)writerStatusChanged:(int64_t)a3 writerDelegate:(id)a4 delegateCallbackQueue:(id)a5;
- (void)writingSessionDidStartAtTime:(id *)a3 streamId:(id)a4 mediaType:(int64_t)a5 writerDelegate:(id)a6 delegateCallbackQueue:(id)a7;
@end

@implementation MOVStreamWriter

- (void)writerStatusChanged:(int64_t)a3 writerDelegate:(id)a4 delegateCallbackQueue:(id)a5
{
  id v8 = a4;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __86__MOVStreamWriter_Delegate__writerStatusChanged_writerDelegate_delegateCallbackQueue___block_invoke;
  block[3] = &unk_2643AF620;
  id v11 = v8;
  v12 = self;
  int64_t v13 = a3;
  id v9 = v8;
  dispatch_async((dispatch_queue_t)a5, block);
}

void __86__MOVStreamWriter_Delegate__writerStatusChanged_writerDelegate_delegateCallbackQueue___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x21D4924B0]();
  if (objc_opt_respondsToSelector())
  {
    [*(id *)(a1 + 32) streamWriter:*(void *)(a1 + 40) changedStatusTo:*(void *)(a1 + 48)];
  }
  else
  {
    switch(*(void *)(a1 + 48))
    {
      case 3:
        if (objc_opt_respondsToSelector()) {
          [*(id *)(a1 + 32) streamWriterDidFinishPreparing];
        }
        break;
      case 5:
        if (objc_opt_respondsToSelector()) {
          [*(id *)(a1 + 32) streamWriterDidFinishRecording];
        }
        break;
      case 7:
        if (objc_opt_respondsToSelector()) {
          [*(id *)(a1 + 32) streamWriterDidCancelRecording:*(void *)(a1 + 40)];
        }
        break;
      case 8:
        if (objc_opt_respondsToSelector())
        {
          v3 = *(void **)(a1 + 32);
          v4 = [*(id *)(a1 + 40) criticalError];
          [v3 streamWriterDidFailWithError:v4];
        }
        break;
      default:
        break;
    }
  }
}

- (void)writingSessionDidStartAtTime:(id *)a3 streamId:(id)a4 mediaType:(int64_t)a5 writerDelegate:(id)a6 delegateCallbackQueue:(id)a7
{
  id v12 = a4;
  id v13 = a6;
  v14 = a7;
  if (objc_opt_respondsToSelector())
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __114__MOVStreamWriter_Delegate__writingSessionDidStartAtTime_streamId_mediaType_writerDelegate_delegateCallbackQueue___block_invoke;
    block[3] = &unk_2643AF648;
    id v16 = v13;
    v17 = self;
    long long v20 = *(_OWORD *)&a3->var0;
    int64_t var3 = a3->var3;
    id v18 = v12;
    int64_t v19 = a5;
    dispatch_async(v14, block);
  }
}

void __114__MOVStreamWriter_Delegate__writingSessionDidStartAtTime_streamId_mediaType_writerDelegate_delegateCallbackQueue___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x21D4924B0]();
  v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 56);
  long long v7 = *(_OWORD *)(a1 + 64);
  uint64_t v8 = *(void *)(a1 + 80);
  [v3 streamWriter:v4 writingSessionDidStartAtTime:&v7 stream:v5 mediaType:v6];
}

- (MOVStreamWriter)initWithURL:(id)a3 andExpectedFrameRate:(double)a4
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v7 = a3;
  if (v7)
  {
    +[MIOLog recheckDebugEnabled];
    char v39 = 0;
    uint64_t v8 = [MEMORY[0x263F08850] defaultManager];
    id v9 = [v7 path];
    int v10 = [v8 fileExistsAtPath:v9 isDirectory:&v39];
    if (v39) {
      int v11 = v10;
    }
    else {
      int v11 = 0;
    }

    if (v11)
    {
      id v33 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:@"Target path is an existing directory." userInfo:0];
      objc_exception_throw(v33);
    }
    v38.receiver = self;
    v38.super_class = (Class)MOVStreamWriter;
    id v12 = [(MOVStreamWriter *)&v38 init];
    if (v12)
    {
      if (+[MIOLog debugEnabled])
      {
        id v13 = +[MIOLog defaultLog];
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          v14 = [v7 path];
          *(_DWORD *)buf = 138543362;
          v41 = v14;
          _os_log_impl(&dword_21B5ED000, v13, OS_LOG_TYPE_DEBUG, "MOVStreamWriter init with URL %{public}@", buf, 0xCu);
        }
      }
      [v12 setLegacyKeysMode:1];
      v15 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, -1);
      dispatch_queue_t v16 = dispatch_queue_create("com.apple.streamwriter.writing", v15);
      v17 = (void *)*((void *)v12 + 2);
      *((void *)v12 + 2) = v16;

      dispatch_queue_t v18 = dispatch_queue_create("com.apple.streamwriter.processing", 0);
      int64_t v19 = (void *)*((void *)v12 + 3);
      *((void *)v12 + 3) = v18;

      dispatch_semaphore_t v20 = dispatch_semaphore_create(0);
      v21 = (void *)*((void *)v12 + 4);
      *((void *)v12 + 4) = v20;

      dispatch_semaphore_t v22 = dispatch_semaphore_create(0);
      v23 = (void *)*((void *)v12 + 5);
      *((void *)v12 + 5) = v22;

      objc_storeStrong((id *)v12 + 9, a3);
      objc_storeWeak((id *)v12 + 63, 0);
      *((double *)v12 + 11) = a4;
      uint64_t v24 = MEMORY[0x263F000D0];
      long long v25 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
      *(_OWORD *)(v12 + 104) = *MEMORY[0x263F000D0];
      *((_WORD *)v12 + 48) = 1;
      *(_OWORD *)(v12 + 120) = v25;
      *(_OWORD *)(v12 + 136) = *(_OWORD *)(v24 + 32);
      *((void *)v12 + 47) = 10;
      *((void *)v12 + 8) = 0x404E000000000000;
      *((_DWORD *)v12 + 118) = 16800;
      *((_OWORD *)v12 + 24) = xmmword_21B661380;
      *((_DWORD *)v12 + 119) = 0;
      *((void *)v12 + 20) = 0x3FF0000000000000;
      v12[360] = 0;
      [v12 setWriteThreadCount:0];
      v26 = objc_opt_new();
      [v12 activateNewState:v26 byEvent:@"init"];

      v27 = (long long *)MEMORY[0x263F01098];
      long long v36 = *MEMORY[0x263F01098];
      uint64_t v37 = *(void *)(MEMORY[0x263F01098] + 16);
      [v12 setSessionStartTime:&v36];
      long long v34 = *v27;
      uint64_t v35 = *((void *)v27 + 2);
      [v12 setMovieFragmentInterval:&v34];
      [v12 setInProcessRecording:0];
      v28 = (void *)*((void *)v12 + 57);
      *((void *)v12 + 57) = 0;

      os_log_t v29 = os_log_create("com.apple.movstreamwriter.writeravf", "PointsOfInterest");
      v30 = (void *)*((void *)v12 + 55);
      *((void *)v12 + 55) = v29;

      *((void *)v12 + 56) = os_signpost_id_generate(*((os_log_t *)v12 + 55));
    }
    self = v12;
    v31 = self;
  }
  else
  {
    v31 = 0;
  }

  return v31;
}

- (void)dealloc
{
  v3 = +[MIOLog defaultLog];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21B5ED000, v3, OS_LOG_TYPE_INFO, "MOVStreamIO MOVStreamWriter dealloc", buf, 2u);
  }

  [(MOVStreamWriter *)self removeIsReadyObservers];
  [(MOVStreamWriter *)self closeEncodersAfterFailure];
  [(MOVStreamWriter *)self clearAllFifoQueues];
  begin_node = (MOVStreamWriter *)self->m_streamDataMap.__tree_.__begin_node_;
  p_pair1 = &self->m_streamDataMap.__tree_.__pair1_;
  if (begin_node != (MOVStreamWriter *)&self->m_streamDataMap.__tree_.__pair1_)
  {
    do
    {
      id timeoutBlock = begin_node->_timeoutBlock;
      if (timeoutBlock) {
        CFRelease(timeoutBlock);
      }
      m_delegateCallbackQueue = begin_node->m_delegateCallbackQueue;
      if (m_delegateCallbackQueue)
      {
        do
        {
          m_writingQueue = m_delegateCallbackQueue;
          m_delegateCallbackQueue = *(OS_dispatch_queue **)m_delegateCallbackQueue;
        }
        while (m_delegateCallbackQueue);
      }
      else
      {
        do
        {
          m_writingQueue = begin_node->m_writingQueue;
          BOOL v9 = *(void *)m_writingQueue == (void)begin_node;
          begin_node = (MOVStreamWriter *)m_writingQueue;
        }
        while (!v9);
      }
      begin_node = (MOVStreamWriter *)m_writingQueue;
    }
    while (m_writingQueue != (OS_dispatch_queue *)p_pair1);
  }
  int v10 = (MOVStreamWriter *)self->m_metadataDataMap.__tree_.__begin_node_;
  self->m_streamDataMap.__tree_.__begin_node_ = p_pair1;
  self->m_streamDataMap.__tree_.__pair1_.__value_.__left_ = 0;
  self->m_streamDataMap.__tree_.__pair3_.__value_ = 0;
  int v11 = &self->m_metadataDataMap.__tree_.__pair1_;
  if (v10 != (MOVStreamWriter *)&self->m_metadataDataMap.__tree_.__pair1_)
  {
    do
    {
      m_writeURL = v10->m_writeURL;
      if (m_writeURL) {
        CFRelease(m_writeURL);
      }
      id v13 = v10->m_delegateCallbackQueue;
      if (v13)
      {
        do
        {
          v14 = v13;
          id v13 = *(OS_dispatch_queue **)v13;
        }
        while (v13);
      }
      else
      {
        do
        {
          v14 = v10->m_writingQueue;
          BOOL v9 = *(void *)v14 == (void)v10;
          int v10 = (MOVStreamWriter *)v14;
        }
        while (!v9);
      }
      int v10 = (MOVStreamWriter *)v14;
    }
    while (v14 != (OS_dispatch_queue *)v11);
  }
  self->m_metadataDataMap.__tree_.__pair1_.__value_.__left_ = 0;
  self->m_metadataDataMap.__tree_.__pair3_.__value_ = 0;
  self->m_metadataDataMap.__tree_.__begin_node_ = v11;
  v15 = (MOVStreamWriter *)self->m_associatedMetadataDataMap.__tree_.__begin_node_;
  dispatch_queue_t v16 = &self->m_associatedMetadataDataMap.__tree_.__pair1_;
  if (v15 != (MOVStreamWriter *)&self->m_associatedMetadataDataMap.__tree_.__pair1_)
  {
    do
    {
      v17 = (objc_class *)v15->_timeoutBlock;
      if (v17 != (objc_class *)&v15->_finishingTimeout)
      {
        do
        {
          dispatch_queue_t v18 = (NSURL *)*((void *)v17 + 9);
          if (v18) {
            CFRelease(v18);
          }
          int64_t v19 = (OS_dispatch_queue *)*((void *)v17 + 1);
          if (v19)
          {
            do
            {
              dispatch_semaphore_t v20 = v19;
              int64_t v19 = *(OS_dispatch_queue **)v19;
            }
            while (v19);
          }
          else
          {
            do
            {
              dispatch_semaphore_t v20 = (OS_dispatch_queue *)*((void *)v17 + 2);
              BOOL v9 = *(void *)v20 == (void)v17;
              v17 = v20;
            }
            while (!v9);
          }
          v17 = v20;
        }
        while (v20 != (OS_dispatch_queue *)&v15->_finishingTimeout);
      }
      v21 = v15->m_delegateCallbackQueue;
      if (v21)
      {
        do
        {
          dispatch_semaphore_t v22 = v21;
          v21 = *(OS_dispatch_queue **)v21;
        }
        while (v21);
      }
      else
      {
        do
        {
          dispatch_semaphore_t v22 = v15->m_writingQueue;
          BOOL v9 = *(void *)v22 == (void)v15;
          v15 = (MOVStreamWriter *)v22;
        }
        while (!v9);
      }
      v15 = (MOVStreamWriter *)v22;
    }
    while (v22 != (OS_dispatch_queue *)v16);
  }
  self->m_associatedMetadataDataMap.__tree_.__pair1_.__value_.__left_ = 0;
  self->m_associatedMetadataDataMap.__tree_.__pair3_.__value_ = 0;
  self->m_associatedMetadataDataMap.__tree_.__begin_node_ = v16;
  v23.receiver = self;
  v23.super_class = (Class)MOVStreamWriter;
  [(MOVStreamWriter *)&v23 dealloc];
}

- (void)setMultiplexWritingDisabled:(BOOL)a3
{
  v3 = +[MIOLog defaultLog];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_21B5ED000, v3, OS_LOG_TYPE_INFO, "Setting multiplexWritingDisabled is not supported anymore.", v4, 2u);
  }
}

- (BOOL)multiplexWritingDisabled
{
  return 0;
}

- (BOOL)setWritingThreadPriority:(double)a3 error:(id *)a4
{
  if ([(MOVStreamWriterState *)self->_state canConfigure:self])
  {
    if (a3 <= 1.0 && a3 >= 0.0)
    {
      self->m_writingThreadPriority = a3;
      return 1;
    }
    if (a4)
    {
      uint64_t v8 = (void *)MEMORY[0x263F087E8];
      BOOL v9 = @"Priority must be floating point number from 0.0 to 1.0.";
      goto LABEL_9;
    }
  }
  else if (a4)
  {
    uint64_t v8 = (void *)MEMORY[0x263F087E8];
    BOOL v9 = @"Cannot set writingThreadPriority in current writer state.";
LABEL_9:
    id v10 = [v8 writerErrorWithMessage:v9 code:17];
    BOOL result = 0;
    *a4 = v10;
    return result;
  }
  return 0;
}

- (double)writingThreadPriority
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v3 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.movstreamio.framework"];
  uint64_t v4 = [v3 objectForKey:@"WRITING_THREAD_PRIORITY"];
  if (!v4)
  {
LABEL_9:
    double m_writingThreadPriority = self->m_writingThreadPriority;
    goto LABEL_10;
  }
  uint64_t v5 = +[MIOLog defaultLog];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    [v4 doubleValue];
    int v11 = 134217984;
    double v12 = v6;
    _os_log_impl(&dword_21B5ED000, v5, OS_LOG_TYPE_INFO, "writingThreadPriority overriden by defaults write: %f", (uint8_t *)&v11, 0xCu);
  }

  [v4 doubleValue];
  double m_writingThreadPriority = v7;
  if (v7 > 1.0 || v7 < 0.0)
  {
    BOOL v9 = +[MIOLog defaultLog];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v11 = 134217984;
      double v12 = m_writingThreadPriority;
      _os_log_impl(&dword_21B5ED000, v9, OS_LOG_TYPE_ERROR, "writingThreadPriority out of bounds [0..1] using %f", (uint8_t *)&v11, 0xCu);
    }

    goto LABEL_9;
  }
LABEL_10:

  return m_writingThreadPriority;
}

- (MIOMovieMetadataUtility)movieMetadataUtility
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if ([(MOVStreamWriter *)self status] == 5 && !self->_movieMetadataUtility)
  {
    v3 = [MIOMovieMetadataUtility alloc];
    uint64_t v4 = [(AVAssetWriter *)self->m_assetWriter outputURL];
    id v11 = 0;
    uint64_t v5 = [(MIOMovieMetadataUtility *)v3 initWithURL:v4 error:&v11];
    id v6 = v11;
    movieMetadataUtility = self->_movieMetadataUtility;
    self->_movieMetadataUtility = v5;

    if (!self->_movieMetadataUtility)
    {
      uint64_t v8 = +[MIOLog defaultLog];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v13 = v6;
        _os_log_impl(&dword_21B5ED000, v8, OS_LOG_TYPE_ERROR, "Eror creating movieMetadataUtility: %{public}@.", buf, 0xCu);
      }
    }
  }
  BOOL v9 = self->_movieMetadataUtility;

  return v9;
}

- (BOOL)setMediaTimeScale:(int)a3 forStream:(id)a4 error:(id *)a5
{
  id v8 = a4;
  if ([(MOVStreamWriterState *)self->_state canConfigure:self])
  {
    std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v8 UTF8String]);
    {
      BOOL v10 = [(MOVStreamWriter *)self isAudioStream:v9];
      if (v10)
      {
        if (a5)
        {
          *a5 = [MEMORY[0x263F087E8] writerErrorWithMessage:@"Cannot set baseMediaTimeScale for audio stream." code:7];
        }
      }
      else
      {
        *((_DWORD *)v9 + 52) = a3;
      }
      BOOL v11 = !v10;
    }
    else if (a5)
    {
      [MEMORY[0x263F087E8] writerErrorWithMessage:@"Unknown stream id." code:7];
      BOOL v11 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v11 = 0;
    }
    if (v14 < 0) {
      operator delete(__p[0]);
    }
  }
  else if (a5)
  {
    [MEMORY[0x263F087E8] writerErrorWithMessage:@"Cannot set baseMediaTimeScale in current writer state." code:17];
    BOOL v11 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (BOOL)setMediaTimeScale:(int)a3 forMetadataStream:(id)a4 error:(id *)a5
{
  id v8 = a4;
  if ([(MOVStreamWriterState *)self->_state canConfigure:self])
  {
    std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v8 UTF8String]);
    p_m_metadataDataMap = (uint64_t **)&self->m_metadataDataMap;
    BOOL v11 = v10 != 0;
    if (v10)
    {
    }
    else if (a5)
    {
      *a5 = [MEMORY[0x263F087E8] writerErrorWithMessage:@"Unknown metadata stream id." code:7];
    }
    if (v14 < 0) {
      operator delete(__p[0]);
    }
  }
  else if (a5)
  {
    [MEMORY[0x263F087E8] writerErrorWithMessage:@"Cannot set baseMediaTimeScale in current writer state." code:17];
    BOOL v11 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timeWithSeconds:(SEL)a3
{
  int32_t v6 = [(MOVStreamWriter *)self baseMediaTimeScale];

  return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMTimeMakeWithSeconds((CMTime *)retstr, a4, v6);
}

- (BOOL)isAudioStream:(StreamRecordingData *)a3
{
  return CMFormatDescriptionGetMediaType(a3->var0) == 1936684398;
}

- (unint64_t)defaultWritingBufferCapacity
{
  return self->_defaultWritingBufferCapacity;
}

- (void)setDefaultWritingBufferCapacity:(unint64_t)a3
{
  self->_defaultWritingBufferCapacity = a3;
  begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, (anonymous namespace)::StreamRecordingData>, void *>>> *)self->m_streamDataMap.__tree_.__begin_node_;
  p_pair1 = &self->m_streamDataMap.__tree_.__pair1_;
  if (begin_node != &self->m_streamDataMap.__tree_.__pair1_)
  {
    do
    {
      if (![(MOVStreamWriter *)self isAudioStream:&begin_node[7]]) {
        begin_node[15].__value_.__left_ = (void *)self->_defaultWritingBufferCapacity;
      }
      left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, (anonymous namespace)::StreamRecordingData>, void *>>> *)begin_node[1].__value_.__left_;
      if (left)
      {
        do
        {
          double v7 = left;
          left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, (anonymous namespace)::StreamRecordingData>, void *>>> *)left->__value_.__left_;
        }
        while (left);
      }
      else
      {
        do
        {
          double v7 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, (anonymous namespace)::StreamRecordingData>, void *>>> *)begin_node[2].__value_.__left_;
          BOOL v8 = v7->__value_.__left_ == begin_node;
          begin_node = v7;
        }
        while (!v8);
      }
      begin_node = v7;
    }
    while (v7 != p_pair1);
  }
}

- (unint64_t)defaultAudioWritingBufferCapacity
{
  return self->_defaultAudioWritingBufferCapacity;
}

- (void)setDefaultAudioWritingBufferCapacity:(unint64_t)a3
{
  self->_defaultAudioWritingBufferCapacity = a3;
  begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, (anonymous namespace)::StreamRecordingData>, void *>>> *)self->m_streamDataMap.__tree_.__begin_node_;
  p_pair1 = &self->m_streamDataMap.__tree_.__pair1_;
  if (begin_node != &self->m_streamDataMap.__tree_.__pair1_)
  {
    do
    {
      if ([(MOVStreamWriter *)self isAudioStream:&begin_node[7]]) {
        begin_node[15].__value_.__left_ = (void *)self->_defaultAudioWritingBufferCapacity;
      }
      left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, (anonymous namespace)::StreamRecordingData>, void *>>> *)begin_node[1].__value_.__left_;
      if (left)
      {
        do
        {
          double v7 = left;
          left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, (anonymous namespace)::StreamRecordingData>, void *>>> *)left->__value_.__left_;
        }
        while (left);
      }
      else
      {
        do
        {
          double v7 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, (anonymous namespace)::StreamRecordingData>, void *>>> *)begin_node[2].__value_.__left_;
          BOOL v8 = v7->__value_.__left_ == begin_node;
          begin_node = v7;
        }
        while (!v8);
      }
      begin_node = v7;
    }
    while (v7 != p_pair1);
  }
}

- (unint64_t)defaultMetadataWritingBufferCapacity
{
  return self->_defaultMetadataWritingBufferCapacity;
}

- (void)setDefaultMetadataWritingBufferCapacity:(unint64_t)a3
{
  self->_defaultMetadataWritingBufferCapacity = a3;
  begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, (anonymous namespace)::MetadataRecordingData>, void *>>> *)self->m_metadataDataMap.__tree_.__begin_node_;
  if (begin_node != &self->m_metadataDataMap.__tree_.__pair1_)
  {
    do
    {
      begin_node[12].__value_.__left_ = (void *)self->_defaultMetadataWritingBufferCapacity;
      left = (MOVStreamWriter *)begin_node[1].__value_.__left_;
      if (left)
      {
        do
        {
          uint64_t v5 = left;
          left = (MOVStreamWriter *)left->super.isa;
        }
        while (left);
      }
      else
      {
        do
        {
          uint64_t v5 = (MOVStreamWriter *)begin_node[2].__value_.__left_;
          BOOL v6 = v5->super.isa == (Class)begin_node;
          begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, (anonymous namespace)::MetadataRecordingData>, void *>>> *)v5;
        }
        while (!v6);
      }
      begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, (anonymous namespace)::MetadataRecordingData>, void *>>> *)v5;
    }
    while (v5 != (MOVStreamWriter *)&self->m_metadataDataMap.__tree_.__pair1_);
  }
}

- (void)setWritingBufferCapacity:(unint64_t)a3 forStream:(id)a4
{
  id v6 = a4;
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v6 UTF8String]);
  {
    id v8 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:@"Unknown stream id." userInfo:0];
    objc_exception_throw(v8);
  }
  if ([(MOVStreamWriter *)self isAudioStream:v7])
  {
    id v9 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0], @"Stream is an audio stream, use [MOVStreamWriter setWritingBufferCapacity:forAudioStream:]", 0 reason userInfo];
    objc_exception_throw(v9);
  }
  v7[8] = a3;
  if (v11 < 0) {
    operator delete(__p[0]);
  }
}

- (void)setWritingBufferCapacity:(unint64_t)a3 forAudioStream:(id)a4
{
  id v6 = a4;
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v6 UTF8String]);
  {
    id v8 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:@"Unknown stream id." userInfo:0];
    objc_exception_throw(v8);
  }
  if (![(MOVStreamWriter *)self isAudioStream:v7])
  {
    id v9 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0], @"Stream is a video stream, use [MOVStreamWriter setWritingBufferCapacity:forStream:]", 0 reason userInfo];
    objc_exception_throw(v9);
  }
  v7[8] = a3;
  if (v11 < 0) {
    operator delete(__p[0]);
  }
}

- (void)setWritingBufferCapacity:(unint64_t)a3 forMetadataStream:(id)a4
{
  id v6 = a4;
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v6 UTF8String]);
  p_m_metadataDataMap = (uint64_t **)&self->m_metadataDataMap;
  {
    id v8 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:@"Unknown stream id." userInfo:0];
    objc_exception_throw(v8);
  }
  if (v10 < 0) {
    operator delete(__p[0]);
  }
}

- (unint64_t)writingBufferCapacityForStream:(id)a3
{
  id v4 = a3;
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v4 UTF8String]);
  {
    id v8 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:@"Unknown stream id." userInfo:0];
    objc_exception_throw(v8);
  }
  if ([(MOVStreamWriter *)self isAudioStream:v5])
  {
    id v9 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0], @"Stream is an audio stream, use [MOVStreamWriter writingBufferCapacityForAudioStream:]", 0 reason userInfo];
    objc_exception_throw(v9);
  }
  unint64_t v6 = v5[8];
  if (v11 < 0) {
    operator delete(__p[0]);
  }

  return v6;
}

- (unint64_t)writingBufferCapacityForAudioStream:(id)a3
{
  id v4 = a3;
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v4 UTF8String]);
  {
    id v8 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:@"Unknown stream id." userInfo:0];
    objc_exception_throw(v8);
  }
  if (![(MOVStreamWriter *)self isAudioStream:v5])
  {
    id v9 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0], @"Stream is not an audio stream, use [MOVStreamWriter writingBufferCapacityForStream:]", 0 reason userInfo];
    objc_exception_throw(v9);
  }
  unint64_t v6 = v5[8];
  if (v11 < 0) {
    operator delete(__p[0]);
  }

  return v6;
}

- (unint64_t)writingBufferCapacityForMetadataStream:(id)a3
{
  id v4 = a3;
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v4 UTF8String]);
  p_m_metadataDataMap = (uint64_t **)&self->m_metadataDataMap;
  {
    id v8 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:@"Unknown stream id." userInfo:0];
    objc_exception_throw(v8);
  }
  if (v10 < 0) {
    operator delete(__p[0]);
  }

  return v6;
}

- (unint64_t)writingBufferUsageForStream:(id)a3
{
  id v4 = a3;
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v4 UTF8String]);
  {
    id v8 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:@"Unknown stream id." userInfo:0];
    objc_exception_throw(v8);
  }
  if ([(MOVStreamWriter *)self isAudioStream:v5])
  {
    id v9 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0], @"Stream is an audio stream, use [MOVStreamWriter writingBufferUsageForAudioStream:]", 0 reason userInfo];
    objc_exception_throw(v9);
  }
  unint64_t v6 = [(id)v5[7] count];
  if (v11 < 0) {
    operator delete(__p[0]);
  }

  return v6;
}

- (unint64_t)writingBufferUsageForAudioStream:(id)a3
{
  id v4 = a3;
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v4 UTF8String]);
  {
    id v8 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:@"Unknown stream id." userInfo:0];
    objc_exception_throw(v8);
  }
  if (![(MOVStreamWriter *)self isAudioStream:v5])
  {
    id v9 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0], @"Stream is not an audio stream, use [MOVStreamWriter writingBufferUsageForStream:]", 0 reason userInfo];
    objc_exception_throw(v9);
  }
  unint64_t v6 = [(id)v5[7] count];
  if (v11 < 0) {
    operator delete(__p[0]);
  }

  return v6;
}

- (unint64_t)writingBufferUsageForMetadataStream:(id)a3
{
  id v4 = a3;
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v4 UTF8String]);
  p_m_metadataDataMap = (uint64_t **)&self->m_metadataDataMap;
  {
    id v8 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:@"Unknown stream id." userInfo:0];
    objc_exception_throw(v8);
  }
  if (v10 < 0) {
    operator delete(__p[0]);
  }

  return v6;
}

- (void)setCriticalError:(id)a3
{
}

- (NSError)criticalError
{
  return self->_criticalError;
}

- (BOOL)activateNewState:(id)a3 byEvent:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  double v7 = (MOVStreamWriterState *)a3;
  id v8 = a4;
  if (v7 && self->_state != v7)
  {
    id v9 = NSString;
    uint64_t v10 = objc_opt_class();
    char v11 = [v9 stringWithFormat:@"State Change: %@ - (%@) -> %@", v10, v8, objc_opt_class()];
    double v12 = +[MIOLog defaultLog];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      dispatch_semaphore_t v22 = v11;
      _os_log_impl(&dword_21B5ED000, v12, OS_LOG_TYPE_INFO, "%{public}@", buf, 0xCu);
    }

    p_state = &self->_state;
    uint64_t v14 = [(MOVStreamWriterState *)self->_state writerStatus];
    objc_storeStrong((id *)&self->_state, a3);
    [(MOVStreamWriter *)self setCanWriteData:[(MOVStreamWriterState *)self->_state canWriteData:self]];
    BOOL v15 = [(MOVStreamWriterState *)self->_state writerStatus] == 6
       || [(MOVStreamWriterState *)*p_state writerStatus] == 7;
    [(MOVStreamWriter *)self setIsOrWasCanceled:v15];
    uint64_t v16 = [(MOVStreamWriterState *)*p_state writerStatus];
    [(MOVStreamWriterState *)self->_state activateWithContext:self];
    if (v14 != v16)
    {
      [(MOVStreamWriter *)self willChangeValueForKey:@"status"];
      [(MOVStreamWriter *)self didChangeValueForKey:@"status"];
      v17 = [(MOVStreamWriter *)self delegate];
      BOOL v18 = v17 == 0;

      if (!v18)
      {
        int64_t v19 = [(MOVStreamWriter *)self delegate];
        [(MOVStreamWriter *)self writerStatusChanged:v16 writerDelegate:v19 delegateCallbackQueue:self->m_delegateCallbackQueue];
      }
    }
  }
  return v7 != 0;
}

- (void)deleteMOVFile
{
  v3 = [MEMORY[0x263F08850] defaultManager];
  m_writeURL = self->m_writeURL;
  id v6 = 0;
  [v3 removeItemAtURL:m_writeURL error:&v6];
  id v5 = v6;

  if (v5) {
    [(MOVStreamWriter *)self informDelegateAboutError:v5];
  }
}

- (int64_t)status
{
  v2 = self;
  objc_sync_enter(v2);
  state = v2->_state;
  if (state) {
    int64_t v4 = [(MOVStreamWriterState *)state writerStatus];
  }
  else {
    int64_t v4 = 0;
  }
  objc_sync_exit(v2);

  return v4;
}

- (void)setDelegate:(id)a3 callbackQueue:(id)a4
{
  id v10 = a3;
  id v6 = (OS_dispatch_queue *)a4;
  if (v10 && !v6)
  {
    id v9 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:@"Caller must provide a delegateCallbackQueue" userInfo:0];
    objc_exception_throw(v9);
  }
  double v7 = self;
  objc_sync_enter(v7);
  [(MOVStreamWriter *)v7 setDelegate:v10];
  m_delegateCallbackQueue = v7->m_delegateCallbackQueue;
  v7->m_delegateCallbackQueue = v6;

  objc_sync_exit(v7);
}

- (BOOL)enableAVEHighPerformanceProfile
{
  int v3 = [(MOVStreamWriterState *)self->_state canConfigure:self];
  if (v3) {
    self->m_enableAVEHighPerformanceProfile = 1;
  }
  return v3;
}

- (BOOL)setExpectedFrameRate:(double)a3
{
  if (self->m_expectedFrameRate >= 0.0)
  {
    int v4 = [(MOVStreamWriterState *)self->_state canConfigure:self];
    if (v4)
    {
      self->m_expectedFrameRate = a3;
      LOBYTE(v4) = 1;
    }
  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (BOOL)setVideoTransform:(CGAffineTransform *)a3
{
  int v5 = [(MOVStreamWriterState *)self->_state canConfigure:self];
  if (v5)
  {
    long long v6 = *(_OWORD *)&a3->a;
    long long v7 = *(_OWORD *)&a3->c;
    *(_OWORD *)&self->m_videoTransform.tx = *(_OWORD *)&a3->tx;
    *(_OWORD *)&self->m_videoTransform.c = v7;
    *(_OWORD *)&self->m_videoTransform.a = v6;
  }
  return v5;
}

- (BOOL)relateStream:(id)a3 toStream:(id)a4 relationSpecifier:(id)a5
{
  return [(MOVStreamWriter *)self relateStream:a3 toStream:a4 relationSpecifier:a5 error:0];
}

- (BOOL)relateStream:(id)a3 toStream:(id)a4 relationSpecifier:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if ([(MOVStreamWriterState *)self->_state canConfigure:self])
  {
    id v13 = v10;
    std::string::basic_string[abi:ne180100]<0>(v28, (char *)[v13 UTF8String]);
    p_m_streamDataMap = (uint64_t **)&self->m_streamDataMap;
    p_pair1 = &self->m_streamDataMap.__tree_.__pair1_;
    if (p_pair1 == (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, (anonymous namespace)::StreamRecordingData>, void *>>> *)v15)
    {
      uint64_t v24 = [NSString stringWithFormat:@"Cannot find track for stream %@", v13];
      [MEMORY[0x263F087E8] populateStreamError:a6 message:v24 code:26];

      BOOL v20 = 0;
    }
    else
    {
      id v17 = v11;
      std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v17 UTF8String]);
      BOOL v19 = p_pair1 == (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, (anonymous namespace)::StreamRecordingData>, void *>>> *)v18;
      BOOL v20 = p_pair1 != (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, (anonymous namespace)::StreamRecordingData>, void *>>> *)v18;
      if (v19)
      {
        uint64_t v23 = [NSString stringWithFormat:@"Cannot find track for stream %@", v17];
        [MEMORY[0x263F087E8] populateStreamError:a6 message:v23 code:26];
      }
      else
      {
        objc_storeStrong((id *)v21 + 13, v17);
        id v22 = v12;
        uint64_t v23 = (void *)v21[14];
        v21[14] = (uint64_t)v22;
      }

      if (v27 < 0) {
        operator delete(__p[0]);
      }
    }
    if (v29 < 0) {
      operator delete(v28[0]);
    }
  }
  else
  {
    BOOL v20 = 0;
  }

  return v20;
}

- (BOOL)setRealTimeCapture:(BOOL)a3
{
  int v5 = [(MOVStreamWriterState *)self->_state canConfigure:self];
  if (v5) {
    self->m_realtime = a3;
  }
  return v5;
}

- (BOOL)setShouldOptimizeForNetworkUse:(BOOL)a3
{
  int v5 = [(MOVStreamWriterState *)self->_state canConfigure:self];
  if (v5) {
    self->m_shouldOptimizeForNetworkUse = a3;
  }
  return v5;
}

- (BOOL)shouldOptimizeForNetworkUse
{
  return self->m_shouldOptimizeForNetworkUse;
}

- (void)logFifoUsage
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  v2 = +[MIOLog defaultLog];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21B5ED000, v2, OS_LOG_TYPE_INFO, "[FIFO] Usage:", buf, 2u);
  }

  begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, (anonymous namespace)::StreamRecordingData>, void *>>> *)self->m_streamDataMap.__tree_.__begin_node_;
  if (begin_node != &self->m_streamDataMap.__tree_.__pair1_)
  {
    do
    {
      left = begin_node + 4;
      if (SHIBYTE(begin_node[6].__value_.__left_) < 0) {
        left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, (anonymous namespace)::StreamRecordingData>, void *>>> *)left->__value_.__left_;
      }
      int v5 = [NSString stringWithUTF8String:left];
      long long v6 = +[MIOLog defaultLog];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        uint64_t v7 = [begin_node[32].__value_.__left_ fifoItemCount];
        int v8 = [begin_node[9].__value_.__left_ isReadyForMoreMediaData];
        int v9 = [begin_node[10].__value_.__left_ isReadyForMoreMediaData];
        *(_DWORD *)buf = 138544130;
        uint64_t v23 = v5;
        __int16 v24 = 2048;
        uint64_t v25 = v7;
        __int16 v26 = 1024;
        int v27 = v8;
        __int16 v28 = 1024;
        int v29 = v9;
        _os_log_impl(&dword_21B5ED000, v6, OS_LOG_TYPE_INFO, "  [FIFO] %{public}@ = %lu ready: %d %d", buf, 0x22u);
      }

      isa = (MOVStreamWriter *)begin_node[1].__value_.__left_;
      if (isa)
      {
        do
        {
          id v11 = isa;
          isa = (MOVStreamWriter *)isa->super.isa;
        }
        while (isa);
      }
      else
      {
        do
        {
          id v11 = (MOVStreamWriter *)begin_node[2].__value_.__left_;
          BOOL v12 = v11->super.isa == (Class)begin_node;
          begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, (anonymous namespace)::StreamRecordingData>, void *>>> *)v11;
        }
        while (!v12);
      }
      begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, (anonymous namespace)::StreamRecordingData>, void *>>> *)v11;
    }
    while (v11 != (MOVStreamWriter *)&self->m_streamDataMap.__tree_.__pair1_);
  }
  id v13 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, (anonymous namespace)::MetadataRecordingData>, void *>>> *)self->m_metadataDataMap.__tree_.__begin_node_;
  if (v13 != &self->m_metadataDataMap.__tree_.__pair1_)
  {
    do
    {
      uint64_t v14 = v13 + 4;
      if (SHIBYTE(v13[6].__value_.__left_) < 0) {
        uint64_t v14 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, (anonymous namespace)::MetadataRecordingData>, void *>>> *)v14->__value_.__left_;
      }
      uint64_t v15 = [NSString stringWithUTF8String:v14];
      uint64_t v16 = +[MIOLog defaultLog];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        uint64_t v17 = [v13[15].__value_.__left_ fifoItemCount];
        int v18 = [v13[7].__value_.__left_ isReadyForMoreMediaData];
        *(_DWORD *)buf = 138543874;
        uint64_t v23 = v15;
        __int16 v24 = 2048;
        uint64_t v25 = v17;
        __int16 v26 = 1024;
        int v27 = v18;
        _os_log_impl(&dword_21B5ED000, v16, OS_LOG_TYPE_INFO, "  [FIFO] %{public}@ = %lu (metadata)  ready: %d", buf, 0x1Cu);
      }

      BOOL v19 = (MOVStreamWriter *)v13[1].__value_.__left_;
      if (v19)
      {
        do
        {
          BOOL v20 = v19;
          BOOL v19 = (MOVStreamWriter *)v19->super.isa;
        }
        while (v19);
      }
      else
      {
        do
        {
          BOOL v20 = (MOVStreamWriter *)v13[2].__value_.__left_;
          BOOL v12 = v20->super.isa == (Class)v13;
          id v13 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, (anonymous namespace)::MetadataRecordingData>, void *>>> *)v20;
        }
        while (!v12);
      }
      id v13 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, (anonymous namespace)::MetadataRecordingData>, void *>>> *)v20;
    }
    while (v20 != (MOVStreamWriter *)&self->m_metadataDataMap.__tree_.__pair1_);
  }
}

- (BOOL)checkIfFifoAreEmpty
{
  begin_node = (MOVStreamWriter *)self->m_streamDataMap.__tree_.__begin_node_;
  p_pair1 = &self->m_streamDataMap.__tree_.__pair1_;
  if (begin_node == (MOVStreamWriter *)&self->m_streamDataMap.__tree_.__pair1_)
  {
LABEL_9:
    int v8 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, (anonymous namespace)::MetadataRecordingData>, void *>>> *)self->m_metadataDataMap.__tree_.__begin_node_;
    int v9 = &self->m_metadataDataMap.__tree_.__pair1_;
    if (v8 == v9)
    {
      return 1;
    }
    else
    {
      do
      {
        uint64_t v10 = [v8[15].__value_.__left_ fifoItemCount];
        BOOL result = v10 == 0;
        if (v10) {
          break;
        }
        left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, (anonymous namespace)::MetadataRecordingData>, void *>>> *)v8[1].__value_.__left_;
        if (left)
        {
          do
          {
            id v13 = left;
            left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, (anonymous namespace)::MetadataRecordingData>, void *>>> *)left->__value_.__left_;
          }
          while (left);
        }
        else
        {
          do
          {
            id v13 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, (anonymous namespace)::MetadataRecordingData>, void *>>> *)v8[2].__value_.__left_;
            BOOL v7 = v13->__value_.__left_ == v8;
            int v8 = v13;
          }
          while (!v7);
        }
        int v8 = v13;
      }
      while (v13 != v9);
    }
  }
  else
  {
    while (![begin_node->m_orderedMetadataStreamNames.__end_cap_.__value_ fifoItemCount])
    {
      m_delegateCallbackQueue = begin_node->m_delegateCallbackQueue;
      if (m_delegateCallbackQueue)
      {
        do
        {
          m_writingQueue = m_delegateCallbackQueue;
          m_delegateCallbackQueue = *(OS_dispatch_queue **)m_delegateCallbackQueue;
        }
        while (m_delegateCallbackQueue);
      }
      else
      {
        do
        {
          m_writingQueue = begin_node->m_writingQueue;
          BOOL v7 = *(void *)m_writingQueue == (void)begin_node;
          begin_node = (MOVStreamWriter *)m_writingQueue;
        }
        while (!v7);
      }
      begin_node = (MOVStreamWriter *)m_writingQueue;
      if (m_writingQueue == (OS_dispatch_queue *)p_pair1) {
        goto LABEL_9;
      }
    }
    return 0;
  }
  return result;
}

- (void)addMetadataTrack:(id)a3
{
}

- (void)addMetadataTrack:(id)a3 copyData:(BOOL)a4
{
  id v6 = a3;
  [(MOVStreamWriter *)self addMetadataTrack:v6 formatDescription:0];
  id v7 = v6;
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v7 UTF8String]);
  if (v9 < 0) {
    operator delete(__p[0]);
  }
}

- (void)addTimeRangeMetadataTrack:(id)a3
{
  id v4 = a3;
  p_m_metadataDataMap = (uint64_t **)&self->m_metadataDataMap;
  begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, (anonymous namespace)::MetadataRecordingData>, void *>>> *)self->m_metadataDataMap.__tree_.__begin_node_;
  if (begin_node != &self->m_metadataDataMap.__tree_.__pair1_)
  {
    do
    {
      if (BYTE1(begin_node[14].__value_.__left_))
      {
        id v12 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498] reason:@"Cannot add two time range metadata tracks to the same writer" userInfo:0];
        objc_exception_throw(v12);
      }
      left = (MOVStreamWriter *)begin_node[1].__value_.__left_;
      if (left)
      {
        do
        {
          int v8 = left;
          left = (MOVStreamWriter *)left->super.isa;
        }
        while (left);
      }
      else
      {
        do
        {
          int v8 = (MOVStreamWriter *)begin_node[2].__value_.__left_;
          BOOL v9 = v8->super.isa == (Class)begin_node;
          begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, (anonymous namespace)::MetadataRecordingData>, void *>>> *)v8;
        }
        while (!v9);
      }
      begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, (anonymous namespace)::MetadataRecordingData>, void *>>> *)v8;
    }
    while (v8 != (MOVStreamWriter *)&self->m_metadataDataMap.__tree_.__pair1_);
  }
  uint64_t v10 = (const void *)[MEMORY[0x263EFA748] createMIOTimeRangeMetadataStreamFormatDescription];
  if (!v10)
  {
    id v13 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498] reason:@"Cannot create format description for time range metadata track." userInfo:0];
    objc_exception_throw(v13);
  }
  [(MOVStreamWriter *)self addMetadataTrack:v4 formatDescription:v10];
  CFRelease(v10);
  id v11 = v4;
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v11 UTF8String]);
  if (v15 < 0) {
    operator delete(__p[0]);
  }
}

- (void)addMetadataTrack:(id)a3 formatDescription:(opaqueCMFormatDescription *)a4
{
  id v6 = a3;
  if (!v6)
  {
    id v22 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498] reason:@"Invalid metadata streamId 'nil'." userInfo:0];
    objc_exception_throw(v22);
  }
  id v7 = v6;
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v7 UTF8String]);
  int v8 = self;
  objc_sync_enter(v8);
  if (([(MOVStreamWriterState *)v8->_state canConfigure:v8] & 1) == 0)
  {
    uint64_t v23 = @"Cannot add tracks while not idle";
    goto LABEL_18;
  }
  {
    uint64_t v23 = @"Cannot add two metadata tracks with the same name";
LABEL_18:
    id v24 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498] reason:v23 userInfo:0];
    objc_exception_throw(v24);
  }
  BOOL v9 = objc_opt_new();
  id v10 = v9;
  uint64_t v11 = [(MOVStreamWriter *)v8 defaultMetadataWritingBufferCapacity];
  if (a4) {
    CFRetain(a4);
  }
  uint64_t v25 = a4;
  id v12 = objc_opt_new();
  uint64_t v14 = (void *)*v13;
  *id v13 = 0;

  char v15 = (void *)v13[1];
  v13[1] = 0;

  *((unsigned char *)v13 + 24) = 0;
  v13[2] = (uint64_t)v25;
  objc_storeStrong((id *)v13 + 4, v9);
  uint64_t v16 = (void *)v13[6];
  v13[5] = v11;
  v13[6] = 0;

  *((_WORD *)v13 + 28) = 1;
  objc_storeStrong((id *)v13 + 8, v12);
  *((_DWORD *)v13 + 18) = 0;
  end = v8->m_orderedMetadataStreamNames.__end_;
  if (end >= v8->m_orderedMetadataStreamNames.__end_cap_.__value_)
  {
    uint64_t v19 = std::vector<std::string>::__push_back_slow_path<std::string const&>((uint64_t *)&v8->m_orderedMetadataStreamNames, (long long *)__p);
  }
  else
  {
    if (SHIBYTE(v27) < 0)
    {
      std::string::__init_copy_ctor_external((std::string *)v8->m_orderedMetadataStreamNames.__end_, (const std::string::value_type *)__p[0], (std::string::size_type)__p[1]);
    }
    else
    {
      long long v18 = *(_OWORD *)__p;
      end[2] = v27;
      *(_OWORD *)end = v18;
    }
    uint64_t v19 = (uint64_t)(end + 3);
    v8->m_orderedMetadataStreamNames.__end_ = end + 3;
  }
  v8->m_orderedMetadataStreamNames.__end_ = (void *)v19;
  __int16 v28 = __p;
  BOOL v20 = std::__tree<std::__value_type<std::string,CMTime>,std::__map_value_compare<std::string,std::__value_type<std::string,CMTime>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,CMTime>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t **)&v8->m_lastPtsForMetadataStream, (const void **)__p, (uint64_t)&std::piecewise_construct, (long long **)&v28);
  uint64_t v21 = MEMORY[0x263F01098];
  *(_OWORD *)(v20 + 7) = *MEMORY[0x263F01098];
  v20[9] = *(void *)(v21 + 16);

  objc_sync_exit(v8);
  if (SHIBYTE(v27) < 0) {
    operator delete(__p[0]);
  }
}

- (void)addMetadataTrackAssociatedWith:(id)a3 withIdentifier:(id)a4 withFormatDescription:(opaqueCMFormatDescription *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = v8;
  std::string::basic_string[abi:ne180100]<0>(v29, (char *)[v10 UTF8String]);
  id v11 = v9;
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v11 UTF8String]);
  if (([(MOVStreamWriterState *)self->_state canConfigure:self] & 1) == 0)
  {
    uint64_t v21 = @"Cannot add tracks while not idle";
    goto LABEL_15;
  }
  {
    [NSString stringWithFormat:@"Unable to find stream with identifier %@", v10];
    id v22 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498] reason:objc_claimAutoreleasedReturnValue() userInfo:0];
    objc_exception_throw(v22);
  }
  {
    {
      uint64_t v21 = @"Cannot add two metadata tracks with the same name";
LABEL_15:
      id v23 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498] reason:v21 userInfo:0];
      objc_exception_throw(v23);
    }
  }
  if (a5) {
    CFRetain(a5);
  }
  unint64_t v24 = [(MOVStreamWriter *)self defaultMetadataWritingBufferCapacity];
  LOBYTE(v25) = 1;
  __int16 v26 = objc_opt_new();
  char v15 = (void *)*v14;
  uint64_t *v14 = 0;

  uint64_t v16 = (void *)v14[1];
  v14[1] = 0;

  *((unsigned char *)v14 + 24) = 0;
  v14[2] = (uint64_t)a5;
  uint64_t v17 = (void *)v14[4];
  v14[4] = 0;

  long long v18 = (void *)v14[6];
  v14[5] = v24;
  v14[6] = 0;

  *((_WORD *)v14 + 28) = v25;
  uint64_t v19 = (void *)v14[8];
  v14[8] = (uint64_t)v26;
  id v20 = v26;

  *((_DWORD *)v14 + 18) = 0;
  if (v28 < 0) {
    operator delete(__p[0]);
  }
  if (v30 < 0) {
    operator delete((void *)v29[0]);
  }
}

- (void)addTrackForStreamWithIdentifier:(id)a3 formatDescription:(opaqueCMFormatDescription *)a4 recordingConfiguration:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v66 = v8;
  std::string::basic_string[abi:ne180100]<0>(&v87, (char *)[v66 UTF8String]);
  if (!v9 || ![v9 count])
  {
    v59 = @"recordingConfiguration cannot be null or empty";
    goto LABEL_46;
  }
  if (!a4)
  {
    id v10 = [v9 valueForKey:@"StreamEncoderType"];
    int v11 = [v10 intValue];

    if (v11 != 17)
    {
      v59 = @"Format description cannot be null";
LABEL_46:
      id v60 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:v59 userInfo:0];
      objc_exception_throw(v60);
    }
  }
  id v12 = self;
  objc_sync_enter(v12);
  if (([(MOVStreamWriterState *)v12->_state canConfigure:v12] & 1) == 0)
  {
    v61 = @"Cannot add tracks while not idle";
    goto LABEL_49;
  }
  {
    v61 = @"Cannot add two tracks with the same stream name";
LABEL_49:
    id v62 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498] reason:v61 userInfo:0];
    objc_exception_throw(v62);
  }
  v65 = [v9 objectForKey:@"PixelBufferExactBytesPerRow"];
  if (v65)
  {
    CMVideoDimensions Dimensions = CMVideoFormatDescriptionGetDimensions(a4);
    if (!+[MOVStreamIOUtility verifyExactBytesPerRow:v65 width:Dimensions.width height:*(uint64_t *)&Dimensions >> 32 pixelFormat:CMFormatDescriptionGetMediaSubType(a4)])
    {
      [NSString stringWithFormat:@"Not matching kMIOPixelBufferExactBytesPerRow value %@.", v65];
      id v63 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:objc_claimAutoreleasedReturnValue() userInfo:0];
      objc_exception_throw(v63);
    }
  }
  CMMediaType MediaType = CMFormatDescriptionGetMediaType(a4);
  char v15 = [v9 objectForKey:@"VideoTrackTypeInfo"];

  if (!v15 && MediaType != 1936684398)
  {
    uint64_t v16 = [NSString stringWithFormat:@"No video track type info (MIOVideoTrackTypeInfo) specified for stream '%@'.", v66];
    id v17 = (id)[MEMORY[0x263F087E8] writerWarningWithMessage:v16 code:0];
  }
  long long v18 = [v9 objectForKey:@"BufferCacheMode"];
  v64 = v18;
  if (v18)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v19 = [v18 intValue];
      goto LABEL_17;
    }
    id v20 = [NSString stringWithFormat:@"Surface cache mode (MIOBufferCacheMode) is not an NSNumber value, specified for stream '%@'.", v66];
    id v21 = (id)[MEMORY[0x263F087E8] writerWarningWithMessage:v20 code:0];
  }
  int v19 = 0;
LABEL_17:
  id v22 = [v9 objectForKey:@"EncodeAttachments"];
  if (!v22) {
    goto LABEL_30;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v27 = [NSString stringWithFormat:@"Encode attachment keys for stream '%@' are not provided as an Array.", v66];
    if (!v27) {
      goto LABEL_29;
    }
    goto LABEL_28;
  }
  id v23 = v22;
  if ([v23 count])
  {
    unint64_t v24 = [v23 objectAtIndexedSubscript:0];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      uint64_t v26 = 0;
      goto LABEL_27;
    }
    char v28 = @"Encode attachment keys for stream '%@' are not Strings.";
  }
  else
  {
    char v28 = @"Encode attachment keys for stream '%@' are defined but empty.";
  }
  uint64_t v26 = objc_msgSend(NSString, "stringWithFormat:", v28, v66);
LABEL_27:

  uint64_t v27 = (void *)v26;
  if (v26)
  {
LABEL_28:

    id v22 = 0;
    id v29 = (id)[MEMORY[0x263F087E8] writerWarningWithMessage:v27 code:0];
  }
LABEL_29:

LABEL_30:
  id v81 = 0;
  id v84 = 0;
  *(_OWORD *)obj = 0u;
  *(_OWORD *)v70 = 0u;
  *(_OWORD *)v71 = 0u;
  *(_OWORD *)v73 = 0u;
  *(_OWORD *)v74 = 0u;
  *(_OWORD *)v75 = 0u;
  id v78 = 0;
  id v76 = 0;
  if (a4) {
    CFTypeRef v30 = CFRetain(a4);
  }
  else {
    CFTypeRef v30 = 0;
  }
  id v67 = (id)v30;
  v31 = (void *)[v9 copy];
  id v32 = v70[1];
  v70[1] = v31;

  char v68 = 0;
  id v33 = v74[1];
  v74[1] = 0;

  objc_storeStrong(&v76, v22);
  long long v34 = [v9 objectForKey:@"DoNotRecordAttachments"];
  char v77 = [v34 BOOLValue];

  uint64_t v35 = objc_opt_new();
  id v36 = v78;
  id v78 = v35;

  uint64_t v37 = MEMORY[0x263F01098];
  long long v79 = *MEMORY[0x263F01098];
  *(void *)&long long v80 = *(void *)(MEMORY[0x263F01098] + 16);
  if (MediaType == 1936684398) {
    uint64_t v38 = [(MOVStreamWriter *)v12 defaultAudioWritingBufferCapacity];
  }
  else {
    uint64_t v38 = [(MOVStreamWriter *)v12 defaultWritingBufferCapacity];
  }
  uint64_t v72 = v38;
  char v39 = objc_opt_new();
  objc_storeStrong(&v71[1], v39);
  *((void *)&v80 + 1) = 0;
  v40 = objc_opt_new();
  id v41 = v81;
  id v81 = v40;

  int v83 = v19;
  int v85 = 0;
  uint64_t v42 = objc_opt_new();
  id v43 = v84;
  id v84 = v42;

  unint64_t value = v12->m_streamDataMap.__tree_.__pair3_.__value_;
  char v86 = value % [(MOVStreamWriter *)v12 writingThreadsCount];
  v45 = +[MOVStreamPreProcessorFactory defaultFactory];
  v46 = [v45 preProcessorForFormat:v67 recordingConfiguration:v9];
  id v47 = v74[0];
  v74[0] = v46;

  id v48 = +[MOVStreamOutputSettings outputSettingsForStream:&v67 defaultFrameRate:v12->m_enableAVEHighPerformanceProfile enableAVEHighPerformanceProfile:v12->m_expectedFrameRate];
  uint64_t v50 = (uint64_t)v67;
  *((unsigned char *)v49 + 8) = v68;
  uint64_t *v49 = v50;
  objc_storeStrong((id *)v49 + 2, obj[0]);
  objc_storeStrong((id *)v49 + 3, obj[1]);
  objc_storeStrong((id *)v49 + 4, v70[0]);
  objc_storeStrong((id *)v49 + 5, v70[1]);
  objc_storeStrong((id *)v49 + 6, v71[0]);
  objc_storeStrong((id *)v49 + 7, v71[1]);
  v49[8] = v72;
  objc_storeStrong((id *)v49 + 9, v73[0]);
  objc_storeStrong((id *)v49 + 10, v73[1]);
  objc_storeStrong((id *)v49 + 11, v74[0]);
  objc_storeStrong((id *)v49 + 12, v74[1]);
  objc_storeStrong((id *)v49 + 13, v75[0]);
  objc_storeStrong((id *)v49 + 14, v75[1]);
  objc_storeStrong((id *)v49 + 15, v76);
  *((unsigned char *)v49 + 128) = v77;
  objc_storeStrong((id *)v49 + 17, v78);
  long long v51 = v80;
  *((_OWORD *)v49 + 9) = v79;
  *((_OWORD *)v49 + 10) = v51;
  objc_storeStrong((id *)v49 + 22, v81);
  uint64_t v52 = v82;
  *((_DWORD *)v49 + 48) = v83;
  v49[23] = v52;
  objc_storeStrong((id *)v49 + 25, v84);
  int v53 = v85;
  *((unsigned char *)v49 + 212) = v86;
  *((_DWORD *)v49 + 52) = v53;
  end = v12->m_orderedStreamNames.__end_;
  if (end >= v12->m_orderedStreamNames.__end_cap_.__value_)
  {
    uint64_t v56 = std::vector<std::string>::__push_back_slow_path<std::string const&>((uint64_t *)&v12->m_orderedStreamNames, &v87);
  }
  else
  {
    if (SHIBYTE(v88) < 0)
    {
      std::string::__init_copy_ctor_external((std::string *)v12->m_orderedStreamNames.__end_, (const std::string::value_type *)v87, *((std::string::size_type *)&v87 + 1));
    }
    else
    {
      long long v55 = v87;
      end[2] = v88;
      *(_OWORD *)end = v55;
    }
    uint64_t v56 = (uint64_t)(end + 3);
    v12->m_orderedStreamNames.__end_ = end + 3;
  }
  v12->m_orderedStreamNames.__end_ = (void *)v56;
  v89[0] = &v87;
  v57 = std::__tree<std::__value_type<std::string,CMTime>,std::__map_value_compare<std::string,std::__value_type<std::string,CMTime>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,CMTime>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t **)&v12->m_lastPtsForStream, (const void **)&v87, (uint64_t)&std::piecewise_construct, v89);
  *(_OWORD *)(v57 + 7) = *(_OWORD *)v37;
  v57[9] = *(void *)(v37 + 16);
  v89[0] = &v87;
  v58 = std::__tree<std::__value_type<std::string,CMTime>,std::__map_value_compare<std::string,std::__value_type<std::string,CMTime>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,CMTime>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t **)&v12->m_lastPtsForAttachmentsStream, (const void **)&v87, (uint64_t)&std::piecewise_construct, v89);
  *(_OWORD *)(v58 + 7) = *(_OWORD *)v37;
  v58[9] = *(void *)(v37 + 16);

  objc_sync_exit(v12);

  if (SHIBYTE(v88) < 0) {
    operator delete((void *)v87);
  }
}

- (void)addAudioTrackForStreamWithIdentifier:(id)a3 audioFormat:(id)a4 additionalSettings:(id)a5
{
  id v14 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [v8 formatDescription];
  if (!v10)
  {
    id v13 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:@"Invalid audio format" userInfo:0];
    objc_exception_throw(v13);
  }
  int v11 = +[MOVStreamIOUtility audioNoneEncoderConfig];
  id v12 = (void *)[v11 mutableCopy];

  [v12 setObject:v8 forKey:@"AudioFormatObject"];
  if (v9) {
    [v12 setObject:v9 forKey:@"AdditionalAudioSettings"];
  }
  [(MOVStreamWriter *)self addTrackForStreamWithIdentifier:v14 formatDescription:v10 recordingConfiguration:v12];
}

- (BOOL)setTrackMetadata:(id)a3 forStream:(id)a4
{
  return [(MOVStreamWriter *)self setTrackMetadata:a3 forStream:a4 error:0];
}

- (BOOL)setTrackMetadata:(id)a3 forStream:(id)a4 error:(id *)a5
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v21 = a3;
  id v8 = a4;
  if ([(MOVStreamWriterState *)self->_state canConfigure:self])
  {
    id v9 = v8;
    std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v9 UTF8String]);
    {
      id v10 = [NSString stringWithFormat:@"Cannot find track for stream %@", v9];
      [MEMORY[0x263F087E8] populateStreamError:a5 message:v10 code:26];
LABEL_17:
      BOOL v18 = 0;
    }
    else
    {
      long long v24 = 0u;
      long long v25 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      id v10 = v21;
      uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v28 count:16];
      if (v11)
      {
        uint64_t v12 = *(void *)v23;
        while (2)
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v23 != v12) {
              objc_enumerationMutation(v10);
            }
            uint64_t v14 = *(void *)(*((void *)&v22 + 1) + 8 * i);
            char v15 = [v10 objectForKeyedSubscript:v14];
            if (![(MOVStreamWriter *)self isCustomTrackMetadataCompatibleObject:v15])
            {
              if (a5)
              {
                int v19 = [NSString stringWithFormat:@"Incompatible item %@:%@.", v14, objc_opt_class()];
                *a5 = [MEMORY[0x263F087E8] internalErrorWithMessage:v19 code:10];
              }
              goto LABEL_17;
            }
          }
          uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v28 count:16];
          if (v11) {
            continue;
          }
          break;
        }
      }

      id v17 = v10;
      id v10 = (id)v16[9];
      v16[9] = (uint64_t)v17;
      BOOL v18 = 1;
    }

    if (v27 < 0) {
      operator delete(__p[0]);
    }
  }
  else
  {
    BOOL v18 = 0;
  }

  return v18;
}

- (BOOL)setTrackMetadataItems:(id)a3 forStream:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if ([(MOVStreamWriterState *)self->_state canConfigure:self])
  {
    id v10 = v9;
    std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v10 UTF8String]);
    p_m_streamDataMap = (uint64_t **)&self->m_streamDataMap;
    BOOL v13 = &self->m_streamDataMap.__tree_.__pair1_ == (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, (anonymous namespace)::StreamRecordingData>, void *>>> *)v12;
    BOOL v14 = &self->m_streamDataMap.__tree_.__pair1_ != (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, (anonymous namespace)::StreamRecordingData>, void *>>> *)v12;
    if (v13)
    {
      id v17 = [NSString stringWithFormat:@"Cannot find track for stream %@", v10];
      [MEMORY[0x263F087E8] populateStreamError:a5 message:v17 code:26];
    }
    else
    {
      id v16 = v8;
      id v17 = (void *)v15[10];
      v15[10] = (uint64_t)v16;
    }

    if (v20 < 0) {
      operator delete(__p[0]);
    }
  }
  else
  {
    [MEMORY[0x263F087E8] populateStreamError:a5 message:@"Writer is not in MIOWriterStatusInit state." code:17];
    BOOL v14 = 0;
  }

  return v14;
}

- (BOOL)setTrackMetadata:(id)a3 forMetadataStream:(id)a4
{
  return [(MOVStreamWriter *)self setTrackMetadata:a3 forMetadataStream:a4 error:0];
}

- (BOOL)setTrackMetadata:(id)a3 forMetadataStream:(id)a4 error:(id *)a5
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v21 = a3;
  id v8 = a4;
  if ([(MOVStreamWriterState *)self->_state canConfigure:self])
  {
    id v9 = v8;
    std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v9 UTF8String]);
    {
      id v10 = [NSString stringWithFormat:@"Cannot find track for stream %@", v9];
      [MEMORY[0x263F087E8] populateStreamError:a5 message:v10 code:26];
LABEL_17:
      BOOL v18 = 0;
    }
    else
    {
      long long v24 = 0u;
      long long v25 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      id v10 = v21;
      uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v28 count:16];
      if (v11)
      {
        uint64_t v12 = *(void *)v23;
        while (2)
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v23 != v12) {
              objc_enumerationMutation(v10);
            }
            uint64_t v14 = *(void *)(*((void *)&v22 + 1) + 8 * i);
            char v15 = [v10 objectForKeyedSubscript:v14];
            if (![(MOVStreamWriter *)self isCustomTrackMetadataCompatibleObject:v15])
            {
              if (a5)
              {
                int v19 = [NSString stringWithFormat:@"Incompatible item %@:%@.", v14, objc_opt_class()];
                *a5 = [MEMORY[0x263F087E8] internalErrorWithMessage:v19 code:10];
              }
              goto LABEL_17;
            }
          }
          uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v28 count:16];
          if (v11) {
            continue;
          }
          break;
        }
      }

      id v17 = v10;
      id v10 = (id)v16[6];
      v16[6] = (uint64_t)v17;
      BOOL v18 = 1;
    }

    if (v27 < 0) {
      operator delete(__p[0]);
    }
  }
  else
  {
    BOOL v18 = 0;
  }

  return v18;
}

- (void)prepareToRecordWithMovieMetadata:(id)a3
{
  id v4 = a3;
  if (([(MOVStreamWriterState *)self->_state canConfigure:self] & 1) == 0)
  {
    id v12 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498] reason:@"Current state does not support prepareToRecord." userInfo:0];
    objc_exception_throw(v12);
  }
  char v15 = 0;
  int v5 = [MEMORY[0x263F08850] defaultManager];
  id v6 = [(NSURL *)self->m_writeURL path];
  int v7 = [v5 fileExistsAtPath:v6 isDirectory:&v15];
  if (v15) {
    int v8 = v7;
  }
  else {
    int v8 = 0;
  }

  if (v8 == 1)
  {
    id v13 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:@"Target path is an existing directory." userInfo:0];
    objc_exception_throw(v13);
  }
  id v9 = self;
  objc_sync_enter(v9);
  [(MOVStreamWriter *)v9 setMovMetadataItems:v4];
  id v10 = [(MOVStreamWriterState *)self->_state prepareRecording:v9];
  BOOL v11 = [(MOVStreamWriter *)v9 activateNewState:v10 byEvent:@"prepareToRecord"];

  if (!v11)
  {
    id v14 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498] reason:@"Current state does not support prepareToRecord." userInfo:0];
    objc_exception_throw(v14);
  }
  objc_sync_exit(v9);
}

- (void)executePrepareToRecordWithMovieMetadata:(id)a3
{
  id v4 = a3;
  if (+[MIOLog debugEnabled])
  {
    int v5 = +[MIOLog defaultLog];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21B5ED000, v5, OS_LOG_TYPE_DEBUG, "Start prepareToRecordWithMovieMetadata", buf, 2u);
    }
  }
  id v6 = dispatch_queue_create("prepareQueue", 0);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __59__MOVStreamWriter_executePrepareToRecordWithMovieMetadata___block_invoke;
  v8[3] = &unk_2643AF670;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

void __59__MOVStreamWriter_executePrepareToRecordWithMovieMetadata___block_invoke(uint64_t a1)
{
  uint64_t v75 = *MEMORY[0x263EF8340];
  context = (void *)MEMORY[0x21D4924B0]();
  v2 = [MEMORY[0x263F08850] defaultManager];
  [v2 removeItemAtURL:*(void *)(*(void *)(a1 + 32) + 72) error:0];

  int v3 = +[MIOLog defaultLog];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21B5ED000, v3, OS_LOG_TYPE_INFO, "Init av writer...", buf, 2u);
  }

  id v4 = (id)*MEMORY[0x263EF9898];
  int v5 = [*(id *)(*(void *)(a1 + 32) + 72) pathExtension];
  id v6 = [v5 lowercaseString];
  int v7 = [v6 isEqual:@"mp4"];

  if (v7)
  {
    id v8 = (id)*MEMORY[0x263EF9888];

    id v9 = +[MIOLog defaultLog];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21B5ED000, v9, OS_LOG_TYPE_INFO, "⚠️⚠️⚠️ WARNING [MOVStreamIO]: Selected file type is 'mp4'. Be aware that this can and will cause data loss. If you can please use 'mov'. ⚠️⚠️⚠️", buf, 2u);
    }

    id v4 = v8;
  }
  id v10 = objc_alloc(MEMORY[0x263EFA518]);
  uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 72);
  id v71 = 0;
  uint64_t v12 = [v10 initWithURL:v11 fileType:v4 error:&v71];
  id v13 = v71;
  uint64_t v14 = *(void *)(a1 + 32);
  char v15 = *(void **)(v14 + 80);
  *(void *)(v14 + 80) = v12;

  if ([*(id *)(a1 + 32) inProcessRecording])
  {
    id v16 = +[MIOLog defaultLog];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21B5ED000, v16, OS_LOG_TYPE_INFO, "AVAssetWriter set requiresInProcessOperation = YES", buf, 2u);
    }

    [*(id *)(*(void *)(a1 + 32) + 80) setValue:MEMORY[0x263EFFA88] forKey:@"requiresInProcessOperation"];
    id v17 = [*(id *)(*(void *)(a1 + 32) + 80) valueForKey:@"requiresInProcessOperation"];
    BOOL v18 = +[MIOLog defaultLog];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      int v19 = [v17 intValue];
      *(_DWORD *)buf = 67109120;
      LODWORD(v73) = v19;
      _os_log_impl(&dword_21B5ED000, v18, OS_LOG_TYPE_INFO, "Check AVAssetWriter.requiresInProcessOperation is %d", buf, 8u);
    }
  }
  [*(id *)(*(void *)(a1 + 32) + 80) setShouldOptimizeForNetworkUse:*(unsigned __int8 *)(*(void *)(a1 + 32) + 97)];
  char v20 = *(unsigned char **)(a1 + 32);
  if (!v20[97]) {
    goto LABEL_17;
  }
  id v21 = +[MIOLog defaultLog];
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21B5ED000, v21, OS_LOG_TYPE_INFO, "AVAssetWriter shouldOptimizeForNetworkUse = YES", buf, 2u);
  }

  char v20 = *(unsigned char **)(a1 + 32);
  if (v20)
  {
LABEL_17:
    [v20 movieFragmentInterval];
    if (v74)
    {
      long long v22 = +[MIOLog defaultLog];
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        long long v23 = *(void **)(a1 + 32);
        if (v23) {
          [v23 movieFragmentInterval];
        }
        else {
          memset(&time, 0, sizeof(time));
        }
        Float64 Seconds = CMTimeGetSeconds(&time);
        *(_DWORD *)buf = 134217984;
        Float64 v73 = Seconds;
        _os_log_impl(&dword_21B5ED000, v22, OS_LOG_TYPE_INFO, "MOVStreamWriter set movieFragmentInterval to %f", buf, 0xCu);
      }

      [*(id *)(a1 + 32) movieFragmentInterval];
      uint64_t v25 = *(void *)(a1 + 32);
      long long v66 = v68;
      uint64_t v67 = v69;
      [*(id *)(v25 + 80) setMovieFragmentInterval:&v66];
    }
  }
  if (!v13)
  {
    uint64_t v26 = +[MIOLog defaultLog];
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21B5ED000, v26, OS_LOG_TYPE_INFO, "Writer setupAssetWriterStreamInputs", buf, 2u);
    }

    char v27 = *(void **)(a1 + 32);
    id v65 = 0;
    [v27 setupAssetWriterStreamInputsWithError:&v65];
    id v13 = v65;
    if (!v13)
    {
      char v28 = +[MIOLog defaultLog];
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21B5ED000, v28, OS_LOG_TYPE_INFO, "Writer setupMetadataInputs", buf, 2u);
      }

      uint64_t v29 = *(void **)(a1 + 32);
      id v64 = 0;
      [v29 setupMetadataInputsWithError:&v64];
      id v13 = v64;
      if (!v13)
      {
        CFTypeRef v30 = +[MIOLog defaultLog];
        if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21B5ED000, v30, OS_LOG_TYPE_INFO, "Writer setupAssociatedMetadataInputs", buf, 2u);
        }

        v31 = *(void **)(a1 + 32);
        id v63 = 0;
        [v31 setupAssociatedMetadataInputsWithError:&v63];
        id v13 = v63;
      }
    }
  }
  id v32 = objc_opt_new();
  id v33 = +[MOVStreamWriter getMOVStreamIOMetadataItem];
  if (v33) {
    [v32 addObject:v33];
  }
  if (*(void *)(a1 + 40)) {
    objc_msgSend(v32, "addObjectsFromArray:");
  }
  long long v34 = [*(id *)(a1 + 32) timeRangeMetadataKeyHint];
  BOOL v35 = v34 == 0;

  if (!v35)
  {
    id v36 = [*(id *)(a1 + 32) timeRangeMetadataKeyHint];
    uint64_t v37 = +[MOVStreamWriter getTimeRangeMetadataKeyHintMetadataItem:v36 error:0];

    if (v37) {
      [v32 addObject:v37];
    }
  }
  uint64_t v38 = +[MIOLog defaultLog];
  if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21B5ED000, v38, OS_LOG_TYPE_INFO, "Writer add MOV metadata", buf, 2u);
  }

  [*(id *)(*(void *)(a1 + 32) + 80) setMetadata:v32];
  if (!v13)
  {
    char v39 = +[MIOLog defaultLog];
    if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21B5ED000, v39, OS_LOG_TYPE_INFO, "Writer startWriting", buf, 2u);
    }

    if ([*(id *)(*(void *)(a1 + 32) + 80) startWriting])
    {
      v40 = +[MIOLog defaultLog];
      if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21B5ED000, v40, OS_LOG_TYPE_INFO, "Writer register KVO", buf, 2u);
      }

      [*(id *)(a1 + 32) addIsReadyObservers];
      id v13 = 0;
    }
    else
    {
      id v13 = [*(id *)(*(void *)(a1 + 32) + 80) error];
    }
  }
  id v41 = *(id *)(a1 + 32);
  objc_sync_enter(v41);
  uint64_t v42 = +[MIOLog defaultLog];
  if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21B5ED000, v42, OS_LOG_TYPE_INFO, "Writer transition status", buf, 2u);
  }

  id v43 = *(void **)(a1 + 32);
  v44 = (void *)v43[46];
  if (v13)
  {
    v45 = [v44 criticalErrorOccurred:v13 context:*(void *)(a1 + 32)];
    [v43 activateNewState:v45 byEvent:@"executePrepareToRecord"];
  }
  else
  {
    v46 = [v44 prepareFinished:*(void *)(a1 + 32)];
    char v47 = [v43 activateNewState:v46 byEvent:@"executePrepareToRecord"];

    if ((v47 & 1) == 0) {
      __assert_rtn("-[MOVStreamWriter executePrepareToRecordWithMovieMetadata:]_block_invoke", "MOVStreamWriter.mm", 1337, "0");
    }
    v45 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.movstreamio.framework"];
    if ([v45 BOOLForKey:@"MULTI_THREAD_WRITING"])
    {
      unint64_t v48 = [*(id *)(a1 + 32) writingThreadsCount];
      v49 = +[MIOLog defaultLog];
      if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        Float64 v73 = *(double *)&v48;
        _os_log_impl(&dword_21B5ED000, v49, OS_LOG_TYPE_INFO, "Multi thread writing mode enabled. Using %zu sample buffer writing threads.", buf, 0xCu);
      }

      uint64_t v50 = [MEMORY[0x263EFF980] arrayWithCapacity:v48];
      uint64_t v51 = *(void *)(a1 + 32);
      uint64_t v52 = *(void **)(v51 + 416);
      *(void *)(v51 + 416) = v50;

      if (v48)
      {
        int v53 = 0;
        do
        {
          v54 = [*(id *)(a1 + 32) startWritingThreadForNonMetadataOnlyThreadId:v53];
          [*(id *)(*(void *)(a1 + 32) + 416) addObject:v54];

          ++v53;
        }
        while (v48 > v53);
      }
      uint64_t v55 = [*(id *)(a1 + 32) startWritingThreadForMetadata];
      uint64_t v56 = *(void *)(a1 + 32);
      v57 = *(void **)(v56 + 424);
      *(void *)(v56 + 424) = v55;

      uint64_t v58 = [*(id *)(a1 + 32) startWritingThreadForNonMetadataOnlyThreadId:255];
      uint64_t v59 = *(void *)(a1 + 32);
      id v60 = *(void **)(v59 + 432);
      *(void *)(v59 + 432) = v58;
    }
    else
    {
      v61 = +[MIOLog defaultLog];
      if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21B5ED000, v61, OS_LOG_TYPE_INFO, "Default thread writing mode enabled.", buf, 2u);
      }

      [*(id *)(a1 + 32) startWritingThread];
    }
  }

  objc_sync_exit(v41);
}

- (unint64_t)writingThreadsCount
{
  v2 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.movstreamio.framework"];
  int v3 = [v2 objectForKey:@"MULTI_THREAD_WRITING_COUNT"];
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 integerValue];
    if (v5) {
      unint64_t v6 = v5;
    }
    else {
      unint64_t v6 = 3;
    }
  }
  else
  {
    unint64_t v6 = 3;
  }

  return v6;
}

- (void)addIsReadyObservers
{
  v0 = +[MIOLog defaultLog];
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_21B5ED000, v0, OS_LOG_TYPE_ERROR, "⛔️⛔️⛔️ ERROR: 'addIsReadyObservers' called twice ⛔️⛔️⛔️", v1, 2u);
  }

  __assert_rtn("-[MOVStreamWriter addIsReadyObservers]", "MOVStreamWriter.mm", 1391, "0");
}

- (void)removeIsReadyObservers
{
  if (self->m_observingIsReady)
  {
    self->m_observingIsReady = 0;
    begin_node = (MOVStreamWriter *)self->m_streamDataMap.__tree_.__begin_node_;
    p_pair1 = &self->m_streamDataMap.__tree_.__pair1_;
    if (begin_node != (MOVStreamWriter *)&self->m_streamDataMap.__tree_.__pair1_)
    {
      do
      {
        [(NSURL *)begin_node->m_writeURL removeObserver:self forKeyPath:@"readyForMoreMediaData"];
        [(AVAssetWriter *)begin_node->m_assetWriter removeObserver:self forKeyPath:@"readyForMoreMediaData"];
        m_delegateCallbackQueue = begin_node->m_delegateCallbackQueue;
        if (m_delegateCallbackQueue)
        {
          do
          {
            m_writingQueue = m_delegateCallbackQueue;
            m_delegateCallbackQueue = *(OS_dispatch_queue **)m_delegateCallbackQueue;
          }
          while (m_delegateCallbackQueue);
        }
        else
        {
          do
          {
            m_writingQueue = begin_node->m_writingQueue;
            BOOL v7 = *(void *)m_writingQueue == (void)begin_node;
            begin_node = (MOVStreamWriter *)m_writingQueue;
          }
          while (!v7);
        }
        begin_node = (MOVStreamWriter *)m_writingQueue;
      }
      while (m_writingQueue != (OS_dispatch_queue *)p_pair1);
    }
    id v8 = (MOVStreamWriter *)self->m_metadataDataMap.__tree_.__begin_node_;
    if (v8 != (MOVStreamWriter *)&self->m_metadataDataMap.__tree_.__pair1_)
    {
      do
      {
        [v8->_timeoutBlock removeObserver:self forKeyPath:@"readyForMoreMediaData"];
        id v9 = v8->m_delegateCallbackQueue;
        if (v9)
        {
          do
          {
            id v10 = (MOVStreamWriter *)v9;
            id v9 = *(OS_dispatch_queue **)v9;
          }
          while (v9);
        }
        else
        {
          do
          {
            id v10 = (MOVStreamWriter *)v8->m_writingQueue;
            BOOL v7 = v10->super.isa == (Class)v8;
            id v8 = v10;
          }
          while (!v7);
        }
        id v8 = v10;
      }
      while (v10 != (MOVStreamWriter *)&self->m_metadataDataMap.__tree_.__pair1_);
    }
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a5;
  id v10 = [v9 objectForKey:*MEMORY[0x263F081B8]];
  uint64_t v11 = [v10 BOOLValue];

  begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, (anonymous namespace)::StreamRecordingData>, void *>>> *)self->m_streamDataMap.__tree_.__begin_node_;
  if (begin_node != &self->m_streamDataMap.__tree_.__pair1_)
  {
    while (1)
    {
      id v13 = begin_node[9].__value_.__left_;
      objc_sync_enter(v13);
      BOOL v14 = begin_node[9].__value_.__left_ == v8 || begin_node[10].__value_.__left_ == v8;
      if (v14) {
        break;
      }
      objc_sync_exit(v13);

      left = (MOVStreamWriter *)begin_node[1].__value_.__left_;
      if (left)
      {
        do
        {
          id v16 = left;
          left = (MOVStreamWriter *)left->super.isa;
        }
        while (left);
      }
      else
      {
        do
        {
          id v16 = (MOVStreamWriter *)begin_node[2].__value_.__left_;
          BOOL v14 = v16->super.isa == (Class)begin_node;
          begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, (anonymous namespace)::StreamRecordingData>, void *>>> *)v16;
        }
        while (!v14);
      }
      begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, (anonymous namespace)::StreamRecordingData>, void *>>> *)v16;
      if (v16 == (MOVStreamWriter *)&self->m_streamDataMap.__tree_.__pair1_) {
        goto LABEL_22;
      }
    }
    id v17 = begin_node + 4;
    if (SHIBYTE(begin_node[6].__value_.__left_) < 0) {
      id v17 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, (anonymous namespace)::StreamRecordingData>, void *>>> *)v17->__value_.__left_;
    }
    BOOL v18 = [NSString stringWithUTF8String:v17];
    int v19 = +[MIOLog defaultLog];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      int v27 = 138543618;
      char v28 = v18;
      __int16 v29 = 1024;
      int v30 = v11;
      _os_log_impl(&dword_21B5ED000, v19, OS_LOG_TYPE_INFO, "[KVO] Update stream '%{public}@' input ready: %d", (uint8_t *)&v27, 0x12u);
    }

    if ([(MOVStreamWriterState *)self->_state writerStatus] == 3) {
      [(MOVStreamWriter *)self informDelegateAboutIsReady:v11 forStream:v18];
    }
    if (v11) {
      [(MOVStreamWriter *)self consumeSamplesOfVideoAudioStream:v18];
    }

    objc_sync_exit(v13);
  }
LABEL_22:
  char v20 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, (anonymous namespace)::MetadataRecordingData>, void *>>> *)self->m_metadataDataMap.__tree_.__begin_node_;
  if (v20 != &self->m_metadataDataMap.__tree_.__pair1_)
  {
    while (1)
    {
      id v21 = v20[7].__value_.__left_;
      objc_sync_enter(v21);
      if (v20[7].__value_.__left_ == v8) {
        break;
      }
      objc_sync_exit(v21);

      isa = (MOVStreamWriter *)v20[1].__value_.__left_;
      if (isa)
      {
        do
        {
          long long v23 = isa;
          isa = (MOVStreamWriter *)isa->super.isa;
        }
        while (isa);
      }
      else
      {
        do
        {
          long long v23 = (MOVStreamWriter *)v20[2].__value_.__left_;
          BOOL v14 = v23->super.isa == (Class)v20;
          char v20 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, (anonymous namespace)::MetadataRecordingData>, void *>>> *)v23;
        }
        while (!v14);
      }
      char v20 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, (anonymous namespace)::MetadataRecordingData>, void *>>> *)v23;
      if (v23 == (MOVStreamWriter *)&self->m_metadataDataMap.__tree_.__pair1_) {
        goto LABEL_40;
      }
    }
    long long v24 = v20 + 4;
    if (SHIBYTE(v20[6].__value_.__left_) < 0) {
      long long v24 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, (anonymous namespace)::MetadataRecordingData>, void *>>> *)v24->__value_.__left_;
    }
    uint64_t v25 = [NSString stringWithUTF8String:v24];
    uint64_t v26 = +[MIOLog defaultLog];
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      int v27 = 138543618;
      char v28 = v25;
      __int16 v29 = 1024;
      int v30 = v11;
      _os_log_impl(&dword_21B5ED000, v26, OS_LOG_TYPE_INFO, "[KVO] Update metadata stream '%{public}@' input ready: %d", (uint8_t *)&v27, 0x12u);
    }

    if ([(MOVStreamWriterState *)self->_state writerStatus] == 3) {
      [(MOVStreamWriter *)self informDelegateAboutIsReady:v11 forStream:v25];
    }
    if (v11) {
      [(MOVStreamWriter *)self consumeMetadatOfMetadataStream:v25];
    }

    objc_sync_exit(v21);
  }
LABEL_40:
}

- (int)attachmentSerializationModeForStream:()basic_string<char withDefaultMode:()std:(std::allocator<char>> *)a3 :char_traits<char>
{
  v5 = int v4 = v3;
  unint64_t v6 = v5;
  if (v5) {
    int v4 = [v5 intValue];
  }

  return v4;
}

- (void)appendPixelBuffer:(__CVBuffer *)a3 presentationTime:(id *)a4 toStreamId:(id)a5
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v27 = a5;
  std::string::basic_string[abi:ne180100]<0>(&v38, (char *)[v27 UTF8String]);
  {
    id v25 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498] reason:@"Cannot append to stream that hasn't been set up." userInfo:0];
    objc_exception_throw(v25);
  }
  if (([(MOVStreamWriterState *)self->_state canAppendData:self] & 1) == 0)
  {
    [NSString stringWithFormat:@"Cannot append: writer is not recording. Current writer state: %@", objc_opt_class()];
    id v26 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498] reason:objc_claimAutoreleasedReturnValue() userInfo:0];
    objc_exception_throw(v26);
  }
  if (+[MIOLog debugEnabled])
  {
    id v8 = +[MIOLog defaultLog];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      CMTime time = (CMTime)*a4;
      Float64 Seconds = CMTimeGetSeconds(&time);
      *(_DWORD *)buf = 134218242;
      Float64 v40 = Seconds;
      v41[0] = 2114;
      *(void *)&v41[1] = v27;
      _os_log_impl(&dword_21B5ED000, v8, OS_LOG_TYPE_DEBUG, "MOVStreamWriter appendPixelBuffer at '%5.3f' to stream '%{public}@'", buf, 0x16u);
    }
  }
  [(MOVStreamWriter *)self sessionStartTime];
  if ((v41[0] & 1) == 0)
  {
    long long v35 = *(_OWORD *)&a4->var0;
    int64_t var3 = a4->var3;
    [(MOVStreamWriter *)self setSessionStartTime:&v35];
  }
  uint64_t v11 = v10;
  if (!v10[6]) {
    goto LABEL_12;
  }
  id v12 = (id)v10[22];
  objc_sync_enter(v12);
  uint64_t v13 = [(id)v11[6] pendingFrames];
  uint64_t v14 = v11[21];
  objc_sync_exit(v12);

  id v15 = (id)v11[7];
  objc_sync_enter(v15);
  uint64_t v16 = [(id)v11[7] count];
  objc_sync_exit(v15);

  uint64_t v17 = v13 & ~(v13 >> 63);
  unint64_t v18 = v11[8];
  if (v14 + v17 + v16 > v18)
  {
    int v19 = [NSString stringWithFormat:@"[VTEncoder] processing buffer for stream '%@' is full, dropping buffer (Pending:%lld Queue:%ld Fifo:%ld Capacity:%ld) (%llu/%llu/%llu/%llu).", v27, v17, v14, v16, v18, -[MOVStreamWriter writeThreadCount](self, "writeThreadCount"), objc_msgSend((id)v11[25], "visitCount"), objc_msgSend((id)v11[25], "attemptCount"), objc_msgSend((id)v11[25], "writeCount")];
    char v20 = [MEMORY[0x263F087E8] streamErrorWithMessage:v19 code:18];
    id v21 = [v20 errorByAddingStreamId:v27];

    [(MOVStreamWriter *)self informDelegateAboutError:v21];
    [(MOVStreamWriter *)self triggerWritingThread];
  }
  else
  {
LABEL_12:
    id v22 = (id)v11[22];
    objc_sync_enter(v22);
    ++v11[21];
    objc_sync_exit(v22);

    CVPixelBufferRetain(a3);
    m_processingQueue = self->m_processingQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3321888768;
    block[2] = __65__MOVStreamWriter_appendPixelBuffer_presentationTime_toStreamId___block_invoke;
    block[3] = &unk_26CB69778;
    void block[4] = self;
    if (SHIBYTE(v38.__r_.__value_.__r.__words[2]) < 0) {
      std::string::__init_copy_ctor_external(&__p, v38.__r_.__value_.__l.__data_, v38.__r_.__value_.__l.__size_);
    }
    else {
      std::string __p = v38;
    }
    uint64_t v31 = a3;
    id v24 = v27;
    long long v33 = *(_OWORD *)&a4->var0;
    int64_t v34 = a4->var3;
    id v29 = v24;
    id v32 = v11;
    dispatch_async(m_processingQueue, block);

    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
  }
  if (SHIBYTE(v38.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v38.__r_.__value_.__l.__data_);
  }
}

void __65__MOVStreamWriter_appendPixelBuffer_presentationTime_toStreamId___block_invoke(uint64_t a1)
{
  uint64_t v70 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x21D4924B0]();
  int v3 = (_OWORD *)(a1 + 48);
  if (*((unsigned char *)v4 + 128))
  {
    uint64_t v5 = 0;
    goto LABEL_17;
  }
  BOOL v6 = +[MIOPixelBufferUtility isPixelBufferRawBayer:*(void *)(a1 + 72)];
  BOOL v7 = +[MIOPixelBufferUtility isPixelBufferCompandedRawBayer:*(void *)(a1 + 72)];
  id v8 = *(char **)(a1 + 32);
  if (*(char *)(a1 + 71) < 0)
  {
    std::string::__init_copy_ctor_external(&v66, *(const std::string::value_type **)(a1 + 48), *(void *)(a1 + 56));
    id v9 = *(char **)(a1 + 32);
  }
  else
  {
    *(_OWORD *)&v66.__r_.__value_.__l.__data_ = *v3;
    v66.__r_.__value_.__r.__words[2] = *(void *)(a1 + 64);
    id v9 = v8;
  }
  uint64_t v10 = [v8 attachmentSerializationModeForStream:&v66 withDefaultMode:1 fromMap:v9 + 168];
  if (SHIBYTE(v66.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v66.__r_.__value_.__l.__data_);
  }
  if (v6)
  {
    if (v10 == 1) {
      goto LABEL_16;
    }
  }
  else if (v10 == 1 || !v7)
  {
    goto LABEL_16;
  }
  id v12 = (id)[MEMORY[0x263F087E8] writerWarningWithMessage:@"Mode for pixel buffer attachments for RawBayer pixel buffers is not set to PLIST! Default format is overridden by client (kMIOFrameAttachmentSerializationMode), this will be ignored for RawBayer.", 0 code];
  uint64_t v10 = 1;
LABEL_16:
  uint64_t v13 = *(void *)(a1 + 72);
  uint64_t v14 = *(void **)(a1 + 32);
  uint64_t v15 = *(void *)(a1 + 40);
  long long v64 = *(_OWORD *)(a1 + 88);
  uint64_t v65 = *(void *)(a1 + 104);
  uint64_t v5 = [v14 getMetadataGroupForBuffer:v13 stream:v15 presentationTime:&v64 serializationMode:v10];
LABEL_17:
  uint64_t v16 = (void *)v4[11];
  uint64_t v17 = *(void *)(a1 + 72);
  id v63 = 0;
  unint64_t v18 = (void *)[v16 processedPixelBufferCopyOf:v17 streamData:v4 error:&v63];
  id v19 = v63;
  CFRelease(*(CFTypeRef *)(a1 + 72));
  char v20 = *(void **)(a1 + 32);
  if (v18)
  {
    if ([v20 canWriteData])
    {
      CMSampleBufferRef sampleBufferOut = 0;
      long long v21 = *(_OWORD *)(MEMORY[0x263F01110] + 48);
      *(_OWORD *)&sampleTiming.presentationTimeStamp.timescale = *(_OWORD *)(MEMORY[0x263F01110] + 32);
      *(_OWORD *)&sampleTiming.decodeTimeStamp.unint64_t value = v21;
      CMTimeEpoch v22 = *(void *)(MEMORY[0x263F01110] + 64);
      long long v23 = *(_OWORD *)(MEMORY[0x263F01110] + 16);
      *(_OWORD *)&sampleTiming.duration.unint64_t value = *MEMORY[0x263F01110];
      *(_OWORD *)&sampleTiming.duration.epoch = v23;
      id v24 = (long long *)(a1 + 88);
      *(_OWORD *)&sampleTiming.presentationTimeStamp.unint64_t value = *(_OWORD *)(a1 + 88);
      CMTimeEpoch v25 = *(void *)(a1 + 104);
      sampleTiming.decodeTimeStamp.epoch = v22;
      sampleTiming.presentationTimeStamp.epoch = v25;
      id v26 = (void *)v4[6];
      if (v26)
      {
        long long v59 = *v24;
        uint64_t v60 = *(void *)(a1 + 104);
        [v26 encodeFrame:v18 pts:&v59 frameProperties:0 metadata:v5];
        CFRelease(v18);
      }
      else
      {
        id v32 = (const opaqueCMFormatDescription *)[(id)v4[11] formatDescriptionForPixelBuffer:v18 streamData:v4];
        uint64_t v33 = CMSampleBufferCreateForImageBuffer((CFAllocatorRef)*MEMORY[0x263EFFB08], (CVImageBufferRef)v18, 1u, 0, 0, v32, &sampleTiming, &sampleBufferOut);
        if (sampleBufferOut)
        {
          int64_t v34 = (uint64_t **)(*(void *)(a1 + 32) + 288);
          uint64_t v67 = (long long *)(a1 + 48);
          long long v35 = std::__tree<std::__value_type<std::string,CMTime>,std::__map_value_compare<std::string,std::__value_type<std::string,CMTime>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,CMTime>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(v34, (const void **)(a1 + 48), (uint64_t)&std::piecewise_construct, &v67);
          CMTimeValue v37 = v35[7];
          id v36 = v35 + 7;
          CMTimeValue v68 = v37;
          CMTimeFlags v38 = *((_DWORD *)v36 + 3);
          CMTimeScale v69 = *((_DWORD *)v36 + 2);
          if ((v38 & 1) == 0) {
            goto LABEL_27;
          }
          CMTimeEpoch v39 = v36[2];
          CMTimeValue v40 = *v36;
          time1.timescale = *((_DWORD *)v36 + 2);
          time1.flags = v38;
          time1.epoch = v39;
          *(_OWORD *)&time2.unint64_t value = *v24;
          time2.epoch = *(void *)(a1 + 104);
          time1.unint64_t value = v40;
          if (CMTimeCompare(&time1, &time2) < 0)
          {
LABEL_27:
            v45 = *(void **)(a1 + 32);
            CMSampleBufferRef v46 = sampleBufferOut;
            long long v53 = *v24;
            uint64_t v54 = *(void *)(a1 + 104);
            if (*(char *)(a1 + 71) < 0)
            {
              std::string::__init_copy_ctor_external(&v52, *(const std::string::value_type **)(a1 + 48), *(void *)(a1 + 56));
            }
            else
            {
              *(_OWORD *)&v52.__r_.__value_.__l.__data_ = *v3;
              v52.__r_.__value_.__r.__words[2] = *(void *)(a1 + 64);
            }
            [v45 newSampleReady:v46 metadata:v5 presentationTime:&v53 streamKey:&v52 streamId:*(void *)(a1 + 40) isAudioSample:0];
            if (SHIBYTE(v52.__r_.__value_.__r.__words[2]) < 0) {
              operator delete(v52.__r_.__value_.__l.__data_);
            }
          }
          else
          {
            CFRelease(sampleBufferOut);
            id v41 = NSString;
            *(_OWORD *)&time.unint64_t value = *v24;
            time.epoch = *(void *)(a1 + 104);
            Float64 Seconds = CMTimeGetSeconds(&time);
            v55.unint64_t value = v68;
            v55.timescale = v69;
            v55.flags = v38;
            v55.epoch = v39;
            id v43 = [v41 stringWithFormat:@"Sample buffer was appended with presentation timestamp (%f) less than (or equal to) previous sample buffer (%f) for stream '%@'. Dropping frame.", *(void *)&Seconds, CMTimeGetSeconds(&v55), *(void *)(a1 + 40)];
            v44 = [MEMORY[0x263F087E8] streamErrorWithMessage:v43 code:15];
            [*(id *)(a1 + 32) informDelegateAboutError:v44];
          }
        }
        else
        {
          uint64_t v47 = v33;
          unint64_t v48 = +[MOVStreamIOUtility formatForPixelBuffer:v18];
          v49 = [NSString stringWithFormat:@"Sample buffer creation failed (error: %i) for stream '%@'. Dropping frame. Info: Used FD: %@  Buffer FD: %@", v47, *(void *)(a1 + 40), v32, v48];
          if (v48) {
            CFRelease(v48);
          }
          uint64_t v50 = [MEMORY[0x263F087E8] streamErrorWithMessage:v49 code:14];
          [*(id *)(a1 + 32) informDelegateAboutError:v50];
        }
        CFRelease(v18);
      }
      id v51 = *(id *)(*(void *)(a1 + 80) + 176);
      objc_sync_enter(v51);
      --v4[21];
      objc_sync_exit(v51);
    }
    else
    {
      CFRelease(v18);
      id v31 = *(id *)(*(void *)(a1 + 80) + 176);
      objc_sync_enter(v31);
      --v4[21];
      objc_sync_exit(v31);
    }
  }
  else
  {
    id v27 = v20;
    objc_sync_enter(v27);
    char v28 = *(id **)(a1 + 32);
    id v29 = [v28[46] criticalErrorOccurred:v19 context:v28];
    [v28 activateNewState:v29 byEvent:@"appendPixelBuffer"];

    objc_sync_exit(v27);
    id v30 = *(id *)(*(void *)(a1 + 80) + 176);
    objc_sync_enter(v30);
    --v4[21];
    objc_sync_exit(v30);
  }
}

- (void)appendVideoSampleBuffer:(opaqueCMSampleBuffer *)a3 attachmentMetadata:(id)a4 streamId:(id)a5
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a5;
  if (!a3)
  {
    uint64_t v16 = @"Sample Buffer cannot be nil.";
    goto LABEL_23;
  }
  if (!v8)
  {
    uint64_t v16 = @"Attachments cannot be nil.";
LABEL_23:
    id v17 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498] reason:v16 userInfo:0];
    objc_exception_throw(v17);
  }
  id v10 = v9;
  std::string::basic_string[abi:ne180100]<0>(&v30, (char *)[v10 UTF8String]);
  {
    id v18 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498] reason:@"Cannot append to a stream that hasn't been set up." userInfo:0];
    objc_exception_throw(v18);
  }
  if (![(MOVStreamWriter *)self getPixelFormatForStream:v10 fromMap:&self->m_streamDataMap])
  {
    [NSString stringWithFormat:@"Pixel format not defined for stream '%@'.", v10];
    id v19 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF488] reason:objc_claimAutoreleasedReturnValue() userInfo:0];
    objc_exception_throw(v19);
  }
  memset(&v29, 0, sizeof(v29));
  CMSampleBufferGetPresentationTimeStamp(&v29, a3);
  if ((v29.flags & 1) == 0)
  {
    [NSString stringWithFormat:@"Sample Buffer with invalid PTS for stream '%@'.", v10];
    id v20 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF488] reason:objc_claimAutoreleasedReturnValue() userInfo:0];
    objc_exception_throw(v20);
  }
  [(MOVStreamWriter *)self sessionStartTime];
  if ((v33[0] & 1) == 0)
  {
    CMTime v28 = v29;
    [(MOVStreamWriter *)self setSessionStartTime:&v28];
  }
  if ([(MOVStreamWriter *)self encoderTypeForStream:v10] - 19 <= 0xFFFFFFFD)
  {
    id v21 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498] reason:@"Cannot append sample buffer with encoder type not MIOStreamEncoderTypeNone." userInfo:0];
    objc_exception_throw(v21);
  }
  if (+[MIOLog debugEnabled])
  {
    uint64_t v11 = +[MIOLog defaultLog];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      CMTime time = v29;
      Float64 Seconds = CMTimeGetSeconds(&time);
      *(_DWORD *)buf = 134218242;
      Float64 v32 = Seconds;
      v33[0] = 2114;
      *(void *)&v33[1] = v10;
      _os_log_impl(&dword_21B5ED000, v11, OS_LOG_TYPE_DEBUG, "MOVStreamWriter appendSampleBuffer at '%5.3f' to stream '%{public}@'", buf, 0x16u);
    }
  }
  CFRetain(a3);
  m_processingQueue = self->m_processingQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3321888768;
  block[2] = __71__MOVStreamWriter_appendVideoSampleBuffer_attachmentMetadata_streamId___block_invoke;
  block[3] = &unk_26CB69858;
  void block[4] = self;
  CMTimeEpoch v25 = a3;
  id v14 = v8;
  id v23 = v14;
  __p[1] = (std::string)v29;
  if (SHIBYTE(v30.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(__p, v30.__r_.__value_.__l.__data_, v30.__r_.__value_.__l.__size_);
  }
  else {
    __p[0] = v30;
  }
  id v15 = v10;
  id v24 = v15;
  dispatch_async(m_processingQueue, block);

  if (SHIBYTE(__p[0].__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p[0].__r_.__value_.__l.__data_);
  }

  if (SHIBYTE(v30.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v30.__r_.__value_.__l.__data_);
  }
}

void __71__MOVStreamWriter_appendVideoSampleBuffer_attachmentMetadata_streamId___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x21D4924B0]();
  uint64_t v3 = *(void *)(a1 + 56);
  int v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  long long v7 = *(_OWORD *)(a1 + 88);
  uint64_t v8 = *(void *)(a1 + 104);
  if (*(char *)(a1 + 87) < 0) {
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)(a1 + 64), *(void *)(a1 + 72));
  }
  else {
    std::string __p = *(std::string *)(a1 + 64);
  }
  [v4 newSampleReady:v3 metadata:v5 presentationTime:&v7 streamKey:&__p streamId:*(void *)(a1 + 48) isAudioSample:0];
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
}

- (void)appendSampleBuffer:(opaqueCMSampleBuffer *)a3 attachments:(id)a4 streamId:(id)a5
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a5;
  if (!a3)
  {
    id v16 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498] reason:@"Sample Buffer cannot be nil." userInfo:0];
    objc_exception_throw(v16);
  }
  id v10 = v9;
  std::string::basic_string[abi:ne180100]<0>(&v30, (char *)[v10 UTF8String]);
  {
    id v17 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498] reason:@"Cannot append to a stream that hasn't been set up." userInfo:0];
    objc_exception_throw(v17);
  }
  if (([(MOVStreamWriterState *)self->_state canAppendData:self] & 1) == 0)
  {
    [NSString stringWithFormat:@"Cannot append: writer is not recording. Current writer state: %@", objc_opt_class()];
    id v18 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498] reason:objc_claimAutoreleasedReturnValue() userInfo:0];
    objc_exception_throw(v18);
  }
  if (![(MOVStreamWriter *)self getPixelFormatForStream:v10 fromMap:&self->m_streamDataMap])
  {
    [NSString stringWithFormat:@"Pixel format not defined for stream '%@'.", v10];
    id v19 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF488] reason:objc_claimAutoreleasedReturnValue() userInfo:0];
    objc_exception_throw(v19);
  }
  memset(&v29, 0, sizeof(v29));
  CMSampleBufferGetPresentationTimeStamp(&v29, a3);
  if (+[MIOLog debugEnabled])
  {
    uint64_t v11 = +[MIOLog defaultLog];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      CMTime time = v29;
      Float64 Seconds = CMTimeGetSeconds(&time);
      *(_DWORD *)buf = 134218242;
      Float64 v32 = Seconds;
      v33[0] = 2114;
      *(void *)&v33[1] = v10;
      _os_log_impl(&dword_21B5ED000, v11, OS_LOG_TYPE_DEBUG, "MOVStreamWriter appendSampleBuffer at '%5.3f' to stream '%{public}@'", buf, 0x16u);
    }
  }
  [(MOVStreamWriter *)self sessionStartTime];
  if ((v33[0] & 1) == 0)
  {
    CMTime v27 = v29;
    [(MOVStreamWriter *)self setSessionStartTime:&v27];
  }
  CFRetain(a3);
  m_processingQueue = self->m_processingQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3321888768;
  block[2] = __59__MOVStreamWriter_appendSampleBuffer_attachments_streamId___block_invoke;
  block[3] = &unk_26CB69820;
  id v14 = v8;
  id v21 = v14;
  CMTimeEpoch v22 = self;
  if (SHIBYTE(v30.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&__p, v30.__r_.__value_.__l.__data_, v30.__r_.__value_.__l.__size_);
  }
  else {
    std::string __p = v30;
  }
  CMTimeEpoch v25 = a3;
  CMTime v26 = v29;
  id v15 = v10;
  id v23 = v15;
  dispatch_async(m_processingQueue, block);

  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }

  if (SHIBYTE(v30.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v30.__r_.__value_.__l.__data_);
  }
}

void __59__MOVStreamWriter_appendSampleBuffer_attachments_streamId___block_invoke(uint64_t a1)
{
  v28[1] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x21D4924B0]();
  if (*(void *)(a1 + 32))
  {
    uint64_t v3 = *(char **)(a1 + 40);
    if (*(char *)(a1 + 79) < 0)
    {
      std::string::__init_copy_ctor_external(&v27, *(const std::string::value_type **)(a1 + 56), *(void *)(a1 + 64));
      int v4 = *(char **)(a1 + 40);
    }
    else
    {
      std::string v27 = *(std::string *)(a1 + 56);
      int v4 = v3;
    }
    int v6 = [v3 attachmentSerializationModeForStream:&v27 withDefaultMode:1 fromMap:v4 + 168];
    if (SHIBYTE(v27.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v27.__r_.__value_.__l.__data_);
    }
    long long v7 = (void *)[*(id *)(a1 + 32) copy];
    if (v6)
    {
      id v8 = +[MOVStreamIOUtility getPlistFriendlyCopyOf:v7];

      CMTimeEpoch v25 = 0;
      uint64_t v9 = [MEMORY[0x263F08AC0] dataWithPropertyList:v8 format:200 options:0 error:&v25];
      id v10 = v25;
    }
    else
    {
      id v8 = +[MOVStreamIOUtility getJsonFriendlyCopy:v7];

      CMTime v26 = 0;
      uint64_t v9 = [MEMORY[0x263F08900] dataWithJSONObject:v8 options:0 error:&v26];
      id v10 = v26;
    }
    uint64_t v11 = (void *)v9;
    id v12 = v10;
    if (v12)
    {
      uint64_t v13 = v12;
      [*(id *)(a1 + 40) informDelegateAboutError:v12];
      CFRelease(*(CFTypeRef *)(a1 + 80));

      uint64_t v5 = 0;
      goto LABEL_19;
    }
    id v14 = [MEMORY[0x263EFA790] metadataItem];
    [v14 setIdentifier:@"mdta/com.apple.stream_sample_attachments"];
    [v14 setDataType:*MEMORY[0x263F00F50]];
    [v14 setExtraAttributes:0];
    [v14 setValue:v11];
    id v15 = objc_alloc(MEMORY[0x263EFA8C0]);
    v28[0] = v14;
    id v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v28 count:1];
    CMTime start = *(CMTime *)(a1 + 88);
    CMTime duration = *(CMTime *)*(void *)&MEMORY[0x263F01098];
    CMTimeRangeMake(&v24, &start, &duration);
    uint64_t v5 = (void *)[v15 initWithItems:v16 timeRange:&v24];
  }
  else
  {
    uint64_t v5 = 0;
  }
  id v17 = *(void **)(a1 + 40);
  uint64_t v18 = *(void *)(a1 + 80);
  long long v20 = *(_OWORD *)(a1 + 88);
  uint64_t v21 = *(void *)(a1 + 104);
  if (*(char *)(a1 + 79) < 0) {
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)(a1 + 56), *(void *)(a1 + 64));
  }
  else {
    std::string __p = *(std::string *)(a1 + 56);
  }
  [v17 newSampleReady:v18 metadata:v5 presentationTime:&v20 streamKey:&__p streamId:*(void *)(a1 + 48) isAudioSample:0];
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
LABEL_19:
}

- (void)newSampleReady:(opaqueCMSampleBuffer *)a3 metadata:(id)a4 presentationTime:(id *)a5 streamKey:()basic_string<char streamId:()std:(std::allocator<char>> *)a6 :char_traits<char> isAudioSample:
{
  char v28 = v7;
  id v8 = v6;
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v13 = a4;
  id v14 = v8;
  if ([(MOVStreamWriter *)self isOrWasCanceled])
  {
    CFRelease(a3);
  }
  else
  {
    std::string v27 = a5;
    id v16 = (id)v15[7];
    objc_sync_enter(v16);
    id v17 = objc_opt_new();
    [v17 setSampleBuffer:a3];
    [v17 setMetadata:v13];
    [v16 addObject:v17];
    objc_msgSend((id)v15[25], "setFifoItemCount:", objc_msgSend(v16, "count"));
    if (+[MIOLog debugEnabled])
    {
      uint64_t v18 = +[MIOLog defaultLog];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v14;
        __int16 v30 = 2048;
        uint64_t v31 = [v16 count];
        _os_log_impl(&dword_21B5ED000, v18, OS_LOG_TYPE_DEBUG, "[FIFO] add to fifo '%{public}@' %lu", buf, 0x16u);
      }
    }
    if ([v16 count] > (unint64_t)v15[8]
      && [(MOVStreamWriter *)self fifoDropsEnabled:v15])
    {
      CMTime v26 = [v16 firstObject];
      id v19 = (const void *)[v26 sampleBuffer];
      [v16 removeObjectAtIndex:0];
      CFRelease(v19);
      var0 = a6;
      if (*((char *)&a6->var0.var0.var0.var1 + 23) < 0) {
        var0 = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)a6->var0.var0.var0.var1.var0;
      }
      uint64_t v21 = [NSString stringWithFormat:@"[FIFO] FIFO buffer for stream '%s' is full, dropping older buffer (%llu/%llu/%llu/%llu) .", var0, -[MOVStreamWriter writeThreadCount](self, "writeThreadCount"), objc_msgSend((id)v15[25], "visitCount"), objc_msgSend((id)v15[25], "attemptCount"), objc_msgSend((id)v15[25], "writeCount")];
      CMTimeEpoch v22 = [MEMORY[0x263F087E8] streamErrorWithMessage:v21 code:18];
      id v23 = [v22 errorByAddingStreamId:v14];

      [(MOVStreamWriter *)self informDelegateAboutError:v23];
    }

    objc_sync_exit(v16);
    if ((v28 & 1) == 0)
    {
      *(void *)buf = a6;
      CMTimeRange v24 = std::__tree<std::__value_type<std::string,CMTime>,std::__map_value_compare<std::string,std::__value_type<std::string,CMTime>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,CMTime>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t **)&self->m_lastPtsForStream, (const void **)a6, (uint64_t)&std::piecewise_construct, (long long **)buf);
      long long v25 = *(_OWORD *)&v27->var0;
      v24[9] = v27->var3;
      *(_OWORD *)(v24 + 7) = v25;
    }
    [(MOVStreamWriter *)self consumeSamplesOfVideoAudioStream:v14];
  }
}

- (void)encoder:(id)a3 encodedSampleBuffer:(opaqueCMSampleBuffer *)a4 metadata:(id)a5 presentationTime:(id *)a6 streamId:(id)a7
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a5;
  id v14 = a7;
  std::string::basic_string[abi:ne180100]<0>(&v37, (char *)[v14 UTF8String]);
  CMTimeFlags v38 = &v37;
  id v15 = std::__tree<std::__value_type<std::string,CMTime>,std::__map_value_compare<std::string,std::__value_type<std::string,CMTime>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,CMTime>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t **)&self->m_lastPtsForStream, (const void **)&v37.__r_.__value_.__l.__data_, (uint64_t)&std::piecewise_construct, (long long **)&v38);
  CMTimeValue v17 = v15[7];
  id v16 = v15 + 7;
  CMTimeValue v39 = v17;
  CMTimeFlags v18 = *((_DWORD *)v16 + 3);
  CMTimeScale v40 = *((_DWORD *)v16 + 2);
  if ((v18 & 1) == 0
    || (CMTimeEpoch v19 = v16[2],
        time1.unint64_t value = *v16,
        time1.timescale = *((_DWORD *)v16 + 2),
        time1.flags = v18,
        time1.epoch = v19,
        CMTime time2 = (CMTime)*a6,
        CMTimeCompare(&time1, &time2) < 0)
    || ([v12 frameReorderingEnabled] & 1) != 0)
  {
    long long v20 = [(MOVStreamWriter *)self delegate];
    char v21 = objc_opt_respondsToSelector();

    if ((v21 & 1) == 0
      || ([(MOVStreamWriter *)self delegate],
          CMTimeEpoch v22 = objc_claimAutoreleasedReturnValue(),
          long long v31 = *(_OWORD *)&a6->var0,
          int64_t v32 = a6->var3,
          char v23 = [v22 streamWriter:self encodedBuffer:a4 pts:&v31 metadata:v13 forStream:v14],
          v22,
          (v23 & 1) == 0))
    {
      long long v29 = *(_OWORD *)&a6->var0;
      int64_t var3 = a6->var3;
      if (SHIBYTE(v37.__r_.__value_.__r.__words[2]) < 0) {
        std::string::__init_copy_ctor_external(&v28, v37.__r_.__value_.__l.__data_, v37.__r_.__value_.__l.__size_);
      }
      else {
        std::string v28 = v37;
      }
      [(MOVStreamWriter *)self newSampleReady:a4 metadata:v13 presentationTime:&v29 streamKey:&v28 streamId:v14 isAudioSample:0];
      if (SHIBYTE(v28.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v28.__r_.__value_.__l.__data_);
      }
    }
  }
  else
  {
    CFRelease(a4);
    CMTimeRange v24 = NSString;
    CMTime time = (CMTime)*a6;
    Float64 Seconds = CMTimeGetSeconds(&time);
    v33.unint64_t value = v39;
    v33.timescale = v40;
    v33.flags = v18;
    v33.epoch = v19;
    CMTime v26 = [v24 stringWithFormat:@"Sample buffer was appended with presentation timestamp (%f) less than (or equal to) previous sample buffer (%f) for stream '%@'. Dropping frame.", *(void *)&Seconds, CMTimeGetSeconds(&v33), v14];
    std::string v27 = [MEMORY[0x263F087E8] streamErrorWithMessage:v26 code:15];
    [(MOVStreamWriter *)self informDelegateAboutError:v27];
  }
  if (SHIBYTE(v37.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v37.__r_.__value_.__l.__data_);
  }
}

- (void)encoder:(id)a3 encodingFailedForStream:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  char v7 = self;
  objc_sync_enter(v7);
  id v8 = [NSString stringWithFormat:@"Sample buffer encoding failed (encoder status: %i flags: %d) for stream '%@'.", objc_msgSend(v11, "lastEncodingStatus"), objc_msgSend(v11, "lastEncodingInfoFlags"), v6];
  uint64_t v9 = [MEMORY[0x263F087E8] streamErrorWithMessage:v8 code:14];
  id v10 = [(MOVStreamWriterState *)v7->_state criticalErrorOccurred:v9 context:v7];
  [(MOVStreamWriter *)v7 activateNewState:v10 byEvent:@"encodingFailedForStream"];

  objc_sync_exit(v7);
}

- (void)simulateFailure
{
  id v4 = [MEMORY[0x263F087E8] streamErrorWithMessage:@"SIMULATED ERROR FOR TESTING" code:0];
  uint64_t v3 = -[MOVStreamWriterState criticalErrorOccurred:context:](self->_state, "criticalErrorOccurred:context:");
  [(MOVStreamWriter *)self activateNewState:v3 byEvent:@"simulateFailure"];
}

- (id)encoder:(id)a3 overrideVideoEncoderSpecificationForStreamId:(id)a4
{
  id v5 = a4;
  id v6 = [(MOVStreamWriter *)self customEncoderConfigDelegate];

  if (v6)
  {
    char v7 = [(MOVStreamWriter *)self customEncoderConfigDelegate];
    id v8 = [(MOVStreamWriter *)v7 streamWriter:self overrideVideoEncoderSpecificationForStream:v5];
  }
  else
  {
    char v7 = self;
    objc_sync_enter(v7);
    uint64_t v9 = [NSString stringWithFormat:@"Missing customEncoderConfigDelegate '%@'. Cannot encode!", v5];
    id v10 = [MEMORY[0x263F087E8] streamErrorWithMessage:v9 code:14];
    id v11 = [(MOVStreamWriterState *)v7->_state criticalErrorOccurred:v10 context:v7];
    [(MOVStreamWriter *)v7 activateNewState:v11 byEvent:@"overrideVideoEncoderSpecificationForStreamId"];

    objc_sync_exit(v7);
    id v8 = 0;
  }

  return v8;
}

- (BOOL)encoder:(id)a3 configureSessionOverride:(OpaqueVTCompressionSession *)a4 streamId:(id)a5
{
  id v7 = a5;
  id v8 = [(MOVStreamWriter *)self customEncoderConfigDelegate];

  if (v8)
  {
    uint64_t v9 = [(MOVStreamWriter *)self customEncoderConfigDelegate];
    char v10 = [(MOVStreamWriter *)v9 streamWriter:self configureSessionOverride:a4 forStream:v7];
  }
  else
  {
    uint64_t v9 = self;
    objc_sync_enter(v9);
    id v11 = [NSString stringWithFormat:@"Missing customEncoderConfigDelegate '%@'. Cannot encode!", v7];
    id v12 = [MEMORY[0x263F087E8] streamErrorWithMessage:v11 code:14];
    id v13 = [(MOVStreamWriterState *)v9->_state criticalErrorOccurred:v12 context:v9];
    [(MOVStreamWriter *)v9 activateNewState:v13 byEvent:@"configureSessionOverride"];

    objc_sync_exit(v9);
    char v10 = 0;
  }

  return v10;
}

- (unsigned)encoder:(id)a3 codecTypeOverrideForstreamId:(id)a4
{
  id v5 = a4;
  id v6 = [(MOVStreamWriter *)self customEncoderConfigDelegate];

  if (v6)
  {
    id v7 = [(MOVStreamWriter *)self customEncoderConfigDelegate];
    unsigned int v8 = [(MOVStreamWriter *)v7 streamWriter:self codecTypeOverrideForStream:v5];
  }
  else
  {
    id v7 = self;
    objc_sync_enter(v7);
    uint64_t v9 = [NSString stringWithFormat:@"Missing customEncoderConfigDelegate '%@'. Cannot encode!", v5];
    char v10 = [MEMORY[0x263F087E8] streamErrorWithMessage:v9 code:14];
    id v11 = [(MOVStreamWriterState *)v7->_state criticalErrorOccurred:v10 context:v7];
    [(MOVStreamWriter *)v7 activateNewState:v11 byEvent:@"codecTypeOverrideForstreamId"];

    objc_sync_exit(v7);
    unsigned int v8 = 0;
  }

  return v8;
}

- (void)appendTimeMetadataGroup:(id)a3 toStream:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  std::string::basic_string[abi:ne180100]<0>(v22, (char *)[v7 UTF8String]);
  {
    id v13 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498] reason:@"Cannot append metadata when the track was never added. Call addMetadataTrack: before prepareToRecord." userInfo:0];
    objc_exception_throw(v13);
  }
  if (v6)
  {
    [v6 timeRange];
  }
  else
  {
    long long v25 = 0u;
    memset(buf, 0, sizeof(buf));
  }
  CMTime v21 = *(CMTime *)buf;
  if (+[MIOLog debugEnabled])
  {
    unsigned int v8 = +[MIOLog defaultLog];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      CMTime time = v21;
      Float64 Seconds = CMTimeGetSeconds(&time);
      *(_DWORD *)buf = 134218242;
      *(Float64 *)&uint8_t buf[4] = Seconds;
      *(_WORD *)&unsigned char buf[12] = 2114;
      *(void *)&buf[14] = v7;
      _os_log_impl(&dword_21B5ED000, v8, OS_LOG_TYPE_DEBUG, "MOVStreamWriter metadata group at '%5.3f' to stream '%{public}@'", buf, 0x16u);
    }
  }
  [(MOVStreamWriter *)self sessionStartTime];
  if ((buf[12] & 1) == 0)
  {
    CMTime v19 = v21;
    [(MOVStreamWriter *)self setSessionStartTime:&v19];
  }
  m_processingQueue = self->m_processingQueue;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __52__MOVStreamWriter_appendTimeMetadataGroup_toStream___block_invoke;
  v14[3] = &unk_2643AF698;
  CMTime v18 = v21;
  id v11 = v7;
  id v15 = v11;
  id v16 = self;
  id v12 = v6;
  id v17 = v12;
  dispatch_async(m_processingQueue, v14);

  if (v23 < 0) {
    operator delete((void *)v22[0]);
  }
}

void __52__MOVStreamWriter_appendTimeMetadataGroup_toStream___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x21D4924B0]();
  if (*(unsigned char *)(a1 + 68))
  {
    [*(id *)(a1 + 40) queueMetadataGroup:*(void *)(a1 + 48) stream:*(void *)(a1 + 32)];
  }
  else
  {
    uint64_t v3 = [NSString stringWithFormat:@"Invalid time stamp is not supported for metadata for stream '%@'.", *(void *)(a1 + 32)];
    id v4 = [MEMORY[0x263F087E8] streamErrorWithMessage:v3 code:16];
    [*(id *)(a1 + 40) informDelegateAboutError:v4];
  }
}

- (void)appendTimeCode:(CVSMPTETime *)a3 startTime:(unint64_t)a4 endTime:(unint64_t)a5 withTimeStamp:(id *)a6 toStream:(id)a7
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v12 = a7;
  std::string::basic_string[abi:ne180100]<0>(&v45, (char *)[v12 UTF8String]);
  {
    uint64_t v26 = @"Cannot append metadata when the track was never added. Call addMetadataTrack: before prepareToRecord.";
    goto LABEL_23;
  }
  {
    uint64_t v26 = @"Can only append metadata to time range metadata track.";
LABEL_23:
    id v27 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498] reason:v26 userInfo:0];
    objc_exception_throw(v27);
  }
  *(void *)buf = &v45;
  id v13 = std::__tree<std::__value_type<std::string,CMTime>,std::__map_value_compare<std::string,std::__value_type<std::string,CMTime>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,CMTime>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t **)&self->m_lastPtsForMetadataStream, (const void **)&v45.__r_.__value_.__l.__data_, (uint64_t)&std::piecewise_construct, (long long **)buf);
  CMTimeValue v15 = v13[7];
  id v14 = v13 + 7;
  CMTimeValue v48 = v15;
  CMTimeFlags v16 = *((_DWORD *)v14 + 3);
  CMTimeScale v49 = *((_DWORD *)v14 + 2);
  if ((v16 & 1) == 0
    || (CMTimeEpoch v17 = v14[2],
        CMTimeValue v18 = *v14,
        time1.timescale = *((_DWORD *)v14 + 2),
        time1.flags = v16,
        time1.epoch = v17,
        CMTime time2 = (CMTime)*a6,
        time1.unint64_t value = v18,
        CMTimeCompare(&time1, &time2) < 0))
  {
    if (+[MIOLog debugEnabled])
    {
      char v23 = +[MIOLog defaultLog];
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        CMTime v40 = (CMTime)*a6;
        Float64 Seconds = CMTimeGetSeconds(&v40);
        *(_DWORD *)buf = 134218242;
        *(Float64 *)&uint8_t buf[4] = Seconds;
        v47[0] = 2114;
        *(void *)&v47[1] = v12;
        _os_log_impl(&dword_21B5ED000, v23, OS_LOG_TYPE_DEBUG, "MOVStreamWriter time range metadata at '%5.3f' to stream '%{public}@'", buf, 0x16u);
      }
    }
    [(MOVStreamWriter *)self sessionStartTime];
    if ((v47[0] & 1) == 0)
    {
      long long v38 = *(_OWORD *)&a6->var0;
      int64_t var3 = a6->var3;
      [(MOVStreamWriter *)self setSessionStartTime:&v38];
    }
    m_processingQueue = self->m_processingQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3321888768;
    block[2] = __75__MOVStreamWriter_appendTimeCode_startTime_endTime_withTimeStamp_toStream___block_invoke;
    block[3] = &unk_26CB697B0;
    unint64_t v31 = a4;
    unint64_t v32 = a5;
    long long v34 = *(_OWORD *)&a3->subframes;
    uint64_t v35 = *(void *)&a3->hours;
    long long v36 = *(_OWORD *)&a6->var0;
    int64_t v37 = a6->var3;
    id v29 = v12;
    __int16 v30 = self;
    if (SHIBYTE(v45.__r_.__value_.__r.__words[2]) < 0) {
      std::string::__init_copy_ctor_external(&__p, v45.__r_.__value_.__l.__data_, v45.__r_.__value_.__l.__size_);
    }
    else {
      std::string __p = v45;
    }
    dispatch_async(m_processingQueue, block);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
    CMTime v21 = v29;
  }
  else
  {
    CMTime v19 = NSString;
    CMTime time = (CMTime)*a6;
    Float64 v20 = CMTimeGetSeconds(&time);
    v41.unint64_t value = v48;
    v41.timescale = v49;
    v41.flags = v16;
    v41.epoch = v17;
    CMTime v21 = [v19 stringWithFormat:@"Metadata was appended with presentation timestamp (%f) less than (or equal to) previous sample buffer (%f) for stream '%@'. Dropping sample.", *(void *)&v20, CMTimeGetSeconds(&v41), v12];
    CMTimeEpoch v22 = [MEMORY[0x263F087E8] streamErrorWithMessage:v21 code:15];
    [(MOVStreamWriter *)self informDelegateAboutError:v22];
  }
  if (SHIBYTE(v45.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v45.__r_.__value_.__l.__data_);
  }
}

void __75__MOVStreamWriter_appendTimeCode_startTime_endTime_withTimeStamp_toStream___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x21D4924B0]();
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:3];
  id v4 = [MEMORY[0x263EFA748] metadataItemForTimeRangeMetadataStartTime:*(void *)(a1 + 48)];
  [v3 addObject:v4];

  id v5 = [MEMORY[0x263EFA748] metadataItemForTimeRangeMetadataEndTime:*(void *)(a1 + 56)];
  [v3 addObject:v5];

  long long v17 = *(_OWORD *)(a1 + 88);
  uint64_t v18 = *(void *)(a1 + 104);
  id v6 = [MEMORY[0x263EFA748] metadataItemForTimeCode:&v17];
  [v3 addObject:v6];

  if (*(unsigned char *)(a1 + 124))
  {
    id v9 = objc_alloc(MEMORY[0x263EFA8C0]);
    CMTime start = *(CMTime *)(a1 + 112);
    CMTime duration = *(CMTime *)*(void *)&MEMORY[0x263F01098];
    CMTimeRangeMake(&v16, &start, &duration);
    id v7 = (void *)[v9 initWithItems:v3 timeRange:&v16];
    if (!v7)
    {
      id v13 = (id)[MEMORY[0x263F087E8] writerWarningWithMessage:@"No metadata appended because the AVTimedMetadataGroup* is nil" code:0];
      goto LABEL_6;
    }
    [*(id *)(a1 + 40) queueMetadataGroup:v7 stream:*(void *)(a1 + 32)];
    char v10 = (uint64_t **)(*(void *)(a1 + 40) + 312);
    CMTime v19 = (long long *)(a1 + 64);
    id v11 = std::__tree<std::__value_type<std::string,CMTime>,std::__map_value_compare<std::string,std::__value_type<std::string,CMTime>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,CMTime>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(v10, (const void **)(a1 + 64), (uint64_t)&std::piecewise_construct, &v19);
    long long v12 = *(_OWORD *)(a1 + 112);
    v11[9] = *(void *)(a1 + 128);
    *(_OWORD *)(v11 + 7) = v12;
  }
  else
  {
    id v7 = [NSString stringWithFormat:@"Invalid time stamp is not supported for metadata for stream '%@'.", *(void *)(a1 + 32)];
    unsigned int v8 = [MEMORY[0x263F087E8] streamErrorWithMessage:v7 code:16];
    [*(id *)(a1 + 40) informDelegateAboutError:v8];
  }
LABEL_6:
}

- (void)appendMetadata:(id)a3 withTimeStamp:(id *)a4 toStream:(id)a5
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  std::string::basic_string[abi:ne180100]<0>(&v26, (char *)[v9 UTF8String]);
  {
    id v15 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498] reason:@"Cannot append metadata when the track was never added. Call addMetadataTrack: before prepareToRecord." userInfo:0];
    objc_exception_throw(v15);
  }
  if (+[MIOLog debugEnabled])
  {
    char v10 = +[MIOLog defaultLog];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      CMTime time = (CMTime)*a4;
      Float64 Seconds = CMTimeGetSeconds(&time);
      *(_DWORD *)buf = 134218242;
      Float64 v28 = Seconds;
      v29[0] = 2114;
      *(void *)&v29[1] = v9;
      _os_log_impl(&dword_21B5ED000, v10, OS_LOG_TYPE_DEBUG, "MOVStreamWriter metadata at '%5.3f' to stream '%{public}@'", buf, 0x16u);
    }
  }
  [(MOVStreamWriter *)self sessionStartTime];
  if ((v29[0] & 1) == 0)
  {
    long long v23 = *(_OWORD *)&a4->var0;
    int64_t var3 = a4->var3;
    [(MOVStreamWriter *)self setSessionStartTime:&v23];
  }
  m_processingQueue = self->m_processingQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3321888768;
  block[2] = __57__MOVStreamWriter_appendMetadata_withTimeStamp_toStream___block_invoke;
  block[3] = &unk_26CB697E8;
  id v13 = v8;
  id v17 = v13;
  uint64_t v18 = self;
  if (SHIBYTE(v26.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&__p, v26.__r_.__value_.__l.__data_, v26.__r_.__value_.__l.__size_);
  }
  else {
    std::string __p = v26;
  }
  long long v21 = *(_OWORD *)&a4->var0;
  int64_t v22 = a4->var3;
  id v14 = v9;
  id v19 = v14;
  dispatch_async(m_processingQueue, block);

  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }

  if (SHIBYTE(v26.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v26.__r_.__value_.__l.__data_);
  }
}

void __57__MOVStreamWriter_appendMetadata_withTimeStamp_toStream___block_invoke(uint64_t a1)
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  context = (void *)MEMORY[0x21D4924B0]();
  if ([*(id *)(a1 + 32) count])
  {
    unint64_t v32 = (const void **)(a1 + 56);
    long long v36 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    uint64_t v34 = a1;
    id obj = *(id *)(a1 + 32);
    uint64_t v3 = [obj countByEnumeratingWithState:&v44 objects:v51 count:16];
    if (v3)
    {
      uint64_t v4 = *(void *)v45;
      uint64_t v5 = *MEMORY[0x263F00F50];
      do
      {
        for (uint64_t i = 0; i != v3; ++i)
        {
          if (*(void *)v45 != v4) {
            objc_enumerationMutation(obj);
          }
          id v7 = *(void **)(*((void *)&v44 + 1) + 8 * i);
          id v8 = [MEMORY[0x263EFA790] metadataItem];
          id v9 = v8;
          if (*((unsigned char *)v2 + 24)) {
            char v10 = @"mdta/com.apple.rawIMUDict";
          }
          else {
            char v10 = @"mdta/com.apple.metadata_stream_item";
          }
          [v8 setIdentifier:v10];
          [v9 setDataType:v5];
          [v9 setExtraAttributes:0];
          if (*((unsigned char *)v2 + 56))
          {
            id v11 = (void *)[v7 copy];
            [v9 setValue:v11];
          }
          else
          {
            [v9 setValue:v7];
          }
          [v36 addObject:v9];
        }
        uint64_t v3 = [obj countByEnumeratingWithState:&v44 objects:v51 count:16];
      }
      while (v3);
    }

    if (*(unsigned char *)(a1 + 92))
    {
      id v15 = objc_alloc(MEMORY[0x263EFA8C0]);
      CMTimeRange v16 = (CMTime *)(a1 + 80);
      CMTime start = *(CMTime *)(a1 + 80);
      CMTime duration = *(CMTime *)*(void *)&MEMORY[0x263F01098];
      CMTimeRangeMake(&v43, &start, &duration);
      long long v12 = (void *)[v15 initWithItems:v36 timeRange:&v43];
      id v17 = (uint64_t **)(*(void *)(a1 + 40) + 312);
      CMTimeValue v48 = (const void **)(a1 + 56);
      uint64_t v18 = std::__tree<std::__value_type<std::string,CMTime>,std::__map_value_compare<std::string,std::__value_type<std::string,CMTime>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,CMTime>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(v17, v32, (uint64_t)&std::piecewise_construct, (long long **)&v48);
      CMTimeValue v20 = v18[7];
      id v19 = v18 + 7;
      CMTimeValue v49 = v20;
      CMTimeFlags v21 = *((_DWORD *)v19 + 3);
      CMTimeScale v50 = *((_DWORD *)v19 + 2);
      if ((v21 & 1) == 0
        || (CMTimeEpoch v22 = v19[2],
            CMTimeValue v23 = *v19,
            time1.timescale = *((_DWORD *)v19 + 2),
            time1.flags = v21,
            time1.epoch = v22,
            CMTime time2 = *v16,
            time1.unint64_t value = v23,
            CMTimeCompare(&time1, &time2) < 0))
      {
        if (v12)
        {
          [*(id *)(v34 + 40) queueMetadataGroup:v12 stream:*(void *)(v34 + 48)];
          Float64 v28 = (uint64_t **)(*(void *)(v34 + 40) + 312);
          CMTimeValue v48 = v32;
          id v29 = std::__tree<std::__value_type<std::string,CMTime>,std::__map_value_compare<std::string,std::__value_type<std::string,CMTime>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,CMTime>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(v28, v32, (uint64_t)&std::piecewise_construct, (long long **)&v48);
          long long v30 = *(_OWORD *)&v16->value;
          v29[9] = v16->epoch;
          *(_OWORD *)(v29 + 7) = v30;
        }
        else
        {
          id v31 = (id)[MEMORY[0x263F087E8] writerWarningWithMessage:@"No metadata appended because the AVTimedMetadataGroup* is nil" code:0];
        }
      }
      else
      {
        CMTimeRange v24 = NSString;
        CMTime time = *v16;
        Float64 Seconds = CMTimeGetSeconds(&time);
        v37.unint64_t value = v49;
        v37.timescale = v50;
        v37.flags = v21;
        v37.epoch = v22;
        std::string v26 = [v24 stringWithFormat:@"Metadata was appended with presentation timestamp (%f) less than (or equal to) previous sample buffer (%f) for stream '%@'. Dropping sample.", *(void *)&Seconds, CMTimeGetSeconds(&v37), *(void *)(v34 + 48)];
        id v27 = [MEMORY[0x263F087E8] streamErrorWithMessage:v26 code:15];
        [*(id *)(v34 + 40) informDelegateAboutError:v27];
      }
    }
    else
    {
      long long v12 = [NSString stringWithFormat:@"Invalid time stamp is not supported for metadata for stream '%@'.", *(void *)(a1 + 48)];
      id v13 = [MEMORY[0x263F087E8] streamErrorWithMessage:v12 code:16];
      [*(id *)(a1 + 40) informDelegateAboutError:v13];
    }
  }
  else
  {
    id v14 = (id)[MEMORY[0x263F087E8] writerWarningWithMessage:@"No metadata appended because it's empty" code:0];
  }
}

- (void)queueMetadataGroup:(id)a3 stream:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v7 UTF8String]);
  id v9 = (id)v8[4];
  objc_sync_enter(v9);
  [v9 addObject:v6];
  objc_msgSend((id)v8[8], "setFifoItemCount:", objc_msgSend(v9, "count"));
  if (+[MIOLog debugEnabled])
  {
    char v10 = +[MIOLog defaultLog];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v11 = [v9 count];
      *(_DWORD *)buf = 138543618;
      id v18 = v7;
      __int16 v19 = 2048;
      uint64_t v20 = v11;
      _os_log_impl(&dword_21B5ED000, v10, OS_LOG_TYPE_DEBUG, "[FIFO] add to fifo '%{public}@' %lu", buf, 0x16u);
    }
  }
  if ([v9 count] > (unint64_t)v8[5])
  {
    [v9 removeObjectAtIndex:0];
    long long v12 = [NSString stringWithFormat:@"FIFO buffer for metadata stream '%@' is full, dropping older buffer (%llu/%llu/%llu/%llu).", v7, -[MOVStreamWriter writeThreadCount](self, "writeThreadCount"), objc_msgSend((id)v8[8], "visitCount"), objc_msgSend((id)v8[8], "attemptCount"), objc_msgSend((id)v8[8], "writeCount")];
    id v13 = [MEMORY[0x263F087E8] streamErrorWithMessage:v12 code:18];
    id v14 = [v13 errorByAddingStreamId:v7];

    [(MOVStreamWriter *)self informDelegateAboutError:v14];
  }
  objc_sync_exit(v9);

  [(MOVStreamWriter *)self consumeMetadatOfMetadataStream:v7];
  if (v16 < 0) {
    operator delete(__p[0]);
  }
}

- (void)appendMetadata:(id)a3 associatedWith:(id)a4 toStream:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v9;
  std::string::basic_string[abi:ne180100]<0>(&v25, (char *)[v11 UTF8String]);
  id v12 = v10;
  std::string::basic_string[abi:ne180100]<0>(&v24, (char *)[v12 UTF8String]);
  [(MOVStreamWriter *)self sessionStartTime];
  if ((BYTE12(v21) & 1) == 0)
  {
    if (v8)
    {
      [v8 timeRange];
    }
    else
    {
      long long v22 = 0u;
      long long v23 = 0u;
      long long v21 = 0u;
    }
    long long v19 = v21;
    uint64_t v20 = v22;
    [(MOVStreamWriter *)self setSessionStartTime:&v19];
  }
  m_processingQueue = self->m_processingQueue;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3321888768;
  v15[2] = __58__MOVStreamWriter_appendMetadata_associatedWith_toStream___block_invoke;
  v15[3] = &unk_26CB698C8;
  v15[4] = self;
  if (SHIBYTE(v25.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&v17, v25.__r_.__value_.__l.__data_, v25.__r_.__value_.__l.__size_);
  }
  else {
    std::string v17 = v25;
  }
  if (SHIBYTE(v24.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&__p, v24.__r_.__value_.__l.__data_, v24.__r_.__value_.__l.__size_);
  }
  else {
    std::string __p = v24;
  }
  id v14 = v8;
  id v16 = v14;
  dispatch_async(m_processingQueue, v15);

  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v17.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v17.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v24.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v24.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v25.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v25.__r_.__value_.__l.__data_);
  }
}

void __58__MOVStreamWriter_appendMetadata_associatedWith_toStream___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x21D4924B0]();
  {
    id v7 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498] reason:@"Cannot append associated metadata when the track was never added. Call addMetadataTrackAssociatedWith:forIdentifier: before prepareToRecord." userInfo:0];
    objc_exception_throw(v7);
  }
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4)
  {
    uint64_t v5 = *(void **)(a1 + 32);
    if (*(char *)(a1 + 95) < 0) {
      std::string::__init_copy_ctor_external(&v9, *(const std::string::value_type **)(a1 + 72), *(void *)(a1 + 80));
    }
    else {
      std::string v9 = *(std::string *)(a1 + 72);
    }
    if (*(char *)(a1 + 71) < 0) {
      std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)(a1 + 48), *(void *)(a1 + 56));
    }
    else {
      std::string __p = *(std::string *)(a1 + 48);
    }
    [v5 asyncWriteAssociatedMetadata:v4 metadataKey:&v9 associatedStreamKey:&__p];
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(v9.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v9.__r_.__value_.__l.__data_);
    }
  }
  else
  {
    id v6 = (id)[MEMORY[0x263F087E8] writerWarningWithMessage:@"No metadata appended because it's empty" code:0];
  }
}

- (BOOL)startSessionWithFallbackSampleTime:(id *)a3 streamId:(id)a4 mediaType:(int64_t)a5 writerDelegate:(id)a6 delegateCallbackQueue:(id)a7 error:(id *)a8
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v14 = a4;
  id v15 = a6;
  id v16 = a7;
  std::string v17 = self;
  objc_sync_enter(v17);
  if (v17->m_haveStartedSession)
  {
    BOOL v18 = 1;
  }
  else
  {
    memset(&v27, 0, sizeof(v27));
    [(MOVStreamWriter *)v17 sessionStartTime];
    char flags = (unsigned __int128)0 >> 96;
    if ((unsigned __int128)0 >> 96 != 1)
    {
      CMTime v27 = (CMTime)*a3;
      char flags = v27.flags;
    }
    if ((flags & 0x1D) == 1)
    {
      if (+[MIOLog debugEnabled])
      {
        uint64_t v20 = +[MIOLog defaultLog];
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        {
          CMTime time = v27;
          Float64 Seconds = CMTimeGetSeconds(&time);
          *(_DWORD *)buf = 138543618;
          id v29 = v14;
          __int16 v30 = 2048;
          Float64 v31 = Seconds;
          _os_log_impl(&dword_21B5ED000, v20, OS_LOG_TYPE_DEBUG, "Start Session by '%{public}@' at %f", buf, 0x16u);
        }
      }
      m_assetWriter = v17->m_assetWriter;
      CMTime v25 = v27;
      [(AVAssetWriter *)m_assetWriter startSessionAtSourceTime:&v25];
      CMTime v24 = v27;
      [(MOVStreamWriter *)v17 writingSessionDidStartAtTime:&v24 streamId:v14 mediaType:a5 writerDelegate:v15 delegateCallbackQueue:v16];
      BOOL v18 = 1;
      v17->m_haveStartedSession = 1;
    }
    else
    {
      [MEMORY[0x263F087E8] populateReaderError:a8, @"Writer invalid sessionStartTime, startSession failed.", 16 message code];
      BOOL v18 = 0;
    }
  }
  objc_sync_exit(v17);

  return v18;
}

- (void)asyncWriteAssociatedMetadata:(id)a3 metadataKey:()basic_string<char associatedStreamKey:()std:(std::allocator<char>> *)a4 :char_traits<char>
{
  uint64_t v5 = v4;
  id v8 = a3;
  if (!v8)
  {
    id v11 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:@"nullptr IMU metadata" userInfo:0];
    objc_exception_throw(v11);
  }
  m_writingQueue = self->m_writingQueue;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3321888768;
  v12[2] = __80__MOVStreamWriter_asyncWriteAssociatedMetadata_metadataKey_associatedStreamKey___block_invoke;
  v12[3] = &unk_26CB698C8;
  v12[4] = self;
  id v10 = v8;
  id v13 = v10;
  if (*((char *)&a4->var0.var0.var0.var1 + 23) < 0) {
    std::string::__init_copy_ctor_external((std::string *)&var0, a4->var0.var0.var0.var1.var0, a4->var0.var0.var0.var1.var1);
  }
  else {
    __rep var0 = a4->var0.var0;
  }
  if (*(char *)(v5 + 23) < 0) {
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)v5, *(void *)(v5 + 8));
  }
  else {
    std::string __p = *(std::string *)v5;
  }
  dispatch_async(m_writingQueue, v12);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  if (*((char *)&var0.var0.var1 + 23) < 0) {
    operator delete(var0.var0.var1.var0);
  }
}

void __80__MOVStreamWriter_asyncWriteAssociatedMetadata_metadataKey_associatedStreamKey___block_invoke(uint64_t a1)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x21D4924B0]();
  id v3 = *(id *)(a1 + 32);
  objc_sync_enter(v3);
  int v4 = [*(id *)(a1 + 32) canWriteData];
  objc_sync_exit(v3);

  if (v4)
  {
    uint64_t v5 = *(void *)(a1 + 32);
    if (!*(unsigned char *)(v5 + 98))
    {
      id v6 = *(void **)(a1 + 40);
      if (v6)
      {
        [v6 timeRange];
      }
      else
      {
        long long v33 = 0u;
        long long v34 = 0u;
        long long v32 = 0u;
      }
      long long v30 = v32;
      uint64_t v31 = v33;
      id v7 = (void *)(a1 + 48);
      if (*(char *)(a1 + 71) < 0) {
        id v7 = (void *)*v7;
      }
      id v8 = [NSString stringWithUTF8String:v7];
      std::string v9 = [*(id *)(a1 + 32) delegate];
      uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 8);
      id v29 = 0;
      char v11 = [(id)v5 startSessionWithFallbackSampleTime:&v30 streamId:v8 mediaType:2 writerDelegate:v9 delegateCallbackQueue:v10 error:&v29];
      id v12 = v29;

      if ((v11 & 1) == 0)
      {
        id v22 = *(id *)(a1 + 32);
        objc_sync_enter(v22);
        long long v23 = *(id **)(a1 + 32);
        CMTime v24 = [v23[46] criticalErrorOccurred:v12 context:v23];
        [v23 activateNewState:v24 byEvent:@"asyncWriteAssociatedMetadata"];

        objc_sync_exit(v22);
        goto LABEL_23;
      }

      uint64_t v5 = *(void *)(a1 + 32);
    }
    id v13 = (void *)(a1 + 72);
    id v15 = (void *)(a1 + 48);
    if ([*v16 isReadyForMoreMediaData])
    {
      if (*(void *)(a1 + 40))
      {
        char v17 = objc_msgSend(v16[1], "appendTimedMetadataGroup:");
        BOOL v18 = *(id **)(a1 + 32);
        if (v17)
        {
          if (*(char *)(a1 + 71) < 0) {
            id v15 = (void *)*v15;
          }
          long long v19 = [NSString stringWithUTF8String:v15];
          [v18 informDelegateAboutMediaWrittenForStream:v19 mediaType:2];
        }
        else
        {
          CMTime v25 = [v18[10] error];
          id v26 = *(id *)(a1 + 32);
          objc_sync_enter(v26);
          CMTime v27 = *(id **)(a1 + 32);
          Float64 v28 = [v27[46] criticalErrorOccurred:v25 context:v27];
          [v27 activateNewState:v28 byEvent:@"asyncWriteAssociatedMetadata"];

          objc_sync_exit(v26);
        }
      }
    }
    else
    {
      if (*(char *)(a1 + 71) < 0) {
        id v15 = (void *)*v15;
      }
      if (*(char *)(a1 + 95) < 0) {
        id v13 = (void *)*v13;
      }
      uint64_t v20 = [NSString stringWithFormat:@"[%s associated with %s] metadata input not ready for more data, dropping samples", v15, v13];
      id v21 = (id)[MEMORY[0x263F087E8] writerWarningWithMessage:v20 code:0];
    }
  }
LABEL_23:
}

- (void)appendAudioBuffer:(opaqueCMSampleBuffer *)a3 forStream:(id)a4
{
  id v6 = a4;
  if (!a3)
  {
    id v10 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498] reason:@"Cannot append audioSample <null>." userInfo:0];
    objc_exception_throw(v10);
  }
  id v7 = v6;
  std::string::basic_string[abi:ne180100]<0>(&v19, (char *)[v7 UTF8String]);
  {
    id v11 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498] reason:@"Cannot append stream type that hasn't been set up." userInfo:0];
    objc_exception_throw(v11);
  }
  [(MOVStreamWriter *)self sessionStartTime];
  if ((v18 & 1) == 0)
  {
    CMSampleBufferGetPresentationTimeStamp(&v17, a3);
    CMTime v16 = v17;
    [(MOVStreamWriter *)self setSessionStartTime:&v16];
  }
  CFRetain(a3);
  m_processingQueue = self->m_processingQueue;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3321888768;
  v12[2] = __47__MOVStreamWriter_appendAudioBuffer_forStream___block_invoke;
  v12[3] = &unk_26CB69890;
  id v14 = a3;
  v12[4] = self;
  if (SHIBYTE(v19.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&__p, v19.__r_.__value_.__l.__data_, v19.__r_.__value_.__l.__size_);
  }
  else {
    std::string __p = v19;
  }
  id v9 = v7;
  id v13 = v9;
  dispatch_async(m_processingQueue, v12);

  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v19.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v19.__r_.__value_.__l.__data_);
  }
}

void __47__MOVStreamWriter_appendAudioBuffer_forStream___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x21D4924B0]();
  if (*(void *)(a1 + 48))
  {
    id v3 = objc_msgSend(*(id *)(a1 + 32), "getAudioMetadataForBuffer:");
    int v4 = *(void **)(a1 + 32);
    uint64_t v5 = *(opaqueCMSampleBuffer **)(a1 + 48);
    CMSampleBufferGetPresentationTimeStamp(&v8, v5);
    if (*(char *)(a1 + 79) < 0) {
      std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)(a1 + 56), *(void *)(a1 + 64));
    }
    else {
      std::string __p = *(std::string *)(a1 + 56);
    }
    [v4 newSampleReady:v5 metadata:v3 presentationTime:&v8 streamKey:&__p streamId:*(void *)(a1 + 40) isAudioSample:1];
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
  }
  else
  {
    id v6 = (id)[MEMORY[0x263F087E8] writerWarningWithMessage:@"Could not append audio sample because it is nil" code:0];
  }
}

- (void)finishRecording
{
  id v3 = +[MIOLog defaultLog];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v9 = 0;
    _os_log_impl(&dword_21B5ED000, v3, OS_LOG_TYPE_INFO, "[FINISH] finishRecording", v9, 2u);
  }

  int v4 = self;
  objc_sync_enter(v4);
  if (([(MOVStreamWriterState *)v4->_state canFinishRecording:v4] & 1) == 0)
  {
    id v7 = @"Current writer state does not support finishRecording.";
    goto LABEL_8;
  }
  uint64_t v5 = [(MOVStreamWriterState *)v4->_state finishRecording:v4];
  BOOL v6 = [(MOVStreamWriter *)v4 activateNewState:v5 byEvent:@"finishRecording"];

  if (!v6)
  {
    id v7 = @"Cannot finishRecording.";
LABEL_8:
    id v8 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498] reason:v7 userInfo:0];
    objc_exception_throw(v8);
  }
  objc_sync_exit(v4);
}

- (void)finishAndDrainFifoFirst
{
  if ([(MOVStreamWriter *)self checkIfFifoAreEmpty])
  {
    id obj = self;
    objc_sync_enter(obj);
    id v3 = -[MOVStreamWriterState nextFinishStep:](obj->_state, "nextFinishStep:");
    BOOL v4 = [(MOVStreamWriter *)obj activateNewState:v3 byEvent:@"finishAndDrainFifoFirst"];

    if (!v4) {
      __assert_rtn("-[MOVStreamWriter finishAndDrainFifoFirst]", "MOVStreamWriter.mm", 2473, "0");
    }
    objc_sync_exit(obj);
  }
  else
  {
    uint64_t v5 = +[MIOLog defaultLog];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21B5ED000, v5, OS_LOG_TYPE_INFO, "[FINISH] startFinishingTimeoutTimer (items in fifos)", buf, 2u);
    }

    [(MOVStreamWriter *)self triggerWritingThread];
    [(MOVStreamWriter *)self startFinishingTimeoutTimer];
  }
}

- (void)setFinishingTimeout:(double)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  BOOL v4 = self;
  objc_sync_enter(v4);
  if (a3 < 45.0)
  {
    uint64_t v5 = +[MIOLog defaultLog];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 134218240;
      double v7 = a3;
      __int16 v8 = 2048;
      uint64_t v9 = 0x4046800000000000;
      _os_log_impl(&dword_21B5ED000, v5, OS_LOG_TYPE_ERROR, "⚠️⚠️⚠️ WARNING [MOVStreamIO]: setFinishingTimeout to %.1f sec below recommended minimum value %.1f sec.", (uint8_t *)&v6, 0x16u);
    }
  }
  v4->_finishingTimeout = a3;
  objc_sync_exit(v4);
}

- (double)finishingTimeout
{
  v2 = self;
  objc_sync_enter(v2);
  double finishingTimeout = v2->_finishingTimeout;
  objc_sync_exit(v2);

  return finishingTimeout;
}

- (void)startFinishingTimeoutTimer
{
  id v3 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.movstreamwriter.timeout", 0);
  timeoutQueue = self->_timeoutQueue;
  self->_timeoutQueue = v3;

  [(MOVStreamWriter *)self resubmitTimeoutBlock];
}

- (void)resubmitTimeoutBlock
{
  objc_initWeak(&location, self);
  uint64_t v7 = MEMORY[0x263EF8330];
  uint64_t v8 = 3221225472;
  uint64_t v9 = __39__MOVStreamWriter_resubmitTimeoutBlock__block_invoke;
  uint64_t v10 = &unk_2643AF6C0;
  objc_copyWeak(&v11, &location);
  dispatch_block_t v3 = dispatch_block_create((dispatch_block_flags_t)0, &v7);
  id timeoutBlock = self->_timeoutBlock;
  self->_id timeoutBlock = v3;

  [(MOVStreamWriter *)self finishingTimeout];
  dispatch_time_t v6 = dispatch_time(0, (uint64_t)(v5 * 1000000000.0));
  dispatch_after(v6, (dispatch_queue_t)self->_timeoutQueue, self->_timeoutBlock);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __39__MOVStreamWriter_resubmitTimeoutBlock__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && [WeakRetained status] == 4)
  {
    [WeakRetained informDelegateAboutFinishingTimeout];
    [WeakRetained forceFinishRecording];
  }
}

- (void)resetTimeoutRefTime
{
  id timeoutBlock = self->_timeoutBlock;
  if (timeoutBlock)
  {
    dispatch_block_cancel(timeoutBlock);
    [(MOVStreamWriter *)self resubmitTimeoutBlock];
  }
}

- (void)cancelTimeoutBlock
{
  id timeoutBlock = self->_timeoutBlock;
  if (timeoutBlock) {
    dispatch_block_cancel(timeoutBlock);
  }
}

- (void)cancelRecording
{
  id obj = self;
  objc_sync_enter(obj);
  v2 = -[MOVStreamWriterState cancelRecording:](obj->_state, "cancelRecording:");
  [(MOVStreamWriter *)obj activateNewState:v2 byEvent:@"cancelRecording"];

  objc_sync_exit(obj);
}

- (void)clearAllFifoQueues
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, (anonymous namespace)::StreamRecordingData>, void *>>> *)self->m_streamDataMap.__tree_.__begin_node_;
  p_pair1 = &self->m_streamDataMap.__tree_.__pair1_;
  if (begin_node != &self->m_streamDataMap.__tree_.__pair1_)
  {
    do
    {
      id v5 = begin_node[14].__value_.__left_;
      objc_sync_enter(v5);
      long long v18 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      id v6 = v5;
      uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v7)
      {
        uint64_t v8 = *(void *)v19;
        do
        {
          for (uint64_t i = 0; i != v7; ++i)
          {
            if (*(void *)v19 != v8) {
              objc_enumerationMutation(v6);
            }
            CFRelease((CFTypeRef)[*(id *)(*((void *)&v18 + 1) + 8 * i) sampleBuffer]);
          }
          uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
        }
        while (v7);
      }

      [v6 removeAllObjects];
      [begin_node[32].__value_.__left_ setFifoItemCount:0];
      objc_sync_exit(v6);

      left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, (anonymous namespace)::StreamRecordingData>, void *>>> *)begin_node[1].__value_.__left_;
      if (left)
      {
        do
        {
          id v11 = left;
          left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, (anonymous namespace)::StreamRecordingData>, void *>>> *)left->__value_.__left_;
        }
        while (left);
      }
      else
      {
        do
        {
          id v11 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, (anonymous namespace)::StreamRecordingData>, void *>>> *)begin_node[2].__value_.__left_;
          BOOL v12 = v11->__value_.__left_ == begin_node;
          begin_node = v11;
        }
        while (!v12);
      }
      begin_node = v11;
    }
    while (v11 != p_pair1);
  }
  id v13 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, (anonymous namespace)::MetadataRecordingData>, void *>>> *)self->m_metadataDataMap.__tree_.__begin_node_;
  id v14 = &self->m_metadataDataMap.__tree_.__pair1_;
  if (v13 != v14)
  {
    do
    {
      id v15 = v13[11].__value_.__left_;
      objc_sync_enter(v15);
      [v15 removeAllObjects];
      [v13[15].__value_.__left_ setFifoItemCount:0];
      objc_sync_exit(v15);

      CMTime v16 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, (anonymous namespace)::MetadataRecordingData>, void *>>> *)v13[1].__value_.__left_;
      if (v16)
      {
        do
        {
          CMTime v17 = v16;
          CMTime v16 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, (anonymous namespace)::MetadataRecordingData>, void *>>> *)v16->__value_.__left_;
        }
        while (v16);
      }
      else
      {
        do
        {
          CMTime v17 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, (anonymous namespace)::MetadataRecordingData>, void *>>> *)v13[2].__value_.__left_;
          BOOL v12 = v17->__value_.__left_ == v13;
          id v13 = v17;
        }
        while (!v12);
      }
      id v13 = v17;
    }
    while (v17 != v14);
  }
}

- (void)forceFinishRecording
{
  id obj = self;
  objc_sync_enter(obj);
  v2 = -[MOVStreamWriterState forceFinishRecording:](obj->_state, "forceFinishRecording:");
  [(MOVStreamWriter *)obj activateNewState:v2 byEvent:@"forceFinishRecording"];

  objc_sync_exit(obj);
}

- (void)closeEncodersAfterFailure
{
  dispatch_block_t v3 = dispatch_group_create();
  begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, (anonymous namespace)::StreamRecordingData>, void *>>> *)self->m_streamDataMap.__tree_.__begin_node_;
  p_pair1 = &self->m_streamDataMap.__tree_.__pair1_;
  if (begin_node != p_pair1)
  {
    do
    {
      left = begin_node[13].__value_.__left_;
      if (left) {
        [left closeEncoderInDispatchGroup:v3];
      }
      uint64_t v7 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, (anonymous namespace)::StreamRecordingData>, void *>>> *)begin_node[1].__value_.__left_;
      if (v7)
      {
        do
        {
          uint64_t v8 = v7;
          uint64_t v7 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, (anonymous namespace)::StreamRecordingData>, void *>>> *)v7->__value_.__left_;
        }
        while (v7);
      }
      else
      {
        do
        {
          uint64_t v8 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, (anonymous namespace)::StreamRecordingData>, void *>>> *)begin_node[2].__value_.__left_;
          BOOL v9 = v8->__value_.__left_ == begin_node;
          begin_node = v8;
        }
        while (!v9);
      }
      begin_node = v8;
    }
    while (v8 != p_pair1);
  }
  dispatch_time_t v10 = dispatch_time(0, 3000000000);
  if (dispatch_group_wait(v3, v10))
  {
    id v11 = +[MIOLog defaultLog];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12[0] = 0;
      _os_log_impl(&dword_21B5ED000, v11, OS_LOG_TYPE_ERROR, "Timeout closing encoders.", (uint8_t *)v12, 2u);
    }
  }
}

- (void)processForceFinishRecording
{
  dispatch_block_t v3 = +[MIOLog defaultLog];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21B5ED000, v3, OS_LOG_TYPE_INFO, "[FINISH] processForceFinishRecording", buf, 2u);
  }

  BOOL v4 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46__MOVStreamWriter_processForceFinishRecording__block_invoke;
  block[3] = &unk_2643AF6E8;
  void block[4] = self;
  dispatch_async(v4, block);
}

void __46__MOVStreamWriter_processForceFinishRecording__block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x21D4924B0]();
  dispatch_block_t v3 = +[MIOLog defaultLog];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21B5ED000, v3, OS_LOG_TYPE_INFO, "[FINISH] processForceFinishRecording 01", buf, 2u);
  }

  [*(id *)(a1 + 32) cancelTimeoutBlock];
  BOOL v4 = +[MIOLog defaultLog];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long v30 = 0;
    _os_log_impl(&dword_21B5ED000, v4, OS_LOG_TYPE_INFO, "[FINISH] processForceFinishRecording 02", v30, 2u);
  }

  [*(id *)(a1 + 32) clearAllFifoQueues];
  id v5 = +[MIOLog defaultLog];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v29 = 0;
    _os_log_impl(&dword_21B5ED000, v5, OS_LOG_TYPE_INFO, "[FINISH] processForceFinishRecording 03", v29, 2u);
  }

  id v6 = dispatch_group_create();
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = *(void **)(v7 + 168);
  BOOL v9 = (void *)(v7 + 176);
  if (v8 != (void *)(v7 + 176))
  {
    do
    {
      dispatch_time_t v10 = (void *)v8[13];
      if (v10) {
        [v10 closeEncoderInDispatchGroup:v6];
      }
      id v11 = (void *)v8[1];
      if (v11)
      {
        do
        {
          BOOL v12 = v11;
          id v11 = (void *)*v11;
        }
        while (v11);
      }
      else
      {
        do
        {
          BOOL v12 = (void *)v8[2];
          BOOL v13 = *v12 == (void)v8;
          uint64_t v8 = v12;
        }
        while (!v13);
      }
      uint64_t v8 = v12;
    }
    while (v12 != v9);
  }
  id v14 = +[MIOLog defaultLog];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)Float64 v28 = 0;
    _os_log_impl(&dword_21B5ED000, v14, OS_LOG_TYPE_INFO, "[FINISH] processForceFinishRecording 04", v28, 2u);
  }

  [*(id *)(a1 + 32) finishingTimeout];
  dispatch_time_t v16 = dispatch_time(0, (uint64_t)(v15 * 1000000000.0));
  dispatch_group_wait(v6, v16);
  CMTime v17 = +[MIOLog defaultLog];
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)CMTime v27 = 0;
    _os_log_impl(&dword_21B5ED000, v17, OS_LOG_TYPE_INFO, "[FINISH] processForceFinishRecording 05", v27, 2u);
  }

  uint64_t v18 = *(void *)(a1 + 32);
  long long v19 = *(void **)(v18 + 168);
  long long v20 = (void *)(v18 + 176);
  if (v19 != (void *)(v18 + 176))
  {
    do
    {
      [(id)v19[9] markAsFinished];
      [(id)v19[10] markAsFinished];
      long long v21 = (void *)v19[1];
      if (v21)
      {
        do
        {
          id v22 = v21;
          long long v21 = (void *)*v21;
        }
        while (v21);
      }
      else
      {
        do
        {
          id v22 = (void *)v19[2];
          BOOL v13 = *v22 == (void)v19;
          long long v19 = v22;
        }
        while (!v13);
      }
      long long v19 = v22;
    }
    while (v22 != v20);
  }
  uint64_t v23 = +[MIOLog defaultLog];
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v26 = 0;
    _os_log_impl(&dword_21B5ED000, v23, OS_LOG_TYPE_INFO, "[FINISH] processForceFinishRecording 06", v26, 2u);
  }

  [*(id *)(a1 + 32) setFinalConsume:1];
  [*(id *)(a1 + 32) triggerWritingThread];
  CMTime v24 = +[MIOLog defaultLog];
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)CMTime v25 = 0;
    _os_log_impl(&dword_21B5ED000, v24, OS_LOG_TYPE_INFO, "[FINISH] processForceFinishRecording 07", v25, 2u);
  }

  [*(id *)(a1 + 32) finishAVWriter];
}

- (void)finishAVWriter
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  dispatch_block_t v3 = +[MIOLog defaultLog];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21B5ED000, v3, OS_LOG_TYPE_INFO, "[FINISH] finishAVWriter 01", buf, 2u);
  }

  m_assetWriter = self->m_assetWriter;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __33__MOVStreamWriter_finishAVWriter__block_invoke;
  v5[3] = &unk_2643AF6E8;
  v5[4] = self;
  [(AVAssetWriter *)m_assetWriter finishWritingWithCompletionHandler:v5];
}

void __33__MOVStreamWriter_finishAVWriter__block_invoke(uint64_t a1)
{
  v2 = +[MIOLog defaultLog];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21B5ED000, v2, OS_LOG_TYPE_INFO, "[FINISH] finishAVWriter 02", buf, 2u);
  }

  id v3 = *(id *)(a1 + 32);
  objc_sync_enter(v3);
  BOOL v4 = [*(id *)(*(void *)(a1 + 32) + 80) error];
  id v5 = *(id **)(a1 + 32);
  if (v4)
  {
    id v6 = [v5[46] criticalErrorOccurred:v4 context:*(void *)(a1 + 32)];
    char v7 = [v5 activateNewState:v6 byEvent:@"finishAVWriter"];

    if ((v7 & 1) == 0) {
      __assert_rtn("-[MOVStreamWriter finishAVWriter]_block_invoke", "MOVStreamWriter.mm", 2663, "0");
    }
  }
  else
  {
    if ([*(id *)(a1 + 32) preserveSessionStartTime])
    {
      [*(id *)(a1 + 32) sessionStartTime];
      uint64_t v8 = [*(id *)(*(void *)(a1 + 32) + 80) outputURL];
      id v14 = 0;
      BOOL v9 = +[MOVStreamIOUtility saveSessionStartTime:v15 toMovieAtURL:v8 error:&v14];
      id v10 = v14;

      if (v9)
      {
        BOOL v4 = v10;
      }
      else
      {
        id v11 = [NSString stringWithFormat:@"Error saving sessionStartTime: %@", v10];
        BOOL v4 = [MEMORY[0x263F087E8] writerErrorWithMessage:v11 code:0];

        [*(id *)(a1 + 32) informDelegateAboutError:v4];
      }
    }
    else
    {
      BOOL v4 = 0;
    }
    BOOL v12 = *(id **)(a1 + 32);
    BOOL v13 = [v12[46] nextFinishStep:v12];
    LOBYTE(v12) = [v12 activateNewState:v13 byEvent:@"finishAVWriter"];

    if ((v12 & 1) == 0) {
      __assert_rtn("-[MOVStreamWriter finishAVWriter]_block_invoke", "MOVStreamWriter.mm", 2679, "0");
    }
  }

  objc_sync_exit(v3);
}

- (void)processCancelRecording
{
  objc_initWeak(&location, self);
  id v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, -1);
  BOOL v4 = dispatch_queue_create("com.apple.streamwriter.cancel", v3);

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __41__MOVStreamWriter_processCancelRecording__block_invoke;
  block[3] = &unk_2643AF710;
  objc_copyWeak(&v6, &location);
  void block[4] = self;
  dispatch_async(v4, block);
  objc_destroyWeak(&v6);

  objc_destroyWeak(&location);
}

void __41__MOVStreamWriter_processCancelRecording__block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x21D4924B0]();
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  BOOL v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = WeakRetained[10];
    if (v5 && [v5 status] == 1) {
      [v4[10] cancelWriting];
    }
    [v4 clearAllFifoQueues];
    [v4 closeEncodersAfterFailure];
    [v4 setFinalConsume:1];
    [v4 triggerWritingThread];
    id v6 = v4;
    objc_sync_enter(v6);
    char v7 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 368), "finishedCancelRecording:");
    [v6 activateNewState:v7 byEvent:@"processCancelRecording"];

    objc_sync_exit(v6);
  }
}

- (void)deleteFileOnCancel
{
  id v3 = objc_opt_new();
  BOOL v4 = [(NSURL *)self->m_writeURL path];
  char v5 = [v3 fileExistsAtPath:v4];

  if (v5)
  {
    id v6 = [(NSURL *)self->m_writeURL path];
    id v9 = 0;
    char v7 = [v3 removeItemAtPath:v6 error:&v9];
    id v8 = v9;

    if ((v7 & 1) == 0) {
      [(MOVStreamWriter *)self informDelegateAboutError:v8];
    }
  }
  else
  {
    id v8 = 0;
  }
}

- (void)processFinishRecording
{
  m_processingQueue = self->m_processingQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __41__MOVStreamWriter_processFinishRecording__block_invoke;
  block[3] = &unk_2643AF6E8;
  void block[4] = self;
  dispatch_async(m_processingQueue, block);
}

void __41__MOVStreamWriter_processFinishRecording__block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x21D4924B0]();
  [*(id *)(a1 + 32) logFifoUsage];
  id v3 = dispatch_group_create();
  if (+[MIOLog debugEnabled])
  {
    BOOL v4 = +[MIOLog defaultLog];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21B5ED000, v4, OS_LOG_TYPE_DEBUG, "Close all VT encoders.", buf, 2u);
    }
  }
  char v5 = +[MIOLog defaultLog];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21B5ED000, v5, OS_LOG_TYPE_INFO, "[FINISH] processFinishRecording 01", buf, 2u);
  }

  uint64_t v6 = *(void *)(a1 + 32);
  char v7 = *(void **)(v6 + 168);
  id v8 = (void *)(v6 + 176);
  if (v7 != (void *)(v6 + 176))
  {
    do
    {
      id v9 = (void *)v7[13];
      if (v9) {
        [v9 closeEncoderInDispatchGroup:v3];
      }
      id v10 = (void *)v7[1];
      if (v10)
      {
        do
        {
          id v11 = v10;
          id v10 = (void *)*v10;
        }
        while (v10);
      }
      else
      {
        do
        {
          id v11 = (void *)v7[2];
          BOOL v12 = *v11 == (void)v7;
          char v7 = v11;
        }
        while (!v12);
      }
      char v7 = v11;
    }
    while (v11 != v8);
  }
  BOOL v13 = +[MIOLog defaultLog];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21B5ED000, v13, OS_LOG_TYPE_INFO, "[FINISH] processFinishRecording 02", buf, 2u);
  }

  if (+[MIOLog debugEnabled])
  {
    id v14 = +[MIOLog defaultLog];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21B5ED000, v14, OS_LOG_TYPE_DEBUG, "Wait for encoders...", buf, 2u);
    }
  }
  [*(id *)(a1 + 32) finishingTimeout];
  dispatch_time_t v16 = dispatch_time(0, (uint64_t)(v15 * 1000000000.0));
  dispatch_group_wait(v3, v16);
  if (+[MIOLog debugEnabled])
  {
    CMTime v17 = +[MIOLog defaultLog];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21B5ED000, v17, OS_LOG_TYPE_DEBUG, "All encoders closed.", buf, 2u);
    }
  }
  uint64_t v18 = +[MIOLog defaultLog];
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21B5ED000, v18, OS_LOG_TYPE_INFO, "[FINISH] processFinishRecording 03", buf, 2u);
  }

  uint64_t v19 = *(void *)(a1 + 32);
  long long v20 = *(void **)(v19 + 168);
  long long v21 = (void *)(v19 + 176);
  if (v20 != (void *)(v19 + 176))
  {
    do
    {
      id v22 = (void *)v20[13];
      if (v22)
      {
        v20[13] = 0;
      }
      uint64_t v23 = (void *)v20[1];
      if (v23)
      {
        do
        {
          CMTime v24 = v23;
          uint64_t v23 = (void *)*v23;
        }
        while (v23);
      }
      else
      {
        do
        {
          CMTime v24 = (void *)v20[2];
          BOOL v12 = *v24 == (void)v20;
          long long v20 = v24;
        }
        while (!v12);
      }
      long long v20 = v24;
    }
    while (v24 != v21);
  }

  CMTime v25 = +[MIOLog defaultLog];
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21B5ED000, v25, OS_LOG_TYPE_INFO, "[FINISH] processFinishRecording 04", buf, 2u);
  }

  if ([*(id *)(a1 + 32) checkIfFifoAreEmpty])
  {
    id v26 = +[MIOLog defaultLog];
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21B5ED000, v26, OS_LOG_TYPE_INFO, "[FINISH] processFinishRecording 05", buf, 2u);
    }

    CMTime v27 = +[MIOLog defaultLog];
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21B5ED000, v27, OS_LOG_TYPE_INFO, "Last Trigger!", buf, 2u);
    }

    [*(id *)(a1 + 32) setFinalConsume:1];
    [*(id *)(a1 + 32) triggerWritingThread];
    Float64 v28 = +[MIOLog defaultLog];
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21B5ED000, v28, OS_LOG_TYPE_INFO, "[FINISH] processFinishRecording 06", buf, 2u);
    }

    uint64_t v29 = *(void *)(a1 + 32);
    long long v30 = *(NSObject **)(v29 + 16);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __41__MOVStreamWriter_processFinishRecording__block_invoke_533;
    block[3] = &unk_2643AF6E8;
    void block[4] = v29;
    dispatch_async(v30, block);
  }
  else
  {
    [*(id *)(a1 + 32) logFifoUsage];
    id v31 = *(id *)(a1 + 32);
    objc_sync_enter(v31);
    id v32 = (id)[MEMORY[0x263F087E8] writerWarningWithMessage:@"Late frames arrived from encoder. Drain fifos again..." code:0];
    long long v33 = +[MIOLog defaultLog];
    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21B5ED000, v33, OS_LOG_TYPE_INFO, "Still frames in Fifo. Wait...", buf, 2u);
    }

    long long v34 = *(id **)(a1 + 32);
    uint64_t v35 = [v34[46] finishRecording:v34];
    [v34 activateNewState:v35 byEvent:@"processFinishRecording-checkIfFifoAreEmpty"];

    objc_sync_exit(v31);
  }
}

void __41__MOVStreamWriter_processFinishRecording__block_invoke_533(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  context = (void *)MEMORY[0x21D4924B0]();
  v2 = +[MIOLog defaultLog];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21B5ED000, v2, OS_LOG_TYPE_INFO, "[FINISH] processFinishRecording 07", buf, 2u);
  }

  os_signpost_id_t v3 = os_signpost_id_generate(*(os_log_t *)(*(void *)(a1 + 32) + 440));
  uint64_t v4 = *(void *)(a1 + 32);
  char v5 = *(void **)(v4 + 168);
  uint64_t v6 = (void *)(v4 + 176);
  if (v5 != (void *)(v4 + 176))
  {
    os_signpost_id_t v7 = v3;
    do
    {
      id v8 = v5 + 4;
      if (*((char *)v5 + 55) < 0) {
        id v8 = (void *)*v8;
      }
      id v9 = [NSString stringWithUTF8String:v8];
      if ([(id)v5[24] count])
      {
        id v10 = +[MIOLog defaultLog];
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138543362;
          id v32 = v9;
          _os_log_impl(&dword_21B5ED000, v10, OS_LOG_TYPE_INFO, "Writing pending frame attachments for stream '%{public}@'.", buf, 0xCu);
        }
      }
      id v11 = [(id)v5[24] sortedArrayUsingComparator:&__block_literal_global_3];
      [(id)v5[24] removeAllObjects];
      long long v28 = 0u;
      long long v29 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      id v12 = v11;
      uint64_t v13 = [v12 countByEnumeratingWithState:&v26 objects:v30 count:16];
      if (v13)
      {
        uint64_t v14 = *(void *)v27;
LABEL_13:
        uint64_t v15 = 0;
        while (1)
        {
          if (*(void *)v27 != v14) {
            objc_enumerationMutation(v12);
          }
          if (([*(id *)(a1 + 32) writeVideoFrameStreamAttachmentsData:*(void *)(*((void *)&v26 + 1) + 8 * v15) toMetadataAdaptor:v5[11] ofStream:v9 signpost:v7] & 1) == 0)break; {
          if (v13 == ++v15)
          }
          {
            uint64_t v13 = [v12 countByEnumeratingWithState:&v26 objects:v30 count:16];
            if (v13) {
              goto LABEL_13;
            }
            break;
          }
        }
      }

      dispatch_time_t v16 = (void *)v5[1];
      if (v16)
      {
        do
        {
          CMTime v17 = v16;
          dispatch_time_t v16 = (void *)*v16;
        }
        while (v16);
      }
      else
      {
        do
        {
          CMTime v17 = (void *)v5[2];
          BOOL v18 = *v17 == (void)v5;
          char v5 = v17;
        }
        while (!v18);
      }
      char v5 = v17;
    }
    while (v17 != v6);
  }
  uint64_t v19 = +[MIOLog defaultLog];
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21B5ED000, v19, OS_LOG_TYPE_INFO, "[FINISH] processFinishRecording 08", buf, 2u);
  }

  [*(id *)(a1 + 32) cancelTimeoutBlock];
  long long v20 = +[MIOLog defaultLog];
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21B5ED000, v20, OS_LOG_TYPE_INFO, "[FINISH] processFinishRecording 09", buf, 2u);
  }

  id v21 = *(id *)(a1 + 32);
  objc_sync_enter(v21);
  id v22 = *(id **)(a1 + 32);
  uint64_t v23 = [v22[46] nextFinishStep:v22];
  LOBYTE(v22) = [v22 activateNewState:v23 byEvent:@"processFinishRecording"];

  objc_sync_exit(v21);
  if (v22)
  {
    CMTime v24 = +[MIOLog defaultLog];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21B5ED000, v24, OS_LOG_TYPE_INFO, "[FINISH] processFinishRecording 10", buf, 2u);
    }
  }
}

uint64_t __41__MOVStreamWriter_processFinishRecording__block_invoke_534(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  if (v4)
  {
    [v4 timeRange];
  }
  else
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v12 = 0u;
  }
  *(_OWORD *)&v15.unint64_t value = v12;
  v15.epoch = v13;
  if (v5)
  {
    [v5 timeRange];
  }
  else
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v12 = 0u;
  }
  long long v10 = v12;
  uint64_t v11 = v13;
  CMTime time1 = v15;
  *(_OWORD *)&v8.unint64_t value = v12;
  v8.epoch = v13;
  uint64_t v6 = CMTimeCompare(&time1, &v8);

  return v6;
}

- (void)checkForFinishing
{
  v2 = self;
  objc_sync_enter(v2);
  os_signpost_id_t v3 = [(MOVStreamWriter *)v2 state];
  int v4 = [v3 stopWriterWhenFifosAreEmpty:v2];

  if (v4 && [(MOVStreamWriter *)v2 checkIfFifoAreEmpty])
  {
    id v5 = +[MIOLog defaultLog];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl(&dword_21B5ED000, v5, OS_LOG_TYPE_INFO, "FINISHING!", v9, 2u);
    }

    uint64_t v6 = [(MOVStreamWriter *)v2 state];
    os_signpost_id_t v7 = [v6 nextFinishStep:v2];
    BOOL v8 = [(MOVStreamWriter *)v2 activateNewState:v7 byEvent:@"checkForFinishing"];

    if (!v8) {
      __assert_rtn("-[MOVStreamWriter checkForFinishing]", "MOVStreamWriter.mm", 2849, "0");
    }
  }
  objc_sync_exit(v2);
}

- (void)triggerWritingThread
{
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_writingSema);
  writingMetadataSema = self->_writingMetadataSema;

  dispatch_semaphore_signal(writingMetadataSema);
}

- (int)getCountByPriorityForFifo:(unint64_t)a3 capacity:(unint64_t)a4
{
  if (a3 <= 2) {
    return 1;
  }
  else {
    return 2;
  }
}

- (void)startWritingThread
{
  objc_initWeak(&location, self);
  id v3 = objc_alloc(MEMORY[0x263F08B88]);
  uint64_t v6 = MEMORY[0x263EF8330];
  uint64_t v7 = 3221225472;
  BOOL v8 = __37__MOVStreamWriter_startWritingThread__block_invoke;
  id v9 = &unk_2643AF6C0;
  objc_copyWeak(&v10, &location);
  int v4 = (NSThread *)[v3 initWithBlock:&v6];
  writeThread = self->_writeThread;
  self->_writeThread = v4;

  [(NSThread *)self->_writeThread setName:@"MOVStreamWriter", v6, v7, v8, v9];
  [(NSThread *)self->_writeThread setQualityOfService:33];
  [(NSThread *)self->_writeThread start];
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __37__MOVStreamWriter_startWritingThread__block_invoke(uint64_t a1)
{
  uint64_t v117 = *MEMORY[0x263EF8340];
  v2 = os_log_create("com.apple.movstreamwriter.writingthread", "PointsOfInterest");
  os_signpost_id_t v90 = os_signpost_id_generate(v2);
  uint64_t v88 = v2;
  os_signpost_id_t spid = os_signpost_id_generate(v2);
  id v3 = (void *)MEMORY[0x21D4924B0]();
  id location = (id *)(a1 + 32);
  id WeakRetained = (os_log_t *)objc_loadWeakRetained((id *)(a1 + 32));
  os_signpost_id_t v98 = os_signpost_id_generate(WeakRetained[55]);
  [(os_log_t *)WeakRetained writingThreadPriority];
  double v6 = v5;

  if (([MEMORY[0x263F08B88] setThreadPriority:v6] & 1) == 0)
  {
    BOOL v8 = +[MIOLog defaultLog];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      *(double *)&uint8_t buf[4] = v6;
      _os_log_impl(&dword_21B5ED000, v8, OS_LOG_TYPE_ERROR, "[WritingThread] Cannot set priority to %f.", buf, 0xCu);
    }
  }
  unint64_t v89 = spid - 1;
  unint64_t v94 = v90 - 1;
  *(void *)&long long v7 = 67109120;
  long long v86 = v7;
  while (2)
  {
    id v9 = v88;
    id v10 = v9;
    log = v9;
    if (v89 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      BOOL v11 = os_signpost_enabled(v9);
      id v10 = log;
      if (v11)
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_21B5ED000, log, OS_SIGNPOST_INTERVAL_BEGIN, spid, "write thread", (const char *)&unk_21B668A56, buf, 2u);
        id v10 = log;
      }
    }

    char v91 = 1;
    do
    {
      long long v12 = log;
      long long v13 = v12;
      if (v94 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_21B5ED000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v90, "write fifo samples", (const char *)&unk_21B668A56, buf, 2u);
      }
      v95 = v13;

      context = (void *)MEMORY[0x21D4924B0]();
      long long v14 = objc_loadWeakRetained(location);
      v102 = (id *)v14;
      if (!v14)
      {
        char v91 = 0;
        char v45 = 1;
        int v40 = 5;
        goto LABEL_149;
      }
      CMTime v15 = (void *)v14[21];
      v97 = v14 + 22;
      if (v15 == v14 + 22)
      {
        int v16 = 0;
        char v100 = 0;
        goto LABEL_78;
      }
      char v100 = 0;
      int v16 = 0;
      do
      {
        objc_msgSend((id)v15[32], "setVisitCount:", objc_msgSend((id)v15[32], "visitCount", v86) + 1);
        if (*((char *)v15 + 55) < 0) {
          std::string::__init_copy_ctor_external(&v113, (const std::string::value_type *)v15[4], v15[5]);
        }
        else {
          std::string v113 = *(std::string *)(v15 + 4);
        }
        if ((v113.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          CMTime v17 = &v113;
        }
        else {
          CMTime v17 = (std::string *)v113.__r_.__value_.__r.__words[0];
        }
        v101 = [NSString stringWithUTF8String:v17];
        unsigned int v18 = [v102 isAudioStream:v15 + 7];
        id v19 = (id)v15[14];
        objc_sync_enter(v19);
        int v20 = objc_msgSend(v102, "getCountByPriorityForFifo:capacity:", objc_msgSend((id)v15[14], "count"), v15[15]);
        if (v20 < 1) {
          goto LABEL_65;
        }
        uint64_t v99 = v18;
        while (![(id)v15[14] count])
        {
LABEL_43:
          if (!--v20) {
            goto LABEL_50;
          }
        }
        objc_msgSend((id)v15[32], "setAttemptCount:", objc_msgSend((id)v15[32], "attemptCount") + 1);
        ++v16;
        if ([(id)v15[9] isReadyForMoreMediaData]
          && (*((unsigned char *)v15 + 184) || [(id)v15[10] isReadyForMoreMediaData]))
        {
          if (![v19 count]) {
            goto LABEL_45;
          }
          id v21 = [v19 firstObject];
          id v22 = (opaqueCMSampleBuffer *)[v21 sampleBuffer];
          uint64_t v23 = [v21 metadata];
          if (+[MIOLog debugEnabled])
          {
            CMTime v24 = +[MIOLog defaultLog];
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
            {
              CMSampleBufferGetPresentationTimeStamp(&time, v22);
              Float64 Seconds = CMTimeGetSeconds(&time);
              uint64_t v26 = [v19 count];
              uint64_t v27 = v15[15];
              *(_DWORD *)buf = 138544130;
              *(void *)&uint8_t buf[4] = v101;
              *(_WORD *)&unsigned char buf[12] = 2048;
              *(Float64 *)&buf[14] = Seconds;
              *(_WORD *)&buf[22] = 2048;
              *(void *)&uint8_t buf[24] = v26;
              LOWORD(v112) = 2048;
              *(void *)((char *)&v112 + 2) = v27;
              _os_log_impl(&dword_21B5ED000, v24, OS_LOG_TYPE_DEBUG, "[WritingThread] [FIFO] Consume (%{public}@) PTS: %f (%lu/%lu)", buf, 0x2Au);
            }
          }
          long long v28 = v102;
          if (!*((unsigned char *)v102 + 98))
          {
            CMSampleBufferGetPresentationTimeStamp(&v109, v22);
            long long v29 = [v102 delegate];
            id v30 = v102[1];
            id v108 = 0;
            char v31 = [v102 startSessionWithFallbackSampleTime:&v109 streamId:v101 mediaType:v99 writerDelegate:v29 delegateCallbackQueue:v30 error:&v108];
            id v32 = v108;

            if (v31)
            {

              long long v28 = v102;
              goto LABEL_36;
            }
            long long v38 = v102;
            objc_sync_enter(v38);
            CMTimeValue v39 = [v102[46] criticalErrorOccurred:v32 context:v38];
            [v38 activateNewState:v39 byEvent:@"startWritingThread-sample"];

            objc_sync_exit(v38);
            int v36 = 1;
LABEL_53:

            goto LABEL_54;
          }
LABEL_36:
          if ([v28 canWriteData])
          {
            [v102 writeSampleBuffer:v22 andMetadata:v23 forStreamId:v101 signpost:v98];
            objc_msgSend((id)v15[32], "setWriteCount:", objc_msgSend((id)v15[32], "writeCount") + 1);
            char v100 = 1;
          }
          else
          {
            if ([v102 isOrWasCanceled])
            {
              [v19 removeObjectAtIndex:0];
              objc_msgSend((id)v15[32], "setFifoItemCount:", objc_msgSend(v19, "count"));
              CFRelease(v22);
              int v36 = 8;
              goto LABEL_53;
            }
            uint64_t v33 = +[MIOLog defaultLog];
            if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
            {
              long long v34 = [v102[46] name];
              *(_DWORD *)buf = 138543618;
              *(void *)&uint8_t buf[4] = v101;
              *(_WORD *)&unsigned char buf[12] = 2114;
              *(void *)&buf[14] = v34;
              _os_log_impl(&dword_21B5ED000, v33, OS_LOG_TYPE_ERROR, "⛔️⛔️⛔️ ERROR: [FIFO] CANNOT Write Item of stream '%{public}@' for state %{public}@ ⛔️⛔️⛔️", buf, 0x16u);
            }
          }
          [v19 removeObjectAtIndex:0];
          objc_msgSend((id)v15[32], "setFifoItemCount:", objc_msgSend(v19, "count"));
          CFRelease(v22);
          BOOL v35 = [v19 count] == 0;

          if (v35)
          {
LABEL_45:
            int v36 = 8;
            int v37 = 1;
            goto LABEL_55;
          }
          goto LABEL_43;
        }
        if (!+[MIOLog debugEnabled])
        {
LABEL_50:
          int v37 = 0;
          int v36 = 8;
          goto LABEL_55;
        }
        id v21 = +[MIOLog defaultLog];
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138543362;
          *(void *)&uint8_t buf[4] = v101;
          _os_log_impl(&dword_21B5ED000, v21, OS_LOG_TYPE_DEBUG, "[WritingThread] Input for %{public}@ not ready.", buf, 0xCu);
        }
        int v36 = 8;
LABEL_54:

        int v37 = 0;
LABEL_55:
        if (v36 == 8) {
          int v40 = 0;
        }
        else {
          int v40 = v36;
        }
        if (v36 == 8 && v37)
        {
          if (+[MIOLog debugEnabled])
          {
            CMTime v41 = +[MIOLog defaultLog];
            if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138543362;
              *(void *)&uint8_t buf[4] = v101;
              _os_log_impl(&dword_21B5ED000, v41, OS_LOG_TYPE_DEBUG, "[WritingThread] [FIFO] Precheck All Fifo items written '%{public}@'", buf, 0xCu);
            }
          }
          [v102 checkForFinishing];
LABEL_65:
          int v40 = 0;
        }
        objc_sync_exit(v19);

        if (SHIBYTE(v113.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v113.__r_.__value_.__l.__data_);
        }
        if (v40) {
          goto LABEL_148;
        }
        uint64_t v42 = (void *)v15[1];
        if (v42)
        {
          do
          {
            CMTimeRange v43 = v42;
            uint64_t v42 = (void *)*v42;
          }
          while (v42);
        }
        else
        {
          do
          {
            CMTimeRange v43 = (void *)v15[2];
            BOOL v44 = *v43 == (void)v15;
            CMTime v15 = v43;
          }
          while (!v44);
        }
        CMTime v15 = v43;
      }
      while (v43 != v97);
LABEL_78:
      long long v46 = (id *)v102[27];
      if (v46 == v102 + 28)
      {
LABEL_141:
        int v40 = 0;
        if ((v100 & 1) == 0 && v16)
        {
          if (+[MIOLog debugEnabled])
          {
            uint64_t v72 = +[MIOLog defaultLog];
            if (os_log_type_enabled(v72, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = v86;
              *(_DWORD *)&uint8_t buf[4] = v16;
              _os_log_impl(&dword_21B5ED000, v72, OS_LOG_TYPE_DEBUG, "[WritingThread] nothing written (attempts: %d).", buf, 8u);
            }
          }
          int v40 = 0;
        }
        goto LABEL_148;
      }
      while (2)
      {
        if (*((char *)v46 + 55) < 0) {
          std::string::__init_copy_ctor_external(&v107, (const std::string::value_type *)v46[4], (std::string::size_type)v46[5]);
        }
        else {
          std::string v107 = *(std::string *)(v46 + 4);
        }
        if ((v107.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          long long v47 = &v107;
        }
        else {
          long long v47 = (std::string *)v107.__r_.__value_.__r.__words[0];
        }
        CMTimeValue v48 = objc_msgSend(NSString, "stringWithUTF8String:", v47, v86);
        objc_msgSend(v46[15], "setVisitCount:", objc_msgSend(v46[15], "visitCount") + 1);
        id v49 = v46[11];
        objc_sync_enter(v49);
        int v50 = objc_msgSend(v102, "getCountByPriorityForFifo:capacity:", objc_msgSend(v46[11], "count"), v46[12]);
        if (v50 < 1) {
          goto LABEL_131;
        }
        while (2)
        {
          if (![v49 count])
          {
LABEL_109:
            if (!--v50) {
              goto LABEL_115;
            }
            continue;
          }
          break;
        }
        objc_msgSend(v46[15], "setAttemptCount:", objc_msgSend(v46[15], "attemptCount") + 1);
        ++v16;
        if ([v46[7] isReadyForMoreMediaData])
        {
          if (![v49 count]) {
            goto LABEL_111;
          }
          id v51 = [v49 firstObject];
          if (+[MIOLog debugEnabled])
          {
            uint64_t v52 = +[MIOLog defaultLog];
            if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
            {
              if (v51)
              {
                [v51 timeRange];
              }
              else
              {
                long long v112 = 0u;
                memset(buf, 0, sizeof(buf));
              }
              CMTime v106 = *(CMTime *)buf;
              Float64 v53 = CMTimeGetSeconds(&v106);
              uint64_t v54 = [v49 count];
              id v55 = v46[12];
              LODWORD(v113.__r_.__value_.__l.__data_) = 138544130;
              *(std::string::size_type *)((char *)v113.__r_.__value_.__r.__words + 4) = (std::string::size_type)v48;
              WORD2(v113.__r_.__value_.__r.__words[1]) = 2048;
              *(Float64 *)((char *)&v113.__r_.__value_.__r.__words[1] + 6) = v53;
              HIWORD(v113.__r_.__value_.__r.__words[2]) = 2048;
              uint64_t v114 = v54;
              __int16 v115 = 2048;
              id v116 = v55;
              _os_log_impl(&dword_21B5ED000, v52, OS_LOG_TYPE_DEBUG, "[WritingThread] [FIFO] Consume (%{public}@) PTS: %f (%lu/%lu)", (uint8_t *)&v113, 0x2Au);
            }
          }
          uint64_t v56 = v102;
          if (!*((unsigned char *)v102 + 98))
          {
            if (v51)
            {
              v57 = v102;
              [v51 timeRange];
            }
            else
            {
              long long v112 = 0u;
              memset(buf, 0, sizeof(buf));
              v57 = v102;
            }
            long long v104 = *(_OWORD *)buf;
            uint64_t v105 = *(void *)&buf[16];
            uint64_t v58 = [v57 delegate];
            uint64_t v59 = (uint64_t)v57[1];
            id v103 = 0;
            char v60 = [v57 startSessionWithFallbackSampleTime:&v104 streamId:v48 mediaType:2 writerDelegate:v58 delegateCallbackQueue:v59 error:&v103];
            id v61 = v103;

            if ((v60 & 1) == 0)
            {
              uint64_t v67 = v102;
              objc_sync_enter(v67);
              CMTimeValue v68 = [v102[46] criticalErrorOccurred:v61 context:v67];
              [v67 activateNewState:v68 byEvent:@"startWritingThread-metadata"];

              objc_sync_exit(v67);
              int v66 = 1;
              goto LABEL_120;
            }

            uint64_t v56 = v102;
          }
          if ([v56 canWriteData])
          {
            [v102 writeMetadata:v51 forStreamId:v48];
            objc_msgSend(v46[15], "setWriteCount:", objc_msgSend(v46[15], "writeCount") + 1);
            char v100 = 1;
          }
          else
          {
            if ([v102 isOrWasCanceled])
            {
              [v49 removeObjectAtIndex:0];
              objc_msgSend(v46[15], "setFifoItemCount:", objc_msgSend(v49, "count"));
              goto LABEL_118;
            }
            id v62 = +[MIOLog defaultLog];
            if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
            {
              id v63 = [v102[46] name];
              *(_DWORD *)buf = 138543618;
              *(void *)&uint8_t buf[4] = v48;
              *(_WORD *)&unsigned char buf[12] = 2114;
              *(void *)&buf[14] = v63;
              _os_log_impl(&dword_21B5ED000, v62, OS_LOG_TYPE_ERROR, "⛔️⛔️⛔️ ERROR: [FIFO] CANNOT Write Item of metadata stream '%{public}@' for state %{public}@ ⛔️⛔️⛔️", buf, 0x16u);
            }
          }
          [v49 removeObjectAtIndex:0];
          objc_msgSend(v46[15], "setFifoItemCount:", objc_msgSend(v49, "count"));
          BOOL v64 = [v49 count] == 0;

          if (v64)
          {
LABEL_111:
            int v65 = 1;
LABEL_116:
            int v66 = 13;
            goto LABEL_121;
          }
          goto LABEL_109;
        }
        if (!+[MIOLog debugEnabled])
        {
LABEL_115:
          int v65 = 0;
          goto LABEL_116;
        }
        id v51 = +[MIOLog defaultLog];
        if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138543362;
          *(void *)&uint8_t buf[4] = v48;
          _os_log_impl(&dword_21B5ED000, v51, OS_LOG_TYPE_DEBUG, "[WritingThread] Input for %{public}@ not ready.", buf, 0xCu);
        }
LABEL_118:
        int v66 = 13;
LABEL_120:

        int v65 = 0;
LABEL_121:
        if (v66 == 13) {
          int v40 = 0;
        }
        else {
          int v40 = v66;
        }
        if (v66 == 13 && v65)
        {
          if (+[MIOLog debugEnabled])
          {
            CMTimeScale v69 = +[MIOLog defaultLog];
            if (os_log_type_enabled(v69, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138543362;
              *(void *)&uint8_t buf[4] = v48;
              _os_log_impl(&dword_21B5ED000, v69, OS_LOG_TYPE_DEBUG, "[WritingThread] [FIFO] Precheck All Fifo items written '%{public}@'", buf, 0xCu);
            }
          }
          [v102 checkForFinishing];
LABEL_131:
          int v40 = 0;
        }
        objc_sync_exit(v49);

        if (SHIBYTE(v107.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v107.__r_.__value_.__l.__data_);
        }
        if (!v40)
        {
          uint64_t v70 = (id *)v46[1];
          if (v70)
          {
            do
            {
              id v71 = v70;
              uint64_t v70 = (id *)*v70;
            }
            while (v70);
          }
          else
          {
            do
            {
              id v71 = (id *)v46[2];
              BOOL v44 = *v71 == v46;
              long long v46 = v71;
            }
            while (!v44);
          }
          long long v46 = v71;
          if (v71 == v102 + 28) {
            goto LABEL_141;
          }
          continue;
        }
        break;
      }
LABEL_148:
      char v45 = v100;
LABEL_149:

      if (v40)
      {
        if (v40 == 5) {
          break;
        }
        goto LABEL_171;
      }
      Float64 v73 = v95;
      int v74 = v73;
      if (v94 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v73))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_21B5ED000, v74, OS_SIGNPOST_INTERVAL_END, v90, "write fifo samples", (const char *)&unk_21B668A56, buf, 2u);
      }
    }
    while ((v45 & 1) != 0);
    uint64_t v75 = (void *)MEMORY[0x21D4924B0]();
    id v76 = objc_loadWeakRetained(location);
    char v77 = v76;
    if (!v76)
    {
      char v91 = 0;
      goto LABEL_165;
    }
    if ([v76 finalConsume])
    {
      id v78 = +[MIOLog defaultLog];
      if (os_log_type_enabled(v78, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21B5ED000, v78, OS_LOG_TYPE_INFO, "[WritingThread] finalConsume", buf, 2u);
      }

      long long v79 = v95;
      long long v80 = v79;
      if (v89 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v79))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_21B5ED000, v80, OS_SIGNPOST_INTERVAL_END, spid, "write thread", (const char *)&unk_21B668A56, buf, 2u);
      }

      [v77 clearAllFifoQueues];
LABEL_165:
      int v40 = 3;
    }
    else
    {
      id v81 = v77[4];
      dispatch_time_t v82 = dispatch_time(0, 11100000);
      dispatch_semaphore_wait(v81, v82);
      int v83 = v95;
      id v84 = v83;
      if (v89 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v83))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_21B5ED000, v84, OS_SIGNPOST_INTERVAL_END, spid, "write thread", (const char *)&unk_21B668A56, buf, 2u);
      }

      objc_msgSend(v77, "setWriteThreadCount:", objc_msgSend(v77, "writeThreadCount") + 1);
      char v91 = [v77 canWriteData];

      int v40 = 0;
      char v77 = 0;
    }

LABEL_171:
    if (!v40)
    {
      if ((v91 & 1) == 0)
      {
LABEL_175:
        int v85 = +[MIOLog defaultLog];
        if (os_log_type_enabled(v85, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21B5ED000, v85, OS_LOG_TYPE_INFO, "[WritingThread] Exiting writing loop.", buf, 2u);
        }

        goto LABEL_178;
      }
      continue;
    }
    break;
  }
  if (v40 == 3) {
    goto LABEL_175;
  }
LABEL_178:
}

- (void)consumeMetadatOfMetadataStream:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (+[MIOLog debugEnabled])
  {
    double v5 = +[MIOLog defaultLog];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      int v9 = 138412290;
      id v10 = v4;
      _os_log_impl(&dword_21B5ED000, v5, OS_LOG_TYPE_DEBUG, "consumeMetadatOfMetadataStream: %@", (uint8_t *)&v9, 0xCu);
    }
  }
  double v6 = self;
  objc_sync_enter(v6);
  long long v7 = [(MOVStreamWriter *)v6 state];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass) {
    [(MOVStreamWriter *)v6 resetTimeoutRefTime];
  }
  objc_sync_exit(v6);

  [(MOVStreamWriter *)v6 triggerWritingThread];
}

- (void)consumeSamplesOfVideoAudioStream:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (+[MIOLog debugEnabled])
  {
    double v5 = +[MIOLog defaultLog];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      int v9 = 138412290;
      id v10 = v4;
      _os_log_impl(&dword_21B5ED000, v5, OS_LOG_TYPE_DEBUG, "consumeSamplesOfVideoAudioStream: %@", (uint8_t *)&v9, 0xCu);
    }
  }
  double v6 = self;
  objc_sync_enter(v6);
  long long v7 = [(MOVStreamWriter *)v6 state];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass) {
    [(MOVStreamWriter *)v6 resetTimeoutRefTime];
  }
  objc_sync_exit(v6);

  [(MOVStreamWriter *)v6 triggerWritingThread];
}

- (void)writeSampleBuffer:(opaqueCMSampleBuffer *)a3 andMetadata:(id)a4 forStreamId:(id)a5 signpost:(unint64_t)a6
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v35 = a4;
  id v10 = a5;
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v10 UTF8String]);
  __uint64_t v12 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
  long long v13 = self->_perfLogAVF;
  long long v14 = v13;
  if (a6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v13))
  {
    LOWORD(buf[0].value) = 0;
    _os_signpost_emit_with_name_impl(&dword_21B5ED000, v14, OS_SIGNPOST_INTERVAL_BEGIN, a6, "mio.appendSampleBuffer", (const char *)&unk_21B668A56, (uint8_t *)buf, 2u);
  }

  char v15 = [(id)v11[2] appendSampleBuffer:a3];
  int v16 = self->_perfLogAVF;
  CMTime v17 = v16;
  if (a6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v16))
  {
    LOWORD(buf[0].value) = 0;
    _os_signpost_emit_with_name_impl(&dword_21B5ED000, v17, OS_SIGNPOST_INTERVAL_END, a6, "mio.appendSampleBuffer", (const char *)&unk_21B668A56, (uint8_t *)buf, 2u);
  }

  if (v15)
  {
    unint64_t v18 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW) - v12;
    if (v18 > 0xA7D8C0)
    {
      id v19 = +[MIOLog defaultLog];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf[0].value) = 138543618;
        *(CMTimeValue *)((char *)&buf[0].value + 4) = (CMTimeValue)v10;
        LOWORD(buf[0].flags) = 2048;
        *(void *)((char *)&buf[0].flags + 2) = v18;
        _os_log_impl(&dword_21B5ED000, v19, OS_LOG_TYPE_ERROR, "[MIO PERF] duration %{public}@ %llu", (uint8_t *)buf, 0x16u);
      }
    }
    if (!v35 || *((unsigned char *)v11 + 128))
    {
LABEL_31:
      [(MOVStreamWriter *)self informDelegateAboutMediaWrittenForStream:v10 mediaType:v11[23]];
      goto LABEL_33;
    }
    [v35 timeRange];
    CMTime v42 = buf[0];
    if ([(id)v11[6] frameReorderingEnabled])
    {
      int v20 = v11 + 18;
      if (*((unsigned char *)v11 + 156))
      {
        *(_OWORD *)&time1.unint64_t value = *v20;
        time1.epoch = v11[20];
        CMTime time2 = v42;
        int32_t v33 = CMTimeCompare(&time1, &time2);
        long long v34 = (void *)v11[17];
        if (v33 < 1)
        {
          id v21 = [v34 sortedArrayUsingComparator:&__block_literal_global_561];
          [(id)v11[17] removeAllObjects];
          [(id)v11[17] addObject:v35];
          *int v20 = *(_OWORD *)&v42.value;
          v11[20] = v42.epoch;
        }
        else
        {
          [v34 addObject:v35];
          id v21 = 0;
        }
        goto LABEL_18;
      }
      *int v20 = *(_OWORD *)&v42.value;
      v11[20] = v42.epoch;
    }
    id v21 = [MEMORY[0x263EFF8C0] arrayWithObject:v35];
LABEL_18:
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v22 = v21;
    uint64_t v23 = [v22 countByEnumeratingWithState:&v36 objects:v45 count:16];
    if (v23)
    {
      uint64_t v24 = *(void *)v37;
LABEL_20:
      uint64_t v25 = 0;
      while (1)
      {
        if (*(void *)v37 != v24) {
          objc_enumerationMutation(v22);
        }
        uint64_t v26 = *(void *)(*((void *)&v36 + 1) + 8 * v25);
        __uint64_t v27 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
        if (![(MOVStreamWriter *)self writeVideoFrameStreamAttachmentsData:v26 toMetadataAdaptor:v11[4] ofStream:v10 signpost:a6])break; {
        unint64_t v28 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW) - v27;
        }
        if (v28 > 0xA7D8C0)
        {
          long long v29 = +[MIOLog defaultLog];
          if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
          {
            LODWORD(buf[0].value) = 138543618;
            *(CMTimeValue *)((char *)&buf[0].value + 4) = (CMTimeValue)v10;
            LOWORD(buf[0].flags) = 2048;
            *(void *)((char *)&buf[0].flags + 2) = v28;
            _os_log_impl(&dword_21B5ED000, v29, OS_LOG_TYPE_INFO, "[MIO PERF a] %{public}@ duration %llu", (uint8_t *)buf, 0x16u);
          }
        }
        if (v23 == ++v25)
        {
          uint64_t v23 = [v22 countByEnumeratingWithState:&v36 objects:v45 count:16];
          if (v23) {
            goto LABEL_20;
          }
          break;
        }
      }
    }

    goto LABEL_31;
  }
  id v30 = [(AVAssetWriter *)self->m_assetWriter error];
  char v31 = self;
  objc_sync_enter(v31);
  id v32 = [(MOVStreamWriterState *)v31->_state criticalErrorOccurred:v30 context:v31];
  [(MOVStreamWriter *)v31 activateNewState:v32 byEvent:@"writeSampleBuffer"];

  objc_sync_exit(v31);
LABEL_33:
  if (v44 < 0) {
    operator delete(__p[0]);
  }
}

uint64_t __70__MOVStreamWriter_writeSampleBuffer_andMetadata_forStreamId_signpost___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  if (v4)
  {
    [v4 timeRange];
  }
  else
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v12 = 0u;
  }
  *(_OWORD *)&v15.unint64_t value = v12;
  v15.epoch = v13;
  if (v5)
  {
    [v5 timeRange];
  }
  else
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v12 = 0u;
  }
  long long v10 = v12;
  uint64_t v11 = v13;
  CMTime time1 = v15;
  *(_OWORD *)&v8.unint64_t value = v12;
  v8.epoch = v13;
  uint64_t v6 = CMTimeCompare(&time1, &v8);

  return v6;
}

- (BOOL)writeVideoFrameStreamAttachmentsData:(id)a3 toMetadataAdaptor:(id)a4 ofStream:(id)a5 signpost:(unint64_t)a6
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  std::string::basic_string[abi:ne180100]<0>(v39, (char *)[v12 UTF8String]);
  *(void *)buf = v39;
  long long v13 = std::__tree<std::__value_type<std::string,CMTime>,std::__map_value_compare<std::string,std::__value_type<std::string,CMTime>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,CMTime>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t **)&self->m_lastPtsForAttachmentsStream, v39, (uint64_t)&std::piecewise_construct, (long long **)buf);
  CMTimeValue v41 = v13[7];
  CMTimeFlags v14 = *((_DWORD *)v13 + 17);
  CMTimeScale v42 = *((_DWORD *)v13 + 16);
  CMTimeEpoch v15 = v13[9];
  if (v10)
  {
    [v10 timeRange];
  }
  else
  {
    long long v37 = 0u;
    *(_OWORD *)buf = 0u;
    long long v36 = 0u;
  }
  *(_OWORD *)&v38.unint64_t value = *(_OWORD *)buf;
  v38.epoch = v36;
  if ((v14 & 1) == 0
    || (time1.timescale = v42,
        time1.char flags = v14,
        time1.epoch = v15,
        CMTime time2 = v38,
        time1.unint64_t value = v41,
        CMTimeCompare(&time1, &time2) < 0))
  {
    int v20 = self->_perfLogAVF;
    id v21 = v20;
    if (a6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v20))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_21B5ED000, v21, OS_SIGNPOST_INTERVAL_BEGIN, a6, "mio.att_appendTimedMetadataGroup", (const char *)&unk_21B668A56, buf, 2u);
    }

    char v22 = [v11 appendTimedMetadataGroup:v10];
    uint64_t v23 = self->_perfLogAVF;
    uint64_t v24 = v23;
    if (a6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v23))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_21B5ED000, v24, OS_SIGNPOST_INTERVAL_END, a6, "mio.att_appendTimedMetadataGroup", (const char *)&unk_21B668A56, buf, 2u);
    }

    if (v22)
    {
      *(void *)buf = v39;
      uint64_t v25 = std::__tree<std::__value_type<std::string,CMTime>,std::__map_value_compare<std::string,std::__value_type<std::string,CMTime>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,CMTime>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t **)&self->m_lastPtsForAttachmentsStream, v39, (uint64_t)&std::piecewise_construct, (long long **)buf);
      *(CMTime *)(v25 + 7) = v38;
      BOOL v26 = 1;
      goto LABEL_17;
    }
    __uint64_t v27 = [(AVAssetWriter *)self->m_assetWriter error];
    unint64_t v28 = self;
    objc_sync_enter(v28);
    long long v29 = [(MOVStreamWriterState *)v28->_state criticalErrorOccurred:v27 context:v28];
    [(MOVStreamWriter *)v28 activateNewState:v29 byEvent:@"writeMetadataOfSample"];

    objc_sync_exit(v28);
  }
  else
  {
    int v16 = NSString;
    CMTime time = v38;
    Float64 Seconds = CMTimeGetSeconds(&time);
    v31.unint64_t value = v41;
    v31.timescale = v42;
    v31.char flags = v14;
    v31.epoch = v15;
    unint64_t v18 = [v16 stringWithFormat:@"Sample buffers attachments appended with presentation timestamp (%f) less than (or equal to) previous sample buffer (%f) for stream '%@'. Inconsistency!", *(void *)&Seconds, CMTimeGetSeconds(&v31), v12];
    id v19 = [MEMORY[0x263F087E8] streamErrorWithMessage:v18 code:15];
    [(MOVStreamWriter *)self informDelegateAboutError:v19];
  }
  BOOL v26 = 0;
LABEL_17:
  if ((v40 & 0x80000000) == 0)
  {
    if (!v26) {
      goto LABEL_22;
    }
    goto LABEL_21;
  }
  operator delete((void *)v39[0]);
  if (v26) {
LABEL_21:
  }
    LOBYTE(v26) = 1;
LABEL_22:

  return v26;
}

- (void)writeMetadata:(id)a3 forStreamId:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v7 UTF8String]);
  if (v6)
  {
    int v9 = v8;
    if (+[MIOLog debugEnabled])
    {
      id v10 = +[MIOLog defaultLog];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        id v25 = v7;
        _os_log_impl(&dword_21B5ED000, v10, OS_LOG_TYPE_DEBUG, "writeMetadata: call 'metadataAdaptor appendTimedMetadataGroup' for stream: %@", buf, 0xCu);
      }
    }
    id v11 = self->_perfLogAVF;
    id v12 = v11;
    os_signpost_id_t avfAppendMetadataSignPost = self->_avfAppendMetadataSignPost;
    if (avfAppendMetadataSignPost - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v11))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_21B5ED000, v12, OS_SIGNPOST_INTERVAL_BEGIN, avfAppendMetadataSignPost, "mio.append.timed.metadata.group", (const char *)&unk_21B668A56, buf, 2u);
    }

    int v14 = [(id)v9[1] appendTimedMetadataGroup:v6];
    CMTimeEpoch v15 = self->_perfLogAVF;
    int v16 = v15;
    os_signpost_id_t v17 = self->_avfAppendMetadataSignPost;
    if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v15))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_21B5ED000, v16, OS_SIGNPOST_INTERVAL_END, v17, "mio.append.timed.metadata.group", (const char *)&unk_21B668A56, buf, 2u);
    }

    if (+[MIOLog debugEnabled])
    {
      unint64_t v18 = +[MIOLog defaultLog];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412546;
        id v25 = v7;
        __int16 v26 = 1024;
        int v27 = v14;
        _os_log_impl(&dword_21B5ED000, v18, OS_LOG_TYPE_DEBUG, "writeMetadata: call 'metadataAdaptor appendTimedMetadataGroup' for stream: %@ Success: %d", buf, 0x12u);
      }
    }
    if (v14)
    {
      [(MOVStreamWriter *)self informDelegateAboutMediaWrittenForStream:v7 mediaType:2];
    }
    else
    {
      id v19 = [(AVAssetWriter *)self->m_assetWriter error];
      int v20 = self;
      objc_sync_enter(v20);
      id v21 = [(MOVStreamWriterState *)v20->_state criticalErrorOccurred:v19 context:v20];
      [(MOVStreamWriter *)v20 activateNewState:v21 byEvent:@"writeMetadata"];

      objc_sync_exit(v20);
    }
  }
  if (v23 < 0) {
    operator delete(__p[0]);
  }
}

- (double)getExpectedFrameRateForStream:(id)a3
{
  id v4 = a3;
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v4 UTF8String]);
  id v6 = v5;
  if (v5
    && ([v5 objectForKey:@"ExpectedFrameRateForStream"],
        id v7 = objc_claimAutoreleasedReturnValue(),
        (CMTime v8 = v7) != 0))
  {
    [v7 doubleValue];
    double m_expectedFrameRate = v9;
  }
  else
  {
    double m_expectedFrameRate = self->m_expectedFrameRate;
  }

  if (v13 < 0) {
    operator delete(__p[0]);
  }

  return m_expectedFrameRate;
}

- (CGAffineTransform)getVideoTransformForStream:(SEL)a3
{
  id v6 = a4;
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v6 UTF8String]);
  CMTime v8 = v7;
  if (v7
    && ([v7 objectForKey:@"VideoTransform"],
        (double v9 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    +[MOVStreamIOUtility CGAffineTransformValueFromNSValue:v9];
  }
  else
  {
    long long v10 = *(_OWORD *)&self->m_videoTransform.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&self->m_videoTransform.a;
    *(_OWORD *)&retstr->c = v10;
    *(_OWORD *)&retstr->tx = *(_OWORD *)&self->m_videoTransform.tx;
  }

  if (v13 < 0) {
    operator delete(__p[0]);
  }

  return result;
}

- (int)encoderTypeForStream:(id)a3
{
  id v4 = a3;
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v4 UTF8String]);
  id v6 = v5;
  if (!v5) {
    __assert_rtn("-[MOVStreamWriter encoderTypeForStream:]", "MOVStreamWriter.mm", 3369, "configuration");
  }
  id v7 = [v5 objectForKey:@"StreamEncoderType"];
  int v8 = [v7 intValue];

  if (v11 < 0) {
    operator delete(__p[0]);
  }

  return v8;
}

- (void)setupAssetWriterStreamInputsWithError:(id *)a3
{
  uint64_t v106 = *MEMORY[0x263EF8340];
  begin = (char *)self->m_orderedStreamNames.__begin_;
  end = (char *)self->m_orderedStreamNames.__end_;
  if (begin != end)
  {
    p_m_streamDataMap = (uint64_t **)&self->m_streamDataMap;
    id location = (id *)&self->_delegate;
    int v85 = (void *)*MEMORY[0x263EF9D48];
    long long v80 = (void *)*MEMORY[0x263EF9CE8];
    uint64_t v77 = *MEMORY[0x263EFA1B0];
    uint64_t v78 = *MEMORY[0x263EF9D08];
    unint64_t v89 = &self->m_streamDataMap;
    while (1)
    {
      id v6 = begin;
      if (begin[23] < 0) {
        id v6 = *(const std::string::value_type **)begin;
      }
      v93 = [NSString stringWithUTF8String:v6];
      id v7 = +[MOVStreamOutputSettings outputSettingsForStream:v5 defaultFrameRate:self->m_enableAVEHighPerformanceProfile enableAVEHighPerformanceProfile:self->m_expectedFrameRate];
      int v8 = v93;
      os_signpost_id_t v90 = v7;
      if (!v7) {
        goto LABEL_29;
      }
      double v9 = [v7 settings];
      BOOL v10 = v9 == 0;

      if (v10) {
        break;
      }
      int v8 = v93;
      uint64_t v11 = [v90 settings];
      BOOL v12 = [(MOVStreamWriter *)self inProcessRecording];
      char v91 = (void *)v11;
      if (v11) {
        BOOL v13 = v12;
      }
      else {
        BOOL v13 = 0;
      }
      if (v13)
      {
        int v14 = +[MIOLog defaultLog];
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v101 = v93;
          _os_log_impl(&dword_21B5ED000, v14, OS_LOG_TYPE_ERROR, "MOVStreamWriter.inProcessRecording requires custom or none encoder settings. Encoding for stream %{public}@ will not performed in process!", buf, 0xCu);
        }
LABEL_20:

        int v8 = v93;
      }
LABEL_30:
      uint64_t MediaType = CMFormatDescriptionGetMediaType((CMFormatDescriptionRef)*v5);
      id v30 = +[MIOMediaTypeUtility matchingAVMediaTypeFromCMType:MediaType];
      v5[23] = +[MIOMediaTypeUtility matchingMIOMediaTypeFromCMType:MediaType];
      if (*v5)
      {
        if (!v30) {
          goto LABEL_39;
        }
      }
      else
      {
        id v35 = v85;

        v5[23] = 0;
        id v30 = v35;
        int v8 = v93;
        if (!v35)
        {
LABEL_39:
          long long v36 = [NSString stringWithFormat:@"Unsupported media type (%d) for stream '%@'.", MediaType, v8];
          [MEMORY[0x263F087E8] populateStreamError:a3 message:v36 code:11];

LABEL_41:
          int v38 = 1;
          goto LABEL_101;
        }
      }
      if (![(AVAssetWriter *)self->m_assetWriter canApplyOutputSettings:v91 forMediaType:v30])
      {
        long long v37 = [NSString stringWithFormat:@"Unable to use output settings (%@) for track '%@'.", v91, v8];
        [MEMORY[0x263F087E8] populateStreamError:a3 message:v37 code:11];

        goto LABEL_41;
      }
      int v84 = *((_DWORD *)v5 + 52);
      if (v84 <= 0) {
        int v84 = [(MOVStreamWriter *)self baseMediaTimeScale];
      }
      CMTime v31 = (const void *)[(id)v5[11] createTrackFormatDescriptionFromStreamData:v5];
      id v32 = +[MOVStreamOptions sharedOptions];
      int v33 = [v32 skipSourceHint];

      if (v33)
      {
        long long v34 = v93;
        if (v31)
        {
          CFRelease(v31);
          CMTime v31 = 0;
        }
      }
      else
      {
        long long v34 = v93;
      }
      long long v39 = +[MIOLog defaultLog];
      if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        v101 = v34;
        _os_log_impl(&dword_21B5ED000, v39, OS_LOG_TYPE_INFO, "Will add AVAssetWriterInput for stream '%{public}@'", buf, 0xCu);
      }

      if (+[MIOLog debugEnabled])
      {
        char v40 = +[MIOLog defaultLog];
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138543874;
          v101 = v93;
          __int16 v102 = 2114;
          id v103 = v91;
          __int16 v104 = 2114;
          uint64_t v105 = v31;
          _os_log_impl(&dword_21B5ED000, v40, OS_LOG_TYPE_DEBUG, "Will add AVAssetWriterInput for stream '%{public}@' with outputSettings: %{public}@ \n sourceFormatHint: %{public}@", buf, 0x20u);
        }
      }
      uint64_t v41 = [objc_alloc(MEMORY[0x263EFA520]) initWithMediaType:v30 outputSettings:v91 sourceFormatHint:v31];
      CMTimeScale v42 = (void *)v5[2];
      v5[2] = v41;

      if (v31) {
        CFRelease(v31);
      }
      if (v30 != v80) {
        [(id)v5[2] setMediaTimeScale:v84];
      }
      if (v30 == v85)
      {
        [(MOVStreamWriter *)self getVideoTransformForStream:v93];
        *(_OWORD *)v95 = *(_OWORD *)&v95[7];
        *(_OWORD *)&v95[2] = *(_OWORD *)&v95[9];
        *(_OWORD *)&v95[4] = *(_OWORD *)&v95[11];
        [(id)v5[2] setTransform:v95];
      }
      [(id)v5[2] setExpectsMediaDataInRealTime:self->m_realtime];
      if ([(MOVStreamWriter *)self legacyKeysMode])
      {
        int v83 = [(MOVStreamWriter *)self getTrackMetadataForStream:v93];
        v99[0] = v83;
        dispatch_time_t v82 = [(MOVStreamWriter *)self getLegacyTrackMetadataForStream:v93];
        v99[1] = v82;
        id v81 = [(MOVStreamWriter *)self getTrackInputPixelFormatMetadataForStream:v93 fromMap:v89];
        v99[2] = v81;
        uint64_t v43 = [(MOVStreamWriter *)self getTrackEncodedPixelFormatMetadataForStream:v93 fromMap:v89];
        v99[3] = v43;
        char v44 = [(MOVStreamWriter *)self getLegacyTrackInputPixelFormatMetadataForStream:v93 fromMap:v89];
        v99[4] = v44;
        char v45 = [(MOVStreamWriter *)self getLegacyTrackEncodedPixelFormatMetadataForStream:v93 fromMap:v89];
        v99[5] = v45;
        long long v46 = [(MOVStreamWriter *)self getLegacyTrackMetadataForAttachmentsSerializationMode:v93 fromMap:v89];
        v99[6] = v46;
        uint64_t v47 = [(MOVStreamWriter *)self getTrackMetadataForAttachmentsSerializationMode:v93 fromMap:v89];
        v99[7] = v47;
        CMTimeValue v48 = [(MOVStreamWriter *)self getTrackMetadataForTrackTypeInfo:v93 fromMap:v89];
        v99[8] = v48;
        id v49 = [MEMORY[0x263EFF8C0] arrayWithObjects:v99 count:9];
        uint64_t v88 = (void *)[v49 mutableCopy];
      }
      else
      {
        int v83 = [(MOVStreamWriter *)self getTrackMetadataForStream:v93];
        v98[0] = v83;
        dispatch_time_t v82 = [(MOVStreamWriter *)self getTrackInputPixelFormatMetadataForStream:v93 fromMap:v89];
        v98[1] = v82;
        id v81 = [(MOVStreamWriter *)self getTrackEncodedPixelFormatMetadataForStream:v93 fromMap:v89];
        v98[2] = v81;
        uint64_t v43 = [(MOVStreamWriter *)self getTrackMetadataForAttachmentsSerializationMode:v93 fromMap:v89];
        v98[3] = v43;
        char v44 = [(MOVStreamWriter *)self getTrackMetadataForTrackTypeInfo:v93 fromMap:v89];
        v98[4] = v44;
        char v45 = [MEMORY[0x263EFF8C0] arrayWithObjects:v98 count:5];
        uint64_t v88 = (void *)[v45 mutableCopy];
      }

      if (v5[13] && v5[14])
      {
        int v50 = -[MOVStreamWriter createRelatedToStreamMetadata:](self, "createRelatedToStreamMetadata:");
        [v88 addObject:v50];

        id v51 = [(MOVStreamWriter *)self createRelationSpecifierMetadata:v5[14]];
        [v88 addObject:v51];
      }
      uint64_t v52 = [(MOVStreamWriter *)self getTrackMetadataForExactBytesPerRow:v93 fromMap:v89 error:a3];
      Float64 v53 = (void *)v52;
      if (!*a3 || v52)
      {
        if (v52) {
          [v88 addObject:v52];
        }
        uint64_t v54 = [MEMORY[0x263EFA748] qtTrackMetadataItemsForStreamId:v93];
        [v88 addObjectsFromArray:v54];

        id v55 = v88;
        if (+[MIOPixelBufferUtility isPixelFormatRawBayer:[(MOVStreamWriter *)self getPixelFormatForStream:v93 fromMap:v89]])
        {
          uint64_t v56 = [(MOVStreamWriter *)self getTrackMetadataForRawBayerRearrangeType:v93 fromMap:v89];
          if (v56) {
            [v88 addObject:v56];
          }

          id v55 = v88;
        }
        v57 = [(id)v5[5] objectForKey:@"OutputPixelFormatOverride"];
        uint64_t v58 = v57;
        if (v57)
        {
          uint64_t v59 = objc_msgSend(MEMORY[0x263EFA748], "trackMetadataItemWithOutputPixelFormatOverride:", objc_msgSend(v57, "intValue"));
          if (v59) {
            [v55 addObject:v59];
          }

          id v55 = v88;
        }
        char v60 = [(MOVStreamWriter *)self customTrackMetadataForStream:v93 fromMap:v89];
        if (v60) {
          [v55 addObjectsFromArray:v60];
        }
        id v61 = (void *)[v55 copy];
        [(id)v5[2] setMetadata:v61];

        if (begin[23] < 0)
        {
          std::string::__init_copy_ctor_external(&v94, *(const std::string::value_type **)begin, *((void *)begin + 1));
        }
        else
        {
          long long v62 = *(_OWORD *)begin;
          v94.__r_.__value_.__r.__words[2] = *((void *)begin + 2);
          *(_OWORD *)&v94.__r_.__value_.__l.__data_ = v62;
        }
        objc_msgSend((id)v5[2], "setMarksOutputTrackAsEnabled:", -[MOVStreamWriter marksOutputTracksAsEnabledForStream:fromMap:](self, "marksOutputTracksAsEnabledForStream:fromMap:", &v94, v89));
        if (SHIBYTE(v94.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v94.__r_.__value_.__l.__data_);
        }
        if (*((unsigned char *)v5 + 128))
        {
          if ([(AVAssetWriter *)self->m_assetWriter canAddInput:v5[2]])
          {
            [(AVAssetWriter *)self->m_assetWriter addInput:v5[2]];
            id WeakRetained = objc_loadWeakRetained(location);
            char v64 = objc_opt_respondsToSelector();

            if (v64)
            {
              int v65 = objc_loadWeakRetained(location);
              uint64_t v97 = v5[2];
              int v66 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v97 count:1];
              [v65 streamWriter:self stream:v93 preparedTrackInputs:v66 mediaType:v5[23]];
              goto LABEL_85;
            }
            int v38 = 0;
LABEL_99:

            goto LABEL_100;
          }
          int v65 = [NSString stringWithFormat:@"Can't add stream input to the asset writer to stream: %@", v93];
          [MEMORY[0x263F087E8] populateStreamError:a3 message:v65 code:13];
LABEL_97:
          int v38 = 1;
LABEL_98:

          goto LABEL_99;
        }
        uint64_t v67 = [(MOVStreamWriter *)self createMetadataFormatDescription:@"mdta/com.apple.stream_sample_attachments"];
        if (!v67)
        {
          int v65 = [NSString stringWithFormat:@"Unable to get metadata format description for stream: %@", v93];
          [MEMORY[0x263F087E8] populateStreamError:a3 message:v65 code:12];
          goto LABEL_97;
        }
        uint64_t v68 = [objc_alloc(MEMORY[0x263EFA520]) initWithMediaType:v78 outputSettings:0 sourceFormatHint:v67];
        CMTimeScale v69 = (void *)v5[3];
        v5[3] = v68;

        CFRelease(v67);
        int v65 = +[MOVStreamIOUtility qtTrackNameForAssociatedAttachmentsTrack:v93];
        int v66 = [MEMORY[0x263EFA748] qtTrackMetadataItemsForStreamId:v65];
        [(id)v5[3] setMetadata:v66];
        [(id)v5[3] setMediaTimeScale:v84];
        [(id)v5[3] setExpectsMediaDataInRealTime:self->m_realtime];
        [(id)v5[3] addTrackAssociationWithTrackOfInput:v5[2] type:v77];
        uint64_t v70 = [MEMORY[0x263EFA528] assetWriterInputMetadataAdaptorWithAssetWriterInput:v5[3]];
        id v71 = (void *)v5[4];
        v5[4] = v70;

        if ([(AVAssetWriter *)self->m_assetWriter canAddInput:v5[2]]
          && [(AVAssetWriter *)self->m_assetWriter canAddInput:v5[3]])
        {
          [(AVAssetWriter *)self->m_assetWriter addInput:v5[2]];
          [(AVAssetWriter *)self->m_assetWriter addInput:v5[3]];
          id v72 = objc_loadWeakRetained(location);
          char v73 = objc_opt_respondsToSelector();

          if (v73)
          {
            int v74 = objc_loadWeakRetained(location);
            uint64_t v75 = v5[3];
            v96[0] = v5[2];
            v96[1] = v75;
            id v76 = [MEMORY[0x263EFF8C0] arrayWithObjects:v96 count:2];
            [v74 streamWriter:self stream:v93 preparedTrackInputs:v76 mediaType:v5[23]];

            int v38 = 0;
            goto LABEL_93;
          }
LABEL_85:
          int v38 = 0;
        }
        else
        {
          int v74 = [NSString stringWithFormat:@"Can't add stream and metadata inputs to the asset writer to stream: %@", v93];
          [MEMORY[0x263F087E8] populateStreamError:a3 message:v74 code:13];
          int v38 = 1;
LABEL_93:
        }
        goto LABEL_98;
      }
      int v38 = 1;
LABEL_100:

LABEL_101:
      p_m_streamDataMap = (uint64_t **)&self->m_streamDataMap;
      if (!v38)
      {
        begin += 24;
        if (begin != end) {
          continue;
        }
      }
      return;
    }
    CMTimeEpoch v15 = [v90 config];
    BOOL v16 = v15 == 0;

    if (v16)
    {
      id v21 = [MOVStreamVideoEncoderInterface alloc];
      [v90 expectedFrameRate];
      uint64_t v22 = -[MOVStreamVideoEncoderInterface initWithExpectedFrameRate:forStream:delegate:enableAVEHighPerformanceProfile:](v21, "initWithExpectedFrameRate:forStream:delegate:enableAVEHighPerformanceProfile:", v93, self, self->m_enableAVEHighPerformanceProfile);
      unint64_t v18 = (void *)v5[6];
      v5[6] = v22;
    }
    else
    {
      os_signpost_id_t v17 = [MOVStreamVideoEncoderInterface alloc];
      unint64_t v18 = [v90 config];
      uint64_t v19 = [(MOVStreamVideoEncoderInterface *)v17 initForStream:v93 configuration:v18 delegate:self];
      int v20 = (void *)v5[6];
      v5[6] = v19;
    }
    objc_msgSend((id)v5[6], "setCustomEncoderConfig:", objc_msgSend(v90, "useCustomEncoderConfig"));
    char v23 = +[MOVStreamOptions sharedOptions];
    int v24 = [v23 disableVTPreSetup];

    if (v24)
    {
      int v14 = +[MIOLog defaultLog];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        v101 = v93;
        _os_log_impl(&dword_21B5ED000, v14, OS_LOG_TYPE_INFO, "Pre-initialize VTCompressionSession for stream '%{public}@' disabled.", buf, 0xCu);
      }
      char v91 = 0;
      goto LABEL_20;
    }
    id v25 = (const void *)[(id)v5[11] createTrackFormatDescriptionFromStreamData:v5];
    __int16 v26 = +[MIOLog defaultLog];
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v101 = v93;
      _os_log_impl(&dword_21B5ED000, v26, OS_LOG_TYPE_INFO, "Pre-initialize VTCompressionSession for stream '%{public}@'...", buf, 0xCu);
    }

    int v8 = v93;
    if (([(id)v5[6] preSetupWithFormatDescription:v25] & 1) == 0)
    {
      int v27 = [NSString stringWithFormat:@"Orig fd: %@  Used fd: %@", *v5, v25];
      uint64_t v28 = +[MIOLog defaultLog];
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543618;
        v101 = v93;
        __int16 v102 = 2114;
        id v103 = v27;
        _os_log_impl(&dword_21B5ED000, v28, OS_LOG_TYPE_INFO, "Pre-initialize VTCompressionSession for stream '%{public}@' failed (%{public}@)! Will try again after first pixel buffer is appended...", buf, 0x16u);
      }

      int v8 = v93;
    }
    if (v25) {
      CFRelease(v25);
    }
LABEL_29:
    char v91 = 0;
    goto LABEL_30;
  }
}

- (void)setupMetadataInputsWithError:(id *)a3
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  begin = self->m_orderedMetadataStreamNames.__begin_;
  end = self->m_orderedMetadataStreamNames.__end_;
  if (begin != end)
  {
    p_m_metadataDataMap = (uint64_t **)&self->m_metadataDataMap;
    id location = (id *)&self->_delegate;
    uint64_t v36 = *MEMORY[0x263EF9D08];
    uint64_t v38 = *MEMORY[0x263F00F88];
    while (1)
    {
      id v5 = begin;
      if (*((char *)begin + 23) < 0) {
        id v5 = (void *)*begin;
      }
      id v6 = [NSString stringWithUTF8String:v5];
      id v7 = (opaqueCMFormatDescription *)v4[2];
      if (!v7)
      {
        int v8 = *((unsigned char *)v4 + 24) ? @"mdta/com.apple.rawIMUDict" : @"mdta/com.apple.metadata_stream_item";
        id v7 = [(MOVStreamWriter *)self createMetadataFormatDescription:v8];
        if (!v7)
        {
          int v33 = [NSString stringWithFormat:@"Unable to get metadata format description for stream: %@", v6];
          [MEMORY[0x263F087E8] populateStreamError:a3 message:v33 code:12];

          return;
        }
      }
      uint64_t v9 = [objc_alloc(MEMORY[0x263EFA520]) initWithMediaType:v36 outputSettings:0 sourceFormatHint:v7];
      id v10 = (id)*v4;
      uint64_t *v4 = v9;

      v4[2] = 0;
      CFRelease(v7);
      uint64_t v11 = *((unsigned int *)v4 + 18);
      if ((int)v11 <= 0) {
        uint64_t v11 = [(MOVStreamWriter *)self baseMediaTimeScale];
      }
      BOOL v12 = [MEMORY[0x263EFA790] metadataItem];
      BOOL v13 = v12;
      if (*((unsigned char *)v4 + 24)) {
        int v14 = @"mdta/com.apple.imuTrackType";
      }
      else {
        int v14 = @"mdta/com.apple.track_kind";
      }
      [v12 setIdentifier:v14];
      CMTimeEpoch v15 = +[MIOLog defaultLog];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        uint64_t v43 = v6;
        _os_log_impl(&dword_21B5ED000, v15, OS_LOG_TYPE_INFO, "Setup metadata track with streamId \"%{public}@\"", buf, 0xCu);
      }

      [v13 setDataType:v38];
      [v13 setExtraAttributes:0];
      [v13 setValue:v6];
      if ([(MOVStreamWriter *)self legacyKeysMode])
      {
        BOOL v16 = [MEMORY[0x263EFA790] metadataItem];
        os_signpost_id_t v17 = +[MIOVersion versionZero];
        unint64_t v18 = [v17 versionedKey:@"mdta/com.apple.track_kind" modifier:@"metadata"];
        [v16 setIdentifier:v18];

        if (+[MIOLog debugEnabled])
        {
          uint64_t v19 = +[MIOLog defaultLog];
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
          {
            int v20 = [v16 identifier];
            *(_DWORD *)buf = 138543362;
            uint64_t v43 = v20;
            _os_log_impl(&dword_21B5ED000, v19, OS_LOG_TYPE_DEBUG, "Setup metadata track with legacy identifier \"%{public}@\"", buf, 0xCu);
          }
        }
        [v16 setDataType:v38];
        [v16 setExtraAttributes:0];
        [v16 setValue:v6];
        id v21 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithObjects:", v13, v16, 0);
      }
      else
      {
        id v21 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithObjects:", v13, 0);
      }
      uint64_t v22 = [(MOVStreamWriter *)self getTrackMetadataForTimeRangeMetadata:v6 fromMap:p_m_metadataDataMap];
      [v21 addObject:v22];
      char v23 = [(MOVStreamWriter *)self customMetadataTrackMetadataForStream:v6 fromMap:p_m_metadataDataMap];
      if ([v23 count]) {
        [v21 addObjectsFromArray:v23];
      }
      int v24 = [MEMORY[0x263EFA748] qtTrackMetadataItemsForStreamId:v6];
      [v21 addObjectsFromArray:v24];

      [(id)*v4 setMetadata:v21];
      [(id)*v4 setMediaTimeScale:v11];
      [(id)*v4 setExpectsMediaDataInRealTime:self->m_realtime];
      uint64_t v25 = [MEMORY[0x263EFA528] assetWriterInputMetadataAdaptorWithAssetWriterInput:*v4];
      __int16 v26 = (void *)v4[1];
      v4[1] = v25;

      BOOL v27 = [(AVAssetWriter *)self->m_assetWriter canAddInput:*v4];
      if (!v27) {
        break;
      }
      [(AVAssetWriter *)self->m_assetWriter addInput:*v4];
      id WeakRetained = objc_loadWeakRetained(location);
      char v29 = objc_opt_respondsToSelector();

      if (v29)
      {
        id v30 = objc_loadWeakRetained(location);
        uint64_t v41 = *v4;
        CMTime v31 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v41 count:1];
        [v30 streamWriter:self stream:v6 preparedTrackInputs:v31 mediaType:2];

LABEL_30:
      }

      begin += 3;
      if (begin == end || !v27) {
        return;
      }
    }
    id v30 = [NSString stringWithFormat:@"Can't add metadata input to the asset writer to stream: %@", v6];
    [MEMORY[0x263F087E8] populateStreamError:a3 message:v30 code:13];
    goto LABEL_30;
  }
}

- (void)setupAssociatedMetadataInputsWithError:(id *)a3
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::map<std::string, (anonymous namespace)::MetadataRecordingData>>, void *>>> *)self->m_associatedMetadataDataMap.__tree_.__begin_node_;
  p_pair1 = &self->m_associatedMetadataDataMap.__tree_.__pair1_;
  if (begin_node != &self->m_associatedMetadataDataMap.__tree_.__pair1_)
  {
    p_m_streamDataMap = (uint64_t **)&self->m_streamDataMap;
    uint64_t v35 = *MEMORY[0x263EF9D08];
    uint64_t v36 = *MEMORY[0x263F00F88];
    uint64_t v34 = *MEMORY[0x263EFA1B0];
    id location = (id *)&self->_delegate;
    while (1)
    {
      left = begin_node + 4;
      if (SHIBYTE(begin_node[6].__value_.__left_) < 0)
      {
        std::string::__init_copy_ctor_external(&v39, (const std::string::value_type *)begin_node[4].__value_.__left_, (std::string::size_type)begin_node[5].__value_.__left_);
        id v6 = NSString;
        if (SHIBYTE(begin_node[6].__value_.__left_) < 0) {
          left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::map<std::string, (anonymous namespace)::MetadataRecordingData>>, void *>>> *)left->__value_.__left_;
        }
      }
      else
      {
        *(_OWORD *)&v39.__r_.__value_.__l.__data_ = *(_OWORD *)&left->__value_.__left_;
        v39.__r_.__value_.__r.__words[2] = (std::string::size_type)begin_node[6].__value_.__left_;
        id v6 = NSString;
      }
      id v7 = [v6 stringWithUTF8String:left];
      int v8 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::map<std::string, (anonymous namespace)::MetadataRecordingData>>, void *>>> *)begin_node[7].__value_.__left_;
      if (v8 != &begin_node[8])
      {
        while (1)
        {
          uint64_t v9 = v8 + 4;
          if (SHIBYTE(v8[6].__value_.__left_) < 0) {
            uint64_t v9 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::map<std::string, (anonymous namespace)::MetadataRecordingData>>, void *>>> *)v9->__value_.__left_;
          }
          id v10 = [NSString stringWithUTF8String:v9];
          uint64_t v12 = *((unsigned int *)v11 + 52);
          if ((int)v12 <= 0) {
            uint64_t v12 = [(MOVStreamWriter *)self baseMediaTimeScale];
          }
          BOOL v13 = [NSString stringWithFormat:@"mdta/%@", v10];
          int v14 = [MEMORY[0x263EFA790] metadataItem];
          [v14 setIdentifier:v13];
          [v14 setDataType:v36];
          [v14 setExtraAttributes:0];
          [v14 setValue:v7];
          CMTimeEpoch v15 = +[MIOLog defaultLog];
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138543618;
            uint64_t v43 = v7;
            __int16 v44 = 2114;
            char v45 = v10;
            _os_log_impl(&dword_21B5ED000, v15, OS_LOG_TYPE_INFO, "Setup associated metadata track for streamId \"%{public}@\" metadataId \"%{public}@\"", buf, 0x16u);
          }

          BOOL v16 = (opaqueCMFormatDescription *)v8[9].__value_.__left_;
          if (!v16)
          {
            BOOL v16 = [(MOVStreamWriter *)self createMetadataFormatDescription:v13];
            if (!v16) {
              break;
            }
          }
          uint64_t v17 = [objc_alloc(MEMORY[0x263EFA520]) initWithMediaType:v35 outputSettings:0 sourceFormatHint:v16];
          unint64_t v18 = v8[7].__value_.__left_;
          v8[7].__value_.__left_ = (void *)v17;

          v8[9].__value_.__left_ = 0;
          CFRelease(v16);
          uint64_t v41 = v14;
          uint64_t v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v41 count:1];
          [v8[7].__value_.__left_ setMetadata:v19];

          [v8[7].__value_.__left_ setMediaTimeScale:v12];
          [v8[7].__value_.__left_ setExpectsMediaDataInRealTime:self->m_realtime];
          [v8[7].__value_.__left_ addTrackAssociationWithTrackOfInput:v11[2] type:v34];
          uint64_t v20 = [MEMORY[0x263EFA528] assetWriterInputMetadataAdaptorWithAssetWriterInput:v8[7].__value_.__left_];
          id v21 = v8[8].__value_.__left_;
          v8[8].__value_.__left_ = (void *)v20;

          if (![(AVAssetWriter *)self->m_assetWriter canAddInput:v8[7].__value_.__left_]) {
            break;
          }
          [(AVAssetWriter *)self->m_assetWriter addInput:v8[7].__value_.__left_];
          id WeakRetained = objc_loadWeakRetained(location);
          char v23 = objc_opt_respondsToSelector();

          if (v23)
          {
            id v24 = objc_loadWeakRetained(location);
            uint64_t v40 = v11[3];
            uint64_t v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v40 count:1];
            [v24 streamWriter:self stream:v7 preparedTrackInputs:v25 mediaType:2];
          }
          __int16 v26 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::map<std::string, (anonymous namespace)::MetadataRecordingData>>, void *>>> *)v8[1].__value_.__left_;
          if (v26)
          {
            do
            {
              BOOL v27 = v26;
              __int16 v26 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::map<std::string, (anonymous namespace)::MetadataRecordingData>>, void *>>> *)v26->__value_.__left_;
            }
            while (v26);
          }
          else
          {
            do
            {
              BOOL v27 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::map<std::string, (anonymous namespace)::MetadataRecordingData>>, void *>>> *)v8[2].__value_.__left_;
              BOOL v28 = v27->__value_.__left_ == v8;
              int v8 = v27;
            }
            while (!v28);
          }
          int v8 = v27;
          if (v27 == &begin_node[8]) {
            goto LABEL_26;
          }
        }
        [MEMORY[0x263F087E8] populateStreamError:a3 message:@"Unable to get metadata format" code:13];

        goto LABEL_29;
      }
LABEL_26:
      int v29 = 1;
LABEL_30:

      if (SHIBYTE(v39.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v39.__r_.__value_.__l.__data_);
      }
      if (v29)
      {
        id v30 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::map<std::string, (anonymous namespace)::MetadataRecordingData>>, void *>>> *)begin_node[1].__value_.__left_;
        if (v30)
        {
          do
          {
            CMTime v31 = v30;
            id v30 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::map<std::string, (anonymous namespace)::MetadataRecordingData>>, void *>>> *)v30->__value_.__left_;
          }
          while (v30);
        }
        else
        {
          do
          {
            CMTime v31 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::map<std::string, (anonymous namespace)::MetadataRecordingData>>, void *>>> *)begin_node[2].__value_.__left_;
            BOOL v28 = v31->__value_.__left_ == begin_node;
            begin_node = v31;
          }
          while (!v28);
        }
        begin_node = v31;
        if (v31 != p_pair1) {
          continue;
        }
      }
      return;
    }
    id v10 = [NSString stringWithFormat:@"Cannot setup metadata associated with %@: %@ stream doesn't exist", v7, v7];
    [MEMORY[0x263F087E8] populateStreamError:a3 message:v10 code:13];
LABEL_29:

    int v29 = 0;
    goto LABEL_30;
  }
}

- (unint64_t)fifoBufferSizeForStream:(id)a3
{
  id v4 = a3;
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v4 UTF8String]);
  p_m_streamDataMap = (uint64_t **)&self->m_streamDataMap;
  {
  }
  else
  {
    unint64_t v6 = 0;
  }
  if (v9 < 0) {
    operator delete(__p[0]);
  }

  return v6;
}

- (void)setFifoBufferCapacity:(unint64_t)a3
{
  -[MOVStreamWriter setDefaultWritingBufferCapacity:](self, "setDefaultWritingBufferCapacity:");
  [(MOVStreamWriter *)self setDefaultAudioWritingBufferCapacity:a3];

  [(MOVStreamWriter *)self setDefaultMetadataWritingBufferCapacity:a3];
}

- (BOOL)setVideoTransformFromOrientation:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  int v5 = [(MOVStreamWriterState *)self->_state canConfigure:self];
  if (v5)
  {
    +[MOVStreamIOUtility transformAngleFromVideoOrientation:v3];
    CGAffineTransformMakeRotation(&v9, v6);
    long long v7 = *(_OWORD *)&v9.c;
    *(_OWORD *)&self->m_videoTransform.a = *(_OWORD *)&v9.a;
    *(_OWORD *)&self->m_videoTransform.c = v7;
    *(_OWORD *)&self->m_videoTransform.tx = *(_OWORD *)&v9.tx;
  }
  return v5;
}

- (void)prepareToRecord
{
}

- (id)startWritingThreadForNonMetadataOnlyThreadId:(unsigned __int8)a3
{
  unsigned int v3 = a3;
  objc_initWeak(&location, self);
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2020000000;
  char v15 = v3;
  id v4 = objc_alloc(MEMORY[0x263F08B88]);
  uint64_t v8 = MEMORY[0x263EF8330];
  uint64_t v9 = 3221225472;
  id v10 = __64__MOVStreamWriter_startWritingThreadForNonMetadataOnlyThreadId___block_invoke;
  uint64_t v11 = &unk_2643AF758;
  objc_copyWeak(&v13, &location);
  uint64_t v12 = v14;
  int v5 = (void *)[v4 initWithBlock:&v8];
  CGFloat v6 = objc_msgSend(NSString, "stringWithFormat:", @"MOVStreamWriterSamples.%u", v3, v8, v9, v10, v11);
  [v5 setName:v6];
  [v5 setQualityOfService:33];
  [v5 start];

  objc_destroyWeak(&v13);
  _Block_object_dispose(v14, 8);
  objc_destroyWeak(&location);

  return v5;
}

void __64__MOVStreamWriter_startWritingThreadForNonMetadataOnlyThreadId___block_invoke(uint64_t a1)
{
  uint64_t v105 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x21D4924B0]();
  uint64_t v89 = a1;
  id location = (id *)(a1 + 40);
  id WeakRetained = (os_log_t *)objc_loadWeakRetained((id *)(a1 + 40));
  if (!WeakRetained)
  {
    return;
  }
  id v4 = WeakRetained;
  int v5 = (void *)MEMORY[0x263F08B88];
  [(os_log_t *)WeakRetained writingThreadPriority];
  if ((objc_msgSend(v5, "setThreadPriority:") & 1) == 0)
  {
    CGFloat v6 = +[MIOLog defaultLog];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      [(os_log_t *)v4 writingThreadPriority];
      *(_DWORD *)buf = 134217984;
      os_signpost_id_t v98 = v7;
      _os_log_impl(&dword_21B5ED000, v6, OS_LOG_TYPE_ERROR, "[WritingThread] Cannot set priority to %f.", buf, 0xCu);
    }
  }
  os_signpost_id_t v85 = os_signpost_id_generate(v4[55]);
  LOBYTE(v78) = [(os_log_t *)v4 canWriteData];

  objc_msgSend(NSString, "stringWithFormat:", @"com.apple.movstreamwriter.writingthread.%u", *(unsigned __int8 *)(*(void *)(*(void *)(v89 + 32) + 8) + 24));
  id v73 = objc_claimAutoreleasedReturnValue();
  uint64_t v8 = os_log_create((const char *)[v73 UTF8String], "PointsOfInterest");
  os_signpost_id_t v9 = os_signpost_id_generate(v8);
  uint64_t v75 = v8;
  uint64_t v84 = 0;
  os_signpost_id_t spid = os_signpost_id_generate(v8);
  unint64_t v76 = spid - 1;
  os_signpost_id_t v77 = v9;
  unint64_t v81 = v9 - 1;
  do
  {
    if ((v78 & 1) == 0) {
      goto LABEL_129;
    }
    id v10 = v75;
    uint64_t v11 = v10;
    log = v10;
    if (v76 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      BOOL v12 = os_signpost_enabled(v10);
      uint64_t v11 = log;
      if (v12)
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_21B5ED000, log, OS_SIGNPOST_INTERVAL_BEGIN, spid, "write thread", (const char *)&unk_21B668A56, buf, 2u);
        uint64_t v11 = log;
      }
    }

    int v13 = 0;
    LOBYTE(v78) = 1;
    do
    {
      int v14 = log;
      char v15 = v14;
      if (v81 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_21B5ED000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v77, "write fifo samples", (const char *)&unk_21B668A56, buf, 2u);
      }
      dispatch_time_t v82 = v15;

      context = (void *)MEMORY[0x21D4924B0]();
      BOOL v16 = (id *)objc_loadWeakRetained(location);
      v92 = v16;
      uint64_t v17 = v16;
      if (!v16)
      {
        LOBYTE(v78) = 0;
        int v48 = 5;
        BOOL v55 = 1;
        goto LABEL_98;
      }
      unint64_t v18 = (id *)v16[21];
      os_signpost_id_t v90 = (id **)(v16 + 22);
      if (v18 == v16 + 22)
      {
        int v56 = 0;
        char v19 = 0;
        uint64_t v21 = 0;
LABEL_96:
        int v48 = 0;
        goto LABEL_97;
      }
      int v86 = 0;
      char v19 = 0;
      int v20 = 0;
      uint64_t v21 = 0;
      do
      {
        unsigned int v22 = [v17 isAudioStream:v18 + 7];
        unsigned int v23 = v22;
        int v24 = *(unsigned __int8 *)(*(void *)(*(void *)(v89 + 32) + 8) + 24);
        if (v24 == 255)
        {
          if ((v22 & 1) == 0) {
            goto LABEL_81;
          }
        }
        else
        {
          if (*((unsigned __int8 *)v18 + 268) == v24) {
            char v25 = v22;
          }
          else {
            char v25 = 1;
          }
          if (v25) {
            goto LABEL_81;
          }
        }
        uint64_t v88 = v21;
        objc_msgSend(v18[32], "setVisitCount:", objc_msgSend(v18[32], "visitCount") + 1);
        if (*((char *)v18 + 55) < 0) {
          std::string::__init_copy_ctor_external(&v96, (const std::string::value_type *)v18[4], (std::string::size_type)v18[5]);
        }
        else {
          std::string v96 = *(std::string *)(v18 + 4);
        }
        if ((v96.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          __int16 v26 = &v96;
        }
        else {
          __int16 v26 = (std::string *)v96.__r_.__value_.__r.__words[0];
        }
        char v91 = [NSString stringWithUTF8String:v26];
        id v27 = v18[14];
        objc_sync_enter(v27);
        int v28 = objc_msgSend(v17, "getCountByPriorityForFifo:capacity:", objc_msgSend(v18[14], "count"), v18[15]);
        if (v84 == 1) {
          int v28 = [v18[14] count];
        }
        if (v28 < 1)
        {
LABEL_76:
          int v48 = 0;
          goto LABEL_77;
        }
        uint64_t v87 = v23;
        while (![v18[14] count])
        {
LABEL_54:
          if (!--v28) {
            goto LABEL_61;
          }
        }
        objc_msgSend(v18[32], "setAttemptCount:", objc_msgSend(v18[32], "attemptCount") + 1);
        ++v20;
        if ([v18[9] isReadyForMoreMediaData]
          && (*((unsigned char *)v18 + 184) || [v18[10] isReadyForMoreMediaData]))
        {
          if (![v27 count]) {
            goto LABEL_56;
          }
          int v29 = [v27 firstObject];
          id v30 = (opaqueCMSampleBuffer *)[v29 sampleBuffer];
          CMTime v31 = [v29 metadata];
          id v32 = v92;
          if (+[MIOLog debugEnabled])
          {
            int v33 = +[MIOLog defaultLog];
            if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
            {
              CMSampleBufferGetPresentationTimeStamp(&time, v30);
              Float64 Seconds = CMTimeGetSeconds(&time);
              uint64_t v35 = [v27 count];
              id v36 = v18[15];
              *(_DWORD *)buf = 138544130;
              os_signpost_id_t v98 = v91;
              __int16 v99 = 2048;
              Float64 v100 = Seconds;
              __int16 v101 = 2048;
              uint64_t v102 = v35;
              __int16 v103 = 2048;
              id v104 = v36;
              _os_log_impl(&dword_21B5ED000, v33, OS_LOG_TYPE_DEBUG, "[WritingThread] [FIFO] Consume (%{public}@) PTS: %f (%lu/%lu)", buf, 0x2Au);
            }

            id v32 = v92;
          }
          if (!*((unsigned char *)v32 + 98))
          {
            CMSampleBufferGetPresentationTimeStamp(&v94, v30);
            long long v37 = [v32 delegate];
            id v38 = v32[1];
            id v93 = 0;
            char v39 = [v32 startSessionWithFallbackSampleTime:&v94 streamId:v91 mediaType:v87 writerDelegate:v37 delegateCallbackQueue:v38 error:&v93];
            id v40 = v93;

            if (v39)
            {

              id v32 = v92;
              goto LABEL_47;
            }
            uint64_t v46 = v92;
            objc_sync_enter(v46);
            uint64_t v47 = [v92[46] criticalErrorOccurred:v40 context:v46];
            [v46 activateNewState:v47 byEvent:@"startWritingThreadForNonMetadataOnlyThreadId"];

            objc_sync_exit(v46);
            int v44 = 1;
LABEL_64:

            goto LABEL_65;
          }
LABEL_47:
          if ([v32 canWriteData])
          {
            [v32 writeSampleBuffer:v30 andMetadata:v31 forStreamId:v91 signpost:v85];
            objc_msgSend(v18[32], "setWriteCount:", objc_msgSend(v18[32], "writeCount") + 1);
            int v86 = 1;
          }
          else
          {
            if ([v32 isOrWasCanceled])
            {
              [v27 removeObjectAtIndex:0];
              objc_msgSend(v18[32], "setFifoItemCount:", objc_msgSend(v27, "count"));
              CFRelease(v30);
              int v44 = 8;
              goto LABEL_64;
            }
            uint64_t v41 = +[MIOLog defaultLog];
            if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
            {
              CMTimeScale v42 = [v32[46] name];
              *(_DWORD *)buf = 138543618;
              os_signpost_id_t v98 = v91;
              __int16 v99 = 2114;
              Float64 v100 = *(double *)&v42;
              _os_log_impl(&dword_21B5ED000, v41, OS_LOG_TYPE_ERROR, "⛔️⛔️⛔️ ERROR: [FIFO] CANNOT Write Item of stream '%{public}@' for state %{public}@ ⛔️⛔️⛔️", buf, 0x16u);
            }
          }
          [v27 removeObjectAtIndex:0];
          objc_msgSend(v18[32], "setFifoItemCount:", objc_msgSend(v27, "count"));
          CFRelease(v30);
          BOOL v43 = [v27 count] == 0;

          if (v43)
          {
LABEL_56:
            int v44 = 8;
            int v45 = 1;
            goto LABEL_66;
          }
          goto LABEL_54;
        }
        if (!+[MIOLog debugEnabled])
        {
LABEL_61:
          int v45 = 0;
          int v44 = 8;
          goto LABEL_66;
        }
        int v29 = +[MIOLog defaultLog];
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138543362;
          os_signpost_id_t v98 = v91;
          _os_log_impl(&dword_21B5ED000, v29, OS_LOG_TYPE_DEBUG, "[WritingThread] Input for %{public}@ not ready.", buf, 0xCu);
        }
        int v44 = 8;
LABEL_65:

        int v45 = 0;
LABEL_66:
        if (v44 == 8) {
          int v48 = 0;
        }
        else {
          int v48 = v44;
        }
        if (v44 == 8)
        {
          id v49 = v92;
          if (v45)
          {
            if (+[MIOLog debugEnabled])
            {
              int v50 = +[MIOLog defaultLog];
              if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138543362;
                os_signpost_id_t v98 = v91;
                _os_log_impl(&dword_21B5ED000, v50, OS_LOG_TYPE_DEBUG, "[WritingThread] [FIFO] Precheck All Fifo items written '%{public}@'", buf, 0xCu);
              }

              id v49 = v92;
            }
            [v49 checkForFinishing];
            goto LABEL_76;
          }
        }
LABEL_77:
        objc_sync_exit(v27);

        if (SHIBYTE(v96.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v96.__r_.__value_.__l.__data_);
        }
        uint64_t v21 = v88 + 1;
        char v19 = 1;
        uint64_t v17 = v92;
        if (v48)
        {
          int v56 = v86;
          uint64_t v21 = v84;
          goto LABEL_97;
        }
LABEL_81:
        id v51 = (id *)v18[1];
        if (v51)
        {
          do
          {
            uint64_t v52 = (id **)v51;
            id v51 = (id *)*v51;
          }
          while (v51);
        }
        else
        {
          do
          {
            uint64_t v52 = (id **)v18[2];
            BOOL v53 = *v52 == v18;
            unint64_t v18 = (id *)v52;
          }
          while (!v53);
        }
        unint64_t v18 = (id *)v52;
      }
      while (v52 != v90);
      int v48 = 0;
      int v56 = v86 & 1;
      if ((v86 & 1) != 0 || !v20) {
        goto LABEL_97;
      }
      if (!+[MIOLog debugEnabled])
      {
        int v56 = 0;
        goto LABEL_96;
      }
      uint64_t v54 = +[MIOLog defaultLog];
      if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v98) = v20;
        _os_log_impl(&dword_21B5ED000, v54, OS_LOG_TYPE_DEBUG, "[WritingThread] nothing written (attempts: %d).", buf, 8u);
      }

      int v56 = 0;
      int v48 = 0;
      uint64_t v17 = v92;
LABEL_97:

      int v13 = v19 & 1;
      BOOL v55 = v56 != 0;
      uint64_t v84 = v21;
LABEL_98:
      if (v48)
      {
        if (v48 == 5) {
          break;
        }
        goto LABEL_127;
      }
      v57 = v82;
      uint64_t v58 = v57;
      if (v81 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v57))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_21B5ED000, v58, OS_SIGNPOST_INTERVAL_END, v77, "write fifo samples", (const char *)&unk_21B668A56, buf, 2u);
      }
    }
    while (v55);
    uint64_t v59 = (void *)MEMORY[0x21D4924B0]();
    char v60 = objc_loadWeakRetained(location);
    id v61 = v60;
    if (!v60)
    {
      LOBYTE(v78) = 0;
      goto LABEL_115;
    }
    if ([v60 finalConsume])
    {
      long long v62 = +[MIOLog defaultLog];
      if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21B5ED000, v62, OS_LOG_TYPE_INFO, "[WritingThread] finalConsume", buf, 2u);
      }

      id v63 = v82;
      char v64 = v63;
      if (v76 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v63))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_21B5ED000, v64, OS_SIGNPOST_INTERVAL_END, spid, "write thread", (const char *)&unk_21B668A56, buf, 2u);
      }

      if (!*(unsigned char *)(*(void *)(*(void *)(v89 + 32) + 8) + 24)) {
        [v61 clearAllFifoQueues];
      }
LABEL_115:
      int v48 = 3;
    }
    else
    {
      int v78 = [v61 canWriteData] & v13;
      if (v78 == 1)
      {
        int v65 = v61[4];
        dispatch_time_t v66 = dispatch_time(0, 5000000);
        dispatch_semaphore_wait(v65, v66);
        uint64_t v67 = v82;
        uint64_t v68 = v67;
        if (v76 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v67))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_21B5ED000, v68, OS_SIGNPOST_INTERVAL_END, spid, "write thread", (const char *)&unk_21B668A56, buf, 2u);
        }
      }
      objc_msgSend(v61, "setWriteThreadCount:", objc_msgSend(v61, "writeThreadCount") + 1);

      if ((v13 & 1) == 0)
      {
        CMTimeScale v69 = +[MIOLog defaultLog];
        if (os_log_type_enabled(v69, OS_LOG_TYPE_INFO))
        {
          int v70 = *(unsigned __int8 *)(*(void *)(*(void *)(v89 + 32) + 8) + 24);
          *(_DWORD *)buf = 67109120;
          LODWORD(v98) = v70;
          _os_log_impl(&dword_21B5ED000, v69, OS_LOG_TYPE_INFO, "[WritingThread.%u] No streams assigned.", buf, 8u);
        }
      }
      id v61 = 0;
      int v48 = 0;
    }

LABEL_127:
    ;
  }
  while (!v48);
  if (v48 == 3)
  {
LABEL_129:
    id v71 = +[MIOLog defaultLog];
    if (os_log_type_enabled(v71, OS_LOG_TYPE_INFO))
    {
      int v72 = *(unsigned __int8 *)(*(void *)(*(void *)(v89 + 32) + 8) + 24);
      *(_DWORD *)buf = 67109120;
      LODWORD(v98) = v72;
      _os_log_impl(&dword_21B5ED000, v71, OS_LOG_TYPE_INFO, "[WritingThread.%u] Exiting writing loop.", buf, 8u);
    }
  }
}

- (id)startWritingThreadForMetadata
{
  objc_initWeak(&location, self);
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x2020000000;
  uint64_t v10 = 0;
  [(MOVStreamWriter *)self writingThreadPriority];
  uint64_t v10 = v3;
  id v4 = objc_alloc(MEMORY[0x263F08B88]);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __48__MOVStreamWriter_startWritingThreadForMetadata__block_invoke;
  v7[3] = &unk_2643AF780;
  v7[4] = v9;
  objc_copyWeak(&v8, &location);
  int v5 = (void *)[v4 initWithBlock:v7];
  [v5 setName:@"MOVStreamWriterMetadata"];
  [v5 setQualityOfService:33];
  [v5 start];
  objc_destroyWeak(&v8);
  _Block_object_dispose(v9, 8);
  objc_destroyWeak(&location);

  return v5;
}

void __48__MOVStreamWriter_startWritingThreadForMetadata__block_invoke(uint64_t a1)
{
  uint64_t v84 = *MEMORY[0x263EF8340];
  if (([MEMORY[0x263F08B88] setThreadPriority:*(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)] & 1) == 0)
  {
    v2 = +[MIOLog defaultLog];
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      uint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
      *(_DWORD *)buf = 134217984;
      *(void *)&uint8_t buf[4] = v3;
      _os_log_impl(&dword_21B5ED000, v2, OS_LOG_TYPE_ERROR, "[WritingThread] Cannot set priority to %f.", buf, 0xCu);
    }
  }
  id v4 = os_log_create((const char *)[@"com.apple.movstreamwriter.writingthread.metadata" UTF8String], "PointsOfInterest");
  os_signpost_id_t v5 = os_signpost_id_generate(v4);
  uint64_t v58 = v4;
  os_signpost_id_t spid = os_signpost_id_generate(v4);
  unint64_t v59 = spid - 1;
  os_signpost_id_t v60 = v5;
  unint64_t v64 = v5 - 1;
  id location = (id *)(a1 + 40);
  *(void *)&long long v6 = 67109120;
  long long v56 = v6;
  while (1)
  {
    long long v7 = v58;
    id v8 = v7;
    log = v7;
    if (v59 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      BOOL v9 = os_signpost_enabled(v7);
      id v8 = log;
      if (v9)
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_21B5ED000, log, OS_SIGNPOST_INTERVAL_BEGIN, spid, "write thread metadata", (const char *)&unk_21B668A56, buf, 2u);
        id v8 = log;
      }
    }

    char v61 = 1;
    while (1)
    {
      uint64_t v10 = log;
      uint64_t v11 = v10;
      if (v64 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_21B5ED000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v60, "write fifo metadata", (const char *)&unk_21B668A56, buf, 2u);
      }
      int v65 = v11;

      context = (void *)MEMORY[0x21D4924B0]();
      id WeakRetained = objc_loadWeakRetained(location);
      int v13 = (id *)WeakRetained;
      if (!WeakRetained)
      {
        char v61 = 0;
        char v41 = 1;
        int v32 = 5;
        goto LABEL_86;
      }
      if (!WeakRetained[29])
      {
        char v68 = 0;
        char v61 = 0;
        int v32 = 5;
        goto LABEL_85;
      }
      int v14 = (void *)WeakRetained[27];
      uint64_t v67 = WeakRetained + 28;
      if (v14 == WeakRetained + 28)
      {
        int v32 = 0;
        char v68 = 0;
        goto LABEL_85;
      }
      char v68 = 0;
      int v15 = 0;
      while (2)
      {
        if (*((char *)v14 + 55) < 0) {
          std::string::__init_copy_ctor_external(&v73, (const std::string::value_type *)v14[4], v14[5]);
        }
        else {
          std::string v73 = *(std::string *)(v14 + 4);
        }
        if ((v73.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          BOOL v16 = &v73;
        }
        else {
          BOOL v16 = (std::string *)v73.__r_.__value_.__r.__words[0];
        }
        uint64_t v17 = objc_msgSend(NSString, "stringWithUTF8String:", v16, v56);
        objc_msgSend((id)v14[15], "setVisitCount:", objc_msgSend((id)v14[15], "visitCount") + 1);
        id v18 = (id)v14[11];
        objc_sync_enter(v18);
        int v19 = objc_msgSend(v13, "getCountByPriorityForFifo:capacity:", objc_msgSend((id)v14[11], "count"), v14[12]);
        if (v19 < 1) {
          goto LABEL_65;
        }
        while (![v18 count])
        {
LABEL_47:
          if (!--v19) {
            goto LABEL_53;
          }
        }
        objc_msgSend((id)v14[15], "setAttemptCount:", objc_msgSend((id)v14[15], "attemptCount") + 1);
        ++v15;
        if (![(id)v14[7] isReadyForMoreMediaData])
        {
          if (!+[MIOLog debugEnabled])
          {
LABEL_53:
            int v33 = 0;
            int v32 = 8;
            goto LABEL_58;
          }
          int v20 = +[MIOLog defaultLog];
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138543362;
            *(void *)&uint8_t buf[4] = v17;
            _os_log_impl(&dword_21B5ED000, v20, OS_LOG_TYPE_DEBUG, "[WritingThread] Input for %{public}@ not ready.", buf, 0xCu);
          }
          goto LABEL_55;
        }
        if (![v18 count]) {
          goto LABEL_49;
        }
        int v20 = [v18 firstObject];
        if (+[MIOLog debugEnabled])
        {
          uint64_t v21 = +[MIOLog defaultLog];
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
          {
            if (v20)
            {
              [v20 timeRange];
            }
            else
            {
              long long v75 = 0u;
              memset(buf, 0, sizeof(buf));
            }
            CMTime time = *(CMTime *)buf;
            Float64 Seconds = CMTimeGetSeconds(&time);
            uint64_t v23 = [v18 count];
            uint64_t v24 = v14[12];
            *(_DWORD *)unint64_t v76 = 138544130;
            os_signpost_id_t v77 = v17;
            __int16 v78 = 2048;
            Float64 v79 = Seconds;
            __int16 v80 = 2048;
            uint64_t v81 = v23;
            __int16 v82 = 2048;
            uint64_t v83 = v24;
            _os_log_impl(&dword_21B5ED000, v21, OS_LOG_TYPE_DEBUG, "[WritingThread] [FIFO] Consume (%{public}@) PTS: %f (%lu/%lu)", v76, 0x2Au);
          }
        }
        if (*((unsigned char *)v13 + 98)) {
          goto LABEL_40;
        }
        if (v20)
        {
          [v20 timeRange];
        }
        else
        {
          long long v75 = 0u;
          memset(buf, 0, sizeof(buf));
        }
        long long v70 = *(_OWORD *)buf;
        uint64_t v71 = *(void *)&buf[16];
        char v25 = [v13 delegate];
        id v26 = v13[1];
        id v69 = 0;
        char v27 = [v13 startSessionWithFallbackSampleTime:&v70 streamId:v17 mediaType:2 writerDelegate:v25 delegateCallbackQueue:v26 error:&v69];
        id v28 = v69;

        if (v27)
        {

LABEL_40:
          if ([v13 canWriteData])
          {
            [v13 writeMetadata:v20 forStreamId:v17];
            objc_msgSend((id)v14[15], "setWriteCount:", objc_msgSend((id)v14[15], "writeCount") + 1);
            char v68 = 1;
            goto LABEL_46;
          }
          if (![v13 isOrWasCanceled])
          {
            int v29 = +[MIOLog defaultLog];
            if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
            {
              id v30 = [v13[46] name];
              *(_DWORD *)buf = 138543618;
              *(void *)&uint8_t buf[4] = v17;
              *(_WORD *)&unsigned char buf[12] = 2114;
              *(void *)&buf[14] = v30;
              _os_log_impl(&dword_21B5ED000, v29, OS_LOG_TYPE_ERROR, "⛔️⛔️⛔️ ERROR: [FIFO] CANNOT Write Item of metadata stream '%{public}@' for state %{public}@ ⛔️⛔️⛔️", buf, 0x16u);
            }
LABEL_46:
            [v18 removeObjectAtIndex:0];
            objc_msgSend((id)v14[15], "setFifoItemCount:", objc_msgSend(v18, "count"));
            BOOL v31 = [v18 count] == 0;

            if (v31)
            {
LABEL_49:
              int v32 = 8;
              int v33 = 1;
              goto LABEL_58;
            }
            goto LABEL_47;
          }
          [v18 removeObjectAtIndex:0];
          objc_msgSend((id)v14[15], "setFifoItemCount:", objc_msgSend(v18, "count"));
LABEL_55:
          int v32 = 8;
          goto LABEL_57;
        }
        uint64_t v34 = v13;
        objc_sync_enter(v34);
        uint64_t v35 = [v13[46] criticalErrorOccurred:v28 context:v34];
        [v34 activateNewState:v35 byEvent:@"startWritingThreadForMetadata"];

        objc_sync_exit(v34);
        int v32 = 1;
LABEL_57:

        int v33 = 0;
LABEL_58:
        if (v32 == 8)
        {
          int v32 = 0;
          if (v33)
          {
            if (+[MIOLog debugEnabled])
            {
              id v36 = +[MIOLog defaultLog];
              if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138543362;
                *(void *)&uint8_t buf[4] = v17;
                _os_log_impl(&dword_21B5ED000, v36, OS_LOG_TYPE_DEBUG, "[WritingThread] [FIFO] Precheck All Fifo items written '%{public}@'", buf, 0xCu);
              }
            }
            [v13 checkForFinishing];
LABEL_65:
            int v32 = 0;
          }
        }
        objc_sync_exit(v18);

        if (SHIBYTE(v73.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v73.__r_.__value_.__l.__data_);
        }
        if (!v32)
        {
          long long v37 = (void *)v14[1];
          if (v37)
          {
            do
            {
              id v38 = v37;
              long long v37 = (void *)*v37;
            }
            while (v37);
          }
          else
          {
            do
            {
              id v38 = (void *)v14[2];
              BOOL v39 = *v38 == (void)v14;
              int v14 = v38;
            }
            while (!v39);
          }
          int v14 = v38;
          if (v38 == v67)
          {
            int v32 = 0;
            if ((v68 & 1) == 0 && v15)
            {
              if (+[MIOLog debugEnabled])
              {
                id v40 = +[MIOLog defaultLog];
                if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = v56;
                  *(_DWORD *)&uint8_t buf[4] = v15;
                  _os_log_impl(&dword_21B5ED000, v40, OS_LOG_TYPE_DEBUG, "[WritingThread] nothing written (attempts: %d).", buf, 8u);
                }
              }
              int v32 = 0;
            }
            break;
          }
          continue;
        }
        break;
      }
LABEL_85:

      char v41 = v68 & 1;
LABEL_86:
      if (v32) {
        break;
      }
      CMTimeScale v42 = v65;
      BOOL v43 = v42;
      if (v64 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v42))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_21B5ED000, v43, OS_SIGNPOST_INTERVAL_END, v60, "write fifo metadata", (const char *)&unk_21B668A56, buf, 2u);
      }

      if ((v41 & 1) == 0)
      {
LABEL_93:
        int v44 = (void *)MEMORY[0x21D4924B0]();
        int v45 = objc_loadWeakRetained(location);
        uint64_t v46 = v45;
        if (v45)
        {
          uint64_t v47 = v45[5].isa;
          if ([v46 canWriteData]) {
            BOOL v48 = v46[29].isa != 0;
          }
          else {
            BOOL v48 = 0;
          }
          char v61 = v48;
          if (([v46 finalConsume] | !v48) == 1)
          {
            id v49 = +[MIOLog defaultLog];
            if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_21B5ED000, v49, OS_LOG_TYPE_INFO, "[Meta WritingThread] finalConsume", buf, 2u);
            }

            int v50 = v65;
            id v51 = v50;
            if (v59 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v50))
            {
              *(_WORD *)buf = 0;
              _os_signpost_emit_with_name_impl(&dword_21B5ED000, v51, OS_SIGNPOST_INTERVAL_END, spid, "write thread metadata", (const char *)&unk_21B668A56, buf, 2u);
            }

            int v32 = 3;
            uint64_t v52 = v47;
          }
          else
          {
            [v46 setWriteThreadCount:[v46 writeThreadCount] + 1];
            int v32 = v59 < 0xFFFFFFFFFFFFFFFELL;

            dispatch_time_t v53 = dispatch_time(0, 5000000);
            dispatch_semaphore_wait(v47, v53);
            uint64_t v54 = v65;
            uint64_t v52 = v54;
            if (v59 < 0xFFFFFFFFFFFFFFFELL)
            {
              if (os_signpost_enabled(v54))
              {
                *(_WORD *)buf = 0;
                _os_signpost_emit_with_name_impl(&dword_21B5ED000, v52, OS_SIGNPOST_INTERVAL_END, spid, "write thread metadata", (const char *)&unk_21B668A56, buf, 2u);
              }
              int v32 = 0;
            }
            uint64_t v46 = v47;
          }
        }
        else
        {
          char v61 = 0;
          int v32 = 3;
        }
        goto LABEL_112;
      }
    }
    if (v32 == 5) {
      goto LABEL_93;
    }
LABEL_112:
    if (v32) {
      break;
    }
    if ((v61 & 1) == 0)
    {
LABEL_116:
      BOOL v55 = +[MIOLog defaultLog];
      if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21B5ED000, v55, OS_LOG_TYPE_INFO, "[WritingThread Metadata] Exiting writing loop.", buf, 2u);
      }

      goto LABEL_119;
    }
  }
  if (v32 == 3) {
    goto LABEL_116;
  }
LABEL_119:
}

- (void)informDelegateAboutError:(id)a3
{
  id v4 = a3;
  os_signpost_id_t v5 = [(MOVStreamWriter *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    m_delegateCallbackQueue = self->m_delegateCallbackQueue;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __44__MOVStreamWriter_informDelegateAboutError___block_invoke;
    v8[3] = &unk_2643AF670;
    v8[4] = self;
    id v9 = v4;
    dispatch_async(m_delegateCallbackQueue, v8);
  }
}

void __44__MOVStreamWriter_informDelegateAboutError___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x21D4924B0]();
  uint64_t v3 = [*(id *)(a1 + 32) delegate];
  [v3 streamWriterEncounteredAnError:*(void *)(a1 + 40)];
}

- (void)informDelegateAboutIsReady:(BOOL)a3 forStream:(id)a4
{
  id v6 = a4;
  long long v7 = [(MOVStreamWriter *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    m_delegateCallbackQueue = self->m_delegateCallbackQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __56__MOVStreamWriter_informDelegateAboutIsReady_forStream___block_invoke;
    block[3] = &unk_2643AF7A8;
    void block[4] = self;
    id v11 = v6;
    BOOL v12 = a3;
    dispatch_async(m_delegateCallbackQueue, block);
  }
}

void __56__MOVStreamWriter_informDelegateAboutIsReady_forStream___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x21D4924B0]();
  uint64_t v3 = [*(id *)(a1 + 32) delegate];
  [v3 streamWriter:*(void *)(a1 + 32) inputForStream:*(void *)(a1 + 40) changedIsReadyStatusTo:*(unsigned __int8 *)(a1 + 48)];
}

- (void)informDelegateAboutFinishingTimeout
{
  uint64_t v3 = [(MOVStreamWriter *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    m_delegateCallbackQueue = self->m_delegateCallbackQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __54__MOVStreamWriter_informDelegateAboutFinishingTimeout__block_invoke;
    block[3] = &unk_2643AF6E8;
    void block[4] = self;
    dispatch_async(m_delegateCallbackQueue, block);
  }
}

void __54__MOVStreamWriter_informDelegateAboutFinishingTimeout__block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x21D4924B0]();
  uint64_t v3 = [*(id *)(a1 + 32) delegate];
  [v3 streamWriterReachedFinishingTimeout:*(void *)(a1 + 32)];
}

- (void)informDelegateAboutMediaWrittenForStream:(id)a3 mediaType:(int64_t)a4
{
  id v6 = a3;
  long long v7 = [(MOVStreamWriter *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    m_delegateCallbackQueue = self->m_delegateCallbackQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __70__MOVStreamWriter_informDelegateAboutMediaWrittenForStream_mediaType___block_invoke;
    block[3] = &unk_2643AF7D0;
    void block[4] = self;
    id v11 = v6;
    int64_t v12 = a4;
    dispatch_async(m_delegateCallbackQueue, block);
  }
}

void __70__MOVStreamWriter_informDelegateAboutMediaWrittenForStream_mediaType___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x21D4924B0]();
  uint64_t v3 = [*(id *)(a1 + 32) delegate];
  [v3 streamWriter:*(void *)(a1 + 32) mediaWrittenForStream:*(void *)(a1 + 40) mediaType:*(void *)(a1 + 48)];
}

- (BOOL)legacyKeysMode
{
  return self->legacyKeysMode;
}

- (void)setLegacyKeysMode:(BOOL)a3
{
  self->legacyKeysMode = a3;
}

- (NSArray)movMetadataItems
{
  return (NSArray *)objc_getProperty(self, a2, 480, 1);
}

- (void)setMovMetadataItems:(id)a3
{
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)movieFragmentInterval
{
  objc_copyStruct(retstr, &self->_movieFragmentInterval, 24, 1, 0);
  return result;
}

- (void)setMovieFragmentInterval:(id *)a3
{
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)sessionStartTime
{
  objc_copyStruct(retstr, &self->_sessionStartTime, 24, 1, 0);
  return result;
}

- (void)setSessionStartTime:(id *)a3
{
}

- (BOOL)inProcessRecording
{
  return self->_inProcessRecording;
}

- (void)setInProcessRecording:(BOOL)a3
{
  self->_inProcessRecording = a3;
}

- (int)baseMediaTimeScale
{
  return self->_baseMediaTimeScale;
}

- (void)setBaseMediaTimeScale:(int)a3
{
  self->_baseMediaTimeScale = a3;
}

- (int)bufferCacheMode
{
  return self->_bufferCacheMode;
}

- (void)setBufferCacheMode:(int)a3
{
  self->_bufferCacheMode = a3;
}

- (NSString)timeRangeMetadataKeyHint
{
  return self->_timeRangeMetadataKeyHint;
}

- (void)setTimeRangeMetadataKeyHint:(id)a3
{
}

- (BOOL)preserveSessionStartTime
{
  return self->_preserveSessionStartTime;
}

- (void)setPreserveSessionStartTime:(BOOL)a3
{
  self->_preserveSessionStartTime = a3;
}

- (MOVStreamCustomEncoderConfigDelegate)customEncoderConfigDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_customEncoderConfigDelegate);

  return (MOVStreamCustomEncoderConfigDelegate *)WeakRetained;
}

- (void)setCustomEncoderConfigDelegate:(id)a3
{
}

- (MOVStreamWriterDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MOVStreamWriterDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (MOVStreamWriterState)state
{
  return (MOVStreamWriterState *)objc_getProperty(self, a2, 368, 1);
}

- (void)setState:(id)a3
{
}

- (BOOL)finalConsume
{
  return self->_finalConsume;
}

- (void)setFinalConsume:(BOOL)a3
{
  self->_finalConsume = a3;
}

- (BOOL)finishingMode
{
  return self->_finishingMode;
}

- (void)setFinishingMode:(BOOL)a3
{
  self->_finishingMode = a3;
}

- (BOOL)canWriteData
{
  return self->_canWriteData;
}

- (void)setCanWriteData:(BOOL)a3
{
  self->_canWriteData = a3;
}

- (BOOL)isOrWasCanceled
{
  return self->_isOrWasCanceled;
}

- (void)setIsOrWasCanceled:(BOOL)a3
{
  self->_isOrWasCanceled = a3;
}

- (unint64_t)writeThreadCount
{
  return self->_writeThreadCount;
}

- (void)setWriteThreadCount:(unint64_t)a3
{
  self->_writeThreadCount = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_customEncoderConfigDelegate);
  objc_storeStrong((id *)&self->_timeRangeMetadataKeyHint, 0);
  objc_storeStrong((id *)&self->movMetadataItems, 0);
  objc_storeStrong((id *)&self->_movieMetadataUtility, 0);
  objc_storeStrong((id *)&self->_perfLogAVF, 0);
  objc_storeStrong((id *)&self->_writeThreadAudio, 0);
  objc_storeStrong((id *)&self->_writeThreadMetadata, 0);
  objc_storeStrong((id *)&self->_writingThreads, 0);
  objc_storeStrong((id *)&self->_writeThread, 0);
  objc_storeStrong((id *)&self->_criticalError, 0);
  objc_storeStrong((id *)&self->_state, 0);
  std::__tree<std::__value_type<std::string,CMTime>,std::__map_value_compare<std::string,std::__value_type<std::string,CMTime>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,CMTime>>>::destroy((uint64_t)&self->m_lastPtsForAttachmentsStream, (char *)self->m_lastPtsForAttachmentsStream.__tree_.__pair1_.__value_.__left_);
  std::__tree<std::__value_type<std::string,CMTime>,std::__map_value_compare<std::string,std::__value_type<std::string,CMTime>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,CMTime>>>::destroy((uint64_t)&self->m_lastPtsForMetadataStream, (char *)self->m_lastPtsForMetadataStream.__tree_.__pair1_.__value_.__left_);
  std::__tree<std::__value_type<std::string,CMTime>,std::__map_value_compare<std::string,std::__value_type<std::string,CMTime>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,CMTime>>>::destroy((uint64_t)&self->m_lastPtsForStream, (char *)self->m_lastPtsForStream.__tree_.__pair1_.__value_.__left_);
  p_m_orderedMetadataStreamNames = &self->m_orderedMetadataStreamNames;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_m_orderedMetadataStreamNames);
  p_m_orderedMetadataStreamNames = &self->m_orderedStreamNames;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_m_orderedMetadataStreamNames);
  objc_storeStrong((id *)&self->m_assetWriter, 0);
  objc_storeStrong((id *)&self->m_writeURL, 0);
  objc_storeStrong(&self->_timeoutBlock, 0);
  objc_storeStrong((id *)&self->_timeoutQueue, 0);
  objc_storeStrong((id *)&self->_writingMetadataSema, 0);
  objc_storeStrong((id *)&self->_writingSema, 0);
  objc_storeStrong((id *)&self->m_processingQueue, 0);
  objc_storeStrong((id *)&self->m_writingQueue, 0);
  objc_storeStrong((id *)&self->m_delegateCallbackQueue, 0);
}

- (id).cxx_construct
{
  *((void *)self + 22) = 0;
  *((void *)self + 21) = (char *)self + 176;
  *((void *)self + 23) = 0;
  *((void *)self + 24) = 0;
  *((void *)self + 25) = 0;
  *((void *)self + 26) = 0;
  *((void *)self + 29) = 0;
  *((void *)self + 30) = 0;
  *((void *)self + 28) = 0;
  *((void *)self + 27) = (char *)self + 224;
  *((void *)self + 31) = 0;
  *((void *)self + 32) = 0;
  *((void *)self + 33) = (char *)self + 272;
  *((void *)self + 34) = 0;
  *((void *)self + 37) = 0;
  *((void *)self + 38) = 0;
  *((void *)self + 35) = 0;
  *((void *)self + 36) = (char *)self + 296;
  *((void *)self + 39) = (char *)self + 320;
  *((void *)self + 40) = 0;
  *((void *)self + 43) = 0;
  *((void *)self + 44) = 0;
  *((void *)self + 41) = 0;
  *((void *)self + 42) = (char *)self + 344;
  return self;
}

+ (id)getMOVStreamIOMetadataItem
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v2 = objc_opt_new();
  [v2 setObject:@"3.29.5" forKey:@"version"];
  uint64_t v3 = +[MOVStreamOptions sharedOptions];
  char v4 = [v3 currentOptions];
  [v2 setObject:v4 forKey:@"default_options"];

  os_signpost_id_t v5 = +[MOVStreamIOUtility getJsonFriendlyCopy:v2];
  id v12 = 0;
  id v6 = [MEMORY[0x263F08AC0] dataWithPropertyList:v5 format:100 options:0 error:&v12];
  id v7 = v12;
  if (v7)
  {
    char v8 = +[MIOLog defaultLog];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v9 = [v7 localizedDescription];
      *(_DWORD *)buf = 138543362;
      int v14 = v9;
      _os_log_impl(&dword_21B5ED000, v8, OS_LOG_TYPE_ERROR, "Unable to serialize MOVStream State metatdata as JSON: %{public}@", buf, 0xCu);
    }
    uint64_t v10 = 0;
  }
  else
  {
    uint64_t v10 = [MEMORY[0x263EFA790] metadataItem];
    [v10 setIdentifier:@"mdta/com.apple.framework.state.MOVStreamIO"];
    [v10 setDataType:*MEMORY[0x263F00F50]];
    [v10 setExtraAttributes:0];
    [v10 setValue:v6];
  }

  return v10;
}

+ (id)getTimeRangeMetadataKeyHintMetadataItem:(id)a3 error:(id *)a4
{
  char v4 = +[MOVStreamIOUtility plistSerializedObject:a3 error:a4];
  if (v4)
  {
    os_signpost_id_t v5 = [MEMORY[0x263EFA790] metadataItem];
    [v5 setIdentifier:@"mdta/com.apple.framework.mio.timeRangeMetadataKeyHint"];
    [v5 setDataType:*MEMORY[0x263F00F50]];
    [v5 setValue:v4];
  }
  else
  {
    os_signpost_id_t v5 = 0;
  }

  return v5;
}

- (BOOL)fifoDropsEnabled:(StreamRecordingData *)a3
{
  return a3->var6 == 0;
}

- (id)getAudioMetadataForBuffer:(opaqueCMSampleBuffer *)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  char v4 = [MEMORY[0x263EFA790] metadataItem];
  [v4 setIdentifier:@"mdta/com.apple.stream_sample_attachments"];
  [v4 setDataType:*MEMORY[0x263F00F50]];
  [v4 setExtraAttributes:0];
  CFAllocatorRef v5 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFDictionaryRef v6 = CMCopyDictionaryOfAttachments((CFAllocatorRef)*MEMORY[0x263EFFB08], a3, 1u);
  if (v6)
  {
    uint64_t v7 = +[MOVStreamIOUtility getPlistFriendlyCopyOf:v6];
  }
  else
  {
    uint64_t v7 = objc_opt_new();
  }
  char v8 = (void *)v7;
  memset(&v24, 0, sizeof(v24));
  CMSampleBufferGetPresentationTimeStamp(&v24, a3);
  id v9 = [v8 objectForKey:@"OriginalTimestampWhenWrittenToFile"];
  BOOL v10 = v9 == 0;

  if (v10)
  {
    CMTime time = v24;
    CFDictionaryRef v11 = CMTimeCopyAsDictionary(&time, v5);
    [v8 setObject:v11 forKey:@"OriginalTimestampWhenWrittenToFile"];
  }
  id v22 = 0;
  id v12 = [MEMORY[0x263F08AC0] dataWithPropertyList:v8 format:200 options:0 error:&v22];
  id v13 = v22;
  if (v13)
  {
    int v14 = +[MIOLog defaultLog];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = [v13 localizedDescription];
      *(_DWORD *)buf = 138543362;
      char v27 = v15;
      _os_log_impl(&dword_21B5ED000, v14, OS_LOG_TYPE_ERROR, "Unable to serialize audio metatdata as PLIST: %{public}@", buf, 0xCu);
    }
    BOOL v16 = 0;
  }
  else
  {
    [v4 setValue:v12];
    id v17 = objc_alloc(MEMORY[0x263EFA8C0]);
    char v25 = v4;
    int v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v25 count:1];
    CMTime start = v24;
    CMTime v19 = *(CMTime *)*(void *)&MEMORY[0x263F01098];
    CMTimeRangeMake(&v21, &start, &v19);
    BOOL v16 = (void *)[v17 initWithItems:v14 timeRange:&v21];
  }

  return v16;
}

- (BOOL)isReadyForMoreDataForStreamId:(id)a3 fromMap:(void *)a4
{
  id v5 = a3;
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v5 UTF8String]);
  CFDictionaryRef v6 = (const void **)*((void *)a4 + 1);
  if (!v6) {
    goto LABEL_9;
  }
  while (std::less<std::string>::operator()[abi:ne180100]((uint64_t)a4 + 16, (const void **)__p, v6 + 4))
  {
LABEL_5:
    CFDictionaryRef v6 = (const void **)*v6;
    if (!v6) {
      goto LABEL_9;
    }
  }
  if (std::less<std::string>::operator()[abi:ne180100]((uint64_t)a4 + 16, v6 + 4, (const void **)__p))
  {
    ++v6;
    goto LABEL_5;
  }
  if ([*(id *)(v7 + 16) isReadyForMoreMediaData])
  {
    char v8 = [*(id *)(v7 + 24) isReadyForMoreMediaData];
    goto LABEL_10;
  }
LABEL_9:
  char v8 = 0;
LABEL_10:
  if (v11 < 0) {
    operator delete(__p[0]);
  }

  return v8;
}

- (id)getMetadataGroupForBuffer:(__CVBuffer *)a3 stream:(id)a4 presentationTime:(id *)a5 serializationMode:(int)a6
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  BOOL v10 = objc_msgSend(MEMORY[0x263EFA790], "metadataItem", a3, a4);
  if ([(MOVStreamWriter *)self legacyKeysMode])
  {
    char v11 = +[MIOVersion versionZero];
    id v12 = [v11 versionedKey:@"mdta/com.apple.stream_sample_attachments" modifier:0];
    [v10 setIdentifier:v12];
  }
  else
  {
    [v10 setIdentifier:@"mdta/com.apple.stream_sample_attachments"];
  }
  [v10 setDataType:*MEMORY[0x263F00F50]];
  [v10 setExtraAttributes:0];
  BOOL v13 = +[MIOPixelBufferUtility isPixelBufferRawBayer:a3];
  BOOL v14 = +[MIOPixelBufferUtility isPixelBufferCompandedRawBayer:a3];
  CFDictionaryRef v28 = CVBufferCopyAttachments(a3, kCVAttachmentMode_ShouldPropagate);
  if (a6) {
    +[MOVStreamIOUtility getPlistFriendlyCopyOf:v28];
  }
  else {
  uint64_t v15 = +[MOVStreamIOUtility getJsonFriendlyCopy:v28];
  }
  BOOL v16 = [v15 objectForKey:@"OriginalTimestampWhenWrittenToFile"];

  if (!v16)
  {
    CMTime time = (CMTime)*a5;
    CFDictionaryRef v17 = CMTimeCopyAsDictionary(&time, (CFAllocatorRef)*MEMORY[0x263EFFB08]);
    [v15 setObject:v17 forKey:@"OriginalTimestampWhenWrittenToFile"];
  }
  if (a6)
  {
    if (v13 || v14)
    {
      id v18 = [NSNumber numberWithUnsignedInt:CVPixelBufferGetPixelFormatType(a3)];
      [v15 setValue:v18 forKey:@"RawBayerFormat"];
    }
    id v33 = 0;
    CMTime v19 = [MEMORY[0x263F08AC0] dataWithPropertyList:v15 format:200 options:0 error:&v33];
    id v20 = v33;
    if (([MEMORY[0x263F08AC0] propertyList:v19 isValidForFormat:200] & 1) == 0)
    {
      CMTimeRange v21 = +[MIOLog defaultLog];
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        id v22 = "Error: The metadata dictionary is not valid for XML v1.0 plist Format";
        goto LABEL_22;
      }
LABEL_23:

      char v25 = 0;
      goto LABEL_25;
    }
    if (v20 || !v19)
    {
      CMTimeRange v21 = +[MIOLog defaultLog];
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        id v22 = "Error: Cannot serialize metadata to plist";
LABEL_22:
        _os_log_impl(&dword_21B5ED000, v21, OS_LOG_TYPE_ERROR, v22, buf, 2u);
        goto LABEL_23;
      }
      goto LABEL_23;
    }
  }
  else
  {
    id v32 = 0;
    CMTime v19 = [MEMORY[0x263F08900] dataWithJSONObject:v15 options:0 error:&v32];
    id v23 = v32;
    if (v23)
    {
      id v20 = v23;
      CMTimeRange v21 = +[MIOLog defaultLog];
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        CMTime v24 = [v20 localizedDescription];
        *(_DWORD *)buf = 138543362;
        long long v37 = v24;
        _os_log_impl(&dword_21B5ED000, v21, OS_LOG_TYPE_ERROR, "Unable to serialize depth metatdata as JSON: %{public}@", buf, 0xCu);
      }
      goto LABEL_23;
    }
  }
  [v10 setValue:v19];
  id v26 = objc_alloc(MEMORY[0x263EFA8C0]);
  uint64_t v35 = v10;
  id v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v35 count:1];
  CMTime start = (CMTime)*a5;
  CMTime duration = *(CMTime *)*(void *)&MEMORY[0x263F01098];
  CMTimeRangeMake(&v31, &start, &duration);
  char v25 = (void *)[v26 initWithItems:v20 timeRange:&v31];
LABEL_25:

  return v25;
}

- (BOOL)marksOutputTracksAsEnabledForStream:()basic_string<char fromMap:()std:(std::allocator<char>> *)a3 :char_traits<char>
{
  char v4 = v3;
  __rep var0 = a3;
  uint64_t v22 = *MEMORY[0x263EF8340];
                         + 40));
  char v8 = [v7 objectForKey:@"MarksOutputTrackAsEnabled"];
  id v9 = v8;
  if (v8)
  {
    char v10 = [v8 BOOLValue];
  }
  else if (v4[2] == (uint64_t *)1)
  {
    char v10 = 1;
  }
  else
  {
    qmemcpy(v21, "610L010L3.315.114ggr4ggb4rbg4brg", sizeof(v21));
    std::set<unsigned int>::set[abi:ne180100]((uint64_t)v19, (unsigned int *)v21, 8);
    if (*((char *)&var0->var0.var0.var0.var1 + 23) < 0) {
      __rep var0 = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)var0->var0.var0.var0.var1.var0;
    }
    char v11 = [NSString stringWithUTF8String:var0];
    unsigned int v12 = [(MOVStreamWriter *)self getPixelFormatForStream:v11 fromMap:v4];
    BOOL v13 = v20[0];
    if (!v20[0]) {
      goto LABEL_17;
    }
    BOOL v14 = v20;
    do
    {
      uint64_t v15 = v13;
      BOOL v16 = v14;
      unsigned int v17 = *((_DWORD *)v13 + 7);
      if (v17 >= v12) {
        BOOL v14 = (void **)v13;
      }
      else {
        ++v13;
      }
      BOOL v13 = (void *)*v13;
    }
    while (v13);
    if (v14 == v20) {
      goto LABEL_17;
    }
    if (v17 < v12) {
      uint64_t v15 = v16;
    }
    if (v12 < *((_DWORD *)v15 + 7)) {
LABEL_17:
    }
      BOOL v14 = v20;
    char v10 = v14 == v20;

    std::__tree<unsigned int>::destroy((uint64_t)v19, v20[0]);
  }

  return v10;
}

- (int)attachmentSerializationModeForStream:()basic_string<char withDefaultMode:()std:(std::allocator<char>> *)a3 :char_traits<char> fromMap:
{
  v6 = int v5 = v3;
  id v7 = v6;
  if (v6) {
    int v5 = [v6 intValue];
  }

  return v5;
}

- (id)customTrackMetadataForStream:(id)a3 fromMap:(void *)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v17 = a3;
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v17 UTF8String]);
  if ([*(id *)(v5 + 72) count] || objc_msgSend(*(id *)(v5 + 80), "count"))
  {
    CFDictionaryRef v6 = objc_opt_new();
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id obj = *(id *)(v5 + 72);
    uint64_t v7 = [obj countByEnumeratingWithState:&v19 objects:v25 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v20;
      uint64_t v9 = *MEMORY[0x263F00F88];
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v20 != v8) {
            objc_enumerationMutation(obj);
          }
          uint64_t v11 = *(void *)(*((void *)&v19 + 1) + 8 * i);
          unsigned int v12 = [MEMORY[0x263EFA790] metadataItem];
          BOOL v13 = [NSString stringWithFormat:@"%@%@", @"mdta/custom.", v11];
          [v12 setIdentifier:v13];
          [v12 setDataType:v9];
          [v12 setExtraAttributes:0];
          BOOL v14 = [*(id *)(v5 + 72) objectForKey:v11];
          [v12 setValue:v14];

          [v6 addObject:v12];
        }
        uint64_t v7 = [obj countByEnumeratingWithState:&v19 objects:v25 count:16];
      }
      while (v7);
    }

    if ([*(id *)(v5 + 80) count]) {
      [v6 addObjectsFromArray:*(void *)(v5 + 80)];
    }
    uint64_t v15 = (void *)[v6 copy];
  }
  else
  {
    uint64_t v15 = 0;
  }
  if (v24 < 0) {
    operator delete(__p[0]);
  }

  return v15;
}

- (id)customMetadataTrackMetadataForStream:(id)a3 fromMap:(void *)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v17 = a3;
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v17 UTF8String]);
  if ([*(id *)(v5 + 48) count])
  {
    CFDictionaryRef v6 = objc_opt_new();
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id obj = *(id *)(v5 + 48);
    uint64_t v7 = [obj countByEnumeratingWithState:&v19 objects:v25 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v20;
      uint64_t v9 = *MEMORY[0x263F00F88];
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v20 != v8) {
            objc_enumerationMutation(obj);
          }
          uint64_t v11 = *(void *)(*((void *)&v19 + 1) + 8 * i);
          unsigned int v12 = [MEMORY[0x263EFA790] metadataItem];
          BOOL v13 = [NSString stringWithFormat:@"%@%@", @"mdta/custom.", v11];
          [v12 setIdentifier:v13];
          [v12 setDataType:v9];
          [v12 setExtraAttributes:0];
          BOOL v14 = [*(id *)(v5 + 48) objectForKey:v11];
          [v12 setValue:v14];

          [v6 addObject:v12];
        }
        uint64_t v7 = [obj countByEnumeratingWithState:&v19 objects:v25 count:16];
      }
      while (v7);
    }

    uint64_t v15 = (void *)[v6 copy];
  }
  else
  {
    uint64_t v15 = 0;
  }
  if (v24 < 0) {
    operator delete(__p[0]);
  }

  return v15;
}

- (id)getTrackMetadataForAttachmentsSerializationMode:(id)a3 fromMap:(void *)a4
{
  id v6 = a3;
  uint64_t v7 = [MEMORY[0x263EFA790] metadataItem];
  [v7 setIdentifier:@"mdta/com.apple.stream_sample_attachments_serialization_mode"];
  [v7 setDataType:*MEMORY[0x263F00F88]];
  [v7 setExtraAttributes:0];
  id v8 = v6;
  std::string::basic_string[abi:ne180100]<0>(&v13, (char *)[v8 UTF8String]);
  if (SHIBYTE(v13.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&__p, v13.__r_.__value_.__l.__data_, v13.__r_.__value_.__l.__size_);
  }
  else {
    std::string __p = v13;
  }
  uint64_t v9 = [(MOVStreamWriter *)self attachmentSerializationModeForStream:&__p withDefaultMode:1 fromMap:a4];
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  char v10 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", v9, *(_OWORD *)&__p.__r_.__value_.__l.__data_, __p.__r_.__value_.__r.__words[2]);
  [v7 setValue:v10];

  if (SHIBYTE(v13.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v13.__r_.__value_.__l.__data_);
  }

  return v7;
}

- (id)getLegacyTrackMetadataForAttachmentsSerializationMode:(id)a3 fromMap:(void *)a4
{
  id v6 = a3;
  uint64_t v7 = [MEMORY[0x263EFA790] metadataItem];
  id v8 = +[MIOVersion versionZero];
  uint64_t v9 = [v8 versionedKey:@"mdta/com.apple.stream_sample_attachments_serialization_mode" modifier:0];
  [v7 setIdentifier:v9];

  [v7 setDataType:*MEMORY[0x263F00F88]];
  [v7 setExtraAttributes:0];
  id v10 = v6;
  std::string::basic_string[abi:ne180100]<0>(&v15, (char *)[v10 UTF8String]);
  if (SHIBYTE(v15.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&__p, v15.__r_.__value_.__l.__data_, v15.__r_.__value_.__l.__size_);
  }
  else {
    std::string __p = v15;
  }
  uint64_t v11 = [(MOVStreamWriter *)self attachmentSerializationModeForStream:&__p withDefaultMode:1 fromMap:a4];
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  unsigned int v12 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", v11, *(_OWORD *)&__p.__r_.__value_.__l.__data_, __p.__r_.__value_.__r.__words[2]);
  [v7 setValue:v12];

  if (SHIBYTE(v15.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v15.__r_.__value_.__l.__data_);
  }

  return v7;
}

- (id)getTrackMetadataForRawBayerRearrangeType:(id)a3 fromMap:(void *)a4
{
  id v5 = a3;
  uint64_t v6 = std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v5 UTF8String]);
  if (v6) {
    uint64_t v7 = (void *)v6;
  }
  else {
    uint64_t v7 = &unk_26CB7D350;
  }
  id v8 = [MEMORY[0x263EFA790] metadataItem];
  [v8 setIdentifier:@"mdta/com.apple.stream_raw_bayer_rearrange_type"];
  [v8 setDataType:*MEMORY[0x263F00F78]];
  [v8 setExtraAttributes:0];
  [v8 setValue:v7];

  if (v11 < 0) {
    operator delete(__p[0]);
  }

  return v8;
}

- (id)getTrackMetadataForTimeRangeMetadata:(id)a3 fromMap:(void *)a4
{
  id v5 = a3;
  uint64_t v6 = std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v5 UTF8String]);
  if (v9 < 0) {
    operator delete(__p[0]);
  }

  return v6;
}

- (id)getTrackMetadataForStream:(id)a3
{
  id v3 = a3;
  char v4 = [MEMORY[0x263EFA790] metadataItem];
  [v4 setIdentifier:@"mdta/com.apple.track_kind"];
  [v4 setDataType:*MEMORY[0x263F00F88]];
  [v4 setExtraAttributes:0];
  [v4 setValue:v3];

  return v4;
}

- (id)getLegacyTrackMetadataForStream:(id)a3
{
  id v3 = a3;
  {
    -[MOVStreamWriter(TrackMetadata) getLegacyTrackMetadataForStream:]::legacyVersion = +[MIOVersion versionZero];
  }
  char v4 = [MEMORY[0x263EFA790] metadataItem];
  id v5 = [(id)-[MOVStreamWriter(TrackMetadata) getLegacyTrackMetadataForStream:]::legacyVersion versionedKey:@"mdta/com.apple.track_kind" modifier:0];
  [v4 setIdentifier:v5];

  [v4 setDataType:*MEMORY[0x263F00F88]];
  [v4 setExtraAttributes:0];
  [v4 setValue:v3];

  return v4;
}

- (id)getTrackInputPixelFormatMetadataForStream:(id)a3 fromMap:(void *)a4
{
  id v5 = a3;
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v5 UTF8String]);
  uint64_t v7 = [*(id *)(v6 + 88) inputPixelFormatFromStreamData:v6];
  id v8 = [MEMORY[0x263EFA790] metadataItem];
  [v8 setIdentifier:@"mdta/com.apple.stream_sample_format"];
  [v8 setDataType:*MEMORY[0x263F00F88]];
  [v8 setExtraAttributes:0];
  char v9 = [NSNumber numberWithUnsignedInt:v7];
  [v8 setValue:v9];

  if (v12 < 0) {
    operator delete(__p[0]);
  }

  return v8;
}

- (id)getLegacyTrackInputPixelFormatMetadataForStream:(id)a3 fromMap:(void *)a4
{
  id v5 = a3;
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v5 UTF8String]);
  uint64_t v7 = [*(id *)(v6 + 88) inputPixelFormatFromStreamData:v6];
  id v8 = [MEMORY[0x263EFA790] metadataItem];
  char v9 = +[MIOVersion versionZero];
  id v10 = [v9 versionedKey:@"mdta/com.apple.stream_sample_format" modifier:0];
  [v8 setIdentifier:v10];

  [v8 setDataType:*MEMORY[0x263F00F88]];
  [v8 setExtraAttributes:0];
  char v11 = [NSNumber numberWithUnsignedInt:v7];
  [v8 setValue:v11];

  if (v14 < 0) {
    operator delete(__p[0]);
  }

  return v8;
}

- (id)getLegacyTrackEncodedPixelFormatMetadataForStream:(id)a3 fromMap:(void *)a4
{
  id v5 = a3;
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v5 UTF8String]);
  uint64_t v7 = [*(id *)(v6 + 88) encodedPixelFormatFromStreamData:v6];
  id v8 = [MEMORY[0x263EFA790] metadataItem];
  char v9 = +[MIOVersion versionZero];
  id v10 = [v9 versionedKey:@"mdta/com.apple.stream_encoded_sample_format" modifier:0];
  [v8 setIdentifier:v10];

  [v8 setDataType:*MEMORY[0x263F00F88]];
  [v8 setExtraAttributes:0];
  char v11 = [NSNumber numberWithUnsignedInt:v7];
  [v8 setValue:v11];

  if (v14 < 0) {
    operator delete(__p[0]);
  }

  return v8;
}

- (id)getTrackEncodedPixelFormatMetadataForStream:(id)a3 fromMap:(void *)a4
{
  id v5 = a3;
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v5 UTF8String]);
  uint64_t v7 = [*(id *)(v6 + 88) encodedPixelFormatFromStreamData:v6];
  id v8 = [MEMORY[0x263EFA790] metadataItem];
  [v8 setIdentifier:@"mdta/com.apple.stream_encoded_sample_format"];
  [v8 setDataType:*MEMORY[0x263F00F88]];
  [v8 setExtraAttributes:0];
  char v9 = [NSNumber numberWithUnsignedInt:v7];
  [v8 setValue:v9];

  if (v12 < 0) {
    operator delete(__p[0]);
  }

  return v8;
}

- (id)createRelatedToStreamMetadata:(id)a3
{
  id v3 = a3;
  char v4 = [MEMORY[0x263EFA790] metadataItem];
  [v4 setIdentifier:@"mdta/com.apple.stream_related_to_stream"];
  [v4 setDataType:*MEMORY[0x263F00F88]];
  [v4 setExtraAttributes:0];
  [v4 setValue:v3];

  return v4;
}

- (id)createRelationSpecifierMetadata:(id)a3
{
  id v3 = a3;
  char v4 = [MEMORY[0x263EFA790] metadataItem];
  [v4 setIdentifier:@"mdta/com.apple.stream_relation_specifier"];
  [v4 setDataType:*MEMORY[0x263F00F88]];
  [v4 setExtraAttributes:0];
  [v4 setValue:v3];

  return v4;
}

- (id)getTrackMetadataForTrackTypeInfo:(id)a3 fromMap:(void *)a4
{
  id v5 = a3;
  uint64_t v6 = [MEMORY[0x263EFA790] metadataItem];
  [v6 setIdentifier:@"mdta/com.apple.stream_type_info"];
  [v6 setDataType:*MEMORY[0x263F00F88]];
  [v6 setExtraAttributes:0];
  id v7 = v5;
  id v8 = std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v7 UTF8String]);
  if (v8)
  {
    [v6 setValue:v8];
  }
  else
  {
    char v9 = [NSNumber numberWithUnsignedLong:0];
    [v6 setValue:v9];
  }
  if (v12 < 0) {
    operator delete(__p[0]);
  }

  return v6;
}

- (id)getTrackMetadataForExactBytesPerRow:(id)a3 fromMap:(void *)a4 error:(id *)a5
{
  id v7 = a3;
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v7 UTF8String]);
  id v9 = *(id *)(v8 + 40);
  id v10 = [v9 objectForKey:@"PixelBufferExactBytesPerRow"];
  if (!v10)
  {
    id v13 = 0;
    goto LABEL_20;
  }
  char v11 = [MEMORY[0x263EFA790] metadataItem];
  [v11 setIdentifier:@"mdta/com.apple.stream_sample_exact_bytes_per_row"];
  [v11 setExtraAttributes:0];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v12 = +[MIOPixelBufferUtility numberOfPlanesForPixelFormatType:CMFormatDescriptionGetMediaSubType(*(CMFormatDescriptionRef *)v8)];
    if (v12 < 1)
    {
      [v11 setDataType:*MEMORY[0x263F00F70]];
      [v11 setValue:v10];
      goto LABEL_16;
    }
    id v13 = [MEMORY[0x263EFF980] arrayWithCapacity:v12];
    do
    {
      [v13 addObject:v10];
      --v12;
    }
    while (v12);
    char v14 = +[MOVStreamIOUtility plistSerializedObject:v13 error:a5];
    if (v14)
    {
      [v11 setDataType:*MEMORY[0x263F00F50]];
      [v11 setValue:v14];
      [v11 setIdentifier:@"mdta/com.apple.stream_sample_exact_bytes_per_row_multiplanar"];

LABEL_12:
LABEL_16:
      id v13 = v11;
      goto LABEL_19;
    }

LABEL_18:
    id v13 = 0;
    goto LABEL_19;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v13 = +[MOVStreamIOUtility plistSerializedObject:v10 error:a5];
    if (v13)
    {
      [v11 setDataType:*MEMORY[0x263F00F50]];
      [v11 setValue:v13];
      [v11 setIdentifier:@"mdta/com.apple.stream_sample_exact_bytes_per_row_multiplanar"];
      goto LABEL_12;
    }
  }
  else
  {
    if (!a5) {
      goto LABEL_18;
    }
    [MEMORY[0x263F087E8] internalErrorWithMessage:@"Invalid value type for PixelBufferExactBytesPerRow." code:10];
    id v13 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_19:

LABEL_20:
  if (v17 < 0) {
    operator delete(__p[0]);
  }

  return v13;
}

- (opaqueCMFormatDescription)createMetadataFormatDescription:(id)a3
{
  v27[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  CMMetadataFormatDescriptionRef formatDescriptionOut = 0;
  if ([(MOVStreamWriter *)self legacyKeysMode])
  {
    id v5 = +[MIOVersion versionZero];
    uint64_t v6 = [v5 versionedKey:v4 modifier:0];

    uint64_t v8 = *MEMORY[0x263F00FA0];
    v25[0] = *MEMORY[0x263F00FB0];
    uint64_t v7 = v25[0];
    v25[1] = v8;
    uint64_t v9 = *MEMORY[0x263F00F50];
    v26[0] = v6;
    v26[1] = v9;
    id v10 = [NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:2];
    v27[0] = v10;
    v23[0] = v7;
    v23[1] = v8;
    v24[0] = v4;
    v24[1] = v9;
    char v11 = [NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:2];
    v27[1] = v11;
    CFArrayRef v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v27 count:2];
  }
  else
  {
    uint64_t v13 = *MEMORY[0x263F00FA0];
    v20[0] = *MEMORY[0x263F00FB0];
    v20[1] = v13;
    uint64_t v14 = *MEMORY[0x263F00F50];
    v21[0] = v4;
    v21[1] = v14;
    uint64_t v6 = [NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:2];
    long long v22 = v6;
    CFArrayRef v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v22 count:1];
  }

  if (CMMetadataFormatDescriptionCreateWithMetadataSpecifications((CFAllocatorRef)*MEMORY[0x263EFFB08], 0x6D656278u, v12, &formatDescriptionOut))
  {
    std::string v15 = +[MIOLog defaultLog];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v18 = 0;
      _os_log_impl(&dword_21B5ED000, v15, OS_LOG_TYPE_ERROR, "Can't create metadata format description...", v18, 2u);
    }

    BOOL v16 = 0;
    CMMetadataFormatDescriptionRef formatDescriptionOut = 0;
  }
  else
  {
    BOOL v16 = formatDescriptionOut;
  }

  return v16;
}

- (BOOL)isCustomTrackMetadataCompatibleObject:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    char isKindOfClass = 1;
  }
  else
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }

  return isKindOfClass & 1;
}

- (unsigned)getPixelFormatForStream:(id)a3 fromMap:(void *)a4
{
  id v5 = a3;
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v5 UTF8String]);
  unsigned int v7 = [(id)objc_opt_class() getPixelFormatFromStreamData:v6];
  if (v10 < 0) {
    operator delete(__p[0]);
  }

  return v7;
}

+ (unsigned)getPixelFormatFromStreamData:(StreamRecordingData *)a3
{
  id v4 = a3->var5;
  id v5 = [v4 objectForKeyedSubscript:@"PixelFormat"];

  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"PixelFormat"];
    FourCharCode MediaSubType = [v6 intValue];
  }
  else
  {
    FourCharCode MediaSubType = CMFormatDescriptionGetMediaSubType(a3->var0);
  }

  return MediaSubType;
}

@end