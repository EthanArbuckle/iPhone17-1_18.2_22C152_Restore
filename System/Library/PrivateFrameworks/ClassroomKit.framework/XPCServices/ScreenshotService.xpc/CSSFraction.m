@interface CSSFraction
- (CSSFraction)init;
- (CSSFraction)initWithNumerator:(unint64_t)a3 denominator:(unint64_t)a4;
- (CSSFraction)simplifiedFraction;
- (id)description;
- (unint64_t)denominator;
- (unint64_t)greatestCommonDivisor;
- (unint64_t)numerator;
@end

@implementation CSSFraction

- (CSSFraction)init
{
  return [(CSSFraction *)self initWithNumerator:1 denominator:1];
}

- (CSSFraction)initWithNumerator:(unint64_t)a3 denominator:(unint64_t)a4
{
  if (!a4)
  {
    v9 = +[NSAssertionHandler currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"CSSFraction.m" lineNumber:18 description:@"Zero denominator"];
  }
  v10.receiver = self;
  v10.super_class = (Class)CSSFraction;
  result = [(CSSFraction *)&v10 init];
  if (result)
  {
    result->_numerator = a3;
    result->_denominator = a4;
  }
  return result;
}

- (CSSFraction)simplifiedFraction
{
  unint64_t v3 = [(CSSFraction *)self greatestCommonDivisor];
  id v4 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithNumerator:denominator:", -[CSSFraction numerator](self, "numerator") / v3, -[CSSFraction denominator](self, "denominator") / v3);

  return (CSSFraction *)v4;
}

- (unint64_t)greatestCommonDivisor
{
  unint64_t v3 = [(CSSFraction *)self numerator];
  unint64_t v4 = [(CSSFraction *)self denominator];
  if (!v3) {
    return v4;
  }
  do
  {
    unint64_t v5 = v3;
    unint64_t v3 = v4 % v3;
    unint64_t v4 = v5;
  }
  while (v3);
  return v5;
}

- (id)description
{
  return +[NSString stringWithFormat:@"<%@: %p { numerator = %lu, denominator = %lu }>", objc_opt_class(), self, [(CSSFraction *)self numerator], [(CSSFraction *)self denominator]];
}

- (unint64_t)numerator
{
  return self->_numerator;
}

- (unint64_t)denominator
{
  return self->_denominator;
}

@end