@interface HDMedicationsDemoDataGeneratorState
- (BOOL)didSaveIntialData;
- (BOOL)didSetupOntologyData;
- (BOOL)hasScheduledMedications;
- (HDMedicationsDemoDataGeneratorState)initWithDictionary:(id)a3;
- (NSDate)latestLogDate;
- (NSDate)latestTakenLogDate;
- (id)dictionary;
- (void)setDidSaveIntialData:(BOOL)a3;
- (void)setDidSetupOntologyData:(BOOL)a3;
- (void)setHasScheduledMedications:(BOOL)a3;
- (void)setLatestLogDate:(id)a3;
- (void)setLatestTakenLogDate:(id)a3;
@end

@implementation HDMedicationsDemoDataGeneratorState

- (HDMedicationsDemoDataGeneratorState)initWithDictionary:(id)a3
{
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)HDMedicationsDemoDataGeneratorState;
  v5 = [(HDMedicationsDemoDataGeneratorState *)&v29 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"HDMedicationsDemoDataGeneratorDidSetupOntologyKey"];
    objc_opt_class();
    id v7 = v6;
    if (objc_opt_isKindOfClass()) {
      v8 = v7;
    }
    else {
      v8 = 0;
    }
    id v9 = v8;

    if (v9) {
      v5->_didSetupOntologyData = [v9 BOOLValue];
    }
    v10 = [v4 objectForKeyedSubscript:@"HDMedicationsDemoDataGeneratorDidSaveInitialDataKey"];
    objc_opt_class();
    id v11 = v10;
    if (objc_opt_isKindOfClass()) {
      v12 = v11;
    }
    else {
      v12 = 0;
    }
    id v13 = v12;

    if (v13) {
      v5->_didSaveIntialData = [v13 BOOLValue];
    }
    v14 = [v4 objectForKeyedSubscript:@"HDMedicationsDemoDataGeneratorHasScheduledMedicationsKey"];
    objc_opt_class();
    id v15 = v14;
    if (objc_opt_isKindOfClass()) {
      v16 = v15;
    }
    else {
      v16 = 0;
    }
    id v17 = v16;

    if (v17) {
      v5->_hasScheduledMedications = [v17 BOOLValue];
    }
    v18 = [v4 objectForKeyedSubscript:@"HDMedicationsDemoDataGeneratorLatestLogDateKey"];
    objc_opt_class();
    id v19 = v18;
    if (objc_opt_isKindOfClass()) {
      v20 = v19;
    }
    else {
      v20 = 0;
    }
    v21 = v20;

    latestLogDate = v5->_latestLogDate;
    v5->_latestLogDate = v21;

    v23 = [v4 objectForKeyedSubscript:@"HDMedicationsDemoDataGeneratorLatestTakenLogDateKey"];
    objc_opt_class();
    id v24 = v23;
    if (objc_opt_isKindOfClass()) {
      v25 = v24;
    }
    else {
      v25 = 0;
    }
    v26 = v25;

    v27 = v5->_latestLogDate;
    v5->_latestLogDate = v26;
  }
  return v5;
}

- (id)dictionary
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v4 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_didSetupOntologyData];
  [v3 setObject:v4 forKey:@"HDMedicationsDemoDataGeneratorDidSetupOntologyKey"];

  v5 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_didSaveIntialData];
  [v3 setObject:v5 forKey:@"HDMedicationsDemoDataGeneratorDidSaveInitialDataKey"];

  v6 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_hasScheduledMedications];
  [v3 setObject:v6 forKey:@"HDMedicationsDemoDataGeneratorHasScheduledMedicationsKey"];

  latestLogDate = self->_latestLogDate;
  if (latestLogDate) {
    [v3 setObject:latestLogDate forKey:@"HDMedicationsDemoDataGeneratorLatestLogDateKey"];
  }
  latestTakenLogDate = self->_latestTakenLogDate;
  if (latestTakenLogDate) {
    [v3 setObject:latestTakenLogDate forKey:@"HDMedicationsDemoDataGeneratorLatestTakenLogDateKey"];
  }
  return v3;
}

- (BOOL)didSetupOntologyData
{
  return self->_didSetupOntologyData;
}

- (void)setDidSetupOntologyData:(BOOL)a3
{
  self->_didSetupOntologyData = a3;
}

- (BOOL)didSaveIntialData
{
  return self->_didSaveIntialData;
}

- (void)setDidSaveIntialData:(BOOL)a3
{
  self->_didSaveIntialData = a3;
}

- (BOOL)hasScheduledMedications
{
  return self->_hasScheduledMedications;
}

- (void)setHasScheduledMedications:(BOOL)a3
{
  self->_hasScheduledMedications = a3;
}

- (NSDate)latestLogDate
{
  return self->_latestLogDate;
}

- (void)setLatestLogDate:(id)a3
{
}

- (NSDate)latestTakenLogDate
{
  return self->_latestTakenLogDate;
}

- (void)setLatestTakenLogDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_latestTakenLogDate, 0);
  objc_storeStrong((id *)&self->_latestLogDate, 0);
}

@end