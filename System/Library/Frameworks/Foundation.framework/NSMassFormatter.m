@interface NSMassFormatter
- (BOOL)getObjectValue:(id *)obj forString:(NSString *)string errorDescription:(NSString *)error;
- (BOOL)isForPersonMassUse;
- (NSFormattingUnitStyle)unitStyle;
- (NSMassFormatter)init;
- (NSMassFormatter)initWithCoder:(id)a3;
- (NSNumberFormatter)numberFormatter;
- (NSString)stringFromKilograms:(double)numberInKilograms;
- (NSString)stringFromValue:(double)value unit:(NSMassFormatterUnit)unit;
- (NSString)unitStringFromKilograms:(double)numberInKilograms usedUnit:(NSMassFormatterUnit *)unitp;
- (NSString)unitStringFromValue:(double)value unit:(NSMassFormatterUnit)unit;
- (id)attributedStringForObjectValue:(id)a3 withDefaultAttributes:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)stringForObjectValue:(id)a3;
- (int64_t)targetUnitFromKilograms:(double)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)receiveObservedValue:(id)a3;
- (void)setForPersonMassUse:(BOOL)forPersonMassUse;
- (void)setNumberFormatter:(NSNumberFormatter *)numberFormatter;
- (void)setUnitStyle:(NSFormattingUnitStyle)unitStyle;
@end

@implementation NSMassFormatter

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

  return -[NSMassFormatter stringFromKilograms:](self, "stringFromKilograms:");
}

- (id)attributedStringForObjectValue:(id)a3 withDefaultAttributes:(id)a4
{
  if (!a3 || !_NSIsNSNumber()) {
    return 0;
  }
  [a3 doubleValue];
  v7 = -[NSAttributedString initWithString:attributes:]([NSAttributedString alloc], "initWithString:attributes:", -[NSMassFormatter stringFromKilograms:](self, "stringFromKilograms:"), a4);

  return v7;
}

- (int64_t)targetUnitFromKilograms:(double)a3
{
  v4 = [(NSNumberFormatter *)[(NSMassFormatter *)self numberFormatter] locale];
  if (objc_msgSend(-[NSLocale objectForKey:](v4, "objectForKey:", *MEMORY[0x1E4F1C490]), "BOOLValue")) {
    v5 = &metric_units_0;
  }
  else {
    v5 = &us_units_0;
  }
  v6 = (double *)malloc_type_malloc(0x20uLL, 0x1000040451B5BE8uLL);
  v7 = v6;
  uint64_t v8 = 0;
  char v9 = 1;
  do
  {
    char v10 = v9;
    uint64_t v11 = v5[v8];
    if (v11 <= 1536)
    {
      double v12 = a3 / 0.001;
      if (v11 != 11)
      {
        if (v11 == 14) {
          double v12 = a3;
        }
        else {
          double v12 = 0.0;
        }
      }
    }
    else
    {
      if (v11 == 1539) {
        double v12 = a3 * 0.15747;
      }
      else {
        double v12 = 0.0;
      }
      if (v11 == 1538) {
        double v12 = a3 * 2.20462262;
      }
      if (v11 == 1537) {
        double v12 = a3 * 35.273962;
      }
    }
    char v9 = 0;
    v13 = &v6[2 * v8];
    double *v13 = v12;
    *((void *)v13 + 1) = v11;
    uint64_t v8 = 1;
  }
  while ((v10 & 1) != 0);
  qsort(v6, 2uLL, 0x10uLL, (int (__cdecl *)(const void *, const void *))compare_0);
  int64_t v14 = *(void *)&v7[2 * (*v7 <= 1.0) + 1];
  free(v7);
  return v14;
}

- (NSMassFormatter)init
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v4.receiver = self;
  v4.super_class = (Class)NSMassFormatter;
  v2 = [(NSMassFormatter *)&v4 init];
  if (v2) {
    v2->_unitFormatter = objc_alloc_init(NSUnitFormatter);
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)NSMassFormatter;
  [(NSMassFormatter *)&v3 dealloc];
}

- (NSNumberFormatter)numberFormatter
{
  return [(NSUnitFormatter *)self->_unitFormatter numberFormatter];
}

- (void)setNumberFormatter:(NSNumberFormatter *)numberFormatter
{
}

- (NSFormattingUnitStyle)unitStyle
{
  return [(NSUnitFormatter *)self->_unitFormatter unitStyle];
}

- (void)setUnitStyle:(NSFormattingUnitStyle)unitStyle
{
}

- (NSString)unitStringFromKilograms:(double)numberInKilograms usedUnit:(NSMassFormatterUnit *)unitp
{
  NSMassFormatterUnit v7 = -[NSMassFormatter targetUnitFromKilograms:](self, "targetUnitFromKilograms:");
  double v8 = 0.0;
  if (v7 > 1536)
  {
    if (v7 != NSMassFormatterUnitOunce)
    {
      if (v7 == NSMassFormatterUnitPound)
      {
        double v8 = numberInKilograms * 2.20462262;
      }
      else if (v7 == NSMassFormatterUnitStone)
      {
        double v9 = 0.15747;
        goto LABEL_12;
      }
      if (!unitp) {
        goto LABEL_17;
      }
      goto LABEL_16;
    }
    double v9 = 35.273962;
LABEL_12:
    double v8 = numberInKilograms * v9;
    if (!unitp) {
      goto LABEL_17;
    }
LABEL_16:
    *unitp = v7;
    goto LABEL_17;
  }
  if (v7 == NSMassFormatterUnitGram)
  {
    double v8 = numberInKilograms / 0.001;
    if (unitp) {
      goto LABEL_16;
    }
  }
  else
  {
    if (v7 == NSMassFormatterUnitKilogram) {
      double v8 = numberInKilograms;
    }
    if (unitp) {
      goto LABEL_16;
    }
  }
LABEL_17:

  return [(NSMassFormatter *)self unitStringFromValue:v7 unit:v8];
}

- (NSString)unitStringFromValue:(double)value unit:(NSMassFormatterUnit)unit
{
  uint64_t v4 = 1538;
  uint64_t v5 = 1539;
  uint64_t v6 = 1540;
  if (unit != NSMassFormatterUnitStone) {
    uint64_t v6 = 0;
  }
  if (unit != NSMassFormatterUnitPound) {
    uint64_t v5 = v6;
  }
  if (unit != NSMassFormatterUnitOunce) {
    uint64_t v4 = v5;
  }
  uint64_t v7 = 1536;
  uint64_t v8 = 1537;
  if (unit != NSMassFormatterUnitKilogram) {
    uint64_t v8 = 0;
  }
  if (unit != NSMassFormatterUnitGram) {
    uint64_t v7 = v8;
  }
  if (unit <= 1536) {
    uint64_t v9 = v7;
  }
  else {
    uint64_t v9 = v4;
  }
  return (NSString *)[(NSUnitFormatter *)self->_unitFormatter unitStringFromValue:v9 unit:value];
}

- (NSString)stringFromKilograms:(double)numberInKilograms
{
  uint64_t v5 = -[NSMassFormatter targetUnitFromKilograms:](self, "targetUnitFromKilograms:");
  double v6 = 0.0;
  if (v5 <= 1536)
  {
    if (v5 == 11)
    {
      double v6 = numberInKilograms / 0.001;
    }
    else if (v5 == 14)
    {
      double v6 = numberInKilograms;
    }
  }
  else
  {
    switch(v5)
    {
      case 1537:
        double v7 = 35.273962;
        break;
      case 1538:
        double v7 = 2.20462262;
        break;
      case 1539:
        double v7 = 0.15747;
        break;
      default:
        goto LABEL_14;
    }
    double v6 = numberInKilograms * v7;
  }
LABEL_14:

  return [(NSMassFormatter *)self stringFromValue:v5 unit:v6];
}

- (NSString)stringFromValue:(double)value unit:(NSMassFormatterUnit)unit
{
  v15[1] = *(long double *)MEMORY[0x1E4F143B8];
  if (unit <= 1536)
  {
    uint64_t v12 = 1537;
    if (unit != NSMassFormatterUnitKilogram) {
      uint64_t v12 = 0;
    }
    if (unit == NSMassFormatterUnitGram) {
      uint64_t v13 = 1536;
    }
    else {
      uint64_t v13 = v12;
    }
  }
  else
  {
    switch(unit)
    {
      case NSMassFormatterUnitOunce:
        uint64_t v13 = 1538;
        break;
      case NSMassFormatterUnitPound:
        uint64_t v13 = 1539;
        break;
      case NSMassFormatterUnitStone:
        v15[0] = 0.0;
        double v6 = modf(value, v15);
        if (v6 > 0.0)
        {
          unitFormatter = self->_unitFormatter;
          double v8 = v15[0];
          double v9 = v6 * 14.0;
          double v10 = v15[0];
          return (NSString *)-[NSUnitFormatter stringForValue1:unit1:value2:unit2:](unitFormatter, "stringForValue1:unit1:value2:unit2:", 1540, 1539, v10, v9, v8);
        }
        uint64_t v13 = 1540;
        break;
      default:
        uint64_t v13 = 0;
        break;
    }
  }
  int64_t v14 = self->_unitFormatter;

  return (NSString *)[(NSUnitFormatter *)v14 stringForValue:v13 unit:value];
}

- (NSMassFormatter)initWithCoder:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (([a3 allowsKeyedCoding] & 1) == 0)
  {

    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"NSMassFormatter cannot be decoded by non-keyed archivers" userInfo:0]);
  }
  v7.receiver = self;
  v7.super_class = (Class)NSMassFormatter;
  uint64_t v5 = [(NSFormatter *)&v7 initWithCoder:a3];
  if (v5)
  {
    v5->_unitFormatter = [[NSUnitFormatter alloc] initWithCoder:a3];
    v5->_isForPersonMassUse = [a3 decodeBoolForKey:@"NS.forPersonMassUse"];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (([a3 allowsKeyedCoding] & 1) == 0) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"NSMassFormatter cannot be encoded by non-keyed archivers" userInfo:0]);
  }
  v5.receiver = self;
  v5.super_class = (Class)NSMassFormatter;
  [(NSFormatter *)&v5 encodeWithCoder:a3];
  [(NSUnitFormatter *)self->_unitFormatter encodeWithCoder:a3];
  if (self->_isForPersonMassUse) {
    [a3 encodeBool:1 forKey:@"NS.forPersonMassUse"];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(void *)(v5 + 8) = [(NSUnitFormatter *)self->_unitFormatter copyWithZone:a3];
  *(unsigned char *)(v5 + 16) = self->_isForPersonMassUse;
  return (id)v5;
}

- (BOOL)isForPersonMassUse
{
  return self->_isForPersonMassUse;
}

- (void)setForPersonMassUse:(BOOL)forPersonMassUse
{
  self->_isForPersonMassUse = forPersonMassUse;
}

- (void)receiveObservedValue:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (a3 && (_NSIsNSNumber() & 1) == 0) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2, self, @"NSObservationFormatterSupport.m", 65, @"Invalid parameter not satisfying: %@", @"!value || _NSIsNSNumber(value)" object file lineNumber description];
  }
  v6.receiver = self;
  v6.super_class = (Class)NSMassFormatter;
  [(NSMassFormatter *)&v6 receiveObservedValue:[(NSMassFormatter *)self stringForObjectValue:a3]];
}

@end