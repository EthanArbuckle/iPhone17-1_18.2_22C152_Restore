@interface SFSpeechAudioBufferRecognitionRequest
- (AVAudioFormat)nativeAudioFormat;
- (SFSpeechAudioBufferRecognitionRequest)init;
- (id)_initWithNarrowband:(BOOL)a3;
- (id)_startedConnectionWithLanguageCode:(id)a3 delegate:(id)a4 taskHint:(int64_t)a5 requestIdentifier:(id)a6;
- (id)_startedLocalConnectionWithLanguageCode:(id)a3 delegate:(id)a4 taskHint:(int64_t)a5 requestIdentifier:(id)a6 taskIdentifier:(id)a7;
- (void)_appendAudioPCMBuffer:(id *)a1;
- (void)_drainAndClearAudioConverter;
- (void)_endAudio;
- (void)_handleAudioBuffersWithDelegate:(uint64_t)a1;
- (void)appendAudioPCMBuffer:(AVAudioPCMBuffer *)audioPCMBuffer;
- (void)appendAudioSampleBuffer:(CMSampleBufferRef)sampleBuffer;
- (void)endAudio;
@end

@implementation SFSpeechAudioBufferRecognitionRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_converter, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_queuedBuffers, 0);

  objc_destroyWeak((id *)&self->_bufferDelegate);
}

- (void)endAudio
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__SFSpeechAudioBufferRecognitionRequest_endAudio__block_invoke;
  block[3] = &unk_1E61557A0;
  block[4] = self;
  dispatch_async(queue, block);
}

void __49__SFSpeechAudioBufferRecognitionRequest_endAudio__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 104));

  uint64_t v3 = *(void *)(a1 + 32);
  if (WeakRetained)
  {
    -[SFSpeechAudioBufferRecognitionRequest _endAudio](v3);
  }
  else
  {
    *(unsigned char *)(v3 + 136) = 1;
  }
}

- (void)_endAudio
{
  if (a1)
  {
    -[SFSpeechAudioBufferRecognitionRequest _drainAndClearAudioConverter](a1);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 104));
    [WeakRetained stopSpeech];
  }
}

- (void)_drainAndClearAudioConverter
{
  if (*(void *)(a1 + 128))
  {
    while (1)
    {
      id v2 = objc_alloc(MEMORY[0x1E4F153B0]);
      uint64_t v3 = [(id)a1 nativeAudioFormat];
      v4 = (void *)[v2 initWithPCMFormat:v3 frameCapacity:8000];

      [v4 setFrameLength:8000];
      v5 = *(void **)(a1 + 128);
      id v12 = 0;
      uint64_t v6 = [v5 convertToBuffer:v4 error:&v12 withInputFromBlock:&__block_literal_global_2153];
      id v7 = v12;
      v8 = v7;
      if (v6 == 2) {
        break;
      }
      if (v6 == 3)
      {
        NSLog(&cfstr_CouldNotDrainC.isa, v7);
        break;
      }
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 104));
      v10 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", *objc_msgSend(v4, "int16ChannelData"), 2 * objc_msgSend(v4, "frameLength"));
      [WeakRetained addRecordedSpeechSampleData:v10];

      if (v6 == 1) {
        break;
      }
    }
    v11 = *(void **)(a1 + 128);
    *(void *)(a1 + 128) = 0;
  }
}

uint64_t __69__SFSpeechAudioBufferRecognitionRequest__drainAndClearAudioConverter__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  *a3 = 2;
  return 0;
}

- (void)appendAudioSampleBuffer:(CMSampleBufferRef)sampleBuffer
{
  FormatDescription = CMSampleBufferGetFormatDescription(sampleBuffer);
  if (FormatDescription)
  {
    id v8 = (id)[objc_alloc(MEMORY[0x1E4F153A0]) initWithStreamDescription:CMAudioFormatDescriptionGetStreamBasicDescription(FormatDescription)];
    uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F153B0]) initWithPCMFormat:v8 frameCapacity:CMSampleBufferGetNumSamples(sampleBuffer)];
    [v6 setFrameLength:CMSampleBufferGetNumSamples(sampleBuffer)];
    int32_t NumSamples = CMSampleBufferGetNumSamples(sampleBuffer);
    CMSampleBufferCopyPCMDataIntoAudioBufferList(sampleBuffer, 0, NumSamples, (AudioBufferList *)[v6 mutableAudioBufferList]);
    [(SFSpeechAudioBufferRecognitionRequest *)self appendAudioPCMBuffer:v6];
  }
}

- (void)appendAudioPCMBuffer:(AVAudioPCMBuffer *)audioPCMBuffer
{
  v4 = audioPCMBuffer;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __62__SFSpeechAudioBufferRecognitionRequest_appendAudioPCMBuffer___block_invoke;
  v7[3] = &unk_1E61557F0;
  v7[4] = self;
  id v8 = v4;
  uint64_t v6 = v4;
  dispatch_async(queue, v7);
}

void __62__SFSpeechAudioBufferRecognitionRequest_appendAudioPCMBuffer___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 104));

  uint64_t v3 = *(void *)(a1 + 32);
  if (WeakRetained)
  {
    v4 = *(void **)(a1 + 40);
    v5 = *(id **)(a1 + 32);
    -[SFSpeechAudioBufferRecognitionRequest _appendAudioPCMBuffer:](v5, v4);
  }
  else
  {
    uint64_t v6 = *(void **)(v3 + 112);
    if (v6)
    {
      id v7 = v6;
      id v8 = *(void **)(v3 + 112);
      *(void *)(v3 + 112) = v7;
    }
    else
    {
      id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v10 = *(void *)(a1 + 32);
      id v8 = *(void **)(v10 + 112);
      *(void *)(v10 + 112) = v9;
    }

    uint64_t v11 = *(void *)(a1 + 40);
    id v12 = *(void **)(*(void *)(a1 + 32) + 112);
    [v12 addObject:v11];
  }
}

- (void)_appendAudioPCMBuffer:(id *)a1
{
  id v3 = a2;
  if (a1)
  {
    id v29 = v3;
    v4 = [a1 nativeAudioFormat];
    v5 = [v29 format];
    int v6 = [v4 isEqual:v5];

    if (v6)
    {
      -[SFSpeechAudioBufferRecognitionRequest _drainAndClearAudioConverter]((uint64_t)a1);
      id v7 = (void *)[v29 int16ChannelData];
      if (!v7)
      {
        v27 = [MEMORY[0x1E4F28B00] currentHandler];
        [v27 handleFailureInMethod:sel__appendAudioPCMBuffer_ object:a1 file:@"SFSpeechRecognitionRequest.m" lineNumber:527 description:@"Invalid audio format"];
      }
      id WeakRetained = objc_loadWeakRetained(a1 + 13);
      id v9 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", *v7, 2 * objc_msgSend(v29, "frameLength"));
      [WeakRetained addRecordedSpeechSampleData:v9];
    }
    else
    {
      id v10 = v29;
      uint64_t v11 = [v10 format];
      uint64_t v12 = [a1 nativeAudioFormat];
      v13 = [a1[16] inputFormat];
      char v14 = [v13 isEqual:v11];

      if ((v14 & 1) == 0)
      {
        -[SFSpeechAudioBufferRecognitionRequest _drainAndClearAudioConverter]((uint64_t)a1);
        uint64_t v15 = [objc_alloc(MEMORY[0x1E4F15370]) initFromFormat:v11 toFormat:v12];
        id v16 = a1[16];
        a1[16] = (id)v15;

        [a1[16] setSampleRateConverterQuality:127];
      }
      v28 = (void *)v12;
      v34[0] = 0;
      v34[1] = v34;
      v34[2] = 0x2020000000;
      char v35 = 0;
      while (1)
      {
        id v17 = objc_alloc(MEMORY[0x1E4F153B0]);
        v18 = [a1 nativeAudioFormat];
        v19 = (void *)[v17 initWithPCMFormat:v18 frameCapacity:8000];

        [v19 setFrameLength:8000];
        id v20 = a1[16];
        v30[0] = MEMORY[0x1E4F143A8];
        v30[1] = 3221225472;
        v30[2] = __66__SFSpeechAudioBufferRecognitionRequest__convertAndFeedPCMBuffer___block_invoke;
        v30[3] = &unk_1E6155838;
        v32 = v34;
        id v33 = 0;
        id v21 = v10;
        id v31 = v21;
        uint64_t v22 = [v20 convertToBuffer:v19 error:&v33 withInputFromBlock:v30];
        id v23 = v33;
        v24 = v23;
        if (v22 == 2) {
          break;
        }
        if (v22 == 3)
        {
          NSLog(&cfstr_CouldNotRunAud.isa, v23);
          break;
        }
        id v25 = objc_loadWeakRetained(a1 + 13);
        v26 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", *objc_msgSend(v19, "int16ChannelData"), 2 * objc_msgSend(v19, "frameLength"));
        [v25 addRecordedSpeechSampleData:v26];

        if (v22 == 1) {
          goto LABEL_15;
        }
      }

LABEL_15:
      _Block_object_dispose(v34, 8);
    }
    id v3 = v29;
  }
}

id __66__SFSpeechAudioBufferRecognitionRequest__convertAndFeedPCMBuffer___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(unsigned char *)(v3 + 24))
  {
    id v4 = 0;
    *a3 = 1;
  }
  else
  {
    *(unsigned char *)(v3 + 24) = 1;
    *a3 = 0;
    id v4 = *(id *)(a1 + 32);
  }

  return v4;
}

- (id)_startedLocalConnectionWithLanguageCode:(id)a3 delegate:(id)a4 taskHint:(int64_t)a5 requestIdentifier:(id)a6 taskIdentifier:(id)a7
{
  p_bufferDelegate = &self->_bufferDelegate;
  id v14 = a7;
  id v15 = a6;
  id v16 = a4;
  id v17 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_bufferDelegate);

  if (WeakRetained)
  {
    id v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2, self, @"SFSpeechRecognitionRequest.m", 506, @"%@ cannot be re-used", objc_opt_class() object file lineNumber description];
  }
  v19 = [[SFLocalSpeechRecognitionClient alloc] initWithDelegate:v16];
  id v20 = -[SFSpeechRecognitionRequest _requestParametersWithTaskHint:requestIdentifier:taskIdentifier:narrowband:language:]((uint64_t)self, a5, v15, v14, self->_narrowband, v17);

  id v21 = -[SFSpeechRecognitionRequest _sandboxExtensionsWithError:]((uint64_t)self);
  [(SFLocalSpeechRecognitionClient *)v19 initializeWithSandboxExtensions:v21];
  [(SFLocalSpeechRecognitionClient *)v19 startRecordedAudioDictationWithParameters:v20];
  -[SFSpeechAudioBufferRecognitionRequest _handleAudioBuffersWithDelegate:]((uint64_t)self, v16);

  return v19;
}

- (void)_handleAudioBuffersWithDelegate:(uint64_t)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    v5 = *(NSObject **)(a1 + 120);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __73__SFSpeechAudioBufferRecognitionRequest__handleAudioBuffersWithDelegate___block_invoke;
    v6[3] = &unk_1E61557F0;
    v6[4] = a1;
    id v7 = v3;
    dispatch_async(v5, v6);
  }
}

void __73__SFSpeechAudioBufferRecognitionRequest__handleAudioBuffersWithDelegate___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  objc_storeWeak((id *)(*(void *)(a1 + 32) + 104), *(id *)(a1 + 40));
  id v2 = *(id *)(*(void *)(a1 + 32) + 112);
  if ([v2 count])
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v3 = v2;
    uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v13;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v13 != v6) {
            objc_enumerationMutation(v3);
          }
          id v8 = *(void **)(*((void *)&v12 + 1) + 8 * v7);
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            -[SFSpeechAudioBufferRecognitionRequest _appendAudioPCMBuffer:](*(id **)(a1 + 32), v8);
          }
          ++v7;
        }
        while (v5 != v7);
        uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v5);
    }
  }
  uint64_t v9 = *(void *)(a1 + 32);
  id v10 = *(void **)(v9 + 112);
  *(void *)(v9 + 112) = 0;

  uint64_t v11 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v11 + 136)) {
    -[SFSpeechAudioBufferRecognitionRequest _endAudio](v11);
  }
}

- (id)_startedConnectionWithLanguageCode:(id)a3 delegate:(id)a4 taskHint:(int64_t)a5 requestIdentifier:(id)a6
{
  v30[5] = *MEMORY[0x1E4F143B8];
  uint64_t v11 = (__CFString *)a3;
  id v12 = a4;
  id v13 = a6;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_bufferDelegate);

  if (WeakRetained)
  {
    v28 = [MEMORY[0x1E4F28B00] currentHandler];
    [v28 handleFailureInMethod:a2, self, @"SFSpeechRecognitionRequest.m", 474, @"%@ cannot be re-used", objc_opt_class() object file lineNumber description];
  }
  id v15 = objc_alloc_init(MEMORY[0x1E4F4E450]);
  [v15 setDelegate:v12];
  id v16 = -[SFSpeechRecognitionRequest _dictationOptionsWithTaskHint:requestIdentifier:]((uint64_t)self, a5, v13);

  [v16 setFieldLabel:@"SFSpeechPreecordedRequest"];
  if (![(__CFString *)v11 caseInsensitiveCompare:@"hi-IN-translit"])
  {
    uint64_t v17 = @"hi-IN";

    [v16 setKeyboardIdentifier:@"Translit"];
    uint64_t v11 = @"hi-IN";
  }
  if (+[SFUtilities isSpeechXPCEnabled])
  {
    if (v11) {
      v18 = v11;
    }
    else {
      v18 = @"none";
    }
    v30[0] = v18;
    v29[0] = @"language";
    v29[1] = @"task";
    uint64_t v19 = +[SFUtilities taskNameFromTaskHint:a5];
    id v20 = (void *)v19;
    if (v19) {
      id v21 = (__CFString *)v19;
    }
    else {
      id v21 = @"none";
    }
    v30[1] = v21;
    v29[2] = @"narrowband";
    uint64_t v22 = [NSNumber numberWithBool:self->_narrowband];
    v30[2] = v22;
    v29[3] = @"appname";
    uint64_t v23 = [v16 applicationName];
    v24 = (void *)v23;
    if (v23) {
      id v25 = (__CFString *)v23;
    }
    else {
      id v25 = @"none";
    }
    v29[4] = @"ondevice";
    v30[3] = v25;
    void v30[4] = MEMORY[0x1E4F1CC28];
    v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:5];

    +[SFLocalSpeechRecognitionClient logCoreAnalyticsEvent:@"com.apple.speechapi.RequestStarted" withAnalytics:v26];
    -[SFSpeechRecognitionRequest _setAFDictationRequestParams:]((uint64_t)self, v26);
  }
  [v15 startRecordedAudioDictationWithOptions:v16 forLanguage:v11];
  -[SFSpeechAudioBufferRecognitionRequest _handleAudioBuffersWithDelegate:]((uint64_t)self, v12);

  return v15;
}

- (AVAudioFormat)nativeAudioFormat
{
  v4[0] = SupportedASBD;
  v4[1] = unk_1B724E4C8;
  uint64_t v5 = 16;
  if (self->_narrowband) {
    *(void *)&v4[0] = 0x40BF400000000000;
  }
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F153A0]) initWithStreamDescription:v4];

  return (AVAudioFormat *)v2;
}

- (SFSpeechAudioBufferRecognitionRequest)init
{
  return (SFSpeechAudioBufferRecognitionRequest *)[(SFSpeechAudioBufferRecognitionRequest *)self _initWithNarrowband:0];
}

- (id)_initWithNarrowband:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SFSpeechAudioBufferRecognitionRequest;
  uint64_t v4 = [(SFSpeechRecognitionRequest *)&v8 init];
  if (v4)
  {
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.SFSpeechAudioBufferRecognitionRequest", 0);
    queue = v4->_queue;
    v4->_queue = (OS_dispatch_queue *)v5;

    v4->_narrowband = a3;
  }
  return v4;
}

@end