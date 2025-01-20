@interface EDMailAnalyticsCollector
- (EDMailAnalyticsCollector)initWithAnalyticsCollector:(id)a3 smimeConfigurationProvider:(id)a4 messagePersistence:(id)a5;
- (EDMessagePersistence)messagePersistence;
- (EDSMIMEAnalyticsCollector)smimeAnalyticsCollector;
- (id)coreAnalyticsPeriodicEvent;
@end

@implementation EDMailAnalyticsCollector

- (EDMailAnalyticsCollector)initWithAnalyticsCollector:(id)a3 smimeConfigurationProvider:(id)a4 messagePersistence:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)EDMailAnalyticsCollector;
  v11 = [(EDMailAnalyticsCollector *)&v17 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_messagePersistence, a5);
    v13 = [[EDSMIMEAnalyticsCollector alloc] initWithAnalyticsCollector:v8 smimeConfigurationProvider:v9 messagePersistence:v10];
    smimeAnalyticsCollector = v12->_smimeAnalyticsCollector;
    v12->_smimeAnalyticsCollector = v13;

    id v15 = (id)[v8 registerForLogEventsWithPeriodicDataProvider:v12];
  }

  return v12;
}

- (id)coreAnalyticsPeriodicEvent
{
  v22[1] = *MEMORY[0x1E4F143B8];
  v3 = objc_msgSend(MEMORY[0x1E4F1CB18], "em_userDefaults");
  v4 = [v3 objectForKey:*MEMORY[0x1E4F60128]];

  v5 = objc_msgSend(MEMORY[0x1E4F1C9C8], "ef_midnightNdaysAgo:", 30);
  v6 = [MEMORY[0x1E4F60E78] column:@"date_received"];
  v7 = NSNumber;
  [v5 timeIntervalSince1970];
  id v8 = objc_msgSend(v7, "numberWithDouble:");
  id v9 = [v6 greaterThan:v8];

  id v10 = objc_alloc(MEMORY[0x1E4F60EF8]);
  v11 = [MEMORY[0x1E4F60E40] count:0];
  v12 = +[EDMessagePersistence messagesTableName];
  v13 = (void *)[v10 initWithResult:v11 table:v12];

  [v13 setWhere:v9];
  v14 = [(EDMailAnalyticsCollector *)self messagePersistence];
  uint64_t v15 = [v14 countOfMessageStatement:v13];

  if (v15 < 1) {
    uint64_t v16 = 0;
  }
  else {
    uint64_t v16 = objc_msgSend(v4, "ef_isLaterThanDate:", v5);
  }
  v21 = @"usesMail";
  objc_super v17 = [NSNumber numberWithBool:v16];
  v22[0] = v17;
  v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];

  v19 = (void *)[objc_alloc(MEMORY[0x1E4F60260]) initWithEventName:@"com.apple.mail.usage" collectionData:v18];

  return v19;
}

- (EDMessagePersistence)messagePersistence
{
  return self->_messagePersistence;
}

- (EDSMIMEAnalyticsCollector)smimeAnalyticsCollector
{
  return self->_smimeAnalyticsCollector;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_smimeAnalyticsCollector, 0);

  objc_storeStrong((id *)&self->_messagePersistence, 0);
}

@end