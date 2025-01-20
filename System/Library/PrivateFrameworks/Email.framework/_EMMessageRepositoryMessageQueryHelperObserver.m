@interface _EMMessageRepositoryMessageQueryHelperObserver
- (BOOL)didUseThreadCollection;
- (EMInMemoryThreadCollection)threadCollection;
- (EMMessageListItemQueryResultsObserver)resultsObserver;
- (EMMessageRepository)repository;
- (EMObjectID)observationIdentifier;
- (_EMMessageRepositoryMessageQueryHelperObserver)initWithThreadCollection:(id)a3 repository:(id)a4 observer:(id)a5 observationIdentifier:(id)a6;
- (void)_addMessagesToThreadCollection:(id)a3;
- (void)queryHelperBusinessIDDidChangeForMessages:(id)a3 fromBusinessID:(int64_t)a4;
- (void)queryHelperConversationIDDidChangeForMessages:(id)a3 fromConversationID:(int64_t)a4;
- (void)queryHelperConversationNotificationLevelDidChangeForConversation:(int64_t)a3 conversationID:(int64_t)a4;
- (void)queryHelperDidAddMessages:(id)a3;
- (void)queryHelperDidDeleteMessages:(id)a3;
- (void)queryHelperDidFindAllMessages;
- (void)queryHelperDidFindMessages:(id)a3;
- (void)queryHelperDidFinishRemoteSearch;
- (void)queryHelperDidUpdateMessages:(id)a3 forKeyPaths:(id)a4;
- (void)queryHelperMessageFlagsDidChangeForMessages:(id)a3;
- (void)queryHelperObjectIDDidChangeForMessage:(id)a3 oldObjectID:(id)a4 oldConversationID:(int64_t)a5;
- (void)setDidUseThreadCollection:(BOOL)a3;
- (void)setRepository:(id)a3;
@end

@implementation _EMMessageRepositoryMessageQueryHelperObserver

- (_EMMessageRepositoryMessageQueryHelperObserver)initWithThreadCollection:(id)a3 repository:(id)a4 observer:(id)a5 observationIdentifier:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)_EMMessageRepositoryMessageQueryHelperObserver;
  v14 = [(_EMMessageRepositoryMessageQueryHelperObserver *)&v17 init];
  v15 = v14;
  if (v14)
  {
    objc_storeWeak((id *)&v14->_threadCollection, v10);
    objc_storeWeak((id *)&v15->_repository, v11);
    objc_storeWeak((id *)&v15->_resultsObserver, v12);
    objc_storeStrong((id *)&v15->_observationIdentifier, a6);
  }

  return v15;
}

- (void)_addMessagesToThreadCollection:(id)a3
{
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_repository);
  [WeakRetained prepareRepositoryObjects:v6];

  [(_EMMessageRepositoryMessageQueryHelperObserver *)self setDidUseThreadCollection:1];
  id v5 = objc_loadWeakRetained((id *)&self->_threadCollection);
  [v5 messagesWereAdded:v6];
}

- (void)queryHelperDidFindMessages:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_threadCollection);
  id v6 = [WeakRetained logClient];

  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 134218240;
    v8 = self;
    __int16 v9 = 1024;
    int v10 = [v4 count];
    _os_log_impl(&dword_1BEFDB000, v6, OS_LOG_TYPE_DEFAULT, "%p: Found %u messages.", (uint8_t *)&v7, 0x12u);
  }

  [(_EMMessageRepositoryMessageQueryHelperObserver *)self _addMessagesToThreadCollection:v4];
}

- (void)queryHelperDidFindAllMessages
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  p_threadCollection = &self->_threadCollection;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_threadCollection);
  id v5 = [WeakRetained logClient];

  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    *(void *)&buf[4] = self;
    _os_log_impl(&dword_1BEFDB000, v5, OS_LOG_TYPE_DEFAULT, "%p: Finished initial load.", buf, 0xCu);
  }

  *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
  objc_initWeak((id *)buf, self);
  id v6 = objc_loadWeakRetained((id *)p_threadCollection);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __79___EMMessageRepositoryMessageQueryHelperObserver_queryHelperDidFindAllMessages__block_invoke;
  v8[3] = &unk_1E63E2688;
  objc_copyWeak(&v9, (id *)buf);
  [v6 performBlockOnSchedulerIfNecessary:v8];

  id v7 = objc_loadWeakRetained((id *)p_threadCollection);
  [v7 initializeOldestThreadsByMailbox];

  objc_destroyWeak(&v9);
  objc_destroyWeak((id *)buf);
}

- (void)queryHelperDidAddMessages:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_threadCollection);
  id v6 = [WeakRetained logClient];

  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 134218240;
    v8 = self;
    __int16 v9 = 1024;
    int v10 = [v4 count];
    _os_log_impl(&dword_1BEFDB000, v6, OS_LOG_TYPE_DEFAULT, "%p: Added %u messages", (uint8_t *)&v7, 0x12u);
  }

  [(_EMMessageRepositoryMessageQueryHelperObserver *)self _addMessagesToThreadCollection:v4];
}

- (void)queryHelperMessageFlagsDidChangeForMessages:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_threadCollection);
  id v6 = [WeakRetained logClient];

  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    id v12 = self;
    __int16 v13 = 1024;
    int v14 = [v4 count];
    _os_log_impl(&dword_1BEFDB000, v6, OS_LOG_TYPE_DEFAULT, "%p: Flags changed for %u messages", buf, 0x12u);
  }

  id v7 = objc_loadWeakRetained((id *)&self->_repository);
  [v7 prepareRepositoryObjects:v4];

  id v8 = objc_loadWeakRetained((id *)&self->_threadCollection);
  v10[0] = @"flags";
  v10[1] = @"hasUnflagged";
  v10[2] = @"flagColors";
  __int16 v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:3];
  [v8 messagesWereChanged:v4 forKeyPaths:v9 deleted:0];
}

- (void)queryHelperDidUpdateMessages:(id)a3 forKeyPaths:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  p_threadCollection = &self->_threadCollection;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_threadCollection);
  int v10 = [WeakRetained logClient];

  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 134218498;
    int v14 = self;
    __int16 v15 = 2114;
    id v16 = v7;
    __int16 v17 = 1024;
    int v18 = [v6 count];
    _os_log_impl(&dword_1BEFDB000, v10, OS_LOG_TYPE_DEFAULT, "%p: Key paths %{public}@ changed for %u messages", (uint8_t *)&v13, 0x1Cu);
  }

  id v11 = objc_loadWeakRetained((id *)&self->_repository);
  [v11 prepareRepositoryObjects:v6];

  id v12 = objc_loadWeakRetained((id *)p_threadCollection);
  [v12 messagesWereChanged:v6 forKeyPaths:v7 deleted:0];
}

- (void)queryHelperObjectIDDidChangeForMessage:(id)a3 oldObjectID:(id)a4 oldConversationID:(int64_t)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  int v10 = [v8 itemID];
  id v11 = [v9 collectionItemID];
  int v12 = [v10 isEqual:v11];

  if (v12)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_threadCollection);
    int v14 = [WeakRetained logClient];

    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      int v18 = [v8 itemID];
      LODWORD(__b[0]) = 134218754;
      *(void *)((char *)__b + 4) = self;
      WORD2(__b[1]) = 2112;
      *(void *)((char *)&__b[1] + 6) = v18;
      HIWORD(__b[2]) = 2112;
      __b[3] = v8;
      LOWORD(__b[4]) = 2112;
      *(void *)((char *)&__b[4] + 2) = v9;
      _os_log_debug_impl(&dword_1BEFDB000, v14, OS_LOG_TYPE_DEBUG, "%p: itemID not changed %@\nchangedMessage %@\noldObjectID %@", (uint8_t *)__b, 0x2Au);
    }
    memset(__b, 170, sizeof(__b));
    LODWORD(__b[4]) = 0;
    *(void *)v22 = 0xE00000001;
    int v23 = 1;
    pid_t v24 = getpid();
    size_t v19 = 648;
    if (!sysctl(v22, 4u, __b, &v19, 0, 0) && (__b[4] & 0x800) != 0)
    {
      __debugbreak();
      JUMPOUT(0x1BF06FDACLL);
    }
  }
  else
  {
    id v15 = objc_loadWeakRetained((id *)&self->_repository);
    id v20 = v8;
    id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v20 count:1];
    [v15 prepareRepositoryObjects:v16];

    id v17 = objc_loadWeakRetained((id *)&self->_threadCollection);
    [v17 objectIDDidChangeForMessage:v8 oldObjectID:v9 oldConversationID:a5];
  }
}

- (void)queryHelperDidDeleteMessages:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_threadCollection = &self->_threadCollection;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_threadCollection);
  id v7 = [WeakRetained logClient];

  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 134218240;
    id v11 = self;
    __int16 v12 = 1024;
    int v13 = [v4 count];
    _os_log_impl(&dword_1BEFDB000, v7, OS_LOG_TYPE_DEFAULT, "%p: Deleted %u messages", (uint8_t *)&v10, 0x12u);
  }

  id v8 = objc_loadWeakRetained((id *)&self->_repository);
  [v8 prepareRepositoryObjects:v4];

  id v9 = objc_loadWeakRetained((id *)p_threadCollection);
  [v9 messagesWereChanged:v4 forKeyPaths:0 deleted:1];
}

- (void)queryHelperConversationIDDidChangeForMessages:(id)a3 fromConversationID:(int64_t)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  p_threadCollection = &self->_threadCollection;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_threadCollection);
  id v9 = [WeakRetained logClient];

  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 134218496;
    int v13 = self;
    __int16 v14 = 2048;
    int64_t v15 = a4;
    __int16 v16 = 1024;
    int v17 = [v6 count];
    _os_log_impl(&dword_1BEFDB000, v9, OS_LOG_TYPE_DEFAULT, "%p: ConversationIDs changed from %lld for %u messages", (uint8_t *)&v12, 0x1Cu);
  }

  id v10 = objc_loadWeakRetained((id *)&self->_repository);
  [v10 prepareRepositoryObjects:v6];

  id v11 = objc_loadWeakRetained((id *)p_threadCollection);
  [v11 conversationIDDidChangeForMessages:v6 fromConversationID:a4];
}

- (void)queryHelperBusinessIDDidChangeForMessages:(id)a3 fromBusinessID:(int64_t)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_threadCollection);
  id v8 = [WeakRetained logClient];

  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218496;
    __int16 v14 = self;
    __int16 v15 = 2048;
    int64_t v16 = a4;
    __int16 v17 = 1024;
    int v18 = [v6 count];
    _os_log_impl(&dword_1BEFDB000, v8, OS_LOG_TYPE_DEFAULT, "%p: BusinessIDs changed from %lld for %u messages", buf, 0x1Cu);
  }

  id v9 = objc_loadWeakRetained((id *)&self->_repository);
  [v9 prepareRepositoryObjects:v6];

  id v10 = objc_loadWeakRetained((id *)&self->_threadCollection);
  v12[0] = @"businessID";
  v12[1] = @"businessLogoID";
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];
  [v10 messagesWereChanged:v6 forKeyPaths:v11 deleted:0];
}

- (void)queryHelperConversationNotificationLevelDidChangeForConversation:(int64_t)a3 conversationID:(int64_t)a4
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_threadCollection);
  id v10 = WeakRetained;
  if (a4)
  {
    [WeakRetained conversationNotificationLevelDidChangeForConversation:a3 conversationID:a4];
  }
  else
  {
    id v8 = [WeakRetained logClient];

    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[_EMMessageRepositoryMessageQueryHelperObserver queryHelperConversationNotificationLevelDidChangeForConversation:conversationID:]((uint64_t)self, v8, v9);
    }
  }
}

- (void)queryHelperDidFinishRemoteSearch
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_threadCollection);
  id v4 = [WeakRetained logClient];

  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 134217984;
    id v8 = self;
    _os_log_impl(&dword_1BEFDB000, v4, OS_LOG_TYPE_DEFAULT, "%p: Helper did finish remote search.", (uint8_t *)&v7, 0xCu);
  }

  id v5 = [(_EMMessageRepositoryMessageQueryHelperObserver *)self resultsObserver];
  id v6 = [(_EMMessageRepositoryMessageQueryHelperObserver *)self observationIdentifier];
  [v5 observerDidFinishRemoteSearch:v6];
}

- (EMInMemoryThreadCollection)threadCollection
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_threadCollection);
  return (EMInMemoryThreadCollection *)WeakRetained;
}

- (EMMessageRepository)repository
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_repository);
  return (EMMessageRepository *)WeakRetained;
}

- (void)setRepository:(id)a3
{
}

- (EMMessageListItemQueryResultsObserver)resultsObserver
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_resultsObserver);
  return (EMMessageListItemQueryResultsObserver *)WeakRetained;
}

- (EMObjectID)observationIdentifier
{
  return self->_observationIdentifier;
}

- (BOOL)didUseThreadCollection
{
  return self->_didUseThreadCollection;
}

- (void)setDidUseThreadCollection:(BOOL)a3
{
  self->_didUseThreadCollection = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observationIdentifier, 0);
  objc_destroyWeak((id *)&self->_resultsObserver);
  objc_destroyWeak((id *)&self->_repository);
  objc_destroyWeak((id *)&self->_threadCollection);
}

- (void)queryHelperConversationNotificationLevelDidChangeForConversation:(uint64_t)a3 conversationID:.cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 134218240;
  uint64_t v4 = a1;
  __int16 v5 = 2048;
  uint64_t v6 = 0;
  OUTLINED_FUNCTION_3_0(&dword_1BEFDB000, a2, a3, "%p: Received invalid converationID:%lld", (uint8_t *)&v3);
}

@end