@interface HKCardioFitnessDataProviderCurrentValue
- (HKCardioFitnessDataProviderCurrentValue)initWithVO2MaxQuantity:(id)a3 biologicalSex:(int64_t)a4 age:(int64_t)a5 date:(id)a6;
- (NSDate)date;
- (id)attributedStringWithDisplayType:(id)a3 unitController:(id)a4 valueFont:(id)a5 unitFont:(id)a6 dateCache:(id)a7;
- (void)setDate:(id)a3;
@end

@implementation HKCardioFitnessDataProviderCurrentValue

- (HKCardioFitnessDataProviderCurrentValue)initWithVO2MaxQuantity:(id)a3 biologicalSex:(int64_t)a4 age:(int64_t)a5 date:(id)a6
{
  id v11 = a3;
  id v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)HKCardioFitnessDataProviderCurrentValue;
  v13 = [(HKCardioFitnessDataProviderCurrentValue *)&v16 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_date, a6);
    objc_storeStrong((id *)&v14->_vo2maxQuantity, a3);
    v14->_biologicalSex = a4;
    v14->_ageInYears = a5;
  }

  return v14;
}

- (id)attributedStringWithDisplayType:(id)a3 unitController:(id)a4 valueFont:(id)a5 unitFont:(id)a6 dateCache:(id)a7
{
  v22[2] = *MEMORY[0x1E4F143B8];
  uint64_t v8 = *MEMORY[0x1E4FB0700];
  v21[0] = *MEMORY[0x1E4FB06F8];
  v21[1] = v8;
  v22[0] = a5;
  v9 = (void *)MEMORY[0x1E4FB1618];
  id v10 = a5;
  id v11 = objc_msgSend(v9, "hk_chartLollipopValueColor");
  v22[1] = v11;
  id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:2];

  vo2maxQuantity = self->_vo2maxQuantity;
  v14 = [(HKQuantity *)vo2maxQuantity _unit];
  [(HKQuantity *)vo2maxQuantity doubleValueForUnit:v14];
  double v16 = v15;

  v17 = +[HKCardioFitnessUtilities localizedStringForCardioFitnessLevel:](HKCardioFitnessUtilities, "localizedStringForCardioFitnessLevel:", +[HKCardioFitnessUtilities cardioFitnessLevelForVO2Max:self->_biologicalSex biologicalSex:self->_ageInYears age:v16]);
  id v18 = objc_alloc(MEMORY[0x1E4F28B18]);

  v19 = (void *)[v18 initWithString:v17 attributes:v12];
  return v19;
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_vo2maxQuantity, 0);
}

@end