@interface DBGData
+ (id)valueWithEncodedValue:(id)a3 format:(id)a4 error:(id *)a5;
+ (id)withData:(id)a3;
- (DBGData)initWithData:(id)a3;
- (NSData)data;
- (NSString)debugDescription;
- (NSString)description;
- (id)JSONCompatibleRepresentation;
- (void)setData:(id)a3;
@end

@implementation DBGData

+ (id)withData:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)a1) initWithData:v4];

  return v5;
}

- (DBGData)initWithData:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DBGData;
  v6 = [(DBGData *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_data, a3);
  }

  return v7;
}

- (NSString)description
{
  v2 = [(DBGData *)self objectValue];
  v3 = [v2 description];

  return (NSString *)v3;
}

- (NSString)debugDescription
{
  v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  id v5 = [(DBGData *)self description];
  v6 = +[NSString stringWithFormat:@"<%@: %p %@>", v4, self, v5];

  return (NSString *)v6;
}

- (NSData)data
{
  return (NSData *)objc_getProperty(self, a2, 8, 1);
}

- (void)setData:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (id)valueWithEncodedValue:(id)a3 format:(id)a4 error:(id *)a5
{
  id v8 = a3;
  if ([a4 isEqualToString:@"public.data"]
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_super v9 = [v8 dbgDataValue];
  }
  else
  {
    objc_super v9 = 0;
    if (!v8 && a5)
    {
      objc_super v9 = 0;
      *a5 = 0;
    }
  }
  v10 = [a1 withData:v9];

  return v10;
}

- (id)JSONCompatibleRepresentation
{
  v2 = [(DBGData *)self data];
  v3 = [v2 base64EncodedStringWithOptions:0];

  return v3;
}

@end