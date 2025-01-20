@interface EFSQLInsertStatement
- (BOOL)isEmpty;
- (EFSQLInsertStatement)initWithTable:(id)a3;
- (EFSQLInsertStatement)initWithTable:(id)a3 conflictResolution:(unint64_t)a4;
- (NSString)queryString;
- (id)addValue;
- (id)objectForKeyedSubscript:(id)a3;
- (void)_renderQueryStringForNamedBindings:(void *)a3 into:;
- (void)_renderValuesForNamedBindings:(void *)a3 intoString:;
- (void)enumerateBindingIndicesAndValuesUsingBlock:(id)a3;
- (void)enumerateBindingNamesAndValuesUsingBlock:(id)a3;
- (void)renderStatementWithNamedBindingsInto:(id)a3;
- (void)setObject:(id)a3 forKeyedSubscript:(id)a4;
@end

@implementation EFSQLInsertStatement

- (EFSQLInsertStatement)initWithTable:(id)a3
{
  return [(EFSQLInsertStatement *)self initWithTable:a3 conflictResolution:0];
}

- (EFSQLInsertStatement)initWithTable:(id)a3 conflictResolution:(unint64_t)a4
{
  id v6 = a3;
  v17.receiver = self;
  v17.super_class = (Class)EFSQLInsertStatement;
  v7 = [(EFSQLInsertStatement *)&v17 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    table = v7->_table;
    v7->_table = (NSString *)v8;

    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    values = v7->_values;
    v7->_values = v10;

    v12 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E4F1CA70]);
    requiredColumns = v7->_requiredColumns;
    v7->_requiredColumns = v12;

    v14 = v7->_values;
    v15 = -[_EFSQLInsertStatementValue initWithRequiredColumns:]([_EFSQLInsertStatementFirstValue alloc], v7->_requiredColumns);
    [(NSMutableArray *)v14 addObject:v15];

    v7->_conflictResolution = a4;
  }

  return v7;
}

- (id)objectForKeyedSubscript:(id)a3
{
  id v5 = a3;
  if (self) {
    values = self->_values;
  }
  else {
    values = 0;
  }
  if ([(NSMutableArray *)values count] == 1)
  {
    if (self)
    {
LABEL_5:
      v7 = self->_values;
      goto LABEL_6;
    }
  }
  else
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"EFSQLInsertStatement.m" lineNumber:133 description:@"Direct statement access only works with a single value"];

    if (self) {
      goto LABEL_5;
    }
  }
  v7 = 0;
LABEL_6:
  uint64_t v8 = [(NSMutableArray *)v7 firstObject];
  v9 = [v8 objectForKeyedSubscript:v5];

  return v9;
}

- (void)setObject:(id)a3 forKeyedSubscript:(id)a4
{
  id v12 = a3;
  id v7 = a4;
  if (self) {
    values = self->_values;
  }
  else {
    values = 0;
  }
  if ([(NSMutableArray *)values count] == 1)
  {
    if (self)
    {
LABEL_5:
      v9 = self->_values;
      goto LABEL_6;
    }
  }
  else
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"EFSQLInsertStatement.m" lineNumber:138 description:@"Direct statement access only works with a single value"];

    if (self) {
      goto LABEL_5;
    }
  }
  v9 = 0;
LABEL_6:
  v10 = [(NSMutableArray *)v9 firstObject];
  [v10 setObject:v12 forKeyedSubscript:v7];
}

- (BOOL)isEmpty
{
  if (self) {
    values = self->_values;
  }
  else {
    values = 0;
  }
  v4 = values;
  if ([(NSMutableArray *)v4 count] == 1)
  {
    if (self) {
      requiredColumns = self->_requiredColumns;
    }
    else {
      requiredColumns = 0;
    }
    BOOL v6 = [(NSMutableOrderedSet *)requiredColumns count] == 0;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (NSString)queryString
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  -[EFSQLInsertStatement _renderQueryStringForNamedBindings:into:]((uint64_t)self, 0, v3);
  return (NSString *)v3;
}

- (void)_renderQueryStringForNamedBindings:(void *)a3 into:
{
  id v5 = a3;
  if (a1)
  {
    id v6 = *(id *)(a1 + 24);
    uint64_t v7 = [v6 lastObject];
    uint64_t v8 = (void *)v7;
    if (v7) {
      v9 = *(void **)(v7 + 16);
    }
    else {
      v9 = 0;
    }
    id v10 = v9;
    uint64_t v11 = [v10 count];
    id v12 = *(id *)(a1 + 24);
    uint64_t v13 = [v12 lastObject];
    v14 = (void *)v13;
    if (v13) {
      v15 = *(void **)(v13 + 24);
    }
    else {
      v15 = 0;
    }
    uint64_t v16 = [v15 count];

    if (!(v11 + v16))
    {
      v21 = [MEMORY[0x1E4F28B00] currentHandler];
      [v21 handleFailureInMethod:sel__renderQueryStringForNamedBindings_into_ object:a1 file:@"EFSQLInsertStatement.m" lineNumber:157 description:@"Last value contains no data"];
    }
    [v5 appendString:@"INSERT"];
    uint64_t v17 = *(void *)(a1 + 16);
    if (v17)
    {
      [v5 appendString:@" OR "];
      v18 = EFSQLStringForConflictResolution(v17);
      [v5 appendString:v18];
    }
    [v5 appendString:@" INTO "];
    [v5 appendString:*(void *)(a1 + 8)];
    objc_msgSend(v5, "appendString:", @" (");
    id v19 = *(id *)(a1 + 32);
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __64__EFSQLInsertStatement__renderQueryStringForNamedBindings_into___block_invoke;
    v22[3] = &unk_1E6123230;
    id v20 = v5;
    id v23 = v20;
    [v19 enumerateObjectsUsingBlock:v22];

    [v20 appendString:@" VALUES "]);
    -[EFSQLInsertStatement _renderValuesForNamedBindings:intoString:](a1, a2, v20);
  }
}

- (void)renderStatementWithNamedBindingsInto:(id)a3
{
}

void __64__EFSQLInsertStatement__renderQueryStringForNamedBindings_into___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (a3) {
    [*(id *)(a1 + 32) appendString:@", "];
  }
  [*(id *)(a1 + 32) appendString:v5];
}

- (void)_renderValuesForNamedBindings:(void *)a3 intoString:
{
  id v5 = a3;
  if (a1)
  {
    id v6 = *(id *)(a1 + 32);
    id v7 = *(id *)(a1 + 24);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __65__EFSQLInsertStatement__renderValuesForNamedBindings_intoString___block_invoke;
    v9[3] = &unk_1E6123280;
    id v10 = v5;
    id v11 = v6;
    char v12 = a2;
    id v8 = v6;
    [v7 enumerateObjectsUsingBlock:v9];
  }
}

void __65__EFSQLInsertStatement__renderValuesForNamedBindings_intoString___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (a3) {
    id v6 = CFSTR(", (");
  }
  else {
    id v6 = CFSTR("(");
  }
  [*(id *)(a1 + 32) appendString:v6];
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  id v11 = __65__EFSQLInsertStatement__renderValuesForNamedBindings_intoString___block_invoke_2;
  char v12 = &unk_1E6123258;
  id v7 = *(void **)(a1 + 40);
  id v13 = *(id *)(a1 + 32);
  id v8 = v5;
  char v16 = *(unsigned char *)(a1 + 48);
  id v14 = v8;
  uint64_t v15 = a3;
  [v7 enumerateObjectsUsingBlock:&v9];
  [*(id *)(a1 + 32) appendString:@""], v9, v10, v11, v12);
}

void __65__EFSQLInsertStatement__renderValuesForNamedBindings_intoString___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v8 = a2;
  if (a3) {
    [*(id *)(a1 + 32) appendString:@", "];
  }
  id v5 = [*(id *)(a1 + 40) objectForKeyedSubscript:v8];
  if (objc_opt_respondsToSelector())
  {
    id v6 = *(void **)(a1 + 32);
    if (*(unsigned char *)(a1 + 56))
    {
      [v6 appendString:@":insert_"];
      [*(id *)(a1 + 32) appendString:v8];
      if (*(void *)(a1 + 48)) {
        objc_msgSend(*(id *)(a1 + 32), "appendFormat:", @"_%lu", *(void *)(a1 + 48));
      }
    }
    else
    {
      [v6 appendString:@"?"];
    }
  }
  else if (objc_opt_respondsToSelector())
  {
    id v7 = objc_msgSend(v5, "ef_SQLIsolatedExpression");
    objc_msgSend(v7, "ef_renderSQLExpressionInto:", *(void *)(a1 + 32));
  }
}

- (void)enumerateBindingIndicesAndValuesUsingBlock:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  v4 = (void (**)(id, uint64_t, void *, char *))a3;
  char v31 = 0;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  if (self) {
    values = self->_values;
  }
  else {
    values = 0;
  }
  id v6 = values;
  v21 = v6;
  uint64_t v20 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v27 objects:v33 count:16];
  if (v20)
  {
    uint64_t v7 = 0;
    uint64_t v8 = *(void *)v28;
    uint64_t v18 = *(void *)v28;
    id v19 = self;
    do
    {
      uint64_t v22 = 0;
      do
      {
        if (*(void *)v28 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v9 = *(void **)(*((void *)&v27 + 1) + 8 * v22);
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        if (self) {
          requiredColumns = self->_requiredColumns;
        }
        else {
          requiredColumns = 0;
        }
        id v11 = requiredColumns;
        uint64_t v12 = [(NSMutableOrderedSet *)v11 countByEnumeratingWithState:&v23 objects:v32 count:16];
        if (v12)
        {
          uint64_t v13 = *(void *)v24;
          while (2)
          {
            for (uint64_t i = 0; i != v12; ++i)
            {
              if (*(void *)v24 != v13) {
                objc_enumerationMutation(v11);
              }
              uint64_t v15 = objc_msgSend(v9, "objectForKeyedSubscript:", *(void *)(*((void *)&v23 + 1) + 8 * i), v18, v19);
              if (objc_opt_respondsToSelector())
              {
                v4[2](v4, v7, v15, &v31);
                BOOL v16 = v31 == 0;

                if (!v16)
                {

                  id v6 = v21;
                  goto LABEL_27;
                }
                ++v7;
              }
              else
              {
              }
            }
            uint64_t v12 = [(NSMutableOrderedSet *)v11 countByEnumeratingWithState:&v23 objects:v32 count:16];
            if (v12) {
              continue;
            }
            break;
          }
        }

        id v6 = v21;
        self = v19;
        ++v22;
        uint64_t v8 = v18;
      }
      while (v22 != v20);
      uint64_t v17 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v27 objects:v33 count:16];
      uint64_t v20 = v17;
    }
    while (v17);
  }
LABEL_27:
}

- (void)enumerateBindingNamesAndValuesUsingBlock:(id)a3
{
  id v4 = a3;
  if (self) {
    values = self->_values;
  }
  else {
    values = 0;
  }
  id v6 = values;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __65__EFSQLInsertStatement_enumerateBindingNamesAndValuesUsingBlock___block_invoke;
  v8[3] = &unk_1E61232A8;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [(NSMutableArray *)v6 enumerateObjectsUsingBlock:v8];
}

void __65__EFSQLInsertStatement_enumerateBindingNamesAndValuesUsingBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v17 = a1;
  uint64_t v8 = *(void **)(a1 + 32);
  if (v8) {
    uint64_t v8 = (void *)v8[4];
  }
  obj = v8;
  uint64_t v9 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v20;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v13 = [v7 objectForKeyedSubscript:v12];
        if (objc_opt_respondsToSelector())
        {
          uint64_t v14 = a3
              ? [[NSString alloc] initWithFormat:@":insert_%@_%lu", v12, a3]
              : [[NSString alloc] initWithFormat:@":insert_%@", v12];
          uint64_t v15 = (void *)v14;
          (*(void (**)(void))(*(void *)(v17 + 40) + 16))();
          BOOL v16 = *a4 == 0;

          if (!v16)
          {

            goto LABEL_17;
          }
        }
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
LABEL_17:
}

- (id)addValue
{
  v2 = self;
  if (self) {
    self = (EFSQLInsertStatement *)self->_values;
  }
  if ([(EFSQLInsertStatement *)self count] != 1)
  {
    if (v2) {
      values = v2->_values;
    }
    else {
      values = 0;
    }
    id v7 = [(NSMutableArray *)values lastObject];
    id v5 = v7;
    if (v7) {
      id v7 = (void *)v7[2];
    }
    if (![v7 count])
    {
      [NSString stringWithFormat:@"No columns were defined for the previous value"];
      id v12 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:objc_claimAutoreleasedReturnValue() userInfo:0];
      objc_exception_throw(v12);
    }
    goto LABEL_15;
  }
  if (v2) {
    id v3 = v2->_values;
  }
  else {
    id v3 = 0;
  }
  id v4 = [(NSMutableArray *)v3 firstObject];
  id v5 = v4;
  if (v4) {
    id v4 = (void *)v4[2];
  }
  if ([v4 count])
  {
LABEL_15:

    uint64_t v8 = [_EFSQLInsertStatementFollowUpValue alloc];
    if (v2) {
      requiredColumns = v2->_requiredColumns;
    }
    else {
      requiredColumns = 0;
    }
    id v5 = -[_EFSQLInsertStatementValue initWithRequiredColumns:](v8, requiredColumns);
    if (v2) {
      uint64_t v10 = v2->_values;
    }
    else {
      uint64_t v10 = 0;
    }
    [(NSMutableArray *)v10 addObject:v5];
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requiredColumns, 0);
  objc_storeStrong((id *)&self->_values, 0);
  objc_storeStrong((id *)&self->_table, 0);
}

@end