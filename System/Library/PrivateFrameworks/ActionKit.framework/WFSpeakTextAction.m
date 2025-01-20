@interface WFSpeakTextAction
- (BOOL)isProgressIndeterminate;
- (WFSpeakTextActionOperation)runningOperation;
- (id)extendedOperation;
- (id)voicePickerParameter;
- (void)cancel;
- (void)initializeParameters;
- (void)runAsynchronouslyWithInput:(id)a3;
- (void)setExtendedOperation:(id)a3;
- (void)setRunningOperation:(id)a3;
@end

@implementation WFSpeakTextAction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_runningOperation, 0);
  objc_storeStrong((id *)&self->_extendedOperation, 0);
}

- (void)setRunningOperation:(id)a3
{
}

- (WFSpeakTextActionOperation)runningOperation
{
  return self->_runningOperation;
}

- (void)setExtendedOperation:(id)a3
{
}

- (id)extendedOperation
{
  return self->_extendedOperation;
}

- (void)initializeParameters
{
  v4.receiver = self;
  v4.super_class = (Class)WFSpeakTextAction;
  [(WFSpeakTextAction *)&v4 initializeParameters];
  v3 = [(WFSpeakTextAction *)self voicePickerParameter];
  [v3 setAction:self];
}

- (void)cancel
{
  v3 = [(WFSpeakTextAction *)self runningOperation];
  [v3 cancel];

  [(WFSpeakTextAction *)self setRunningOperation:0];
  v4.receiver = self;
  v4.super_class = (Class)WFSpeakTextAction;
  [(WFSpeakTextAction *)&v4 cancel];
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __48__WFSpeakTextAction_runAsynchronouslyWithInput___block_invoke;
  v3[3] = &unk_264E5EF80;
  v3[4] = self;
  [a3 getStringRepresentation:v3];
}

void __48__WFSpeakTextAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v76[1] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [v5 length];
  v8 = *(void **)(a1 + 32);
  if (v7)
  {
    v9 = [v8 userInterface];
    if ([v9 isRunningWithSiriUI])
    {
      v10 = (void *)[objc_alloc(MEMORY[0x263F853F8]) initWithUtterance:v5];
      v65[0] = MEMORY[0x263EF8330];
      v65[1] = 3221225472;
      v65[2] = __48__WFSpeakTextAction_runAsynchronouslyWithInput___block_invoke_2;
      v65[3] = &unk_264E59890;
      v65[4] = *(void *)(a1 + 32);
      char v11 = [v9 performSiriRequest:v10 completionHandler:v65];

      if (v11) {
        goto LABEL_30;
      }
    }
    v12 = [*(id *)(a1 + 32) parameterValueForKey:@"WFSpeakTextRate" ofClass:objc_opt_class()];
    [v12 floatValue];
    int v14 = v13;

    v15 = [*(id *)(a1 + 32) parameterValueForKey:@"WFSpeakTextPitch" ofClass:objc_opt_class()];
    [v15 floatValue];
    int v17 = v16;

    v18 = [*(id *)(a1 + 32) parameterValueForKey:@"WFSpeakTextWait" ofClass:objc_opt_class()];
    int v55 = [v18 BOOLValue];

    v19 = [*(id *)(a1 + 32) parameterValueForKey:@"WFSpeakTextLanguage" ofClass:objc_opt_class()];
    v20 = *(void **)(a1 + 32);
    if (!v19)
    {
      v22 = (void *)MEMORY[0x263F087E8];
      uint64_t v75 = *MEMORY[0x263F08320];
      v59 = WFLocalizedString(@"Please select a language to use when speaking.");
      v76[0] = v59;
      v58 = [NSDictionary dictionaryWithObjects:v76 forKeys:&v75 count:1];
      v57 = [v22 errorWithDomain:*MEMORY[0x263F08438] code:5 userInfo:v58];
      [v20 finishRunningWithError:v57];
LABEL_29:

LABEL_30:
      goto LABEL_31;
    }
    v59 = [v20 parameterValueForKey:@"WFSpeakTextVoice" ofClass:objc_opt_class()];
    v21 = +[WFSpeechSynthesisVoice voicesForLanguageCode:v19];
    v58 = objc_msgSend(v21, "if_map:", &__block_literal_global_20632);

    if ([v58 containsObject:v59]) {
      +[WFSpeechSynthesisVoice voiceForIdentifier:v59];
    }
    else {
    v57 = +[WFSpeechSynthesisVoice defaultVoiceForLanguageCode:v19];
    }
    v56 = [getAVAudioSessionClass() sharedInstance];
    v23 = [*(id *)(a1 + 32) userInterface];
    v24 = [v23 userInterfaceType];

    if ([v24 isEqualToString:*MEMORY[0x263F33B40]])
    {
      v25 = [MEMORY[0x263F33718] sharedContext];
      BOOL v26 = [v25 applicationState] == 2;

      if (!v24) {
        goto LABEL_17;
      }
    }
    else
    {
      BOOL v26 = 0;
      if (!v24) {
        goto LABEL_17;
      }
    }
    if (([v24 isEqualToString:*MEMORY[0x263F33B38]] & 1) == 0
      && (([v24 isEqualToString:*MEMORY[0x263F33B30]] | v26) & 1) == 0
      && ![v24 isEqualToString:*MEMORY[0x263F33B48]])
    {
      v54 = getAVAudioSessionCategoryPlayback();
      uint64_t v71 = 0;
      v72 = &v71;
      uint64_t v73 = 0x2020000000;
      v44 = (void **)getAVAudioSessionModeDefaultSymbolLoc_ptr;
      uint64_t v74 = getAVAudioSessionModeDefaultSymbolLoc_ptr;
      if (!getAVAudioSessionModeDefaultSymbolLoc_ptr)
      {
        id location = (id)MEMORY[0x263EF8330];
        uint64_t v67 = 3221225472;
        v68 = __getAVAudioSessionModeDefaultSymbolLoc_block_invoke;
        v69 = &unk_264E5EC88;
        v70 = &v71;
        v45 = AVFoundationLibrary_20578();
        v46 = dlsym(v45, "AVAudioSessionModeDefault");
        *(void *)(v70[1] + 24) = v46;
        getAVAudioSessionModeDefaultSymbolLoc_ptr = *(void *)(v70[1] + 24);
        v44 = (void **)v72[3];
      }
      _Block_object_dispose(&v71, 8);
      if (!v44) {
        goto LABEL_39;
      }
      v47 = *v44;
      id v63 = 0;
      id v48 = v47;
      char v49 = [v56 setCategory:v54 mode:v48 routeSharingPolicy:1 options:0 error:&v63];
      id v34 = v63;

      if (v49)
      {
LABEL_21:
        v35 = v34;
        id v62 = v34;
        char v36 = [v56 setActive:1 error:&v62];
        id v34 = v62;

        if (v36)
        {
          v37 = objc_opt_new();
          v38 = *(void **)(a1 + 32);
          if (v55)
          {
            v39 = [v38 progress];
            [v37 setProgress:v39];

            [*(id *)(a1 + 32) setRunningOperation:v37];
            LODWORD(v40) = v14;
            LODWORD(v41) = v17;
            [v37 speakTextUsingSynthesizer:v5 voice:v57 rate:v40 pitch:v41];
            objc_initWeak(&location, *(id *)(a1 + 32));
            v60[0] = MEMORY[0x263EF8330];
            v60[1] = 3221225472;
            v60[2] = __48__WFSpeakTextAction_runAsynchronouslyWithInput___block_invoke_2_206;
            v60[3] = &unk_264E58DD8;
            objc_copyWeak(&v61, &location);
            [v37 addCompletionHandlerIfRunning:v60];
            objc_destroyWeak(&v61);
            objc_destroyWeak(&location);
          }
          else
          {
            [v38 setExtendedOperation:v37];
            LODWORD(v42) = v14;
            LODWORD(v43) = v17;
            [v37 speakTextUsingSynthesizer:v5 voice:v57 rate:v42 pitch:v43];
            [*(id *)(a1 + 32) finishRunningWithError:0];
          }
        }
        else
        {
          [*(id *)(a1 + 32) finishRunningWithError:v34];
        }
        goto LABEL_28;
      }
      [*(id *)(a1 + 32) finishRunningWithError:v34];
LABEL_28:

      goto LABEL_29;
    }
LABEL_17:
    v27 = getAVAudioSessionCategoryPlayback();
    uint64_t v71 = 0;
    v72 = &v71;
    uint64_t v73 = 0x2020000000;
    v28 = (void **)getAVAudioSessionModeVoicePromptSymbolLoc_ptr;
    uint64_t v74 = getAVAudioSessionModeVoicePromptSymbolLoc_ptr;
    if (!getAVAudioSessionModeVoicePromptSymbolLoc_ptr)
    {
      id location = (id)MEMORY[0x263EF8330];
      uint64_t v67 = 3221225472;
      v68 = __getAVAudioSessionModeVoicePromptSymbolLoc_block_invoke;
      v69 = &unk_264E5EC88;
      v70 = &v71;
      v29 = AVFoundationLibrary_20578();
      v30 = dlsym(v29, "AVAudioSessionModeVoicePrompt");
      *(void *)(v70[1] + 24) = v30;
      getAVAudioSessionModeVoicePromptSymbolLoc_ptr = *(void *)(v70[1] + 24);
      v28 = (void **)v72[3];
    }
    _Block_object_dispose(&v71, 8);
    if (!v28)
    {
      v50 = [MEMORY[0x263F08690] currentHandler];
      v51 = [NSString stringWithUTF8String:"AVAudioSessionMode getAVAudioSessionModeVoicePrompt(void)"];
      objc_msgSend(v50, "handleFailureInFunction:file:lineNumber:description:", v51, @"WFSpeakTextAction.m", 21, @"%s", dlerror());

      while (1)
      {
        __break(1u);
LABEL_39:
        v52 = [MEMORY[0x263F08690] currentHandler];
        v53 = [NSString stringWithUTF8String:"AVAudioSessionMode getAVAudioSessionModeDefault(void)"];
        objc_msgSend(v52, "handleFailureInFunction:file:lineNumber:description:", v53, @"WFSpeakTextAction.m", 22, @"%s", dlerror());
      }
    }
    v31 = *v28;
    id v64 = 0;
    id v32 = v31;
    char v33 = [v56 setCategory:v27 mode:v32 options:19 error:&v64];
    id v34 = v64;

    if (v33) {
      goto LABEL_21;
    }
    [*(id *)(a1 + 32) finishRunningWithError:v34];
    goto LABEL_28;
  }
  [v8 finishRunningWithError:v6];
LABEL_31:
}

void __48__WFSpeakTextAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_super v4 = *(void **)(a1 + 32);
    id v5 = [v3 error];
    [v4 finishRunningWithError:v5];

    id v6 = v3;
  }
  else
  {

    uint64_t v7 = getWFWorkflowExecutionLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      int v10 = 136315394;
      char v11 = "-[WFSpeakTextAction runAsynchronouslyWithInput:]_block_invoke_2";
      __int16 v12 = 2112;
      id v13 = (id)objc_opt_class();
      id v8 = v13;
      _os_log_impl(&dword_23C364000, v7, OS_LOG_TYPE_FAULT, "%s Received unexpected interaction response of type %@", (uint8_t *)&v10, 0x16u);
    }
    v9 = *(void **)(a1 + 32);
    id v6 = [MEMORY[0x263F087E8] wfUnsupportedUserInterfaceError];
    [v9 finishRunningWithError:v6];
  }
}

void __48__WFSpeakTextAction_runAsynchronouslyWithInput___block_invoke_2_206(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained setRunningOperation:0];
  [WeakRetained finishRunningWithError:v3];
}

uint64_t __48__WFSpeakTextAction_runAsynchronouslyWithInput___block_invoke_202(uint64_t a1, void *a2)
{
  return [a2 identifier];
}

- (BOOL)isProgressIndeterminate
{
  return 0;
}

- (id)voicePickerParameter
{
  objc_super v4 = [(WFSpeakTextAction *)self parameterForKey:@"WFSpeakTextVoice"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v6 = [MEMORY[0x263F08690] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"WFSpeakTextAction.m" lineNumber:56 description:@"Parameter should be of type WFSpeakTextVoicePickerParameter"];
  }
  return v4;
}

@end