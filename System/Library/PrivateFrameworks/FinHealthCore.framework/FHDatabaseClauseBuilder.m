@interface FHDatabaseClauseBuilder
- (FHDatabaseClauseBuilder)init;
- (NSMutableArray)clauseStack;
- (void)addBetweenClauseWithFieldName:(id)a3 lowerBound:(unint64_t)a4 upperBound:(unint64_t)a5;
- (void)addDatabaseClause:(id)a3;
- (void)addDateClause:(id)a3 fieldName:(id)a4 expression:(id)a5;
- (void)addDecimalNumberClause:(id)a3 fieldName:(id)a4 expression:(id)a5;
- (void)addDoubleClause:(id)a3 fieldName:(id)a4 expression:(double)a5;
- (void)addInClause:(id)a3 fieldName:(id)a4 expressions:(id)a5;
- (void)addInClauseWithFieldName:(id)a3 expressions:(id)a4;
- (void)addIntegerClause:(id)a3 fieldName:(id)a4 expression:(int64_t)a5;
- (void)addIsNull:(id)a3;
- (void)addNumberClause:(id)a3 fieldName:(id)a4 expression:(id)a5;
- (void)addStringClause:(id)a3 fieldName:(id)a4 expression:(id)a5;
@end

@implementation FHDatabaseClauseBuilder

- (FHDatabaseClauseBuilder)init
{
  v6.receiver = self;
  v6.super_class = (Class)FHDatabaseClauseBuilder;
  v2 = [(FHDatabaseClauseBuilder *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    clauseStack = v2->_clauseStack;
    v2->_clauseStack = (NSMutableArray *)v3;
  }
  return v2;
}

- (void)addStringClause:(id)a3 fieldName:(id)a4 expression:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [[FHDatabaseClause alloc] initWithQuoteWrapOption:v10 fieldName:v9 expression:v8 quoteWrapExpression:1];

  [(NSMutableArray *)self->_clauseStack addObject:v11];
}

- (void)addDoubleClause:(id)a3 fieldName:(id)a4 expression:(double)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = [FHDatabaseClause alloc];
  v11 = objc_msgSend(NSString, "stringWithFormat:", @"%f", *(void *)&a5);
  v12 = [(FHDatabaseClause *)v10 initWithQuoteWrapOption:v9 fieldName:v8 expression:v11 quoteWrapExpression:0];

  [(NSMutableArray *)self->_clauseStack addObject:v12];
}

- (void)addIntegerClause:(id)a3 fieldName:(id)a4 expression:(int64_t)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = [FHDatabaseClause alloc];
  v11 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", a5);
  v12 = [(FHDatabaseClause *)v10 initWithQuoteWrapOption:v9 fieldName:v8 expression:v11 quoteWrapExpression:0];

  [(NSMutableArray *)self->_clauseStack addObject:v12];
}

- (void)addDecimalNumberClause:(id)a3 fieldName:(id)a4 expression:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [FHDatabaseClause alloc];
  v12 = [v8 stringValue];

  v13 = [(FHDatabaseClause *)v11 initWithQuoteWrapOption:v10 fieldName:v9 expression:v12 quoteWrapExpression:0];
  [(NSMutableArray *)self->_clauseStack addObject:v13];
}

- (void)addNumberClause:(id)a3 fieldName:(id)a4 expression:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [FHDatabaseClause alloc];
  v12 = [v8 stringValue];

  v13 = [(FHDatabaseClause *)v11 initWithQuoteWrapOption:v10 fieldName:v9 expression:v12 quoteWrapExpression:0];
  [(NSMutableArray *)self->_clauseStack addObject:v13];
}

- (void)addDateClause:(id)a3 fieldName:(id)a4 expression:(id)a5
{
  id v8 = a4;
  id v9 = a3;
  [a5 timeIntervalSinceReferenceDate];
  -[FHDatabaseClauseBuilder addDoubleClause:fieldName:expression:](self, "addDoubleClause:fieldName:expression:", v9, v8);
}

- (void)addInClauseWithFieldName:(id)a3 expressions:(id)a4
{
}

- (void)addInClause:(id)a3 fieldName:(id)a4 expressions:(id)a5
{
  id v15 = a3;
  id v8 = a4;
  id v9 = a5;
  if (([v15 isEqualToString:@"IN"] & 1) != 0
    || [v15 isEqualToString:@"NOT IN"])
  {
    id v10 = [FHDatabaseClause alloc];
    v11 = NSString;
    v12 = [v9 componentsJoinedByString:@","];
    v13 = [v11 stringWithFormat:@"(%@)", v12];
    v14 = [(FHDatabaseClause *)v10 initWithQuoteWrapOption:v15 fieldName:v8 expression:v13 quoteWrapExpression:0];

    [(NSMutableArray *)self->_clauseStack addObject:v14];
  }
}

- (void)addBetweenClauseWithFieldName:(id)a3 lowerBound:(unint64_t)a4 upperBound:(unint64_t)a5
{
  id v8 = a3;
  id v9 = [FHDatabaseClause alloc];
  id v10 = objc_msgSend(NSString, "stringWithFormat:", @"%lu AND %lu", a4, a5);
  v11 = [(FHDatabaseClause *)v9 initWithQuoteWrapOption:@"BETWEEN" fieldName:v8 expression:v10 quoteWrapExpression:0];

  [(NSMutableArray *)self->_clauseStack addObject:v11];
}

- (void)addIsNull:(id)a3
{
  id v4 = a3;
  v5 = [[FHDatabaseClause alloc] initWithQuoteWrapOption:@"IS" fieldName:v4 expression:@"NULL" quoteWrapExpression:0];

  [(NSMutableArray *)self->_clauseStack addObject:v5];
}

- (void)addDatabaseClause:(id)a3
{
}

- (NSMutableArray)clauseStack
{
  return self->_clauseStack;
}

- (void).cxx_destruct
{
}

@end