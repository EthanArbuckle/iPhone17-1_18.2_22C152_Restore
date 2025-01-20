@interface SGTextMessageConversationTracker
+ (id)getMergedPrompt:(id)a3 withParams:(id)a4;
+ (id)instance;
- (SGTextMessageConversationTracker)init;
- (id)addTextMessageItem:(id)a3;
- (id)conversationForIdentifier:(id)a3;
- (void)clear;
@end

@implementation SGTextMessageConversationTracker

- (void).cxx_destruct
{
}

- (void)clear
{
}

- (id)addTextMessageItem:(id)a3
{
  id v5 = a3;
  v6 = [(SGConversationTracker *)self->_conversationTracker addMessage:v5];
  v7 = [v6 firstObject];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"SGTextMessageConversationTracker.m", 51, @"Invalid parameter not satisfying: %@", @"[conversation.firstObject isKindOfClass:[SGTextMessageItem class]]" object file lineNumber description];
  }
  v9 = (void *)MEMORY[0x1CB79B230]();
  v10 = [[SGConversationHistory alloc] initWithMessages:v6];

  return v10;
}

- (id)conversationForIdentifier:(id)a3
{
  id v5 = [(SGConversationTracker *)self->_conversationTracker conversationForSenderID:a3];
  v6 = [v5 firstObject];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"SGTextMessageConversationTracker.m", 44, @"Invalid parameter not satisfying: %@", @"[result.firstObject isKindOfClass:[SGTextMessageItem class]]" object file lineNumber description];
  }
  return v5;
}

- (SGTextMessageConversationTracker)init
{
  v6.receiver = self;
  v6.super_class = (Class)SGTextMessageConversationTracker;
  v2 = [(SGTextMessageConversationTracker *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    conversationTracker = v2->_conversationTracker;
    v2->_conversationTracker = (SGConversationTracker *)v3;
  }
  return v2;
}

+ (id)getMergedPrompt:(id)a3 withParams:(id)a4
{
  id v5 = a4;
  objc_super v6 = [a3 messages];
  if ((unint64_t)[v6 count] > 1)
  {
    v31 = v5;
    v9 = objc_msgSend(v6, "objectAtIndexedSubscript:", objc_msgSend(v6, "count") - 2);
    v10 = objc_msgSend(v6, "objectAtIndexedSubscript:", objc_msgSend(v6, "count") - 1);
    v30 = v9;
    v11 = [v9 message];
    v12 = [v11 sender];
    v13 = [v12 handles];
    v14 = [v13 firstObject];
    v29 = v10;
    v15 = [v10 message];
    v16 = [v15 sender];
    v17 = [v16 handles];
    v18 = [v17 firstObject];
    LODWORD(v10) = [v14 isEqualToString:v18];

    if (v10)
    {
      v19 = sgLogHandle();
      id v5 = v31;
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_1CA650000, v19, OS_LOG_TYPE_DEBUG, "Quick responses: Most recent message is not a response to a prompt", buf, 2u);
      }
      v8 = 0;
    }
    else
    {
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __63__SGTextMessageConversationTracker_getMergedPrompt_withParams___block_invoke;
      v32[3] = &unk_1E65B7B10;
      v33 = v6;
      v20 = [v33 _pas_mappedArrayWithIndexedTransform:v32];
      v21 = (void *)MEMORY[0x1E4F5DF98];
      v22 = [v20 lastObject];
      v23 = [v22 text];
      id v5 = v31;
      uint64_t v24 = [v31 maxPromptLength];
      [v31 maxPromptWindowSeconds];
      double v26 = v25;
      v27 = [v31 promptJoiningString];
      v8 = [v21 getMergedPromptForMessage:v23 conversationTurns:v20 maxPromptLength:v24 maxPromptWindowSeconds:v27 promptJoiningString:v26];

      v19 = v33;
    }
    v7 = v30;
  }
  else
  {
    v7 = sgLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1CA650000, v7, OS_LOG_TYPE_DEBUG, "Quick responses: A conversation must have more than 2 messages for a prompt; returning prompt as nil",
        buf,
        2u);
    }
    v8 = 0;
  }

  return v8;
}

id __63__SGTextMessageConversationTracker_getMergedPrompt_withParams___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v5 = a2;
  if ([*(id *)(a1 + 32) count] - 1 <= a3)
  {
    v13 = 0;
  }
  else
  {
    objc_super v6 = [v5 message];
    v7 = [v6 sender];
    v8 = [v7 handles];
    v9 = [v8 firstObject];

    id v10 = objc_alloc(MEMORY[0x1E4F5D9C0]);
    v11 = [v5 text];
    v12 = [v5 timestamp];
    v13 = (void *)[v10 initWithText:v11 senderID:v9 timestamp:v12];
  }
  return v13;
}

+ (id)instance
{
  if (instance__pasOnceToken2 != -1) {
    dispatch_once(&instance__pasOnceToken2, &__block_literal_global_13185);
  }
  v2 = (void *)instance__pasExprOnceResult;
  return v2;
}

void __44__SGTextMessageConversationTracker_instance__block_invoke()
{
  v0 = (void *)MEMORY[0x1CB79B230]();
  uint64_t v1 = objc_opt_new();
  v2 = (void *)instance__pasExprOnceResult;
  instance__pasExprOnceResult = v1;
}

@end