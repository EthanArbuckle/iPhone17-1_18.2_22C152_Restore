@interface NSDecimalNumberHandler
+ (NSDecimalNumberHandler)decimalNumberHandlerWithRoundingMode:(NSRoundingMode)roundingMode scale:(__int16)scale raiseOnExactness:(BOOL)exact raiseOnOverflow:(BOOL)overflow raiseOnUnderflow:(BOOL)underflow raiseOnDivideByZero:(BOOL)divideByZero;
+ (NSDecimalNumberHandler)defaultDecimalNumberHandler;
- (NSDecimalNumberHandler)initWithCoder:(id)a3;
- (NSDecimalNumberHandler)initWithRoundingMode:(NSRoundingMode)roundingMode scale:(__int16)scale raiseOnExactness:(BOOL)exact raiseOnOverflow:(BOOL)overflow raiseOnUnderflow:(BOOL)underflow raiseOnDivideByZero:(BOOL)divideByZero;
- (id)exceptionDuringOperation:(SEL)a3 error:(unint64_t)a4 leftOperand:(id)a5 rightOperand:(id)a6;
- (signed)scale;
- (unint64_t)roundingMode;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NSDecimalNumberHandler

- (id)exceptionDuringOperation:(SEL)a3 error:(unint64_t)a4 leftOperand:(id)a5 rightOperand:(id)a6
{
  switch(a4)
  {
    case 1uLL:
      if ((*((unsigned char *)self + 10) & 8) == 0) {
        return 0;
      }
      v6 = (void *)MEMORY[0x1E4F1CA00];
      v7 = @"NSDecimalNumberExactnessException";
      v8 = @"NSDecimalNumber exactness exception";
      break;
    case 2uLL:
      if ((*((unsigned char *)self + 10) & 0x20) == 0) {
        return 0;
      }
      v6 = (void *)MEMORY[0x1E4F1CA00];
      v7 = @"NSDecimalNumberUnderflowException";
      v8 = @"NSDecimalNumber underflow exception";
      break;
    case 3uLL:
      if ((*((unsigned char *)self + 10) & 0x10) == 0) {
        return 0;
      }
      v6 = (void *)MEMORY[0x1E4F1CA00];
      v7 = @"NSDecimalNumberOverflowException";
      v8 = @"NSDecimalNumber overflow exception";
      break;
    case 4uLL:
      if ((*((unsigned char *)self + 10) & 0x40) == 0) {
        return 0;
      }
      v6 = (void *)MEMORY[0x1E4F1CA00];
      v7 = @"NSDecimalNumberDivideByZeroException";
      v8 = @"NSDecimalNumber divide by zero exception";
      break;
    default:
      return 0;
  }
  objc_exception_throw((id)objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v8, 0, a6));
}

+ (NSDecimalNumberHandler)defaultDecimalNumberHandler
{
  result = (NSDecimalNumberHandler *)defaultDecimalNumberHandler_b;
  if (!defaultDecimalNumberHandler_b)
  {
    result = (NSDecimalNumberHandler *)[objc_allocWithZone((Class)a1) initWithRoundingMode:0 scale:0x7FFFLL raiseOnExactness:0 raiseOnOverflow:1 raiseOnUnderflow:1 raiseOnDivideByZero:1];
    defaultDecimalNumberHandler_b = (uint64_t)result;
  }
  return result;
}

- (NSDecimalNumberHandler)initWithRoundingMode:(NSRoundingMode)roundingMode scale:(__int16)scale raiseOnExactness:(BOOL)exact raiseOnOverflow:(BOOL)overflow raiseOnUnderflow:(BOOL)underflow raiseOnDivideByZero:(BOOL)divideByZero
{
  BOOL v8 = divideByZero;
  BOOL v9 = underflow;
  BOOL v10 = overflow;
  BOOL v11 = exact;
  char v13 = roundingMode;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v20.receiver = self;
  v20.super_class = (Class)NSDecimalNumberHandler;
  result = [(NSDecimalNumberHandler *)&v20 init];
  char v15 = *((unsigned char *)result + 10) & 0x80;
  *((_WORD *)result + 4) = scale;
  if (v11) {
    char v16 = 8;
  }
  else {
    char v16 = 0;
  }
  if (v10) {
    char v17 = 16;
  }
  else {
    char v17 = 0;
  }
  if (v9) {
    char v18 = 32;
  }
  else {
    char v18 = 0;
  }
  if (v8) {
    char v19 = 64;
  }
  else {
    char v19 = 0;
  }
  *((unsigned char *)result + 10) = v16 & 0xF8 | v13 & 7 | v17 | v18 | v19 | v15;
  return result;
}

- (signed)scale
{
  return *((_WORD *)self + 4);
}

- (unint64_t)roundingMode
{
  return *((unsigned char *)self + 10) & 7;
}

+ (NSDecimalNumberHandler)decimalNumberHandlerWithRoundingMode:(NSRoundingMode)roundingMode scale:(__int16)scale raiseOnExactness:(BOOL)exact raiseOnOverflow:(BOOL)overflow raiseOnUnderflow:(BOOL)underflow raiseOnDivideByZero:(BOOL)divideByZero
{
  BOOL v8 = (void *)[objc_allocWithZone((Class)a1) initWithRoundingMode:roundingMode scale:scale raiseOnExactness:exact raiseOnOverflow:overflow raiseOnUnderflow:underflow raiseOnDivideByZero:divideByZero];

  return (NSDecimalNumberHandler *)v8;
}

- (void)encodeWithCoder:(id)a3
{
  if (![a3 allowsKeyedCoding]) {
    return;
  }
  if ((*((unsigned char *)self + 10) & 7) != 0) {
    objc_msgSend(a3, "encodeInteger:forKey:");
  }
  uint64_t v5 = *((__int16 *)self + 4);
  if (v5 != 0x7FFF) {
    [a3 encodeInteger:v5 forKey:@"NS.scale"];
  }
  char v6 = *((unsigned char *)self + 10);
  if ((v6 & 8) != 0)
  {
    [a3 encodeBool:1 forKey:@"NS.raise.exactness"];
    char v6 = *((unsigned char *)self + 10);
    if ((v6 & 0x10) == 0)
    {
LABEL_8:
      if ((v6 & 0x20) == 0) {
        goto LABEL_9;
      }
LABEL_13:
      [a3 encodeBool:1 forKey:@"NS.raise.underflow"];
      if ((*((unsigned char *)self + 10) & 0x40) == 0) {
        return;
      }
      goto LABEL_14;
    }
  }
  else if ((*((unsigned char *)self + 10) & 0x10) == 0)
  {
    goto LABEL_8;
  }
  [a3 encodeBool:1 forKey:@"NS.raise.overflow"];
  char v6 = *((unsigned char *)self + 10);
  if ((v6 & 0x20) != 0) {
    goto LABEL_13;
  }
LABEL_9:
  if ((v6 & 0x40) == 0) {
    return;
  }
LABEL_14:

  [a3 encodeBool:1 forKey:@"NS.raise.dividebyzero"];
}

- (NSDecimalNumberHandler)initWithCoder:(id)a3
{
  if ([a3 allowsKeyedCoding])
  {
    uint64_t v5 = [a3 decodeIntegerForKey:@"NS.roundingmode"];
    if ([a3 containsValueForKey:@"NS.scale"]) {
      __int16 v6 = [a3 decodeIntegerForKey:@"NS.scale"];
    }
    else {
      __int16 v6 = 0x7FFF;
    }
    uint64_t v8 = [a3 decodeBoolForKey:@"NS.raise.exactness"];
    uint64_t v9 = [a3 decodeBoolForKey:@"NS.raise.overflow"];
    uint64_t v10 = [a3 decodeBoolForKey:@"NS.raise.underflow"];
    uint64_t v11 = [a3 decodeBoolForKey:@"NS.raise.dividebyzero"];
    return [(NSDecimalNumberHandler *)self initWithRoundingMode:v5 scale:v6 raiseOnExactness:v8 raiseOnOverflow:v9 raiseOnUnderflow:v10 raiseOnDivideByZero:v11];
  }
  else
  {

    return 0;
  }
}

@end