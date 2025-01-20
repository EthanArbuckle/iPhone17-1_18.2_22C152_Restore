@interface DBGLongLong
+ (id)valueWithEncodedValue:(id)a3 format:(id)a4 error:(id *)a5;
+ (id)withValue:(int64_t)a3;
- (DBGLongLong)initWithLongLong:(int64_t)a3;
- (NSString)debugDescription;
- (NSString)description;
- (id)JSONCompatibleRepresentation;
- (id)objectValue;
- (int64_t)longLongValue;
- (void)setLongLongValue:(int64_t)a3;
@end

@implementation DBGLongLong

+ (id)withValue:(int64_t)a3
{
  id v3 = [objc_alloc((Class)a1) initWithLongLong:a3];

  return v3;
}

- (DBGLongLong)initWithLongLong:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)DBGLongLong;
  result = [(DBGLongLong *)&v5 init];
  if (result) {
    result->_longLongValue = a3;
  }
  return result;
}

- (id)objectValue
{
  int64_t v2 = [(DBGLongLong *)self longLongValue];

  return +[NSNumber numberWithLongLong:v2];
}

- (NSString)description
{
  int64_t v2 = [(DBGLongLong *)self objectValue];
  id v3 = [v2 description];

  return (NSString *)v3;
}

- (NSString)debugDescription
{
  id v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  objc_super v5 = [(DBGLongLong *)self description];
  v6 = +[NSString stringWithFormat:@"<%@: %p %@>", v4, self, v5];

  return (NSString *)v6;
}

- (int64_t)longLongValue
{
  return self->_longLongValue;
}

- (void)setLongLongValue:(int64_t)a3
{
  self->_longLongValue = a3;
}

+ (id)valueWithEncodedValue:(id)a3 format:(id)a4 error:(id *)a5
{
  id v8 = a3;
  if ([a4 isEqualToString:@"ll"])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v9 = [v8 longLongValue];
LABEL_6:
      id v10 = v9;
      goto LABEL_10;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v9 = [v8 dbgLongLongValue];
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
  int64_t v2 = +[NSNumber numberWithLongLong:[(DBGLongLong *)self longLongValue]];
  id v3 = [v2 dbgStringForType:@"ll" error:0];

  return v3;
}

@end