@interface _HKCardioFitnessLevelDataSourceDelegate
- (HKDisplayType)baseDisplayType;
- (HKUnit)unit;
- (NSDateComponents)dateOfBirthComponents;
- (_HKCardioFitnessLevelDataSourceDelegate)initWithCardioFitnessLevel:(int64_t)a3 healthStore:(id)a4 baseDisplayType:(id)a5;
- (id)dataForDateRange:(id)a3 timeScope:(int64_t)a4;
- (int64_t)biologicalSex;
- (int64_t)cardioFitnessLevel;
- (void)setBaseDisplayType:(id)a3;
- (void)setBiologicalSex:(int64_t)a3;
- (void)setCardioFitnessLevel:(int64_t)a3;
- (void)setDateOfBirthComponents:(id)a3;
- (void)setUnit:(id)a3;
@end

@implementation _HKCardioFitnessLevelDataSourceDelegate

- (_HKCardioFitnessLevelDataSourceDelegate)initWithCardioFitnessLevel:(int64_t)a3 healthStore:(id)a4 baseDisplayType:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v20.receiver = self;
  v20.super_class = (Class)_HKCardioFitnessLevelDataSourceDelegate;
  v10 = [(_HKCardioFitnessLevelDataSourceDelegate *)&v20 init];
  v11 = v10;
  if (v10)
  {
    v10->_cardioFitnessLevel = a3;
    objc_storeStrong((id *)&v10->_baseDisplayType, a5);
    v12 = [v8 biologicalSexWithError:0];
    uint64_t v13 = [v12 biologicalSex];

    v14 = [v8 dateOfBirthComponentsWithError:0];
    dateOfBirthComponents = v11->_dateOfBirthComponents;
    v11->_biologicalSex = v13;
    v11->_dateOfBirthComponents = v14;
    v16 = v14;

    uint64_t v17 = [MEMORY[0x1E4F2B618] unitFromString:@"mL/(kg*min)"];
    unit = v11->_unit;
    v11->_unit = (HKUnit *)v17;
  }
  return v11;
}

- (id)dataForDateRange:(id)a3 timeScope:(int64_t)a4
{
  id v6 = a3;
  v7 = +[HKGraphZoomLevelConfiguration configurationForZoomLevel:a4];
  id v8 = [v7 seriesPointIntervalComponentsAtResolution:0];
  id v9 = +[HKGraphZoomLevelConfiguration defaultCalendar];
  v10 = [v6 startDate];
  v11 = objc_msgSend(v9, "hk_dateByShiftingFromGregorianCalendarWithUTCTimeZone:", v10);

  v12 = [v6 endDate];

  uint64_t v13 = objc_msgSend(v9, "hk_dateByShiftingFromGregorianCalendarWithUTCTimeZone:", v12);

  id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v15 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v11 endDate:v13];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __70___HKCardioFitnessLevelDataSourceDelegate_dataForDateRange_timeScope___block_invoke;
  v21[3] = &unk_1E6D52C30;
  id v22 = v8;
  v23 = self;
  id v16 = v14;
  id v24 = v16;
  id v17 = v8;
  objc_msgSend(v9, "hk_enumerateDateInterval:byDateComponents:block:", v15, v17, v21);

  v18 = v24;
  id v19 = v16;

  return v19;
}

- (int64_t)cardioFitnessLevel
{
  return self->_cardioFitnessLevel;
}

- (void)setCardioFitnessLevel:(int64_t)a3
{
  self->_cardioFitnessLevel = a3;
}

- (int64_t)biologicalSex
{
  return self->_biologicalSex;
}

- (void)setBiologicalSex:(int64_t)a3
{
  self->_biologicalSex = a3;
}

- (NSDateComponents)dateOfBirthComponents
{
  return self->_dateOfBirthComponents;
}

- (void)setDateOfBirthComponents:(id)a3
{
}

- (HKUnit)unit
{
  return self->_unit;
}

- (void)setUnit:(id)a3
{
}

- (HKDisplayType)baseDisplayType
{
  return self->_baseDisplayType;
}

- (void)setBaseDisplayType:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseDisplayType, 0);
  objc_storeStrong((id *)&self->_unit, 0);
  objc_storeStrong((id *)&self->_dateOfBirthComponents, 0);
}

@end