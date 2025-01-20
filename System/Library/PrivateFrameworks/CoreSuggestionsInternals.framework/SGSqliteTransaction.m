@interface SGSqliteTransaction
+ (void)readTransactionWithHandle:(id)a3 block:(id)a4;
+ (void)writeTransactionWithHandle:(id)a3 block:(id)a4;
@end

@implementation SGSqliteTransaction

+ (void)writeTransactionWithHandle:(id)a3 block:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __56__SGSqliteTransaction_writeTransactionWithHandle_block___block_invoke;
  v9[3] = &unk_1E65C0440;
  id v10 = v5;
  id v11 = v6;
  id v7 = v5;
  id v8 = v6;
  [v7 writeTransaction:v9];
}

void __56__SGSqliteTransaction_writeTransactionWithHandle_block___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  v2 = [[SGSqliteWriteTransaction alloc] initWithHandle:*(void *)(a1 + 32)];
  (*(void (**)(uint64_t, SGSqliteWriteTransaction *))(v1 + 16))(v1, v2);
}

+ (void)readTransactionWithHandle:(id)a3 block:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __55__SGSqliteTransaction_readTransactionWithHandle_block___block_invoke;
  v9[3] = &unk_1E65C0440;
  id v10 = v5;
  id v11 = v6;
  id v7 = v5;
  id v8 = v6;
  [v7 readTransaction:v9];
}

void __55__SGSqliteTransaction_readTransactionWithHandle_block___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  v2 = [[SGSqliteReadTransaction alloc] initWithHandle:*(void *)(a1 + 32)];
  (*(void (**)(uint64_t, SGSqliteReadTransaction *))(v1 + 16))(v1, v2);
}

@end