@interface EDMailboxActionPersistence
+ (id)tablesAndForeignKeysToResolve:(id *)a3 associationsToResolve:(id *)a4;
- (EDMailboxActionPersistence)initWithDatabase:(id)a3;
- (EDPersistenceDatabase)database;
- (id)allMailboxActionForAccountID:(id)a3;
- (id)nextMailboxActionForAccountID:(id)a3;
- (void)deleteMailboxAction:(int64_t)a3;
- (void)deleteMailboxActions:(id)a3;
- (void)saveMailboxActionForAccountID:(id)a3 action:(id)a4;
@end

@implementation EDMailboxActionPersistence

+ (id)tablesAndForeignKeysToResolve:(id *)a3 associationsToResolve:(id *)a4
{
  v15[5] = *MEMORY[0x1E4F143B8];
  id v4 = objc_alloc(MEMORY[0x1E4F60F08]);
  v5 = [MEMORY[0x1E4F60E80] textColumnWithName:@"account_identifier" collation:0 nullable:1];
  v15[0] = v5;
  v6 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"action_type" nullable:1];
  v15[1] = v6;
  v7 = [MEMORY[0x1E4F60E80] textColumnWithName:@"mailbox_name" collation:0 nullable:1];
  v15[2] = v7;
  v8 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"mailbox" nullable:1 defaultValue:0];
  v15[3] = v8;
  v9 = [MEMORY[0x1E4F60E80] textColumnWithName:@"new_mailbox_name" collation:0 nullable:1];
  v15[4] = v9;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:5];
  v11 = (void *)[v4 initWithName:@"mailbox_actions" rowIDType:2 columns:v10];

  v14 = v11;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v14 count:1];

  return v12;
}

- (EDMailboxActionPersistence)initWithDatabase:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)EDMailboxActionPersistence;
  v6 = [(EDMailboxActionPersistence *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_database, a3);
  }

  return v7;
}

- (void)saveMailboxActionForAccountID:(id)a3 action:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(EDMailboxActionPersistence *)self database];
  objc_super v9 = [NSString stringWithUTF8String:"-[EDMailboxActionPersistence saveMailboxActionForAccountID:action:]"];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __67__EDMailboxActionPersistence_saveMailboxActionForAccountID_action___block_invoke;
  v12[3] = &unk_1E6BFF3D8;
  id v10 = v6;
  id v13 = v10;
  id v11 = v7;
  id v14 = v11;
  objc_msgSend(v8, "__performWriteWithCaller:usingBlock:", v9, v12);
}

uint64_t __67__EDMailboxActionPersistence_saveMailboxActionForAccountID_action___block_invoke(uint64_t a1, void *a2)
{
  v16[5] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v14 = [v3 preparedStatementForQueryString:@"INSERT INTO mailbox_actions (account_identifier, action_type, mailbox, mailbox_name, new_mailbox_name) VALUES (?, ?, ?, ?, ?)"];
  id v4 = *(void **)(a1 + 40);
  v16[0] = *(void *)(a1 + 32);
  id v5 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "actionType"));
  v16[1] = v5;
  id v6 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(*(id *)(a1 + 40), "mailboxID"));
  v16[2] = v6;
  id v7 = [*(id *)(a1 + 40) mailboxName];
  v16[3] = v7;
  v8 = [*(id *)(a1 + 40) renamedMailboxName];
  objc_super v9 = v8;
  if (!v8)
  {
    objc_super v9 = [MEMORY[0x1E4F1CA98] null];
  }
  v16[4] = v9;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:5];
  id v15 = 0;
  char v11 = [v14 executeWithIndexedBindings:v10 usingBlock:0 error:&v15];
  id v12 = v15;

  if (!v8) {
  if ((v11 & 1) == 0)
  }
    [v3 handleError:v12 message:@"inserting mailbox action"];

  return 1;
}

- (id)allMailboxActionForAccountID:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA48] array];
  id v6 = [(EDMailboxActionPersistence *)self database];
  id v7 = [NSString stringWithUTF8String:"-[EDMailboxActionPersistence allMailboxActionForAccountID:]"];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __59__EDMailboxActionPersistence_allMailboxActionForAccountID___block_invoke;
  v13[3] = &unk_1E6BFF3D8;
  id v8 = v4;
  id v14 = v8;
  id v9 = v5;
  id v15 = v9;
  objc_msgSend(v6, "__performReadWithCaller:usingBlock:", v7, v13);

  id v10 = v15;
  id v11 = v9;

  return v11;
}

uint64_t __59__EDMailboxActionPersistence_allMailboxActionForAccountID___block_invoke(uint64_t a1, void *a2)
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v3 = [a2 preparedStatementForQueryString:@"SELECT ROWID, action_type, mailbox, mailbox_name, new_mailbox_name FROM mailbox_actions WHERE (account_identifier = ?) ORDER BY ROWID"];
  id v4 = [MEMORY[0x1E4F60E60] bindingWithString:*(void *)(a1 + 32)];
  v9[0] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __59__EDMailboxActionPersistence_allMailboxActionForAccountID___block_invoke_2;
  v7[3] = &unk_1E6BFF3B0;
  id v8 = *(id *)(a1 + 40);
  [v3 executeWithIndexedBindings:v5 usingBlock:v7 error:0];

  return 1;
}

void __59__EDMailboxActionPersistence_allMailboxActionForAccountID___block_invoke_2(uint64_t a1, void *a2)
{
  id v17 = a2;
  id v14 = [EDMailboxAction alloc];
  v16 = [v17 objectForKeyedSubscript:@"ROWID"];
  uint64_t v2 = [v16 int64Value];
  id v15 = [v17 objectForKeyedSubscript:@"action_type"];
  id v3 = [v15 numberValue];
  uint64_t v4 = [v3 longLongValue];
  id v5 = [v17 objectForKeyedSubscript:@"mailbox"];
  id v6 = [v5 numberValue];
  uint64_t v7 = [v6 longLongValue];
  id v8 = [v17 objectForKeyedSubscript:@"mailbox_name"];
  id v9 = [v8 stringValue];
  id v10 = [v17 objectForKeyedSubscript:@"new_mailbox_name"];
  id v11 = [v10 stringValue];
  id v12 = [(EDMailboxAction *)v14 initWithID:v2 actionType:v4 mailboxID:v7 mailboxName:v9 renamedMailboxName:v11];

  [*(id *)(a1 + 32) addObject:v12];
}

- (id)nextMailboxActionForAccountID:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__15;
  id v17 = __Block_byref_object_dispose__15;
  id v18 = 0;
  id v5 = [(EDMailboxActionPersistence *)self database];
  id v6 = [NSString stringWithUTF8String:"-[EDMailboxActionPersistence nextMailboxActionForAccountID:]"];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __60__EDMailboxActionPersistence_nextMailboxActionForAccountID___block_invoke;
  v10[3] = &unk_1E6BFF400;
  id v7 = v4;
  id v11 = v7;
  id v12 = &v13;
  objc_msgSend(v5, "__performReadWithCaller:usingBlock:", v6, v10);

  id v8 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v8;
}

uint64_t __60__EDMailboxActionPersistence_nextMailboxActionForAccountID___block_invoke(uint64_t a1, void *a2)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v3 = [a2 preparedStatementForQueryString:@"SELECT ROWID, action_type, mailbox, mailbox_name, new_mailbox_name FROM mailbox_actions WHERE (account_identifier = ?) ORDER BY ROWID LIMIT 1"];
  id v4 = [MEMORY[0x1E4F60E60] bindingWithString:*(void *)(a1 + 32)];
  v8[0] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __60__EDMailboxActionPersistence_nextMailboxActionForAccountID___block_invoke_2;
  v7[3] = &unk_1E6BFF4C8;
  void v7[4] = *(void *)(a1 + 40);
  [v3 executeWithIndexedBindings:v5 usingBlock:v7 error:0];

  return 1;
}

void __60__EDMailboxActionPersistence_nextMailboxActionForAccountID___block_invoke_2(uint64_t a1, void *a2)
{
  id v19 = a2;
  uint64_t v2 = [EDMailboxAction alloc];
  id v18 = [v19 objectForKeyedSubscript:@"ROWID"];
  uint64_t v3 = [v18 int64Value];
  id v17 = [v19 objectForKeyedSubscript:@"action_type"];
  v16 = [v17 numberValue];
  uint64_t v4 = [v16 longLongValue];
  id v5 = [v19 objectForKeyedSubscript:@"mailbox"];
  id v6 = [v5 numberValue];
  uint64_t v7 = [v6 longLongValue];
  id v8 = [v19 objectForKeyedSubscript:@"mailbox_name"];
  id v9 = [v8 stringValue];
  id v10 = [v19 objectForKeyedSubscript:@"new_mailbox_name"];
  id v11 = [v10 stringValue];
  uint64_t v12 = [(EDMailboxAction *)v2 initWithID:v3 actionType:v4 mailboxID:v7 mailboxName:v9 renamedMailboxName:v11];
  uint64_t v13 = *(void *)(*(void *)(a1 + 32) + 8);
  id v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v12;
}

- (void)deleteMailboxAction:(int64_t)a3
{
  uint64_t v4 = [(EDMailboxActionPersistence *)self database];
  id v5 = [NSString stringWithUTF8String:"-[EDMailboxActionPersistence deleteMailboxAction:]"];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __50__EDMailboxActionPersistence_deleteMailboxAction___block_invoke;
  v6[3] = &__block_descriptor_40_e41_B16__0__EDPersistenceDatabaseConnection_8l;
  v6[4] = a3;
  objc_msgSend(v4, "__performWriteWithCaller:usingBlock:", v5, v6);
}

uint64_t __50__EDMailboxActionPersistence_deleteMailboxAction___block_invoke(uint64_t a1, void *a2)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a2 preparedStatementForQueryString:@"DELETE FROM mailbox_actions WHERE ROWID = ?"];
  uint64_t v4 = [NSNumber numberWithLongLong:*(void *)(a1 + 32)];
  v7[0] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  [v3 executeWithIndexedBindings:v5 usingBlock:0 error:0];

  return 1;
}

- (void)deleteMailboxActions:(id)a3
{
  id v4 = a3;
  id v5 = [(EDMailboxActionPersistence *)self database];
  id v6 = [NSString stringWithUTF8String:"-[EDMailboxActionPersistence deleteMailboxActions:]"];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  void v8[2] = __51__EDMailboxActionPersistence_deleteMailboxActions___block_invoke;
  v8[3] = &unk_1E6C00AF0;
  id v7 = v4;
  id v9 = v7;
  objc_msgSend(v5, "__performWriteWithCaller:usingBlock:", v6, v8);
}

uint64_t __51__EDMailboxActionPersistence_deleteMailboxActions___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_msgSend(*(id *)(a1 + 32), "ef_map:", &__block_literal_global_32);
  id v5 = [v4 componentsJoinedByString:@", "];

  id v6 = [NSString stringWithFormat:@"DELETE FROM mailbox_actions WHERE ROWID IN (%@)", v5];
  id v7 = [v3 preparedStatementForQueryString:v6];
  [v7 executeWithIndexedBindings:MEMORY[0x1E4F1CBF0] usingBlock:0 error:0];

  return 1;
}

id __51__EDMailboxActionPersistence_deleteMailboxActions___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = objc_msgSend(NSString, "stringWithFormat:", @"%lld", objc_msgSend(v2, "longLongValue"));

  return v3;
}

- (EDPersistenceDatabase)database
{
  return self->_database;
}

- (void).cxx_destruct
{
}

@end