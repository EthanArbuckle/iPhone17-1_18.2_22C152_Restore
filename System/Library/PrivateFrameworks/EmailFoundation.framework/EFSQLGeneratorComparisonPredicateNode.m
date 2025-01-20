@interface EFSQLGeneratorComparisonPredicateNode
- (EFSQLGeneratorComparisonPredicateNode)initWithValueSource:(id)a3 predicateOperator:(unint64_t)a4 comparisonSource:(id)a5;
- (EFSQLGeneratorComparisonPredicateNode)initWithValueSource:(id)a3 predicateOperator:(unint64_t)a4 constantValue:(id)a5;
- (EFSQLValueExpressable)constantValue;
- (EFSQLValueExpressable)sqlExpressable;
- (EFSQLValueSource)comparisonSource;
- (EFSQLValueSource)valueSource;
- (unint64_t)predicateOperator;
@end

@implementation EFSQLGeneratorComparisonPredicateNode

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_comparisonSource, 0);
  objc_storeStrong((id *)&self->_constantValue, 0);
  objc_storeStrong((id *)&self->_valueSource, 0);
}

- (EFSQLGeneratorComparisonPredicateNode)initWithValueSource:(id)a3 predicateOperator:(unint64_t)a4 constantValue:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)EFSQLGeneratorComparisonPredicateNode;
  v11 = [(EFSQLGeneratorComparisonPredicateNode *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_valueSource, a3);
    v12->_predicateOperator = a4;
    objc_storeStrong((id *)&v12->_constantValue, a5);
  }

  return v12;
}

- (EFSQLValueExpressable)sqlExpressable
{
  v4 = [(EFSQLGeneratorComparisonPredicateNode *)self constantValue];

  if (v4)
  {
    v5 = [(EFSQLGeneratorComparisonPredicateNode *)self valueSource];
    v6 = [(EFSQLGeneratorComparisonPredicateNode *)self constantValue];
    v7 = objc_msgSend(v5, "comparisonExpressionForValue:predicateOperator:", v6, -[EFSQLGeneratorComparisonPredicateNode predicateOperator](self, "predicateOperator"));
  }
  else
  {
    v8 = [(EFSQLGeneratorComparisonPredicateNode *)self comparisonSource];

    if (!v8)
    {
      v11 = [MEMORY[0x1E4F28B00] currentHandler];
      [v11 handleFailureInMethod:a2 object:self file:@"EFSQLGeneratorPredicateNode.m" lineNumber:100 description:@"Need something to compare to"];
    }
    v5 = [(EFSQLGeneratorComparisonPredicateNode *)self comparisonSource];
    v6 = [(EFSQLGeneratorComparisonPredicateNode *)self valueSource];
    id v9 = [v5 selectResultExpression];
    v7 = objc_msgSend(v6, "comparisonExpressionForValue:predicateOperator:", v9, -[EFSQLGeneratorComparisonPredicateNode predicateOperator](self, "predicateOperator"));
  }
  return (EFSQLValueExpressable *)v7;
}

- (EFSQLValueExpressable)constantValue
{
  return self->_constantValue;
}

- (EFSQLValueSource)valueSource
{
  return self->_valueSource;
}

- (unint64_t)predicateOperator
{
  return self->_predicateOperator;
}

- (EFSQLGeneratorComparisonPredicateNode)initWithValueSource:(id)a3 predicateOperator:(unint64_t)a4 comparisonSource:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)EFSQLGeneratorComparisonPredicateNode;
  v11 = [(EFSQLGeneratorComparisonPredicateNode *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_valueSource, a3);
    v12->_predicateOperator = a4;
    objc_storeStrong((id *)&v12->_comparisonSource, a5);
  }

  return v12;
}

- (EFSQLValueSource)comparisonSource
{
  return self->_comparisonSource;
}

@end