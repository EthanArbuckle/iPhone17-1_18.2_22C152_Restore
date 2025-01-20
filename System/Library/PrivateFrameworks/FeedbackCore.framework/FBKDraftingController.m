@interface FBKDraftingController
- (BOOL)answer:(id)a3 isValidForQuestion:(id)a4;
- (BOOL)isDirty;
- (BOOL)isLoading;
- (BOOL)isQuestionVisible:(id)a3;
- (BOOL)isSubmitting;
- (BOOL)spamDebugLogs;
- (BOOL)updateQuestionVisibility;
- (BOOL)useInlineChoices;
- (BOOL)validate:(id *)a3;
- (FBKBugFormStub)formStub;
- (FBKData)FBKData;
- (FBKDeviceDiagnosticsController)diagnosticsController;
- (FBKDraftModelSnapshot)currentSnapshot;
- (FBKDraftingController)init;
- (FBKDraftingController)initWithFBKData:(id)a3;
- (FBKDraftingDelegate)delegate;
- (FBKFormResponse)formResponse;
- (FBKQuestionDependencyGraph)dependencyGraph;
- (FBKTeam)team;
- (NSArray)allVisibleAnswers;
- (NSArray)cachedVisibleGroups;
- (NSArray)unansweredRequiredModalQuestions;
- (NSDictionary)cachedDiffableSections;
- (NSMutableDictionary)cachedVisibleQuestions;
- (NSMutableSet)questionIDsInErrorState;
- (NSString)attachmentsSectionTitleFromBugForm;
- (id)choiceSetResolverWithValue:(id)a3 givenChoices:(id)a4;
- (id)firstVisibleInvalidQuestion;
- (id)generateSnapshotIdentifiers:(BOOL)a3;
- (id)identifierForVisibleQuestion:(id)a3 hasAttemptedSubmission:(BOOL)a4;
- (id)indexPathForQuestion:(id)a3;
- (id)invalidQuestionIDs;
- (id)newModelSnapshot;
- (id)questionChoiceForSectionIdentifier:(id)a3 itemIdentifier:(id)a4;
- (id)questionForVisibleChoice:(id)a3 sectionIdentifier:(id)a4;
- (id)questionGroupForSectionIdentifier:(id)a3;
- (id)questionsForSectionIdentifier:(id)a3;
- (id)visibleQuestionForSectionIdentifier:(id)a3 itemIdentifier:(id)a4;
- (id)visibleQuestionGroups;
- (id)visibleQuestionsForGroup:(id)a3;
- (void)_initForFormResponse;
- (void)_loadNewResponseForBugForm:(id)a3 orBugFormStub:(id)a4 withTeam:(id)a5 requestPlugIns:(id)a6 appToken:(id)a7;
- (void)_loadResponseWithFormResponse:(id)a3 item:(id)a4;
- (void)_resetInternalEntities;
- (void)attachAnswersToQuestionsWithGivenData:(id)a3;
- (void)automaticallyFillInAllAnswers;
- (void)configure;
- (void)didChangeAnswerToQuestion:(id)a3;
- (void)loadFormResponseFromContentItem:(id)a3;
- (void)loadNewResponseForBugForm:(id)a3;
- (void)loadNewResponseForBugForm:(id)a3 withTeam:(id)a4;
- (void)loadNewResponseForBugFormStub:(id)a3;
- (void)loadNewResponseForBugFormStub:(id)a3 requestPlugIns:(id)a4 appToken:(id)a5;
- (void)loadNewResponseForBugFormStub:(id)a3 withTeam:(id)a4;
- (void)loadResponseForFeedbackObject:(id)a3;
- (void)loadResponseForFeedbackObject:(id)a3 withTeam:(id)a4;
- (void)preemptivelyRemoveQuestionFromErrorStateWithQuestion:(id)a3;
- (void)reevaluateDependenciesWithQuestionChanged:(id)a3 toAdd:(id)a4 toRemove:(id)a5;
- (void)runResolvers;
- (void)sendSnapshotUpdate;
- (void)setAttachmentsSectionTitleFromBugForm:(id)a3;
- (void)setCachedDiffableSections:(id)a3;
- (void)setCachedVisibleGroups:(id)a3;
- (void)setCachedVisibleQuestions:(id)a3;
- (void)setCurrentSnapshot:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDependencyGraph:(id)a3;
- (void)setDiagnosticsController:(id)a3;
- (void)setFBKData:(id)a3;
- (void)setFormResponse:(id)a3;
- (void)setFormStub:(id)a3;
- (void)setIsDirty:(BOOL)a3;
- (void)setIsLoading:(BOOL)a3;
- (void)setIsSubmitting:(BOOL)a3;
- (void)setQuestionIDsInErrorState:(id)a3;
- (void)setResponse:(id)a3 forQuestion:(id)a4;
- (void)setSpamDebugLogs:(BOOL)a3;
- (void)setTeam:(id)a3;
- (void)setUseInlineChoices:(BOOL)a3;
- (void)updateUIAfterAutoFill;
- (void)updateVisibilityForChangedQuestion:(id)a3;
@end

@implementation FBKDraftingController

- (FBKDraftingController)initWithFBKData:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)FBKDraftingController;
  v5 = [(FBKDraftingController *)&v8 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_FBKData, v4);
    [(FBKDraftingController *)v6 configure];
  }

  return v6;
}

- (FBKDraftingController)init
{
  v5.receiver = self;
  v5.super_class = (Class)FBKDraftingController;
  v2 = [(FBKDraftingController *)&v5 init];
  if (v2)
  {
    v3 = +[FBKData sharedInstance];
    objc_storeWeak((id *)&v2->_FBKData, v3);

    [(FBKDraftingController *)v2 configure];
  }
  return v2;
}

- (void)configure
{
  self->_cachedDiffableSections = (NSDictionary *)objc_opt_new();

  MEMORY[0x270F9A758]();
}

- (void)loadResponseForFeedbackObject:(id)a3 withTeam:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(FBKDraftingController *)self loadFormResponseFromContentItem:v6];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(FBKDraftingController *)self loadNewResponseForBugFormStub:v6 withTeam:v7];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [(FBKDraftingController *)self loadNewResponseForBugForm:v6 withTeam:v7];
      }
      else
      {
        objc_super v8 = Log_3();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
          -[FBKDraftingController loadResponseForFeedbackObject:withTeam:]();
        }
      }
    }
  }
}

- (void)loadResponseForFeedbackObject:(id)a3
{
}

- (void)loadFormResponseFromContentItem:(id)a3
{
}

- (void)_loadResponseWithFormResponse:(id)a3 item:(id)a4
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  [(FBKDraftingController *)self _resetInternalEntities];
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __60__FBKDraftingController__loadResponseWithFormResponse_item___block_invoke;
  aBlock[3] = &unk_264874E00;
  aBlock[4] = self;
  objc_super v8 = _Block_copy(aBlock);
  [(FBKDraftingController *)self setIsLoading:1];
  v9 = [(FBKDraftingController *)self delegate];
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    v11 = [(FBKDraftingController *)self delegate];
    [v11 draftingControllerDidBeginLoading:self];
  }
  if (v6)
  {
    v12 = [v6 ID];
    v13 = v6;
  }
  else
  {
    v12 = [v7 ID];
    v13 = v7;
  }
  v14 = [v13 formID];
  v15 = [v7 singleTeam];
  v16 = Log_3();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = [v12 intValue];
    int v18 = [v14 intValue];
    *(_DWORD *)buf = 67109376;
    int v29 = v17;
    __int16 v30 = 1024;
    int v31 = v18;
    _os_log_impl(&dword_22A36D000, v16, OS_LOG_TYPE_DEFAULT, "loading response for FR [%i] Form [%i]", buf, 0xEu);
  }

  v19 = [(FBKDraftingController *)self FBKData];
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __60__FBKDraftingController__loadResponseWithFormResponse_item___block_invoke_25;
  v23[3] = &unk_264874E50;
  v23[4] = self;
  id v24 = v12;
  id v25 = v7;
  id v26 = v8;
  id v20 = v8;
  id v21 = v7;
  id v22 = v12;
  [v19 refreshBugFormWithID:v14 fromStub:0 forTeam:v15 completion:v23];
}

void __60__FBKDraftingController__loadResponseWithFormResponse_item___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  [*(id *)(a1 + 32) setIsLoading:0];
  [*(id *)(a1 + 32) setIsDirty:1];
  v3 = [*(id *)(a1 + 32) delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    objc_super v5 = [*(id *)(a1 + 32) delegate];
    [v5 draftingControllerDidFinishLoading:*(void *)(a1 + 32) withError:v6];
  }
}

void __60__FBKDraftingController__loadResponseWithFormResponse_item___block_invoke_25(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) FBKData];
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __60__FBKDraftingController__loadResponseWithFormResponse_item___block_invoke_2;
  v6[3] = &unk_264874E28;
  id v5 = *(id *)(a1 + 56);
  v6[4] = *(void *)(a1 + 32);
  id v7 = v5;
  [v2 refreshFormResponseWithID:v3 contentItem:v4 completion:v6];
}

uint64_t __60__FBKDraftingController__loadResponseWithFormResponse_item___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    uint64_t v4 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
    return v4();
  }
  else
  {
    [*(id *)(a1 + 32) setFormResponse:a2];
    [*(id *)(a1 + 32) _initForFormResponse];
    id v6 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
    return v6();
  }
}

- (void)loadNewResponseForBugFormStub:(id)a3 requestPlugIns:(id)a4 appToken:(id)a5
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = Log_3();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = [v8 signatureDescription];
    int v13 = 138543618;
    v14 = v12;
    __int16 v15 = 2114;
    id v16 = v9;
    _os_log_impl(&dword_22A36D000, v11, OS_LOG_TYPE_DEFAULT, "Will start FormResponse with [%{public}@] requesting plugIns [%{public}@]", (uint8_t *)&v13, 0x16u);
  }
  [(FBKDraftingController *)self setFormStub:v8];
  [(FBKDraftingController *)self _loadNewResponseForBugForm:0 orBugFormStub:v8 withTeam:0 requestPlugIns:v9 appToken:v10];
}

- (void)loadNewResponseForBugFormStub:(id)a3 withTeam:(id)a4
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = Log_3();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [v6 signatureDescription];
    int v10 = 138543362;
    v11 = v9;
    _os_log_impl(&dword_22A36D000, v8, OS_LOG_TYPE_DEFAULT, "Will start FormResponse with [%{public}@]", (uint8_t *)&v10, 0xCu);
  }
  [(FBKDraftingController *)self setFormStub:v6];
  [(FBKDraftingController *)self setTeam:v7];
  [(FBKDraftingController *)self _loadNewResponseForBugForm:0 orBugFormStub:v6 withTeam:v7 requestPlugIns:0 appToken:0];
}

- (void)loadNewResponseForBugFormStub:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = Log_3();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 signatureDescription];
    int v7 = 138543362;
    id v8 = v6;
    _os_log_impl(&dword_22A36D000, v5, OS_LOG_TYPE_DEFAULT, "Will start FormResponse with [%{public}@]", (uint8_t *)&v7, 0xCu);
  }
  [(FBKDraftingController *)self setFormStub:v4];
  [(FBKDraftingController *)self _loadNewResponseForBugForm:0 orBugFormStub:v4 withTeam:0 requestPlugIns:0 appToken:0];
}

- (void)loadNewResponseForBugForm:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = Log_3();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 signatureDescription];
    int v7 = 138543362;
    id v8 = v6;
    _os_log_impl(&dword_22A36D000, v5, OS_LOG_TYPE_DEFAULT, "Will start FormResponse with [%{public}@]", (uint8_t *)&v7, 0xCu);
  }
  [(FBKDraftingController *)self _loadNewResponseForBugForm:v4 orBugFormStub:0 withTeam:0 requestPlugIns:0 appToken:0];
}

- (void)loadNewResponseForBugForm:(id)a3 withTeam:(id)a4
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = Log_3();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = [v6 signatureDescription];
    int v10 = 138543362;
    v11 = v9;
    _os_log_impl(&dword_22A36D000, v8, OS_LOG_TYPE_DEFAULT, "Will start FormResponse with [%{public}@]", (uint8_t *)&v10, 0xCu);
  }
  [(FBKDraftingController *)self _loadNewResponseForBugForm:v6 orBugFormStub:0 withTeam:v7 requestPlugIns:0 appToken:0];
}

- (void)_loadNewResponseForBugForm:(id)a3 orBugFormStub:(id)a4 withTeam:(id)a5 requestPlugIns:(id)a6 appToken:(id)a7
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  unint64_t v12 = (unint64_t)a3;
  unint64_t v13 = (unint64_t)a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (v12 | v13)
  {
    int v18 = +[FBKTimeIntervals sharedInstance];
    [v18 didStartEvent:1];

    [(FBKDraftingController *)self _resetInternalEntities];
    if (!v14)
    {
      v19 = Log_3();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446210;
        v28 = "-[FBKDraftingController _loadNewResponseForBugForm:orBugFormStub:withTeam:requestPlugIns:appToken:]";
        _os_log_impl(&dword_22A36D000, v19, OS_LOG_TYPE_DEFAULT, "nil team in [%{public}s] falling back to default team", buf, 0xCu);
      }

      id v20 = [(FBKDraftingController *)self FBKData];
      id v14 = [v20 defaultTeam];

      [(FBKDraftingController *)self setTeam:v14];
    }
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __99__FBKDraftingController__loadNewResponseForBugForm_orBugFormStub_withTeam_requestPlugIns_appToken___block_invoke;
    aBlock[3] = &unk_264874E78;
    aBlock[4] = self;
    id v21 = _Block_copy(aBlock);
    [(FBKDraftingController *)self setIsLoading:1];
    id v22 = [(FBKDraftingController *)self delegate];
    char v23 = objc_opt_respondsToSelector();

    if (v23)
    {
      id v24 = [(FBKDraftingController *)self delegate];
      [v24 draftingControllerDidBeginLoading:self];
    }
    if (v12)
    {
      id v25 = [(FBKDraftingController *)self FBKData];
      [v25 newFormResponseForBugForm:v12 inTeam:v14 completion:v21];
    }
    else
    {
      if (!v13)
      {
LABEL_16:

        goto LABEL_17;
      }
      id v25 = [(FBKDraftingController *)self FBKData];
      [v25 newFormResponseForBugFormStub:v13 inTeam:v14 requestPlugIns:v15 appToken:v16 completion:v21];
    }

    goto LABEL_16;
  }
  uint64_t v17 = Log_3();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
    -[FBKDraftingController _loadNewResponseForBugForm:orBugFormStub:withTeam:requestPlugIns:appToken:](v17);
  }

LABEL_17:
}

void __99__FBKDraftingController__loadNewResponseForBugForm_orBugFormStub_withTeam_requestPlugIns_appToken___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  [*(id *)(a1 + 32) setIsLoading:0];
  [*(id *)(a1 + 32) setIsDirty:0];
  if (!v5)
  {
    [*(id *)(a1 + 32) setFormResponse:v11];
    [*(id *)(a1 + 32) _initForFormResponse];
  }
  id v6 = [*(id *)(a1 + 32) delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = [*(id *)(a1 + 32) delegate];
    [v8 draftingControllerDidFinishLoading:*(void *)(a1 + 32) withError:v5];
  }
  uint64_t v9 = +[FBKTimeIntervals sharedInstance];
  id v10 = (id)[v9 didEndEvent:1];
}

- (void)_initForFormResponse
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(FBKDraftingController *)self formResponse];

  if (v3)
  {
    id v4 = Log_3();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      id v5 = [(FBKDraftingController *)self formResponse];
      id v6 = [v5 ID];
      int v14 = 134217984;
      uint64_t v15 = [v6 integerValue];
      _os_log_impl(&dword_22A36D000, v4, OS_LOG_TYPE_INFO, "FBKDraftingController _initForFormResponse: %ld", (uint8_t *)&v14, 0xCu);
    }
    char v7 = [MEMORY[0x263EFFA40] standardUserDefaults];
    self->_spamDebugLogs = [v7 BOOLForKey:@"FBKSpamDependencies"];

    id v8 = [FBKQuestionDependencyGraph alloc];
    uint64_t v9 = [(FBKDraftingController *)self formResponse];
    id v10 = [v9 bugForm];
    id v11 = [(FBKQuestionDependencyGraph *)v8 initWithBugForm:v10];
    [(FBKDraftingController *)self setDependencyGraph:v11];

    [(FBKDraftingController *)self runResolvers];
    [(FBKDraftingController *)self updateQuestionVisibility];
    unint64_t v12 = [MEMORY[0x263EFF9C0] set];
    [(FBKDraftingController *)self setQuestionIDsInErrorState:v12];

    id v13 = [(FBKDraftingController *)self newModelSnapshot];
    [(FBKDraftingController *)self setCurrentSnapshot:v13];
  }
}

- (BOOL)updateQuestionVisibility
{
  v2 = self;
  uint64_t v76 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(FBKDraftingController *)self formResponse];
  id v4 = [v3 bugForm];
  id v5 = [v4 questionGroups];
  uint64_t v6 = [v5 count];

  v54 = (void *)[objc_alloc(MEMORY[0x263EFF9C0]) initWithCapacity:v6];
  char v7 = [(FBKDraftingController *)v2 cachedVisibleQuestions];

  if (!v7)
  {
    id v8 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:v6];
    [(FBKDraftingController *)v2 setCachedVisibleQuestions:v8];
  }
  v55 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"sortOrder" ascending:1];
  uint64_t v9 = [(FBKDraftingController *)v2 formResponse];
  id v10 = [v9 bugForm];
  id v11 = [v10 questionWithRole:@":why_opt_out"];

  unint64_t v12 = [(FBKDraftingController *)v2 formResponse];
  id v13 = [v12 bugForm];
  int v14 = [v13 questionWithRole:@":required_file_zone"];

  v63 = v14;
  uint64_t v15 = [v14 questionGroup];
  uint64_t v16 = [v15 title];
  [(FBKDraftingController *)v2 setAttachmentsSectionTitleFromBugForm:v16];

  char v17 = 0;
  v61 = v2;
  while (1)
  {
    char v52 = v17;
    long long v70 = 0u;
    long long v71 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    int v18 = [(FBKDraftingController *)v2 formResponse];
    v19 = [v18 bugForm];
    id v20 = [v19 questionGroups];

    id obj = v20;
    uint64_t v57 = [v20 countByEnumeratingWithState:&v68 objects:v75 count:16];
    if (!v57) {
      break;
    }
    char v60 = 0;
    uint64_t v56 = *(void *)v69;
    do
    {
      uint64_t v21 = 0;
      do
      {
        if (*(void *)v69 != v56) {
          objc_enumerationMutation(obj);
        }
        id v22 = *(void **)(*((void *)&v68 + 1) + 8 * v21);
        char v23 = [(FBKDraftingController *)v2 cachedVisibleQuestions];
        id v24 = [v22 ID];
        uint64_t v25 = [v23 objectForKey:v24];

        v62 = (void *)v25;
        if (!v25)
        {
          id v26 = objc_alloc(MEMORY[0x263EFF980]);
          v27 = [v22 questions];
          v62 = objc_msgSend(v26, "initWithCapacity:", objc_msgSend(v27, "count"));
        }
        long long v66 = 0u;
        long long v67 = 0u;
        long long v64 = 0u;
        long long v65 = 0u;
        v58 = v22;
        v28 = [v22 questions];
        uint64_t v29 = [v28 countByEnumeratingWithState:&v64 objects:v74 count:16];
        uint64_t v59 = v21;
        if (v29)
        {
          uint64_t v30 = v29;
          uint64_t v31 = *(void *)v65;
          do
          {
            for (uint64_t i = 0; i != v30; ++i)
            {
              if (*(void *)v65 != v31) {
                objc_enumerationMutation(v28);
              }
              v33 = *(void **)(*((void *)&v64 + 1) + 8 * i);
              v34 = [v11 ID];
              v35 = [v33 ID];
              char v36 = [v34 isEqual:v35];

              if ((v36 & 1) == 0)
              {
                v37 = [v63 ID];
                v38 = [v33 ID];
                char v39 = [v37 isEqual:v38];

                if ((v39 & 1) == 0)
                {
                  int v40 = [v62 containsObject:v33];
                  v41 = [(FBKDraftingController *)v61 dependencyGraph];
                  v42 = [(FBKDraftingController *)v61 formResponse];
                  int v43 = [v41 visibilityForQuestion:v33 inFormResponse:v42];

                  if (v40 != v43)
                  {
                    if (v40)
                    {
                      v44 = [(FBKDraftingController *)v61 formResponse];
                      v45 = [v44 answerForQuestion:v33];

                      if (v45) {
                        [v45 setValue:MEMORY[0x263EFFA68]];
                      }
                      [v62 removeObject:v33];
                    }
                    else
                    {
                      [v62 addObject:v33];
                    }
                    char v60 = 1;
                  }
                }
              }
            }
            uint64_t v30 = [v28 countByEnumeratingWithState:&v64 objects:v74 count:16];
          }
          while (v30);
        }

        v73 = v55;
        v46 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v73 count:1];
        [v62 sortUsingDescriptors:v46];

        v2 = v61;
        v47 = [(FBKDraftingController *)v61 cachedVisibleQuestions];
        v48 = [v58 ID];
        [v47 setObject:v62 forKey:v48];

        if ([v62 count]) {
          [v54 addObject:v58];
        }
        else {
          [v54 removeObject:v58];
        }

        uint64_t v21 = v59 + 1;
      }
      while (v59 + 1 != v57);
      uint64_t v57 = [obj countByEnumeratingWithState:&v68 objects:v75 count:16];
    }
    while (v57);

    char v17 = 1;
    if ((v60 & 1) == 0) {
      goto LABEL_35;
    }
  }

LABEL_35:
  v72 = v55;
  v49 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v72 count:1];
  v50 = [v54 sortedArrayUsingDescriptors:v49];
  [(FBKDraftingController *)v2 setCachedVisibleGroups:v50];

  return v52 & 1;
}

- (id)newModelSnapshot
{
  uint64_t v3 = [FBKDraftModelSnapshot alloc];
  id v4 = [(FBKDraftingController *)self visibleQuestionGroups];
  id v5 = [(FBKDraftingController *)self cachedVisibleQuestions];
  uint64_t v6 = (void *)[v5 copy];
  char v7 = [(FBKDraftingController *)self diagnosticsController];
  id v8 = [(FBKDraftModelSnapshot *)v3 initWithQuestionGroups:v4 questions:v6 deviceDiagnostics:v7];

  return v8;
}

- (void)reevaluateDependenciesWithQuestionChanged:(id)a3 toAdd:(id)a4 toRemove:(id)a5
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v36 = a4;
  id v35 = a5;
  id v8 = [MEMORY[0x263EFFA08] setWithObject:a3];
  uint64_t v9 = 1;
  *(void *)&long long v10 = 138543362;
  long long v34 = v10;
  do
  {
    v38 = objc_msgSend(MEMORY[0x263EFF9C0], "set", v34);
    if (self->_spamDebugLogs)
    {
      id v11 = Log_3();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v12 = [v8 valueForKey:@"role"];
        *(_DWORD *)buf = v34;
        v46 = v12;
        _os_log_impl(&dword_22A36D000, v11, OS_LOG_TYPE_DEFAULT, "Processing: %{public}@", buf, 0xCu);
      }
    }
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id obj = v8;
    uint64_t v13 = [obj countByEnumeratingWithState:&v40 objects:v44 count:16];
    if (!v13)
    {
      uint64_t v33 = v9;
      goto LABEL_33;
    }
    uint64_t v14 = v13;
    uint64_t v39 = *(void *)v41;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v41 != v39) {
          objc_enumerationMutation(obj);
        }
        uint64_t v16 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        char v17 = [(FBKDraftingController *)self dependencyGraph];
        int v18 = [(FBKDraftingController *)self formResponse];
        int v19 = [v17 visibilityForQuestion:v16 inFormResponse:v18];

        id v20 = [(FBKDraftingController *)self cachedVisibleQuestions];
        uint64_t v21 = [v16 questionGroup];
        id v22 = [v21 ID];
        char v23 = [v20 objectForKey:v22];

        if (!v23)
        {
          if (v19)
          {
LABEL_22:
            if (self->_spamDebugLogs)
            {
              uint64_t v29 = Log_3();
              if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v30 = [v16 role];
                *(_DWORD *)buf = 138412290;
                v46 = v30;
                _os_log_impl(&dword_22A36D000, v29, OS_LOG_TYPE_DEFAULT, "Conditionals will add: %@", buf, 0xCu);
              }
            }
            [v36 addObject:v16];
          }
LABEL_27:
          if ((v9 & 1) == 0) {
            goto LABEL_29;
          }
          goto LABEL_28;
        }
        int v24 = [v23 containsObject:v16];
        if (v19 == v24) {
          goto LABEL_27;
        }
        if (!v24) {
          goto LABEL_22;
        }
        uint64_t v25 = [(FBKDraftingController *)self formResponse];
        id v26 = [v25 answerForQuestion:v16];

        if (v26) {
          [v26 setValue:MEMORY[0x263EFFA68]];
        }
        if (self->_spamDebugLogs)
        {
          v27 = Log_3();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            v28 = [v16 role];
            *(_DWORD *)buf = 138412290;
            v46 = v28;
            _os_log_impl(&dword_22A36D000, v27, OS_LOG_TYPE_DEFAULT, "Conditionals will remove: %@", buf, 0xCu);
          }
        }
        [v35 addObject:v16];

LABEL_28:
        uint64_t v31 = [(FBKDraftingController *)self dependencyGraph];
        uint64_t v32 = [v31 questionsDependentOnQuestion:v16];

        [v38 unionSet:v32];
LABEL_29:

        LOBYTE(v9) = 0;
      }
      uint64_t v14 = [obj countByEnumeratingWithState:&v40 objects:v44 count:16];
      LOBYTE(v9) = 0;
      uint64_t v33 = 0;
    }
    while (v14);
LABEL_33:

    id v8 = (void *)[v38 copy];
    uint64_t v9 = v33;
  }
  while ([v8 count]);
}

- (void)updateVisibilityForChangedQuestion:(id)a3
{
  uint64_t v85 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v61 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"sortOrder" ascending:1];
  uint64_t v5 = [MEMORY[0x263EFF9C0] set];
  [MEMORY[0x263EFF9C0] set];
  v58 = (void *)v5;
  uint64_t v57 = v59 = v4;
  -[FBKDraftingController reevaluateDependenciesWithQuestionChanged:toAdd:toRemove:](self, "reevaluateDependenciesWithQuestionChanged:toAdd:toRemove:", v4, v5);
  id v6 = objc_alloc(MEMORY[0x263EFF9C0]);
  char v7 = [(FBKDraftingController *)self cachedVisibleGroups];
  id v8 = (void *)[v6 initWithArray:v7];

  char v60 = [MEMORY[0x263EFF9C0] set];
  id v9 = objc_alloc(MEMORY[0x263EFF9A0]);
  long long v10 = [(FBKDraftingController *)self cachedVisibleQuestions];
  id v11 = objc_msgSend(v9, "initWithCapacity:", objc_msgSend(v10, "count"));

  long long v77 = 0u;
  long long v78 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  v62 = self;
  unint64_t v12 = [(FBKDraftingController *)self cachedVisibleQuestions];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v75 objects:v84 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v76;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v76 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void *)(*((void *)&v75 + 1) + 8 * i);
        int v18 = [(FBKDraftingController *)v62 cachedVisibleQuestions];
        int v19 = [v18 objectForKeyedSubscript:v17];
        id v20 = (void *)[v19 mutableCopy];
        [v11 setObject:v20 forKeyedSubscript:v17];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v75 objects:v84 count:16];
    }
    while (v14);
  }

  long long v73 = 0u;
  long long v74 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  id v21 = v57;
  uint64_t v22 = [v21 countByEnumeratingWithState:&v71 objects:v83 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v72;
    do
    {
      for (uint64_t j = 0; j != v23; ++j)
      {
        if (*(void *)v72 != v24) {
          objc_enumerationMutation(v21);
        }
        id v26 = *(void **)(*((void *)&v71 + 1) + 8 * j);
        v27 = [v26 questionGroup];
        v28 = [v27 ID];
        uint64_t v29 = [v11 objectForKey:v28];

        [v29 removeObject:v26];
        if (![v29 count])
        {
          uint64_t v30 = [v26 questionGroup];
          [v8 removeObject:v30];

          uint64_t v31 = [v26 questionGroup];
          uint64_t v32 = [v31 ID];
          [v11 removeObjectForKey:v32];
        }
      }
      uint64_t v23 = [v21 countByEnumeratingWithState:&v71 objects:v83 count:16];
    }
    while (v23);
  }

  long long v69 = 0u;
  long long v70 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  id v33 = v58;
  uint64_t v34 = [v33 countByEnumeratingWithState:&v67 objects:v82 count:16];
  if (v34)
  {
    uint64_t v35 = v34;
    uint64_t v36 = *(void *)v68;
    do
    {
      for (uint64_t k = 0; k != v35; ++k)
      {
        if (*(void *)v68 != v36) {
          objc_enumerationMutation(v33);
        }
        v38 = *(void **)(*((void *)&v67 + 1) + 8 * k);
        uint64_t v39 = [v38 questionGroup];
        long long v40 = [v39 ID];
        long long v41 = [v11 objectForKey:v40];

        if (!v41)
        {
          long long v41 = [MEMORY[0x263EFF980] array];
          long long v42 = [v38 questionGroup];
          long long v43 = [v42 ID];
          [v11 setObject:v41 forKey:v43];
        }
        v44 = [v38 questionGroup];
        v45 = [v8 member:v44];

        if (!v45)
        {
          v46 = [v38 questionGroup];
          [v8 addObject:v46];

          uint64_t v47 = [v38 questionGroup];
          [v60 addObject:v47];
        }
        [v41 addObject:v38];
      }
      uint64_t v35 = [v33 countByEnumeratingWithState:&v67 objects:v82 count:16];
    }
    while (v35);
  }

  long long v65 = 0u;
  long long v66 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  v48 = [v11 allKeys];
  uint64_t v49 = [v48 countByEnumeratingWithState:&v63 objects:v81 count:16];
  if (v49)
  {
    uint64_t v50 = v49;
    uint64_t v51 = *(void *)v64;
    do
    {
      for (uint64_t m = 0; m != v50; ++m)
      {
        if (*(void *)v64 != v51) {
          objc_enumerationMutation(v48);
        }
        v53 = [v11 objectForKeyedSubscript:*(void *)(*((void *)&v63 + 1) + 8 * m)];
        v80 = v61;
        v54 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v80 count:1];
        [v53 sortUsingDescriptors:v54];
      }
      uint64_t v50 = [v48 countByEnumeratingWithState:&v63 objects:v81 count:16];
    }
    while (v50);
  }

  v79 = v61;
  v55 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v79 count:1];
  uint64_t v56 = [v8 sortedArrayUsingDescriptors:v55];
  [(FBKDraftingController *)v62 setCachedVisibleGroups:v56];

  [(FBKDraftingController *)v62 setCachedVisibleQuestions:v11];
}

- (void)_resetInternalEntities
{
  formResponse = self->_formResponse;
  self->_formResponse = 0;

  [(FBKDraftingController *)self setCurrentSnapshot:0];
  [(FBKDraftingController *)self setDiagnosticsController:0];
  [(FBKDraftingController *)self setCachedVisibleGroups:0];
  [(FBKDraftingController *)self setCachedVisibleQuestions:0];
  [(FBKDraftingController *)self setQuestionIDsInErrorState:0];
  [(FBKDraftingController *)self setIsDirty:0];
  [(FBKDraftingController *)self setIsLoading:0];
  uint64_t v4 = [(FBKDraftingController *)self delegate];
  if (v4)
  {
    uint64_t v5 = (void *)v4;
    id v6 = [(FBKDraftingController *)self delegate];
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      id v8 = [(FBKDraftingController *)self delegate];
      [v8 questionVisibilityDidUpdateForDraftingController:self];
    }
  }
}

- (BOOL)isQuestionVisible:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 ID];
  uint64_t v6 = [v5 unsignedIntegerValue];

  char v7 = [(FBKDraftingController *)self cachedVisibleQuestions];
  id v8 = [v4 questionGroup];
  id v9 = [v8 ID];
  long long v10 = [v7 objectForKeyedSubscript:v9];

  if (v10)
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v11 = v10;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v21;
      while (2)
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v21 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * i), "ID", (void)v20);
          uint64_t v17 = [v16 unsignedIntegerValue];

          if (v17 == v6)
          {
            BOOL v18 = 1;
            goto LABEL_15;
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
        if (v13) {
          continue;
        }
        break;
      }
    }
  }
  else
  {
    id v11 = Log_3();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      -[FBKDraftingController isQuestionVisible:](v4, v11);
    }
  }
  BOOL v18 = 0;
LABEL_15:

  return v18;
}

- (id)visibleQuestionGroups
{
  v2 = [(FBKDraftingController *)self cachedVisibleGroups];
  uint64_t v3 = v2;
  if (!v2) {
    v2 = (void *)MEMORY[0x263EFFA68];
  }
  id v4 = v2;

  return v4;
}

- (id)visibleQuestionsForGroup:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(FBKDraftingController *)self cachedVisibleQuestions];

  id v6 = (id)MEMORY[0x263EFFA68];
  if (v5)
  {
    char v7 = [(FBKDraftingController *)self cachedVisibleQuestions];
    id v8 = [v4 ID];
    uint64_t v9 = [v7 objectForKey:v8];
    long long v10 = (void *)v9;
    if (v9) {
      id v11 = (void *)v9;
    }
    else {
      id v11 = v6;
    }
    id v6 = v11;
  }

  return v6;
}

- (id)indexPathForQuestion:(id)a3
{
  v15[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(FBKDraftingController *)self cachedVisibleGroups];
  id v6 = [v4 questionGroup];
  uint64_t v7 = [v5 indexOfObject:v6];

  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v8 = 0;
  }
  else
  {
    uint64_t v9 = [(FBKDraftingController *)self cachedVisibleQuestions];
    long long v10 = [v4 questionGroup];
    id v11 = [v10 ID];
    uint64_t v12 = [v9 objectForKey:v11];

    if (v12 && (uint64_t v13 = [v12 indexOfObject:v4], v13 != 0x7FFFFFFFFFFFFFFFLL))
    {
      v15[0] = v7;
      v15[1] = v13;
      id v8 = [MEMORY[0x263F088C8] indexPathWithIndexes:v15 length:2];
    }
    else
    {
      id v8 = 0;
    }
  }

  return v8;
}

- (NSArray)allVisibleAnswers
{
  uint64_t v3 = [(FBKDraftingController *)self currentSnapshot];
  id v4 = [v3 allQuestions];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __42__FBKDraftingController_allVisibleAnswers__block_invoke;
  v7[3] = &unk_264874EA0;
  v7[4] = self;
  uint64_t v5 = objc_msgSend(v4, "ded_mapWithBlock:", v7);

  return (NSArray *)v5;
}

id __42__FBKDraftingController_allVisibleAnswers__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 formResponse];
  uint64_t v5 = [v4 answerForQuestion:v3];

  id v6 = [v5 question];

  if (!v6)
  {
    uint64_t v7 = +[FBKLog appHandle];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      __42__FBKDraftingController_allVisibleAnswers__block_invoke_cold_1(v5, v7);
    }
  }

  return v5;
}

- (void)setResponse:(id)a3 forQuestion:(id)a4
{
  id v11 = a4;
  id v6 = a3;
  uint64_t v7 = [(FBKDraftingController *)self formResponse];
  id v8 = [v7 answerForQuestion:v11];

  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  long long v10 = (void *)[v6 copy];

  if (isKindOfClass) {
    [v8 setValues:v10];
  }
  else {
    [v8 setValue:v10];
  }

  [(FBKDraftingController *)self didChangeAnswerToQuestion:v11];
}

- (void)didChangeAnswerToQuestion:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = +[FBKLog appHandle];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = [v4 role];
    uint64_t v7 = [(FBKDraftingController *)self formResponse];
    id v8 = [v7 answerForQuestion:v4];
    uint64_t v9 = [v8 values];
    long long v10 = [v9 componentsJoinedByString:@","];
    int v12 = 138543619;
    uint64_t v13 = v6;
    __int16 v14 = 2113;
    uint64_t v15 = v10;
    _os_log_impl(&dword_22A36D000, v5, OS_LOG_TYPE_INFO, "didChangeAnswerToQuestion Q: [%{public}@] A: [%{private}@]", (uint8_t *)&v12, 0x16u);
  }
  if ([(FBKDraftingController *)self isLoading])
  {
    id v11 = Log_3();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[FBKDraftingController didChangeAnswerToQuestion:](v4, v11);
    }
  }
  else
  {
    [(FBKDraftingController *)self setIsDirty:1];
    [(FBKDraftingController *)self updateVisibilityForChangedQuestion:v4];
    [(FBKDraftingController *)self sendSnapshotUpdate];
  }
}

- (void)sendSnapshotUpdate
{
  id v11 = [(FBKDraftingController *)self currentSnapshot];
  id v3 = [(FBKDraftingController *)self newModelSnapshot];
  [(FBKDraftingController *)self setCurrentSnapshot:v3];
  uint64_t v4 = [(FBKDraftingController *)self delegate];
  if (v4)
  {
    uint64_t v5 = (void *)v4;
    id v6 = [(FBKDraftingController *)self delegate];
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      id v8 = [[FBKDraftModelSnapshotDiff alloc] initWithPreviousSnapshot:v11 newSnapshot:v3];
      uint64_t v9 = [(FBKDraftingController *)self delegate];
      [v9 draftingController:self madeVisibilityUpdatesWithSnapshotDiff:v8];
    }
  }
  long long v10 = [(FBKDraftingController *)self diagnosticsController];
  [v10 reevaluateMatcherPredicates];
}

- (void)attachAnswersToQuestionsWithGivenData:(id)a3
{
  id v4 = a3;
  uint64_t v5 = Log_3();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[FBKDraftingController attachAnswersToQuestionsWithGivenData:]();
  }

  _answerQuestions(self, v4, 0, 1);
}

- (void)setCurrentSnapshot:(id)a3
{
  id v8 = a3;
  objc_storeStrong((id *)&self->_currentSnapshot, a3);
  uint64_t v5 = [(FBKDraftingController *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    char v7 = [(FBKDraftingController *)self delegate];
    [v7 draftingController:self didChangeSnapshot:v8];
  }
}

- (void)runResolvers
{
  uint64_t v65 = *MEMORY[0x263EF8340];
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  id v3 = [(FBKDraftingController *)self formResponse];
  id v4 = [v3 bugForm];
  uint64_t v5 = [v4 questionGroups];

  id obj = v5;
  uint64_t v45 = [v5 countByEnumeratingWithState:&v57 objects:v64 count:16];
  if (v45)
  {
    uint64_t v44 = *(void *)v58;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v58 != v44) {
          objc_enumerationMutation(obj);
        }
        uint64_t v46 = v6;
        char v7 = *(void **)(*((void *)&v57 + 1) + 8 * v6);
        long long v53 = 0u;
        long long v54 = 0u;
        long long v55 = 0u;
        long long v56 = 0u;
        id v48 = [v7 questions];
        uint64_t v8 = [v48 countByEnumeratingWithState:&v53 objects:v63 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v54;
          do
          {
            for (uint64_t i = 0; i != v9; ++i)
            {
              if (*(void *)v54 != v10) {
                objc_enumerationMutation(v48);
              }
              int v12 = *(void **)(*((void *)&v53 + 1) + 8 * i);
              uint64_t v13 = [v12 userAgentPopulate];
              if (v13)
              {
                __int16 v14 = (void *)v13;
                uint64_t v15 = +[FBKResolver resolverForQuestion:v12];

                if (v15)
                {
                  uint64_t v16 = Log_3();
                  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
                  {
                    uint64_t v17 = [v12 userAgentPopulate];
                    BOOL v18 = [v12 role];
                    *(_DWORD *)buf = 138412546;
                    *(void *)v62 = v17;
                    *(_WORD *)&v62[8] = 2112;
                    *(void *)&v62[10] = v18;
                    _os_log_impl(&dword_22A36D000, v16, OS_LOG_TYPE_INFO, "evaluating question resolver [%@] for question [%@]", buf, 0x16u);
                  }
                  int v19 = [(FBKDraftingController *)self formResponse];
                  long long v20 = [v19 answerForQuestion:v12];

                  long long v21 = [(FBKDraftingController *)self dependencyGraph];
                  long long v22 = [(FBKDraftingController *)self formResponse];
                  int v23 = [v21 visibilityForQuestion:v12 inFormResponse:v22];

                  if ((![v12 visible] || v23) && (objc_msgSend(v20, "resolved") & 1) == 0)
                  {
                    uint64_t v24 = Log_3();
                    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
                    {
                      uint64_t v47 = [v12 ID];
                      int v41 = [v47 intValue];
                      long long v42 = [v12 text];
                      *(_DWORD *)buf = 67109378;
                      *(_DWORD *)v62 = v41;
                      *(_WORD *)&v62[4] = 2114;
                      *(void *)&v62[6] = v42;
                      _os_log_debug_impl(&dword_22A36D000, v24, OS_LOG_TYPE_DEBUG, "Resolving question %d:%{public}@", buf, 0x12u);
                    }
                    uint64_t v25 = [v15 run];
                    id v26 = [(FBKDraftingController *)self formResponse];
                    v27 = [v26 answerForQuestion:v12];

                    [v27 setValue:v25];
                    [v27 setResolved:1];
                  }
                }
              }
              v28 = [v12 choiceSetClientSideResolver];

              if (v28)
              {
                uint64_t v29 = [v12 choiceSetClientSideResolver];
                uint64_t v30 = [v12 serverSideChoices];
                uint64_t v31 = [(FBKDraftingController *)self choiceSetResolverWithValue:v29 givenChoices:v30];

                [v12 setChoiceSetResolver:v31];
                uint64_t v32 = [v12 choiceSetClientSideResolver];
                id v33 = [v12 role];
                uint64_t v34 = Log_3();
                if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
                {
                  uint64_t v35 = [v12 choiceSetClientSideResolver];
                  uint64_t v36 = [v12 role];
                  *(_DWORD *)buf = 138412546;
                  *(void *)v62 = v35;
                  *(_WORD *)&v62[8] = 2112;
                  *(void *)&v62[10] = v36;
                  _os_log_impl(&dword_22A36D000, v34, OS_LOG_TYPE_INFO, "dispatching question set resolver [%@] for question [%@]", buf, 0x16u);
                }
                v37 = dispatch_get_global_queue(25, 0);
                block[0] = MEMORY[0x263EF8330];
                block[1] = 3221225472;
                block[2] = __37__FBKDraftingController_runResolvers__block_invoke;
                block[3] = &unk_264874EC8;
                id v50 = v32;
                id v51 = v33;
                id v52 = v31;
                id v38 = v31;
                id v39 = v33;
                id v40 = v32;
                dispatch_async(v37, block);
              }
            }
            uint64_t v9 = [v48 countByEnumeratingWithState:&v53 objects:v63 count:16];
          }
          while (v9);
        }

        uint64_t v6 = v46 + 1;
      }
      while (v46 + 1 != v45);
      uint64_t v45 = [obj countByEnumeratingWithState:&v57 objects:v64 count:16];
    }
    while (v45);
  }
}

uint64_t __37__FBKDraftingController_runResolvers__block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v2 = Log_3();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v6 = 138412546;
    uint64_t v7 = v3;
    __int16 v8 = 2112;
    uint64_t v9 = v4;
    _os_log_impl(&dword_22A36D000, v2, OS_LOG_TYPE_INFO, "evaluating choice set resolver [%@] for question [%@] in background", (uint8_t *)&v6, 0x16u);
  }

  return [*(id *)(a1 + 48) prefetchChoices];
}

- (id)choiceSetResolverWithValue:(id)a3 givenChoices:(id)a4
{
  id v5 = a4;
  if ([a3 hasPrefix:@"appTitlesBundles"]) {
    int v6 = [[FBKAppListResolver alloc] initWithServerSideChoices:v5];
  }
  else {
    int v6 = 0;
  }

  return v6;
}

- (id)firstVisibleInvalidQuestion
{
  v2 = self;
  uint64_t v70 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(FBKDraftingController *)self invalidQuestionIDs];
  uint64_t v4 = (void *)[v3 copy];

  id v5 = [MEMORY[0x263EFF980] arrayWithCapacity:10];
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  int v6 = [(FBKDraftingController *)v2 cachedVisibleGroups];
  uint64_t v52 = [v6 countByEnumeratingWithState:&v63 objects:v69 count:16];
  if (v52)
  {
    uint64_t v50 = *(void *)v64;
    uint64_t v45 = v6;
    id obj = v2;
    do
    {
      for (uint64_t i = 0; i != v52; ++i)
      {
        if (*(void *)v64 != v50) {
          objc_enumerationMutation(v6);
        }
        __int16 v8 = *(void **)(*((void *)&v63 + 1) + 8 * i);
        uint64_t v9 = [v8 questions];
        if (v9)
        {
          uint64_t v10 = (void *)v9;
          id v11 = [v8 questions];
          uint64_t v12 = [v11 count];

          if (v12)
          {
            uint64_t v13 = [(FBKDraftingController *)v2 cachedVisibleQuestions];
            __int16 v14 = [v8 ID];
            uint64_t v15 = [v13 objectForKeyedSubscript:v14];

            if (v15 && [v15 count])
            {
              long long v61 = 0u;
              long long v62 = 0u;
              long long v59 = 0u;
              long long v60 = 0u;
              id v48 = v15;
              id v16 = v15;
              uint64_t v17 = [v16 countByEnumeratingWithState:&v59 objects:v68 count:16];
              if (v17)
              {
                uint64_t v18 = v17;
                uint64_t v19 = *(void *)v60;
                do
                {
                  for (uint64_t j = 0; j != v18; ++j)
                  {
                    if (*(void *)v60 != v19) {
                      objc_enumerationMutation(v16);
                    }
                    long long v21 = *(void **)(*((void *)&v59 + 1) + 8 * j);
                    long long v22 = [v21 ID];
                    int v23 = [v4 containsObject:v22];

                    if (v23) {
                      [v5 addObject:v21];
                    }
                  }
                  uint64_t v18 = [v16 countByEnumeratingWithState:&v59 objects:v68 count:16];
                }
                while (v18);
              }

              int v6 = v45;
              v2 = obj;
              uint64_t v15 = v48;
            }
          }
        }
      }
      uint64_t v52 = [v6 countByEnumeratingWithState:&v63 objects:v69 count:16];
    }
    while (v52);
  }

  if (![v5 count])
  {
    uint64_t v24 = 0;
    goto LABEL_40;
  }
  if ([v5 count] == 1)
  {
    uint64_t v24 = [v5 firstObject];
    goto LABEL_40;
  }
  uint64_t v24 = [v5 lastObject];
  [v5 removeLastObject];
  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  id obja = v5;
  uint64_t v51 = [obja countByEnumeratingWithState:&v55 objects:v67 count:16];
  if (!v51) {
    goto LABEL_39;
  }
  uint64_t v49 = *(void *)v56;
  do
  {
    for (uint64_t k = 0; k != v51; ++k)
    {
      if (*(void *)v56 != v49) {
        objc_enumerationMutation(obja);
      }
      id v26 = *(void **)(*((void *)&v55 + 1) + 8 * k);
      v27 = [v26 questionGroup];
      v28 = [v27 sortOrder];
      int v53 = [v28 intValue];
      [v24 questionGroup];
      v30 = uint64_t v29 = v24;
      uint64_t v31 = [v30 sortOrder];
      int v32 = [v31 intValue];

      uint64_t v24 = v29;
      if (v53 < v32) {
        goto LABEL_36;
      }
      id v33 = [v26 questionGroup];
      uint64_t v34 = [v33 sortOrder];
      int v35 = [v34 intValue];
      uint64_t v36 = [v29 questionGroup];
      v37 = [v36 sortOrder];
      long long v54 = v24;
      int v38 = [v37 intValue];

      if (v35 > v38)
      {
        uint64_t v24 = v54;
        continue;
      }
      id v39 = [v26 sortOrder];
      int v40 = [v39 intValue];
      uint64_t v24 = v54;
      int v41 = [v54 sortOrder];
      int v42 = [v41 intValue];

      if (v40 < v42)
      {
LABEL_36:
        id v43 = v26;

        uint64_t v24 = v43;
      }
    }
    uint64_t v51 = [obja countByEnumeratingWithState:&v55 objects:v67 count:16];
  }
  while (v51);
LABEL_39:

LABEL_40:

  return v24;
}

- (BOOL)answer:(id)a3 isValidForQuestion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 isRequired])
  {
    __int16 v8 = [(FBKDraftingController *)self dependencyGraph];
    uint64_t v9 = [v6 formResponse];
    if ([v8 visibilityForQuestion:v7 inFormResponse:v9])
    {
      uint64_t v10 = [v6 value];
      BOOL v11 = !_FBKAnswerIsBlank(v10);
    }
    else
    {
      LOBYTE(v11) = 1;
    }
  }
  else
  {
    LOBYTE(v11) = 1;
  }

  return v11;
}

- (BOOL)validate:(id *)a3
{
  uint64_t v74 = *MEMORY[0x263EF8340];
  uint64_t v44 = +[FBKTimeIntervals sharedInstance];
  [v44 didStartEvent:2];
  uint64_t v52 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:20];
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  uint64_t v4 = [(FBKDraftingController *)self cachedVisibleQuestions];
  id v5 = [v4 allValues];

  id obj = v5;
  uint64_t v50 = [v5 countByEnumeratingWithState:&v65 objects:v73 count:16];
  if (v50)
  {
    uint64_t v48 = *(void *)v66;
    do
    {
      for (uint64_t i = 0; i != v50; ++i)
      {
        if (*(void *)v66 != v48) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v65 + 1) + 8 * i);
        long long v61 = 0u;
        long long v62 = 0u;
        long long v63 = 0u;
        long long v64 = 0u;
        id v8 = v7;
        uint64_t v9 = [v8 countByEnumeratingWithState:&v61 objects:v72 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v62;
          do
          {
            for (uint64_t j = 0; j != v10; ++j)
            {
              if (*(void *)v62 != v11) {
                objc_enumerationMutation(v8);
              }
              uint64_t v13 = *(void **)(*((void *)&v61 + 1) + 8 * j);
              __int16 v14 = [(FBKDraftingController *)self formResponse];
              uint64_t v15 = [v14 answerForQuestion:v13];

              if (v15)
              {
                id v16 = [v13 ID];
                [v52 setObject:v15 forKey:v16];
              }
              else
              {
                id v16 = Log_3();
                if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
                  -[FBKDraftingController validate:]((uint64_t)v71, (uint64_t)v13);
                }
              }
            }
            uint64_t v10 = [v8 countByEnumeratingWithState:&v61 objects:v72 count:16];
          }
          while (v10);
        }
      }
      uint64_t v50 = [obj countByEnumeratingWithState:&v65 objects:v73 count:16];
    }
    while (v50);
  }

  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  uint64_t v17 = [(FBKDraftingController *)self formResponse];
  uint64_t v18 = [v17 bugForm];
  uint64_t v19 = [v18 questionGroups];

  id v45 = v19;
  uint64_t v49 = [v19 countByEnumeratingWithState:&v57 objects:v70 count:16];
  if (v49)
  {
    id obja = *(id *)v58;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(id *)v58 != obja) {
          objc_enumerationMutation(v45);
        }
        uint64_t v51 = v20;
        long long v21 = *(void **)(*((void *)&v57 + 1) + 8 * v20);
        long long v53 = 0u;
        long long v54 = 0u;
        long long v55 = 0u;
        long long v56 = 0u;
        long long v22 = [v21 questions];
        uint64_t v23 = [v22 countByEnumeratingWithState:&v53 objects:v69 count:16];
        if (v23)
        {
          uint64_t v24 = v23;
          uint64_t v25 = *(void *)v54;
          do
          {
            for (uint64_t k = 0; k != v24; ++k)
            {
              if (*(void *)v54 != v25) {
                objc_enumerationMutation(v22);
              }
              v27 = *(void **)(*((void *)&v53 + 1) + 8 * k);
              if ([v27 answerType] != 5 && objc_msgSend(v27, "answerType") != 11)
              {
                v28 = [v27 ID];
                uint64_t v29 = [v52 objectForKey:v28];

                BOOL v30 = [(FBKDraftingController *)self answer:v29 isValidForQuestion:v27];
                uint64_t v31 = [(FBKDraftingController *)self questionIDsInErrorState];
                int v32 = [v27 ID];
                if (v30) {
                  [v31 removeObject:v32];
                }
                else {
                  [v31 addObject:v32];
                }
              }
            }
            uint64_t v24 = [v22 countByEnumeratingWithState:&v53 objects:v69 count:16];
          }
          while (v24);
        }

        uint64_t v20 = v51 + 1;
      }
      while (v51 + 1 != v49);
      uint64_t v49 = [v45 countByEnumeratingWithState:&v57 objects:v70 count:16];
    }
    while (v49);
  }

  id v33 = [(FBKDraftingController *)self questionIDsInErrorState];
  uint64_t v34 = [v33 count];

  if (v34)
  {
    if (a3)
    {
      int v35 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:3];
      uint64_t v36 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v37 = [v36 localizedStringForKey:@"MISSING_ANSWERS_TITLE" value:&stru_26DDF6A30 table:@"CommonStrings"];
      [v35 setObject:v37 forKeyedSubscript:*MEMORY[0x263F08320]];

      int v38 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      id v39 = [v38 localizedStringForKey:@"MISSING_ANSWERS_MESSAGE" value:&stru_26DDF6A30 table:@"CommonStrings"];
      [v35 setObject:v39 forKeyedSubscript:*MEMORY[0x263F08348]];

      *a3 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F3C620] code:-4 userInfo:v35];
    }
    int v40 = Log_3();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG)) {
      -[FBKDraftingController validate:](self, v40);
    }
  }
  id v41 = (id)[v44 didEndEvent:2];

  return v34 == 0;
}

- (void)preemptivelyRemoveQuestionFromErrorStateWithQuestion:(id)a3
{
  id v4 = a3;
  id v6 = [(FBKDraftingController *)self questionIDsInErrorState];
  id v5 = [v4 ID];

  [v6 removeObject:v5];
}

- (id)invalidQuestionIDs
{
  v2 = [(FBKDraftingController *)self questionIDsInErrorState];
  uint64_t v3 = (void *)[v2 copy];

  return v3;
}

- (NSArray)unansweredRequiredModalQuestions
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:4];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id obj = [(FBKDraftingController *)self visibleQuestionGroups];
  uint64_t v4 = [obj countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(obj);
        }
        id v8 = [(FBKDraftingController *)self visibleQuestionsForGroup:*(void *)(*((void *)&v14 + 1) + 8 * i)];
        v13[0] = MEMORY[0x263EF8330];
        v13[1] = 3221225472;
        v13[2] = __57__FBKDraftingController_unansweredRequiredModalQuestions__block_invoke;
        v13[3] = &unk_264874EF0;
        v13[4] = self;
        uint64_t v9 = objc_msgSend(v8, "ded_selectItemsPassingTest:", v13);
        [v3 addObjectsFromArray:v9];
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v5);
  }

  uint64_t v10 = [MEMORY[0x263EFF8C0] arrayWithArray:v3];

  return (NSArray *)v10;
}

uint64_t __57__FBKDraftingController_unansweredRequiredModalQuestions__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 answerType] == 11)
  {
    uint64_t v4 = [*(id *)(a1 + 32) formResponse];
    uint64_t v5 = [v4 answerForQuestion:v3];

    uint64_t v6 = [*(id *)(a1 + 32) answer:v5 isValidForQuestion:v3] ^ 1;
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (id)questionsForSectionIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(FBKDraftingController *)self cachedDiffableSections];
  uint64_t v6 = [v5 objectForKeyedSubscript:v4];

  id v7 = [v6 visibleQuestions];

  return v7;
}

- (id)generateSnapshotIdentifiers:(BOOL)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  uint64_t v25 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:5];
  id v4 = objc_alloc(MEMORY[0x263EFF980]);
  uint64_t v5 = [(FBKDraftingController *)self visibleQuestionGroups];
  uint64_t v24 = objc_msgSend(v4, "initWithCapacity:", objc_msgSend(v5, "count"));

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = [(FBKDraftingController *)self visibleQuestionGroups];
  uint64_t v6 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v26 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v29 != v26) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        uint64_t v10 = [(FBKDraftingController *)self visibleQuestionsForGroup:v9];
        v27[0] = MEMORY[0x263EF8330];
        v27[1] = 3221225472;
        v27[2] = __53__FBKDraftingController_generateSnapshotIdentifiers___block_invoke;
        v27[3] = &unk_264874EF0;
        v27[4] = self;
        uint64_t v11 = objc_msgSend(v10, "ded_selectItemsPassingTest:", v27);

        if ([v11 count])
        {
          uint64_t v12 = [_TtC12FeedbackCore31FBKQuestionGroupDiffableSection alloc];
          uint64_t v13 = [(FBKDraftingController *)self formResponse];
          long long v14 = [(FBKDraftingController *)self delegate];
          if (v14) {
            BOOL v15 = [(FBKDraftingController *)self useInlineChoices];
          }
          else {
            BOOL v15 = 0;
          }
          if (a3)
          {
            uint64_t v16 = [(FBKDraftingController *)self invalidQuestionIDs];
          }
          else
          {
            uint64_t v16 = objc_opt_new();
          }
          long long v17 = (void *)v16;
          uint64_t v18 = [(FBKQuestionGroupDiffableSection *)v12 initWithQuestionGroup:v9 visibleQuestions:v11 formResponse:v13 useInlineChoices:v15 questionIDsInErrorState:v16];

          uint64_t v19 = [v9 title];
          [v25 setObject:v18 forKeyedSubscript:v19];

          [v24 addObject:v18];
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v7);
  }

  [(FBKDraftingController *)self setCachedDiffableSections:v25];
  uint64_t v20 = [MEMORY[0x263EFF8C0] arrayWithArray:v24];

  return v20;
}

uint64_t __53__FBKDraftingController_generateSnapshotIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 answerType] == 11)
  {
    id v4 = [*(id *)(a1 + 32) formResponse];
    uint64_t v5 = [v4 answerForQuestion:v3];
    uint64_t v6 = [v5 isAnswered] ^ 1;
  }
  else
  {
    uint64_t v6 = 1;
  }

  return v6;
}

- (id)questionChoiceForSectionIdentifier:(id)a3 itemIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(FBKDraftingController *)self cachedDiffableSections];
  uint64_t v9 = [v8 objectForKeyedSubscript:v7];

  uint64_t v10 = [v9 questionOrChoiceWithRowIdentifier:v6];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return v11;
}

- (id)visibleQuestionForSectionIdentifier:(id)a3 itemIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(FBKDraftingController *)self cachedDiffableSections];
  uint64_t v9 = [v8 objectForKeyedSubscript:v7];

  uint64_t v10 = [v9 questionWithRowIdentifier:v6];

  return v10;
}

- (id)questionForVisibleChoice:(id)a3 sectionIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(FBKDraftingController *)self cachedDiffableSections];
  uint64_t v9 = [v8 objectForKeyedSubscript:v6];

  uint64_t v10 = [v9 questionWithChoice:v7];

  return v10;
}

- (id)questionGroupForSectionIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(FBKDraftingController *)self cachedDiffableSections];
  id v6 = [v5 objectForKeyedSubscript:v4];

  id v7 = [v6 questionGroup];

  return v7;
}

- (id)identifierForVisibleQuestion:(id)a3 hasAttemptedSubmission:(BOOL)a4
{
  id v6 = a3;
  id v7 = [(FBKDraftingController *)self formResponse];
  if (a4)
  {
    uint64_t v8 = [(FBKDraftingController *)self invalidQuestionIDs];
  }
  else
  {
    uint64_t v8 = objc_opt_new();
  }
  uint64_t v9 = (void *)v8;
  uint64_t v10 = +[FBKQuestionGroupDiffableSection identifierForQuestion:v6 formResponse:v7 questionIDsInErrorState:v8];

  return v10;
}

- (void)updateUIAfterAutoFill
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1_3(&dword_22A36D000, v0, v1, "Unanswered questions %ld", v2);
}

uint64_t __46__FBKDraftingController_updateUIAfterAutoFill__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) automaticallyFillInAllAnswers];
}

- (void)automaticallyFillInAllAnswers
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  uint64_t v3 = [(FBKDraftingController *)self visibleQuestionGroups];
  uint64_t v30 = [v3 countByEnumeratingWithState:&v36 objects:v41 count:16];
  if (v30)
  {
    uint64_t v4 = *(void *)v37;
    long long v31 = v3;
    uint64_t v29 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v30; ++i)
      {
        if (*(void *)v37 != v4) {
          objc_enumerationMutation(v3);
        }
        uint64_t v6 = *(void *)(*((void *)&v36 + 1) + 8 * i);
        long long v32 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        id v7 = [(FBKDraftingController *)self visibleQuestionsForGroup:v6];
        uint64_t v8 = [v7 countByEnumeratingWithState:&v32 objects:v40 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v33;
          while (2)
          {
            for (uint64_t j = 0; j != v9; ++j)
            {
              if (*(void *)v33 != v10) {
                objc_enumerationMutation(v7);
              }
              uint64_t v12 = *(void **)(*((void *)&v32 + 1) + 8 * j);
              uint64_t v13 = [(FBKDraftingController *)self formResponse];
              long long v14 = [v13 answerForQuestion:v12];

              BOOL v15 = [v14 value];
              if (FBKAnswerIsBlank(v15))
              {
                int v16 = [v12 isAnswerableByAutoFill];

                if (v16)
                {
                  if (![v12 answerType] || objc_msgSend(v12, "answerType") == 1)
                  {
                    id v19 = objc_alloc_init(MEMORY[0x263F08790]);
                    [v19 setDateStyle:1];
                    [v19 setTimeStyle:2];
                    uint64_t v25 = NSString;
                    uint64_t v26 = [MEMORY[0x263EFF910] date];
                    v27 = [v19 stringFromDate:v26];
                    long long v28 = [v25 stringWithFormat:@"%@ FBK Auto Fill", v27];
                    [(FBKDraftingController *)self setResponse:v28 forQuestion:v12];

                    [(FBKDraftingController *)self updateUIAfterAutoFill];
                    uint64_t v3 = v31;
LABEL_30:

                    goto LABEL_31;
                  }
                  if ([v12 answerType] == 4
                    || [v12 answerType] == 2
                    || [v12 answerType] == 3)
                  {
                    long long v17 = [v12 allChoices];
                    uint64_t v18 = [MEMORY[0x263F08A98] predicateWithFormat:@"isPrompt = NO"];
                    id v19 = [v17 filteredArrayUsingPredicate:v18];

                    uint64_t v20 = [v12 role];
                    LODWORD(v18) = [v20 isEqualToString:@":area"];

                    uint64_t v3 = v31;
                    if (!v18) {
                      goto LABEL_27;
                    }
                    long long v21 = objc_msgSend(v19, "ded_selectItemsPassingTest:", &__block_literal_global_16);
                    long long v22 = [v21 firstObject];
                    uint64_t v23 = [v22 valueForKey:@"value"];

                    if (!v23)
                    {
LABEL_27:
                      uint64_t v24 = [v19 firstObject];
                      uint64_t v23 = [v24 valueForKey:@"value"];
                    }
                    [(FBKDraftingController *)self setResponse:v23 forQuestion:v12];
                    [(FBKDraftingController *)self updateUIAfterAutoFill];

                    goto LABEL_30;
                  }
                }
              }
              else
              {
              }
            }
            uint64_t v9 = [v7 countByEnumeratingWithState:&v32 objects:v40 count:16];
            if (v9) {
              continue;
            }
            break;
          }
        }

        uint64_t v3 = v31;
        uint64_t v4 = v29;
      }
      uint64_t v30 = [v31 countByEnumeratingWithState:&v36 objects:v41 count:16];
    }
    while (v30);
  }
LABEL_31:
}

uint64_t __54__FBKDraftingController_automaticallyFillInAllAnswers__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 title];
  uint64_t v3 = [v2 isEqualToString:@"Feedback Assistant"];

  return v3;
}

- (NSString)attachmentsSectionTitleFromBugForm
{
  return self->_attachmentsSectionTitleFromBugForm;
}

- (void)setAttachmentsSectionTitleFromBugForm:(id)a3
{
}

- (FBKFormResponse)formResponse
{
  return self->_formResponse;
}

- (void)setFormResponse:(id)a3
{
}

- (FBKBugFormStub)formStub
{
  return self->_formStub;
}

- (void)setFormStub:(id)a3
{
}

- (FBKDraftingDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (FBKDraftingDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (FBKDeviceDiagnosticsController)diagnosticsController
{
  return self->_diagnosticsController;
}

- (void)setDiagnosticsController:(id)a3
{
}

- (BOOL)isLoading
{
  return self->_isLoading;
}

- (void)setIsLoading:(BOOL)a3
{
  self->_isLoading = a3;
}

- (BOOL)isDirty
{
  return self->_isDirty;
}

- (void)setIsDirty:(BOOL)a3
{
  self->_isDirty = a3;
}

- (BOOL)isSubmitting
{
  return self->_isSubmitting;
}

- (void)setIsSubmitting:(BOOL)a3
{
  self->_isSubmitting = a3;
}

- (BOOL)useInlineChoices
{
  return self->_useInlineChoices;
}

- (void)setUseInlineChoices:(BOOL)a3
{
  self->_useInlineChoices = a3;
}

- (FBKDraftModelSnapshot)currentSnapshot
{
  return self->_currentSnapshot;
}

- (FBKQuestionDependencyGraph)dependencyGraph
{
  return (FBKQuestionDependencyGraph *)objc_getProperty(self, a2, 64, 1);
}

- (void)setDependencyGraph:(id)a3
{
}

- (FBKTeam)team
{
  return self->_team;
}

- (void)setTeam:(id)a3
{
}

- (NSDictionary)cachedDiffableSections
{
  return self->_cachedDiffableSections;
}

- (void)setCachedDiffableSections:(id)a3
{
}

- (NSArray)cachedVisibleGroups
{
  return self->_cachedVisibleGroups;
}

- (void)setCachedVisibleGroups:(id)a3
{
}

- (NSMutableDictionary)cachedVisibleQuestions
{
  return self->_cachedVisibleQuestions;
}

- (void)setCachedVisibleQuestions:(id)a3
{
}

- (NSMutableSet)questionIDsInErrorState
{
  return self->_questionIDsInErrorState;
}

- (void)setQuestionIDsInErrorState:(id)a3
{
}

- (BOOL)spamDebugLogs
{
  return self->_spamDebugLogs;
}

- (void)setSpamDebugLogs:(BOOL)a3
{
  self->_spamDebugLogs = a3;
}

- (FBKData)FBKData
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_FBKData);

  return (FBKData *)WeakRetained;
}

- (void)setFBKData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_FBKData);
  objc_storeStrong((id *)&self->_questionIDsInErrorState, 0);
  objc_storeStrong((id *)&self->_cachedVisibleQuestions, 0);
  objc_storeStrong((id *)&self->_cachedVisibleGroups, 0);
  objc_storeStrong((id *)&self->_cachedDiffableSections, 0);
  objc_storeStrong((id *)&self->_team, 0);
  objc_storeStrong((id *)&self->_dependencyGraph, 0);
  objc_storeStrong((id *)&self->_currentSnapshot, 0);
  objc_storeStrong((id *)&self->_diagnosticsController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_formStub, 0);
  objc_storeStrong((id *)&self->_formResponse, 0);

  objc_storeStrong((id *)&self->_attachmentsSectionTitleFromBugForm, 0);
}

- (void)loadResponseForFeedbackObject:withTeam:.cold.1()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1_1();
  __int16 v2 = 2080;
  uint64_t v3 = "-[FBKDraftingController loadResponseForFeedbackObject:withTeam:]";
  _os_log_error_impl(&dword_22A36D000, v0, OS_LOG_TYPE_ERROR, "Attempted to load object %{public}@, but %s doesn't support it.", v1, 0x16u);
}

- (void)_loadNewResponseForBugForm:(os_log_t)log orBugFormStub:withTeam:requestPlugIns:appToken:.cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_22A36D000, log, OS_LOG_TYPE_ERROR, "no form or stub, cannot start draft", v1, 2u);
}

- (void)isQuestionVisible:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 role];
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1_3(&dword_22A36D000, a2, v4, "group is not visible for question [%{public}@]", v5);
}

void __42__FBKDraftingController_allVisibleAnswers__block_invoke_cold_1(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 ID];
  v4[0] = 67109120;
  v4[1] = [v3 intValue];
  _os_log_fault_impl(&dword_22A36D000, a2, OS_LOG_TYPE_FAULT, "Answer.question is nil for Answer [%d]", (uint8_t *)v4, 8u);
}

- (void)didChangeAnswerToQuestion:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 ID];
  [v3 integerValue];
  OUTLINED_FUNCTION_1_1();
  _os_log_error_impl(&dword_22A36D000, a2, OS_LOG_TYPE_ERROR, "updated question [%ld] while loading", v4, 0xCu);
}

- (void)attachAnswersToQuestionsWithGivenData:.cold.1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1_3(&dword_22A36D000, v0, v1, "Will pre attach answers %{public}@", v2);
}

- (void)validate:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 questionIDsInErrorState];
  [v3 count];
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1_3(&dword_22A36D000, a2, v4, "Validation found %ld missing answers", v5);
}

- (void)validate:(uint64_t)a1 .cold.2(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = objc_msgSend((id)OUTLINED_FUNCTION_2_0(a1, a2), "ID");
  int v6 = [v5 unsignedIntValue];
  *(_DWORD *)uint64_t v4 = 67109120;
  _DWORD *v3 = v6;
  _os_log_fault_impl(&dword_22A36D000, v2, OS_LOG_TYPE_FAULT, "No answer for question [%u] in validate:", v4, 8u);
}

@end