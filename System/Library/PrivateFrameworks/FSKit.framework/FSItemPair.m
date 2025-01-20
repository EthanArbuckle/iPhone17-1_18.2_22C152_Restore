@interface FSItemPair
+ (id)pairWith:(id)a3 andObject:(id)a4;
- (BOOL)isEqual:(id)a3;
- (FSItemPair)initWith:(id)a3 andObject:(id)a4;
- (NSObject)first;
- (NSObject)second;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
@end

@implementation FSItemPair

- (FSItemPair)initWith:(id)a3 andObject:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)FSItemPair;
  v8 = [(FSItemPair *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    first = v8->_first;
    v8->_first = v9;

    uint64_t v11 = [v7 copy];
    second = v8->_second;
    v8->_second = v11;
  }
  return v8;
}

+ (id)pairWith:(id)a3 andObject:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[objc_alloc((Class)a1) initWith:v7 andObject:v6];

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3 = [self->_first hash];
  return [self->_second hash] + 997 * v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v5 = v4;
    first = self->_first;
    id v7 = [v5 first];
    if ([first isEqual:v7])
    {
      second = self->_second;
      uint64_t v9 = [v5 second];
      char v10 = [second isEqual:v9];
    }
    else
    {
      char v10 = 0;
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  first = self->_first;
  second = self->_second;
  return (id)[v4 initWith:first andObject:second];
}

- (NSObject)first
{
  return objc_getProperty(self, a2, 8, 1);
}

- (NSObject)second
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_second, 0);
  objc_storeStrong((id *)&self->_first, 0);
}

@end