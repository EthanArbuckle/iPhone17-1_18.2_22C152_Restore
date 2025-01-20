@interface CPLDateFormatter
+ (id)_formatter;
+ (id)dateFromString:(id)a3;
+ (id)stringForTimeInterval:(double)a3;
+ (id)stringForTimeIntervalAgo:(id)a3 now:(id)a4;
+ (id)stringFromDate:(id)a3;
+ (id)stringFromDateAgo:(id)a3 now:(id)a4;
@end

@implementation CPLDateFormatter

+ (id)dateFromString:(id)a3
{
  id v4 = a3;
  v5 = [a1 _formatter];
  v6 = [v5 dateFromString:v4];

  return v6;
}

+ (id)stringForTimeInterval:(double)a3
{
  double v4 = -a3;
  if (a3 >= 0.0) {
    double v5 = a3;
  }
  else {
    double v5 = -a3;
  }
  if (v5 < 1.0)
  {
    v6 = @"now";
    return v6;
  }
  if (a3 > 0.0) {
    double v4 = a3;
  }
  v8 = "-";
  if (a3 > 0.0) {
    v8 = "";
  }
  if (v4 <= 86400.0)
  {
    if (v4 <= 3600.0)
    {
      if (v4 <= 60.0)
      {
        v13 = @"s";
        double v9 = v4;
      }
      else
      {
        double v9 = floor(v4 / 60.0);
        double v11 = v4 - v9 * 60.0;
        v13 = @" min";
        if (v11 >= 1.0)
        {
          v12 = @"s";
          goto LABEL_22;
        }
      }
    }
    else
    {
      double v9 = floor(v4 / 3600.0);
      double v14 = v4 - v9 * 3600.0;
      if (v14 > 60.0)
      {
        double v11 = floor(v14 / 60.0);
        v12 = @" min";
        v13 = @" hours";
        goto LABEL_22;
      }
      v13 = @" hours";
    }
  }
  else
  {
    double v9 = floor(v4 / 86400.0);
    double v10 = v4 - v9 * 86400.0;
    if (v10 > 3600.0)
    {
      double v11 = floor(v10 / 3600.0);
      v12 = @" hours";
      v13 = @" days";
LABEL_22:
      [NSString stringWithFormat:@"%s%.0f%@ %.0f%@", v8, *(void *)&v9, v13, *(void *)&v11, v12];
      goto LABEL_26;
    }
    v13 = @" days";
  }
  [NSString stringWithFormat:@"%s%.0f%@", v8, *(void *)&v9, v13, v15, v16];
LABEL_26:
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  return v6;
}

+ (id)stringForTimeIntervalAgo:(id)a3 now:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    id v7 = [MEMORY[0x1E4F1C9C8] date];
  }
  [v7 timeIntervalSinceDate:v6];
  if (v8 >= 0.0) {
    double v9 = v8;
  }
  else {
    double v9 = -v8;
  }
  if (v9 >= 1.0)
  {
    double v11 = NSString;
    if (v8 > 0.0)
    {
      v12 = objc_msgSend(a1, "stringForTimeInterval:");
      [v11 stringWithFormat:@"%@ ago", v12];
    }
    else
    {
      v12 = [a1 stringForTimeInterval:-v8];
      [v11 stringWithFormat:@"in %@", v12];
    }
    double v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    double v10 = @"just now";
  }

  return v10;
}

+ (id)stringFromDateAgo:(id)a3 now:(id)a4
{
  id v6 = NSString;
  id v7 = a3;
  double v8 = [a1 stringForTimeIntervalAgo:v7 now:a4];
  double v9 = [a1 stringFromDate:v7];

  double v10 = [v6 stringWithFormat:@"%@ (%@)", v8, v9];

  return v10;
}

+ (id)stringFromDate:(id)a3
{
  id v4 = a3;
  double v5 = [a1 _formatter];
  id v6 = [v5 stringFromDate:v4];

  return v6;
}

+ (id)_formatter
{
  if (_formatter_onceToken != -1) {
    dispatch_once(&_formatter_onceToken, &__block_literal_global_23114);
  }
  v2 = (void *)_formatter_formatter;
  return v2;
}

void __30__CPLDateFormatter__formatter__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v1 = (void *)_formatter_formatter;
  _formatter_formatter = (uint64_t)v0;

  [(id)_formatter_formatter setDateFormat:@"yyyy-MM-dd HH.mm.ss.SSS"];
  v2 = (void *)_formatter_formatter;
  id v3 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:@"en_US"];
  [v2 setLocale:v3];
}

@end