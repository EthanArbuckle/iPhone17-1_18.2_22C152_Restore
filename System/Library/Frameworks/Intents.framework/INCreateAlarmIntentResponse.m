@interface INCreateAlarmIntentResponse
+ (BOOL)_appLaunchRequestedFromCode:(int64_t)a3;
+ (BOOL)supportsSecureCoding;
+ (int)_errorCodeFromCode:(int64_t)a3;
+ (int)_typeFromCode:(int64_t)a3;
+ (int64_t)_codeFromType:(int)a3 errorCode:(int)a4 appLaunchRequested:(BOOL)a5;
- (INAlarm)createdAlarm;
- (INCreateAlarmIntentResponse)init;
- (INCreateAlarmIntentResponse)initWithBackingStore:(id)a3;
- (INCreateAlarmIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4;
- (INCreateAlarmIntentResponse)initWithCoder:(id)a3;
- (id)_dictionaryRepresentation;
- (id)_initWithCode:(int64_t)a3 userActivity:(id)a4;
- (int64_t)_codeWithName:(id)a3;
- (int64_t)_intentResponseCode;
- (int64_t)code;
- (int64_t)successCode;
- (void)encodeWithCoder:(id)a3;
- (void)setCreatedAlarm:(id)a3;
- (void)setSuccessCode:(int64_t)a3;
@end

@implementation INCreateAlarmIntentResponse

- (id)_dictionaryRepresentation
{
  v14[3] = *MEMORY[0x1E4F143B8];
  v13[0] = @"code";
  unint64_t v3 = [(INCreateAlarmIntentResponse *)self code];
  unint64_t v4 = v3;
  if (v3 <= 5)
  {
    v5 = off_1E5520760[v3];
  }
  else
  {
    v5 = [MEMORY[0x1E4F1CA98] null];
  }
  v14[0] = v5;
  v13[1] = @"createdAlarm";
  v6 = [(INCreateAlarmIntentResponse *)self createdAlarm];
  v7 = v6;
  if (!v6)
  {
    v7 = [MEMORY[0x1E4F1CA98] null];
  }
  v14[1] = v7;
  v13[2] = @"successCode";
  int64_t v8 = [(INCreateAlarmIntentResponse *)self successCode];
  if ((unint64_t)(v8 - 1) > 2) {
    v9 = @"unknown";
  }
  else {
    v9 = off_1E5520898[v8 - 1];
  }
  v10 = v9;
  v14[2] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:3];

  if (!v6) {
  if (v4 >= 6)
  }

  return v11;
}

- (void)setSuccessCode:(int64_t)a3
{
  unint64_t v4 = a3 - 1;
  v5 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  v6 = v5;
  if (v4 > 2) {
    [v5 setHasSuccessCode:0];
  }
  else {
    [v5 setSuccessCode:v4];
  }

  id v8 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  v7 = [v8 data];
  [(INIntentResponse *)self _setPayloadResponseMessageData:v7];
}

- (void)setCreatedAlarm:(id)a3
{
  id v4 = a3;
  v5 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  v6 = INIntentSlotValueTransformToAlarm(v4);

  [v5 setCreatedAlarm:v6];
  id v8 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  v7 = [v8 data];
  [(INIntentResponse *)self _setPayloadResponseMessageData:v7];
}

- (int64_t)successCode
{
  unint64_t v3 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  unsigned __int8 v4 = [v3 hasSuccessCode];
  v5 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  unsigned int v6 = [v5 successCode];
  if (((v6 < 3) & v4) != 0) {
    int64_t v7 = v6 + 1;
  }
  else {
    int64_t v7 = 0;
  }

  return v7;
}

- (INAlarm)createdAlarm
{
  v2 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  unint64_t v3 = [v2 createdAlarm];
  unsigned __int8 v4 = INIntentSlotValueTransformFromAlarm(v3);

  return (INAlarm *)v4;
}

- (int64_t)_codeWithName:(id)a3
{
  id v3 = a3;
  [v3 isEqualToString:@"INCreateAlarmIntentResponseCodeUnspecified"];
  uint64_t v4 = [v3 isEqualToString:@"INCreateAlarmIntentResponseCodeReady"];
  if ([v3 isEqualToString:@"INCreateAlarmIntentResponseCodeInProgress"]) {
    uint64_t v4 = 2;
  }
  if ([v3 isEqualToString:@"INCreateAlarmIntentResponseCodeSuccess"]) {
    uint64_t v4 = 3;
  }
  if ([v3 isEqualToString:@"INCreateAlarmIntentResponseCodeFailure"]) {
    int64_t v5 = 4;
  }
  else {
    int64_t v5 = v4;
  }
  int v6 = [v3 isEqualToString:@"INCreateAlarmIntentResponseCodeFailureRequiringAppLaunch"];

  if (v6) {
    return 5;
  }
  else {
    return v5;
  }
}

- (int64_t)_intentResponseCode
{
  int64_t v2 = [(INCreateAlarmIntentResponse *)self code];
  if ((unint64_t)(v2 - 1) > 4) {
    return 0;
  }
  else {
    return qword_18CFC5A10[v2 - 1];
  }
}

- (INCreateAlarmIntentResponse)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)INCreateAlarmIntentResponse;
  return [(INIntentResponse *)&v4 initWithCoder:a3];
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)INCreateAlarmIntentResponse;
  [(INIntentResponse *)&v3 encodeWithCoder:a3];
}

- (int64_t)code
{
  v3.receiver = self;
  v3.super_class = (Class)INCreateAlarmIntentResponse;
  return [(INIntentResponse *)&v3 code];
}

- (INCreateAlarmIntentResponse)initWithBackingStore:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)INCreateAlarmIntentResponse;
  return [(INIntentResponse *)&v4 initWithBackingStore:a3];
}

- (id)_initWithCode:(int64_t)a3 userActivity:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)INCreateAlarmIntentResponse;
  return [(INIntentResponse *)&v5 _initWithCode:a3 userActivity:a4];
}

- (INCreateAlarmIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  int64_t v7 = (void *)INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
  {
    if ((unint64_t)a3 > 5) {
      id v8 = 0;
    }
    else {
      id v8 = off_1E5520760[a3];
    }
    *(_DWORD *)buf = 136315906;
    v14 = "-[INCreateAlarmIntentResponse initWithCode:userActivity:]";
    __int16 v15 = 2048;
    int64_t v16 = a3;
    __int16 v17 = 2112;
    v18 = v8;
    __int16 v19 = 2112;
    id v20 = v6;
    v9 = v7;
    _os_log_impl(&dword_18CB2F000, v9, OS_LOG_TYPE_INFO, "%s code = %zd (%@), userActivity = %@", buf, 0x2Au);
  }
  v12.receiver = self;
  v12.super_class = (Class)INCreateAlarmIntentResponse;
  v10 = [(INIntentResponse *)&v12 _initWithCode:a3 userActivity:v6];

  return v10;
}

- (INCreateAlarmIntentResponse)init
{
  return [(INCreateAlarmIntentResponse *)self initWithCode:0 userActivity:0];
}

+ (BOOL)_appLaunchRequestedFromCode:(int64_t)a3
{
  return a3 == 5;
}

+ (int)_errorCodeFromCode:(int64_t)a3
{
  return 0x7FFFFFFF;
}

+ (int)_typeFromCode:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 4) {
    return 3;
  }
  else {
    return dword_18CFC59FC[a3 - 1];
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
      if (a5) {
        int64_t result = 5;
      }
      else {
        int64_t result = 4;
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