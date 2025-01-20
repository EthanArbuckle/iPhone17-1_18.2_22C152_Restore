@interface CalDAVMultiMoveWithFallbackTaskGroup
- (BOOL)isAutoScheduleSupported;
- (CalDAVMultiMoveWithFallbackTaskGroup)initWithSourceURLs:(id)a3 destinationURL:(id)a4 overwrite:(BOOL)a5 useFallback:(BOOL)a6 sourceEntityDataPayloads:(id)a7 sourceEntityDataContentTypes:(id)a8 sourceEntityETags:(id)a9 sourceEntityScheduleTags:(id)a10 accountInfoProvider:(id)a11 taskManager:(id)a12 isAutoScheduleSupported:(BOOL)a13;
- (NSDictionary)sourceEntityScheduleTags;
- (NSMutableDictionary)destinationEntityScheduleTags;
- (void)_completedPropFindTask:(id)a3 intermediateETag:(id)a4 intermediateScheduleTag:(id)a5 destinationFilename:(id)a6;
- (void)_setTagsForDestinationEntityAtURL:(id)a3 fromTaskResponseHeaders:(id)a4 completionBlock:(id)a5;
- (void)setDestinationEntityScheduleTags:(id)a3;
- (void)setIsAutoScheduleSupported:(BOOL)a3;
- (void)setSourceEntityScheduleTags:(id)a3;
@end

@implementation CalDAVMultiMoveWithFallbackTaskGroup

- (CalDAVMultiMoveWithFallbackTaskGroup)initWithSourceURLs:(id)a3 destinationURL:(id)a4 overwrite:(BOOL)a5 useFallback:(BOOL)a6 sourceEntityDataPayloads:(id)a7 sourceEntityDataContentTypes:(id)a8 sourceEntityETags:(id)a9 sourceEntityScheduleTags:(id)a10 accountInfoProvider:(id)a11 taskManager:(id)a12 isAutoScheduleSupported:(BOOL)a13
{
  BOOL v14 = a6;
  BOOL v15 = a5;
  id v27 = a10;
  v28.receiver = self;
  v28.super_class = (Class)CalDAVMultiMoveWithFallbackTaskGroup;
  v19 = [(CoreDAVMultiMoveWithFallbackTaskGroup *)&v28 initWithSourceURLs:a3 destinationURL:a4 overwrite:v15 useFallback:v14 sourceEntityDataPayloads:a7 sourceEntityDataContentTypes:a8 sourceEntityETags:a9 accountInfoProvider:a11 taskManager:a12];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_sourceEntityScheduleTags, a10);
    v20->_isAutoScheduleSupported = a13;
    v21 = (void *)MEMORY[0x263EFF9A0];
    v22 = [(CoreDAVMultiMoveWithFallbackTaskGroup *)v20 sourceURLs];
    uint64_t v23 = objc_msgSend(v21, "dictionaryWithCapacity:", objc_msgSend(v22, "count"));
    destinationEntityScheduleTags = v20->_destinationEntityScheduleTags;
    v20->_destinationEntityScheduleTags = (NSMutableDictionary *)v23;
  }
  return v20;
}

- (void)_setTagsForDestinationEntityAtURL:(id)a3 fromTaskResponseHeaders:(id)a4 completionBlock:(id)a5
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  v29 = (void (**)(void))a5;
  objc_super v28 = [(CoreDAVMultiMoveWithFallbackTaskGroup *)self filenameFromURL:v8];
  id v27 = [(CoreDAVMultiMoveWithFallbackTaskGroup *)self _eTagFromTaskResponseHeaders:v9];
  v10 = [v9 CDVObjectForKeyCaseInsensitive:@"schedule-tag"];
  v11 = [MEMORY[0x263F34B30] sharedLogging];
  v12 = (id *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x263F34C60]);
  id WeakRetained = objc_loadWeakRetained(v12);
  BOOL v14 = [v11 logHandleForAccountInfoProvider:WeakRetained];

  if (v10)
  {
    if (v14 && os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v40 = v27;
      _os_log_impl(&dword_213CEC000, v14, OS_LOG_TYPE_INFO, "[multi-move] ~ Response included etag %{public}@, but we're ignoring it and nilling etag because we got a schedule-tag.", buf, 0xCu);
    }

    BOOL v15 = [(CalDAVMultiMoveWithFallbackTaskGroup *)self destinationEntityScheduleTags];
    [v15 setObject:v10 forKey:v28];

    v16 = [MEMORY[0x263F34B30] sharedLogging];
    id v17 = objc_loadWeakRetained(v12);
    v18 = [v16 logHandleForAccountInfoProvider:v17];

    if (v18 && os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_213CEC000, v18, OS_LOG_TYPE_INFO, "[multi-move] ~ Finished setting tags for moved CalDAV entity", buf, 2u);
    }

    if (v29) {
      v29[2]();
    }
  }
  else
  {
    if (v14 && os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_213CEC000, v14, OS_LOG_TYPE_INFO, "[multi-move] ~ No schedule-tag returned! PROPFINDing for the etag/schedule-tag...", buf, 2u);
    }

    v19 = (void *)[objc_alloc(MEMORY[0x263EFF9C0]) initWithCapacity:2];
    id v20 = objc_alloc(MEMORY[0x263F34B00]);
    v21 = (void *)[v20 initWithNameSpace:*MEMORY[0x263F34E10] name:*MEMORY[0x263F34E38] parseClass:objc_opt_class()];
    [v19 addObject:v21];
    if ([(CalDAVMultiMoveWithFallbackTaskGroup *)self isAutoScheduleSupported])
    {
      id v22 = objc_alloc(MEMORY[0x263F34B00]);
      uint64_t v23 = (void *)[v22 initWithNameSpace:*MEMORY[0x263F34CD8] name:@"schedule-tag" parseClass:objc_opt_class()];
      [v19 addObject:v23];
    }
    v24 = (void *)[objc_alloc(MEMORY[0x263F34B80]) initWithPropertiesToFind:v19 atURL:v8 withDepth:2];
    v25 = [(CoreDAVTaskGroup *)self accountInfoProvider];
    [v24 setAccountInfoProvider:v25];

    objc_initWeak((id *)buf, self);
    objc_initWeak(&location, v24);
    v30[0] = MEMORY[0x263EF8330];
    v30[1] = 3221225472;
    v30[2] = __114__CalDAVMultiMoveWithFallbackTaskGroup__setTagsForDestinationEntityAtURL_fromTaskResponseHeaders_completionBlock___block_invoke;
    v30[3] = &unk_2641EC420;
    objc_copyWeak(&v36, (id *)buf);
    objc_copyWeak(&v37, &location);
    id v31 = v27;
    id v32 = 0;
    id v33 = v28;
    v34 = self;
    v35 = v29;
    [v24 setCompletionBlock:v30];
    [*(id *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x263F34C70]) addObject:v24];
    v26 = [(CoreDAVTaskGroup *)self taskManager];
    [v26 submitQueuedCoreDAVTask:v24];

    objc_destroyWeak(&v37);
    objc_destroyWeak(&v36);
    objc_destroyWeak(&location);
    objc_destroyWeak((id *)buf);
  }
}

uint64_t __114__CalDAVMultiMoveWithFallbackTaskGroup__setTagsForDestinationEntityAtURL_fromTaskResponseHeaders_completionBlock___block_invoke(uint64_t a1)
{
  v2 = (id *)(a1 + 72);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  v4 = [WeakRetained outstandingTasks];
  id v5 = objc_loadWeakRetained((id *)(a1 + 80));
  [v4 removeObject:v5];

  id v6 = objc_loadWeakRetained(v2);
  id v7 = objc_loadWeakRetained((id *)(a1 + 80));
  [v6 _completedPropFindTask:v7 intermediateETag:*(void *)(a1 + 32) intermediateScheduleTag:*(void *)(a1 + 40) destinationFilename:*(void *)(a1 + 48)];

  id v8 = [MEMORY[0x263F34B30] sharedLogging];
  id v9 = objc_loadWeakRetained((id *)(*(void *)(a1 + 56) + (int)*MEMORY[0x263F34C60]));
  v10 = [v8 logHandleForAccountInfoProvider:v9];

  if (v10 && os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_213CEC000, v10, OS_LOG_TYPE_INFO, "[multi-move] ~ Finished setting tags for moved CalDAV entity", v12, 2u);
  }

  uint64_t result = *(void *)(a1 + 64);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_completedPropFindTask:(id)a3 intermediateETag:(id)a4 intermediateScheduleTag:(id)a5 destinationFilename:(id)a6
{
  uint64_t v69 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v66 = a6;
  v11 = [MEMORY[0x263F34B30] sharedLogging];
  v12 = (id *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x263F34C60]);
  id WeakRetained = objc_loadWeakRetained(v12);
  BOOL v14 = [v11 logHandleForAccountInfoProvider:WeakRetained];

  if (v14 && os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136446210;
    v68 = "-[CalDAVMultiMoveWithFallbackTaskGroup _completedPropFindTask:intermediateETag:intermediateScheduleTag:destinationFilename:]";
    _os_log_impl(&dword_213CEC000, v14, OS_LOG_TYPE_INFO, "[multi-move] ~ %{public}s", buf, 0xCu);
  }

  BOOL v15 = [v9 error];
  v16 = [MEMORY[0x263F34B30] sharedLogging];
  id v17 = objc_loadWeakRetained(v12);
  v18 = [v16 logHandleForAccountInfoProvider:v17];

  if (v15)
  {
    if (v18 && os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_213CEC000, v18, OS_LOG_TYPE_DEFAULT, "[multi-move] ~ Error during PROPFIND.", buf, 2u);
    }

    v19 = [MEMORY[0x263F34B30] sharedLogging];
    id v20 = objc_loadWeakRetained(v12);
    v21 = [v19 logHandleForAccountInfoProvider:v20];

    id v22 = v66;
    if (v21 && os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v68 = v15;
      _os_log_impl(&dword_213CEC000, v21, OS_LOG_TYPE_DEFAULT, "[multi-move] ~ %@;", buf, 0xCu);
    }

    uint64_t v23 = [MEMORY[0x263F34B30] sharedLogging];
    id v24 = objc_loadWeakRetained(v12);
    v25 = [v23 logHandleForAccountInfoProvider:v24];

    if (v25 && os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_213CEC000, v25, OS_LOG_TYPE_DEFAULT, "[multi-move] ~ Returing ETag and ScheduleTag of nil", buf, 2u);
    }
    goto LABEL_75;
  }
  if (v18 && os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_213CEC000, v18, OS_LOG_TYPE_INFO, "[multi-move] ~ PROPFIND success", buf, 2u);
  }

  uint64_t v23 = [v9 responseHeaders];

  v65 = v10;
  if (!v23)
  {
    v25 = 0;
LABEL_45:
    v48 = @"No ETag found by PROPFIND";
    goto LABEL_46;
  }
  v26 = [v9 responseHeaders];
  uint64_t v23 = [v26 CDVObjectForKeyCaseInsensitive:*MEMORY[0x263F34A60]];

  if (v23)
  {
    id v27 = [MEMORY[0x263F34B30] sharedLogging];
    id v28 = objc_loadWeakRetained(v12);
    v29 = [v27 logHandleForAccountInfoProvider:v28];

    if (v29 && os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v68 = (const char *)v23;
      _os_log_impl(&dword_213CEC000, v29, OS_LOG_TYPE_INFO, "[multi-move] ~ found etag node: %{public}@", buf, 0xCu);
    }

    id v30 = v23;
    id v10 = v65;
  }
  id v31 = [v9 responseHeaders];
  v25 = [v31 CDVObjectForKeyCaseInsensitive:@"schedule-tag"];

  if (v25)
  {
    id v32 = [MEMORY[0x263F34B30] sharedLogging];
    id v33 = objc_loadWeakRetained(v12);
    v34 = [v32 logHandleForAccountInfoProvider:v33];

    if (v34 && os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v68 = (const char *)v25;
      _os_log_impl(&dword_213CEC000, v34, OS_LOG_TYPE_INFO, "[multi-move] ~ found scheduleTag node: %{public}@", buf, 0xCu);
    }

    v35 = v25;
    id v10 = v65;
  }

  if (!v23) {
    goto LABEL_45;
  }
  if (!v10 || [v23 isEqualToString:v10])
  {
    id v36 = [(CoreDAVMultiMoveWithFallbackTaskGroup *)self sourceEntityETags];
    id v22 = v66;
    v64 = [v36 objectForKey:v66];

    if (![v23 length] && !v25) {
      goto LABEL_74;
    }
    id v37 = [MEMORY[0x263F34B30] sharedLogging];
    id v38 = objc_loadWeakRetained(v12);
    v39 = [v37 logHandleForAccountInfoProvider:v38];

    if (v39 && os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_213CEC000, v39, OS_LOG_TYPE_INFO, "[multi-move] ~ Setting etag return value.", buf, 2u);
    }

    v40 = [(CoreDAVMultiMoveWithFallbackTaskGroup *)self destinationEntityETags];
    id v22 = v66;
    [v40 setObject:v23 forKey:v66];

    if (v25)
    {
      uint64_t v41 = [MEMORY[0x263F34B30] sharedLogging];
      id v42 = objc_loadWeakRetained(v12);
      v43 = [v41 logHandleForAccountInfoProvider:v42];

      if (v43 && os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_213CEC000, v43, OS_LOG_TYPE_INFO, "[multi-move] ~ We got a scheduleTag, so ignoring etag", buf, 2u);
      }

      v44 = [MEMORY[0x263F34B30] sharedLogging];
      id v45 = objc_loadWeakRetained(v12);
      v46 = [v44 logHandleForAccountInfoProvider:v45];

      if (v46 && os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_213CEC000, v46, OS_LOG_TYPE_INFO, "[multi-move] ~ Setting scheduleTag return value.", buf, 2u);
      }

      v47 = [(CalDAVMultiMoveWithFallbackTaskGroup *)self destinationEntityScheduleTags];
      id v22 = v66;
      [v47 setObject:v25 forKey:v66];
      id v10 = v65;
      goto LABEL_73;
    }
    if ([v64 isEqualToString:v23])
    {
      v47 = [MEMORY[0x263F34B30] sharedLogging];
      id v55 = objc_loadWeakRetained(v12);
      v56 = [v47 logHandleForAccountInfoProvider:v55];

      id v10 = v65;
      if (!v56 || !os_log_type_enabled(v56, OS_LOG_TYPE_INFO)) {
        goto LABEL_72;
      }
      *(_DWORD *)buf = 138543362;
      v68 = v64;
      v57 = "[multi-move] ~ Resulting etag is unchanged from original: %{public}@";
      v58 = v56;
      os_log_type_t v59 = OS_LOG_TYPE_INFO;
      uint32_t v60 = 12;
LABEL_71:
      _os_log_impl(&dword_213CEC000, v58, v59, v57, buf, v60);
LABEL_72:

LABEL_73:
LABEL_74:

      goto LABEL_75;
    }
    id v10 = v65;
    if (v65)
    {
      int v61 = [v65 isEqualToString:v23];
      v47 = [MEMORY[0x263F34B30] sharedLogging];
      id v62 = objc_loadWeakRetained(v12);
      v56 = [v47 logHandleForAccountInfoProvider:v62];

      if (!v61)
      {
        id v22 = v66;
        if (!v56 || !os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_72;
        }
        *(_WORD *)buf = 0;
        v57 = "[multi-move] After MOVE and PROPFIND: something is wrong, there's no new etag, there's no schedule tag";
        v58 = v56;
        os_log_type_t v59 = OS_LOG_TYPE_DEFAULT;
        goto LABEL_70;
      }
      id v22 = v66;
      if (!v56 || !os_log_type_enabled(v56, OS_LOG_TYPE_INFO)) {
        goto LABEL_72;
      }
      *(_WORD *)buf = 0;
      v57 = "[multi-move] ~ New etag differs from old etag -- MOVE returned an ETag and PROPFIND gave us the same one.";
    }
    else
    {
      v47 = [MEMORY[0x263F34B30] sharedLogging];
      id v63 = objc_loadWeakRetained(v12);
      v56 = [v47 logHandleForAccountInfoProvider:v63];

      if (!v56 || !os_log_type_enabled(v56, OS_LOG_TYPE_INFO)) {
        goto LABEL_72;
      }
      *(_WORD *)buf = 0;
      v57 = "[multi-move] ~ New etag differs from old etag -- MOVE returned no ETag, but PROPFIND gave us a good new value.";
    }
    v58 = v56;
    os_log_type_t v59 = OS_LOG_TYPE_INFO;
LABEL_70:
    uint32_t v60 = 2;
    goto LABEL_71;
  }
  v48 = @"New ETag found by PROPFIND didn't match non-nil intermediate ETag returned by MOVE";
LABEL_46:
  v49 = [MEMORY[0x263F34B30] sharedLogging];
  id v50 = objc_loadWeakRetained(v12);
  v51 = [v49 logHandleForAccountInfoProvider:v50];

  if (v51 && os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v68 = (const char *)v48;
    _os_log_impl(&dword_213CEC000, v51, OS_LOG_TYPE_DEFAULT, "[multi-move] ~ %{public}@", buf, 0xCu);
  }

  v52 = [MEMORY[0x263F34B30] sharedLogging];
  id v53 = objc_loadWeakRetained(v12);
  v54 = [v52 logHandleForAccountInfoProvider:v53];

  if (v54 && os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_213CEC000, v54, OS_LOG_TYPE_DEFAULT, "[multi-move] ~ Returing ETag and ScheduleTag of nil", buf, 2u);
  }

  id v10 = v65;
  id v22 = v66;
LABEL_75:
}

- (NSDictionary)sourceEntityScheduleTags
{
  return self->_sourceEntityScheduleTags;
}

- (void)setSourceEntityScheduleTags:(id)a3
{
}

- (BOOL)isAutoScheduleSupported
{
  return self->_isAutoScheduleSupported;
}

- (void)setIsAutoScheduleSupported:(BOOL)a3
{
  self->_isAutoScheduleSupported = a3;
}

- (NSMutableDictionary)destinationEntityScheduleTags
{
  return self->_destinationEntityScheduleTags;
}

- (void)setDestinationEntityScheduleTags:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destinationEntityScheduleTags, 0);
  objc_storeStrong((id *)&self->_sourceEntityScheduleTags, 0);
}

@end