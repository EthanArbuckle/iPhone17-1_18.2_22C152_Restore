@interface MapsSuggestionsRoutineShortcutSuggestor
- (MapsSuggestionsRoutineShortcutSuggestor)initWithRoutine:(id)a3;
- (char)suggestShortcutsOfType:(int64_t)a3 handler:(id)a4;
- (id)initFromResourceDepot:(id)a3;
@end

@implementation MapsSuggestionsRoutineShortcutSuggestor

- (id)initFromResourceDepot:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  if (!v4)
  {
    v9 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v11 = 136446978;
      v12 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRoutineShortcutSuggestor.mm";
      __int16 v13 = 1024;
      int v14 = 42;
      __int16 v15 = 2082;
      v16 = "-[MapsSuggestionsRoutineShortcutSuggestor initFromResourceDepot:]";
      __int16 v17 = 2082;
      v18 = "nil == (resourceDepot)";
      _os_log_impl(&dword_1A70DF000, v9, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a resource depot to build from!", (uint8_t *)&v11, 0x26u);
    }
    goto LABEL_9;
  }
  v6 = [v4 oneRoutine];

  if (!v6)
  {
    v9 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v11 = 136446978;
      v12 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRoutineShortcutSuggestor.mm";
      __int16 v13 = 1024;
      int v14 = 43;
      __int16 v15 = 2082;
      v16 = "-[MapsSuggestionsRoutineShortcutSuggestor initFromResourceDepot:]";
      __int16 v17 = 2082;
      v18 = "nil == (resourceDepot.oneRoutine)";
      _os_log_impl(&dword_1A70DF000, v9, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires One Routine!", (uint8_t *)&v11, 0x26u);
    }
LABEL_9:

    v8 = 0;
    goto LABEL_10;
  }
  v7 = [v5 oneRoutine];
  self = [(MapsSuggestionsRoutineShortcutSuggestor *)self initWithRoutine:v7];

  v8 = self;
LABEL_10:

  return v8;
}

- (MapsSuggestionsRoutineShortcutSuggestor)initWithRoutine:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    v11.receiver = self;
    v11.super_class = (Class)MapsSuggestionsRoutineShortcutSuggestor;
    v6 = [(MapsSuggestionsRoutineShortcutSuggestor *)&v11 init];
    v7 = v6;
    if (v6) {
      objc_storeStrong((id *)&v6->_routine, a3);
    }
    self = v7;
    v8 = self;
  }
  else
  {
    v9 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      __int16 v13 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRoutineShortcutSuggestor.mm";
      __int16 v14 = 1024;
      int v15 = 31;
      __int16 v16 = 2082;
      __int16 v17 = "-[MapsSuggestionsRoutineShortcutSuggestor initWithRoutine:]";
      __int16 v18 = 2082;
      uint64_t v19 = "nil == (routine)";
      _os_log_impl(&dword_1A70DF000, v9, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an instance of MapsSuggestionsRoutine.", buf, 0x26u);
    }

    v8 = 0;
  }

  return v8;
}

- (char)suggestShortcutsOfType:(int64_t)a3 handler:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (v6)
  {
    GEOFindOrCreateLog();
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromMapsSuggestionsShortcutType(a3);
      v8 = (char *)objc_claimAutoreleasedReturnValue();
      int v15 = 138412290;
      __int16 v16 = v8;
      _os_log_impl(&dword_1A70DF000, v7, OS_LOG_TYPE_DEBUG, "suggestShortcutsOfType:%@", (uint8_t *)&v15, 0xCu);
    }
    if (+[MapsSuggestionsSiri isEnabled])
    {
      routine = self->_routine;
      if (qword_1EB6F0398 != -1) {
        dispatch_once(&qword_1EB6F0398, &__block_literal_global_34);
      }
      uint64_t v10 = _MergedGlobals_47;
      if (qword_1EB6F03A8 != -1) {
        dispatch_once(&qword_1EB6F03A8, &__block_literal_global_227_0);
      }
      char v11 = [(MapsSuggestionsRoutine *)routine fetchSuggestedShortcutsForType:a3 minVisits:v10 maxAge:v6 handler:*(double *)&qword_1EB6F03A0];
    }
    else
    {
      __int16 v13 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v15) = 0;
        _os_log_impl(&dword_1A70DF000, v13, OS_LOG_TYPE_DEBUG, "Siri Suggestions for Maps disabled", (uint8_t *)&v15, 2u);
      }

      (*((void (**)(id, void, void))v6 + 2))(v6, MEMORY[0x1E4F1CBF0], 0);
      char v11 = 1;
    }
  }
  else
  {
    v12 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v15 = 136446978;
      __int16 v16 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRoutineShortcutSuggestor.mm";
      __int16 v17 = 1024;
      int v18 = 71;
      __int16 v19 = 2082;
      uint64_t v20 = "-[MapsSuggestionsRoutineShortcutSuggestor suggestShortcutsOfType:handler:]";
      __int16 v21 = 2082;
      v22 = "nil == (handler)";
      _os_log_impl(&dword_1A70DF000, v12, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a completion handler", (uint8_t *)&v15, 0x26u);
    }

    char v11 = 0;
  }

  return v11;
}

- (void).cxx_destruct
{
}

@end