@interface CAFSymbolImageWithColor
- (CAFSymbolImageWithColor)initWithDictionary:(id)a3;
- (NSDictionary)dictionaryRepresentation;
- (NSString)name;
- (id)description;
- (unsigned)color;
@end

@implementation CAFSymbolImageWithColor

- (CAFSymbolImageWithColor)initWithDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CAFSymbolImageWithColor;
  v5 = [(CAFSymbolImageWithColor *)&v12 init];
  if (v5)
  {
    objc_opt_class();
    id v6 = [v4 objectForKey:@"color"];
    if (v6 && (objc_opt_isKindOfClass() & 1) != 0) {
      id v7 = v6;
    }
    else {
      id v7 = 0;
    }

    v5->_color = [v7 unsignedCharValue];
    objc_opt_class();
    id v8 = [v4 objectForKey:@"name"];
    if (v8 && (objc_opt_isKindOfClass() & 1) != 0) {
      v9 = (NSString *)v8;
    }
    else {
      v9 = 0;
    }

    name = v5->_name;
    v5->_name = v9;
  }
  return v5;
}

- (NSDictionary)dictionaryRepresentation
{
  v9[2] = *MEMORY[0x263EF8340];
  v8[0] = @"color";
  v3 = objc_msgSend(NSNumber, "numberWithUnsignedChar:", -[CAFSymbolImageWithColor color](self, "color"));
  v8[1] = @"name";
  v9[0] = v3;
  id v4 = [(CAFSymbolImageWithColor *)self name];
  v5 = v4;
  if (!v4)
  {
    v5 = [MEMORY[0x263EFF9D0] null];
  }
  v9[1] = v5;
  id v6 = [NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:2];
  if (!v4) {

  }
  return (NSDictionary *)v6;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  unsigned int v5 = [(CAFSymbolImageWithColor *)self color];
  id v6 = [(CAFSymbolImageWithColor *)self name];
  id v7 = [v3 stringWithFormat:@"<%@: %p { %@: %hhu, %@: %@ }>", v4, self, @"color", v5, @"name", v6];

  return v7;
}

- (unsigned)color
{
  return self->_color;
}

- (NSString)name
{
  return self->_name;
}

- (void).cxx_destruct
{
}

@end