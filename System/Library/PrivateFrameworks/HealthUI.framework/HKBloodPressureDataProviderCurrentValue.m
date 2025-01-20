@interface HKBloodPressureDataProviderCurrentValue
- (HKBloodPressureDataProviderCurrentValue)initWithCorrelation:(id)a3;
- (HKBloodPressureDataProviderCurrentValue)initWithSystolicValue:(id)a3 diastolicValue:(id)a4 date:(id)a5;
- (id)_quantityForType:(id)a3 correlation:(id)a4;
- (id)attributedStringWithDisplayType:(id)a3 unitController:(id)a4 valueFont:(id)a5 unitFont:(id)a6 dateCache:(id)a7;
- (id)date;
- (id)lastUpdatedDescriptionWithDateCache:(id)a3;
@end

@implementation HKBloodPressureDataProviderCurrentValue

- (HKBloodPressureDataProviderCurrentValue)initWithCorrelation:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HKBloodPressureDataProviderCurrentValue;
  v5 = [(HKBloodPressureDataProviderCurrentValue *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 endDate];
    date = v5->_date;
    v5->_date = (NSDate *)v6;

    v8 = [MEMORY[0x1E4F2B2C0] quantityTypeForIdentifier:*MEMORY[0x1E4F2A620]];
    v9 = [MEMORY[0x1E4F2B2C0] quantityTypeForIdentifier:*MEMORY[0x1E4F2A618]];
    uint64_t v10 = [(HKBloodPressureDataProviderCurrentValue *)v5 _quantityForType:v8 correlation:v4];
    systolicValue = v5->_systolicValue;
    v5->_systolicValue = (HKQuantity *)v10;

    uint64_t v12 = [(HKBloodPressureDataProviderCurrentValue *)v5 _quantityForType:v9 correlation:v4];
    diastolicValue = v5->_diastolicValue;
    v5->_diastolicValue = (HKQuantity *)v12;
  }
  return v5;
}

- (HKBloodPressureDataProviderCurrentValue)initWithSystolicValue:(id)a3 diastolicValue:(id)a4 date:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HKBloodPressureDataProviderCurrentValue;
  uint64_t v12 = [(HKBloodPressureDataProviderCurrentValue *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_date, a5);
    objc_storeStrong((id *)&v13->_systolicValue, a3);
    objc_storeStrong((id *)&v13->_diastolicValue, a4);
  }

  return v13;
}

- (id)_quantityForType:(id)a3 correlation:(id)a4
{
  id v4 = [a4 objectsForType:a3];
  v5 = [v4 anyObject];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = [v5 quantity];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (id)date
{
  return self->_date;
}

- (id)attributedStringWithDisplayType:(id)a3 unitController:(id)a4 valueFont:(id)a5 unitFont:(id)a6 dateCache:(id)a7
{
  v44[3] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v43 = a6;
  id v42 = a5;
  v13 = [v12 unitForDisplayType:v11];
  v14 = objc_msgSend(v11, "hk_numberFormatterForUnit:", v13);
  objc_super v15 = HKLocalizedNoDataString();
  v41 = HKLocalizedNoDataString();
  v40 = [v12 localizedDisplayNameForUnit:v13 value:&unk_1F3C225D0];
  v39 = HKUIBloodPressureSystolicDiastolicSeparatorString();
  systolicValue = self->_systolicValue;
  if (systolicValue)
  {
    v17 = NSNumber;
    [(HKQuantity *)systolicValue doubleValueForUnit:v13];
    v18 = objc_msgSend(v17, "numberWithDouble:");
    [v11 presentation];
    v20 = v19 = self;
    v21 = [v20 adjustedValueForDaemonValue:v18];

    self = v19;
    v22 = v14;
    v23 = v12;
    uint64_t v24 = [v14 stringFromNumber:v21 displayType:v11 unitController:v12];

    v25 = (void *)v24;
  }
  else
  {
    v23 = v12;
    v22 = v14;
    v25 = v15;
  }
  diastolicValue = self->_diastolicValue;
  v27 = v41;
  if (diastolicValue)
  {
    v28 = NSNumber;
    [(HKQuantity *)diastolicValue doubleValueForUnit:v13];
    v29 = objc_msgSend(v28, "numberWithDouble:");
    v30 = [v11 presentation];
    v31 = [v30 adjustedValueForDaemonValue:v29];

    v32 = v22;
    uint64_t v33 = [v22 stringFromNumber:v31 displayType:v11 unitController:v23];

    v27 = (void *)v33;
  }
  else
  {
    v32 = v22;
  }
  v44[0] = v25;
  v44[1] = v39;
  v44[2] = v27;
  v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:3];
  v35 = HKUIJoinStringsForLocale(v34);

  v36 = HKGenerateAttributedStringsWithUnitValue(v35, v40, v42, v43, 2, 1);

  v37 = HKUIJoinAttributedStringsForLocale(v36);

  return v37;
}

- (id)lastUpdatedDescriptionWithDateCache:(id)a3
{
  id v4 = a3;
  v5 = [(HKBloodPressureDataProviderCurrentValue *)self date];
  uint64_t v6 = HKLastUpdatedText(v5, v4);

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_diastolicValue, 0);
  objc_storeStrong((id *)&self->_systolicValue, 0);
  objc_storeStrong((id *)&self->_date, 0);
}

@end