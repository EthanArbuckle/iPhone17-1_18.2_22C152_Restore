@interface SGMIBiomeUtility
+ (id)summarizeStreamByMessage;
+ (id)summarizeStreamByMessageStartingFromDaysAgo:(unint64_t)a3;
+ (id)summarizeStreamByMessageWithPublisher:(id)a3;
@end

@implementation SGMIBiomeUtility

+ (id)summarizeStreamByMessageWithPublisher:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  v5 = objc_opt_new();
  v6 = objc_opt_new();
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __58__SGMIBiomeUtility_summarizeStreamByMessageWithPublisher___block_invoke_11;
  v13[3] = &unk_1E65C0310;
  id v14 = v4;
  id v15 = v6;
  id v16 = v5;
  id v7 = v5;
  id v8 = v6;
  id v9 = v4;
  id v10 = (id)[v3 sinkWithCompletion:&__block_literal_global_41977 receiveInput:v13];
  v11 = [[SGMIBiomeSummaryResults alloc] initWithBiomeSummaryByMessage:v9 biomeMessageIdByPersistentId:v7];

  return v11;
}

void __58__SGMIBiomeUtility_summarizeStreamByMessageWithPublisher___block_invoke_11(void *a1, void *a2)
{
  id v13 = a2;
  id v3 = [v13 eventBody];
  if (v3)
  {
    [v13 timestamp];
    +[SGMIBiomeEventReducer updateSummaryDict:fetchedUnreadMessages:event:timestamp:](SGMIBiomeEventReducer, "updateSummaryDict:fetchedUnreadMessages:event:timestamp:", a1[4], a1[5], v3);
    v4 = [v3 payload];
    uint64_t v5 = [v4 objectForKeyedSubscript:@"persistentID"];
    if (v5)
    {
      v6 = (void *)v5;
      id v7 = [v3 messageId];

      if (!v7) {
        goto LABEL_6;
      }
      id v8 = [NSString alloc];
      id v9 = [v3 messageId];
      v4 = (void *)[v8 initWithFormat:@"<%@>", v9];

      id v10 = (void *)a1[6];
      v11 = [v3 payload];
      v12 = [v11 objectForKeyedSubscript:@"persistentID"];
      [v10 setObject:v4 forKeyedSubscript:v12];
    }
  }
LABEL_6:
}

void __58__SGMIBiomeUtility_summarizeStreamByMessageWithPublisher___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  uint64_t v3 = [v2 state];
  v4 = sgMailIntelligenceLogHandle();
  uint64_t v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v6 = [v2 error];
      id v7 = [v6 description];
      int v8 = 136315138;
      uint64_t v9 = [v7 UTF8String];
      _os_log_error_impl(&dword_1CA650000, v5, OS_LOG_TYPE_ERROR, "SGMIBiomeUtility: Error: %s", (uint8_t *)&v8, 0xCu);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v8) = 0;
    _os_log_impl(&dword_1CA650000, v5, OS_LOG_TYPE_DEFAULT, "SGMIBiomeUtility: Successfully consumed stream", (uint8_t *)&v8, 2u);
  }
}

+ (id)summarizeStreamByMessageStartingFromDaysAgo:(unint64_t)a3
{
  v4 = [MEMORY[0x1E4F60208] url];
  uint64_t v5 = v4;
  if (v4)
  {
    v6 = [v4 path];
    id v7 = (void *)[MEMORY[0x1E4F50278] newPrivateStreamDefaultConfigurationWithStoreBasePath:v6];
    int v8 = (void *)[objc_alloc(MEMORY[0x1E4F50490]) initWithPrivateStreamIdentifier:@"mailIntelligence" storeConfig:v7];
    uint64_t v9 = [v8 publisherFromStartTime:CFAbsoluteTimeGetCurrent() - (double)(86400 * a3 + 86400)];
    uint64_t v10 = +[SGMIBiomeUtility summarizeStreamByMessageWithPublisher:v9];
  }
  else
  {
    v11 = sgMailIntelligenceLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v14 = 0;
      _os_log_error_impl(&dword_1CA650000, v11, OS_LOG_TYPE_ERROR, "Error retrieving directory for Biome stream data", v14, 2u);
    }

    v12 = [SGMIBiomeSummaryResults alloc];
    uint64_t v10 = [(SGMIBiomeSummaryResults *)v12 initWithBiomeSummaryByMessage:MEMORY[0x1E4F1CC08] biomeMessageIdByPersistentId:MEMORY[0x1E4F1CC08]];
  }

  return v10;
}

+ (id)summarizeStreamByMessage
{
  return (id)[a1 summarizeStreamByMessageStartingFromDaysAgo:30];
}

@end