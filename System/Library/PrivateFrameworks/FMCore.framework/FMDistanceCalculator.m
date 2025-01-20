@interface FMDistanceCalculator
- (FMDistanceCalculator)init;
- (FMDistanceCalculator)initWithDefaultsSuiteName:(id)a3;
- (FMDistanceCalculator)initWithDefaultsSuiteName:(id)a3 locale:(id)a4;
- (FMDistanceCalculator)initWithDefaultsSuiteName:(id)a3 locale:(id)a4 measurementSystemLocale:(id)a5;
- (FMDistanceCalculatorLocalizationDelegate)localizationDelegate;
- (NSLocale)locale;
- (NSLocale)measurementSystemLocale;
- (NSNumberFormatter)formatter;
- (NSUserDefaults)userDefaults;
- (OS_dispatch_queue)calculationQueue;
- (double)averageDistanceFromLocation:(id)a3 toLocation:(id)a4;
- (id)_localizedDistanceFromLocation:(id)a3 toLocation:(id)a4;
- (id)_localizedStringFromNumber:(id)a3 numberStyle:(unint64_t)a4 fractionDigits:(unint64_t)a5;
- (id)_scaledAndConvertedMin:(double)a3 andMax:(double)a4;
- (id)futureLocalizedDistanceFromLocation:(id)a3 toLocation:(id)a4;
- (id)localizedDistanceFromLocation:(id)a3 toLocation:(id)a4;
- (id)localizedStringForKey:(id)a3 value:(id)a4;
- (id)localizedStringForKey:(id)a3 value:(id)a4 table:(id)a5;
- (int64_t)measurementSystem;
- (void)measurementSystem;
- (void)setCalculationQueue:(id)a3;
- (void)setFormatter:(id)a3;
- (void)setLocale:(id)a3;
- (void)setLocalizationDelegate:(id)a3;
- (void)setMeasurementSystem:(int64_t)a3;
- (void)setMeasurementSystemLocale:(id)a3;
- (void)setUserDefaults:(id)a3;
@end

@implementation FMDistanceCalculator

- (FMDistanceCalculator)init
{
  return [(FMDistanceCalculator *)self initWithDefaultsSuiteName:0];
}

- (FMDistanceCalculator)initWithDefaultsSuiteName:(id)a3
{
  return [(FMDistanceCalculator *)self initWithDefaultsSuiteName:a3 locale:0];
}

- (FMDistanceCalculator)initWithDefaultsSuiteName:(id)a3 locale:(id)a4
{
  return [(FMDistanceCalculator *)self initWithDefaultsSuiteName:a3 locale:a4 measurementSystemLocale:0];
}

- (FMDistanceCalculator)initWithDefaultsSuiteName:(id)a3 locale:(id)a4 measurementSystemLocale:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)FMDistanceCalculator;
  v11 = [(FMDistanceCalculator *)&v19 init];
  if (v11)
  {
    dispatch_queue_t v12 = dispatch_queue_create("FMDistanceCalculator", 0);
    calculationQueue = v11->_calculationQueue;
    v11->_calculationQueue = (OS_dispatch_queue *)v12;

    if (v9)
    {
      [(FMDistanceCalculator *)v11 setLocale:v9];
    }
    else
    {
      v14 = [MEMORY[0x1E4F1CA20] autoupdatingCurrentLocale];
      [(FMDistanceCalculator *)v11 setLocale:v14];
    }
    if (v8)
    {
      uint64_t v15 = [objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:v8];
    }
    else
    {
      uint64_t v15 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    }
    v16 = (void *)v15;
    [(FMDistanceCalculator *)v11 setUserDefaults:v15];

    if (v10)
    {
      [(FMDistanceCalculator *)v11 setMeasurementSystemLocale:v10];
    }
    else
    {
      v17 = [(FMDistanceCalculator *)v11 locale];
      [(FMDistanceCalculator *)v11 setMeasurementSystemLocale:v17];
    }
  }

  return v11;
}

- (int64_t)measurementSystem
{
  v3 = [(FMDistanceCalculator *)self measurementSystemLocale];
  v4 = [v3 objectForKey:*MEMORY[0x1E4F1C440]];

  v5 = [(FMDistanceCalculator *)self userDefaults];
  v6 = [v5 stringForKey:@"distanceUnitPref"];

  if (v6)
  {
    if ([v6 isEqualToString:@"mi"])
    {
      int64_t v7 = 3;
    }
    else
    {
      if (([v6 isEqualToString:@"km"] & 1) == 0)
      {
        id v8 = LogCategory_Unspecified();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
          [(FMDistanceCalculator *)(uint64_t)v6 measurementSystem];
        }
      }
      int64_t v7 = 2;
    }
  }
  else if ([v4 isEqualToString:@"Metric"])
  {
    int64_t v7 = 2;
  }
  else
  {
    int64_t v7 = 3;
  }

  return v7;
}

- (void)setMeasurementSystem:(int64_t)a3
{
  v27[1] = *MEMORY[0x1E4F143B8];
  v5 = [(FMDistanceCalculator *)self userDefaults];
  int64_t v20 = [(FMDistanceCalculator *)self measurementSystem];
  if ((unint64_t)a3 >= 2)
  {
    if (a3 == 2)
    {
      v6 = @"km";
      goto LABEL_6;
    }
    if (a3 == 3)
    {
      v6 = @"mi";
LABEL_6:
      int64_t v7 = v5;
      [v5 setObject:v6 forKey:@"distanceUnitPref"];
      goto LABEL_11;
    }
    id v8 = LogCategory_Unspecified();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[FMDistanceCalculator setMeasurementSystem:](a3, v8);
    }
  }
  int64_t v7 = v5;
  [v5 removeObjectForKey:@"distanceUnitPref"];
LABEL_11:
  id v9 = objc_opt_new();
  id v10 = (void *)MEMORY[0x1E4F1CAD0];
  v27[0] = @"distanceUnitPref";
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:1];
  dispatch_queue_t v12 = [v10 setWithArray:v11];
  v13 = [MEMORY[0x1E4F28B50] mainBundle];
  v14 = [v13 bundleIdentifier];
  [v9 synchronizeUserDefaultsDomain:@"group.com.apple.icloud.fm" keys:v12 container:v14 appGroupContainer:@"group.com.apple.icloud.fm"];

  uint64_t v15 = LogCategory_Unspecified();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    v16 = [MEMORY[0x1E4F28B50] mainBundle];
    v17 = [v16 bundleIdentifier];
    *(_DWORD *)buf = 138412802;
    v22 = @"distanceUnitPref";
    __int16 v23 = 2112;
    v24 = v17;
    __int16 v25 = 2112;
    v26 = @"group.com.apple.icloud.fm";
    _os_log_impl(&dword_1D0EC4000, v15, OS_LOG_TYPE_INFO, "Syncronizing pref key: %@ for bundle: %@ container:%@", buf, 0x20u);
  }
  if (v20 != a3)
  {
    v18 = LogCategory_Unspecified();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0EC4000, v18, OS_LOG_TYPE_INFO, "Posting FMDistanceCalculatorMeasurementSystemChangedNotification", buf, 2u);
    }

    objc_super v19 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v19 postNotificationName:@"FMDistanceCalculatorMeasurementSystemChangedNotification" object:self];
  }
}

- (double)averageDistanceFromLocation:(id)a3 toLocation:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  int64_t v7 = v6;
  double v8 = 1000000000.0;
  if (v5 && v6)
  {
    [v5 distanceFromLocation:v6];
    double v10 = v9;
    [v5 horizontalAccuracy];
    double v12 = v11;
    [v7 horizontalAccuracy];
    if (v12 >= v13) {
      double v13 = v12;
    }
    double v14 = 0.0;
    if (v10 > v13)
    {
      [v5 horizontalAccuracy];
      double v16 = v10 - v15;
      [v7 horizontalAccuracy];
      double v18 = v16 - v17;
      [v5 horizontalAccuracy];
      double v20 = v10 + v19;
      [v7 horizontalAccuracy];
      double v13 = v20 + v21;
      if (v18 >= 0.0) {
        double v14 = v18;
      }
    }
    double v8 = (v14 + v13) * 0.5;
  }

  return v8;
}

- (id)localizedDistanceFromLocation:(id)a3 toLocation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = 0;
  double v18 = &v17;
  uint64_t v19 = 0x3032000000;
  double v20 = __Block_byref_object_copy_;
  double v21 = __Block_byref_object_dispose_;
  v22 = &stru_1F27057B0;
  double v8 = [(FMDistanceCalculator *)self calculationQueue];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __65__FMDistanceCalculator_localizedDistanceFromLocation_toLocation___block_invoke;
  v13[3] = &unk_1E689E668;
  v13[4] = self;
  id v14 = v6;
  id v15 = v7;
  double v16 = &v17;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(v8, v13);

  id v11 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  return v11;
}

uint64_t __65__FMDistanceCalculator_localizedDistanceFromLocation_toLocation___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = [*(id *)(a1 + 32) _localizedDistanceFromLocation:*(void *)(a1 + 40) toLocation:*(void *)(a1 + 48)];
  return MEMORY[0x1F41817F8]();
}

- (id)futureLocalizedDistanceFromLocation:(id)a3 toLocation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x1E4F61548]);
  id v9 = [(FMDistanceCalculator *)self calculationQueue];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __71__FMDistanceCalculator_futureLocalizedDistanceFromLocation_toLocation___block_invoke;
  v16[3] = &unk_1E689E6B8;
  v16[4] = self;
  id v17 = v6;
  id v18 = v7;
  id v10 = v8;
  id v19 = v10;
  id v11 = v7;
  id v12 = v6;
  dispatch_async(v9, v16);

  double v13 = v19;
  id v14 = v10;

  return v14;
}

void __71__FMDistanceCalculator_futureLocalizedDistanceFromLocation_toLocation___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) _localizedDistanceFromLocation:*(void *)(a1 + 40) toLocation:*(void *)(a1 + 48)];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __71__FMDistanceCalculator_futureLocalizedDistanceFromLocation_toLocation___block_invoke_2;
  v4[3] = &unk_1E689E690;
  id v5 = *(id *)(a1 + 56);
  id v6 = v2;
  id v3 = v2;
  dispatch_async(MEMORY[0x1E4F14428], v4);
}

uint64_t __71__FMDistanceCalculator_futureLocalizedDistanceFromLocation_toLocation___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishWithResult:*(void *)(a1 + 40)];
}

- (id)_scaledAndConvertedMin:(double)a3 andMax:(double)a4
{
  int64_t v7 = [(FMDistanceCalculator *)self measurementSystem];
  if (v7 == 3)
  {
    id v8 = [(FMDistanceCalculator *)self localizedStringForKey:@"MILES" value:@"Miles"];
    double v9 = a3 * 3.2808399 / 5280.0;
    double v10 = a4 * 3.2808399 / 5280.0;
  }
  else if (v7 == 2)
  {
    id v8 = [(FMDistanceCalculator *)self localizedStringForKey:@"KILOMETERS" value:@"Kilometers"];
    double v9 = a3 / 1000.0;
    double v10 = a4 / 1000.0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3B8], @"Unhandled measurementSystem: %ld", -[FMDistanceCalculator measurementSystem](self, "measurementSystem"));
    id v8 = 0;
    double v9 = a3;
    double v10 = a4;
  }
  id v11 = 0;
  if (v9 >= 0.0 && v10 > 0.0)
  {
    double v12 = a4 - a3;
    double v13 = (a4 - a3) / a3;
    double v14 = v12 / a4;
    id v11 = [MEMORY[0x1E4F1CA60] dictionary];
    id v15 = [MEMORY[0x1E4F28ED0] numberWithDouble:v9];
    [v11 setObject:v15 forKeyedSubscript:@"min"];

    double v16 = [MEMORY[0x1E4F28ED0] numberWithDouble:v10];
    [v11 setObject:v16 forKeyedSubscript:@"max"];

    id v17 = [MEMORY[0x1E4F28ED0] numberWithDouble:v13];
    [v11 setObject:v17 forKeyedSubscript:@"minRatio"];

    id v18 = [MEMORY[0x1E4F28ED0] numberWithDouble:v14];
    [v11 setObject:v18 forKeyedSubscript:@"maxRatio"];

    [v11 setObject:v8 forKeyedSubscript:@"units"];
  }

  return v11;
}

- (id)_localizedStringFromNumber:(id)a3 numberStyle:(unint64_t)a4 fractionDigits:(unint64_t)a5
{
  id v8 = a3;
  double v9 = [(FMDistanceCalculator *)self formatter];
  [v9 setNumberStyle:a4];
  [v9 setMaximumFractionDigits:a5];
  double v10 = [v9 stringForObjectValue:v8];

  return v10;
}

- (id)_localizedDistanceFromLocation:(id)a3 toLocation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(FMDistanceCalculator *)self calculationQueue];
  dispatch_assert_queue_V2(v8);

  [v6 distanceFromLocation:v7];
  double v10 = v9;
  [v6 horizontalAccuracy];
  double v12 = v11;
  [v6 horizontalAccuracy];
  if (v12 >= v13) {
    double v14 = v12;
  }
  else {
    double v14 = v13;
  }
  double v15 = 0.0;
  if (v10 > v14)
  {
    [v6 horizontalAccuracy];
    double v17 = v10 - v16;
    [v7 horizontalAccuracy];
    double v19 = v17 - v18;
    [v6 horizontalAccuracy];
    double v21 = v10 + v20;
    [v7 horizontalAccuracy];
    double v14 = v21 + v22;
    if (v19 >= 0.0) {
      double v15 = v19;
    }
  }
  __int16 v23 = [(FMDistanceCalculator *)self _scaledAndConvertedMin:v15 andMax:v14];
  v24 = v23;
  if (v23)
  {
    __int16 v25 = [v23 objectForKeyedSubscript:@"min"];
    [v25 doubleValue];
    double v27 = v26;

    v28 = [v24 objectForKeyedSubscript:@"max"];
    [v28 doubleValue];
    double v30 = v29;

    BOOL v31 = v30 > 1.0 && v30 < 10.0;
    double v32 = vabdd_f64(v30, v27);
    if (!v31 || v32 < 1.0)
    {
      v34 = [MEMORY[0x1E4F28ED0] numberWithDouble:(v27 + v30) * 0.5];
      v37 = [(FMDistanceCalculator *)self _localizedStringFromNumber:v34 numberStyle:1 fractionDigits:v30 < 1.0];

      v35 = NSString;
      v39 = [(FMDistanceCalculator *)self localizedStringForKey:@"DISTANCE_BADGE_FORMAT" value:&stru_1F27057B0];
      v41 = [v24 objectForKeyedSubscript:@"units"];
      objc_msgSend(v35, "stringWithFormat:", v39, v37, v41);
      v43 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v36 = [MEMORY[0x1E4F28ED0] numberWithDouble:v27];
      v37 = [(FMDistanceCalculator *)self _localizedStringFromNumber:v36 numberStyle:1 fractionDigits:0];

      v38 = [MEMORY[0x1E4F28ED0] numberWithDouble:v30];
      v39 = [(FMDistanceCalculator *)self _localizedStringFromNumber:v38 numberStyle:1 fractionDigits:0];

      v40 = NSString;
      v41 = [(FMDistanceCalculator *)self localizedStringForKey:@"DISTANCE_BADGE_RANGE_FORMAT" value:&stru_1F27057B0];
      v42 = [v24 objectForKeyedSubscript:@"units"];
      objc_msgSend(v40, "stringWithFormat:", v41, v37, v39, v42);
      v43 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v43 = &stru_1F27057B0;
  }

  return v43;
}

- (id)localizedStringForKey:(id)a3 value:(id)a4
{
  return [(FMDistanceCalculator *)self localizedStringForKey:a3 value:a4 table:&stru_1F27057B0];
}

- (id)localizedStringForKey:(id)a3 value:(id)a4 table:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  double v11 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  double v12 = [(FMDistanceCalculator *)self localizationDelegate];
  if (!v12) {
    goto LABEL_3;
  }
  double v13 = [(FMDistanceCalculator *)self locale];
  double v14 = [v13 languageCode];
  double v15 = [v12 localizedStringForKey:v8 table:v10 bundle:v11 languageCode:v14];

  double v16 = v10;
  if (!v15)
  {
LABEL_3:
    double v16 = v10;
    if ([v10 isEqualToString:&stru_1F27057B0])
    {

      double v16 = 0;
    }
    double v15 = [v11 localizedStringForKey:v8 value:v9 table:v16];
  }

  return v15;
}

- (NSNumberFormatter)formatter
{
  formatter = self->_formatter;
  if (!formatter)
  {
    v4 = (NSNumberFormatter *)objc_alloc_init(MEMORY[0x1E4F28EE0]);
    id v5 = [(FMDistanceCalculator *)self locale];
    [(NSNumberFormatter *)v4 setLocale:v5];

    [(NSNumberFormatter *)v4 setRoundingMode:5];
    id v6 = self->_formatter;
    self->_formatter = v4;

    formatter = self->_formatter;
  }
  return formatter;
}

- (FMDistanceCalculatorLocalizationDelegate)localizationDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_localizationDelegate);
  return (FMDistanceCalculatorLocalizationDelegate *)WeakRetained;
}

- (void)setLocalizationDelegate:(id)a3
{
}

- (NSLocale)locale
{
  return self->_locale;
}

- (void)setLocale:(id)a3
{
}

- (NSLocale)measurementSystemLocale
{
  return self->_measurementSystemLocale;
}

- (void)setMeasurementSystemLocale:(id)a3
{
}

- (NSUserDefaults)userDefaults
{
  return self->_userDefaults;
}

- (void)setUserDefaults:(id)a3
{
}

- (OS_dispatch_queue)calculationQueue
{
  return self->_calculationQueue;
}

- (void)setCalculationQueue:(id)a3
{
}

- (void)setFormatter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_formatter, 0);
  objc_storeStrong((id *)&self->_calculationQueue, 0);
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_storeStrong((id *)&self->_measurementSystemLocale, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_destroyWeak((id *)&self->_localizationDelegate);
}

- (void)measurementSystem
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 138412546;
  id v3 = @"distanceUnitPref";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_1D0EC4000, a2, OS_LOG_TYPE_ERROR, "Unknown value for %@ default key: %@", (uint8_t *)&v2, 0x16u);
}

- (void)setMeasurementSystem:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D0EC4000, a2, OS_LOG_TYPE_ERROR, "Unknown value for setMeasurementSystem: %ld", (uint8_t *)&v2, 0xCu);
}

@end