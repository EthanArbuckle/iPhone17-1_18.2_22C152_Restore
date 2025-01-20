@interface INSetTemporalSettingIntentResponse
+ (BOOL)_appLaunchRequestedFromCode:(int64_t)a3;
+ (BOOL)supportsSecureCoding;
+ (int)_errorCodeFromCode:(int64_t)a3;
+ (int)_typeFromCode:(int64_t)a3;
+ (int64_t)_codeFromType:(int)a3 errorCode:(int)a4 appLaunchRequested:(BOOL)a5;
- (INDateComponentsRange)oldValue;
- (INDateComponentsRange)updatedValue;
- (INSetTemporalSettingIntentResponse)init;
- (INSetTemporalSettingIntentResponse)initWithBackingStore:(id)a3;
- (INSetTemporalSettingIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4;
- (INSetTemporalSettingIntentResponse)initWithCoder:(id)a3;
- (NSString)errorDetail;
- (id)_dictionaryRepresentation;
- (id)_initWithCode:(int64_t)a3 userActivity:(id)a4;
- (int64_t)_codeWithName:(id)a3;
- (int64_t)_intentResponseCode;
- (int64_t)code;
- (void)encodeWithCoder:(id)a3;
- (void)setErrorDetail:(id)a3;
- (void)setOldValue:(id)a3;
- (void)setUpdatedValue:(id)a3;
@end

@implementation INSetTemporalSettingIntentResponse

- (id)_dictionaryRepresentation
{
  v15[4] = *MEMORY[0x1E4F143B8];
  v14[0] = @"code";
  unint64_t v3 = [(INSetTemporalSettingIntentResponse *)self code];
  unint64_t v4 = v3;
  if (v3 <= 8)
  {
    v5 = *(&off_1E5520198 + v3);
  }
  else
  {
    v5 = [MEMORY[0x1E4F1CA98] null];
  }
  v15[0] = v5;
  v14[1] = @"oldValue";
  v6 = [(INSetTemporalSettingIntentResponse *)self oldValue];
  v7 = v6;
  if (!v6)
  {
    v7 = [MEMORY[0x1E4F1CA98] null];
  }
  v15[1] = v7;
  v14[2] = @"updatedValue";
  v8 = [(INSetTemporalSettingIntentResponse *)self updatedValue];
  v9 = v8;
  if (!v8)
  {
    v9 = [MEMORY[0x1E4F1CA98] null];
  }
  v15[2] = v9;
  v14[3] = @"errorDetail";
  v10 = [(INSetTemporalSettingIntentResponse *)self errorDetail];
  v11 = v10;
  if (!v10)
  {
    v11 = [MEMORY[0x1E4F1CA98] null];
  }
  v15[3] = v11;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:4];
  if (!v10) {

  }
  if (!v8) {
  if (!v6)
  }

  if (v4 >= 9) {

  }
  return v12;
}

- (void)setErrorDetail:(id)a3
{
  id v4 = a3;
  v5 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  [v5 setErrorDetail:v4];

  id v7 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  v6 = [v7 data];
  [(INIntentResponse *)self _setPayloadResponseMessageData:v6];
}

- (void)setUpdatedValue:(id)a3
{
  id v4 = a3;
  v5 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  v6 = INIntentSlotValueTransformToDateTimeRange(v4);

  [v5 setUpdatedValue:v6];
  id v8 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  id v7 = [v8 data];
  [(INIntentResponse *)self _setPayloadResponseMessageData:v7];
}

- (void)setOldValue:(id)a3
{
  id v4 = a3;
  v5 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  v6 = INIntentSlotValueTransformToDateTimeRange(v4);

  [v5 setOldValue:v6];
  id v8 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  id v7 = [v8 data];
  [(INIntentResponse *)self _setPayloadResponseMessageData:v7];
}

- (NSString)errorDetail
{
  v2 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  unint64_t v3 = [v2 errorDetail];
  id v4 = (void *)[v3 copy];

  return (NSString *)v4;
}

- (INDateComponentsRange)updatedValue
{
  v2 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  unint64_t v3 = [v2 updatedValue];
  id v4 = INIntentSlotValueTransformFromDateTimeRange(v3);

  return (INDateComponentsRange *)v4;
}

- (INDateComponentsRange)oldValue
{
  v2 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  unint64_t v3 = [v2 oldValue];
  id v4 = INIntentSlotValueTransformFromDateTimeRange(v3);

  return (INDateComponentsRange *)v4;
}

- (int64_t)_codeWithName:(id)a3
{
  id v3 = a3;
  [v3 isEqualToString:@"INSetTemporalSettingIntentResponseCodeUnspecified"];
  uint64_t v4 = [v3 isEqualToString:@"INSetTemporalSettingIntentResponseCodeReady"];
  if ([v3 isEqualToString:@"INSetTemporalSettingIntentResponseCodeInProgress"]) {
    uint64_t v4 = 2;
  }
  if ([v3 isEqualToString:@"INSetTemporalSettingIntentResponseCodeSuccess"]) {
    uint64_t v4 = 3;
  }
  if ([v3 isEqualToString:@"INSetTemporalSettingIntentResponseCodeFailure"]) {
    uint64_t v4 = 4;
  }
  if ([v3 isEqualToString:@"INSetTemporalSettingIntentResponseCodeFailureRequiringAppLaunch"])uint64_t v4 = 5; {
  if ([v3 isEqualToString:@"INSetTemporalSettingIntentResponseCodeFailureInvalidValue"])uint64_t v4 = 6;
  }
  if ([v3 isEqualToString:@"INSetTemporalSettingIntentResponseCodeFailureUnsupported"])int64_t v5 = 7; {
  else
  }
    int64_t v5 = v4;
  int v6 = [v3 isEqualToString:@"INSetTemporalSettingIntentResponseCodeFailureOtherWithReason"];

  if (v6) {
    return 8;
  }
  else {
    return v5;
  }
}

- (int64_t)_intentResponseCode
{
  int64_t v2 = [(INSetTemporalSettingIntentResponse *)self code];
  if ((unint64_t)(v2 - 1) > 7) {
    return 0;
  }
  else {
    return qword_18CFC5638[v2 - 1];
  }
}

- (INSetTemporalSettingIntentResponse)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)INSetTemporalSettingIntentResponse;
  return [(INIntentResponse *)&v4 initWithCoder:a3];
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)INSetTemporalSettingIntentResponse;
  [(INIntentResponse *)&v3 encodeWithCoder:a3];
}

- (int64_t)code
{
  v3.receiver = self;
  v3.super_class = (Class)INSetTemporalSettingIntentResponse;
  return [(INIntentResponse *)&v3 code];
}

- (INSetTemporalSettingIntentResponse)initWithBackingStore:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)INSetTemporalSettingIntentResponse;
  return [(INIntentResponse *)&v4 initWithBackingStore:a3];
}

- (id)_initWithCode:(int64_t)a3 userActivity:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)INSetTemporalSettingIntentResponse;
  return [(INIntentResponse *)&v5 _initWithCode:a3 userActivity:a4];
}

- (INSetTemporalSettingIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = (void *)INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
  {
    if ((unint64_t)a3 > 8) {
      uint64_t v8 = 0;
    }
    else {
      uint64_t v8 = (uint64_t)*(&off_1E5520198 + a3);
    }
    *(_DWORD *)buf = 136315906;
    v14 = "-[INSetTemporalSettingIntentResponse initWithCode:userActivity:]";
    __int16 v15 = 2048;
    int64_t v16 = a3;
    __int16 v17 = 2112;
    uint64_t v18 = v8;
    __int16 v19 = 2112;
    id v20 = v6;
    v9 = v7;
    _os_log_impl(&dword_18CB2F000, v9, OS_LOG_TYPE_INFO, "%s code = %zd (%@), userActivity = %@", buf, 0x2Au);
  }
  v12.receiver = self;
  v12.super_class = (Class)INSetTemporalSettingIntentResponse;
  v10 = [(INIntentResponse *)&v12 _initWithCode:a3 userActivity:v6];

  return v10;
}

- (INSetTemporalSettingIntentResponse)init
{
  return [(INSetTemporalSettingIntentResponse *)self initWithCode:0 userActivity:0];
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