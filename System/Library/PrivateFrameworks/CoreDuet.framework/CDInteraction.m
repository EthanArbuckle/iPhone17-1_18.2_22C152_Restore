@interface CDInteraction
@end

@implementation CDInteraction

void __29___CDInteraction__internPool__block_invoke()
{
  v0 = (void *)MEMORY[0x192FB2F20]();
  uint64_t v1 = objc_opt_new();
  v2 = (void *)_internPool__pasExprOnceResult;
  _internPool__pasExprOnceResult = v1;
}

uint64_t __67___CDInteraction_generateConversationIdFromObjectsWithIdentifiers___block_invoke(uint64_t a1, void **a2, id *a3)
{
  v3 = *a2;
  id v4 = *a3;
  id v5 = v3;
  v6 = [v5 identifier];
  v7 = [v4 identifier];

  uint64_t v8 = [v6 compare:v7 options:3];
  return v8;
}

void __67___CDInteraction_recipientIdentifiersFromMobileMailConversationId___block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  if ([v8 rangeOfString:@"%" options:2] == 0x7FFFFFFFFFFFFFFFLL)
  {
    [*(id *)(a1 + 32) addObject:v8];
  }
  else
  {
    v3 = (void *)MEMORY[0x192FB2F20]();
    id v4 = *(void **)(a1 + 32);
    uint64_t v5 = [v8 stringByRemovingPercentEncoding];
    v6 = (void *)v5;
    if (v5) {
      v7 = (__CFString *)v5;
    }
    else {
      v7 = &stru_1EDDE58B8;
    }
    [v4 addObject:v7];
  }
}

void __78___CDInteraction_fetchAndAddShareSheetContentToInteractionWithKnowledgeStore___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 state] == 1)
  {
    v3 = +[_CDLogging interactionChannel];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __78___CDInteraction_fetchAndAddShareSheetContentToInteractionWithKnowledgeStore___block_invoke_cold_1(v2, v3);
    }
  }
}

void __78___CDInteraction_fetchAndAddShareSheetContentToInteractionWithKnowledgeStore___block_invoke_749(uint64_t a1, void *a2)
{
  id v22 = a2;
  v3 = [v22 eventBody];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
    uint64_t v5 = [v4 targetBundleID];
    if (v5)
    {
      v6 = (void *)v5;
      uint64_t v7 = [v4 targetBundleID];
      if (v7)
      {
        id v8 = (void *)v7;
        v9 = [*(id *)(a1 + 32) allObjects];
        v10 = [v4 targetBundleID];
        int v11 = [v9 containsObject:v10];

        if (!v11) {
          goto LABEL_8;
        }
      }
      else
      {
      }
      v12 = [*(id *)(a1 + 40) metadataFromFeedbackEvent:v4];
      v13 = (void *)MEMORY[0x1E4F1C9C8];
      [v22 timestamp];
      v14 = objc_msgSend(v13, "dateWithTimeIntervalSinceReferenceDate:");
      v15 = (void *)MEMORY[0x1E4F1C9C8];
      [v22 timestamp];
      v16 = objc_msgSend(v15, "dateWithTimeIntervalSinceReferenceDate:");
      v17 = [_DKSource alloc];
      v18 = [v4 sourceBundleID];
      v19 = [(_DKSource *)v17 initWithIdentifier:@"sharesheet" bundleIdentifier:v18 itemIdentifier:0 groupIdentifier:0 deviceIdentifier:0 userIdentifier:0];

      v20 = +[_DKEventStream eventStreamWithName:@"/dummyStream/tempStream"];
      v21 = +[_DKEvent eventWithStream:v20 source:v19 startDate:v14 endDate:v16 identifierStringValue:0 metadata:v12];

      [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addObject:v21];
    }
LABEL_8:
  }
}

void __78___CDInteraction_fetchAndAddShareSheetContentToInteractionWithKnowledgeStore___block_invoke_cold_1(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v3 = [a1 error];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_18ECEB000, a2, OS_LOG_TYPE_ERROR, "Finalizing local events failed: %@", v4, 0xCu);
}

@end