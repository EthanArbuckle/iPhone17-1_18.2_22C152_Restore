@interface DBGEnumValue
+ (id)valueWithEncodedValue:(id)a3 format:(id)a4 error:(id *)a5;
+ (id)withValue:(id)a3;
- (DBGEnumValue)initWithCustomValue:(id)a3;
- (NSString)debugDescription;
- (NSString)description;
- (id)enumValue;
- (id)stringValue;
- (int64_t)integerValue;
- (unint64_t)unsignedIntegerValue;
- (void)setEnumValue:(id)a3;
- (void)setIntegerValue:(int64_t)a3;
- (void)setStringValue:(id)a3;
- (void)setUnsignedIntegerValue:(unint64_t)a3;
@end

@implementation DBGEnumValue

+ (id)withValue:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)a1) initWithCustomValue:v4];

  return v5;
}

- (DBGEnumValue)initWithCustomValue:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DBGEnumValue;
  v6 = [(DBGEnumValue *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong(&v6->_enumValue, a3);
  }

  return v7;
}

- (int64_t)integerValue
{
  v3 = [(DBGEnumValue *)self enumValue];
  if (v3)
  {
    id v4 = [(DBGEnumValue *)self enumValue];
    objc_opt_class();
    objc_opt_isKindOfClass();
  }
  id v5 = [(DBGEnumValue *)self enumValue];
  id v6 = [v5 integerValue];

  return (int64_t)v6;
}

- (void)setIntegerValue:(int64_t)a3
{
  id v5 = [(DBGEnumValue *)self enumValue];
  if (v5)
  {
    id v6 = [(DBGEnumValue *)self enumValue];
    objc_opt_class();
    objc_opt_isKindOfClass();
  }
  id v7 = +[NSNumber numberWithInteger:a3];
  [(DBGEnumValue *)self setEnumValue:v7];
}

- (unint64_t)unsignedIntegerValue
{
  v3 = [(DBGEnumValue *)self enumValue];
  if (v3)
  {
    id v4 = [(DBGEnumValue *)self enumValue];
    objc_opt_class();
    objc_opt_isKindOfClass();
  }
  id v5 = [(DBGEnumValue *)self enumValue];
  id v6 = [v5 unsignedIntegerValue];

  return (unint64_t)v6;
}

- (void)setUnsignedIntegerValue:(unint64_t)a3
{
  id v5 = [(DBGEnumValue *)self enumValue];
  if (v5)
  {
    id v6 = [(DBGEnumValue *)self enumValue];
    objc_opt_class();
    objc_opt_isKindOfClass();
  }
  id v7 = +[NSNumber numberWithUnsignedInteger:a3];
  [(DBGEnumValue *)self setEnumValue:v7];
}

- (id)stringValue
{
  v3 = [(DBGEnumValue *)self enumValue];
  if (v3)
  {
    id v4 = [(DBGEnumValue *)self enumValue];
    objc_opt_class();
    objc_opt_isKindOfClass();
  }

  return [(DBGEnumValue *)self enumValue];
}

- (void)setStringValue:(id)a3
{
  id v6 = a3;
  id v4 = [(DBGEnumValue *)self enumValue];
  if (v4)
  {
    id v5 = [(DBGEnumValue *)self enumValue];
    objc_opt_class();
    objc_opt_isKindOfClass();
  }
  [(DBGEnumValue *)self setEnumValue:v6];
}

- (NSString)description
{
  v2 = [(DBGEnumValue *)self objectValue];
  v3 = [v2 description];

  return (NSString *)v3;
}

- (NSString)debugDescription
{
  v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  id v5 = [(DBGEnumValue *)self description];
  id v6 = +[NSString stringWithFormat:@"<%@: %p %@>", v4, self, v5];

  return (NSString *)v6;
}

- (id)enumValue
{
  return objc_getProperty(self, a2, 8, 1);
}

- (void)setEnumValue:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (id)valueWithEncodedValue:(id)a3 format:(id)a4 error:(id *)a5
{
  id v7 = DBGDecodeValueFromJSONCompatibleValue();
  id v8 = 0;
  if (v8)
  {

    id v7 = 0;
    if (a5) {
      *a5 = v8;
    }
  }
  objc_super v9 = [a1 withValue:v7];

  return v9;
}

@end