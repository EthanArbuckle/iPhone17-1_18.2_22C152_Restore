@interface ATXClipboardContents
+ (void)_observeLocalPasteboard;
- (ATXClipboardContents)contentsWithCallback:(id)a3;
- (ATXClipboardContents)initWithDevice:(id)a3;
- (ATXClipboardContents)initWithDevice:(id)a3 pasteboardConnection:(id)a4;
@end

@implementation ATXClipboardContents

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pasteboardServerConnection, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

void __45__ATXClipboardContents_contentsWithCallback___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v7 = __atxlog_handle_heuristic();
  v8 = v7;
  if (!v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __45__ATXClipboardContents_contentsWithCallback___block_invoke_cold_1((uint64_t)v6, v8);
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a3);
    goto LABEL_33;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __47__ATXClipboardContents__observeLocalPasteboard__block_invoke_34_cold_1(v5);
  }

  if (sLastPasteboardChangeCount)
  {
    uint64_t v9 = [v5 changeCount];
    if (v9 == [(id)sLastPasteboardChangeCount integerValue])
    {
      if (sLastPasteboardContents
        && ([(id)sLastPasteboardContents creationDate],
            v10 = objc_claimAutoreleasedReturnValue(),
            [v10 timeIntervalSinceNow],
            double v12 = fabs(v11),
            v10,
            v12 < 1800.0))
      {
        v13 = __atxlog_handle_heuristic();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D0F43000, v13, OS_LOG_TYPE_DEFAULT, "Local pasteboard has not changed. Returning early with cached clipboard contents.", buf, 2u);
        }

        uint64_t v14 = *(void *)(*(void *)(a1 + 56) + 8);
        id v15 = (id)sLastPasteboardContents;
        v16 = *(void **)(v14 + 40);
        *(void *)(v14 + 40) = v15;
      }
      else
      {
        v42 = __atxlog_handle_heuristic();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D0F43000, v42, OS_LOG_TYPE_DEFAULT, "Local pasteboard has not changed. The clipboard contents are too old.", buf, 2u);
        }

        v16 = (void *)sLastPasteboardContents;
        sLastPasteboardContents = 0;
      }

LABEL_33:
      dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
      goto LABEL_34;
    }
  }
  uint64_t v17 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v5, "changeCount"));
  v18 = (void *)sLastPasteboardChangeCount;
  sLastPasteboardChangeCount = v17;

  v19 = __atxlog_handle_heuristic();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    uint64_t v20 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138412546;
    uint64_t v56 = sLastPasteboardChangeCount;
    __int16 v57 = 2112;
    uint64_t v58 = v20;
    _os_log_impl(&dword_1D0F43000, v19, OS_LOG_TYPE_INFO, "sLastPasteboardChangeCount is now: %@ - %@", buf, 0x16u);
  }

  uint64_t v21 = [v5 originatorBundleID];
  if (v21)
  {
    v22 = (void *)v21;
    v23 = [v5 originatorBundleID];
    v54 = v23;
    v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v54 count:1];
    char CanLearnFromApp = ATXHeuristicCanLearnFromApp(v24);

    if ((CanLearnFromApp & 1) == 0) {
      goto LABEL_33;
    }
  }
  v26 = [v5 items];
  v27 = [v26 firstObject];

  v28 = [(id)*MEMORY[0x1E4F444F8] identifier];
  v53[0] = v28;
  v29 = [(id)*MEMORY[0x1E4F44510] identifier];
  v53[1] = v29;
  v30 = [(id)*MEMORY[0x1E4F44508] identifier];
  v53[2] = v30;
  v31 = [(id)*MEMORY[0x1E4F444F0] identifier];
  v53[3] = v31;
  v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:v53 count:4];

  v33 = (void *)sLastPasteboardContents;
  sLastPasteboardContents = 0;

  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id v34 = v32;
  uint64_t v35 = [v34 countByEnumeratingWithState:&v48 objects:v52 count:16];
  if (v35)
  {
    uint64_t v36 = v35;
    uint64_t v37 = *(void *)v49;
    while (2)
    {
      for (uint64_t i = 0; i != v36; ++i)
      {
        if (*(void *)v49 != v37) {
          objc_enumerationMutation(v34);
        }
        uint64_t v39 = *(void *)(*((void *)&v48 + 1) + 8 * i);
        if ([v27 hasRepresentationConformingToType:v39])
        {
          v40 = [v27 representationConformingToType:v39];
          v43[0] = MEMORY[0x1E4F143A8];
          v43[1] = 3221225472;
          v43[2] = __45__ATXClipboardContents_contentsWithCallback___block_invoke_42;
          v43[3] = &unk_1E68A5388;
          id v44 = v5;
          uint64_t v45 = v39;
          int8x16_t v47 = vextq_s8(*(int8x16_t *)(a1 + 48), *(int8x16_t *)(a1 + 48), 8uLL);
          id v46 = *(id *)(a1 + 32);
          id v41 = (id)[v40 loadDataWithCompletion:v43];

          goto LABEL_28;
        }
      }
      uint64_t v36 = [v34 countByEnumeratingWithState:&v48 objects:v52 count:16];
      if (v36) {
        continue;
      }
      break;
    }
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
LABEL_28:

LABEL_34:
}

- (ATXClipboardContents)initWithDevice:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F881F0];
  id v5 = a3;
  id v6 = [v4 defaultConnection];
  v7 = [(ATXClipboardContents *)self initWithDevice:v5 pasteboardConnection:v6];

  return v7;
}

- (ATXClipboardContents)initWithDevice:(id)a3 pasteboardConnection:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ATXClipboardContents;
  uint64_t v9 = [(ATXClipboardContents *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_device, a3);
    objc_storeStrong((id *)&v10->_pasteboardServerConnection, a4);
    [(id)objc_opt_class() _observeLocalPasteboard];
  }

  return v10;
}

- (ATXClipboardContents)contentsWithCallback:(id)a3
{
  v4 = (void (**)(id, void *, void *, void *, void))a3;
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__9;
  v31 = __Block_byref_object_dispose__9;
  id v32 = 0;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__9;
  v25 = __Block_byref_object_dispose__9;
  id v26 = 0;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  pasteboardServerConnection = self->_pasteboardServerConnection;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __45__ATXClipboardContents_contentsWithCallback___block_invoke;
  v16[3] = &unk_1E68A53B0;
  v19 = &v21;
  id v7 = v5;
  uint64_t v20 = &v27;
  uint64_t v17 = v7;
  v18 = self;
  [(PBServerConnection *)pasteboardServerConnection localGeneralPasteboardCompletionBlock:v16];
  if ([MEMORY[0x1E4F93B18] waitForSemaphore:v7 timeoutSeconds:5.0] == 1)
  {
    id v8 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:1 userInfo:MEMORY[0x1E4F1CC08]];
    uint64_t v9 = __atxlog_handle_heuristic();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v15[0] = 0;
      _os_log_impl(&dword_1D0F43000, v9, OS_LOG_TYPE_DEFAULT, "Getting pasteboard contents timed out", (uint8_t *)v15, 2u);
    }

    if (!v8) {
      goto LABEL_9;
    }
  }
  else
  {
    v10 = (void *)v22[5];
    if (!v10)
    {
LABEL_9:
      double v11 = [(id)v28[5] content];
      objc_super v12 = [(id)v28[5] creationDate];
      v13 = [(id)v28[5] originatorBundleId];
      v4[2](v4, v11, v12, v13, 0);

      id v8 = 0;
      goto LABEL_10;
    }
    id v8 = v10;
  }
  ((void (**)(id, void *, void *, void *, id))v4)[2](v4, 0, 0, 0, v8);
LABEL_10:

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);

  return result;
}

+ (void)_observeLocalPasteboard
{
  if (_observeLocalPasteboard_onceToken != -1) {
    dispatch_once(&_observeLocalPasteboard_onceToken, &__block_literal_global_4);
  }
}

void __47__ATXClipboardContents__observeLocalPasteboard__block_invoke()
{
  v0 = __atxlog_handle_heuristic();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG)) {
    __47__ATXClipboardContents__observeLocalPasteboard__block_invoke_cold_1(v0);
  }

  int out_token = 0;
  v1 = (const char *)[@"com.apple.pasteboard.notify.changed" UTF8String];
  v2 = dispatch_get_global_queue(9, 0);
  notify_register_dispatch(v1, &out_token, v2, &__block_literal_global_33);
}

void __47__ATXClipboardContents__observeLocalPasteboard__block_invoke_30()
{
  v0 = __atxlog_handle_heuristic();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_1D0F43000, v0, OS_LOG_TYPE_INFO, "Received com.apple.pasteboard.notify.changed notification. Checking .changeCount ...", v2, 2u);
  }

  v1 = [MEMORY[0x1E4F881F0] defaultConnection];
  [v1 localGeneralPasteboardCompletionBlock:&__block_literal_global_37];
}

void __47__ATXClipboardContents__observeLocalPasteboard__block_invoke_34(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = __atxlog_handle_heuristic();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __47__ATXClipboardContents__observeLocalPasteboard__block_invoke_34_cold_1(v2);
  }

  if (sLastPasteboardChangeCount
    && (uint64_t v4 = [v2 changeCount], v4 == objc_msgSend((id)sLastPasteboardChangeCount, "integerValue")))
  {
    dispatch_semaphore_t v5 = __atxlog_handle_heuristic();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_1D0F43000, v5, OS_LOG_TYPE_INFO, "Local pasteboard has not changed. Not posting ATXLocalPasteboardDidChangeNotification", v7, 2u);
    }
  }
  else
  {
    id v6 = __atxlog_handle_heuristic();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0F43000, v6, OS_LOG_TYPE_INFO, "Local pasteboard changed! Posting ATXLocalPasteboardDidChangeNotification!", buf, 2u);
    }

    dispatch_semaphore_t v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 postNotificationName:@"ATXLocalPasteboardDidChangeNotification" object:0];
  }
}

void __45__ATXClipboardContents_contentsWithCallback___block_invoke_42(uint64_t a1, void *a2, void *a3)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-1800.0];
    id v8 = [*(id *)(a1 + 32) creationDate];
    [v8 timeIntervalSinceDate:v7];
    double v10 = v9;

    if (v10 >= 0.0)
    {
      uint64_t v17 = *(void **)(a1 + 40);
      v18 = [(id)*MEMORY[0x1E4F444F8] identifier];
      LODWORD(v17) = [v17 isEqualToString:v18];

      if (v17)
      {
        uint64_t v19 = *(void *)(a1 + 40);
        id v32 = 0;
        uint64_t v20 = [MEMORY[0x1E4F1CB10] objectWithItemProviderData:v5 typeIdentifier:v19 error:&v32];
        uint64_t v21 = v32;
        if (v20)
        {
          double v11 = [v20 absoluteString];
        }
        else
        {
          v22 = __atxlog_handle_heuristic();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v34 = v21;
            _os_log_impl(&dword_1D0F43000, v22, OS_LOG_TYPE_DEFAULT, "Error decoding URL: %@", buf, 0xCu);
          }

          double v11 = 0;
        }

        if (!v11) {
          goto LABEL_20;
        }
      }
      else
      {
        double v11 = [[NSString alloc] initWithData:v5 usedEncoding:0];
        if (!v11) {
          goto LABEL_20;
        }
      }
      uint64_t v23 = [_ATXCachedClipboardContents alloc];
      v24 = [*(id *)(a1 + 32) creationDate];
      v25 = [*(id *)(a1 + 32) originatorBundleID];
      uint64_t v26 = [(_ATXCachedClipboardContents *)v23 initWithContent:v11 creationDate:v24 originatorBundleId:v25];
      uint64_t v27 = *(void *)(*(void *)(a1 + 56) + 8);
      v28 = *(void **)(v27 + 40);
      *(void *)(v27 + 40) = v26;

      objc_storeStrong((id *)&sLastPasteboardContents, *(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40));
      objc_super v12 = __atxlog_handle_heuristic();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v29 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) content];
        v30 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) creationDate];
        v31 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) originatorBundleId];
        *(_DWORD *)buf = 138740483;
        id v34 = v29;
        __int16 v35 = 2112;
        id v36 = v30;
        __int16 v37 = 2112;
        v38 = v31;
        _os_log_impl(&dword_1D0F43000, v12, OS_LOG_TYPE_DEFAULT, "Found clipboard content: %{sensitive}@, creationDate: %@, originatorBundleID: %@", buf, 0x20u);
      }
    }
    else
    {
      double v11 = __atxlog_handle_heuristic();
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
LABEL_20:

        goto LABEL_21;
      }
      objc_super v12 = [*(id *)(a1 + 32) creationDate];
      *(_DWORD *)buf = 138412290;
      id v34 = v12;
      _os_log_impl(&dword_1D0F43000, v11, OS_LOG_TYPE_DEFAULT, "Not returning pasteboard content as pasteboard creation date is more than 30 minutes ago. Creation Date: %@", buf, 0xCu);
    }

    goto LABEL_20;
  }
  v13 = __atxlog_handle_heuristic();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = *(NSObject **)(a1 + 40);
    *(_DWORD *)buf = 138412546;
    id v34 = v14;
    __int16 v35 = 2112;
    id v36 = v6;
    _os_log_impl(&dword_1D0F43000, v13, OS_LOG_TYPE_DEFAULT, "Error getting text representation from pasteboard. Type = %@, Error: %@", buf, 0x16u);
  }

  uint64_t v15 = *(void *)(*(void *)(a1 + 64) + 8);
  id v16 = v6;
  id v7 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v16;
LABEL_21:

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

void __47__ATXClipboardContents__observeLocalPasteboard__block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1D0F43000, log, OS_LOG_TYPE_DEBUG, "Registering for com.apple.pasteboard.notify.changed notifications...", v1, 2u);
}

void __47__ATXClipboardContents__observeLocalPasteboard__block_invoke_34_cold_1(void *a1)
{
  [(id)sLastPasteboardChangeCount integerValue];
  [a1 changeCount];
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_1_4(&dword_1D0F43000, v2, v3, "PasteBoard .changeCount - previous: %ld - current: %ld", v4, v5, v6, v7, v8);
}

void __45__ATXClipboardContents_contentsWithCallback___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D0F43000, a2, OS_LOG_TYPE_ERROR, "Error getting pasteboard contents: %@", (uint8_t *)&v2, 0xCu);
}

@end