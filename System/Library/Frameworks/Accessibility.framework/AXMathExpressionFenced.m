@interface AXMathExpressionFenced
- (AXMathExpressionFenced)initWithExpressions:(id)a3 openString:(id)a4 closeString:(id)a5;
- (NSArray)expressions;
- (NSString)closeString;
- (NSString)openString;
- (void)setCloseString:(id)a3;
- (void)setExpressions:(id)a3;
- (void)setOpenString:(id)a3;
@end

@implementation AXMathExpressionFenced

- (AXMathExpressionFenced)initWithExpressions:(id)a3 openString:(id)a4 closeString:(id)a5
{
  v12.receiver = self;
  v12.super_class = (Class)AXMathExpressionFenced;
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = [(AXMathExpressionFenced *)&v12 init];
  -[AXMathExpressionFenced setOpenString:](v10, "setOpenString:", v8, v12.receiver, v12.super_class);

  [(AXMathExpressionFenced *)v10 setExpressions:v9];
  [(AXMathExpressionFenced *)v10 setCloseString:v7];

  return v10;
}

- (NSArray)expressions
{
  return self->_expressions;
}

- (void)setExpressions:(id)a3
{
}

- (NSString)openString
{
  return self->_openString;
}

- (void)setOpenString:(id)a3
{
}

- (NSString)closeString
{
  return self->_closeString;
}

- (void)setCloseString:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_closeString, 0);
  objc_storeStrong((id *)&self->_openString, 0);

  objc_storeStrong((id *)&self->_expressions, 0);
}

@end