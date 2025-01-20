@interface DTNanoTimestampFormatter
+ (id)stringForNanoseconds:(unint64_t)a3;
+ (id)stringForNanoseconds:(unint64_t)a3 highestResolutionTimeEnabled:(BOOL)a4;
- (id)stringForObjectValue:(id)a3;
@end

@implementation DTNanoTimestampFormatter

+ (id)stringForNanoseconds:(unint64_t)a3
{
  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = @"--:--.--";
  }
  else
  {
    [NSString stringWithFormat:@"%02llu:%02llu.%03llu.%03llu", v3, v4, a3 / 0xDF8475800, a3 / 0x3B9ACA00 - 60 * ((a3 / 0x3B9ACA00 * (unsigned __int128)0x444444444444445uLL) >> 64), (void)(a3 / 0xF4240 - 1000 * ((a3 / 0xF4240 * (unsigned __int128)0x4189374BC6A7F0uLL) >> 64)), (void)(a3 / 0x3E8 - 1000 * ((a3 / 0x3E8 * (unsigned __int128)0x4189374BC6A7F0uLL) >> 64))];
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

+ (id)stringForNanoseconds:(unint64_t)a3 highestResolutionTimeEnabled:(BOOL)a4
{
  BOOL v5 = a4;
  v7 = [DTNanoTimestampFormatter stringForNanoseconds:a2:a3:a4:v4];
  v11 = v7;
  if (v5)
  {
    v12 = [NSString stringWithFormat:@".%03llu", v9, v10, a3 % 0x3E8];
    [v11 stringByAppendingString:v13];
    id v16 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v16 = v7;
  }

  return v16;
}

- (id)stringForObjectValue:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = [v4 v5:v6:v7:v8];

    v13 = [DTNanoTimestampFormatter stringForNanoseconds:v10 withPrecision:v9 andRoundingMode:v11 andRoundingPrecision:v12];
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)DTNanoTimestampFormatter;
    v13 = [(DTNanoTimestampFormatter *)&v15 stringForObjectValue:v4];
  }

  return v13;
}

@end