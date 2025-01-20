@interface EFSQLSelectStatement
- (BOOL)distinct;
- (EFSQLSelectStatement)init;
- (EFSQLSelectStatement)initWithResult:(id)a3;
- (EFSQLSelectStatement)initWithResult:(id)a3 table:(id)a4;
- (EFSQLSelectStatement)initWithResultColumn:(id)a3;
- (EFSQLSelectStatement)initWithResultColumn:(id)a3 table:(id)a4;
- (EFSQLSelectStatement)initWithTable:(id)a3;
- (EFSQLValueExpressable)where;
- (NSArray)groupExpressions;
- (NSMutableArray)joinExpressions;
- (NSMutableArray)orderExpressions;
- (NSMutableArray)results;
- (NSString)queryString;
- (NSString)tableName;
- (id)ef_SQLIsolatedExpression;
- (id)join:(id)a3 alias:(id)a4 on:(id)a5;
- (id)join:(id)a3 alias:(id)a4 sourceColumn:(id)a5 targetColumn:(id)a6;
- (id)join:(id)a3 on:(id)a4;
- (id)join:(id)a3 sourceColumn:(id)a4 targetColumn:(id)a5;
- (id)leftOuterJoin:(id)a3 alias:(id)a4 on:(id)a5;
- (id)leftOuterJoin:(id)a3 alias:(id)a4 sourceColumn:(id)a5 targetColumn:(id)a6;
- (id)leftOuterJoin:(id)a3 on:(id)a4;
- (id)leftOuterJoin:(id)a3 sourceColumn:(id)a4 targetColumn:(id)a5;
- (unint64_t)limit;
- (void)addResult:(id)a3 alias:(id)a4;
- (void)addResultColumn:(id)a3;
- (void)addResultColumn:(id)a3 alias:(id)a4;
- (void)addResultColumn:(id)a3 fromTable:(id)a4;
- (void)addResultColumn:(id)a3 fromTable:(id)a4 alias:(id)a5;
- (void)ef_renderSQLExpressionInto:(id)a3;
- (void)groupByColumn:(id)a3;
- (void)groupByColumn:(id)a3 fromTable:(id)a4;
- (void)orderBy:(id)a3 ascending:(BOOL)a4;
- (void)orderByColumn:(id)a3 ascending:(BOOL)a4;
- (void)orderByColumn:(id)a3 fromTable:(id)a4 ascending:(BOOL)a5;
- (void)setDistinct:(BOOL)a3;
- (void)setGroupExpressions:(id)a3;
- (void)setLimit:(unint64_t)a3;
- (void)setWhere:(id)a3;
@end

@implementation EFSQLSelectStatement

- (void)addResultColumn:(id)a3
{
  id v5 = a3;
  v4 = [(EFSQLSelectStatement *)self tableName];
  [(EFSQLSelectStatement *)self addResultColumn:v5 fromTable:v4];
}

- (NSString)tableName
{
  return self->_tableName;
}

- (void)addResultColumn:(id)a3 fromTable:(id)a4 alias:(id)a5
{
  id v9 = a5;
  v8 = +[EFSQLColumnExpression table:a4 column:a3];
  [(EFSQLSelectStatement *)self addResult:v8 alias:v9];
}

- (void)addResult:(id)a3 alias:(id)a4
{
  id v9 = (_EFSQLAliasedExpression *)a3;
  id v6 = a4;
  if (v6)
  {
    v7 = [[_EFSQLAliasedExpression alloc] initWithExpression:v9 alias:v6];

    id v9 = v7;
  }
  v8 = [(EFSQLSelectStatement *)self results];
  [v8 addObject:v9];
}

- (NSMutableArray)results
{
  return self->_results;
}

- (void)addResultColumn:(id)a3 fromTable:(id)a4
{
}

- (void)ef_renderSQLExpressionInto:(id)a3
{
  id v4 = a3;
  [v4 appendString:@"SELECT "];
  if ([(NSMutableArray *)self->_results count])
  {
    if (self->_distinct) {
      [v4 appendString:@"DISTINCT "];
    }
    [(NSMutableArray *)self->_results ef_renderSQLExpressionInto:v4];
  }
  else
  {
    [v4 appendString:@"NULL"];
  }
  if (self->_tableName) {
    [v4 appendFormat:@" FROM %@", self->_tableName];
  }
  joinExpressions = self->_joinExpressions;
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  id v9 = __51__EFSQLSelectStatement_ef_renderSQLExpressionInto___block_invoke;
  v10 = &unk_1E6123520;
  id v6 = v4;
  id v11 = v6;
  [(NSMutableArray *)joinExpressions enumerateObjectsUsingBlock:&v7];
  if (self->_where)
  {
    [v6 appendString:@" WHERE "];
    [(EFSQLValueExpressable *)self->_where ef_renderSQLExpressionInto:v6];
  }
  if ([(NSArray *)self->_groupExpressions count])
  {
    [v6 appendString:@" GROUP BY "];
    [(NSArray *)self->_groupExpressions ef_renderSQLExpressionInto:v6];
  }
  if ([(NSMutableArray *)self->_orderExpressions count])
  {
    [v6 appendString:@" ORDER BY "];
    [(NSMutableArray *)self->_orderExpressions ef_renderSQLExpressionInto:v6];
  }
  if (self->_limit) {
    objc_msgSend(v6, "appendFormat:", @" LIMIT %llu", self->_limit, v7, v8, v9, v10);
  }
}

uint64_t __51__EFSQLSelectStatement_ef_renderSQLExpressionInto___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "ef_renderSQLExpressionInto:", *(void *)(a1 + 32));
}

- (void)setLimit:(unint64_t)a3
{
  self->_limit = a3;
}

- (EFSQLValueExpressable)where
{
  return self->_where;
}

- (void)orderByColumn:(id)a3 fromTable:(id)a4 ascending:(BOOL)a5
{
  id v6 = +[EFSQLColumnExpression table:a4 column:a3];
  -[EFSQLSelectStatement orderBy:ascending:](self, "orderBy:ascending:");
}

- (void)orderBy:(id)a3 ascending:(BOOL)a4
{
  BOOL v4 = a4;
  id v8 = a3;
  id v6 = [[EFSQLOrderExpression alloc] initWithExpression:v8 ascending:v4];
  uint64_t v7 = [(EFSQLSelectStatement *)self orderExpressions];
  [v7 addObject:v6];
}

- (NSMutableArray)orderExpressions
{
  return self->_orderExpressions;
}

- (NSString)queryString
{
  v3 = [MEMORY[0x1E4F28E78] string];
  [(EFSQLSelectStatement *)self ef_renderSQLExpressionInto:v3];
  return (NSString *)v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_orderExpressions, 0);
  objc_storeStrong((id *)&self->_groupExpressions, 0);
  objc_storeStrong((id *)&self->_joinExpressions, 0);
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_tableName, 0);
  objc_storeStrong((id *)&self->_where, 0);
}

- (void)setWhere:(id)a3
{
}

- (EFSQLSelectStatement)initWithResultColumn:(id)a3 table:(id)a4
{
  id v6 = a4;
  uint64_t v7 = +[EFSQLColumnExpression table:v6 column:a3];
  id v8 = [(EFSQLSelectStatement *)self initWithResult:v7 table:v6];

  return v8;
}

- (EFSQLSelectStatement)initWithResult:(id)a3 table:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(EFSQLSelectStatement *)self initWithTable:v7];
  id v9 = v8;
  if (v8) {
    [(NSMutableArray *)v8->_results addObject:v6];
  }

  return v9;
}

- (EFSQLSelectStatement)initWithTable:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)EFSQLSelectStatement;
  id v5 = [(EFSQLSelectStatement *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    tableName = v5->_tableName;
    v5->_tableName = (NSString *)v6;

    id v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    results = v5->_results;
    v5->_results = v8;

    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    joinExpressions = v5->_joinExpressions;
    v5->_joinExpressions = v10;

    v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    orderExpressions = v5->_orderExpressions;
    v5->_orderExpressions = v12;
  }
  return v5;
}

- (id)leftOuterJoin:(id)a3 sourceColumn:(id)a4 targetColumn:(id)a5
{
  id v5 = [(EFSQLSelectStatement *)self leftOuterJoin:a3 alias:0 sourceColumn:a4 targetColumn:a5];
  return v5;
}

- (id)leftOuterJoin:(id)a3 alias:(id)a4 sourceColumn:(id)a5 targetColumn:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = [(EFSQLSelectStatement *)self tableName];
  objc_super v15 = +[EFSQLColumnExpression table:v14 column:v12];

  if (v11) {
    id v16 = v11;
  }
  else {
    id v16 = v10;
  }
  v17 = +[EFSQLColumnExpression table:v16 column:v13];
  v18 = [v15 equalTo:v17];
  v19 = [(EFSQLSelectStatement *)self leftOuterJoin:v10 alias:v11 on:v18];

  return v19;
}

- (id)join:(id)a3 sourceColumn:(id)a4 targetColumn:(id)a5
{
  id v5 = [(EFSQLSelectStatement *)self join:a3 alias:0 sourceColumn:a4 targetColumn:a5];
  return v5;
}

- (id)join:(id)a3 alias:(id)a4 sourceColumn:(id)a5 targetColumn:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = [(EFSQLSelectStatement *)self tableName];
  objc_super v15 = +[EFSQLColumnExpression table:v14 column:v12];

  if (v11) {
    id v16 = v11;
  }
  else {
    id v16 = v10;
  }
  v17 = +[EFSQLColumnExpression table:v16 column:v13];
  v18 = [v15 equalTo:v17];
  v19 = [(EFSQLSelectStatement *)self join:v10 alias:v11 on:v18];

  return v19;
}

- (id)join:(id)a3 alias:(id)a4 on:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = [(EFSQLSelectStatement *)self tableName];

  if (!v12)
  {
    id v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2 object:self file:@"EFSQLSelectStatement.m" lineNumber:115 description:@"Can't JOIN on a SELECT without a base table"];
  }
  id v13 = [[_EFSQLJoinExpression alloc] initWithSelect:self tableName:v9 tableAlias:v10 joinConstraint:v11 isLeftOuter:0];
  v14 = [(EFSQLSelectStatement *)self joinExpressions];
  [v14 addObject:v13];

  return v13;
}

- (id)leftOuterJoin:(id)a3 alias:(id)a4 on:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = [(EFSQLSelectStatement *)self tableName];

  if (!v12)
  {
    id v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2 object:self file:@"EFSQLSelectStatement.m" lineNumber:122 description:@"Can't JOIN on a SELECT without a base table"];
  }
  id v13 = [[_EFSQLJoinExpression alloc] initWithSelect:self tableName:v9 tableAlias:v10 joinConstraint:v11 isLeftOuter:1];
  v14 = [(EFSQLSelectStatement *)self joinExpressions];
  [v14 addObject:v13];

  return v13;
}

- (NSMutableArray)joinExpressions
{
  return self->_joinExpressions;
}

- (EFSQLSelectStatement)init
{
  return [(EFSQLSelectStatement *)self initWithTable:0];
}

- (EFSQLSelectStatement)initWithResult:(id)a3
{
  return [(EFSQLSelectStatement *)self initWithResult:a3 table:0];
}

- (EFSQLSelectStatement)initWithResultColumn:(id)a3
{
  return [(EFSQLSelectStatement *)self initWithResultColumn:a3 table:0];
}

- (void)addResultColumn:(id)a3 alias:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  id v7 = [(EFSQLSelectStatement *)self tableName];
  [(EFSQLSelectStatement *)self addResultColumn:v8 fromTable:v7 alias:v6];
}

- (id)join:(id)a3 on:(id)a4
{
  id v4 = [(EFSQLSelectStatement *)self join:a3 alias:0 on:a4];
  return v4;
}

- (id)leftOuterJoin:(id)a3 on:(id)a4
{
  id v4 = [(EFSQLSelectStatement *)self leftOuterJoin:a3 alias:0 on:a4];
  return v4;
}

- (void)groupByColumn:(id)a3
{
  id v5 = a3;
  id v4 = [(EFSQLSelectStatement *)self tableName];
  [(EFSQLSelectStatement *)self groupByColumn:v5 fromTable:v4];
}

- (void)groupByColumn:(id)a3 fromTable:(id)a4
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = +[EFSQLColumnExpression table:v7 column:v6];
  v10[0] = v8;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  [(EFSQLSelectStatement *)self setGroupExpressions:v9];
}

- (void)orderByColumn:(id)a3 ascending:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  id v6 = [(EFSQLSelectStatement *)self tableName];
  [(EFSQLSelectStatement *)self orderByColumn:v7 fromTable:v6 ascending:v4];
}

- (id)ef_SQLIsolatedExpression
{
  return +[EFParenthesizedSQLExpression parenthesizedValueCollectionExpressable:self];
}

- (BOOL)distinct
{
  return self->_distinct;
}

- (void)setDistinct:(BOOL)a3
{
  self->_distinct = a3;
}

- (unint64_t)limit
{
  return self->_limit;
}

- (NSArray)groupExpressions
{
  return self->_groupExpressions;
}

- (void)setGroupExpressions:(id)a3
{
}

@end