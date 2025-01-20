@interface BigramKey
- (BOOL)isEqual:(id)a3;
- (BigramKey)initWithTokenA:(id)a3 tokenB:(id)a4;
- (NSString)tokenA;
- (NSString)tokenB;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)recycle;
- (void)setTokenA:(id)a3;
- (void)setTokenB:(id)a3;
@end

@implementation BigramKey

- (BigramKey)initWithTokenA:(id)a3 tokenB:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)BigramKey;
  v9 = [(BigramKey *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_tokenA, a3);
    objc_storeStrong((id *)&v10->_tokenB, a4);
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (BigramKey *)a3;
  if (self == v4)
  {
    unsigned __int8 v6 = 1;
  }
  else
  {
    uint64_t v5 = objc_opt_class();
    if (v5 == objc_opt_class())
    {
      id v7 = v4;
      tokenA = self->_tokenA;
      v9 = [(BigramKey *)v7 tokenA];
      if ([(NSString *)tokenA isEqualToString:v9])
      {
        tokenB = self->_tokenB;
        v11 = [(BigramKey *)v7 tokenB];
        unsigned __int8 v6 = [(NSString *)tokenB isEqualToString:v11];
      }
      else
      {
        unsigned __int8 v6 = 0;
      }
    }
    else
    {
      unsigned __int8 v6 = 0;
    }
  }

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_tokenA hash];
  return [(NSString *)self->_tokenB hash] + 32 * v3 - v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[BigramKey allocWithZone:a3];
  tokenA = self->_tokenA;
  tokenB = self->_tokenB;
  return [(BigramKey *)v4 initWithTokenA:tokenA tokenB:tokenB];
}

- (id)description
{
  return +[NSString stringWithFormat:@"%@ %@", self->_tokenA, self->_tokenB];
}

- (void)recycle
{
  tokenA = self->_tokenA;
  self->_tokenA = 0;

  tokenB = self->_tokenB;
  self->_tokenB = 0;
}

- (NSString)tokenA
{
  return self->_tokenA;
}

- (void)setTokenA:(id)a3
{
}

- (NSString)tokenB
{
  return self->_tokenB;
}

- (void)setTokenB:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokenB, 0);
  objc_storeStrong((id *)&self->_tokenA, 0);
}

@end