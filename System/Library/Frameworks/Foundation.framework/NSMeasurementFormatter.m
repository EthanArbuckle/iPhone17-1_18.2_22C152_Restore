@interface NSMeasurementFormatter
+ (BOOL)supportsSecureCoding;
- (NSFormattingUnitStyle)unitStyle;
- (NSLocale)locale;
- (NSMeasurementFormatter)init;
- (NSMeasurementFormatter)initWithCoder:(id)a3;
- (NSMeasurementFormatterUnitOptions)unitOptions;
- (NSNumberFormatter)numberFormatter;
- (NSString)stringFromMeasurement:(NSMeasurement *)measurement;
- (NSString)stringFromUnit:(NSUnit *)unit;
- (id)measurementFromString:(id)a3;
- (id)stringForObjectValue:(id)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setLocale:(NSLocale *)locale;
- (void)setNumberFormatter:(NSNumberFormatter *)numberFormatter;
- (void)setUnitOptions:(NSMeasurementFormatterUnitOptions)unitOptions;
- (void)setUnitStyle:(NSFormattingUnitStyle)unitStyle;
@end

@implementation NSMeasurementFormatter

- (NSString)stringFromMeasurement:(NSMeasurement *)measurement
{
  result = [(NSMeasurementFormatter *)self stringForObjectValue:measurement];
  if (!result) {
    return (NSString *)&stru_1ECA5C228;
  }
  return result;
}

- (id)stringForObjectValue:(id)a3
{
  if (!a3 || (objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  formatter = self->_formatter;

  return (id)[formatter stringForObjectValue:a3];
}

- (NSNumberFormatter)numberFormatter
{
  return (NSNumberFormatter *)[self->_formatter numberFormatter];
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)NSMeasurementFormatter;
  [(NSMeasurementFormatter *)&v3 dealloc];
}

- (NSMeasurementFormatter)init
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v4.receiver = self;
  v4.super_class = (Class)NSMeasurementFormatter;
  v2 = [(NSMeasurementFormatter *)&v4 init];
  if (v2)
  {
    v2->_formatter = objc_alloc_init(NSUnitFormatter);
    [(NSMeasurementFormatter *)v2 setUnitOptions:0];
    [(NSMeasurementFormatter *)v2 setUnitStyle:2];
    -[NSMeasurementFormatter setLocale:](v2, "setLocale:", [MEMORY[0x1E4F1CA20] currentLocale]);
  }
  return v2;
}

- (void)setUnitOptions:(NSMeasurementFormatterUnitOptions)unitOptions
{
  if (unitOptions >= 8) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2, self, @"NSMeasurementFormatter.m", 44, @"Invalid parameter not satisfying: %@", @"unitOptions == 0 || !(unitOptions & ~(NSMeasurementFormatterUnitOptionsProvidedUnit | NSMeasurementFormatterUnitOptionsNaturalScale | NSMeasurementFormatterUnitOptionsTemperatureWithoutUnit))" object file lineNumber description];
  }
  formatter = self->_formatter;

  [formatter setUnitOptions:unitOptions];
}

- (void)setLocale:(NSLocale *)locale
{
}

- (void)setUnitStyle:(NSFormattingUnitStyle)unitStyle
{
}

- (NSMeasurementFormatterUnitOptions)unitOptions
{
  return [self->_formatter unitOptions];
}

- (NSLocale)locale
{
  return (NSLocale *)[self->_formatter locale];
}

- (NSFormattingUnitStyle)unitStyle
{
  return [self->_formatter unitStyle];
}

- (void)setNumberFormatter:(NSNumberFormatter *)numberFormatter
{
}

- (id)measurementFromString:(id)a3
{
  return 0;
}

- (NSString)stringFromUnit:(NSUnit *)unit
{
  return (NSString *)[self->_formatter stringFromUnit:unit];
}

- (NSMeasurementFormatter)initWithCoder:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  if (([a3 allowsKeyedCoding] & 1) == 0)
  {

    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"NSMeasurementFormatter cannot be decoded by non-keyed archivers" userInfo:0]);
  }
  uint64_t v5 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"NS.unitFormatter"];
  if (v5)
  {
    v6 = (void *)v5;
    v9.receiver = self;
    v9.super_class = (Class)NSMeasurementFormatter;
    v7 = [(NSMeasurementFormatter *)&v9 init];
    if (v7) {
      v7->_formatter = v6;
    }
  }
  else
  {

    v10 = @"NSLocalizedDescription";
    v11[0] = @"Formatter has been corrupted!";
    objc_msgSend(a3, "failWithError:", +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", @"NSCocoaErrorDomain", 4864, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1)));
    return 0;
  }
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end