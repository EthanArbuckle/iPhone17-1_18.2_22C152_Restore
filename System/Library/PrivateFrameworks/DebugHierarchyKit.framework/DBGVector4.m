@interface DBGVector4
+ (id)valueWithEncodedValue:(id)a3 format:(id)a4 error:(id *)a5;
+ (id)withVector4:(id)a1;
- (DBGVector4)initWithVector4:(DBGVector4 *)self;
- (NSString)debugDescription;
- (NSString)description;
- (id)JSONCompatibleRepresentation;
- (id)objectValue;
- (void)setVector4:(DBGVector4 *)self;
- (void)vector4;
@end

@implementation DBGVector4

+ (id)withVector4:(id)a1
{
  long long v5 = v2[1];
  v6[0] = *v2;
  v6[1] = v5;
  id v3 = [objc_alloc((Class)a1) initWithVector4:v6];

  return v3;
}

- (DBGVector4)initWithVector4:(DBGVector4 *)self
{
  long long v4 = *v2;
  long long v5 = v2[1];
  v6.receiver = self;
  v6.super_class = (Class)DBGVector4;
  result = [(DBGVector4 *)&v6 init];
  if (result)
  {
    *(_OWORD *)result->_vector4 = v4;
    *(_OWORD *)&result->_vector4[16] = v5;
  }
  return result;
}

- (id)objectValue
{
  [(DBGVector4 *)self vector4];
  id v3 = +[NSNumber numberWithDouble:v12];
  v13[0] = v3;
  [(DBGVector4 *)self vector4];
  long long v4 = +[NSNumber numberWithDouble:v11];
  v13[1] = v4;
  [(DBGVector4 *)self vector4];
  long long v5 = +[NSNumber numberWithDouble:v10];
  v13[2] = v5;
  [(DBGVector4 *)self vector4];
  objc_super v6 = +[NSNumber numberWithDouble:v9];
  v13[3] = v6;
  v7 = +[NSArray arrayWithObjects:v13 count:4];

  return v7;
}

- (NSString)description
{
  v2 = [(DBGVector4 *)self objectValue];
  id v3 = [v2 description];

  return (NSString *)v3;
}

- (NSString)debugDescription
{
  id v3 = (objc_class *)objc_opt_class();
  long long v4 = NSStringFromClass(v3);
  long long v5 = [(DBGVector4 *)self description];
  objc_super v6 = +[NSString stringWithFormat:@"<%@: %p %@>", v4, self, v5];

  return (NSString *)v6;
}

- (void)vector4
{
}

- (void)setVector4:(DBGVector4 *)self
{
  long long v3 = v2[1];
  v4[0] = *v2;
  v4[1] = v3;
  objc_copyStruct(self->_vector4, v4, 32, 1, 0);
}

+ (id)valueWithEncodedValue:(id)a3 format:(id)a4 error:(id *)a5
{
  uint64_t v29 = 0;
  v7 = DBGDecodeValueFromJSONCompatibleValue();
  id v8 = 0;
  double v9 = v8;
  if (v8)
  {
    if (a5) {
      *a5 = v8;
    }
    long long v10 = 0uLL;
    long long v11 = 0uLL;
  }
  else
  {
    double v12 = [v7 objectAtIndexedSubscript:0];
    [v12 doubleValue];
    uint64_t v26 = v13;

    v14 = [v7 objectAtIndexedSubscript:1];
    [v14 doubleValue];
    long long v23 = v15;

    v16 = [v7 objectAtIndexedSubscript:2];
    [v16 doubleValue];
    uint64_t v24 = v17;

    v18 = [v7 objectAtIndexedSubscript:3];
    [v18 doubleValue];
    *(void *)&long long v19 = v26;
    *((void *)&v19 + 1) = v23;
    long long v27 = v19;
    *(void *)&long long v19 = v24;
    *((void *)&v19 + 1) = v20;
    long long v25 = v19;

    long long v11 = v25;
    long long v10 = v27;
  }
  v28[0] = v10;
  v28[1] = v11;
  v21 = objc_msgSend(a1, "withVector4:", v28, v23);

  return v21;
}

- (id)JSONCompatibleRepresentation
{
  [(DBGVector4 *)self vector4];
  long long v3 = +[NSNumber numberWithDouble:v12];
  v13[0] = v3;
  [(DBGVector4 *)self vector4];
  long long v4 = +[NSNumber numberWithDouble:v11];
  v13[1] = v4;
  [(DBGVector4 *)self vector4];
  long long v5 = +[NSNumber numberWithDouble:v10];
  v13[2] = v5;
  [(DBGVector4 *)self vector4];
  objc_super v6 = +[NSNumber numberWithDouble:v9];
  v13[3] = v6;
  v7 = +[NSArray arrayWithObjects:v13 count:4];

  return v7;
}

@end