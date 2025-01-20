@interface SGAutonamingConsumer
+ (id)sharedInstance;
- (SGAutonamingConsumer)init;
- (id)consumeMessagesContentWithContext:(id)a3;
- (id)consumerName;
- (id)deleteDataDerivedFromContentMatchingRequest:(id)a3;
- (int)_sendEvents:(id)a3;
@end

@implementation SGAutonamingConsumer

- (id)deleteDataDerivedFromContentMatchingRequest:(id)a3
{
  id v5 = a3;
  v6 = BiomeLibrary();
  v7 = [v6 Autonaming];
  v8 = [v7 Messages];
  v9 = [v8 MessageIds];

  v10 = objc_opt_new();
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __68__SGAutonamingConsumer_deleteDataDerivedFromContentMatchingRequest___block_invoke;
  v27[3] = &unk_1E65BB270;
  v27[4] = self;
  SEL v30 = a2;
  id v28 = v9;
  id v29 = v10;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __68__SGAutonamingConsumer_deleteDataDerivedFromContentMatchingRequest___block_invoke_2;
  v23[3] = &unk_1E65BB2C0;
  v23[4] = self;
  SEL v26 = a2;
  id v24 = v28;
  id v25 = v29;
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  v17 = __68__SGAutonamingConsumer_deleteDataDerivedFromContentMatchingRequest___block_invoke_2_17;
  v18 = &unk_1E65BB2E8;
  v19 = self;
  id v20 = v24;
  id v21 = v25;
  SEL v22 = a2;
  id v11 = v25;
  id v12 = v24;
  [v5 accessCriteriaUsingBundleIdentifierBlock:v27 domainSelectionBlock:v23 uniqueIdentifiersBlock:&v15];

  -[SGAutonamingConsumer _sendEvents:](self, "_sendEvents:", v11, v15, v16, v17, v18, v19);
  v13 = [MEMORY[0x1E4F93758] successWithNumberOfExtractions:0];

  return v13;
}

void __68__SGAutonamingConsumer_deleteDataDerivedFromContentMatchingRequest___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = sgLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = (objc_class *)objc_opt_class();
    v6 = NSStringFromClass(v5);
    v7 = NSStringFromSelector(*(SEL *)(a1 + 56));
    *(_DWORD *)buf = 138412802;
    v14 = v6;
    __int16 v15 = 2112;
    uint64_t v16 = v7;
    __int16 v17 = 2112;
    id v18 = v3;
    _os_log_impl(&dword_1CA650000, v4, OS_LOG_TYPE_DEFAULT, "%@: %@: deletion requested for bundle id %@", buf, 0x20u);
  }
  v8 = [*(id *)(a1 + 40) pruner];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __68__SGAutonamingConsumer_deleteDataDerivedFromContentMatchingRequest___block_invoke_12;
  v10[3] = &unk_1E65BB248;
  id v11 = v3;
  id v12 = *(id *)(a1 + 48);
  id v9 = v3;
  [v8 deleteWithPolicy:@"autonaming-messageids" eventsPassingTest:v10];
}

void __68__SGAutonamingConsumer_deleteDataDerivedFromContentMatchingRequest___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v7 = sgLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (objc_class *)objc_opt_class();
    id v9 = NSStringFromClass(v8);
    v10 = NSStringFromSelector(*(SEL *)(a1 + 56));
    *(_DWORD *)buf = 138413059;
    uint64_t v19 = v9;
    __int16 v20 = 2112;
    id v21 = v10;
    __int16 v22 = 2112;
    id v23 = v5;
    __int16 v24 = 2113;
    id v25 = v6;
    _os_log_impl(&dword_1CA650000, v7, OS_LOG_TYPE_DEFAULT, "%@: %@: deletion requested for bundle id %@ domain selection %{private}@", buf, 0x2Au);
  }
  id v11 = [*(id *)(a1 + 40) pruner];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __68__SGAutonamingConsumer_deleteDataDerivedFromContentMatchingRequest___block_invoke_15;
  v14[3] = &unk_1E65BB298;
  id v15 = v5;
  id v16 = v6;
  id v17 = *(id *)(a1 + 48);
  id v12 = v6;
  id v13 = v5;
  [v11 deleteWithPolicy:@"autonaming-messageids" eventsPassingTest:v14];
}

void __68__SGAutonamingConsumer_deleteDataDerivedFromContentMatchingRequest___block_invoke_2_17(uint64_t a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v7 = sgLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (objc_class *)objc_opt_class();
    id v9 = NSStringFromClass(v8);
    v10 = NSStringFromSelector(*(SEL *)(a1 + 56));
    *(_DWORD *)buf = 138413059;
    uint64_t v19 = v9;
    __int16 v20 = 2112;
    id v21 = v10;
    __int16 v22 = 2112;
    id v23 = v5;
    __int16 v24 = 2113;
    id v25 = v6;
    _os_log_impl(&dword_1CA650000, v7, OS_LOG_TYPE_DEFAULT, "%@: %@: deletion requested for bundle id %@ unique identifiers %{private}@", buf, 0x2Au);
  }
  id v11 = [*(id *)(a1 + 40) pruner];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __68__SGAutonamingConsumer_deleteDataDerivedFromContentMatchingRequest___block_invoke_18;
  v14[3] = &unk_1E65BB298;
  id v15 = v5;
  id v16 = v6;
  id v17 = *(id *)(a1 + 48);
  id v12 = v6;
  id v13 = v5;
  [v11 deleteWithPolicy:@"autonaming-messageids" eventsPassingTest:v14];
}

uint64_t __68__SGAutonamingConsumer_deleteDataDerivedFromContentMatchingRequest___block_invoke_18(uint64_t a1, void *a2)
{
  id v3 = [a2 eventBody];
  v4 = v3;
  if (v3)
  {
    id v5 = *(void **)(a1 + 32);
    id v6 = [v3 bundleId];
    uint64_t v7 = [v5 isEqualToString:v6];
    if (v7)
    {
      v8 = *(void **)(a1 + 40);
      id v9 = [v4 spotlightId];
      LODWORD(v8) = [v8 containsObject:v9];

      if (!v8)
      {
        uint64_t v7 = 0;
        goto LABEL_8;
      }
      id v18 = objc_alloc(MEMORY[0x1E4F4FD38]);
      id v17 = [v4 bundleId];
      v10 = [v4 domainId];
      id v11 = [v4 spotlightId];
      id v12 = [v4 messageId];
      id v13 = [v4 conversationId];
      v14 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v4, "containsImageAttachment"));
      id v15 = [v4 messageTimestamp];
      id v6 = (void *)[v18 initWithProtoVersion:&unk_1F2536688 bundleId:v17 domainId:v10 spotlightId:v11 messageId:v12 conversationId:v13 isDeletion:MEMORY[0x1E4F1CC38] containsImageAttachment:v14 messageTimestamp:v15];

      [*(id *)(a1 + 48) addObject:v6];
    }
  }
  else
  {
    uint64_t v7 = 1;
  }
LABEL_8:

  return v7;
}

uint64_t __68__SGAutonamingConsumer_deleteDataDerivedFromContentMatchingRequest___block_invoke_15(uint64_t a1, void *a2)
{
  id v3 = [a2 eventBody];
  v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 domainId];
    if (v5)
    {
      id v6 = (void *)v5;
      uint64_t v7 = *(void **)(a1 + 32);
      v8 = [v4 bundleId];
      if (([v7 isEqualToString:v8] & 1) == 0)
      {

        uint64_t v19 = 0;
        goto LABEL_9;
      }
      id v9 = *(void **)(a1 + 40);
      v10 = [v4 domainId];
      LODWORD(v9) = [v9 containsDomain:v10];

      if (v9)
      {
        id v11 = objc_alloc(MEMORY[0x1E4F4FD38]);
        uint64_t v12 = *MEMORY[0x1E4F5DC38];
        id v13 = [v4 domainId];
        v14 = [v4 spotlightId];
        id v15 = [v4 messageId];
        id v16 = [v4 conversationId];
        id v17 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v4, "containsImageAttachment"));
        id v18 = [v4 messageTimestamp];
        id v6 = (void *)[v11 initWithProtoVersion:&unk_1F2536688 bundleId:v12 domainId:v13 spotlightId:v14 messageId:v15 conversationId:v16 isDeletion:MEMORY[0x1E4F1CC38] containsImageAttachment:v17 messageTimestamp:v18];

        [*(id *)(a1 + 48) addObject:v6];
        uint64_t v19 = 1;
LABEL_9:

        goto LABEL_10;
      }
    }
    uint64_t v19 = 0;
  }
  else
  {
    uint64_t v19 = 1;
  }
LABEL_10:

  return v19;
}

uint64_t __68__SGAutonamingConsumer_deleteDataDerivedFromContentMatchingRequest___block_invoke_12(uint64_t a1, void *a2)
{
  id v3 = [a2 eventBody];
  v4 = v3;
  if (v3)
  {
    uint64_t v5 = *(void **)(a1 + 32);
    id v6 = [v3 bundleId];
    LODWORD(v5) = [v5 isEqualToString:v6];

    if (!v5)
    {
      uint64_t v16 = 0;
      goto LABEL_6;
    }
    id v7 = objc_alloc(MEMORY[0x1E4F4FD38]);
    uint64_t v8 = *MEMORY[0x1E4F5DC38];
    id v9 = [v4 domainId];
    v10 = [v4 spotlightId];
    id v11 = [v4 messageId];
    uint64_t v12 = [v4 conversationId];
    id v13 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v4, "containsImageAttachment"));
    v14 = [v4 messageTimestamp];
    id v15 = (void *)[v7 initWithProtoVersion:&unk_1F2536688 bundleId:v8 domainId:v9 spotlightId:v10 messageId:v11 conversationId:v12 isDeletion:MEMORY[0x1E4F1CC38] containsImageAttachment:v13 messageTimestamp:v14];

    [*(id *)(a1 + 40) addObject:v15];
  }
  uint64_t v16 = 1;
LABEL_6:

  return v16;
}

- (id)consumeMessagesContentWithContext:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [v5 content];
  id v7 = [v6 isGroupThread];
  char v8 = [v7 BOOLValue];

  id v9 = sgLogHandle();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v10)
    {
      id v11 = (objc_class *)objc_opt_class();
      uint64_t v12 = NSStringFromClass(v11);
      id v13 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138413059;
      v33 = v12;
      __int16 v34 = 2112;
      v35 = v13;
      __int16 v36 = 2112;
      id v37 = v5;
      __int16 v38 = 2117;
      v39 = v6;
      _os_log_impl(&dword_1CA650000, v9, OS_LOG_TYPE_DEFAULT, "%@: %@ %@: %{sensitive}@ -- rejected for autonaming stream", buf, 0x2Au);
    }
    uint64_t v14 = 0;
  }
  else
  {
    if (v10)
    {
      id v15 = (objc_class *)objc_opt_class();
      uint64_t v16 = NSStringFromClass(v15);
      id v17 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138413059;
      v33 = v16;
      __int16 v34 = 2112;
      v35 = v17;
      __int16 v36 = 2112;
      id v37 = v5;
      __int16 v38 = 2117;
      v39 = v6;
      _os_log_impl(&dword_1CA650000, v9, OS_LOG_TYPE_DEFAULT, "%@: %@ %@: %{sensitive}@ -- selected for autonaming stream", buf, 0x2Au);
    }
    id v18 = objc_alloc(MEMORY[0x1E4F1C9C8]);
    [v6 absoluteTimestamp];
    id v9 = objc_msgSend(v18, "initWithTimeIntervalSinceReferenceDate:");
    id v19 = objc_alloc(MEMORY[0x1E4F4FD38]);
    uint64_t v20 = *MEMORY[0x1E4F5DC38];
    id v21 = [v6 domainId];
    __int16 v22 = [v6 uniqueId];
    id v23 = [v6 uniqueId];
    __int16 v24 = [v6 conversationId];
    id v25 = (void *)[v19 initWithProtoVersion:&unk_1F2536688 bundleId:v20 domainId:v21 spotlightId:v22 messageId:v23 conversationId:v24 isDeletion:MEMORY[0x1E4F1CC28] containsImageAttachment:MEMORY[0x1E4F1CC38] messageTimestamp:v9];

    v31 = v25;
    uint64_t v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v31 count:1];
    uint64_t v14 = [(SGAutonamingConsumer *)self _sendEvents:v26];
  }
  v27 = (void *)MEMORY[0x1E4F93758];
  id v28 = [NSNumber numberWithInt:v14];
  id v29 = [v27 successWithNumberOfExtractions:v28];

  return v29;
}

- (int)_sendEvents:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v17;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v17 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v16 + 1) + 8 * v7);
        id v9 = BiomeLibrary();
        BOOL v10 = [v9 Autonaming];
        id v11 = [v10 Messages];
        uint64_t v12 = [v11 MessageIds];
        id v13 = [v12 source];
        [v13 sendEvent:v8];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v5);
  }
  int v14 = [v3 count];

  return v14;
}

- (id)consumerName
{
  return @"com.apple.CoreSuggestionsInternals.AutonamingConsumer";
}

- (SGAutonamingConsumer)init
{
  v5.receiver = self;
  v5.super_class = (Class)SGAutonamingConsumer;
  v2 = [(SGAutonamingConsumer *)&v5 init];
  if (v2)
  {
    id v3 = [MEMORY[0x1E4F93750] defaultCoordinator];
    [v3 registerMessagesConsumer:v2 levelOfService:1];
  }
  return v2;
}

+ (id)sharedInstance
{
  if (sharedInstance__pasOnceToken2_28205 != -1) {
    dispatch_once(&sharedInstance__pasOnceToken2_28205, &__block_literal_global_28206);
  }
  v2 = (void *)sharedInstance__pasExprOnceResult_28207;
  return v2;
}

void __38__SGAutonamingConsumer_sharedInstance__block_invoke()
{
  v0 = (void *)MEMORY[0x1CB79B230]();
  uint64_t v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_28207;
  sharedInstance__pasExprOnceResult_28207 = v1;
}

@end