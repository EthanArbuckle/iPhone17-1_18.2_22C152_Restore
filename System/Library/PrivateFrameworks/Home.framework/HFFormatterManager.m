@interface HFFormatterManager
+ (id)sharedInstance;
- (HFFormatterManager)init;
- (HFPercentFormatter)percentFormatter;
- (HFTemperatureFormatter)temperatureFormatter;
- (id)BOOLeanFormatter;
- (id)arcDegreeFormatter;
- (id)emptyStringFormatter;
- (id)identityFormatter;
- (id)luxFormatter;
- (id)relativeDateFormatter;
- (id)timeFormatter;
- (id)timeIntervalFormatter;
- (void)registerTemperatureFormatter:(id)a3;
- (void)setPercentFormatter:(id)a3;
- (void)setTemperatureFormatter:(id)a3;
@end

@implementation HFFormatterManager

- (HFTemperatureFormatter)temperatureFormatter
{
  temperatureFormatter = self->_temperatureFormatter;
  if (!temperatureFormatter)
  {
    NSLog(&cfstr_NoTemperatureF.isa, a2);
    temperatureFormatter = self->_temperatureFormatter;
  }
  id v4 = [(HFTemperatureFormatter *)temperatureFormatter copyWithZone:MEMORY[0x21053E8E0]()];
  return (HFTemperatureFormatter *)v4;
}

+ (id)sharedInstance
{
  if (qword_26AB2F108 != -1) {
    dispatch_once(&qword_26AB2F108, &__block_literal_global_94);
  }
  v2 = (void *)_MergedGlobals_254;
  return v2;
}

- (HFPercentFormatter)percentFormatter
{
  percentFormatter = self->_percentFormatter;
  if (!percentFormatter)
  {
    NSLog(&cfstr_NoPercentForma.isa, a2);
    percentFormatter = self->_percentFormatter;
  }
  id v4 = [(HFPercentFormatter *)percentFormatter copyWithZone:MEMORY[0x21053E8E0]()];
  return (HFPercentFormatter *)v4;
}

uint64_t __36__HFFormatterManager_sharedInstance__block_invoke()
{
  _MergedGlobals_254 = objc_alloc_init(HFFormatterManager);
  return MEMORY[0x270F9A758]();
}

- (HFFormatterManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)HFFormatterManager;
  v2 = [(HFFormatterManager *)&v8 init];
  if (v2)
  {
    v3 = objc_alloc_init(HFTemperatureFormatter);
    temperatureFormatter = v2->_temperatureFormatter;
    v2->_temperatureFormatter = v3;

    v5 = objc_alloc_init(HFPercentFormatter);
    percentFormatter = v2->_percentFormatter;
    v2->_percentFormatter = v5;

    [(HFPercentFormatter *)v2->_percentFormatter setNumberStyle:3];
    [(HFPercentFormatter *)v2->_percentFormatter setMaximumFractionDigits:0];
  }
  return v2;
}

- (void)registerTemperatureFormatter:(id)a3
{
  id v4 = a3;
  v5 = (HFTemperatureFormatter *)[v4 copyWithZone:MEMORY[0x21053E8E0]()];

  temperatureFormatter = self->_temperatureFormatter;
  self->_temperatureFormatter = v5;
}

- (id)timeIntervalFormatter
{
  v2 = objc_alloc_init(HFTimeIntervalFormatter);
  [(NSDateComponentsFormatter *)v2 setUnitsStyle:3];
  [(NSDateComponentsFormatter *)v2 setZeroFormattingBehavior:14];
  return v2;
}

- (id)arcDegreeFormatter
{
  v2 = [[HFMeasurementFormatter alloc] initWithMeasurementBlock:&__block_literal_global_11_3];
  return v2;
}

id __40__HFFormatterManager_arcDegreeFormatter__block_invoke(uint64_t a1, void *a2)
{
  v2 = (objc_class *)MEMORY[0x263F08980];
  id v3 = a2;
  id v4 = [v2 alloc];
  [v3 doubleValue];
  double v6 = v5;

  v7 = [MEMORY[0x263F08C70] degrees];
  objc_super v8 = (void *)[v4 initWithDoubleValue:v7 unit:v6];

  return v8;
}

- (id)luxFormatter
{
  v2 = [[HFMeasurementFormatter alloc] initWithMeasurementBlock:&__block_literal_global_15_3];
  [(NSMeasurementFormatter *)v2 setUnitStyle:3];
  id v3 = [(NSMeasurementFormatter *)v2 numberFormatter];
  [v3 setMaximumSignificantDigits:3];

  id v4 = [(NSMeasurementFormatter *)v2 numberFormatter];
  [v4 setMaximumFractionDigits:1];

  double v5 = [(NSMeasurementFormatter *)v2 numberFormatter];
  [v5 setUsesSignificantDigits:1];

  return v2;
}

id __34__HFFormatterManager_luxFormatter__block_invoke(uint64_t a1, void *a2)
{
  v2 = (objc_class *)MEMORY[0x263F08980];
  id v3 = a2;
  id v4 = [v2 alloc];
  [v3 doubleValue];
  double v6 = v5;

  v7 = [MEMORY[0x263F08CD8] lux];
  objc_super v8 = (void *)[v4 initWithDoubleValue:v7 unit:v6];

  return v8;
}

- (id)BOOLeanFormatter
{
  return +[HFValueSetFormatter formatterWithStringProvider:&__block_literal_global_20_5];
}

id __38__HFFormatterManager_BOOLeanFormatter__block_invoke(uint64_t a1, void *a2)
{
  if ([a2 BOOLValue]) {
    v2 = @"HFCharacteristicValueTrue";
  }
  else {
    v2 = @"HFCharacteristicValueFalse";
  }
  id v3 = _HFLocalizedStringWithDefaultValue(v2, v2, 1);
  return v3;
}

- (id)identityFormatter
{
  return +[HFValueSetFormatter formatterWithStringProvider:&__block_literal_global_28_2];
}

id __39__HFFormatterManager_identityFormatter__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

- (id)emptyStringFormatter
{
  return +[HFValueSetFormatter formatterWithStringProvider:&__block_literal_global_31_1];
}

__CFString *__42__HFFormatterManager_emptyStringFormatter__block_invoke()
{
  return &stru_26C081158;
}

- (id)relativeDateFormatter
{
  id v2 = objc_alloc_init(MEMORY[0x263F08790]);
  [v2 setDateStyle:3];
  [v2 setTimeStyle:1];
  id v3 = [MEMORY[0x263EFF960] autoupdatingCurrentLocale];
  [v2 setLocale:v3];

  [v2 setDoesRelativeDateFormatting:1];
  return v2;
}

- (id)timeFormatter
{
  id v2 = objc_alloc_init(MEMORY[0x263F08790]);
  [v2 setDateStyle:0];
  [v2 setTimeStyle:1];
  id v3 = [MEMORY[0x263EFF960] autoupdatingCurrentLocale];
  [v2 setLocale:v3];

  id v4 = [MEMORY[0x263EFFA18] localTimeZone];
  [v2 setTimeZone:v4];

  return v2;
}

- (void)setTemperatureFormatter:(id)a3
{
}

- (void)setPercentFormatter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_percentFormatter, 0);
  objc_storeStrong((id *)&self->_temperatureFormatter, 0);
}

@end