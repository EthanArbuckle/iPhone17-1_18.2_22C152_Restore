@interface EDConversationDailyiCloudExporter
+ (OS_os_log)log;
- (EDConversationDailyCloudExporterDelegate)delegate;
- (EDConversationDailyiCloudExporter)initWithDelegate:(id)a3 conversationManager:(id)a4;
- (EDUbiquitousConversationManager)conversationManager;
- (void)run;
@end

@implementation EDConversationDailyiCloudExporter

+ (OS_os_log)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__EDConversationDailyiCloudExporter_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_25 != -1) {
    dispatch_once(&log_onceToken_25, block);
  }
  v2 = (void *)log_log_25;

  return (OS_os_log *)v2;
}

void __40__EDConversationDailyiCloudExporter_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_25;
  log_log_25 = (uint64_t)v1;
}

- (EDConversationDailyiCloudExporter)initWithDelegate:(id)a3 conversationManager:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)EDConversationDailyiCloudExporter;
  v9 = [(EDConversationDailyiCloudExporter *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_delegate, a3);
    objc_storeStrong((id *)&v10->_conversationManager, a4);
  }

  return v10;
}

- (void)run
{
  id v8 = [(EDConversationDailyiCloudExporter *)self delegate];
  uint64_t v3 = [v8 previousSyncAnchorForDailyExport];

  id v9 = [(EDConversationDailyiCloudExporter *)self delegate];
  uint64_t v4 = [v9 currentSyncAnchorForDailyExport];

  v5 = [(EDConversationDailyiCloudExporter *)self delegate];
  id v10 = [v5 flaggedConversationsChangedBetweenStartAnchor:v3 endAnchor:v4];

  if ([v10 count])
  {
    v6 = [(EDConversationDailyiCloudExporter *)self conversationManager];
    [v6 performDailyExportForChangedConversations:v10];
  }
  id v7 = [(EDConversationDailyiCloudExporter *)self delegate];
  [v7 setNewPreviousSyncAnchorForDailyExport:v4];
}

- (EDConversationDailyCloudExporterDelegate)delegate
{
  return self->_delegate;
}

- (EDUbiquitousConversationManager)conversationManager
{
  return self->_conversationManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conversationManager, 0);

  objc_storeStrong((id *)&self->_delegate, 0);
}

@end