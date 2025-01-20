@interface CPLEngineFeedbackManager
- (BOOL)disableFeedback;
- (CPLEngineFeedbackManager)initWithEngineLibrary:(id)a3;
- (CPLEngineLibrary)engineLibrary;
- (id)componentName;
- (void)_appendMessage:(id)a3;
- (void)_appendMessages:(id)a3;
- (void)_load;
- (void)_reallySendFeedbackToServer;
- (void)_save;
- (void)_sendFeedbackToServerIfNecessary;
- (void)closeAndDeactivate:(BOOL)a3 completionHandler:(id)a4;
- (void)getStatusWithCompletionHandler:(id)a3;
- (void)openWithCompletionHandler:(id)a3;
- (void)reportEndOfResetWithUUID:(id)a3 reason:(id)a4;
- (void)reportFetchChangesRewindToFeatureVersion:(unint64_t)a3;
- (void)reportMessage:(id)a3;
- (void)reportMessages:(id)a3;
- (void)reportMiscInformation:(id)a3;
- (void)reportResetType:(id)a3 reason:(id)a4 uuid:(id)a5;
- (void)reportSetting:(id)a3 hasBeenSetToValue:(id)a4;
- (void)sendFeedbackToServerIfNecessary;
- (void)setDisableFeedback:(BOOL)a3;
- (void)testKey:(id)a3 value:(id)a4 completionHandler:(id)a5;
@end

@implementation CPLEngineFeedbackManager

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_engineLibrary);
  objc_storeStrong((id *)&self->_libraryIdentifier, 0);
  objc_storeStrong((id *)&self->_feedbackMessagesURL, 0);
  objc_storeStrong((id *)&self->_lastAttemptDate, 0);
  objc_storeStrong((id *)&self->_messagesSending, 0);
  objc_storeStrong((id *)&self->_messagesToSend, 0);
  objc_storeStrong((id *)&self->_sendTask, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (BOOL)disableFeedback
{
  return self->_disableFeedback;
}

- (CPLEngineLibrary)engineLibrary
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_engineLibrary);
  return (CPLEngineLibrary *)WeakRetained;
}

- (void)testKey:(id)a3 value:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v8 isEqualToString:@"feedback"])
  {
    if (v9)
    {
      v11 = [[CPLTestFeedbackMessage alloc] initWithTestMessage:v9 libraryIdentifier:self->_libraryIdentifier];
      [(CPLEngineFeedbackManager *)self reportMessage:v11];
      (*((void (**)(id, uint64_t, void, void))v10 + 2))(v10, 1, 0, 0);
    }
    else
    {
      v16 = +[CPLErrors incorrectParametersErrorForParameter:@"value"];
      (*((void (**)(id, uint64_t, void, void *))v10 + 2))(v10, 1, 0, v16);
    }
  }
  else if ([v8 isEqualToString:@"send-feedback"])
  {
    queue = self->_queue;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __60__CPLEngineFeedbackManager_testKey_value_completionHandler___block_invoke;
    v17[3] = &unk_1E60A5EE8;
    v17[4] = self;
    id v18 = v10;
    v13 = v17;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __cpl_dispatch_async_block_invoke_16748;
    block[3] = &unk_1E60A6978;
    id v20 = v13;
    v14 = queue;
    dispatch_block_t v15 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
    dispatch_async(v14, v15);
  }
  else
  {
    (*((void (**)(id, void, void, void))v10 + 2))(v10, 0, 0, 0);
  }
}

uint64_t __60__CPLEngineFeedbackManager_testKey_value_completionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _load];
  if ([*(id *)(*(void *)(a1 + 32) + 24) count]) {
    [*(id *)(a1 + 32) _reallySendFeedbackToServer];
  }
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v2();
}

- (void)reportMiscInformation:(id)a3
{
  id v4 = a3;
  v5 = [[CPLInfoFeedbackMessage alloc] initWithInfo:v4 libraryIdentifier:self->_libraryIdentifier];

  [(CPLEngineFeedbackManager *)self reportMessage:v5];
}

- (void)reportSetting:(id)a3 hasBeenSetToValue:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [[CPLSettingFeedbackMessage alloc] initWithSetting:v7 value:v6 libraryIdentifier:self->_libraryIdentifier];

  [(CPLEngineFeedbackManager *)self reportMessage:v8];
}

- (void)reportFetchChangesRewindToFeatureVersion:(unint64_t)a3
{
  objc_msgSend(NSString, "stringWithFormat:", @"Rewind to catch up with changes from feature version %lu", a3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v4 = [MEMORY[0x1E4F29128] UUID];
  v5 = [v4 UUIDString];
  [(CPLEngineFeedbackManager *)self reportResetType:@"rewind" reason:v6 uuid:v5];
}

- (void)reportEndOfResetWithUUID:(id)a3 reason:(id)a4
{
}

- (void)reportResetType:(id)a3 reason:(id)a4 uuid:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [[CPLResetFeedbackMessage alloc] initWithResetType:v10 reason:v9 uuid:v8 libraryIdentifier:self->_libraryIdentifier];

  [(CPLEngineFeedbackManager *)self reportMessage:v11];
}

- (void)reportMessages:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __43__CPLEngineFeedbackManager_reportMessages___block_invoke;
  v7[3] = &unk_1E60A6728;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

uint64_t __43__CPLEngineFeedbackManager_reportMessages___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _appendMessages:*(void *)(a1 + 40)];
}

- (void)reportMessage:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __42__CPLEngineFeedbackManager_reportMessage___block_invoke;
  v7[3] = &unk_1E60A6728;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

uint64_t __42__CPLEngineFeedbackManager_reportMessage___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _appendMessage:*(void *)(a1 + 40)];
}

- (void)sendFeedbackToServerIfNecessary
{
  queue = self->_queue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __59__CPLEngineFeedbackManager_sendFeedbackToServerIfNecessary__block_invoke;
  v6[3] = &unk_1E60A5DD8;
  v6[4] = self;
  v3 = v6;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_16748;
  block[3] = &unk_1E60A6978;
  id v8 = v3;
  id v4 = queue;
  dispatch_block_t v5 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v4, v5);
}

uint64_t __59__CPLEngineFeedbackManager_sendFeedbackToServerIfNecessary__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sendFeedbackToServerIfNecessary];
}

- (void)_sendFeedbackToServerIfNecessary
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->_sendTask)
  {
    v3 = [(CPLEngineFeedbackManager *)self engineLibrary];
    id v4 = [v3 systemMonitor];
    int v5 = [v4 isNetworkConnected];

    if (v5)
    {
      [(CPLEngineFeedbackManager *)self _load];
      if ([(NSMutableArray *)self->_messagesToSend count])
      {
        [(NSDate *)self->_lastAttemptDate timeIntervalSinceNow];
        if (v6 > 0.0
          || v6 < -3600.0
          || ([MEMORY[0x1E4F1CB18] standardUserDefaults],
              id v7 = objc_claimAutoreleasedReturnValue(),
              int v8 = [v7 BOOLForKey:@"CPLAlwaysSendFeedback"],
              v7,
              v8))
        {
          [(CPLEngineFeedbackManager *)self _reallySendFeedbackToServer];
        }
      }
    }
  }
}

- (void)_reallySendFeedbackToServer
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (!self->_closed && self->_opened && !self->_sendTask)
  {
    v3 = [MEMORY[0x1E4F1C9C8] date];
    lastAttemptDate = self->_lastAttemptDate;
    self->_lastAttemptDate = v3;

    [(CPLEngineFeedbackManager *)self _save];
    if (!_CPLSilentLogging)
    {
      int v5 = __CPLFeedbackOSLogDomain();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v6 = [(NSMutableArray *)self->_messagesToSend count];
        *(_DWORD *)buf = 134217984;
        uint64_t v16 = v6;
        _os_log_impl(&dword_1B4CAC000, v5, OS_LOG_TYPE_DEFAULT, "Sending feedback to server with %lu messages", buf, 0xCu);
      }
    }
    id v7 = (NSArray *)[(NSMutableArray *)self->_messagesToSend copy];
    messagesSending = self->_messagesSending;
    self->_messagesSending = v7;

    id WeakRetained = objc_loadWeakRetained((id *)&self->_engineLibrary);
    id v10 = [WeakRetained transport];
    v11 = self->_messagesSending;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __55__CPLEngineFeedbackManager__reallySendFeedbackToServer__block_invoke;
    v14[3] = &unk_1E60AB8A0;
    v14[4] = self;
    v12 = [v10 sendFeedbackTaskForMessages:v11 completionHandler:v14];
    sendTask = self->_sendTask;
    self->_sendTask = v12;

    [(CPLEngineTransportSendFeedbackTask *)self->_sendTask runWithNoSyncSession];
  }
}

void __55__CPLEngineFeedbackManager__reallySendFeedbackToServer__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  int v5 = *(void **)(v4 + 8);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __55__CPLEngineFeedbackManager__reallySendFeedbackToServer__block_invoke_2;
  v10[3] = &unk_1E60A6728;
  v10[4] = v4;
  id v11 = v3;
  uint64_t v6 = v10;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_16748;
  block[3] = &unk_1E60A6978;
  id v13 = v6;
  id v7 = v5;
  id v8 = v3;
  dispatch_block_t v9 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v7, v9);
}

void __55__CPLEngineFeedbackManager__reallySendFeedbackToServer__block_invoke_2(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 16))
  {
    if (*(void *)(a1 + 40))
    {
      if (!_CPLSilentLogging)
      {
        id v3 = __CPLFeedbackOSLogDomain();
        if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v4 = *(void *)(a1 + 40);
          int v12 = 138412290;
          uint64_t v13 = v4;
          _os_log_impl(&dword_1B4CAC000, v3, OS_LOG_TYPE_DEFAULT, "Failed to send feedback. Will retry later. Error: %@", (uint8_t *)&v12, 0xCu);
        }
      }
    }
    else
    {
      if (!_CPLSilentLogging)
      {
        int v5 = __CPLFeedbackOSLogDomain();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v6 = [*(id *)(*(void *)(a1 + 32) + 32) count];
          [*(id *)(*(void *)(a1 + 32) + 40) timeIntervalSinceNow];
          int v12 = 134218240;
          uint64_t v13 = v6;
          __int16 v14 = 2048;
          double v15 = -v7;
          _os_log_impl(&dword_1B4CAC000, v5, OS_LOG_TYPE_DEFAULT, "%lu feedback messages sent in %.1fs", (uint8_t *)&v12, 0x16u);
        }

        uint64_t v2 = *(void *)(a1 + 32);
      }
      [*(id *)(v2 + 24) removeObjectsInArray:*(void *)(v2 + 32)];
      [*(id *)(a1 + 32) _save];
    }
  }
  uint64_t v8 = *(void *)(a1 + 32);
  dispatch_block_t v9 = *(void **)(v8 + 32);
  *(void *)(v8 + 32) = 0;

  uint64_t v10 = *(void *)(a1 + 32);
  id v11 = *(void **)(v10 + 16);
  *(void *)(v10 + 16) = 0;
}

- (void)_appendMessages:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!self->_deactivated && !self->_disableFeedback)
  {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
    [(CPLEngineFeedbackManager *)self _load];
    if (!self->_messagesToSend)
    {
      int v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      messagesToSend = self->_messagesToSend;
      self->_messagesToSend = v5;
    }
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v7 = v4;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v20 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          int v12 = [[CPLSerializedFeedbackMessage alloc] initWithMessage:*(void *)(*((void *)&v14 + 1) + 8 * i)];
          if (!_CPLSilentLogging)
          {
            uint64_t v13 = __CPLFeedbackOSLogDomain();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v19 = v12;
              _os_log_impl(&dword_1B4CAC000, v13, OS_LOG_TYPE_DEFAULT, "Scheduling feedback message %@", buf, 0xCu);
            }
          }
          [(NSMutableArray *)self->_messagesToSend addObject:v12];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v20 count:16];
      }
      while (v9);
    }

    [(CPLEngineFeedbackManager *)self _save];
    [(CPLEngineFeedbackManager *)self _sendFeedbackToServerIfNecessary];
  }
}

- (void)_appendMessage:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!self->_deactivated && !self->_disableFeedback)
  {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
    [(CPLEngineFeedbackManager *)self _load];
    if (!self->_messagesToSend)
    {
      int v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      messagesToSend = self->_messagesToSend;
      self->_messagesToSend = v5;
    }
    id v7 = [[CPLSerializedFeedbackMessage alloc] initWithMessage:v4];
    if (!_CPLSilentLogging)
    {
      uint64_t v8 = __CPLFeedbackOSLogDomain();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v9 = 138412290;
        uint64_t v10 = v7;
        _os_log_impl(&dword_1B4CAC000, v8, OS_LOG_TYPE_DEFAULT, "Scheduling feedback message %@", (uint8_t *)&v9, 0xCu);
      }
    }
    [(NSMutableArray *)self->_messagesToSend addObject:v7];
    [(CPLEngineFeedbackManager *)self _save];
    [(CPLEngineFeedbackManager *)self _sendFeedbackToServerIfNecessary];
  }
}

- (void)_load
{
  if (!self->_messagesToSend)
  {
    id v3 = (void *)MEMORY[0x1BA993DF0]();
    if (!self->_closed)
    {
      id v4 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfURL:self->_feedbackMessagesURL];
      if (v4)
      {
        int v5 = [MEMORY[0x1E4F28F98] propertyListWithData:v4 options:0 format:0 error:0];
        if (v5)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v6 = [v5 objectForKeyedSubscript:@"lastAttempt"];
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              objc_storeStrong((id *)&self->_lastAttemptDate, v6);
            }
            id v7 = [v5 objectForKeyedSubscript:@"messages"];
            uint64_t v8 = +[CPLSerializedFeedbackMessage messagesForPlistRepresentation:v7];
            int v9 = (NSMutableArray *)[v8 mutableCopy];
            messagesToSend = self->_messagesToSend;
            self->_messagesToSend = v9;
          }
        }
        uint64_t v11 = self->_messagesToSend;
        if (v11)
        {
          if ((unint64_t)[(NSMutableArray *)v11 count] >= 0xB) {
            [(CPLEngineFeedbackManager *)self _save];
          }
        }
        else if (!_CPLSilentLogging)
        {
          int v12 = __CPLFeedbackOSLogDomain();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)long long v17 = 0;
            _os_log_impl(&dword_1B4CAC000, v12, OS_LOG_TYPE_ERROR, "Unable to read stored feedback messages. We might have dropped some messages we wanted to send", v17, 2u);
          }
        }
      }
      if (!self->_messagesToSend)
      {
        uint64_t v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
        long long v14 = self->_messagesToSend;
        self->_messagesToSend = v13;
      }
      if (!self->_lastAttemptDate)
      {
        long long v15 = [MEMORY[0x1E4F1C9C8] distantPast];
        lastAttemptDate = self->_lastAttemptDate;
        self->_lastAttemptDate = v15;
      }
    }
  }
}

- (void)_save
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (!self->_closed)
  {
    messagesToSend = self->_messagesToSend;
    if (messagesToSend)
    {
      if ([(NSMutableArray *)messagesToSend count])
      {
        int v5 = (void *)MEMORY[0x1BA993DF0]();
        if ((unint64_t)[(NSMutableArray *)self->_messagesToSend count] >= 0xB)
        {
          uint64_t v6 = [(NSMutableArray *)self->_messagesToSend count] - 10;
          if (!_CPLSilentLogging)
          {
            id v7 = __CPLFeedbackOSLogDomain();
            if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 134217984;
              uint64_t v20 = v6;
              _os_log_impl(&dword_1B4CAC000, v7, OS_LOG_TYPE_DEFAULT, "Too many messages to send to the server. Will drop %lu messages", buf, 0xCu);
            }
          }
          -[NSMutableArray removeObjectsInRange:](self->_messagesToSend, "removeObjectsInRange:", 0, v6);
        }
        v17[0] = @"messages";
        uint64_t v8 = +[CPLSerializedFeedbackMessage plistRepresentationForMessages:self->_messagesToSend];
        v17[1] = @"lastAttempt";
        v18[0] = v8;
        v18[1] = self->_lastAttemptDate;
        int v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2];

        id v16 = 0;
        uint64_t v10 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v9 format:200 options:0 error:&v16];
        id v11 = v16;
        if (!v10)
        {
          if (!_CPLSilentLogging)
          {
            int v12 = __CPLGenericOSLogDomain();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v20 = (uint64_t)v11;
              _os_log_impl(&dword_1B4CAC000, v12, OS_LOG_TYPE_ERROR, "Failed to create feedback messages serialization: %@", buf, 0xCu);
            }
          }
          uint64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
          long long v14 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Feedback/CPLEngineFeedbackManager.m"];
          [v13 handleFailureInMethod:a2, self, v14, 160, @"Failed to create feedback messages serialization: %@", v11 object file lineNumber description];

          abort();
        }
        [v10 writeToURL:self->_feedbackMessagesURL atomically:1];
      }
      else
      {
        id v15 = [MEMORY[0x1E4F28CB8] defaultManager];
        [v15 removeItemAtURL:self->_feedbackMessagesURL error:0];
      }
    }
  }
}

- (void)getStatusWithCompletionHandler:(id)a3
{
  id v4 = a3;
  int v5 = v4;
  if (self->_disableFeedback)
  {
    (*((void (**)(id, __CFString *, void))v4 + 2))(v4, @"disabled", 0);
  }
  else
  {
    queue = self->_queue;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __59__CPLEngineFeedbackManager_getStatusWithCompletionHandler___block_invoke;
    v10[3] = &unk_1E60A5EE8;
    v10[4] = self;
    id v11 = v4;
    id v7 = v10;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __cpl_dispatch_async_block_invoke_16748;
    block[3] = &unk_1E60A6978;
    id v13 = v7;
    uint64_t v8 = queue;
    dispatch_block_t v9 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
    dispatch_async(v8, v9);
  }
}

void __59__CPLEngineFeedbackManager_getStatusWithCompletionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _load];
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 16))
  {
    id v23 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F28E78]), "initWithFormat:", @"Sending %lu feedback messages...", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 32), "count"));
    uint64_t v2 = *(void *)(a1 + 32);
  }
  else
  {
    id v23 = 0;
  }
  unint64_t v3 = [*(id *)(v2 + 24) count];
  id v4 = *(void **)(*(void *)(a1 + 32) + 40);
  int v5 = [MEMORY[0x1E4F1C9C8] distantPast];
  char v6 = [v4 isEqual:v5];

  if (v3)
  {
    if (v6)
    {
      id v7 = @"never sent";
    }
    else
    {
      uint64_t v8 = NSString;
      dispatch_block_t v9 = +[CPLDateFormatter stringForTimeIntervalAgo:*(void *)(*(void *)(a1 + 32) + 40) now:0];
      id v7 = [v8 stringWithFormat:@"last attempt %@", v9];
    }
    if (v3 >= 4) {
      uint64_t v10 = 4;
    }
    else {
      uint64_t v10 = v3;
    }
    id v11 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v10];
    unint64_t v12 = v3 - v10;
    do
    {
      id v13 = [*(id *)(*(void *)(a1 + 32) + 24) objectAtIndexedSubscript:v12];
      long long v14 = [v13 description];
      [v11 addObject:v14];

      ++v12;
    }
    while (v12 < v3);
    id v15 = [v11 componentsJoinedByString:@"\n    "];
    if (v23)
    {
      uint64_t v16 = [*(id *)(*(void *)(a1 + 32) + 24) count];
      long long v17 = "";
      if (v3 > 4) {
        long long v17 = "\n    ...";
      }
      [v23 appendFormat:@"\n%lu messages to send (%@):%s\n    %@", v16, v7, v17, v15];
    }
    else
    {
      id v18 = objc_alloc(MEMORY[0x1E4F28E78]);
      uint64_t v19 = [*(id *)(*(void *)(a1 + 32) + 24) count];
      uint64_t v20 = "";
      if (v3 > 4) {
        uint64_t v20 = "\n    ...";
      }
      id v23 = (id)[v18 initWithFormat:@"%lu messages to send (%@):%s\n    %@", v19, v7, v20, v15];
    }
  }
  else
  {
    if (v6)
    {
      id v7 = @"no feedback ever sent";
    }
    else
    {
      uint64_t v21 = NSString;
      v22 = +[CPLDateFormatter stringForTimeIntervalAgo:*(void *)(*(void *)(a1 + 32) + 40) now:0];
      id v7 = [v21 stringWithFormat:@"last feedback sent %@", v22];
    }
    id v11 = v23;
    id v23 = (id)[(__CFString *)v7 mutableCopy];
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)componentName
{
  return @"feedback";
}

- (void)setDisableFeedback:(BOOL)a3
{
  self->_disableFeedback = a3;
  if (a3)
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __47__CPLEngineFeedbackManager_setDisableFeedback___block_invoke;
    v7[3] = &unk_1E60A5DD8;
    v7[4] = self;
    id v4 = v7;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __cpl_dispatch_async_block_invoke_16748;
    block[3] = &unk_1E60A6978;
    id v9 = v4;
    int v5 = queue;
    dispatch_block_t v6 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
    dispatch_async(v5, v6);
  }
}

uint64_t __47__CPLEngineFeedbackManager_setDisableFeedback___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 24) removeAllObjects];
  uint64_t v2 = *(void **)(a1 + 32);
  return [v2 _save];
}

- (void)closeAndDeactivate:(BOOL)a3 completionHandler:(id)a4
{
  id v6 = a4;
  queue = self->_queue;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __65__CPLEngineFeedbackManager_closeAndDeactivate_completionHandler___block_invoke;
  v12[3] = &unk_1E60AA2D8;
  BOOL v14 = a3;
  v12[4] = self;
  id v13 = v6;
  uint64_t v8 = v12;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_16748;
  block[3] = &unk_1E60A6978;
  id v16 = v8;
  id v9 = queue;
  id v10 = v6;
  dispatch_block_t v11 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v9, v11);
}

uint64_t __65__CPLEngineFeedbackManager_closeAndDeactivate_completionHandler___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 57) = 1;
  *(unsigned char *)(*(void *)(a1 + 32) + 58) = *(unsigned char *)(a1 + 48);
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 16);
  if (v2)
  {
    [v2 cancel];
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = *(void **)(v3 + 32);
    *(void *)(v3 + 32) = 0;

    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(void **)(v5 + 16);
    *(void *)(v5 + 16) = 0;
  }
  id v7 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v7();
}

- (void)openWithCompletionHandler:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __54__CPLEngineFeedbackManager_openWithCompletionHandler___block_invoke;
  v10[3] = &unk_1E60A5EE8;
  v10[4] = self;
  id v11 = v4;
  id v6 = v10;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_16748;
  block[3] = &unk_1E60A6978;
  id v13 = v6;
  id v7 = queue;
  id v8 = v4;
  dispatch_block_t v9 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v7, v9);
}

uint64_t __54__CPLEngineFeedbackManager_openWithCompletionHandler___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 56) = 1;
  [*(id *)(a1 + 32) _sendFeedbackToServerIfNecessary];
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v2();
}

- (CPLEngineFeedbackManager)initWithEngineLibrary:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CPLEngineFeedbackManager;
  uint64_t v5 = [(CPLEngineFeedbackManager *)&v16 init];
  id v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_engineLibrary, v4);
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.cpl.feedback", 0);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v7;

    id WeakRetained = objc_loadWeakRetained((id *)&v6->_engineLibrary);
    id v10 = [WeakRetained clientLibraryBaseURL];
    uint64_t v11 = [v10 URLByAppendingPathComponent:@"feedbackmessages.plist" isDirectory:0];
    feedbackMessagesURL = v6->_feedbackMessagesURL;
    v6->_feedbackMessagesURL = (NSURL *)v11;

    uint64_t v13 = [v4 libraryIdentifier];
    libraryIdentifier = v6->_libraryIdentifier;
    v6->_libraryIdentifier = (NSString *)v13;
  }
  return v6;
}

@end