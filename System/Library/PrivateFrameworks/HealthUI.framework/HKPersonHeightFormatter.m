@interface HKPersonHeightFormatter
+ (id)sharedFormatter;
- (BOOL)usesImperialUnits;
- (HKPersonHeightFormatter)init;
- (NSLengthFormatter)heightFormatter;
- (double)centimetersFromFeet:(double)a3 inches:(double)a4;
- (id)formattedValueForCentimeters:(double)a3;
- (id)formattedValueForFeet:(double)a3;
- (id)formattedValueForInches:(double)a3;
- (id)localizedStringFromHeightInCentimeters:(id)a3;
- (void)_localeChanged:(id)a3;
- (void)dealloc;
- (void)getFeet:(int64_t *)a3 inches:(int64_t *)a4 fromCentimeters:(double)a5;
- (void)setHeightFormatter:(id)a3;
@end

@implementation HKPersonHeightFormatter

+ (id)sharedFormatter
{
  if (sharedFormatter_onceToken != -1) {
    dispatch_once(&sharedFormatter_onceToken, &__block_literal_global_6);
  }
  v2 = (void *)sharedFormatter___sharedFormatter;
  return v2;
}

uint64_t __42__HKPersonHeightFormatter_sharedFormatter__block_invoke()
{
  sharedFormatter___sharedFormatter = objc_alloc_init(HKPersonHeightFormatter);
  return MEMORY[0x1F41817F8]();
}

- (HKPersonHeightFormatter)init
{
  v11.receiver = self;
  v11.super_class = (Class)HKPersonHeightFormatter;
  v2 = [(HKPersonHeightFormatter *)&v11 init];
  if (v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F28DE8]);
    [(HKPersonHeightFormatter *)v2 setHeightFormatter:v3];

    v4 = [(HKPersonHeightFormatter *)v2 heightFormatter];
    v5 = [v4 numberFormatter];
    [v5 setMaximumFractionDigits:0];

    v6 = [(HKPersonHeightFormatter *)v2 heightFormatter];
    [v6 setForPersonHeightUse:1];

    if ([(HKPersonHeightFormatter *)v2 usesImperialUnits]) {
      uint64_t v7 = 1;
    }
    else {
      uint64_t v7 = 2;
    }
    v8 = [(HKPersonHeightFormatter *)v2 heightFormatter];
    [v8 setUnitStyle:v7];

    v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v9 addObserver:v2 selector:sel__localeChanged_ name:*MEMORY[0x1E4F1C370] object:0];
  }
  return v2;
}

- (void)dealloc
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4F1C370] object:0];

  v4.receiver = self;
  v4.super_class = (Class)HKPersonHeightFormatter;
  [(HKPersonHeightFormatter *)&v4 dealloc];
}

- (void)_localeChanged:(id)a3
{
  self->_usesImperialUnits = 0;
  MEMORY[0x1F41817F8]();
}

- (BOOL)usesImperialUnits
{
  usesImperialUnits = self->_usesImperialUnits;
  if (!usesImperialUnits)
  {
    uint64_t v11 = 0;
    objc_super v4 = [(HKPersonHeightFormatter *)self heightFormatter];
    id v5 = (id)[v4 unitStringFromMeters:&v11 usedUnit:1.0];

    BOOL v7 = v11 == 1281 || (v11 & 0xFFFFFFFFFFFFFFFELL) == 1282;
    v8 = [NSNumber numberWithInt:v7];
    v9 = self->_usesImperialUnits;
    self->_usesImperialUnits = v8;

    usesImperialUnits = self->_usesImperialUnits;
  }
  return [(NSNumber *)usesImperialUnits BOOLValue];
}

- (id)formattedValueForCentimeters:(double)a3
{
  objc_super v4 = [(HKPersonHeightFormatter *)self heightFormatter];
  id v5 = [v4 stringFromValue:9 unit:a3];

  return v5;
}

- (id)formattedValueForFeet:(double)a3
{
  objc_super v4 = [(HKPersonHeightFormatter *)self heightFormatter];
  id v5 = [v4 stringFromValue:1282 unit:a3];

  return v5;
}

- (id)formattedValueForInches:(double)a3
{
  objc_super v4 = [(HKPersonHeightFormatter *)self heightFormatter];
  id v5 = [v4 stringFromValue:1281 unit:a3];

  return v5;
}

- (void)getFeet:(int64_t *)a3 inches:(int64_t *)a4 fromCentimeters:(double)a5
{
  signed int v5 = llround(a5 / 2.54);
  int v6 = v5 % 12;
  if (a3) {
    *a3 = (int)llround((double)(v5 - v6) / 12.0);
  }
  if (a4) {
    *a4 = v6;
  }
}

- (double)centimetersFromFeet:(double)a3 inches:(double)a4
{
  return (a4 + a3 * 12.0) * 2.54;
}

- (id)localizedStringFromHeightInCentimeters:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    if ([(HKPersonHeightFormatter *)self usesImperialUnits])
    {
      uint64_t v12 = 0;
      uint64_t v13 = 0;
      [v4 doubleValue];
      -[HKPersonHeightFormatter getFeet:inches:fromCentimeters:](self, "getFeet:inches:fromCentimeters:", &v13, &v12);
      signed int v5 = [(HKPersonHeightFormatter *)self formattedValueForFeet:(double)v13];
      if (v12 < 1)
      {
        int v6 = &stru_1F3B9CF20;
      }
      else
      {
        int v6 = [(HKPersonHeightFormatter *)self formattedValueForInches:(double)v12];
      }
      if ([(__CFString *)v6 length])
      {
        v8 = NSString;
        v9 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
        v10 = [v9 localizedStringForKey:@"HEIGHT_FEET_INCHES %@ %@" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
        objc_msgSend(v8, "stringWithFormat:", v10, v5, v6);
        id v7 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v7 = v5;
      }
    }
    else
    {
      [v4 doubleValue];
      -[HKPersonHeightFormatter formattedValueForCentimeters:](self, "formattedValueForCentimeters:");
      id v7 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (NSLengthFormatter)heightFormatter
{
  return self->_heightFormatter;
}

- (void)setHeightFormatter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heightFormatter, 0);
  objc_storeStrong((id *)&self->_usesImperialUnits, 0);
}

@end