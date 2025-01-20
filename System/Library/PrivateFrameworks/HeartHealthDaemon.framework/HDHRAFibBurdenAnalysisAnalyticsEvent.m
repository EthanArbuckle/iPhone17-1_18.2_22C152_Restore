@interface HDHRAFibBurdenAnalysisAnalyticsEvent
- (BOOL)isEventSubmissionIHAGated;
- (HDHRAFibBurdenAnalysisAnalyticsEvent)initWithResult:(id)a3 calculationType:(int64_t)a4 calculationTypeDetails:(id)a5 numberOfTachograms:(int64_t)a6 additionalPayloadFromAlgorithm:(id)a7;
- (NSString)eventName;
- (id)_calculationTypeStringFromCalculationType:(int64_t)a3;
- (id)makeIHAGatedEventPayloadWithDataSource:(id)a3 error:(id *)a4;
- (id)makeUnrestrictedEventPayloadWithDataSource:(id)a3 error:(id *)a4;
- (int64_t)_bucketNumberOfTachogramsFrom:(int64_t)a3;
@end

@implementation HDHRAFibBurdenAnalysisAnalyticsEvent

- (HDHRAFibBurdenAnalysisAnalyticsEvent)initWithResult:(id)a3 calculationType:(int64_t)a4 calculationTypeDetails:(id)a5 numberOfTachograms:(int64_t)a6 additionalPayloadFromAlgorithm:(id)a7
{
  id v13 = a3;
  id v14 = a5;
  id v15 = a7;
  v19.receiver = self;
  v19.super_class = (Class)HDHRAFibBurdenAnalysisAnalyticsEvent;
  v16 = [(HDHRAFibBurdenAnalysisAnalyticsEvent *)&v19 init];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_result, a3);
    v17->_calculationType = a4;
    objc_storeStrong((id *)&v17->_calculationTypeDetails, a5);
    v17->_numberOfTachograms = a6;
    objc_storeStrong((id *)&v17->_additionalPayloadFromAlgorithm, a7);
  }

  return v17;
}

- (NSString)eventName
{
  return (NSString *)(id)*MEMORY[0x1E4F67D18];
}

- (BOOL)isEventSubmissionIHAGated
{
  return 1;
}

- (id)makeUnrestrictedEventPayloadWithDataSource:(id)a3 error:(id *)a4
{
  return 0;
}

- (id)makeIHAGatedEventPayloadWithDataSource:(id)a3 error:(id *)a4
{
  v5 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v6 = a3;
  id v7 = objc_alloc_init(v5);
  v8 = v7;
  if (self->_result)
  {
    [v7 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"success"];
    v9 = objc_msgSend(NSNumber, "numberWithInt:", -[HKHRAFibBurdenAnalysisResult unavailabilityReason](self->_result, "unavailabilityReason") == 0);
    [v8 setObject:v9 forKeyedSubscript:@"sufficientData"];

    v10 = objc_msgSend(NSNumber, "numberWithBool:", -[HKHRAFibBurdenAnalysisResult burdenPercentageWasClampedToLowerBound](self->_result, "burdenPercentageWasClampedToLowerBound"));
    [v8 setObject:v10 forKeyedSubscript:@"wasClamped"];
  }
  else
  {
    [v7 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:@"success"];
  }
  v11 = objc_msgSend(NSNumber, "numberWithInteger:", -[HDHRAFibBurdenAnalysisAnalyticsEvent _bucketNumberOfTachogramsFrom:](self, "_bucketNumberOfTachogramsFrom:", self->_numberOfTachograms));
  [v8 setObject:v11 forKeyedSubscript:@"numberOfAvailableTachograms"];

  v12 = [v6 environmentDataSource];
  id v13 = [v12 calendarCache];
  id v14 = [v13 currentCalendar];

  id v15 = NSNumber;
  v16 = [v6 environmentDataSource];
  v17 = [v16 currentDate];
  v18 = objc_msgSend(v15, "numberWithInteger:", objc_msgSend(v14, "component:fromDate:", 32, v17));
  [v8 setObject:v18 forKeyedSubscript:@"hourOfDay"];

  objc_super v19 = NSNumber;
  v20 = [v6 environmentDataSource];

  v21 = [v20 currentDate];
  v22 = objc_msgSend(v19, "numberWithInteger:", objc_msgSend(v14, "component:fromDate:", 512, v21));
  [v8 setObject:v22 forKeyedSubscript:@"dayOfWeek"];

  v23 = [(HDHRAFibBurdenAnalysisAnalyticsEvent *)self _calculationTypeStringFromCalculationType:self->_calculationType];
  [v8 setObject:v23 forKeyedSubscript:@"calculationType"];

  calculationTypeDetails = self->_calculationTypeDetails;
  if (calculationTypeDetails) {
    [v8 setObject:calculationTypeDetails forKeyedSubscript:@"calculationTypeDetails"];
  }
  if (self->_additionalPayloadFromAlgorithm) {
    objc_msgSend(v8, "addEntriesFromDictionary:");
  }
  v25 = (void *)[v8 copy];

  return v25;
}

- (int64_t)_bucketNumberOfTachogramsFrom:(int64_t)a3
{
  if (!a3) {
    return 0;
  }
  if (a3 < 11) {
    return 1;
  }
  if ((unint64_t)a3 < 0x15) {
    return 11;
  }
  if ((unint64_t)a3 < 0x1F) {
    return 21;
  }
  if ((unint64_t)a3 < 0x29) {
    return 31;
  }
  if ((unint64_t)a3 < 0x33) {
    return 41;
  }
  if ((unint64_t)a3 < 0x4C) {
    return 51;
  }
  if ((unint64_t)a3 < 0x65) {
    return 76;
  }
  if ((unint64_t)a3 < 0x97) {
    return 101;
  }
  if ((unint64_t)a3 < 0xC9) {
    return 151;
  }
  if ((unint64_t)a3 < 0xFB) {
    return 201;
  }
  if ((unint64_t)a3 < 0x12D) {
    return 251;
  }
  if ((unint64_t)a3 < 0x191) {
    return 301;
  }
  if ((unint64_t)a3 < 0x1F5) {
    return 401;
  }
  if ((unint64_t)a3 < 0x259) {
    return 501;
  }
  if ((unint64_t)a3 >= 0x2BD) {
    return 701;
  }
  return 601;
}

- (id)_calculationTypeStringFromCalculationType:(int64_t)a3
{
  if ((unint64_t)a3 > 2) {
    return @"unknown";
  }
  else {
    return off_1E69B3F60[a3];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additionalPayloadFromAlgorithm, 0);
  objc_storeStrong((id *)&self->_calculationTypeDetails, 0);

  objc_storeStrong((id *)&self->_result, 0);
}

@end