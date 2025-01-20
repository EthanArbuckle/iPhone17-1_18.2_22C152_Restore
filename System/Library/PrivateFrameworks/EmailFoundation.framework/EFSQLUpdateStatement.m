@interface EFSQLUpdateStatement
- (EFSQLUpdateStatement)initWithTable:(id)a3;
- (EFSQLUpdateStatement)initWithTable:(id)a3 conflictResolution:(unint64_t)a4;
- (EFSQLValueExpressable)whereClause;
- (NSString)queryString;
- (id)objectForKeyedSubscript:(id)a3;
- (void)_renderSQLExpressionForUpsert:(void *)a3 into:;
- (void)enumerateBindingNamesAndValuesUsingBlock:(id)a3;
- (void)renderStatementForUpsertInto:(uint64_t)a1;
- (void)setObject:(id)a3 forKeyedSubscript:(id)a4;
- (void)setWhereClause:(id)a3;
@end

@implementation EFSQLUpdateStatement

- (void)enumerateBindingNamesAndValuesUsingBlock:(id)a3
{
  id v4 = a3;
  if (self) {
    bindables = self->_bindables;
  }
  else {
    bindables = 0;
  }
  v6 = bindables;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __65__EFSQLUpdateStatement_enumerateBindingNamesAndValuesUsingBlock___block_invoke;
  v8[3] = &unk_1E6123600;
  id v9 = v4;
  id v7 = v4;
  [(NSMutableDictionary *)v6 enumerateKeysAndObjectsUsingBlock:v8];
}

- (NSString)queryString
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  -[EFSQLUpdateStatement _renderSQLExpressionForUpsert:into:]((uint64_t)self, 0, v3);
  return (NSString *)v3;
}

- (void)_renderSQLExpressionForUpsert:(void *)a3 into:
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!a1) {
    goto LABEL_21;
  }
  id v6 = *(id *)(a1 + 16);
  uint64_t v7 = [v6 count];
  uint64_t v8 = [*(id *)(a1 + 24) count];

  if (!(v7 + v8))
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:sel__renderSQLExpressionForUpsert_into_ object:a1 file:@"EFSQLUpdateStatement.m" lineNumber:72 description:@"Need at least one bindable value for a column to generate a queryString"];

    if (a2) {
      goto LABEL_4;
    }
LABEL_6:
    uint64_t v10 = *(void *)(a1 + 40);
    if (v10)
    {
      v11 = EFSQLStringForConflictResolution(v10);
      [v5 appendFormat:@"UPDATE OR %@ %@ SET ", v11, *(void *)(a1 + 32)];
    }
    else
    {
      [v5 appendFormat:@"UPDATE %@ SET ", *(void *)(a1 + 32)];
    }
    goto LABEL_9;
  }
  if (!a2) {
    goto LABEL_6;
  }
LABEL_4:
  [v5 appendString:@"UPDATE SET "];
LABEL_9:
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x2020000000;
  uint64_t v29 = 0;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  v12 = [*(id *)(a1 + 16) allKeys];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v23;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v23 != v14) {
          objc_enumerationMutation(v12);
        }
        uint64_t v16 = *(void *)(*((void *)&v22 + 1) + 8 * v15);
        if (v27[3] >= 1) {
          [v5 appendString:@", "];
        }
        [v5 appendFormat:@"%@ = :update_%@", v16, v16];
        ++v27[3];
        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [v12 countByEnumeratingWithState:&v22 objects:v30 count:16];
    }
    while (v13);
  }

  id v17 = *(id *)(a1 + 24);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __59__EFSQLUpdateStatement__renderSQLExpressionForUpsert_into___block_invoke;
  v19[3] = &unk_1E6123628;
  v21 = &v26;
  id v18 = v5;
  id v20 = v18;
  [v17 enumerateKeysAndObjectsUsingBlock:v19];

  if (*(void *)(a1 + 8))
  {
    [v18 appendString:@" WHERE "];
    objc_msgSend(*(id *)(a1 + 8), "ef_renderSQLExpressionInto:", v18);
  }

  _Block_object_dispose(&v26, 8);
LABEL_21:
}

- (void)setWhereClause:(id)a3
{
}

void __65__EFSQLUpdateStatement_enumerateBindingNamesAndValuesUsingBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  id v5 = [@":update_" stringByAppendingString:a2];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_table, 0);
  objc_storeStrong((id *)&self->_expressables, 0);
  objc_storeStrong((id *)&self->_bindables, 0);
  objc_storeStrong((id *)&self->_whereClause, 0);
}

- (EFSQLUpdateStatement)initWithTable:(id)a3 conflictResolution:(unint64_t)a4
{
  id v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)EFSQLUpdateStatement;
  uint64_t v7 = [(EFSQLUpdateStatement *)&v15 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    table = v7->_table;
    v7->_table = (NSString *)v8;

    uint64_t v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    bindables = v7->_bindables;
    v7->_bindables = v10;

    v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    expressables = v7->_expressables;
    v7->_expressables = v12;

    v7->_conflictResolution = a4;
  }

  return v7;
}

- (void)setObject:(id)a3 forKeyedSubscript:(id)a4
{
  id v15 = a3;
  id v7 = a4;
  int v8 = objc_opt_respondsToSelector();
  int v9 = objc_opt_respondsToSelector();
  char v10 = v9;
  if ((v8 | v9))
  {
    if (v7) {
      goto LABEL_3;
    }
  }
  else
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"EFSQLUpdateStatement.m", 48, @"Invalid parameter not satisfying: %@", @"isBindable || isExpressable" object file lineNumber description];

    if (v7)
    {
LABEL_3:
      if (v8) {
        goto LABEL_4;
      }
      goto LABEL_8;
    }
  }
  uint64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
  [v13 handleFailureInMethod:a2, self, @"EFSQLUpdateStatement.m", 49, @"Invalid parameter not satisfying: %@", @"columnName != nil" object file lineNumber description];

  if (v8)
  {
LABEL_4:
    if (self) {
      bindables = self->_bindables;
    }
    else {
      bindables = 0;
    }
    goto LABEL_13;
  }
LABEL_8:
  if ((v10 & 1) == 0) {
    goto LABEL_14;
  }
  if (self) {
    uint64_t v14 = self->_bindables;
  }
  else {
    uint64_t v14 = 0;
  }
  [(NSMutableDictionary *)v14 setObject:0 forKeyedSubscript:v7];
  if (self) {
    bindables = self->_expressables;
  }
  else {
    bindables = 0;
  }
LABEL_13:
  [(NSMutableDictionary *)bindables setObject:v15 forKeyedSubscript:v7];
LABEL_14:
}

void __59__EFSQLUpdateStatement__renderSQLExpressionForUpsert_into___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  if (*(uint64_t *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) >= 1) {
    [*(id *)(a1 + 32) appendString:@", "];
  }
  [*(id *)(a1 + 32) appendFormat:@"%@ = ", v7];
  id v6 = objc_msgSend(v5, "ef_SQLIsolatedExpression");
  objc_msgSend(v6, "ef_renderSQLExpressionInto:", *(void *)(a1 + 32));

  ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
}

- (EFSQLUpdateStatement)initWithTable:(id)a3
{
  return [(EFSQLUpdateStatement *)self initWithTable:a3 conflictResolution:0];
}

- (id)objectForKeyedSubscript:(id)a3
{
  id v4 = a3;
  if (self) {
    bindables = self->_bindables;
  }
  else {
    bindables = 0;
  }
  id v6 = bindables;
  id v7 = [(NSMutableDictionary *)v6 objectForKeyedSubscript:v4];
  int v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    if (self) {
      expressables = self->_expressables;
    }
    else {
      expressables = 0;
    }
    id v9 = [(NSMutableDictionary *)expressables objectForKeyedSubscript:v4];
  }
  v11 = v9;

  return v11;
}

- (EFSQLValueExpressable)whereClause
{
  return self->_whereClause;
}

- (void)renderStatementForUpsertInto:(uint64_t)a1
{
  id v3 = a2;
  if (a1) {
    -[EFSQLUpdateStatement _renderSQLExpressionForUpsert:into:](a1, 1, v3);
  }
}

@end