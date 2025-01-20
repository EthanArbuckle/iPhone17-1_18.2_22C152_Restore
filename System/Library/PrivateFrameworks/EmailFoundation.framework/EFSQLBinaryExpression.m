@interface EFSQLBinaryExpression
- (EFSQLBinaryExpression)initWithLeft:(id)a3 operator:(unint64_t)a4 right:(id)a5;
- (EFSQLExpressable)left;
- (EFSQLExpressable)right;
- (NSString)ef_SQLExpression;
- (__CFString)_binaryStringForOperator:(__CFString *)result;
- (unint64_t)binaryOperator;
- (void)ef_renderSQLExpressionInto:(id)a3;
- (void)setColumnExpression:(id)a3;
@end

@implementation EFSQLBinaryExpression

- (EFSQLBinaryExpression)initWithLeft:(id)a3 operator:(unint64_t)a4 right:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)EFSQLBinaryExpression;
  v11 = [(EFSQLBinaryExpression *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_left, a3);
    objc_storeStrong((id *)&v12->_right, a5);
    v12->_binaryOperator = a4;
  }

  return v12;
}

- (void)ef_renderSQLExpressionInto:(id)a3
{
  id v5 = a3;
  -[EFSQLExpressable ef_renderSQLExpressionInto:](self->_left, "ef_renderSQLExpressionInto:");
  v4 = -[EFSQLBinaryExpression _binaryStringForOperator:]((__CFString *)self, self->_binaryOperator);
  [v5 appendString:v4];

  [(EFSQLExpressable *)self->_right ef_renderSQLExpressionInto:v5];
}

- (__CFString)_binaryStringForOperator:(__CFString *)result
{
  if (result)
  {
    if ((unint64_t)(a2 - 1) > 0xF) {
      return @" = ";
    }
    else {
      return off_1E6123020[a2 - 1];
    }
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_right, 0);
  objc_storeStrong((id *)&self->_left, 0);
}

- (NSString)ef_SQLExpression
{
  v3 = [MEMORY[0x1E4F28E78] string];
  [(EFSQLBinaryExpression *)self ef_renderSQLExpressionInto:v3];
  return (NSString *)v3;
}

- (void)setColumnExpression:(id)a3
{
  id v5 = a3;
  v4 = [(EFSQLBinaryExpression *)self left];
  [v4 setColumnExpression:v5];
}

- (EFSQLExpressable)left
{
  return self->_left;
}

- (EFSQLExpressable)right
{
  return self->_right;
}

- (unint64_t)binaryOperator
{
  return self->_binaryOperator;
}

@end