@interface GKAPIReporter
+ (id)reporter;
- (id)utilityService;
- (void)recordClickWithAction:(id)a3 targetId:(id)a4 targetType:(id)a5 pageId:(id)a6 pageType:(id)a7;
- (void)recordClickWithAction:(id)a3 targetId:(id)a4 targetType:(id)a5 pageId:(id)a6 pageType:(id)a7 additionalFields:(id)a8;
- (void)recordClickWithAction:(id)a3 targetId:(id)a4 targetType:(id)a5 pageId:(id)a6 pageType:(id)a7 hostApp:(id)a8 app:(id)a9 additionalFields:(id)a10;
- (void)recordFriendInviteActivityEventAtStage:(unint64_t)a3 hostApp:(id)a4;
- (void)recordInviteFriendClickEventWithPageType:(id)a3 pageId:(id)a4 pushBased:(BOOL)a5 knownRecipient:(BOOL)a6 location:(id)a7;
- (void)recordLoadUrlMetrics:(id)a3;
- (void)recordMultiplayerActivityMetrics:(id)a3;
- (void)recordMultiplayerErrorID:(id)a3;
- (void)recordPageWithID:(id)a3 pageContext:(id)a4 pageType:(id)a5;
- (void)recordPageWithID:(id)a3 pageContext:(id)a4 pageType:(id)a5 refApp:(id)a6;
- (void)recordPageWithID:(id)a3 pageContext:(id)a4 pageType:(id)a5 refApp:(id)a6 hostApp:(id)a7 app:(id)a8 additionalFields:(id)a9;
- (void)recordVoiceChat;
- (void)sendMetrics:(id)a3;
- (void)sendPerformanceMetrics:(id)a3;
@end

@implementation GKAPIReporter

+ (id)reporter
{
  if (reporter_sDispatchOnceToken != -1) {
    dispatch_once(&reporter_sDispatchOnceToken, &__block_literal_global_32);
  }
  v2 = (void *)reporter_sReporter;

  return v2;
}

uint64_t __25__GKAPIReporter_reporter__block_invoke()
{
  reporter_sReporter = objc_alloc_init(GKAPIReporter);

  return MEMORY[0x1F41817F8]();
}

- (void)recordVoiceChat
{
}

- (void)recordClickWithAction:(id)a3 targetId:(id)a4 targetType:(id)a5 pageId:(id)a6 pageType:(id)a7
{
}

- (void)recordClickWithAction:(id)a3 targetId:(id)a4 targetType:(id)a5 pageId:(id)a6 pageType:(id)a7 additionalFields:(id)a8
{
}

- (void)recordClickWithAction:(id)a3 targetId:(id)a4 targetType:(id)a5 pageId:(id)a6 pageType:(id)a7 hostApp:(id)a8 app:(id)a9 additionalFields:(id)a10
{
  v28[6] = *MEMORY[0x1E4F143B8];
  id v16 = a8;
  id v17 = a9;
  id v18 = a10;
  v27[0] = @"eventType";
  v27[1] = @"actionType";
  v28[0] = @"click";
  v28[1] = a3;
  v27[2] = @"targetId";
  v27[3] = @"targetType";
  v28[2] = a4;
  v28[3] = a5;
  v27[4] = @"pageId";
  v27[5] = @"pageType";
  v28[4] = a6;
  v28[5] = a7;
  v19 = (void *)MEMORY[0x1E4F1C9E8];
  id v20 = a7;
  id v21 = a6;
  id v22 = a5;
  id v23 = a4;
  id v24 = a3;
  v25 = [v19 dictionaryWithObjects:v28 forKeys:v27 count:6];

  v26 = (void *)[v25 mutableCopy];
  if (v16) {
    [v26 setObject:v16 forKeyedSubscript:@"hostApp"];
  }
  if (v17) {
    [v26 setObject:v17 forKeyedSubscript:@"app"];
  }
  [v26 addEntriesFromDictionary:v18];
  [(GKAPIReporter *)self sendMetrics:v26];
}

- (void)recordPageWithID:(id)a3 pageContext:(id)a4 pageType:(id)a5 refApp:(id)a6 hostApp:(id)a7 app:(id)a8 additionalFields:(id)a9
{
  v27[4] = *MEMORY[0x1E4F143B8];
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  id v18 = a9;
  v26[0] = @"eventType";
  v26[1] = @"pageId";
  v27[0] = @"page";
  v27[1] = a3;
  v26[2] = @"pageContext";
  v26[3] = @"pageType";
  v27[2] = a4;
  v27[3] = a5;
  v19 = (void *)MEMORY[0x1E4F1C9E8];
  id v20 = a5;
  id v21 = a4;
  id v22 = a3;
  id v23 = [v19 dictionaryWithObjects:v27 forKeys:v26 count:4];

  id v24 = (void *)[v23 mutableCopy];
  if (v15) {
    [v24 setObject:v15 forKeyedSubscript:@"refApp"];
  }
  if (v16) {
    [v24 setObject:v16 forKeyedSubscript:@"hostApp"];
  }
  if (v17) {
    [v24 setObject:v17 forKeyedSubscript:@"app"];
  }
  if (v18) {
    [v24 addEntriesFromDictionary:v18];
  }
  v25 = (void *)[v24 copy];
  [(GKAPIReporter *)self sendMetrics:v25];
}

- (void)recordPageWithID:(id)a3 pageContext:(id)a4 pageType:(id)a5 refApp:(id)a6
{
}

- (void)recordPageWithID:(id)a3 pageContext:(id)a4 pageType:(id)a5
{
}

- (void)recordMultiplayerActivityMetrics:(id)a3
{
  id v4 = a3;
  id v5 = [(GKAPIReporter *)self utilityService];
  [v5 reportMultiplayerActivityMetricsEvent:v4];
}

- (void)recordMultiplayerErrorID:(id)a3
{
}

- (void)recordLoadUrlMetrics:(id)a3
{
  id v4 = a3;
  id v5 = [(GKAPIReporter *)self utilityService];
  [v5 reportLoadUrlMetricsEvent:v4];
}

- (void)recordInviteFriendClickEventWithPageType:(id)a3 pageId:(id)a4 pushBased:(BOOL)a5 knownRecipient:(BOOL)a6 location:(id)a7
{
  v19[1] = *MEMORY[0x1E4F143B8];
  if (a6) {
    v10 = @"invite";
  }
  else {
    v10 = @"inviteOthers";
  }
  if (a5) {
    v11 = @"add";
  }
  else {
    v11 = @"navigate";
  }
  id v18 = @"location";
  v19[0] = a7;
  v12 = (void *)MEMORY[0x1E4F1C9E8];
  if (a5) {
    v13 = @"button";
  }
  else {
    v13 = @"link";
  }
  id v14 = a7;
  id v15 = a4;
  id v16 = a3;
  id v17 = [v12 dictionaryWithObjects:v19 forKeys:&v18 count:1];

  [(GKAPIReporter *)self recordClickWithAction:v11 targetId:v10 targetType:v13 pageId:v15 pageType:v16 additionalFields:v17];
}

- (void)recordFriendInviteActivityEventAtStage:(unint64_t)a3 hostApp:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v6 = +[GKFriendInviteActivityEvent metricsFieldsForStage:a3 hostApp:a4];
  if (!os_log_GKGeneral) {
    id v7 = GKOSLoggers();
  }
  v8 = (void *)os_log_GKFriending;
  if (os_log_type_enabled((os_log_t)os_log_GKFriending, OS_LOG_TYPE_INFO))
  {
    v9 = v8;
    v10 = +[GKFriendInviteActivityEvent stringForStage:a3];
    int v11 = 138412290;
    v12 = v10;
    _os_log_impl(&dword_1C2D22000, v9, OS_LOG_TYPE_INFO, "GKAPIReporter: Recording inviteActivity stage %@", (uint8_t *)&v11, 0xCu);
  }
  [(GKAPIReporter *)self sendMetrics:v6];
}

- (void)sendMetrics:(id)a3
{
  id v4 = a3;
  id v5 = [(GKAPIReporter *)self utilityService];
  [v5 reportMetricsEventWithTopic:@"xp_amp_gc_cs" shouldFlush:MEMORY[0x1E4F1CC28] metricsFields:v4];
}

- (void)sendPerformanceMetrics:(id)a3
{
  id v4 = a3;
  id v5 = [(GKAPIReporter *)self utilityService];
  [v5 reportPerformanceMetricsEvent:v4];
}

- (id)utilityService
{
  v2 = GKGetRuntimeStrategy();
  v3 = [v2 utilityService];

  return v3;
}

@end