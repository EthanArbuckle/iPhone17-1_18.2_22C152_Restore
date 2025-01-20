@interface ATXNotificationDigestGeneratorClient
- (ATXNotificationDigestGeneratorClient)init;
- (ATXNotificationDigestGeneratorClient)initWithDigestRankerClient:(id)a3;
- (ATXNotificationDigestGeneratorClient)initWithMissedNotificationRankingBiomeStream:(id)a3 notificationDigestBiomeStream:(id)a4 modeConfigurationClient:(id)a5 modeEntityScorer:(id)a6 digestRankerClient:(id)a7;
- (id)_flattenNestedNotificationArrays:(id)a3;
- (id)digestRankerClient;
- (id)generateDigestForNotifications:(id)a3 digestTime:(int64_t)a4;
- (id)models;
- (id)overallDigestScoreModel;
- (void)generateDigestForAppGroupedNotificationStacks:(id)a3 maxGlobalMarqueeGroups:(unint64_t)a4 maxAppMarqueeGroups:(unint64_t)a5 reply:(id)a6;
- (void)generateDigestForNotificationArrays:(id)a3 reply:(id)a4;
- (void)generateMissedNotificationRankingForNotificationArrays:(id)a3 atxMode:(unint64_t)a4 reply:(id)a5;
- (void)generateMissedNotificationRankingForNotificationArrays:(id)a3 modeUUID:(id)a4 reply:(id)a5;
@end

@implementation ATXNotificationDigestGeneratorClient

- (id)models
{
  return &unk_1EFDF4E90;
}

- (id)overallDigestScoreModel
{
  return @"notificationDigestScore";
}

- (ATXNotificationDigestGeneratorClient)init
{
  return [(ATXNotificationDigestGeneratorClient *)self initWithDigestRankerClient:0];
}

- (ATXNotificationDigestGeneratorClient)initWithDigestRankerClient:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_new();
  v6 = objc_opt_new();
  v7 = +[ATXDNDModeConfigurationClient sharedInstance];
  v8 = objc_opt_new();
  v9 = [(ATXNotificationDigestGeneratorClient *)self initWithMissedNotificationRankingBiomeStream:v5 notificationDigestBiomeStream:v6 modeConfigurationClient:v7 modeEntityScorer:v8 digestRankerClient:v4];

  return v9;
}

- (ATXNotificationDigestGeneratorClient)initWithMissedNotificationRankingBiomeStream:(id)a3 notificationDigestBiomeStream:(id)a4 modeConfigurationClient:(id)a5 modeEntityScorer:(id)a6 digestRankerClient:(id)a7
{
  id v20 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)ATXNotificationDigestGeneratorClient;
  v17 = [(ATXNotificationDigestGeneratorClient *)&v21 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_missedNotificationRankingStream, a3);
    objc_storeStrong((id *)&v18->_digestStream, a4);
    objc_storeStrong((id *)&v18->_modeConfigurationClient, a5);
    objc_storeStrong((id *)&v18->_modeEntityScorer, a6);
    objc_storeStrong((id *)&v18->_digestRankerClient, a7);
  }

  return v18;
}

- (id)digestRankerClient
{
  digestRankerClient = self->_digestRankerClient;
  if (!digestRankerClient)
  {
    id v4 = (ATXNotificationDigestRankerInterface *)objc_opt_new();
    v5 = self->_digestRankerClient;
    self->_digestRankerClient = v4;

    digestRankerClient = self->_digestRankerClient;
  }

  return digestRankerClient;
}

- (id)_flattenNestedNotificationArrays:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_opt_new();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(v4, "addObjectsFromArray:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  return v4;
}

- (id)generateDigestForNotifications:(id)a3 digestTime:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = objc_opt_new();
  unint64_t v8 = digestTimeToMode(a4);
  v9 = ATXModeToString(v8);
  [(ATXModeEntityScorerProtocol *)self->_modeEntityScorer scoreUserNotifications:v6 mode:v8];
  v10 = [[ATXUserNotificationDigest alloc] initWithNotifications:v6 modeId:v9 ranker:v7];

  [(ATXUserNotificationDigest *)v10 setLoggingStream:self->_digestStream];

  return v10;
}

- (void)generateDigestForAppGroupedNotificationStacks:(id)a3 maxGlobalMarqueeGroups:(unint64_t)a4 maxAppMarqueeGroups:(unint64_t)a5 reply:(id)a6
{
  id v10 = a6;
  id v11 = a3;
  long long v12 = [(ATXNotificationDigestGeneratorClient *)self digestRankerClient];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __135__ATXNotificationDigestGeneratorClient_generateDigestForAppGroupedNotificationStacks_maxGlobalMarqueeGroups_maxAppMarqueeGroups_reply___block_invoke;
  v14[3] = &unk_1E5D0A3B8;
  v14[4] = self;
  id v15 = v10;
  id v13 = v10;
  [v12 generateDigestForAppGroupedNotificationStacks:v11 maxGlobalMarqueeGroups:a4 maxAppMarqueeGroups:a5 reply:v14];
}

void __135__ATXNotificationDigestGeneratorClient_generateDigestForAppGroupedNotificationStacks_maxGlobalMarqueeGroups_maxAppMarqueeGroups_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __135__ATXNotificationDigestGeneratorClient_generateDigestForAppGroupedNotificationStacks_maxGlobalMarqueeGroups_maxAppMarqueeGroups_reply___block_invoke_cold_1();
    }

    unint64_t v8 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    [v5 setLoggingStream:*(void *)(*(void *)(a1 + 32) + 16)];
    unint64_t v8 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  v8();
}

- (void)generateDigestForNotificationArrays:(id)a3 reply:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  unint64_t v8 = [(ATXNotificationDigestGeneratorClient *)self digestRankerClient];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __82__ATXNotificationDigestGeneratorClient_generateDigestForNotificationArrays_reply___block_invoke;
  v10[3] = &unk_1E5D0A3B8;
  v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  [v8 generateDigestForNotificationStacks:v7 reply:v10];
}

void __82__ATXNotificationDigestGeneratorClient_generateDigestForNotificationArrays_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __135__ATXNotificationDigestGeneratorClient_generateDigestForAppGroupedNotificationStacks_maxGlobalMarqueeGroups_maxAppMarqueeGroups_reply___block_invoke_cold_1();
    }

    unint64_t v8 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    [v5 setLoggingStream:*(void *)(*(void *)(a1 + 32) + 16)];
    unint64_t v8 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  v8();
}

- (void)generateMissedNotificationRankingForNotificationArrays:(id)a3 modeUUID:(id)a4 reply:(id)a5
{
  modeConfigurationClient = self->_modeConfigurationClient;
  id v9 = a5;
  id v10 = a3;
  [(ATXNotificationDigestGeneratorClient *)self generateMissedNotificationRankingForNotificationArrays:v10 atxMode:[(ATXDNDModeConfigurationClient *)modeConfigurationClient atxModeForDNDMode:a4] reply:v9];
}

- (void)generateMissedNotificationRankingForNotificationArrays:(id)a3 atxMode:(unint64_t)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = ATXModeToString(a4);
  id v11 = objc_opt_new();
  long long v12 = [(ATXNotificationDigestGeneratorClient *)self _flattenNestedNotificationArrays:v8];
  modeEntityScorer = self->_modeEntityScorer;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __109__ATXNotificationDigestGeneratorClient_generateMissedNotificationRankingForNotificationArrays_atxMode_reply___block_invoke;
  v18[3] = &unk_1E5D0A3E0;
  v22 = self;
  id v23 = v9;
  id v19 = v8;
  id v20 = v10;
  id v21 = v11;
  id v14 = v11;
  id v15 = v10;
  id v16 = v8;
  id v17 = v9;
  [(ATXModeEntityScorerProtocol *)modeEntityScorer scoreUserNotifications:v12 mode:a4 reply:v18];
}

void __109__ATXNotificationDigestGeneratorClient_generateMissedNotificationRankingForNotificationArrays_atxMode_reply___block_invoke(void *a1, uint64_t a2)
{
  if (a2)
  {
    id v3 = *(void (**)(void))(a1[8] + 16);
    v3();
  }
  else
  {
    id v4 = [[ATXMissedNotificationRanking alloc] initWithNotificationArrays:a1[4] modeId:a1[5] ranker:a1[6]];
    [(ATXMissedNotificationRanking *)v4 setLoggingStream:*(void *)(a1[7] + 8)];
    (*(void (**)(void))(a1[8] + 16))();
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_digestRankerClient, 0);
  objc_storeStrong((id *)&self->_modeEntityScorer, 0);
  objc_storeStrong((id *)&self->_modeConfigurationClient, 0);
  objc_storeStrong((id *)&self->_digestStream, 0);

  objc_storeStrong((id *)&self->_missedNotificationRankingStream, 0);
}

void __135__ATXNotificationDigestGeneratorClient_generateDigestForAppGroupedNotificationStacks_maxGlobalMarqueeGroups_maxAppMarqueeGroups_reply___block_invoke_cold_1()
{
  v0 = (objc_class *)objc_opt_class();
  v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_0_11();
  OUTLINED_FUNCTION_2(&dword_1A790D000, v2, v3, "[%@] Error calling XPC for the digest: %@", v4, v5, v6, v7, v8);
}

@end