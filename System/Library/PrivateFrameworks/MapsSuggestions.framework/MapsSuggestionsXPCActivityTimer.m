@interface MapsSuggestionsXPCActivityTimer
- (MapsSuggestionsXPCActivityTimer)initWithName:(id)a3 estimatedDownload:(unint64_t)a4 estimatedUpload:(unint64_t)a5 queue:(id)a6 block:(id)a7;
- (MapsSuggestionsXPCActivityTimer)initWithName:(id)a3 queue:(id)a4 block:(id)a5;
- (NSString)description;
- (id)objectForJSON;
- (void)scheduleWithInterval:(Duration)a3 leeway:(Duration)a4;
- (void)scheduleWithInterval:(Duration)a3 repeatAfter:(Duration)a4 leeway:(Duration)a5;
- (void)scheduleWithTimeInterval:(double)a3 leeway:(double)a4;
- (void)scheduleWithTimeInterval:(double)a3 repeatAfter:(double)a4 leeway:(double)a5;
- (void)unschedule;
@end

@implementation MapsSuggestionsXPCActivityTimer

- (MapsSuggestionsXPCActivityTimer)initWithName:(id)a3 estimatedDownload:(unint64_t)a4 estimatedUpload:(unint64_t)a5 queue:(id)a6 block:(id)a7
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  v15 = v14;
  if (!v12)
  {
    v23 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v27 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsXPCActivityTimer.mm";
      __int16 v28 = 1024;
      int v29 = 41;
      __int16 v30 = 2082;
      v31 = "-[MapsSuggestionsXPCActivityTimer initWithName:estimatedDownload:estimatedUpload:queue:block:]";
      __int16 v32 = 2082;
      v33 = "nil == (name)";
      _os_log_impl(&dword_1A70DF000, v23, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Name cannot be nil", buf, 0x26u);
    }
    goto LABEL_15;
  }
  if (!v13)
  {
    v23 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v27 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsXPCActivityTimer.mm";
      __int16 v28 = 1024;
      int v29 = 42;
      __int16 v30 = 2082;
      v31 = "-[MapsSuggestionsXPCActivityTimer initWithName:estimatedDownload:estimatedUpload:queue:block:]";
      __int16 v32 = 2082;
      v33 = "nil == (queue)";
      _os_log_impl(&dword_1A70DF000, v23, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Queue cannot be nil", buf, 0x26u);
    }
    goto LABEL_15;
  }
  if (!v14)
  {
    v23 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v27 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsXPCActivityTimer.mm";
      __int16 v28 = 1024;
      int v29 = 43;
      __int16 v30 = 2082;
      v31 = "-[MapsSuggestionsXPCActivityTimer initWithName:estimatedDownload:estimatedUpload:queue:block:]";
      __int16 v32 = 2082;
      v33 = "nil == (block)";
      _os_log_impl(&dword_1A70DF000, v23, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Block cannot be nil", buf, 0x26u);
    }
LABEL_15:

    v22 = 0;
    goto LABEL_16;
  }
  v25.receiver = self;
  v25.super_class = (Class)MapsSuggestionsXPCActivityTimer;
  v16 = [(MapsSuggestionsBaseTrigger *)&v25 initWithName:v12 queue:v13];
  v17 = v16;
  if (v16)
  {
    v16->_estimatedDownloadInBytes = a4;
    v16->_estimatedUploadInBytes = a5;
    v18 = _Block_copy(v15);
    id block = v17->_block;
    v17->_id block = v18;

    uint64_t v20 = [@"com.apple." stringByAppendingString:v12];
    activityIdentifier = v17->_activityIdentifier;
    v17->_activityIdentifier = (NSString *)v20;
  }
  self = v17;
  v22 = self;
LABEL_16:

  return v22;
}

- (MapsSuggestionsXPCActivityTimer)initWithName:(id)a3 queue:(id)a4 block:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t Integer = GEOConfigGetInteger();
  id v12 = [(MapsSuggestionsXPCActivityTimer *)self initWithName:v8 estimatedDownload:Integer estimatedUpload:GEOConfigGetInteger() queue:v9 block:v10];

  return v12;
}

- (void)scheduleWithTimeInterval:(double)a3 leeway:(double)a4
{
  v6 = [(MapsSuggestionsBaseTrigger *)self dispatchQueue];
  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __67__MapsSuggestionsXPCActivityTimer_scheduleWithTimeInterval_leeway___block_invoke;
  v8[3] = &unk_1E5CB7E50;
  objc_copyWeak(v10, &location);
  v10[1] = *(id *)&a3;
  id v9 = v6;
  v7 = v6;
  dispatch_async(v7, v8);

  objc_destroyWeak(v10);
  objc_destroyWeak(&location);
}

void __67__MapsSuggestionsXPCActivityTimer_scheduleWithTimeInterval_leeway___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v2 = (id *)(a1 + 40);
  WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v4 = MapsSuggestionsNowWithOffset(*(double *)(a1 + 48));
    v5 = (void *)*((void *)WeakRetained + 7);
    *((void *)WeakRetained + 7) = v4;

    v6 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v20 = WeakRetained;
      _os_log_impl(&dword_1A70DF000, v6, OS_LOG_TYPE_DEBUG, "Scheduling Background Systems Task: %@", buf, 0xCu);
    }

    v7 = [MEMORY[0x1E4F4F440] sharedScheduler];
    [v7 deregisterTaskWithIdentifier:*((void *)WeakRetained + 5)];

    id v8 = [objc_alloc(MEMORY[0x1E4F4F418]) initWithIdentifier:*((void *)WeakRetained + 5)];
    [v8 setScheduleAfter:*(double *)(a1 + 48)];
    [v8 setRequiresExternalPower:0];
    [v8 setPowerBudgeted:1];
    [v8 setShouldWakeDevice:1];
    [v8 setPriority:2];
    [v8 setRequiresNetworkConnectivity:1];
    [v8 setRequiresInexpensiveNetworkConnectivity:0];
    [v8 setNetworkDownloadSize:*((void *)WeakRetained + 8)];
    [v8 setNetworkUploadSize:*((void *)WeakRetained + 9)];
    id v9 = [MEMORY[0x1E4F4F440] sharedScheduler];
    uint64_t v10 = *((void *)WeakRetained + 5);
    uint64_t v11 = *(void *)(a1 + 32);
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __67__MapsSuggestionsXPCActivityTimer_scheduleWithTimeInterval_leeway___block_invoke_121;
    v17[3] = &unk_1E5CB7E28;
    objc_copyWeak(&v18, v2);
    [v9 registerForTaskWithIdentifier:v10 usingQueue:v11 launchHandler:v17];

    id v12 = [MEMORY[0x1E4F4F440] sharedScheduler];
    id v16 = 0;
    LOBYTE(v10) = [v12 submitTaskRequest:v8 error:&v16];
    id v13 = (__CFString *)v16;

    if ((v10 & 1) == 0)
    {
      id v14 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v15 = @"Unknown";
        if (v13) {
          v15 = v13;
        }
        *(_DWORD *)buf = 138412290;
        uint64_t v20 = (char *)v15;
        _os_log_impl(&dword_1A70DF000, v14, OS_LOG_TYPE_ERROR, "Failed to submit task with error: %@", buf, 0xCu);
      }
    }
    objc_destroyWeak(&v18);
  }
  else
  {
    GEOFindOrCreateLog();
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      uint64_t v20 = "MapsSuggestionsXPCActivityTimer.mm";
      __int16 v21 = 1026;
      int v22 = 75;
      __int16 v23 = 2082;
      v24 = "-[MapsSuggestionsXPCActivityTimer scheduleWithTimeInterval:leeway:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v8, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }
  }
}

void __67__MapsSuggestionsXPCActivityTimer_scheduleWithTimeInterval_leeway___block_invoke_121(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v6 = *((void *)WeakRetained + 4);
    if (v6) {
      (*(void (**)(void))(v6 + 16))();
    }
    [v3 setTaskCompleted];
  }
  else
  {
    GEOFindOrCreateLog();
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136446722;
      id v9 = "MapsSuggestionsXPCActivityTimer.mm";
      __int16 v10 = 1026;
      int v11 = 104;
      __int16 v12 = 2082;
      id v13 = "-[MapsSuggestionsXPCActivityTimer scheduleWithTimeInterval:leeway:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v7, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf1 went away in %{public}s", (uint8_t *)&v8, 0x1Cu);
    }
  }
}

- (void)scheduleWithTimeInterval:(double)a3 repeatAfter:(double)a4 leeway:(double)a5
{
}

- (void)unschedule
{
  objc_initWeak(&location, self);
  id v3 = [(MapsSuggestionsBaseTrigger *)self dispatchQueue];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __45__MapsSuggestionsXPCActivityTimer_unschedule__block_invoke;
  v4[3] = &unk_1E5CB7E78;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __45__MapsSuggestionsXPCActivityTimer_unschedule__block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      int v4 = 138412290;
      id v5 = WeakRetained;
      _os_log_impl(&dword_1A70DF000, v2, OS_LOG_TYPE_DEBUG, "Unscheduling XPC timer: %@", (uint8_t *)&v4, 0xCu);
    }

    id v3 = [MEMORY[0x1E4F4F440] sharedScheduler];
    [v3 deregisterTaskWithIdentifier:*((void *)WeakRetained + 5)];
  }
  else
  {
    GEOFindOrCreateLog();
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v4 = 136446722;
      id v5 = "MapsSuggestionsXPCActivityTimer.mm";
      __int16 v6 = 1026;
      int v7 = 128;
      __int16 v8 = 2082;
      id v9 = "-[MapsSuggestionsXPCActivityTimer unschedule]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v3, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v4, 0x1Cu);
    }
  }
}

- (void)scheduleWithInterval:(Duration)a3 leeway:(Duration)a4
{
}

- (void)scheduleWithInterval:(Duration)a3 repeatAfter:(Duration)a4 leeway:(Duration)a5
{
}

- (NSString)description
{
  v2 = [(MapsSuggestionsXPCActivityTimer *)self objectForJSON];
  id v3 = NSStringFromMapsSuggestionsJSON(v2, 1u);

  return (NSString *)v3;
}

- (id)objectForJSON
{
  id v3 = [(MapsSuggestionsBaseTrigger *)self dispatchQueue];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  id v10[2] = __48__MapsSuggestionsXPCActivityTimer_objectForJSON__block_invoke;
  v10[3] = &unk_1E5CB7EA0;
  v10[4] = self;
  int v4 = v10;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__1;
  uint64_t v20 = __Block_byref_object_dispose__1;
  id v21 = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  __int16 v12 = ___ZN3MSg26dispatch_sync_if_differentIU8__strongP12NSDictionaryEET_PU28objcproto17OS_dispatch_queue8NSObjectU13block_pointerFS4_vE_block_invoke;
  id v13 = &unk_1E5CB7EC8;
  v15 = &v16;
  id v5 = v4;
  id v14 = v5;
  label = dispatch_queue_get_label(v3);
  if (label == dispatch_queue_get_label(0))
  {
    int v7 = (void *)MEMORY[0x1AD0C8E80]();
    v12((uint64_t)block);
  }
  else
  {
    dispatch_sync(v3, block);
  }
  id v8 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  return v8;
}

id __48__MapsSuggestionsXPCActivityTimer_objectForJSON__block_invoke(uint64_t a1)
{
  v13[3] = *MEMORY[0x1E4F143B8];
  v12[0] = @"name";
  v2 = [*(id *)(a1 + 32) uniqueName];
  id v3 = MSg::jsonFor(v2);
  v13[0] = v3;
  v12[1] = @"activityIdentifier";
  int v4 = MSg::jsonFor(*(void **)(*(void *)(a1 + 32) + 40));
  v13[1] = v4;
  v12[2] = @"firesInSec";
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void *)(v5 + 56);
  if (v6)
  {
    double v7 = MapsSuggestionsSecondsTo(*(void **)(v5 + 56));
    id v9 = MSg::jsonFor(v8, v7);
  }
  else
  {
    id v9 = &unk_1EFC89738;
  }
  v13[2] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:3];
  if (v6) {

  }
  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_firesAt, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_activityIdentifier, 0);
  objc_storeStrong(&self->_block, 0);
}

@end