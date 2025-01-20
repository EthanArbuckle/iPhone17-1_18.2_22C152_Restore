@interface DBGVector3
+ (id)valueWithEncodedValue:(id)a3 format:(id)a4 error:(id *)a5;
+ (id)withVector3:(id)a1;
- (DBGVector3)initWithVector3:(DBGVector3 *)self;
- (NSString)debugDescription;
- (NSString)description;
- (double)vector3;
- (id)JSONCompatibleRepresentation;
- (id)objectValue;
- (void)setVector3:(DBGVector3 *)self;
@end

@implementation DBGVector3

+ (id)withVector3:(id)a1
{
  long long v5 = v2[1];
  v6[0] = *v2;
  v6[1] = v5;
  id v3 = [objc_alloc((Class)a1) initWithVector3:v6];

  return v3;
}

- (DBGVector3)initWithVector3:(DBGVector3 *)self
{
  long long v4 = *v2;
  long long v5 = v2[1];
  v6.receiver = self;
  v6.super_class = (Class)DBGVector3;
  result = [(DBGVector3 *)&v6 init];
  if (result)
  {
    *(_OWORD *)result->_vector3 = v4;
    *(_OWORD *)&result->_vector3[16] = v5;
  }
  return result;
}

- (id)objectValue
{
  [(DBGVector3 *)self vector3];
  id v3 = +[NSNumber numberWithDouble:v10];
  v11[0] = v3;
  [(DBGVector3 *)self vector3];
  long long v4 = +[NSNumber numberWithDouble:v9];
  v11[1] = v4;
  [(DBGVector3 *)self vector3];
  long long v5 = +[NSNumber numberWithDouble:v8];
  v11[2] = v5;
  objc_super v6 = +[NSArray arrayWithObjects:v11 count:3];

  return v6;
}

- (NSString)description
{
  v2 = [(DBGVector3 *)self objectValue];
  id v3 = [v2 description];

  return (NSString *)v3;
}

- (NSString)debugDescription
{
  id v3 = (objc_class *)objc_opt_class();
  long long v4 = NSStringFromClass(v3);
  long long v5 = [(DBGVector3 *)self description];
  objc_super v6 = +[NSString stringWithFormat:@"<%@: %p %@>", v4, self, v5];

  return (NSString *)v6;
}

- (double)vector3
{
  objc_copyStruct(a2, (const void *)(a1 + 16), 32, 1, 0);
  *(void *)&long long v3 = a2[2];
  *((_OWORD *)a2 + 1) = v3;
  return *(double *)&v3;
}

- (void)setVector3:(DBGVector3 *)self
{
  long long v3 = v2[1];
  v4[0] = *v2;
  v4[1] = v3;
  objc_copyStruct(self->_vector3, v4, 32, 1, 0);
}

+ (id)valueWithEncodedValue:(id)a3 format:(id)a4 error:(id *)a5
{
  uint64_t v25 = 0;
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
    v12 = [v7 objectAtIndexedSubscript:0];
    [v12 doubleValue];
    uint64_t v22 = v13;

    v14 = [v7 objectAtIndexedSubscript:1];
    [v14 doubleValue];
    uint64_t v21 = v15;

    v16 = [v7 objectAtIndexedSubscript:2];
    [v16 doubleValue];
    long long v20 = v17;
    *(void *)&long long v17 = v22;
    *((void *)&v17 + 1) = v21;
    long long v23 = v17;

    long long v11 = v20;
    long long v10 = v23;
  }
  v24[0] = v10;
  v24[1] = v11;
  v18 = objc_msgSend(a1, "withVector3:", v24, v20);

  return v18;
}

- (id)JSONCompatibleRepresentation
{
  [(DBGVector3 *)self vector3];
  long long v3 = +[NSNumber numberWithDouble:v10];
  v11[0] = v3;
  [(DBGVector3 *)self vector3];
  long long v4 = +[NSNumber numberWithDouble:v9];
  v11[1] = v4;
  [(DBGVector3 *)self vector3];
  long long v5 = +[NSNumber numberWithDouble:v8];
  v11[2] = v5;
  objc_super v6 = +[NSArray arrayWithObjects:v11 count:3];

  return v6;
}

@end