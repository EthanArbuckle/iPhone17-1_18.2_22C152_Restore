@interface DBGVector2
+ (id)valueWithEncodedValue:(id)a3 format:(id)a4 error:(id *)a5;
+ (id)withVector2:(id)a1;
- (DBGVector2)initWithVector2:(DBGVector2 *)self;
- (NSString)debugDescription;
- (NSString)description;
- (double)vector2;
- (id)JSONCompatibleRepresentation;
- (id)objectValue;
- (void)setVector2:(DBGVector2 *)self;
@end

@implementation DBGVector2

+ (id)withVector2:(id)a1
{
  id v3 = [objc_alloc((Class)a1) initWithVector2:v2];

  return v3;
}

- (DBGVector2)initWithVector2:(DBGVector2 *)self
{
  long long v4 = v2;
  v5.receiver = self;
  v5.super_class = (Class)DBGVector2;
  result = [(DBGVector2 *)&v5 init];
  if (result) {
    *(_OWORD *)result->_vector2 = v4;
  }
  return result;
}

- (id)objectValue
{
  [(DBGVector2 *)self vector2];
  id v3 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v8[0] = v3;
  [(DBGVector2 *)self vector2];
  objc_super v5 = +[NSNumber numberWithDouble:v4];
  v8[1] = v5;
  v6 = +[NSArray arrayWithObjects:v8 count:2];

  return v6;
}

- (NSString)description
{
  long long v2 = [(DBGVector2 *)self objectValue];
  id v3 = [v2 description];

  return (NSString *)v3;
}

- (NSString)debugDescription
{
  id v3 = (objc_class *)objc_opt_class();
  double v4 = NSStringFromClass(v3);
  objc_super v5 = [(DBGVector2 *)self description];
  v6 = +[NSString stringWithFormat:@"<%@: %p %@>", v4, self, v5];

  return (NSString *)v6;
}

- (double)vector2
{
  objc_copyStruct(&v2, (const void *)(a1 + 16), 16, 1, 0);
  return *(double *)&v2;
}

- (void)setVector2:(DBGVector2 *)self
{
  long long v3 = v2;
  objc_copyStruct(self->_vector2, &v3, 16, 1, 0);
}

+ (id)valueWithEncodedValue:(id)a3 format:(id)a4 error:(id *)a5
{
  v7 = DBGDecodeValueFromJSONCompatibleValue();
  id v8 = 0;
  v9 = v8;
  if (v8)
  {
    double v10 = 0.0;
    if (a5)
    {
      id v11 = v8;
      double v10 = 0.0;
      *a5 = v11;
    }
  }
  else
  {
    v12 = [v7 objectAtIndexedSubscript:0];
    [v12 doubleValue];
    double v17 = v13;

    v14 = [v7 objectAtIndexedSubscript:1];
    [v14 doubleValue];

    double v10 = v17;
  }
  v15 = objc_msgSend(a1, "withVector2:", v10, *(void *)&v17);

  return v15;
}

- (id)JSONCompatibleRepresentation
{
  [(DBGVector2 *)self vector2];
  long long v3 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v8[0] = v3;
  [(DBGVector2 *)self vector2];
  objc_super v5 = +[NSNumber numberWithDouble:v4];
  v8[1] = v5;
  v6 = +[NSArray arrayWithObjects:v8 count:2];

  return v6;
}

@end