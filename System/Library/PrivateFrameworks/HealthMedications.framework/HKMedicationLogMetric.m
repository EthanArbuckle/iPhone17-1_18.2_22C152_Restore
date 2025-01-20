@interface HKMedicationLogMetric
+ (NSString)eventName;
- (HKMedicationLogMetric)initWithActions:(int64_t)a3 provenance:(int64_t)a4 context:(int64_t)a5 loggingMultipleMeds:(BOOL)a6 hoursAgoLoggedForMax:(id)a7 hoursAgoLoggedForMin:(id)a8 hoursFromScheduledTimeLoggedMax:(id)a9 hoursFromScheduledTimeLoggedMin:(id)a10 hoursFromScheduledToTakenOrSkippedMax:(id)a11 hoursFromScheduledToTakenOrSkippedMin:(id)a12 isPartiallyLoggingScheduledMeds:(id)a13 dataSource:(id)a14;
- (NSDictionary)eventPayload;
- (id)actionsPayload;
- (id)contextValue;
- (id)description;
- (id)provenanceValue;
- (void)setEventPayload:(id)a3;
@end

@implementation HKMedicationLogMetric

+ (NSString)eventName
{
  return (NSString *)@"com.apple.HealthRecords.MedsLogging";
}

- (HKMedicationLogMetric)initWithActions:(int64_t)a3 provenance:(int64_t)a4 context:(int64_t)a5 loggingMultipleMeds:(BOOL)a6 hoursAgoLoggedForMax:(id)a7 hoursAgoLoggedForMin:(id)a8 hoursFromScheduledTimeLoggedMax:(id)a9 hoursFromScheduledTimeLoggedMin:(id)a10 hoursFromScheduledToTakenOrSkippedMax:(id)a11 hoursFromScheduledToTakenOrSkippedMin:(id)a12 isPartiallyLoggingScheduledMeds:(id)a13 dataSource:(id)a14
{
  id v31 = a7;
  id v30 = a9;
  id v29 = a10;
  id v28 = a11;
  id v27 = a12;
  id v26 = a13;
  id v18 = a14;
  v32.receiver = self;
  v32.super_class = (Class)HKMedicationLogMetric;
  v19 = [(HKMedicationLogMetric *)&v32 init];
  v20 = v19;
  if (v19)
  {
    v19->_actions = a3;
    v19->_provenance = a4;
    v19->_context = a5;
    v19->_isLoggingMultipleMeds = a6;
    objc_storeStrong((id *)&v19->_hoursAgoLoggedForMax, a7);
    objc_storeStrong((id *)&v20->_hoursAgoLoggedForMin, a7);
    objc_storeStrong((id *)&v20->_hoursFromScheduledTimeLoggedMax, a9);
    objc_storeStrong((id *)&v20->_hoursFromScheduledTimeLoggedMin, a10);
    objc_storeStrong((id *)&v20->_hoursFromScheduledToTakenOrSkippedMax, a11);
    objc_storeStrong((id *)&v20->_hoursFromScheduledToTakenOrSkippedMin, a12);
    objc_storeStrong((id *)&v20->_isPartiallyLoggingScheduledMeds, a13);
    v21 = [[HKMedicationAnalyticsGenericFieldsProvider alloc] initWithDataSource:v18];
    genericDataProvider = v20->_genericDataProvider;
    v20->_genericDataProvider = v21;
  }
  return v20;
}

- (NSDictionary)eventPayload
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v4 = [(HKMedicationLogMetric *)self actionsPayload];
  [v3 addEntriesFromDictionary:v4];

  v5 = [(HKMedicationLogMetric *)self contextValue];

  if (v5)
  {
    v6 = [(HKMedicationLogMetric *)self contextValue];
    [v3 setObject:v6 forKeyedSubscript:@"context"];
  }
  v7 = [(HKMedicationLogMetric *)self provenanceValue];

  if (v7)
  {
    v8 = [(HKMedicationLogMetric *)self provenanceValue];
    [v3 setObject:v8 forKeyedSubscript:@"provenance"];
  }
  isPartiallyLoggingScheduledMeds = self->_isPartiallyLoggingScheduledMeds;
  if (isPartiallyLoggingScheduledMeds) {
    [v3 setObject:isPartiallyLoggingScheduledMeds forKeyedSubscript:@"medsPartiallyLogged"];
  }
  v10 = [NSNumber numberWithBool:self->_isLoggingMultipleMeds];
  [v3 setObject:v10 forKeyedSubscript:@"isLoggingMultipleMeds"];

  v11 = [NSString stringWithFormat:@"%@", self->_hoursAgoLoggedForMax];
  [v3 setObject:v11 forKeyedSubscript:@"hoursAgoLoggedForMax"];

  v12 = [NSString stringWithFormat:@"%@", self->_hoursAgoLoggedForMin];
  [v3 setObject:v12 forKeyedSubscript:@"hoursAgoLoggedForMin"];

  if (self->_hoursFromScheduledTimeLoggedMax)
  {
    v13 = [NSString stringWithFormat:@"%@", self->_hoursFromScheduledTimeLoggedMax];
    [v3 setObject:v13 forKeyedSubscript:@"hoursFromScheduledTimeLoggedMax"];
  }
  if (self->_hoursFromScheduledTimeLoggedMin)
  {
    v14 = [NSString stringWithFormat:@"%@", self->_hoursFromScheduledTimeLoggedMin];
    [v3 setObject:v14 forKeyedSubscript:@"hoursFromScheduledTimeLoggedMin"];
  }
  if (self->_hoursFromScheduledToTakenOrSkippedMax)
  {
    v15 = [NSString stringWithFormat:@"%@", self->_hoursFromScheduledToTakenOrSkippedMax];
    [v3 setObject:v15 forKeyedSubscript:@"hoursFromScheduledToTakenOrSkippedMax"];
  }
  if (self->_hoursFromScheduledToTakenOrSkippedMin)
  {
    v16 = [NSString stringWithFormat:@"%@", self->_hoursFromScheduledToTakenOrSkippedMin];
    [v3 setObject:v16 forKeyedSubscript:@"hoursFromScheduledToTakenOrSkippedMin"];
  }
  v17 = [(HKMedicationAnalyticsGenericFieldsProvider *)self->_genericDataProvider biologicalSex];
  if (v17) {
    [v3 setObject:v17 forKeyedSubscript:@"biologicalSex"];
  }
  genericDataProvider = self->_genericDataProvider;
  v19 = [MEMORY[0x1E4F1C9C8] date];
  v20 = [(HKMedicationAnalyticsGenericFieldsProvider *)genericDataProvider bucketedUserAgeForCurrentDate:v19];
  [v3 setObject:v20 forKeyedSubscript:@"age"];

  v21 = (void *)[v3 copy];

  return (NSDictionary *)v21;
}

- (id)description
{
  id v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(HKMedicationLogMetric *)self eventPayload];
  v6 = [v3 stringWithFormat:@"%@:%p payload: %@", v4, self, v5];

  return v6;
}

- (id)contextValue
{
  return HKStringFromMedicationLoggingContext(self->_context);
}

- (id)provenanceValue
{
  unint64_t v2 = self->_provenance - 1;
  if (v2 < 4) {
    return off_1E62EB040[v2];
  }
  v6 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HKMedicationLogMetric.m", 150, @"Invalid provenance for HKMedicationLoggingProvenance %ld", self->_provenance);

  return 0;
}

- (id)actionsPayload
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v4 = v3;
  uint64_t v5 = MEMORY[0x1E4F1CC38];
  uint64_t v6 = MEMORY[0x1E4F1CC28];
  if (self->_actions) {
    uint64_t v7 = MEMORY[0x1E4F1CC38];
  }
  else {
    uint64_t v7 = MEMORY[0x1E4F1CC28];
  }
  [v3 setObject:v7 forKeyedSubscript:@"actionDidFinishLogging"];
  if ((self->_actions & 4) != 0) {
    uint64_t v8 = v5;
  }
  else {
    uint64_t v8 = v6;
  }
  [v4 setObject:v8 forKeyedSubscript:@"actionDidCancelLogging"];
  if ((self->_actions & 8) != 0) {
    uint64_t v9 = v5;
  }
  else {
    uint64_t v9 = v6;
  }
  [v4 setObject:v9 forKeyedSubscript:@"actionDidChangeDose"];
  if ((self->_actions & 0x10) != 0) {
    uint64_t v10 = v5;
  }
  else {
    uint64_t v10 = v6;
  }
  [v4 setObject:v10 forKeyedSubscript:@"actionDidChangeTime"];
  if ((self->_actions & 0x20) != 0) {
    uint64_t v11 = v5;
  }
  else {
    uint64_t v11 = v6;
  }
  [v4 setObject:v11 forKeyedSubscript:@"actionDidMarkAllAsTaken"];
  if ((self->_actions & 0x40) != 0) {
    uint64_t v12 = v5;
  }
  else {
    uint64_t v12 = v6;
  }
  [v4 setObject:v12 forKeyedSubscript:@"actionDidSkipMedication"];
  if ((self->_actions & 0x100) != 0) {
    uint64_t v13 = v5;
  }
  else {
    uint64_t v13 = v6;
  }
  [v4 setObject:v13 forKeyedSubscript:@"actionDidEditDose"];
  if ((self->_actions & 0x80) != 0) {
    uint64_t v14 = v5;
  }
  else {
    uint64_t v14 = v6;
  }
  [v4 setObject:v14 forKeyedSubscript:@"actionDidEditTime"];
  if ((self->_actions & 0x200) != 0) {
    uint64_t v15 = v5;
  }
  else {
    uint64_t v15 = v6;
  }
  [v4 setObject:v15 forKeyedSubscript:@"actionDidEditToSkip"];
  if ((self->_actions & 0x400) != 0) {
    uint64_t v16 = v5;
  }
  else {
    uint64_t v16 = v6;
  }
  [v4 setObject:v16 forKeyedSubscript:@"actionDidEditToTake"];
  if ((self->_actions & 0x800) != 0) {
    uint64_t v17 = v5;
  }
  else {
    uint64_t v17 = v6;
  }
  [v4 setObject:v17 forKeyedSubscript:@"actionDidUnlog"];

  return v4;
}

- (void)setEventPayload:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventPayload, 0);
  objc_storeStrong((id *)&self->_isPartiallyLoggingScheduledMeds, 0);
  objc_storeStrong((id *)&self->_hoursFromScheduledToTakenOrSkippedMin, 0);
  objc_storeStrong((id *)&self->_hoursFromScheduledToTakenOrSkippedMax, 0);
  objc_storeStrong((id *)&self->_hoursFromScheduledTimeLoggedMin, 0);
  objc_storeStrong((id *)&self->_hoursFromScheduledTimeLoggedMax, 0);
  objc_storeStrong((id *)&self->_hoursAgoLoggedForMin, 0);
  objc_storeStrong((id *)&self->_hoursAgoLoggedForMax, 0);

  objc_storeStrong((id *)&self->_genericDataProvider, 0);
}

@end