@interface DBGDouble
+ (id)valueWithEncodedValue:(id)a3 format:(id)a4 error:(id *)a5;
+ (id)withValue:(double)a3;
- (DBGDouble)initWithDouble:(double)a3;
- (NSString)debugDescription;
- (NSString)description;
- (double)doubleValue;
- (id)JSONCompatibleRepresentation;
- (id)objectValue;
- (void)setDoubleValue:(double)a3;
@end

@implementation DBGDouble

+ (id)withValue:(double)a3
{
  id v3 = [objc_alloc((Class)a1) initWithDouble:a3];

  return v3;
}

- (DBGDouble)initWithDouble:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)DBGDouble;
  result = [(DBGDouble *)&v5 init];
  if (result) {
    result->_doubleValue = a3;
  }
  return result;
}

- (id)objectValue
{
  [(DBGDouble *)self doubleValue];

  return +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
}

- (NSString)description
{
  v2 = [(DBGDouble *)self objectValue];
  id v3 = [v2 description];

  return (NSString *)v3;
}

- (NSString)debugDescription
{
  id v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  objc_super v5 = [(DBGDouble *)self description];
  v6 = +[NSString stringWithFormat:@"<%@: %p %@>", v4, self, v5];

  return (NSString *)v6;
}

- (double)doubleValue
{
  return self->_doubleValue;
}

- (void)setDoubleValue:(double)a3
{
  self->_doubleValue = a3;
}

+ (id)valueWithEncodedValue:(id)a3 format:(id)a4 error:(id *)a5
{
  id v8 = a3;
  if (![a4 isEqualToString:@"d"]) {
    goto LABEL_6;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v8 doubleValue];
    goto LABEL_9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v8 dbgDoubleValue];
  }
  else
  {
LABEL_6:
    double v9 = 0.0;
    if (!v8 && a5) {
      *a5 = 0;
    }
  }
LABEL_9:
  v10 = [a1 withValue:v9];

  return v10;
}

- (id)JSONCompatibleRepresentation
{
  [(DBGDouble *)self doubleValue];
  v2 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  id v3 = [v2 dbgStringForType:@"d" error:0];

  return v3;
}

@end