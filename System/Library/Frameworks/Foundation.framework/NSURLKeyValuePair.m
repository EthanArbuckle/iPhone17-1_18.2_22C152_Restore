@interface NSURLKeyValuePair
+ (id)pair;
+ (id)pairWithKey:(id)a3 value:(id)a4;
- (BOOL)isEqual:(id)a3;
- (NSURLKeyValuePair)initWithKey:(id)a3 value:(id)a4;
- (id)description;
- (id)key;
- (id)value;
- (unint64_t)hash;
- (void)dealloc;
- (void)setKey:(id)a3;
- (void)setValue:(id)a3;
@end

@implementation NSURLKeyValuePair

+ (id)pair
{
  v2 = [[NSURLKeyValuePair alloc] initWithKey:0 value:0];

  return v2;
}

+ (id)pairWithKey:(id)a3 value:(id)a4
{
  v4 = [[NSURLKeyValuePair alloc] initWithKey:a3 value:a4];

  return v4;
}

- (NSURLKeyValuePair)initWithKey:(id)a3 value:(id)a4
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v9.receiver = self;
  v9.super_class = (Class)NSURLKeyValuePair;
  v6 = [(NSURLKeyValuePair *)&v9 init];
  v7 = v6;
  if (v6)
  {
    [(NSURLKeyValuePair *)v6 setKey:a3];
    [(NSURLKeyValuePair *)v7 setValue:a4];
    v7->hash = [a3 hash];
  }
  return v7;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)NSURLKeyValuePair;
  [(NSURLKeyValuePair *)&v3 dealloc];
}

- (void)setKey:(id)a3
{
  id key = self->key;
  if (key != a3)
  {

    self->id key = a3;
  }
}

- (void)setValue:(id)a3
{
  id value = self->value;
  if (value != a3)
  {

    self->id value = a3;
  }
}

- (id)key
{
  return self->key;
}

- (id)value
{
  return self->value;
}

- (id)description
{
  return +[NSString stringWithFormat:@"<NSURLKeyValuePair %@=%@>", self->key, self->value];
}

- (unint64_t)hash
{
  return self->hash;
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3)
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    int v5 = [a3 isMemberOfClass:objc_opt_class()];
    if (v5)
    {
      int v5 = objc_msgSend(self->key, "isEqual:", objc_msgSend(a3, "key"));
      if (v5)
      {
        id value = self->value;
        uint64_t v7 = [a3 value];
        LOBYTE(v5) = [value isEqual:v7];
      }
    }
  }
  return v5;
}

@end