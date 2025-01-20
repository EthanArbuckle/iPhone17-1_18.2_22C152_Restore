@interface DBGUnsignedLong
+ (id)valueWithEncodedValue:(id)a3 format:(id)a4 error:(id *)a5;
+ (id)withValue:(unint64_t)a3;
- (DBGUnsignedLong)initWithUnsignedLong:(unint64_t)a3;
- (NSString)debugDescription;
- (NSString)description;
- (id)JSONCompatibleRepresentation;
- (id)objectValue;
- (unint64_t)unsignedLongValue;
- (void)setUnsignedLongValue:(unint64_t)a3;
@end

@implementation DBGUnsignedLong

+ (id)withValue:(unint64_t)a3
{
  id v3 = [objc_alloc((Class)a1) initWithUnsignedLong:a3];

  return v3;
}

- (DBGUnsignedLong)initWithUnsignedLong:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)DBGUnsignedLong;
  result = [(DBGUnsignedLong *)&v5 init];
  if (result) {
    result->_unsignedLongValue = a3;
  }
  return result;
}

- (id)objectValue
{
  unint64_t v2 = [(DBGUnsignedLong *)self unsignedLongValue];

  return +[NSNumber numberWithUnsignedLong:v2];
}

- (NSString)description
{
  unint64_t v2 = [(DBGUnsignedLong *)self objectValue];
  id v3 = [v2 description];

  return (NSString *)v3;
}

- (NSString)debugDescription
{
  id v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  objc_super v5 = [(DBGUnsignedLong *)self description];
  v6 = +[NSString stringWithFormat:@"<%@: %p %@>", v4, self, v5];

  return (NSString *)v6;
}

- (unint64_t)unsignedLongValue
{
  return self->_unsignedLongValue;
}

- (void)setUnsignedLongValue:(unint64_t)a3
{
  self->_unsignedLongValue = a3;
}

+ (id)valueWithEncodedValue:(id)a3 format:(id)a4 error:(id *)a5
{
  id v8 = a3;
  if ([a4 isEqualToString:@"ul"])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v9 = [v8 unsignedLongValue];
LABEL_6:
      id v10 = v9;
      goto LABEL_10;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v9 = [v8 dbgUnsignedLongValue];
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
  unint64_t v2 = +[NSNumber numberWithUnsignedLong:[(DBGUnsignedLong *)self unsignedLongValue]];
  id v3 = [v2 dbgStringForType:@"ul" error:0];

  return v3;
}

@end