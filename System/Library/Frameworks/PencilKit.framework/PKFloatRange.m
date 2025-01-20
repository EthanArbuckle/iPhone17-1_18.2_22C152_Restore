@interface PKFloatRange
- (BOOL)isEqual:(id)a3;
- (CGFloat)lowerBound;
- (CGFloat)upperBound;
- (PKFloatRange)initWithLowerBound:(CGFloat)lowerBound upperBound:(CGFloat)upperBound;
- (id)description;
- (unint64_t)hash;
@end

@implementation PKFloatRange

- (PKFloatRange)initWithLowerBound:(CGFloat)lowerBound upperBound:(CGFloat)upperBound
{
  v7.receiver = self;
  v7.super_class = (Class)PKFloatRange;
  result = [(PKFloatRange *)&v7 init];
  result->_lowerBound = lowerBound;
  result->_upperBound = upperBound;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (v4
    && (uint64_t v5 = objc_opt_class(), v5 == objc_opt_class())
    && (-[PKFloatRange lowerBound](self, "lowerBound"), double v9 = v8, [v4 lowerBound], v9 == v10))
  {
    [(PKFloatRange *)self upperBound];
    double v12 = v11;
    [v4 upperBound];
    BOOL v6 = v12 == v13;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3 = PKHashBytes((uint64_t)&self->_lowerBound, 8);
  return PKHashBytes((uint64_t)&self->_upperBound, 8) ^ v3;
}

- (id)description
{
  uint64_t v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  [(PKFloatRange *)self lowerBound];
  uint64_t v7 = v6;
  [(PKFloatRange *)self upperBound];
  double v9 = [v3 stringWithFormat:@"<%@: %p %0.2f->%0.2f>", v5, self, v7, v8];

  return v9;
}

- (CGFloat)lowerBound
{
  return self->_lowerBound;
}

- (CGFloat)upperBound
{
  return self->_upperBound;
}

@end