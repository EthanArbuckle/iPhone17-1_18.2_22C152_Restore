@interface WDBloodPressureListDataProvider
- (WDBloodPressureListDataProvider)initWithDisplayType:(id)a3 profile:(id)a4;
- (id)predicateForType:(id)a3;
- (id)sampleTypes;
- (id)textForObject:(id)a3;
@end

@implementation WDBloodPressureListDataProvider

- (WDBloodPressureListDataProvider)initWithDisplayType:(id)a3 profile:(id)a4
{
  v11[2] = *MEMORY[0x263EF8340];
  v10.receiver = self;
  v10.super_class = (Class)WDBloodPressureListDataProvider;
  v4 = [(WDSampleListDataProvider *)&v10 initWithDisplayType:a3 profile:a4];
  if (v4)
  {
    v5 = [MEMORY[0x263F0A598] quantityTypeForIdentifier:*MEMORY[0x263F09C28]];
    v6 = [MEMORY[0x263F0A598] quantityTypeForIdentifier:*MEMORY[0x263F09C20]];
    v11[0] = v5;
    v11[1] = v6;
    uint64_t v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:2];
    systolicAndDiastolicTypes = v4->_systolicAndDiastolicTypes;
    v4->_systolicAndDiastolicTypes = (NSArray *)v7;
  }
  return v4;
}

- (id)sampleTypes
{
  v5[1] = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F0A598] correlationTypeForIdentifier:*MEMORY[0x263F094C0]];
  v5[0] = v2;
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:1];

  return v3;
}

- (id)predicateForType:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v5 = 0;
  }
  else
  {
    v5 = [MEMORY[0x263F0A668] predicateForObjectsWithNoCorrelation];
  }

  return v5;
}

- (id)textForObject:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x263F089D8] string];
  systolicAndDiastolicTypes = self->_systolicAndDiastolicTypes;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __49__WDBloodPressureListDataProvider_textForObject___block_invoke;
  void v11[3] = &unk_26458EEE0;
  v11[4] = self;
  id v12 = v4;
  id v13 = v5;
  id v7 = v5;
  id v8 = v4;
  [(NSArray *)systolicAndDiastolicTypes enumerateObjectsUsingBlock:v11];
  v9 = (void *)[v7 copy];

  return v9;
}

void __49__WDBloodPressureListDataProvider_textForObject___block_invoke(id *a1, void *a2, unint64_t a3)
{
  id v5 = a1[4];
  id v6 = a2;
  id v20 = [v5 displayType];
  id v7 = [a1[5] quantitySampleForType:v6];

  id v8 = [v7 quantity];
  if (v7)
  {
    v9 = [a1[4] unitController];
    objc_super v10 = [v9 unitForDisplayType:v20];

    v11 = [v20 presentation];
    id v12 = NSNumber;
    [v8 doubleValueForUnit:v10];
    id v13 = objc_msgSend(v12, "numberWithDouble:");
    v14 = [v11 adjustedValueForDaemonValue:v13];

    v15 = [a1[4] unitController];
    v16 = HKFormattedStringFromValue();

    [a1[6] appendString:v16];
  }
  else
  {
    id v17 = a1[6];
    objc_super v10 = HKLocalizedNoDataString();
    [v17 appendString:v10];
  }

  if ([*((id *)a1[4] + 10) count] - 1 > a3)
  {
    id v18 = a1[6];
    v19 = HKUIBloodPressureSystolicDiastolicSeparatorString();
    [v18 appendString:v19];
  }
}

- (void).cxx_destruct
{
}

@end