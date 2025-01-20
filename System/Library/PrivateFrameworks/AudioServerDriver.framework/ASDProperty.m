@interface ASDProperty
- (ASDProperty)initWithAddress:(id)a3 value:(id)a4;
- (ASDProperty)initWithDictionary:(id)a3;
- (ASDPropertyAddress)address;
- (BOOL)isEqual:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)value;
- (unint64_t)hash;
- (void)setValue:(id)a3;
@end

@implementation ASDProperty

- (ASDProperty)initWithAddress:(id)a3 value:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ASDProperty;
  v9 = [(ASDProperty *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_address, a3);
    objc_storeStrong(&v10->_value, a4);
  }

  return v10;
}

- (ASDProperty)initWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"Address"];
  v6 = [v4 objectForKeyedSubscript:@"Value"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = [[ASDPropertyAddress alloc] initWithDictionary:v5];
    id v8 = [(ASDProperty *)self initWithAddress:v7 value:v6];
    self = (ASDProperty *)v7;
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  v5 = [(ASDProperty *)self address];
  v6 = [(ASDProperty *)self value];
  id v7 = (void *)[v4 initWithAddress:v5 value:v6];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ASDProperty *)a3;
  if (self == v4)
  {
    char v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v6 = [(ASDProperty *)v5 address];
      id v7 = [(ASDProperty *)self address];
      if ([v6 isEqual:v7])
      {
        id v8 = [(ASDProperty *)v5 value];
        v9 = [(ASDProperty *)self value];
        char v10 = [v8 isEqual:v9];
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
  }

  return v10;
}

- (unint64_t)hash
{
  v3 = [(ASDProperty *)self address];
  uint64_t v4 = [v3 hash];
  v5 = [(ASDProperty *)self value];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (ASDPropertyAddress)address
{
  return self->_address;
}

- (id)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_value, 0);
  objc_storeStrong((id *)&self->_address, 0);
}

@end