@interface CNFutureResult
- (NSError)error;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)result;
- (void)setError:(id)a3;
- (void)setResult:(id)a3;
- (void)setResult:(id)a3 error:(id)a4;
@end

@implementation CNFutureResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);

  objc_storeStrong(&self->_result, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  v5 = [(CNFutureResult *)self result];
  v6 = [(CNFutureResult *)self error];
  [v4 setResult:v5 error:v6];

  return v4;
}

- (id)result
{
  return self->_result;
}

- (void)setResult:(id)a3 error:(id)a4
{
  if (a3) {
    -[CNFutureResult setResult:](self, "setResult:", a3, a4);
  }
  else {
    [(CNFutureResult *)self setError:a4];
  }
}

- (NSError)error
{
  return self->_error;
}

- (void)setResult:(id)a3
{
}

- (void)setError:(id)a3
{
}

- (id)description
{
  v3 = [(CNFutureResult *)self result];
  if (v3)
  {

LABEL_4:
    v5 = [(CNFutureResult *)self result];

    v6 = NSString;
    v7 = (objc_class *)objc_opt_class();
    v8 = NSStringFromClass(v7);
    if (v5)
    {
      v9 = [(CNFutureResult *)self result];
      [v6 stringWithFormat:@"<%@: %p result='%@'>", v8, self, v9];
    }
    else
    {
      v9 = [(CNFutureResult *)self error];
      [v6 stringWithFormat:@"<%@: %p error='%@'>", v8, self, v9];
    v10 = };

    goto LABEL_8;
  }
  id v4 = [(CNFutureResult *)self error];

  if (v4) {
    goto LABEL_4;
  }
  v12 = NSString;
  v13 = (objc_class *)objc_opt_class();
  v8 = NSStringFromClass(v13);
  v10 = [v12 stringWithFormat:@"<%@: %p unfinished>", v8, self];
LABEL_8:

  return v10;
}

@end