@interface MSParsecSearchSession
+ (OS_os_log)log;
+ (id)sharedSession;
- (MSParsecSearchIndexState)indexState;
- (MSParsecSearchSession)init;
- (NSMutableArray)currentFeedback;
- (PARSession)session;
- (SFStartLocalSearchFeedback)currentLocalSearchFeedback;
- (id)_categoryOrder;
- (id)_sectionFeedbackForBundleIdentifier:(id)a3 results:(id)a4;
- (int64_t)currentQueryID;
- (int64_t)feedbackQueryID;
- (void)reportDidGoToCommittedSearch;
- (void)reportFeedback:(id)a3;
- (void)reportInstantAnswerButtonSelected:(id)a3 cardSectionID:(id)a4 command:(id)a5;
- (void)reportInstantAnswerCardSelected:(id)a3 cardSectionID:(id)a4;
- (void)reportLocalSearchEnded;
- (void)reportMessageListResultEngaged:(id)a3 engagementAction:(int64_t)a4;
- (void)reportMessageListResultsFetched:(id)a3 isFinished:(BOOL)a4;
- (void)reportMessageListResultsVisible:(id)a3;
- (void)reportQueryClearedEvent:(int64_t)a3;
- (void)reportQueryWithRestrictedComponents:(id)a3 triggerEvent:(unint64_t)a4 searchType:(unint64_t)a5 hasCurrentMailboxScope:(BOOL)a6 languages:(id)a7;
- (void)reportQueryWithRestrictedComponents:(id)a3 triggerEvent:(unint64_t)a4 searchType:(unint64_t)a5 hasCurrentMailboxScope:(BOOL)a6 searchViewAppeared:(BOOL)a7 languages:(id)a8;
- (void)reportRankingFeedbackForSuggestions:(id)a3;
- (void)reportSearchEndedEvent:(int64_t)a3;
- (void)reportSearchViewAppeared:(BOOL)a3 currentMailboxScope:(BOOL)a4 languages:(id)a5;
- (void)reportSuggestionSelected:(id)a3;
- (void)reportSuggestionsVisible:(id)a3;
- (void)reportTopHitSelected:(id)a3;
- (void)sendLogsToSettings;
- (void)setCurrentLocalSearchFeedback:(id)a3;
- (void)setCurrentQueryID:(int64_t)a3;
- (void)setIndexState:(id)a3;
@end

@implementation MSParsecSearchSession

+ (OS_os_log)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __28__MSParsecSearchSession_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken != -1) {
    dispatch_once(&log_onceToken, block);
  }
  v2 = (void *)log_log;
  return (OS_os_log *)v2;
}

void __28__MSParsecSearchSession_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log;
  log_log = (uint64_t)v1;
}

+ (id)sharedSession
{
  if (sharedSession_onceToken != -1) {
    dispatch_once(&sharedSession_onceToken, &__block_literal_global_7);
  }
  v2 = (void *)sharedSession_sharedSession;
  return v2;
}

void __38__MSParsecSearchSession_sharedSession__block_invoke()
{
  v0 = objc_alloc_init(MSParsecSearchSession);
  os_log_t v1 = (void *)sharedSession_sharedSession;
  sharedSession_sharedSession = (uint64_t)v0;
}

- (MSParsecSearchSession)init
{
  v13.receiver = self;
  v13.super_class = (Class)MSParsecSearchSession;
  v2 = [(MSParsecSearchSession *)&v13 init];
  if (v2)
  {
    uint64_t v19 = 0;
    v20 = &v19;
    uint64_t v21 = 0x2050000000;
    id v3 = (void *)getPARSessionConfigurationClass_softClass;
    uint64_t v22 = getPARSessionConfigurationClass_softClass;
    if (!getPARSessionConfigurationClass_softClass)
    {
      uint64_t v14 = MEMORY[0x1E4F143A8];
      uint64_t v15 = 3221225472;
      v16 = __getPARSessionConfigurationClass_block_invoke;
      v17 = &unk_1E63FEC58;
      v18 = &v19;
      __getPARSessionConfigurationClass_block_invoke((uint64_t)&v14);
      id v3 = (void *)v20[3];
    }
    v4 = v3;
    _Block_object_dispose(&v19, 8);
    v5 = (void *)[[v4 alloc] initWithId:@"com.apple.mail" userAgent:@"Mail/1"];
    uint64_t v19 = 0;
    v20 = &v19;
    uint64_t v21 = 0x2050000000;
    v6 = (void *)getPARSessionClass_softClass;
    uint64_t v22 = getPARSessionClass_softClass;
    if (!getPARSessionClass_softClass)
    {
      uint64_t v14 = MEMORY[0x1E4F143A8];
      uint64_t v15 = 3221225472;
      v16 = __getPARSessionClass_block_invoke;
      v17 = &unk_1E63FEC58;
      v18 = &v19;
      __getPARSessionClass_block_invoke((uint64_t)&v14);
      v6 = (void *)v20[3];
    }
    id v7 = v6;
    _Block_object_dispose(&v19, 8);
    uint64_t v8 = [v7 sharedPARSessionWithConfiguration:v5];
    session = v2->_session;
    v2->_session = (PARSession *)v8;

    v2->_currentQueryID = 0;
    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    currentFeedback = v2->_currentFeedback;
    v2->_currentFeedback = v10;
  }
  return v2;
}

- (int64_t)feedbackQueryID
{
  return self->_currentQueryID;
}

- (void)sendLogsToSettings
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = +[MSParsecSearchSession log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = [(MSParsecSearchSession *)self currentFeedback];
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_1BF36E000, v3, OS_LOG_TYPE_DEFAULT, "Reporting feedback to settings %@", (uint8_t *)&v6, 0xCu);
  }
  v5 = [(MSParsecSearchSession *)self currentFeedback];
  [v5 removeAllObjects];
}

- (void)reportFeedback:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(MSParsecSearchSession *)self session];
  [v5 reportFeedback:v4 queryId:self->_currentQueryID];

  int v6 = [(MSParsecSearchSession *)self currentFeedback];
  [v6 addObject:v4];

  id v7 = +[MSParsecSearchSession log];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int64_t currentQueryID = self->_currentQueryID;
    int v9 = 134218242;
    int64_t v10 = currentQueryID;
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_impl(&dword_1BF36E000, v7, OS_LOG_TYPE_INFO, "Reporting queryID: %lld feedback: %@", (uint8_t *)&v9, 0x16u);
  }
}

- (void)reportSearchViewAppeared:(BOOL)a3 currentMailboxScope:(BOOL)a4 languages:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  id v11 = a5;
  id v8 = objc_alloc(MEMORY[0x1E4F9A3D0]);
  if (v6) {
    uint64_t v9 = 9;
  }
  else {
    uint64_t v9 = 26;
  }
  int64_t v10 = (void *)[v8 initWithEvent:v9];
  if (v6) {
    ++self->_currentQueryID;
  }
  [(MSParsecSearchSession *)self reportFeedback:v10];
  if (v6) {
    [(MSParsecSearchSession *)self reportQueryWithRestrictedComponents:MEMORY[0x1E4F1CBF0] triggerEvent:9 searchType:1 hasCurrentMailboxScope:v5 searchViewAppeared:1 languages:v11];
  }
}

- (void)reportQueryWithRestrictedComponents:(id)a3 triggerEvent:(unint64_t)a4 searchType:(unint64_t)a5 hasCurrentMailboxScope:(BOOL)a6 searchViewAppeared:(BOOL)a7 languages:(id)a8
{
  BOOL v10 = a6;
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a8;
  v16 = [(MSParsecSearchSession *)self currentLocalSearchFeedback];

  if (v16) {
    [(MSParsecSearchSession *)self reportLocalSearchEnded];
  }
  if (!a7) {
    ++self->_currentQueryID;
  }
  v17 = +[MSParsecSearchSessionQueryComponent _structuredQueryForComponents:v14 hasCurrentMailboxScope:v10 languages:v15];
  v18 = +[MSParsecSearchSession log];
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v19 = [(MSParsecSearchSession *)self indexState];
    -[MSParsecSearchSession reportQueryWithRestrictedComponents:triggerEvent:searchType:hasCurrentMailboxScope:searchViewAppeared:languages:](v19, v37, v18);
  }

  v20 = (void *)[objc_alloc(MEMORY[0x1E4F9A450]) initWithInput:v17 triggerEvent:a4 searchType:a5 indexType:0 queryId:self->_currentQueryID];
  id v21 = objc_alloc_init(MEMORY[0x1E4F9A148]);
  uint64_t v22 = (void *)MEMORY[0x1E4F28ED0];
  v23 = [(MSParsecSearchSession *)self indexState];
  v24 = objc_msgSend(v22, "numberWithInteger:", objc_msgSend(v23, "percentMessagesIndexed"));
  [v21 setPercentMessagesIndexed:v24];

  v25 = (void *)MEMORY[0x1E4F28ED0];
  v26 = [(MSParsecSearchSession *)self indexState];
  v27 = objc_msgSend(v25, "numberWithInteger:", objc_msgSend(v26, "percentAttachmentsIndexed"));
  [v21 setPercentAttachmentsIndexed:v27];

  v28 = (void *)MEMORY[0x1E4F28ED0];
  v29 = [(MSParsecSearchSession *)self indexState];
  v30 = objc_msgSend(v28, "numberWithInteger:", objc_msgSend(v29, "totalMessageCount"));
  [v21 setTotalMessageCount:v30];

  v31 = (void *)MEMORY[0x1E4F28ED0];
  v32 = [(MSParsecSearchSession *)self indexState];
  v33 = objc_msgSend(v31, "numberWithInteger:", objc_msgSend(v32, "indexedMessageCount"));
  [v21 setIndexedMessageCount:v33];

  v34 = (void *)MEMORY[0x1E4F28ED0];
  v35 = [(MSParsecSearchSession *)self indexState];
  v36 = objc_msgSend(v34, "numberWithInteger:", objc_msgSend(v35, "indexType"));
  [v21 setSearchIndex:v36];

  [v20 setIndexState:v21];
  [(MSParsecSearchSession *)self setCurrentLocalSearchFeedback:v20];
  [(MSParsecSearchSession *)self reportFeedback:v20];
}

- (void)reportQueryWithRestrictedComponents:(id)a3 triggerEvent:(unint64_t)a4 searchType:(unint64_t)a5 hasCurrentMailboxScope:(BOOL)a6 languages:(id)a7
{
}

- (void)reportLocalSearchEnded
{
  id v3 = objc_alloc(MEMORY[0x1E4F9A078]);
  id v4 = [(MSParsecSearchSession *)self currentLocalSearchFeedback];
  id v5 = (id)[v3 initWithStartSearch:v4];

  [(MSParsecSearchSession *)self setCurrentLocalSearchFeedback:0];
  [(MSParsecSearchSession *)self reportFeedback:v5];
}

- (id)_categoryOrder
{
  if (_categoryOrder_onceToken != -1) {
    dispatch_once(&_categoryOrder_onceToken, &__block_literal_global_14);
  }
  v2 = (void *)_categoryOrder_order;
  return v2;
}

void __39__MSParsecSearchSession__categoryOrder__block_invoke()
{
  v2[19] = *MEMORY[0x1E4F143B8];
  v2[0] = @"cr";
  v2[1] = @"tophit";
  v2[2] = @"instantanswer";
  v2[3] = @"suggestion";
  v2[4] = @"people";
  v2[5] = @"date";
  v2[6] = @"subject";
  v2[7] = @"tu";
  v2[8] = @"tf";
  v2[9] = @"tv";
  v2[10] = @"attachment";
  v2[11] = @"mailbox";
  v2[12] = @"free_text";
  v2[13] = @"user_typed";
  v2[14] = @"document";
  v2[15] = @"link";
  v2[16] = @"flag";
  v2[17] = @"sender_contains";
  v2[18] = @"subject_contains";
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:19];
  os_log_t v1 = (void *)_categoryOrder_order;
  _categoryOrder_order = v0;
}

- (void)reportRankingFeedbackForSuggestions:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (v4)
  {
    [(MSParsecSearchSession *)self _categoryOrder];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v6);
          }
          uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * i);
          id v11 = objc_msgSend(v4, "objectForKeyedSubscript:", v10, (void)v14);
          if (v11)
          {
            id v12 = [(MSParsecSearchSession *)self _sectionFeedbackForBundleIdentifier:v10 results:v11];
            [v5 addObject:v12];
          }
        }
        uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v7);
    }
  }
  uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F9A318]) initWithSections:v5 blendingDuration:0.0];
  [(MSParsecSearchSession *)self reportFeedback:v13];
}

- (void)reportSuggestionsVisible:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v17 = a3;
  v18 = objc_msgSend(v17, "ef_mapSelector:", sel_feedbackResult);
  long long v16 = self;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = v17;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v20;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v19 + 1) + 8 * v8);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v10 = v9;
          id v11 = [v10 inlineCard];
          id v12 = [v11 cardSections];
          uint64_t v13 = [v12 firstObject];

          if (v13)
          {
            long long v14 = [v13 cardSectionId];
            [v4 addObject:v14];
          }
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v6);
  }

  long long v15 = (void *)[objc_alloc(MEMORY[0x1E4F9A540]) initWithResults:v18 triggerEvent:0];
  [v15 setUniqueIdentifiersOfVisibleCardSections:v4];
  [(MSParsecSearchSession *)v16 reportFeedback:v15];
}

- (void)reportTopHitSelected:(id)a3
{
  id v5 = [a3 feedbackResult];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F9A340]) initWithResult:v5 triggerEvent:2 destination:0];
  [(MSParsecSearchSession *)self reportFeedback:v4];
}

- (void)reportInstantAnswerCardSelected:(id)a3 cardSectionID:(id)a4
{
  id v11 = a4;
  uint64_t v6 = [a3 feedbackResult];
  id v7 = objc_alloc_init(MEMORY[0x1E4F99F28]);
  [v7 setCardSectionId:v11];
  id v8 = objc_alloc_init(MEMORY[0x1E4F9A538]);
  id v9 = objc_alloc_init(MEMORY[0x1E4F99EF0]);
  id v10 = (void *)[objc_alloc(MEMORY[0x1E4F99FB8]) initWithCommand:v8 cardSection:v7 result:v6 button:v9];
  [v10 setTriggerEvent:2];
  [(MSParsecSearchSession *)self reportFeedback:v10];
}

- (void)reportInstantAnswerButtonSelected:(id)a3 cardSectionID:(id)a4 command:(id)a5
{
  id v13 = a4;
  id v8 = a5;
  id v9 = [a3 feedbackResult];
  id v10 = objc_alloc_init(MEMORY[0x1E4F99F28]);
  [v10 setCardSectionId:v13];
  id v11 = objc_alloc_init(MEMORY[0x1E4F99EF0]);
  id v12 = (void *)[objc_alloc(MEMORY[0x1E4F99FB8]) initWithCommand:v8 cardSection:v10 result:v9 button:v11];
  [v12 setTriggerEvent:2];
  [(MSParsecSearchSession *)self reportFeedback:v12];
}

- (void)reportSuggestionSelected:(id)a3
{
  id v5 = [a3 feedbackResult];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F9A340]) initWithResult:v5 triggerEvent:2 destination:0];
  [(MSParsecSearchSession *)self reportFeedback:v4];
}

- (void)reportDidGoToCommittedSearch
{
  id v3 = (id)[objc_alloc(MEMORY[0x1E4F9A048]) initWithInput:&stru_1F1AA2F90 endpoint:0];
  -[MSParsecSearchSession reportFeedback:](self, "reportFeedback:");
}

- (void)reportMessageListResultsFetched:(id)a3 isFinished:(BOOL)a4
{
  BOOL v4 = a4;
  v11[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (v4) {
    [(MSParsecSearchSession *)self reportLocalSearchEnded];
  }
  id v7 = [(MSParsecSearchSession *)self _sectionFeedbackForBundleIdentifier:@"com.apple.mail.search.messagelist" results:v6];
  id v8 = objc_alloc(MEMORY[0x1E4F9A318]);
  v11[0] = v7;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  id v10 = (void *)[v8 initWithSections:v9 blendingDuration:0.0];

  [(MSParsecSearchSession *)self reportFeedback:v10];
}

- (id)_sectionFeedbackForBundleIdentifier:(id)a3 results:(id)a4
{
  id v5 = a3;
  id v6 = objc_msgSend(a4, "ef_compactMap:", &__block_literal_global_32);
  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F9A3F0]) initWithResults:v6 section:0 localSectionPosition:0 personalizationScore:0.0];
  id v8 = objc_alloc_init(MEMORY[0x1E4F9A368]);
  [v8 setBundleIdentifier:v5];
  id v9 = [MEMORY[0x1E4F29128] UUID];
  id v10 = [v9 UUIDString];
  [v8 setIdentifier:v10];

  [v7 setSection:v8];
  return v7;
}

id __69__MSParsecSearchSession__sectionFeedbackForBundleIdentifier_results___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = objc_alloc(MEMORY[0x1E4F9A360]);
  BOOL v4 = [v2 feedbackResult];
  id v5 = (void *)[v3 initWithResult:v4 hiddenResults:0 duplicateResults:0 localResultPosition:0];

  return v5;
}

- (void)reportMessageListResultsVisible:(id)a3
{
  objc_msgSend(a3, "ef_compactMapSelector:", sel_feedbackResult);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  BOOL v4 = (void *)[objc_alloc(MEMORY[0x1E4F9A540]) initWithResults:v5 triggerEvent:0];
  [(MSParsecSearchSession *)self reportFeedback:v4];
}

- (void)reportMessageListResultEngaged:(id)a3 engagementAction:(int64_t)a4
{
  id v10 = [a3 feedbackResult];
  if ((unint64_t)a4 >= 5)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"MSParsecSearchSession.m", 292, @"Using undefined MSParsecSearchSessionEngagementAction %ld to create SFResultEngagementFeedback", 0);

    uint64_t v7 = 0;
  }
  else
  {
    uint64_t v7 = qword_1BF3943A0[a4];
  }
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F9A340]) initWithResult:v10 triggerEvent:v7 destination:0];
  [(MSParsecSearchSession *)self reportFeedback:v9];
}

- (void)reportQueryClearedEvent:(int64_t)a3
{
  if ((unint64_t)a3 >= 3)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"MSParsecSearchSession.m", 312, @"Using undefined MSParsecSearchSessionClearedEvent %ld to create SFClearInputFeedback", a3);

    int64_t v5 = 0;
  }
  else
  {
    int64_t v5 = a3 + 1;
  }
  id v8 = (id)[objc_alloc(MEMORY[0x1E4F99F50]) initWithEvent:v5];
  -[MSParsecSearchSession reportFeedback:](self, "reportFeedback:");
}

- (void)reportSearchEndedEvent:(int64_t)a3
{
  if ((unint64_t)a3 >= 3)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"MSParsecSearchSession.m", 332, @"Using undefined MSParsecSearchSessionEndEvent %ld to create SFSearchViewDisappearFeedback", a3);

    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v5 = qword_1BF3943C8[a3];
  }
  id v8 = (id)[objc_alloc(MEMORY[0x1E4F9A3D8]) initWithEvent:v5];
  -[MSParsecSearchSession reportFeedback:](self, "reportFeedback:");
  [(MSParsecSearchSession *)self sendLogsToSettings];
}

- (MSParsecSearchIndexState)indexState
{
  return (MSParsecSearchIndexState *)objc_getProperty(self, a2, 8, 1);
}

- (void)setIndexState:(id)a3
{
}

- (PARSession)session
{
  return self->_session;
}

- (int64_t)currentQueryID
{
  return self->_currentQueryID;
}

- (void)setCurrentQueryID:(int64_t)a3
{
  self->_int64_t currentQueryID = a3;
}

- (NSMutableArray)currentFeedback
{
  return self->_currentFeedback;
}

- (SFStartLocalSearchFeedback)currentLocalSearchFeedback
{
  return self->_currentLocalSearchFeedback;
}

- (void)setCurrentLocalSearchFeedback:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentLocalSearchFeedback, 0);
  objc_storeStrong((id *)&self->_currentFeedback, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_indexState, 0);
}

- (void)reportQueryWithRestrictedComponents:(os_log_t)log triggerEvent:searchType:hasCurrentMailboxScope:searchViewAppeared:languages:.cold.1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_debug_impl(&dword_1BF36E000, log, OS_LOG_TYPE_DEBUG, "Sending Parsec indexState: %@", buf, 0xCu);
}

@end