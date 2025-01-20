@interface WFMakeSpokenAudioFromTextAction
- (WFSpeechSynthesizer)synthesizer;
- (id)voicePickerParameter;
- (void)initializeParameters;
- (void)runAsynchronouslyWithInput:(id)a3;
- (void)speechSynthesizer:(id)a3 didFailSpeakingUtterance:(id)a4 error:(id)a5;
- (void)speechSynthesizer:(id)a3 didFinishSpeakingUtterance:(id)a4 intoFile:(id)a5;
@end

@implementation WFMakeSpokenAudioFromTextAction

- (void).cxx_destruct
{
}

- (WFSpeechSynthesizer)synthesizer
{
  return self->_synthesizer;
}

- (void)speechSynthesizer:(id)a3 didFinishSpeakingUtterance:(id)a4 intoFile:(id)a5
{
  if (a5)
  {
    id v6 = a5;
    v7 = [(WFMakeSpokenAudioFromTextAction *)self output];
    [v7 addFile:v6];
  }
  -[WFMakeSpokenAudioFromTextAction finishRunningWithError:](self, "finishRunningWithError:", 0, a4);
}

- (void)speechSynthesizer:(id)a3 didFailSpeakingUtterance:(id)a4 error:(id)a5
{
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __62__WFMakeSpokenAudioFromTextAction_runAsynchronouslyWithInput___block_invoke;
  v3[3] = &unk_264E5EF80;
  v3[4] = self;
  [a3 getStringRepresentation:v3];
}

void __62__WFMakeSpokenAudioFromTextAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v24[1] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if ([v5 length])
  {
    v7 = objc_alloc_init(WFSpeechSynthesizer);
    [(WFSpeechSynthesizer *)v7 setDelegate:*(void *)(a1 + 32)];
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 328), v7);
    v8 = [*(id *)(a1 + 32) parameterValueForKey:@"WFSpeakTextRate" ofClass:objc_opt_class()];
    [v8 floatValue];
    float v10 = v9;

    v11 = [*(id *)(a1 + 32) parameterValueForKey:@"WFSpeakTextPitch" ofClass:objc_opt_class()];
    [v11 floatValue];
    float v13 = v12;

    v14 = [*(id *)(a1 + 32) parameterValueForKey:@"WFSpeakTextLanguage" ofClass:objc_opt_class()];
    v15 = *(void **)(a1 + 32);
    if (v14)
    {
      v16 = [v15 parameterValueForKey:@"WFSpeakTextVoice" ofClass:objc_opt_class()];
      if ([v16 length]) {
        +[WFSpeechSynthesisVoice voiceForIdentifier:v16];
      }
      else {
      v22 = +[WFSpeechSynthesisVoice defaultVoiceForLanguageCode:v14];
      }
      [(WFSpeechSynthesizer *)v7 speakUtteranceIntoFile:v5 usingVoice:v22 rate:v10 pitch:v13];
    }
    else
    {
      v17 = (void *)MEMORY[0x263F087E8];
      uint64_t v18 = *MEMORY[0x263F08438];
      uint64_t v23 = *MEMORY[0x263F08320];
      v19 = WFLocalizedString(@"Please select a language to use for the audio.");
      v24[0] = v19;
      v20 = [NSDictionary dictionaryWithObjects:v24 forKeys:&v23 count:1];
      v21 = [v17 errorWithDomain:v18 code:5 userInfo:v20];
      [v15 finishRunningWithError:v21];
    }
  }
  else
  {
    [*(id *)(a1 + 32) finishRunningWithError:v6];
  }
}

- (id)voicePickerParameter
{
  v4 = [(WFMakeSpokenAudioFromTextAction *)self parameterForKey:@"WFSpeakTextVoice"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v6 = [MEMORY[0x263F08690] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"WFMakeSpokenAudioFromTextAction.m" lineNumber:39 description:@"Parameter should be of type WFSpeakTextVoicePickerParameter"];
  }
  return v4;
}

- (void)initializeParameters
{
  v4.receiver = self;
  v4.super_class = (Class)WFMakeSpokenAudioFromTextAction;
  [(WFMakeSpokenAudioFromTextAction *)&v4 initializeParameters];
  v3 = [(WFMakeSpokenAudioFromTextAction *)self voicePickerParameter];
  [v3 setAction:self];
}

@end