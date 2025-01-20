@interface WFShazamMediaAction
+ (id)userInterfaceProtocol;
- (SHManagedSession)managedSession;
- (void)finishRunningWithError:(id)a3;
- (void)finishRunningWithMatch:(id)a3 error:(id)a4;
- (void)runAsynchronouslyWithInput:(id)a3;
- (void)session:(id)a3 didFindMatch:(id)a4;
- (void)session:(id)a3 didNotFindMatchForSignature:(id)a4 error:(id)a5;
- (void)setManagedSession:(id)a3;
- (void)startShazam;
@end

@implementation WFShazamMediaAction

- (void).cxx_destruct
{
}

- (void)setManagedSession:(id)a3
{
}

- (SHManagedSession)managedSession
{
  return self->_managedSession;
}

- (void)session:(id)a3 didNotFindMatchForSignature:(id)a4 error:(id)a5
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v6 = a5;
  v7 = getWFActionsLogObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315394;
    v9 = "-[WFShazamMediaAction session:didNotFindMatchForSignature:error:]";
    __int16 v10 = 2114;
    id v11 = v6;
    _os_log_impl(&dword_23C364000, v7, OS_LOG_TYPE_DEFAULT, "%s Shazam session did not match for signature with error: %{public}@", (uint8_t *)&v8, 0x16u);
  }

  [(WFShazamMediaAction *)self finishRunningWithError:v6];
}

- (void)session:(id)a3 didFindMatch:(id)a4
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = getWFActionsLogObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    int v8 = "-[WFShazamMediaAction session:didFindMatch:]";
    __int16 v9 = 2112;
    id v10 = v5;
    _os_log_impl(&dword_23C364000, v6, OS_LOG_TYPE_DEFAULT, "%s Shazam action session did find match: %@", (uint8_t *)&v7, 0x16u);
  }

  [(WFShazamMediaAction *)self finishRunningWithMatch:v5 error:0];
}

- (void)finishRunningWithError:(id)a3
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    id v5 = getWFActionsLogObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&buf[4] = "-[WFShazamMediaAction finishRunningWithError:]";
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v4;
      _os_log_impl(&dword_23C364000, v5, OS_LOG_TYPE_ERROR, "%s Shazam action finished with incoming error: %{public}@", buf, 0x16u);
    }
  }
  if (objc_msgSend(v4, "wf_isUserCancelledError"))
  {
    id v6 = [(WFShazamMediaAction *)self managedSession];
    [v6 stopMatchingAmbientAudioSnippet];
  }
  if (!v4)
  {
    uint64_t v7 = 0;
    goto LABEL_21;
  }
  if ((objc_msgSend(v4, "wf_isUserCancelledError") & 1) == 0
    && (objc_msgSend(v4, "wf_isUnsupportedUserInterfaceError") & 1) == 0)
  {
    int v8 = [v4 domain];
    uint64_t v36 = 0;
    v37 = &v36;
    uint64_t v38 = 0x2020000000;
    __int16 v9 = (id *)getSHErrorDomainSymbolLoc_ptr;
    uint64_t v39 = getSHErrorDomainSymbolLoc_ptr;
    if (!getSHErrorDomainSymbolLoc_ptr)
    {
      *(void *)buf = MEMORY[0x263EF8330];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __getSHErrorDomainSymbolLoc_block_invoke;
      v47 = &unk_264E5EC88;
      v48 = &v36;
      id v10 = ShazamKitLibrary();
      uint64_t v11 = dlsym(v10, "SHErrorDomain");
      *(void *)(v48[1] + 24) = v11;
      getSHErrorDomainSymbolLoc_ptr = *(void *)(v48[1] + 24);
      __int16 v9 = (id *)v37[3];
    }
    _Block_object_dispose(&v36, 8);
    if (!v9)
    {
      v33 = [MEMORY[0x263F08690] currentHandler];
      v34 = [NSString stringWithUTF8String:"NSString *getSHErrorDomain(void)"];
      objc_msgSend(v33, "handleFailureInFunction:file:lineNumber:description:", v34, @"WFShazamMediaAction.m", 23, @"%s", dlerror());

      __break(1u);
    }
    id v12 = *v9;
    if ([v8 isEqualToString:v12])
    {
      BOOL v13 = [v4 code] == 202;

      if (v13)
      {
        v14 = WFLocalizedString(@"Shazam server could not be contacted");
        v15 = WFLocalizedString(@"Try again when network conditions improve.");
        v16 = (void *)MEMORY[0x263F087E8];
        uint64_t v17 = *MEMORY[0x263F08320];
        v44[0] = *MEMORY[0x263F08338];
        v44[1] = v17;
        v45[0] = v14;
        v45[1] = v15;
        v18 = [NSDictionary dictionaryWithObjects:v45 forKeys:v44 count:2];
        uint64_t v19 = [v16 errorWithDomain:@"WFShazamMediaActionErrorDomain" code:-2 userInfo:v18];
LABEL_20:
        uint64_t v7 = v19;

        goto LABEL_21;
      }
    }
    else
    {
    }
    v14 = WFLocalizedString(@"Uh oh, something went wrong with Shazam");
    v15 = WFLocalizedString(@"Please try again.");
    v20 = (void *)MEMORY[0x263F087E8];
    uint64_t v21 = *MEMORY[0x263F08320];
    v42[0] = *MEMORY[0x263F08338];
    v42[1] = v21;
    v43[0] = v14;
    v43[1] = v15;
    v18 = [NSDictionary dictionaryWithObjects:v43 forKeys:v42 count:2];
    uint64_t v19 = [v20 errorWithDomain:@"WFShazamMediaActionErrorDomain" code:0 userInfo:v18];
    goto LABEL_20;
  }
  uint64_t v7 = (uint64_t)v4;
LABEL_21:
  v22 = [(WFShazamMediaAction *)self parameterValueForKey:@"WFShazamMediaActionErrorIfNotRecognized" ofClass:objc_opt_class()];
  int v23 = [v22 BOOLValue];

  if (v23)
  {
    v24 = [(WFShazamMediaAction *)self output];
    BOOL v25 = ([v24 numberOfItems] | v7) == 0;

    if (v25)
    {
      v26 = WFLocalizedString(@"No Result");
      v27 = WFLocalizedString(@"Shazam didn't recognize any media.");
      v28 = (void *)MEMORY[0x263F087E8];
      uint64_t v29 = *MEMORY[0x263F08320];
      v40[0] = *MEMORY[0x263F08338];
      v40[1] = v29;
      v41[0] = v26;
      v41[1] = v27;
      v30 = [NSDictionary dictionaryWithObjects:v41 forKeys:v40 count:2];
      uint64_t v7 = [v28 errorWithDomain:@"WFShazamMediaActionErrorDomain" code:-1 userInfo:v30];
    }
  }
  if (v7)
  {
    v31 = getWFActionsLogObject();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&buf[4] = "-[WFShazamMediaAction finishRunningWithError:]";
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v7;
      _os_log_impl(&dword_23C364000, v31, OS_LOG_TYPE_ERROR, "%s Shazam action finished with outgoing error: %{public}@", buf, 0x16u);
    }
  }
  v32 = +[WFRecordingStatusManager sharedManager];
  [v32 setRecording:0];

  v35.receiver = self;
  v35.super_class = (Class)WFShazamMediaAction;
  [(WFShazamMediaAction *)&v35 finishRunningWithError:v7];
}

- (void)finishRunningWithMatch:(id)a3 error:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a4;
  uint64_t v7 = [a3 mediaItems];
  int v8 = [v7 firstObject];

  if (v8)
  {
    __int16 v9 = [[WFShazamMedia alloc] initWithMediaItem:v8];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = getWFActionsLogObject();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 136315394;
        v14 = "-[WFShazamMediaAction finishRunningWithMatch:error:]";
        __int16 v15 = 2112;
        v16 = v10;
        _os_log_impl(&dword_23C364000, v11, OS_LOG_TYPE_DEFAULT, "%s Shazam action found match: %@", (uint8_t *)&v13, 0x16u);
      }

      id v12 = [(WFShazamMediaAction *)self output];
      [v12 addObject:v10];
    }
  }
  [(WFShazamMediaAction *)self finishRunningWithError:v6];
}

- (void)startShazam
{
  v3 = +[WFRecordingStatusManager sharedManager];
  [v3 setRecording:1];

  uint64_t v8 = 0;
  __int16 v9 = &v8;
  uint64_t v10 = 0x2050000000;
  id v4 = (void *)getSHManagedSessionClass_softClass;
  uint64_t v11 = getSHManagedSessionClass_softClass;
  if (!getSHManagedSessionClass_softClass)
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __getSHManagedSessionClass_block_invoke;
    v7[3] = &unk_264E5EC88;
    v7[4] = &v8;
    __getSHManagedSessionClass_block_invoke((uint64_t)v7);
    id v4 = (void *)v9[3];
  }
  id v5 = v4;
  _Block_object_dispose(&v8, 8);
  id v6 = (void *)[[v5 alloc] initWithPartnerName:@"shortcuts"];
  [v6 setDelegate:self];
  [(WFShazamMediaAction *)self setManagedSession:v6];
  [v6 matchAmbientAudioSnippet];
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4 = [(WFShazamMediaAction *)self userInterface];
  int v5 = [v4 isRunningWithSiriUI];

  if (v5)
  {
    id v8 = [MEMORY[0x263F087E8] wfUnsupportedUserInterfaceError];
    [(WFShazamMediaAction *)self finishRunningWithError:v8];
  }
  else
  {
    id v6 = [(WFShazamMediaAction *)self parameterValueForKey:@"WFShazamMediaActionShowWhenRun" ofClass:objc_opt_class()];
    int v7 = [v6 BOOLValue];

    if (v7)
    {
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 3221225472;
      v9[2] = __50__WFShazamMediaAction_runAsynchronouslyWithInput___block_invoke;
      v9[3] = &unk_264E55FC0;
      v9[4] = self;
      [(WFShazamMediaAction *)self requestInterfacePresentationWithCompletionHandler:v9];
    }
    [(WFShazamMediaAction *)self startShazam];
  }
}

uint64_t __50__WFShazamMediaAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __50__WFShazamMediaAction_runAsynchronouslyWithInput___block_invoke_2;
  v3[3] = &unk_264E5EBC8;
  v3[4] = *(void *)(a1 + 32);
  return [a2 showWithCompletionHandler:v3];
}

uint64_t __50__WFShazamMediaAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t result, uint64_t a2)
{
  if (a2) {
    return [*(id *)(result + 32) finishRunningWithError:a2];
  }
  return result;
}

+ (id)userInterfaceProtocol
{
  return &unk_26F0E13B8;
}

@end