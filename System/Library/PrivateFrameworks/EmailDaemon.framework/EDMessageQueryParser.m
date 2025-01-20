@interface EDMessageQueryParser
+ (id)log;
- (EDMessageQueryParser)initWithSchema:(id)a3 protectedSchema:(id)a4 accountsProvider:(id)a5 vipManager:(id)a6 messagePersistence:(id)a7 mailboxPersistence:(id)a8;
- (EDMessageQueryTransformer)transformer;
- (EFSQLObjectPropertyMapper)sqlPropertyMapper;
- (EFSQLValueExpressable)additionalSQLClause;
- (EFSQLValueExpressable)additionalSQLClauseForCountQuery;
- (EFSQLValueExpressable)additionalSQLClauseForGlobalMessageCountQuery;
- (EFSQLValueExpressable)additionalSQLClauseForJournaledMessages;
- (id)_sqlQueryToCountResultsForQuery:(id)a3 distinctByGlobalMessageID:(BOOL)a4;
- (id)sqlCountQueryByMailboxForQuery:(id)a3;
- (id)sqlCountQueryForQuery:(id)a3;
- (id)sqlQueryForQuery:(id)a3 protectedDataAvailable:(BOOL)a4;
- (id)sqlQueryToCountJournaledMessagesForQuery:(id)a3;
- (id)sqlQueryToCountMessagesWithGlobalMessageID:(int64_t)a3 matchingQuery:(id)a4;
- (void)_modifySelectStatement:(id)a3 byAddingAdditionalClause:(id)a4;
@end

@implementation EDMessageQueryParser

- (id)_sqlQueryToCountResultsForQuery:(id)a3 distinctByGlobalMessageID:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [(EDMessageQueryParser *)self transformer];
  v8 = [v6 predicate];
  v9 = [v7 transformPredicate:v8];

  v10 = (void *)MEMORY[0x1E4F60E78];
  v11 = +[EDMessagePersistence messagesTableName];
  v12 = +[EDMessagePersistence globalMessageIDColumnName];
  v13 = [v10 table:v11 column:v12];

  v14 = (void *)MEMORY[0x1E4F60EE8];
  v15 = [(EDMessageQueryParser *)self sqlPropertyMapper];
  if (v4) {
    v16 = v13;
  }
  else {
    v16 = 0;
  }
  v17 = [v14 countStatementForPredicate:v9 propertyMapper:v15 distinctBy:v16];

  if (([v6 queryOptions] & 0x100) != 0) {
    [(EDMessageQueryParser *)self additionalSQLClauseForJournaledMessages];
  }
  else {
  v18 = [(EDMessageQueryParser *)self additionalSQLClauseForCountQuery];
  }
  [(EDMessageQueryParser *)self _modifySelectStatement:v17 byAddingAdditionalClause:v18];

  return v17;
}

- (EFSQLObjectPropertyMapper)sqlPropertyMapper
{
  return self->_sqlPropertyMapper;
}

- (EDMessageQueryTransformer)transformer
{
  return self->_transformer;
}

- (EFSQLValueExpressable)additionalSQLClauseForCountQuery
{
  return self->_additionalSQLClauseForCountQuery;
}

- (void)_modifySelectStatement:(id)a3 byAddingAdditionalClause:(id)a4
{
  v12[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = [v5 where];
  id v8 = v7;
  if (v7)
  {
    if (([v7 isEqual:MEMORY[0x1E4F1CC28]] & 1) == 0)
    {
      v9 = (void *)MEMORY[0x1E4F60E48];
      v12[0] = v8;
      v12[1] = v6;
      v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];
      uint64_t v11 = [v9 combined:v10];

      id v8 = (id)v11;
    }
  }
  else
  {
    id v8 = v6;
  }
  [v5 setWhere:v8];
}

- (id)sqlCountQueryForQuery:(id)a3
{
  v3 = [(EDMessageQueryParser *)self _sqlQueryToCountResultsForQuery:a3 distinctByGlobalMessageID:1];

  return v3;
}

+ (id)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __27__EDMessageQueryParser_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_59 != -1) {
    dispatch_once(&log_onceToken_59, block);
  }
  v2 = (void *)log_log_59;

  return v2;
}

void __27__EDMessageQueryParser_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_59;
  log_log_59 = (uint64_t)v1;
}

- (EDMessageQueryParser)initWithSchema:(id)a3 protectedSchema:(id)a4 accountsProvider:(id)a5 vipManager:(id)a6 messagePersistence:(id)a7 mailboxPersistence:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  v34.receiver = self;
  v34.super_class = (Class)EDMessageQueryParser;
  v20 = [(EDMessageQueryParser *)&v34 init];
  if (v20)
  {
    v21 = [[EDMessageQueryTransformer alloc] initWithAccountsProvider:v16 mailboxPersistence:v19 messagePersistence:v18 vipManager:v17];
    transformer = v20->_transformer;
    v20->_transformer = v21;

    uint64_t v23 = +[EDMessagePersistence objectPropertyMapperForSchema:v14 protectedSchema:v15];
    sqlPropertyMapper = v20->_sqlPropertyMapper;
    v20->_sqlPropertyMapper = (EFSQLObjectPropertyMapper *)v23;

    uint64_t v25 = [v18 expressionForFilteringUnavailableMessages];
    additionalSQLClause = v20->_additionalSQLClause;
    v20->_additionalSQLClause = (EFSQLValueExpressable *)v25;

    uint64_t v27 = [v18 expressionForFilteringUnavailableMessagesFromCount];
    additionalSQLClauseForCountQuery = v20->_additionalSQLClauseForCountQuery;
    v20->_additionalSQLClauseForCountQuery = (EFSQLValueExpressable *)v27;

    uint64_t v29 = [v18 expressionForFilteringUnavailableMessagesFromCountForGlobalMessageQuery];
    additionalSQLClauseForGlobalMessageCountQuery = v20->_additionalSQLClauseForGlobalMessageCountQuery;
    v20->_additionalSQLClauseForGlobalMessageCountQuery = (EFSQLValueExpressable *)v29;

    uint64_t v31 = [v18 expressionForFindingOnlyJournaledMessages];
    additionalSQLClauseForJournaledMessages = v20->_additionalSQLClauseForJournaledMessages;
    v20->_additionalSQLClauseForJournaledMessages = (EFSQLValueExpressable *)v31;
  }
  return v20;
}

- (id)sqlQueryForQuery:(id)a3 protectedDataAvailable:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [(EDMessageQueryParser *)self transformer];
  id v8 = [v6 predicate];
  v9 = [v7 transformPredicate:v8];

  v10 = (void *)MEMORY[0x1E4F60EE8];
  uint64_t v11 = [v6 sortDescriptors];
  uint64_t v12 = [v6 limit];
  v13 = [(EDMessageQueryParser *)self sqlPropertyMapper];
  id v14 = [v10 selectStatementForReturnObjectKeypaths:MEMORY[0x1E4F1CBF0] predicate:v9 sortDescriptors:v11 limit:v12 propertyMapper:v13 protectedDataAvailable:v4];

  if (([v6 queryOptions] & 0x100) != 0)
  {
    uint64_t v15 = [(EDMessageQueryParser *)self additionalSQLClauseForJournaledMessages];
  }
  else
  {
    if (([v6 queryOptions] & 0x200) != 0)
    {
      id v16 = 0;
      goto LABEL_8;
    }
    uint64_t v15 = [(EDMessageQueryParser *)self additionalSQLClause];
  }
  id v16 = (void *)v15;
  if (v15) {
    [(EDMessageQueryParser *)self _modifySelectStatement:v14 byAddingAdditionalClause:v15];
  }
LABEL_8:
  id v17 = [v6 sortDescriptors];
  uint64_t v18 = [v17 count];

  if (v18)
  {
    id v19 = +[EDMessagePersistence messagesTableName];
    [v14 orderByColumn:*MEMORY[0x1E4F60D08] fromTable:v19 ascending:0];
  }

  return v14;
}

- (id)sqlQueryToCountJournaledMessagesForQuery:(id)a3
{
  id v3 = [(EDMessageQueryParser *)self _sqlQueryToCountResultsForQuery:a3 distinctByGlobalMessageID:0];

  return v3;
}

- (id)sqlQueryToCountMessagesWithGlobalMessageID:(int64_t)a3 matchingQuery:(id)a4
{
  v27[3] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v7 = [(EDMessageQueryParser *)self transformer];
  id v8 = [v6 predicate];
  v9 = [v7 transformPredicate:v8];

  v10 = (void *)MEMORY[0x1E4F60EE8];
  uint64_t v11 = [(EDMessageQueryParser *)self sqlPropertyMapper];
  uint64_t v12 = [v10 countStatementForPredicate:v9 propertyMapper:v11 distinctBy:0];

  v13 = [v12 where];
  id v14 = (void *)MEMORY[0x1E4F60E78];
  uint64_t v15 = +[EDMessagePersistence messagesTableName];
  id v16 = +[EDMessagePersistence globalMessageIDColumnName];
  id v17 = [v14 table:v15 column:v16];
  uint64_t v18 = [NSNumber numberWithLongLong:a3];
  id v19 = [v17 equalTo:v18];

  if (v13)
  {
    if ([v13 isEqual:MEMORY[0x1E4F1CC28]]) {
      goto LABEL_6;
    }
    v20 = (void *)MEMORY[0x1E4F60E48];
    v27[0] = v19;
    v27[1] = v13;
    v21 = [(EDMessageQueryParser *)self additionalSQLClauseForGlobalMessageCountQuery];
    v27[2] = v21;
    v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:3];
    uint64_t v23 = [v20 combined:v22];

    v13 = (void *)v23;
  }
  else
  {
    v24 = (void *)MEMORY[0x1E4F60E48];
    v21 = [(EDMessageQueryParser *)self additionalSQLClauseForGlobalMessageCountQuery];
    v26[1] = v21;
    v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:2];
    v13 = [v24 combined:v22];
  }

LABEL_6:
  [v12 setWhere:v13];

  return v12;
}

- (id)sqlCountQueryByMailboxForQuery:(id)a3
{
  id v4 = a3;
  id v5 = [(EDMessageQueryParser *)self transformer];
  id v6 = [v4 predicate];
  v7 = [v5 transformPredicate:v6];

  id v8 = (void *)MEMORY[0x1E4F60E78];
  v9 = +[EDMessagePersistence messagesTableName];
  v10 = +[EDMessagePersistence globalMessageIDColumnName];
  uint64_t v11 = [v8 table:v9 column:v10];

  uint64_t v12 = (void *)MEMORY[0x1E4F60EE8];
  v13 = [(EDMessageQueryParser *)self sqlPropertyMapper];
  id v14 = [v12 countStatementForPredicate:v7 propertyMapper:v13 distinctBy:v11 groupBy:@"url" groupByTable:@"mailboxes"];

  if (([v4 queryOptions] & 0x100) != 0) {
    [(EDMessageQueryParser *)self additionalSQLClauseForJournaledMessages];
  }
  else {
  uint64_t v15 = [(EDMessageQueryParser *)self additionalSQLClauseForCountQuery];
  }
  [(EDMessageQueryParser *)self _modifySelectStatement:v14 byAddingAdditionalClause:v15];

  return v14;
}

- (EFSQLValueExpressable)additionalSQLClause
{
  return self->_additionalSQLClause;
}

- (EFSQLValueExpressable)additionalSQLClauseForGlobalMessageCountQuery
{
  return self->_additionalSQLClauseForGlobalMessageCountQuery;
}

- (EFSQLValueExpressable)additionalSQLClauseForJournaledMessages
{
  return self->_additionalSQLClauseForJournaledMessages;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additionalSQLClauseForJournaledMessages, 0);
  objc_storeStrong((id *)&self->_additionalSQLClauseForGlobalMessageCountQuery, 0);
  objc_storeStrong((id *)&self->_additionalSQLClauseForCountQuery, 0);
  objc_storeStrong((id *)&self->_additionalSQLClause, 0);
  objc_storeStrong((id *)&self->_transformer, 0);

  objc_storeStrong((id *)&self->_sqlPropertyMapper, 0);
}

@end