@interface CAFTestComplexItem
- (CAFTestComplexItem)initWithDictionary:(id)a3;
- (NSDictionary)dictionaryRepresentation;
- (NSString)key;
- (id)description;
- (unsigned)value;
@end

@implementation CAFTestComplexItem

- (CAFTestComplexItem)initWithDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CAFTestComplexItem;
  v5 = [(CAFTestComplexItem *)&v12 init];
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
      id v10 = v9;
    }
    else {
      id v10 = 0;
    }

    v5->_value = [v10 unsignedIntValue];
  }

  return v5;
}

- (NSDictionary)dictionaryRepresentation
{
  v9[2] = *MEMORY[0x263EF8340];
  v8[0] = @"key";
  v3 = [(CAFTestComplexItem *)self key];
  id v4 = v3;
  if (!v3)
  {
    id v4 = [MEMORY[0x263EFF9D0] null];
  }
  v8[1] = @"value";
  v9[0] = v4;
  v5 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[CAFTestComplexItem value](self, "value"));
  v9[1] = v5;
  id v6 = [NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:2];

  if (!v3) {
  return (NSDictionary *)v6;
  }
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(CAFTestComplexItem *)self key];
  id v6 = [v3 stringWithFormat:@"<%@: %p { %@: %@, %@: %u }>", v4, self, @"key", v5, @"value", -[CAFTestComplexItem value](self, "value")];

  return v6;
}

- (NSString)key
{
  return self->_key;
}

- (unsigned)value
{
  return self->_value;
}

- (void).cxx_destruct
{
}

@end