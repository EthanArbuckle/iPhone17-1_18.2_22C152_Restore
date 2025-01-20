@interface WFSpeechSynthesizer
+ (id)defaultAudioFileSettings;
- (AVSpeechSynthesizer)avSynthesizer;
- (NSMapTable)avUtteranceOutputTable;
- (OS_dispatch_queue)queue;
- (SiriTTSDaemonSession)stsSynthesizer;
- (WFSpeechSynthesizer)init;
- (WFSpeechSynthesizerDelegate)delegate;
- (id)avSpeechUtteranceForVoice:(id)a3 utterance:(id)a4 rate:(double)a5 pitch:(double)a6;
- (id)invalidAudioBufferError;
- (id)outputFileURLForUtterance:(id)a3;
- (id)stsSpeechRequestForVoice:(id)a3 utterance:(id)a4 rate:(double)a5 pitch:(double)a6 intoFile:(BOOL)a7;
- (unint64_t)audioFormatForSettings:(id)a3;
- (void)failSpeakingAVUtterance:(id)a3 withError:(id)a4;
- (void)failSpeakingUtterance:(id)a3 withError:(id)a4;
- (void)setDelegate:(id)a3;
- (void)speakUtterance:(id)a3 usingVoice:(id)a4 rate:(double)a5 pitch:(double)a6;
- (void)speakUtteranceIntoFile:(id)a3 usingVoice:(id)a4 rate:(double)a5 pitch:(double)a6;
- (void)speechSynthesizer:(id)a3 didCancelSpeechUtterance:(id)a4;
- (void)speechSynthesizer:(id)a3 didFinishSpeechUtterance:(id)a4;
- (void)speechSynthesizer:(id)a3 willSpeakRangeOfSpeechString:(_NSRange)a4 utterance:(id)a5;
- (void)stop;
@end

@implementation WFSpeechSynthesizer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avUtteranceOutputTable, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_stsSynthesizer, 0);
  objc_storeStrong((id *)&self->_avSynthesizer, 0);
}

- (NSMapTable)avUtteranceOutputTable
{
  return self->_avUtteranceOutputTable;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (WFSpeechSynthesizerDelegate *)a3;
}

- (WFSpeechSynthesizerDelegate)delegate
{
  return self->_delegate;
}

- (void)speechSynthesizer:(id)a3 didCancelSpeechUtterance:(id)a4
{
}

- (void)speechSynthesizer:(id)a3 didFinishSpeechUtterance:(id)a4
{
  id v15 = a4;
  v5 = [(WFSpeechSynthesizer *)self avUtteranceOutputTable];
  v6 = [v5 objectForKey:v15];

  v7 = [(WFSpeechSynthesizer *)self avUtteranceOutputTable];
  [v7 removeObjectForKey:v15];

  if (v6
    && ([(WFSpeechSynthesizer *)self delegate],
        v8 = objc_claimAutoreleasedReturnValue(),
        char v9 = objc_opt_respondsToSelector(),
        v8,
        (v9 & 1) != 0))
  {
    v10 = [MEMORY[0x263F33870] fileWithURL:v6 options:1];
    v11 = [(WFSpeechSynthesizer *)self delegate];
    v12 = [v15 speechString];
    [v11 speechSynthesizer:self didFinishSpeakingUtterance:v12 intoFile:v10];
  }
  else
  {
    v13 = [(WFSpeechSynthesizer *)self delegate];
    char v14 = objc_opt_respondsToSelector();

    if ((v14 & 1) == 0) {
      goto LABEL_7;
    }
    v10 = [(WFSpeechSynthesizer *)self delegate];
    v11 = [v15 speechString];
    [v10 speechSynthesizer:self didFinishSpeakingUtterance:v11];
  }

LABEL_7:
}

- (void)speechSynthesizer:(id)a3 willSpeakRangeOfSpeechString:(_NSRange)a4 utterance:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v12 = a5;
  v8 = [(WFSpeechSynthesizer *)self delegate];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    v10 = [(WFSpeechSynthesizer *)self delegate];
    v11 = [v12 speechString];
    objc_msgSend(v10, "speechSynthesizer:willSpeakRangeOfUtterance:utterance:", self, location, length, v11);
  }
}

- (id)invalidAudioBufferError
{
  v8[1] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263F087E8];
  uint64_t v7 = *MEMORY[0x263F08320];
  v3 = WFLocalizedString(@"Unable to Make Spoken Audio from Text");
  v8[0] = v3;
  v4 = [NSDictionary dictionaryWithObjects:v8 forKeys:&v7 count:1];
  v5 = [v2 errorWithDomain:@"WFSpeechSynthesizerErrorDomain" code:0 userInfo:v4];

  return v5;
}

- (unint64_t)audioFormatForSettings:(id)a3
{
  id v3 = a3;
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x2020000000;
  v4 = (void *)getAVLinearPCMIsFloatKeySymbolLoc_ptr;
  uint64_t v27 = getAVLinearPCMIsFloatKeySymbolLoc_ptr;
  if (!getAVLinearPCMIsFloatKeySymbolLoc_ptr)
  {
    uint64_t v20 = MEMORY[0x263EF8330];
    uint64_t v21 = 3221225472;
    v22 = __getAVLinearPCMIsFloatKeySymbolLoc_block_invoke;
    v23 = &unk_264E5EC88;
    v5 = AVFoundationLibrary();
    v25[3] = (uint64_t)dlsym(v5, "AVLinearPCMIsFloatKey");
    getAVLinearPCMIsFloatKeySymbolLoc_ptr = v25[3];
    v4 = (void *)v25[3];
  }
  _Block_object_dispose(&v24, 8);
  if (!v4)
  {
    v18 = [MEMORY[0x263F08690] currentHandler];
    v19 = [NSString stringWithUTF8String:"NSString *getAVLinearPCMIsFloatKey(void)"];
    objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", v19, @"WFSpeechSynthesizer.m", 43, @"%s", dlerror(), v20, v21, v22, v23);
LABEL_22:

    __break(1u);
    return result;
  }
  v6 = [v3 objectForKey:*v4];
  int v7 = [v6 BOOLValue];

  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x2020000000;
  v8 = (void *)getAVLinearPCMBitDepthKeySymbolLoc_ptr;
  uint64_t v27 = getAVLinearPCMBitDepthKeySymbolLoc_ptr;
  if (!getAVLinearPCMBitDepthKeySymbolLoc_ptr)
  {
    uint64_t v20 = MEMORY[0x263EF8330];
    uint64_t v21 = 3221225472;
    v22 = __getAVLinearPCMBitDepthKeySymbolLoc_block_invoke;
    v23 = &unk_264E5EC88;
    char v9 = AVFoundationLibrary();
    v25[3] = (uint64_t)dlsym(v9, "AVLinearPCMBitDepthKey");
    getAVLinearPCMBitDepthKeySymbolLoc_ptr = v25[3];
    v8 = (void *)v25[3];
  }
  _Block_object_dispose(&v24, 8);
  if (!v8)
  {
    v18 = [MEMORY[0x263F08690] currentHandler];
    v19 = [NSString stringWithUTF8String:"NSString *getAVLinearPCMBitDepthKey(void)"];
    objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", v19, @"WFSpeechSynthesizer.m", 42, @"%s", dlerror(), v20, v21, v22, v23);
    goto LABEL_22;
  }
  v10 = [v3 objectForKey:*v8];
  uint64_t v11 = [v10 integerValue];

  uint64_t v12 = 16;
  if (v7) {
    uint64_t v12 = 64;
  }
  uint64_t v13 = 2;
  if (!v7) {
    uint64_t v13 = 3;
  }
  uint64_t v14 = 4;
  if (v7) {
    uint64_t v14 = 1;
  }
  if (v11 == v12) {
    unint64_t v15 = v13;
  }
  else {
    unint64_t v15 = 0;
  }
  if (v11 == 32) {
    unint64_t v16 = v14;
  }
  else {
    unint64_t v16 = v15;
  }

  return v16;
}

- (id)avSpeechUtteranceForVoice:(id)a3 utterance:(id)a4 rate:(double)a5 pitch:(double)a6
{
  id v12 = a3;
  id v13 = a4;
  if (!v13)
  {
    v34 = [MEMORY[0x263F08690] currentHandler];
    [v34 handleFailureInMethod:a2, self, @"WFSpeechSynthesizer.m", 286, @"Invalid parameter not satisfying: %@", @"utterance" object file lineNumber description];
  }
  uint64_t v46 = 0;
  v47 = &v46;
  uint64_t v48 = 0x2050000000;
  uint64_t v14 = (void *)getAVSpeechUtteranceClass_softClass;
  uint64_t v49 = getAVSpeechUtteranceClass_softClass;
  if (!getAVSpeechUtteranceClass_softClass)
  {
    uint64_t v41 = MEMORY[0x263EF8330];
    uint64_t v42 = 3221225472;
    v43 = __getAVSpeechUtteranceClass_block_invoke;
    v44 = &unk_264E5EC88;
    v45 = &v46;
    __getAVSpeechUtteranceClass_block_invoke((uint64_t)&v41);
    uint64_t v14 = (void *)v47[3];
  }
  id v15 = v14;
  _Block_object_dispose(&v46, 8);
  unint64_t v16 = [v15 speechUtteranceWithString:v13];
  *(float *)&double v17 = a6;
  [v16 setPitchMultiplier:v17];
  uint64_t v46 = 0;
  v47 = &v46;
  float v18 = 1.0842e-19;
  uint64_t v48 = 0x2020000000;
  v19 = (_DWORD *)getAVSpeechUtteranceMinimumSpeechRateSymbolLoc_ptr;
  uint64_t v49 = getAVSpeechUtteranceMinimumSpeechRateSymbolLoc_ptr;
  if (!getAVSpeechUtteranceMinimumSpeechRateSymbolLoc_ptr)
  {
    uint64_t v41 = MEMORY[0x263EF8330];
    uint64_t v42 = 3221225472;
    v43 = __getAVSpeechUtteranceMinimumSpeechRateSymbolLoc_block_invoke;
    v44 = &unk_264E5EC88;
    v45 = &v46;
    uint64_t v20 = AVFoundationLibrary();
    uint64_t v21 = dlsym(v20, "AVSpeechUtteranceMinimumSpeechRate");
    *(void *)(v45[1] + 24) = v21;
    getAVSpeechUtteranceMinimumSpeechRateSymbolLoc_ptr = *(void *)(v45[1] + 24);
    v19 = (_DWORD *)v47[3];
  }
  _Block_object_dispose(&v46, 8);
  if (!v19)
  {
    id v12 = [MEMORY[0x263F08690] currentHandler];
    id v13 = [NSString stringWithUTF8String:"float getAVSpeechUtteranceMinimumSpeechRate(void)"];
    objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, @"WFSpeechSynthesizer.m", 46, @"%s", dlerror());
LABEL_34:

    __break(1u);
LABEL_35:
    v35 = [MEMORY[0x263F08690] currentHandler];
    v36 = objc_msgSend(NSString, "stringWithUTF8String:", "CGFloat WFScaledValue(CGFloat, CGFloat, CGFloat, CGFloat)");
    [v35 handleFailureInFunction:v36, @"WFSpeechSynthesizer.m", 68, @"unitValue must be [0, 1]" file lineNumber description];

    goto LABEL_16;
  }
  LODWORD(a6) = *v19;
  uint64_t v46 = 0;
  v47 = &v46;
  uint64_t v48 = 0x2020000000;
  v22 = (float *)getAVSpeechUtteranceMaximumSpeechRateSymbolLoc_ptr;
  uint64_t v49 = getAVSpeechUtteranceMaximumSpeechRateSymbolLoc_ptr;
  if (!getAVSpeechUtteranceMaximumSpeechRateSymbolLoc_ptr)
  {
    uint64_t v41 = MEMORY[0x263EF8330];
    uint64_t v42 = 3221225472;
    v43 = __getAVSpeechUtteranceMaximumSpeechRateSymbolLoc_block_invoke;
    v44 = &unk_264E5EC88;
    v45 = &v46;
    v23 = AVFoundationLibrary();
    uint64_t v24 = dlsym(v23, "AVSpeechUtteranceMaximumSpeechRate");
    *(void *)(v45[1] + 24) = v24;
    getAVSpeechUtteranceMaximumSpeechRateSymbolLoc_ptr = *(void *)(v45[1] + 24);
    v22 = (float *)v47[3];
  }
  _Block_object_dispose(&v46, 8);
  if (!v22)
  {
    id v12 = [MEMORY[0x263F08690] currentHandler];
    id v13 = [NSString stringWithUTF8String:"float getAVSpeechUtteranceMaximumSpeechRate(void)"];
    objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, @"WFSpeechSynthesizer.m", 47, @"%s", dlerror());
    goto LABEL_34;
  }
  float v6 = *v22;
  uint64_t v46 = 0;
  v47 = &v46;
  uint64_t v48 = 0x2020000000;
  v25 = (float *)getAVSpeechUtteranceDefaultSpeechRateSymbolLoc_ptr;
  uint64_t v49 = getAVSpeechUtteranceDefaultSpeechRateSymbolLoc_ptr;
  if (!getAVSpeechUtteranceDefaultSpeechRateSymbolLoc_ptr)
  {
    uint64_t v41 = MEMORY[0x263EF8330];
    uint64_t v42 = 3221225472;
    v43 = __getAVSpeechUtteranceDefaultSpeechRateSymbolLoc_block_invoke;
    v44 = &unk_264E5EC88;
    v45 = &v46;
    uint64_t v26 = AVFoundationLibrary();
    uint64_t v27 = dlsym(v26, "AVSpeechUtteranceDefaultSpeechRate");
    *(void *)(v45[1] + 24) = v27;
    getAVSpeechUtteranceDefaultSpeechRateSymbolLoc_ptr = *(void *)(v45[1] + 24);
    v25 = (float *)v47[3];
  }
  _Block_object_dispose(&v46, 8);
  if (!v25)
  {
    id v12 = [MEMORY[0x263F08690] currentHandler];
    id v13 = [NSString stringWithUTF8String:"float getAVSpeechUtteranceDefaultSpeechRate(void)"];
    objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, @"WFSpeechSynthesizer.m", 48, @"%s", dlerror());
    goto LABEL_34;
  }
  float v18 = *v25;
  if (a5 < 0.0 || a5 > 1.0) {
    goto LABEL_35;
  }
LABEL_16:
  if (v6 < *(float *)&a6)
  {
    v37 = [MEMORY[0x263F08690] currentHandler];
    v38 = objc_msgSend(NSString, "stringWithUTF8String:", "CGFloat WFScaledValue(CGFloat, CGFloat, CGFloat, CGFloat)");
    [v37 handleFailureInFunction:v38 file:@"WFSpeechSynthesizer.m" lineNumber:69 description:@"max must be >= min"];
  }
  if (v18 < *(float *)&a6 || v18 > v6)
  {
    v39 = [MEMORY[0x263F08690] currentHandler];
    v40 = objc_msgSend(NSString, "stringWithUTF8String:", "CGFloat WFScaledValue(CGFloat, CGFloat, CGFloat, CGFloat)");
    [v39 handleFailureInFunction:v40, @"WFSpeechSynthesizer.m", 70, @"default must be >= min, <= max" file lineNumber description];
  }
  double v28 = a5 + -0.5;
  if (a5 >= 0.5)
  {
    double v29 = v18;
  }
  else
  {
    double v28 = a5;
    double v29 = *(float *)&a6;
  }
  if (a5 >= 0.5) {
    double v30 = v6;
  }
  else {
    double v30 = v18;
  }
  double v31 = v29 + (v30 - v29) * (v28 + v28);
  *(float *)&double v31 = v31;
  [v16 setRate:v31];
  v32 = [v12 avVoice];
  if (v32) {
    [v16 setVoice:v32];
  }

  return v16;
}

- (id)stsSpeechRequestForVoice:(id)a3 utterance:(id)a4 rate:(double)a5 pitch:(double)a6 intoFile:(BOOL)a7
{
  BOOL v7 = a7;
  id v12 = a3;
  id v13 = a4;
  uint64_t v38 = 0;
  v39 = &v38;
  uint64_t v40 = 0x2050000000;
  uint64_t v14 = (void *)getSiriTTSSynthesisVoiceClass_softClass;
  uint64_t v41 = getSiriTTSSynthesisVoiceClass_softClass;
  if (!getSiriTTSSynthesisVoiceClass_softClass)
  {
    uint64_t v33 = MEMORY[0x263EF8330];
    uint64_t v34 = 3221225472;
    v35 = __getSiriTTSSynthesisVoiceClass_block_invoke;
    v36 = &unk_264E5EC88;
    v37 = &v38;
    __getSiriTTSSynthesisVoiceClass_block_invoke((uint64_t)&v33);
    uint64_t v14 = (void *)v39[3];
  }
  id v15 = v14;
  _Block_object_dispose(&v38, 8);
  id v16 = [v15 alloc];
  double v17 = [v12 languageCode];
  float v18 = [v12 vsVoiceName];
  v19 = (void *)[v16 initWithLanguage:v17 name:v18];

  uint64_t v38 = 0;
  v39 = &v38;
  uint64_t v40 = 0x2050000000;
  uint64_t v20 = (void *)getSiriTTSSpeechRequestClass_softClass;
  uint64_t v41 = getSiriTTSSpeechRequestClass_softClass;
  if (!getSiriTTSSpeechRequestClass_softClass)
  {
    uint64_t v33 = MEMORY[0x263EF8330];
    uint64_t v34 = 3221225472;
    v35 = __getSiriTTSSpeechRequestClass_block_invoke;
    v36 = &unk_264E5EC88;
    v37 = &v38;
    __getSiriTTSSpeechRequestClass_block_invoke((uint64_t)&v33);
    uint64_t v20 = (void *)v39[3];
  }
  uint64_t v21 = v20;
  _Block_object_dispose(&v38, 8);
  v22 = (void *)[[v21 alloc] initWithText:v13 voice:v19];
  if (a5 < 0.0 || a5 > 1.0)
  {
    double v31 = [MEMORY[0x263F08690] currentHandler];
    v32 = objc_msgSend(NSString, "stringWithUTF8String:", "CGFloat WFScaledValue(CGFloat, CGFloat, CGFloat, CGFloat)");
    [v31 handleFailureInFunction:v32, @"WFSpeechSynthesizer.m", 68, @"unitValue must be [0, 1]" file lineNumber description];
  }
  double v23 = a5 + -0.5;
  double v24 = 0.5;
  if (a5 < 0.5) {
    double v23 = a5;
  }
  double v25 = 1.0;
  if (a5 < 0.5) {
    double v25 = 0.5;
  }
  double v26 = v23 + v23;
  if (a5 >= 0.5) {
    double v24 = 3.0;
  }
  double v27 = v25 + v24 * v26;
  *(float *)&double v27 = v27;
  [v22 setRate:v27];
  *(float *)&double v28 = a6;
  [v22 setPitch:v28];
  if (v7)
  {
    double v29 = [(WFSpeechSynthesizer *)self outputFileURLForUtterance:v13];
    [v22 setOutputPath:v29];
  }
  return v22;
}

- (SiriTTSDaemonSession)stsSynthesizer
{
  stsSynthesizer = self->_stsSynthesizer;
  if (!stsSynthesizer)
  {
    uint64_t v10 = 0;
    uint64_t v11 = &v10;
    uint64_t v12 = 0x2050000000;
    v4 = (void *)getSiriTTSDaemonSessionClass_softClass;
    uint64_t v13 = getSiriTTSDaemonSessionClass_softClass;
    if (!getSiriTTSDaemonSessionClass_softClass)
    {
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 3221225472;
      v9[2] = __getSiriTTSDaemonSessionClass_block_invoke;
      v9[3] = &unk_264E5EC88;
      v9[4] = &v10;
      __getSiriTTSDaemonSessionClass_block_invoke((uint64_t)v9);
      v4 = (void *)v11[3];
    }
    v5 = v4;
    _Block_object_dispose(&v10, 8);
    float v6 = (SiriTTSDaemonSession *)objc_alloc_init(v5);
    BOOL v7 = self->_stsSynthesizer;
    self->_stsSynthesizer = v6;

    stsSynthesizer = self->_stsSynthesizer;
  }
  return stsSynthesizer;
}

- (id)outputFileURLForUtterance:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    char v9 = [MEMORY[0x263F08690] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"WFSpeechSynthesizer.m", 252, @"Invalid parameter not satisfying: %@", @"utterance" object file lineNumber description];
  }
  float v6 = [MEMORY[0x263F33870] sanitizedFilename:v5 withExtension:@"caf"];
  BOOL v7 = [MEMORY[0x263F339A0] proposedSharedTemporaryFileURLForFilename:v6];

  return v7;
}

- (void)failSpeakingUtterance:(id)a3 withError:(id)a4
{
  id v12 = a3;
  id v7 = a4;
  if (!v12)
  {
    uint64_t v11 = [MEMORY[0x263F08690] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"WFSpeechSynthesizer.m", 245, @"Invalid parameter not satisfying: %@", @"utterance" object file lineNumber description];
  }
  v8 = [(WFSpeechSynthesizer *)self delegate];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    uint64_t v10 = [(WFSpeechSynthesizer *)self delegate];
    [v10 speechSynthesizer:self didFailSpeakingUtterance:v12 error:v7];
  }
}

- (void)failSpeakingAVUtterance:(id)a3 withError:(id)a4
{
  id v11 = a3;
  id v7 = a4;
  if (!v11)
  {
    uint64_t v10 = [MEMORY[0x263F08690] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"WFSpeechSynthesizer.m", 238, @"Invalid parameter not satisfying: %@", @"utterance" object file lineNumber description];
  }
  v8 = [(WFSpeechSynthesizer *)self avUtteranceOutputTable];
  [v8 removeObjectForKey:v11];

  char v9 = [v11 speechString];
  [(WFSpeechSynthesizer *)self failSpeakingUtterance:v9 withError:v7];
}

- (AVSpeechSynthesizer)avSynthesizer
{
  avSynthesizer = self->_avSynthesizer;
  if (!avSynthesizer)
  {
    uint64_t v10 = 0;
    id v11 = &v10;
    uint64_t v12 = 0x2050000000;
    v4 = (void *)getAVSpeechSynthesizerClass_softClass;
    uint64_t v13 = getAVSpeechSynthesizerClass_softClass;
    if (!getAVSpeechSynthesizerClass_softClass)
    {
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 3221225472;
      v9[2] = __getAVSpeechSynthesizerClass_block_invoke;
      v9[3] = &unk_264E5EC88;
      v9[4] = &v10;
      __getAVSpeechSynthesizerClass_block_invoke((uint64_t)v9);
      v4 = (void *)v11[3];
    }
    id v5 = v4;
    _Block_object_dispose(&v10, 8);
    float v6 = (AVSpeechSynthesizer *)objc_alloc_init(v5);
    [(AVSpeechSynthesizer *)v6 setIsInternalSynth:1];
    [(AVSpeechSynthesizer *)v6 setDelegate:self];
    id v7 = self->_avSynthesizer;
    self->_avSynthesizer = v6;

    avSynthesizer = self->_avSynthesizer;
  }
  return avSynthesizer;
}

- (void)stop
{
}

- (void)speakUtteranceIntoFile:(id)a3 usingVoice:(id)a4 rate:(double)a5 pitch:(double)a6
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a4;
  if (!v11)
  {
    double v17 = [MEMORY[0x263F08690] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"WFSpeechSynthesizer.m", 155, @"Invalid parameter not satisfying: %@", @"utterance" object file lineNumber description];
  }
  uint64_t v13 = getWFTextToSpeechLogObject();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136316162;
    double v24 = "-[WFSpeechSynthesizer speakUtteranceIntoFile:usingVoice:rate:pitch:]";
    __int16 v25 = 2112;
    id v26 = v11;
    __int16 v27 = 2048;
    double v28 = a5;
    __int16 v29 = 2048;
    double v30 = a6;
    __int16 v31 = 2112;
    id v32 = v12;
    _os_log_impl(&dword_23C364000, v13, OS_LOG_TYPE_INFO, "%s Asked to synthesize '%@' into file at rate %f, pitch %f using voice %@", buf, 0x34u);
  }

  uint64_t v14 = [(WFSpeechSynthesizer *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __68__WFSpeechSynthesizer_speakUtteranceIntoFile_usingVoice_rate_pitch___block_invoke;
  block[3] = &unk_264E584F0;
  block[4] = self;
  id v19 = v12;
  id v20 = v11;
  double v21 = a5;
  double v22 = a6;
  id v15 = v11;
  id v16 = v12;
  dispatch_async(v14, block);
}

void __68__WFSpeechSynthesizer_speakUtteranceIntoFile_usingVoice_rate_pitch___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) avSpeechUtteranceForVoice:*(void *)(a1 + 40) utterance:*(void *)(a1 + 48) rate:*(double *)(a1 + 56) pitch:*(double *)(a1 + 64)];
  id v3 = [*(id *)(a1 + 40) avVoice];
  v4 = [v3 audioFileSettings];
  id v5 = (void *)[v4 mutableCopy];

  if (![v5 count])
  {
    float v6 = [(id)objc_opt_class() defaultAudioFileSettings];
    uint64_t v7 = [v6 mutableCopy];

    id v5 = (void *)v7;
  }
  v8 = [*(id *)(a1 + 32) outputFileURLForUtterance:*(void *)(a1 + 48)];
  char v9 = [*(id *)(a1 + 32) avUtteranceOutputTable];
  [v9 setObject:v8 forKey:v2];

  uint64_t v34 = 0;
  v35 = &v34;
  uint64_t v36 = 0x2020000000;
  uint64_t v10 = (void *)getAVAudioFileTypeKeySymbolLoc_ptr;
  uint64_t v37 = getAVAudioFileTypeKeySymbolLoc_ptr;
  if (!getAVAudioFileTypeKeySymbolLoc_ptr)
  {
    id location = (id)MEMORY[0x263EF8330];
    uint64_t v30 = 3221225472;
    __int16 v31 = __getAVAudioFileTypeKeySymbolLoc_block_invoke;
    id v32 = &unk_264E5EC88;
    uint64_t v33 = &v34;
    id v11 = AVFoundationLibrary();
    v35[3] = (uint64_t)dlsym(v11, "AVAudioFileTypeKey");
    getAVAudioFileTypeKeySymbolLoc_ptr = *(void *)(v33[1] + 24);
    uint64_t v10 = (void *)v35[3];
  }
  _Block_object_dispose(&v34, 8);
  if (!v10)
  {
    double v22 = [MEMORY[0x263F08690] currentHandler];
    double v23 = [NSString stringWithUTF8String:"NSString *getAVAudioFileTypeKey(void)"];
    objc_msgSend(v22, "handleFailureInFunction:file:lineNumber:description:", v23, @"WFSpeechSynthesizer.m", 38, @"%s", dlerror());
LABEL_17:

    __break(1u);
    return;
  }
  [v5 setObject:&unk_26F075510 forKey:*v10];
  uint64_t v12 = [*(id *)(a1 + 32) audioFormatForSettings:v5];
  uint64_t v34 = 0;
  v35 = &v34;
  uint64_t v36 = 0x2020000000;
  uint64_t v13 = (void *)getAVLinearPCMIsNonInterleavedSymbolLoc_ptr;
  uint64_t v37 = getAVLinearPCMIsNonInterleavedSymbolLoc_ptr;
  if (!getAVLinearPCMIsNonInterleavedSymbolLoc_ptr)
  {
    id location = (id)MEMORY[0x263EF8330];
    uint64_t v30 = 3221225472;
    __int16 v31 = __getAVLinearPCMIsNonInterleavedSymbolLoc_block_invoke;
    id v32 = &unk_264E5EC88;
    uint64_t v33 = &v34;
    uint64_t v14 = AVFoundationLibrary();
    v35[3] = (uint64_t)dlsym(v14, "AVLinearPCMIsNonInterleaved");
    getAVLinearPCMIsNonInterleavedSymbolLoc_ptr = *(void *)(v33[1] + 24);
    uint64_t v13 = (void *)v35[3];
  }
  _Block_object_dispose(&v34, 8);
  if (!v13)
  {
    double v22 = [MEMORY[0x263F08690] currentHandler];
    double v23 = [NSString stringWithUTF8String:"NSString *getAVLinearPCMIsNonInterleaved(void)"];
    objc_msgSend(v22, "handleFailureInFunction:file:lineNumber:description:", v23, @"WFSpeechSynthesizer.m", 44, @"%s", dlerror());
    goto LABEL_17;
  }
  id v15 = [v5 objectForKey:*v13];
  int v16 = [v15 BOOLValue];

  uint64_t v34 = 0;
  v35 = &v34;
  uint64_t v36 = 0x2050000000;
  double v17 = (void *)getAVAudioFileClass_softClass;
  uint64_t v37 = getAVAudioFileClass_softClass;
  if (!getAVAudioFileClass_softClass)
  {
    id location = (id)MEMORY[0x263EF8330];
    uint64_t v30 = 3221225472;
    __int16 v31 = __getAVAudioFileClass_block_invoke;
    id v32 = &unk_264E5EC88;
    uint64_t v33 = &v34;
    __getAVAudioFileClass_block_invoke((uint64_t)&location);
    double v17 = (void *)v35[3];
  }
  float v18 = v17;
  _Block_object_dispose(&v34, 8);
  id v28 = 0;
  id v19 = (void *)[[v18 alloc] initForWriting:v8 settings:v5 commonFormat:v12 interleaved:v16 ^ 1u error:&v28];
  id v20 = v28;
  if (v19)
  {
    objc_initWeak(&location, *(id *)(a1 + 32));
    double v21 = [*(id *)(a1 + 32) avSynthesizer];
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __68__WFSpeechSynthesizer_speakUtteranceIntoFile_usingVoice_rate_pitch___block_invoke_181;
    v24[3] = &unk_264E58518;
    objc_copyWeak(&v27, &location);
    id v25 = v2;
    id v26 = v19;
    [v21 writeUtterance:v25 toBufferCallback:v24];

    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);
  }
  else
  {
    [*(id *)(a1 + 32) failSpeakingAVUtterance:v2 withError:v20];
  }
}

void __68__WFSpeechSynthesizer_speakUtteranceIntoFile_usingVoice_rate_pitch___block_invoke_181(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v16 = 0;
  double v17 = &v16;
  uint64_t v18 = 0x2050000000;
  id v5 = (void *)getAVAudioPCMBufferClass_softClass;
  uint64_t v19 = getAVAudioPCMBufferClass_softClass;
  if (!getAVAudioPCMBufferClass_softClass)
  {
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __getAVAudioPCMBufferClass_block_invoke;
    v15[3] = &unk_264E5EC88;
    v15[4] = &v16;
    __getAVAudioPCMBufferClass_block_invoke((uint64_t)v15);
    id v5 = (void *)v17[3];
  }
  id v6 = v5;
  _Block_object_dispose(&v16, 8);
  char isKindOfClass = objc_opt_isKindOfClass();
  if (!v3 || (isKindOfClass & 1) == 0)
  {
    uint64_t v13 = *(void *)(a1 + 32);
    id v10 = [WeakRetained invalidAudioBufferError];
    uint64_t v12 = WeakRetained;
    uint64_t v11 = v13;
    goto LABEL_8;
  }
  v8 = *(void **)(a1 + 40);
  id v14 = 0;
  char v9 = [v8 writeFromBuffer:v3 error:&v14];
  id v10 = v14;
  if ((v9 & 1) == 0)
  {
    uint64_t v11 = *(void *)(a1 + 32);
    uint64_t v12 = WeakRetained;
LABEL_8:
    [v12 failSpeakingAVUtterance:v11 withError:v10];
  }
}

- (void)speakUtterance:(id)a3 usingVoice:(id)a4 rate:(double)a5 pitch:(double)a6
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a4;
  if (!v11)
  {
    double v17 = [MEMORY[0x263F08690] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"WFSpeechSynthesizer.m", 123, @"Invalid parameter not satisfying: %@", @"utterance" object file lineNumber description];
  }
  uint64_t v13 = getWFTextToSpeechLogObject();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136316162;
    id v25 = "-[WFSpeechSynthesizer speakUtterance:usingVoice:rate:pitch:]";
    __int16 v26 = 2112;
    id v27 = v11;
    __int16 v28 = 2048;
    double v29 = a5;
    __int16 v30 = 2048;
    double v31 = a6;
    __int16 v32 = 2112;
    id v33 = v12;
    _os_log_impl(&dword_23C364000, v13, OS_LOG_TYPE_INFO, "%s Asked to synthesize '%@' at rate %f, pitch %f using voice %@", buf, 0x34u);
  }

  id v14 = [(WFSpeechSynthesizer *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __60__WFSpeechSynthesizer_speakUtterance_usingVoice_rate_pitch___block_invoke;
  block[3] = &unk_264E584F0;
  id v19 = v12;
  id v20 = self;
  id v21 = v11;
  double v22 = a5;
  double v23 = a6;
  id v15 = v11;
  id v16 = v12;
  dispatch_async(v14, block);
}

void __60__WFSpeechSynthesizer_speakUtterance_usingVoice_rate_pitch___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  int v2 = [*(id *)(a1 + 32) isSiriVoice];
  uint64_t v4 = *(void *)(a1 + 32);
  id v3 = *(void **)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  double v6 = *(double *)(a1 + 56);
  double v7 = *(double *)(a1 + 64);
  if (v2)
  {
    v8 = [v3 stsSpeechRequestForVoice:v4 utterance:v5 rate:0 pitch:v6 intoFile:v7];
    char v9 = getWFActionsLogObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v18 = "-[WFSpeechSynthesizer speakUtterance:usingVoice:rate:pitch:]_block_invoke";
      __int16 v19 = 2112;
      id v20 = v8;
      _os_log_impl(&dword_23C364000, v9, OS_LOG_TYPE_INFO, "%s We are using a Siri voice - let's use it. Assembled STS request %@", buf, 0x16u);
    }

    objc_initWeak((id *)buf, *(id *)(a1 + 40));
    id v10 = [*(id *)(a1 + 40) stsSynthesizer];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __60__WFSpeechSynthesizer_speakUtterance_usingVoice_rate_pitch___block_invoke_176;
    v14[3] = &unk_264E584C8;
    objc_copyWeak(&v16, (id *)buf);
    id v11 = v8;
    id v15 = v11;
    [v10 speakWithSpeechRequest:v11 didFinish:v14];

    objc_destroyWeak(&v16);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    id v13 = [v3 avSpeechUtteranceForVoice:v4 utterance:v5 rate:v6 pitch:v7];
    id v12 = [*(id *)(a1 + 40) avSynthesizer];
    [v12 speakUtterance:v13];
  }
}

void __60__WFSpeechSynthesizer_speakUtterance_usingVoice_rate_pitch___block_invoke_176(uint64_t a1, void *a2)
{
  id v8 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v4 = [*(id *)(a1 + 32) text];
    if (v8)
    {
      objc_msgSend(WeakRetained, "failSpeakingUtterance:withError:", v4);
    }
    else
    {
      uint64_t v5 = [WeakRetained delegate];
      char v6 = objc_opt_respondsToSelector();

      if (v6)
      {
        double v7 = [WeakRetained delegate];
        [v7 speechSynthesizer:WeakRetained didFinishSpeakingUtterance:v4];
      }
    }
  }
}

- (WFSpeechSynthesizer)init
{
  v11.receiver = self;
  v11.super_class = (Class)WFSpeechSynthesizer;
  int v2 = [(WFSpeechSynthesizer *)&v11 init];
  if (v2)
  {
    id v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    uint64_t v4 = dispatch_get_global_queue(21, 0);
    dispatch_queue_t v5 = dispatch_queue_create_with_target_V2("com.apple.shortcuts.WFSpeechSynthesizer", v3, v4);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    uint64_t v7 = [MEMORY[0x263F08968] strongToStrongObjectsMapTable];
    avUtteranceOutputTable = v2->_avUtteranceOutputTable;
    v2->_avUtteranceOutputTable = (NSMapTable *)v7;

    char v9 = v2;
  }

  return v2;
}

+ (id)defaultAudioFileSettings
{
  uint64_t v8 = 32;
  uint64_t v5 = 0x40D5888000000000;
  uint64_t v7 = 0x100000004;
  long long v6 = xmmword_23C71CEF0;
  int v2 = (void *)[objc_alloc(MEMORY[0x263EF9388]) initWithStreamDescription:&v5];
  id v3 = [v2 settings];

  return v3;
}

@end