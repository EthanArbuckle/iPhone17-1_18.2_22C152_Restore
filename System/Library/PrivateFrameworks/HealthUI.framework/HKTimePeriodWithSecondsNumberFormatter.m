@interface HKTimePeriodWithSecondsNumberFormatter
- (BOOL)allowMillisecondPrecision;
- (BOOL)returnsUnitWithValueForDisplay;
- (HKTimePeriodWithSecondsNumberFormatter)init;
- (id)stringFromNumber:(id)a3 displayType:(id)a4 unitController:(id)a5;
- (unint64_t)secondsRoundingMode;
- (void)setAllowMillisecondPrecision:(BOOL)a3;
- (void)setSecondsRoundingMode:(unint64_t)a3;
@end

@implementation HKTimePeriodWithSecondsNumberFormatter

- (HKTimePeriodWithSecondsNumberFormatter)init
{
  v3.receiver = self;
  v3.super_class = (Class)HKTimePeriodWithSecondsNumberFormatter;
  result = [(HKTimePeriodWithSecondsNumberFormatter *)&v3 init];
  if (result) {
    result->_secondsRoundingMode = 0;
  }
  return result;
}

- (BOOL)returnsUnitWithValueForDisplay
{
  return 0;
}

- (id)stringFromNumber:(id)a3 displayType:(id)a4 unitController:(id)a5
{
  [a3 doubleValue];
  double v7 = v6;
  HKSeparateTimeIntervalComponents();
  if (v7 >= 2.22044605e-16 && 0.0 <= 2.22044605e-16)
  {
    id v9 = [NSNumber numberWithDouble:v7];
    HKTimePeriodStringGenerator(v9, 0);
    v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_18;
  }
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ([(HKTimePeriodWithSecondsNumberFormatter *)self allowMillisecondPrecision]) {
    uint64_t v10 = 2;
  }
  else {
    uint64_t v10 = 0;
  }
  v11 = HKNumberFormatterWithDecimalPrecisionAndStyle(v10, [(HKTimePeriodWithSecondsNumberFormatter *)self secondsRoundingMode], 1);
  v12 = [NSNumber numberWithDouble:0.0];
  v13 = [v11 stringFromNumber:v12];

  v14 = NSString;
  v15 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  v16 = &stru_1F3B9CF20;
  v17 = [v15 localizedStringForKey:@"SECONDS_PAIR_SHORT" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
  v18 = objc_msgSend(v14, "localizedStringWithFormat:", v17, v13);

  [v9 addObject:v18];
  uint64_t v19 = [v9 count];
  switch(v19)
  {
    case 3:
      v24 = NSString;
      v21 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      v22 = [v21 localizedStringForKey:@"TIME_DISPLAY_3" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
      v23 = [v9 objectAtIndexedSubscript:0];
      v25 = [v9 objectAtIndexedSubscript:1];
      v26 = [v9 objectAtIndexedSubscript:2];
      objc_msgSend(v24, "localizedStringWithFormat:", v22, v23, v25, v26);
      v16 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_15:
      goto LABEL_16;
    case 2:
      v27 = NSString;
      v21 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      v22 = [v21 localizedStringForKey:@"TIME_DISPLAY_2" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
      v23 = [v9 objectAtIndexedSubscript:0];
      v25 = [v9 objectAtIndexedSubscript:1];
      objc_msgSend(v27, "localizedStringWithFormat:", v22, v23, v25);
      v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    case 1:
      v20 = NSString;
      v21 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      v22 = [v21 localizedStringForKey:@"TIME_DISPLAY_1" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
      v23 = [v9 objectAtIndexedSubscript:0];
      objc_msgSend(v20, "localizedStringWithFormat:", v22, v23);
      v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_16:

      break;
  }

LABEL_18:
  return v16;
}

- (BOOL)allowMillisecondPrecision
{
  return self->_allowMillisecondPrecision;
}

- (void)setAllowMillisecondPrecision:(BOOL)a3
{
  self->_allowMillisecondPrecision = a3;
}

- (unint64_t)secondsRoundingMode
{
  return self->_secondsRoundingMode;
}

- (void)setSecondsRoundingMode:(unint64_t)a3
{
  self->_secondsRoundingMode = a3;
}

@end