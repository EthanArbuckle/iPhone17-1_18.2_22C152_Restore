@interface CAFTestComplexNestedItem
- (CAFTestComplexItem)nestedValue;
- (CAFTestComplexNestedItem)initWithDictionary:(id)a3;
- (NSDictionary)dictionaryRepresentation;
- (NSString)nestedKey;
- (id)description;
@end

@implementation CAFTestComplexNestedItem

- (CAFTestComplexNestedItem)initWithDictionary:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CAFTestComplexNestedItem;
  v5 = [(CAFTestComplexNestedItem *)&v13 init];
  if (v5)
  {
    objc_opt_class();
    id v6 = [v4 objectForKey:@"nestedKey"];
    if (v6 && (objc_opt_isKindOfClass() & 1) != 0) {
      v7 = (NSString *)v6;
    }
    else {
      v7 = 0;
    }

    nestedKey = v5->_nestedKey;
    v5->_nestedKey = v7;

    objc_opt_class();
    id v9 = [v4 objectForKey:@"nestedValue"];
    if (v9 && (objc_opt_isKindOfClass() & 1) != 0) {
      v10 = (CAFTestComplexItem *)v9;
    }
    else {
      v10 = 0;
    }

    nestedValue = v5->_nestedValue;
    v5->_nestedValue = v10;
  }
  return v5;
}

- (NSDictionary)dictionaryRepresentation
{
  v10[2] = *MEMORY[0x263EF8340];
  v9[0] = @"nestedKey";
  v3 = [(CAFTestComplexNestedItem *)self nestedKey];
  id v4 = v3;
  if (!v3)
  {
    id v4 = [MEMORY[0x263EFF9D0] null];
  }
  v9[1] = @"nestedValue";
  v10[0] = v4;
  v5 = [(CAFTestComplexNestedItem *)self nestedValue];
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
  v5 = [(CAFTestComplexNestedItem *)self nestedKey];
  id v6 = [(CAFTestComplexNestedItem *)self nestedValue];
  v7 = [v3 stringWithFormat:@"<%@: %p { %@: %@, %@: %@ }>", v4, self, @"nestedKey", v5, @"nestedValue", v6];

  return v7;
}

- (NSString)nestedKey
{
  return self->_nestedKey;
}

- (CAFTestComplexItem)nestedValue
{
  return self->_nestedValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nestedValue, 0);
  objc_storeStrong((id *)&self->_nestedKey, 0);
}

@end