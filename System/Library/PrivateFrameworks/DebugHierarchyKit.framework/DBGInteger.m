@interface DBGInteger
+ (id)valueWithEncodedValue:(id)a3 format:(id)a4 error:(id *)a5;
+ (id)withValue:(int64_t)a3;
- (BOOL)backingTypeIsLong;
- (DBGInteger)initWithInteger:(int64_t)a3;
- (NSString)debugDescription;
- (NSString)description;
- (id)JSONCompatibleRepresentation;
- (id)objectValue;
- (int64_t)integerValue;
- (void)setBackingTypeIsLong:(BOOL)a3;
- (void)setIntegerValue:(int64_t)a3;
@end

@implementation DBGInteger

+ (id)withValue:(int64_t)a3
{
  id v3 = [objc_alloc((Class)a1) initWithInteger:a3];

  return v3;
}

- (DBGInteger)initWithInteger:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)DBGInteger;
  result = [(DBGInteger *)&v5 init];
  if (result) {
    result->_integerValue = a3;
  }
  return result;
}

- (id)objectValue
{
  int64_t v2 = [(DBGInteger *)self integerValue];

  return +[NSNumber numberWithInteger:v2];
}

- (NSString)description
{
  int64_t v2 = [(DBGInteger *)self objectValue];
  id v3 = [v2 description];

  return (NSString *)v3;
}

- (NSString)debugDescription
{
  id v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  objc_super v5 = [(DBGInteger *)self description];
  v6 = +[NSString stringWithFormat:@"<%@: %p %@>", v4, self, v5];

  return (NSString *)v6;
}

- (int64_t)integerValue
{
  return self->_integerValue;
}

- (void)setIntegerValue:(int64_t)a3
{
  self->_integerValue = a3;
}

- (BOOL)backingTypeIsLong
{
  return self->_backingTypeIsLong;
}

- (void)setBackingTypeIsLong:(BOOL)a3
{
  self->_backingTypeIsLong = a3;
}

+ (id)valueWithEncodedValue:(id)a3 format:(id)a4 error:(id *)a5
{
  id v8 = a3;
  if ([a4 isEqualToString:@"integer"])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v9 = [v8 integerValue];
LABEL_6:
      id v10 = v9;
      goto LABEL_10;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v9 = [v8 dbgIntegerValue];
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
  int64_t v2 = +[NSNumber numberWithInteger:[(DBGInteger *)self integerValue]];
  id v3 = [v2 dbgStringForType:@"integer" error:0];

  return v3;
}

@end