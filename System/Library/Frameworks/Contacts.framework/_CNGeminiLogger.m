@interface _CNGeminiLogger
- (OS_os_log)log;
- (_CNGeminiLogger)init;
- (void)fetchSortedResultsForInteraction:(id)a3 error:(id)a4;
- (void)fetchedSortedResults:(id)a3 forInteraction:(id)a4;
- (void)fetchingBestResultForDestinationHandle:(id)a3;
- (void)recordInteractionError:(id)a3;
- (void)recordedInteraction:(id)a3 forContext:(id)a4;
- (void)registeredForContextUpdatesWithToken:(id)a3;
- (void)unregisteredForContextUpdatesWithToken:(id)a3;
- (void)updateSubscriptionInfoError:(id)a3;
- (void)updatedSubscriptionInfo:(id)a3;
- (void)updatingSubscriptionInfo:(id)a3;
@end

@implementation _CNGeminiLogger

- (_CNGeminiLogger)init
{
  v7.receiver = self;
  v7.super_class = (Class)_CNGeminiLogger;
  v2 = [(_CNGeminiLogger *)&v7 init];
  if (v2)
  {
    os_log_t v3 = os_log_create("com.apple.contacts", "Gemini");
    log = v2->_log;
    v2->_log = (OS_os_log *)v3;

    v5 = v2;
  }

  return v2;
}

- (void)updatingSubscriptionInfo:(id)a3
{
  id v3 = a3;
  os_activity_t v4 = _os_activity_create(&dword_1909E3000, "UpdatingSubscriptionInfo", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __44___CNGeminiLogger_updatingSubscriptionInfo___block_invoke;
  aBlock[3] = &unk_1E56B4530;
  os_activity_t v13 = v4;
  v5 = v4;
  v6 = _Block_copy(aBlock);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44___CNGeminiLogger_updatingSubscriptionInfo___block_invoke_2;
  block[3] = &unk_1E56B4828;
  id v10 = v3;
  id v11 = v6;
  id v7 = v6;
  id v8 = v3;
  os_activity_apply(v5, block);
}

- (void)fetchingBestResultForDestinationHandle:(id)a3
{
  id v3 = a3;
  os_activity_t v4 = _os_activity_create(&dword_1909E3000, "FetchingBestResultForDestinationHandle", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __58___CNGeminiLogger_fetchingBestResultForDestinationHandle___block_invoke;
  aBlock[3] = &unk_1E56B4530;
  os_activity_t v13 = v4;
  v5 = v4;
  v6 = _Block_copy(aBlock);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58___CNGeminiLogger_fetchingBestResultForDestinationHandle___block_invoke_2;
  block[3] = &unk_1E56B4828;
  id v10 = v3;
  id v11 = v6;
  id v7 = v6;
  id v8 = v3;
  os_activity_apply(v5, block);
}

- (void)recordedInteraction:(id)a3 forContext:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 contactIdentifier];

  v9 = [(_CNGeminiLogger *)self log];
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
  if (v8)
  {
    if (v10)
    {
      id v11 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v6, "transport"));
      v12 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v6, "directionality"));
      os_activity_t v13 = [v6 handle];
      v14 = [v6 contactIdentifier];
      v15 = [v7 uuid];
      int v16 = 138413314;
      v17 = v11;
      __int16 v18 = 2112;
      v19 = v12;
      __int16 v20 = 2112;
      v21 = v13;
      __int16 v22 = 2112;
      v23 = v14;
      __int16 v24 = 2112;
      v25 = v15;
      _os_log_impl(&dword_1909E3000, v9, OS_LOG_TYPE_INFO, "Recorded interaction with transport:%@ directionality:%@ handle:%@ contactIdentifier:%@ contextUUID:%@", (uint8_t *)&v16, 0x34u);

LABEL_6:
    }
  }
  else if (v10)
  {
    id v11 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v6, "transport"));
    v12 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v6, "directionality"));
    os_activity_t v13 = [v6 handle];
    v14 = [v7 uuid];
    int v16 = 138413058;
    v17 = v11;
    __int16 v18 = 2112;
    v19 = v12;
    __int16 v20 = 2112;
    v21 = v13;
    __int16 v22 = 2112;
    v23 = v14;
    _os_log_impl(&dword_1909E3000, v9, OS_LOG_TYPE_INFO, "Recorded interaction with transport:%@ directionality:%@ handle:%@ contextUUID:%@", (uint8_t *)&v16, 0x2Au);
    goto LABEL_6;
  }
}

- (void)recordInteractionError:(id)a3
{
  id v4 = a3;
  v5 = [(_CNGeminiLogger *)self log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[_CNGeminiLogger recordInteractionError:]((uint64_t)v4, v5);
  }
}

- (void)registeredForContextUpdatesWithToken:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(_CNGeminiLogger *)self log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_1909E3000, v5, OS_LOG_TYPE_INFO, "Registered for context updates with token %@", (uint8_t *)&v6, 0xCu);
  }
}

- (void)unregisteredForContextUpdatesWithToken:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(_CNGeminiLogger *)self log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_1909E3000, v5, OS_LOG_TYPE_INFO, "Unregistered for context updates with token %@", (uint8_t *)&v6, 0xCu);
  }
}

- (void)updatedSubscriptionInfo:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(_CNGeminiLogger *)self log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_1909E3000, v5, OS_LOG_TYPE_INFO, "Updated subscription info: %@", (uint8_t *)&v6, 0xCu);
  }
}

- (void)updateSubscriptionInfoError:(id)a3
{
  id v4 = a3;
  v5 = [(_CNGeminiLogger *)self log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[_CNGeminiLogger updateSubscriptionInfoError:]((uint64_t)v4, v5);
  }
}

- (void)fetchedSortedResults:(id)a3 forInteraction:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  int v6 = [v5 contactIdentifier];

  id v7 = [(_CNGeminiLogger *)self log];
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
  if (v6)
  {
    if (v8)
    {
      v9 = [v5 handle];
      BOOL v10 = [v5 contactIdentifier];
      id v11 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v5, "transport"));
      int v12 = 138412802;
      os_activity_t v13 = v9;
      __int16 v14 = 2112;
      v15 = v10;
      __int16 v16 = 2112;
      v17 = v11;
      _os_log_impl(&dword_1909E3000, v7, OS_LOG_TYPE_INFO, "Fetched sorted results for handle:%@ contactIdentifier:%@ transport:%@", (uint8_t *)&v12, 0x20u);

LABEL_6:
    }
  }
  else if (v8)
  {
    v9 = [v5 handle];
    BOOL v10 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v5, "transport"));
    int v12 = 138412546;
    os_activity_t v13 = v9;
    __int16 v14 = 2112;
    v15 = v10;
    _os_log_impl(&dword_1909E3000, v7, OS_LOG_TYPE_INFO, "Fetched sorted results for handle:%@ transport:%@", (uint8_t *)&v12, 0x16u);
    goto LABEL_6;
  }
}

- (void)fetchSortedResultsForInteraction:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [v6 contactIdentifier];

  v9 = [(_CNGeminiLogger *)self log];
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
  if (v8)
  {
    if (v10) {
      -[_CNGeminiLogger fetchSortedResultsForInteraction:error:](v6, (uint64_t)v7, v9);
    }
  }
  else if (v10)
  {
    -[_CNGeminiLogger fetchSortedResultsForInteraction:error:](v6, (uint64_t)v7, v9);
  }
}

- (OS_os_log)log
{
  return self->_log;
}

- (void).cxx_destruct
{
}

- (void)recordInteractionError:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1909E3000, a2, OS_LOG_TYPE_ERROR, "Recording interaction failed with error: %@", (uint8_t *)&v2, 0xCu);
}

- (void)updateSubscriptionInfoError:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1909E3000, a2, OS_LOG_TYPE_ERROR, "Updating subscription info failed with error: %@", (uint8_t *)&v2, 0xCu);
}

- (void)fetchSortedResultsForInteraction:(NSObject *)a3 error:.cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = [a1 handle];
  id v7 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a1, "transport"));
  int v8 = 138412802;
  v9 = v6;
  __int16 v10 = 2112;
  id v11 = v7;
  __int16 v12 = 2112;
  uint64_t v13 = a2;
  _os_log_error_impl(&dword_1909E3000, a3, OS_LOG_TYPE_ERROR, "Fetching sorted results for handle:%@ type:%@ failed with error:%@", (uint8_t *)&v8, 0x20u);
}

- (void)fetchSortedResultsForInteraction:(NSObject *)a3 error:.cold.2(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = [a1 handle];
  id v7 = [a1 contactIdentifier];
  int v8 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a1, "transport"));
  int v9 = 138413058;
  __int16 v10 = v6;
  __int16 v11 = 2112;
  __int16 v12 = v7;
  __int16 v13 = 2112;
  uint64_t v14 = v8;
  __int16 v15 = 2112;
  uint64_t v16 = a2;
  _os_log_error_impl(&dword_1909E3000, a3, OS_LOG_TYPE_ERROR, "Fetching sorted results for handle:%@ contactIdentifier:%@ type:%@ failed with error:%@", (uint8_t *)&v9, 0x2Au);
}

@end