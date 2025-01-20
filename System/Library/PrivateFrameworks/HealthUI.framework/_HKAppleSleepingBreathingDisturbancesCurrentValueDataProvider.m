@interface _HKAppleSleepingBreathingDisturbancesCurrentValueDataProvider
- (NSDate)date;
- (_HKAppleSleepingBreathingDisturbancesCurrentValueDataProvider)initWithBreathingDisturbancesClassification:(int64_t)a3 date:(id)a4;
- (id)attributedStringWithDisplayType:(id)a3 unitController:(id)a4 valueFont:(id)a5 unitFont:(id)a6 dateCache:(id)a7;
- (int64_t)classification;
@end

@implementation _HKAppleSleepingBreathingDisturbancesCurrentValueDataProvider

- (_HKAppleSleepingBreathingDisturbancesCurrentValueDataProvider)initWithBreathingDisturbancesClassification:(int64_t)a3 date:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)_HKAppleSleepingBreathingDisturbancesCurrentValueDataProvider;
  v8 = [(_HKAppleSleepingBreathingDisturbancesCurrentValueDataProvider *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_classification = a3;
    objc_storeStrong((id *)&v8->_date, a4);
  }

  return v9;
}

- (id)attributedStringWithDisplayType:(id)a3 unitController:(id)a4 valueFont:(id)a5 unitFont:(id)a6 dateCache:(id)a7
{
  v18[2] = *MEMORY[0x1E4F143B8];
  uint64_t v8 = *MEMORY[0x1E4FB0700];
  v17[0] = *MEMORY[0x1E4FB06F8];
  v17[1] = v8;
  v18[0] = a5;
  v9 = (void *)MEMORY[0x1E4FB1618];
  id v10 = a5;
  objc_super v11 = objc_msgSend(v9, "hk_chartLollipopValueColor");
  v18[1] = v11;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2];

  v13 = +[HKSleepApneaUtilities localizedTitleForBreathingDisturbancesClassification:[(_HKAppleSleepingBreathingDisturbancesCurrentValueDataProvider *)self classification]];
  id v14 = objc_alloc(MEMORY[0x1E4F28B18]);

  v15 = (void *)[v14 initWithString:v13 attributes:v12];
  return v15;
}

- (int64_t)classification
{
  return self->_classification;
}

- (NSDate)date
{
  return self->_date;
}

- (void).cxx_destruct
{
}

@end