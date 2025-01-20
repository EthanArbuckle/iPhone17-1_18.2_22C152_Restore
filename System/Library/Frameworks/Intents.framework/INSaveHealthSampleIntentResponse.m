@interface INSaveHealthSampleIntentResponse
+ (BOOL)_appLaunchRequestedFromCode:(int64_t)a3;
+ (BOOL)supportsSecureCoding;
+ (int)_errorCodeFromCode:(int64_t)a3;
+ (int)_typeFromCode:(int64_t)a3;
+ (int64_t)_codeFromType:(int)a3 errorCode:(int)a4 appLaunchRequested:(BOOL)a5;
- (INDateComponentsRange)recordDate;
- (INSaveHealthSampleIntentResponse)init;
- (INSaveHealthSampleIntentResponse)initWithBackingStore:(id)a3;
- (INSaveHealthSampleIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4;
- (INSaveHealthSampleIntentResponse)initWithCoder:(id)a3;
- (NSArray)sampleUuids;
- (NSArray)valuesDefaultUnits;
- (NSArray)valuesUserProvidedUnits;
- (NSString)defaultUnit;
- (NSString)punchoutUrl;
- (NSString)userProvidedUnit;
- (id)_dictionaryRepresentation;
- (id)_initWithCode:(int64_t)a3 userActivity:(id)a4;
- (int64_t)_codeWithName:(id)a3;
- (int64_t)_intentResponseCode;
- (int64_t)code;
- (void)encodeWithCoder:(id)a3;
- (void)setDefaultUnit:(id)a3;
- (void)setPunchoutUrl:(id)a3;
- (void)setRecordDate:(id)a3;
- (void)setSampleUuids:(id)a3;
- (void)setUserProvidedUnit:(id)a3;
- (void)setValuesDefaultUnits:(id)a3;
- (void)setValuesUserProvidedUnits:(id)a3;
@end

@implementation INSaveHealthSampleIntentResponse

- (id)_dictionaryRepresentation
{
  v28[8] = *MEMORY[0x1E4F143B8];
  v27[0] = @"code";
  unint64_t v3 = [(INSaveHealthSampleIntentResponse *)self code];
  unint64_t v26 = v3;
  if (v3 <= 8)
  {
    uint64_t v4 = (uint64_t)*(&off_1E5516D40 + v3);
  }
  else
  {
    uint64_t v4 = [MEMORY[0x1E4F1CA98] null];
  }
  v24 = (void *)v4;
  v28[0] = v4;
  v27[1] = @"sampleUuids";
  uint64_t v5 = [(INSaveHealthSampleIntentResponse *)self sampleUuids];
  v6 = (void *)v5;
  if (!v5)
  {
    uint64_t v5 = [MEMORY[0x1E4F1CA98] null];
  }
  v23 = (void *)v5;
  v28[1] = v5;
  v27[2] = @"recordDate";
  uint64_t v7 = [(INSaveHealthSampleIntentResponse *)self recordDate];
  v8 = (void *)v7;
  if (!v7)
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA98] null];
  }
  v22 = (void *)v7;
  v28[2] = v7;
  v27[3] = @"defaultUnit";
  uint64_t v9 = [(INSaveHealthSampleIntentResponse *)self defaultUnit];
  v10 = (void *)v9;
  if (!v9)
  {
    uint64_t v9 = [MEMORY[0x1E4F1CA98] null];
  }
  v21 = (void *)v9;
  v28[3] = v9;
  v27[4] = @"valuesDefaultUnits";
  uint64_t v11 = [(INSaveHealthSampleIntentResponse *)self valuesDefaultUnits];
  v12 = (void *)v11;
  if (!v11)
  {
    uint64_t v11 = [MEMORY[0x1E4F1CA98] null];
  }
  v20 = (void *)v11;
  v28[4] = v11;
  v27[5] = @"userProvidedUnit";
  v13 = [(INSaveHealthSampleIntentResponse *)self userProvidedUnit];
  v14 = v13;
  if (!v13)
  {
    v14 = [MEMORY[0x1E4F1CA98] null];
  }
  v28[5] = v14;
  v27[6] = @"valuesUserProvidedUnits";
  v15 = [(INSaveHealthSampleIntentResponse *)self valuesUserProvidedUnits];
  v16 = v15;
  if (!v15)
  {
    v16 = [MEMORY[0x1E4F1CA98] null];
  }
  v28[6] = v16;
  v27[7] = @"punchoutUrl";
  v17 = [(INSaveHealthSampleIntentResponse *)self punchoutUrl];
  v18 = v17;
  if (!v17)
  {
    v18 = [MEMORY[0x1E4F1CA98] null];
  }
  v28[7] = v18;
  id v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:8];
  if (!v17) {

  }
  if (!v15) {
  if (!v13)
  }

  if (!v12) {
  if (!v10)
  }

  if (!v8) {
  if (!v6)
  }

  if (v26 >= 9) {

  }
  return v25;
}

- (void)setPunchoutUrl:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  v6 = INIntentSlotValueTransformToString(v4);

  [v5 setPunchoutUrl:v6];
  id v8 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  uint64_t v7 = [v8 data];
  [(INIntentResponse *)self _setPayloadResponseMessageData:v7];
}

- (void)setValuesUserProvidedUnits:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  v6 = INIntentSlotValueTransformToWellnessValues(v4);

  [v5 setValuesUserProvidedUnits:v6];
  id v8 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  uint64_t v7 = [v8 data];
  [(INIntentResponse *)self _setPayloadResponseMessageData:v7];
}

- (void)setUserProvidedUnit:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  v6 = INIntentSlotValueTransformToString(v4);

  [v5 setUserProvidedUnit:v6];
  id v8 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  uint64_t v7 = [v8 data];
  [(INIntentResponse *)self _setPayloadResponseMessageData:v7];
}

- (void)setValuesDefaultUnits:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  v6 = INIntentSlotValueTransformToWellnessValues(v4);

  [v5 setValuesDefaultUnits:v6];
  id v8 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  uint64_t v7 = [v8 data];
  [(INIntentResponse *)self _setPayloadResponseMessageData:v7];
}

- (void)setDefaultUnit:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  v6 = INIntentSlotValueTransformToString(v4);

  [v5 setDefaultUnit:v6];
  id v8 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  uint64_t v7 = [v8 data];
  [(INIntentResponse *)self _setPayloadResponseMessageData:v7];
}

- (void)setRecordDate:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  v6 = INIntentSlotValueTransformToDateTimeRange(v4);

  [v5 setRecordDate:v6];
  id v8 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  uint64_t v7 = [v8 data];
  [(INIntentResponse *)self _setPayloadResponseMessageData:v7];
}

- (void)setSampleUuids:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  v6 = INIntentSlotValueTransformToStrings(v4);

  [v5 setSampleUuids:v6];
  id v8 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  uint64_t v7 = [v8 data];
  [(INIntentResponse *)self _setPayloadResponseMessageData:v7];
}

- (NSString)punchoutUrl
{
  v2 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  unint64_t v3 = [v2 punchoutUrl];
  id v4 = INIntentSlotValueTransformFromString(v3);

  return (NSString *)v4;
}

- (NSArray)valuesUserProvidedUnits
{
  v2 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  unint64_t v3 = [v2 valuesUserProvidedUnits];
  id v4 = INIntentSlotValueTransformFromWellnessValues(v3);

  return (NSArray *)v4;
}

- (NSString)userProvidedUnit
{
  v2 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  unint64_t v3 = [v2 userProvidedUnit];
  id v4 = INIntentSlotValueTransformFromString(v3);

  return (NSString *)v4;
}

- (NSArray)valuesDefaultUnits
{
  v2 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  unint64_t v3 = [v2 valuesDefaultUnits];
  id v4 = INIntentSlotValueTransformFromWellnessValues(v3);

  return (NSArray *)v4;
}

- (NSString)defaultUnit
{
  v2 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  unint64_t v3 = [v2 defaultUnit];
  id v4 = INIntentSlotValueTransformFromString(v3);

  return (NSString *)v4;
}

- (INDateComponentsRange)recordDate
{
  v2 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  unint64_t v3 = [v2 recordDate];
  id v4 = INIntentSlotValueTransformFromDateTimeRange(v3);

  return (INDateComponentsRange *)v4;
}

- (NSArray)sampleUuids
{
  v2 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  unint64_t v3 = [v2 sampleUuids];
  id v4 = INIntentSlotValueTransformFromStrings(v3);

  return (NSArray *)v4;
}

- (int64_t)_codeWithName:(id)a3
{
  id v3 = a3;
  [v3 isEqualToString:@"INSaveHealthSampleIntentResponseCodeUnspecified"];
  uint64_t v4 = [v3 isEqualToString:@"INSaveHealthSampleIntentResponseCodeReady"];
  if ([v3 isEqualToString:@"INSaveHealthSampleIntentResponseCodeInProgress"]) {
    uint64_t v4 = 2;
  }
  if ([v3 isEqualToString:@"INSaveHealthSampleIntentResponseCodeSuccess"]) {
    uint64_t v4 = 3;
  }
  if ([v3 isEqualToString:@"INSaveHealthSampleIntentResponseCodeFailure"]) {
    uint64_t v4 = 4;
  }
  if ([v3 isEqualToString:@"INSaveHealthSampleIntentResponseCodeFailureRequiringAppLaunch"])uint64_t v4 = 5; {
  if ([v3 isEqualToString:@"INSaveHealthSampleIntentResponseCodeFailureUnsupportedSampleType"])uint64_t v4 = 6;
  }
  if ([v3 isEqualToString:@"INSaveHealthSampleIntentResponseCodeFailureUnsupportedUnitType"])int64_t v5 = 7; {
  else
  }
    int64_t v5 = v4;
  int v6 = [v3 isEqualToString:@"INSaveHealthSampleIntentResponseCodeFailureValueOutOfRange"];

  if (v6) {
    return 8;
  }
  else {
    return v5;
  }
}

- (int64_t)_intentResponseCode
{
  int64_t v2 = [(INSaveHealthSampleIntentResponse *)self code];
  if ((unint64_t)(v2 - 1) > 7) {
    return 0;
  }
  else {
    return qword_18CFC5638[v2 - 1];
  }
}

- (INSaveHealthSampleIntentResponse)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)INSaveHealthSampleIntentResponse;
  return [(INIntentResponse *)&v4 initWithCoder:a3];
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)INSaveHealthSampleIntentResponse;
  [(INIntentResponse *)&v3 encodeWithCoder:a3];
}

- (int64_t)code
{
  v3.receiver = self;
  v3.super_class = (Class)INSaveHealthSampleIntentResponse;
  return [(INIntentResponse *)&v3 code];
}

- (INSaveHealthSampleIntentResponse)initWithBackingStore:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)INSaveHealthSampleIntentResponse;
  return [(INIntentResponse *)&v4 initWithBackingStore:a3];
}

- (id)_initWithCode:(int64_t)a3 userActivity:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)INSaveHealthSampleIntentResponse;
  return [(INIntentResponse *)&v5 _initWithCode:a3 userActivity:a4];
}

- (INSaveHealthSampleIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = (void *)INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
  {
    if ((unint64_t)a3 > 8) {
      uint64_t v8 = 0;
    }
    else {
      uint64_t v8 = (uint64_t)*(&off_1E5516D40 + a3);
    }
    *(_DWORD *)buf = 136315906;
    v14 = "-[INSaveHealthSampleIntentResponse initWithCode:userActivity:]";
    __int16 v15 = 2048;
    int64_t v16 = a3;
    __int16 v17 = 2112;
    uint64_t v18 = v8;
    __int16 v19 = 2112;
    id v20 = v6;
    uint64_t v9 = v7;
    _os_log_impl(&dword_18CB2F000, v9, OS_LOG_TYPE_INFO, "%s code = %zd (%@), userActivity = %@", buf, 0x2Au);
  }
  v12.receiver = self;
  v12.super_class = (Class)INSaveHealthSampleIntentResponse;
  v10 = [(INIntentResponse *)&v12 _initWithCode:a3 userActivity:v6];

  return v10;
}

- (INSaveHealthSampleIntentResponse)init
{
  return [(INSaveHealthSampleIntentResponse *)self initWithCode:0 userActivity:0];
}

+ (BOOL)_appLaunchRequestedFromCode:(int64_t)a3
{
  return a3 == 5;
}

+ (int)_errorCodeFromCode:(int64_t)a3
{
  if ((unint64_t)(a3 - 6) < 3) {
    return a3 - 5;
  }
  else {
    return 0x7FFFFFFF;
  }
}

+ (int)_typeFromCode:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 7) {
    return 3;
  }
  else {
    return dword_18CFC5618[a3 - 1];
  }
}

+ (int64_t)_codeFromType:(int)a3 errorCode:(int)a4 appLaunchRequested:(BOOL)a5
{
  int64_t result = 0;
  switch(a3)
  {
    case 0:
      int64_t result = 3;
      break;
    case 1:
      uint64_t v6 = (a4 - 1);
      int64_t v7 = 4;
      if (a5) {
        int64_t v7 = 5;
      }
      if (v6 >= 3) {
        int64_t result = v7;
      }
      else {
        int64_t result = v6 + 6;
      }
      break;
    case 2:
      int64_t result = 2;
      break;
    case 5:
      int64_t result = 1;
      break;
    default:
      return result;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end