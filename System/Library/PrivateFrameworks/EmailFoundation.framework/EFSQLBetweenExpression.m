@interface EFSQLBetweenExpression
- (BOOL)between;
- (EFSQLBetweenExpression)initWithLeft:(id)a3 firstValue:(id)a4 secondValue:(id)a5 between:(BOOL)a6;
- (EFSQLExpressable)left;
- (NSString)ef_SQLExpression;
- (void)ef_renderSQLExpressionInto:(id)a3;
- (void)setColumnExpression:(id)a3;
@end

@implementation EFSQLBetweenExpression

- (EFSQLBetweenExpression)initWithLeft:(id)a3 firstValue:(id)a4 secondValue:(id)a5 between:(BOOL)a6
{
  id v11 = a3;
  v15.receiver = self;
  v15.super_class = (Class)EFSQLBetweenExpression;
  v12 = [(EFPair *)&v15 initWithFirst:a4 second:a5];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_left, a3);
    v13->_between = a6;
  }

  return v13;
}

- (NSString)ef_SQLExpression
{
  v3 = [MEMORY[0x1E4F28E78] string];
  [(EFSQLBetweenExpression *)self ef_renderSQLExpressionInto:v3];
  return (NSString *)v3;
}

- (void)ef_renderSQLExpressionInto:(id)a3
{
  id v8 = a3;
  v4 = [(EFSQLBetweenExpression *)self left];
  objc_msgSend(v4, "ef_renderSQLExpressionInto:", v8);

  if (self->_between) {
    v5 = @" BETWEEN ";
  }
  else {
    v5 = @" NOT BETWEEN ";
  }
  [v8 appendString:v5];
  v6 = [(EFPair *)self first];
  objc_msgSend(v6, "ef_renderSQLExpressionInto:", v8);

  [v8 appendString:@" AND "];
  v7 = [(EFPair *)self second];
  objc_msgSend(v7, "ef_renderSQLExpressionInto:", v8);
}

- (void)setColumnExpression:(id)a3
{
  id v5 = a3;
  v4 = [(EFSQLBetweenExpression *)self left];
  [v4 setColumnExpression:v5];
}

- (EFSQLExpressable)left
{
  return self->_left;
}

- (BOOL)between
{
  return self->_between;
}

- (void).cxx_destruct
{
}

@end