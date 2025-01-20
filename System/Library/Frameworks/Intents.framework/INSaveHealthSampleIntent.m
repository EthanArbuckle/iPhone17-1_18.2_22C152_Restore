@interface INSaveHealthSampleIntent
+ (BOOL)supportsSecureCoding;
- (HKUnit)unit;
- (INDateComponentsRange)recordDate;
- (INSaveHealthSampleIntent)initWithRecordDate:(id)a3 objectType:(int64_t)a4 values:(id)a5 unit:(id)a6 sampleMetadatas:(id)a7;
- (NSArray)sampleMetadatas;
- (NSArray)values;
- (id)_dictionaryRepresentation;
- (id)_metadata;
- (id)_typedBackingStore;
- (id)domain;
- (id)verb;
- (int64_t)objectType;
- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4;
- (void)_setMetadata:(id)a3;
- (void)setObjectType:(int64_t)a3;
- (void)setRecordDate:(id)a3;
- (void)setSampleMetadatas:(id)a3;
- (void)setUnit:(id)a3;
- (void)setValues:(id)a3;
@end

@implementation INSaveHealthSampleIntent

- (id)verb
{
  return @"SaveHealthSample";
}

- (id)domain
{
  return @"Wellness";
}

- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4
{
  id v6 = a4;
  v7 = [(INSaveHealthSampleIntent *)self _typedBackingStore];
  id v11 = v6;
  v8 = (void *)[v7 copy];
  v9 = [v7 recordDate];
  v10 = INIntentSlotValueRedactedDateTimeRangeFromDateTimeRange(v9, a3);

  [v8 setRecordDate:v10];
  [(INIntent *)self setBackingStore:v8];
}

- (id)_dictionaryRepresentation
{
  v17[5] = *MEMORY[0x1E4F143B8];
  v16[0] = @"recordDate";
  v3 = [(INSaveHealthSampleIntent *)self recordDate];
  v4 = v3;
  if (!v3)
  {
    v4 = [MEMORY[0x1E4F1CA98] null];
  }
  v17[0] = v4;
  v16[1] = @"objectType";
  int64_t v5 = [(INSaveHealthSampleIntent *)self objectType];
  if ((unint64_t)(v5 - 1) > 0x49) {
    id v6 = @"unknown";
  }
  else {
    id v6 = off_1E55180E0[v5 - 1];
  }
  v7 = v6;
  v17[1] = v7;
  v16[2] = @"values";
  v8 = [(INSaveHealthSampleIntent *)self values];
  v9 = v8;
  if (!v8)
  {
    v9 = [MEMORY[0x1E4F1CA98] null];
  }
  v17[2] = v9;
  v16[3] = @"unit";
  v10 = [(INSaveHealthSampleIntent *)self unit];
  id v11 = v10;
  if (!v10)
  {
    id v11 = [MEMORY[0x1E4F1CA98] null];
  }
  v17[3] = v11;
  v16[4] = @"sampleMetadatas";
  v12 = [(INSaveHealthSampleIntent *)self sampleMetadatas];
  v13 = v12;
  if (!v12)
  {
    v13 = [MEMORY[0x1E4F1CA98] null];
  }
  v17[4] = v13;
  v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:5];
  if (!v12) {

  }
  if (!v10) {
  if (!v8)
  }

  if (!v3) {

  }
  return v14;
}

- (void)setSampleMetadatas:(id)a3
{
  id v4 = a3;
  id v6 = [(INSaveHealthSampleIntent *)self _typedBackingStore];
  int64_t v5 = INIntentSlotValueTransformToWellnessMetadataPairs(v4);

  [v6 setSampleMetadatas:v5];
}

- (NSArray)sampleMetadatas
{
  v2 = [(INSaveHealthSampleIntent *)self _typedBackingStore];
  v3 = [v2 sampleMetadatas];
  id v4 = INIntentSlotValueTransformFromWellnessMetadataPairs(v3);

  return (NSArray *)v4;
}

- (void)setUnit:(id)a3
{
  id v4 = a3;
  id v6 = [(INSaveHealthSampleIntent *)self _typedBackingStore];
  int64_t v5 = INIntentSlotValueTransformToWellnessUnitType(v4);

  [v6 setUnit:v5];
}

- (HKUnit)unit
{
  v2 = [(INSaveHealthSampleIntent *)self _typedBackingStore];
  v3 = [v2 unit];
  id v4 = INIntentSlotValueTransformFromWellnessUnitType(v3);

  return (HKUnit *)v4;
}

- (void)setValues:(id)a3
{
  id v4 = a3;
  id v6 = [(INSaveHealthSampleIntent *)self _typedBackingStore];
  int64_t v5 = INIntentSlotValueTransformToWellnessValues(v4);

  [v6 setValues:v5];
}

- (NSArray)values
{
  v2 = [(INSaveHealthSampleIntent *)self _typedBackingStore];
  v3 = [v2 values];
  id v4 = INIntentSlotValueTransformFromWellnessValues(v3);

  return (NSArray *)v4;
}

- (void)setObjectType:(int64_t)a3
{
  id v4 = [(INSaveHealthSampleIntent *)self _typedBackingStore];
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
  v3 = [(INSaveHealthSampleIntent *)self _typedBackingStore];
  int v4 = [v3 hasObjectType];
  id v5 = [(INSaveHealthSampleIntent *)self _typedBackingStore];
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

- (void)setRecordDate:(id)a3
{
  id v4 = a3;
  id v6 = [(INSaveHealthSampleIntent *)self _typedBackingStore];
  id v5 = INIntentSlotValueTransformToDateTimeRange(v4);

  [v6 setRecordDate:v5];
}

- (INDateComponentsRange)recordDate
{
  v2 = [(INSaveHealthSampleIntent *)self _typedBackingStore];
  v3 = [v2 recordDate];
  id v4 = INIntentSlotValueTransformFromDateTimeRange(v3);

  return (INDateComponentsRange *)v4;
}

- (INSaveHealthSampleIntent)initWithRecordDate:(id)a3 objectType:(int64_t)a4 values:(id)a5 unit:(id)a6 sampleMetadatas:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v19.receiver = self;
  v19.super_class = (Class)INSaveHealthSampleIntent;
  v16 = [(INIntent *)&v19 init];
  v17 = v16;
  if (v16)
  {
    [(INSaveHealthSampleIntent *)v16 setRecordDate:v12];
    [(INSaveHealthSampleIntent *)v17 setObjectType:a4];
    [(INSaveHealthSampleIntent *)v17 setValues:v13];
    [(INSaveHealthSampleIntent *)v17 setUnit:v14];
    [(INSaveHealthSampleIntent *)v17 setSampleMetadatas:v15];
  }

  return v17;
}

- (void)_setMetadata:(id)a3
{
  id v4 = a3;
  id v5 = [(INSaveHealthSampleIntent *)self _typedBackingStore];
  [v5 setIntentMetadata:v4];
}

- (id)_metadata
{
  v2 = [(INSaveHealthSampleIntent *)self _typedBackingStore];
  v3 = [v2 intentMetadata];

  return v3;
}

- (id)_typedBackingStore
{
  v2 = [(INIntent *)self backingStore];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v3 = v2;
  }
  else {
    v3 = 0;
  }
  id v4 = v3;

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end