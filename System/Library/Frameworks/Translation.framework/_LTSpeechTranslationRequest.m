@interface _LTSpeechTranslationRequest
- (BOOL)autoEndpoint;
- (BOOL)enableVAD;
- (NSArray)_offlineASRModelURLs;
- (NSURL)_lidModelURL;
- (_LTSpeechTranslationDelegate)delegate;
- (_LTSpeechTranslationRequest)initWithLocalePair:(id)a3;
- (_LTSpeechTranslationRequest)initWithLocalePair:(id)a3 suggestedUniqueID:(id)a4;
- (_LTSpeechTranslationRequest)initWithSourceLocale:(id)a3 targetLocale:(id)a4;
- (_LTSpeechTranslationRequest)initWithSourceLocale:(id)a3 targetLocale:(id)a4 suggestedUniqueID:(id)a5;
- (id)loggingType;
- (id)nativeAudioFormat;
- (id)requestContext;
- (int64_t)_asrConfidenceThreshold;
- (int64_t)_lidThreshold;
- (void)_appendAudioPCMBuffer:(id)a3;
- (void)_appendAudioSampleBuffer:(opaqueCMSampleBuffer *)a3 simulateRealtime:(BOOL)a4;
- (void)_convertAndFeedPCMBuffer:(id)a3;
- (void)_drainAndClearAudioConverter;
- (void)_simulateRealtimeBehavior:(id)a3;
- (void)_startTranslationWithService:(id)a3 done:(id)a4;
- (void)_translationFailedWithError:(id)a3;
- (void)append:(opaqueCMSampleBuffer *)a3 simulateRealtime:(BOOL)a4;
- (void)appendAudioPCMBuffer:(id)a3;
- (void)endAudio;
- (void)hybridEndpointerFoundEndpoint;
- (void)languageDetectionCompleted;
- (void)languageDetectionResult:(id)a3;
- (void)serverEndpointerFeatures:(id)a3 locale:(id)a4;
- (void)setAutoEndpoint:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setEnableVAD:(BOOL)a3;
- (void)set_asrConfidenceThreshold:(int64_t)a3;
- (void)set_lidModelURL:(id)a3;
- (void)set_lidThreshold:(int64_t)a3;
- (void)set_offlineASRModelURLs:(id)a3;
- (void)speechActivityDetected;
- (void)speechRecognitionResult:(id)a3;
- (void)translationDidFinishWithError:(id)a3;
- (void)translatorDidTranslate:(id)a3;
@end

@implementation _LTSpeechTranslationRequest

- (id)loggingType
{
  return @"speech";
}

- (id)requestContext
{
  v8.receiver = self;
  v8.super_class = (Class)_LTSpeechTranslationRequest;
  v3 = [(_LTTranslationRequest *)&v8 requestContext];
  v4 = [(_LTTranslationRequest *)self outputFileURL];
  [v3 setOutputFileURL:v4];

  v5 = [(_LTSpeechTranslationRequest *)self _offlineASRModelURLs];
  [v3 setAsrModelURLs:v5];

  objc_msgSend(v3, "setAutoEndpoint:", -[_LTSpeechTranslationRequest autoEndpoint](self, "autoEndpoint"));
  objc_msgSend(v3, "setLidThreshold:", -[_LTSpeechTranslationRequest _lidThreshold](self, "_lidThreshold"));
  objc_msgSend(v3, "setAsrConfidenceThreshold:", -[_LTSpeechTranslationRequest _asrConfidenceThreshold](self, "_asrConfidenceThreshold"));
  objc_msgSend(v3, "setEnableVAD:", -[_LTSpeechTranslationRequest enableVAD](self, "enableVAD"));
  uint64_t v6 = 1;
  [v3 setCancelOnCleanup:1];
  [v3 setRoute:0];
  if (![(_LTTranslationRequest *)self forcedOfflineTranslation])
  {
    if (![(_LTTranslationRequest *)self _forcedOnlineTranslation]) {
      goto LABEL_5;
    }
    uint64_t v6 = 2;
  }
  [v3 setRoute:v6];
LABEL_5:

  return v3;
}

- (_LTSpeechTranslationRequest)initWithSourceLocale:(id)a3 targetLocale:(id)a4
{
  return [(_LTSpeechTranslationRequest *)self initWithSourceLocale:a3 targetLocale:a4 suggestedUniqueID:0];
}

- (_LTSpeechTranslationRequest)initWithSourceLocale:(id)a3 targetLocale:(id)a4 suggestedUniqueID:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [[_LTLocalePair alloc] initWithSourceLocale:v10 targetLocale:v9];

  v12 = [(_LTSpeechTranslationRequest *)self initWithLocalePair:v11 suggestedUniqueID:v8];
  return v12;
}

- (_LTSpeechTranslationRequest)initWithLocalePair:(id)a3
{
  return [(_LTSpeechTranslationRequest *)self initWithLocalePair:a3 suggestedUniqueID:0];
}

- (_LTSpeechTranslationRequest)initWithLocalePair:(id)a3 suggestedUniqueID:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)_LTSpeechTranslationRequest;
  v4 = [(_LTTranslationRequest *)&v9 initWithLocalePair:a3 suggestedUniqueID:a4];
  if (v4)
  {
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.siri.translation.speechrequest", 0);
    queue = v4->_queue;
    v4->_queue = (OS_dispatch_queue *)v5;

    v4->__asrConfidenceThreshold = -1;
    v4->__lidThreshold = -1;
    v4->_autoEndpoint = 0;
    v7 = v4;
  }

  return v4;
}

- (id)nativeAudioFormat
{
  v2 = (void *)[objc_alloc(MEMORY[0x263EF9388]) initWithStreamDescription:&SupportedASBD];

  return v2;
}

- (void)_startTranslationWithService:(id)a3 done:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _LTOSLogTranslationEngine();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_24639B000, v8, OS_LOG_TYPE_DEFAULT, "Start speech translation with service", (uint8_t *)buf, 2u);
  }
  objc_super v9 = [(_LTTranslationRequest *)self logIdentifier];
  id v10 = [(_LTTranslationRequest *)self localePair];
  [(_LTTranslationRequest *)self setLogIdentifier:v9];

  objc_initWeak(buf, self);
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __65___LTSpeechTranslationRequest__startTranslationWithService_done___block_invoke;
  block[3] = &unk_2651DB9F8;
  objc_copyWeak(&v17, buf);
  id v15 = v6;
  id v16 = v7;
  id v12 = v6;
  id v13 = v7;
  dispatch_async(queue, block);

  objc_destroyWeak(&v17);
  objc_destroyWeak(buf);
}

- (void)_translationFailedWithError:(id)a3
{
  id v7 = a3;
  v4 = [(_LTSpeechTranslationRequest *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(_LTSpeechTranslationRequest *)self delegate];
    [v6 translationDidFinishWithError:v7];
  }
}

- (void)_appendAudioPCMBuffer:(id)a3
{
  id v9 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v4 = [(_LTSpeechTranslationRequest *)self nativeAudioFormat];
  char v5 = [v9 format];
  int v6 = [v4 isEqual:v5];

  if (v6)
  {
    id v7 = (void *)[v9 int16ChannelData];
    id v8 = objc_msgSend(MEMORY[0x263EFF8F8], "dataWithBytes:length:", *v7, 2 * objc_msgSend(v9, "frameLength"));
    [(_LTTranslationService *)self->_service addSpeechAudioData:v8];
  }
  else
  {
    [(_LTSpeechTranslationRequest *)self _convertAndFeedPCMBuffer:v9];
  }
}

- (void)appendAudioPCMBuffer:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __52___LTSpeechTranslationRequest_appendAudioPCMBuffer___block_invoke;
  v7[3] = &unk_2651DC6A0;
  objc_copyWeak(&v10, &location);
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)_simulateRealtimeBehavior:(id)a3
{
  id v17 = a3;
  uint64_t v4 = [v17 length];
  char v5 = [MEMORY[0x263F08AB0] processInfo];
  [v5 systemUptime];
  double v7 = v6;

  if (v4 >= 1)
  {
    uint64_t v8 = 0;
    double v9 = 0.0;
    double v10 = 0.0;
    do
    {
      double v9 = v9 + 0.02;
      [MEMORY[0x263F08B88] sleepForTimeInterval:v9 - v10];
      v11 = [MEMORY[0x263F08AB0] processInfo];
      [v11 systemUptime];
      double v10 = v12 - v7;

      if (v4 >= 640) {
        uint64_t v13 = 640;
      }
      else {
        uint64_t v13 = v4;
      }
      service = self->_service;
      id v15 = objc_msgSend(v17, "subdataWithRange:", v8, v13);
      [(_LTTranslationService *)service addSpeechAudioData:v15];

      v8 += v13;
      BOOL v16 = v4 <= v13;
      v4 -= v13;
    }
    while (!v16);
  }
}

- (void)_appendAudioSampleBuffer:(opaqueCMSampleBuffer *)a3 simulateRealtime:(BOOL)a4
{
  BOOL v4 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  FormatDescription = CMSampleBufferGetFormatDescription(a3);
  StreamBasicDescription = CMAudioFormatDescriptionGetStreamBasicDescription(FormatDescription);
  double mSampleRate = StreamBasicDescription->mSampleRate;
  if ((StreamBasicDescription->mSampleRate == 16000.0 || mSampleRate == 8000.0)
    && StreamBasicDescription->mFormatID == 1819304813
    && StreamBasicDescription->mFormatFlags == 12
    && StreamBasicDescription->mBytesPerPacket == 2
    && StreamBasicDescription->mFramesPerPacket == 1
    && StreamBasicDescription->mBytesPerFrame == 2
    && StreamBasicDescription->mChannelsPerFrame == 1
    && StreamBasicDescription->mBitsPerChannel == 16)
  {
    [(_LTSpeechTranslationRequest *)self _drainAndClearAudioConverter];
    if (CMSampleBufferGetNumSamples(a3))
    {
      size_t totalLengthOut = 0;
      dataPointerOut = 0;
      DataBuffer = CMSampleBufferGetDataBuffer(a3);
      if (CMBlockBufferGetDataPointer(DataBuffer, 0, 0, &totalLengthOut, &dataPointerOut))
      {
        size_t DataLength = CMBlockBufferGetDataLength(DataBuffer);
        id v12 = (id) [objc_alloc(MEMORY[0x263EFF990]) initWithLength:DataLength];
        OSStatus v13 = CMBlockBufferCopyDataBytes(DataBuffer, 0, DataLength, (void *)[v12 mutableBytes]);
        if (v13)
        {
          int v14 = v13;
          id v15 = _LTOSLogSpeech();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
            -[_LTSpeechTranslationRequest _appendAudioSampleBuffer:simulateRealtime:](v14, v15);
          }
          id v16 = 0;
        }
        else
        {
          id v16 = v12;
        }
      }
      else
      {
        id v16 = [MEMORY[0x263EFF8F8] dataWithBytes:dataPointerOut length:totalLengthOut];
      }
      if (v16)
      {
        if (v4) {
          [(_LTSpeechTranslationRequest *)self _simulateRealtimeBehavior:v16];
        }
        else {
          [(_LTTranslationService *)self->_service addSpeechAudioData:v16];
        }
      }
    }
  }
  else
  {
    id v19 = (id)[objc_alloc(MEMORY[0x263EF9388]) initWithStreamDescription:StreamBasicDescription];
    id v17 = (void *)[objc_alloc(MEMORY[0x263EF93B0]) initWithPCMFormat:v19 frameCapacity:CMSampleBufferGetNumSamples(a3)];
    [v17 setFrameLength:CMSampleBufferGetNumSamples(a3)];
    int32_t NumSamples = CMSampleBufferGetNumSamples(a3);
    CMSampleBufferCopyPCMDataIntoAudioBufferList(a3, 0, NumSamples, (AudioBufferList *)[v17 mutableAudioBufferList]);
    [(_LTSpeechTranslationRequest *)self _convertAndFeedPCMBuffer:v17];
  }
}

- (void)append:(opaqueCMSampleBuffer *)a3 simulateRealtime:(BOOL)a4
{
  double v7 = _LTOSLogTranslationEngine();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_24639B000, v7, OS_LOG_TYPE_INFO, "Append audio data", (uint8_t *)buf, 2u);
  }
  objc_initWeak(buf, self);
  uint64_t v8 = a3;
  queue = self->_queue;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __55___LTSpeechTranslationRequest_append_simulateRealtime___block_invoke;
  v11[3] = &unk_2651DBA70;
  objc_copyWeak(&v14, buf);
  id v12 = v8;
  OSStatus v13 = self;
  BOOL v15 = a4;
  double v10 = v8;
  dispatch_async(queue, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(buf);
}

- (void)_drainAndClearAudioConverter
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_24639B000, v0, v1, "Could not drain converter %@", v2, v3, v4, v5, v6);
}

- (void)_convertAndFeedPCMBuffer:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v20 = [v4 format];
  id v19 = [(_LTSpeechTranslationRequest *)self nativeAudioFormat];
  uint64_t v5 = [(AVAudioConverter *)self->_converter inputFormat];
  char v6 = [v5 isEqual:v20];

  if ((v6 & 1) == 0)
  {
    [(_LTSpeechTranslationRequest *)self _drainAndClearAudioConverter];
    double v7 = (AVAudioConverter *)[objc_alloc(MEMORY[0x263EF9340]) initFromFormat:v20 toFormat:v19];
    converter = self->_converter;
    self->_converter = v7;

    [(AVAudioConverter *)self->_converter setSampleRateConverterQuality:127];
  }
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x2020000000;
  char v26 = 0;
  do
  {
    id v9 = objc_alloc(MEMORY[0x263EF93B0]);
    double v10 = [(_LTSpeechTranslationRequest *)self nativeAudioFormat];
    v11 = (void *)[v9 initWithPCMFormat:v10 frameCapacity:8000];

    [v11 setFrameLength:8000];
    id v12 = self->_converter;
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __56___LTSpeechTranslationRequest__convertAndFeedPCMBuffer___block_invoke;
    v21[3] = &unk_2651DC6E8;
    v23 = v25;
    id v24 = 0;
    id v13 = v4;
    id v22 = v13;
    uint64_t v14 = [(AVAudioConverter *)v12 convertToBuffer:v11 error:&v24 withInputFromBlock:v21];
    id v15 = v24;
    if (v14 == 2) {
      goto LABEL_8;
    }
    if (v14 == 3)
    {
      id v16 = _LTOSLogSpeech();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v28 = v15;
        _os_log_error_impl(&dword_24639B000, v16, OS_LOG_TYPE_ERROR, "Could not run audio converter %@", buf, 0xCu);
      }
LABEL_8:
      int v17 = 1;
      goto LABEL_12;
    }
    v18 = objc_msgSend(MEMORY[0x263EFF8F8], "dataWithBytes:length:", *objc_msgSend(v11, "int16ChannelData"), 2 * objc_msgSend(v11, "frameLength"));
    [(_LTTranslationService *)self->_service addSpeechAudioData:v18];

    if (v14 == 1) {
      int v17 = 2;
    }
    else {
      int v17 = 0;
    }
LABEL_12:
  }
  while (!v17);
  _Block_object_dispose(v25, 8);
}

- (void)endAudio
{
  objc_initWeak(&location, self);
  queue = self->_queue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __39___LTSpeechTranslationRequest_endAudio__block_invoke;
  v4[3] = &unk_2651DBA48;
  objc_copyWeak(&v5, &location);
  dispatch_async(queue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)speechActivityDetected
{
  uint64_t v3 = [(_LTSpeechTranslationRequest *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(_LTSpeechTranslationRequest *)self delegate];
    [v5 speechActivityDetected];
  }
}

- (void)languageDetectionCompleted
{
  uint64_t v3 = [(_LTSpeechTranslationRequest *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(_LTSpeechTranslationRequest *)self delegate];
    [v5 languageDetectionCompleted];
  }
}

- (void)languageDetectionResult:(id)a3
{
  id v7 = a3;
  char v4 = [(_LTSpeechTranslationRequest *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    char v6 = [(_LTSpeechTranslationRequest *)self delegate];
    [v6 languageDetectionResult:v7];
  }
}

- (void)hybridEndpointerFoundEndpoint
{
  uint64_t v3 = [(_LTSpeechTranslationRequest *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(_LTSpeechTranslationRequest *)self delegate];
    [v5 hybridEndpointerFoundEndpoint];
  }
}

- (void)serverEndpointerFeatures:(id)a3 locale:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  id v7 = [(_LTSpeechTranslationRequest *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    id v9 = [(_LTSpeechTranslationRequest *)self delegate];
    [v9 serverEndpointerFeatures:v10 locale:v6];
  }
}

- (void)speechRecognitionResult:(id)a3
{
  id v7 = a3;
  char v4 = [(_LTSpeechTranslationRequest *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(_LTSpeechTranslationRequest *)self delegate];
    [v6 speechRecognitionResult:v7];
  }
}

- (void)translatorDidTranslate:(id)a3
{
  id v7 = a3;
  char v4 = [(_LTSpeechTranslationRequest *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(_LTSpeechTranslationRequest *)self delegate];
    [v6 translatorDidTranslate:v7];

    [(_LTTranslationRequest *)self logIdentifier];
  }
}

- (void)translationDidFinishWithError:(id)a3
{
  id v8 = a3;
  char v4 = [(_LTSpeechTranslationRequest *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(_LTSpeechTranslationRequest *)self delegate];
    [v6 translationDidFinishWithError:v8];

    [(_LTTranslationRequest *)self logIdentifier];
  }
  done = (void (**)(void))self->_done;
  if (done) {
    done[2]();
  }
}

- (_LTSpeechTranslationDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (_LTSpeechTranslationDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSURL)_lidModelURL
{
  return self->__lidModelURL;
}

- (void)set_lidModelURL:(id)a3
{
}

- (NSArray)_offlineASRModelURLs
{
  return self->__offlineASRModelURLs;
}

- (void)set_offlineASRModelURLs:(id)a3
{
}

- (int64_t)_asrConfidenceThreshold
{
  return self->__asrConfidenceThreshold;
}

- (void)set_asrConfidenceThreshold:(int64_t)a3
{
  self->__asrConfidenceThreshold = a3;
}

- (int64_t)_lidThreshold
{
  return self->__lidThreshold;
}

- (void)set_lidThreshold:(int64_t)a3
{
  self->__lidThreshold = a3;
}

- (BOOL)autoEndpoint
{
  return self->_autoEndpoint;
}

- (void)setAutoEndpoint:(BOOL)a3
{
  self->_autoEndpoint = a3;
}

- (BOOL)enableVAD
{
  return self->_enableVAD;
}

- (void)setEnableVAD:(BOOL)a3
{
  self->_enableVAD = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__offlineASRModelURLs, 0);
  objc_storeStrong((id *)&self->__lidModelURL, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_done, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_queuedBuffers, 0);

  objc_storeStrong((id *)&self->_converter, 0);
}

- (void)_appendAudioSampleBuffer:(int)a1 simulateRealtime:(NSObject *)a2 .cold.1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_24639B000, a2, OS_LOG_TYPE_ERROR, "CMBlockBufferCopyDataBytes could not copy data: %d", (uint8_t *)v2, 8u);
}

@end