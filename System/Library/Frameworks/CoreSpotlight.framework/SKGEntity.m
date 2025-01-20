@interface SKGEntity
- (BOOL)isEqual:(id)a3;
- (SKGEntity)initWithScore:(double)a3;
- (double)score;
- (id)description;
- (void)setScore:(double)a3;
@end

@implementation SKGEntity

- (SKGEntity)initWithScore:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SKGEntity;
  result = [(SKGEntity *)&v5 init];
  if (result) {
    result->_score = a3;
  }
  return result;
}

- (void)setScore:(double)a3
{
  self->_score = a3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    [(SKGEntity *)self score];
    double v7 = v6;
    [v5 score];
    if (v7 == v8)
    {
      v11.receiver = self;
      v11.super_class = (Class)SKGEntity;
      BOOL v9 = [(SKGEntity *)&v11 isEqual:v5];
    }
    else
    {
      BOOL v9 = 0;
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (id)description
{
  uint64_t v3 = objc_opt_class();
  [(SKGEntity *)self score];
  return +[NSString stringWithFormat:@"<%@: %f", v3, v4];
}

- (double)score
{
  return self->_score;
}

@end