@interface PKTextInputDebugLogEntryRerun
- (PKTextInputDebugArchivedLogEntry)logEntry;
- (PKTextInputDebugLogEntryRerun)initWithLogEntry:(id)a3;
- (PKTextInputDebugLogEntryRerun)runWithCompletion:(id)a3;
- (id)recognitionManager:(id)a3 textInputTargetForItemStableIdentifier:(id)a4 strokeIdentifiers:(id)a5 simultaneousItemStableIdentifiers:(id)a6;
- (id)recognitionManagerStrokeProvider:(id)a3;
- (id)recognitionManagerTextInputTargets:(id)a3;
- (void)_finishRerunWithQueryItems:(id)a3 error:(id)a4;
- (void)recognitionManager:(id)a3 fetchContentInfoForTextInputTarget:(id)a4 strokeIdentifiers:(id)a5 completion:(id)a6;
- (void)recognitionManager:(id)a3 recognitionDidFinishWithQueryItems:(id)a4 duration:(double)a5;
@end

@implementation PKTextInputDebugLogEntryRerun

- (PKTextInputDebugLogEntryRerun)initWithLogEntry:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKTextInputDebugLogEntryRerun;
  v6 = [(PKTextInputDebugLogEntryRerun *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_logEntry, a3);
  }

  return v7;
}

- (PKTextInputDebugLogEntryRerun)runWithCompletion:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  v4 = _Block_copy(a3);
  id completionBlock = self->_completionBlock;
  self->_id completionBlock = v4;

  v6 = [(PKTextInputDebugLogEntry *)self->_logEntry recognitionLocaleIdentifiers];
  v7 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v29 objects:v35 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v30;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v30 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:*(void *)(*((void *)&v29 + 1) + 8 * v12)];
        if (v13) {
          [v7 addObject:v13];
        }

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v29 objects:v35 count:16];
    }
    while (v10);
  }

  if (![v7 count])
  {
    v23 = [NSString stringWithFormat:@"Invalid locales for log entry: \"%@\"", v8];
LABEL_17:
    v24 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v25 = *MEMORY[0x1E4F281F8];
    uint64_t v33 = *MEMORY[0x1E4F28568];
    v34 = v23;
    v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v34 forKeys:&v33 count:1];
    v27 = [v24 errorWithDomain:v25 code:1 userInfo:v26];

    [(PKTextInputDebugLogEntryRerun *)self _finishRerunWithQueryItems:0 error:v27];
    goto LABEL_18;
  }
  uint64_t v14 = [(PKTextInputDebugLogEntry *)self->_logEntry inputDrawing];
  if (!v14)
  {
    v23 = @"Invalid input drawing.";
    goto LABEL_17;
  }
  v15 = (void *)v14;
  v16 = [[PKTextInputStrokeProvider alloc] initWithDrawing:v14];
  strokeProvider = self->_strokeProvider;
  self->_strokeProvider = v16;

  v18 = (PKTextInputLanguageSpec *)-[PKTextInputLanguageSpec initWithLocales:]([PKTextInputLanguageSpec alloc], v7);
  languageSpec = self->_languageSpec;
  self->_languageSpec = v18;

  v20 = objc_alloc_init(PKTextInputRecognitionManager);
  recognitionManager = self->_recognitionManager;
  self->_recognitionManager = v20;

  v22 = self->_languageSpec;
  if (v22) {
    -[PKTextInputRecognitionManager setRecognitionLocales:]((uint64_t)self->_recognitionManager, v22->__locales);
  }
  -[PKTextInputRecognitionManager beginRecognitionRequestWithDataSource:](&self->_recognitionManager->super.isa, self);
LABEL_18:

  return result;
}

- (void)_finishRerunWithQueryItems:(id)a3 error:(id)a4
{
  (*((void (**)(void))self->_completionBlock + 2))();
  id completionBlock = self->_completionBlock;
  self->_id completionBlock = 0;
}

- (id)recognitionManagerStrokeProvider:(id)a3
{
  return self->_strokeProvider;
}

- (id)recognitionManagerTextInputTargets:(id)a3
{
  return [(PKTextInputDebugLogEntry *)self->_logEntry inputTargets];
}

- (id)recognitionManager:(id)a3 textInputTargetForItemStableIdentifier:(id)a4 strokeIdentifiers:(id)a5 simultaneousItemStableIdentifiers:(id)a6
{
  v6 = [(PKTextInputDebugLogEntry *)self->_logEntry inputTargetContentInfo];
  v7 = [v6 textInputTarget];

  return v7;
}

- (void)recognitionManager:(id)a3 fetchContentInfoForTextInputTarget:(id)a4 strokeIdentifiers:(id)a5 completion:(id)a6
{
  logEntry = self->_logEntry;
  id v8 = a6;
  id v9 = [(PKTextInputDebugLogEntry *)logEntry inputTargetContentInfo];
  (*((void (**)(id, id))a6 + 2))(v8, v9);
}

- (void)recognitionManager:(id)a3 recognitionDidFinishWithQueryItems:(id)a4 duration:(double)a5
{
}

- (PKTextInputDebugArchivedLogEntry)logEntry
{
  return self->_logEntry;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logEntry, 0);
  objc_storeStrong((id *)&self->_strokeProvider, 0);
  objc_storeStrong((id *)&self->_languageSpec, 0);
  objc_storeStrong(&self->_completionBlock, 0);

  objc_storeStrong((id *)&self->_recognitionManager, 0);
}

@end