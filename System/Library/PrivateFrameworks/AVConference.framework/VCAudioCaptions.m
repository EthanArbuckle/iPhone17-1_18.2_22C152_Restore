@interface VCAudioCaptions
+ (BOOL)captionsSupported;
+ (BOOL)captionsSupportedWithErrorCode:(int64_t *)a3;
+ (BOOL)shouldAllocateNewAllocator:(void *)a3 streamDesc:(const AudioStreamBasicDescription *)a4 referenceStreamDesc:(const AudioStreamBasicDescription *)a5;
- (BOOL)analyzerSetupWithError:(id *)a3;
- (BOOL)captionsDebugDumpEnabled;
- (BOOL)configureAnalyzerOptions;
- (BOOL)createAudioConverterWithInputFormat:(const AudioStreamBasicDescription *)a3 outputFormat:(const AudioStreamBasicDescription *)a4 converter:(OpaqueAudioConverter *)a5;
- (BOOL)createRecognizer:(id *)a3;
- (BOOL)enabled;
- (BOOL)handleStateLoadedError:(id *)a3;
- (BOOL)idleStateToState:(int)a3 withReason:(int)a4 error:(id *)a5;
- (BOOL)loadedStateToState:(int)a3 withReason:(int)a4 error:(id *)a5;
- (BOOL)reallocCopyBufferAllocatorWithFormat:(const AudioStreamBasicDescription *)a3;
- (BOOL)recognizerBufferSetupWithError:(id *)a3;
- (BOOL)remoteCanDisplay;
- (BOOL)runningStateToState:(int)a3 withReason:(int)a4 error:(id *)a5;
- (BOOL)shouldPushSamplesToAnalyzer;
- (BOOL)shouldPushSamplesToRecognizer;
- (BOOL)stoppingStateToState:(int)a3 withReason:(int)a4 error:(id *)a5;
- (BOOL)transitionToState:(int)a3 withReason:(int)a4 error:(id *)a5;
- (NSLocale)locale;
- (NSSet)localLanguages;
- (NSSet)remoteLanguages;
- (NSString)taskIdentifier;
- (VCAudioCaptions)initWithDelegate:(id)a3 isLocal:(BOOL)a4 taskIdentifier:(id)a5 reportingAgent:(opaqueRTCReporting *)a6;
- (VCAudioCaptionsDelegate)delegate;
- (id)newPCMSampleBufferWithSamples:(char *)a3 numSamples:(int)a4;
- (id)taskInfoForTask:(id)a3;
- (opaqueCMSampleBuffer)convertSamples:(char *)a3 numSamples:(int)a4;
- (opaqueCMSampleBuffer)createSampleBufferWithFormat:(const AudioStreamBasicDescription *)a3 samples:(char *)a4 numSamples:(int)a5;
- (void)analyzerTeardown;
- (void)callCompletionHandler:(id)a3 withResult:(BOOL)a4;
- (void)configureAnalyzerOptions;
- (void)dealloc;
- (void)destroyAnalyzer;
- (void)destroyRecognizer;
- (void)dumpCaptionsIfNeededForCaptionsTranscription:(id)a3 final:(BOOL)a4;
- (void)dumpCaptionsIfNeededForTranscription:(id)a3 final:(BOOL)a4;
- (void)enableCaptions:(BOOL)a3;
- (void)gatherRealtimeStats:(__CFDictionary *)a3;
- (void)handleStateStopping;
- (void)packageAndSendTranscribedString:(id)a3 withTask:(id)a4 final:(BOOL)a5;
- (void)packageAndSendTranscriberResult:(id)a3 withTask:(id)a4 final:(BOOL)a5;
- (void)prewarmCaptions;
- (void)pushAudioSamples:(opaqueVCAudioBufferList *)a3;
- (void)pushSamplesToAnalyzer:(char *)a3 numSamples:(int)a4 hostTime:(double)a5;
- (void)pushSamplesToRecognizer:(char *)a3 numSamples:(int)a4 hostTime:(double)a5;
- (void)recognizerBufferTeardown;
- (void)recordAudioSampleMetrics;
- (void)setDelegate:(id)a3;
- (void)setLocalLanguages:(id)a3;
- (void)setLocale:(id)a3;
- (void)setRemoteCanDisplay:(BOOL)a3;
- (void)setRemoteLanguages:(id)a3;
- (void)setTaskIdentifier:(id)a3;
- (void)speechAnalyzer:(id)a3 didProduceEndpointingResult:(id)a4;
- (void)speechAnalyzer:(id)a3 didProduceTranscriberResult:(id)a4;
- (void)speechAnalyzer:(id)a3 didStopEndpointingWithError:(id)a4;
- (void)speechAnalyzer:(id)a3 didStopTranscriptionWithError:(id)a4;
- (void)speechAnalyzerDidProduceAllTranscriberResults:(id)a3;
- (void)speechRecognitionTask:(id)a3 didFinishRecognition:(id)a4;
- (void)speechRecognitionTask:(id)a3 didFinishSuccessfully:(BOOL)a4;
- (void)speechRecognitionTask:(id)a3 didHypothesizeTranscription:(id)a4;
- (void)speechRecognitionTaskWasCancelled:(id)a3;
- (void)speechRecognizer:(id)a3 availabilityDidChange:(BOOL)a4;
- (void)start:(const AudioStreamBasicDescription *)a3 forToken:(int64_t)a4 withCompletionHandler:(id)a5;
- (void)stop;
- (void)stopWithCompletionHandler:(id)a3;
@end

@implementation VCAudioCaptions

- (VCAudioCaptions)initWithDelegate:(id)a3 isLocal:(BOOL)a4 taskIdentifier:(id)a5 reportingAgent:(opaqueRTCReporting *)a6
{
  BOOL v8 = a4;
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  v48.receiver = self;
  v48.super_class = (Class)VCAudioCaptions;
  v10 = [(VCAudioCaptions *)&v48 init];
  v11 = v10;
  if (!v10) {
    return v11;
  }
  if (!a3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCAudioCaptions initWithDelegate:isLocal:taskIdentifier:reportingAgent:]();
      }
    }
    goto LABEL_57;
  }
  v10->_currentUtteranceNumber = 0;
  v10->_recognizerState = 0;
  v10->_copyBufferAllocator = 0;
  v10->_pcmCopyBufferAllocator = 0;
  v10->_taskIdentifier = (NSString *)a5;
  v11->_BOOL useAnalyzerSpeechAPI = VCFeatureFlagManager_UseAnalyzerSpeechAPI();
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v12 = VRTraceErrorLogLevelToCSTR();
    v13 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      BOOL useAnalyzerSpeechAPI = v11->_useAnalyzerSpeechAPI;
      *(_DWORD *)buf = 136316674;
      uint64_t v50 = v12;
      __int16 v51 = 2080;
      v52 = "-[VCAudioCaptions initWithDelegate:isLocal:taskIdentifier:reportingAgent:]";
      __int16 v53 = 1024;
      int v54 = 163;
      __int16 v55 = 1024;
      *(_DWORD *)v56 = v8;
      *(_WORD *)&v56[4] = 2112;
      *(void *)&v56[6] = a5;
      *(_WORD *)&v56[14] = 1024;
      *(_DWORD *)&v56[16] = useAnalyzerSpeechAPI;
      *(_WORD *)v57 = 2048;
      *(void *)&v57[2] = a6;
      _os_log_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Init VCAudioCaptions: isLocal=%{BOOL}d, taskIdentifier=%@, useAnalyzerSpeechAPI=%{BOOL}d, reportingAgent=%p", buf, 0x3Cu);
    }
  }
  v11->_audioConverter = 0;
  objc_storeWeak((id *)&v11->_delegate, a3);
  v11->_isLocal = v8;
  CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(47);
  dispatch_queue_t v16 = dispatch_queue_create_with_target_V2("com.apple.AVConference.VCAudioCaptions.captionsQueue", 0, CustomRootQueue);
  v11->_captionsQueue = (OS_dispatch_queue *)v16;
  if (!v16)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCAudioCaptions initWithDelegate:isLocal:taskIdentifier:reportingAgent:]();
      }
    }
    goto LABEL_57;
  }
  if (a6) {
    v17 = (opaqueRTCReporting *)CFRetain(a6);
  }
  else {
    v17 = 0;
  }
  v11->_reportingAgent = v17;
  reportingRegisterPeriodicTaskWeak();
  dispatch_queue_t v18 = dispatch_queue_create_with_target_V2("com.apple.AVConference.VCAudioCaptions.delegateQueue", 0, CustomRootQueue);
  v11->_delegateQueue = (OS_dispatch_queue *)v18;
  if (!v18)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCAudioCaptions initWithDelegate:isLocal:taskIdentifier:reportingAgent:]();
      }
    }
    goto LABEL_57;
  }
  dispatch_semaphore_t v19 = dispatch_semaphore_create(1);
  v11->_teardownSemaphore = (OS_dispatch_semaphore *)v19;
  if (!v19)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCAudioCaptions initWithDelegate:isLocal:taskIdentifier:reportingAgent:].cold.4();
      }
    }
    goto LABEL_57;
  }
  v20 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v11->_captionTasks = v20;
  if (!v20)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCAudioCaptions initWithDelegate:isLocal:taskIdentifier:reportingAgent:].cold.5();
      }
    }
    goto LABEL_57;
  }
  BOOL v21 = [(VCAudioCaptions *)v11 captionsDebugDumpEnabled];
  v11->_isCaptionsDebugDumpEnabled = v21;
  if (v21) {
    v11->_logCaptionsDump = VRLogfileAlloc(0, [(id)objc_msgSend(NSString stringWithFormat:@"session_%@", objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F29128], "UUID"), "UUIDString")), "UTF8String"], (uint64_t)"captions_transcriptions", (uint64_t)".txt", "com.apple.AVConference.VCAudioCaptions.captionsQueue", 9);
  }
  dispatch_semaphore_t v22 = dispatch_semaphore_create(0);
  v11->_analyzerAllResultsSemaphore = (OS_dispatch_semaphore *)v22;
  if (!v22)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCAudioCaptions initWithDelegate:isLocal:taskIdentifier:reportingAgent:].cold.6();
      }
    }
    goto LABEL_57;
  }
  uint64_t v23 = [objc_alloc(MEMORY[0x1E4F153A0]) initWithCommonFormat:3 sampleRate:1 channels:0 interleaved:16000.0];
  v11->_analyzerAudioFormat = (AVAudioFormat *)v23;
  int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  if (!v23)
  {
    if (ErrorLogLevelForModule >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCAudioCaptions initWithDelegate:isLocal:taskIdentifier:reportingAgent:].cold.7();
      }
    }
    goto LABEL_57;
  }
  if (ErrorLogLevelForModule >= 7)
  {
    uint64_t v25 = VRTraceErrorLogLevelToCSTR();
    v26 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v27 = *(void *)[(AVAudioFormat *)v11->_analyzerAudioFormat streamDescription];
      v28 = FourccToCStr((int)[(AVAudioFormat *)v11->_analyzerAudioFormat streamDescription][8]);
      int v29 = (int)[(AVAudioFormat *)v11->_analyzerAudioFormat streamDescription][16];
      int v30 = (int)[(AVAudioFormat *)v11->_analyzerAudioFormat streamDescription][20];
      int v31 = (int)[(AVAudioFormat *)v11->_analyzerAudioFormat streamDescription][24];
      int v32 = (int)[(AVAudioFormat *)v11->_analyzerAudioFormat streamDescription][28];
      int v33 = (int)[(AVAudioFormat *)v11->_analyzerAudioFormat streamDescription][32];
      *(_DWORD *)buf = 136317442;
      uint64_t v50 = v25;
      __int16 v51 = 2080;
      v52 = "-[VCAudioCaptions initWithDelegate:isLocal:taskIdentifier:reportingAgent:]";
      __int16 v53 = 1024;
      int v54 = 204;
      __int16 v55 = 2048;
      *(void *)v56 = v27;
      *(_WORD *)&v56[8] = 2080;
      *(void *)&v56[10] = v28;
      *(_WORD *)&v56[18] = 1024;
      *(_DWORD *)v57 = v29;
      *(_WORD *)&v57[4] = 1024;
      *(_DWORD *)&v57[6] = v30;
      __int16 v58 = 1024;
      int v59 = v31;
      __int16 v60 = 1024;
      int v61 = v32;
      __int16 v62 = 1024;
      int v63 = v33;
      _os_log_impl(&dword_1E1EA4000, v26, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Analyzer preferred format: samplerate=%f formatid=%s bytePerPacket=%d framesPerPacket=%d bytesPerFrame=%d channelsPerFrame=%d bitsPerChannel=%d", buf, 0x4Eu);
    }
  }
  uint64_t v34 = [(AVAudioFormat *)v11->_analyzerAudioFormat streamDescription];
  uint64_t v35 = *(void *)(v34 + 32);
  long long v36 = *(_OWORD *)(v34 + 16);
  *(_OWORD *)&v11->_captionsFormat.double mSampleRate = *(_OWORD *)v34;
  *(_OWORD *)&v11->_captionsFormat.unsigned int mBytesPerPacket = v36;
  *(void *)&v11->_captionsFormat.mBitsPerChannel = v35;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v38 = VRTraceErrorLogLevelToCSTR();
    v39 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      double mSampleRate = v11->_captionsFormat.mSampleRate;
      unsigned int mBytesPerPacket = v11->_captionsFormat.mBytesPerPacket;
      uint64_t v42 = 274877907 * (int)(mSampleRate * (double)mBytesPerPacket * 20.0);
      *(_DWORD *)buf = 136316418;
      uint64_t v50 = v38;
      __int16 v51 = 2080;
      v52 = "-[VCAudioCaptions initWithDelegate:isLocal:taskIdentifier:reportingAgent:]";
      __int16 v53 = 1024;
      int v54 = 208;
      __int16 v55 = 1024;
      *(_DWORD *)v56 = (int)mSampleRate;
      *(_WORD *)&v56[4] = 1024;
      *(_DWORD *)&v56[6] = mBytesPerPacket;
      *(_WORD *)&v56[10] = 1024;
      *(_DWORD *)&v56[12] = (v42 >> 38) + ((unint64_t)v42 >> 63);
      _os_log_impl(&dword_1E1EA4000, v39, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Create PCM copy buffer allocator: sampleRate=%d, bytesPerPacket=%d, capacity=%d", buf, 0x2Eu);
    }
  }
  LODWORD(v37) = v11->_captionsFormat.mBytesPerPacket;
  CFAllocatorRef v43 = VCAudioBufferAllocatorCreate((const __CFAllocator *)*MEMORY[0x1E4F1CF80], (unint64_t)(v11->_captionsFormat.mSampleRate * (double)v37 * 20.0 / 1000.0), 2u);
  v11->_pcmAudioBufferAllocator = v43;
  if (!v43)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCAudioCaptions initWithDelegate:isLocal:taskIdentifier:reportingAgent:].cold.8();
      }
    }
    goto LABEL_57;
  }
  v44 = VCDispatchQueue_GetCustomRootQueue(37);
  v45 = dispatch_queue_create_with_target_V2("com.apple.AVConference.VCAudioCaptions.serialQueue", 0, v44);
  v46 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
  v11->_operationQueue = v46;
  if (!v46)
  {
    if (v45) {
      dispatch_release(v45);
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCAudioCaptions initWithDelegate:isLocal:taskIdentifier:reportingAgent:].cold.9();
      }
    }
LABEL_57:

    return 0;
  }
  [(NSOperationQueue *)v46 setUnderlyingQueue:v45];
  if (v45) {
    dispatch_release(v45);
  }
  return v11;
}

void __74__VCAudioCaptions_initWithDelegate_isLocal_taskIdentifier_reportingAgent___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  block[6] = *MEMORY[0x1E4F143B8];
  v3 = *(NSObject **)(a2 + 144);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__VCAudioCaptions_initWithDelegate_isLocal_taskIdentifier_reportingAgent___block_invoke_2;
  block[3] = &__block_descriptor_48_e5_v8__0l;
  block[4] = a2;
  block[5] = a3;
  dispatch_sync(v3, block);
}

uint64_t __74__VCAudioCaptions_initWithDelegate_isLocal_taskIdentifier_reportingAgent___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) gatherRealtimeStats:*(void *)(a1 + 40)];
}

- (void)dealloc
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  v4 = (os_log_t *)MEMORY[0x1E4F47A50];
  if (ErrorLogLevelForModule >= 7)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v21 = v5;
      __int16 v22 = 2080;
      uint64_t v23 = "-[VCAudioCaptions dealloc]";
      __int16 v24 = 1024;
      int v25 = 229;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Tearing down captions", buf, 0x1Cu);
    }
  }
  if (self->_teardownSemaphore)
  {
    dispatch_time_t v7 = dispatch_time(0, 5000000000);
    dispatch_semaphore_wait((dispatch_semaphore_t)self->_teardownSemaphore, v7);
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_teardownSemaphore);
  }
  uint64_t v19 = 0;
  [(VCAudioCaptions *)self transitionToState:0 withReason:2 error:&v19];

  captionsQueue = self->_captionsQueue;
  if (captionsQueue) {
    dispatch_release(captionsQueue);
  }
  delegateQueue = self->_delegateQueue;
  if (delegateQueue) {
    dispatch_release(delegateQueue);
  }
  objc_storeWeak((id *)&self->_delegate, 0);
  _VCAudioCaptions_DestroyCopyBufferAllocator((uint64_t)self);
  audioBufferAllocator = self->_audioBufferAllocator;
  if (audioBufferAllocator)
  {
    CFRelease(audioBufferAllocator);
    self->_audioBufferAllocator = 0;
  }
  pcmCopyBufferAllocator = self->_pcmCopyBufferAllocator;
  if (pcmCopyBufferAllocator)
  {
    CFRelease(pcmCopyBufferAllocator);
    self->_pcmCopyBufferAllocator = 0;
  }
  pcmAudioBufferAllocator = self->_pcmAudioBufferAllocator;
  if (pcmAudioBufferAllocator)
  {
    CFRelease(pcmAudioBufferAllocator);
    self->_pcmAudioBufferAllocator = 0;
  }
  teardownSemaphore = self->_teardownSemaphore;
  if (teardownSemaphore) {
    dispatch_release(teardownSemaphore);
  }
  [(NSMutableArray *)self->_captionTasks removeAllObjects];

  analyzerAllResultsSemaphore = self->_analyzerAllResultsSemaphore;
  if (analyzerAllResultsSemaphore) {
    dispatch_release(analyzerAllResultsSemaphore);
  }

  VRLogfileFree((uint64_t *)&self->_logCaptionsDump);
  reportingUnregisterPeriodicTask();
  reportingAgent = self->_reportingAgent;
  if (reportingAgent) {
    CFRelease(reportingAgent);
  }
  v18.receiver = self;
  v18.super_class = (Class)VCAudioCaptions;
  [(VCAudioCaptions *)&v18 dealloc];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v16 = VRTraceErrorLogLevelToCSTR();
    v17 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v21 = v16;
      __int16 v22 = 2080;
      uint64_t v23 = "-[VCAudioCaptions dealloc]";
      __int16 v24 = 1024;
      int v25 = 271;
      _os_log_impl(&dword_1E1EA4000, v17, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Captions done", buf, 0x1Cu);
    }
  }
}

- (void)setDelegate:(id)a3
{
}

- (VCAudioCaptionsDelegate)delegate
{
  return (VCAudioCaptionsDelegate *)objc_loadWeak((id *)&self->_delegate);
}

- (void)gatherRealtimeStats:(__CFDictionary *)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  if (a3 && self->_lastCaptionsEnabledTime != 0.0)
  {
    double v5 = micro();
    double v6 = v5 - self->_lastCaptionsEnabledTime;
    self->_double captionsEnabledDuration = v6;
    self->_lastCaptionsEnabledTime = v5;
    int v7 = llround(self->_captionedAudioDuration / v6 * 100.0);
    int captionTaskCount = v7;
    CFAllocatorRef v8 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    CFNumberRef v9 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], kCFNumberIntType, &captionTaskCount);
    CFDictionaryAddValue(a3, @"ACFCR", v9);
    CFRelease(v9);
    int captionTaskCount = self->_captionTaskCount;
    CFNumberRef v10 = CFNumberCreate(v8, kCFNumberIntType, &captionTaskCount);
    CFDictionaryAddValue(a3, @"ACTC", v10);
    CFRelease(v10);
    unsigned int v11 = llround(self->_captionsUtteranceDuration * 1000.0);
    int captionTaskCount = v11;
    CFNumberRef v12 = CFNumberCreate(v8, kCFNumberIntType, &captionTaskCount);
    CFDictionaryAddValue(a3, @"ACUL", v12);
    CFRelease(v12);
    int captionTaskCount = self->_isLocal;
    CFNumberRef v13 = CFNumberCreate(v8, kCFNumberIntType, &captionTaskCount);
    CFDictionaryAddValue(a3, @"ACTX", v13);
    CFRelease(v13);
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v14 = VRTraceErrorLogLevelToCSTR();
      v15 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        unint64_t captioningRequestCount = self->_captioningRequestCount;
        double captionsEnabledDuration = self->_captionsEnabledDuration;
        double captionedAudioDuration = self->_captionedAudioDuration;
        unsigned int v19 = self->_captionTaskCount;
        BOOL isLocal = self->_isLocal;
        int captionTaskCount = 136317698;
        uint64_t v22 = v14;
        __int16 v23 = 2080;
        __int16 v24 = "-[VCAudioCaptions gatherRealtimeStats:]";
        __int16 v25 = 1024;
        int v26 = 297;
        __int16 v27 = 2048;
        unint64_t v28 = captioningRequestCount;
        __int16 v29 = 2048;
        double v30 = captionsEnabledDuration;
        __int16 v31 = 2048;
        double v32 = captionedAudioDuration;
        __int16 v33 = 2048;
        double v34 = captionedAudioDuration / captionsEnabledDuration;
        __int16 v35 = 1024;
        int v36 = v7;
        __int16 v37 = 1024;
        unsigned int v38 = v19;
        __int16 v39 = 1024;
        int v40 = v11 / v19;
        __int16 v41 = 1024;
        BOOL v42 = isLocal;
        _os_log_impl(&dword_1E1EA4000, v15, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @=@ Health: VCAudioCaptions Reporting Captions RealTime Stats: captioningRequestCount=%lu captionsEnabledDuration=%f captionedAudioDuration=%f captionsRatio=%f (5s * 100)captionsRatio=%d captionTaskCount=%d (movingAverage ms)utteranceDuration=%d isUplink=%d", (uint8_t *)&captionTaskCount, 0x5Cu);
      }
    }
    self->_double captionedAudioDuration = 0.0;
    self->_double captionsEnabledDuration = 0.0;
  }
}

- (BOOL)createAudioConverterWithInputFormat:(const AudioStreamBasicDescription *)a3 outputFormat:(const AudioStreamBasicDescription *)a4 converter:(OpaqueAudioConverter *)a5
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  *a5 = 0;
  if (!memcmp(a4, a3, 0x28uLL))
  {
    LOBYTE(v28) = 1;
    return v28;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v8 = VRTraceErrorLogLevelToCSTR();
    CFNumberRef v9 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v30 = 136315650;
      uint64_t v31 = v8;
      __int16 v32 = 2080;
      __int16 v33 = "-[VCAudioCaptions createAudioConverterWithInputFormat:outputFormat:converter:]";
      __int16 v34 = 1024;
      int v35 = 315;
      _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Creating converter for captions:", (uint8_t *)&v30, 0x1Cu);
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v10 = VRTraceErrorLogLevelToCSTR();
    unsigned int v11 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      Float64 mSampleRate = a3->mSampleRate;
      AudioFormatID mFormatID = a3->mFormatID;
      UInt32 mBytesPerPacket = a3->mBytesPerPacket;
      UInt32 mFramesPerPacket = a3->mFramesPerPacket;
      UInt32 mBytesPerFrame = a3->mBytesPerFrame;
      UInt32 mChannelsPerFrame = a3->mChannelsPerFrame;
      UInt32 mBitsPerChannel = a3->mBitsPerChannel;
      int v30 = 136317442;
      uint64_t v31 = v10;
      __int16 v32 = 2080;
      __int16 v33 = "-[VCAudioCaptions createAudioConverterWithInputFormat:outputFormat:converter:]";
      __int16 v34 = 1024;
      int v35 = 324;
      __int16 v36 = 2048;
      Float64 v37 = mSampleRate;
      __int16 v38 = 1024;
      AudioFormatID v39 = mFormatID;
      __int16 v40 = 1024;
      UInt32 v41 = mBytesPerPacket;
      __int16 v42 = 1024;
      UInt32 v43 = mFramesPerPacket;
      __int16 v44 = 1024;
      UInt32 v45 = mBytesPerFrame;
      __int16 v46 = 1024;
      UInt32 v47 = mChannelsPerFrame;
      __int16 v48 = 1024;
      UInt32 v49 = mBitsPerChannel;
      _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d  InputFormat: samplerate=%f formatid=%x bytePerPacket=%d framesPerPacket=%d bytesPerFrame=%d channelsPerFrame=%d bitsPerChannel=%d", (uint8_t *)&v30, 0x4Au);
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v19 = VRTraceErrorLogLevelToCSTR();
    v20 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      Float64 v21 = a4->mSampleRate;
      AudioFormatID v22 = a4->mFormatID;
      UInt32 v23 = a4->mBytesPerPacket;
      UInt32 v24 = a4->mFramesPerPacket;
      UInt32 v25 = a4->mBytesPerFrame;
      UInt32 v26 = a4->mChannelsPerFrame;
      UInt32 v27 = a4->mBitsPerChannel;
      int v30 = 136317442;
      uint64_t v31 = v19;
      __int16 v32 = 2080;
      __int16 v33 = "-[VCAudioCaptions createAudioConverterWithInputFormat:outputFormat:converter:]";
      __int16 v34 = 1024;
      int v35 = 333;
      __int16 v36 = 2048;
      Float64 v37 = v21;
      __int16 v38 = 1024;
      AudioFormatID v39 = v22;
      __int16 v40 = 1024;
      UInt32 v41 = v23;
      __int16 v42 = 1024;
      UInt32 v43 = v24;
      __int16 v44 = 1024;
      UInt32 v45 = v25;
      __int16 v46 = 1024;
      UInt32 v47 = v26;
      __int16 v48 = 1024;
      UInt32 v49 = v27;
      _os_log_impl(&dword_1E1EA4000, v20, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d  OuputFormat: samplerate=%f formatid=%x bytePerPacket=%d framesPerPacket=%d bytesPerFrame=%d channelsPerFrame=%d bitsPerChannel=%d", (uint8_t *)&v30, 0x4Au);
    }
  }
  if (AudioConverterNew(a3, a4, a5))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
    {
LABEL_15:
      LOBYTE(v28) = 0;
      return v28;
    }
    VRTraceErrorLogLevelToCSTR();
    BOOL v28 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
    if (v28)
    {
      -[VCAudioCaptions createAudioConverterWithInputFormat:outputFormat:converter:]();
      goto LABEL_15;
    }
  }
  else
  {
    int v30 = 2;
    if (AudioConverterSetProperty(*a5, 0x70726D6Du, 4u, &v30))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCAudioCaptions createAudioConverterWithInputFormat:outputFormat:converter:]();
        }
      }
    }
    LOBYTE(v28) = *a5 != 0;
  }
  return v28;
}

- (opaqueCMSampleBuffer)convertSamples:(char *)a3 numSamples:(int)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (!self->_audioConverter) {
    return 0;
  }
  id v7 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  double v8 = self->_captionsFormat.mSampleRate * (double)a4 / self->_inputFormat.mSampleRate;
  UInt32 ioOutputDataPacketSize = v8;
  size_t v9 = self->_captionsFormat.mBytesPerPacket * v8;
  uint64_t v10 = (v9 + 15) & 0x1FFFFFFF0;
  unsigned int v11 = (char *)&inInputDataProcUserData - v10;
  if (v9) {
    memset((char *)&inInputDataProcUserData - v10, 170, self->_captionsFormat.mBytesPerPacket * v8);
  }
  long long v12 = *(_OWORD *)&self->_inputFormat.mBytesPerPacket;
  long long v17 = *(_OWORD *)&self->_inputFormat.mSampleRate;
  outOutputData.mBuffers[0].mData = v11;
  uint64_t v22 = 1;
  *(void *)&outOutputData.mNumberBuffers = 0;
  UInt32 v25 = a3;
  UInt32 v13 = self->_inputFormat.mBytesPerPacket * a4;
  int v23 = 1;
  UInt32 v24 = v13;
  outOutputData.mNumberBuffers = 1;
  outOutputData.mBuffers[0].mNumberChannels = 1;
  outOutputData.mBuffers[0].mDataByteSize = v9;
  long long v18 = v12;
  uint64_t v19 = *(void *)&self->_inputFormat.mBitsPerChannel;
  inInputDataProcUserData = &v22;
  if (AudioConverterFillComplexBuffer(self->_audioConverter, (AudioConverterComplexInputDataProc)captionsAudioConverterCallback, &inInputDataProcUserData, &ioOutputDataPacketSize, &outOutputData, 0))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCAudioCaptions convertSamples:numSamples:]();
      }
    }
    bzero(v11, v9);
  }
  uint64_t v14 = [(VCAudioCaptions *)self createSampleBufferWithFormat:&self->_captionsFormat samples:v11 numSamples:ioOutputDataPacketSize];

  return v14;
}

- (BOOL)handleStateLoadedError:(id *)a3
{
  if (!self->_useAnalyzerSpeechAPI)
  {
    BOOL v6 = [(VCAudioCaptions *)self createRecognizer:a3];
    if (!v6) {
      return v6;
    }
LABEL_6:
    LOBYTE(v6) = 1;
    self->_recognizerState = 1;
    return v6;
  }
  if ([(VCAudioCaptions *)self configureAnalyzerOptions]) {
    goto LABEL_6;
  }
  if (a3)
  {
    id v5 = +[VCSessionErrorUtils VCSessionCaptionsErrorEvent:errorPath:returnCode:](VCSessionErrorUtils, "VCSessionCaptionsErrorEvent:errorPath:returnCode:", 2, objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/Captions/VCAudioCaptions.m", 505), 9);
    LOBYTE(v6) = 0;
    *a3 = v5;
  }
  else
  {
    LOBYTE(v6) = 0;
  }
  return v6;
}

- (BOOL)idleStateToState:(int)a3 withReason:(int)a4 error:(id *)a5
{
  v12[1] = *MEMORY[0x1E4F143B8];
  if ((a3 - 1) >= 2)
  {
    if (!a3) {
      return 1;
    }
    if (a5)
    {
      uint64_t v8 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", *(void *)&a4, "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/Captions/VCAudioCaptions.m", 530);
      uint64_t v10 = 3;
      uint64_t v9 = 7;
      goto LABEL_10;
    }
  }
  else
  {
    v12[0] = 0;
    if (+[VCAudioCaptions captionsSupportedWithErrorCode:](VCAudioCaptions, "captionsSupportedWithErrorCode:", v12, *(void *)&a4))
    {
      return [(VCAudioCaptions *)self handleStateLoadedError:a5];
    }
    if (a5)
    {
      uint64_t v8 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/Captions/VCAudioCaptions.m", 521);
      uint64_t v9 = v12[0];
      uint64_t v10 = 2;
LABEL_10:
      id v11 = +[VCSessionErrorUtils VCSessionCaptionsErrorEvent:v10 errorPath:v8 returnCode:v9];
      BOOL result = 0;
      *a5 = v11;
      return result;
    }
  }
  return 0;
}

- (BOOL)loadedStateToState:(int)a3 withReason:(int)a4 error:(id *)a5
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  switch(a3)
  {
    case 2:
      if (self->_useAnalyzerSpeechAPI)
      {
        if ([(VCAudioCaptions *)self analyzerSetupWithError:a5])
        {
LABEL_8:
          int64_t currentActiveToken = self->_currentActiveToken;
          delegateQueue = self->_delegateQueue;
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __55__VCAudioCaptions_loadedStateToState_withReason_error___block_invoke;
          block[3] = &unk_1E6DB3F58;
          int v14 = a4;
          block[4] = self;
          block[5] = currentActiveToken;
          dispatch_async(delegateQueue, block);
          self->_recognizerState = 2;
          goto LABEL_17;
        }
      }
      else if ([(VCAudioCaptions *)self recognizerBufferSetupWithError:a5])
      {
        goto LABEL_8;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        BOOL v11 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
        if (!v11) {
          return v11;
        }
        -[VCAudioCaptions loadedStateToState:withReason:error:]();
      }
LABEL_15:
      LOBYTE(v11) = 0;
      return v11;
    case 1:
LABEL_17:
      LOBYTE(v11) = 1;
      return v11;
    case 0:
      self->_recognizerState = 0;
      if (self->_useAnalyzerSpeechAPI) {
        [(VCAudioCaptions *)self analyzerTeardown];
      }
      else {
        [(VCAudioCaptions *)self destroyRecognizer];
      }
      goto LABEL_17;
  }
  if (!a5) {
    goto LABEL_15;
  }
  id v10 = +[VCSessionErrorUtils VCSessionCaptionsErrorEvent:errorPath:returnCode:](VCSessionErrorUtils, "VCSessionCaptionsErrorEvent:errorPath:returnCode:", 3, objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", *(void *)&a4, "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/Captions/VCAudioCaptions.m", 562), 7);
  LOBYTE(v11) = 0;
  *a5 = v10;
  return v11;
}

uint64_t __55__VCAudioCaptions_loadedStateToState_withReason_error___block_invoke(uint64_t a1)
{
  v2 = (void *)[*(id *)(a1 + 32) delegate];
  uint64_t v3 = *(unsigned int *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 40);

  return [v2 didStartCaptioningWithReason:v3 streamToken:v4];
}

- (void)handleStateStopping
{
  v5[5] = *MEMORY[0x1E4F143B8];
  if (self->_useAnalyzerSpeechAPI)
  {
    analyzer = self->_analyzer;
    if (analyzer)
    {
      [(SFSpeechAnalyzer *)analyzer finishAudio];
      uint64_t v4 = self->_analyzer;
      v5[0] = MEMORY[0x1E4F143A8];
      v5[1] = 3221225472;
      v5[2] = __38__VCAudioCaptions_handleStateStopping__block_invoke;
      v5[3] = &unk_1E6DB5128;
      v5[4] = self;
      [(SFSpeechAnalyzer *)v4 finalizeAndFinishThroughEndOfInputWithCompletion:v5];
    }
  }
  else
  {
    [(SFSpeechAudioBufferRecognitionRequest *)self->_recognizerRequest endAudio];
    [(SFSpeechRecognitionTask *)self->_recognizerTask finish];
    if (self->_recognizerTask) {
      ++self->_captionTaskCount;
    }
  }
}

void __38__VCAudioCaptions_handleStateStopping__block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v4 = VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        __38__VCAudioCaptions_handleStateStopping__block_invoke_cold_1(v4, a2);
      }
    }
  }
  ++*(_DWORD *)(*(void *)(a1 + 32) + 304);
}

- (BOOL)runningStateToState:(int)a3 withReason:(int)a4 error:(id *)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (a3 < 2) {
    goto LABEL_4;
  }
  if (a3 == 2) {
    return 1;
  }
  if (a3 == 3)
  {
LABEL_4:
    self->_recognizerState = 3;
    [(VCAudioCaptions *)self handleStateStopping];
    $95D729B680665BEAEFA1D6FCA8238556 lastAudioProcessedTime = self->_lastAudioProcessedTime;
    double v6 = CMTimeGetSeconds((CMTime *)&lastAudioProcessedTime) - self->_captionsLastUtteranceStart;
    self->_captionsUtteranceDuration = self->_captionsUtteranceDuration + v6;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v7 = VRTraceErrorLogLevelToCSTR();
      uint64_t v8 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        recognizerTask = self->_recognizerTask;
        unsigned int captionTaskCount = self->_captionTaskCount;
        LODWORD(lastAudioProcessedTime.value) = 136316418;
        *(int64_t *)((char *)&lastAudioProcessedTime.value + 4) = v7;
        LOWORD(lastAudioProcessedTime.flags) = 2080;
        *(void *)((char *)&lastAudioProcessedTime.flags + 2) = "-[VCAudioCaptions runningStateToState:withReason:error:]";
        HIWORD(lastAudioProcessedTime.epoch) = 1024;
        int v13 = 602;
        __int16 v14 = 2048;
        uint64_t v15 = recognizerTask;
        __int16 v16 = 1024;
        unsigned int v17 = captionTaskCount;
        __int16 v18 = 2048;
        double v19 = v6;
        _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Ending Task=%p currentTaskCount=%d utteranceDuration=%f", (uint8_t *)&lastAudioProcessedTime, 0x36u);
      }
    }
    return 1;
  }
  return 0;
}

- (BOOL)stoppingStateToState:(int)a3 withReason:(int)a4 error:(id *)a5
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  BOOL result = 1;
  if (a3 >= 2)
  {
    if (a3 != 3)
    {
      if (a5)
      {
        id v9 = +[VCSessionErrorUtils VCSessionCaptionsErrorEvent:errorPath:returnCode:](VCSessionErrorUtils, "VCSessionCaptionsErrorEvent:errorPath:returnCode:", 3, objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", *(void *)&a4, "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/Captions/VCAudioCaptions.m", 631), 7);
        BOOL result = 0;
        *a5 = v9;
      }
      else
      {
        return 0;
      }
    }
  }
  else
  {
    self->_recognizerState = 1;
    if (self->_useAnalyzerSpeechAPI) {
      [(VCAudioCaptions *)self destroyAnalyzer];
    }
    else {
      [(VCAudioCaptions *)self recognizerBufferTeardown];
    }
    int64_t currentActiveToken = self->_currentActiveToken;
    delegateQueue = self->_delegateQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __57__VCAudioCaptions_stoppingStateToState_withReason_error___block_invoke;
    block[3] = &unk_1E6DB3F58;
    int v13 = a4;
    block[4] = self;
    block[5] = currentActiveToken;
    dispatch_sync(delegateQueue, block);
    return 1;
  }
  return result;
}

uint64_t __57__VCAudioCaptions_stoppingStateToState_withReason_error___block_invoke(uint64_t a1)
{
  v2 = (void *)[*(id *)(a1 + 32) delegate];
  uint64_t v3 = *(unsigned int *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 40);

  return [v2 didStopCaptioningWithReason:v3 streamToken:v4];
}

- (BOOL)transitionToState:(int)a3 withReason:(int)a4 error:(id *)a5
{
  v33[4] = *MEMORY[0x1E4F143B8];
  int v21 = a4;
  int v22 = a3;
  uint64_t v20 = a5;
  BOOL v19 = 1;
  v33[0] = sel_idleStateToState_withReason_error_;
  v33[1] = sel_loadedStateToState_withReason_error_;
  v33[2] = sel_runningStateToState_withReason_error_;
  v33[3] = sel_stoppingStateToState_withReason_error_;
  if (self->_recognizerState != a3)
  {
    uint64_t v7 = (os_log_t *)MEMORY[0x1E4F47A50];
    *(void *)&long long v5 = 136315906;
    long long v18 = v5;
    while (1)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v8 = VRTraceErrorLogLevelToCSTR();
        id v9 = *v7;
        if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
        {
          int recognizerState = self->_recognizerState;
          *(_DWORD *)buf = 136316162;
          uint64_t v24 = v8;
          __int16 v25 = 2080;
          uint64_t v26 = "-[VCAudioCaptions transitionToState:withReason:error:]";
          __int16 v27 = 1024;
          int v28 = 648;
          __int16 v29 = 1024;
          int v30 = recognizerState;
          __int16 v31 = 1024;
          int v32 = v22;
          _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Captions State Transition: From=%d To=%d", buf, 0x28u);
        }
      }
      uint64_t v11 = -[VCAudioCaptions methodSignatureForSelector:](self, "methodSignatureForSelector:", v33[self->_recognizerState], v18);
      long long v12 = (void *)[MEMORY[0x1E4F1CA18] invocationWithMethodSignature:v11];
      [v12 setTarget:self];
      [v12 setSelector:v33[self->_recognizerState]];
      [v12 setArgument:&v22 atIndex:2];
      [v12 setArgument:&v21 atIndex:3];
      [v12 setArgument:&v20 atIndex:4];
      [v12 invoke];
      BOOL v19 = 0;
      [v12 getReturnValue:&v19];
      if (!v19) {
        break;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v13 = VRTraceErrorLogLevelToCSTR();
        uint64_t v14 = *v7;
        if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
        {
          int v15 = self->_recognizerState;
          *(_DWORD *)buf = v18;
          uint64_t v24 = v13;
          __int16 v25 = 2080;
          uint64_t v26 = "-[VCAudioCaptions transitionToState:withReason:error:]";
          __int16 v27 = 1024;
          int v28 = 665;
          __int16 v29 = 1024;
          int v30 = v15;
          _os_log_impl(&dword_1E1EA4000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d New captions state: %d", buf, 0x22u);
        }
      }
      if (self->_recognizerState == v22) {
        return v19;
      }
    }
    if (v20)
    {
      if (*v20)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          uint64_t v16 = VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled(*v7, OS_LOG_TYPE_ERROR)) {
            -[VCAudioCaptions transitionToState:withReason:error:](v16, &v20);
          }
        }
      }
    }
  }
  return v19;
}

- (void)prewarmCaptions
{
  v3[5] = *MEMORY[0x1E4F143B8];
  captionsQueue = self->_captionsQueue;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __34__VCAudioCaptions_prewarmCaptions__block_invoke;
  v3[3] = &unk_1E6DB3DC8;
  v3[4] = self;
  dispatch_async(captionsQueue, v3);
}

void __34__VCAudioCaptions_prewarmCaptions__block_invoke(uint64_t a1)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v1 + 9)
    || *(unsigned char *)(v1 + 8)
    || !+[VCAudioCaptions captionsSupported])
  {
    return;
  }
  int v23 = 0;
  if (objc_opt_class() == *(void *)(a1 + 32))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      goto LABEL_15;
    }
    uint64_t v4 = VRTraceErrorLogLevelToCSTR();
    long long v5 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_15;
    }
    *(_DWORD *)buf = 136315650;
    uint64_t v25 = v4;
    __int16 v26 = 2080;
    __int16 v27 = "-[VCAudioCaptions prewarmCaptions]_block_invoke";
    __int16 v28 = 1024;
    int v29 = 678;
    double v6 = " [%s] %s:%d Prewarming captions";
    uint64_t v7 = v5;
    uint32_t v8 = 28;
    goto LABEL_14;
  }
  if (objc_opt_respondsToSelector()) {
    uint64_t v3 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
  }
  else {
    uint64_t v3 = &stru_1F3D3E450;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v9 = VRTraceErrorLogLevelToCSTR();
    id v10 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 136316162;
      uint64_t v25 = v9;
      __int16 v26 = 2080;
      __int16 v27 = "-[VCAudioCaptions prewarmCaptions]_block_invoke";
      __int16 v28 = 1024;
      int v29 = 678;
      __int16 v30 = 2112;
      __int16 v31 = v3;
      __int16 v32 = 2048;
      uint64_t v33 = v11;
      double v6 = " [%s] %s:%d %@(%p) Prewarming captions";
      uint64_t v7 = v10;
      uint32_t v8 = 48;
LABEL_14:
      _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, v6, buf, v8);
    }
  }
LABEL_15:
  char v12 = [*(id *)(a1 + 32) transitionToState:1 withReason:2 error:&v23];
  if (v23) {
    char v13 = 0;
  }
  else {
    char v13 = v12;
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 9) = v13;
  if (!*(unsigned char *)(*(void *)(a1 + 32) + 9))
  {
    if (objc_opt_class() == *(void *)(a1 + 32))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
        return;
      }
      uint64_t v15 = VRTraceErrorLogLevelToCSTR();
      uint64_t v16 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        return;
      }
      *(_DWORD *)buf = 136315906;
      uint64_t v25 = v15;
      __int16 v26 = 2080;
      __int16 v27 = "-[VCAudioCaptions prewarmCaptions]_block_invoke";
      __int16 v28 = 1024;
      int v29 = 684;
      __int16 v30 = 2112;
      __int16 v31 = v23;
      unsigned int v17 = " [%s] %s:%d Failed to prewarm captions with error=%@";
      long long v18 = v16;
      uint32_t v19 = 38;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v14 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
      }
      else {
        uint64_t v14 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
        return;
      }
      uint64_t v20 = VRTraceErrorLogLevelToCSTR();
      int v21 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        return;
      }
      uint64_t v22 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 136316418;
      uint64_t v25 = v20;
      __int16 v26 = 2080;
      __int16 v27 = "-[VCAudioCaptions prewarmCaptions]_block_invoke";
      __int16 v28 = 1024;
      int v29 = 684;
      __int16 v30 = 2112;
      __int16 v31 = v14;
      __int16 v32 = 2048;
      uint64_t v33 = v22;
      __int16 v34 = 2112;
      int v35 = v23;
      unsigned int v17 = " [%s] %s:%d %@(%p) Failed to prewarm captions with error=%@";
      long long v18 = v21;
      uint32_t v19 = 58;
    }
    _os_log_impl(&dword_1E1EA4000, v18, OS_LOG_TYPE_DEFAULT, v17, buf, v19);
  }
}

- (void)enableCaptions:(BOOL)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  captionsQueue = self->_captionsQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__VCAudioCaptions_enableCaptions___block_invoke;
  block[3] = &unk_1E6DB3DF0;
  BOOL v5 = a3;
  block[4] = self;
  dispatch_async(captionsQueue, block);
}

void __34__VCAudioCaptions_enableCaptions___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v20 = 0;
  int v2 = *(unsigned __int8 *)(a1 + 40);
  int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  if (!v2)
  {
    if (ErrorLogLevelForModule >= 7)
    {
      uint64_t v12 = VRTraceErrorLogLevelToCSTR();
      char v13 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        *(void *)&uint8_t buf[4] = v12;
        __int16 v22 = 2080;
        int v23 = "-[VCAudioCaptions enableCaptions:]_block_invoke_2";
        __int16 v24 = 1024;
        int v25 = 713;
        _os_log_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Disable captions", buf, 0x1Cu);
      }
    }
    uint64_t v14 = *(void *)(a1 + 32);
    if (*(unsigned __int8 *)(v14 + 8) != *(unsigned __int8 *)(a1 + 40))
    {
      int v15 = [(id)v14 transitionToState:0 withReason:2 error:&v20];
      uint64_t v14 = *(void *)(a1 + 32);
      if (v15)
      {
        char v16 = *(unsigned char *)(a1 + 40);
        *(unsigned char *)(v14 + 8) = v16;
        *(unsigned char *)(*(void *)(a1 + 32) + 9) = v16;
        *(double *)(*(void *)(a1 + 32) + 256) = *(double *)(*(void *)(a1 + 32) + 256)
                                                  + micro()
                                                  - *(double *)(*(void *)(a1 + 32) + 264);
        *(void *)(*(void *)(a1 + 32) + 296) = 0;
        *(void *)(*(void *)(a1 + 32) + 256) = 0;
        *(void *)(*(void *)(a1 + 32) + 264) = 0;
        uint64_t v14 = *(void *)(a1 + 32);
      }
    }
    id v10 = *(NSObject **)(v14 + 152);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __34__VCAudioCaptions_enableCaptions___block_invoke_52;
    block[3] = &unk_1E6DB3E40;
    block[4] = v14;
    void block[5] = v20;
    uint64_t v11 = block;
    goto LABEL_20;
  }
  if (ErrorLogLevelForModule >= 7)
  {
    uint64_t v4 = VRTraceErrorLogLevelToCSTR();
    BOOL v5 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = v4;
      __int16 v22 = 2080;
      int v23 = "-[VCAudioCaptions enableCaptions:]_block_invoke";
      __int16 v24 = 1024;
      int v25 = 694;
      _os_log_impl(&dword_1E1EA4000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Enable captions", buf, 0x1Cu);
    }
  }
  *(void *)buf = 0;
  if (+[VCAudioCaptions captionsSupportedWithErrorCode:buf])
  {
    uint64_t v6 = *(void *)(a1 + 32);
    if (*(unsigned __int8 *)(v6 + 8) != *(unsigned __int8 *)(a1 + 40))
    {
      if (*(unsigned char *)(v6 + 10)) {
        uint64_t v7 = 2;
      }
      else {
        uint64_t v7 = 1;
      }
      int v8 = [(id)v6 transitionToState:v7 withReason:2 error:&v20];
      uint64_t v6 = *(void *)(a1 + 32);
      if (v8)
      {
        char v9 = *(unsigned char *)(a1 + 40);
        *(unsigned char *)(v6 + 8) = v9;
        *(unsigned char *)(*(void *)(a1 + 32) + 9) = v9;
        *(double *)(*(void *)(a1 + 32) + 264) = micro();
        uint64_t v6 = *(void *)(a1 + 32);
      }
    }
    id v10 = *(NSObject **)(v6 + 152);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __34__VCAudioCaptions_enableCaptions___block_invoke_50;
    v19[3] = &unk_1E6DB3E40;
    v19[4] = v6;
    v19[5] = v20;
    uint64_t v11 = v19;
LABEL_20:
    dispatch_async(v10, v11);
    return;
  }
  uint64_t v17 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/Captions/VCAudioCaptions.m", 697);
  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "didEnableCaptions:error:", *(unsigned __int8 *)(*(void *)(a1 + 32) + 8), +[VCSessionErrorUtils VCSessionCaptionsErrorEvent:errorPath:returnCode:](VCSessionErrorUtils, "VCSessionCaptionsErrorEvent:errorPath:returnCode:", 1, v17, *(void *)buf));
}

uint64_t __34__VCAudioCaptions_enableCaptions___block_invoke_50(uint64_t a1)
{
  int v2 = (void *)[*(id *)(a1 + 32) delegate];
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 8);

  return [v2 didEnableCaptions:v4 error:v3];
}

uint64_t __34__VCAudioCaptions_enableCaptions___block_invoke_52(uint64_t a1)
{
  int v2 = (void *)[*(id *)(a1 + 32) delegate];
  uint64_t v3 = *(void *)(a1 + 40);
  BOOL v4 = *(unsigned char *)(*(void *)(a1 + 32) + 8) == 0;

  return [v2 didDisableCaptions:v4 error:v3];
}

+ (BOOL)captionsSupportedWithErrorCode:(int64_t *)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (!+[VCHardwareSettings isCaptionsSupported])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      BOOL v5 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (!v5) {
        goto LABEL_10;
      }
      +[VCAudioCaptions captionsSupportedWithErrorCode:]();
    }
    LOBYTE(v5) = 0;
LABEL_10:
    int64_t v4 = 8;
    if (!a3) {
      return v5;
    }
    goto LABEL_17;
  }
  if ((objc_msgSend(+[VCSpeechFrameworkWrapper defaultSpeechFrameworkWrapper](VCSpeechFrameworkWrapper, "defaultSpeechFrameworkWrapper"), "frameworkLoaded") & 1) == 0)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      BOOL v5 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (!v5) {
        goto LABEL_16;
      }
      +[VCAudioCaptions captionsSupportedWithErrorCode:]();
    }
    LOBYTE(v5) = 0;
LABEL_16:
    int64_t v4 = 1;
    if (!a3) {
      return v5;
    }
    goto LABEL_17;
  }
  if (objc_msgSend(+[GKSConnectivitySettings getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:](GKSConnectivitySettings, "getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:", @"vc-captions-enabled", @"audioCaptionsEnabled", &unk_1F3DC30D8, 0), "BOOLValue"))
  {
    int64_t v4 = 0;
    LOBYTE(v5) = 1;
    if (!a3) {
      return v5;
    }
LABEL_17:
    *a3 = v4;
    return v5;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    uint64_t v6 = VRTraceErrorLogLevelToCSTR();
    uint64_t v7 = *MEMORY[0x1E4F47A50];
    BOOL v5 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT);
    if (!v5) {
      goto LABEL_23;
    }
    int v9 = 136315650;
    uint64_t v10 = v6;
    __int16 v11 = 2080;
    uint64_t v12 = "+[VCAudioCaptions captionsSupportedWithErrorCode:]";
    __int16 v13 = 1024;
    int v14 = 749;
    _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Captions disabled via storebag or default", (uint8_t *)&v9, 0x1Cu);
  }
  LOBYTE(v5) = 0;
LABEL_23:
  int64_t v4 = 10;
  if (a3) {
    goto LABEL_17;
  }
  return v5;
}

+ (BOOL)captionsSupported
{
  return [a1 captionsSupportedWithErrorCode:0];
}

- (BOOL)enabled
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  captionsQueue = self->_captionsQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __26__VCAudioCaptions_enabled__block_invoke;
  block[3] = &unk_1E6DB4540;
  block[4] = self;
  void block[5] = &v6;
  dispatch_sync(captionsQueue, block);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __26__VCAudioCaptions_enabled__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 8);
  return result;
}

- (NSLocale)locale
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000;
  char v9 = __Block_byref_object_copy__1;
  uint64_t v10 = __Block_byref_object_dispose__1;
  uint64_t v11 = 0;
  captionsQueue = self->_captionsQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __25__VCAudioCaptions_locale__block_invoke;
  block[3] = &unk_1E6DB4540;
  block[4] = self;
  void block[5] = &v6;
  dispatch_sync(captionsQueue, block);
  char v3 = (NSLocale *)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __25__VCAudioCaptions_locale__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 40) = *(void *)(*(void *)(result + 32) + 216);
  return result;
}

- (void)setLocale:(id)a3
{
  void block[6] = *MEMORY[0x1E4F143B8];
  captionsQueue = self->_captionsQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __29__VCAudioCaptions_setLocale___block_invoke;
  block[3] = &unk_1E6DB3E40;
  block[4] = self;
  void block[5] = a3;
  dispatch_async(captionsQueue, block);
}

uint64_t __29__VCAudioCaptions_setLocale___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v2 = VRTraceErrorLogLevelToCSTR();
    char v3 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      uint64_t v5 = *(void *)(a1 + 40);
      uint64_t v6 = *(void *)(v4 + 216);
      int v7 = *(_DWORD *)(v4 + 60);
      *(_DWORD *)uint64_t v11 = 136316674;
      *(void *)&v11[4] = v2;
      __int16 v12 = 2080;
      __int16 v13 = "-[VCAudioCaptions setLocale:]_block_invoke";
      __int16 v14 = 1024;
      int v15 = 780;
      __int16 v16 = 2048;
      uint64_t v17 = v4;
      __int16 v18 = 2112;
      uint64_t v19 = v5;
      __int16 v20 = 2112;
      uint64_t v21 = v6;
      __int16 v22 = 1024;
      int v23 = v7;
      _os_log_impl(&dword_1E1EA4000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d (%p) setting locale=%@, originalLocale=%@, state=%u", v11, 0x40u);
    }
  }
  uint64_t result = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "localeIdentifier"), "isEqualToString:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 216), "localeIdentifier"));
  if ((result & 1) == 0)
  {
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = *(unsigned int *)(v9 + 60);
    *(void *)uint64_t v11 = 0;
    if (v10)
    {
      [(id)v9 transitionToState:0 withReason:2 error:v11];
      uint64_t v9 = *(void *)(a1 + 32);
    }
    *(void *)(v9 + 216) = *(void *)(a1 + 40);
    return [*(id *)(a1 + 32) transitionToState:v10 withReason:2 error:v11];
  }
  return result;
}

- (void)callCompletionHandler:(id)a3 withResult:(BOOL)a4
{
  if (a3) {
    (*((void (**)(id, BOOL))a3 + 2))(a3, a4);
  }
}

- (BOOL)reallocCopyBufferAllocatorWithFormat:(const AudioStreamBasicDescription *)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  _VCAudioCaptions_DestroyCopyBufferAllocator((uint64_t)self);
  if ((VCMemoryUtil_IsAddressSanitizerEnabled() & 1) != 0
    || VCMemoryUtil_IsProbabilisticGuardMallocEnabled())
  {
    self->_copyBufferAllocator = (__CFAllocator *)*MEMORY[0x1E4F1CF80];
    if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
      goto LABEL_11;
    }
    uint64_t v6 = VRTraceErrorLogLevelToCSTR();
    int v7 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_11;
    }
    int v20 = 136315650;
    uint64_t v21 = v6;
    __int16 v22 = 2080;
    int v23 = "-[VCAudioCaptions reallocCopyBufferAllocatorWithFormat:]";
    __int16 v24 = 1024;
    int v25 = 813;
    uint64_t v8 = " [%s] %s:%d Disable copy buffer pool allocator. Use default allocator instead.";
    uint64_t v9 = v7;
    uint32_t v10 = 28;
LABEL_6:
    _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v20, v10);
LABEL_11:
    LOBYTE(v18) = 1;
    return v18;
  }
  LODWORD(v5) = a3->mBytesPerPacket;
  uint64_t v11 = (unint64_t)(a3->mSampleRate * (double)v5 * 20.0 / 1000.0);
  __int16 v12 = VCAudioBufferAllocatorCreate((const __CFAllocator *)*MEMORY[0x1E4F1CF80], v11, 2u);
  self->_copyBufferAllocator = v12;
  int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  if (v12)
  {
    if (ErrorLogLevelForModule < 7) {
      goto LABEL_11;
    }
    uint64_t v14 = VRTraceErrorLogLevelToCSTR();
    int v15 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_11;
    }
    int mSampleRate = (int)a3->mSampleRate;
    UInt32 mBytesPerPacket = a3->mBytesPerPacket;
    int v20 = 136316418;
    uint64_t v21 = v14;
    __int16 v22 = 2080;
    int v23 = "-[VCAudioCaptions reallocCopyBufferAllocatorWithFormat:]";
    __int16 v24 = 1024;
    int v25 = 821;
    __int16 v26 = 1024;
    int v27 = mSampleRate;
    __int16 v28 = 1024;
    UInt32 v29 = mBytesPerPacket;
    __int16 v30 = 2048;
    uint64_t v31 = v11;
    uint64_t v8 = " [%s] %s:%d Create captions copy buffer allocator: sampleRate=%d bytesPerPacket=%d bufferSize=%zu";
    uint64_t v9 = v15;
    uint32_t v10 = 50;
    goto LABEL_6;
  }
  if (ErrorLogLevelForModule >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    BOOL v18 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
    if (!v18) {
      return v18;
    }
    -[VCAudioCaptions reallocCopyBufferAllocatorWithFormat:]();
  }
  LOBYTE(v18) = 0;
  return v18;
}

- (void)start:(const AudioStreamBasicDescription *)a3 forToken:(int64_t)a4 withCompletionHandler:(id)a5
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  Float64 mSampleRate = a3->mSampleRate;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__VCAudioCaptions_start_forToken_withCompletionHandler___block_invoke;
  block[3] = &unk_1E6DB5150;
  void block[5] = a5;
  void block[6] = a4;
  block[4] = self;
  *(Float64 *)&void block[7] = mSampleRate;
  long long v7 = *(_OWORD *)&a3->mBytesPerFrame;
  long long v10 = *(_OWORD *)&a3->mFormatID;
  long long v11 = v7;
  dispatch_block_t v8 = dispatch_block_create(DISPATCH_BLOCK_DETACHED, block);
  dispatch_async((dispatch_queue_t)self->_captionsQueue, v8);
}

uint64_t __56__VCAudioCaptions_start_forToken_withCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  *(void *)(*(void *)(a1 + 32) + 432) = *(void *)(a1 + 48);
  int v2 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 10);
  int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  if (v2)
  {
    if (ErrorLogLevelForModule >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        __56__VCAudioCaptions_start_forToken_withCompletionHandler___block_invoke_cold_2();
      }
    }
    uint64_t v4 = *(void **)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v6 = 1;
    return [v4 callCompletionHandler:v5 withResult:v6];
  }
  if (ErrorLogLevelForModule >= 7)
  {
    uint64_t v7 = VRTraceErrorLogLevelToCSTR();
    dispatch_block_t v8 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 48);
      *(_DWORD *)int v25 = 136315906;
      *(void *)&v25[4] = v7;
      __int16 v26 = 2080;
      int v27 = "-[VCAudioCaptions start:forToken:withCompletionHandler:]_block_invoke";
      __int16 v28 = 1024;
      int v29 = 836;
      __int16 v30 = 2048;
      *(void *)uint64_t v31 = v9;
      _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Starting the speech recognizer for token=%ld", v25, 0x26u);
    }
  }
  if (+[VCAudioCaptions shouldAllocateNewAllocator:*(void *)(*(void *)(a1 + 32) + 160) streamDesc:a1 + 56 referenceStreamDesc:*(void *)(a1 + 32) + 16])
  {
    char v10 = [*(id *)(a1 + 32) reallocCopyBufferAllocatorWithFormat:a1 + 56];
    uint64_t v4 = *(void **)(a1 + 32);
    if (v10)
    {
      long long v11 = (const void *)v4[22];
      if (v11)
      {
        CFRelease(v11);
        *(void *)(*(void *)(a1 + 32) + 176) = 0;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v13 = VRTraceErrorLogLevelToCSTR();
        uint64_t v14 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          double v15 = *(double *)(a1 + 56);
          unsigned int v16 = *(_DWORD *)(a1 + 72);
          uint64_t v17 = 274877907 * (int)(v15 * (double)v16 * 20.0);
          *(_DWORD *)int v25 = 136316418;
          *(void *)&v25[4] = v13;
          __int16 v26 = 2080;
          int v27 = "-[VCAudioCaptions start:forToken:withCompletionHandler:]_block_invoke";
          __int16 v28 = 1024;
          int v29 = 843;
          __int16 v30 = 1024;
          *(_DWORD *)uint64_t v31 = (int)v15;
          *(_WORD *)&v31[4] = 1024;
          *(_DWORD *)&v31[6] = v16;
          __int16 v32 = 1024;
          int v33 = (v17 >> 38) + ((unint64_t)v17 >> 63);
          _os_log_impl(&dword_1E1EA4000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Create PCM copy buffer allocator: sampleRate=%d, bytesPerPacket=%d, capacity=%d", v25, 0x2Eu);
        }
      }
      LODWORD(v12) = *(_DWORD *)(a1 + 72);
      *(void *)(*(void *)(a1 + 32) + 176) = VCAudioBufferAllocatorCreate((const __CFAllocator *)*MEMORY[0x1E4F1CF80], (unint64_t)(*(double *)(a1 + 56) * (double)v12 * 20.0 / 1000.0), 2u);
      uint64_t v18 = *(void *)(a1 + 32);
      if (*(void *)(v18 + 176))
      {
        *(unsigned char *)(v18 + 416) = 1;
        goto LABEL_18;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          __56__VCAudioCaptions_start_forToken_withCompletionHandler___block_invoke_cold_1();
        }
      }
      uint64_t v4 = *(void **)(a1 + 32);
      if (v4[20])
      {
        _VCAudioCaptions_DestroyCopyBufferAllocator((uint64_t)v4);
        uint64_t v4 = *(void **)(a1 + 32);
      }
    }
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v6 = 0;
    return [v4 callCompletionHandler:v5 withResult:v6];
  }
LABEL_18:
  uint64_t v19 = *(void *)(a1 + 32);
  long long v20 = *(_OWORD *)(a1 + 56);
  long long v21 = *(_OWORD *)(a1 + 72);
  *(void *)(v19 + 48) = *(void *)(a1 + 88);
  *(_OWORD *)(v19 + 16) = v20;
  *(_OWORD *)(v19 + 32) = v21;
  uint64_t v22 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v22 + 8)
    && (*(void *)int v25 = 0,
        char v23 = [(id)v22 transitionToState:2 withReason:2 error:v25],
        uint64_t v22 = *(void *)(a1 + 32),
        (v23 & 1) == 0))
  {
    _VCAudioCaptions_DestroyCopyBufferAllocator(v22);
    uint64_t v22 = *(void *)(a1 + 32);
    if (*(void *)(v22 + 176))
    {
      CFRelease(*(CFTypeRef *)(v22 + 176));
      uint64_t v6 = 0;
      *(void *)(*(void *)(a1 + 32) + 176) = 0;
      uint64_t v22 = *(void *)(a1 + 32);
    }
    else
    {
      uint64_t v6 = 0;
    }
  }
  else
  {
    uint64_t v6 = 1;
  }
  *(unsigned char *)(v22 + 10) = v6;
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  return [v4 callCompletionHandler:v5 withResult:v6];
}

- (void)stop
{
}

- (void)stopWithCompletionHandler:(id)a3
{
  void block[6] = *MEMORY[0x1E4F143B8];
  captionsQueue = self->_captionsQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__VCAudioCaptions_stopWithCompletionHandler___block_invoke;
  block[3] = &unk_1E6DB5178;
  block[4] = self;
  void block[5] = a3;
  dispatch_async(captionsQueue, block);
}

uint64_t __45__VCAudioCaptions_stopWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v10 = 0;
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 10))
  {
    *(unsigned char *)(v2 + 10) = 0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v3 = VRTraceErrorLogLevelToCSTR();
      uint64_t v4 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v5 = *(void *)(a1 + 32);
        uint64_t v6 = *(void *)(v5 + 80);
        uint64_t v7 = *(void *)(v5 + 432);
        *(_DWORD *)buf = 136316162;
        uint64_t v12 = v3;
        __int16 v13 = 2080;
        uint64_t v14 = "-[VCAudioCaptions stopWithCompletionHandler:]_block_invoke";
        __int16 v15 = 1024;
        int v16 = 889;
        __int16 v17 = 2048;
        uint64_t v18 = v6;
        __int16 v19 = 2048;
        uint64_t v20 = v7;
        _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Stopping the speech recognizer task=%p for token=%ld", buf, 0x30u);
      }
    }
    uint64_t v8 = [*(id *)(a1 + 32) transitionToState:1 withReason:2 error:&v10];
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        __45__VCAudioCaptions_stopWithCompletionHandler___block_invoke_cold_1();
      }
    }
    uint64_t v8 = 0;
  }
  return [*(id *)(a1 + 32) callCompletionHandler:*(void *)(a1 + 40) withResult:v8];
}

- (BOOL)createRecognizer:(id *)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (self->_recognizer)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      uint64_t v3 = VRTraceErrorLogLevelToCSTR();
      uint64_t v4 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v20 = v3;
        __int16 v21 = 2080;
        uint64_t v22 = "-[VCAudioCaptions createRecognizer:]";
        __int16 v23 = 1024;
        int v24 = 900;
        _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d The speech recognizer already exists!!", buf, 0x1Cu);
      }
    }
    return 1;
  }
  uint64_t v7 = (SFSpeechRecognizer *)objc_msgSend(+[VCSpeechFrameworkWrapper defaultSpeechFrameworkWrapper](VCSpeechFrameworkWrapper, "defaultSpeechFrameworkWrapper"), "newSFSpeechRecognizerWithLocale:", self->_locale);
  self->_recognizer = v7;
  if (!v7)
  {
    if (a3)
    {
      uint64_t v11 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/Captions/VCAudioCaptions.m", 906);
      uint64_t v12 = 4;
      uint64_t v13 = 1;
LABEL_17:
      id v17 = +[VCSessionErrorUtils VCSessionCaptionsErrorEvent:v12 errorPath:v11 returnCode:v13];
      BOOL result = 0;
      *a3 = v17;
      return result;
    }
    return 0;
  }
  if (![(SFSpeechRecognizer *)v7 isAvailable])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      uint64_t v14 = VRTraceErrorLogLevelToCSTR();
      __int16 v15 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        BOOL v16 = [(SFSpeechRecognizer *)self->_recognizer isAvailable];
        *(_DWORD *)buf = 136315906;
        uint64_t v20 = v14;
        __int16 v21 = 2080;
        uint64_t v22 = "-[VCAudioCaptions createRecognizer:]";
        __int16 v23 = 1024;
        int v24 = 911;
        __int16 v25 = 1024;
        BOOL v26 = v16;
        _os_log_impl(&dword_1E1EA4000, v15, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Recognizer is not available at this point: (%d)", buf, 0x22u);
      }
    }

    self->_recognizer = 0;
    if (a3)
    {
      uint64_t v11 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/Captions/VCAudioCaptions.m", 915);
      uint64_t v12 = 5;
      uint64_t v13 = 2;
      goto LABEL_17;
    }
    return 0;
  }
  [(SFSpeechRecognizer *)self->_recognizer setDelegate:self];
  [(SFSpeechRecognizer *)self->_recognizer setDefaultTaskHint:1004];
  double v8 = micro();
  recognizer = self->_recognizer;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __36__VCAudioCaptions_createRecognizer___block_invoke;
  v18[3] = &unk_1E6DB51A0;
  *(double *)&v18[5] = v8;
  v18[4] = self;
  [(SFSpeechRecognizer *)recognizer _prepareToRecognizeWithTaskHint:1004 completion:v18];
  return 1;
}

void __36__VCAudioCaptions_createRecognizer___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  double v4 = micro();
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    uint64_t v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      double v7 = v4 - *(double *)(a1 + 40);
      *(_DWORD *)buf = 136316162;
      uint64_t v12 = v5;
      __int16 v13 = 2080;
      uint64_t v14 = "-[VCAudioCaptions createRecognizer:]_block_invoke";
      __int16 v15 = 1024;
      int v16 = 925;
      __int16 v17 = 2048;
      double v18 = v7;
      __int16 v19 = 2112;
      uint64_t v20 = a2;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Speech model preloading durationInSeconds=%f error=%@", buf, 0x30u);
    }
  }
  if (!a2)
  {
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = *(NSObject **)(v8 + 144);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __36__VCAudioCaptions_createRecognizer___block_invoke_60;
    block[3] = &unk_1E6DB3DC8;
    block[4] = v8;
    dispatch_async(v9, block);
  }
}

uint64_t __36__VCAudioCaptions_createRecognizer___block_invoke_60(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 449) = 1;
  return result;
}

- (void)destroyRecognizer
{
  recognizer = self->_recognizer;
  if (recognizer)
  {

    self->_recognizer = 0;
    self->_isSpeechModelLoaded = 0;
  }
}

- (void)recognizerBufferTeardown
{
  recognizerTask = self->_recognizerTask;
  if (recognizerTask)
  {
    [(SFSpeechRecognitionTask *)recognizerTask finish];

    self->_recognizerTask = 0;
  }

  self->_currentTaskInfo = 0;
  recognizerRequest = self->_recognizerRequest;
  if (recognizerRequest)
  {
    [(SFSpeechAudioBufferRecognitionRequest *)recognizerRequest endAudio];

    self->_recognizerRequest = 0;
  }
  teardownSemaphore = self->_teardownSemaphore;

  dispatch_semaphore_signal(teardownSemaphore);
}

+ (BOOL)shouldAllocateNewAllocator:(void *)a3 streamDesc:(const AudioStreamBasicDescription *)a4 referenceStreamDesc:(const AudioStreamBasicDescription *)a5
{
  return !a3 || !VCAudioStructs_StreamDescriptionIsEqual((void *)a4, a5);
}

- (BOOL)recognizerBufferSetupWithError:(id *)a3
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  AudioConverterRef inAudioConverter = 0;
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_teardownSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  uint64_t v5 = (SFSpeechAudioBufferRecognitionRequest *)objc_msgSend(+[VCSpeechFrameworkWrapper defaultSpeechFrameworkWrapper](VCSpeechFrameworkWrapper, "defaultSpeechFrameworkWrapper"), "newSFSpeechAudioBufferRecognitionRequest");
  if (!v5)
  {
    char v27 = 0;
    int v29 = @"Recognizer request creation failed";
    uint64_t v28 = 3;
    goto LABEL_28;
  }
  recognizerRequest = v5;
  double v7 = [(SFSpeechAudioBufferRecognitionRequest *)v5 nativeAudioFormat];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v8 = VRTraceErrorLogLevelToCSTR();
    uint64_t v9 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v45 = *(void *)[(AVAudioFormat *)v7 streamDescription];
      int v44 = (int)[(AVAudioFormat *)v7 streamDescription][8];
      uint64_t v10 = a3;
      int v11 = (int)[(AVAudioFormat *)v7 streamDescription][16];
      int v12 = (int)[(AVAudioFormat *)v7 streamDescription][20];
      int v13 = (int)[(AVAudioFormat *)v7 streamDescription][24];
      int v14 = (int)[(AVAudioFormat *)v7 streamDescription][28];
      int v15 = (int)[(AVAudioFormat *)v7 streamDescription][32];
      LODWORD(buf.value) = 136317442;
      *(int64_t *)((char *)&buf.value + 4) = v8;
      LOWORD(buf.flags) = 2080;
      *(void *)((char *)&buf.flags + 2) = "-[VCAudioCaptions recognizerBufferSetupWithError:]";
      HIWORD(buf.epoch) = 1024;
      int v48 = 991;
      __int16 v49 = 2048;
      *(void *)uint64_t v50 = v45;
      *(_WORD *)&v50[8] = 1024;
      *(_DWORD *)__int16 v51 = v44;
      *(_WORD *)&v51[4] = 1024;
      int v52 = v11;
      a3 = v10;
      __int16 v53 = 1024;
      int v54 = v12;
      __int16 v55 = 1024;
      int v56 = v13;
      __int16 v57 = 1024;
      int v58 = v14;
      __int16 v59 = 1024;
      int v60 = v15;
      _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Recognizer request created. Preferred format: samplerate=%f formatid=%x bytePerPacket=%d framesPerPacket=%d bytesPerFrame=%d channelsPerFrame=%d bitsPerChannel=%d", (uint8_t *)&buf, 0x4Au);
    }
  }
  [(SFSpeechAudioBufferRecognitionRequest *)recognizerRequest setShouldReportPartialResults:1];
  [(SFSpeechAudioBufferRecognitionRequest *)recognizerRequest setTaskHint:1004];
  [(SFSpeechAudioBufferRecognitionRequest *)recognizerRequest setTaskIdentifier:self->_taskIdentifier];
  [(SFSpeechAudioBufferRecognitionRequest *)recognizerRequest setRequiresOnDeviceRecognition:1];
  [(SFSpeechAudioBufferRecognitionRequest *)recognizerRequest setDetectMultipleUtterances:1];
  [(SFSpeechAudioBufferRecognitionRequest *)recognizerRequest setAddsPunctuation:1];
  if (+[VCAudioCaptions shouldAllocateNewAllocator:self->_audioConverter streamDesc:[(AVAudioFormat *)[(SFSpeechAudioBufferRecognitionRequest *)recognizerRequest nativeAudioFormat] streamDescription] referenceStreamDesc:&self->_captionsFormat]|| self->_inputFormatDidChange)
  {
    if (![(VCAudioCaptions *)self createAudioConverterWithInputFormat:&self->_inputFormat outputFormat:[(AVAudioFormat *)[(SFSpeechAudioBufferRecognitionRequest *)recognizerRequest nativeAudioFormat] streamDescription] converter:&inAudioConverter])
    {
      char v27 = 0;
      int v16 = 0;
      CFAllocatorRef audioBufferAllocator = 0;
      uint64_t v28 = 4;
      int v29 = @"Failed to create the converter. Captions will not be available";
      goto LABEL_47;
    }
    self->_inputFormatDidChange = 0;
  }
  else
  {
    AudioConverterRef inAudioConverter = self->_audioConverter;
  }
  int v16 = [(SFSpeechRecognizer *)self->_recognizer recognitionTaskWithRequest:recognizerRequest delegate:self];
  if (!v16)
  {
    char v27 = 0;
    CFAllocatorRef audioBufferAllocator = 0;
    uint64_t v28 = 5;
    int v29 = @"recognizer task failed!!";
    goto LABEL_47;
  }
  if (+[VCAudioCaptions shouldAllocateNewAllocator:self->_audioBufferAllocator streamDesc:[(AVAudioFormat *)[(SFSpeechAudioBufferRecognitionRequest *)recognizerRequest nativeAudioFormat] streamDescription] referenceStreamDesc:&self->_captionsFormat])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v17 = VRTraceErrorLogLevelToCSTR();
      double v18 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v19 = (int)*(double *)[(AVAudioFormat *)[(SFSpeechAudioBufferRecognitionRequest *)recognizerRequest nativeAudioFormat] streamDescription];
        int v20 = (int)[(AVAudioFormat *)[(SFSpeechAudioBufferRecognitionRequest *)recognizerRequest nativeAudioFormat] streamDescription][16];
        double v21 = *(double *)[(AVAudioFormat *)[(SFSpeechAudioBufferRecognitionRequest *)recognizerRequest nativeAudioFormat] streamDescription];
        LODWORD(v22) = [(AVAudioFormat *)[(SFSpeechAudioBufferRecognitionRequest *)recognizerRequest nativeAudioFormat] streamDescription][16];
        LODWORD(buf.value) = 136316418;
        *(int64_t *)((char *)&buf.value + 4) = v17;
        LOWORD(buf.flags) = 2080;
        *(void *)((char *)&buf.flags + 2) = "-[VCAudioCaptions recognizerBufferSetupWithError:]";
        HIWORD(buf.epoch) = 1024;
        int v48 = 1016;
        __int16 v49 = 1024;
        *(_DWORD *)uint64_t v50 = v19;
        *(_WORD *)&v50[4] = 1024;
        *(_DWORD *)&v50[6] = v20;
        *(_WORD *)__int16 v51 = 1024;
        *(_DWORD *)&v51[2] = (int)(v21 * (double)v22 * 20.0) / 1000;
        _os_log_impl(&dword_1E1EA4000, v18, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Create captions audio buffer allocator: sampleRate=%d, bytesPerPacket=%d, capacity=%d", (uint8_t *)&buf, 0x2Eu);
      }
    }
    CFAllocatorRef v23 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    double v24 = *(double *)[(AVAudioFormat *)[(SFSpeechAudioBufferRecognitionRequest *)recognizerRequest nativeAudioFormat] streamDescription];
    LODWORD(v25) = [(AVAudioFormat *)[(SFSpeechAudioBufferRecognitionRequest *)recognizerRequest nativeAudioFormat] streamDescription][16];
    CFAllocatorRef audioBufferAllocator = VCAudioBufferAllocatorCreate(v23, (unint64_t)(v24 * (double)v25 * 20.0 / 1000.0), 2u);
    if (!audioBufferAllocator)
    {
      char v27 = 0;
      uint64_t v28 = 6;
      int v29 = @"Failed to create captions audio buffer allocator!!";
LABEL_47:
      [(SFSpeechAudioBufferRecognitionRequest *)recognizerRequest endAudio];

      if (v16) {
      if (audioBufferAllocator)
      }
        CFRelease(audioBufferAllocator);
      goto LABEL_28;
    }
  }
  else
  {
    CFAllocatorRef audioBufferAllocator = self->_audioBufferAllocator;
  }
  self->_recognizerTask = v16;
  __int16 v30 = [VCCaptionTaskInfo alloc];
  int64_t currentActiveToken = self->_currentActiveToken;
  ++self->_currentUtteranceNumber;
  uint64_t v32 = -[VCCaptionTaskInfo initWithTask:token:utteranceNumber:](v30, "initWithTask:token:utteranceNumber:", v16, currentActiveToken);
  if (!v32)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCAudioCaptions recognizerBufferSetupWithError:]();
      }
    }
    int v29 = 0;
    uint64_t v28 = 0;
    char v27 = 1;
    goto LABEL_47;
  }
  int v33 = (VCCaptionTaskInfo *)v32;
  [(NSMutableArray *)self->_captionTasks addObject:v32];
  self->_currentTaskInfo = v33;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v34 = VRTraceErrorLogLevelToCSTR();
    int v35 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      recognizerTask = self->_recognizerTask;
      LODWORD(buf.value) = 136315906;
      *(int64_t *)((char *)&buf.value + 4) = v34;
      LOWORD(buf.flags) = 2080;
      *(void *)((char *)&buf.flags + 2) = "-[VCAudioCaptions recognizerBufferSetupWithError:]";
      HIWORD(buf.epoch) = 1024;
      int v48 = 1028;
      __int16 v49 = 2048;
      *(void *)uint64_t v50 = recognizerTask;
      _os_log_impl(&dword_1E1EA4000, v35, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Creating Task=%p", (uint8_t *)&buf, 0x26u);
    }
  }
  if (self->_lastAudioProcessedTime.flags)
  {
    $95D729B680665BEAEFA1D6FCA8238556 buf = self->_lastAudioProcessedTime;
    self->_captionsLastUtteranceStart = CMTimeGetSeconds((CMTime *)&buf);
  }
  self->_recognizerRequest = recognizerRequest;
  self->_CFAllocatorRef audioBufferAllocator = audioBufferAllocator;
  audioConverter = self->_audioConverter;
  if (audioConverter != inAudioConverter)
  {
    if (audioConverter)
    {
      AudioConverterDispose(audioConverter);
      self->_audioConverter = 0;
    }
    CFAllocatorDeallocate(self->_copyBufferAllocator, self->_previousConverterSamples);
    __int16 v38 = inAudioConverter;
    self->_previousConverterSamples = 0;
    self->_audioConverter = v38;
    recognizerRequest = self->_recognizerRequest;
  }
  AudioConverterRef inAudioConverter = 0;
  uint64_t v39 = [(AVAudioFormat *)[(SFSpeechAudioBufferRecognitionRequest *)recognizerRequest nativeAudioFormat] streamDescription];
  uint64_t v28 = 0;
  int v29 = 0;
  uint64_t v40 = *(void *)(v39 + 32);
  long long v41 = *(_OWORD *)(v39 + 16);
  *(_OWORD *)&self->_captionsFormat.Float64 mSampleRate = *(_OWORD *)v39;
  *(_OWORD *)&self->_captionsFormat.UInt32 mBytesPerPacket = v41;
  *(void *)&self->_captionsFormat.UInt32 mBitsPerChannel = v40;
  char v27 = 1;
LABEL_28:
  if (inAudioConverter) {
    AudioConverterDispose(inAudioConverter);
  }
  if ((v27 & 1) == 0)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3
      && (uint64_t v42 = VRTraceErrorLogLevelToCSTR(), os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)))
    {
      -[VCAudioCaptions recognizerBufferSetupWithError:](v42, v29);
      if (!a3) {
        goto LABEL_35;
      }
    }
    else if (!a3)
    {
LABEL_35:
      dispatch_semaphore_signal((dispatch_semaphore_t)self->_teardownSemaphore);
      return self->_recognizerTask != 0;
    }
    *a3 = +[VCSessionErrorUtils VCSessionCaptionsErrorEvent:errorPath:returnCode:](VCSessionErrorUtils, "VCSessionCaptionsErrorEvent:errorPath:returnCode:", 7, objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/Captions/VCAudioCaptions.m", 1067), v28);
    goto LABEL_35;
  }
  return self->_recognizerTask != 0;
}

- (id)taskInfoForTask:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  captionTasks = self->_captionTasks;
  uint64_t v5 = [(NSMutableArray *)captionTasks countByEnumeratingWithState:&v22 objects:v21 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v23;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v23 != v7) {
        objc_enumerationMutation(captionTasks);
      }
      uint64_t v9 = *(void **)(*((void *)&v22 + 1) + 8 * v8);
      if ((id)[v9 task] == a3) {
        break;
      }
      if (v6 == ++v8)
      {
        uint64_t v6 = [(NSMutableArray *)captionTasks countByEnumeratingWithState:&v22 objects:v21 count:16];
        if (v6) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      uint64_t v10 = VRTraceErrorLogLevelToCSTR();
      int v11 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 136315906;
        uint64_t v14 = v10;
        __int16 v15 = 2080;
        int v16 = "-[VCAudioCaptions taskInfoForTask:]";
        __int16 v17 = 1024;
        int v18 = 1081;
        __int16 v19 = 2048;
        id v20 = a3;
        _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d We could not find the corresponding taskInfo for the task=%p", (uint8_t *)&v13, 0x26u);
      }
    }
    return 0;
  }
  return v9;
}

- (BOOL)configureAnalyzerOptions
{
  uint64_t v3 = (SFSpeechAnalyzerOptions *)objc_msgSend(+[VCSpeechFrameworkWrapper defaultSpeechFrameworkWrapper](VCSpeechFrameworkWrapper, "defaultSpeechFrameworkWrapper"), "newSFSpeechAnalyzerOptionsWithHighPriority:loggingInfo:powerContext:", 1, 0, 0);
  self->_analyzerOptions = v3;
  if (!v3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      BOOL v6 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (!v6) {
        return v6;
      }
      -[VCAudioCaptions configureAnalyzerOptions]();
    }
    goto LABEL_13;
  }

  transcriberOptions = (SFSpeechAnalyzerTranscriberOptions *)objc_msgSend(+[VCSpeechFrameworkWrapper defaultSpeechFrameworkWrapper](VCSpeechFrameworkWrapper, "defaultSpeechFrameworkWrapper"), "newSFSpeechAnalyzerTranscriberOptions");
  self->_transcriberOptions = transcriberOptions;
  if (!transcriberOptions)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      BOOL v6 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (!v6) {
        return v6;
      }
      -[VCAudioCaptions configureAnalyzerOptions]();
    }
LABEL_13:
    LOBYTE(v6) = 0;
    return v6;
  }
  locale = self->_locale;
  if (!locale)
  {
    locale = (NSLocale *)[MEMORY[0x1E4F1CA20] currentLocale];
    transcriberOptions = self->_transcriberOptions;
  }
  [(SFSpeechAnalyzerTranscriberOptions *)transcriberOptions setLocale:locale];
  [(SFSpeechAnalyzerTranscriberOptions *)self->_transcriberOptions setTaskHint:1004];
  LOBYTE(v6) = 1;
  return v6;
}

- (void)destroyAnalyzer
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    double v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136315650;
      uint64_t v10 = v3;
      __int16 v11 = 2080;
      int v12 = "-[VCAudioCaptions destroyAnalyzer]";
      __int16 v13 = 1024;
      int v14 = 1112;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ", (uint8_t *)&v9, 0x1Cu);
    }
  }
  dispatch_time_t v5 = dispatch_time(0, 500000000);
  if (dispatch_semaphore_wait((dispatch_semaphore_t)self->_analyzerAllResultsSemaphore, v5))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      uint64_t v7 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v9 = 136315650;
        uint64_t v10 = v6;
        __int16 v11 = 2080;
        int v12 = "-[VCAudioCaptions destroyAnalyzer]";
        __int16 v13 = 1024;
        int v14 = 1115;
        _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Waiting for speech analyzer all results did timeout", (uint8_t *)&v9, 0x1Cu);
      }
    }
  }
  analyzer = self->_analyzer;
  if (analyzer)
  {

    self->_analyzer = 0;
  }
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_teardownSemaphore);
}

- (void)analyzerTeardown
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    double v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315650;
      uint64_t v8 = v3;
      __int16 v9 = 2080;
      uint64_t v10 = "-[VCAudioCaptions analyzerTeardown]";
      __int16 v11 = 1024;
      int v12 = 1125;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ", (uint8_t *)&v7, 0x1Cu);
    }
  }
  analyzerOptions = self->_analyzerOptions;
  if (analyzerOptions)
  {

    self->_analyzerOptions = 0;
  }
  transcriberOptions = self->_transcriberOptions;
  if (transcriberOptions)
  {

    self->_transcriberOptions = 0;
  }
}

- (BOOL)analyzerSetupWithError:(id *)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    uint64_t v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf.value) = 136315650;
      *(int64_t *)((char *)&buf.value + 4) = v5;
      LOWORD(buf.flags) = 2080;
      *(void *)((char *)&buf.flags + 2) = "-[VCAudioCaptions analyzerSetupWithError:]";
      HIWORD(buf.epoch) = 1024;
      LODWORD(v27) = 1137;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ", (uint8_t *)&buf, 0x1Cu);
    }
  }
  if (!self->_analyzer)
  {
    AudioConverterRef inAudioConverter = 0;
    dispatch_semaphore_wait((dispatch_semaphore_t)self->_teardownSemaphore, 0xFFFFFFFFFFFFFFFFLL);
    if (+[VCAudioCaptions shouldAllocateNewAllocator:self->_audioConverter streamDesc:[(AVAudioFormat *)self->_analyzerAudioFormat streamDescription] referenceStreamDesc:&self->_captionsFormat]|| self->_inputFormatDidChange)
    {
      if (![(VCAudioCaptions *)self createAudioConverterWithInputFormat:&self->_inputFormat outputFormat:[(AVAudioFormat *)self->_analyzerAudioFormat streamDescription] converter:&inAudioConverter])
      {
        char v22 = 0;
        uint64_t v23 = 4;
        goto LABEL_29;
      }
      self->_inputFormatDidChange = 0;
    }
    else
    {
      AudioConverterRef inAudioConverter = self->_audioConverter;
    }
    taskIdentifier = self->_taskIdentifier;
    operationQueue = self->_operationQueue;
    analyzerAudioFormat = self->_analyzerAudioFormat;
    long long v24 = *(_OWORD *)&self->_transcriberOptions;
    id v13 = +[VCSpeechFrameworkWrapper defaultSpeechFrameworkWrapper];
    buf.value = (int64_t)taskIdentifier;
    *(void *)&buf.timescale = analyzerAudioFormat;
    buf.epoch = (int64_t)self;
    char v27 = self;
    uint64_t v28 = operationQueue;
    long long v29 = v24;
    char v30 = 0;
    memset(v31, 170, sizeof(v31));
    uint64_t v32 = 0;
    uint64_t v33 = 0;
    int v14 = (SFSpeechAnalyzer *)[v13 newSFSpeechAnalyzerWithConfig:&buf didChangeVolatileRange:&__block_literal_global_77];
    self->_analyzer = v14;
    if (v14)
    {
      uint64_t v15 = [VCCaptionTaskInfo alloc];
      analyzer = self->_analyzer;
      int64_t currentActiveToken = self->_currentActiveToken;
      ++self->_currentUtteranceNumber;
      uint64_t v18 = -[VCCaptionTaskInfo initWithTask:token:utteranceNumber:](v15, "initWithTask:token:utteranceNumber:", analyzer, currentActiveToken);
      if (v18)
      {
        __int16 v19 = (void *)v18;
        [(NSMutableArray *)self->_captionTasks addObject:v18];

        if (self->_lastAudioProcessedTime.flags)
        {
          $95D729B680665BEAEFA1D6FCA8238556 buf = self->_lastAudioProcessedTime;
          self->_captionsLastUtteranceStart = CMTimeGetSeconds((CMTime *)&buf);
        }
        audioConverter = self->_audioConverter;
        if (audioConverter != inAudioConverter)
        {
          if (audioConverter)
          {
            AudioConverterDispose(audioConverter);
            self->_audioConverter = 0;
          }
          CFAllocatorDeallocate(self->_copyBufferAllocator, self->_previousConverterSamples);
          double v21 = inAudioConverter;
          self->_previousConverterSamples = 0;
          self->_audioConverter = v21;
        }
        return self->_analyzer != 0;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCAudioCaptions analyzerSetupWithError:]();
        }
      }
      uint64_t v23 = 0;
      char v22 = 1;
    }
    else
    {
      char v22 = 0;
      uint64_t v23 = 3;
    }
LABEL_29:
    if (inAudioConverter) {
      AudioConverterDispose(inAudioConverter);
    }
    if (v22) {
      return self->_analyzer != 0;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3
      && (VRTraceErrorLogLevelToCSTR(), os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)))
    {
      -[VCAudioCaptions analyzerSetupWithError:]();
      if (!a3) {
        goto LABEL_36;
      }
    }
    else if (!a3)
    {
LABEL_36:
      dispatch_semaphore_signal((dispatch_semaphore_t)self->_teardownSemaphore);
      return self->_analyzer != 0;
    }
    *a3 = +[VCSessionErrorUtils VCSessionCaptionsErrorEvent:errorPath:returnCode:](VCSessionErrorUtils, "VCSessionCaptionsErrorEvent:errorPath:returnCode:", 7, objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/Captions/VCAudioCaptions.m", 1213), v23);
    goto LABEL_36;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    uint64_t v7 = VRTraceErrorLogLevelToCSTR();
    uint64_t v8 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf.value) = 136315650;
      *(int64_t *)((char *)&buf.value + 4) = v7;
      LOWORD(buf.flags) = 2080;
      *(void *)((char *)&buf.flags + 2) = "-[VCAudioCaptions analyzerSetupWithError:]";
      HIWORD(buf.epoch) = 1024;
      LODWORD(v27) = 1139;
      _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d The speech analyzer already exists!!", (uint8_t *)&buf, 0x1Cu);
    }
  }
  return 1;
}

void __42__VCAudioCaptions_analyzerSetupWithError___block_invoke(uint64_t a1, uint64_t a2, int a3, int a4)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (!a3 || (int)VRTraceGetErrorLogLevelForModule() < 8) {
    goto LABEL_8;
  }
  uint64_t v6 = VRTraceErrorLogLevelToCSTR();
  uint64_t v7 = *MEMORY[0x1E4F47A50];
  uint64_t v8 = *MEMORY[0x1E4F47A50];
  if (*MEMORY[0x1E4F47A40])
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_OWORD *)&time.start.value = *(_OWORD *)a2;
      time.start.epoch = *(void *)(a2 + 16);
      Float64 Seconds = CMTimeGetSeconds(&time.start);
      LODWORD(time.start.value) = 136315906;
      *(CMTimeValue *)((char *)&time.start.value + 4) = v6;
      LOWORD(time.start.flags) = 2080;
      *(void *)((char *)&time.start.flags + 2) = "-[VCAudioCaptions analyzerSetupWithError:]_block_invoke";
      HIWORD(time.start.epoch) = 1024;
      LODWORD(time.duration.value) = 1179;
      WORD2(time.duration.value) = 2048;
      *(Float64 *)((char *)&time.duration.value + 6) = Seconds;
      _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Volatile range changed start, finalized through start time=%f", (uint8_t *)&time, 0x26u);
      if (!a4) {
        return;
      }
      goto LABEL_9;
    }
LABEL_8:
    if (!a4) {
      return;
    }
    goto LABEL_9;
  }
  if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    goto LABEL_8;
  }
  *(_OWORD *)&time.start.value = *(_OWORD *)a2;
  time.start.epoch = *(void *)(a2 + 16);
  Float64 v15 = CMTimeGetSeconds(&time.start);
  LODWORD(time.start.value) = 136315906;
  *(CMTimeValue *)((char *)&time.start.value + 4) = v6;
  LOWORD(time.start.flags) = 2080;
  *(void *)((char *)&time.start.flags + 2) = "-[VCAudioCaptions analyzerSetupWithError:]_block_invoke";
  HIWORD(time.start.epoch) = 1024;
  LODWORD(time.duration.value) = 1179;
  WORD2(time.duration.value) = 2048;
  *(Float64 *)((char *)&time.duration.value + 6) = v15;
  _os_log_debug_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEBUG, " [%s] %s:%d Volatile range changed start, finalized through start time=%f", (uint8_t *)&time, 0x26u);
  if (!a4) {
    return;
  }
LABEL_9:
  long long v10 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)&time.start.value = *(_OWORD *)a2;
  *(_OWORD *)&time.start.epoch = v10;
  *(_OWORD *)&time.duration.timescale = *(_OWORD *)(a2 + 32);
  CMTimeRangeGetEnd(&v16, &time);
  Float64 v11 = CMTimeGetSeconds(&v16);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    CMTimeValue v12 = VRTraceErrorLogLevelToCSTR();
    id v13 = *MEMORY[0x1E4F47A50];
    int v14 = *MEMORY[0x1E4F47A50];
    if (*MEMORY[0x1E4F47A40])
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(time.start.value) = 136315906;
        *(CMTimeValue *)((char *)&time.start.value + 4) = v12;
        LOWORD(time.start.flags) = 2080;
        *(void *)((char *)&time.start.flags + 2) = "-[VCAudioCaptions analyzerSetupWithError:]_block_invoke";
        HIWORD(time.start.epoch) = 1024;
        LODWORD(time.duration.value) = 1183;
        WORD2(time.duration.value) = 2048;
        *(Float64 *)((char *)&time.duration.value + 6) = v11;
        _os_log_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Volatile range changed end, finalized through end time=%f", (uint8_t *)&time, 0x26u);
      }
    }
    else if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      __42__VCAudioCaptions_analyzerSetupWithError___block_invoke_cold_1(v12);
    }
  }
}

- (opaqueCMSampleBuffer)createSampleBufferWithFormat:(const AudioStreamBasicDescription *)a3 samples:(char *)a4 numSamples:(int)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  CMAudioFormatDescriptionRef formatDescriptionOut = 0;
  s$95D729B680665BEAEFA1D6FCA8238556 buf = 0;
  int mSampleRate = (int)a3->mSampleRate;
  UInt32 v8 = a3->mBytesPerPacket * a5;
  self->_timescale = mSampleRate;
  CMTimeValue currentTime = self->_currentTime;
  CMTimeEpoch epoch = self->_epoch;
  self->_CMTimeValue currentTime = currentTime + a5;
  if (a5 < 0) {
    self->_CMTimeEpoch epoch = epoch + 1;
  }
  *(&bufferList.mNumberBuffers + 1) = -1431655766;
  bufferList.mNumberBuffers = 1;
  bufferList.mBuffers[0].mNumberChannels = 1;
  bufferList.mBuffers[0].mDataByteSize = v8;
  bufferList.mBuffers[0].mData = a4;
  CFAllocatorRef v11 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  if (CMAudioFormatDescriptionCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], a3, 0, 0, 0, 0, 0, &formatDescriptionOut))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      return 0;
    }
    uint64_t v15 = VRTraceErrorLogLevelToCSTR();
    CMTime v16 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      return 0;
    }
    LODWORD(presentationTimeStamp.value) = 136315650;
    *(CMTimeValue *)((char *)&presentationTimeStamp.value + 4) = v15;
    LOWORD(presentationTimeStamp.flags) = 2080;
    *(void *)((char *)&presentationTimeStamp.flags + 2) = "-[VCAudioCaptions createSampleBufferWithFormat:samples:numSamples:]";
    HIWORD(presentationTimeStamp.epoch) = 1024;
    int v28 = 1246;
    __int16 v17 = " [%s] %s:%d Failed to create format description for captions audio buffer";
    uint64_t v18 = v16;
    uint32_t v19 = 28;
LABEL_14:
    _os_log_impl(&dword_1E1EA4000, v18, OS_LOG_TYPE_DEFAULT, v17, (uint8_t *)&presentationTimeStamp, v19);
    return 0;
  }
  presentationTimeStamp.value = currentTime;
  presentationTimeStamp.timescale = mSampleRate;
  presentationTimeStamp.flags = 1;
  presentationTimeStamp.CMTimeEpoch epoch = epoch;
  OSStatus v12 = CMAudioSampleBufferCreateWithPacketDescriptions(v11, 0, 0, 0, 0, formatDescriptionOut, a5, &presentationTimeStamp, 0, &sbuf);
  CFRelease(formatDescriptionOut);
  if (v12)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      return 0;
    }
    uint64_t v20 = VRTraceErrorLogLevelToCSTR();
    double v21 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      return 0;
    }
    LODWORD(presentationTimeStamp.value) = 136315906;
    *(CMTimeValue *)((char *)&presentationTimeStamp.value + 4) = v20;
    LOWORD(presentationTimeStamp.flags) = 2080;
    *(void *)((char *)&presentationTimeStamp.flags + 2) = "-[VCAudioCaptions createSampleBufferWithFormat:samples:numSamples:]";
    HIWORD(presentationTimeStamp.epoch) = 1024;
    int v28 = 1250;
    __int16 v29 = 1024;
    OSStatus v30 = v12;
    __int16 v17 = " [%s] %s:%d Failed to create the CMSampleBuffer description for captions: %d";
    uint64_t v18 = v21;
    uint32_t v19 = 34;
    goto LABEL_14;
  }
  OSStatus v13 = CMSampleBufferSetDataBufferFromAudioBufferList(sbuf, v11, self->_audioBufferAllocator, 0, &bufferList);
  if (!v13) {
    return sbuf;
  }
  OSStatus v22 = v13;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v23 = VRTraceErrorLogLevelToCSTR();
    long long v24 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(presentationTimeStamp.value) = 136315906;
      *(CMTimeValue *)((char *)&presentationTimeStamp.value + 4) = v23;
      LOWORD(presentationTimeStamp.flags) = 2080;
      *(void *)((char *)&presentationTimeStamp.flags + 2) = "-[VCAudioCaptions createSampleBufferWithFormat:samples:numSamples:]";
      HIWORD(presentationTimeStamp.epoch) = 1024;
      int v28 = 1253;
      __int16 v29 = 1024;
      OSStatus v30 = v22;
      _os_log_impl(&dword_1E1EA4000, v24, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Failed to create the CMSampleBuffer for captions: %d", (uint8_t *)&presentationTimeStamp, 0x22u);
    }
  }
  BOOL result = sbuf;
  if (sbuf)
  {
    CFRelease(sbuf);
    return 0;
  }
  return result;
}

- (id)newPCMSampleBufferWithSamples:(char *)a3 numSamples:(int)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v24 = 0;
  size_t v7 = self->_inputFormat.mBytesPerPacket * a4;
  UInt32 v8 = CFAllocatorAllocate(self->_pcmCopyBufferAllocator, v7, 0);
  if (v8)
  {
    __int16 v9 = v8;
    memcpy(v8, a3, v7);
    LODWORD(v24) = 1;
    int v25 = 1;
    int v26 = v7;
    char v27 = v9;
    *(void *)$95D729B680665BEAEFA1D6FCA8238556 buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    *(void *)uint32_t v19 = 0xAAAAAAAAAAAAAAAALL;
    pcmCopyBufferAllocator = self->_pcmCopyBufferAllocator;
    if (pcmCopyBufferAllocator) {
      pcmCopyBufferAllocator = CFRetain(pcmCopyBufferAllocator);
    }
    *(void *)uint32_t v19 = pcmCopyBufferAllocator;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __60__VCAudioCaptions_newPCMSampleBufferWithSamples_numSamples___block_invoke;
    v17[3] = &unk_1E6DB51E8;
    v17[4] = buf;
    v17[5] = v9;
    CFAllocatorRef v11 = (void *)[objc_alloc(MEMORY[0x1E4F153B0]) initWithPCMFormat:self->_analyzerAudioFormat bufferListNoCopy:&v24 deallocator:v17];
    if (!v11)
    {
      CFAllocatorDeallocate(*(CFAllocatorRef *)(*(void *)&buf[8] + 24), v9);
      CMTime v16 = *(const void **)(*(void *)&buf[8] + 24);
      if (v16) {
        CFRelease(v16);
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCAudioCaptions newPCMSampleBufferWithSamples:numSamples:]();
        }
      }
    }
    _Block_object_dispose(buf, 8);
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v12 = VRTraceErrorLogLevelToCSTR();
      OSStatus v13 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        UInt32 mBytesPerPacket = self->_inputFormat.mBytesPerPacket;
        *(_DWORD *)$95D729B680665BEAEFA1D6FCA8238556 buf = 136316418;
        *(void *)&uint8_t buf[4] = v12;
        *(_WORD *)&unsigned char buf[12] = 2080;
        *(void *)&buf[14] = "-[VCAudioCaptions newPCMSampleBufferWithSamples:numSamples:]";
        *(_WORD *)&buf[22] = 1024;
        *(_DWORD *)uint32_t v19 = 1272;
        *(_WORD *)&v19[4] = 1024;
        *(_DWORD *)&void v19[6] = a4;
        __int16 v20 = 1024;
        UInt32 v21 = mBytesPerPacket;
        __int16 v22 = 1024;
        int v23 = v7;
        _os_log_error_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to allocate PCM buffer for captions: numSamples=%d,  bytesPerPacket=%d, totalCapacity=%d", buf, 0x2Eu);
      }
    }
    return 0;
  }
  return v11;
}

void __60__VCAudioCaptions_newPCMSampleBufferWithSamples_numSamples___block_invoke(uint64_t a1)
{
  CFAllocatorDeallocate(*(CFAllocatorRef *)(*(void *)(*(void *)(a1 + 32) + 8) + 24), *(void **)(a1 + 40));
  uint64_t v2 = *(const void **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  if (v2)
  {
    CFRelease(v2);
  }
}

- (void)pushSamplesToAnalyzer:(char *)a3 numSamples:(int)a4 hostTime:(double)a5
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  VCCaptionTaskInfo_HostTime((uint64_t)self->_currentTaskInfo);
  audioConverter = self->_audioConverter;
  if (audioConverter)
  {
    UInt32 mBytesPerPacket = self->_captionsFormat.mBytesPerPacket;
    double mSampleRate = self->_inputFormat.mSampleRate;
    long long v21 = *(_OWORD *)&self->_inputFormat.mBytesPerFrame;
    long long v22 = *(_OWORD *)&self->_inputFormat.mFormatID;
    pcmAudioBufferAllocator = self->_pcmAudioBufferAllocator;
    analyzerAudioFormat = self->_analyzerAudioFormat;
    UInt32 v13 = (self->_captionsFormat.mSampleRate * (double)a4 / mSampleRate);
    UInt32 ioOutputDataPacketSize = v13;
    int v14 = CFAllocatorAllocate(pcmAudioBufferAllocator, mBytesPerPacket * v13, 0);
    if (v14)
    {
      uint64_t v15 = v14;
      outOutputData.mBuffers[0].mData = v14;
      uint64_t v31 = 1;
      uint64_t v34 = a3;
      *(void *)&outOutputData.mNumberBuffers = 1;
      int v32 = 1;
      int v33 = DWORD2(v22) * a4;
      outOutputData.mBuffers[0].mNumberChannels = 1;
      outOutputData.mBuffers[0].mDataByteSize = mBytesPerPacket * v13;
      *(void *)inInputDataProcUserData = &v31;
      *(double *)&inInputDataProcUserData[8] = mSampleRate;
      *(_OWORD *)&inInputDataProcUserData[16] = v22;
      *(_OWORD *)&inInputDataProcUserData[32] = v21;
      if (AudioConverterFillComplexBuffer(audioConverter, (AudioConverterComplexInputDataProc)captionsAudioConverterCallback, inInputDataProcUserData, &ioOutputDataPacketSize, &outOutputData, 0))
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[VCAudioCaptions pushSamplesToAnalyzer:numSamples:hostTime:]();
          }
        }
        bzero(v15, mBytesPerPacket * v13);
      }
      uint64_t v24 = 0;
      int v25 = &v24;
      uint64_t v26 = 0x2020000000;
      unint64_t v27 = 0xAAAAAAAAAAAAAAAALL;
      if (pcmAudioBufferAllocator) {
        CFTypeRef v16 = CFRetain(pcmAudioBufferAllocator);
      }
      else {
        CFTypeRef v16 = 0;
      }
      unint64_t v27 = (unint64_t)v16;
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = ___VCAudioCaptions_ConvertSamplesToPCM_block_invoke;
      v23[3] = &unk_1E6DB51E8;
      v23[4] = &v24;
      v23[5] = v15;
      uint32_t v19 = (void *)[objc_alloc(MEMORY[0x1E4F153B0]) initWithPCMFormat:analyzerAudioFormat bufferListNoCopy:&outOutputData deallocator:v23];
      if (v19)
      {
        _Block_object_dispose(&v24, 8);
        [(VCAudioCaptions *)self recordAudioSampleMetrics];
        [(SFSpeechAnalyzer *)self->_analyzer addAudio:v19];

        return;
      }
      CFAllocatorDeallocate((CFAllocatorRef)v25[3], v15);
      __int16 v20 = (const void *)v25[3];
      if (v20) {
        CFRelease(v20);
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCAudioCaptions pushSamplesToAnalyzer:numSamples:hostTime:]();
        }
      }
      _Block_object_dispose(&v24, 8);
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v17 = VRTraceErrorLogLevelToCSTR();
      uint64_t v18 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)inInputDataProcUserData = 136316418;
        *(void *)&inInputDataProcUserData[4] = v17;
        *(_WORD *)&inInputDataProcUserData[12] = 2080;
        *(void *)&inInputDataProcUserData[14] = "_VCAudioCaptions_ConvertSamplesToPCM";
        *(_WORD *)&inInputDataProcUserData[22] = 1024;
        *(_DWORD *)&inInputDataProcUserData[24] = 451;
        *(_WORD *)&inInputDataProcUserData[28] = 1024;
        *(_DWORD *)&inInputDataProcUserData[30] = v13;
        *(_WORD *)&inInputDataProcUserData[34] = 1024;
        *(_DWORD *)&inInputDataProcUserData[36] = mBytesPerPacket;
        *(_WORD *)&inInputDataProcUserData[40] = 1024;
        *(_DWORD *)&inInputDataProcUserData[42] = mBytesPerPacket * v13;
        _os_log_error_impl(&dword_1E1EA4000, v18, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to allocate PCM copy buffer for captions: sampleCount=%d,  bytesPerPacket=%d, totalCapacity=%d", inInputDataProcUserData, 0x2Eu);
      }
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCAudioCaptions pushSamplesToAnalyzer:numSamples:hostTime:]();
    }
  }
}

- (void)pushSamplesToRecognizer:(char *)a3 numSamples:(int)a4 hostTime:(double)a5
{
  uint64_t v6 = -[VCAudioCaptions convertSamples:numSamples:](self, "convertSamples:numSamples:", a3, *(void *)&a4, VCCaptionTaskInfo_HostTime((uint64_t)self->_currentTaskInfo));
  if (v6)
  {
    size_t v7 = v6;
    [(VCAudioCaptions *)self recordAudioSampleMetrics];
    [(SFSpeechAudioBufferRecognitionRequest *)self->_recognizerRequest appendAudioSampleBuffer:v7];
    CFRelease(v7);
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCAudioCaptions pushSamplesToRecognizer:numSamples:hostTime:]();
    }
  }
}

- (BOOL)shouldPushSamplesToRecognizer
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (self->_recognizerState == 2)
  {
    recognizerTask = self->_recognizerTask;
    if (recognizerTask)
    {
      if ([(SFSpeechRecognitionTask *)recognizerTask state] != SFSpeechRecognitionTaskStateFinishing
        && [(SFSpeechRecognitionTask *)self->_recognizerTask state] != SFSpeechRecognitionTaskStateCanceling
        && self->_isSpeechModelLoaded)
      {
        return 1;
      }
    }
  }
  HIDWORD(v5) = -1030792151 * self->_logMessageCounter;
  LODWORD(v5) = HIDWORD(v5);
  if ((v5 >> 1) <= 0x51EB851 && (int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v6 = VRTraceErrorLogLevelToCSTR();
    size_t v7 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int recognizerState = self->_recognizerState;
      __int16 v9 = self->_recognizerTask;
      uint64_t v10 = [(SFSpeechRecognitionTask *)v9 state];
      BOOL isSpeechModelLoaded = self->_isSpeechModelLoaded;
      int v12 = 136316674;
      uint64_t v13 = v6;
      __int16 v14 = 2080;
      uint64_t v15 = "-[VCAudioCaptions shouldPushSamplesToRecognizer]";
      __int16 v16 = 1024;
      int v17 = 1351;
      __int16 v18 = 1024;
      int v19 = recognizerState;
      __int16 v20 = 2048;
      long long v21 = v9;
      __int16 v22 = 2048;
      uint64_t v23 = v10;
      __int16 v24 = 1024;
      BOOL v25 = isSpeechModelLoaded;
      _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Recognizer state=%d task=%p task.state=%ld _isSpeechModelLoaded=%{BOOL}d", (uint8_t *)&v12, 0x3Cu);
    }
  }
  BOOL result = 0;
  ++self->_logMessageCounter;
  return result;
}

- (BOOL)shouldPushSamplesToAnalyzer
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (self->_recognizerState == 2 && self->_analyzer) {
    return 1;
  }
  HIDWORD(v4) = -1030792151 * self->_logMessageCounter;
  LODWORD(v4) = HIDWORD(v4);
  if ((v4 >> 1) <= 0x51EB851 && (int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    uint64_t v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int recognizerState = self->_recognizerState;
      analyzer = self->_analyzer;
      int v9 = 136316162;
      uint64_t v10 = v5;
      __int16 v11 = 2080;
      int v12 = "-[VCAudioCaptions shouldPushSamplesToAnalyzer]";
      __int16 v13 = 1024;
      int v14 = 1362;
      __int16 v15 = 1024;
      int v16 = recognizerState;
      __int16 v17 = 2048;
      __int16 v18 = analyzer;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Analyzer state=%d analyzer=%p", (uint8_t *)&v9, 0x2Cu);
    }
  }
  BOOL result = 0;
  ++self->_logMessageCounter;
  return result;
}

- (void)pushAudioSamples:(opaqueVCAudioBufferList *)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (self->_isEnabled && self->_isStarted)
  {
    int SampleCount = VCAudioBufferList_GetSampleCount((uint64_t)a3);
    uint64_t AudioBufferList = VCAudioBufferList_GetAudioBufferList((uint64_t)a3);
    double HostTime = VCAudioBufferList_GetHostTime((uint64_t)a3);
    uint64_t SampleFormat = VCAudioBufferList_GetSampleFormat((uint64_t)a3);
    uint64_t v16 = 0;
    __int16 v17 = &v16;
    uint64_t v18 = 0x2020000000;
    uint64_t v19 = (void *)0xAAAAAAAAAAAAAAAALL;
    uint64_t v19 = CFAllocatorAllocate(self->_copyBufferAllocator, (*(_DWORD *)(SampleFormat + 16) * SampleCount), 0);
    int v9 = (void *)v17[3];
    if (v9)
    {
      memcpy(v9, *(const void **)(AudioBufferList + 16), (*(_DWORD *)(SampleFormat + 16) * SampleCount));
      captionsQueue = self->_captionsQueue;
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __36__VCAudioCaptions_pushAudioSamples___block_invoke;
      v14[3] = &unk_1E6DB5210;
      v14[4] = self;
      v14[5] = &v16;
      int v15 = SampleCount;
      *(double *)&v14[6] = HostTime;
      dispatch_async(captionsQueue, v14);
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v11 = VRTraceErrorLogLevelToCSTR();
      int v12 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        int v13 = *(_DWORD *)(SampleFormat + 16);
        *(_DWORD *)$95D729B680665BEAEFA1D6FCA8238556 buf = 136316418;
        uint64_t v21 = v11;
        __int16 v22 = 2080;
        uint64_t v23 = "-[VCAudioCaptions pushAudioSamples:]";
        __int16 v24 = 1024;
        int v25 = 1383;
        __int16 v26 = 1024;
        int v27 = SampleCount;
        __int16 v28 = 1024;
        int v29 = v13;
        __int16 v30 = 1024;
        int v31 = v13 * SampleCount;
        _os_log_error_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to allocate copy buffer for captions: %d %d %d", buf, 0x2Eu);
      }
    }
    _Block_object_dispose(&v16, 8);
  }
}

void __36__VCAudioCaptions_pushAudioSamples___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(unsigned char **)(a1 + 32);
  if (v2[12])
  {
    if ([v2 shouldPushSamplesToAnalyzer]) {
      [*(id *)(a1 + 32) pushSamplesToAnalyzer:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) numSamples:*(unsigned int *)(a1 + 56) hostTime:*(double *)(a1 + 48)];
    }
  }
  else if ([v2 shouldPushSamplesToRecognizer])
  {
    [*(id *)(a1 + 32) pushSamplesToRecognizer:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) numSamples:*(unsigned int *)(a1 + 56) hostTime:*(double *)(a1 + 48)];
  }
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  CFAllocatorDeallocate(*(CFAllocatorRef *)(v3 + 160), *(void **)(v3 + 328));
  *(void *)(v3 + 328) = v4;
}

- (void)recordAudioSampleMetrics
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  int64_t currentTime = self->_currentTime;
  CMTimeScale timescale = self->_timescale;
  CMTimeEpoch epoch = self->_epoch;
  if (self->_lastAudioProcessedTime.flags)
  {
    p_$95D729B680665BEAEFA1D6FCA8238556 lastAudioProcessedTime = &self->_lastAudioProcessedTime;
    v9.value = self->_currentTime;
    v9.CMTimeScale timescale = timescale;
    v9.flags = 1;
    v9.CMTimeEpoch epoch = epoch;
    double Seconds = CMTimeGetSeconds(&v9);
    *(_OWORD *)&v9.value = *(_OWORD *)&p_lastAudioProcessedTime->value;
    v9.CMTimeEpoch epoch = self->_lastAudioProcessedTime.epoch;
    double v6 = Seconds - CMTimeGetSeconds(&v9);
  }
  else
  {
    v9.value = self->_currentTime;
    v9.CMTimeScale timescale = timescale;
    v9.flags = 1;
    v9.CMTimeEpoch epoch = epoch;
    double v6 = CMTimeGetSeconds(&v9);
  }
  self->_double captionedAudioDuration = v6 + self->_captionedAudioDuration;
  self->_lastAudioProcessedTime.value = currentTime;
  self->_lastAudioProcessedTime.CMTimeScale timescale = timescale;
  self->_lastAudioProcessedTime.flags = 1;
  self->_lastAudioProcessedTime.CMTimeEpoch epoch = epoch;
  ++self->_captioningRequestCount;
}

- (void)packageAndSendTranscribedString:(id)a3 withTask:(id)a4 final:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (objc_msgSend((id)objc_msgSend(a3, "segments"), "count"))
  {
    [(VCAudioCaptions *)self dumpCaptionsIfNeededForTranscription:a3 final:v5];
    if ([(VCAudioCaptions *)self delegate])
    {
      id v9 = [(VCAudioCaptions *)self taskInfoForTask:a4];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = [[VCCaptionsTranscription alloc] initWithSFTranscription:a3 taskInfo:v9 isLocal:self->_isLocal isFinal:v5];
        if (v11)
        {
          int v12 = v11;
          delegateQueue = self->_delegateQueue;
          v16[0] = MEMORY[0x1E4F143A8];
          v16[1] = 3221225472;
          v16[2] = __66__VCAudioCaptions_packageAndSendTranscribedString_withTask_final___block_invoke;
          v16[3] = &unk_1E6DB3E40;
          v16[4] = self;
          v16[5] = v12;
          dispatch_async(delegateQueue, v16);
        }
        objc_msgSend(v10, "setUpdateNumber:", objc_msgSend(v10, "updateNumber") + 1);
      }
      else if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
      {
        uint64_t v14 = VRTraceErrorLogLevelToCSTR();
        int v15 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)$95D729B680665BEAEFA1D6FCA8238556 buf = 136315650;
          uint64_t v18 = v14;
          __int16 v19 = 2080;
          __int16 v20 = "-[VCAudioCaptions packageAndSendTranscribedString:withTask:final:]";
          __int16 v21 = 1024;
          int v22 = 1434;
          _os_log_impl(&dword_1E1EA4000, v15, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Cannot sendTranscription as we don't have a task for it", buf, 0x1Cu);
        }
      }
    }
  }
}

uint64_t __66__VCAudioCaptions_packageAndSendTranscribedString_withTask_final___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)[*(id *)(a1 + 32) delegate];
  uint64_t v3 = *(void *)(a1 + 40);

  return [v2 didUpdateCaptions:v3];
}

- (void)packageAndSendTranscriberResult:(id)a3 withTask:(id)a4 final:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (objc_msgSend((id)objc_msgSend(a3, "segments"), "count") && -[VCAudioCaptions delegate](self, "delegate"))
  {
    id v9 = [(VCAudioCaptions *)self taskInfoForTask:a4];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = [[VCCaptionsTranscription alloc] initWithSTTranscriberMultisegmentResult:a3 taskInfo:v9 isLocal:self->_isLocal isFinal:v5];
      if (v11)
      {
        int v12 = v11;
        [(VCAudioCaptions *)self dumpCaptionsIfNeededForCaptionsTranscription:v11 final:v5];
        delegateQueue = self->_delegateQueue;
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __66__VCAudioCaptions_packageAndSendTranscriberResult_withTask_final___block_invoke;
        v16[3] = &unk_1E6DB3E40;
        v16[4] = self;
        v16[5] = v12;
        dispatch_async(delegateQueue, v16);
      }
      objc_msgSend(v10, "setUpdateNumber:", objc_msgSend(v10, "updateNumber") + 1);
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      uint64_t v14 = VRTraceErrorLogLevelToCSTR();
      int v15 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)$95D729B680665BEAEFA1D6FCA8238556 buf = 136315650;
        uint64_t v18 = v14;
        __int16 v19 = 2080;
        __int16 v20 = "-[VCAudioCaptions packageAndSendTranscriberResult:withTask:final:]";
        __int16 v21 = 1024;
        int v22 = 1459;
        _os_log_impl(&dword_1E1EA4000, v15, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Cannot sendTranscription as we don't have a task for it", buf, 0x1Cu);
      }
    }
  }
}

uint64_t __66__VCAudioCaptions_packageAndSendTranscriberResult_withTask_final___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)[*(id *)(a1 + 32) delegate];
  uint64_t v3 = *(void *)(a1 + 40);

  return [v2 didUpdateCaptions:v3];
}

- (void)dumpCaptionsIfNeededForTranscription:(id)a3 final:(BOOL)a4
{
  if (a4 && self->_logCaptionsDump && (objc_opt_respondsToSelector() & 1) != 0)
  {
    double v6 = (void *)[a3 formattedString];
    logCaptionsDump = self->_logCaptionsDump;
    char v8 = [v6 UTF8String];
    VRLogfilePrintWithTimestamp((uint64_t)logCaptionsDump, "%s\n", v9, v10, v11, v12, v13, v14, v8);
  }
}

- (void)dumpCaptionsIfNeededForCaptionsTranscription:(id)a3 final:(BOOL)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (a4)
  {
    logCaptionsDump = self->_logCaptionsDump;
    if (logCaptionsDump)
    {
      if (a3)
      {
        char v5 = objc_msgSend((id)objc_msgSend(a3, "formattedText"), "UTF8String");
        VRLogfilePrintWithTimestamp((uint64_t)logCaptionsDump, "%s\n", v6, v7, v8, v9, v10, v11, v5);
      }
      else if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
      {
        uint64_t v12 = VRTraceErrorLogLevelToCSTR();
        uint64_t v13 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)$95D729B680665BEAEFA1D6FCA8238556 buf = 136315650;
          uint64_t v16 = v12;
          __int16 v17 = 2080;
          uint64_t v18 = "-[VCAudioCaptions dumpCaptionsIfNeededForCaptionsTranscription:final:]";
          __int16 v19 = 1024;
          int v20 = 1489;
          _os_log_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Failed to init transcription for caption dump", buf, 0x1Cu);
        }
      }
    }
  }
}

- (void)speechRecognitionTask:(id)a3 didHypothesizeTranscription:(id)a4
{
  v5[7] = *MEMORY[0x1E4F143B8];
  captionsQueue = self->_captionsQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __69__VCAudioCaptions_speechRecognitionTask_didHypothesizeTranscription___block_invoke;
  v5[3] = &unk_1E6DB43D8;
  v5[4] = self;
  v5[5] = a4;
  void v5[6] = a3;
  dispatch_async(captionsQueue, v5);
}

uint64_t __69__VCAudioCaptions_speechRecognitionTask_didHypothesizeTranscription___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) packageAndSendTranscribedString:*(void *)(a1 + 40) withTask:*(void *)(a1 + 48) final:0];
}

- (void)speechRecognitionTask:(id)a3 didFinishRecognition:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v7 = VRTraceErrorLogLevelToCSTR();
    uint64_t v8 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v9 = (__int16)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "bestTranscription"), "segments"), "count");
      objc_msgSend((id)objc_msgSend(a4, "speechRecognitionMetadata"), "speechDuration");
      *(_DWORD *)$95D729B680665BEAEFA1D6FCA8238556 buf = 136316418;
      uint64_t v14 = v7;
      __int16 v15 = 2080;
      uint64_t v16 = "-[VCAudioCaptions speechRecognitionTask:didFinishRecognition:]";
      __int16 v17 = 1024;
      int v18 = 1507;
      __int16 v19 = 2048;
      id v20 = a3;
      __int16 v21 = 1024;
      int v22 = v9;
      __int16 v23 = 2048;
      uint64_t v24 = v10;
      _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d speechRecognitionTask=%p didFinishRecognition (final) count=%d, duration=%f", buf, 0x36u);
    }
  }
  captionsQueue = self->_captionsQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__VCAudioCaptions_speechRecognitionTask_didFinishRecognition___block_invoke;
  block[3] = &unk_1E6DB43D8;
  block[4] = self;
  void block[5] = a4;
  void block[6] = a3;
  dispatch_async(captionsQueue, block);
}

uint64_t __62__VCAudioCaptions_speechRecognitionTask_didFinishRecognition___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) bestTranscription];
  uint64_t v4 = *(void *)(a1 + 48);

  return [v2 packageAndSendTranscribedString:v3 withTask:v4 final:1];
}

- (void)speechRecognitionTaskWasCancelled:(id)a3
{
  v4[5] = *MEMORY[0x1E4F143B8];
  captionsQueue = self->_captionsQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __53__VCAudioCaptions_speechRecognitionTaskWasCancelled___block_invoke;
  v4[3] = &unk_1E6DB3DC8;
  v4[4] = self;
  dispatch_async(captionsQueue, v4);
}

uint64_t __53__VCAudioCaptions_speechRecognitionTaskWasCancelled___block_invoke(uint64_t a1)
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  uint64_t v1 = *(unsigned __int8 **)(a1 + 32);
  if (v1[9]) {
    uint64_t v2 = 1;
  }
  else {
    uint64_t v2 = v1[8];
  }
  return [v1 transitionToState:v2 withReason:2 error:v4];
}

- (void)speechRecognitionTask:(id)a3 didFinishSuccessfully:(BOOL)a4
{
  void block[6] = *MEMORY[0x1E4F143B8];
  if (!a4)
  {
    if ([a3 error])
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v6 = VRTraceErrorLogLevelToCSTR();
        uint64_t v7 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCAudioCaptions speechRecognitionTask:didFinishSuccessfully:](v6, a3, v7);
        }
      }
    }
  }
  captionsQueue = self->_captionsQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__VCAudioCaptions_speechRecognitionTask_didFinishSuccessfully___block_invoke;
  block[3] = &unk_1E6DB3E40;
  block[4] = self;
  void block[5] = a3;
  dispatch_async(captionsQueue, block);
}

uint64_t __63__VCAudioCaptions_speechRecognitionTask_didFinishSuccessfully___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(*(void *)(a1 + 32) + 424);
  uint64_t v2 = [*(id *)(a1 + 32) taskInfoForTask:*(void *)(a1 + 40)];

  return [v1 removeObject:v2];
}

- (void)speechRecognizer:(id)a3 availabilityDidChange:(BOOL)a4
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  captionsQueue = self->_captionsQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__VCAudioCaptions_speechRecognizer_availabilityDidChange___block_invoke;
  block[3] = &unk_1E6DB3DF0;
  block[4] = self;
  BOOL v6 = a4;
  dispatch_async(captionsQueue, block);
}

uint64_t __58__VCAudioCaptions_speechRecognizer_availabilityDidChange___block_invoke(uint64_t result)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(result + 32);
  if (*(unsigned char *)(v1 + 8) && *(unsigned char *)(v1 + 10))
  {
    uint64_t v2 = result;
    uint64_t v8 = 0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v3 = VRTraceErrorLogLevelToCSTR();
      uint64_t v4 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v5 = *(unsigned __int8 *)(v2 + 40);
        *(_DWORD *)$95D729B680665BEAEFA1D6FCA8238556 buf = 136315906;
        uint64_t v10 = v3;
        __int16 v11 = 2080;
        uint64_t v12 = "-[VCAudioCaptions speechRecognizer:availabilityDidChange:]_block_invoke";
        __int16 v13 = 1024;
        int v14 = 1539;
        __int16 v15 = 1024;
        int v16 = v5;
        _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Speech model availability status=%d", buf, 0x22u);
      }
    }
    if (*(unsigned char *)(v2 + 40)) {
      uint64_t v6 = 4;
    }
    else {
      uint64_t v6 = 1;
    }
    if (*(unsigned char *)(v2 + 40)) {
      uint64_t v7 = 2;
    }
    else {
      uint64_t v7 = 1;
    }
    return [*(id *)(v2 + 32) transitionToState:v7 withReason:v6 error:&v8];
  }
  return result;
}

- (void)speechAnalyzer:(id)a3 didProduceTranscriberResult:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (void *)[a4 contextualizedTranscriberMultisegmentResult];
  uint64_t v7 = [v6 earResultType];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v8 = VRTraceErrorLogLevelToCSTR();
    int v9 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v10 = (__int16)objc_msgSend((id)objc_msgSend(v6, "segments"), "count");
      if (v6)
      {
        [v6 recognitionAudioRange];
      }
      else
      {
        memset(v16, 0, sizeof(v16));
        long long v15 = 0u;
      }
      CMTime time = *(CMTime *)((char *)v16 + 8);
      Float64 Seconds = CMTimeGetSeconds(&time);
      *(_DWORD *)$95D729B680665BEAEFA1D6FCA8238556 buf = 136316674;
      uint64_t v19 = v8;
      __int16 v20 = 2080;
      __int16 v21 = "-[VCAudioCaptions speechAnalyzer:didProduceTranscriberResult:]";
      __int16 v22 = 1024;
      int v23 = 1552;
      __int16 v24 = 2112;
      id v25 = a3;
      __int16 v26 = 1024;
      BOOL v27 = v7 == 4;
      __int16 v28 = 1024;
      int v29 = v10;
      __int16 v30 = 2048;
      Float64 v31 = Seconds;
      _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d speechAnalyzer=%@ didProduceTranscriberResult isFinal=%d, count=%d, duration=%f", buf, 0x3Cu);
    }
  }
  captionsQueue = self->_captionsQueue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __62__VCAudioCaptions_speechAnalyzer_didProduceTranscriberResult___block_invoke;
  v13[3] = &unk_1E6DB5238;
  v13[4] = self;
  v13[5] = v6;
  v13[6] = a3;
  BOOL v14 = v7 == 4;
  dispatch_async(captionsQueue, v13);
}

uint64_t __62__VCAudioCaptions_speechAnalyzer_didProduceTranscriberResult___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) packageAndSendTranscriberResult:*(void *)(a1 + 40) withTask:*(void *)(a1 + 48) final:*(unsigned __int8 *)(a1 + 56)];
}

- (void)speechAnalyzer:(id)a3 didStopTranscriptionWithError:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v7 = VRTraceErrorLogLevelToCSTR();
    uint64_t v8 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136316162;
      uint64_t v10 = v7;
      __int16 v11 = 2080;
      uint64_t v12 = "-[VCAudioCaptions speechAnalyzer:didStopTranscriptionWithError:]";
      __int16 v13 = 1024;
      int v14 = 1560;
      __int16 v15 = 2112;
      id v16 = a3;
      __int16 v17 = 2112;
      uint64_t v18 = [a4 localizedDescription];
      _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d speechAnalyzer=%@ didStopTranscriptionWithError=%@", (uint8_t *)&v9, 0x30u);
    }
  }
  if (a4)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCAudioCaptions speechAnalyzer:didStopTranscriptionWithError:]();
      }
    }
  }
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_analyzerAllResultsSemaphore);
}

- (void)speechAnalyzerDidProduceAllTranscriberResults:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    uint64_t v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315906;
      uint64_t v8 = v5;
      __int16 v9 = 2080;
      uint64_t v10 = "-[VCAudioCaptions speechAnalyzerDidProduceAllTranscriberResults:]";
      __int16 v11 = 1024;
      int v12 = 1569;
      __int16 v13 = 2112;
      id v14 = a3;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d speechAnalyzer=%@ speechAnalyzerDidProduceAllTranscriberResults", (uint8_t *)&v7, 0x26u);
    }
  }
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_analyzerAllResultsSemaphore);
}

- (void)speechAnalyzer:(id)a3 didProduceEndpointingResult:(id)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  if (a4)
  {
    [a4 range];
  }
  else
  {
    memset(v19, 0, sizeof(v19));
    long long v18 = 0u;
  }
  CMTime time = *(CMTime *)((char *)v19 + 8);
  double Seconds = CMTimeGetSeconds(&time);
  if (a4) {
    [a4 range];
  }
  else {
    memset(&v16, 0, sizeof(v16));
  }
  CMTimeRangeGetEnd(&v17, &v16);
  double v7 = CMTimeGetSeconds(&v17);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v8 = VRTraceErrorLogLevelToCSTR();
    __int16 v9 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = (uint64_t)Seconds;
      uint64_t v11 = [a4 wordCount];
      [a4 eosLikelihood];
      uint64_t v13 = v12;
      uint64_t v14 = [a4 pauseCounts];
      [a4 silencePosterior];
      *(_DWORD *)$95D729B680665BEAEFA1D6FCA8238556 buf = 136317442;
      uint64_t v22 = v8;
      __int16 v23 = 2080;
      __int16 v24 = "-[VCAudioCaptions speechAnalyzer:didProduceEndpointingResult:]";
      __int16 v25 = 1024;
      int v26 = 1579;
      __int16 v27 = 2112;
      id v28 = a3;
      __int16 v29 = 2048;
      uint64_t v30 = v11;
      __int16 v31 = 2048;
      uint64_t v32 = v10;
      __int16 v33 = 2048;
      uint64_t v34 = v13;
      __int16 v35 = 2112;
      uint64_t v36 = v14;
      __int16 v37 = 2048;
      uint64_t v38 = v15;
      __int16 v39 = 2048;
      uint64_t v40 = (uint64_t)(v7 * 1000.0);
      _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d speechAnalyzer=%@ didProduceEndpointingResult wordcount=%ld, trailingSilenceDuration=%ld, eosLikelihood=%f, pauseCounts=%@, silencePosterior=%f, processedAudioDurationInMilliseconds=%ld", buf, 0x62u);
    }
  }
}

- (void)speechAnalyzer:(id)a3 didStopEndpointingWithError:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v6 = VRTraceErrorLogLevelToCSTR();
    double v7 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136316162;
      uint64_t v9 = v6;
      __int16 v10 = 2080;
      uint64_t v11 = "-[VCAudioCaptions speechAnalyzer:didStopEndpointingWithError:]";
      __int16 v12 = 1024;
      int v13 = 1583;
      __int16 v14 = 2112;
      id v15 = a3;
      __int16 v16 = 2112;
      uint64_t v17 = [a4 localizedDescription];
      _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d speechAnalyzer=%@ didStopEndpointingWithError=%@", (uint8_t *)&v8, 0x30u);
    }
  }
}

- (BOOL)captionsDebugDumpEnabled
{
  int ManagedBoolValueForKey = VCDefaults_GetManagedBoolValueForKey(@"enableCaptionsDump", 0);
  if (ManagedBoolValueForKey)
  {
    LOBYTE(ManagedBoolValueForKey) = VRTraceIsInternalOSInstalled();
  }
  return ManagedBoolValueForKey;
}

- (NSSet)localLanguages
{
  return self->_localLanguages;
}

- (void)setLocalLanguages:(id)a3
{
}

- (NSSet)remoteLanguages
{
  return self->_remoteLanguages;
}

- (void)setRemoteLanguages:(id)a3
{
}

- (BOOL)remoteCanDisplay
{
  return self->_remoteCanDisplay;
}

- (void)setRemoteCanDisplay:(BOOL)a3
{
  self->_remoteCanDisplay = a3;
}

- (NSString)taskIdentifier
{
  return self->_taskIdentifier;
}

- (void)setTaskIdentifier:(id)a3
{
}

void ___VCAudioCaptions_ConvertSamplesToPCM_block_invoke(uint64_t a1)
{
  CFAllocatorDeallocate(*(CFAllocatorRef *)(*(void *)(*(void *)(a1 + 32) + 8) + 24), *(void **)(a1 + 40));
  uint64_t v2 = *(const void **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  if (v2)
  {
    CFRelease(v2);
  }
}

- (void)initWithDelegate:isLocal:taskIdentifier:reportingAgent:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Delegate object is nil", v2, v3, v4, v5, v6);
}

- (void)initWithDelegate:isLocal:taskIdentifier:reportingAgent:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to create queue", v2, v3, v4, v5, v6);
}

- (void)initWithDelegate:isLocal:taskIdentifier:reportingAgent:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to create delegate queue", v2, v3, v4, v5, v6);
}

- (void)initWithDelegate:isLocal:taskIdentifier:reportingAgent:.cold.4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to create semaphore", v2, v3, v4, v5, v6);
}

- (void)initWithDelegate:isLocal:taskIdentifier:reportingAgent:.cold.5()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to create the captionsTask array", v2, v3, v4, v5, v6);
}

- (void)initWithDelegate:isLocal:taskIdentifier:reportingAgent:.cold.6()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to create _analyzerAllResultsSemaphore", v2, v3, v4, v5, v6);
}

- (void)initWithDelegate:isLocal:taskIdentifier:reportingAgent:.cold.7()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to init analyzer audio format", v2, v3, v4, v5, v6);
}

- (void)initWithDelegate:isLocal:taskIdentifier:reportingAgent:.cold.8()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to create the PCM copy buffer allocator for captions", v2, v3, v4, v5, v6);
}

- (void)initWithDelegate:isLocal:taskIdentifier:reportingAgent:.cold.9()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to init analyzer operation queue", v2, v3, v4, v5, v6);
}

- (void)createAudioConverterWithInputFormat:outputFormat:converter:.cold.1()
{
  OUTLINED_FUNCTION_5();
  *(void *)&void v3[6] = "-[VCAudioCaptions createAudioConverterWithInputFormat:outputFormat:converter:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d AudioConverterSetProperty(kAudioConverterPrimeMethod) failed with error %d", v2, *(const char **)v3, (unint64_t)"-[VCAudioCaptions createAudioConverterWithInputFormat:outputFormat:converter:]" >> 16, v4);
}

- (void)createAudioConverterWithInputFormat:outputFormat:converter:.cold.2()
{
  OUTLINED_FUNCTION_5();
  *(void *)&void v3[6] = "-[VCAudioCaptions createAudioConverterWithInputFormat:outputFormat:converter:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d newAudioResamplerWithInputFormat failed with error %d", v2, *(const char **)v3, (unint64_t)"-[VCAudioCaptions createAudioConverterWithInputFormat:outputFormat:converter:]" >> 16, v4);
}

- (void)convertSamples:numSamples:.cold.1()
{
  OUTLINED_FUNCTION_5();
  *(void *)&void v3[6] = "-[VCAudioCaptions convertSamples:numSamples:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d AudioConverterFillComplexBuffer failed with %d", v2, *(const char **)v3, (unint64_t)"-[VCAudioCaptions convertSamples:numSamples:]" >> 16, v4);
}

- (void)loadedStateToState:withReason:error:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to setup speech recognizer for running", v2, v3, v4, v5, v6);
}

void __38__VCAudioCaptions_handleStateStopping__block_invoke_cold_1(uint64_t a1, void *a2)
{
  [a2 localizedDescription];
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_10_0(&dword_1E1EA4000, v2, v3, " [%s] %s:%d Finishing analyzing failed with the error=%@", v4, v5, v6, v7, 2u);
}

- (void)transitionToState:(uint64_t)a1 withReason:(void *)a2 error:.cold.1(uint64_t a1, void ***a2)
{
  uint64_t v2 = **a2;
  if (v2) {
    objc_msgSend((id)objc_msgSend(v2, "description"), "UTF8String");
  }
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_10_0(&dword_1E1EA4000, v3, v4, " [%s] %s:%d Failed captions state transition. Error=%s", v5, v6, v7, v8, 2u);
}

+ (void)captionsSupportedWithErrorCode:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Speech framework not properly soft linked.", v2, v3, v4, v5, v6);
}

+ (void)captionsSupportedWithErrorCode:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Captions is hardware restricted", v2, v3, v4, v5, v6);
}

- (void)reallocCopyBufferAllocatorWithFormat:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to create the copy buffer allocator for captions", v2, v3, v4, v5, v6);
}

void __56__VCAudioCaptions_start_forToken_withCompletionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to create the PCM copy buffer allocator for captions", v2, v3, v4, v5, v6);
}

void __56__VCAudioCaptions_start_forToken_withCompletionHandler___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Starting speech recognizer but it is already started", v2, v3, v4, v5, v6);
}

void __45__VCAudioCaptions_stopWithCompletionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Stopping speech recognizer but it is already stopped", v2, v3, v4, v5, v6);
}

- (void)recognizerBufferSetupWithError:(uint64_t)a1 .cold.1(uint64_t a1, void *a2)
{
  objc_msgSend((id)objc_msgSend(a2, "description"), "UTF8String");
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_10_0(&dword_1E1EA4000, v2, v3, " [%s] %s:%d %s", v4, v5, v6, v7, 2u);
}

- (void)recognizerBufferSetupWithError:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d taskInfo failed to allocate", v2, v3, v4, v5, v6);
}

- (void)configureAnalyzerOptions
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to init speech analyzer transcriber options", v2, v3, v4, v5, v6);
}

- (void)analyzerSetupWithError:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d error=%@");
}

- (void)analyzerSetupWithError:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to init analyzerInfo", v2, v3, v4, v5, v6);
}

void __42__VCAudioCaptions_analyzerSetupWithError___block_invoke_cold_1(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int v3 = 136315906;
  uint64_t v4 = a1;
  OUTLINED_FUNCTION_5_1();
  uint64_t v5 = "-[VCAudioCaptions analyzerSetupWithError:]_block_invoke";
  OUTLINED_FUNCTION_3();
  int v6 = 1183;
  __int16 v7 = 2048;
  uint64_t v8 = v1;
  _os_log_debug_impl(&dword_1E1EA4000, v2, OS_LOG_TYPE_DEBUG, " [%s] %s:%d Volatile range changed end, finalized through end time=%f", (uint8_t *)&v3, 0x26u);
}

- (void)newPCMSampleBufferWithSamples:numSamples:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to init PCM audio buffer.", v2, v3, v4, v5, v6);
}

- (void)pushSamplesToAnalyzer:numSamples:hostTime:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Sample PCM buffer is nil", v2, v3, v4, v5, v6);
}

- (void)pushSamplesToAnalyzer:numSamples:hostTime:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to init PCM audio buffer.", v2, v3, v4, v5, v6);
}

- (void)pushSamplesToAnalyzer:numSamples:hostTime:.cold.3()
{
  OUTLINED_FUNCTION_5();
  *(void *)&void v3[6] = "_VCAudioCaptions_ConvertSamplesToPCM";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d AudioConverterFillComplexBuffer failed with result=%d", v2, *(const char **)v3, (unint64_t)"_VCAudioCaptions_ConvertSamplesToPCM" >> 16, v4);
}

- (void)pushSamplesToRecognizer:numSamples:hostTime:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Sample buffer is nil", v2, v3, v4, v5, v6);
}

- (void)speechRecognitionTask:(NSObject *)a3 didFinishSuccessfully:.cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = objc_msgSend((id)objc_msgSend(a2, "error"), "localizedDescription");
  objc_msgSend((id)objc_msgSend(a2, "error"), "code");
  int v9 = 136316162;
  uint64_t v10 = a1;
  OUTLINED_FUNCTION_5_1();
  uint64_t v11 = "-[VCAudioCaptions speechRecognitionTask:didFinishSuccessfully:]";
  OUTLINED_FUNCTION_3();
  int v12 = 1522;
  __int16 v13 = 2112;
  uint64_t v14 = v6;
  __int16 v15 = v7;
  int v16 = v8;
  _os_log_error_impl(&dword_1E1EA4000, a3, OS_LOG_TYPE_ERROR, " [%s] %s:%d Task failed with error: %@, status: %d", (uint8_t *)&v9, 0x2Cu);
}

- (void)speechAnalyzer:didStopTranscriptionWithError:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Analyzer failed with error=%@");
}

@end