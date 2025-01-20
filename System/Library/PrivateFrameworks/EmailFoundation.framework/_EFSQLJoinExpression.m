@interface _EFSQLJoinExpression
- (BOOL)isLeftOuter;
- (EFSQLExpressable)joinConstraint;
- (EFSQLSelectStatement)select;
- (NSString)ef_SQLExpression;
- (NSString)tableAlias;
- (NSString)tableName;
- (_EFSQLJoinExpression)initWithSelect:(id)a3 tableName:(id)a4 tableAlias:(id)a5 joinConstraint:(id)a6 isLeftOuter:(BOOL)a7;
- (id)join:(id)a3 alias:(id)a4 on:(id)a5;
- (id)join:(id)a3 alias:(id)a4 sourceColumn:(id)a5 targetColumn:(id)a6;
- (id)join:(id)a3 on:(id)a4;
- (id)join:(id)a3 sourceColumn:(id)a4 targetColumn:(id)a5;
- (id)leftOuterJoin:(id)a3 alias:(id)a4 on:(id)a5;
- (id)leftOuterJoin:(id)a3 alias:(id)a4 sourceColumn:(id)a5 targetColumn:(id)a6;
- (id)leftOuterJoin:(id)a3 on:(id)a4;
- (id)leftOuterJoin:(id)a3 sourceColumn:(id)a4 targetColumn:(id)a5;
- (void)addResultColumn:(id)a3;
- (void)addResultColumn:(id)a3 alias:(id)a4;
- (void)ef_renderSQLExpressionInto:(id)a3;
- (void)groupByColumn:(id)a3;
- (void)orderByColumn:(id)a3 ascending:(BOOL)a4;
@end

@implementation _EFSQLJoinExpression

- (void)addResultColumn:(id)a3
{
}

- (id)leftOuterJoin:(id)a3 alias:(id)a4 sourceColumn:(id)a5 targetColumn:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = [(_EFSQLJoinExpression *)self tableAlias];
  v15 = v14;
  if (!v14)
  {
    v15 = [(_EFSQLJoinExpression *)self tableName];
  }
  v16 = +[EFSQLColumnExpression table:v15 column:v12];
  if (!v14) {

  }
  if (v11) {
    id v17 = v11;
  }
  else {
    id v17 = v10;
  }
  v18 = +[EFSQLColumnExpression table:v17 column:v13];
  v19 = [v16 equalTo:v18];
  v20 = [(_EFSQLJoinExpression *)self leftOuterJoin:v10 alias:v11 on:v19];

  return v20;
}

- (void)addResultColumn:(id)a3 alias:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  v7 = [(_EFSQLJoinExpression *)self select];
  v8 = [(_EFSQLJoinExpression *)self tableAlias];
  v9 = v8;
  if (!v8)
  {
    v9 = [(_EFSQLJoinExpression *)self tableName];
  }
  [v7 addResultColumn:v10 fromTable:v9 alias:v6];
  if (!v8) {
}
  }

- (NSString)tableAlias
{
  return self->_tableAlias;
}

- (EFSQLSelectStatement)select
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_select);
  return (EFSQLSelectStatement *)WeakRetained;
}

- (NSString)tableName
{
  return self->_tableName;
}

- (void)ef_renderSQLExpressionInto:(id)a3
{
  id v4 = a3;
  if (self->_isLeftOuter) {
    v5 = @" LEFT OUTER JOIN ";
  }
  else {
    v5 = @" JOIN ";
  }
  id v6 = v4;
  [v4 appendString:v5];
  [v6 appendString:self->_tableName];
  if (self->_tableAlias) {
    [v6 appendFormat:@" AS %@", self->_tableAlias];
  }
  [v6 appendString:@" ON "];
  [(EFSQLExpressable *)self->_joinConstraint ef_renderSQLExpressionInto:v6];
}

- (id)leftOuterJoin:(id)a3 alias:(id)a4 on:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(_EFSQLJoinExpression *)self select];
  id v12 = [v11 leftOuterJoin:v8 alias:v9 on:v10];

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_joinConstraint, 0);
  objc_storeStrong((id *)&self->_tableAlias, 0);
  objc_storeStrong((id *)&self->_tableName, 0);
  objc_destroyWeak((id *)&self->_select);
}

- (void)orderByColumn:(id)a3 ascending:(BOOL)a4
{
  BOOL v4 = a4;
  id v9 = a3;
  id v6 = [(_EFSQLJoinExpression *)self select];
  v7 = [(_EFSQLJoinExpression *)self tableAlias];
  id v8 = v7;
  if (!v7)
  {
    id v8 = [(_EFSQLJoinExpression *)self tableName];
  }
  [v6 orderByColumn:v9 fromTable:v8 ascending:v4];
  if (!v7) {
}
  }

- (id)leftOuterJoin:(id)a3 sourceColumn:(id)a4 targetColumn:(id)a5
{
  v5 = [(_EFSQLJoinExpression *)self leftOuterJoin:a3 alias:0 sourceColumn:a4 targetColumn:a5];
  return v5;
}

- (_EFSQLJoinExpression)initWithSelect:(id)a3 tableName:(id)a4 tableAlias:(id)a5 joinConstraint:(id)a6 isLeftOuter:(BOOL)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v23.receiver = self;
  v23.super_class = (Class)_EFSQLJoinExpression;
  v16 = [(_EFSQLJoinExpression *)&v23 init];
  id v17 = v16;
  if (v16)
  {
    objc_storeWeak((id *)&v16->_select, v12);
    uint64_t v18 = [v13 copy];
    tableName = v17->_tableName;
    v17->_tableName = (NSString *)v18;

    uint64_t v20 = [v14 copy];
    tableAlias = v17->_tableAlias;
    v17->_tableAlias = (NSString *)v20;

    objc_storeStrong((id *)&v17->_joinConstraint, a6);
    v17->_isLeftOuter = a7;
  }

  return v17;
}

- (NSString)ef_SQLExpression
{
  v3 = [MEMORY[0x1E4F28E78] string];
  [(_EFSQLJoinExpression *)self ef_renderSQLExpressionInto:v3];
  return (NSString *)v3;
}

- (id)join:(id)a3 on:(id)a4
{
  BOOL v4 = [(_EFSQLJoinExpression *)self join:a3 alias:0 on:a4];
  return v4;
}

- (id)leftOuterJoin:(id)a3 on:(id)a4
{
  BOOL v4 = [(_EFSQLJoinExpression *)self leftOuterJoin:a3 alias:0 on:a4];
  return v4;
}

- (id)join:(id)a3 alias:(id)a4 on:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(_EFSQLJoinExpression *)self select];
  id v12 = [v11 join:v8 alias:v9 on:v10];

  return v12;
}

- (id)join:(id)a3 sourceColumn:(id)a4 targetColumn:(id)a5
{
  v5 = [(_EFSQLJoinExpression *)self join:a3 alias:0 sourceColumn:a4 targetColumn:a5];
  return v5;
}

- (id)join:(id)a3 alias:(id)a4 sourceColumn:(id)a5 targetColumn:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [(_EFSQLJoinExpression *)self tableAlias];
  id v15 = v14;
  if (!v14)
  {
    id v15 = [(_EFSQLJoinExpression *)self tableName];
  }
  v16 = +[EFSQLColumnExpression table:v15 column:v12];
  if (!v14) {

  }
  if (v11) {
    id v17 = v11;
  }
  else {
    id v17 = v10;
  }
  uint64_t v18 = +[EFSQLColumnExpression table:v17 column:v13];
  v19 = [v16 equalTo:v18];
  uint64_t v20 = [(_EFSQLJoinExpression *)self join:v10 alias:v11 on:v19];

  return v20;
}

- (void)groupByColumn:(id)a3
{
  id v7 = a3;
  BOOL v4 = [(_EFSQLJoinExpression *)self select];
  v5 = [(_EFSQLJoinExpression *)self tableAlias];
  id v6 = v5;
  if (!v5)
  {
    id v6 = [(_EFSQLJoinExpression *)self tableName];
  }
  [v4 groupByColumn:v7 fromTable:v6];
  if (!v5) {
}
  }

- (EFSQLExpressable)joinConstraint
{
  return self->_joinConstraint;
}

- (BOOL)isLeftOuter
{
  return self->_isLeftOuter;
}

@end