@interface ATXAnchorModelInferenceTracker
- (ATXAnchorModelInferenceTracker)init;
- (id)fetchPersistedInferenceEvents;
- (id)inferenceEventsToTryAgain;
- (void)clearAllIncompleteInferenceEvents;
- (void)fetchPersistedInferenceEvents;
- (void)persistInferenceEvent:(id)a3;
- (void)trackInferenceFailedForInferenceEvent:(id)a3;
- (void)trackInferenceFinishedForInferenceEvent:(id)a3;
- (void)trackInferenceStartedForInferenceEvent:(id)a3;
@end

@implementation ATXAnchorModelInferenceTracker

- (ATXAnchorModelInferenceTracker)init
{
  v7.receiver = self;
  v7.super_class = (Class)ATXAnchorModelInferenceTracker;
  v2 = [(ATXAnchorModelInferenceTracker *)&v7 init];
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F1CB18]);
    uint64_t v4 = [v3 initWithSuiteName:*MEMORY[0x1E4F4B688]];
    defaults = v2->_defaults;
    v2->_defaults = (NSUserDefaults *)v4;
  }
  return v2;
}

- (void)trackInferenceStartedForInferenceEvent:(id)a3
{
  uint64_t v4 = NSNumber;
  id v7 = a3;
  v5 = [v7 retryCount];
  v6 = objc_msgSend(v4, "numberWithInteger:", objc_msgSend(v5, "integerValue") + 1);
  [v7 setRetryCount:v6];

  [(ATXAnchorModelInferenceTracker *)self persistInferenceEvent:v7];
}

- (void)trackInferenceFinishedForInferenceEvent:(id)a3
{
}

- (void)trackInferenceFailedForInferenceEvent:(id)a3
{
}

- (void)clearAllIncompleteInferenceEvents
{
}

- (id)inferenceEventsToTryAgain
{
  id v3 = [(ATXAnchorModelInferenceTracker *)self fetchPersistedInferenceEvents];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __59__ATXAnchorModelInferenceTracker_inferenceEventsToTryAgain__block_invoke;
  v6[3] = &unk_1E68B4148;
  v6[4] = self;
  uint64_t v4 = objc_msgSend(v3, "_pas_filteredArrayWithTest:", v6);

  return v4;
}

uint64_t __59__ATXAnchorModelInferenceTracker_inferenceEventsToTryAgain__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [v3 retryCount];
  unsigned int v5 = [v4 unsignedIntValue];

  if (v5 >= 4)
  {
    v6 = __atxlog_handle_anchor();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 134217984;
      uint64_t v15 = 3;
      id v7 = "Found an incomplete inference event, but it has already been retried %ld times. Tracking it as a failed inference event.";
LABEL_7:
      _os_log_impl(&dword_1D0FA3000, v6, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v14, 0xCu);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  v8 = [v3 dateFirstAdded];
  [v8 timeIntervalSinceNow];
  double v10 = v9;

  v6 = __atxlog_handle_anchor();
  BOOL v11 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v10 < -1200.0)
  {
    if (v11)
    {
      int v14 = 134217984;
      uint64_t v15 = 0x4034000000000000;
      id v7 = "Found an incomplete inference event, but it originally happened more than %.2f minutes ago. Tracking it as a "
           "failed inference event.";
      goto LABEL_7;
    }
LABEL_8:

    [*(id *)(a1 + 32) trackInferenceFailedForInferenceEvent:v3];
    uint64_t v12 = 0;
    goto LABEL_12;
  }
  if (v11)
  {
    LOWORD(v14) = 0;
    _os_log_impl(&dword_1D0FA3000, v6, OS_LOG_TYPE_DEFAULT, "Found an incomplete inference event. Going to retry it.", (uint8_t *)&v14, 2u);
  }

  uint64_t v12 = 1;
LABEL_12:

  return v12;
}

- (void)persistInferenceEvent:(id)a3
{
  id v9 = 0;
  uint64_t v4 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:a3 requiringSecureCoding:1 error:&v9];
  id v5 = v9;
  v6 = v5;
  if (v4) {
    BOOL v7 = v5 == 0;
  }
  else {
    BOOL v7 = 0;
  }
  if (v7)
  {
    [(NSUserDefaults *)self->_defaults setObject:v4 forKey:@"ATXAnchorModelInferenceTrackerDefaultsKey"];
  }
  else
  {
    v8 = __atxlog_handle_anchor();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[ATXAnchorModelInferenceTracker persistInferenceEvent:]((uint64_t)v6, v8);
    }

    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8], @"Unable to archive ATXAnchorModelIncompleteInferenceEvent with error: %@", v6 format];
  }
}

- (id)fetchPersistedInferenceEvents
{
  v11[1] = *MEMORY[0x1E4F143B8];
  v2 = [(NSUserDefaults *)self->_defaults objectForKey:@"ATXAnchorModelInferenceTrackerDefaultsKey"];
  if (v2)
  {
    id v3 = (void *)MEMORY[0x1D25F6CC0]();
    id v10 = 0;
    uint64_t v4 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v2 error:&v10];
    id v5 = v10;
    if (v4) {
      BOOL v6 = v5 == 0;
    }
    else {
      BOOL v6 = 0;
    }
    if (v6)
    {
      v11[0] = v4;
      v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
    }
    else
    {
      BOOL v7 = __atxlog_handle_anchor();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        [(ATXAnchorModelInferenceTracker *)(uint64_t)v5 fetchPersistedInferenceEvents];
      }

      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8], @"Unable to unarchive ATXAnchorModelIncompleteInferenceEvent with error: %@", v5 format];
      v8 = (void *)MEMORY[0x1E4F1CBF0];
    }
  }
  else
  {
    id v5 = __atxlog_handle_anchor();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[ATXAnchorModelInferenceTracker fetchPersistedInferenceEvents](v5);
    }
    v8 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v8;
}

- (void).cxx_destruct
{
}

- (void)persistInferenceEvent:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_ERROR, "Unable to archive ATXAnchorModelIncompleteInferenceEvent with error: %@", (uint8_t *)&v2, 0xCu);
}

- (void)fetchPersistedInferenceEvents
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_ERROR, "Unable to unarchive ATXAnchorModelIncompleteInferenceEvent with error: %@", (uint8_t *)&v2, 0xCu);
}

@end