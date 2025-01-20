@interface NSDecimalNumber(DecimalNumberShortcuts)
+ (id)abs:()DecimalNumberShortcuts;
+ (uint64_t)defaultDatabaseAmountMultiplier;
- (BOOL)greaterThan:()DecimalNumberShortcuts;
- (BOOL)greaterThanOrEqual:()DecimalNumberShortcuts;
- (BOOL)isNegative;
- (BOOL)isOne;
- (BOOL)isPositive;
- (BOOL)isValid;
- (BOOL)isZero;
- (BOOL)lessThan:()DecimalNumberShortcuts;
- (BOOL)lessThanOrEqual:()DecimalNumberShortcuts;
@end

@implementation NSDecimalNumber(DecimalNumberShortcuts)

- (BOOL)isNegative
{
  BOOL v1 = (BOOL)a1;
  if (a1)
  {
    if ([a1 isValid])
    {
      v2 = [MEMORY[0x263F087B0] zero];
      BOOL v1 = [(id)v1 compare:v2] == -1;
    }
    else
    {
      return 0;
    }
  }
  return v1;
}

- (BOOL)isPositive
{
  BOOL v1 = (BOOL)a1;
  if (a1)
  {
    if ([a1 isValid])
    {
      v2 = [MEMORY[0x263F087B0] zero];
      BOOL v1 = [(id)v1 compare:v2] == 1;
    }
    else
    {
      return 0;
    }
  }
  return v1;
}

- (BOOL)isZero
{
  BOOL v1 = (BOOL)a1;
  if (a1)
  {
    if ([a1 isValid])
    {
      v2 = [MEMORY[0x263F087B0] zero];
      BOOL v1 = [(id)v1 compare:v2] == 0;
    }
    else
    {
      return 0;
    }
  }
  return v1;
}

- (BOOL)isOne
{
  BOOL v1 = (BOOL)a1;
  if (a1)
  {
    if ([a1 isValid])
    {
      v2 = [MEMORY[0x263F087B0] one];
      BOOL v1 = [(id)v1 compare:v2] == 0;
    }
    else
    {
      return 0;
    }
  }
  return v1;
}

- (BOOL)isValid
{
  v2 = [MEMORY[0x263F087B0] notANumber];
  BOOL v3 = [a1 compare:v2] != 0;

  return v3;
}

- (BOOL)lessThan:()DecimalNumberShortcuts
{
  id v4 = a3;
  BOOL v5 = [a1 isValid]
    && [v4 isValid]
    && [a1 compare:v4] == -1;

  return v5;
}

- (BOOL)lessThanOrEqual:()DecimalNumberShortcuts
{
  id v4 = a3;
  BOOL v5 = ([a1 lessThan:v4] & 1) != 0 || objc_msgSend(a1, "compare:", v4) == 0;

  return v5;
}

- (BOOL)greaterThan:()DecimalNumberShortcuts
{
  id v4 = a3;
  BOOL v5 = [a1 isValid]
    && [v4 isValid]
    && [a1 compare:v4] == 1;

  return v5;
}

- (BOOL)greaterThanOrEqual:()DecimalNumberShortcuts
{
  id v4 = a3;
  BOOL v5 = ([a1 greaterThan:v4] & 1) != 0 || objc_msgSend(a1, "compare:", v4) == 0;

  return v5;
}

+ (uint64_t)defaultDatabaseAmountMultiplier
{
  return [MEMORY[0x263F087B0] decimalNumberWithString:@"100"];
}

+ (id)abs:()DecimalNumberShortcuts
{
  id v3 = a3;
  id v4 = [MEMORY[0x263F087B0] zero];
  uint64_t v5 = [v3 compare:v4];

  if (v5 == -1)
  {
    v7 = [MEMORY[0x263F087B0] decimalNumberWithMantissa:1 exponent:0 isNegative:1];
    id v6 = [v3 decimalNumberByMultiplyingBy:v7];
  }
  else
  {
    id v6 = v3;
  }

  return v6;
}

@end