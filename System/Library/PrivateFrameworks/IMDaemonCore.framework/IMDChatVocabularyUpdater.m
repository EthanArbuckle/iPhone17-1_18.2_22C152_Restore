@interface IMDChatVocabularyUpdater
+ (id)sharedInstance;
+ (void)performInitialUpdateIfNeeded;
- (BOOL)haveDeferredUpdateRequest;
- (IMDChatRegistry)chatRegistry;
- (IMDChatVocabularyUpdater)initWithChatRegistry:(id)a3 vocabulary:(id)a4;
- (INVocabulary)vocabulary;
- (void)_updateVocabularyExcludingChat:(id)a3 completionHandler:(id)a4;
- (void)setChatRegistry:(id)a3;
- (void)setHaveDeferredUpdateRequest:(BOOL)a3;
- (void)setVocabulary:(id)a3;
- (void)updateVocabularyForAddedChat:(id)a3 completionHandler:(id)a4;
- (void)updateVocabularyForDeferredUpdateRequestIfNecessaryWithCompletionHandler:(id)a3;
- (void)updateVocabularyForDeletedChat:(id)a3 completionHandler:(id)a4;
- (void)updateVocabularyForRenamedChat:(id)a3 completionHandler:(id)a4;
@end

@implementation IMDChatVocabularyUpdater

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1D96DD8A4;
  block[3] = &unk_1E6B72BE8;
  block[4] = a1;
  if (qword_1EBE2BA88 != -1) {
    dispatch_once(&qword_1EBE2BA88, block);
  }
  v2 = (void *)qword_1EBE2B950;

  return v2;
}

- (IMDChatVocabularyUpdater)initWithChatRegistry:(id)a3 vocabulary:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)IMDChatVocabularyUpdater;
  v8 = [(IMDChatVocabularyUpdater *)&v14 init];
  if (v8)
  {
    if (v6)
    {
      v9 = (IMDChatRegistry *)v6;
    }
    else
    {
      v9 = +[IMDChatRegistry sharedInstance];
    }
    chatRegistry = v8->_chatRegistry;
    v8->_chatRegistry = v9;

    if (v7)
    {
      v11 = (INVocabulary *)v7;
    }
    else
    {
      objc_msgSend((id)MEMORY[0x1E0169C30](@"INVocabulary", @"Intents"), "sharedVocabulary");
      v11 = (INVocabulary *)objc_claimAutoreleasedReturnValue();
    }
    vocabulary = v8->_vocabulary;
    v8->_vocabulary = v11;
  }
  return v8;
}

- (void)updateVocabularyForAddedChat:(id)a3 completionHandler:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  BOOL v8 = [(IMDChatRegistry *)self->_chatRegistry doneLoadingAfterMerge];
  int v9 = IMOSLoggingEnabled();
  if (v8)
  {
    if (v9)
    {
      v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        int v12 = 138412290;
        id v13 = v6;
        _os_log_impl(&dword_1D967A000, v10, OS_LOG_TYPE_INFO, "Updating SiriKit group name vocabulary for added chat: %@", (uint8_t *)&v12, 0xCu);
      }
    }
    [(IMDChatVocabularyUpdater *)self _updateVocabularyExcludingChat:0 completionHandler:v7];
  }
  else
  {
    if (v9)
    {
      v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        int v12 = 138412290;
        id v13 = v6;
        _os_log_impl(&dword_1D967A000, v11, OS_LOG_TYPE_INFO, "Received request to update vocabulary for added chat, but chat registry is not yet loaded. Deferring update. Added Chat: %@", (uint8_t *)&v12, 0xCu);
      }
    }
    self->_haveDeferredUpdateRequest = 1;
    if (v7) {
      v7[2](v7);
    }
  }
}

- (void)updateVocabularyForDeletedChat:(id)a3 completionHandler:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  BOOL v8 = [(IMDChatRegistry *)self->_chatRegistry doneLoadingAfterMerge];
  int v9 = IMOSLoggingEnabled();
  if (v8)
  {
    if (v9)
    {
      v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        int v12 = 138412290;
        id v13 = v6;
        _os_log_impl(&dword_1D967A000, v10, OS_LOG_TYPE_INFO, "Updating group name vocabulary for deleted chat: %@", (uint8_t *)&v12, 0xCu);
      }
    }
    [(IMDChatVocabularyUpdater *)self _updateVocabularyExcludingChat:v6 completionHandler:v7];
  }
  else
  {
    if (v9)
    {
      v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        int v12 = 138412290;
        id v13 = v6;
        _os_log_impl(&dword_1D967A000, v11, OS_LOG_TYPE_INFO, "Received request to update vocabulary for deleted chat, but chat registry is not yet loaded. Deferring update. Deleted Chat: %@", (uint8_t *)&v12, 0xCu);
      }
    }
    self->_haveDeferredUpdateRequest = 1;
    if (v7) {
      v7[2](v7);
    }
  }
}

- (void)updateVocabularyForRenamedChat:(id)a3 completionHandler:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  BOOL v8 = [(IMDChatRegistry *)self->_chatRegistry doneLoadingAfterMerge];
  int v9 = IMOSLoggingEnabled();
  if (v8)
  {
    if (v9)
    {
      v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        int v12 = 138412290;
        id v13 = v6;
        _os_log_impl(&dword_1D967A000, v10, OS_LOG_TYPE_INFO, "Updating group name vocabulary for renamed chat: %@", (uint8_t *)&v12, 0xCu);
      }
    }
    [(IMDChatVocabularyUpdater *)self _updateVocabularyExcludingChat:0 completionHandler:v7];
  }
  else
  {
    if (v9)
    {
      v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        int v12 = 138412290;
        id v13 = v6;
        _os_log_impl(&dword_1D967A000, v11, OS_LOG_TYPE_INFO, "Received request to update vocabulary for renamed chat, but chat registry is not yet loaded. Deferring update. Renamed Chat: %@", (uint8_t *)&v12, 0xCu);
      }
    }
    self->_haveDeferredUpdateRequest = 1;
    if (v7) {
      v7[2](v7);
    }
  }
}

- (void)updateVocabularyForDeferredUpdateRequestIfNecessaryWithCompletionHandler:(id)a3
{
  v4 = (void (**)(void))a3;
  if (![(IMDChatRegistry *)self->_chatRegistry doneLoadingAfterMerge])
  {
    if (!IMOSLoggingEnabled()) {
      goto LABEL_16;
    }
    id v6 = OSLogHandleForIMFoundationCategory();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO)) {
      goto LABEL_15;
    }
    __int16 v11 = 0;
    id v7 = "Chat registry was reloaded, but merge is not yet completed (e.g. we're still under first data protection). Not "
         "updating vocabulary.";
    BOOL v8 = (uint8_t *)&v11;
    goto LABEL_14;
  }
  if (self->_haveDeferredUpdateRequest)
  {
    self->_haveDeferredUpdateRequest = 0;
    if (IMOSLoggingEnabled())
    {
      v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "Chat registry has finished loading. Updating group name vocabulary due to a deferred update request.", buf, 2u);
      }
    }
    [(IMDChatVocabularyUpdater *)self _updateVocabularyExcludingChat:0 completionHandler:v4];
    goto LABEL_18;
  }
  if (IMOSLoggingEnabled())
  {
    id v6 = OSLogHandleForIMFoundationCategory();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
LABEL_15:

      goto LABEL_16;
    }
    __int16 v9 = 0;
    id v7 = "Chat registry has finished loading. No deffered update request.";
    BOOL v8 = (uint8_t *)&v9;
LABEL_14:
    _os_log_impl(&dword_1D967A000, v6, OS_LOG_TYPE_INFO, v7, v8, 2u);
    goto LABEL_15;
  }
LABEL_16:
  if (v4) {
    v4[2](v4);
  }
LABEL_18:
}

- (void)_updateVocabularyExcludingChat:(id)a3 completionHandler:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  if ([MEMORY[0x1E4F6E730] isMessagesInstalled])
  {
    v23 = self;
    v24 = v7;
    BOOL v8 = [(IMDChatRegistry *)self->_chatRegistry cachedChats];
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA70]);
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v10 = v8;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v29 != v12) {
            objc_enumerationMutation(v10);
          }
          uint64_t v14 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          if (([v14 isBlackholed] & 1) == 0 && objc_msgSend(v14, "style") != 45)
          {
            v15 = [v14 displayName];
            BOOL v16 = v15 == 0;

            if (!v16 && ([v14 state] & 0xFFFFFFFFFFFFFFFELL) == 2)
            {
              if (!v6
                || ([v14 guid],
                    v17 = objc_claimAutoreleasedReturnValue(),
                    [v6 guid],
                    v18 = objc_claimAutoreleasedReturnValue(),
                    char v19 = [v17 isEqual:v18],
                    v18,
                    v17,
                    (v19 & 1) == 0))
              {
                [v9 addObject:v14];
              }
            }
          }
        }
        uint64_t v11 = [v10 countByEnumeratingWithState:&v28 objects:v33 count:16];
      }
      while (v11);
    }

    [v9 sortUsingComparator:&unk_1F33909E0];
    v20 = dispatch_get_global_queue(-2, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1D96DE368;
    block[3] = &unk_1E6B73A60;
    block[4] = v23;
    id v26 = v9;
    id v27 = v24;
    id v21 = v9;
    dispatch_async(v20, block);

    id v7 = (void (**)(void))v24;
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      v22 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D967A000, v22, OS_LOG_TYPE_INFO, "MobileSMS application is uninstalled, not donating Siri Vocab.", buf, 2u);
      }
    }
    if (v7) {
      v7[2](v7);
    }
  }
}

+ (void)performInitialUpdateIfNeeded
{
  if ((IMDidPerformInitialChatVocabularyUpdate() & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      v2 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v4 = 0;
        _os_log_impl(&dword_1D967A000, v2, OS_LOG_TYPE_INFO, "Performing initial group name vocabulary update", v4, 2u);
      }
    }
    v3 = +[IMDChatVocabularyUpdater sharedInstance];
    [v3 _updateVocabularyExcludingChat:0 completionHandler:&unk_1F3390A00];
  }
}

- (IMDChatRegistry)chatRegistry
{
  return self->_chatRegistry;
}

- (void)setChatRegistry:(id)a3
{
}

- (INVocabulary)vocabulary
{
  return self->_vocabulary;
}

- (void)setVocabulary:(id)a3
{
}

- (BOOL)haveDeferredUpdateRequest
{
  return self->_haveDeferredUpdateRequest;
}

- (void)setHaveDeferredUpdateRequest:(BOOL)a3
{
  self->_haveDeferredUpdateRequest = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vocabulary, 0);

  objc_storeStrong((id *)&self->_chatRegistry, 0);
}

@end