@interface DBGFont
+ (id)valueWithEncodedValue:(id)a3 format:(id)a4 error:(id *)a5;
+ (id)withDescription:(id)a3;
- (DBGFont)initWithDescription:(id)a3;
- (NSDictionary)fontDescription;
- (NSString)debugDescription;
- (NSString)description;
- (id)JSONCompatibleRepresentation;
- (id)displayString;
- (id)objectValue;
@end

@implementation DBGFont

+ (id)withDescription:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)a1) initWithDescription:v4];

  return v5;
}

- (DBGFont)initWithDescription:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DBGFont;
  v6 = [(DBGFont *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_fontDescription, a3);
  }

  return v7;
}

- (id)displayString
{
  v3 = [(DBGFont *)self fontDescription];

  if (v3)
  {
    id v4 = [(DBGFont *)self fontDescription];
    id v5 = [v4 objectForKeyedSubscript:@"fontName"];

    v6 = [(DBGFont *)self fontDescription];
    v7 = [v6 objectForKeyedSubscript:@"pointSize"];

    v8 = 0;
    if (v5 && v7)
    {
      [v7 floatValue];
      v8 = +[NSString stringWithFormat:@"%@ %.2fpt", v5, v9];
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)objectValue
{
  v3 = [(DBGFont *)self fontDescription];

  if (v3)
  {
    id v4 = [(DBGFont *)self fontDescription];
    id v5 = [v4 objectForKeyedSubscript:@"fontName"];

    v6 = [(DBGFont *)self fontDescription];
    v7 = [v6 objectForKeyedSubscript:@"pointSize"];
  }

  return [(DBGFont *)self displayString];
}

- (NSString)description
{
  v2 = [(DBGFont *)self objectValue];
  v3 = [v2 description];

  return (NSString *)v3;
}

- (NSString)debugDescription
{
  v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  id v5 = [(DBGFont *)self description];
  v6 = +[NSString stringWithFormat:@"<%@: %p %@>", v4, self, v5];

  return (NSString *)v6;
}

- (NSDictionary)fontDescription
{
  return (NSDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

+ (id)valueWithEncodedValue:(id)a3 format:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v10 = DBGDecodeValueFromJSONCompatibleValue();
    id v11 = 0;
    v12 = [a1 withDescription:v10];
    if (a5 && v11) {
      *a5 = v11;
    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)JSONCompatibleRepresentation
{
  v2 = [(DBGFont *)self fontDescription];
  v3 = DBGEncodeValueAsJSONCompatibleValue();
  id v4 = 0;

  if (v4)
  {
    id v5 = [v4 localizedDescription];
    NSLog(&cfstr_SError_0.isa, "-[DBGFont(JSONSerialization) JSONCompatibleRepresentation]", v5);

    v3 = 0;
  }

  return v3;
}

@end