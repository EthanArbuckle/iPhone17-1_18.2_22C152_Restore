@interface WFRecordAudioActionUIKitUserInterface
- (id)completionHandler;
- (void)cancelPresentationWithCompletionHandler:(id)a3;
- (void)finishWithFileRepresentation:(id)a3 error:(id)a4;
- (void)setCompletionHandler:(id)a3;
- (void)showWithOutputFormat:(int64_t)a3 startImmediately:(BOOL)a4 recordingDuration:(double)a5 completionHandler:(id)a6;
@end

@implementation WFRecordAudioActionUIKitUserInterface

- (void).cxx_destruct
{
}

- (void)setCompletionHandler:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)cancelPresentationWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __81__WFRecordAudioActionUIKitUserInterface_cancelPresentationWithCompletionHandler___block_invoke;
  v7[3] = &unk_264900EB0;
  v7[4] = self;
  id v8 = v4;
  v6.receiver = self;
  v6.super_class = (Class)WFRecordAudioActionUIKitUserInterface;
  id v5 = v4;
  [(WFEmbeddableActionUserInterface *)&v6 cancelPresentationWithCompletionHandler:v7];
}

uint64_t __81__WFRecordAudioActionUIKitUserInterface_cancelPresentationWithCompletionHandler___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3 = [MEMORY[0x263F087E8] userCancelledError];
  [v2 finishWithFileRepresentation:0 error:v3];

  id v4 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v4();
}

- (void)finishWithFileRepresentation:(id)a3 error:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  v7 = [(WFRecordAudioActionUIKitUserInterface *)self completionHandler];

  if (v7)
  {
    id v8 = [(WFRecordAudioActionUIKitUserInterface *)self completionHandler];
    ((void (**)(void, id, id))v8)[2](v8, v9, v6);
  }
  [(WFRecordAudioActionUIKitUserInterface *)self setCompletionHandler:0];
}

- (void)showWithOutputFormat:(int64_t)a3 startImmediately:(BOOL)a4 recordingDuration:(double)a5 completionHandler:(id)a6
{
  id v11 = a6;
  if (!v11)
  {
    v12 = [MEMORY[0x263F08690] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"WFRecordAudioActionUIKitUserInterface.m", 24, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];
  }
  [(WFRecordAudioActionUIKitUserInterface *)self setCompletionHandler:v11];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __115__WFRecordAudioActionUIKitUserInterface_showWithOutputFormat_startImmediately_recordingDuration_completionHandler___block_invoke;
  block[3] = &unk_2648FFFD8;
  BOOL v14 = a4;
  *(double *)&block[6] = a5;
  block[4] = self;
  block[5] = a3;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __115__WFRecordAudioActionUIKitUserInterface_showWithOutputFormat_startImmediately_recordingDuration_completionHandler___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x263F339A0];
  v3 = [(id)objc_opt_class() datedFilenameForFormat:*(void *)(a1 + 40)];
  id v4 = [v2 proposedTemporaryFileURLForFilename:v3];

  id v5 = [[WFAudioRecorderViewController alloc] initWithOutputFormat:*(void *)(a1 + 40) destinationURL:v4];
  [(WFAudioRecorderViewController *)v5 setStartImmediately:*(unsigned __int8 *)(a1 + 56)];
  [(WFAudioRecorderViewController *)v5 setRecordingDuration:*(double *)(a1 + 48)];
  objc_initWeak(&location, v5);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __115__WFRecordAudioActionUIKitUserInterface_showWithOutputFormat_startImmediately_recordingDuration_completionHandler___block_invoke_2;
  v6[3] = &unk_2648FFFB0;
  objc_copyWeak(&v7, &location);
  v6[4] = *(void *)(a1 + 32);
  [(WFAudioRecorderViewController *)v5 setCompletionHandler:v6];
  [*(id *)(a1 + 32) presentContent:v5];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __115__WFRecordAudioActionUIKitUserInterface_showWithOutputFormat_startImmediately_recordingDuration_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v8 = [WeakRetained presentingViewController];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __115__WFRecordAudioActionUIKitUserInterface_showWithOutputFormat_startImmediately_recordingDuration_completionHandler___block_invoke_3;
  v12[3] = &unk_264900940;
  uint64_t v9 = *(void *)(a1 + 32);
  id v13 = v5;
  uint64_t v14 = v9;
  id v15 = v6;
  id v10 = v6;
  id v11 = v5;
  [v8 dismissViewControllerAnimated:1 completion:v12];
}

void __115__WFRecordAudioActionUIKitUserInterface_showWithOutputFormat_startImmediately_recordingDuration_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  if (v1)
  {
    id v4 = [MEMORY[0x263F33870] fileWithURL:v1 options:1];
    [v2 finishWithFileRepresentation:v4 error:0];
  }
  else
  {
    v3 = *(void **)(a1 + 40);
    objc_msgSend(v3, "finishWithFileRepresentation:error:");
  }
}

@end