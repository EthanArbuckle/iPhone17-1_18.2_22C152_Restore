@interface SKGKeyphrase
- (BOOL)isEqual:(id)a3;
- (NSString)keyphrase;
- (id)description;
- (unint64_t)tokenCount;
- (void)setKeyphrase:(id)a3;
- (void)setTokenCount:(unint64_t)a3;
@end

@implementation SKGKeyphrase

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [(SKGKeyphrase *)self keyphrase];
    v7 = [v5 keyphrase];
    if ([v6 isEqualToString:v7])
    {
      v10.receiver = self;
      v10.super_class = (Class)SKGKeyphrase;
      BOOL v8 = [(SKGEntity *)&v10 isEqual:v5];
    }
    else
    {
      BOOL v8 = 0;
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (id)description
{
  uint64_t v3 = objc_opt_class();
  id v4 = [(SKGKeyphrase *)self keyphrase];
  id v5 = [v4 lowercaseString];
  [(SKGEntity *)self score];
  v7 = +[NSString stringWithFormat:@"<%@: %@ %f", v3, v5, v6];

  return v7;
}

- (NSString)keyphrase
{
  return self->_keyphrase;
}

- (void)setKeyphrase:(id)a3
{
}

- (unint64_t)tokenCount
{
  return self->_tokenCount;
}

- (void)setTokenCount:(unint64_t)a3
{
  self->_tokenCount = a3;
}

- (void).cxx_destruct
{
}

@end