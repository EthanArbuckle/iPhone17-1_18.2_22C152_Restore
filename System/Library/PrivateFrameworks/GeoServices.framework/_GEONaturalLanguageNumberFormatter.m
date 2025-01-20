@interface _GEONaturalLanguageNumberFormatter
- (BOOL)_isHalfDecimal:(double)a3 outIsExact:(BOOL *)a4;
- (BOOL)_isNumberNearNaturalNumber:(double)a3 outIsExact:(BOOL *)a4;
- (id)_string_nAndAHalfDistance:(id)a3 isApproximate:(BOOL)a4;
- (id)_string_nDistance:(id)a3 isApproximate:(BOOL)a4;
- (id)stringFromDistanceMeasurement:(id)a3 roundedDistanceMeasurement:(id)a4;
- (int)_tenthsDecimalPlace:(double)a3;
@end

@implementation _GEONaturalLanguageNumberFormatter

- (id)stringFromDistanceMeasurement:(id)a3 roundedDistanceMeasurement:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 unit];
  uint64_t v9 = [MEMORY[0x1E4F291E0] kilometers];
  if (v8 == (void *)v9)
  {
  }
  else
  {
    v10 = (void *)v9;
    v11 = [v6 unit];
    v12 = [MEMORY[0x1E4F291E0] miles];

    if (v11 != v12)
    {
LABEL_3:
      v13 = 0;
      goto LABEL_14;
    }
  }
  [v7 doubleValue];
  double v15 = v14;
  if (v14 >= 9.9)
  {
    v20 = self;
    id v21 = v7;
    BOOL v19 = 1;
    goto LABEL_12;
  }
  v16 = [v6 unit];
  v17 = [MEMORY[0x1E4F291E0] miles];

  if (v16 != v17 || ([v6 doubleValue], v18 >= 0.875) && v18 <= 1.0)
  {
LABEL_9:
    char v26 = 0;
    if (![(_GEONaturalLanguageNumberFormatter *)self _isNumberNearNaturalNumber:&v26 outIsExact:v15])
    {
      if (vcvtmd_s64_f64(v15) - 1 > 8
        || ![(_GEONaturalLanguageNumberFormatter *)self _isHalfDecimal:&v26 outIsExact:v15])
      {
        goto LABEL_3;
      }
      uint64_t v22 = [(_GEONaturalLanguageNumberFormatter *)self _string_nAndAHalfDistance:v7 isApproximate:v26 == 0];
      goto LABEL_13;
    }
    BOOL v19 = v26 == 0;
    v20 = self;
    id v21 = v7;
LABEL_12:
    uint64_t v22 = [(_GEONaturalLanguageNumberFormatter *)v20 _string_nDistance:v21 isApproximate:v19];
LABEL_13:
    v13 = (void *)v22;
    goto LABEL_14;
  }
  if (v18 < 0.625 || v18 >= 0.875)
  {
    if (v18 < 0.375 || v18 >= 0.625)
    {
      if (v18 >= 0.375) {
        goto LABEL_9;
      }
      v24 = +[GEOComposedString localizationProvider];
      uint64_t v25 = [v24 distanceAQuarterMile];
    }
    else
    {
      v24 = +[GEOComposedString localizationProvider];
      uint64_t v25 = [v24 distanceHalfAMile];
    }
  }
  else
  {
    v24 = +[GEOComposedString localizationProvider];
    uint64_t v25 = [v24 distanceThreeQuartersOfAMile];
  }
  v13 = (void *)v25;

LABEL_14:

  return v13;
}

- (id)_string_nDistance:(id)a3 isApproximate:(BOOL)a4
{
  id v6 = a3;
  id v7 = objc_opt_new();
  v8 = [(_GEONaturalLanguageNumberFormatter *)self locale];
  [v7 setLocale:v8];

  [v7 setUnitOptions:1];
  [v7 setUnitStyle:3];
  uint64_t v9 = [v7 numberFormatter];
  [v9 setRoundingMode:4];

  v10 = [v7 numberFormatter];
  [v10 setMaximumFractionDigits:0];

  v11 = [v7 stringFromMeasurement:v6];

  v12 = [v11 stringByReplacingOccurrencesOfString:@" " withString:@" "];

  if (a4)
  {
    v13 = +[GEOComposedString localizationProvider];
    double v14 = [v13 aboutNDistance];

    uint64_t v17 = 0;
    id v15 = [NSString localizedStringWithValidatedFormat:v14, @"%@", &v17, v12 validFormatSpecifiers error];
  }
  else
  {
    id v15 = v12;
  }

  return v15;
}

- (id)_string_nAndAHalfDistance:(id)a3 isApproximate:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  id v6 = [v5 unit];
  id v7 = [MEMORY[0x1E4F291E0] miles];

  v8 = +[GEOComposedString localizationProvider];
  uint64_t v9 = v8;
  if (v6 == v7)
  {
    if (v4) {
      [v8 aboutDistanceAndAHalfMiles];
    }
    else {
      [v8 distanceAndAHalfMiles];
    }
  }
  else if (v4)
  {
    [v8 aboutDistanceAndAHalfKilometers];
  }
  else
  {
    [v8 distanceAndAHalfKilometers];
  uint64_t v10 = };
  v11 = (void *)v10;

  [v5 doubleValue];
  double v13 = v12;

  LODWORD(v14) = vcvtmd_s64_f64(v13);
  uint64_t v17 = 0;
  id v15 = objc_msgSend(NSString, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v11, @"%d", &v17, v14);

  return v15;
}

- (BOOL)_isHalfDecimal:(double)a3 outIsExact:(BOOL *)a4
{
  int v5 = [(_GEONaturalLanguageNumberFormatter *)self _tenthsDecimalPlace:a3];
  unsigned int v6 = v5 - 4;
  if (a4 && v6 <= 2) {
    *a4 = v5 == 5;
  }
  return v6 < 3;
}

- (BOOL)_isNumberNearNaturalNumber:(double)a3 outIsExact:(BOOL *)a4
{
  if ((int)llround(a3) < 1) {
    return 0;
  }
  unsigned int v5 = -[_GEONaturalLanguageNumberFormatter _tenthsDecimalPlace:](self, "_tenthsDecimalPlace:");
  BOOL result = 0;
  if (v5 <= 9 && ((1 << v5) & 0x203) != 0)
  {
    if (a4) {
      *a4 = v5 == 0;
    }
    return 1;
  }
  return result;
}

- (int)_tenthsDecimalPlace:(double)a3
{
  return llround((a3 - floor(a3)) * 10.0);
}

@end