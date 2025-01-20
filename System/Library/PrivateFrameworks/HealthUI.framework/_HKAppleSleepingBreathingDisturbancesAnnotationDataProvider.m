@interface _HKAppleSleepingBreathingDisturbancesAnnotationDataProvider
- (HKQuantity)breathingDisturbancesValue;
- (NSDate)date;
- (_HKAppleSleepingBreathingDisturbancesAnnotationDataProvider)initWithBreathingDisturbancesValue:(id)a3 date:(id)a4;
- (id)attributedStringWithDisplayType:(id)a3 unitController:(id)a4 valueFont:(id)a5 unitFont:(id)a6 dateCache:(id)a7;
@end

@implementation _HKAppleSleepingBreathingDisturbancesAnnotationDataProvider

- (_HKAppleSleepingBreathingDisturbancesAnnotationDataProvider)initWithBreathingDisturbancesValue:(id)a3 date:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_HKAppleSleepingBreathingDisturbancesAnnotationDataProvider;
  v9 = [(_HKAppleSleepingBreathingDisturbancesAnnotationDataProvider *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_breathingDisturbancesValue, a3);
    objc_storeStrong((id *)&v10->_date, a4);
  }

  return v10;
}

- (id)attributedStringWithDisplayType:(id)a3 unitController:(id)a4 valueFont:(id)a5 unitFont:(id)a6 dateCache:(id)a7
{
  v44[2] = *MEMORY[0x1E4F143B8];
  v11 = NSNumber;
  id v35 = a6;
  id v36 = a5;
  id v12 = a4;
  id v13 = a3;
  v14 = [(_HKAppleSleepingBreathingDisturbancesAnnotationDataProvider *)self breathingDisturbancesValue];
  v15 = [MEMORY[0x1E4F2B618] countUnit];
  [v14 doubleValueForUnit:v15];
  v16 = objc_msgSend(v11, "numberWithDouble:");

  v37 = HKFormattedStringFromValue(v16, v13, v12, 0, 0);
  id v17 = objc_alloc(MEMORY[0x1E4F28B18]);
  uint64_t v18 = *MEMORY[0x1E4FB06F8];
  v44[0] = v36;
  uint64_t v19 = *MEMORY[0x1E4FB0700];
  v43[0] = v18;
  v43[1] = v19;
  v20 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_chartLollipopValueColor");
  v44[1] = v20;
  v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v44 forKeys:v43 count:2];
  v22 = (void *)[v17 initWithString:v37 attributes:v21];

  id v23 = objc_alloc(MEMORY[0x1E4F28B18]);
  uint64_t v41 = v18;
  id v42 = v35;
  v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v42 forKeys:&v41 count:1];
  v25 = (void *)[v23 initWithString:@" " attributes:v24];

  v26 = v16;
  v27 = [v12 localizedDisplayNameForDisplayType:v13 value:v16];

  id v28 = objc_alloc(MEMORY[0x1E4F28B18]);
  v39[1] = v19;
  v40[0] = v35;
  v39[0] = v18;
  v29 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_chartLollipopLabelColor");
  v40[1] = v29;
  v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v40 forKeys:v39 count:2];
  v31 = (void *)[v28 initWithString:v27 attributes:v30];

  v38[0] = v22;
  v38[1] = v25;
  v38[2] = v31;
  v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:3];

  v33 = HKUIJoinAttributedStringsForLocale(v32);

  return v33;
}

- (HKQuantity)breathingDisturbancesValue
{
  return self->_breathingDisturbancesValue;
}

- (NSDate)date
{
  return self->_date;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_breathingDisturbancesValue, 0);
}

@end