@interface MapsSuggestionsCanKicker
- (MapsSuggestionsCanKicker)initWithName:(id)a3 queue:(id)a4 block:(id)a5;
- (MapsSuggestionsCanKicker)initWithName:(id)a3 time:(double)a4 leeway:(double)a5 queue:(id)a6 block:(id)a7;
- (MapsSuggestionsCanKicker)initWithName:(id)a3 time:(double)a4 queue:(id)a5 block:(id)a6;
- (NSString)uniqueName;
- (void)_kickCan;
- (void)cancel;
- (void)dealloc;
- (void)kickCanBySameTime;
- (void)kickCanByTime:(double)a3;
@end

@implementation MapsSuggestionsCanKicker

- (MapsSuggestionsCanKicker)initWithName:(id)a3 time:(double)a4 queue:(id)a5 block:(id)a6
{
  return [(MapsSuggestionsCanKicker *)self initWithName:a3 time:a5 leeway:a6 queue:a4 block:1.0];
}

- (MapsSuggestionsCanKicker)initWithName:(id)a3 time:(double)a4 leeway:(double)a5 queue:(id)a6 block:(id)a7
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  v15 = v14;
  if (!v12)
  {
    v16 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v33 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsCanKicker.m";
      __int16 v34 = 1024;
      int v35 = 48;
      __int16 v36 = 2082;
      v37 = "-[MapsSuggestionsCanKicker initWithName:time:leeway:queue:block:]";
      __int16 v38 = 2082;
      v39 = "nil == (name)";
      _os_log_impl(&dword_1A70DF000, v16, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a name", buf, 0x26u);
    }
    goto LABEL_23;
  }
  if (a4 < 0.0)
  {
    v16 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v33 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsCanKicker.m";
      __int16 v34 = 1024;
      int v35 = 49;
      __int16 v36 = 2082;
      v37 = "-[MapsSuggestionsCanKicker initWithName:time:leeway:queue:block:]";
      __int16 v38 = 2082;
      v39 = "time < 0.0";
      _os_log_impl(&dword_1A70DF000, v16, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a time in the future", buf, 0x26u);
    }
LABEL_23:

    v26 = 0;
    goto LABEL_24;
  }
  if (a5 < 0.0)
  {
    v16 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v33 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsCanKicker.m";
      __int16 v34 = 1024;
      int v35 = 50;
      __int16 v36 = 2082;
      v37 = "-[MapsSuggestionsCanKicker initWithName:time:leeway:queue:block:]";
      __int16 v38 = 2082;
      v39 = "leeway < 0.0";
      _os_log_impl(&dword_1A70DF000, v16, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a positive leeway", buf, 0x26u);
    }
    goto LABEL_23;
  }
  if (!v13)
  {
    v16 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v33 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsCanKicker.m";
      __int16 v34 = 1024;
      int v35 = 51;
      __int16 v36 = 2082;
      v37 = "-[MapsSuggestionsCanKicker initWithName:time:leeway:queue:block:]";
      __int16 v38 = 2082;
      v39 = "nil == (queue)";
      _os_log_impl(&dword_1A70DF000, v16, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a target queue to run the block on", buf, 0x26u);
    }
    goto LABEL_23;
  }
  if (!v14)
  {
    v16 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v33 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsCanKicker.m";
      __int16 v34 = 1024;
      int v35 = 52;
      __int16 v36 = 2082;
      v37 = "-[MapsSuggestionsCanKicker initWithName:time:leeway:queue:block:]";
      __int16 v38 = 2082;
      v39 = "nil == (block)";
      _os_log_impl(&dword_1A70DF000, v16, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a block", buf, 0x26u);
    }
    goto LABEL_23;
  }
  v31.receiver = self;
  v31.super_class = (Class)MapsSuggestionsCanKicker;
  v17 = [(MapsSuggestionsCanKicker *)&v31 init];
  if (v17)
  {
    uint64_t v18 = [v12 copy];
    name = v17->_name;
    v17->_name = (NSString *)v18;

    v17->_time = a4;
    v17->_leeway = a5;
    objc_storeStrong((id *)&v17->_targetQueue, a6);
    uint64_t v20 = [v15 copy];
    id block = v17->_block;
    v17->_id block = (id)v20;

    v17->_count = 0;
    objc_initWeak((id *)buf, v17);
    v22 = [MapsSuggestionsGCDTimer alloc];
    targetQueue = v17->_targetQueue;
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __65__MapsSuggestionsCanKicker_initWithName_time_leeway_queue_block___block_invoke;
    v28[3] = &unk_1E5CB8A98;
    objc_copyWeak(&v30, (id *)buf);
    id v29 = v15;
    uint64_t v24 = [(MapsSuggestionsGCDTimer *)v22 initWithName:@"CanKickerTimer" queue:targetQueue block:v28];
    timer = v17->_timer;
    v17->_timer = (MapsSuggestionsGCDTimer *)v24;

    objc_destroyWeak(&v30);
    objc_destroyWeak((id *)buf);
  }
  self = v17;
  v26 = self;
LABEL_24:

  return v26;
}

- (MapsSuggestionsCanKicker)initWithName:(id)a3 queue:(id)a4 block:(id)a5
{
  return [(MapsSuggestionsCanKicker *)self initWithName:a3 time:a4 queue:a5 block:0.0];
}

- (void)_kickCan
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    v1 = a1;
    objc_sync_enter(v1);
    v1[7] = (char *)v1[7] + 1;
    if (MapsSuggestionsLoggingIsVerbose_s_onceToken != -1) {
      dispatch_once(&MapsSuggestionsLoggingIsVerbose_s_onceToken, &__block_literal_global_29);
    }
    if (s_verbose)
    {
      GEOFindOrCreateLog();
      v2 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      {
        v3 = [v1 uniqueName];
        id v4 = v1[4];
        id v5 = v1[5];
        id v6 = v1[7];
        int v7 = 138413058;
        v8 = v3;
        __int16 v9 = 2048;
        id v10 = v4;
        __int16 v11 = 2048;
        id v12 = v5;
        __int16 v13 = 2048;
        id v14 = v6;
        _os_log_impl(&dword_1A70DF000, v2, OS_LOG_TYPE_DEBUG, "CanKicker{%@} kicked with time=%.2f leeway=%.2f count=%lu", (uint8_t *)&v7, 0x2Au);
      }
    }
    [v1[6] scheduleWithTimeInterval:*((double *)v1 + 4) leeway:*((double *)v1 + 5)];
    objc_sync_exit(v1);
  }
}

- (void)kickCanByTime:(double)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (a3 <= 0.0)
  {
    id v5 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v11 = 136446978;
      id v12 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsCanKicker.m";
      __int16 v13 = 1024;
      int v14 = 130;
      __int16 v15 = 2082;
      v16 = "-[MapsSuggestionsCanKicker kickCanByTime:]";
      __int16 v17 = 2082;
      uint64_t v18 = "time <= 0.0";
      id v6 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a time in the future.";
      goto LABEL_13;
    }
LABEL_14:

    return;
  }
  if (self->_leeway < 0.0)
  {
    id v5 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v11 = 136446978;
      id v12 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsCanKicker.m";
      __int16 v13 = 1024;
      int v14 = 131;
      __int16 v15 = 2082;
      v16 = "-[MapsSuggestionsCanKicker kickCanByTime:]";
      __int16 v17 = 2082;
      uint64_t v18 = "_leeway < 0.0";
      id v6 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a positive leeway.";
LABEL_13:
      _os_log_impl(&dword_1A70DF000, v5, OS_LOG_TYPE_ERROR, v6, (uint8_t *)&v11, 0x26u);
      goto LABEL_14;
    }
    goto LABEL_14;
  }
  int v7 = self;
  objc_sync_enter(v7);
  v7->_double time = a3;
  objc_sync_exit(v7);

  double time = v7->_time;
  if (time <= 0.0)
  {
    id v5 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v11 = 136446978;
      id v12 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsCanKicker.m";
      __int16 v13 = 1024;
      int v14 = 118;
      __int16 v15 = 2082;
      v16 = "-[MapsSuggestionsCanKicker kickCanByTime:leeway:]";
      __int16 v17 = 2082;
      uint64_t v18 = "time <= 0.0";
      id v6 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a time in the future.";
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  double leeway = self->_leeway;
  if (leeway < 0.0)
  {
    id v5 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v11 = 136446978;
      id v12 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsCanKicker.m";
      __int16 v13 = 1024;
      int v14 = 119;
      __int16 v15 = 2082;
      v16 = "-[MapsSuggestionsCanKicker kickCanByTime:leeway:]";
      __int16 v17 = 2082;
      uint64_t v18 = "leeway < 0.0";
      id v6 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a positive leeway.";
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  id v10 = v7;
  objc_sync_enter(v10);
  v7->_double time = time;
  self->_double leeway = leeway;
  objc_sync_exit(v10);

  -[MapsSuggestionsCanKicker _kickCan](v10);
}

- (void)kickCanBySameTime
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (self->_time <= 0.0)
  {
    v2 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      int v3 = 136446978;
      id v4 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsCanKicker.m";
      __int16 v5 = 1024;
      int v6 = 141;
      __int16 v7 = 2082;
      v8 = "-[MapsSuggestionsCanKicker kickCanBySameTime]";
      __int16 v9 = 2082;
      id v10 = "_time <= 0.0";
      _os_log_impl(&dword_1A70DF000, v2, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Either use initialize with a time or call kicking method with a time.", (uint8_t *)&v3, 0x26u);
    }
  }
  else
  {
    -[MapsSuggestionsCanKicker _kickCan](self);
  }
}

void __65__MapsSuggestionsCanKicker_initWithName_time_leeway_queue_block___block_invoke(uint64_t a1)
{
  *(void *)&v12[13] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  int v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    objc_sync_enter(v4);
    GEOFindOrCreateLog();
    __int16 v5 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      int v6 = [v4 uniqueName];
      uint64_t v7 = v4[7];
      int v9 = 138412546;
      id v10 = v6;
      __int16 v11 = 2048;
      *(void *)id v12 = v7;
      _os_log_impl(&dword_1A70DF000, v5, OS_LOG_TYPE_DEBUG, "CanKicker{%@} executes block (after %lu kicks)!", (uint8_t *)&v9, 0x16u);
    }
    v4[7] = 0;
    objc_sync_exit(v4);

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    GEOFindOrCreateLog();
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v9 = 136446722;
      id v10 = "MapsSuggestionsCanKicker.m";
      __int16 v11 = 1026;
      *(_DWORD *)id v12 = 67;
      v12[2] = 2082;
      *(void *)&v12[3] = "-[MapsSuggestionsCanKicker initWithName:time:leeway:queue:block:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v8, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v9, 0x1Cu);
    }
  }
}

- (void)dealloc
{
  [(MapsSuggestionsCanKicker *)self cancel];
  [(MapsSuggestionsGCDTimer *)self->_timer unschedule];
  timer = self->_timer;
  self->_timer = 0;

  v4.receiver = self;
  v4.super_class = (Class)MapsSuggestionsCanKicker;
  [(MapsSuggestionsCanKicker *)&v4 dealloc];
}

- (void)cancel
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = self;
  objc_sync_enter(v2);
  GEOFindOrCreateLog();
  int v3 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    objc_super v4 = [(MapsSuggestionsCanKicker *)v2 uniqueName];
    int v5 = 138412290;
    int v6 = v4;
    _os_log_impl(&dword_1A70DF000, v3, OS_LOG_TYPE_DEBUG, "CanKicker{%@} cancels", (uint8_t *)&v5, 0xCu);
  }
  [(MapsSuggestionsGCDTimer *)v2->_timer unschedule];
  objc_sync_exit(v2);
}

- (NSString)uniqueName
{
  return self->_name;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_targetQueue, 0);
}

@end