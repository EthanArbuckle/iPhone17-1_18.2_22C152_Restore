@interface HKQuantityFormattingParameters
- (BOOL)_objectType:(id)a3 isCategoryWithIdentifier:(id)a4;
- (BOOL)_objectType:(id)a3 isQuantityWithIdentifier:(id)a4;
- (BOOL)_unitIsFeet:(id)a3;
- (BOOL)hasSpaceBetweenValueAndUnit;
- (BOOL)omitUnit;
- (BOOL)useColor;
- (HKQuantityFormattingParameters)init;
- (HKUnit)preferredUnit;
- (UIFont)unitFont;
- (UIFont)valueFont;
- (id)_sleepFormatForQuantity:(id)a3;
- (id)_standardFormatForQuantity:(id)a3 unit:(id)a4 objectType:(id)a5;
- (id)_unitForQuantity:(id)a3 objectType:(id)a4;
- (id)unitString:(id)a3 quantity:(id)a4;
- (id)valueString:(id)a3 quantity:(id)a4;
- (int64_t)_maximumPrecisionForObjectType:(id)a3 unit:(id)a4 value:(double)a5;
- (int64_t)precision;
- (int64_t)significantDigits;
- (int64_t)wheelchairUse;
- (unint64_t)timeFormatOptions;
- (void)_setFormatter:(id)a3 maximumSignificantDigits:(int64_t)a4;
- (void)setHasSpaceBetweenValueAndUnit:(BOOL)a3;
- (void)setOmitUnit:(BOOL)a3;
- (void)setPrecision:(int64_t)a3;
- (void)setPreferredUnit:(id)a3;
- (void)setSignificantDigits:(int64_t)a3;
- (void)setTimeFormatOptions:(unint64_t)a3;
- (void)setUnitFont:(id)a3;
- (void)setUseColor:(BOOL)a3;
- (void)setValueFont:(id)a3;
- (void)setWheelchairUse:(int64_t)a3;
@end

@implementation HKQuantityFormattingParameters

- (HKQuantityFormattingParameters)init
{
  v8.receiver = self;
  v8.super_class = (Class)HKQuantityFormattingParameters;
  v2 = [(HKQuantityFormattingParameters *)&v8 init];
  v3 = v2;
  if (v2)
  {
    preferredUnit = v2->_preferredUnit;
    v2->_preferredUnit = 0;

    v3->_precision = -1;
    v3->_significantDigits = -1;
    v3->_omitUnit = 0;
    v3->_wheelchairUse = 0;
    v3->_timeFormatOptions = 0;
    valueFont = v3->_valueFont;
    v3->_valueFont = 0;

    unitFont = v3->_unitFont;
    v3->_unitFont = 0;

    *(_WORD *)&v3->_useColor = 256;
  }
  return v3;
}

- (id)valueString:(id)a3 quantity:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = [(HKQuantityFormattingParameters *)self _unitForQuantity:v7 objectType:v6];
  if ([(HKQuantityFormattingParameters *)self _unitIsFeet:v8])
  {
    v9 = [MEMORY[0x1E4F2B618] footUnit];
    [v7 doubleValueForUnit:v9];
    double v11 = v10;

    uint64_t v12 = HKFormattedFeetAndInches(v11);
  }
  else if ([(HKQuantityFormattingParameters *)self _objectType:v6 isCategoryWithIdentifier:*MEMORY[0x1E4F29770]])
  {
    uint64_t v12 = HKLocalizedDisplayStringForAppleStandHours(v7, 0, 1, 1);
  }
  else
  {
    if ([(HKQuantityFormattingParameters *)self _objectType:v6 isCategoryWithIdentifier:*MEMORY[0x1E4F29870]])
    {
      [(HKQuantityFormattingParameters *)self _sleepFormatForQuantity:v7];
    }
    else
    {
      [(HKQuantityFormattingParameters *)self _standardFormatForQuantity:v7 unit:v8 objectType:v6];
    uint64_t v12 = };
  }
  v13 = (void *)v12;

  return v13;
}

- (id)_sleepFormatForQuantity:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F2B618];
  id v5 = a3;
  id v6 = [v4 secondUnit];
  [v5 doubleValueForUnit:v6];
  double v8 = v7;

  if ([(HKQuantityFormattingParameters *)self timeFormatOptions]) {
    __int16 v9 = [(HKQuantityFormattingParameters *)self timeFormatOptions];
  }
  else {
    __int16 v9 = 4;
  }
  double v10 = [NSNumber numberWithDouble:v8];
  double v11 = HKTimePeriodString(v10, v9);

  return v11;
}

- (id)unitString:(id)a3 quantity:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = [(HKQuantityFormattingParameters *)self _unitForQuantity:v7 objectType:v6];
  if ([(HKQuantityFormattingParameters *)self omitUnit]
    || [(HKQuantityFormattingParameters *)self _unitIsFeet:v8]
    || [(HKQuantityFormattingParameters *)self _objectType:v6 isCategoryWithIdentifier:*MEMORY[0x1E4F29870]])
  {
    __int16 v9 = &stru_1F3B9CF20;
  }
  else
  {
    if ([(HKQuantityFormattingParameters *)self _objectType:v6 isCategoryWithIdentifier:*MEMORY[0x1E4F29770]])
    {
      double v11 = NSString;
      uint64_t v12 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      v13 = [v12 localizedStringForKey:@"HOURS_MEDIUM" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
      [v7 doubleValueForUnit:v8];
      objc_msgSend(v11, "localizedStringWithFormat:", v13, v14);
      __int16 v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      [v7 doubleValueForUnit:v8];
      uint64_t v12 = objc_msgSend(NSNumber, "numberWithDouble:");
      __int16 v9 = +[HKUnitPreferenceController localizedUnitStringForObjectType:v6 unit:v8 value:v12 wheelchairUse:[(HKQuantityFormattingParameters *)self wheelchairUse]];
    }
  }
  return v9;
}

- (id)_unitForQuantity:(id)a3 objectType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(HKQuantityFormattingParameters *)self preferredUnit];
  if (!v8) {
    goto LABEL_23;
  }
  __int16 v9 = (void *)v8;
  double v10 = [(HKQuantityFormattingParameters *)self preferredUnit];
  double v11 = [v6 _unit];
  int v12 = [v10 _isCompatibleWithUnit:v11];

  if (v12)
  {
    v13 = [(HKQuantityFormattingParameters *)self preferredUnit];
  }
  else
  {
LABEL_23:
    if ([(HKQuantityFormattingParameters *)self _objectType:v7 isQuantityWithIdentifier:*MEMORY[0x1E4F2A828]])
    {
      uint64_t v14 = [MEMORY[0x1E4F2B618] _countPerMinuteUnit];
    }
    else
    {
      uint64_t v14 = 0;
    }
    if ([(HKQuantityFormattingParameters *)self _objectType:v7 isQuantityWithIdentifier:*MEMORY[0x1E4F2A5C8]])
    {
      uint64_t v15 = [MEMORY[0x1E4F2B618] minuteUnit];

      uint64_t v14 = (void *)v15;
    }
    if ([(HKQuantityFormattingParameters *)self _objectType:v7 isCategoryWithIdentifier:*MEMORY[0x1E4F29770]])
    {
      uint64_t v16 = [MEMORY[0x1E4F2B618] countUnit];

      uint64_t v14 = (void *)v16;
    }
    if ([(HKQuantityFormattingParameters *)self _objectType:v7 isCategoryWithIdentifier:*MEMORY[0x1E4F29818]])
    {
      uint64_t v17 = [MEMORY[0x1E4F2B618] minuteUnit];

      uint64_t v14 = (void *)v17;
    }
    if (v14
      && ([v6 _unit],
          v18 = objc_claimAutoreleasedReturnValue(),
          int v19 = [v14 _isCompatibleWithUnit:v18],
          v18,
          v19))
    {
      id v20 = v14;
    }
    else
    {
      id v20 = [v6 _unit];
    }
    v13 = v20;
  }
  return v13;
}

- (BOOL)_unitIsFeet:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F2B618];
  id v4 = a3;
  id v5 = [v3 footUnit];
  char v6 = [v4 isEqual:v5];

  return v6;
}

- (BOOL)_objectType:(id)a3 isQuantityWithIdentifier:(id)a4
{
  id v5 = (void *)MEMORY[0x1E4F2B2C0];
  id v6 = a3;
  id v7 = [v5 quantityTypeForIdentifier:a4];
  LOBYTE(v5) = [v6 isEqual:v7];

  return (char)v5;
}

- (BOOL)_objectType:(id)a3 isCategoryWithIdentifier:(id)a4
{
  id v5 = (void *)MEMORY[0x1E4F2ACB8];
  id v6 = a3;
  id v7 = [v5 categoryTypeForIdentifier:a4];
  LOBYTE(v5) = [v6 isEqual:v7];

  return (char)v5;
}

- (id)_standardFormatForQuantity:(id)a3 unit:(id)a4 objectType:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  [a3 doubleValueForUnit:v8];
  double v11 = v10;
  id v12 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
  [v12 setNumberStyle:1];
  if (([(HKQuantityFormattingParameters *)self precision] & 0x8000000000000000) == 0)
  {
    int64_t v13 = [(HKQuantityFormattingParameters *)self precision];
LABEL_3:
    [v12 setMaximumFractionDigits:v13];
    goto LABEL_7;
  }
  if ([(HKQuantityFormattingParameters *)self significantDigits] < 0)
  {
    int64_t v13 = [(HKQuantityFormattingParameters *)self _maximumPrecisionForObjectType:v9 unit:v8 value:v11];
    if ((v13 & 0x8000000000000000) == 0) {
      goto LABEL_3;
    }
    uint64_t v15 = self;
    id v16 = v12;
    int64_t v14 = 6;
  }
  else
  {
    int64_t v14 = [(HKQuantityFormattingParameters *)self significantDigits];
    uint64_t v15 = self;
    id v16 = v12;
  }
  [(HKQuantityFormattingParameters *)v15 _setFormatter:v16 maximumSignificantDigits:v14];
LABEL_7:
  uint64_t v17 = [NSNumber numberWithDouble:v11];
  v18 = [v12 stringFromNumber:v17];

  return v18;
}

- (void)_setFormatter:(id)a3 maximumSignificantDigits:(int64_t)a4
{
  id v5 = a3;
  [v5 setUsesSignificantDigits:1];
  [v5 setMinimumSignificantDigits:1];
  [v5 setMaximumSignificantDigits:a4];
}

- (int64_t)_maximumPrecisionForObjectType:(id)a3 unit:(id)a4 value:(double)a5
{
  id v7 = a4;
  id v8 = +[HKDisplayTypeController displayTypeForObjectType:a3 wheelchairUse:0];
  id v9 = [v8 chartingRules];
  double v10 = [v9 allowedDecimalPrecisionRuleForUnit:v7];

  if (v10) {
    int64_t v11 = [v10 decimalPrecisionForValue:a5];
  }
  else {
    int64_t v11 = -1;
  }

  return v11;
}

- (HKUnit)preferredUnit
{
  return self->_preferredUnit;
}

- (void)setPreferredUnit:(id)a3
{
}

- (int64_t)precision
{
  return self->_precision;
}

- (void)setPrecision:(int64_t)a3
{
  self->_precision = a3;
}

- (int64_t)significantDigits
{
  return self->_significantDigits;
}

- (void)setSignificantDigits:(int64_t)a3
{
  self->_significantDigits = a3;
}

- (BOOL)omitUnit
{
  return self->_omitUnit;
}

- (void)setOmitUnit:(BOOL)a3
{
  self->_omitUnit = a3;
}

- (int64_t)wheelchairUse
{
  return self->_wheelchairUse;
}

- (void)setWheelchairUse:(int64_t)a3
{
  self->_wheelchairUse = a3;
}

- (unint64_t)timeFormatOptions
{
  return self->_timeFormatOptions;
}

- (void)setTimeFormatOptions:(unint64_t)a3
{
  self->_timeFormatOptions = a3;
}

- (UIFont)valueFont
{
  return self->_valueFont;
}

- (void)setValueFont:(id)a3
{
}

- (UIFont)unitFont
{
  return self->_unitFont;
}

- (void)setUnitFont:(id)a3
{
}

- (BOOL)useColor
{
  return self->_useColor;
}

- (void)setUseColor:(BOOL)a3
{
  self->_useColor = a3;
}

- (BOOL)hasSpaceBetweenValueAndUnit
{
  return self->_hasSpaceBetweenValueAndUnit;
}

- (void)setHasSpaceBetweenValueAndUnit:(BOOL)a3
{
  self->_hasSpaceBetweenValueAndUnit = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unitFont, 0);
  objc_storeStrong((id *)&self->_valueFont, 0);
  objc_storeStrong((id *)&self->_preferredUnit, 0);
}

@end