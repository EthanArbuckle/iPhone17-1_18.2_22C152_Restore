@interface WFPlaySoundAction
- (AVAudioPlayer)audioPlayer;
- (BOOL)isProgressIndeterminate;
- (NSTimer)progressTimer;
- (id)contentDestinationWithError:(id *)a3;
- (void)audioPlayerDecodeErrorDidOccur:(id)a3 error:(id)a4;
- (void)audioPlayerDidFinishPlaying:(id)a3 successfully:(BOOL)a4;
- (void)cancel;
- (void)cleanup;
- (void)runAsynchronouslyWithInput:(id)a3;
- (void)runWithAudioFileURL:(id)a3 fileTypeHint:(id)a4 duckOthers:(BOOL)a5;
- (void)runWithDefaultSound;
- (void)setAudioPlayer:(id)a3;
- (void)setProgressTimer:(id)a3;
- (void)updateProgress;
@end

@implementation WFPlaySoundAction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressTimer, 0);
  objc_storeStrong((id *)&self->_audioPlayer, 0);
}

- (void)setProgressTimer:(id)a3
{
}

- (NSTimer)progressTimer
{
  return self->_progressTimer;
}

- (void)setAudioPlayer:(id)a3
{
}

- (AVAudioPlayer)audioPlayer
{
  return self->_audioPlayer;
}

- (id)contentDestinationWithError:(id *)a3
{
  return 0;
}

- (void)audioPlayerDecodeErrorDidOccur:(id)a3 error:(id)a4
{
  id v5 = a4;
  [(WFPlaySoundAction *)self cleanup];
  [(WFPlaySoundAction *)self finishRunningWithError:v5];
}

- (void)audioPlayerDidFinishPlaying:(id)a3 successfully:(BOOL)a4
{
  [(WFPlaySoundAction *)self cleanup];
  [(WFPlaySoundAction *)self finishRunningWithError:0];
}

- (void)cleanup
{
  v3 = [(WFPlaySoundAction *)self progressTimer];
  [v3 invalidate];

  [(WFPlaySoundAction *)self setProgressTimer:0];
  v4 = [getAVAudioSessionClass_42015() sharedInstance];
  [v4 setActive:0 withOptions:1 error:0];

  [(WFPlaySoundAction *)self setAudioPlayer:0];
}

- (void)cancel
{
  v3 = [(WFPlaySoundAction *)self audioPlayer];
  [v3 stop];

  [(WFPlaySoundAction *)self cleanup];
  v4.receiver = self;
  v4.super_class = (Class)WFPlaySoundAction;
  [(WFPlaySoundAction *)&v4 cancel];
}

- (void)updateProgress
{
  id v2 = [(WFPlaySoundAction *)self progress];
  objc_msgSend(v2, "setCompletedUnitCount:", objc_msgSend(v2, "completedUnitCount") + 1);
}

- (void)runWithAudioFileURL:(id)a3 fileTypeHint:(id)a4 duckOthers:(BOOL)a5
{
  BOOL v5 = a5;
  v61[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  v10 = [getAVAudioSessionClass_42015() sharedInstance];
  v11 = [(WFPlaySoundAction *)self userInterface];
  v12 = [v11 userInterfaceType];

  if ([v12 isEqualToString:*MEMORY[0x263F33B40]])
  {
    v13 = [MEMORY[0x263F33718] sharedContext];
    BOOL v14 = [v13 applicationState] == 2;

    if (!v12) {
      goto LABEL_6;
    }
  }
  else
  {
    BOOL v14 = 0;
    if (!v12) {
      goto LABEL_6;
    }
  }
  if (([v12 isEqualToString:*MEMORY[0x263F33B38]] & 1) == 0
    && (([v12 isEqualToString:*MEMORY[0x263F33B30]] | v14) & 1) == 0
    && !v5)
  {
    v30 = getAVAudioSessionCategoryPlayback_42040();
    uint64_t v56 = 0;
    v57 = &v56;
    uint64_t v58 = 0x2020000000;
    v31 = (void **)getAVAudioSessionModeDefaultSymbolLoc_ptr_42041;
    uint64_t v59 = getAVAudioSessionModeDefaultSymbolLoc_ptr_42041;
    if (!getAVAudioSessionModeDefaultSymbolLoc_ptr_42041)
    {
      uint64_t v51 = MEMORY[0x263EF8330];
      uint64_t v52 = 3221225472;
      v53 = __getAVAudioSessionModeDefaultSymbolLoc_block_invoke_42042;
      v54 = &unk_264E5EC88;
      v55 = &v56;
      v32 = AVFoundationLibrary_42018();
      v57[3] = (uint64_t)dlsym(v32, "AVAudioSessionModeDefault");
      getAVAudioSessionModeDefaultSymbolLoc_ptr_42041 = *(void *)(v55[1] + 24);
      v31 = (void **)v57[3];
    }
    _Block_object_dispose(&v56, 8);
    if (!v31)
    {
      v38 = [MEMORY[0x263F08690] currentHandler];
      v39 = [NSString stringWithUTF8String:"AVAudioSessionMode getAVAudioSessionModeDefault(void)"];
      objc_msgSend(v38, "handleFailureInFunction:file:lineNumber:description:", v39, @"WFPlaySoundAction.m", 20, @"%s", dlerror());

      __break(1u);
    }
    v33 = *v31;
    id v49 = 0;
    id v34 = v33;
    char v35 = [v10 setCategory:v30 mode:v34 routeSharingPolicy:1 options:0 error:&v49];
    id v17 = v49;

    if ((v35 & 1) == 0)
    {
      [(WFPlaySoundAction *)self finishRunningWithError:v17];
      goto LABEL_27;
    }
    goto LABEL_7;
  }
LABEL_6:
  v15 = getAVAudioSessionCategoryPlayback_42040();
  id v50 = 0;
  char v16 = [v10 setCategory:v15 withOptions:19 error:&v50];
  id v17 = v50;

  if ((v16 & 1) == 0)
  {
    [(WFPlaySoundAction *)self finishRunningWithError:v17];
    goto LABEL_27;
  }
LABEL_7:
  v18 = v17;
  id v48 = v17;
  char v19 = [v10 setActive:1 error:&v48];
  id v17 = v48;

  if (v19)
  {
    uint64_t v56 = 0;
    v57 = &v56;
    uint64_t v58 = 0x2050000000;
    v20 = (void *)getAVAudioPlayerClass_softClass;
    uint64_t v59 = getAVAudioPlayerClass_softClass;
    if (!getAVAudioPlayerClass_softClass)
    {
      uint64_t v51 = MEMORY[0x263EF8330];
      uint64_t v52 = 3221225472;
      v53 = __getAVAudioPlayerClass_block_invoke;
      v54 = &unk_264E5EC88;
      v55 = &v56;
      __getAVAudioPlayerClass_block_invoke((uint64_t)&v51);
      v20 = (void *)v57[3];
    }
    v21 = v20;
    _Block_object_dispose(&v56, 8);
    id v47 = 0;
    v42 = (void *)[[v21 alloc] initWithContentsOfURL:v8 fileTypeHint:v9 error:&v47];
    id v22 = v47;
    if (v22)
    {
      v23 = v22;
      v24 = [v22 domain];
      uint64_t v25 = *MEMORY[0x263F08410];
      int v26 = [v24 isEqualToString:*MEMORY[0x263F08410]];

      if (v26 && ([v23 code] == 1954115647 || objc_msgSend(v23, "code") == 1718449215))
      {
        v41 = (void *)MEMORY[0x263F087E8];
        uint64_t v40 = [v23 code];
        uint64_t v60 = *MEMORY[0x263F08320];
        v27 = WFLocalizedString(@"Play Sound failed because the input was in an unsupported format.");
        v61[0] = v27;
        v28 = [NSDictionary dictionaryWithObjects:v61 forKeys:&v60 count:1];
        uint64_t v29 = [v41 errorWithDomain:v25 code:v40 userInfo:v28];

        v23 = (void *)v29;
      }
      [(WFPlaySoundAction *)self finishRunningWithError:v23];
    }
    else
    {
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __65__WFPlaySoundAction_runWithAudioFileURL_fileTypeHint_duckOthers___block_invoke;
      block[3] = &unk_264E5DED8;
      block[4] = self;
      id v36 = v42;
      id v46 = v36;
      dispatch_async(MEMORY[0x263EF83A0], block);
      [v36 setDelegate:self];
      [(WFPlaySoundAction *)self setAudioPlayer:v36];
      v37 = [(WFPlaySoundAction *)self userInterface];
      v43[0] = MEMORY[0x263EF8330];
      v43[1] = 3221225472;
      v43[2] = __65__WFPlaySoundAction_runWithAudioFileURL_fileTypeHint_duckOthers___block_invoke_2;
      v43[3] = &unk_264E5EE70;
      id v44 = v36;
      WFConfigureAudioRoutesForUserInterface(v37, v43);

      v23 = 0;
    }
  }
  else
  {
    [(WFPlaySoundAction *)self finishRunningWithError:v17];
  }
LABEL_27:
}

void __65__WFPlaySoundAction_runWithAudioFileURL_fileTypeHint_duckOthers___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 40) duration];
  uint64_t v3 = (uint64_t)(v2 * 30.0);
  objc_super v4 = [*(id *)(a1 + 32) progress];
  [v4 setTotalUnitCount:v3];

  BOOL v5 = [MEMORY[0x263EFFA20] scheduledTimerWithTimeInterval:*(void *)(a1 + 32) target:sel_updateProgress selector:0 userInfo:1 repeats:0.0333333333];
  [*(id *)(a1 + 32) setProgressTimer:v5];

  id v6 = [*(id *)(a1 + 32) progressTimer];
  [v6 setTolerance:0.5];
}

uint64_t __65__WFPlaySoundAction_runWithAudioFileURL_fileTypeHint_duckOthers___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) play];
}

- (void)runWithDefaultSound
{
  id v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v3 = [v4 URLForResource:@"soundDefault" withExtension:@"caf"];
  [(WFPlaySoundAction *)self runWithAudioFileURL:v3 fileTypeHint:0 duckOthers:1];
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __48__WFPlaySoundAction_runAsynchronouslyWithInput___block_invoke;
  v6[3] = &unk_264E5DBA0;
  v6[4] = self;
  [v4 generateCollectionByCoercingToItemClass:v5 completionHandler:v6];
}

void __48__WFPlaySoundAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 items];

  if (v4)
  {
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __48__WFPlaySoundAction_runAsynchronouslyWithInput___block_invoke_2;
    v5[3] = &unk_264E5D390;
    v5[4] = *(void *)(a1 + 32);
    [v3 getFileRepresentation:v5 forType:0];
  }
  else
  {
    [*(id *)(a1 + 32) runWithDefaultSound];
  }
}

void __48__WFPlaySoundAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  id v8 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 fileURL];
    id v6 = [v8 wfType];
    v7 = [v6 string];
    [v4 runWithAudioFileURL:v5 fileTypeHint:v7 duckOthers:0];
  }
  else
  {
    [v4 runWithDefaultSound];
  }
}

- (BOOL)isProgressIndeterminate
{
  return 0;
}

@end