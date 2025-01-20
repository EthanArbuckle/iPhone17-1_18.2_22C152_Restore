@interface ContextualSpanMatcherSELFLogging
+ (BOOL)emitContextualSpanMatcherEndedEventWithResponse:(id)a3 WithNlId:(id)a4 andWithTrpId:(id)a5 andWithRequestId:(id)a6 andWithResultCandidateId:(id)a7 andWithRequester:(int)a8;
+ (BOOL)emitEvent:(id)a3;
+ (id)createContextualSpanMatcherEndedEvent:(id)a3 withNLXMetadata:(id)a4 andLinkId:(id)a5;
+ (id)createContextualSpanMatcherEndedTier1Event:(id)a3 withNLXMetadata:(id)a4 andLinkId:(id)a5;
@end

@implementation ContextualSpanMatcherSELFLogging

+ (BOOL)emitContextualSpanMatcherEndedEventWithResponse:(id)a3 WithNlId:(id)a4 andWithTrpId:(id)a5 andWithRequestId:(id)a6 andWithResultCandidateId:(id)a7 andWithRequester:(int)a8
{
  uint64_t v8 = *(void *)&a8;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  v19 = os_log_create("com.apple.siri.marrs.mrr", "ContextualSpanMatcher");
  v20 = v19;
  if (v14)
  {
    v34 = +[NLXMetadataGenerator createEventMetadataWithNlId:v15 andWithTrpId:v16 andWithRequestId:v17 andWithResultCandidateId:v18 andWithRequester:v8];
    id v21 = objc_alloc(MEMORY[0x1E4FA1378]);
    id v22 = objc_alloc_init(MEMORY[0x1E4F29128]);
    v23 = (void *)[v21 initWithNSUUID:v22];

    v24 = [a1 createContextualSpanMatcherEndedEvent:v14 withNLXMetadata:v34 andLinkId:v23];
    [a1 createContextualSpanMatcherEndedTier1Event:v14 withNLXMetadata:v34 andLinkId:v23];
    v35 = v20;
    id v25 = v17;
    v27 = id v26 = v15;
    id v28 = v14;
    id v29 = v18;
    id v30 = v16;
    int v31 = [a1 emitEvent:v24];
    int v32 = v31 & [a1 emitEvent:v27];
    id v16 = v30;
    id v18 = v29;
    id v14 = v28;

    id v15 = v26;
    id v17 = v25;
    v20 = v35;
  }
  else
  {
    LOBYTE(v32) = 0;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C9555000, v20, OS_LOG_TYPE_DEFAULT, "Due to CSM Response being Nil, this event won't be emitted.", buf, 2u);
      LOBYTE(v32) = 0;
    }
  }

  return v32;
}

+ (id)createContextualSpanMatcherEndedTier1Event:(id)a3 withNLXMetadata:(id)a4 andLinkId:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = objc_alloc_init(MEMORY[0x1E4FA0BB8]);
  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v12 = [v7 contextualSpans];
  uint64_t v13 = [v12 count];

  if (v13)
  {
    unint64_t v14 = 0;
    do
    {
      id v15 = (void *)MEMORY[0x1E4FA2AF0];
      id v16 = [v7 contextualSpans];
      id v17 = [v16 objectAtIndexedSubscript:v14];
      id v18 = [v15 convertMatchingSpanTier1:v17];

      [v11 addObject:v18];
      ++v14;
      v19 = [v7 contextualSpans];
      unint64_t v20 = [v19 count];
    }
    while (v14 < v20);
  }
  [v10 setContextualSpansTier1s:v11];
  [v10 setLinkId:v9];
  id v21 = objc_alloc_init(MEMORY[0x1E4FA0C60]);
  [v21 setMarrsContextualSpanMatcherEndedTier1:v10];
  [v21 setEventMetadata:v8];

  return v21;
}

+ (id)createContextualSpanMatcherEndedEvent:(id)a3 withNLXMetadata:(id)a4 andLinkId:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = objc_alloc_init(MEMORY[0x1E4FA0BB0]);
  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v12 = [v7 contextualSpans];
  uint64_t v13 = [v12 count];

  if (v13)
  {
    unint64_t v14 = 0;
    do
    {
      id v15 = (void *)MEMORY[0x1E4FA2AF0];
      id v16 = [v7 contextualSpans];
      id v17 = [v16 objectAtIndexedSubscript:v14];
      id v18 = [v15 convertMatchingSpan:v17];

      if (v18)
      {
        v19 = [v18 mainItem];
        [v11 addObject:v19];
      }
      ++v14;
      unint64_t v20 = [v7 contextualSpans];
      unint64_t v21 = [v20 count];
    }
    while (v14 < v21);
  }
  [v10 setContextualSpans:v11];
  [v10 setLinkId:v9];
  id v22 = objc_alloc_init(MEMORY[0x1E4FA0C60]);
  [v22 setMarrsContextualSpanMatcherEnded:v10];
  [v22 setEventMetadata:v8];

  return v22;
}

+ (BOOL)emitEvent:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  os_log_t v4 = os_log_create("com.apple.siri.marrs.mrr", "ContextualSpanMatcher");
  if ([v3 hasEventMetadata]
    && ([v3 eventMetadata],
        v5 = objc_claimAutoreleasedReturnValue(),
        char v6 = [v5 hasNlId],
        v5,
        (v6 & 1) != 0))
  {
    id v7 = [MEMORY[0x1E4F9F9B0] sharedStream];
    [v7 emitMessage:v3];

    id v8 = v4;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = [v3 eventMetadata];
      id v10 = [v9 nlId];
      id v11 = [v10 toNSUUID];
      id v12 = [v11 UUIDString];
      int v15 = 136315138;
      uint64_t v16 = [v12 UTF8String];
      _os_log_impl(&dword_1C9555000, v8, OS_LOG_TYPE_DEFAULT, "Emitted event with NL ID: %s", (uint8_t *)&v15, 0xCu);
    }
    BOOL v13 = 1;
  }
  else
  {
    BOOL v13 = 0;
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v15) = 0;
      _os_log_impl(&dword_1C9555000, v4, OS_LOG_TYPE_DEFAULT, "Due to NL ID being Nil, this event won't be emitted.", (uint8_t *)&v15, 2u);
      BOOL v13 = 0;
    }
  }

  return v13;
}

@end