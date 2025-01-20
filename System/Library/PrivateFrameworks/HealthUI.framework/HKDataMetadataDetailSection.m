@interface HKDataMetadataDetailSection
- (HKCalendarCache)calendarCache;
- (HKDataMetadataDetailSection)initWithMetadataObject:(id)a3 metadataDataSource:(id)a4 displayTypeController:(id)a5 unitController:(id)a6;
- (HKDataMetadataDetailSection)initWithSample:(id)a3 displayTypeController:(id)a4 unitController:(id)a5;
- (HKDataMetadataDetailSection)initWithWorkoutActivity:(id)a3 displayTypeController:(id)a4 unitController:(id)a5;
- (HKDataMetadataDetailSection)initWithWorkoutEvent:(id)a3;
- (HKDataMetadataObject)object;
- (HKDisplayTypeController)displayTypeController;
- (HKUnitPreferenceController)unitController;
- (id)sectionFooter;
- (void)_addDetailValues;
- (void)_addMetadataDataSourceDetailValues;
- (void)addSampleDetailValues;
@end

@implementation HKDataMetadataDetailSection

- (HKDataMetadataDetailSection)initWithMetadataObject:(id)a3 metadataDataSource:(id)a4 displayTypeController:(id)a5 unitController:(id)a6
{
  id v20 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  v15 = [v14 localizedStringForKey:@"SAMPLE_DETAILS" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
  v21.receiver = self;
  v21.super_class = (Class)HKDataMetadataDetailSection;
  v16 = [(HKDataMetadataSimpleSection *)&v21 initWithTitle:v15];

  if (v16)
  {
    objc_storeStrong((id *)&v16->_object, a3);
    objc_storeStrong((id *)&v16->_displayTypeController, a5);
    objc_storeStrong((id *)&v16->_unitController, a6);
    objc_storeStrong((id *)&v16->_metadataDataSource, a4);
    v17 = (HKCalendarCache *)objc_alloc_init(MEMORY[0x1E4F2AC98]);
    calendarCache = v16->_calendarCache;
    v16->_calendarCache = v17;

    [(HKDataMetadataDetailSection *)v16 _addDetailValues];
  }

  return v16;
}

- (HKDataMetadataDetailSection)initWithSample:(id)a3 displayTypeController:(id)a4 unitController:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  id v13 = [v12 localizedStringForKey:@"SAMPLE_DETAILS" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
  v20.receiver = self;
  v20.super_class = (Class)HKDataMetadataDetailSection;
  v14 = [(HKDataMetadataSimpleSection *)&v20 initWithTitle:v13];

  if (v14)
  {
    objc_storeStrong((id *)&v14->_object, a3);
    objc_storeStrong((id *)&v14->_displayTypeController, a4);
    objc_storeStrong((id *)&v14->_unitController, a5);
    v15 = [[HKDataMetadataDataSource alloc] initWithSample:v9 unitPreferenceController:v11];
    metadataDataSource = v14->_metadataDataSource;
    v14->_metadataDataSource = v15;

    v17 = (HKCalendarCache *)objc_alloc_init(MEMORY[0x1E4F2AC98]);
    calendarCache = v14->_calendarCache;
    v14->_calendarCache = v17;

    [(HKDataMetadataDetailSection *)v14 _addDetailValues];
  }

  return v14;
}

- (HKDataMetadataDetailSection)initWithWorkoutEvent:(id)a3
{
  id v5 = a3;
  v6 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  v7 = [v6 localizedStringForKey:@"EVENT_DETAILS" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
  v10.receiver = self;
  v10.super_class = (Class)HKDataMetadataDetailSection;
  v8 = [(HKDataMetadataSimpleSection *)&v10 initWithTitle:v7];

  if (v8)
  {
    objc_storeStrong((id *)&v8->_object, a3);
    [(HKDataMetadataDetailSection *)v8 _addDetailValues];
  }

  return v8;
}

- (HKDataMetadataDetailSection)initWithWorkoutActivity:(id)a3 displayTypeController:(id)a4 unitController:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  id v13 = [v12 localizedStringForKey:@"WORKOUT_ACTIVITY_DETAILS" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
  v16.receiver = self;
  v16.super_class = (Class)HKDataMetadataDetailSection;
  v14 = [(HKDataMetadataSimpleSection *)&v16 initWithTitle:v13];

  if (v14)
  {
    objc_storeStrong((id *)&v14->_object, a3);
    objc_storeStrong((id *)&v14->_displayTypeController, a4);
    objc_storeStrong((id *)&v14->_unitController, a5);
    [(HKDataMetadataDetailSection *)v14 _addDetailValues];
  }

  return v14;
}

- (void)_addDetailValues
{
  [(HKDataMetadataDetailSection *)self addSampleDetailValues];
  [(HKDataMetadataDetailSection *)self _addMetadataDataSourceDetailValues];
}

- (void)addSampleDetailValues
{
}

- (void)_addMetadataDataSourceDetailValues
{
}

- (id)sectionFooter
{
  v2 = self->_object;
  if (objc_opt_respondsToSelector())
  {
    v3 = [(HKDataMetadataObject *)v2 detailFooter];
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (HKDataMetadataObject)object
{
  return self->_object;
}

- (HKDisplayTypeController)displayTypeController
{
  return self->_displayTypeController;
}

- (HKUnitPreferenceController)unitController
{
  return self->_unitController;
}

- (HKCalendarCache)calendarCache
{
  return self->_calendarCache;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calendarCache, 0);
  objc_storeStrong((id *)&self->_unitController, 0);
  objc_storeStrong((id *)&self->_displayTypeController, 0);
  objc_storeStrong((id *)&self->_object, 0);
  objc_storeStrong((id *)&self->_metadataDataSource, 0);
}

@end