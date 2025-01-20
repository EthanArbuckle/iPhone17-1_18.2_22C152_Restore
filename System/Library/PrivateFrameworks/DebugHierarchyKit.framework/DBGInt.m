@interface DBGInt
+ (id)valueWithEncodedValue:(id)a3 format:(id)a4 error:(id *)a5;
+ (id)withValue:(int)a3;
- (DBGInt)initWithInt:(int)a3;
- (NSString)debugDescription;
- (NSString)description;
- (id)JSONCompatibleRepresentation;
- (id)objectValue;
- (int)intValue;
- (void)setIntValue:(int)a3;
@end

@implementation DBGInt

+ (id)withValue:(int)a3
{
  id v3 = [objc_alloc((Class)a1) initWithInt:*(void *)&a3];

  return v3;
}

- (DBGInt)initWithInt:(int)a3
{
  v5.receiver = self;
  v5.super_class = (Class)DBGInt;
  result = [(DBGInt *)&v5 init];
  if (result) {
    result->_intValue = a3;
  }
  return result;
}

- (id)objectValue
{
  uint64_t v2 = [(DBGInt *)self intValue];

  return +[NSNumber numberWithInt:v2];
}

- (NSString)description
{
  uint64_t v2 = [(DBGInt *)self objectValue];
  id v3 = [v2 description];

  return (NSString *)v3;
}

- (NSString)debugDescription
{
  id v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  objc_super v5 = [(DBGInt *)self description];
  v6 = +[NSString stringWithFormat:@"<%@: %p %@>", v4, self, v5];

  return (NSString *)v6;
}

- (int)intValue
{
  return self->_intValue;
}

- (void)setIntValue:(int)a3
{
  self->_intValue = a3;
}

+ (id)valueWithEncodedValue:(id)a3 format:(id)a4 error:(id *)a5
{
  id v8 = a3;
  if ([a4 isEqualToString:@"i"])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v9 = [v8 intValue];
LABEL_6:
      id v10 = v9;
      goto LABEL_10;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v9 = [v8 dbgIntValue];
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
  uint64_t v2 = +[NSNumber numberWithInt:[(DBGInt *)self intValue]];
  id v3 = [v2 dbgStringForType:@"i" error:0];

  return v3;
}

@end