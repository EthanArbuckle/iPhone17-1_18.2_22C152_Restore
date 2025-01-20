@interface DBGBool
+ (id)valueWithEncodedValue:(id)a3 format:(id)a4 error:(id *)a5;
+ (id)withValue:(BOOL)a3;
- (BOOL)BOOLValue;
- (DBGBool)initWithBool:(BOOL)a3;
- (NSString)debugDescription;
- (NSString)description;
- (id)JSONCompatibleRepresentation;
- (id)objectValue;
- (void)setBoolValue:(BOOL)a3;
@end

@implementation DBGBool

+ (id)withValue:(BOOL)a3
{
  id v3 = [objc_alloc((Class)a1) initWithBool:a3];

  return v3;
}

- (DBGBool)initWithBool:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)DBGBool;
  result = [(DBGBool *)&v5 init];
  if (result) {
    result->_BOOLValue = a3;
  }
  return result;
}

- (id)objectValue
{
  BOOL v2 = [(DBGBool *)self BOOLValue];

  return +[NSNumber numberWithBool:v2];
}

- (NSString)description
{
  BOOL v2 = [(DBGBool *)self objectValue];
  id v3 = [v2 description];

  return (NSString *)v3;
}

- (NSString)debugDescription
{
  id v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  objc_super v5 = [(DBGBool *)self description];
  v6 = +[NSString stringWithFormat:@"<%@: %p %@>", v4, self, v5];

  return (NSString *)v6;
}

- (BOOL)BOOLValue
{
  return self->_BOOLValue;
}

- (void)setBoolValue:(BOOL)a3
{
  self->_BOOLValue = a3;
}

+ (id)valueWithEncodedValue:(id)a3 format:(id)a4 error:(id *)a5
{
  id v8 = a3;
  if ([a4 isEqualToString:@"b"])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v9 = [v8 BOOLValue];
LABEL_6:
      id v10 = v9;
      goto LABEL_10;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v9 = [v8 dbgBoolValue];
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
  BOOL v2 = +[NSNumber numberWithBool:[(DBGBool *)self BOOLValue]];
  id v3 = [v2 dbgStringForType:@"b" error:0];

  return v3;
}

@end