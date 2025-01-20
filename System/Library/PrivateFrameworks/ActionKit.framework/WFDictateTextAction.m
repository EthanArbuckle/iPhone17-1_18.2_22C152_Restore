@interface WFDictateTextAction
+ (BOOL)isDictationAllowed;
+ (BOOL)outputIsExemptFromTaintTrackingInheritance;
+ (id)userInterfaceProtocol;
- (AFDictationConnection)dictationConnection;
- (NSString)latestTranscription;
- (WFDictateTextActionUserInterface)actionUserInterface;
- (id)contentDestinationWithError:(id *)a3;
- (id)recognitionError;
- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5;
- (void)cancel;
- (void)dictationConnection:(id)a3 didRecognizePackage:(id)a4;
- (void)dictationConnection:(id)a3 didRecognizeTokens:(id)a4 languageModel:(id)a5;
- (void)dictationConnection:(id)a3 speechRecognitionDidFail:(id)a4;
- (void)dictationConnection:(id)a3 speechRecordingDidFail:(id)a4;
- (void)finishRunningWithError:(id)a3;
- (void)runAsynchronouslyWithInput:(id)a3;
- (void)runWithRemoteUserInterface:(id)a3 locale:(id)a4 stopListeningValue:(id)a5;
- (void)runWithSiriUserInterface:(id)a3 input:(id)a4;
- (void)setActionUserInterface:(id)a3;
- (void)setDictationConnection:(id)a3;
- (void)setLatestTranscription:(id)a3;
- (void)stopListening;
@end

@implementation WFDictateTextAction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_latestTranscription, 0);
  objc_storeStrong((id *)&self->_dictationConnection, 0);
  objc_storeStrong((id *)&self->_actionUserInterface, 0);
}

- (void)setLatestTranscription:(id)a3
{
}

- (NSString)latestTranscription
{
  return self->_latestTranscription;
}

- (void)setDictationConnection:(id)a3
{
}

- (AFDictationConnection)dictationConnection
{
  return self->_dictationConnection;
}

- (void)setActionUserInterface:(id)a3
{
}

- (WFDictateTextActionUserInterface)actionUserInterface
{
  return self->_actionUserInterface;
}

- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5
{
  v5 = NSString;
  id v6 = a5;
  v7 = WFLocalizedString(@"Allow “%1$@” to access Speech Recognition?");
  v8 = objc_msgSend(v5, "localizedStringWithFormat:", v7, v6);

  return v8;
}

- (id)contentDestinationWithError:(id *)a3
{
  return (id)objc_msgSend(MEMORY[0x263F337E8], "speechRecognitionLocation", a3);
}

- (void)dictationConnection:(id)a3 didRecognizePackage:(id)a4
{
  id v10 = [MEMORY[0x263F17BD0] recognizedResultFromPackage:a4];
  v5 = [v10 bestTranscription];
  id v6 = [v5 formattedString];

  [(WFDictateTextAction *)self setLatestTranscription:v6];
  v7 = [(WFDictateTextAction *)self actionUserInterface];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    v9 = [(WFDictateTextAction *)self actionUserInterface];
    [v9 actionDidReceiveTranscription:v6];
  }
  [(WFDictateTextAction *)self finishRunningWithError:0];
}

- (void)dictationConnection:(id)a3 didRecognizeTokens:(id)a4 languageModel:(id)a5
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x263F089D8]);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    id v11 = 0;
    uint64_t v12 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        v14 = v11;
        if (*(void *)v21 != v12) {
          objc_enumerationMutation(v8);
        }
        v15 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        if (v14
          && (objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * i), "removeSpaceBefore", (void)v20) & 1) == 0
          && ([v14 removeSpaceAfter] & 1) == 0)
        {
          [v7 appendString:@" "];
        }
        v16 = objc_msgSend(v15, "text", (void)v20);
        [v7 appendString:v16];

        id v11 = v15;
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v10);
  }
  else
  {
    id v11 = 0;
  }

  [(WFDictateTextAction *)self setLatestTranscription:v7];
  v17 = [(WFDictateTextAction *)self actionUserInterface];
  char v18 = objc_opt_respondsToSelector();

  if (v18)
  {
    v19 = [(WFDictateTextAction *)self actionUserInterface];
    [v19 actionDidReceiveTranscription:v7];
  }
}

- (void)dictationConnection:(id)a3 speechRecognitionDidFail:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = getWFDictateTextActionLogObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315394;
    uint64_t v12 = "-[WFDictateTextAction dictationConnection:speechRecognitionDidFail:]";
    __int16 v13 = 2112;
    id v14 = v5;
    _os_log_impl(&dword_23C364000, v6, OS_LOG_TYPE_DEFAULT, "%s Speech recognition failure %@", (uint8_t *)&v11, 0x16u);
  }

  id v7 = [v5 domain];
  id v8 = getkAFAssistantErrorDomain();
  if ([v7 isEqualToString:v8])
  {
    uint64_t v9 = [v5 code];

    if (v9 == 203)
    {

      goto LABEL_9;
    }
  }
  else
  {
  }
  if (v5)
  {
    uint64_t v10 = [(WFDictateTextAction *)self recognitionError];
    [(WFDictateTextAction *)self finishRunningWithError:v10];

    return;
  }
LABEL_9:
  [(WFDictateTextAction *)self finishRunningWithError:0];
}

- (void)dictationConnection:(id)a3 speechRecordingDidFail:(id)a4
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = getWFDictateTextActionLogObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315394;
    uint64_t v9 = "-[WFDictateTextAction dictationConnection:speechRecordingDidFail:]";
    __int16 v10 = 2112;
    id v11 = v5;
    _os_log_impl(&dword_23C364000, v6, OS_LOG_TYPE_DEFAULT, "%s Speech recording failure %@", (uint8_t *)&v8, 0x16u);
  }

  if (v5)
  {
    id v7 = [(WFDictateTextAction *)self recognitionError];
    [(WFDictateTextAction *)self finishRunningWithError:v7];
  }
  else
  {
    [(WFDictateTextAction *)self finishRunningWithError:0];
  }
}

- (id)recognitionError
{
  v8[2] = *MEMORY[0x263EF8340];
  v7[0] = *MEMORY[0x263F08338];
  v2 = WFLocalizedString(@"Recognition Unavailable");
  v8[0] = v2;
  v7[1] = *MEMORY[0x263F08320];
  v3 = WFLocalizedString(@"Speech recognition is not currently available. You may need to connect to the Internet.");
  v8[1] = v3;
  v4 = [NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:2];

  id v5 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F07F70] code:3328 userInfo:v4];

  return v5;
}

- (void)finishRunningWithError:(id)a3
{
  id v4 = a3;
  if ([(WFDictateTextAction *)self isRunning])
  {
    id v5 = [(WFDictateTextAction *)self latestTranscription];

    if (v5)
    {
      id v6 = [(WFDictateTextAction *)self output];
      id v7 = (void *)MEMORY[0x263F337C8];
      int v8 = [(WFDictateTextAction *)self latestTranscription];
      uint64_t v9 = [MEMORY[0x263F337E8] speechRecognitionLocation];
      __int16 v10 = [v7 itemWithObject:v8 origin:v9 disclosureLevel:1];
      [v6 addItem:v10];
    }
    id v11 = [(WFDictateTextAction *)self actionUserInterface];
    char v12 = objc_opt_respondsToSelector();

    if (v12)
    {
      __int16 v13 = [(WFDictateTextAction *)self actionUserInterface];
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __46__WFDictateTextAction_finishRunningWithError___block_invoke;
      v15[3] = &unk_264E5EBC8;
      v15[4] = self;
      [v13 dismissWithCompletionHandler:v15];
    }
    else
    {
      [(WFDictateTextAction *)self stopListening];
      v14.receiver = self;
      v14.super_class = (Class)WFDictateTextAction;
      [(WFDictateTextAction *)&v14 finishRunningWithError:v4];
    }
  }
}

void __46__WFDictateTextAction_finishRunningWithError___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 stopListening];
  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)WFDictateTextAction;
  objc_msgSendSuper2(&v5, sel_finishRunningWithError_, v4);
}

- (void)stopListening
{
  [(AFDictationConnection *)self->_dictationConnection cancelAvailabilityMonitoring];
  id v5 = objc_alloc_init(getAFSpeechRequestOptionsClass());
  [v5 setEndpointerOperationMode:3];
  v3 = [(WFDictateTextAction *)self dictationConnection];
  [v3 stopSpeechWithOptions:v5];

  id v4 = +[WFRecordingStatusManager sharedManager];
  [v4 setRecording:0];
}

- (void)cancel
{
  [(WFDictateTextAction *)self stopListening];
  v3.receiver = self;
  v3.super_class = (Class)WFDictateTextAction;
  [(WFDictateTextAction *)&v3 cancel];
}

- (void)runWithSiriUserInterface:(id)a3 input:(id)a4
{
  id v5 = objc_msgSend(MEMORY[0x263F336E8], "alertWithPreferredStyle:", 0, a4);
  id v6 = objc_alloc_init(MEMORY[0x263F85458]);
  [v5 setTextFieldConfiguration:v6];
  id v7 = (void *)MEMORY[0x263F336F0];
  uint64_t v11 = MEMORY[0x263EF8330];
  uint64_t v12 = 3221225472;
  __int16 v13 = __54__WFDictateTextAction_runWithSiriUserInterface_input___block_invoke;
  objc_super v14 = &unk_264E5DED8;
  uint64_t v15 = self;
  id v16 = v5;
  id v8 = v5;
  uint64_t v9 = [v7 okButtonWithHandler:&v11];
  objc_msgSend(v8, "addButton:", v9, v11, v12, v13, v14, v15);
  __int16 v10 = [(WFDictateTextAction *)self userInterface];
  [v10 presentAlert:v8];
}

uint64_t __54__WFDictateTextAction_runWithSiriUserInterface_input___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 40) textFieldResults];
  objc_super v3 = [v2 firstObject];
  [*(id *)(a1 + 32) setLatestTranscription:v3];

  id v4 = *(void **)(a1 + 32);
  return [v4 finishRunningWithError:0];
}

- (void)runWithRemoteUserInterface:(id)a3 locale:(id)a4 stopListeningValue:(id)a5
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __76__WFDictateTextAction_runWithRemoteUserInterface_locale_stopListeningValue___block_invoke;
  v5[3] = &unk_264E5EF80;
  v5[4] = self;
  [a3 showWithLocale:a4 stopListeningValue:a5 completionHandler:v5];
}

void __76__WFDictateTextAction_runWithRemoteUserInterface_locale_stopListeningValue___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v11 = a3;
  if (a2)
  {
    id v5 = (void *)MEMORY[0x263F337C8];
    id v6 = (void *)MEMORY[0x263F337E8];
    id v7 = a2;
    id v8 = [v6 speechRecognitionLocation];
    uint64_t v9 = [v5 itemWithObject:v7 origin:v8 disclosureLevel:1];

    __int16 v10 = [*(id *)(a1 + 32) output];
    [v10 addItem:v9];
  }
  [*(id *)(a1 + 32) finishRunningWithError:v11];
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  v25[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(WFDictateTextAction *)self userInterface];
  int v6 = [v5 isRunningWithSiriUI];

  if (!v6)
  {
    id v7 = [(WFDictateTextAction *)self parameterValueForKey:@"WFSpeechLanguage" ofClass:objc_opt_class()];
    if (v7)
    {
      if ([(id)objc_opt_class() isDictationAllowed])
      {
        id v8 = [(WFDictateTextAction *)self parameterValueForKey:@"WFDictateTextStopListening" ofClass:objc_opt_class()];
        uint64_t v9 = [MEMORY[0x263EFF960] localeWithLocaleIdentifier:v7];
        v19[0] = MEMORY[0x263EF8330];
        v19[1] = 3221225472;
        v19[2] = __50__WFDictateTextAction_runAsynchronouslyWithInput___block_invoke;
        v19[3] = &unk_264E5CFF0;
        v19[4] = self;
        id v20 = v9;
        id v21 = v8;
        id v10 = v8;
        id v11 = v9;
        [(WFDictateTextAction *)self requestInterfacePresentationWithCompletionHandler:v19];

LABEL_9:
        goto LABEL_10;
      }
      v22[0] = *MEMORY[0x263F08338];
      v17 = WFLocalizedString(@"Dictation not allowed");
      v23[0] = v17;
      v22[1] = *MEMORY[0x263F08320];
      char v18 = WFLocalizedString(@"Dictation is not currently allowed on this device.");
      v23[1] = v18;
      id v11 = [NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:2];

      objc_super v14 = (void *)MEMORY[0x263F087E8];
      uint64_t v15 = *MEMORY[0x263F870B8];
      uint64_t v16 = 5;
    }
    else
    {
      v24[0] = *MEMORY[0x263F08338];
      uint64_t v12 = WFLocalizedString(@"Unable to run shortcut");
      v25[0] = v12;
      v24[1] = *MEMORY[0x263F08320];
      __int16 v13 = WFLocalizedString(@"Speech recognition is not currently available.");
      v25[1] = v13;
      id v11 = [NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:2];

      objc_super v14 = (void *)MEMORY[0x263F087E8];
      uint64_t v15 = *MEMORY[0x263F870B8];
      uint64_t v16 = 7;
    }
    id v10 = [v14 errorWithDomain:v15 code:v16 userInfo:v11];
    [(WFDictateTextAction *)self finishRunningWithError:v10];
    goto LABEL_9;
  }
  id v7 = [(WFDictateTextAction *)self userInterface];
  [(WFDictateTextAction *)self runWithSiriUserInterface:v7 input:v4];
LABEL_10:
}

void __50__WFDictateTextAction_runAsynchronouslyWithInput___block_invoke(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    [a1[4] finishRunningWithError:v6];
  }
  else
  {
    if (v5)
    {
      if ([v5 conformsToProtocol:&unk_26F0E2AF0])
      {
        [a1[4] runWithRemoteUserInterface:v5 locale:a1[5] stopListeningValue:a1[6]];
        goto LABEL_25;
      }
      id v8 = v5;
      if ([v8 conformsToProtocol:&unk_26F0E2A90]) {
        id v7 = v8;
      }
      else {
        id v7 = 0;
      }
    }
    else
    {
      id v7 = 0;
    }
    id v9 = v7;

    [a1[4] setActionUserInterface:v9];
    uint64_t v10 = *MEMORY[0x263EFF4D0];
    id v11 = [a1[5] objectForKey:*MEMORY[0x263EFF4D0]];

    uint64_t v12 = NSString;
    uint64_t v13 = [a1[5] objectForKey:*MEMORY[0x263EFF508]];
    objc_super v14 = (void *)v13;
    if (v11)
    {
      uint64_t v15 = [a1[5] objectForKey:v10];
      uint64_t v16 = [v12 stringWithFormat:@"%@-%@", v14, v15];
    }
    else
    {
      uint64_t v16 = [v12 stringWithFormat:@"%@", v13];
    }

    v17 = [MEMORY[0x263F33718] sharedContext];
    char v18 = [v17 applicationBundle];

    id v19 = objc_alloc_init(getAFDictationOptionsClass());
    id v20 = [v18 objectForInfoDictionaryKey:*MEMORY[0x263EFFB68]];
    [v19 setApplicationName:v20];

    id v21 = NSString;
    long long v22 = [v18 objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
    long long v23 = [v18 objectForInfoDictionaryKey:*MEMORY[0x263EFFB70]];
    v24 = [v21 stringWithFormat:@"%@ (%@)", v22, v23];
    [v19 setApplicationVersion:v24];

    if ([a1[6] isEqualToString:@"After Short Pause"]) {
      uint64_t v25 = 13;
    }
    else {
      uint64_t v25 = 16;
    }
    [v19 setKeyboardType:v25];
    id v26 = objc_alloc_init(getAFSpeechRequestOptionsClass());
    if ([a1[6] isEqualToString:@"On Tap"]) {
      uint64_t v27 = 1;
    }
    else {
      uint64_t v27 = 3;
    }
    [v26 setEndpointerOperationMode:v27];
    id v28 = objc_alloc_init(getAFDictationConnectionClass());
    v29 = a1[4];
    v30 = (void *)v29[42];
    v29[42] = v28;

    objc_msgSend(*((id *)a1[4] + 42), "setDelegate:");
    [*((id *)a1[4] + 42) beginAvailabilityMonitoring];
    char v31 = [*((id *)a1[4] + 42) dictationIsAvailableForLanguage:v16];
    id v32 = a1[4];
    if (v31)
    {
      v33 = [a1[4] actionUserInterface];
      char v34 = objc_opt_respondsToSelector();

      if (v34)
      {
        v35 = [a1[4] actionUserInterface];
        [v35 actionDidBeginListening];
      }
      [*((id *)a1[4] + 42) startDictationWithLanguageCode:v16 options:v19 speechOptions:v26];
      v36 = +[WFRecordingStatusManager sharedManager];
      [v36 setRecording:1];

      v37 = [a1[4] actionUserInterface];
      v39[0] = MEMORY[0x263EF8330];
      v39[1] = 3221225472;
      v39[2] = __50__WFDictateTextAction_runAsynchronouslyWithInput___block_invoke_2;
      v39[3] = &unk_264E5EBC8;
      v39[4] = a1[4];
      [v37 showWithCompletionHandler:v39];
    }
    else
    {
      v38 = [a1[4] recognitionError];
      [v32 finishRunningWithError:v38];
    }
  }
LABEL_25:
}

uint64_t __50__WFDictateTextAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishRunningWithError:a2];
}

+ (BOOL)outputIsExemptFromTaintTrackingInheritance
{
  return 1;
}

+ (BOOL)isDictationAllowed
{
  v2 = [(objc_class *)getAFPreferencesClass_49078() sharedPreferences];
  char v3 = [v2 _dictationIsAllowed];

  return v3;
}

+ (id)userInterfaceProtocol
{
  return &unk_26F0E2A90;
}

@end