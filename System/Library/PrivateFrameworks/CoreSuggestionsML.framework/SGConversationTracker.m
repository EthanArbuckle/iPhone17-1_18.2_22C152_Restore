@interface SGConversationTracker
+ (id)getMergedPromptForMessage:(id)a3 conversationTurns:(id)a4 maxPromptLength:(unint64_t)a5 maxPromptWindowSeconds:(double)a6 promptJoiningString:(id)a7;
+ (id)instance;
+ (id)sgConversationTurnsForStrings:(id)a3;
- (SGConversationTracker)init;
- (id)addMessage:(id)a3;
- (id)conversationForSenderID:(id)a3;
- (void)clear;
@end

@implementation SGConversationTracker

- (void).cxx_destruct
{
}

- (void)clear
{
}

- (id)addMessage:(id)a3
{
  v23[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 senderID];

  if (v5)
  {
    conversations = self->_conversations;
    v7 = [v4 senderID];
    v8 = [(_PASLRUCache *)conversations objectForKey:v7];

    if (v8)
    {
      uint64_t v17 = 0;
      v18 = &v17;
      uint64_t v19 = 0x3032000000;
      v20 = __Block_byref_object_copy__1125;
      v21 = __Block_byref_object_dispose__1126;
      id v22 = 0;
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __36__SGConversationTracker_addMessage___block_invoke;
      v14[3] = &unk_2647EB018;
      id v15 = v4;
      v16 = &v17;
      [v8 runWithLockAcquired:v14];
      id v9 = (id)v18[5];

      _Block_object_dispose(&v17, 8);
    }
    else
    {
      v10 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithObjects:", v4, 0);
      v8 = (void *)[objc_alloc(MEMORY[0x263F61E70]) initWithGuardedData:v10];
      v11 = self->_conversations;
      v12 = [v4 senderID];
      [(_PASLRUCache *)v11 setObject:v8 forKey:v12];

      id v9 = (id)[v10 copy];
    }
  }
  else
  {
    v23[0] = v4;
    id v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:1];
  }

  return v9;
}

void __36__SGConversationTracker_addMessage___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __36__SGConversationTracker_addMessage___block_invoke_2;
  v13[3] = &unk_2647EAFF0;
  id v14 = *(id *)(a1 + 32);
  uint64_t v4 = [v3 indexOfObjectWithOptions:2 passingTest:v13];
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    [v3 addObject:*(void *)(a1 + 32)];
    if ((unint64_t)[v3 count] >= 6) {
      [v3 removeObjectAtIndex:0];
    }
    uint64_t v5 = [v3 count];
  }
  else
  {
    uint64_t v6 = v4;
    v7 = sgLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v12 = [*(id *)(a1 + 32) senderID];
      *(_DWORD *)buf = 138412290;
      v16 = v12;
      _os_log_debug_impl(&dword_226E32000, v7, OS_LOG_TYPE_DEBUG, "Added message id already in conversation. conversation id = %@", buf, 0xCu);
    }
    uint64_t v5 = v6 + 1;
  }
  v8 = objc_msgSend(v3, "subarrayWithRange:", 0, v5);
  uint64_t v9 = [v8 copy];
  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
  v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;
}

uint64_t __36__SGConversationTracker_addMessage___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 isEqualToConversationTurn:*(void *)(a1 + 32)];
}

- (id)conversationForSenderID:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = [(_PASLRUCache *)self->_conversations objectForKey:v4];
    uint64_t v6 = v5;
    if (v5)
    {
      uint64_t v10 = 0;
      v11 = &v10;
      uint64_t v12 = 0x3032000000;
      v13 = __Block_byref_object_copy__1125;
      id v14 = __Block_byref_object_dispose__1126;
      id v15 = 0;
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 3221225472;
      v9[2] = __49__SGConversationTracker_conversationForSenderID___block_invoke;
      v9[3] = &unk_2647EAFC8;
      v9[4] = &v10;
      [v5 runWithLockAcquired:v9];
      id v7 = (id)v11[5];
      _Block_object_dispose(&v10, 8);
    }
    else
    {
      id v7 = 0;
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

uint64_t __49__SGConversationTracker_conversationForSenderID___block_invoke(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = [a2 copy];
  return MEMORY[0x270F9A758]();
}

- (SGConversationTracker)init
{
  v6.receiver = self;
  v6.super_class = (Class)SGConversationTracker;
  v2 = [(SGConversationTracker *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x263F61E50]) initWithCountLimit:5];
    conversations = v2->_conversations;
    v2->_conversations = (_PASLRUCache *)v3;
  }
  return v2;
}

+ (id)getMergedPromptForMessage:(id)a3 conversationTurns:(id)a4 maxPromptLength:(unint64_t)a5 maxPromptWindowSeconds:(double)a6 promptJoiningString:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a7;
  if ((unint64_t)[v12 count] > 1)
  {
    id v15 = (void *)MEMORY[0x22A66BDC0]();
    v16 = [v12 sortedArrayWithOptions:16 usingComparator:&__block_literal_global_12];
    uint64_t v17 = [v16 lastObject];
    v18 = [v17 text];
    uint64_t v19 = _PASRepairString();
    char v20 = [v11 isEqualToString:v19];

    if (v20)
    {
      v40 = [v17 timestamp];
      v37 = v17;
      uint64_t v21 = [v17 senderID];
      uint64_t v22 = [v13 length];
      unint64_t v23 = [v16 count];
      id v38 = v11;
      if ((uint64_t)(v23 - 1) < 0)
      {
        v27 = (void *)v21;
        uint64_t v17 = v37;
      }
      else
      {
        v24 = [v16 objectAtIndexedSubscript:v23 - 1];
        if (v21)
        {
          unint64_t v39 = a5;
          unint64_t v25 = -v22;
          while (1)
          {
            v26 = [v24 senderID];
            v27 = (void *)v21;
            int v28 = [v26 isEqualToString:v21];

            if (!v28) {
              goto LABEL_16;
            }
            v29 = [v24 timestamp];
            [v40 timeIntervalSinceDate:v29];
            double v31 = v30;

            if (v31 > a6
              || ([v24 text],
                  v32 = objc_claimAutoreleasedReturnValue(),
                  v25 += v22 + [v32 length],
                  v32,
                  v25 > v39))
            {
LABEL_16:
              uint64_t v17 = v37;
              a5 = v39;
              goto LABEL_18;
            }

            if ((uint64_t)(v23 - 1) <= 0) {
              break;
            }
            v24 = [v16 objectAtIndexedSubscript:v23 - 2];
            --v23;
            uint64_t v21 = (uint64_t)v27;
          }
          unint64_t v23 = 0;
          uint64_t v17 = v37;
          a5 = v39;
        }
        else
        {
          v27 = 0;
          uint64_t v17 = v37;
LABEL_18:
        }
      }
      v33 = (void *)[objc_alloc(MEMORY[0x263F089D8]) initWithCapacity:a5];
      while (v23 < [v16 count] - 1)
      {
        v34 = [v16 objectAtIndexedSubscript:v23];
        v35 = [v34 text];
        [v33 appendString:v35];

        [v33 appendString:v13];
        ++v23;
      }
      [v33 appendString:v38];
      _PASRepairString();
      id v14 = (id)objc_claimAutoreleasedReturnValue();

      id v11 = v38;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_226E32000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Most recent message in conversation turns does not match specified current message.", buf, 2u);
      }
      id v14 = v11;
    }
  }
  else
  {
    id v14 = v11;
  }

  return v14;
}

uint64_t __128__SGConversationTracker_getMergedPromptForMessage_conversationTurns_maxPromptLength_maxPromptWindowSeconds_promptJoiningString___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [a2 timestamp];
  objc_super v6 = [v4 timestamp];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

+ (id)sgConversationTurnsForStrings:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x263EFF910] date];
  [v4 timeIntervalSince1970];
  double v6 = v5;

  uint64_t v7 = objc_opt_new();
  if ([v3 count])
  {
    unint64_t v8 = 0;
    double v9 = v6 + -0.1;
    do
    {
      uint64_t v10 = [MEMORY[0x263EFF910] dateWithTimeIntervalSince1970:v9 + (double)v8 * 0.0001];
      id v11 = objc_alloc(MEMORY[0x263F38248]);
      id v12 = [v3 objectAtIndexedSubscript:v8];
      id v13 = (void *)[v11 initWithText:v12 senderID:@"sender" timestamp:v10];

      [v7 addObject:v13];
      ++v8;
    }
    while (v8 < [v3 count]);
  }

  return v7;
}

+ (id)instance
{
  if (instance__pasOnceToken2 != -1) {
    dispatch_once(&instance__pasOnceToken2, &__block_literal_global_1143);
  }
  v2 = (void *)instance__pasExprOnceResult;
  return v2;
}

void __33__SGConversationTracker_instance__block_invoke()
{
  v0 = (void *)MEMORY[0x22A66BDC0]();
  uint64_t v1 = objc_opt_new();
  v2 = (void *)instance__pasExprOnceResult;
  instance__pasExprOnceResult = v1;
}

@end