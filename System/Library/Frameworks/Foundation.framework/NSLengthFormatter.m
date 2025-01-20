@interface NSLengthFormatter
- (BOOL)getObjectValue:(id *)obj forString:(NSString *)string errorDescription:(NSString *)error;
- (BOOL)isForPersonHeightUse;
- (NSFormattingUnitStyle)unitStyle;
- (NSLengthFormatter)init;
- (NSLengthFormatter)initWithCoder:(id)a3;
- (NSNumberFormatter)numberFormatter;
- (NSString)stringFromMeters:(double)numberInMeters;
- (NSString)stringFromValue:(double)value unit:(NSLengthFormatterUnit)unit;
- (NSString)unitStringFromMeters:(double)numberInMeters usedUnit:(NSLengthFormatterUnit *)unitp;
- (NSString)unitStringFromValue:(double)value unit:(NSLengthFormatterUnit)unit;
- (id)attributedStringForObjectValue:(id)a3 withDefaultAttributes:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)stringForObjectValue:(id)a3;
- (int64_t)targetUnitFromMeters:(double)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)receiveObservedValue:(id)a3;
- (void)setForPersonHeightUse:(BOOL)forPersonHeightUse;
- (void)setNumberFormatter:(NSNumberFormatter *)numberFormatter;
- (void)setUnitStyle:(NSFormattingUnitStyle)unitStyle;
@end

@implementation NSLengthFormatter

- (void)setUnitStyle:(NSFormattingUnitStyle)unitStyle
{
}

- (void)setNumberFormatter:(NSNumberFormatter *)numberFormatter
{
}

- (NSLengthFormatter)init
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v4.receiver = self;
  v4.super_class = (Class)NSLengthFormatter;
  v2 = [(NSLengthFormatter *)&v4 init];
  if (v2) {
    v2->_unitFormatter = objc_alloc_init(NSUnitFormatter);
  }
  return v2;
}

- (NSString)unitStringFromValue:(double)value unit:(NSLengthFormatterUnit)unit
{
  uint64_t v7 = 0;
  if (!v5 & v4)
  {
    switch(unit)
    {
      case NSLengthFormatterUnitInch:
        uint64_t v7 = 1286;
        break;
      case NSLengthFormatterUnitFoot:
        uint64_t v7 = 1285;
        break;
      case NSLengthFormatterUnitYard:
        uint64_t v7 = 1288;
        break;
      case NSLengthFormatterUnitMile:
        uint64_t v7 = 1287;
        break;
      default:
        return (NSString *)[(NSUnitFormatter *)self->_unitFormatter unitStringFromValue:v7 unit:value];
    }
  }
  else
  {
    switch(unit)
    {
      case 8:
        uint64_t v7 = 1283;
        break;
      case 9:
        uint64_t v7 = 1281;
        break;
      case 10:
      case 12:
      case 13:
        return (NSString *)[(NSUnitFormatter *)self->_unitFormatter unitStringFromValue:v7 unit:value];
      case 11:
        uint64_t v7 = 1280;
        break;
      case 14:
        uint64_t v7 = 1282;
        break;
      default:
        JUMPOUT(0);
    }
  }
  return (NSString *)[(NSUnitFormatter *)self->_unitFormatter unitStringFromValue:v7 unit:value];
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)NSLengthFormatter;
  [(NSLengthFormatter *)&v3 dealloc];
}

- (int64_t)targetUnitFromMeters:(double)a3
{
  char v5 = [(NSNumberFormatter *)[(NSLengthFormatter *)self numberFormatter] locale];
  int v6 = objc_msgSend(-[NSLocale objectForKey:](v5, "objectForKey:", *MEMORY[0x1E4F1C490]), "BOOLValue");
  if ([(NSLengthFormatter *)self isForPersonHeightUse])
  {
    if (v6 && ![(NSString *)[(NSLocale *)v5 localeIdentifier] isEqual:@"en_GB"]) {
      return 9;
    }
    else {
      return 1282;
    }
  }
  else
  {
    if (v6) {
      v8 = (uint64_t *)&metric_units;
    }
    else {
      v8 = (uint64_t *)&us_units;
    }
    return findUnit(v8, a3);
  }
}

- (NSNumberFormatter)numberFormatter
{
  return [(NSUnitFormatter *)self->_unitFormatter numberFormatter];
}

- (NSFormattingUnitStyle)unitStyle
{
  return [(NSUnitFormatter *)self->_unitFormatter unitStyle];
}

- (BOOL)isForPersonHeightUse
{
  return self->_isForPersonHeight;
}

- (void)setForPersonHeightUse:(BOOL)forPersonHeightUse
{
  self->_isForPersonHeight = forPersonHeightUse;
}

- (NSString)unitStringFromMeters:(double)numberInMeters usedUnit:(NSLengthFormatterUnit *)unitp
{
  int64_t v7 = -[NSLengthFormatter targetUnitFromMeters:](self, "targetUnitFromMeters:");
  int64_t v8 = v7;
  if (unitp) {
    *unitp = v7;
  }
  double v9 = convertUnitFromMeters(v7, numberInMeters);

  return [(NSLengthFormatter *)self unitStringFromValue:v8 unit:v9];
}

- (NSString)stringFromMeters:(double)numberInMeters
{
  if (![(NSLengthFormatter *)self isForPersonHeightUse])
  {
    uint64_t v9 = [(NSLengthFormatter *)self targetUnitFromMeters:numberInMeters];
    double v6 = convertUnitFromMeters(v9, numberInMeters);
    int64_t v7 = self;
    uint64_t v8 = v9;
    goto LABEL_5;
  }
  char v5 = [(NSNumberFormatter *)[(NSLengthFormatter *)self numberFormatter] locale];
  if (objc_msgSend(-[NSLocale objectForKey:](v5, "objectForKey:", *MEMORY[0x1E4F1C490]), "BOOLValue"))
  {
    double v6 = numberInMeters / 0.01;
    int64_t v7 = self;
    uint64_t v8 = 9;
LABEL_5:
    return [(NSLengthFormatter *)v7 stringFromValue:v8 unit:v6];
  }
  unitFormatter = self->_unitFormatter;

  return (NSString *)-[NSUnitFormatter stringForValue1:unit1:value2:unit2:](unitFormatter, "stringForValue1:unit1:value2:unit2:", 1285, 1286);
}

- (NSString)stringFromValue:(double)value unit:(NSLengthFormatterUnit)unit
{
  uint64_t v7 = 0;
  if (!v5 & v4)
  {
    switch(unit)
    {
      case NSLengthFormatterUnitInch:
        uint64_t v7 = 1286;
        break;
      case NSLengthFormatterUnitFoot:
        uint64_t v7 = 1285;
        break;
      case NSLengthFormatterUnitYard:
        uint64_t v7 = 1288;
        break;
      case NSLengthFormatterUnitMile:
        uint64_t v7 = 1287;
        break;
      default:
        return (NSString *)[(NSUnitFormatter *)self->_unitFormatter stringForValue:v7 unit:value];
    }
  }
  else
  {
    switch(unit)
    {
      case 8:
        uint64_t v7 = 1283;
        break;
      case 9:
        uint64_t v7 = 1281;
        break;
      case 10:
      case 12:
      case 13:
        return (NSString *)[(NSUnitFormatter *)self->_unitFormatter stringForValue:v7 unit:value];
      case 11:
        uint64_t v7 = 1280;
        break;
      case 14:
        uint64_t v7 = 1282;
        break;
      default:
        JUMPOUT(0);
    }
  }
  return (NSString *)[(NSUnitFormatter *)self->_unitFormatter stringForValue:v7 unit:value];
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

  return -[NSLengthFormatter stringFromMeters:](self, "stringFromMeters:");
}

- (id)attributedStringForObjectValue:(id)a3 withDefaultAttributes:(id)a4
{
  if (!a3 || !_NSIsNSNumber()) {
    return 0;
  }
  [a3 doubleValue];
  uint64_t v7 = -[NSAttributedString initWithString:attributes:]([NSAttributedString alloc], "initWithString:attributes:", -[NSLengthFormatter stringFromMeters:](self, "stringFromMeters:"), a4);

  return v7;
}

- (NSLengthFormatter)initWithCoder:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (([a3 allowsKeyedCoding] & 1) == 0)
  {

    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"NSLengthFormatter cannot be decoded by non-keyed archivers" userInfo:0]);
  }
  v7.receiver = self;
  v7.super_class = (Class)NSLengthFormatter;
  char v5 = [(NSFormatter *)&v7 initWithCoder:a3];
  if (v5)
  {
    v5->_unitFormatter = [[NSUnitFormatter alloc] initWithCoder:a3];
    v5->_isForPersonHeight = [a3 decodeBoolForKey:@"NS.forPersonHeightUse"];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (([a3 allowsKeyedCoding] & 1) == 0) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"NSLengthFormatter cannot be encoded by non-keyed archivers" userInfo:0]);
  }
  v5.receiver = self;
  v5.super_class = (Class)NSLengthFormatter;
  [(NSFormatter *)&v5 encodeWithCoder:a3];
  [(NSUnitFormatter *)self->_unitFormatter encodeWithCoder:a3];
  if (self->_isForPersonHeight) {
    [a3 encodeBool:1 forKey:@"NS.forPersonHeightUse"];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(void *)(v5 + 8) = [(NSUnitFormatter *)self->_unitFormatter copyWithZone:a3];
  *(unsigned char *)(v5 + 16) = self->_isForPersonHeight;
  return (id)v5;
}

- (void)receiveObservedValue:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (a3 && (_NSIsNSNumber() & 1) == 0) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2, self, @"NSObservationFormatterSupport.m", 72, @"Invalid parameter not satisfying: %@", @"!value || _NSIsNSNumber(value)" object file lineNumber description];
  }
  v6.receiver = self;
  v6.super_class = (Class)NSLengthFormatter;
  [(NSLengthFormatter *)&v6 receiveObservedValue:[(NSLengthFormatter *)self stringForObjectValue:a3]];
}

@end