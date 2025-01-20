@interface DBGUnsignedInteger
+ (id)valueWithEncodedValue:(id)a3 format:(id)a4 error:(id *)a5;
+ (id)withValue:(unint64_t)a3;
- (BOOL)backingTypeIsUnsignedLong;
- (DBGUnsignedInteger)initWithUnsignedInteger:(unint64_t)a3;
- (NSString)debugDescription;
- (NSString)description;
- (id)JSONCompatibleRepresentation;
- (id)objectValue;
- (unint64_t)unsignedIntegerValue;
- (void)setBackingTypeIsUnsignedLong:(BOOL)a3;
- (void)setUnsignedIntegerValue:(unint64_t)a3;
@end

@implementation DBGUnsignedInteger

+ (id)withValue:(unint64_t)a3
{
  id v3 = [objc_alloc((Class)a1) initWithUnsignedInteger:a3];

  return v3;
}

- (DBGUnsignedInteger)initWithUnsignedInteger:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)DBGUnsignedInteger;
  result = [(DBGUnsignedInteger *)&v5 init];
  if (result) {
    result->_unsignedIntegerValue = a3;
  }
  return result;
}

- (id)objectValue
{
  unint64_t v2 = [(DBGUnsignedInteger *)self unsignedIntegerValue];

  return +[NSNumber numberWithUnsignedInteger:v2];
}

- (NSString)description
{
  unint64_t v2 = [(DBGUnsignedInteger *)self objectValue];
  id v3 = [v2 description];

  return (NSString *)v3;
}

- (NSString)debugDescription
{
  id v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  objc_super v5 = [(DBGUnsignedInteger *)self description];
  v6 = +[NSString stringWithFormat:@"<%@: %p %@>", v4, self, v5];

  return (NSString *)v6;
}

- (unint64_t)unsignedIntegerValue
{
  return self->_unsignedIntegerValue;
}

- (void)setUnsignedIntegerValue:(unint64_t)a3
{
  self->_unsignedIntegerValue = a3;
}

- (BOOL)backingTypeIsUnsignedLong
{
  return self->_backingTypeIsUnsignedLong;
}

- (void)setBackingTypeIsUnsignedLong:(BOOL)a3
{
  self->_backingTypeIsUnsignedLong = a3;
}

+ (id)valueWithEncodedValue:(id)a3 format:(id)a4 error:(id *)a5
{
  id v8 = a3;
  if ([a4 isEqualToString:@"uinteger"])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v9 = [v8 unsignedIntegerValue];
LABEL_6:
      id v10 = v9;
      goto LABEL_10;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v9 = [v8 dbgUnsignedIntegerValue];
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
  unint64_t v2 = +[NSNumber numberWithUnsignedInteger:[(DBGUnsignedInteger *)self unsignedIntegerValue]];
  id v3 = [v2 dbgStringForType:@"uinteger" error:0];

  return v3;
}

@end