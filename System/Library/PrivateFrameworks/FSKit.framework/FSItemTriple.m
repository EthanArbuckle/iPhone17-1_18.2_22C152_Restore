@interface FSItemTriple
+ (id)tripleWith:(id)a3 second:(id)a4 third:(id)a5;
- (BOOL)isEqual:(id)a3;
- (FSItemTriple)initWith:(id)a3 second:(id)a4 third:(id)a5;
- (NSObject)first;
- (NSObject)second;
- (NSObject)third;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
@end

@implementation FSItemTriple

- (FSItemTriple)initWith:(id)a3 second:(id)a4 third:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)FSItemTriple;
  v11 = [(FSItemTriple *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    first = v11->_first;
    v11->_first = v12;

    uint64_t v14 = [v9 copy];
    second = v11->_second;
    v11->_second = v14;

    uint64_t v16 = [v10 copy];
    third = v11->_third;
    v11->_third = v16;
  }
  return v11;
}

+ (id)tripleWith:(id)a3 second:(id)a4 third:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = (void *)[objc_alloc((Class)a1) initWith:v10 second:v9 third:v8];

  return v11;
}

- (unint64_t)hash
{
  uint64_t v3 = [self->_first hash];
  uint64_t v4 = [self->_second hash] + 199 * v3;
  return [self->_third hash] + 199 * v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v5 = v4;
    first = self->_first;
    v7 = [v5 first];
    if ([first isEqual:v7])
    {
      second = self->_second;
      id v9 = [v5 second];
      if ([second isEqual:v9])
      {
        third = self->_third;
        v11 = [v5 third];
        char v12 = [third isEqual:v11];
      }
      else
      {
        char v12 = 0;
      }
    }
    else
    {
      char v12 = 0;
    }
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  first = self->_first;
  second = self->_second;
  third = self->_third;
  return (id)[v4 initWith:first second:second third:third];
}

- (NSObject)first
{
  return objc_getProperty(self, a2, 8, 1);
}

- (NSObject)second
{
  return objc_getProperty(self, a2, 16, 1);
}

- (NSObject)third
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_third, 0);
  objc_storeStrong((id *)&self->_second, 0);
  objc_storeStrong((id *)&self->_first, 0);
}

@end