@interface DBGCustomValue
+ (id)valueWithEncodedValue:(id)a3 format:(id)a4 error:(id *)a5;
+ (id)withValue:(id)a3;
- (DBGCustomValue)initWithCustomValue:(id)a3;
- (NSString)description;
- (id)customValue;
- (void)setCustomValue:(id)a3;
@end

@implementation DBGCustomValue

+ (id)withValue:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)a1) initWithCustomValue:v4];

  return v5;
}

- (DBGCustomValue)initWithCustomValue:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DBGCustomValue;
  v6 = [(DBGCustomValue *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong(&v6->_customValue, a3);
  }

  return v7;
}

- (NSString)description
{
  v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  id v5 = [(DBGCustomValue *)self customValue];
  v6 = +[NSString stringWithFormat:@"<%@: %p %@>", v4, self, v5];

  return (NSString *)v6;
}

- (id)customValue
{
  return objc_getProperty(self, a2, 8, 1);
}

- (void)setCustomValue:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (id)valueWithEncodedValue:(id)a3 format:(id)a4 error:(id *)a5
{
  v7 = DBGDecodeValueFromJSONCompatibleValue();
  id v8 = 0;
  if (v8)
  {

    v7 = 0;
    if (a5) {
      *a5 = v8;
    }
  }
  objc_super v9 = [a1 withValue:v7];

  return v9;
}

@end