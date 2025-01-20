@interface DTUserTimeFormatter
+ (id)stringForNanoseconds:(unint64_t)a3;
+ (id)stringForNanoseconds:(unint64_t)a3 highestResolutionTimeEnabled:(BOOL)a4;
+ (id)stringForObjectValue:(id)a3;
+ (void)initialize;
- (id)stringForObjectValue:(id)a3;
@end

@implementation DTUserTimeFormatter

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    id v2 = objc_alloc_init(MEMORY[0x263F08A30]);
    v3 = (void *)qword_2687AA298;
    qword_2687AA298 = (uint64_t)v2;

    [qword_2687AA298 objc_msgSend_positiveInfinitySymbol:v4, v5, v6, v7];
    id v19 = (id)objc_claimAutoreleasedReturnValue();
    if ([v19 length:v8, v9, v10, v11] == 2)
    {
      v15 = [v19 substringFromIndex:v12];
      [qword_2687AA298 setPositiveInfinitySymbol:v16 value:v15];
    }
  }
}

+ (id)stringForNanoseconds:(unint64_t)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if (a3)
  {
    if (a3 > 0x3E7)
    {
      if (a3 > 0xF423F)
      {
        if (a3 > 0x3B9AC9FF)
        {
          if (a3 > 0xDF84757FFLL) {
            snprintf(__str, 0x80uLL, "%3.2f min");
          }
          else {
            snprintf(__str, 0x80uLL, "%3.2f s");
          }
        }
        else
        {
          snprintf(__str, 0x80uLL, "%3.2f ms");
        }
      }
      else
      {
        snprintf(__str, 0x80uLL, "%3.2f µs");
      }
    }
    else
    {
      snprintf(__str, 0x80uLL, "%llu ns");
    }
    [NSString stringWithUTF8String:(const char *)__str];
    uint64_t v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v6 = @"0 s";
  }

  return v6;
}

+ (id)stringForNanoseconds:(unint64_t)a3 highestResolutionTimeEnabled:(BOOL)a4
{
  if (a4) {
    [NSString stringWithFormat:@"%llu ns", a4, v4, a3];
  }
  else {
  uint64_t v5 = [a1 stringForNanoseconds:a2:a3:a4:v4];
  }

  return v5;
}

+ (id)stringForObjectValue:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v23 = [v3 descriptionWithLocale:v4 indent:v5];
    goto LABEL_7;
  }
  id v8 = v3;
  uint64_t v13 = (const char *)[v8 objCType:v9, v10, v11, v12];
  if (strcmp(v13, "f") && strcmp(v13, "d") || ([v8 doubleValueForSelector:v14 withObject:v15 withObject:v16 withObject:v17] != INFINITY))
  {
    uint64_t v19 = [v8 performSelector:v14 withObject:v15 withObject:v16 withObject:v17];
    uint64_t v23 = [DTUserTimeFormatter stringForNanoseconds:v20];
LABEL_7:
    v24 = (void *)v23;
    goto LABEL_8;
  }
  v26 = NSString;
  v27 = [qword_2687AA298 stringFromNumber:v14 withDecimalPlaces:v8 andRoundingMode:v16 andRoundingPrecision:v17];
  v24 = [v26 stringWithFormat:@"%@ s", v29, v30, v27];

LABEL_8:

  return v24;
}

- (id)stringForObjectValue:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v28.receiver = self;
    v28.super_class = (Class)DTUserTimeFormatter;
    uint64_t v20 = [(DTUserTimeFormatter *)&v28 stringForObjectValue:v4];
    goto LABEL_7;
  }
  id v5 = v4;
  uint64_t v10 = (const char *)[v5 objCType:v6, v7, v8, v9];
  if (strcmp(v10, "f") && strcmp(v10, "d") || ([v5 doubleValueFor:v11 with:v12 with:v13 with:v14] != INFINITY && fabs(v15) != INFINITY))
  {
    uint64_t v16 = [v5 unsignedLongLongValueWith:v11, v12, v13, v14];
    uint64_t v20 = [DTUserTimeFormatter stringForNanoseconds:v17];
LABEL_7:
    uint64_t v21 = (void *)v20;
    goto LABEL_8;
  }
  uint64_t v23 = NSString;
  v24 = [qword_2687AA298 stringFromNumber:v11 withNumber:v5 andNumber:v13 andNumber:v14];
  uint64_t v21 = [v23 stringWithFormat:@"%@ s", v26, v27, v24];

LABEL_8:

  return v21;
}

@end