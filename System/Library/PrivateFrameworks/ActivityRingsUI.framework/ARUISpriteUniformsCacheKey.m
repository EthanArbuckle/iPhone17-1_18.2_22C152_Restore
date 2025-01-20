@interface ARUISpriteUniformsCacheKey
+ (id)keyForSprite:(id)a3 context:(id)a4;
- (ARUISpriteUniformsCacheKey)initWithSprite:(id)a3 context:(id)a4;
- (BOOL)isEqual:(id)a3;
- (unint64_t)hash;
- (unint64_t)hashValue;
@end

@implementation ARUISpriteUniformsCacheKey

- (unint64_t)hash
{
  return self->_hashValue;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    unint64_t v6 = [(ARUISpriteUniformsCacheKey *)self hashValue];
    uint64_t v7 = [v5 hashValue];

    BOOL v8 = v6 == v7;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (unint64_t)hashValue
{
  return self->_hashValue;
}

+ (id)keyForSprite:(id)a3 context:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = [[ARUISpriteUniformsCacheKey alloc] initWithSprite:v6 context:v5];

  return v7;
}

- (ARUISpriteUniformsCacheKey)initWithSprite:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)ARUISpriteUniformsCacheKey;
  BOOL v8 = [(ARUISpriteUniformsCacheKey *)&v11 init];
  if (v8)
  {
    v9 = +[ARUIHashBuilder builder];
    [v9 appendObject:v6];
    [v9 appendObject:v7];
    v8->_hashValue = [v9 hash];
  }
  return v8;
}

@end