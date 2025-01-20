@interface CLKWorldClockTimeFormatter
+ (id)dayForOffset:(double)a3;
+ (id)differenceForOffset:(double)a3 caps:(BOOL)a4;
+ (id)differenceForOffset:(double)a3 caps:(BOOL)a4 suppressZero:(BOOL)a5;
+ (id)differenceForOffset:(double)a3 caps:(BOOL)a4 suppressZero:(BOOL)a5 size:(int64_t)a6;
+ (void)initialize;
+ (void)invalidateTimeZone:(id)a3;
@end

@implementation CLKWorldClockTimeFormatter

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v3 = [MEMORY[0x263F08A00] defaultCenter];
    [v3 addObserver:a1 selector:sel_invalidateTimeZone_ name:*MEMORY[0x263F83390] object:0];

    id v4 = [MEMORY[0x263F08A00] defaultCenter];
    [v4 addObserver:a1 selector:sel_invalidateTimeZone_ name:*MEMORY[0x263EFF5D0] object:0];
  }
}

+ (void)invalidateTimeZone:(id)a3
{
  objc_msgSend(MEMORY[0x263EFFA18], "resetSystemTimeZone", a3);
  id v3 = [MEMORY[0x263EFFA18] systemTimeZone];
  [(id)_dayFormatter setTimeZone:v3];
}

+ (id)dayForOffset:(double)a3
{
  if (!_dayFormatter)
  {
    id v4 = objc_alloc_init(MEMORY[0x263F08790]);
    v5 = (void *)_dayFormatter;
    _dayFormatter = (uint64_t)v4;

    v6 = [MEMORY[0x263EFF960] autoupdatingCurrentLocale];
    [(id)_dayFormatter setLocale:v6];

    v7 = [MEMORY[0x263EFFA18] systemTimeZone];
    [(id)_dayFormatter setTimeZone:v7];

    [(id)_dayFormatter setDateStyle:1];
    [(id)_dayFormatter setTimeStyle:0];
    [(id)_dayFormatter setDoesRelativeDateFormatting:1];
  }
  v8 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:a3];
  v9 = [(id)_dayFormatter stringFromDate:v8];

  return v9;
}

+ (id)differenceForOffset:(double)a3 caps:(BOOL)a4
{
  return (id)[a1 differenceForOffset:a4 caps:1 suppressZero:a3];
}

+ (id)differenceForOffset:(double)a3 caps:(BOOL)a4 suppressZero:(BOOL)a5
{
  return (id)[a1 differenceForOffset:a4 caps:a5 suppressZero:0 size:a3];
}

+ (id)differenceForOffset:(double)a3 caps:(BOOL)a4 suppressZero:(BOOL)a5 size:(int64_t)a6
{
  BOOL v8 = a4;
  v38[1] = *MEMORY[0x263EF8340];
  if (differenceForOffset_caps_suppressZero_size__onceToken != -1) {
    dispatch_once(&differenceForOffset_caps_suppressZero_size__onceToken, &__block_literal_global_25);
  }
  double v10 = fmod(a3, 3600.0);
  if (v10 < 0.0) {
    double v10 = -v10;
  }
  if (a3 >= 0.0) {
    double v11 = a3;
  }
  else {
    double v11 = -a3;
  }
  if (a3 != 0.0)
  {
    if (v11 >= 3600.0)
    {
      if (v11 != 3600.0 && v10 != 0.0)
      {
        [(id)differenceForOffset_caps_suppressZero_size__formatter setAllowedUnits:96];
        [(id)differenceForOffset_caps_suppressZero_size__formatter setUnitsStyle:0];
        goto LABEL_35;
      }
      if (!v8)
      {
LABEL_25:
        v15 = (void *)differenceForOffset_caps_suppressZero_size__formatter;
        uint64_t v16 = 32;
        goto LABEL_26;
      }
      if ((unint64_t)a6 > 2) {
        v17 = 0;
      }
      else {
        v17 = off_26440F238[a6];
      }
      v18 = CLKWorldClockLocalizedString(v17);
      v19 = NSString;
      double v20 = v11 / 3600.0;
    }
    else
    {
      if (!v8)
      {
        v15 = (void *)differenceForOffset_caps_suppressZero_size__formatter;
        uint64_t v16 = 64;
LABEL_26:
        objc_msgSend(v15, "setAllowedUnits:", v16, v10);
        [(id)differenceForOffset_caps_suppressZero_size__formatter setUnitsStyle:3];
        goto LABEL_35;
      }
      if ((unint64_t)a6 > 2) {
        v13 = 0;
      }
      else {
        v13 = off_26440F220[a6];
      }
      v18 = CLKWorldClockLocalizedString(v13);
      v19 = NSString;
      double v20 = v11 / 60.0;
    }
    objc_msgSend(v19, "localizedStringWithFormat:", v18, *(void *)&v20);
    goto LABEL_34;
  }
  if (!a5)
  {
    if (v8)
    {
      if ((unint64_t)a6 > 2) {
        v14 = 0;
      }
      else {
        v14 = off_26440F238[a6];
      }
      v18 = CLKWorldClockLocalizedString(v14);
      objc_msgSend(NSString, "localizedStringWithFormat:", v18, 0);
LABEL_34:
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();

      if (v12) {
        goto LABEL_36;
      }
LABEL_35:
      v12 = [(id)differenceForOffset_caps_suppressZero_size__formatter stringFromTimeInterval:v11];
      goto LABEL_36;
    }
    goto LABEL_25;
  }
  v12 = &stru_26CCC52F8;
LABEL_36:
  if (a3 != 0.0 || !a5)
  {
    uint64_t v21 = CLKLocaleCurrentNumberSystem();
    v22 = @"+";
    if (a3 < 0.0) {
      v22 = @"−";
    }
    v23 = &stru_26CCC52F8;
    if (v21 == 1) {
      v23 = @"\u200F";
    }
    uint64_t v24 = [NSString stringWithFormat:@"%@%@%@", v23, v22, v12];

    v12 = (__CFString *)v24;
  }
  uint64_t v25 = [(__CFString *)v12 rangeOfString:@"{", v10];
  if (v25 == 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_46;
  }
  uint64_t v27 = v25;
  uint64_t v28 = v26;
  uint64_t v29 = [(__CFString *)v12 rangeOfString:@"}"];
  if (v29 == 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_46;
  }
  uint64_t v31 = v29;
  uint64_t v32 = v30;
  v33 = (void *)[objc_alloc(MEMORY[0x263F089D8]) initWithString:v12];
  objc_msgSend(v33, "replaceCharactersInRange:withString:", v31, v32, &stru_26CCC52F8);
  objc_msgSend(v33, "replaceCharactersInRange:withString:", v27, v28, &stru_26CCC52F8);
  v34 = (void *)[objc_alloc(MEMORY[0x263F089B8]) initWithString:v33];
  v37 = @"CLKWorldClockCapsAttribute";
  v38[0] = MEMORY[0x263EFFA88];
  v35 = [NSDictionary dictionaryWithObjects:v38 forKeys:&v37 count:1];
  objc_msgSend(v34, "addAttributes:range:", v35, v27, v31 + ~v27);

  if (!v34) {
LABEL_46:
  }
    v34 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:v12];

  return v34;
}

uint64_t __73__CLKWorldClockTimeFormatter_differenceForOffset_caps_suppressZero_size___block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)differenceForOffset_caps_suppressZero_size__formatter;
  differenceForOffset_caps_suppressZero_size__formatter = v0;

  v2 = (void *)differenceForOffset_caps_suppressZero_size__formatter;

  return [v2 setUnitsStyle:3];
}

@end