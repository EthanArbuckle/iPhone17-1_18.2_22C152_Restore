@interface CAFTestComplexArrayItem
- (CAFTestComplexArrayItem)initWithDictionary:(id)a3;
- (NSArray)value;
- (NSDictionary)dictionaryRepresentation;
- (NSString)key;
- (id)description;
@end

@implementation CAFTestComplexArrayItem

- (CAFTestComplexArrayItem)initWithDictionary:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CAFTestComplexArrayItem;
  v5 = [(CAFTestComplexArrayItem *)&v13 init];
  if (v5)
  {
    objc_opt_class();
    id v6 = [v4 objectForKey:@"key"];
    if (v6 && (objc_opt_isKindOfClass() & 1) != 0) {
      v7 = (NSString *)v6;
    }
    else {
      v7 = 0;
    }

    key = v5->_key;
    v5->_key = v7;

    objc_opt_class();
    id v9 = [v4 objectForKey:@"value"];
    if (v9 && (objc_opt_isKindOfClass() & 1) != 0) {
      v10 = (NSArray *)v9;
    }
    else {
      v10 = 0;
    }

    value = v5->_value;
    v5->_value = v10;
  }
  return v5;
}

- (NSDictionary)dictionaryRepresentation
{
  v10[2] = *MEMORY[0x263EF8340];
  v9[0] = @"key";
  v3 = [(CAFTestComplexArrayItem *)self key];
  id v4 = v3;
  if (!v3)
  {
    id v4 = [MEMORY[0x263EFF9D0] null];
  }
  v9[1] = @"value";
  v10[0] = v4;
  v5 = [(CAFTestComplexArrayItem *)self value];
  id v6 = v5;
  if (!v5)
  {
    id v6 = [MEMORY[0x263EFF9D0] null];
  }
  v10[1] = v6;
  v7 = [NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:2];
  if (!v5) {

  }
  if (!v3) {
  return (NSDictionary *)v7;
  }
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(CAFTestComplexArrayItem *)self key];
  id v6 = [(CAFTestComplexArrayItem *)self value];
  v7 = [v3 stringWithFormat:@"<%@: %p { %@: %@, %@: %@ }>", v4, self, @"key", v5, @"value", v6];

  return v7;
}

- (NSString)key
{
  return self->_key;
}

- (NSArray)value
{
  return self->_value;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

@end