@interface EFSQLBlockValueSource
- (EFSQLBlockValueSource)initWithSourceTableName:(id)a3 creationBlock:(id)a4 selectResultExpression:(id)a5 selectResultAlias:(id)a6;
- (id)comparisonExpressionForValue:(id)a3 predicateOperator:(unint64_t)a4;
- (id)selectResultExpression;
@end

@implementation EFSQLBlockValueSource

- (id)selectResultExpression
{
  return self->_selectResultExpression;
}

- (EFSQLBlockValueSource)initWithSourceTableName:(id)a3 creationBlock:(id)a4 selectResultExpression:(id)a5 selectResultAlias:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v17.receiver = self;
  v17.super_class = (Class)EFSQLBlockValueSource;
  v13 = [(EFSQLValueSource *)&v17 initWithTableName:a3 selectResultAlias:v12];
  if (v13)
  {
    v14 = _Block_copy(v10);
    id creationBlock = v13->_creationBlock;
    v13->_id creationBlock = v14;

    objc_storeStrong((id *)&v13->_selectResultExpression, a5);
    objc_storeStrong((id *)&v13->_selectResultAlias, a6);
  }

  return v13;
}

- (id)comparisonExpressionForValue:(id)a3 predicateOperator:(unint64_t)a4
{
  v4 = (*((void (**)(void))self->_creationBlock + 2))();
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectResultAlias, 0);
  objc_storeStrong((id *)&self->_selectResultExpression, 0);
  objc_storeStrong(&self->_creationBlock, 0);
}

@end