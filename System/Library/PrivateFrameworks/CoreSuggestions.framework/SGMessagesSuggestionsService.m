@interface SGMessagesSuggestionsService
- (BOOL)isMessageEligibleForSuggestions:(id)a3;
- (NSMutableDictionary)previousMessages;
- (SGMessagesDaemonConnection)messagesDaemonConnection;
- (SGMessagesSuggestionsService)init;
- (SGMessagesSuggestionsServiceDelegate)delegate;
- (void)harvestedSuggestionsFromMessage:(id)a3 bundleIdentifier:(id)a4 options:(unint64_t)a5 completionHandler:(id)a6;
- (void)harvestedSuggestionsFromMessage:(id)a3 bundleIdentifier:(id)a4 options:(unint64_t)a5 withCompletion:(id)a6;
- (void)harvestedSuggestionsFromMessages:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5;
- (void)sendContextForMessage:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setManagerForTesting:(id)a3;
- (void)setMessagesDaemonConnection:(id)a3;
- (void)setPreviousMessages:(id)a3;
- (void)setupContextIfNeededForConversation:(id)a3;
- (void)suggestionsFromMessage:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5;
@end

@implementation SGMessagesSuggestionsService

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousMessages, 0);
  objc_storeStrong((id *)&self->_messagesDaemonConnection, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setPreviousMessages:(id)a3
{
}

- (NSMutableDictionary)previousMessages
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 144, 1);
}

- (void)setMessagesDaemonConnection:(id)a3
{
}

- (SGMessagesDaemonConnection)messagesDaemonConnection
{
  return (SGMessagesDaemonConnection *)objc_getProperty(self, a2, 136, 1);
}

- (void)setDelegate:(id)a3
{
}

- (SGMessagesSuggestionsServiceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SGMessagesSuggestionsServiceDelegate *)WeakRetained;
}

- (void)harvestedSuggestionsFromMessages:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  if (!v9)
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"SGMessagesSuggestionsService.m", 207, @"Invalid parameter not satisfying: %@", @"messages" object file lineNumber description];
  }
  v11 = [MEMORY[0x1E4F28B50] mainBundle];
  v12 = [v11 bundleIdentifier];

  if (!v12)
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"SGMessagesSuggestionsService.m", 210, @"Invalid parameter not satisfying: %@", @"bundleIdentifier" object file lineNumber description];
  }
  messagesDaemonConnection = self->_messagesDaemonConnection;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __91__SGMessagesSuggestionsService_harvestedSuggestionsFromMessages_options_completionHandler___block_invoke;
  v21[3] = &unk_1E5B90460;
  id v14 = v10;
  id v22 = v14;
  v15 = [(SGMessagesDaemonConnection *)messagesDaemonConnection remoteSuggestionManagerWithErrorHandler:v21];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __91__SGMessagesSuggestionsService_harvestedSuggestionsFromMessages_options_completionHandler___block_invoke_2;
  v19[3] = &unk_1E5B90488;
  id v20 = v14;
  id v16 = v14;
  [v15 harvestedSuggestionsFromMessages:v9 bundleIdentifier:v12 options:a4 completionHandler:v19];
}

uint64_t __91__SGMessagesSuggestionsService_harvestedSuggestionsFromMessages_options_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __91__SGMessagesSuggestionsService_harvestedSuggestionsFromMessages_options_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  id v7 = [v3 error];
  v4 = [v3 response1];
  v5 = [v3 response2];
  v6 = [v3 response3];

  (*(void (**)(uint64_t, id, void *, void *, void *))(v2 + 16))(v2, v7, v4, v5, v6);
}

- (void)harvestedSuggestionsFromMessage:(id)a3 bundleIdentifier:(id)a4 options:(unint64_t)a5 withCompletion:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  if (!v11)
  {
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"SGMessagesSuggestionsService.m", 184, @"Invalid parameter not satisfying: %@", @"message" object file lineNumber description];
  }
  if ([(SGMessagesSuggestionsService *)self isMessageEligibleForSuggestions:v11])
  {
    if (v12)
    {
      id v14 = v12;
    }
    else
    {
      v15 = [MEMORY[0x1E4F28B50] mainBundle];
      id v14 = [v15 bundleIdentifier];

      if (!v14)
      {
        id v20 = [MEMORY[0x1E4F28B00] currentHandler];
        [v20 handleFailureInMethod:a2, self, @"SGMessagesSuggestionsService.m", 191, @"Invalid parameter not satisfying: %@", @"bundleIdentifier" object file lineNumber description];

        id v14 = 0;
      }
    }
    messagesDaemonConnection = self->_messagesDaemonConnection;
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __104__SGMessagesSuggestionsService_harvestedSuggestionsFromMessage_bundleIdentifier_options_withCompletion___block_invoke;
    v23[3] = &unk_1E5B90460;
    id v17 = v13;
    id v24 = v17;
    v18 = [(SGMessagesDaemonConnection *)messagesDaemonConnection remoteSuggestionManagerWithErrorHandler:v23];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __104__SGMessagesSuggestionsService_harvestedSuggestionsFromMessage_bundleIdentifier_options_withCompletion___block_invoke_2;
    v21[3] = &unk_1E5B904B0;
    id v22 = v17;
    [v18 harvestedSuggestionsFromMessage:v11 bundleIdentifier:v14 options:a5 withCompletion:v21];
  }
  else
  {
    (*((void (**)(id, void, void))v13 + 2))(v13, 0, 0);
  }
}

uint64_t __104__SGMessagesSuggestionsService_harvestedSuggestionsFromMessage_bundleIdentifier_options_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __104__SGMessagesSuggestionsService_harvestedSuggestionsFromMessage_bundleIdentifier_options_withCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  id v5 = [v3 error];
  v4 = [v3 response1];

  (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v5, v4);
}

- (void)harvestedSuggestionsFromMessage:(id)a3 bundleIdentifier:(id)a4 options:(unint64_t)a5 completionHandler:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  if (!v11)
  {
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"SGMessagesSuggestionsService.m", 158, @"Invalid parameter not satisfying: %@", @"message" object file lineNumber description];
  }
  if ([(SGMessagesSuggestionsService *)self isMessageEligibleForSuggestions:v11])
  {
    if (v12)
    {
      id v14 = v12;
    }
    else
    {
      v15 = [MEMORY[0x1E4F28B50] mainBundle];
      id v14 = [v15 bundleIdentifier];

      if (!v14)
      {
        id v20 = [MEMORY[0x1E4F28B00] currentHandler];
        [v20 handleFailureInMethod:a2, self, @"SGMessagesSuggestionsService.m", 165, @"Invalid parameter not satisfying: %@", @"bundleIdentifier" object file lineNumber description];

        id v14 = 0;
      }
    }
    messagesDaemonConnection = self->_messagesDaemonConnection;
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __107__SGMessagesSuggestionsService_harvestedSuggestionsFromMessage_bundleIdentifier_options_completionHandler___block_invoke;
    v23[3] = &unk_1E5B90460;
    id v17 = v13;
    id v24 = v17;
    v18 = [(SGMessagesDaemonConnection *)messagesDaemonConnection remoteSuggestionManagerWithErrorHandler:v23];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __107__SGMessagesSuggestionsService_harvestedSuggestionsFromMessage_bundleIdentifier_options_completionHandler___block_invoke_2;
    v21[3] = &unk_1E5B90488;
    id v22 = v17;
    [v18 harvestedSuggestionsFromMessage:v11 bundleIdentifier:v14 options:a5 completionHandler:v21];
  }
  else
  {
    (*((void (**)(id, void, void, void))v13 + 2))(v13, 0, MEMORY[0x1E4F1CBF0], MEMORY[0x1E4F1CBF0]);
  }
}

uint64_t __107__SGMessagesSuggestionsService_harvestedSuggestionsFromMessage_bundleIdentifier_options_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __107__SGMessagesSuggestionsService_harvestedSuggestionsFromMessage_bundleIdentifier_options_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  id v6 = [v3 error];
  v4 = [v3 response1];
  id v5 = [v3 response2];

  (*(void (**)(uint64_t, id, void *, void *))(v2 + 16))(v2, v6, v4, v5);
}

- (void)suggestionsFromMessage:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  if (!v9)
  {
    id v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"SGMessagesSuggestionsService.m", 134, @"Invalid parameter not satisfying: %@", @"message" object file lineNumber description];
  }
  if ([(SGMessagesSuggestionsService *)self isMessageEligibleForSuggestions:v9])
  {
    [(SGMessagesSuggestionsService *)self sendContextForMessage:v9];
    messagesDaemonConnection = self->_messagesDaemonConnection;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __81__SGMessagesSuggestionsService_suggestionsFromMessage_options_completionHandler___block_invoke;
    v17[3] = &unk_1E5B90460;
    id v12 = v10;
    id v18 = v12;
    id v13 = [(SGMessagesDaemonConnection *)messagesDaemonConnection remoteSuggestionManagerWithErrorHandler:v17];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __81__SGMessagesSuggestionsService_suggestionsFromMessage_options_completionHandler___block_invoke_2;
    v15[3] = &unk_1E5B90488;
    id v16 = v12;
    [v13 suggestionsFromMessage:v9 options:a4 completionHandler:v15];
  }
  else
  {
    (*((void (**)(id, void, void, void, void))v10 + 2))(v10, 0, MEMORY[0x1E4F1CBF0], MEMORY[0x1E4F1CBF0], MEMORY[0x1E4F1CBF0]);
  }
}

uint64_t __81__SGMessagesSuggestionsService_suggestionsFromMessage_options_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __81__SGMessagesSuggestionsService_suggestionsFromMessage_options_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  id v7 = [v3 error];
  v4 = [v3 response1];
  id v5 = [v3 response2];
  id v6 = [v3 response3];

  (*(void (**)(uint64_t, id, void *, void *, void *))(v2 + 16))(v2, v7, v4, v5, v6);
}

- (BOOL)isMessageEligibleForSuggestions:(id)a3
{
  id v3 = [a3 attributeSet];
  v4 = [v3 contentCreationDate];
  [v4 timeIntervalSinceNow];
  BOOL v6 = v5 > -3600.0;

  return v6;
}

- (void)sendContextForMessage:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a3 domainIdentifier];
  if (!v5)
  {
    id v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"SGMessagesSuggestionsService.m", 112, @"Invalid parameter not satisfying: %@", @"conversationIdentifier" object file lineNumber description];
  }
  [(SGMessagesSuggestionsService *)self setupContextIfNeededForConversation:v5];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v14 = (void *)v5;
  BOOL v6 = [(NSMutableDictionary *)self->_previousMessages objectForKeyedSubscript:v5];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        id v12 = [(SGMessagesDaemonConnection *)self->_messagesDaemonConnection remoteSuggestionManagerWithErrorHandler:&__block_literal_global_9131];
        [v12 suggestionsFromMessage:v11 options:3 completionHandler:&__block_literal_global_96_9132];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }
}

- (void)setupContextIfNeededForConversation:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(NSMutableDictionary *)self->_previousMessages objectForKeyedSubscript:v4];

  if (!v5)
  {
    BOOL v6 = [[SGCircularBufferArray alloc] initWithCapacity:10];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v7 = [(SGMessagesSuggestionsService *)self delegate];
    uint64_t v8 = [v7 suggestionsService:self needsContextForConversationIdentifier:v4 numberOfMessagesNeeded:10];

    uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v14;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v14 != v11) {
            objc_enumerationMutation(v8);
          }
          [(SGCircularBufferArray *)v6 addObject:*(void *)(*((void *)&v13 + 1) + 8 * v12++)];
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v10);
    }

    [(NSMutableDictionary *)self->_previousMessages setObject:v6 forKeyedSubscript:v4];
  }
}

- (void)setManagerForTesting:(id)a3
{
}

- (SGMessagesSuggestionsService)init
{
  v8.receiver = self;
  v8.super_class = (Class)SGMessagesSuggestionsService;
  uint64_t v2 = [(SGSuggestionsService *)&v8 initWithMachServiceName:@"com.apple.suggestd.messages" protocol:&unk_1EF936EF0];
  if (v2)
  {
    id v3 = [[SGMessagesDaemonConnection alloc] initWithDaemonConnectionFuture:v2->super._daemonConnectionFuture];
    messagesDaemonConnection = v2->_messagesDaemonConnection;
    v2->_messagesDaemonConnection = v3;

    uint64_t v5 = objc_opt_new();
    previousMessages = v2->_previousMessages;
    v2->_previousMessages = (NSMutableDictionary *)v5;
  }
  return v2;
}

@end