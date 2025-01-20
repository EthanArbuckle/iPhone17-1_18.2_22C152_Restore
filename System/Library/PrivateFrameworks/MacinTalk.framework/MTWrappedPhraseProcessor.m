@interface MTWrappedPhraseProcessor
- (AVAudioFormat)format;
- (BOOL)processNextPhrase;
- (MTBENotifier)notifier;
- (MTBENotifier)resetState;
- (MTBENotifier)saveState;
- (MTBEPersistentParam)fPParams;
- (MTFVoice)voice;
- (MTFrontendSimple)frontend;
- (MTWrappedPhraseProcessor)initWithVoice:(id)a3 frontend:(id)a4;
- (MacinTalkPhraseProcessorDelegate)delegate;
- (NSNumber)defaultModulation;
- (NSNumber)pitchModulation;
- (id)nextBuffer;
- (int64_t)currentSampleCount;
- (void)dealloc;
- (void)finishedSampleGeneration;
- (void)generatedSampleForPhoneme:(signed __int16)a3;
- (void)generatedSampleForSync:(unsigned int)a3;
- (void)generatedSampleForWord:(unint64_t)a3 length:(unsigned __int16)a4;
- (void)processor;
- (void)setCurrentSampleCount:(int64_t)a3;
- (void)setDefaultModulation:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFPParams:(MTBEPersistentParam *)a3;
- (void)setFormat:(id)a3;
- (void)setFrontend:(id)a3;
- (void)setNotifier:(MTBENotifier *)a3;
- (void)setPitchModulation:(id)a3;
- (void)setProcessor:(void *)a3;
- (void)setResetState:(MTBENotifier *)a3;
- (void)setSaveState:(MTBENotifier *)a3;
- (void)setVoice:(id)a3;
@end

@implementation MTWrappedPhraseProcessor

- (MTWrappedPhraseProcessor)initWithVoice:(id)a3 frontend:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MTWrappedPhraseProcessor;
  v8 = [(MTWrappedPhraseProcessor *)&v12 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_voice, v6);
    v9->_currentSampleCount = 0;
    pitchModulation = v9->_pitchModulation;
    v9->_pitchModulation = (NSNumber *)&unk_1F34861B8;

    objc_storeStrong((id *)&v9->_frontend, a4);
    operator new();
  }

  return 0;
}

- (void)setPitchModulation:(id)a3
{
  id v10 = a3;
  v5 = [(MTWrappedPhraseProcessor *)self defaultModulation];
  [v5 floatValue];
  float v7 = v6;
  [v10 floatValue];
  float v9 = v8;

  objc_storeStrong((id *)&self->_pitchModulation, a3);
  *(_DWORD *)([(MTWrappedPhraseProcessor *)self notifier] + 16) = vcvts_n_s32_f32(v7 * v9, 0x10uLL);
}

- (BOOL)processNextPhrase
{
  v2 = [(MTWrappedPhraseProcessor *)self frontend];
  v3 = [v2 nextObject];

  [v3 setUnOwned:1];
  if (v3) {
    operator new();
  }

  return 0;
}

- (id)nextBuffer
{
  if ([(MTWrappedPhraseProcessor *)self processor]
    || [(MTWrappedPhraseProcessor *)self processNextPhrase])
  {
    if (*(unsigned char *)([(MTWrappedPhraseProcessor *)self processor] + 2881)) {
      MTFEFrameFiller::SyncWithUnitSearch((uint64_t)([(MTWrappedPhraseProcessor *)self processor] + 2728));
    }
    operator new();
  }

  return 0;
}

uint64_t __38__MTWrappedPhraseProcessor_nextBuffer__block_invoke(uint64_t a1)
{
  MTMBSegment::Free(*(MTMBSegment **)(a1 + 32));
  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    JUMPOUT(0x1E016FF00);
  }
  return result;
}

- (void)generatedSampleForWord:(unint64_t)a3 length:(unsigned __int16)a4
{
  uint64_t v4 = a4;
  id v7 = [(MTWrappedPhraseProcessor *)self delegate];
  objc_msgSend(v7, "didGenerateSamplesForWord:stringPosition:length:", -[MTWrappedPhraseProcessor currentSampleCount](self, "currentSampleCount"), a3, v4);
}

- (void)generatedSampleForPhoneme:(signed __int16)a3
{
  uint64_t v3 = a3;
  id v5 = [(MTWrappedPhraseProcessor *)self delegate];
  objc_msgSend(v5, "didGenerateSamplesForPhoneme:phonemeOpcode:", -[MTWrappedPhraseProcessor currentSampleCount](self, "currentSampleCount"), v3);
}

- (void)generatedSampleForSync:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v5 = [(MTWrappedPhraseProcessor *)self delegate];
  objc_msgSend(v5, "didGenerateSamplesForSync:message:", -[MTWrappedPhraseProcessor currentSampleCount](self, "currentSampleCount"), v3);
}

- (void)finishedSampleGeneration
{
  id v2 = [(MTWrappedPhraseProcessor *)self delegate];
  [v2 didFinishGeneratingSamples];
}

- (void)dealloc
{
  if ([(MTWrappedPhraseProcessor *)self processor])
  {
    uint64_t v3 = [(MTWrappedPhraseProcessor *)self processor];
    if (v3) {
      (*(void (**)(void *))(*(void *)v3 + 48))(v3);
    }
  }
  if ((void)[(MTWrappedPhraseProcessor *)self fPParams][88])
  {
    uint64_t v4 = (uint64_t)[(MTWrappedPhraseProcessor *)self fPParams][88];
    if (v4) {
      (*(void (**)(uint64_t))(*(void *)v4 + 8))(v4);
    }
  }
  if ((void)[(MTWrappedPhraseProcessor *)self fPParams][56])
  {
    uint64_t v5 = (uint64_t)[(MTWrappedPhraseProcessor *)self fPParams][56];
    if (v5) {
      (*(void (**)(uint64_t))(*(void *)v5 + 56))(v5);
    }
  }
  if ((void)[(MTWrappedPhraseProcessor *)self fPParams][40]) {
    CFRelease((CFTypeRef)[(MTWrappedPhraseProcessor *)self fPParams][40]);
  }
  float v6 = [(MTWrappedPhraseProcessor *)self fPParams];
  if (v6)
  {
    MTBEPersistentParam::~MTBEPersistentParam(v6);
    MEMORY[0x1E016FF00]();
  }
  id v7 = [(MTWrappedPhraseProcessor *)self saveState];
  if (v7) {
    (*((void (**)(MTBENotifier *))v7->var0 + 1))(v7);
  }
  float v8 = [(MTWrappedPhraseProcessor *)self resetState];
  if (v8) {
    (*((void (**)(MTBENotifier *))v8->var0 + 1))(v8);
  }
  float v9 = [(MTWrappedPhraseProcessor *)self notifier];
  if (v9) {
    (*((void (**)(MTBENotifier *))v9->var0 + 1))(v9);
  }
  v10.receiver = self;
  v10.super_class = (Class)MTWrappedPhraseProcessor;
  [(MTWrappedPhraseProcessor *)&v10 dealloc];
}

- (MacinTalkPhraseProcessorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MacinTalkPhraseProcessorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSNumber)pitchModulation
{
  return self->_pitchModulation;
}

- (void)processor
{
  return self->_processor;
}

- (void)setProcessor:(void *)a3
{
  self->_processor = a3;
}

- (MTFVoice)voice
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_voice);

  return (MTFVoice *)WeakRetained;
}

- (void)setVoice:(id)a3
{
}

- (AVAudioFormat)format
{
  return self->_format;
}

- (void)setFormat:(id)a3
{
}

- (MTBEPersistentParam)fPParams
{
  return self->_fPParams;
}

- (void)setFPParams:(MTBEPersistentParam *)a3
{
  self->_fPParams = a3;
}

- (MTBENotifier)notifier
{
  return self->_notifier;
}

- (void)setNotifier:(MTBENotifier *)a3
{
  self->_notifier = a3;
}

- (MTBENotifier)saveState
{
  return self->_saveState;
}

- (void)setSaveState:(MTBENotifier *)a3
{
  self->_saveState = a3;
}

- (MTBENotifier)resetState
{
  return self->_resetState;
}

- (void)setResetState:(MTBENotifier *)a3
{
  self->_resetState = a3;
}

- (NSNumber)defaultModulation
{
  return self->_defaultModulation;
}

- (void)setDefaultModulation:(id)a3
{
}

- (int64_t)currentSampleCount
{
  return self->_currentSampleCount;
}

- (void)setCurrentSampleCount:(int64_t)a3
{
  self->_currentSampleCount = a3;
}

- (MTFrontendSimple)frontend
{
  return self->_frontend;
}

- (void)setFrontend:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_frontend, 0);
  objc_storeStrong((id *)&self->_defaultModulation, 0);
  objc_storeStrong((id *)&self->_format, 0);
  objc_destroyWeak((id *)&self->_voice);
  objc_storeStrong((id *)&self->_pitchModulation, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end