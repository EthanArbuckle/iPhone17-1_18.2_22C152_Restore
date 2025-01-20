@interface NSString(MKAdditions)
+ (id)_mapkit_commaListDelimiter;
+ (id)_mapkit_formattedStringForCoordinate:()MKAdditions;
+ (id)_mapkit_formattedStringForFloat:()MKAdditions;
+ (id)_mapkit_formattedStringForFloatingPointNumber:()MKAdditions;
+ (id)_mapkit_shortenedURLStringForFullURLString:()MKAdditions;
+ (uint64_t)_mapkit_localizedDistanceStringWithMeters:()MKAdditions abbreviated:;
+ (uint64_t)_mapkit_voiceOverLocalizedDistanceStringWithMeters:()MKAdditions;
- (id)_mapkit_componentsSeparatedFromCommaDelimitedList;
@end

@implementation NSString(MKAdditions)

+ (id)_mapkit_formattedStringForFloat:()MKAdditions
{
  v2 = objc_msgSend(NSNumber, "numberWithDouble:");
  v3 = objc_msgSend(a1, "_mapkit_formattedStringForFloatingPointNumber:", v2);

  return v3;
}

+ (id)_mapkit_formattedStringForFloatingPointNumber:()MKAdditions
{
  id v3 = a3;
  [v3 doubleValue];
  double v5 = v4;
  v6 = (void *)_mapkit_formattedStringForFloatingPointNumber__numberFormatter;
  if (!_mapkit_formattedStringForFloatingPointNumber__numberFormatter)
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
    v8 = (void *)_mapkit_formattedStringForFloatingPointNumber__numberFormatter;
    _mapkit_formattedStringForFloatingPointNumber__numberFormatter = (uint64_t)v7;

    v9 = (void *)_mapkit_formattedStringForFloatingPointNumber__numberFormatter;
    v10 = [MEMORY[0x1E4F1CA20] autoupdatingCurrentLocale];
    [v9 setLocale:v10];

    [(id)_mapkit_formattedStringForFloatingPointNumber__numberFormatter setNumberStyle:1];
    [(id)_mapkit_formattedStringForFloatingPointNumber__numberFormatter setRoundingMode:6];
    v6 = (void *)_mapkit_formattedStringForFloatingPointNumber__numberFormatter;
  }
  if (v5 >= 100.0)
  {
    [v6 setUsesSignificantDigits:1];
    [(id)_mapkit_formattedStringForFloatingPointNumber__numberFormatter setMaximumSignificantDigits:3];
    uint64_t v11 = 0;
  }
  else
  {
    [v6 setUsesSignificantDigits:0];
    uint64_t v11 = 1;
  }
  [(id)_mapkit_formattedStringForFloatingPointNumber__numberFormatter setMaximumFractionDigits:v11];
  v12 = [(id)_mapkit_formattedStringForFloatingPointNumber__numberFormatter stringFromNumber:v3];

  return v12;
}

+ (uint64_t)_mapkit_localizedDistanceStringWithMeters:()MKAdditions abbreviated:
{
  if (qword_1EB315EA8 != -1) {
    dispatch_once(&qword_1EB315EA8, &__block_literal_global_124);
  }
  if (a4) {
    [(id)qword_1EB315EA0 setUnitStyle:1];
  }
  v6 = (void *)qword_1EB315EA0;

  return [v6 stringFromDistance:(double)a3];
}

+ (uint64_t)_mapkit_voiceOverLocalizedDistanceStringWithMeters:()MKAdditions
{
  if (qword_1EB315EB8 != -1) {
    dispatch_once(&qword_1EB315EB8, &__block_literal_global_127);
  }
  double v4 = (void *)qword_1EB315EB0;

  return [v4 stringFromDistance:(double)a3];
}

+ (id)_mapkit_formattedStringForCoordinate:()MKAdditions
{
  double v4 = _CreateCoordinateComponentString(0, a1, a2);
  double v5 = _CreateCoordinateComponentString(1, a1, a2);
  id v6 = [NSString alloc];
  id v7 = _MKLocalizedStringFromThisBundle(@"%@, %@");
  v8 = objc_msgSend(v6, "initWithFormat:", v7, v4, v5, 0);

  return v8;
}

+ (id)_mapkit_commaListDelimiter
{
  return _MKLocalizedStringFromThisBundle(@", ");
}

- (id)_mapkit_componentsSeparatedFromCommaDelimitedList
{
  v2 = objc_msgSend(NSString, "_mapkit_commaListDelimiter");
  id v3 = [a1 componentsSeparatedByString:v2];

  return v3;
}

+ (id)_mapkit_shortenedURLStringForFullURLString:()MKAdditions
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v4 = [&unk_1ED97F428 countByEnumeratingWithState:&v14 objects:v18 count:16];
  double v5 = v3;
  if (v4)
  {
    uint64_t v6 = v4;
    uint64_t v7 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(&unk_1ED97F428);
        }
        v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if ([v3 hasPrefix:v9])
        {
          double v5 = objc_msgSend(v3, "substringFromIndex:", objc_msgSend(v9, "length"));

          goto LABEL_11;
        }
      }
      uint64_t v6 = [&unk_1ED97F428 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v6) {
        continue;
      }
      break;
    }
    double v5 = v3;
  }
LABEL_11:
  if ([v5 hasSuffix:@"/"])
  {
    uint64_t v10 = objc_msgSend(v5, "substringToIndex:", objc_msgSend(v5, "length") - 1);

    double v5 = (void *)v10;
  }
  if ((unint64_t)[v5 length] >= 0x21)
  {
    uint64_t v11 = [v5 rangeOfString:@"/"];
    if (v11)
    {
      if (v11 != 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v12 = [v5 substringToIndex:v11];

        double v5 = (void *)v12;
      }
    }
  }

  return v5;
}

@end