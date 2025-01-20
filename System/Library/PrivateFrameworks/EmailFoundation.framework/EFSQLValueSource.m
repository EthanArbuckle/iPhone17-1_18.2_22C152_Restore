@interface EFSQLValueSource
- (EFSQLValueExpressable)selectResultExpression;
- (EFSQLValueSource)initWithTableName:(id)a3 selectResultAlias:(id)a4;
- (NSString)selectResultAlias;
- (NSString)tableName;
- (id)comparisonExpressionForValue:(id)a3 predicateOperator:(unint64_t)a4;
@end

@implementation EFSQLValueSource

- (NSString)selectResultAlias
{
  return self->_selectResultAlias;
}

- (NSString)tableName
{
  return self->_tableName;
}

- (EFSQLValueSource)initWithTableName:(id)a3 selectResultAlias:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)EFSQLValueSource;
  v10 = [(EFSQLValueSource *)&v13 init];
  if (v10)
  {
    if (!v8)
    {
      v12 = [MEMORY[0x1E4F28B00] currentHandler];
      [v12 handleFailureInMethod:a2, v10, @"EFSQLObjectPropertyMapper.m", 30, @"Invalid parameter not satisfying: %@", @"tableName" object file lineNumber description];
    }
    objc_storeStrong((id *)&v10->_tableName, a3);
    objc_storeStrong((id *)&v10->_selectResultAlias, a4);
  }

  return v10;
}

- (EFSQLValueExpressable)selectResultExpression
{
}

- (id)comparisonExpressionForValue:(id)a3 predicateOperator:(unint64_t)a4
{
  id v6 = a3;
  [(EFSQLValueSource *)self doesNotRecognizeSelector:a2];
  __assert_rtn("-[EFSQLValueSource comparisonExpressionForValue:predicateOperator:]", "EFSQLObjectPropertyMapper.m", 42, "0");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectResultAlias, 0);
  objc_storeStrong((id *)&self->_tableName, 0);
}

@end