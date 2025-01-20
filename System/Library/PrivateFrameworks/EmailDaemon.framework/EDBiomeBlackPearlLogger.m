@interface EDBiomeBlackPearlLogger
+ (OS_os_log)log;
- (BMSQLDatabase)database;
- (BMSource)source;
- (BMStream)stream;
- (EDBiomeBlackPearlLogger)initWithStreamType:(unint64_t)a3;
- (OS_dispatch_queue)queue;
- (id)_constructBiomeMessageGrainQuery:(id)a3 andEndTS:(id)a4 andBPEnabledAccounts:(id)a5;
- (id)_domainStringFrom:(int64_t)a3;
- (id)queryAllEventsForMessageID:(id)a3 andEventType:(id)a4;
- (id)queryMessageGrainEvents:(id)a3 endingAt:(id)a4 andBPEnabledAccounts:(id)a5;
- (int)_biomeCategoryValueFrom:(int64_t)a3;
- (int)_biomeDomainValueFrom:(int64_t)a3;
- (int)_biomeFedStatsCategoryValueFrom:(unint64_t)a3;
- (int)_biomeMailboxValueFrom:(int64_t)a3;
- (int)_biomeRecategorizationScopeValueFrom:(int64_t)a3;
- (void)_donateToBiomeWithEvent:(id)a3;
- (void)deleteEventsForMessages:(id)a3;
- (void)logReadEventForMessageID:(id)a3 messageDictionary:(id)a4;
- (void)logRecategorizationEventForMessageID:(id)a3 messageDictionary:(id)a4;
- (void)logRecategorizationFedStatsForMessage:(id)a3;
- (void)logReceiveEventForMessageID:(id)a3 messageDictionary:(id)a4;
- (void)setDatabase:(id)a3;
- (void)setQueue:(id)a3;
- (void)setSource:(id)a3;
- (void)setStream:(id)a3;
@end

@implementation EDBiomeBlackPearlLogger

+ (OS_os_log)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __30__EDBiomeBlackPearlLogger_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_11 != -1) {
    dispatch_once(&log_onceToken_11, block);
  }
  v2 = (void *)log_log_11;

  return (OS_os_log *)v2;
}

void __30__EDBiomeBlackPearlLogger_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_11;
  log_log_11 = (uint64_t)v1;
}

- (EDBiomeBlackPearlLogger)initWithStreamType:(unint64_t)a3
{
  v13.receiver = self;
  v13.super_class = (Class)EDBiomeBlackPearlLogger;
  id v4 = [(EDBiomeBlackPearlLogger *)&v13 init];
  if (v4)
  {
    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create("em_biome_stream_blackpearl", v5);
    v7 = (void *)*((void *)v4 + 1);
    *((void *)v4 + 1) = v6;

    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __46__EDBiomeBlackPearlLogger_initWithStreamType___block_invoke;
    v10[3] = &unk_1E6BFFA50;
    unint64_t v12 = a3;
    id v11 = v4;
    dispatch_block_t v8 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, v10);
    dispatch_async(*((dispatch_queue_t *)v4 + 1), v8);
  }
  return (EDBiomeBlackPearlLogger *)v4;
}

void __46__EDBiomeBlackPearlLogger_initWithStreamType___block_invoke(uint64_t a1)
{
  switch(*(void *)(a1 + 40))
  {
    case 0:
      BiomeLibrary();
      id v6 = (id)objc_claimAutoreleasedReturnValue();
      v2 = [v6 Mail];
      id v3 = [v2 CategorizationAnalytics];
      id v4 = [v3 Receive];
      [*(id *)(a1 + 32) setStream:v4];
      goto LABEL_5;
    case 1:
      BiomeLibrary();
      id v6 = (id)objc_claimAutoreleasedReturnValue();
      v2 = [v6 Mail];
      id v3 = [v2 CategorizationAnalytics];
      id v4 = [v3 Recategorize];
      [*(id *)(a1 + 32) setStream:v4];
      goto LABEL_5;
    case 2:
      BiomeLibrary();
      id v6 = (id)objc_claimAutoreleasedReturnValue();
      v2 = [v6 Mail];
      id v3 = [v2 CategorizationAnalytics];
      id v4 = [v3 Read];
      [*(id *)(a1 + 32) setStream:v4];
LABEL_5:

      goto LABEL_8;
    case 3:
      BiomeLibrary();
      id v6 = (id)objc_claimAutoreleasedReturnValue();
      v2 = [v6 Mail];
      id v3 = [v2 Categorization];
      [*(id *)(a1 + 32) setStream:v3];
      goto LABEL_8;
    case 4:
      BiomeLibrary();
      id v6 = (id)objc_claimAutoreleasedReturnValue();
      v2 = [v6 Mail];
      id v3 = [v2 Recategorization];
      [*(id *)(a1 + 32) setStream:v3];
LABEL_8:

      break;
    default:
      break;
  }
  id v7 = [*(id *)(a1 + 32) stream];
  v5 = [v7 source];
  [*(id *)(a1 + 32) setSource:v5];

  id v8 = objc_alloc_init(MEMORY[0x1E4F50410]);
  objc_msgSend(*(id *)(a1 + 32), "setDatabase:");
}

- (void)logReceiveEventForMessageID:(id)a3 messageDictionary:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v30 = a3;
  id v6 = a4;
  id v7 = +[EDBiomeBlackPearlLogger log];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v32 = v30;
    __int16 v33 = 2112;
    v34 = @"com.apple.mail.categorization.receive";
    _os_log_impl(&dword_1DB39C000, v7, OS_LOG_TYPE_DEFAULT, "[Biome] Logging event for messageID: %@ and type: %@", buf, 0x16u);
  }

  id v8 = [v6 objectForKeyedSubscript:@"predictedCategory"];
  uint64_t v9 = -[EDBiomeBlackPearlLogger _biomeCategoryValueFrom:](self, "_biomeCategoryValueFrom:", [v8 integerValue]);

  v10 = [v6 objectForKeyedSubscript:@"currCategoryView"];
  uint64_t v11 = -[EDBiomeBlackPearlLogger _biomeMailboxValueFrom:](self, "_biomeMailboxValueFrom:", [v10 integerValue]);

  unint64_t v12 = [v6 objectForKeyedSubscript:@"receivingAccountDomain"];
  uint64_t v13 = -[EDBiomeBlackPearlLogger _biomeDomainValueFrom:](self, "_biomeDomainValueFrom:", [v12 integerValue]);

  v14 = [v6 objectForKeyedSubscript:@"isMailAccountBlackPearlEnabled"];
  uint64_t v15 = [v14 BOOLValue];

  v16 = [v6 objectForKeyedSubscript:@"isAllInboxesBlackPearlEnabled"];
  uint64_t v17 = [v16 BOOLValue];

  id v18 = objc_alloc(MEMORY[0x1E4F4FF00]);
  v29 = [v6 objectForKeyedSubscript:@"accountId"];
  v28 = [NSNumber numberWithInt:v13];
  v27 = [v6 objectForKeyedSubscript:@"metadataPrimaryKey"];
  v26 = [NSNumber numberWithInt:v9];
  v19 = [NSNumber numberWithInt:v11];
  v20 = [v6 objectForKeyedSubscript:@"reasonCodes"];
  v21 = [v6 objectForKeyedSubscript:@"receivedTimestamp"];
  v22 = [NSNumber numberWithBool:v17];
  v23 = [v6 objectForKeyedSubscript:@"isMailAccountPersonalAccount"];
  v24 = [NSNumber numberWithBool:v15];
  v25 = (void *)[v18 initWithAccountId:v29 messageId:v30 senderId:0 receivingAccountDomain:v28 metadataPrimaryKey:v27 predictedCategory:v26 currCategoryView:v19 reasonCodes:v20 receiveTimestamp:v21 isAllInboxesCategoriesEnabled:v22 isMailAccountPersonalAccount:v23 isMailAccountCategoriesEnabled:v24];

  [(EDBiomeBlackPearlLogger *)self _donateToBiomeWithEvent:v25];
}

- (void)logReadEventForMessageID:(id)a3 messageDictionary:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = +[EDBiomeBlackPearlLogger log];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138412546;
    id v17 = v6;
    __int16 v18 = 2112;
    v19 = @"com.apple.mail.categorization.read";
    _os_log_impl(&dword_1DB39C000, v8, OS_LOG_TYPE_DEFAULT, "[Biome] Logging event for messageID: %@ and type: %@", (uint8_t *)&v16, 0x16u);
  }

  uint64_t v9 = [MEMORY[0x1E4F1C9C8] now];
  [v9 timeIntervalSince1970];
  double v11 = v10;

  id v12 = objc_alloc(MEMORY[0x1E4F4FEF0]);
  uint64_t v13 = [v7 objectForKeyedSubscript:@"accountId"];
  v14 = [NSNumber numberWithDouble:v11];
  uint64_t v15 = (void *)[v12 initWithAccountId:v13 messageId:v6 readTimestamp:v14 readWithCategoriesEnabled:0];

  [(EDBiomeBlackPearlLogger *)self _donateToBiomeWithEvent:v15];
}

- (void)logRecategorizationEventForMessageID:(id)a3 messageDictionary:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = +[EDBiomeBlackPearlLogger log];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = 138412546;
    id v21 = v6;
    __int16 v22 = 2112;
    v23 = @"com.apple.mail.categorization.recategorize";
    _os_log_impl(&dword_1DB39C000, v8, OS_LOG_TYPE_DEFAULT, "[Biome] Logging event for messageID: %@ and type: %@", (uint8_t *)&v20, 0x16u);
  }

  uint64_t v9 = [v7 objectForKeyedSubscript:@"currCategoryView"];
  uint64_t v10 = -[EDBiomeBlackPearlLogger _biomeMailboxValueFrom:](self, "_biomeMailboxValueFrom:", [v9 integerValue]);

  double v11 = [MEMORY[0x1E4F1C9C8] now];
  [v11 timeIntervalSince1970];
  double v13 = v12;

  id v14 = objc_alloc(MEMORY[0x1E4F4FEF8]);
  uint64_t v15 = [v7 objectForKeyedSubscript:@"accountId"];
  int v16 = [NSNumber numberWithInt:v10];
  id v17 = [v7 objectForKeyedSubscript:@"recategorizationBy"];
  __int16 v18 = [NSNumber numberWithDouble:v13];
  v19 = (void *)[v14 initWithAccountId:v15 messageId:v6 currCategoryView:v16 recategorizationBy:v17 recategorizeTimestamp:v18];

  [(EDBiomeBlackPearlLogger *)self _donateToBiomeWithEvent:v19];
}

- (void)logRecategorizationFedStatsForMessage:(id)a3
{
  id v15 = a3;
  id v4 = [v15 objectForKeyedSubscript:@"currCategoryView"];
  uint64_t v5 = -[EDBiomeBlackPearlLogger _biomeFedStatsCategoryValueFrom:](self, "_biomeFedStatsCategoryValueFrom:", [v4 unsignedIntValue]);

  id v6 = [v15 objectForKeyedSubscript:@"prevCategoryView"];
  uint64_t v7 = -[EDBiomeBlackPearlLogger _biomeFedStatsCategoryValueFrom:](self, "_biomeFedStatsCategoryValueFrom:", [v6 unsignedIntValue]);

  id v8 = [v15 objectForKeyedSubscript:@"recategorizationBy"];
  uint64_t v9 = -[EDBiomeBlackPearlLogger _biomeRecategorizationScopeValueFrom:](self, "_biomeRecategorizationScopeValueFrom:", [v8 integerValue]);

  id v10 = objc_alloc(MEMORY[0x1E4F4FF08]);
  double v11 = [v15 objectForKeyedSubscript:@"senderId"];
  double v12 = [v15 objectForKeyedSubscript:@"senderDomain"];
  double v13 = [v15 objectForKeyedSubscript:@"language"];
  id v14 = (void *)[v10 initWithCategory:v5 previous:v7 scope:v9 sender:v11 domain:v12 language:v13];

  [(EDBiomeBlackPearlLogger *)self _donateToBiomeWithEvent:v14];
}

- (id)queryAllEventsForMessageID:(id)a3 andEventType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v9 = [(EDBiomeBlackPearlLogger *)self queue];
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  id v17 = __67__EDBiomeBlackPearlLogger_queryAllEventsForMessageID_andEventType___block_invoke;
  __int16 v18 = &unk_1E6BFFA78;
  id v10 = v7;
  id v19 = v10;
  id v11 = v6;
  id v20 = v11;
  id v21 = self;
  id v12 = v8;
  id v22 = v12;
  dispatch_sync(v9, &v15);

  double v13 = objc_msgSend(v12, "copy", v15, v16, v17, v18);

  return v13;
}

void __67__EDBiomeBlackPearlLogger_queryAllEventsForMessageID_andEventType___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v2 = +[EDBiomeBlackPearlLogger log];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = *(void **)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    id v11 = v3;
    _os_log_impl(&dword_1DB39C000, v2, OS_LOG_TYPE_DEFAULT, "[Biome] Start queryAllEventsForMessageID and eventType %@", buf, 0xCu);
  }

  id v4 = [NSString stringWithFormat:@"SELECT * FROM \"Mail.Categorization\" where messageID = %@ and eventType = '%@'", *(void *)(a1 + 40), *(void *)(a1 + 32)];
  uint64_t v5 = [*(id *)(*(void *)(a1 + 48) + 32) executeQuery:@"%@", v4];
  while ([v5 next])
  {
    id v6 = [v5 row];
    [*(id *)(a1 + 56) addObject:v6];
  }
  id v7 = [v5 error];

  if (v7)
  {
    id v8 = +[EDBiomeBlackPearlLogger log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = [v5 error];
      *(_DWORD *)buf = 138412290;
      id v11 = v9;
      _os_log_impl(&dword_1DB39C000, v8, OS_LOG_TYPE_DEFAULT, "[Biome] Error for querying Biome db: %@", buf, 0xCu);
    }
  }
}

- (id)queryMessageGrainEvents:(id)a3 endingAt:(id)a4 andBPEnabledAccounts:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [MEMORY[0x1E4F1CA48] array];
  if ([v10 count])
  {
    uint64_t v12 = [(EDBiomeBlackPearlLogger *)self queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __81__EDBiomeBlackPearlLogger_queryMessageGrainEvents_endingAt_andBPEnabledAccounts___block_invoke;
    block[3] = &unk_1E6BFFAA0;
    __int16 v18 = v8;
    id v19 = v9;
    id v20 = v10;
    id v21 = self;
    id v13 = v11;
    id v22 = v13;
    dispatch_sync(v12, block);

    id v14 = v13;
    uint64_t v15 = v18;
  }
  else
  {
    uint64_t v15 = +[EDBiomeBlackPearlLogger log];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DB39C000, v15, OS_LOG_TYPE_DEFAULT, "[Biome] No accounts have BlackPearl enabled.", buf, 2u);
    }
    id v14 = 0;
  }

  return v14;
}

void __81__EDBiomeBlackPearlLogger_queryMessageGrainEvents_endingAt_andBPEnabledAccounts___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v2 = +[EDBiomeBlackPearlLogger log];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = *(void **)(a1 + 32);
    id v3 = *(void **)(a1 + 40);
    uint64_t v5 = [*(id *)(a1 + 48) allObjects];
    id v6 = [v5 componentsJoinedByString:@", "];
    *(_DWORD *)buf = 138412802;
    id v14 = v4;
    __int16 v15 = 2112;
    uint64_t v16 = v3;
    __int16 v17 = 2112;
    __int16 v18 = v6;
    _os_log_impl(&dword_1DB39C000, v2, OS_LOG_TYPE_DEFAULT, "[Biome] Start queryMessageGrainEvents startTS %@ endTS %@ BlackPearlEnabledAccount %@", buf, 0x20u);
  }
  id v7 = [*(id *)(a1 + 56) _constructBiomeMessageGrainQuery:*(void *)(a1 + 32) andEndTS:*(void *)(a1 + 40) andBPEnabledAccounts:*(void *)(a1 + 48)];
  id v8 = [*(id *)(*(void *)(a1 + 56) + 32) executeQuery:@"%@", v7];
  while ([v8 next])
  {
    id v9 = [v8 row];
    [*(id *)(a1 + 64) addObject:v9];
  }
  id v10 = [v8 error];

  if (v10)
  {
    id v11 = +[EDBiomeBlackPearlLogger log];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = [v8 error];
      *(_DWORD *)buf = 138412546;
      id v14 = v12;
      __int16 v15 = 2112;
      uint64_t v16 = v7;
      _os_log_impl(&dword_1DB39C000, v11, OS_LOG_TYPE_DEFAULT, "[Biome] Error for querying Biome db: %@ query %@", buf, 0x16u);
    }
  }
}

- (void)deleteEventsForMessages:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_new();
  id v6 = objc_msgSend(v4, "ef_map:", &__block_literal_global_6);
  [v5 addObjectsFromArray:v6];
  id v7 = [(EDBiomeBlackPearlLogger *)self stream];
  id v8 = [v7 pruner];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __51__EDBiomeBlackPearlLogger_deleteEventsForMessages___block_invoke_2;
  v10[3] = &unk_1E6BFFAC8;
  id v9 = v5;
  id v11 = v9;
  [v8 deleteEventsPassingTest:v10];
}

id __51__EDBiomeBlackPearlLogger_deleteEventsForMessages___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v2, "globalMessageID"));
  id v4 = [v3 stringValue];

  return v4;
}

uint64_t __51__EDBiomeBlackPearlLogger_deleteEventsForMessages___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [a2 eventBody];
  id v4 = [v3 messageId];
  uint64_t v5 = [v2 containsObject:v4];

  return v5;
}

- (void)_donateToBiomeWithEvent:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51__EDBiomeBlackPearlLogger__donateToBiomeWithEvent___block_invoke;
  v7[3] = &unk_1E6BFFAF0;
  v7[4] = self;
  id v8 = v4;
  id v5 = v4;
  dispatch_block_t v6 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, v7);
  dispatch_async((dispatch_queue_t)self->_queue, v6);
}

uint64_t __51__EDBiomeBlackPearlLogger__donateToBiomeWithEvent___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) sendEvent:*(void *)(a1 + 40)];
}

- (int)_biomeCategoryValueFrom:(int64_t)a3
{
  if ((unint64_t)a3 >= 0xF) {
    return 13;
  }
  else {
    return a3;
  }
}

- (int)_biomeMailboxValueFrom:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) < 6) {
    return a3;
  }
  else {
    return 0;
  }
}

- (int)_biomeDomainValueFrom:(int64_t)a3
{
  if ((unint64_t)a3 >= 8) {
    return 7;
  }
  else {
    return a3;
  }
}

- (int)_biomeFedStatsCategoryValueFrom:(unint64_t)a3
{
  if (a3 > 3) {
    return 0;
  }
  else {
    return dword_1DB640370[a3];
  }
}

- (int)_biomeRecategorizationScopeValueFrom:(int64_t)a3
{
  if (a3) {
    return 2 * (a3 == 1);
  }
  else {
    return 1;
  }
}

- (id)_domainStringFrom:(int64_t)a3
{
  if ((unint64_t)a3 > 6) {
    id v3 = kUserEmailDomainOther;
  }
  else {
    id v3 = off_1E6BFFB10[a3];
  }
  return *v3;
}

- (id)_constructBiomeMessageGrainQuery:(id)a3 andEndTS:(id)a4 andBPEnabledAccounts:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = NSString;
  uint64_t v11 = [v7 unsignedLongLongValue];
  uint64_t v12 = [v8 unsignedLongLongValue];
  id v13 = [v9 allObjects];
  id v14 = [v13 componentsJoinedByString:@","];
  objc_msgSend(v10, "stringWithFormat:", @"WITH receive_row_num AS(   SELECT accountId,           messageId,           senderId,           receivingAccountDomain,           metadataPrimaryKey,           predictedCategory,           currCategoryView,           reasonCodes,           isAllInboxesCategoriesEnabled AS isAllInboxesBlackPearlEnabled,           isMailAccountPersonalAccount,           isMailAccountCategoriesEnabled AS isMailAccountBlackPearlEnabled,           ROW_NUMBER() OVER (PARTITION BY accountId, messageId ORDER BY eventTimestamp DESC) AS rn    FROM \"Mail.CategorizationAnalytics.Receive\"    WHERE receiveTimestamp >= %llu          AND receiveTimestamp < %llu          AND accountId IN (%@)),receive AS(   SELECT accountId,           messageId,           senderId,           receivingAccountDomain,           metadataPrimaryKey,           predictedCategory,           currCategoryView,           reasonCodes,           isAllInboxesBlackPearlEnabled,           isMailAccountPersonalAccount,           isMailAccountBlackPearlEnabled    FROM receive_row_num    WHERE rn = 1),recategorize_row_num AS(   SELECT accountId,           messageId,           currCategoryView,           recategorizationBy,           recategorizeTimestamp,           ROW_NUMBER() OVER (PARTITION BY accountId, messageId ORDER BY recategorizeTimestamp DESC) AS rn    FROM \"Mail.CategorizationAnalytics.Recategorize\"),recategorize AS(   SELECT accountId,           messageId,           currCategoryView,           recategorizationBy,           recategorizeTimestamp AS lastRecategorizeTimestamp    FROM recategorize_row_num    WHERE rn = 1),flattened AS(   SELECT receive.messageId,           receive.senderId,           receive.receivingAccountDomain,           receive.metadataPrimaryKey,           receive.isAllInboxesBlackPearlEnabled,           receive.isMailAccountPersonalAccount,           receive.isMailAccountBlackPearlEnabled,           receive.predictedCategory,           COALESCE(recategorize.currCategoryView, receive.currCategoryView) AS currCategoryView,           NULL AS hadFirstReadWithBlackPearlEnabled,           NULL AS hadReadBeforeRecat,           receive.reasonCodes,           recategorize.recategorizationBy,           RANDOM() as random_number    FROM receive         LEFT JOIN recategorize                 ON receive.accountId = recategorize.accountId                    AND receive.messageId = recategorize.messageId) SELECT messageId,       senderId,       receivingAccountDomain,       metadataPrimaryKey,       isAllInboxesBlackPearlEnabled,       isMailAccountPersonalAccount,       isMailAccountBlackPearlEnabled,       predictedCategory,       currCategoryView,       hadFirstReadWithBlackPearlEnabled,       hadReadBeforeRecat,       reasonCodes,       recategorizationBy FROM flattened ORDER BY random_number LIMIT 500;",
    v11,
    v12,
  __int16 v15 = v14);

  return v15;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (BMStream)stream
{
  return self->_stream;
}

- (void)setStream:(id)a3
{
}

- (BMSource)source
{
  return self->_source;
}

- (void)setSource:(id)a3
{
}

- (BMSQLDatabase)database
{
  return self->_database;
}

- (void)setDatabase:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_database, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_stream, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end