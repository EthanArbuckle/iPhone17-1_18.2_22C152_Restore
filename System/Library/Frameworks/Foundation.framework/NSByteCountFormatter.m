@interface NSByteCountFormatter
+ (NSString)stringFromByteCount:(uint64_t)byteCount countStyle:(NSByteCountFormatterCountStyle)countStyle;
+ (NSString)stringFromMeasurement:(NSMeasurement *)measurement countStyle:(NSByteCountFormatterCountStyle)countStyle;
- (BOOL)_mayDecorateAttributedStringForObjectValue:(id)a3;
- (BOOL)allowsNonnumericFormatting;
- (BOOL)getObjectValue:(id *)a3 forString:(id)a4 errorDescription:(id *)a5;
- (BOOL)includesActualByteCount;
- (BOOL)includesCount;
- (BOOL)includesUnit;
- (BOOL)isAdaptive;
- (BOOL)isPartialStringValid:(id *)a3 proposedSelectedRange:(_NSRange *)a4 originalString:(id)a5 originalSelectedRange:(_NSRange)a6 errorDescription:(id *)a7;
- (BOOL)zeroPadsFractionDigits;
- (NSByteCountFormatter)init;
- (NSByteCountFormatter)initWithCoder:(id)a3;
- (NSByteCountFormatterCountStyle)countStyle;
- (NSByteCountFormatterUnits)allowedUnits;
- (NSFormattingContext)formattingContext;
- (NSString)stringForObjectValue:(id)obj;
- (NSString)stringFromByteCount:(uint64_t)byteCount;
- (NSString)stringFromMeasurement:(NSMeasurement *)measurement;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)_options;
- (void)encodeWithCoder:(id)a3;
- (void)receiveObservedValue:(id)a3;
- (void)setAdaptive:(BOOL)adaptive;
- (void)setAllowedUnits:(NSByteCountFormatterUnits)allowedUnits;
- (void)setAllowsNonnumericFormatting:(BOOL)allowsNonnumericFormatting;
- (void)setCountStyle:(NSByteCountFormatterCountStyle)countStyle;
- (void)setFormattingContext:(NSFormattingContext)formattingContext;
- (void)setIncludesActualByteCount:(BOOL)includesActualByteCount;
- (void)setIncludesCount:(BOOL)includesCount;
- (void)setIncludesUnit:(BOOL)includesUnit;
- (void)setZeroPadsFractionDigits:(BOOL)zeroPadsFractionDigits;
@end

@implementation NSByteCountFormatter

- (NSByteCountFormatter)init
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v5.receiver = self;
  v5.super_class = (Class)NSByteCountFormatter;
  v2 = [(NSByteCountFormatter *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(NSByteCountFormatter *)v2 setAdaptive:1];
    [(NSByteCountFormatter *)v3 setAllowsNonnumericFormatting:1];
    [(NSByteCountFormatter *)v3 setIncludesUnit:1];
    [(NSByteCountFormatter *)v3 setIncludesCount:1];
    [(NSByteCountFormatter *)v3 setFormattingContext:0];
  }
  return v3;
}

- (void)setIncludesUnit:(BOOL)includesUnit
{
  self->_includesUnit = includesUnit;
}

- (void)setIncludesCount:(BOOL)includesCount
{
  self->_includesCount = includesCount;
}

- (void)setFormattingContext:(NSFormattingContext)formattingContext
{
  self->_formattingContext = formattingContext;
}

- (void)setAllowsNonnumericFormatting:(BOOL)allowsNonnumericFormatting
{
  self->_allowsNonnumericFormatting = allowsNonnumericFormatting;
}

- (void)setAdaptive:(BOOL)adaptive
{
  self->_adaptive = adaptive;
}

- (void)setCountStyle:(NSByteCountFormatterCountStyle)countStyle
{
  self->_countStyle = countStyle;
}

- (NSString)stringFromByteCount:(uint64_t)byteCount
{
  unint64_t v5 = [(NSByteCountFormatter *)self _options];
  NSFormattingContext v6 = [(NSByteCountFormatter *)self formattingContext];

  return __NSLocalizedFileSizeDescription(byteCount, 0, v5, v6);
}

- (NSFormattingContext)formattingContext
{
  return (uint64_t)self->_formattingContext;
}

- (unint64_t)_options
{
  unint64_t v3 = [(NSByteCountFormatter *)self countStyle] - 1;
  if (v3 > 2) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = qword_18237F200[v3];
  }
  NSByteCountFormatterUnits v5 = [(NSByteCountFormatter *)self allowedUnits];
  if (v5 == 0xFFFF) {
    NSByteCountFormatterUnits v6 = 0;
  }
  else {
    NSByteCountFormatterUnits v6 = v5;
  }
  if (!v5) {
    NSByteCountFormatterUnits v6 = 0;
  }
  NSByteCountFormatterUnits v7 = v6 | v4;
  BOOL v8 = [(NSByteCountFormatter *)self allowsNonnumericFormatting];
  BOOL v9 = [(NSByteCountFormatter *)self includesUnit];
  BOOL v10 = [(NSByteCountFormatter *)self includesCount];
  BOOL v11 = [(NSByteCountFormatter *)self includesActualByteCount];
  BOOL v12 = [(NSByteCountFormatter *)self isAdaptive];
  BOOL v13 = [(NSByteCountFormatter *)self zeroPadsFractionDigits];
  uint64_t v14 = 0x10000000;
  if (v8) {
    uint64_t v14 = 0x8000000;
  }
  uint64_t v15 = v14 | 0x40000000;
  if (!v9)
  {
    uint64_t v15 = v14;
    v14 |= 0x20000000uLL;
  }
  if (!v10) {
    uint64_t v14 = v15;
  }
  if (v11) {
    v14 |= 0x4000000uLL;
  }
  uint64_t v16 = 0x400000;
  if (v12) {
    uint64_t v16 = 0x200000;
  }
  uint64_t v17 = v14 | v16;
  if (v13) {
    v17 |= 0x1000000uLL;
  }
  return v7 | v17;
}

- (BOOL)zeroPadsFractionDigits
{
  return self->_zeroPadsFractionDigits;
}

- (BOOL)isAdaptive
{
  return self->_adaptive;
}

- (BOOL)includesUnit
{
  return self->_includesUnit;
}

- (BOOL)includesCount
{
  return self->_includesCount;
}

- (BOOL)includesActualByteCount
{
  return self->_includesActualByteCount;
}

- (NSByteCountFormatterCountStyle)countStyle
{
  return (uint64_t)self->_countStyle;
}

- (BOOL)allowsNonnumericFormatting
{
  return self->_allowsNonnumericFormatting;
}

- (NSByteCountFormatterUnits)allowedUnits
{
  return self->_allowedUnits;
}

+ (NSString)stringFromByteCount:(uint64_t)byteCount countStyle:(NSByteCountFormatterCountStyle)countStyle
{
  if ((unint64_t)(countStyle - 1) > 2) {
    unint64_t v5 = 0;
  }
  else {
    unint64_t v5 = qword_18237F200[countStyle - 1];
  }
  return __NSLocalizedFileSizeDescription(byteCount, 0, v5, 0);
}

- (void)setAllowedUnits:(NSByteCountFormatterUnits)allowedUnits
{
  self->_allowedUnits = allowedUnits;
}

- (void)setIncludesActualByteCount:(BOOL)includesActualByteCount
{
  self->_includesActualByteCount = includesActualByteCount;
}

+ (NSString)stringFromMeasurement:(NSMeasurement *)measurement countStyle:(NSByteCountFormatterCountStyle)countStyle
{
  NSByteCountFormatterAssertValidMeasurement(measurement);
  if ((unint64_t)(countStyle - 1) > 2) {
    unint64_t v6 = 0;
  }
  else {
    unint64_t v6 = qword_18237F200[countStyle - 1];
  }

  return __NSLocalizedFileSizeDescriptionWithMeasurement(measurement, v6, 0);
}

- (NSString)stringFromMeasurement:(NSMeasurement *)measurement
{
  NSByteCountFormatterAssertValidMeasurement(measurement);
  unint64_t v5 = [(NSByteCountFormatter *)self _options];
  NSFormattingContext v6 = [(NSByteCountFormatter *)self formattingContext];

  return __NSLocalizedFileSizeDescriptionWithMeasurement(measurement, v5, v6);
}

- (BOOL)_mayDecorateAttributedStringForObjectValue:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (a3 && (_NSIsNSNumber() & 1) == 0)
  {
    v9.receiver = self;
    v9.super_class = (Class)NSByteCountFormatter;
    return [(NSFormatter *)&v9 _mayDecorateAttributedStringForObjectValue:a3];
  }
  else
  {
    unint64_t v5 = (objc_class *)objc_opt_class();
    IMP MethodImplementation = class_getMethodImplementation(v5, sel_attributedStringForObjectValue_withDefaultAttributes_);
    NSByteCountFormatterUnits v7 = (objc_class *)objc_opt_class();
    return MethodImplementation != class_getMethodImplementation(v7, sel_attributedStringForObjectValue_withDefaultAttributes_);
  }
}

- (NSString)stringForObjectValue:(id)obj
{
  if (_NSIsNSNumber())
  {
    uint64_t v5 = [obj longLongValue];
    unint64_t v6 = [(NSByteCountFormatter *)self _options];
    NSFormattingContext v7 = [(NSByteCountFormatter *)self formattingContext];
    return __NSLocalizedFileSizeDescription(v5, 0, v6, v7);
  }
  else if (objc_opt_isKindOfClass())
  {
    NSByteCountFormatterAssertValidMeasurement(obj);
    unint64_t v9 = [(NSByteCountFormatter *)self _options];
    NSFormattingContext v10 = [(NSByteCountFormatter *)self formattingContext];
    return __NSLocalizedFileSizeDescriptionWithMeasurement(obj, v9, v10);
  }
  else
  {
    return 0;
  }
}

- (BOOL)getObjectValue:(id *)a3 forString:(id)a4 errorDescription:(id *)a5
{
  return 0;
}

- (BOOL)isPartialStringValid:(id *)a3 proposedSelectedRange:(_NSRange *)a4 originalString:(id)a5 originalSelectedRange:(_NSRange)a6 errorDescription:(id *)a7
{
  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setAllowedUnits:", -[NSByteCountFormatter allowedUnits](self, "allowedUnits"));
  objc_msgSend(v4, "setCountStyle:", -[NSByteCountFormatter countStyle](self, "countStyle"));
  objc_msgSend(v4, "setAllowsNonnumericFormatting:", -[NSByteCountFormatter allowsNonnumericFormatting](self, "allowsNonnumericFormatting"));
  objc_msgSend(v4, "setIncludesUnit:", -[NSByteCountFormatter includesUnit](self, "includesUnit"));
  objc_msgSend(v4, "setIncludesCount:", -[NSByteCountFormatter includesCount](self, "includesCount"));
  objc_msgSend(v4, "setIncludesActualByteCount:", -[NSByteCountFormatter includesActualByteCount](self, "includesActualByteCount"));
  objc_msgSend(v4, "setAdaptive:", -[NSByteCountFormatter isAdaptive](self, "isAdaptive"));
  objc_msgSend(v4, "setZeroPadsFractionDigits:", -[NSByteCountFormatter zeroPadsFractionDigits](self, "zeroPadsFractionDigits"));
  objc_msgSend(v4, "setFormattingContext:", -[NSByteCountFormatter formattingContext](self, "formattingContext"));
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v5.receiver = self;
  v5.super_class = (Class)NSByteCountFormatter;
  -[NSFormatter encodeWithCoder:](&v5, sel_encodeWithCoder_);
  if (([a3 allowsKeyedCoding] & 1) == 0) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"NSByteCountFormatter needs keyed archiver" userInfo:0]);
  }
  if ([(NSByteCountFormatter *)self allowedUnits]) {
    objc_msgSend(a3, "encodeInt32:forKey:");
  }
  if ([(NSByteCountFormatter *)self countStyle]) {
    objc_msgSend(a3, "encodeInt32:forKey:");
  }
  if ([(NSByteCountFormatter *)self formattingContext]) {
    objc_msgSend(a3, "encodeInt32:forKey:");
  }
  if ([(NSByteCountFormatter *)self zeroPadsFractionDigits]) {
    [a3 encodeBool:1 forKey:@"NSZeroPad"];
  }
  if ([(NSByteCountFormatter *)self includesActualByteCount]) {
    [a3 encodeBool:1 forKey:@"NSActual"];
  }
  if (![(NSByteCountFormatter *)self allowsNonnumericFormatting]) {
    [a3 encodeBool:1 forKey:@"NSNoNonnumeric"];
  }
  if (![(NSByteCountFormatter *)self includesUnit]) {
    [a3 encodeBool:1 forKey:@"NSNoUnit"];
  }
  if (![(NSByteCountFormatter *)self includesCount]) {
    [a3 encodeBool:1 forKey:@"NSNoCount"];
  }
  if (![(NSByteCountFormatter *)self isAdaptive]) {
    [a3 encodeBool:1 forKey:@"NSNoAdaptive"];
  }
}

- (NSByteCountFormatter)initWithCoder:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v6.receiver = self;
  v6.super_class = (Class)NSByteCountFormatter;
  uint64_t v4 = -[NSFormatter initWithCoder:](&v6, sel_initWithCoder_);
  if (v4)
  {
    if (([a3 allowsKeyedCoding] & 1) == 0)
    {

      objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"NSByteCountFormatter needs keyed archiver" userInfo:0]);
    }
    -[NSByteCountFormatter setFormattingContext:](v4, "setFormattingContext:", (int)[a3 decodeInt32ForKey:@"NSFormattingContext"]);
    -[NSByteCountFormatter setAllowedUnits:](v4, "setAllowedUnits:", (int)[a3 decodeInt32ForKey:@"NSUnits"]);
    -[NSByteCountFormatter setCountStyle:](v4, "setCountStyle:", (int)[a3 decodeInt32ForKey:@"NSKBSize"]);
    -[NSByteCountFormatter setZeroPadsFractionDigits:](v4, "setZeroPadsFractionDigits:", [a3 decodeBoolForKey:@"NSZeroPad"]);
    -[NSByteCountFormatter setIncludesActualByteCount:](v4, "setIncludesActualByteCount:", [a3 decodeBoolForKey:@"NSActual"]);
    -[NSByteCountFormatter setAllowsNonnumericFormatting:](v4, "setAllowsNonnumericFormatting:", [a3 decodeBoolForKey:@"NSNoNonnumeric"] ^ 1);
    -[NSByteCountFormatter setIncludesUnit:](v4, "setIncludesUnit:", [a3 decodeBoolForKey:@"NSNoUnit"] ^ 1);
    -[NSByteCountFormatter setIncludesCount:](v4, "setIncludesCount:", [a3 decodeBoolForKey:@"NSNoCount"] ^ 1);
    -[NSByteCountFormatter setAdaptive:](v4, "setAdaptive:", [a3 decodeBoolForKey:@"NSNoAdaptive"] ^ 1);
  }
  return v4;
}

- (void)setZeroPadsFractionDigits:(BOOL)zeroPadsFractionDigits
{
  self->_zeroPadsFractionDigits = zeroPadsFractionDigits;
}

- (void)receiveObservedValue:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (a3 && (_NSIsNSNumber() & 1) == 0) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2, self, @"NSObservationFormatterSupport.m", 51, @"Invalid parameter not satisfying: %@", @"!value || _NSIsNSNumber(value)" object file lineNumber description];
  }
  v6.receiver = self;
  v6.super_class = (Class)NSByteCountFormatter;
  [(NSByteCountFormatter *)&v6 receiveObservedValue:[(NSByteCountFormatter *)self stringForObjectValue:a3]];
}

@end