@interface EFSQLCaseExpression
- (EFSQLCaseExpression)init;
- (EFSQLCaseExpression)initWithBaseExpression:(id)a3;
- (EFSQLValueExpressable)baseExpression;
- (EFSQLValueExpressable)elseExpression;
- (NSMapTable)whenExpressions;
- (NSString)ef_SQLExpression;
- (id)objectForKeyedSubscript:(id)a3;
- (void)ef_renderSQLExpressionInto:(id)a3;
- (void)setElseExpression:(id)a3;
- (void)setObject:(id)a3 forKeyedSubscript:(id)a4;
@end

@implementation EFSQLCaseExpression

- (EFSQLCaseExpression)init
{
  return [(EFSQLCaseExpression *)self initWithBaseExpression:0];
}

- (EFSQLCaseExpression)initWithBaseExpression:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)EFSQLCaseExpression;
  v6 = [(EFSQLCaseExpression *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_baseExpression, a3);
    uint64_t v8 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    whenExpressions = v7->_whenExpressions;
    v7->_whenExpressions = (NSMapTable *)v8;
  }
  return v7;
}

- (id)objectForKeyedSubscript:(id)a3
{
  v3 = [(NSMapTable *)self->_whenExpressions objectForKey:a3];
  return v3;
}

- (void)setObject:(id)a3 forKeyedSubscript:(id)a4
{
}

- (NSString)ef_SQLExpression
{
  v3 = [MEMORY[0x1E4F28E78] string];
  [(EFSQLCaseExpression *)self ef_renderSQLExpressionInto:v3];
  return (NSString *)v3;
}

- (void)ef_renderSQLExpressionInto:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 appendString:@"CASE"];
  v16 = [(EFSQLCaseExpression *)self baseExpression];
  if (v16)
  {
    [v4 appendString:@" "];
    id v5 = objc_msgSend(v16, "ef_SQLIsolatedExpression");
    objc_msgSend(v5, "ef_renderSQLExpressionInto:", v4);
  }
  [(EFSQLCaseExpression *)self whenExpressions];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v6);
        }
        v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        objc_super v11 = [v6 objectForKey:v10];
        [v4 appendString:@" WHEN "];
        v12 = objc_msgSend(v10, "ef_SQLIsolatedExpression");
        objc_msgSend(v12, "ef_renderSQLExpressionInto:", v4);

        [v4 appendString:@" THEN "];
        v13 = objc_msgSend(v11, "ef_SQLIsolatedExpression");
        objc_msgSend(v13, "ef_renderSQLExpressionInto:", v4);
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v7);
  }

  v14 = [(EFSQLCaseExpression *)self elseExpression];
  if (v14)
  {
    [v4 appendString:@" ELSE "];
    v15 = objc_msgSend(v14, "ef_SQLIsolatedExpression");
    objc_msgSend(v15, "ef_renderSQLExpressionInto:", v4);
  }
  [v4 appendString:@" END"];
}

- (EFSQLValueExpressable)elseExpression
{
  return self->_elseExpression;
}

- (void)setElseExpression:(id)a3
{
}

- (EFSQLValueExpressable)baseExpression
{
  return self->_baseExpression;
}

- (NSMapTable)whenExpressions
{
  return self->_whenExpressions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_whenExpressions, 0);
  objc_storeStrong((id *)&self->_baseExpression, 0);
  objc_storeStrong((id *)&self->_elseExpression, 0);
}

@end