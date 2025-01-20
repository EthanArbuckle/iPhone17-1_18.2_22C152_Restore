@interface INQueryHealthSampleIntent
+ (BOOL)supportsSecureCoding;
- (HKUnit)unit;
- (INQueryHealthSampleIntent)initWithObjectType:(int64_t)a3 recordDates:(id)a4 unit:(id)a5 questionType:(int64_t)a6 thresholdValues:(id)a7 expectedResultType:(int64_t)a8;
- (NSArray)recordDates;
- (NSArray)thresholdValues;
- (id)_dictionaryRepresentation;
- (id)_metadata;
- (id)_typedBackingStore;
- (id)domain;
- (id)verb;
- (int64_t)expectedResultType;
- (int64_t)objectType;
- (int64_t)questionType;
- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4;
- (void)_setMetadata:(id)a3;
- (void)setExpectedResultType:(int64_t)a3;
- (void)setObjectType:(int64_t)a3;
- (void)setQuestionType:(int64_t)a3;
- (void)setRecordDates:(id)a3;
- (void)setThresholdValues:(id)a3;
- (void)setUnit:(id)a3;
@end

@implementation INQueryHealthSampleIntent

- (id)verb
{
  return @"QueryHealthSample";
}

- (id)domain
{
  return @"Wellness";
}

- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4
{
  id v6 = a4;
  v7 = [(INQueryHealthSampleIntent *)self _typedBackingStore];
  id v11 = v6;
  v8 = (void *)[v7 copy];
  v9 = [v7 recordDates];
  v10 = INIntentSlotValueRedactedDateTimeRangesFromDateTimeRanges(v9, a3, v11);

  [v8 setRecordDates:v10];
  [(INIntent *)self setBackingStore:v8];
}

- (id)_dictionaryRepresentation
{
  v21[6] = *MEMORY[0x1E4F143B8];
  v20[0] = @"objectType";
  int64_t v3 = [(INQueryHealthSampleIntent *)self objectType];
  if ((unint64_t)(v3 - 1) > 0x49) {
    v4 = @"unknown";
  }
  else {
    v4 = off_1E55180E0[v3 - 1];
  }
  v5 = v4;
  v21[0] = v5;
  v20[1] = @"recordDates";
  id v6 = [(INQueryHealthSampleIntent *)self recordDates];
  v7 = v6;
  if (!v6)
  {
    v7 = [MEMORY[0x1E4F1CA98] null];
  }
  v21[1] = v7;
  v20[2] = @"unit";
  v8 = [(INQueryHealthSampleIntent *)self unit];
  v9 = v8;
  if (!v8)
  {
    v9 = [MEMORY[0x1E4F1CA98] null];
  }
  v21[2] = v9;
  v20[3] = @"questionType";
  int64_t v10 = [(INQueryHealthSampleIntent *)self questionType];
  if ((unint64_t)(v10 - 1) > 6) {
    id v11 = @"unknown";
  }
  else {
    id v11 = off_1E551B538[v10 - 1];
  }
  v12 = v11;
  v21[3] = v12;
  v20[4] = @"thresholdValues";
  v13 = [(INQueryHealthSampleIntent *)self thresholdValues];
  v14 = v13;
  if (!v13)
  {
    v14 = [MEMORY[0x1E4F1CA98] null];
  }
  v21[4] = v14;
  v20[5] = @"expectedResultType";
  int64_t v15 = [(INQueryHealthSampleIntent *)self expectedResultType];
  if ((unint64_t)(v15 - 1) > 8) {
    v16 = @"unknown";
  }
  else {
    v16 = off_1E551DA48[v15 - 1];
  }
  v17 = v16;
  v21[5] = v17;
  v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:6];

  if (!v13) {
  if (!v8)
  }

  if (!v6) {

  }
  return v18;
}

- (void)setExpectedResultType:(int64_t)a3
{
  v4 = [(INQueryHealthSampleIntent *)self _typedBackingStore];
  id v5 = v4;
  if ((unint64_t)a3 > 9) {
    [v4 setHasExpectedResultType:0];
  }
  else {
    [v4 setExpectedResultType:a3];
  }
}

- (int64_t)expectedResultType
{
  int64_t v3 = [(INQueryHealthSampleIntent *)self _typedBackingStore];
  int v4 = [v3 hasExpectedResultType];
  id v5 = [(INQueryHealthSampleIntent *)self _typedBackingStore];
  uint64_t v6 = [v5 expectedResultType] - 1;
  if (v6 <= 8) {
    int64_t v7 = v6 + 1;
  }
  else {
    int64_t v7 = 0;
  }
  if (v4) {
    int64_t v8 = v7;
  }
  else {
    int64_t v8 = 0;
  }

  return v8;
}

- (void)setThresholdValues:(id)a3
{
  id v4 = a3;
  id v6 = [(INQueryHealthSampleIntent *)self _typedBackingStore];
  id v5 = INIntentSlotValueTransformToWellnessValues(v4);

  [v6 setThresholdValues:v5];
}

- (NSArray)thresholdValues
{
  v2 = [(INQueryHealthSampleIntent *)self _typedBackingStore];
  int64_t v3 = [v2 thresholdValues];
  id v4 = INIntentSlotValueTransformFromWellnessValues(v3);

  return (NSArray *)v4;
}

- (void)setQuestionType:(int64_t)a3
{
  id v4 = [(INQueryHealthSampleIntent *)self _typedBackingStore];
  id v5 = v4;
  if ((unint64_t)a3 > 7) {
    [v4 setHasQuestionType:0];
  }
  else {
    [v4 setQuestionType:a3];
  }
}

- (int64_t)questionType
{
  int64_t v3 = [(INQueryHealthSampleIntent *)self _typedBackingStore];
  int v4 = [v3 hasQuestionType];
  id v5 = [(INQueryHealthSampleIntent *)self _typedBackingStore];
  uint64_t v6 = [v5 questionType] - 1;
  if (v6 <= 6) {
    int64_t v7 = v6 + 1;
  }
  else {
    int64_t v7 = 0;
  }
  if (v4) {
    int64_t v8 = v7;
  }
  else {
    int64_t v8 = 0;
  }

  return v8;
}

- (void)setUnit:(id)a3
{
  id v4 = a3;
  id v6 = [(INQueryHealthSampleIntent *)self _typedBackingStore];
  id v5 = INIntentSlotValueTransformToWellnessUnitType(v4);

  [v6 setUnit:v5];
}

- (HKUnit)unit
{
  v2 = [(INQueryHealthSampleIntent *)self _typedBackingStore];
  int64_t v3 = [v2 unit];
  id v4 = INIntentSlotValueTransformFromWellnessUnitType(v3);

  return (HKUnit *)v4;
}

- (void)setRecordDates:(id)a3
{
  id v4 = a3;
  id v6 = [(INQueryHealthSampleIntent *)self _typedBackingStore];
  id v5 = INIntentSlotValueTransformToDateTimeRanges(v4);

  [v6 setRecordDates:v5];
}

- (NSArray)recordDates
{
  v2 = [(INQueryHealthSampleIntent *)self _typedBackingStore];
  int64_t v3 = [v2 recordDates];
  id v4 = INIntentSlotValueTransformFromDateTimeRanges(v3);

  return (NSArray *)v4;
}

- (void)setObjectType:(int64_t)a3
{
  id v4 = [(INQueryHealthSampleIntent *)self _typedBackingStore];
  id v5 = v4;
  if ((unint64_t)a3 > 0x4A) {
    [v4 setHasObjectType:0];
  }
  else {
    [v4 setObjectType:a3];
  }
}

- (int64_t)objectType
{
  int64_t v3 = [(INQueryHealthSampleIntent *)self _typedBackingStore];
  int v4 = [v3 hasObjectType];
  id v5 = [(INQueryHealthSampleIntent *)self _typedBackingStore];
  uint64_t v6 = [v5 objectType] - 1;
  if (v6 <= 0x49) {
    int64_t v7 = v6 + 1;
  }
  else {
    int64_t v7 = 0;
  }
  if (v4) {
    int64_t v8 = v7;
  }
  else {
    int64_t v8 = 0;
  }

  return v8;
}

- (INQueryHealthSampleIntent)initWithObjectType:(int64_t)a3 recordDates:(id)a4 unit:(id)a5 questionType:(int64_t)a6 thresholdValues:(id)a7 expectedResultType:(int64_t)a8
{
  id v14 = a4;
  id v15 = a5;
  id v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)INQueryHealthSampleIntent;
  v17 = [(INIntent *)&v20 init];
  v18 = v17;
  if (v17)
  {
    [(INQueryHealthSampleIntent *)v17 setObjectType:a3];
    [(INQueryHealthSampleIntent *)v18 setRecordDates:v14];
    [(INQueryHealthSampleIntent *)v18 setUnit:v15];
    [(INQueryHealthSampleIntent *)v18 setQuestionType:a6];
    [(INQueryHealthSampleIntent *)v18 setThresholdValues:v16];
    [(INQueryHealthSampleIntent *)v18 setExpectedResultType:a8];
  }

  return v18;
}

- (void)_setMetadata:(id)a3
{
  id v4 = a3;
  id v5 = [(INQueryHealthSampleIntent *)self _typedBackingStore];
  [v5 setIntentMetadata:v4];
}

- (id)_metadata
{
  v2 = [(INQueryHealthSampleIntent *)self _typedBackingStore];
  int64_t v3 = [v2 intentMetadata];

  return v3;
}

- (id)_typedBackingStore
{
  v2 = [(INIntent *)self backingStore];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    int64_t v3 = v2;
  }
  else {
    int64_t v3 = 0;
  }
  id v4 = v3;

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end