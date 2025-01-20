@interface EFSQLColumnValueSource
- (EFSQLColumnValueSource)initWithColumn:(id)a3;
- (EFSQLColumnValueSource)initWithColumn:(id)a3 columnAlias:(id)a4;
- (EFSQLColumnValueSource)initWithColumn:(id)a3 sourceTableAlias:(id)a4 columnAlias:(id)a5;
- (id)comparisonExpressionForValue:(id)a3 predicateOperator:(unint64_t)a4;
- (id)selectResultExpression;
@end

@implementation EFSQLColumnValueSource

- (id)selectResultExpression
{
  return self->_columnExpression;
}

- (id)comparisonExpressionForValue:(id)a3 predicateOperator:(unint64_t)a4
{
  v4 = [(EFSQLColumnExpression *)self->_columnExpression expressionForPredicateOperatorType:a4 constantValue:a3];
  return v4;
}

- (EFSQLColumnValueSource)initWithColumn:(id)a3
{
  return [(EFSQLColumnValueSource *)self initWithColumn:a3 sourceTableAlias:0 columnAlias:0];
}

- (EFSQLColumnValueSource)initWithColumn:(id)a3 columnAlias:(id)a4
{
  return [(EFSQLColumnValueSource *)self initWithColumn:a3 sourceTableAlias:0 columnAlias:a4];
}

- (EFSQLColumnValueSource)initWithColumn:(id)a3 sourceTableAlias:(id)a4 columnAlias:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v9)
  {
    id v11 = v9;
  }
  else
  {
    v12 = [v8 table];
    id v11 = [v12 name];
  }
  v13 = [v8 table];
  v14 = [v13 name];
  v21.receiver = self;
  v21.super_class = (Class)EFSQLColumnValueSource;
  v15 = [(EFSQLValueSource *)&v21 initWithTableName:v14 selectResultAlias:v10];

  if (v15)
  {
    v16 = [EFSQLColumnExpression alloc];
    v17 = [v8 name];
    uint64_t v18 = [(EFSQLColumnExpression *)v16 initWithName:v17 table:v11];
    columnExpression = v15->_columnExpression;
    v15->_columnExpression = (EFSQLColumnExpression *)v18;

    objc_storeStrong((id *)&v15->_columnAlias, a5);
  }

  return v15;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_columnAlias, 0);
  objc_storeStrong((id *)&self->_columnExpression, 0);
}

@end