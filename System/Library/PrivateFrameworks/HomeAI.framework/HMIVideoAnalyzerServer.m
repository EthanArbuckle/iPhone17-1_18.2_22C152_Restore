@interface HMIVideoAnalyzerServer
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)currentDTS;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)currentPTS;
- (BOOL)encode;
- (BOOL)hasFailed;
- (BOOL)isCancelled;
- (BOOL)monitored;
- (HMFTimer)watchdogTimer;
- (HMIVideoAnalyzerServer)initWithConfiguration:(id)a3 identifier:(id)a4;
- (HMIVideoAssetWriter)assetWriter;
- (HMIVideoAssetWriter)timelapseAssetWriter;
- (HMIVideoCommandBuffer)commandBuffer;
- (HMIVideoDecoder)decoder;
- (HMIVideoEncoder)encoder;
- (HMIVideoEncoder)timelapseEncoder;
- (HMIVideoEventBuffer)dynamicConfigurationBuffer;
- (HMIVideoEventBuffer)frameAnalyzerFrameResultBuffer;
- (HMIVideoEventBuffer)thumbnailBuffer;
- (HMIVideoFrameAnalyzer)frameAnalyzer;
- (HMIVideoFrameSampler)frameThumbnailSampler;
- (HMIVideoFrameSampler)frameTimelapseSampler;
- (HMIVideoFrameSelector)frameSelector;
- (HMIVideoFrameTracker)frameTracker;
- (HMIVideoTemporalEventFilter)temporalEventFilter;
- (HMIVideoTimeline)timeline;
- (NSData)initializationSegment;
- (NSData)timelapseInitializationSegment;
- (NSDate)lastFragmentReceivedDate;
- (NSDate)startDate;
- (OS_dispatch_queue)encoderQueue;
- (OS_dispatch_queue)inputQueue;
- (OS_dispatch_queue)workQueue;
- (double)analysisFPS;
- (double)delay;
- (double)timeSinceAnalyzerStarted;
- (double)timeSinceLastFragmentWasReceived;
- (id)_filterFrameResult:(id)a3 dynamicConfiguration:(id)a4 motionDetections:(id)a5;
- (id)dynamicConfigurationForTime:(id *)a3;
- (id)state;
- (opaqueCMFormatDescription)inputAudioFormat;
- (opaqueCMFormatDescription)inputVideoFormat;
- (opaqueCMFormatDescription)timelapseOutputVideoFormat;
- (opaqueCMSampleBuffer)frameSelector:(id)a3 prepareFrame:(opaqueCMSampleBuffer *)a4;
- (unint64_t)status;
- (void)_configureAssetWriter;
- (void)_configureEncoder;
- (void)_configureTimelapseAssetWriter;
- (void)_configureTimelapseEncoder;
- (void)_ensureDecoderForFragment:(id)a3;
- (void)_ensureEncoder;
- (void)_ensureTimelapseEncoder;
- (void)_handleDecodedSampleBuffer:(opaqueCMSampleBuffer *)a3;
- (void)_notifyDelegateDidAnalyzeFragmentWithResult:(id)a3;
- (void)_notifyDelegateDidAnalyzeFrameWithResult:(id)a3;
- (void)_notifyDelegateDidCreateTimelapseFragment:(id)a3;
- (void)_notifyDelegateDidFailWithError:(id)a3;
- (void)_notifyDelegateDidProduceAnalysisStateUpdate:(id)a3;
- (void)_prepareForInputVideoFormat:(opaqueCMFormatDescription *)a3 audioFormat:(opaqueCMFormatDescription *)a4;
- (void)_prepareForTimelapseOutputVideoFormat:(opaqueCMFormatDescription *)a3;
- (void)_produceResult:(SEL)a3 withArguments:(id)a4;
- (void)_saveFragmentDataToDisk:(id)a3 diskBufferSize:(unint64_t)a4;
- (void)assetWriter:(id)a3 didFailWithError:(id)a4;
- (void)assetWriter:(id)a3 didOutputInitializationSegment:(id)a4;
- (void)assetWriter:(id)a3 didOutputSeparableSegment:(id)a4 segmentReport:(id)a5;
- (void)buffer:(id)a3 willHandleSampleBuffer:(opaqueCMSampleBuffer *)a4;
- (void)bufferWillFlush:(id)a3;
- (void)cancel;
- (void)dealloc;
- (void)decoder:(id)a3 didDecodeSampleBuffer:(opaqueCMSampleBuffer *)a4;
- (void)decoder:(id)a3 didFailWithError:(id)a4;
- (void)encoder:(id)a3 didEncodeSampleBuffer:(opaqueCMSampleBuffer *)a4;
- (void)encoder:(id)a3 didFailWithError:(id)a4;
- (void)finishWithCompletionHandler:(id)a3;
- (void)flush;
- (void)flushAsync;
- (void)frameAnalyzer:(id)a3 didAnalyzeFrame:(id)a4;
- (void)frameAnalyzer:(id)a3 didProduceAnalysisStateUpdate:(id)a4;
- (void)frameSampler:(id)a3 didSampleFrame:(opaqueCMSampleBuffer *)a4;
- (void)frameSelector:(id)a3 didSelectFrame:(opaqueCMSampleBuffer *)a4 reference:(opaqueCMSampleBuffer *)a5;
- (void)frameSelector:(id)a3 didSkipFrame:(opaqueCMSampleBuffer *)a4;
- (void)frameTracker:(id)a3 didTrackFrame:(opaqueCMSampleBuffer *)a4 background:(opaqueCMSampleBuffer *)a5 motionDetections:(id)a6 tracks:(id)a7;
- (void)handleAssetData:(id)a3 withOptions:(id)a4 completionHandler:(id)a5;
- (void)handleMessageWithOptions:(id)a3 completionHandler:(id)a4;
- (void)handleSampleBuffer:(opaqueCMSampleBuffer *)a3 errorHandler:(id)a4;
- (void)setAnalysisFPS:(double)a3;
- (void)setAssetWriter:(id)a3;
- (void)setCancelled:(BOOL)a3;
- (void)setCurrentDTS:(id *)a3;
- (void)setCurrentPTS:(id *)a3;
- (void)setEncode:(BOOL)a3;
- (void)setEncoder:(id)a3;
- (void)setHasFailed:(BOOL)a3;
- (void)setInitializationSegment:(id)a3;
- (void)setInputAudioFormat:(opaqueCMFormatDescription *)a3;
- (void)setInputVideoFormat:(opaqueCMFormatDescription *)a3;
- (void)setLastFragmentReceivedDate:(id)a3;
- (void)setMonitored:(BOOL)a3;
- (void)setTimelapseAssetWriter:(id)a3;
- (void)setTimelapseEncoder:(id)a3;
- (void)setTimelapseInitializationSegment:(id)a3;
- (void)setTimelapseOutputVideoFormat:(opaqueCMFormatDescription *)a3;
- (void)timerDidFire:(id)a3;
@end

@implementation HMIVideoAnalyzerServer

- (HMIVideoAnalyzerServer)initWithConfiguration:(id)a3 identifier:(id)a4
{
  id v6 = a3;
  v71.receiver = self;
  v71.super_class = (Class)HMIVideoAnalyzerServer;
  v7 = [(HMIVideoAnalyzer *)&v71 initWithConfiguration:v6 identifier:a4];
  if (v7)
  {
    v8 = +[HMIPreference sharedInstance];
    dispatch_qos_class_t v9 = [v8 analysisQOS];

    v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = dispatch_queue_attr_make_with_qos_class(v10, v9, 0);
    dispatch_queue_t v12 = dispatch_queue_create("HMIVideoAnalyzerServer", v11);
    v13 = (void *)*((void *)v7 + 19);
    *((void *)v7 + 19) = v12;

    v14 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v15 = dispatch_queue_create("HMIVideoAnalyzerServer - Input", v14);
    v16 = (void *)*((void *)v7 + 18);
    *((void *)v7 + 18) = v15;

    v17 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v18 = dispatch_queue_create("HMIVideoAnalyzerServer - Encoder", v17);
    v19 = (void *)*((void *)v7 + 20);
    *((void *)v7 + 20) = v18;

    v7[129] = [v6 transcode];
    v20 = [[HMIVideoCommandBuffer alloc] initWithMaxCapacity:0x800000];
    v21 = (void *)*((void *)v7 + 25);
    *((void *)v7 + 25) = v20;

    v22 = (void *)*((void *)v7 + 25);
    v23 = [v7 inputQueue];
    [v22 setDelegate:v7 queue:v23];

    v24 = [HMIVideoFrameSelector alloc];
    v25 = [v7 workQueue];
    uint64_t v26 = [(HMIVideoFrameSelector *)v24 initWithConfiguration:v6 workQueue:v25];
    v27 = (void *)*((void *)v7 + 31);
    *((void *)v7 + 31) = v26;

    [*((id *)v7 + 31) setDelegate:v7];
    v28 = [HMIVideoFrameTracker alloc];
    v29 = [v7 workQueue];
    uint64_t v30 = [(HMIVideoFrameTracker *)v28 initWithConfiguration:v6 workQueue:v29];
    v31 = (void *)*((void *)v7 + 32);
    *((void *)v7 + 32) = v30;

    [*((id *)v7 + 32) setDelegate:v7];
    v32 = [HMIVideoFrameAnalyzer alloc];
    v33 = [v7 workQueue];
    uint64_t v34 = [(HMIVideoFrameAnalyzer *)v32 initWithConfiguration:v6 workQueue:v33];
    v35 = (void *)*((void *)v7 + 33);
    *((void *)v7 + 33) = v34;

    [*((id *)v7 + 33) setDelegate:v7];
    v36 = objc_alloc_init(HMIVideoTemporalEventFilter);
    v37 = (void *)*((void *)v7 + 41);
    *((void *)v7 + 41) = v36;

    if (v6)
    {
      [v6 thumbnailInterval];
      if ((v69 & 0x100000000) != 0)
      {
        v38 = [HMIVideoFrameIntervalSampler alloc];
        [v6 thumbnailInterval];
        uint64_t v39 = [(HMIVideoFrameIntervalSampler *)v38 initWithInterval:v67];
        v40 = (void *)*((void *)v7 + 27);
        *((void *)v7 + 27) = v39;

        [*((id *)v7 + 27) setDelegate:v7];
      }
      [v6 timelapseInterval];
      if ((v65 & 0x100000000) != 0)
      {
        v41 = [HMIVideoFrameIntervalSampler alloc];
        [v6 timelapseInterval];
        uint64_t v42 = [(HMIVideoFrameIntervalSampler *)v41 initWithInterval:v64];
        v43 = (void *)*((void *)v7 + 28);
        *((void *)v7 + 28) = v42;

        [*((id *)v7 + 28) setDelegate:v7];
      }
    }
    else
    {
      uint64_t v68 = 0;
      uint64_t v69 = 0;
      uint64_t v70 = 0;
      uint64_t v65 = 0;
      uint64_t v66 = 0;
      v64[3] = 0;
    }
    v44 = [[HMIVideoEventBuffer alloc] initWithMaxCapacity:1024];
    v45 = (void *)*((void *)v7 + 36);
    *((void *)v7 + 36) = v44;

    v46 = [[HMIVideoEventBuffer alloc] initWithMaxCapacity:1024];
    v47 = (void *)*((void *)v7 + 37);
    *((void *)v7 + 37) = v46;

    v48 = [[HMIVideoEventBuffer alloc] initWithMaxCapacity:64];
    v49 = (void *)*((void *)v7 + 40);
    *((void *)v7 + 40) = v48;

    uint64_t v50 = MEMORY[0x263F010E0];
    long long v51 = *MEMORY[0x263F010E0];
    *(_OWORD *)(v7 + 360) = *MEMORY[0x263F010E0];
    uint64_t v52 = *(void *)(v50 + 16);
    *((void *)v7 + 47) = v52;
    *((_OWORD *)v7 + 24) = v51;
    *((void *)v7 + 50) = v52;
    v53 = [[HMIVideoTimeline alloc] initWithMaxCapacity:1024];
    v54 = (void *)*((void *)v7 + 42);
    *((void *)v7 + 42) = v53;

    [v6 analysisFPS];
    *((void *)v7 + 17) = v55;
    [v6 analysisFPS];
    [*((id *)v7 + 31) setSampleRate:v56 * 3.0];
    *((void *)v7 + 11) = 0;
    *((void *)v7 + 12) = 0;
    *((void *)v7 + 13) = 0;
    *((void *)v7 + 14) = 0;
    *((void *)v7 + 15) = 0;
    v7[128] = 1;
    v7[130] = 0;
    v7[131] = 0;
    uint64_t v57 = [MEMORY[0x263EFF910] now];
    v58 = (void *)*((void *)v7 + 43);
    *((void *)v7 + 43) = v57;

    uint64_t v59 = [MEMORY[0x263EFF910] now];
    v60 = (void *)*((void *)v7 + 44);
    *((void *)v7 + 44) = v59;

    uint64_t v61 = [objc_alloc(MEMORY[0x263F42658]) initWithTimeInterval:12 options:30.0];
    v62 = (void *)*((void *)v7 + 24);
    *((void *)v7 + 24) = v61;

    [*((id *)v7 + 24) setDelegate:v7];
    [*((id *)v7 + 24) resume];
  }

  return (HMIVideoAnalyzerServer *)v7;
}

- (id)dynamicConfigurationForTime:(id *)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  dynamicConfigurationBuffer = self->_dynamicConfigurationBuffer;
  CMTime start = *(CMTime *)*(void *)&MEMORY[0x263F010E0];
  CMTime v16 = *(CMTime *)a3;
  CMTimeRangeFromTimeToTime(&v17, &start, &v16);
  id v6 = [(HMIVideoEventBuffer *)dynamicConfigurationBuffer objectsInTimeRange:&v17 includeEnd:1];
  v7 = [v6 lastObject];
  v8 = [v7 value];

  if (!v8)
  {
    dispatch_qos_class_t v9 = (void *)MEMORY[0x22A641C70]();
    v10 = self;
    v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      dispatch_queue_t v12 = HMFGetLogIdentifier();
      CMTime start = (CMTime)*a3;
      v13 = HMICMTimeDescription(&start);
      LODWORD(start.value) = 138543618;
      *(CMTimeValue *)((char *)&start.value + 4) = (CMTimeValue)v12;
      LOWORD(start.flags) = 2112;
      *(void *)((char *)&start.flags + 2) = v13;
      _os_log_impl(&dword_225DC6000, v11, OS_LOG_TYPE_ERROR, "%{public}@Dynamic configuration is missing for time: %@, using the first instead.", (uint8_t *)&start, 0x16u);
    }
    v14 = [(HMIVideoEventBuffer *)self->_dynamicConfigurationBuffer firstObject];
    v8 = [v14 value];
  }
  return v8;
}

- (void)handleMessageWithOptions:(id)a3 completionHandler:(id)a4
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v6 = (NSString *)a3;
  id v7 = a4;
  v8 = (void *)MEMORY[0x22A641C70]();
  dispatch_qos_class_t v9 = self;
  v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v11 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v29 = v11;
    __int16 v30 = 2112;
    v31 = v6;
    _os_log_impl(&dword_225DC6000, v10, OS_LOG_TYPE_DEBUG, "%{public}@Received Message: %@", buf, 0x16u);
  }
  dispatch_queue_t v12 = [(NSString *)v6 objectForKeyedSubscript:@"selector"];
  v13 = [(NSString *)v6 objectForKeyedSubscript:@"arguments"];
  v14 = (char *)NSSelectorFromString(v12);
  if (v14 == sel_flush)
  {
    [(HMIVideoAnalyzerServer *)v9 flush];
    if (!v7) {
      goto LABEL_28;
    }
    goto LABEL_25;
  }
  if (v14 == sel_flushAsync)
  {
    [(HMIVideoAnalyzerServer *)v9 flushAsync];
    if (!v7) {
      goto LABEL_28;
    }
    goto LABEL_25;
  }
  if (v14 == sel_finishWithCompletionHandler_)
  {
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __69__HMIVideoAnalyzerServer_handleMessageWithOptions_completionHandler___block_invoke;
    v25[3] = &unk_26477ECC8;
    id v27 = v7;
    v25[4] = v9;
    uint64_t v26 = v6;
    [(HMIVideoAnalyzerServer *)v9 finishWithCompletionHandler:v25];

    goto LABEL_28;
  }
  if (v14 == sel_cancel)
  {
    [(HMIVideoAnalyzerServer *)v9 cancel];
    if (!v7) {
      goto LABEL_28;
    }
    goto LABEL_25;
  }
  if (v14 == sel_setAnalysisFPS_)
  {
    uint64_t v19 = [v13 objectAtIndexedSubscript:0];
    [v19 doubleValue];
    -[HMIVideoAnalyzerServer setAnalysisFPS:](v9, "setAnalysisFPS:");
    goto LABEL_24;
  }
  if (v14 == sel_setMonitored_)
  {
    uint64_t v19 = [v13 objectAtIndexedSubscript:0];
    -[HMIVideoAnalyzerServer setMonitored:](v9, "setMonitored:", [v19 BOOLValue]);
    goto LABEL_24;
  }
  if (v14 == sel_handleAssetData_withOptions_completionHandler_)
  {
    uint64_t v19 = [v13 objectAtIndexedSubscript:0];
    v20 = [v13 objectAtIndexedSubscript:1];
    [(HMIVideoAnalyzerServer *)v9 handleAssetData:v19 withOptions:v20 completionHandler:0];

LABEL_24:
    if (!v7) {
      goto LABEL_28;
    }
    goto LABEL_25;
  }
  dispatch_queue_t v15 = (void *)MEMORY[0x22A641C70]();
  CMTime v16 = v9;
  CMTimeRange v17 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    dispatch_queue_t v18 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v29 = v18;
    __int16 v30 = 2112;
    v31 = v12;
    _os_log_impl(&dword_225DC6000, v17, OS_LOG_TYPE_ERROR, "%{public}@Unknown %@", buf, 0x16u);
  }
  if (v7)
  {
LABEL_25:
    v21 = (void *)MEMORY[0x22A641C70]();
    v22 = v9;
    v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      v24 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v29 = v24;
      __int16 v30 = 2112;
      v31 = v6;
      _os_log_impl(&dword_225DC6000, v23, OS_LOG_TYPE_DEBUG, "%{public}@Sent Message Reply: %@", buf, 0x16u);
    }
    (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
  }
LABEL_28:
}

void __69__HMIVideoAnalyzerServer_handleMessageWithOptions_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (*(void *)(a1 + 48))
  {
    v4 = (void *)MEMORY[0x22A641C70]();
    id v5 = *(id *)(a1 + 32);
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      id v7 = HMFGetLogIdentifier();
      uint64_t v8 = *(void *)(a1 + 40);
      int v9 = 138543618;
      v10 = v7;
      __int16 v11 = 2112;
      uint64_t v12 = v8;
      _os_log_impl(&dword_225DC6000, v6, OS_LOG_TYPE_DEBUG, "%{public}@Sent Message Reply: %@", (uint8_t *)&v9, 0x16u);
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (void)handleAssetData:(id)a3 withOptions:(id)a4 completionHandler:(id)a5
{
  uint64_t v86 = *MEMORY[0x263EF8340];
  id v61 = a3;
  id v60 = a4;
  v62 = (void (**)(id, void, void *))a5;
  uint64_t v8 = [MEMORY[0x263EFF910] now];
  [(HMIVideoAnalyzerServer *)self setLastFragmentReceivedDate:v8];

  v63 = [v60 objectForKeyedSubscript:@"configuration"];
  if (!v63) {
    _HMFPreconditionFailure();
  }
  int v9 = +[HMIPreference sharedInstance];
  int v10 = [v9 hasPreferenceForKey:@"eventTriggers"];

  if (v10)
  {
    __int16 v11 = +[HMIPreference sharedInstance];
    uint64_t v12 = [v11 numberPreferenceForKey:@"eventTriggers"];
    objc_msgSend(v63, "setEventTriggers:", objc_msgSend(v12, "integerValue"));
  }
  uint64_t v13 = +[HMIPreference sharedInstance];
  v14 = [v13 numberPreferenceForKey:@"fragmentDiskBufferSize" defaultValue:&unk_26D9A9648];
  uint64_t v15 = [v14 integerValue];

  if (v15) {
    [(HMIVideoAnalyzerServer *)self _saveFragmentDataToDisk:v61 diskBufferSize:v15 << 20];
  }
  CMTime v16 = [[HMIVideoFragment alloc] initWithData:v61];
  CMTimeRange v17 = v16;
  if (v16) {
    [(HMIVideoFragment *)v16 duration];
  }
  else {
    memset(&time1, 0, sizeof(time1));
  }
  dispatch_queue_t v18 = [(HMIVideoAnalyzer *)self configuration];
  uint64_t v19 = v18;
  if (v18) {
    [v18 maxFragmentDuration];
  }
  else {
    memset(&time2, 0, sizeof(time2));
  }
  BOOL v20 = CMTimeCompare(&time1, &time2) > 0;

  if (!v20) {
    goto LABEL_27;
  }
  v21 = NSString;
  if (v17) {
    [(HMIVideoFragment *)v17 duration];
  }
  else {
    memset(&time, 0, sizeof(time));
  }
  Float64 Seconds = CMTimeGetSeconds(&time);
  v23 = [(HMIVideoAnalyzer *)self configuration];
  v24 = v23;
  if (v23) {
    [v23 maxFragmentDuration];
  }
  else {
    memset(&v74, 0, sizeof(v74));
  }
  v25 = objc_msgSend(v21, "stringWithFormat:", @"Video fragment duration: %fs is greater than the max fragment duration value: %fs", *(void *)&Seconds, CMTimeGetSeconds(&v74));

  if (+[HMIPreference isInternalInstall])
  {
    uint64_t v26 = [(HMIVideoFragment *)v17 sanitizedData];
    uint64_t v59 = [v26 base64EncodedDataWithOptions:0];

    v58 = (void *)[[NSString alloc] initWithData:v59 encoding:4];
    context = (void *)MEMORY[0x22A641C70]();
    id v27 = self;
    v28 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      v54 = HMFGetLogIdentifier();
      double v56 = [(HMIVideoAnalyzer *)v27 configuration];
      uint64_t v55 = [v56 camera];
      v29 = [v55 manufacturer];
      __int16 v30 = [(HMIVideoAnalyzer *)v27 configuration];
      v31 = [v30 camera];
      uint64_t v32 = [v31 model];
      LODWORD(buf.value) = 138544386;
      *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)v54;
      LOWORD(buf.flags) = 2112;
      *(void *)((char *)&buf.flags + 2) = v29;
      HIWORD(buf.epoch) = 2112;
      v81 = v32;
      __int16 v82 = 2112;
      v83 = v17;
      __int16 v84 = 2112;
      v85 = v58;
      _os_log_impl(&dword_225DC6000, v28, OS_LOG_TYPE_ERROR, "%{public}@Camera, Manufacturer: %@, Model: %@, Fragment: %@, Sanitized Fragment Data: %@", (uint8_t *)&buf, 0x34u);
    }
  }
  v33 = [MEMORY[0x263F087E8] hmiErrorWithCode:4 description:v25];

  if (v33)
  {
    if (v62) {
      v62[2](v62, 0, v33);
    }
    objc_initWeak((id *)&buf, self);
    uint64_t v34 = [(HMIVideoAnalyzerServer *)self commandBuffer];
    v71[0] = MEMORY[0x263EF8330];
    v71[1] = 3221225472;
    v71[2] = __72__HMIVideoAnalyzerServer_handleAssetData_withOptions_completionHandler___block_invoke;
    v71[3] = &unk_26477BB20;
    objc_copyWeak(&v73, (id *)&buf);
    id v35 = v33;
    id v72 = v35;
    [v34 handleBlock:v71];

    objc_destroyWeak(&v73);
    objc_destroyWeak((id *)&buf);
  }
  else
  {
LABEL_27:
    v36 = [(HMIVideoAnalyzerServer *)self dynamicConfigurationBuffer];
    v37 = [HMIVideoEventEntry alloc];
    p_currentDTS = &self->_currentDTS;
    CMTime buf = (CMTime)self->_currentDTS;
    uint64_t v39 = [(HMIVideoEventEntry *)v37 initWithValue:v63 time:&buf];
    [v36 addObject:v39];

    objc_initWeak(&location, self);
    v40 = [(HMIVideoAnalyzerServer *)self commandBuffer];
    v67[0] = MEMORY[0x263EF8330];
    v67[1] = 3221225472;
    v67[2] = __72__HMIVideoAnalyzerServer_handleAssetData_withOptions_completionHandler___block_invoke_2;
    v67[3] = &unk_26477BB20;
    objc_copyWeak(&v69, &location);
    v41 = v17;
    uint64_t v68 = v41;
    [v40 handleBlock:v67];

    uint64_t v42 = [[HMIMemoryAVAsset alloc] initWithData:v61];
    [(HMIMemoryAVAsset *)v42 loadValuesSynchronously];
    uint64_t v43 = [(HMIVideoFragment *)v41 videoFormatDescription];
    v44 = [(HMIVideoAnalyzer *)self configuration];
    if ([v44 passthroughAudio]) {
      BOOL v45 = [(HMIVideoFragment *)v41 audioFormatDescription] != 0;
    }
    else {
      BOOL v45 = 0;
    }

    v46 = [[HMIVideoAssetReader alloc] initWithAsset:v42 readVideoTrack:v43 != 0 readAudioTrack:v45];
    *(_OWORD *)&buf.CMTimeValue value = *(_OWORD *)&p_currentDTS->value;
    buf.CMTimeEpoch epoch = self->_currentDTS.epoch;
    CMTimeValue value = *MEMORY[0x263F01090];
    CMTimeFlags flags = *(_DWORD *)(MEMORY[0x263F01090] + 12);
    CMTimeScale timescale = *(_DWORD *)(MEMORY[0x263F01090] + 8);
    CMTimeEpoch epoch = *(void *)(MEMORY[0x263F01090] + 16);
    while (1)
    {
      v49 = [(HMIVideoAssetReader *)v46 copyNextSampleBuffer];
      uint64_t v50 = v49;
      if (!v49) {
        break;
      }
      CMTime v66 = buf;
      long long v51 = (const void *)HMICMSampleBufferCreateCopyWithTimingOffset(v49, &v66);
      if (HMICMSampleBufferIsVideo(v50))
      {
        CMSampleBufferGetDuration(&v66, v50);
        CMTimeValue value = v66.value;
        CMTimeFlags flags = v66.flags;
        CMTimeScale timescale = v66.timescale;
        CMTimeEpoch epoch = v66.epoch;
      }
      CFRelease(v50);
      [(HMIVideoAnalyzerServer *)self handleSampleBuffer:v51 errorHandler:0];
      CFRelease(v51);
    }
    if (flags)
    {
      *(_OWORD *)&lhs.CMTimeValue value = *(_OWORD *)&p_currentDTS->value;
      lhs.CMTimeEpoch epoch = self->_currentDTS.epoch;
      rhs.CMTimeValue value = value;
      rhs.CMTimeScale timescale = timescale;
      rhs.CMTimeFlags flags = flags;
      rhs.CMTimeEpoch epoch = epoch;
      CMTimeAdd(&v66, &lhs, &rhs);
      *(_OWORD *)&p_currentDTS->CMTimeValue value = *(_OWORD *)&v66.value;
      self->_currentDTS.CMTimeEpoch epoch = v66.epoch;
      if ([(HMIVideoNode *)v46 status] == 4)
      {
        v53 = [(HMIVideoNode *)v46 error];
        [(HMIVideoAnalyzerServer *)self _notifyDelegateDidFailWithError:v53];
      }
      if (v62) {
        v62[2](v62, 0, 0);
      }
    }
    else
    {
      uint64_t v52 = [MEMORY[0x263F087E8] hmiErrorWithCode:4, @"Fragment had no video samples, fragment is likely corrupted." description];
      [(HMIVideoAnalyzerServer *)self _notifyDelegateDidFailWithError:v52];
      if (v62) {
        v62[2](v62, 0, v52);
      }
    }
    objc_destroyWeak(&v69);
    objc_destroyWeak(&location);
  }
}

void __72__HMIVideoAnalyzerServer_handleAssetData_withOptions_completionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _notifyDelegateDidFailWithError:*(void *)(a1 + 32)];
}

uint64_t __72__HMIVideoAnalyzerServer_handleAssetData_withOptions_completionHandler___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    int v9 = WeakRetained;
    uint64_t v3 = [*(id *)(a1 + 32) videoFormatDescription];
    v4 = [v9 configuration];
    if ([v4 passthroughAudio]) {
      uint64_t v5 = [*(id *)(a1 + 32) audioFormatDescription];
    }
    else {
      uint64_t v5 = 0;
    }
    [v9 _prepareForInputVideoFormat:v3 audioFormat:v5];

    id v6 = [v9 configuration];
    uint64_t v7 = [v6 decodeMode];

    if (v7) {
      [v9 _ensureDecoderForFragment:*(void *)(a1 + 32)];
    }
    [v9 _ensureEncoder];
    [v9 _ensureTimelapseEncoder];
  }
  return MEMORY[0x270F9A758]();
}

- (void)handleSampleBuffer:(opaqueCMSampleBuffer *)a3 errorHandler:(id)a4
{
  if (HMICMSampleBufferIsAudio(a3))
  {
    id v9 = [(HMIVideoAnalyzerServer *)self commandBuffer];
    [v9 handleSampleBuffer:a3];
  }
  else if (CMSampleBufferGetImageBuffer(a3))
  {
    [(HMIVideoAnalyzerServer *)self _handleDecodedSampleBuffer:a3];
  }
  else
  {
    memset(&v11, 0, sizeof(v11));
    CMSampleBufferGetDecodeTimeStamp(&v11, a3);
    self->_currentDTS = ($95D729B680665BEAEFA1D6FCA8238556)v11;
    id v6 = [(HMIVideoAnalyzerServer *)self timeline];
    uint64_t v7 = [MEMORY[0x263EFF910] now];
    CMSampleBufferGetPresentationTimeStamp(&v10, a3);
    [v6 addDate:v7 atTime:&v10];

    uint64_t v8 = [(HMIVideoAnalyzerServer *)self commandBuffer];
    [v8 handleSampleBuffer:a3];
  }
}

- (void)flush
{
  id v2 = [(HMIVideoAnalyzerServer *)self commandBuffer];
  [v2 flush];
}

- (void)flushAsync
{
  id v2 = [(HMIVideoAnalyzerServer *)self commandBuffer];
  [v2 flushAsync];
}

- (void)finishWithCompletionHandler:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x22A641C70]();
  id v6 = self;
  uint64_t v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = HMFGetLogIdentifier();
    *(_DWORD *)CMTime buf = 138543362;
    v14 = v8;
    _os_log_impl(&dword_225DC6000, v7, OS_LOG_TYPE_INFO, "%{public}@Finish Analyzer", buf, 0xCu);
  }
  id v9 = [(HMIVideoAnalyzerServer *)v6 commandBuffer];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __54__HMIVideoAnalyzerServer_finishWithCompletionHandler___block_invoke;
  v11[3] = &unk_26477BD58;
  v11[4] = v6;
  id v12 = v4;
  id v10 = v4;
  [v9 handleBlock:v11];
}

void __54__HMIVideoAnalyzerServer_finishWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) inputQueue];
  dispatch_assert_queue_V2(v2);

  if ([*(id *)(a1 + 32) hasFailed])
  {
    uint64_t v3 = (void *)MEMORY[0x22A641C70]();
    id v4 = *(id *)(a1 + 32);
    uint64_t v5 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      id v6 = HMFGetLogIdentifier();
      *(_DWORD *)CMTime buf = 138543362;
      uint64_t v13 = v6;
      _os_log_impl(&dword_225DC6000, v5, OS_LOG_TYPE_DEBUG, "%{public}@Analyzer has failed, ignoring finish.", buf, 0xCu);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    uint64_t v7 = [*(id *)(a1 + 32) state];
    +[HMIAnalytics videoAnalyzerDidTerminateWithError:0 state:v7];

    uint64_t v8 = [*(id *)(a1 + 32) timelapseAssetWriter];

    if (v8)
    {
      id v9 = [*(id *)(a1 + 32) timelapseEncoder];
      [v9 flush];

      id v11 = [*(id *)(a1 + 32) timelapseAssetWriter];
      [v11 finishWithCompletionHandler:*(void *)(a1 + 40)];
    }
    else
    {
      id v10 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
      v10();
    }
  }
}

- (void)cancel
{
  self->_cancelled = 1;
}

- (void)_saveFragmentDataToDisk:(id)a3 diskBufferSize:(unint64_t)a4
{
  id v45 = a3;
  uint64_t v5 = [(HMIVideoAnalyzer *)self configuration];
  id v6 = [v5 camera];
  uint64_t v7 = [v6 name];
  uint64_t v8 = (void *)v7;
  id v9 = @"Unknown";
  if (v7) {
    id v9 = (__CFString *)v7;
  }
  v44 = v9;

  v41 = NSString;
  uint64_t v43 = [(HMIVideoAnalyzer *)self configuration];
  uint64_t v42 = [v43 camera];
  uint64_t v10 = [v42 manufacturer];
  id v11 = (void *)v10;
  if (v10) {
    id v12 = (__CFString *)v10;
  }
  else {
    id v12 = @"UnknownManufacturer";
  }
  uint64_t v13 = [(HMIVideoAnalyzer *)self configuration];
  uint64_t v14 = [v13 camera];
  uint64_t v15 = [v14 model];
  CMTime v16 = (void *)v15;
  if (v15) {
    CMTimeRange v17 = (__CFString *)v15;
  }
  else {
    CMTimeRange v17 = @"UnknownModel";
  }
  dispatch_queue_t v18 = [(HMIVideoAnalyzer *)self configuration];
  uint64_t v19 = [v18 camera];
  uint64_t v20 = [v19 firmwareVersion];
  v21 = (void *)v20;
  v22 = @"UnknownFirmware";
  if (v20) {
    v22 = (__CFString *)v20;
  }
  v23 = [v41 stringWithFormat:@"%@_%@_%@", v12, v17, v22];

  v24 = [v23 stringByReplacingOccurrencesOfString:@" " withString:@"-"];

  v25 = NSTemporaryDirectory();
  uint64_t v26 = [v25 stringByAppendingPathComponent:v44];

  id v27 = [MEMORY[0x263F08850] defaultManager];
  [v27 createDirectoryAtPath:v26 withIntermediateDirectories:1 attributes:0 error:0];

  v47[0] = MEMORY[0x263EF8330];
  v47[1] = 3221225472;
  v47[2] = __65__HMIVideoAnalyzerServer__saveFragmentDataToDisk_diskBufferSize___block_invoke;
  v47[3] = &unk_26477ED18;
  v47[4] = self;
  id v48 = v26;
  id v49 = v45;
  unint64_t v50 = a4;
  id v28 = v45;
  id v29 = v26;
  __int16 v30 = (void (**)(void, void, void))MEMORY[0x22A641EE0](v47);
  id v31 = objc_alloc_init(MEMORY[0x263F08790]);
  [v31 setDateFormat:@"YYYY-MM-dd-HH-mm-ss"];
  uint64_t v32 = NSString;
  v33 = [(HMIVideoAnalyzerServer *)self startDate];
  uint64_t v34 = [v31 stringFromDate:v33];
  id v35 = [(HMIVideoAnalyzer *)self identifier];
  v36 = [v32 stringWithFormat:@"%@_%@_%@", v34, v35, v24];

  v37 = [v29 stringByAppendingPathComponent:v36];
  v38 = [v37 stringByAppendingPathExtension:@"mp4"];

  ((void (**)(void, void *, void))v30)[2](v30, v38, 0);
  uint64_t v39 = [v29 stringByAppendingPathComponent:v36];
  v40 = [v39 stringByAppendingPathExtension:@"sanitized.mp4"];

  ((void (**)(void, void *, uint64_t))v30)[2](v30, v40, 1);
}

void __65__HMIVideoAnalyzerServer__saveFragmentDataToDisk_diskBufferSize___block_invoke(uint64_t a1, void *a2, char a3)
{
  uint64_t v66 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = [MEMORY[0x263F08850] defaultManager];
  int v7 = [v6 fileExistsAtPath:v5];

  uint64_t v8 = [MEMORY[0x263F08850] defaultManager];
  id v9 = v8;
  if (!v7)
  {
    char v48 = a3;
    id v50 = v5;
    dispatch_queue_t v18 = [v8 enumeratorAtPath:*(void *)(a1 + 40)];

    uint64_t v10 = [MEMORY[0x263EFF980] array];
    long long v51 = [MEMORY[0x263EFF9A0] dictionary];
    uint64_t v19 = [v18 nextObject];
    if (v19)
    {
      uint64_t v20 = (void *)v19;
      unint64_t v21 = 0;
      do
      {
        [v10 addObject:v20];
        v22 = [MEMORY[0x263F08850] defaultManager];
        v23 = [*(id *)(a1 + 40) stringByAppendingPathComponent:v20];
        uint64_t v58 = 0;
        v24 = [v22 attributesOfItemAtPath:v23 error:&v58];

        v25 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v24, "fileSize"));
        [v51 setObject:v25 forKeyedSubscript:v20];

        v21 += [v24 fileSize];
        uint64_t v26 = [v18 nextObject];

        uint64_t v20 = (void *)v26;
      }
      while (v26);
    }
    else
    {
      unint64_t v21 = 0;
    }
    id v49 = v18;
    uint64_t v27 = *(void *)(a1 + 56);
    id v28 = (void *)MEMORY[0x22A641C70]();
    id v29 = *(id *)(a1 + 32);
    __int16 v30 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v31 = v27 - v21;
      uint64_t v32 = HMFGetLogIdentifier();
      v33 = *(void **)(a1 + 40);
      *(_DWORD *)CMTime buf = 138543874;
      id v61 = v32;
      __int16 v62 = 2112;
      id v63 = v33;
      __int16 v64 = 2048;
      uint64_t v65 = v31 / 0x100000;
      _os_log_impl(&dword_225DC6000, v30, OS_LOG_TYPE_DEBUG, "%{public}@Disk buffer size remaining in %@, %ld MB", buf, 0x20u);
    }
    uint64_t v34 = v51;
    if ((objc_msgSend(v10, "hmf_isEmpty") & 1) == 0)
    {
      uint64_t v52 = v10;
      do
      {
        if (v21 < *(void *)(a1 + 56)) {
          break;
        }
        id v35 = [v10 firstObject];
        objc_msgSend(v10, "hmf_removeFirstObject");
        v36 = [*(id *)(a1 + 40) stringByAppendingPathComponent:v35];
        v37 = [MEMORY[0x263F08850] defaultManager];
        id v57 = 0;
        [v37 removeItemAtPath:v36 error:&v57];
        id v38 = v57;

        uint64_t v39 = [v34 objectForKeyedSubscript:v35];
        uint64_t v40 = [v39 integerValue];

        v41 = (void *)MEMORY[0x22A641C70]();
        id v42 = *(id *)(a1 + 32);
        uint64_t v43 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
        {
          v44 = HMFGetLogIdentifier();
          *(_DWORD *)CMTime buf = 138543874;
          id v61 = v44;
          __int16 v62 = 2112;
          id v63 = v36;
          __int16 v64 = 2112;
          uint64_t v65 = (uint64_t)v38;
          _os_log_impl(&dword_225DC6000, v43, OS_LOG_TYPE_DEBUG, "%{public}@Deleted %@ to free up some space, error: %@", buf, 0x20u);

          uint64_t v34 = v51;
        }
        v21 -= v40;

        uint64_t v10 = v52;
      }
      while (!objc_msgSend(v52, "hmf_isEmpty"));
    }

    id v11 = v49;
    id v5 = v50;
    a3 = v48;
    goto LABEL_20;
  }
  id v59 = 0;
  uint64_t v10 = [v8 attributesOfItemAtPath:v5 error:&v59];
  id v11 = v59;

  unint64_t v12 = [v10 fileSize];
  unint64_t v13 = *(void *)(a1 + 56);
  if (v12 <= v13 >> 3)
  {
LABEL_20:

    uint64_t v45 = *(void *)(a1 + 48);
    v53[0] = MEMORY[0x263EF8330];
    v53[1] = 3221225472;
    v53[2] = __65__HMIVideoAnalyzerServer__saveFragmentDataToDisk_diskBufferSize___block_invoke_318;
    v53[3] = &unk_26477ECF0;
    id v46 = v5;
    char v56 = a3;
    uint64_t v47 = *(void *)(a1 + 32);
    id v54 = v46;
    uint64_t v55 = v47;
    +[HMIVideoFragment fragmentData:v45 handler:v53];
    id v11 = v54;
    goto LABEL_21;
  }
  uint64_t v14 = (void *)MEMORY[0x22A641C70]();
  id v15 = *(id *)(a1 + 32);
  CMTime v16 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    CMTimeRange v17 = HMFGetLogIdentifier();
    *(_DWORD *)CMTime buf = 138543874;
    id v61 = v17;
    __int16 v62 = 2112;
    id v63 = v5;
    __int16 v64 = 2048;
    uint64_t v65 = v13 >> 23;
    _os_log_impl(&dword_225DC6000, v16, OS_LOG_TYPE_DEBUG, "%{public}@Video file %@ size is too large, maximum allowed is (%ld MB), no longer appending fragments.", buf, 0x20u);
  }

LABEL_21:
}

void __65__HMIVideoAnalyzerServer__saveFragmentDataToDisk_diskBufferSize___block_invoke_318(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [MEMORY[0x263F08840] fileHandleForWritingAtPath:*(void *)(a1 + 32)];
  id v5 = v4;
  if (v4)
  {
    [v4 seekToEndOfFile];
    if (*(unsigned char *)(a1 + 48)) {
      [v3 sanitizedSeperableSegment];
    }
    else {
    id v6 = [v3 separableSegment];
    }
    [v5 writeData:v6];

    int v7 = (void *)MEMORY[0x22A641C70]([v5 closeFile]);
    id v8 = *(id *)(a1 + 40);
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v10 = HMFGetLogIdentifier();
      uint64_t v11 = *(void *)(a1 + 32);
      int v15 = 138543618;
      CMTime v16 = v10;
      __int16 v17 = 2112;
      uint64_t v18 = v11;
      unint64_t v12 = "%{public}@Appending fragment to %@";
LABEL_12:
      _os_log_impl(&dword_225DC6000, v9, OS_LOG_TYPE_DEBUG, v12, (uint8_t *)&v15, 0x16u);
    }
  }
  else
  {
    if (*(unsigned char *)(a1 + 48)) {
      [v3 sanitizedData];
    }
    else {
    unint64_t v13 = [v3 data];
    }
    [v13 writeToFile:*(void *)(a1 + 32) atomically:1];

    int v7 = (void *)MEMORY[0x22A641C70]();
    id v8 = *(id *)(a1 + 40);
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v10 = HMFGetLogIdentifier();
      uint64_t v14 = *(void *)(a1 + 32);
      int v15 = 138543618;
      CMTime v16 = v10;
      __int16 v17 = 2112;
      uint64_t v18 = v14;
      unint64_t v12 = "%{public}@Saving fragment to %@";
      goto LABEL_12;
    }
  }
}

- (void)_prepareForInputVideoFormat:(opaqueCMFormatDescription *)a3 audioFormat:(opaqueCMFormatDescription *)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if (![(HMIVideoAnalyzerServer *)self inputVideoFormat])
  {
    self->_inputVideoFormat = a3;
    if (a3) {
      CFRetain(a3);
    }
  }
  if (!CMFormatDescriptionEqual(a3, [(HMIVideoAnalyzerServer *)self inputVideoFormat]))
  {
    int v7 = (void *)MEMORY[0x22A641C70]();
    id v8 = self;
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = HMFGetLogIdentifier();
      int v16 = 138543362;
      __int16 v17 = v10;
      _os_log_impl(&dword_225DC6000, v9, OS_LOG_TYPE_ERROR, "%{public}@Video format should not change.", (uint8_t *)&v16, 0xCu);
    }
  }
  if (![(HMIVideoAnalyzerServer *)self inputAudioFormat])
  {
    self->_inputAudioFormat = a4;
    if (a4) {
      CFRetain(a4);
    }
  }
  if (!CMFormatDescriptionEqual(a4, [(HMIVideoAnalyzerServer *)self inputAudioFormat]))
  {
    uint64_t v11 = (void *)MEMORY[0x22A641C70]();
    unint64_t v12 = self;
    unint64_t v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = HMFGetLogIdentifier();
      int v16 = 138543362;
      __int16 v17 = v14;
      _os_log_impl(&dword_225DC6000, v13, OS_LOG_TYPE_ERROR, "%{public}@Audio format should not change.", (uint8_t *)&v16, 0xCu);
    }
  }
  int v15 = [(HMIVideoAnalyzerServer *)self assetWriter];

  if (!v15) {
    [(HMIVideoAnalyzerServer *)self _configureAssetWriter];
  }
}

- (void)_prepareForTimelapseOutputVideoFormat:(opaqueCMFormatDescription *)a3
{
  if (!CMFormatDescriptionEqual(a3, [(HMIVideoAnalyzerServer *)self timelapseOutputVideoFormat]))
  {
    timelapseOutputVideoFormat = self->_timelapseOutputVideoFormat;
    if (timelapseOutputVideoFormat) {
      CFRelease(timelapseOutputVideoFormat);
    }
    self->_timelapseOutputVideoFormat = (opaqueCMFormatDescription *)CFRetain(a3);
    [(HMIVideoAnalyzerServer *)self _configureTimelapseAssetWriter];
  }
}

- (void)dealloc
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = (void *)MEMORY[0x22A641C70](self, a2);
  id v4 = self;
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    id v6 = HMFGetLogIdentifier();
    *(_DWORD *)CMTime buf = 138543362;
    unint64_t v12 = v6;
    _os_log_impl(&dword_225DC6000, v5, OS_LOG_TYPE_DEBUG, "%{public}@-[HMIVideoAnalyzerServer dealloc]", buf, 0xCu);
  }
  inputVideoFormat = v4->_inputVideoFormat;
  if (inputVideoFormat) {
    CFRelease(inputVideoFormat);
  }
  inputAudioFormat = v4->_inputAudioFormat;
  if (inputAudioFormat) {
    CFRelease(inputAudioFormat);
  }
  timelapseOutputVideoFormat = v4->_timelapseOutputVideoFormat;
  if (timelapseOutputVideoFormat) {
    CFRelease(timelapseOutputVideoFormat);
  }
  v10.receiver = v4;
  v10.super_class = (Class)HMIVideoAnalyzerServer;
  [(HMIVideoAnalyzer *)&v10 dealloc];
}

- (void)_configureAssetWriter
{
  id v3 = [(HMIVideoAnalyzerServer *)self assetWriter];

  if (v3)
  {
    int v7 = (HMIVideoAnalyzerServer *)_HMFPreconditionFailure();
    [(HMIVideoAnalyzerServer *)v7 _configureTimelapseAssetWriter];
  }
  else
  {
    id v4 = [[HMIVideoAssetWriter alloc] initWithVideoFormat:[(HMIVideoAnalyzerServer *)self inputVideoFormat] audioFormat:[(HMIVideoAnalyzerServer *)self inputAudioFormat]];
    [(HMIVideoAnalyzerServer *)self setAssetWriter:v4];

    id v5 = [(HMIVideoAnalyzer *)self logIdentifier];
    id v6 = [(HMIVideoAnalyzerServer *)self assetWriter];
    [v6 setLogIdentifier:v5];

    id v9 = [(HMIVideoAnalyzerServer *)self assetWriter];
    [v9 setDelegate:self];
  }
}

- (void)_configureTimelapseAssetWriter
{
  if ([(HMIVideoAnalyzerServer *)self timelapseOutputVideoFormat])
  {
    id v3 = [HMIVideoAssetWriter alloc];
    id v4 = [(HMIVideoAnalyzerServer *)self timelapseOutputVideoFormat];
    id v5 = [(HMIVideoAnalyzer *)self configuration];
    id v6 = v5;
    if (v5) {
      [v5 timelapsePreferredFragmentDuration];
    }
    else {
      memset(v15, 0, sizeof(v15));
    }
    int v7 = [(HMIVideoAssetWriter *)v3 initWithVideoFormat:v4 audioFormat:0 initialFragmentSequenceNumber:1 preferredOutputSegmentInterval:v15];
    [(HMIVideoAnalyzerServer *)self setTimelapseAssetWriter:v7];

    SEL v8 = [(HMIVideoAnalyzerServer *)self timelapseAssetWriter];
    [v8 setDelegate:self];

    id v9 = [(HMIVideoAnalyzer *)self identifier];
    objc_super v10 = [v9 UUIDString];
    uint64_t v11 = [v10 stringByAppendingString:@" Timelapse"];
    unint64_t v12 = [(HMIVideoAnalyzerServer *)self timelapseAssetWriter];
    [v12 setLogIdentifier:v11];
  }
  else
  {
    uint64_t v13 = (HMIVideoAnalyzerServer *)_HMFPreconditionFailure();
    [(HMIVideoAnalyzerServer *)v13 _configureEncoder];
  }
}

- (void)_configureEncoder
{
  if (!self->_encode)
  {
    _HMFPreconditionFailure();
    goto LABEL_9;
  }
  id v3 = [(HMIVideoAnalyzerServer *)self encoder];

  if (v3)
  {
LABEL_9:
    _HMFPreconditionFailure();
    goto LABEL_10;
  }
  if (![(HMIVideoAnalyzerServer *)self inputVideoFormat])
  {
LABEL_10:
    int v16 = (HMIVideoAnalyzerServer *)_HMFPreconditionFailure();
    [(HMIVideoAnalyzerServer *)v16 _configureTimelapseEncoder];
    return;
  }
  id v4 = [HMIVideoEncoder alloc];
  CMVideoDimensions Dimensions = CMVideoFormatDescriptionGetDimensions([(HMIVideoAnalyzerServer *)self inputVideoFormat]);
  id v6 = [(HMIVideoAnalyzer *)self configuration];
  id v18 = 0;
  int v7 = -[HMIVideoEncoder initWithDimensions:codecType:useHardwareAcceleration:error:](v4, "initWithDimensions:codecType:useHardwareAcceleration:error:", Dimensions, [v6 transcodeCodecType], 1, &v18);
  id v8 = v18;
  [(HMIVideoAnalyzerServer *)self setEncoder:v7];

  id v9 = [(HMIVideoAnalyzerServer *)self encoder];

  if (v9)
  {
    objc_super v10 = [(HMIVideoAnalyzer *)self logIdentifier];
    uint64_t v11 = [(HMIVideoAnalyzerServer *)self encoder];
    [v11 setLogIdentifier:v10];

    unint64_t v12 = [(HMIVideoAnalyzerServer *)self encoder];
    [v12 setAverageBitRate:1000000];

    uint64_t v13 = [(HMIVideoAnalyzerServer *)self encoder];
    objc_msgSend(v13, "setDataRateLimit:", 0x80000, 4);

    SEL v14 = [(HMIVideoAnalyzerServer *)self encoder];
    int v15 = [(HMIVideoAnalyzerServer *)self encoderQueue];
    [v14 setDelegate:self queue:v15];
  }
  else
  {
    [(HMIVideoAnalyzerServer *)self _notifyDelegateDidFailWithError:v8];
  }
}

- (void)_configureTimelapseEncoder
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v3 = [(HMIVideoAnalyzerServer *)self timelapseEncoder];

  if (v3)
  {
    _HMFPreconditionFailure();
LABEL_25:
    _HMFPreconditionFailure();
  }
  if (![(HMIVideoAnalyzerServer *)self inputVideoFormat]) {
    goto LABEL_25;
  }
  unint64_t Dimensions = (unint64_t)CMVideoFormatDescriptionGetDimensions([(HMIVideoAnalyzerServer *)self inputVideoFormat]);
  int32_t v5 = Dimensions;
  unint64_t v6 = HIDWORD(Dimensions);
  unint64_t v7 = HMIAspectRatioMake(Dimensions, HIDWORD(Dimensions));
  if (HMIAspectRatioEqualToAspectRatio(v7, 0x900000010))
  {
    unint64_t v8 = 0x1B000000000;
    uint64_t v9 = 768;
    goto LABEL_10;
  }
  if (HMIAspectRatioEqualToAspectRatio(v7, 0x1000000009))
  {
    unint64_t v8 = 0x30000000000;
LABEL_7:
    uint64_t v9 = 432;
    goto LABEL_10;
  }
  if (HMIAspectRatioEqualToAspectRatio(v7, 0x300000004))
  {
    unint64_t v8 = 0x1B000000000;
    uint64_t v9 = 576;
  }
  else
  {
    if (HMIAspectRatioEqualToAspectRatio(v7, 0x400000003))
    {
      unint64_t v8 = 0x24000000000;
      goto LABEL_7;
    }
    if (HMIAspectRatioEqualToAspectRatio(v7, 0x100000001))
    {
      unint64_t v8 = 0x1B000000000;
      goto LABEL_7;
    }
    v25 = (void *)MEMORY[0x22A641C70]();
    uint64_t v26 = self;
    uint64_t v27 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      id v28 = HMFGetLogIdentifier();
      *(_DWORD *)CMTime buf = 138543874;
      v33 = v28;
      __int16 v34 = 1024;
      int v35 = v7;
      __int16 v36 = 1024;
      int v37 = HIDWORD(v7);
      _os_log_impl(&dword_225DC6000, v27, OS_LOG_TYPE_ERROR, "%{public}@Unsupported aspect ratio: (%d, %d)", buf, 0x18u);
    }
    double v29 = 432.0 / (double)(int)v6;
    uint64_t v9 = (int)(v29 * (double)v5);
    unint64_t v8 = (unint64_t)(int)(v29 * (double)(int)v6) << 32;
  }
LABEL_10:
  objc_super v10 = [HMIVideoEncoder alloc];
  uint64_t v11 = [(HMIVideoAnalyzer *)self configuration];
  id v31 = 0;
  unint64_t v12 = -[HMIVideoEncoder initWithDimensions:codecType:useHardwareAcceleration:error:](v10, "initWithDimensions:codecType:useHardwareAcceleration:error:", v9 | v8, [v11 timelapseCodecType], 1, &v31);
  id v13 = v31;
  [(HMIVideoAnalyzerServer *)self setTimelapseEncoder:v12];

  SEL v14 = [(HMIVideoAnalyzer *)self logIdentifier];
  int v15 = [v14 stringByAppendingString:@" Timelapse"];
  int v16 = [(HMIVideoAnalyzerServer *)self timelapseEncoder];
  [v16 setLogIdentifier:v15];

  SEL v17 = [(HMIVideoAnalyzerServer *)self timelapseEncoder];
  [v17 setAverageBitRate:100000];

  id v18 = [(HMIVideoAnalyzerServer *)self timelapseEncoder];

  if (v18)
  {
    uint64_t v19 = [(HMIVideoAnalyzer *)self configuration];
    uint64_t v20 = v19;
    if (v19) {
      [v19 timelapsePreferredFragmentDuration];
    }
    else {
      memset(&v30, 0, sizeof(v30));
    }
    uint64_t Seconds = (uint64_t)CMTimeGetSeconds(&v30);
    v22 = [(HMIVideoAnalyzerServer *)self timelapseEncoder];
    [v22 setMaxKeyFrameIntervalDuration:Seconds];

    v23 = [(HMIVideoAnalyzerServer *)self timelapseEncoder];
    v24 = [(HMIVideoAnalyzerServer *)self encoderQueue];
    [v23 setDelegate:self queue:v24];
  }
  else
  {
    [(HMIVideoAnalyzerServer *)self _notifyDelegateDidFailWithError:v13];
  }
}

- (void)buffer:(id)a3 willHandleSampleBuffer:(opaqueCMSampleBuffer *)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  unint64_t v7 = [(HMIVideoAnalyzerServer *)self inputQueue];
  dispatch_assert_queue_V2(v7);

  if (![(HMIVideoAnalyzerServer *)self hasFailed]
    && ![(HMIVideoAnalyzerServer *)self isCancelled])
  {
    if (HMICMSampleBufferIsAudio(a4))
    {
      unint64_t v12 = [(HMIVideoAnalyzerServer *)self assetWriter];

      if (v12)
      {
        id v13 = [(HMIVideoAnalyzerServer *)self assetWriter];
        [v13 handleSampleBuffer:a4];
        goto LABEL_15;
      }
LABEL_17:
      _HMFPreconditionFailure();
    }
    SEL v14 = [(HMIVideoAnalyzerServer *)self encoder];

    if (!v14)
    {
      int v15 = [(HMIVideoAnalyzerServer *)self assetWriter];

      if (!v15) {
        goto LABEL_17;
      }
      int v16 = [(HMIVideoAnalyzerServer *)self assetWriter];
      [v16 handleSampleBuffer:a4];
    }
    SEL v17 = [(HMIVideoAnalyzer *)self configuration];
    uint64_t v18 = [v17 decodeMode];

    if (v18 == 1 && !HMICMSampleBufferIsSync(a4)) {
      goto LABEL_16;
    }
    id v13 = [(HMIVideoAnalyzerServer *)self decoder];
    [v13 handleSampleBuffer:a4 outputFrame:1];
LABEL_15:

    goto LABEL_16;
  }
  unint64_t v8 = (void *)MEMORY[0x22A641C70]();
  uint64_t v9 = self;
  objc_super v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v11 = HMFGetLogIdentifier();
    int v19 = 138543362;
    uint64_t v20 = v11;
    _os_log_impl(&dword_225DC6000, v10, OS_LOG_TYPE_DEBUG, "%{public}@Analyzer has failed or was cancelled, ignoring sample buffer.", (uint8_t *)&v19, 0xCu);
  }
LABEL_16:
}

- (void)bufferWillFlush:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int32_t v5 = [(HMIVideoAnalyzerServer *)self inputQueue];
  dispatch_assert_queue_V2(v5);

  if ([(HMIVideoAnalyzerServer *)self hasFailed]
    || [(HMIVideoAnalyzerServer *)self isCancelled])
  {
    id v6 = (void *)MEMORY[0x22A641C70]();
    unint64_t v7 = self;
    unint64_t v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v9 = HMFGetLogIdentifier();
      int v16 = 138543362;
      SEL v17 = v9;
      _os_log_impl(&dword_225DC6000, v8, OS_LOG_TYPE_DEBUG, "%{public}@Analyzer has failed or was cancelled, ignoring flush.", (uint8_t *)&v16, 0xCu);
    }
  }
  else
  {
    objc_super v10 = [(HMIVideoAnalyzerServer *)self decoder];
    [v10 flush];

    uint64_t v11 = [(HMIVideoAnalyzerServer *)self frameSelector];
    [v11 flush];

    unint64_t v12 = [(HMIVideoAnalyzerServer *)self frameTracker];
    [v12 flush];

    id v13 = [(HMIVideoAnalyzerServer *)self encoder];
    [v13 flush];

    SEL v14 = [(HMIVideoAnalyzerServer *)self assetWriter];
    [v14 flush];

    int v15 = [(HMIVideoAnalyzerServer *)self frameAnalyzer];
    [v15 flush];

    [(HMIVideoAnalyzerServer *)self _ensureEncoder];
  }
}

- (void)_ensureDecoderForFragment:(id)a3
{
  id v8 = a3;
  id v4 = [(HMIVideoAnalyzerServer *)self decoder];

  if (!v4)
  {
    int32_t v5 = -[HMIVideoDecoder initWithFrameReordering:]([HMIVideoDecoder alloc], "initWithFrameReordering:", [v8 frameReorderingRequired]);
    decoder = self->_decoder;
    self->_decoder = v5;

    unint64_t v7 = [(HMIVideoAnalyzer *)self logIdentifier];
    [(HMIVideoDecoder *)self->_decoder setLogIdentifier:v7];

    [(HMIVideoDecoder *)self->_decoder setDelegate:self];
  }
}

- (void)_ensureEncoder
{
  if ([(HMIVideoAnalyzerServer *)self encode])
  {
    id v3 = [(HMIVideoAnalyzerServer *)self encoder];

    if (!v3)
    {
      [(HMIVideoAnalyzerServer *)self _configureEncoder];
    }
  }
  else
  {
    [(HMIVideoAnalyzerServer *)self setEncoder:0];
  }
}

- (void)_ensureTimelapseEncoder
{
  id v3 = [(HMIVideoAnalyzerServer *)self timelapseEncoder];

  if (!v3)
  {
    id v4 = [(HMIVideoAnalyzer *)self configuration];
    if (v4)
    {
      id v5 = v4;
      [v4 timelapseInterval];

      if (v6) {
        [(HMIVideoAnalyzerServer *)self _configureTimelapseEncoder];
      }
    }
    else
    {
    }
  }
}

- (void)decoder:(id)a3 didDecodeSampleBuffer:(opaqueCMSampleBuffer *)a4
{
  char v6 = [(HMIVideoAnalyzerServer *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __56__HMIVideoAnalyzerServer_decoder_didDecodeSampleBuffer___block_invoke;
  v7[3] = &unk_26477D798;
  v7[4] = self;
  v7[5] = a4;
  dispatch_sync(v6, v7);
}

uint64_t __56__HMIVideoAnalyzerServer_decoder_didDecodeSampleBuffer___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleDecodedSampleBuffer:*(void *)(a1 + 40)];
}

- (void)encoder:(id)a3 didEncodeSampleBuffer:(opaqueCMSampleBuffer *)a4
{
  id v16 = a3;
  id v6 = [(HMIVideoAnalyzerServer *)self encoder];

  if (v6 == v16)
  {
    uint64_t v11 = [(HMIVideoAnalyzerServer *)self assetWriter];

    if (v11)
    {
      objc_super v10 = [(HMIVideoAnalyzerServer *)self assetWriter];
      goto LABEL_7;
    }
    _HMFPreconditionFailure();
LABEL_12:
    id v13 = (HMIVideoAnalyzerServer *)_HMFPreconditionFailure();
    [(HMIVideoAnalyzerServer *)v13 _handleDecodedSampleBuffer:v15];
    return;
  }
  id v7 = [(HMIVideoAnalyzerServer *)self timelapseEncoder];

  id v8 = v16;
  if (v7 == v16)
  {
    [(HMIVideoAnalyzerServer *)self _prepareForTimelapseOutputVideoFormat:CMSampleBufferGetFormatDescription(a4)];
    uint64_t v9 = [(HMIVideoAnalyzerServer *)self timelapseAssetWriter];

    if (v9)
    {
      objc_super v10 = [(HMIVideoAnalyzerServer *)self timelapseAssetWriter];
LABEL_7:
      unint64_t v12 = v10;
      [v10 handleSampleBuffer:a4];

      id v8 = v16;
      goto LABEL_8;
    }
    goto LABEL_12;
  }
LABEL_8:
}

- (void)_handleDecodedSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  id v5 = [(HMIVideoAnalyzerServer *)self workQueue];
  dispatch_assert_queue_V2(v5);

  memset(&v13, 0, sizeof(v13));
  CMSampleBufferGetDuration(&v13, a3);
  CMSampleBufferRef sampleBufferOut = 0;
  if ((v13.flags & 1) == 0)
  {
    memset(&sampleTimingArray, 0, sizeof(sampleTimingArray));
    CMSampleBufferGetDecodeTimeStamp(&sampleTimingArray.decodeTimeStamp, a3);
    CMSampleBufferGetPresentationTimeStamp(&v10, a3);
    sampleTimingArray.presentationTimeStamp = v10;
    CMTimeMake(&v10, 1, 30);
    sampleTimingArray.duration = v10;
    CMSampleBufferCreateCopyWithNewTiming(0, a3, 1, &sampleTimingArray, &sampleBufferOut);
    a3 = sampleBufferOut;
  }
  self->_numDecodedSamples += CMSampleBufferGetNumSamples(a3);
  memset(&sampleTimingArray, 0, 24);
  CMSampleBufferGetPresentationTimeStamp(&sampleTimingArray.duration, a3);
  *(_OWORD *)&self->_currentPTS.CMTimeValue value = *(_OWORD *)&sampleTimingArray.duration.value;
  self->_currentPTS.CMTimeEpoch epoch = sampleTimingArray.duration.epoch;
  id v6 = [(HMIVideoAnalyzerServer *)self encoder];
  [v6 handleSampleBuffer:a3];

  id v7 = [(HMIVideoAnalyzerServer *)self frameSelector];
  [v7 handleSampleBuffer:a3];

  id v8 = [(HMIVideoAnalyzerServer *)self frameThumbnailSampler];
  [v8 handleSampleBuffer:a3];

  uint64_t v9 = [(HMIVideoAnalyzerServer *)self frameTimelapseSampler];
  [v9 handleSampleBuffer:a3];

  if (sampleBufferOut) {
    CFRelease(sampleBufferOut);
  }
}

- (opaqueCMSampleBuffer)frameSelector:(id)a3 prepareFrame:(opaqueCMSampleBuffer *)a4
{
  id v5 = [(HMIVideoAnalyzerServer *)self frameTracker];
  id v6 = (opaqueCMSampleBuffer *)[v5 prepareSampleBuffer:a4];

  return v6;
}

- (void)frameSelector:(id)a3 didSelectFrame:(opaqueCMSampleBuffer *)a4 reference:(opaqueCMSampleBuffer *)a5
{
  CMSampleBufferGetPresentationTimeStamp(&v11, a4);
  id v8 = [(HMIVideoAnalyzerServer *)self dynamicConfigurationForTime:&v11];
  uint64_t v9 = [(HMIVideoAnalyzerServer *)self frameTracker];
  [v9 setDynamicConfiguration:v8];

  CMTime v10 = [(HMIVideoAnalyzerServer *)self frameTracker];
  [v10 handleSampleBuffer:a4 reference:a5];
}

- (void)frameSelector:(id)a3 didSkipFrame:(opaqueCMSampleBuffer *)a4
{
  id v5 = [(HMIVideoAnalyzerServer *)self frameTracker];
  [v5 handleSampleBuffer:a4];
}

- (void)frameTracker:(id)a3 didTrackFrame:(opaqueCMSampleBuffer *)a4 background:(opaqueCMSampleBuffer *)a5 motionDetections:(id)a6 tracks:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  CMSampleBufferGetPresentationTimeStamp(&v16, a4);
  CMTime v13 = [(HMIVideoAnalyzerServer *)self dynamicConfigurationForTime:&v16];
  SEL v14 = [(HMIVideoAnalyzerServer *)self frameAnalyzer];
  [v14 setDynamicConfiguration:v13];

  int v15 = [(HMIVideoAnalyzerServer *)self frameAnalyzer];
  [v15 handleSampleBuffer:a4 background:a5 motionDetections:v12 tracks:v11];
}

- (id)_filterFrameResult:(id)a3 dynamicConfiguration:(id)a4 motionDetections:(id)a5
{
  v32[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v26 = 0;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x3032000000;
  double v29 = __Block_byref_object_copy__11;
  CMTime v30 = __Block_byref_object_dispose__11;
  id v11 = v8;
  id v31 = v11;
  id v12 = [HMIVideoAnalyzerResultActivityZoneFilter alloc];
  CMTime v13 = [v9 activityZones];
  uint64_t v14 = [(HMIVideoAnalyzerResultActivityZoneFilter *)v12 initWithActivityZones:v13 motionDetections:v10];
  v32[0] = v14;
  int v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v32 count:1];

  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __83__HMIVideoAnalyzerServer__filterFrameResult_dynamicConfiguration_motionDetections___block_invoke;
  v25[3] = &unk_26477ED40;
  v25[4] = &v26;
  objc_msgSend(v15, "na_each:", v25);
  CMTime v16 = +[HMIPreference sharedInstance];
  LOBYTE(v14) = [v16 hasPreferenceForKey:@"syntheticEvents"];

  if ((v14 & 1) == 0)
  {
    SEL v17 = [(HMIVideoAnalyzer *)self configuration];
    int v18 = [v17 enableTemporalEventFiltering];

    if (v18)
    {
      int v19 = +[HMIMotionDetection firstMotionDetectionInArray:v10 withMode:2];
      uint64_t v20 = [(HMIVideoAnalyzerServer *)self temporalEventFilter];
      uint64_t v21 = [v20 applyFilterWithFrameResult:v27[5] motionDetection:v19];
      v22 = (void *)v27[5];
      v27[5] = v21;
    }
  }
  id v23 = (id)v27[5];

  _Block_object_dispose(&v26, 8);
  return v23;
}

uint64_t __83__HMIVideoAnalyzerServer__filterFrameResult_dynamicConfiguration_motionDetections___block_invoke(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = [a2 applyWithFrameResult:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)];
  return MEMORY[0x270F9A758]();
}

- (void)frameAnalyzer:(id)a3 didAnalyzeFrame:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  ++self->_numDidAnalyzeFrames;
  id v8 = [(HMIVideoAnalyzerServer *)self frameTracker];
  [v8 handleFrameAnalyzerResult:v7];

  id v9 = [v7 frame];
  id v10 = v9;
  if (v9) {
    [v9 presentationTimeStamp];
  }
  else {
    memset(v41, 0, sizeof(v41));
  }
  id v11 = [(HMIVideoAnalyzerServer *)self dynamicConfigurationForTime:v41];

  id v12 = [v7 frame];
  CMTime v13 = [(HMIVideoAnalyzer *)self configuration];
  [v13 minFrameScale];
  double v15 = v14;
  CMTime v16 = [(HMIVideoAnalyzer *)self configuration];
  [v16 minFrameQuality];
  id v40 = 0;
  int v18 = [v12 compressedFrameWithScale:&v40 quality:v15 error:v17];
  id v19 = v40;

  uint64_t v34 = 0;
  int v35 = &v34;
  uint64_t v36 = 0x3032000000;
  int v37 = __Block_byref_object_copy__11;
  uint64_t v38 = __Block_byref_object_dispose__11;
  uint64_t v20 = [HMIVideoAnalyzerFrameResult alloc];
  uint64_t v21 = [v7 events];
  [v7 regionOfInterest];
  uint64_t v39 = -[HMIVideoAnalyzerFrameResult initWithFrame:events:regionOfInterest:](v20, "initWithFrame:events:regionOfInterest:", v18, v21);

  uint64_t v22 = v35[5];
  id v23 = [v7 motionDetections];
  uint64_t v24 = [(HMIVideoAnalyzerServer *)self _filterFrameResult:v22 dynamicConfiguration:v11 motionDetections:v23];
  v25 = (void *)v35[5];
  v35[5] = v24;

  uint64_t v26 = [v7 events];
  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = __56__HMIVideoAnalyzerServer_frameAnalyzer_didAnalyzeFrame___block_invoke;
  v31[3] = &unk_26477E140;
  v31[4] = self;
  id v27 = v7;
  id v32 = v27;
  v33 = &v34;
  objc_msgSend(v26, "na_each:", v31);

  uint64_t v28 = [(id)v35[5] events];
  uint64_t v29 = [v28 count];

  if (v29)
  {
    CMTime v30 = [(HMIVideoAnalyzerServer *)self frameAnalyzerFrameResultBuffer];
    [v30 addObject:v35[5]];

    [(HMIVideoAnalyzerServer *)self _notifyDelegateDidAnalyzeFrameWithResult:v35[5]];
  }

  _Block_object_dispose(&v34, 8);
}

void __56__HMIVideoAnalyzerServer_frameAnalyzer_didAnalyzeFrame___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = objc_opt_class();
  if (v4 != objc_opt_class())
  {
    id v5 = (void *)MEMORY[0x22A641C70]();
    id v6 = *(id *)(a1 + 32);
    id v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v8 = HMFGetLogIdentifier();
      id v9 = [*(id *)(a1 + 40) frame];
      id v10 = v9;
      if (v9) {
        [v9 presentationTimeStamp];
      }
      else {
        memset(&time, 0, sizeof(time));
      }
      Float64 Seconds = CMTimeGetSeconds(&time);
      id v12 = *(void **)(a1 + 40);
      if (v12) {
        [v12 backgroundTimeStamp];
      }
      else {
        memset(&v18, 0, sizeof(v18));
      }
      Float64 v13 = CMTimeGetSeconds(&v18);
      double v14 = [v3 shortDescription];
      double v15 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) events];
      int v16 = [v15 containsObject:v3];
      *(_DWORD *)CMTime buf = 138544386;
      double v17 = @"Filtered";
      uint64_t v21 = v8;
      __int16 v22 = 2048;
      if (v16) {
        double v17 = &stru_26D98B6C8;
      }
      Float64 v23 = Seconds;
      __int16 v24 = 2048;
      Float64 v25 = v13;
      __int16 v26 = 2112;
      id v27 = v14;
      __int16 v28 = 2112;
      uint64_t v29 = v17;
      _os_log_impl(&dword_225DC6000, v7, OS_LOG_TYPE_INFO, "%{public}@AnalyzerEvents(PTS:%.2f/%.2f): %@ %@", buf, 0x34u);
    }
  }
}

- (void)frameAnalyzer:(id)a3 didProduceAnalysisStateUpdate:(id)a4
{
}

- (void)frameSampler:(id)a3 didSampleFrame:(opaqueCMSampleBuffer *)a4
{
  id v6 = a3;
  id v7 = [(HMIVideoAnalyzerServer *)self frameTimelapseSampler];

  if (v7 == v6)
  {
    id v9 = [(HMIVideoAnalyzerServer *)self timelapseEncoder];
    [v9 handleSampleBuffer:a4];
  }
  else
  {
    id v8 = [(HMIVideoAnalyzerServer *)self frameThumbnailSampler];
    if (v8 == v6)
    {
      id v10 = +[HMIPreference sharedInstance];
      [(HMIVideoAnalyzerServer *)self analysisFPS];
      int v11 = objc_msgSend(v10, "shouldGenerateThumbnailForAnalysisFPS:");

      if (v11)
      {
        ImageBuffer = CMSampleBufferGetImageBuffer(a4);
        double Size = HMICVPixelBufferGetSize(ImageBuffer);
        double v15 = 1.0;
        if (v14 > 0.0)
        {
          double v16 = v14;
          double v17 = [(HMIVideoAnalyzer *)self configuration];
          double v15 = (double)(unint64_t)[v17 thumbnailHeight] / v16;
        }
        CMTime v18 = [[HMIVideoFrame alloc] initWithSampleBuffer:a4];
        uint64_t v21 = 0;
        id v19 = [(HMIVideoFrame *)v18 compressedFrameWithScale:&v21 quality:v15 error:1.0];

        uint64_t v20 = [(HMIVideoAnalyzerServer *)self thumbnailBuffer];
        [v20 addObject:v19];
      }
    }
    else
    {
    }
  }
}

- (void)assetWriter:(id)a3 didOutputInitializationSegment:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  id v7 = [(HMIVideoAnalyzerServer *)self assetWriter];

  if (v7 == v9)
  {
    [(HMIVideoAnalyzerServer *)self setInitializationSegment:v6];
  }
  else
  {
    id v8 = [(HMIVideoAnalyzerServer *)self timelapseAssetWriter];

    if (v8 == v9) {
      [(HMIVideoAnalyzerServer *)self setTimelapseInitializationSegment:v6];
    }
  }
}

- (void)assetWriter:(id)a3 didOutputSeparableSegment:(id)a4 segmentReport:(id)a5
{
  uint64_t v71 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v65 = a5;
  id v10 = [v65 trackReports];
  int v11 = objc_msgSend(v10, "na_firstObjectPassingTest:", &__block_literal_global_375);

  memset(&v69, 0, sizeof(v69));
  id v12 = [v11 firstVideoSampleInformation];
  Float64 v13 = v12;
  if (v12)
  {
    [v12 presentationTimeStamp];
    if (v11)
    {
LABEL_3:
      [v11 duration];
      goto LABEL_6;
    }
  }
  else
  {
    memset(&start, 0, sizeof(start));
    if (v11) {
      goto LABEL_3;
    }
  }
  memset(&duration, 0, sizeof(duration));
LABEL_6:
  CMTimeRangeMake(&v69, &start, &duration);

  double v14 = [v11 firstVideoSampleInformation];
  uint64_t v15 = [v14 offset];
  uint64_t v16 = [v14 length];
  id v17 = [(HMIVideoAnalyzerServer *)self timelapseAssetWriter];

  uint64_t v66 = v8;
  if (v17 != v8)
  {
    uint64_t v63 = v15;
    CMTime v18 = (void *)MEMORY[0x22A641C70]();
    id v19 = self;
    uint64_t v20 = HMFGetOSLogHandle();
    id v64 = v9;
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v21 = HMFGetLogIdentifier();
      CMTimeRange buf = v69;
      __int16 v22 = HMICMTimeRangeDescription(&buf);
      Float64 v23 = [(HMIVideoAnalyzerServer *)v19 frameAnalyzerFrameResultBuffer];
      __int16 v24 = [(HMIVideoAnalyzerServer *)v19 thumbnailBuffer];
      LODWORD(buf.start.value) = 138544130;
      *(CMTimeValue *)((char *)&buf.start.value + 4) = (CMTimeValue)v21;
      LOWORD(buf.start.flags) = 2112;
      *(void *)((char *)&buf.start.flags + 2) = v22;
      HIWORD(buf.start.epoch) = 2112;
      buf.duration.CMTimeValue value = (CMTimeValue)v23;
      LOWORD(buf.duration.timescale) = 2112;
      *(void *)((char *)&buf.duration.timescale + 2) = v24;
      _os_log_impl(&dword_225DC6000, v20, OS_LOG_TYPE_DEBUG, "%{public}@Bundling Fragment Result, timeRange: %@, frames: [%@], thumbnails [%@]", (uint8_t *)&buf, 0x2Au);

      id v9 = v64;
    }

    Float64 v25 = [(HMIVideoAnalyzerServer *)v19 frameAnalyzerFrameResultBuffer];
    CMTimeRange buf = v69;
    __int16 v26 = [v25 extractObjectsInTimeRange:&buf];

    id v27 = [(HMIVideoAnalyzerServer *)v19 frameAnalyzerFrameResultBuffer];
    uint64_t v28 = [v27 count];

    if (v28)
    {
      uint64_t v29 = (void *)MEMORY[0x22A641C70]();
      uint64_t v30 = v19;
      id v31 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        id v32 = HMFGetLogIdentifier();
        v33 = [(HMIVideoAnalyzerServer *)v30 frameAnalyzerFrameResultBuffer];
        LODWORD(buf.start.value) = 138543618;
        *(CMTimeValue *)((char *)&buf.start.value + 4) = (CMTimeValue)v32;
        LOWORD(buf.start.flags) = 2112;
        *(void *)((char *)&buf.start.flags + 2) = v33;
        _os_log_impl(&dword_225DC6000, v31, OS_LOG_TYPE_ERROR, "%{public}@Analyzer frame result buffer should be empty. %@", (uint8_t *)&buf, 0x16u);

        id v9 = v64;
      }

      uint64_t v34 = [(HMIVideoAnalyzerServer *)v30 frameAnalyzerFrameResultBuffer];
      [v34 removeAllObjects];
    }
    int v35 = [(HMIVideoAnalyzerServer *)v19 thumbnailBuffer];
    CMTimeRange buf = v69;
    __int16 v62 = [v35 extractObjectsInTimeRange:&buf];

    uint64_t v36 = [(HMIVideoAnalyzerServer *)v19 thumbnailBuffer];
    uint64_t v37 = [v36 count];

    if (v37)
    {
      uint64_t v38 = (void *)MEMORY[0x22A641C70]();
      uint64_t v39 = v19;
      id v40 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        v41 = HMFGetLogIdentifier();
        thumbnailBuffer = v39->_thumbnailBuffer;
        LODWORD(buf.start.value) = 138543618;
        *(CMTimeValue *)((char *)&buf.start.value + 4) = (CMTimeValue)v41;
        LOWORD(buf.start.flags) = 2112;
        *(void *)((char *)&buf.start.flags + 2) = thumbnailBuffer;
        _os_log_impl(&dword_225DC6000, v40, OS_LOG_TYPE_ERROR, "%{public}@Thumbnail buffer should be empty. %@", (uint8_t *)&buf, 0x16u);

        id v9 = v64;
      }

      uint64_t v43 = [(HMIVideoAnalyzerServer *)v39 thumbnailBuffer];
      [v43 removeAllObjects];
    }
    v44 = [HMIVideoFragment alloc];
    uint64_t v45 = [(HMIVideoAnalyzerServer *)v19 initializationSegment];
    CMTimeRange buf = v69;
    id v46 = -[HMIVideoFragment initWithInitializationSegment:separableSegment:timeRange:firstVideoSampleByteRange:](v44, "initWithInitializationSegment:separableSegment:timeRange:firstVideoSampleByteRange:", v45, v9, &buf, v63, v16);

    *(_OWORD *)&buf.start.CMTimeValue value = *(_OWORD *)&v69.start.value;
    buf.start.CMTimeEpoch epoch = v69.start.epoch;
    uint64_t v47 = [(HMIVideoAnalyzerServer *)v19 dynamicConfigurationForTime:&buf];
    char v48 = [HMIVideoAnalyzerResultOutcome alloc];
    [(HMIVideoAnalyzerServer *)v19 analysisFPS];
    id v49 = -[HMIVideoAnalyzerResultOutcome initWithCode:analysisFPS:message:](v48, "initWithCode:analysisFPS:message:", 1, 0);
    id v50 = [(HMIVideoAnalyzer *)v19 configuration];
    uint64_t v51 = [v50 decodeMode];

    if (v51)
    {
      uint64_t v52 = [(HMIVideoAnalyzer *)v19 configuration];
      uint64_t v53 = [v52 decodeMode];

      if (v53 != 1)
      {
LABEL_23:
        id v59 = [HMIVideoAnalyzerFragmentResult alloc];
        id v60 = [MEMORY[0x263EFFA08] set];
        id v61 = [(HMIVideoAnalyzerFragmentResult *)v59 initWithFragment:v46 events:v60 frameResults:v26 thumbnails:v62 configuration:v47 outcome:v49];

        [(HMIVideoAnalyzerServer *)v19 _notifyDelegateDidAnalyzeFragmentWithResult:v61];
        ++v19->_numDidAnalyzeFragments;

        id v9 = v64;
        goto LABEL_24;
      }
      id v54 = @"Analyzer is in partial bypass mode, only IFrames are decoded.";
    }
    else
    {
      id v54 = @"Analyzer is in full bypass mode.";
    }
    id v57 = [HMIVideoAnalyzerResultOutcome alloc];
    [(HMIVideoAnalyzerServer *)v19 analysisFPS];
    uint64_t v58 = -[HMIVideoAnalyzerResultOutcome initWithCode:analysisFPS:message:](v57, "initWithCode:analysisFPS:message:", 0, v54);

    id v49 = (HMIVideoAnalyzerResultOutcome *)v58;
    goto LABEL_23;
  }
  uint64_t v55 = [HMIVideoFragment alloc];
  char v56 = [(HMIVideoAnalyzerServer *)self timelapseInitializationSegment];
  CMTimeRange buf = v69;
  __int16 v26 = -[HMIVideoFragment initWithInitializationSegment:separableSegment:timeRange:firstVideoSampleByteRange:](v55, "initWithInitializationSegment:separableSegment:timeRange:firstVideoSampleByteRange:", v56, v9, &buf, v15, v16);

  [(HMIVideoAnalyzerServer *)self _notifyDelegateDidCreateTimelapseFragment:v26];
  ++self->_numDidCreateTimelapseFragments;
LABEL_24:
}

uint64_t __78__HMIVideoAnalyzerServer_assetWriter_didOutputSeparableSegment_segmentReport___block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 mediaType];
  uint64_t v3 = [v2 isEqualToString:*MEMORY[0x263EF9D48]];

  return v3;
}

- (void)assetWriter:(id)a3 didFailWithError:(id)a4
{
}

- (void)decoder:(id)a3 didFailWithError:(id)a4
{
}

- (void)encoder:(id)a3 didFailWithError:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMIVideoAnalyzerServer *)self timelapseEncoder];

  if (v8 == v6)
  {
    id v9 = (void *)MEMORY[0x22A641C70]();
    id v10 = self;
    int v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v12 = HMFGetLogIdentifier();
      int v13 = 138543618;
      double v14 = v12;
      __int16 v15 = 2112;
      id v16 = v7;
      _os_log_impl(&dword_225DC6000, v11, OS_LOG_TYPE_ERROR, "%{public}@Timelapse encoder failed, ignoring: error: %@", (uint8_t *)&v13, 0x16u);
    }
    [(HMIVideoAnalyzerServer *)v10 setTimelapseEncoder:0];
  }
  else
  {
    [(HMIVideoAnalyzerServer *)self _notifyDelegateDidFailWithError:v7];
  }
}

- (void)timerDidFire:(id)a3
{
  id v4 = a3;
  id v5 = [(HMIVideoAnalyzerServer *)self watchdogTimer];

  if (v5 == v4)
  {
    [(HMIVideoAnalyzerServer *)self timeSinceLastFragmentWasReceived];
    if (v6 > 60.0)
    {
      id v7 = (void *)MEMORY[0x263F087E8];
      id v8 = objc_msgSend(NSString, "stringWithFormat:", @"Analyzer has not received fragments from client in %fs", *(void *)&v6);
      id v9 = [v7 hmiErrorWithCode:-1 description:v8];

      [(HMIVideoAnalyzerServer *)self _notifyDelegateDidFailWithError:v9];
    }
  }
}

- (void)_notifyDelegateDidAnalyzeFragmentWithResult:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x22A641C70]();
  double v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    id v9 = [v4 fragment];
    id v10 = [v4 outcome];
    int v11 = [v4 maxConfidenceEvents];
    *(_DWORD *)CMTimeRange buf = 138544130;
    uint64_t v17 = v8;
    __int16 v18 = 2112;
    id v19 = v9;
    __int16 v20 = 2112;
    uint64_t v21 = v10;
    __int16 v22 = 2112;
    Float64 v23 = v11;
    _os_log_impl(&dword_225DC6000, v7, OS_LOG_TYPE_INFO, "%{public}@Generated Fragment: %@ Outcome: %@ Max Confidence Events: %@", buf, 0x2Au);
  }
  id v12 = [(HMIVideoAnalyzerServer *)v6 state];
  +[HMIAnalytics videoAnalyzerDidAnalyzeFragmentWithResult:v4 state:v12];

  int v13 = [(HMIVideoAnalyzer *)v6 delegate];
  if (objc_opt_respondsToSelector()) {
    [v13 analyzer:v6 didAnalyzeFragmentWithResult:v4];
  }
  id v15 = v4;
  double v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v15 count:1];
  [(HMIVideoAnalyzerServer *)v6 _produceResult:sel_analyzer_didAnalyzeFragmentWithResult_ withArguments:v14];
}

- (void)_notifyDelegateDidAnalyzeFrameWithResult:(id)a3
{
  v7[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMIVideoAnalyzer *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v5 analyzer:self didAnalyzeFrameWithResult:v4];
  }
  v7[0] = v4;
  double v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:1];
  [(HMIVideoAnalyzerServer *)self _produceResult:sel_analyzer_didAnalyzeFrameWithResult_ withArguments:v6];
}

- (void)_notifyDelegateDidCreateTimelapseFragment:(id)a3
{
  v8[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMIVideoAnalyzerServer *)self state];
  +[HMIAnalytics videoAnalyzerDidCreateTimelapseFragment:v4 state:v5];

  double v6 = [(HMIVideoAnalyzer *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v6 analyzer:self didCreateTimelapseFragment:v4];
  }
  v8[0] = v4;
  id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:1];
  [(HMIVideoAnalyzerServer *)self _produceResult:sel_analyzer_didCreateTimelapseFragment_ withArguments:v7];
}

- (void)_notifyDelegateDidFailWithError:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x22A641C70]();
  double v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    id v8 = HMFGetLogIdentifier();
    *(_DWORD *)CMTimeRange buf = 138543618;
    __int16 v18 = v8;
    __int16 v19 = 2112;
    id v20 = v4;
    _os_log_impl(&dword_225DC6000, v7, OS_LOG_TYPE_ERROR, "%{public}@Analyzer Failed: %@", buf, 0x16u);
  }
  if ([(HMIVideoAnalyzerServer *)v6 hasFailed])
  {
    id v9 = (void *)MEMORY[0x22A641C70]();
    id v10 = v6;
    int v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v12 = HMFGetLogIdentifier();
      *(_DWORD *)CMTimeRange buf = 138543362;
      __int16 v18 = v12;
      _os_log_impl(&dword_225DC6000, v11, OS_LOG_TYPE_ERROR, "%{public}@Analyzer is already in a failed state.", buf, 0xCu);
    }
  }
  else
  {
    int v13 = [(HMIVideoAnalyzerServer *)v6 state];
    +[HMIAnalytics videoAnalyzerDidTerminateWithError:v4 state:v13];

    [(HMIVideoAnalyzerServer *)v6 setHasFailed:1];
    double v14 = [(HMIVideoAnalyzer *)v6 delegate];
    if (objc_opt_respondsToSelector()) {
      [v14 analyzer:v6 didFailWithError:v4];
    }
    id v16 = v4;
    id v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v16 count:1];
    [(HMIVideoAnalyzerServer *)v6 _produceResult:sel_analyzer_didFailWithError_ withArguments:v15];
  }
}

- (void)_notifyDelegateDidProduceAnalysisStateUpdate:(id)a3
{
  v7[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMIVideoAnalyzer *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v5 analyzer:self didProduceAnalysisStateUpdate:v4];
  }
  v7[0] = v4;
  double v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:1];
  [(HMIVideoAnalyzerServer *)self _produceResult:sel_analyzer_didProduceAnalysisStateUpdate_ withArguments:v6];
}

- (void)_produceResult:(SEL)a3 withArguments:(id)a4
{
  v21[2] = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = [(HMIVideoAnalyzer *)self delegate];
  if ([v7 conformsToProtocol:&unk_26D9C1278]) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }
  id v9 = v8;

  if (objc_opt_respondsToSelector())
  {
    v20[0] = @"selector";
    id v10 = NSStringFromSelector(a3);
    v20[1] = @"arguments";
    v21[0] = v10;
    v21[1] = v6;
    int v11 = [NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:2];

    id v12 = (void *)MEMORY[0x22A641C70]();
    int v13 = self;
    double v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      id v15 = HMFGetLogIdentifier();
      int v16 = 138543618;
      uint64_t v17 = v15;
      __int16 v18 = 2112;
      __int16 v19 = v11;
      _os_log_impl(&dword_225DC6000, v14, OS_LOG_TYPE_DEBUG, "%{public}@Sending Result: %@", (uint8_t *)&v16, 0x16u);
    }
    [v9 analyzer:v13 didProduceResult:v11];
  }
}

- (id)state
{
  $95D729B680665BEAEFA1D6FCA8238556 currentPTS = self->_currentPTS;
  v33 = [(HMIVideoAnalyzerServer *)self dynamicConfigurationForTime:&currentPTS];
  id v32 = [HMIVideoAnalyzerState alloc];
  id v31 = [(HMIVideoAnalyzer *)self configuration];
  uint64_t v30 = [(HMIVideoAnalyzer *)self identifier];
  BOOL v29 = [(HMIVideoAnalyzerServer *)self monitored];
  [(HMIVideoAnalyzerServer *)self analysisFPS];
  double v4 = v3;
  [(HMIVideoAnalyzerServer *)self timeSinceAnalyzerStarted];
  double v6 = v5;
  [(HMIVideoAnalyzerServer *)self timeSinceLastFragmentWasReceived];
  double v8 = v7;
  id v9 = [(HMIVideoAnalyzerServer *)self commandBuffer];
  [v9 fillRatio];
  double v11 = v10;
  id v12 = [(HMIVideoAnalyzerServer *)self commandBuffer];
  uint64_t v28 = [v12 size];
  [(HMIVideoAnalyzerServer *)self delay];
  double v14 = v13;
  [(HMIVideoAnalyzerServer *)self currentPTS];
  int64_t numDecodedSamples = self->_numDecodedSamples;
  int64_t numDidAnalyzeFrames = self->_numDidAnalyzeFrames;
  int64_t numDidAnalyzeFragments = self->_numDidAnalyzeFragments;
  int64_t numDidAnalyzePackages = self->_numDidAnalyzePackages;
  int64_t numDidCreateTimelapseFragments = self->_numDidCreateTimelapseFragments;
  id v20 = [(HMIVideoAnalyzerServer *)self frameAnalyzer];
  [v20 averageAnalysisTime];
  double v22 = v21;
  BOOL v23 = [(HMIVideoAnalyzerServer *)self encode];
  uint64_t v24 = [(HMIVideoAnalyzerServer *)self encoder];
  BYTE1(v27) = v24 != 0;
  LOBYTE(v27) = v23;
  Float64 v25 = -[HMIVideoAnalyzerState initWithConfiguration:dynamicConfiguration:identifier:monitored:analysisFPS:timeSinceAnalyzerStarted:timeSinceLastFragmentWasReceived:bufferFillRatio:bufferSize:delay:currentPTS:numDecodedSamples:numDidAnalyzeFrames:numDidAnalyzeFragments:numDidAnalyzePackages:numDidCreateTimelapseFragments:averageAnalysisTime:encode:encoder:](v32, "initWithConfiguration:dynamicConfiguration:identifier:monitored:analysisFPS:timeSinceAnalyzerStarted:timeSinceLastFragmentWasReceived:bufferFillRatio:bufferSize:delay:currentPTS:numDecodedSamples:numDidAnalyzeFrames:numDidAnalyzeFragments:numDidAnalyzePackages:numDidCreateTimelapseFragments:averageAnalysisTime:encode:encoder:", v31, v33, v30, v29, v28, v34, v4, v6, v8, v11, v14, v22, numDecodedSamples, numDidAnalyzeFrames, numDidAnalyzeFragments,
          numDidAnalyzePackages,
          numDidCreateTimelapseFragments,
          v27);

  return v25;
}

- (double)timeSinceAnalyzerStarted
{
  id v2 = [(HMIVideoAnalyzerServer *)self startDate];
  [v2 timeIntervalSinceNow];
  double v4 = -v3;

  return v4;
}

- (double)timeSinceLastFragmentWasReceived
{
  id v2 = [(HMIVideoAnalyzerServer *)self lastFragmentReceivedDate];
  [v2 timeIntervalSinceNow];
  double v4 = -v3;

  return v4;
}

- (double)delay
{
  id v2 = [(HMIVideoAnalyzerServer *)self commandBuffer];
  [v2 delay];
  double v4 = v3;

  return v4;
}

- (void)setAnalysisFPS:(double)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (self->_analysisFPS != a3)
  {
    double v5 = (void *)MEMORY[0x22A641C70]();
    double v6 = self;
    double v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      double v8 = HMFGetLogIdentifier();
      double analysisFPS = self->_analysisFPS;
      int v11 = 138543874;
      id v12 = v8;
      __int16 v13 = 2048;
      double v14 = analysisFPS;
      __int16 v15 = 2048;
      double v16 = a3;
      _os_log_impl(&dword_225DC6000, v7, OS_LOG_TYPE_INFO, "%{public}@analysisFPS changing from: %f to: %f", (uint8_t *)&v11, 0x20u);
    }
  }
  self->_double analysisFPS = a3;
  float v10 = [(HMIVideoAnalyzerServer *)self frameSelector];
  [v10 setSampleRate:a3 * 3.0];
}

- (unint64_t)status
{
  if ([(HMIVideoAnalyzerServer *)self hasFailed]) {
    return 3;
  }
  if ([(HMIVideoAnalyzerServer *)self isCancelled]) {
    return 2;
  }
  double v4 = [(HMIVideoAnalyzerServer *)self commandBuffer];
  int v5 = [v4 isEmpty];

  return v5 ^ 1u;
}

- (BOOL)monitored
{
  return self->_monitored;
}

- (void)setMonitored:(BOOL)a3
{
  self->_monitored = a3;
}

- (BOOL)encode
{
  return self->_encode;
}

- (void)setEncode:(BOOL)a3
{
  self->_encode = a3;
}

- (double)analysisFPS
{
  return self->_analysisFPS;
}

- (OS_dispatch_queue)inputQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 144, 1);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 152, 1);
}

- (OS_dispatch_queue)encoderQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 160, 1);
}

- (opaqueCMFormatDescription)inputVideoFormat
{
  return self->_inputVideoFormat;
}

- (void)setInputVideoFormat:(opaqueCMFormatDescription *)a3
{
  self->_inputVideoFormat = a3;
}

- (opaqueCMFormatDescription)inputAudioFormat
{
  return self->_inputAudioFormat;
}

- (void)setInputAudioFormat:(opaqueCMFormatDescription *)a3
{
  self->_inputAudioFormat = a3;
}

- (opaqueCMFormatDescription)timelapseOutputVideoFormat
{
  return self->_timelapseOutputVideoFormat;
}

- (void)setTimelapseOutputVideoFormat:(opaqueCMFormatDescription *)a3
{
  self->_timelapseOutputVideoFormat = a3;
}

- (HMFTimer)watchdogTimer
{
  return (HMFTimer *)objc_getProperty(self, a2, 192, 1);
}

- (HMIVideoCommandBuffer)commandBuffer
{
  return (HMIVideoCommandBuffer *)objc_getProperty(self, a2, 200, 1);
}

- (HMIVideoDecoder)decoder
{
  return (HMIVideoDecoder *)objc_getProperty(self, a2, 208, 1);
}

- (HMIVideoFrameSampler)frameThumbnailSampler
{
  return (HMIVideoFrameSampler *)objc_getProperty(self, a2, 216, 1);
}

- (HMIVideoFrameSampler)frameTimelapseSampler
{
  return (HMIVideoFrameSampler *)objc_getProperty(self, a2, 224, 1);
}

- (HMIVideoEncoder)encoder
{
  return (HMIVideoEncoder *)objc_getProperty(self, a2, 232, 1);
}

- (void)setEncoder:(id)a3
{
}

- (HMIVideoEncoder)timelapseEncoder
{
  return (HMIVideoEncoder *)objc_getProperty(self, a2, 240, 1);
}

- (void)setTimelapseEncoder:(id)a3
{
}

- (HMIVideoFrameSelector)frameSelector
{
  return (HMIVideoFrameSelector *)objc_getProperty(self, a2, 248, 1);
}

- (HMIVideoFrameTracker)frameTracker
{
  return (HMIVideoFrameTracker *)objc_getProperty(self, a2, 256, 1);
}

- (HMIVideoFrameAnalyzer)frameAnalyzer
{
  return (HMIVideoFrameAnalyzer *)objc_getProperty(self, a2, 264, 1);
}

- (HMIVideoAssetWriter)assetWriter
{
  return (HMIVideoAssetWriter *)objc_getProperty(self, a2, 272, 1);
}

- (void)setAssetWriter:(id)a3
{
}

- (HMIVideoAssetWriter)timelapseAssetWriter
{
  return (HMIVideoAssetWriter *)objc_getProperty(self, a2, 280, 1);
}

- (void)setTimelapseAssetWriter:(id)a3
{
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)currentPTS
{
  objc_copyStruct(retstr, &self->_currentPTS, 24, 1, 0);
  return result;
}

- (void)setCurrentPTS:(id *)a3
{
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)currentDTS
{
  objc_copyStruct(retstr, &self->_currentDTS, 24, 1, 0);
  return result;
}

- (void)setCurrentDTS:(id *)a3
{
}

- (HMIVideoEventBuffer)frameAnalyzerFrameResultBuffer
{
  return (HMIVideoEventBuffer *)objc_getProperty(self, a2, 288, 1);
}

- (HMIVideoEventBuffer)thumbnailBuffer
{
  return (HMIVideoEventBuffer *)objc_getProperty(self, a2, 296, 1);
}

- (NSData)initializationSegment
{
  return (NSData *)objc_getProperty(self, a2, 304, 1);
}

- (void)setInitializationSegment:(id)a3
{
}

- (NSData)timelapseInitializationSegment
{
  return (NSData *)objc_getProperty(self, a2, 312, 1);
}

- (void)setTimelapseInitializationSegment:(id)a3
{
}

- (HMIVideoEventBuffer)dynamicConfigurationBuffer
{
  return (HMIVideoEventBuffer *)objc_getProperty(self, a2, 320, 1);
}

- (HMIVideoTemporalEventFilter)temporalEventFilter
{
  return (HMIVideoTemporalEventFilter *)objc_getProperty(self, a2, 328, 1);
}

- (HMIVideoTimeline)timeline
{
  return (HMIVideoTimeline *)objc_getProperty(self, a2, 336, 1);
}

- (NSDate)startDate
{
  return (NSDate *)objc_getProperty(self, a2, 344, 1);
}

- (NSDate)lastFragmentReceivedDate
{
  return (NSDate *)objc_getProperty(self, a2, 352, 1);
}

- (void)setLastFragmentReceivedDate:(id)a3
{
}

- (BOOL)hasFailed
{
  return self->_hasFailed;
}

- (void)setHasFailed:(BOOL)a3
{
  self->_hasFailed = a3;
}

- (BOOL)isCancelled
{
  return self->_cancelled;
}

- (void)setCancelled:(BOOL)a3
{
  self->_cancelled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastFragmentReceivedDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_timeline, 0);
  objc_storeStrong((id *)&self->_temporalEventFilter, 0);
  objc_storeStrong((id *)&self->_dynamicConfigurationBuffer, 0);
  objc_storeStrong((id *)&self->_timelapseInitializationSegment, 0);
  objc_storeStrong((id *)&self->_initializationSegment, 0);
  objc_storeStrong((id *)&self->_thumbnailBuffer, 0);
  objc_storeStrong((id *)&self->_frameAnalyzerFrameResultBuffer, 0);
  objc_storeStrong((id *)&self->_timelapseAssetWriter, 0);
  objc_storeStrong((id *)&self->_assetWriter, 0);
  objc_storeStrong((id *)&self->_frameAnalyzer, 0);
  objc_storeStrong((id *)&self->_frameTracker, 0);
  objc_storeStrong((id *)&self->_frameSelector, 0);
  objc_storeStrong((id *)&self->_timelapseEncoder, 0);
  objc_storeStrong((id *)&self->_encoder, 0);
  objc_storeStrong((id *)&self->_frameTimelapseSampler, 0);
  objc_storeStrong((id *)&self->_frameThumbnailSampler, 0);
  objc_storeStrong((id *)&self->_decoder, 0);
  objc_storeStrong((id *)&self->_commandBuffer, 0);
  objc_storeStrong((id *)&self->_watchdogTimer, 0);
  objc_storeStrong((id *)&self->_encoderQueue, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_inputQueue, 0);
}

@end