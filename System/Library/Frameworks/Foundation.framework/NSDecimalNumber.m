@interface NSDecimalNumber
+ (BOOL)supportsSecureCoding;
+ (NSDecimalNumber)allocWithZone:(_NSZone *)a3;
+ (NSDecimalNumber)decimalNumberWithDecimal:(NSDecimal *)dcm;
+ (NSDecimalNumber)decimalNumberWithMantissa:(unint64_t)mantissa exponent:(__int16)exponent isNegative:(BOOL)flag;
+ (NSDecimalNumber)decimalNumberWithString:(NSString *)numberValue;
+ (NSDecimalNumber)decimalNumberWithString:(NSString *)numberValue locale:(id)locale;
+ (NSDecimalNumber)maximumDecimalNumber;
+ (NSDecimalNumber)minimumDecimalNumber;
+ (NSDecimalNumber)notANumber;
+ (NSDecimalNumber)numberWithBool:(BOOL)a3;
+ (NSDecimalNumber)numberWithChar:(char)a3;
+ (NSDecimalNumber)numberWithDouble:(double)a3;
+ (NSDecimalNumber)numberWithFloat:(float)a3;
+ (NSDecimalNumber)numberWithInt:(int)a3;
+ (NSDecimalNumber)numberWithInteger:(int64_t)a3;
+ (NSDecimalNumber)numberWithLong:(int64_t)a3;
+ (NSDecimalNumber)numberWithLongLong:(int64_t)a3;
+ (NSDecimalNumber)numberWithShort:(signed __int16)a3;
+ (NSDecimalNumber)numberWithUnsignedChar:(unsigned __int8)a3;
+ (NSDecimalNumber)numberWithUnsignedInt:(unsigned int)a3;
+ (NSDecimalNumber)numberWithUnsignedInteger:(unint64_t)a3;
+ (NSDecimalNumber)numberWithUnsignedLong:(unint64_t)a3;
+ (NSDecimalNumber)numberWithUnsignedLongLong:(unint64_t)a3;
+ (NSDecimalNumber)numberWithUnsignedShort:(unsigned __int16)a3;
+ (NSDecimalNumber)one;
+ (NSDecimalNumber)zero;
+ (id)defaultBehavior;
+ (void)initialize;
+ (void)setDefaultBehavior:(id)defaultBehavior;
- (BOOL)BOOLValue;
- (BOOL)_allowsDirectEncoding;
- (BOOL)_getCString:(char *)a3 length:(int)a4 multiplier:(double)a5;
- (BOOL)isEqual:(id)a3;
- (Class)classForCoder;
- (NSComparisonResult)compare:(NSNumber *)decimalNumber;
- (NSDecimal)decimalValue;
- (NSDecimalNumber)decimalNumberByAdding:(NSDecimalNumber *)decimalNumber;
- (NSDecimalNumber)decimalNumberByAdding:(NSDecimalNumber *)decimalNumber withBehavior:(id)behavior;
- (NSDecimalNumber)decimalNumberByDividingBy:(NSDecimalNumber *)decimalNumber;
- (NSDecimalNumber)decimalNumberByDividingBy:(NSDecimalNumber *)decimalNumber withBehavior:(id)behavior;
- (NSDecimalNumber)decimalNumberByMultiplyingBy:(NSDecimalNumber *)decimalNumber;
- (NSDecimalNumber)decimalNumberByMultiplyingBy:(NSDecimalNumber *)decimalNumber withBehavior:(id)behavior;
- (NSDecimalNumber)decimalNumberByMultiplyingByPowerOf10:(__int16)power;
- (NSDecimalNumber)decimalNumberByMultiplyingByPowerOf10:(__int16)power withBehavior:(id)behavior;
- (NSDecimalNumber)decimalNumberByRaisingToPower:(NSUInteger)power;
- (NSDecimalNumber)decimalNumberByRaisingToPower:(NSUInteger)power withBehavior:(id)behavior;
- (NSDecimalNumber)decimalNumberByRoundingAccordingToBehavior:(id)behavior;
- (NSDecimalNumber)decimalNumberBySubtracting:(NSDecimalNumber *)decimalNumber;
- (NSDecimalNumber)decimalNumberBySubtracting:(NSDecimalNumber *)decimalNumber withBehavior:(id)behavior;
- (NSDecimalNumber)initWithCoder:(id)a3;
- (NSDecimalNumber)initWithDecimal:(NSDecimal *)dcm;
- (NSDecimalNumber)initWithMantissa:(unint64_t)mantissa exponent:(__int16)exponent isNegative:(BOOL)flag;
- (NSDecimalNumber)initWithString:(NSString *)numberValue;
- (NSDecimalNumber)initWithString:(NSString *)numberValue locale:(id)locale;
- (NSString)descriptionWithLocale:(id)locale;
- (char)charValue;
- (const)objCType;
- (double)doubleValue;
- (float)floatValue;
- (id)copyWithZone:(_NSZone *)a3;
- (id)decimalNumberBySubstracting:(id)a3;
- (id)description;
- (int)intValue;
- (int64_t)longLongValue;
- (int64_t)longValue;
- (signed)shortValue;
- (unint64_t)unsignedLongLongValue;
- (unint64_t)unsignedLongValue;
- (unsigned)unsignedCharValue;
- (unsigned)unsignedIntValue;
- (unsigned)unsignedShortValue;
- (void)encodeWithCoder:(id)a3;
- (void)getValue:(void *)a3;
@end

@implementation NSDecimalNumber

- (NSDecimal)decimalValue
{
  *(void *)retstr = 0;
  *(void *)&retstr->_mantissa[2] = 0;
  *(_DWORD *)&retstr->_mantissa[6] = 0;
  NSDecimalCopy(retstr, (const NSDecimal *)((char *)self + 8));
  return result;
}

+ (NSDecimalNumber)allocWithZone:(_NSZone *)a3
{
  if ((id)objc_opt_class() == a1) {
    return (NSDecimalNumber *)&_cachedPlaceholder;
  }

  return (NSDecimalNumber *)NSAllocateObject((Class)a1, 0, a3);
}

+ (NSDecimalNumber)zero
{
  return (NSDecimalNumber *)&zero__zero;
}

- (NSComparisonResult)compare:(NSNumber *)decimalNumber
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (self == (NSDecimalNumber *)decimalNumber) {
    return 0;
  }
  if (!decimalNumber) {
    return 1;
  }
  self;
  if (objc_opt_isKindOfClass())
  {
    v9[0] = 0;
    v9[1] = 0;
    int v10 = 0;
    if (self) {
      [(NSDecimalNumber *)self decimalValue];
    }
    v7[0] = 0;
    v7[1] = 0;
    int v8 = 0;
    [(NSNumber *)decimalNumber decimalValue];
    return _NSDecimalCompare((uint64_t)v9, (uint64_t)v7);
  }
  else
  {
    NSComparisonResult v6 = [(NSNumber *)decimalNumber compare:self];
    if (v6 == NSOrderedDescending) {
      return -1;
    }
    else {
      return (unint64_t)(v6 == NSOrderedAscending);
    }
  }
}

+ (NSDecimalNumber)decimalNumberWithDecimal:(NSDecimal *)dcm
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  NSDecimal v4 = *dcm;
  return (NSDecimalNumber *)[(NSDecimalNumberPlaceholder *)&_cachedPlaceholder initWithDecimal:&v4];
}

+ (void)initialize
{
  if (NSDecimalNumber == a1) {
    objc_opt_class();
  }
}

- (const)objCType
{
  return "d";
}

- (float)floatValue
{
  [(NSDecimalNumber *)self doubleValue];
  return v2;
}

- (double)doubleValue
{
  if ((*((unsigned char *)self + 9) & 0xF) != 0)
  {
    uint64_t v3 = 2 * (*((unsigned char *)self + 9) & 0xF);
    double result = 0.0;
    do
    {
      LOWORD(v2) = *(_WORD *)((char *)self + v3 + 10);
      double v2 = (double)*(unint64_t *)&v2;
      double result = v2 + result * 65536.0;
      v3 -= 2;
    }
    while (v3);
  }
  else
  {
    double result = 0.0;
    if ((*((unsigned char *)self + 9) & 0x10) != 0) {
      return NAN;
    }
  }
  uint64_t v5 = *((char *)self + 8);
  if ((v5 & 0x80000000) != 0)
  {
    uint64_t v6 = -(int)v5;
    do
    {
      double result = result / 10.0;
      --v6;
    }
    while (v6);
  }
  else if (*((unsigned char *)self + 8))
  {
    do
    {
      double result = result * 10.0;
      --v5;
    }
    while (v5);
  }
  if ((*((unsigned char *)self + 9) & 0x10) != 0) {
    return -result;
  }
  return result;
}

+ (NSDecimalNumber)one
{
  return (NSDecimalNumber *)&one__one;
}

+ (NSDecimalNumber)notANumber
{
  double result = (NSDecimalNumber *)notANumber_n;
  if (!notANumber_n)
  {
    uint64_t v3 = (objc_class *)self;
    double result = (NSDecimalNumber *)NSAllocateObject(v3, 0, 0);
    notANumber_n = (uint64_t)result;
    *((unsigned char *)result + 9) &= 0xF0u;
    *((unsigned char *)result + 9) |= 0x10u;
  }
  return result;
}

- (NSDecimalNumber)decimalNumberByAdding:(NSDecimalNumber *)decimalNumber
{
  uint64_t v5 = [self defaultBehavior];

  return [(NSDecimalNumber *)self decimalNumberByAdding:decimalNumber withBehavior:v5];
}

- (NSDecimalNumber)decimalNumberBySubtracting:(NSDecimalNumber *)decimalNumber
{
  uint64_t v5 = [self defaultBehavior];

  return [(NSDecimalNumber *)self decimalNumberBySubtracting:decimalNumber withBehavior:v5];
}

- (NSDecimalNumber)decimalNumberByMultiplyingBy:(NSDecimalNumber *)decimalNumber
{
  uint64_t v5 = [self defaultBehavior];

  return [(NSDecimalNumber *)self decimalNumberByMultiplyingBy:decimalNumber withBehavior:v5];
}

- (NSDecimalNumber)decimalNumberByDividingBy:(NSDecimalNumber *)decimalNumber
{
  uint64_t v5 = [self defaultBehavior];

  return [(NSDecimalNumber *)self decimalNumberByDividingBy:decimalNumber withBehavior:v5];
}

+ (id)defaultBehavior
{
  id result = (id)[(NSMutableDictionary *)[+[NSThread currentThread] threadDictionary] objectForKey:@"NSDecimalNumberBehaviors"];
  if (!result)
  {
    return +[NSDecimalNumberHandler defaultDecimalNumberHandler];
  }
  return result;
}

- (NSDecimalNumber)decimalNumberByMultiplyingBy:(NSDecimalNumber *)decimalNumber withBehavior:(id)behavior
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v18 = 0uLL;
  int v19 = 0;
  int v8 = [behavior scale];
  v9 = (NSDecimal *)[behavior roundingMode];
  v16[0] = 0;
  v16[1] = 0;
  int v17 = 0;
  if (self) {
    [(NSDecimalNumber *)self decimalValue];
  }
  v14[0] = 0;
  v14[1] = 0;
  int v15 = 0;
  if (decimalNumber) {
    [(NSDecimalNumber *)decimalNumber decimalValue];
  }
  uint64_t v10 = _NSDecimalMultiply(&v18, v16, v14, v9);
  long long v12 = v18;
  int v13 = v19;
  return (NSDecimalNumber *)_checkErrorAndRound(v10, (uint64_t)a2, (uint64_t)self, (uint64_t)decimalNumber, v8, v9, (uint64_t)&v12, behavior);
}

- (NSDecimalNumber)decimalNumberBySubtracting:(NSDecimalNumber *)decimalNumber withBehavior:(id)behavior
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v18 = 0uLL;
  int v19 = 0;
  int v8 = [behavior scale];
  v9 = (NSDecimal *)[behavior roundingMode];
  v16[0] = 0;
  v16[1] = 0;
  int v17 = 0;
  if (self) {
    [(NSDecimalNumber *)self decimalValue];
  }
  v14[0] = 0;
  v14[1] = 0;
  int v15 = 0;
  if (decimalNumber) {
    [(NSDecimalNumber *)decimalNumber decimalValue];
  }
  uint64_t v10 = _NSDecimalSubtract(&v18, v16, v14, v9);
  long long v12 = v18;
  int v13 = v19;
  return (NSDecimalNumber *)_checkErrorAndRound(v10, (uint64_t)a2, (uint64_t)self, (uint64_t)decimalNumber, v8, v9, (uint64_t)&v12, behavior);
}

- (NSDecimalNumber)decimalNumberByDividingBy:(NSDecimalNumber *)decimalNumber withBehavior:(id)behavior
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v18 = 0uLL;
  int v19 = 0;
  int v8 = [behavior scale];
  v9 = (NSDecimal *)[behavior roundingMode];
  v16[0] = 0;
  v16[1] = 0;
  int v17 = 0;
  if (self) {
    [(NSDecimalNumber *)self decimalValue];
  }
  v14[0] = 0;
  v14[1] = 0;
  int v15 = 0;
  if (decimalNumber) {
    [(NSDecimalNumber *)decimalNumber decimalValue];
  }
  uint64_t v10 = _NSDecimalDivide(&v18, v16, v14, v9);
  long long v12 = v18;
  int v13 = v19;
  return (NSDecimalNumber *)_checkErrorAndRound(v10, (uint64_t)a2, (uint64_t)self, (uint64_t)decimalNumber, v8, v9, (uint64_t)&v12, behavior);
}

- (NSDecimalNumber)decimalNumberByAdding:(NSDecimalNumber *)decimalNumber withBehavior:(id)behavior
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v18 = 0uLL;
  int v19 = 0;
  int v8 = [behavior scale];
  v9 = (NSDecimal *)[behavior roundingMode];
  v16[0] = 0;
  v16[1] = 0;
  int v17 = 0;
  if (self) {
    [(NSDecimalNumber *)self decimalValue];
  }
  v14[0] = 0;
  v14[1] = 0;
  int v15 = 0;
  if (decimalNumber) {
    [(NSDecimalNumber *)decimalNumber decimalValue];
  }
  uint64_t v10 = _NSDecimalAdd(&v18, v16, v14, v9);
  long long v12 = v18;
  int v13 = v19;
  return (NSDecimalNumber *)_checkErrorAndRound(v10, (uint64_t)a2, (uint64_t)self, (uint64_t)decimalNumber, v8, v9, (uint64_t)&v12, behavior);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (NSShouldRetainWithZone(self, a3))
  {
    return self;
  }
  else
  {
    if (self)
    {
      [(NSDecimalNumber *)self decimalValue];
    }
    else
    {
      v5[0] = 0;
      v5[1] = 0;
      int v6 = 0;
    }
    return [(NSDecimalNumberPlaceholder *)&_cachedPlaceholder initWithDecimal:v5];
  }
}

+ (NSDecimalNumber)decimalNumberWithMantissa:(unint64_t)mantissa exponent:(__int16)exponent isNegative:(BOOL)flag
{
  uint64_t v5 = [(NSDecimalNumberPlaceholder *)&_cachedPlaceholder initWithMantissa:mantissa exponent:exponent isNegative:flag];

  return (NSDecimalNumber *)v5;
}

+ (NSDecimalNumber)decimalNumberWithString:(NSString *)numberValue
{
  uint64_t v3 = [(NSDecimalNumberPlaceholder *)&_cachedPlaceholder initWithString:numberValue];

  return (NSDecimalNumber *)v3;
}

+ (NSDecimalNumber)decimalNumberWithString:(NSString *)numberValue locale:(id)locale
{
  NSDecimal v4 = [(NSDecimalNumberPlaceholder *)&_cachedPlaceholder initWithString:numberValue locale:locale];

  return (NSDecimalNumber *)v4;
}

- (NSDecimalNumber)initWithMantissa:(unint64_t)mantissa exponent:(__int16)exponent isNegative:(BOOL)flag
{
  objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Did you forget to nest alloc and initWithMantissa:exponent:isNegative ?" userInfo:0]);
}

- (NSDecimalNumber)initWithDecimal:(NSDecimal *)dcm
{
  objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Did you forget to nest alloc and initWithDecimal: ?" userInfo:0]);
}

- (NSDecimalNumber)initWithString:(NSString *)numberValue
{
  objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Did you forget to nest alloc and initWithString: ?" userInfo:0]);
}

- (NSDecimalNumber)initWithString:(NSString *)numberValue locale:(id)locale
{
  objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Did you forget to nest alloc and initWithString:locale: ?" userInfo:0]);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSDecimalNumber)initWithCoder:(id)a3
{
  objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Did you forget to nest alloc and initWithCoder: ?" userInfo:0]);
}

- (id)description
{
  return [(NSDecimalNumber *)self descriptionWithLocale:0];
}

- (NSString)descriptionWithLocale:(id)locale
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = 0;
  uint64_t v6 = 0;
  LODWORD(v7) = 0;
  if (self) {
    [(NSDecimalNumber *)self decimalValue];
  }
  return (NSString *)_NSDecimalString((uint64_t)&v5, (uint64_t)locale);
}

+ (NSDecimalNumber)minimumDecimalNumber
{
  return (NSDecimalNumber *)&minimumDecimalNumber__minimumDecimalNumber;
}

+ (NSDecimalNumber)maximumDecimalNumber
{
  return (NSDecimalNumber *)&maximumDecimalNumber__maximumDecimalNumber;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    int v5 = _NSIsNSNumber();
    if (v5) {
      LOBYTE(v5) = [(NSDecimalNumber *)self compare:a3] == NSOrderedSame;
    }
  }
  return v5;
}

- (void)getValue:(void *)a3
{
  [(NSDecimalNumber *)self doubleValue];
  *(void *)a3 = v4;
}

- (id)decimalNumberBySubstracting:(id)a3
{
  id v5 = +[NSDecimalNumber defaultBehavior];

  return [(NSDecimalNumber *)self decimalNumberBySubtracting:a3 withBehavior:v5];
}

- (NSDecimalNumber)decimalNumberByRaisingToPower:(NSUInteger)power
{
  uint64_t v5 = [self defaultBehavior];

  return [(NSDecimalNumber *)self decimalNumberByRaisingToPower:power withBehavior:v5];
}

- (NSDecimalNumber)decimalNumberByRaisingToPower:(NSUInteger)power withBehavior:(id)behavior
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v16 = 0uLL;
  int v17 = 0;
  int v8 = [behavior scale];
  v9 = (NSDecimal *)[behavior roundingMode];
  v14[0] = 0;
  v14[1] = 0;
  int v15 = 0;
  if (self) {
    [(NSDecimalNumber *)self decimalValue];
  }
  uint64_t v10 = _NSDecimalPower(&v16, v14, power, v9);
  long long v12 = v16;
  int v13 = v17;
  return (NSDecimalNumber *)_checkErrorAndRound(v10, (uint64_t)a2, (uint64_t)self, 0, v8, v9, (uint64_t)&v12, behavior);
}

- (NSDecimalNumber)decimalNumberByMultiplyingByPowerOf10:(__int16)power
{
  uint64_t v3 = power;
  uint64_t v5 = [self defaultBehavior];

  return [(NSDecimalNumber *)self decimalNumberByMultiplyingByPowerOf10:v3 withBehavior:v5];
}

- (NSDecimalNumber)decimalNumberByMultiplyingByPowerOf10:(__int16)power withBehavior:(id)behavior
{
  uint64_t v5 = power;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v16 = 0uLL;
  int v17 = 0;
  int v8 = [behavior scale];
  v9 = (NSDecimal *)[behavior roundingMode];
  v14[0] = 0;
  v14[1] = 0;
  int v15 = 0;
  if (self) {
    [(NSDecimalNumber *)self decimalValue];
  }
  uint64_t v10 = _NSDecimalMultiplyByPowerOf10(&v16, v14, v5, v9);
  long long v12 = v16;
  int v13 = v17;
  return (NSDecimalNumber *)_checkErrorAndRound(v10, (uint64_t)a2, (uint64_t)self, 0, v8, v9, (uint64_t)&v12, behavior);
}

- (NSDecimalNumber)decimalNumberByRoundingAccordingToBehavior:(id)behavior
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  int v5 = [behavior scale];
  if (v5 == 0x7FFF)
  {
    uint64_t v6 = self;
    return v6;
  }
  else
  {
    int v8 = v5;
    long long v14 = 0uLL;
    int v15 = 0;
    v12[0] = 0;
    v12[1] = 0;
    int v13 = 0;
    if (self) {
      [(NSDecimalNumber *)self decimalValue];
    }
    _NSDecimalRound((uint64_t)&v14, (int)v12, v8, (NSDecimal *)[behavior roundingMode]);
    v9 = self;
    long long v10 = v14;
    int v11 = v15;
    return (NSDecimalNumber *)[v9 decimalNumberWithDecimal:&v10];
  }
}

+ (void)setDefaultBehavior:(id)defaultBehavior
{
  uint64_t v4 = [+[NSThread currentThread] threadDictionary];

  [(NSMutableDictionary *)v4 setObject:defaultBehavior forKey:@"NSDecimalNumberBehaviors"];
}

- (Class)classForCoder
{
  return (Class)self;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v10[0] = 0;
  v10[1] = 0;
  int v11 = 0;
  if (!self)
  {
    unsigned int v4 = 0;
    goto LABEL_5;
  }
  [(NSDecimalNumber *)self decimalValue];
  unsigned int v4 = (LODWORD(v10[0]) >> 8) & 0xF;
  if (v4 <= 7) {
LABEL_5:
  }
    bzero((char *)v10 + 2 * v4 + 4, 16 - 2 * v4);
  if ([a3 allowsKeyedCoding])
  {
    [a3 encodeInt32:SLOBYTE(v10[0]) forKey:@"NS.exponent"];
    [a3 encodeInt32:(LODWORD(v10[0]) >> 8) & 0xF forKey:@"NS.length"];
    [a3 encodeBool:(LODWORD(v10[0]) >> 12) & 1 forKey:@"NS.negative"];
    [a3 encodeBool:(LODWORD(v10[0]) >> 13) & 1 forKey:@"NS.compact"];
    [a3 encodeInt32:1 forKey:@"NS.mantissa.bo"];
    [a3 encodeBytes:(char *)v10 + 4 length:16 forKey:@"NS.mantissa"];
  }
  else
  {
    uint64_t v9 = SLOBYTE(v10[0]);
    __int16 v8 = (LODWORD(v10[0]) >> 8) & 0xF;
    BOOL v7 = (v10[0] & 0x1000) != 0;
    BOOL v6 = (v10[0] & 0x2000) != 0;
    uint64_t v5 = 8;
    [a3 encodeValueOfObjCType:"i" at:&v9];
    [a3 encodeValueOfObjCType:"S" at:&v8];
    [a3 encodeValueOfObjCType:"C" at:&v7];
    [a3 encodeValueOfObjCType:"C" at:&v6];
    [a3 encodeValueOfObjCType:"I" at:&v5];
    [a3 encodeArrayOfObjCType:"S" count:v5 at:(char *)v10 + 4];
  }
}

- (BOOL)_allowsDirectEncoding
{
  return 0;
}

- (char)charValue
{
  [(NSDecimalNumber *)self doubleValue];
  return (int)v2;
}

- (unsigned)unsignedCharValue
{
  [(NSDecimalNumber *)self doubleValue];
  return (int)v2;
}

- (signed)shortValue
{
  [(NSDecimalNumber *)self doubleValue];
  return (int)v2;
}

- (unsigned)unsignedShortValue
{
  [(NSDecimalNumber *)self doubleValue];
  return (int)v2;
}

- (int)intValue
{
  [(NSDecimalNumber *)self doubleValue];
  return (int)v2;
}

- (unsigned)unsignedIntValue
{
  [(NSDecimalNumber *)self doubleValue];
  return v2;
}

- (int64_t)longValue
{
  if ((*((unsigned char *)self + 9) & 0xF) != 0)
  {
    int64_t v2 = 0;
    uint64_t v3 = 2 * (*((unsigned char *)self + 9) & 0xF);
    do
    {
      int64_t v2 = *(unsigned __int16 *)((char *)self + v3 + 10) | (unint64_t)(v2 << 16);
      v3 -= 2;
    }
    while (v3);
  }
  else
  {
    int64_t v2 = 9;
    if ((*((unsigned char *)self + 9) & 0x10) != 0) {
      return v2;
    }
    int64_t v2 = 0;
  }
  uint64_t v4 = *((char *)self + 8);
  if ((v4 & 0x80000000) != 0)
  {
    uint64_t v5 = -(int)v4;
    do
    {
      v2 /= 10;
      --v5;
    }
    while (v5);
  }
  else if (*((unsigned char *)self + 8))
  {
    do
    {
      v2 *= 10;
      --v4;
    }
    while (v4);
  }
  if ((*((unsigned char *)self + 9) & 0x10) != 0) {
    return -v2;
  }
  return v2;
}

- (unint64_t)unsignedLongValue
{
  if ((*((unsigned char *)self + 9) & 0xF) != 0)
  {
    unint64_t v2 = 0;
    uint64_t v3 = 2 * (*((unsigned char *)self + 9) & 0xF);
    do
    {
      unint64_t v2 = *(unsigned __int16 *)((char *)self + v3 + 10) | (v2 << 16);
      v3 -= 2;
    }
    while (v3);
  }
  else
  {
    unint64_t v2 = 9;
    if ((*((unsigned char *)self + 9) & 0x10) != 0) {
      return v2;
    }
    unint64_t v2 = 0;
  }
  uint64_t v4 = *((char *)self + 8);
  if ((v4 & 0x80000000) != 0)
  {
    uint64_t v5 = -(int)v4;
    do
    {
      v2 /= 0xAuLL;
      --v5;
    }
    while (v5);
  }
  else if (*((unsigned char *)self + 8))
  {
    do
    {
      v2 *= 10;
      --v4;
    }
    while (v4);
  }
  if ((*((unsigned char *)self + 9) & 0x10) != 0) {
    return -(uint64_t)v2;
  }
  return v2;
}

- (int64_t)longLongValue
{
  if ((*((unsigned char *)self + 9) & 0xF) != 0)
  {
    int64_t v2 = 0;
    uint64_t v3 = 2 * (*((unsigned char *)self + 9) & 0xF);
    do
    {
      int64_t v2 = *(unsigned __int16 *)((char *)self + v3 + 10) | (unint64_t)(v2 << 16);
      v3 -= 2;
    }
    while (v3);
  }
  else
  {
    int64_t v2 = 9;
    if ((*((unsigned char *)self + 9) & 0x10) != 0) {
      return v2;
    }
    int64_t v2 = 0;
  }
  uint64_t v4 = *((char *)self + 8);
  if ((v4 & 0x80000000) != 0)
  {
    uint64_t v5 = -(int)v4;
    do
    {
      v2 /= 10;
      --v5;
    }
    while (v5);
  }
  else if (*((unsigned char *)self + 8))
  {
    do
    {
      v2 *= 10;
      --v4;
    }
    while (v4);
  }
  if ((*((unsigned char *)self + 9) & 0x10) != 0) {
    return -v2;
  }
  return v2;
}

- (unint64_t)unsignedLongLongValue
{
  if ((*((unsigned char *)self + 9) & 0xF) != 0)
  {
    unint64_t v2 = 0;
    uint64_t v3 = 2 * (*((unsigned char *)self + 9) & 0xF);
    do
    {
      unint64_t v2 = *(unsigned __int16 *)((char *)self + v3 + 10) | (v2 << 16);
      v3 -= 2;
    }
    while (v3);
  }
  else
  {
    unint64_t v2 = 9;
    if ((*((unsigned char *)self + 9) & 0x10) != 0) {
      return v2;
    }
    unint64_t v2 = 0;
  }
  uint64_t v4 = *((char *)self + 8);
  if ((v4 & 0x80000000) != 0)
  {
    uint64_t v5 = -(int)v4;
    do
    {
      v2 /= 0xAuLL;
      --v5;
    }
    while (v5);
  }
  else if (*((unsigned char *)self + 8))
  {
    do
    {
      v2 *= 10;
      --v4;
    }
    while (v4);
  }
  if ((*((unsigned char *)self + 9) & 0x10) != 0) {
    return -(uint64_t)v2;
  }
  return v2;
}

- (BOOL)BOOLValue
{
  [(NSDecimalNumber *)self doubleValue];
  return v2 != 0.0;
}

- (BOOL)_getCString:(char *)a3 length:(int)a4 multiplier:(double)a5
{
  if (a5 != 1.0)
  {
    __int16 v8 = [(NSNumber *)[NSDecimalNumber alloc] initWithDouble:a5];
    self = [(NSDecimalNumber *)self decimalNumberByMultiplyingBy:v8];
  }
  id v9 = [(NSDecimalNumber *)self description];

  return [v9 getCString:a3 maxLength:a4 encoding:1];
}

+ (NSDecimalNumber)numberWithChar:(char)a3
{
  uint64_t v3 = (void *)[objc_allocWithZone((Class)NSDecimalNumber) initWithChar:a3];

  return (NSDecimalNumber *)v3;
}

+ (NSDecimalNumber)numberWithUnsignedChar:(unsigned __int8)a3
{
  uint64_t v3 = (void *)[objc_allocWithZone((Class)NSDecimalNumber) initWithUnsignedChar:a3];

  return (NSDecimalNumber *)v3;
}

+ (NSDecimalNumber)numberWithShort:(signed __int16)a3
{
  uint64_t v3 = (void *)[objc_allocWithZone((Class)NSDecimalNumber) initWithShort:a3];

  return (NSDecimalNumber *)v3;
}

+ (NSDecimalNumber)numberWithUnsignedShort:(unsigned __int16)a3
{
  uint64_t v3 = (void *)[objc_allocWithZone((Class)NSDecimalNumber) initWithUnsignedShort:a3];

  return (NSDecimalNumber *)v3;
}

+ (NSDecimalNumber)numberWithInt:(int)a3
{
  uint64_t v3 = (void *)[objc_allocWithZone((Class)NSDecimalNumber) initWithInt:*(void *)&a3];

  return (NSDecimalNumber *)v3;
}

+ (NSDecimalNumber)numberWithInteger:(int64_t)a3
{
  uint64_t v3 = (void *)[objc_allocWithZone((Class)NSDecimalNumber) initWithInteger:a3];

  return (NSDecimalNumber *)v3;
}

+ (NSDecimalNumber)numberWithUnsignedInt:(unsigned int)a3
{
  uint64_t v3 = (void *)[objc_allocWithZone((Class)NSDecimalNumber) initWithUnsignedInt:*(void *)&a3];

  return (NSDecimalNumber *)v3;
}

+ (NSDecimalNumber)numberWithUnsignedInteger:(unint64_t)a3
{
  uint64_t v3 = (void *)[objc_allocWithZone((Class)NSDecimalNumber) initWithUnsignedInteger:a3];

  return (NSDecimalNumber *)v3;
}

+ (NSDecimalNumber)numberWithLong:(int64_t)a3
{
  uint64_t v3 = (void *)[objc_allocWithZone((Class)NSDecimalNumber) initWithLong:a3];

  return (NSDecimalNumber *)v3;
}

+ (NSDecimalNumber)numberWithUnsignedLong:(unint64_t)a3
{
  uint64_t v3 = (void *)[objc_allocWithZone((Class)NSDecimalNumber) initWithUnsignedLong:a3];

  return (NSDecimalNumber *)v3;
}

+ (NSDecimalNumber)numberWithLongLong:(int64_t)a3
{
  uint64_t v3 = (void *)[objc_allocWithZone((Class)NSDecimalNumber) initWithLongLong:a3];

  return (NSDecimalNumber *)v3;
}

+ (NSDecimalNumber)numberWithUnsignedLongLong:(unint64_t)a3
{
  uint64_t v3 = (void *)[objc_allocWithZone((Class)NSDecimalNumber) initWithUnsignedLongLong:a3];

  return (NSDecimalNumber *)v3;
}

+ (NSDecimalNumber)numberWithFloat:(float)a3
{
  id v4 = objc_allocWithZone((Class)NSDecimalNumber);
  *(float *)&double v5 = a3;
  BOOL v6 = (void *)[v4 initWithFloat:v5];

  return (NSDecimalNumber *)v6;
}

+ (NSDecimalNumber)numberWithDouble:(double)a3
{
  uint64_t v3 = (void *)[objc_allocWithZone((Class)NSDecimalNumber) initWithDouble:a3];

  return (NSDecimalNumber *)v3;
}

+ (NSDecimalNumber)numberWithBool:(BOOL)a3
{
  uint64_t v3 = (void *)[objc_allocWithZone((Class)NSDecimalNumber) initWithBool:a3];

  return (NSDecimalNumber *)v3;
}

@end