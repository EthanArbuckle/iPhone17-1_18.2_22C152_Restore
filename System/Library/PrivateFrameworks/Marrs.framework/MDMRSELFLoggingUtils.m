@interface MDMRSELFLoggingUtils
+ (BOOL)emitEvent:(id)a3;
+ (BOOL)emitMentionDetectorEvaluatedEventWithResponse:(id)a3 WithNlId:(id)a4 andWithTrpId:(id)a5 andWithRequestId:(id)a6 andWithResultCandidateId:(id)a7 andWithRequester:(int)a8;
+ (BOOL)emitMentionResolverEvaluatedEventWithResponse:(id)a3 WithNlId:(id)a4 andWithTrpId:(id)a5 andWithRequestId:(id)a6 andWithResultCandidateId:(id)a7 andWithRequester:(int)a8;
+ (id)createMentionDetectorEvaluatedEvent:(id)a3 withNLXMetadata:(id)a4 andLinkId:(id)a5;
+ (id)createMentionDetectorEvaluatedTier1Event:(id)a3 withNLXMetadata:(id)a4 andLinkId:(id)a5;
+ (id)createMentionResolverEvaluatedEvent:(id)a3 withNLXMetadata:(id)a4 andLinkId:(id)a5;
+ (id)createMentionResolverEvaluatedTier1Event:(id)a3 withNLXMetadata:(id)a4 andLinkId:(id)a5;
@end

@implementation MDMRSELFLoggingUtils

+ (BOOL)emitMentionResolverEvaluatedEventWithResponse:(id)a3 WithNlId:(id)a4 andWithTrpId:(id)a5 andWithRequestId:(id)a6 andWithResultCandidateId:(id)a7 andWithRequester:(int)a8
{
  uint64_t v8 = *(void *)&a8;
  id v14 = a3;
  v15 = +[NLXMetadataGenerator createEventMetadataWithNlId:a4 andWithTrpId:a5 andWithRequestId:a6 andWithResultCandidateId:a7 andWithRequester:v8];
  id v16 = objc_alloc(MEMORY[0x1E4FA1378]);
  id v17 = objc_alloc_init(MEMORY[0x1E4F29128]);
  v18 = (void *)[v16 initWithNSUUID:v17];

  v19 = [a1 createMentionResolverEvaluatedEvent:v14 withNLXMetadata:v15 andLinkId:v18];
  v20 = [a1 createMentionResolverEvaluatedTier1Event:v14 withNLXMetadata:v15 andLinkId:v18];
  LOBYTE(a4) = [a1 emitEvent:v19];
  LOBYTE(a1) = a4 & [a1 emitEvent:v20];

  return (char)a1;
}

+ (id)createMentionResolverEvaluatedTier1Event:(id)a3 withNLXMetadata:(id)a4 andLinkId:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = objc_alloc_init(MEMORY[0x1E4FA0BD8]);
  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (v7)
  {
    for (unint64_t i = 0; ; ++i)
    {
      v13 = [v7 mentions];
      unint64_t v14 = [v13 count];

      if (i >= v14) {
        break;
      }
      v15 = (void *)MEMORY[0x1E4FA2AF0];
      id v16 = [v7 mentions];
      id v17 = [v16 objectAtIndexedSubscript:i];
      v18 = [v15 convertMatchingSpanTier1:v17];

      [v11 addObject:v18];
    }
  }
  [v10 setMentionResolverSpansTier1s:v11];
  [v10 setLinkId:v9];
  id v19 = objc_alloc_init(MEMORY[0x1E4FA0C60]);
  [v19 setMarrsMentionResolverEndedTier1:v10];
  [v19 setEventMetadata:v8];

  return v19;
}

+ (id)createMentionResolverEvaluatedEvent:(id)a3 withNLXMetadata:(id)a4 andLinkId:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = objc_alloc_init(MEMORY[0x1E4FA0BD0]);
  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (v7)
  {
    for (unint64_t i = 0; ; ++i)
    {
      v13 = [v7 mentions];
      unint64_t v14 = [v13 count];

      if (i >= v14) {
        break;
      }
      v15 = (void *)MEMORY[0x1E4FA2AF0];
      id v16 = [v7 mentions];
      id v17 = [v16 objectAtIndexedSubscript:i];
      v18 = [v15 convertMatchingSpan:v17];

      if (v18)
      {
        id v19 = [v18 mainItem];
        [v11 addObject:v19];
      }
    }
  }
  [v10 setMentionResolverSpans:v11];
  [v10 setLinkId:v9];
  id v20 = objc_alloc_init(MEMORY[0x1E4FA0C60]);
  [v20 setMarrsMentionResolverEnded:v10];
  [v20 setEventMetadata:v8];

  return v20;
}

+ (BOOL)emitMentionDetectorEvaluatedEventWithResponse:(id)a3 WithNlId:(id)a4 andWithTrpId:(id)a5 andWithRequestId:(id)a6 andWithResultCandidateId:(id)a7 andWithRequester:(int)a8
{
  uint64_t v8 = *(void *)&a8;
  id v14 = a3;
  v15 = +[NLXMetadataGenerator createEventMetadataWithNlId:a4 andWithTrpId:a5 andWithRequestId:a6 andWithResultCandidateId:a7 andWithRequester:v8];
  id v16 = objc_alloc(MEMORY[0x1E4FA1378]);
  id v17 = objc_alloc_init(MEMORY[0x1E4F29128]);
  v18 = (void *)[v16 initWithNSUUID:v17];

  id v19 = [a1 createMentionDetectorEvaluatedEvent:v14 withNLXMetadata:v15 andLinkId:v18];
  id v20 = [a1 createMentionDetectorEvaluatedTier1Event:v14 withNLXMetadata:v15 andLinkId:v18];
  LOBYTE(a4) = [a1 emitEvent:v19];
  LOBYTE(a1) = a4 & [a1 emitEvent:v20];

  return (char)a1;
}

+ (id)createMentionDetectorEvaluatedTier1Event:(id)a3 withNLXMetadata:(id)a4 andLinkId:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = objc_alloc_init(MEMORY[0x1E4FA0BC8]);
  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  for (unint64_t i = 0; ; ++i)
  {
    v13 = [v7 mentions];
    unint64_t v14 = [v13 count];

    if (i >= v14) {
      break;
    }
    v15 = (void *)MEMORY[0x1E4FA2AF0];
    id v16 = [v7 mentions];
    id v17 = [v16 objectAtIndexedSubscript:i];
    v18 = [v15 convertMatchingSpanTier1:v17];

    [v11 addObject:v18];
  }
  [v10 setMentionDetectorSpansTier1s:v11];
  [v10 setLinkId:v9];
  id v19 = objc_alloc_init(MEMORY[0x1E4FA0C60]);
  [v19 setMarrsMentionDetectorEndedTier1:v10];
  [v19 setEventMetadata:v8];

  return v19;
}

+ (id)createMentionDetectorEvaluatedEvent:(id)a3 withNLXMetadata:(id)a4 andLinkId:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = objc_alloc_init(MEMORY[0x1E4FA0BC0]);
  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  for (unint64_t i = 0; ; ++i)
  {
    v13 = [v7 mentions];
    unint64_t v14 = [v13 count];

    if (i >= v14) {
      break;
    }
    v15 = (void *)MEMORY[0x1E4FA2AF0];
    id v16 = [v7 mentions];
    id v17 = [v16 objectAtIndexedSubscript:i];
    v18 = [v15 convertMatchingSpan:v17];

    if (v18)
    {
      id v19 = [v18 mainItem];
      [v11 addObject:v19];
    }
  }
  [v10 setMentionDetectorSpans:v11];
  [v10 setLinkId:v9];
  id v20 = objc_alloc_init(MEMORY[0x1E4FA0C60]);
  [v20 setMarrsMentionDetectorEnded:v10];
  [v20 setEventMetadata:v8];

  return v20;
}

+ (BOOL)emitEvent:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 hasEventMetadata]
    && ([v3 eventMetadata],
        v4 = objc_claimAutoreleasedReturnValue(),
        char v5 = [v4 hasNlId],
        v4,
        (v5 & 1) != 0))
  {
    v6 = [MEMORY[0x1E4F9F9B0] sharedStream];
    [v6 emitMessage:v3];

    id v7 = MRRLoggerForCategory(0);
    BOOL v8 = 1;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v9 = [v3 eventMetadata];
      id v10 = [v9 nlId];
      id v11 = [v10 toNSUUID];
      id v12 = [v11 UUIDString];
      int v14 = 136315138;
      uint64_t v15 = [v12 UTF8String];
      _os_log_impl(&dword_1C9555000, v7, OS_LOG_TYPE_INFO, "Emitted event with NL ID: %s", (uint8_t *)&v14, 0xCu);

      BOOL v8 = 1;
    }
  }
  else
  {
    id v7 = MRRLoggerForCategory(0);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v14) = 0;
      _os_log_impl(&dword_1C9555000, v7, OS_LOG_TYPE_ERROR, "Due to NL ID being Nil, this event won't be emitted.", (uint8_t *)&v14, 2u);
    }
    BOOL v8 = 0;
  }

  return v8;
}

@end