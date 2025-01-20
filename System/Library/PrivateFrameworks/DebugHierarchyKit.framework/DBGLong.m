@interface DBGLong
+ (id)valueWithEncodedValue:(id)a3 format:(id)a4 error:(id *)a5;
+ (id)withValue:(int64_t)a3;
- (DBGLong)initWithLong:(int64_t)a3;
- (NSString)debugDescription;
- (NSString)description;
- (id)JSONCompatibleRepresentation;
- (id)objectValue;
- (int64_t)longValue;
- (void)setLongValue:(int64_t)a3;
@end

@implementation DBGLong

+ (id)withValue:(int64_t)a3
{
  id v3 = [objc_alloc((Class)a1) initWithLong:a3];

  return v3;
}

- (DBGLong)initWithLong:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)DBGLong;
  result = [(DBGLong *)&v5 init];
  if (result) {
    result->_longValue = a3;
  }
  return result;
}

- (id)objectValue
{
  int64_t v2 = [(DBGLong *)self longValue];

  return +[NSNumber numberWithLong:v2];
}

- (NSString)description
{
  int64_t v2 = [(DBGLong *)self objectValue];
  id v3 = [v2 description];

  return (NSString *)v3;
}

- (NSString)debugDescription
{
  id v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  objc_super v5 = [(DBGLong *)self description];
  v6 = +[NSString stringWithFormat:@"<%@: %p %@>", v4, self, v5];

  return (NSString *)v6;
}

- (int64_t)longValue
{
  return self->_longValue;
}

- (void)setLongValue:(int64_t)a3
{
  self->_longValue = a3;
}

+ (id)valueWithEncodedValue:(id)a3 format:(id)a4 error:(id *)a5
{
  id v8 = a3;
  if ([a4 isEqualToString:@"l"])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v9 = [v8 longValue];
LABEL_6:
      id v10 = v9;
      goto LABEL_10;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v9 = [v8 dbgLongValue];
      goto LABEL_6;
    }
  }
  id v10 = 0;
  if (!v8 && a5)
  {
    id v10 = 0;
    *a5 = 0;
  }
LABEL_10:
  v11 = [a1 withValue:v10];

  return v11;
}

- (id)JSONCompatibleRepresentation
{
  int64_t v2 = +[NSNumber numberWithLong:[(DBGLong *)self longValue]];
  id v3 = [v2 dbgStringForType:@"l" error:0];

  return v3;
}

@end