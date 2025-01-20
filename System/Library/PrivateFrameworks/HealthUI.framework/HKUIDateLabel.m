@interface HKUIDateLabel
+ (id)_formattedTextFromDate:(id)a3 formatTemplate:(int64_t)a4 useUppercase:(BOOL)a5;
+ (id)dateStringForDateRange:(id)a3 formatTemplate:(int64_t)a4 useUppercase:(BOOL)a5;
- (BOOL)_setDateRange:(id)a3;
- (BOOL)useUppercase;
- (HKUIDateLabel)init;
- (HKValueRange)dateRange;
- (void)setDate:(id)a3 formatTemplate:(int64_t)a4;
- (void)setDateRange:(id)a3 formatTemplate:(int64_t)a4;
- (void)setUseUppercase:(BOOL)a3;
@end

@implementation HKUIDateLabel

- (HKUIDateLabel)init
{
  v3.receiver = self;
  v3.super_class = (Class)HKUIDateLabel;
  result = [(HKUIDateLabel *)&v3 init];
  if (result) {
    result->_useUppercase = 1;
  }
  return result;
}

- (void)setDate:(id)a3 formatTemplate:(int64_t)a4
{
  if (a3)
  {
    uint64_t v6 = +[HKValueRange valueRangeWithMinValue:a3 maxValue:a3];
  }
  else
  {
    uint64_t v6 = 0;
  }
  id v7 = (id)v6;
  [(HKUIDateLabel *)self setDateRange:v6 formatTemplate:a4];
}

- (void)setDateRange:(id)a3 formatTemplate:(int64_t)a4
{
  id v7 = a3;
  if (-[HKUIDateLabel _setDateRange:](self, "_setDateRange:"))
  {
    uint64_t v6 = +[HKUIDateLabel dateStringForDateRange:v7 formatTemplate:a4 useUppercase:self->_useUppercase];
    [(HKUIDateLabel *)self setText:v6];
  }
}

- (BOOL)_setDateRange:(id)a3
{
  id v5 = a3;
  if (v5 && [(HKValueRange *)self->_dateRange isEqual:v5])
  {
    BOOL v6 = 0;
  }
  else
  {
    objc_storeStrong((id *)&self->_dateRange, a3);
    BOOL v6 = 1;
  }

  return v6;
}

+ (id)dateStringForDateRange:(id)a3 formatTemplate:(int64_t)a4 useUppercase:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  v8 = v7;
  if (v7)
  {
    v9 = [v7 minValue];
    v10 = [v8 maxValue];
    char v11 = [v9 isEqual:v10];

    v12 = [v8 minValue];
    v13 = +[HKUIDateLabel _formattedTextFromDate:v12 formatTemplate:a4 useUppercase:v5];

    if ((v11 & 1) == 0)
    {
      v14 = [v8 maxValue];
      v15 = +[HKUIDateLabel _formattedTextFromDate:v14 formatTemplate:a4 useUppercase:v5];

      v16 = NSString;
      v17 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      v18 = [v17 localizedStringForKey:@"DATE_RANGE %@ %@" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
      uint64_t v19 = objc_msgSend(v16, "stringWithFormat:", v18, v13, v15);

      v13 = (void *)v19;
    }
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

+ (id)_formattedTextFromDate:(id)a3 formatTemplate:(int64_t)a4 useUppercase:(BOOL)a5
{
  if (a3)
  {
    BOOL v6 = HKLocalizedStringForDateAndTemplate(a3, a4);
    id v7 = v6;
    if (a5)
    {
      v8 = [MEMORY[0x1E4F1CA20] currentLocale];
      v9 = [v7 uppercaseStringWithLocale:v8];
    }
    else
    {
      id v7 = v6;
      v9 = v7;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", 0, a4, a5);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    [v7 handleFailureInMethod:a2, a1, @"HKUIDateLabel.m", 67, @"Invalid parameter not satisfying: %@", @"date != nil" object file lineNumber description];
    v9 = 0;
  }

  return v9;
}

- (HKValueRange)dateRange
{
  return self->_dateRange;
}

- (BOOL)useUppercase
{
  return self->_useUppercase;
}

- (void)setUseUppercase:(BOOL)a3
{
  self->_useUppercase = a3;
}

- (void).cxx_destruct
{
}

@end