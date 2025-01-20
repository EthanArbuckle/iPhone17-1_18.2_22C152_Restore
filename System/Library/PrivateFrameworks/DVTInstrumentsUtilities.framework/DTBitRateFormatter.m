@interface DTBitRateFormatter
+ (id)stringForLongLong:(int64_t)a3;
- (id)stringForObjectValue:(id)a3;
@end

@implementation DTBitRateFormatter

+ (id)stringForLongLong:(int64_t)a3
{
  v10 = [DTBytesFormatter magnitudeFormatterWithUnit:a2 unit:a3 value:v3];
  if (a3 >= 0) {
    unint64_t v11 = a3;
  }
  else {
    unint64_t v11 = -a3;
  }
  if (v11 < 0xE8D4A51000)
  {
    if (v11 < 0x3B9ACA00)
    {
      if (v11 < 0xF4240)
      {
        v35 = NSString;
        if (v11 < 0x3E8)
        {
          v13 = [NSNumber numberWithLongLong:a3];
          v17 = [v10 stringFromNumber:v42];
          [v35 stringWithFormat:@"%@ %@ %@ bit/s", v46, v47, v17];
        }
        else
        {
          v13 = [NSNumber numberWithDouble:v6 / 1000.0];
          v17 = [v10 stringFromNumber:v36];
          [v35 stringWithFormat:@"%@ %@ %@ kbit/s", v40, v41, v17];
        }
      }
      else
      {
        v28 = NSString;
        v13 = [NSNumber numberWithDouble:v6 / 1000000.0];
        v17 = [v10 stringFromNumber:v29];
        [v28 stringWithFormat:@"%@ %@ %@ Mbit/s", v33, v34, v17];
      }
    }
    else
    {
      v21 = NSString;
      v13 = [NSNumber numberWithDouble:v6 / 1000000000.0];
      v17 = [v10 stringFromNumber:v22];
      [v21 stringWithFormat:@"%@ %@ %@ Gbit/s", v26, v27, v17];
    }
  }
  else
  {
    v12 = NSString;
    v13 = [NSNumber numberWithDouble:v6 / 1.0e12];
    v17 = [v10 stringFromNumber:v14 withPrecision:(uint64_t)v13 andRoundingMode:v15 andFormat:(NSString *)v16];
    [v12 stringWithFormat:@"%@ %@ %@ Tbit/s", v19, v20, v17];
  v48 = };

  return v48;
}

- (id)stringForObjectValue:(id)a3
{
  id v3 = a3;
  if (objc_opt_respondsToSelector())
  {
    uint64_t v8 = [v3 v4:v5 v6:v7];
    v12 = [DTBitRateFormatter stringForLongLong:v9 withUnit:v8 withPrecision:v10 withSuffix:v11];
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

@end