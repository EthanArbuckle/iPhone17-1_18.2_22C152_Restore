@interface EFSQLBitExpression
+ (id)and:(id)a3 with:(id)a4;
+ (id)leftShift:(id)a3 by:(id)a4;
+ (id)or:(id)a3 with:(id)a4;
+ (id)rightShift:(id)a3 by:(id)a4;
- (EFSQLBitExpression)initWithLeft:(id)a3 bitwiseOperator:(unint64_t)a4 right:(id)a5;
- (EFSQLExpressable)left;
- (EFSQLExpressable)right;
- (NSString)ef_SQLExpression;
- (unint64_t)bitwiseOperator;
- (void)ef_renderSQLExpressionInto:(id)a3;
- (void)setColumnExpression:(id)a3;
- (void)setLeft:(id)a3;
@end

@implementation EFSQLBitExpression

+ (id)leftShift:(id)a3 by:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)[objc_alloc((Class)a1) initWithLeft:v6 bitwiseOperator:2 right:v7];

  return v8;
}

+ (id)rightShift:(id)a3 by:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)[objc_alloc((Class)a1) initWithLeft:v6 bitwiseOperator:3 right:v7];

  return v8;
}

+ (id)and:(id)a3 with:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)[objc_alloc((Class)a1) initWithLeft:v6 bitwiseOperator:0 right:v7];

  return v8;
}

+ (id)or:(id)a3 with:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)[objc_alloc((Class)a1) initWithLeft:v6 bitwiseOperator:1 right:v7];

  return v8;
}

- (EFSQLBitExpression)initWithLeft:(id)a3 bitwiseOperator:(unint64_t)a4 right:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)EFSQLBitExpression;
  v11 = [(EFSQLBitExpression *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_left, a3);
    v12->_bitwiseOperator = a4;
    objc_storeStrong((id *)&v12->_right, a5);
  }

  return v12;
}

- (NSString)ef_SQLExpression
{
  v3 = [MEMORY[0x1E4F28E78] string];
  [(EFSQLBitExpression *)self ef_renderSQLExpressionInto:v3];
  return (NSString *)v3;
}

- (void)ef_renderSQLExpressionInto:(id)a3
{
  id v6 = a3;
  objc_msgSend(v6, "appendString:", @"(");
  [(EFSQLExpressable *)self->_left ef_renderSQLExpressionInto:v6];
  unint64_t v4 = self->_bitwiseOperator - 1;
  if (v4 > 2) {
    v5 = @" & ";
  }
  else {
    v5 = off_1E61230A0[v4];
  }
  [v6 appendString:v5];
  [(EFSQLExpressable *)self->_right ef_renderSQLExpressionInto:v6];
  [v6 appendString:@""]);
}

- (void)setColumnExpression:(id)a3
{
  id v7 = a3;
  unint64_t v4 = [(EFSQLBitExpression *)self left];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v6 = [(EFSQLBitExpression *)self left];
    [v6 setColumnExpression:v7];
  }
  else
  {
    [(EFSQLBitExpression *)self setLeft:v7];
  }
}

- (EFSQLExpressable)left
{
  return self->_left;
}

- (void)setLeft:(id)a3
{
}

- (EFSQLExpressable)right
{
  return self->_right;
}

- (unint64_t)bitwiseOperator
{
  return self->_bitwiseOperator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_right, 0);
  objc_storeStrong((id *)&self->_left, 0);
}

@end