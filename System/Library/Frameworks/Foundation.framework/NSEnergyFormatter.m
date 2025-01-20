@interface NSEnergyFormatter
- (BOOL)getObjectValue:(id *)obj forString:(NSString *)string errorDescription:(NSString *)error;
- (BOOL)isForFoodEnergyUse;
- (NSEnergyFormatter)init;
- (NSEnergyFormatter)initWithCoder:(id)a3;
- (NSFormattingUnitStyle)unitStyle;
- (NSNumberFormatter)numberFormatter;
- (NSString)stringFromJoules:(double)numberInJoules;
- (NSString)stringFromValue:(double)value unit:(NSEnergyFormatterUnit)unit;
- (NSString)unitStringFromJoules:(double)numberInJoules usedUnit:(NSEnergyFormatterUnit *)unitp;
- (NSString)unitStringFromValue:(double)value unit:(NSEnergyFormatterUnit)unit;
- (id)attributedStringForObjectValue:(id)a3 withDefaultAttributes:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)stringForObjectValue:(id)a3;
- (int64_t)targetUnitFromJoules:(double)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)receiveObservedValue:(id)a3;
- (void)setForFoodEnergyUse:(BOOL)forFoodEnergyUse;
- (void)setNumberFormatter:(NSNumberFormatter *)numberFormatter;
- (void)setUnitStyle:(NSFormattingUnitStyle)unitStyle;
@end

@implementation NSEnergyFormatter

- (void)setUnitStyle:(NSFormattingUnitStyle)unitStyle
{
}

- (void)setForFoodEnergyUse:(BOOL)forFoodEnergyUse
{
  self->_isForFoodEnergyUse = forFoodEnergyUse;
}

- (NSString)unitStringFromValue:(double)value unit:(NSEnergyFormatterUnit)unit
{
  uint64_t v6 = 3075;
  uint64_t v7 = 3072;
  if (unit != NSEnergyFormatterUnitCalorie) {
    uint64_t v7 = 0;
  }
  if (unit != NSEnergyFormatterUnitKilocalorie) {
    uint64_t v6 = v7;
  }
  uint64_t v8 = 3074;
  uint64_t v9 = 3076;
  if (unit != NSEnergyFormatterUnitKilojoule) {
    uint64_t v9 = 0;
  }
  if (unit != NSEnergyFormatterUnitJoule) {
    uint64_t v8 = v9;
  }
  if (unit <= 1792) {
    uint64_t v10 = v8;
  }
  else {
    uint64_t v10 = v6;
  }
  if (((unit == NSEnergyFormatterUnitKilocalorie) & [(NSEnergyFormatter *)self isForFoodEnergyUse]) != 0) {
    uint64_t v11 = 3073;
  }
  else {
    uint64_t v11 = v10;
  }
  unitFormatter = self->_unitFormatter;

  return (NSString *)[(NSUnitFormatter *)unitFormatter unitStringFromValue:v11 unit:value];
}

- (BOOL)isForFoodEnergyUse
{
  return self->_isForFoodEnergyUse;
}

- (void)setNumberFormatter:(NSNumberFormatter *)numberFormatter
{
}

- (NSEnergyFormatter)init
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v4.receiver = self;
  v4.super_class = (Class)NSEnergyFormatter;
  v2 = [(NSEnergyFormatter *)&v4 init];
  if (v2) {
    v2->_unitFormatter = objc_alloc_init(NSUnitFormatter);
  }
  return v2;
}

- (void)receiveObservedValue:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (a3 && (_NSIsNSNumber() & 1) == 0) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2, self, @"NSObservationFormatterSupport.m", 58, @"Invalid parameter not satisfying: %@", @"!value || _NSIsNSNumber(value)" object file lineNumber description];
  }
  v6.receiver = self;
  v6.super_class = (Class)NSEnergyFormatter;
  [(NSEnergyFormatter *)&v6 receiveObservedValue:[(NSEnergyFormatter *)self stringForObjectValue:a3]];
}

- (int64_t)targetUnitFromJoules:(double)a3
{
  objc_super v4 = [(NSNumberFormatter *)[(NSEnergyFormatter *)self numberFormatter] locale];
  if (objc_msgSend(-[NSLocale objectForKey:](v4, "objectForKey:", *MEMORY[0x1E4F1C490]), "BOOLValue")) {
    uint64_t v5 = &metric_units_1;
  }
  else {
    uint64_t v5 = &us_units_1;
  }
  objc_super v6 = (double *)malloc_type_malloc(0x20uLL, 0x1000040451B5BE8uLL);
  uint64_t v7 = v6;
  uint64_t v8 = 0;
  char v9 = 1;
  do
  {
    char v10 = v9;
    uint64_t v11 = v5[v8];
    double v12 = 0.0;
    if (v11 > 1792)
    {
      if (v11 == 1793)
      {
        double v12 = a3 / 4.184;
      }
      else if (v11 == 1794)
      {
        double v12 = a3 / 4184.0;
      }
    }
    else
    {
      double v12 = a3;
      if (v11 != 11)
      {
        double v12 = 0.0;
        if (v11 == 14) {
          double v12 = a3 / 1000.0;
        }
      }
    }
    char v9 = 0;
    v13 = &v6[2 * v8];
    double *v13 = v12;
    *((void *)v13 + 1) = v11;
    uint64_t v8 = 1;
  }
  while ((v10 & 1) != 0);
  qsort(v6, 2uLL, 0x10uLL, (int (__cdecl *)(const void *, const void *))compare_1);
  int64_t v14 = *(void *)&v7[2 * (*v7 <= 1.0) + 1];
  free(v7);
  return v14;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)NSEnergyFormatter;
  [(NSEnergyFormatter *)&v3 dealloc];
}

- (NSNumberFormatter)numberFormatter
{
  return [(NSUnitFormatter *)self->_unitFormatter numberFormatter];
}

- (NSFormattingUnitStyle)unitStyle
{
  return [(NSUnitFormatter *)self->_unitFormatter unitStyle];
}

- (NSString)unitStringFromJoules:(double)numberInJoules usedUnit:(NSEnergyFormatterUnit *)unitp
{
  NSEnergyFormatterUnit v7 = -[NSEnergyFormatter targetUnitFromJoules:](self, "targetUnitFromJoules:");
  double v8 = 0.0;
  if (v7 > 1792)
  {
    if (v7 == NSEnergyFormatterUnitCalorie)
    {
      double v9 = 4.184;
    }
    else
    {
      if (v7 != NSEnergyFormatterUnitKilocalorie) {
        goto LABEL_11;
      }
      double v9 = 4184.0;
    }
  }
  else
  {
    if (v7 == NSEnergyFormatterUnitJoule)
    {
      double v8 = numberInJoules;
      goto LABEL_11;
    }
    if (v7 != NSEnergyFormatterUnitKilojoule) {
      goto LABEL_11;
    }
    double v9 = 1000.0;
  }
  double v8 = numberInJoules / v9;
LABEL_11:
  if (unitp) {
    *unitp = v7;
  }

  return [(NSEnergyFormatter *)self unitStringFromValue:v7 unit:v8];
}

- (NSString)stringFromValue:(double)value unit:(NSEnergyFormatterUnit)unit
{
  uint64_t v6 = 3075;
  uint64_t v7 = 3072;
  if (unit != NSEnergyFormatterUnitCalorie) {
    uint64_t v7 = 0;
  }
  if (unit != NSEnergyFormatterUnitKilocalorie) {
    uint64_t v6 = v7;
  }
  uint64_t v8 = 3074;
  uint64_t v9 = 3076;
  if (unit != NSEnergyFormatterUnitKilojoule) {
    uint64_t v9 = 0;
  }
  if (unit != NSEnergyFormatterUnitJoule) {
    uint64_t v8 = v9;
  }
  if (unit <= 1792) {
    uint64_t v10 = v8;
  }
  else {
    uint64_t v10 = v6;
  }
  if (((unit == NSEnergyFormatterUnitKilocalorie) & [(NSEnergyFormatter *)self isForFoodEnergyUse]) != 0) {
    uint64_t v11 = 3073;
  }
  else {
    uint64_t v11 = v10;
  }
  unitFormatter = self->_unitFormatter;

  return (NSString *)[(NSUnitFormatter *)unitFormatter stringForValue:v11 unit:value];
}

- (NSString)stringFromJoules:(double)numberInJoules
{
  uint64_t v5 = -[NSEnergyFormatter targetUnitFromJoules:](self, "targetUnitFromJoules:");
  double v6 = 0.0;
  if (v5 > 1792)
  {
    if (v5 == 1793)
    {
      double v7 = 4.184;
    }
    else
    {
      if (v5 != 1794) {
        goto LABEL_11;
      }
      double v7 = 4184.0;
    }
  }
  else
  {
    if (v5 == 11)
    {
      double v6 = numberInJoules;
      goto LABEL_11;
    }
    if (v5 != 14) {
      goto LABEL_11;
    }
    double v7 = 1000.0;
  }
  double v6 = numberInJoules / v7;
LABEL_11:

  return [(NSEnergyFormatter *)self stringFromValue:v5 unit:v6];
}

- (BOOL)getObjectValue:(id *)obj forString:(NSString *)string errorDescription:(NSString *)error
{
  return 0;
}

- (id)stringForObjectValue:(id)a3
{
  if (!a3 || !_NSIsNSNumber()) {
    return 0;
  }
  [a3 doubleValue];

  return -[NSEnergyFormatter stringFromJoules:](self, "stringFromJoules:");
}

- (id)attributedStringForObjectValue:(id)a3 withDefaultAttributes:(id)a4
{
  if (!a3 || !_NSIsNSNumber()) {
    return 0;
  }
  [a3 doubleValue];
  double v7 = -[NSAttributedString initWithString:attributes:]([NSAttributedString alloc], "initWithString:attributes:", -[NSEnergyFormatter stringFromJoules:](self, "stringFromJoules:"), a4);

  return v7;
}

- (NSEnergyFormatter)initWithCoder:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (([a3 allowsKeyedCoding] & 1) == 0)
  {

    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"NSEnergyFormatter cannot be decoded by non-keyed archivers" userInfo:0]);
  }
  v7.receiver = self;
  v7.super_class = (Class)NSEnergyFormatter;
  uint64_t v5 = [(NSFormatter *)&v7 initWithCoder:a3];
  if (v5)
  {
    v5->_unitFormatter = [[NSUnitFormatter alloc] initWithCoder:a3];
    v5->_isForFoodEnergyUse = [a3 decodeBoolForKey:@"NS.forFoodEnergyUse"];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (([a3 allowsKeyedCoding] & 1) == 0) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"NSEnergyFormatter cannot be encoded by non-keyed archivers" userInfo:0]);
  }
  v5.receiver = self;
  v5.super_class = (Class)NSEnergyFormatter;
  [(NSFormatter *)&v5 encodeWithCoder:a3];
  [(NSUnitFormatter *)self->_unitFormatter encodeWithCoder:a3];
  if (self->_isForFoodEnergyUse) {
    [a3 encodeBool:1 forKey:@"NS.forFoodEnergyUse"];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(void *)(v5 + 8) = [(NSUnitFormatter *)self->_unitFormatter copyWithZone:a3];
  *(unsigned char *)(v5 + 16) = self->_isForFoodEnergyUse;
  return (id)v5;
}

@end