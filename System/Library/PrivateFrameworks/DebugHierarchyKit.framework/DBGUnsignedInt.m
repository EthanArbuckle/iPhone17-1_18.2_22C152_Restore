@interface DBGUnsignedInt
+ (id)valueWithEncodedValue:(id)a3 format:(id)a4 error:(id *)a5;
+ (id)withValue:(unsigned int)a3;
- (DBGUnsignedInt)initWithUnsignedInt:(unsigned int)a3;
- (NSString)debugDescription;
- (NSString)description;
- (id)JSONCompatibleRepresentation;
- (id)objectValue;
- (unsigned)unsignedIntValue;
- (void)setUnsignedIntValue:(unsigned int)a3;
@end

@implementation DBGUnsignedInt

+ (id)withValue:(unsigned int)a3
{
  id v3 = [objc_alloc((Class)a1) initWithUnsignedInt:*(void *)&a3];

  return v3;
}

- (DBGUnsignedInt)initWithUnsignedInt:(unsigned int)a3
{
  v5.receiver = self;
  v5.super_class = (Class)DBGUnsignedInt;
  result = [(DBGUnsignedInt *)&v5 init];
  if (result) {
    result->_unsignedIntValue = a3;
  }
  return result;
}

- (id)objectValue
{
  uint64_t v2 = [(DBGUnsignedInt *)self unsignedIntValue];

  return +[NSNumber numberWithUnsignedInt:v2];
}

- (NSString)description
{
  uint64_t v2 = [(DBGUnsignedInt *)self objectValue];
  id v3 = [v2 description];

  return (NSString *)v3;
}

- (NSString)debugDescription
{
  id v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  objc_super v5 = [(DBGUnsignedInt *)self description];
  v6 = +[NSString stringWithFormat:@"<%@: %p %@>", v4, self, v5];

  return (NSString *)v6;
}

- (unsigned)unsignedIntValue
{
  return self->_unsignedIntValue;
}

- (void)setUnsignedIntValue:(unsigned int)a3
{
  self->_unsignedIntValue = a3;
}

+ (id)valueWithEncodedValue:(id)a3 format:(id)a4 error:(id *)a5
{
  id v8 = a3;
  if ([a4 isEqualToString:@"ui"])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v9 = [v8 unsignedIntValue];
LABEL_6:
      id v10 = v9;
      goto LABEL_10;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v9 = [v8 dbgUnsignedIntValue];
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
  uint64_t v2 = +[NSNumber numberWithUnsignedInt:[(DBGUnsignedInt *)self unsignedIntValue]];
  id v3 = [v2 dbgStringForType:@"ui" error:0];

  return v3;
}

@end