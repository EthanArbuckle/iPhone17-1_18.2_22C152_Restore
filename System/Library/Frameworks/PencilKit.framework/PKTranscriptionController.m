@interface PKTranscriptionController
- (BOOL)didReceiveTranscription;
- (BOOL)didShowHUD;
- (BOOL)shouldCancel;
- (NSProgress)currentProgress;
- (NSString)textTranscription;
- (PKAttachment)attachment;
- (PKProgressAlertController)progressAlertController;
- (PKRecognitionSessionManager)recognitionManager;
- (PKStrokeSelection)strokeSelection;
- (PKTranscriptionController)initWithRecognitionManager:(id)a3 strokeSelection:(id)a4 attachment:(id)a5;
- (id)_fetchTranscriptionWithCompletion:(id)a3;
- (int)transcriptionType;
- (void)_hideHUD;
- (void)_progressChanged;
- (void)_receiveTranscription:(id)a3;
- (void)_showHUDWithProgress:(id)a3;
- (void)_unregisterProgressObserver;
- (void)cancelAndTeardown;
- (void)dealloc;
- (void)findCompleteTranscriptionForNote:(id)a3;
- (void)findTranscriptionForType:(int)a3 withCompletion:(id)a4;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setAttachment:(id)a3;
- (void)setCurrentProgress:(id)a3;
- (void)setDidReceiveTranscription:(BOOL)a3;
- (void)setDidShowHUD:(BOOL)a3;
- (void)setProgressAlertController:(id)a3;
- (void)setRecognitionManager:(id)a3;
- (void)setShouldCancel:(BOOL)a3;
- (void)setStrokeSelection:(id)a3;
- (void)setTextTranscription:(id)a3;
- (void)setTranscriptionType:(int)a3;
- (void)textInputDidChange:(id)a3;
@end

@implementation PKTranscriptionController

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)PKTranscriptionController;
  [(PKTranscriptionController *)&v4 dealloc];
}

- (PKTranscriptionController)initWithRecognitionManager:(id)a3 strokeSelection:(id)a4 attachment:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PKTranscriptionController;
  v11 = [(PKTranscriptionController *)&v15 init];
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_recognitionManager, v8);
    objc_storeStrong((id *)&v12->_strokeSelection, a4);
    objc_storeWeak((id *)&v12->_attachment, v10);
    v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v13 addObserver:v12 selector:sel_textInputDidChange_ name:@"TIPreferencesControllerChangedNotification" object:0];
  }
  return v12;
}

- (void)findTranscriptionForType:(int)a3 withCompletion:(id)a4
{
  v6 = (void (**)(id, void *))a4;
  self->_didShowHUD = 0;
  self->_transcriptionType = a3;
  v7 = [(PKTranscriptionController *)self textTranscription];

  if (v7)
  {
    if (v6)
    {
      id v8 = [PKTranscriptionResult alloc];
      id v9 = [(PKTranscriptionController *)self textTranscription];
      id v10 = [(PKTranscriptionResult *)v8 initWithTranscription:v9 didShowHUD:self->_didShowHUD];

      v6[2](v6, v10);
    }
  }
  else
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __69__PKTranscriptionController_findTranscriptionForType_withCompletion___block_invoke;
    v15[3] = &unk_1E64C8E20;
    v15[4] = self;
    v16 = v6;
    v11 = [(PKTranscriptionController *)self _fetchTranscriptionWithCompletion:v15];
    if (a3 != 2)
    {
      dispatch_time_t v12 = dispatch_time(0, 2000000000);
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __69__PKTranscriptionController_findTranscriptionForType_withCompletion___block_invoke_2;
      v13[3] = &unk_1E64C5F60;
      v13[4] = self;
      id v14 = v11;
      dispatch_after(v12, MEMORY[0x1E4F14428], v13);
    }
  }
}

void __69__PKTranscriptionController_findTranscriptionForType_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  *(unsigned char *)(*(void *)(a1 + 32) + 9) = 1;
  [*(id *)(a1 + 32) _hideHUD];
  if (*(void *)(a1 + 40))
  {
    v3 = [[PKTranscriptionResult alloc] initWithTranscription:v4 didShowHUD:*(unsigned __int8 *)(*(void *)(a1 + 32) + 10)];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

uint64_t __69__PKTranscriptionController_findTranscriptionForType_withCompletion___block_invoke_2(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (!*(unsigned char *)(v1 + 9))
  {
    *(unsigned char *)(v1 + 10) = 1;
    return [*(id *)(result + 32) _showHUDWithProgress:*(void *)(result + 40)];
  }
  return result;
}

- (void)cancelAndTeardown
{
  self->_shouldCancel = 1;
  [(PKTranscriptionController *)self _hideHUD];
}

- (id)_fetchTranscriptionWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [(PKTranscriptionController *)self strokeSelection];
  v6 = [v5 drawing];

  if (v6 && (id v7 = objc_loadWeakRetained((id *)&self->_recognitionManager), v7, v7))
  {
    self->_shouldCancel = 0;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __63__PKTranscriptionController__fetchTranscriptionWithCompletion___block_invoke;
    aBlock[3] = &unk_1E64C8E48;
    aBlock[4] = self;
    id v8 = _Block_copy(aBlock);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_recognitionManager);
    uint64_t v10 = [WeakRetained state];

    if (v10 != 3)
    {
      v11 = (void *)MEMORY[0x1E4F1CA70];
      id v12 = objc_loadWeakRetained((id *)&self->_attachment);
      uint64_t v13 = [v12 strokeSpatialCache];
      id v14 = (void *)v13;
      if (v13) {
        objc_super v15 = *(void **)(v13 + 24);
      }
      else {
        objc_super v15 = 0;
      }
      id v16 = v15;
      v17 = [v11 orderedSetWithArray:v16];

      v18 = [(PKTranscriptionController *)self strokeSelection];
      v19 = [v18 strokes];
      [v17 unionOrderedSet:v19];

      id v20 = objc_loadWeakRetained((id *)&self->_recognitionManager);
      v21 = [v17 array];
      -[PKRecognitionSessionManager setVisibleOnscreenStrokes:]((uint64_t)v20, v21);
    }
    id v22 = objc_loadWeakRetained((id *)&self->_recognitionManager);
    v23 = [(PKTranscriptionController *)self strokeSelection];
    v24 = [v23 strokes];
    v25 = [v24 array];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __63__PKTranscriptionController__fetchTranscriptionWithCompletion___block_invoke_2;
    v28[3] = &unk_1E64C8E20;
    v28[4] = self;
    id v29 = v4;
    v26 = -[PKRecognitionSessionManager fetchTranscriptionForStrokes:cancelBlock:withCompletion:]((uint64_t)v22, v25, v8, v28);
  }
  else
  {
    v26 = 0;
  }

  return v26;
}

uint64_t __63__PKTranscriptionController__fetchTranscriptionWithCompletion___block_invoke(uint64_t a1)
{
  return *(unsigned __int8 *)(*(void *)(a1 + 32) + 8);
}

void __63__PKTranscriptionController__fetchTranscriptionWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) _receiveTranscription:a2];
  v3 = os_log_create("com.apple.pencilkit", "Recognition");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1C44F8000, v3, OS_LOG_TYPE_DEFAULT, "[On-demand Transcription] Successfully fetched transcription from CoreHandwriting", v6, 2u);
  }

  uint64_t v4 = *(void *)(a1 + 40);
  if (v4)
  {
    v5 = [*(id *)(a1 + 32) textTranscription];
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);
  }
}

- (void)findCompleteTranscriptionForNote:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_recognitionManager);

  if (WeakRetained)
  {
    self->_shouldCancel = 0;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __62__PKTranscriptionController_findCompleteTranscriptionForNote___block_invoke;
    aBlock[3] = &unk_1E64C8E48;
    aBlock[4] = self;
    v6 = _Block_copy(aBlock);
    id v7 = objc_loadWeakRetained((id *)&self->_recognitionManager);
    id v8 = [(PKTranscriptionController *)self attachment];
    id v9 = [v8 drawing];
    uint64_t v10 = [v9 strokes];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __62__PKTranscriptionController_findCompleteTranscriptionForNote___block_invoke_2;
    v12[3] = &unk_1E64C8E20;
    v12[4] = self;
    id v13 = v4;
    v11 = -[PKRecognitionSessionManager fetchTranscriptionForStrokes:cancelBlock:withCompletion:]((uint64_t)v7, v10, v6, v12);
  }
}

uint64_t __62__PKTranscriptionController_findCompleteTranscriptionForNote___block_invoke(uint64_t a1)
{
  return *(unsigned __int8 *)(*(void *)(a1 + 32) + 8);
}

void __62__PKTranscriptionController_findCompleteTranscriptionForNote___block_invoke_2(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) _receiveTranscription:a2];
  if (*(void *)(a1 + 40))
  {
    v3 = [PKTranscriptionResult alloc];
    id v4 = [*(id *)(a1 + 32) textTranscription];
    v5 = [(PKTranscriptionResult *)v3 initWithTranscription:v4 didShowHUD:*(unsigned __int8 *)(*(void *)(a1 + 32) + 10)];

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)_receiveTranscription:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    v5 = os_log_create("com.apple.pencilkit", "Recognition");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1C44F8000, v5, OS_LOG_TYPE_ERROR, "[On-demand Transcription] Unable to fetch transcription from CoreHandwriting, falling back on creating a new session with just the selected strokes", buf, 2u);
    }
  }
  if ([v4 length] || self->_transcriptionType == 2)
  {
    [(PKTranscriptionController *)self setTextTranscription:v4];
  }
  else
  {
    id v7 = _PencilKitBundle();
    id v8 = [v7 localizedStringForKey:@"Handwritten Note" value:@"Handwritten Note" table:@"Localizable"];
    [(PKTranscriptionController *)self setTextTranscription:v8];
  }
  v6 = os_log_create("com.apple.pencilkit", "Recognition");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v9 = 0;
    _os_log_impl(&dword_1C44F8000, v6, OS_LOG_TYPE_DEFAULT, "[On-demand Transcription] Successfully fetched transcription from CoreHandwriting", v9, 2u);
  }
}

- (void)_showHUDWithProgress:(id)a3
{
  id v4 = (NSProgress *)a3;
  int transcriptionType = self->_transcriptionType;
  if (transcriptionType == 1)
  {
    uint64_t v10 = _PencilKitBundle();
    id v22 = [v10 localizedStringForKey:@"Translating Text…" value:@"Translating Text…" table:@"Localizable"];

    id v7 = _PencilKitBundle();
    id v8 = v7;
    id v9 = @"Cancel translating";
  }
  else if (transcriptionType)
  {
    v11 = _PencilKitBundle();
    id v22 = [v11 localizedStringForKey:@"Transcribing Text…" value:@"Transcribing Text…" table:@"Localizable"];

    id v7 = _PencilKitBundle();
    id v8 = v7;
    id v9 = @"Cancel transcription";
  }
  else
  {
    v6 = _PencilKitBundle();
    id v22 = [v6 localizedStringForKey:@"Copying as Text…" value:@"Copying as Text…" table:@"Localizable"];

    id v7 = _PencilKitBundle();
    id v8 = v7;
    id v9 = @"Cancel copy as text";
  }
  id v12 = [v7 localizedStringForKey:v9 value:@"Cancel" table:@"Localizable"];

  id v13 = +[PKProgressAlertController newProgressAlertControllerWithTitle:v22 cancel:v12];
  progressAlertController = self->_progressAlertController;
  self->_progressAlertController = v13;

  [(PKProgressAlertController *)self->_progressAlertController setDelegate:self];
  objc_super v15 = self->_progressAlertController;
  [(NSProgress *)v4 fractionCompleted];
  -[PKProgressAlertController setProgress:](v15, "setProgress:");
  currentProgress = self->_currentProgress;
  self->_currentProgress = v4;
  v17 = v4;

  [(NSProgress *)self->_currentProgress addObserver:self forKeyPath:@"fractionCompleted" options:3 context:PKCopyAsTextContext];
  v18 = [(PKTranscriptionController *)self attachment];
  v19 = [v18 viewRep];
  id v20 = [v19 window];
  v21 = [v20 rootViewController];
  [v21 presentViewController:self->_progressAlertController animated:1 completion:&__block_literal_global_51];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if ((void *)PKCopyAsTextContext == a6)
  {
    if (objc_msgSend(MEMORY[0x1E4F29060], "isMainThread", a3, a4, a5))
    {
      [(PKTranscriptionController *)self _progressChanged];
    }
    else
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __76__PKTranscriptionController_observeValueForKeyPath_ofObject_change_context___block_invoke;
      block[3] = &unk_1E64C61C0;
      block[4] = self;
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
  }
}

uint64_t __76__PKTranscriptionController_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _progressChanged];
}

- (void)_progressChanged
{
  v3 = [(PKProgressAlertController *)self->_progressAlertController presentingViewController];

  if (v3)
  {
    progressAlertController = self->_progressAlertController;
    [(NSProgress *)self->_currentProgress fractionCompleted];
    -[PKProgressAlertController setProgress:](progressAlertController, "setProgress:");
  }
}

- (void)_unregisterProgressObserver
{
  [(NSProgress *)self->_currentProgress removeObserver:self forKeyPath:@"fractionCompleted" context:PKCopyAsTextContext];
  currentProgress = self->_currentProgress;
  self->_currentProgress = 0;
}

- (void)_hideHUD
{
  [(PKTranscriptionController *)self _unregisterProgressObserver];
  progressAlertController = self->_progressAlertController;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __37__PKTranscriptionController__hideHUD__block_invoke;
  v4[3] = &unk_1E64C61C0;
  v4[4] = self;
  [(PKProgressAlertController *)progressAlertController dismissViewControllerAnimated:1 completion:v4];
}

void __37__PKTranscriptionController__hideHUD__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = *(void **)(v1 + 40);
  *(void *)(v1 + 40) = 0;
}

- (void)textInputDidChange:(id)a3
{
}

- (PKAttachment)attachment
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_attachment);

  return (PKAttachment *)WeakRetained;
}

- (void)setAttachment:(id)a3
{
}

- (PKStrokeSelection)strokeSelection
{
  return self->_strokeSelection;
}

- (void)setStrokeSelection:(id)a3
{
}

- (PKRecognitionSessionManager)recognitionManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_recognitionManager);

  return (PKRecognitionSessionManager *)WeakRetained;
}

- (void)setRecognitionManager:(id)a3
{
}

- (PKProgressAlertController)progressAlertController
{
  return self->_progressAlertController;
}

- (void)setProgressAlertController:(id)a3
{
}

- (NSProgress)currentProgress
{
  return self->_currentProgress;
}

- (void)setCurrentProgress:(id)a3
{
}

- (BOOL)shouldCancel
{
  return self->_shouldCancel;
}

- (void)setShouldCancel:(BOOL)a3
{
  self->_shouldCancel = a3;
}

- (BOOL)didReceiveTranscription
{
  return self->_didReceiveTranscription;
}

- (void)setDidReceiveTranscription:(BOOL)a3
{
  self->_didReceiveTranscription = a3;
}

- (BOOL)didShowHUD
{
  return self->_didShowHUD;
}

- (void)setDidShowHUD:(BOOL)a3
{
  self->_didShowHUD = a3;
}

- (NSString)textTranscription
{
  return self->_textTranscription;
}

- (void)setTextTranscription:(id)a3
{
}

- (int)transcriptionType
{
  return self->_transcriptionType;
}

- (void)setTranscriptionType:(int)a3
{
  self->_int transcriptionType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textTranscription, 0);
  objc_storeStrong((id *)&self->_currentProgress, 0);
  objc_storeStrong((id *)&self->_progressAlertController, 0);
  objc_destroyWeak((id *)&self->_recognitionManager);
  objc_storeStrong((id *)&self->_strokeSelection, 0);

  objc_destroyWeak((id *)&self->_attachment);
}

@end