@interface EDSMIMEAnalyticsCollector
- (EDMessagePersistence)messagePersistence;
- (EDSMIMEAnalyticsCollector)initWithAnalyticsCollector:(id)a3 smimeConfigurationProvider:(id)a4 messagePersistence:(id)a5;
- (EDSMIMEConfigurationProvider)smimeConfigurationProvider;
- (id)coreAnalyticsPeriodicEvent;
@end

@implementation EDSMIMEAnalyticsCollector

- (EDSMIMEAnalyticsCollector)initWithAnalyticsCollector:(id)a3 smimeConfigurationProvider:(id)a4 messagePersistence:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)EDSMIMEAnalyticsCollector;
  v11 = [(EDSMIMEAnalyticsCollector *)&v15 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_smimeConfigurationProvider, a4);
    objc_storeStrong((id *)&v12->_messagePersistence, a5);
    id v13 = (id)[v8 registerForLogEventsWithPeriodicDataProvider:v12];
  }

  return v12;
}

- (id)coreAnalyticsPeriodicEvent
{
  v69[3] = *MEMORY[0x1E4F143B8];
  v58 = objc_msgSend(MEMORY[0x1E4F1C9C8], "ef_midnightNdaysAgo:", 30);
  v57 = [MEMORY[0x1E4F60E78] column:@"date_received"];
  v3 = NSNumber;
  [v58 timeIntervalSince1970];
  v4 = objc_msgSend(v3, "numberWithDouble:");
  v64 = [v57 greaterThan:v4];

  v5 = [(EDSMIMEAnalyticsCollector *)self messagePersistence];
  v6 = [v5 mailboxPersistence];
  v56 = [v6 mailboxObjectIDsForMailboxType:4];

  v7 = [(EDSMIMEAnalyticsCollector *)self messagePersistence];
  id v8 = [v7 mailboxPersistence];
  v55 = [v8 mailboxDatabaseIDsForMailboxObjectIDs:v56 createIfNecessary:0];

  id v9 = [MEMORY[0x1E4F60E78] column:@"mailbox"];
  v63 = [v9 in:v55];

  id v10 = objc_alloc(MEMORY[0x1E4F60EF8]);
  v11 = [MEMORY[0x1E4F60E40] count:0];
  v12 = +[EDMessagePersistence messagesTableName];
  v61 = (void *)[v10 initWithResult:v11 table:v12];

  id v13 = (void *)MEMORY[0x1E4F60E68];
  v14 = [MEMORY[0x1E4F60E78] column:@"flags"];
  objc_super v15 = [MEMORY[0x1E4F60E68] leftShift:&unk_1F35BB078 by:&unk_1F35BB090];
  v62 = [v13 and:v14 with:v15];

  id v16 = objc_alloc(MEMORY[0x1E4F60E48]);
  v69[0] = v62;
  v69[1] = v64;
  v69[2] = v63;
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v69 count:3];
  v54 = (void *)[v16 initWithExpressions:v17];

  [v61 setWhere:v54];
  id v18 = objc_alloc(MEMORY[0x1E4F60EF8]);
  v19 = [MEMORY[0x1E4F60E40] count:0];
  v20 = +[EDMessagePersistence messagesTableName];
  v59 = (void *)[v18 initWithResult:v19 table:v20];

  v21 = (void *)MEMORY[0x1E4F60E68];
  v22 = [MEMORY[0x1E4F60E78] column:@"flags"];
  v23 = [MEMORY[0x1E4F60E68] leftShift:&unk_1F35BB078 by:&unk_1F35BB0A8];
  v60 = [v21 and:v22 with:v23];

  id v24 = objc_alloc(MEMORY[0x1E4F60E48]);
  v68[0] = v60;
  v68[1] = v64;
  v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v68 count:2];
  v53 = (void *)[v24 initWithExpressions:v25];

  [v59 setWhere:v53];
  id v26 = objc_alloc(MEMORY[0x1E4F60EF8]);
  v27 = [MEMORY[0x1E4F60E40] count:0];
  v28 = +[EDMessagePersistence messagesTableName];
  v29 = (void *)[v26 initWithResult:v27 table:v28];

  uint64_t v51 = [objc_alloc(MEMORY[0x1E4F60EC8]) initWithExpression:v62];
  id v30 = objc_alloc(MEMORY[0x1E4F60E48]);
  v67[0] = v60;
  v67[1] = v51;
  v67[2] = v64;
  v67[3] = v63;
  v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v67 count:4];
  v32 = (void *)[v30 initWithExpressions:v31];

  [v29 setWhere:v32];
  v33 = [(EDSMIMEAnalyticsCollector *)self messagePersistence];
  uint64_t v34 = [v33 countOfMessageStatement:v61];

  v35 = [(EDSMIMEAnalyticsCollector *)self messagePersistence];
  uint64_t v36 = [v35 countOfMessageStatement:v59];

  v37 = [(EDSMIMEAnalyticsCollector *)self messagePersistence];
  uint64_t v38 = [v37 countOfMessageStatement:v29];

  v39 = [(EDSMIMEAnalyticsCollector *)self smimeConfigurationProvider];
  int v40 = [v39 signingIsConfigured];
  int v41 = [v39 encryptionIsConfigured];
  LODWORD(v21) = [v39 signingEnabledByDefault];
  uint64_t v42 = v40 & v21 | v41 & [v39 encryptionIsEnabledByDefault];
  if (v34 < 1) {
    int v43 = 1;
  }
  else {
    int v43 = v40;
  }
  if (v43 == 1)
  {
    if (v36 > 0) {
      uint64_t v44 = v41 ^ 1u;
    }
    else {
      uint64_t v44 = 0;
    }
  }
  else
  {
    uint64_t v44 = 1;
  }
  v65[0] = @"usesSMIME";
  v45 = objc_msgSend(NSNumber, "numberWithBool:", v42, v51);
  v66[0] = v45;
  v65[1] = @"usesSMIMEButNotOnThisDevice";
  v46 = [NSNumber numberWithBool:v44];
  v66[1] = v46;
  v65[2] = @"sendsEncryptedNotSignedMessages";
  v47 = [NSNumber numberWithBool:v38 > 0];
  v66[2] = v47;
  v48 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v66 forKeys:v65 count:3];

  v49 = (void *)[objc_alloc(MEMORY[0x1E4F60260]) initWithEventName:@"com.apple.mail.smime.usage" collectionData:v48];

  return v49;
}

- (EDSMIMEConfigurationProvider)smimeConfigurationProvider
{
  return self->_smimeConfigurationProvider;
}

- (EDMessagePersistence)messagePersistence
{
  return self->_messagePersistence;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messagePersistence, 0);

  objc_storeStrong((id *)&self->_smimeConfigurationProvider, 0);
}

@end