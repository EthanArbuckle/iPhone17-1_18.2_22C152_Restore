@interface DBGCGFloat
+ (id)valueWithEncodedValue:(id)a3 format:(id)a4 error:(id *)a5;
+ (id)withValue:(double)a3;
- (BOOL)backingTypeIsDouble;
- (DBGCGFloat)initWithCGFloat:(double)a3;
- (NSString)debugDescription;
- (NSString)description;
- (double)CGFloatValue;
- (double)doubleValue;
- (float)floatValue;
- (id)JSONCompatibleRepresentation;
- (id)objectValue;
- (void)setBackingTypeIsDouble:(BOOL)a3;
- (void)setCGFloatValue:(double)a3;
- (void)setDoubleValue:(double)a3;
- (void)setFloatValue:(float)a3;
@end

@implementation DBGCGFloat

- (double)CGFloatValue
{
  if ([(DBGCGFloat *)self backingTypeIsDouble])
  {
    [(DBGCGFloat *)self doubleValue];
  }
  else
  {
    [(DBGCGFloat *)self floatValue];
    return v4;
  }
  return result;
}

- (void)setCGFloatValue:(double)a3
{
  if ([(DBGCGFloat *)self backingTypeIsDouble])
  {
    [(DBGCGFloat *)self setDoubleValue:a3];
  }
  else
  {
    *(float *)&double v5 = a3;
    [(DBGCGFloat *)self setFloatValue:v5];
  }
}

+ (id)withValue:(double)a3
{
  id v3 = [objc_alloc((Class)a1) initWithCGFloat:a3];

  return v3;
}

- (DBGCGFloat)initWithCGFloat:(double)a3
{
  v7.receiver = self;
  v7.super_class = (Class)DBGCGFloat;
  float v4 = [(DBGCGFloat *)&v7 init];
  double v5 = v4;
  if (v4)
  {
    v4->_backingTypeIsDouble = 1;
    [(DBGCGFloat *)v4 setCGFloatValue:a3];
  }
  return v5;
}

- (id)objectValue
{
  [(DBGCGFloat *)self CGFloatValue];

  return +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
}

- (NSString)description
{
  v2 = [(DBGCGFloat *)self objectValue];
  id v3 = [v2 description];

  return (NSString *)v3;
}

- (NSString)debugDescription
{
  id v3 = (objc_class *)objc_opt_class();
  float v4 = NSStringFromClass(v3);
  double v5 = [(DBGCGFloat *)self description];
  v6 = +[NSString stringWithFormat:@"<%@: %p %@>", v4, self, v5];

  return (NSString *)v6;
}

- (BOOL)backingTypeIsDouble
{
  return self->_backingTypeIsDouble;
}

- (void)setBackingTypeIsDouble:(BOOL)a3
{
  self->_backingTypeIsDouble = a3;
}

- (double)doubleValue
{
  return self->_doubleValue;
}

- (void)setDoubleValue:(double)a3
{
  self->_doubleValue = a3;
}

- (float)floatValue
{
  return self->_floatValue;
}

- (void)setFloatValue:(float)a3
{
  self->_floatValue = a3;
}

+ (id)valueWithEncodedValue:(id)a3 format:(id)a4 error:(id *)a5
{
  id v8 = a3;
  if (![a4 isEqualToString:@"CGf"]) {
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
    [v8 dbgCGFloatValue];
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
  [(DBGCGFloat *)self CGFloatValue];
  v2 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  id v3 = [v2 dbgStringForType:@"CGf" error:0];

  return v3;
}

@end