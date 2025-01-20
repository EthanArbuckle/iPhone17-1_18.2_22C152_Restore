@interface SFSpeechURLRecognitionRequest
- (NSURL)URL;
- (SFSpeechURLRecognitionRequest)init;
- (SFSpeechURLRecognitionRequest)initWithURL:(NSURL *)URL;
- (id)_startedConnectionWithLanguageCode:(id)a3 delegate:(id)a4 taskHint:(int64_t)a5 requestIdentifier:(id)a6;
- (id)_startedLocalConnectionWithLanguageCode:(id)a3 delegate:(id)a4 taskHint:(int64_t)a5 requestIdentifier:(id)a6 taskIdentifier:(id)a7;
- (void)_handlePreRecordedAudioWithAsset:(void *)a3 audioTracks:(char)a4 narrowband:(void *)a5 addSpeechDataBlock:(void *)a6 stopSpeechBlock:(void *)a7 cancelSpeechWithErrorBlock:;
@end

@implementation SFSpeechURLRecognitionRequest

- (void).cxx_destruct
{
}

- (NSURL)URL
{
  return self->_URL;
}

- (id)_startedLocalConnectionWithLanguageCode:(id)a3 delegate:(id)a4 taskHint:(int64_t)a5 requestIdentifier:(id)a6 taskIdentifier:(id)a7
{
  v38[1] = *MEMORY[0x1E4F143B8];
  id v12 = a4;
  id v13 = a7;
  id v14 = a6;
  id v15 = a3;
  v16 = [[SFLocalSpeechRecognitionClient alloc] initWithDelegate:v12];
  v17 = (void *)MEMORY[0x1E4F166C8];
  URL = self->_URL;
  uint64_t v37 = *MEMORY[0x1E4F157B0];
  v38[0] = MEMORY[0x1E4F1CC38];
  v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:&v37 count:1];
  v20 = [v17 URLAssetWithURL:URL options:v19];

  v21 = [v20 tracksWithMediaType:*MEMORY[0x1E4F15BA8]];
  BOOL v22 = IsNarrowBand(v21);
  v23 = -[SFSpeechRecognitionRequest _requestParametersWithTaskHint:requestIdentifier:taskIdentifier:narrowband:language:]((uint64_t)self, a5, v14, v13, v22, v15);

  v24 = -[SFSpeechRecognitionRequest _sandboxExtensionsWithError:]((uint64_t)self);
  [(SFLocalSpeechRecognitionClient *)v16 initializeWithSandboxExtensions:v24];
  [(SFLocalSpeechRecognitionClient *)v16 startRecordedAudioDictationWithParameters:v23];
  LOBYTE(v14) = [v23 narrowband];
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __124__SFSpeechURLRecognitionRequest__startedLocalConnectionWithLanguageCode_delegate_taskHint_requestIdentifier_taskIdentifier___block_invoke;
  v35[3] = &unk_1E6155778;
  v36 = v16;
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __124__SFSpeechURLRecognitionRequest__startedLocalConnectionWithLanguageCode_delegate_taskHint_requestIdentifier_taskIdentifier___block_invoke_2;
  v33[3] = &unk_1E61557A0;
  v34 = v36;
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __124__SFSpeechURLRecognitionRequest__startedLocalConnectionWithLanguageCode_delegate_taskHint_requestIdentifier_taskIdentifier___block_invoke_3;
  v30[3] = &unk_1E61557C8;
  v25 = v34;
  v31 = v25;
  id v32 = v12;
  id v26 = v12;
  -[SFSpeechURLRecognitionRequest _handlePreRecordedAudioWithAsset:audioTracks:narrowband:addSpeechDataBlock:stopSpeechBlock:cancelSpeechWithErrorBlock:]((uint64_t)self, v20, v21, (char)v14, v35, v33, v30);
  v27 = v32;
  v28 = v25;

  return v28;
}

uint64_t __124__SFSpeechURLRecognitionRequest__startedLocalConnectionWithLanguageCode_delegate_taskHint_requestIdentifier_taskIdentifier___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addAudioPacket:a2];
}

uint64_t __124__SFSpeechURLRecognitionRequest__startedLocalConnectionWithLanguageCode_delegate_taskHint_requestIdentifier_taskIdentifier___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) stopSpeech];
}

void __124__SFSpeechURLRecognitionRequest__startedLocalConnectionWithLanguageCode_delegate_taskHint_requestIdentifier_taskIdentifier___block_invoke_3(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 cancelSpeech];
  [*(id *)(a1 + 40) localSpeechRecognitionClient:*(void *)(a1 + 32) speechRecordingDidFail:v4];
}

- (void)_handlePreRecordedAudioWithAsset:(void *)a3 audioTracks:(char)a4 narrowband:(void *)a5 addSpeechDataBlock:(void *)a6 stopSpeechBlock:(void *)a7 cancelSpeechWithErrorBlock:
{
  id v13 = a2;
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  if (a1)
  {
    v18 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __151__SFSpeechURLRecognitionRequest__handlePreRecordedAudioWithAsset_audioTracks_narrowband_addSpeechDataBlock_stopSpeechBlock_cancelSpeechWithErrorBlock___block_invoke;
    block[3] = &unk_1E6155720;
    id v20 = v13;
    char v26 = a4;
    id v21 = v14;
    uint64_t v22 = a1;
    id v23 = v15;
    id v24 = v16;
    id v25 = v17;
    dispatch_async(v18, block);
  }
}

void __151__SFSpeechURLRecognitionRequest__handlePreRecordedAudioWithAsset_audioTracks_narrowband_addSpeechDataBlock_stopSpeechBlock_cancelSpeechWithErrorBlock___block_invoke(uint64_t a1)
{
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  id v21 = __Block_byref_object_copy__2121;
  uint64_t v22 = __Block_byref_object_dispose__2122;
  id v23 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __151__SFSpeechURLRecognitionRequest__handlePreRecordedAudioWithAsset_audioTracks_narrowband_addSpeechDataBlock_stopSpeechBlock_cancelSpeechWithErrorBlock___block_invoke_135;
  v11[3] = &unk_1E61556F8;
  id v12 = *(id *)(a1 + 32);
  id v16 = &v18;
  char v17 = *(unsigned char *)(a1 + 80);
  id v2 = *(id *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  id v4 = *(void **)(a1 + 56);
  id v13 = v2;
  uint64_t v14 = v3;
  id v15 = v4;
  if (__151__SFSpeechURLRecognitionRequest__handlePreRecordedAudioWithAsset_audioTracks_narrowband_addSpeechDataBlock_stopSpeechBlock_cancelSpeechWithErrorBlock___block_invoke_135((uint64_t)v11)) {
    (*(void (**)(void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a1 + 64) + 16))(*(void *)(a1 + 64), v5, v6, v7, v8, v9, v10);
  }
  else {
    (*(void (**)(void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a1 + 72) + 16))(*(void *)(a1 + 72), v19[5], v6, v7, v8, v9, v10);
  }

  _Block_object_dispose(&v18, 8);
}

uint64_t __151__SFSpeechURLRecognitionRequest__handlePreRecordedAudioWithAsset_audioTracks_narrowband_addSpeechDataBlock_stopSpeechBlock_cancelSpeechWithErrorBlock___block_invoke_135(uint64_t a1)
{
  v30[6] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  id v26 = 0;
  uint64_t v3 = [MEMORY[0x1E4F16378] assetReaderWithAsset:v2 error:&v26];
  id v4 = v26;
  uint64_t v5 = v4;
  if (v3)
  {
    if (*(unsigned char *)(a1 + 72)) {
      uint64_t v6 = 8000;
    }
    else {
      uint64_t v6 = 16000;
    }
    v30[0] = &unk_1F1056BD0;
    uint64_t v7 = *MEMORY[0x1E4F15270];
    v29[0] = *MEMORY[0x1E4F151E0];
    v29[1] = v7;
    uint64_t v8 = [NSNumber numberWithUnsignedInteger:v6];
    uint64_t v9 = *MEMORY[0x1E4F15228];
    v30[1] = v8;
    v30[2] = &unk_1F1056BE8;
    uint64_t v10 = *MEMORY[0x1E4F151F0];
    v29[2] = v9;
    v29[3] = v10;
    uint64_t v11 = *MEMORY[0x1E4F151F8];
    v30[3] = &unk_1F1056C00;
    void v30[4] = MEMORY[0x1E4F1CC28];
    uint64_t v12 = *MEMORY[0x1E4F15208];
    v29[4] = v11;
    v29[5] = v12;
    v30[5] = MEMORY[0x1E4F1CC28];
    id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:6];

    uint64_t v14 = [MEMORY[0x1E4F16380] assetReaderAudioMixOutputWithAudioTracks:*(void *)(a1 + 40) audioSettings:v13];
    if (v14)
    {
      if ([v3 canAddOutput:v14])
      {
        [v3 addOutput:v14];
        [v3 startReading];
        uint64_t v15 = [v14 copyNextSampleBuffer];
        if (v15)
        {
          id v16 = (opaqueCMSampleBuffer *)v15;
          do
          {
            if (CMSampleBufferGetNumSamples(v16))
            {
              size_t totalLengthOut = 0;
              dataPointerOut = 0;
              DataBuffer = CMSampleBufferGetDataBuffer(v16);
              if (CMBlockBufferGetDataPointer(DataBuffer, 0, 0, &totalLengthOut, &dataPointerOut))
              {
                size_t DataLength = CMBlockBufferGetDataLength(DataBuffer);
                id v19 = (id) [objc_alloc(MEMORY[0x1E4F1CA58]) initWithLength:DataLength];
                uint64_t v20 = CMBlockBufferCopyDataBytes(DataBuffer, 0, DataLength, (void *)[v19 mutableBytes]);
                if (v20)
                {
                  NSLog(&cfstr_Cmblockbufferc.isa, v20);
                  id v21 = 0;
                }
                else
                {
                  id v21 = v19;
                }
              }
              else
              {
                id v21 = [MEMORY[0x1E4F1C9B8] dataWithBytes:dataPointerOut length:totalLengthOut];
              }
            }
            else
            {
              id v21 = 0;
            }
            CFRelease(v16);
            if (v21) {
              (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
            }

            id v16 = (opaqueCMSampleBuffer *)[v14 copyNextSampleBuffer];
          }
          while (v16);
        }
        uint64_t v22 = 1;
        goto LABEL_24;
      }
      NSLog(&cfstr_CouldNotAddOut.isa, *(void *)(*(void *)(a1 + 48) + 104));
    }
    uint64_t v22 = 0;
LABEL_24:

    goto LABEL_25;
  }
  uint64_t v23 = *(void *)(*(void *)(a1 + 64) + 8);
  id v24 = v4;
  uint64_t v22 = 0;
  id v13 = *(void **)(v23 + 40);
  *(void *)(v23 + 40) = v24;
LABEL_25:

  return v22;
}

- (id)_startedConnectionWithLanguageCode:(id)a3 delegate:(id)a4 taskHint:(int64_t)a5 requestIdentifier:(id)a6
{
  v52[1] = *MEMORY[0x1E4F143B8];
  uint64_t v10 = (__CFString *)a3;
  id v11 = a4;
  uint64_t v12 = (objc_class *)MEMORY[0x1E4F4E450];
  id v13 = a6;
  id v14 = objc_alloc_init(v12);
  v41 = v11;
  [v14 setDelegate:v11];
  uint64_t v15 = -[SFSpeechRecognitionRequest _dictationOptionsWithTaskHint:requestIdentifier:]((uint64_t)self, a5, v13);

  [v15 setFieldLabel:@"SFSpeechPreecordedRequest"];
  if (![(__CFString *)v10 caseInsensitiveCompare:@"hi-IN-translit"])
  {
    id v16 = @"hi-IN";

    [v15 setKeyboardIdentifier:@"Translit"];
    uint64_t v10 = @"hi-IN";
  }
  if (a5 == 1002) {
    [v15 setOriginalAudioFileURL:self->_URL];
  }
  char v17 = (void *)MEMORY[0x1E4F166C8];
  URL = self->_URL;
  uint64_t v51 = *MEMORY[0x1E4F157B0];
  v52[0] = MEMORY[0x1E4F1CC38];
  id v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v52 forKeys:&v51 count:1];
  uint64_t v20 = [v17 URLAssetWithURL:URL options:v19];

  id v21 = [v20 tracksWithMediaType:*MEMORY[0x1E4F15BA8]];
  BOOL v22 = IsNarrowBand(v21);
  if (+[SFUtilities isSpeechXPCEnabled])
  {
    if (v10) {
      uint64_t v23 = v10;
    }
    else {
      uint64_t v23 = @"none";
    }
    v50[0] = v23;
    v49[0] = @"language";
    v49[1] = @"task";
    uint64_t v24 = +[SFUtilities taskNameFromTaskHint:a5];
    id v25 = (void *)v24;
    if (v24) {
      id v26 = (__CFString *)v24;
    }
    else {
      id v26 = @"none";
    }
    v50[1] = v26;
    v49[2] = @"narrowband";
    [NSNumber numberWithBool:v22];
    v40 = v10;
    v27 = v20;
    id v28 = v14;
    v30 = v29 = self;
    v50[2] = v30;
    v49[3] = @"appname";
    uint64_t v31 = [v15 applicationName];
    id v32 = (void *)v31;
    if (v31) {
      v33 = (__CFString *)v31;
    }
    else {
      v33 = @"none";
    }
    v49[4] = @"ondevice";
    v50[3] = v33;
    v50[4] = MEMORY[0x1E4F1CC28];
    v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v50 forKeys:v49 count:5];

    self = v29;
    id v14 = v28;
    uint64_t v20 = v27;
    uint64_t v10 = v40;

    +[SFLocalSpeechRecognitionClient logCoreAnalyticsEvent:@"com.apple.speechapi.RequestStarted" withAnalytics:v34];
    objc_storeStrong((id *)&self->super._afDictationRequestParams, v34);
  }
  [v14 startRecordedAudioDictationWithOptions:v15 forLanguage:v10 narrowband:v22];
  v47[0] = MEMORY[0x1E4F143A8];
  v47[1] = 3221225472;
  v47[2] = __104__SFSpeechURLRecognitionRequest__startedConnectionWithLanguageCode_delegate_taskHint_requestIdentifier___block_invoke;
  v47[3] = &unk_1E6155778;
  id v48 = v14;
  v45[0] = MEMORY[0x1E4F143A8];
  v45[1] = 3221225472;
  v45[2] = __104__SFSpeechURLRecognitionRequest__startedConnectionWithLanguageCode_delegate_taskHint_requestIdentifier___block_invoke_2;
  v45[3] = &unk_1E61557A0;
  id v46 = v48;
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __104__SFSpeechURLRecognitionRequest__startedConnectionWithLanguageCode_delegate_taskHint_requestIdentifier___block_invoke_3;
  v42[3] = &unk_1E61557C8;
  id v35 = v46;
  id v43 = v35;
  v44 = v41;
  id v36 = v41;
  -[SFSpeechURLRecognitionRequest _handlePreRecordedAudioWithAsset:audioTracks:narrowband:addSpeechDataBlock:stopSpeechBlock:cancelSpeechWithErrorBlock:]((uint64_t)self, v20, v21, v22, v47, v45, v42);
  uint64_t v37 = v44;
  id v38 = v35;

  return v38;
}

uint64_t __104__SFSpeechURLRecognitionRequest__startedConnectionWithLanguageCode_delegate_taskHint_requestIdentifier___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addRecordedSpeechSampleData:a2];
}

uint64_t __104__SFSpeechURLRecognitionRequest__startedConnectionWithLanguageCode_delegate_taskHint_requestIdentifier___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) stopSpeechWithOptions:0];
}

void __104__SFSpeechURLRecognitionRequest__startedConnectionWithLanguageCode_delegate_taskHint_requestIdentifier___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 cancelSpeech];
  [*(id *)(a1 + 40) dictationConnection:*(void *)(a1 + 32) speechRecordingDidFail:v4];
}

- (SFSpeechURLRecognitionRequest)initWithURL:(NSURL *)URL
{
  id v4 = URL;
  v9.receiver = self;
  v9.super_class = (Class)SFSpeechURLRecognitionRequest;
  uint64_t v5 = [(SFSpeechRecognitionRequest *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [(NSURL *)v4 copy];
    uint64_t v7 = v5->_URL;
    v5->_URL = (NSURL *)v6;
  }
  return v5;
}

- (SFSpeechURLRecognitionRequest)init
{
  return 0;
}

@end