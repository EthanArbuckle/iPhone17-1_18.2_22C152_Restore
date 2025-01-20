@interface HFTemperatureFormatter
- (BOOL)inputIsCelsius;
- (BOOL)outputIsCelsius;
- (HFTemperatureFormatter)init;
- (NSNumber)stepValue;
- (NSString)fallbackTemperatureString;
- (NSString)unitDescription;
- (id)copyWithZone:(_NSZone *)a3;
- (id)measurementForObjectValue:(id)a3;
- (id)stringForObjectValue:(id)a3;
- (id)stringForObjectValue:(id)a3 withUnit:(BOOL)a4;
- (unint64_t)maximumFractionDigits;
- (unint64_t)minimumFractionDigits;
- (void)setFallbackTemperatureString:(id)a3;
- (void)setInputIsCelsius:(BOOL)a3;
- (void)setMaximumFractionDigits:(unint64_t)a3;
- (void)setMinimumFractionDigits:(unint64_t)a3;
- (void)setOutputIsCelsius:(BOOL)a3;
- (void)setStepValue:(id)a3;
- (void)temperatureUnitObserver:(id)a3 didChangeTemperatureUnit:(BOOL)a4;
@end

@implementation HFTemperatureFormatter

- (id)stringForObjectValue:(id)a3
{
  v4 = [(HFTemperatureFormatter *)self measurementForObjectValue:a3];
  if (v4)
  {
    v7.receiver = self;
    v7.super_class = (Class)HFTemperatureFormatter;
    v5 = [(NSMeasurementFormatter *)&v7 stringForObjectValue:v4];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = [(NSMeasurementFormatter *)self locale];
  [v4 setLocale:v5];

  objc_msgSend(v4, "setInputIsCelsius:", -[HFTemperatureFormatter inputIsCelsius](self, "inputIsCelsius"));
  objc_msgSend(v4, "setOutputIsCelsius:", -[HFTemperatureFormatter outputIsCelsius](self, "outputIsCelsius"));
  objc_msgSend(v4, "setMaximumFractionDigits:", -[HFTemperatureFormatter maximumFractionDigits](self, "maximumFractionDigits"));
  objc_msgSend(v4, "setMinimumFractionDigits:", -[HFTemperatureFormatter minimumFractionDigits](self, "minimumFractionDigits"));
  objc_msgSend(v4, "setUnitOptions:", -[NSMeasurementFormatter unitOptions](self, "unitOptions"));
  v6 = [(HFTemperatureFormatter *)self stepValue];
  [v4 setStepValue:v6];

  objc_super v7 = [(HFTemperatureFormatter *)self fallbackTemperatureString];
  [v4 setFallbackTemperatureString:v7];

  return v4;
}

- (void)setOutputIsCelsius:(BOOL)a3
{
  self->_outputIsCelsius = a3;
  BOOL v4 = a3;
  if (a3) {
    v5 = &unk_26C0F7FC8;
  }
  else {
    v5 = &unk_26C0F7FD8;
  }
  [(HFTemperatureFormatter *)self setMaximumFractionDigits:a3];
  [(HFTemperatureFormatter *)self setMinimumFractionDigits:v4];
  [(HFTemperatureFormatter *)self setStepValue:v5];
}

- (void)setMinimumFractionDigits:(unint64_t)a3
{
  id v4 = [(NSMeasurementFormatter *)self numberFormatter];
  [v4 setMinimumFractionDigits:a3];
}

- (void)setMaximumFractionDigits:(unint64_t)a3
{
  id v4 = [(NSMeasurementFormatter *)self numberFormatter];
  [v4 setMaximumFractionDigits:a3];
}

- (id)measurementForObjectValue:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    objc_opt_class();
    id v5 = v4;
    if (objc_opt_isKindOfClass()) {
      v6 = v5;
    }
    else {
      v6 = 0;
    }
    id v7 = v6;

    objc_opt_class();
    id v8 = v5;
    if (objc_opt_isKindOfClass()) {
      v9 = v8;
    }
    else {
      v9 = 0;
    }
    id v10 = v9;

    if ([(HFTemperatureFormatter *)self inputIsCelsius]) {
      [MEMORY[0x263F08D20] celsius];
    }
    else {
    v11 = [MEMORY[0x263F08D20] fahrenheit];
    }
    if ([(HFTemperatureFormatter *)self outputIsCelsius]) {
      [MEMORY[0x263F08D20] celsius];
    }
    else {
    v12 = [MEMORY[0x263F08D20] fahrenheit];
    }
    if (v10)
    {
      uint64_t v13 = [v10 unit];

      v14 = NSNumber;
      [v10 doubleValue];
      uint64_t v15 = objc_msgSend(v14, "numberWithDouble:");

      id v7 = (id)v15;
      v11 = (void *)v13;
    }
    id v16 = objc_alloc(MEMORY[0x263F08980]);
    [v7 doubleValue];
    v17 = objc_msgSend(v16, "initWithDoubleValue:unit:", v11);
    v18 = [v17 measurementByConvertingToUnit:v12];

    if (self->_stepValue)
    {
      [v18 doubleValue];
      double v20 = v19;
      [(NSNumber *)self->_stepValue doubleValue];
      double v22 = round(v20 / v21);
      [(NSNumber *)self->_stepValue doubleValue];
      double v24 = v22 * v23;
      double v25 = fabs(v24);
      if (v24 == 0.0) {
        double v26 = v25;
      }
      else {
        double v26 = v24;
      }
      id v27 = objc_alloc(MEMORY[0x263F08980]);
      v28 = [v18 unit];
      uint64_t v29 = [v27 initWithDoubleValue:v28 unit:v26];

      v18 = (void *)v29;
    }
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (BOOL)outputIsCelsius
{
  return self->_outputIsCelsius;
}

- (BOOL)inputIsCelsius
{
  return self->_inputIsCelsius;
}

- (HFTemperatureFormatter)init
{
  v8.receiver = self;
  v8.super_class = (Class)HFTemperatureFormatter;
  v2 = [(NSMeasurementFormatter *)&v8 init];
  v3 = v2;
  if (v2)
  {
    [(HFTemperatureFormatter *)v2 setStepValue:0];
    [(HFTemperatureFormatter *)v3 setInputIsCelsius:1];
    id v4 = +[HFTemperatureUnitCoordinator sharedCoordinator];
    -[HFTemperatureFormatter setOutputIsCelsius:](v3, "setOutputIsCelsius:", [v4 isCelsius]);

    [(NSMeasurementFormatter *)v3 setUnitOptions:4];
    id v5 = _HFLocalizedStringWithDefaultValue(@"HFTemperatureFormatterFallbackTemperatureString", @"HFTemperatureFormatterFallbackTemperatureString", 1);
    [(HFTemperatureFormatter *)v3 setFallbackTemperatureString:v5];

    v6 = +[HFTemperatureUnitCoordinator sharedCoordinator];
    [v6 registerObserver:v3];
  }
  return v3;
}

- (void)setStepValue:(id)a3
{
  id v5 = a3;
  v6 = self->_stepValue;
  id v7 = (NSNumber *)v5;
  v11 = v7;
  if (v6 == v7)
  {

    id v10 = v11;
LABEL_8:

    v9 = v11;
    goto LABEL_9;
  }
  if (!v6)
  {

    goto LABEL_7;
  }
  char v8 = [(NSNumber *)v6 isEqual:v7];

  v9 = v11;
  if ((v8 & 1) == 0)
  {
LABEL_7:
    objc_storeStrong((id *)&self->_stepValue, a3);
    id v10 = [(NSMeasurementFormatter *)self numberFormatter];
    [v10 setRoundingIncrement:v11];
    goto LABEL_8;
  }
LABEL_9:
}

- (void)setInputIsCelsius:(BOOL)a3
{
  self->_inputIsCelsius = a3;
}

- (void)setFallbackTemperatureString:(id)a3
{
}

- (NSNumber)stepValue
{
  return self->_stepValue;
}

- (unint64_t)minimumFractionDigits
{
  v2 = [(NSMeasurementFormatter *)self numberFormatter];
  unint64_t v3 = [v2 minimumFractionDigits];

  return v3;
}

- (unint64_t)maximumFractionDigits
{
  v2 = [(NSMeasurementFormatter *)self numberFormatter];
  unint64_t v3 = [v2 maximumFractionDigits];

  return v3;
}

- (NSString)fallbackTemperatureString
{
  return self->_fallbackTemperatureString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fallbackTemperatureString, 0);
  objc_storeStrong((id *)&self->_stepValue, 0);
}

- (void)temperatureUnitObserver:(id)a3 didChangeTemperatureUnit:(BOOL)a4
{
  uint64_t v5 = [a3 isCelsius];
  [(HFTemperatureFormatter *)self setOutputIsCelsius:v5];
}

- (NSString)unitDescription
{
  return (NSString *)_HFLocalizedStringWithDefaultValue(@"HFCharacteristicTriggerValueRangePickerUnitSuffix_Temperature", @"HFCharacteristicTriggerValueRangePickerUnitSuffix_Temperature", 1);
}

- (id)stringForObjectValue:(id)a3 withUnit:(BOOL)a4
{
  v6 = [(HFTemperatureFormatter *)self measurementForObjectValue:a3];
  if (!a4)
  {
    id v7 = objc_alloc(MEMORY[0x263F08980]);
    [v6 doubleValue];
    double v9 = v8;
    id v10 = objc_alloc(MEMORY[0x263F08C60]);
    if (_MergedGlobals_4_1 != -1) {
      dispatch_once(&_MergedGlobals_4_1, &__block_literal_global_13_6);
    }
    id v11 = (id)qword_2676B6AA8;
    v12 = (void *)[v10 initWithSymbol:v11];
    uint64_t v13 = [v7 initWithDoubleValue:v12 unit:v9];

    v6 = (void *)v13;
  }
  if (v6)
  {
    v16.receiver = self;
    v16.super_class = (Class)HFTemperatureFormatter;
    v14 = [(NSMeasurementFormatter *)&v16 stringForObjectValue:v6];
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

void __56__HFTemperatureFormatter_stringForObjectValue_withUnit___block_invoke_2()
{
  v0 = (void *)qword_2676B6AA8;
  qword_2676B6AA8 = (uint64_t)&stru_26C081158;
}

@end