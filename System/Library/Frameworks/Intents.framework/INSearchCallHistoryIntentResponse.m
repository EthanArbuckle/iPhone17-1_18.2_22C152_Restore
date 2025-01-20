@interface INSearchCallHistoryIntentResponse
+ (BOOL)_appLaunchRequestedFromCode:(int64_t)a3;
+ (BOOL)supportsSecureCoding;
+ (int)_errorCodeFromCode:(int64_t)a3;
+ (int)_typeFromCode:(int64_t)a3;
+ (int64_t)_codeFromType:(int)a3 errorCode:(int)a4 appLaunchRequested:(BOOL)a5;
- (INSearchCallHistoryIntentResponse)initWithBackingStore:(id)a3;
- (INSearchCallHistoryIntentResponse)initWithCode:(INSearchCallHistoryIntentResponseCode)code userActivity:(NSUserActivity *)userActivity;
- (INSearchCallHistoryIntentResponse)initWithCoder:(id)a3;
- (INSearchCallHistoryIntentResponseCode)code;
- (NSArray)callRecords;
- (id)_dictionaryRepresentation;
- (id)_initWithCode:(int64_t)a3 userActivity:(id)a4;
- (id)init;
- (int64_t)_codeWithName:(id)a3;
- (int64_t)_intentResponseCode;
- (void)encodeWithCoder:(id)a3;
- (void)setCallRecords:(NSArray *)callRecords;
@end

@implementation INSearchCallHistoryIntentResponse

- (id)_dictionaryRepresentation
{
  v11[2] = *MEMORY[0x1E4F143B8];
  v10[0] = @"code";
  INSearchCallHistoryIntentResponseCode v3 = [(INSearchCallHistoryIntentResponse *)self code];
  unint64_t v4 = v3;
  if ((unint64_t)v3 <= INSearchCallHistoryIntentResponseCodeSuccess)
  {
    v5 = off_1E5517B58[v3];
  }
  else
  {
    v5 = [MEMORY[0x1E4F1CA98] null];
  }
  v10[1] = @"callRecords";
  v11[0] = v5;
  v6 = [(INSearchCallHistoryIntentResponse *)self callRecords];
  v7 = v6;
  if (!v6)
  {
    v7 = [MEMORY[0x1E4F1CA98] null];
  }
  v11[1] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];
  if (!v6) {

  }
  if (v4 >= 8) {

  }
  return v8;
}

- (void)setCallRecords:(NSArray *)callRecords
{
  unint64_t v4 = callRecords;
  v5 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  v6 = INIntentSlotValueTransformToCallRecordValues(v4);

  [v5 setCallRecords:v6];
  id v8 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  v7 = [v8 data];
  [(INIntentResponse *)self _setPayloadResponseMessageData:v7];
}

- (NSArray)callRecords
{
  v2 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  INSearchCallHistoryIntentResponseCode v3 = [v2 callRecords];
  unint64_t v4 = INIntentSlotValueTransformFromCallRecordValues(v3);

  return (NSArray *)v4;
}

- (int64_t)_codeWithName:(id)a3
{
  id v3 = a3;
  [v3 isEqualToString:@"INSearchCallHistoryIntentResponseCodeUnspecified"];
  uint64_t v4 = [v3 isEqualToString:@"INSearchCallHistoryIntentResponseCodeReady"];
  if ([v3 isEqualToString:@"INSearchCallHistoryIntentResponseCodeContinueInApp"]) {
    uint64_t v4 = 2;
  }
  if ([v3 isEqualToString:@"INSearchCallHistoryIntentResponseCodeInProgress"]) {
    uint64_t v4 = 6;
  }
  if ([v3 isEqualToString:@"INSearchCallHistoryIntentResponseCodeSuccess"]) {
    uint64_t v4 = 7;
  }
  if ([v3 isEqualToString:@"INSearchCallHistoryIntentResponseCodeFailure"]) {
    uint64_t v4 = 3;
  }
  if ([v3 isEqualToString:@"INSearchCallHistoryIntentResponseCodeFailureRequiringAppLaunch"])int64_t v5 = 4; {
  else
  }
    int64_t v5 = v4;
  int v6 = [v3 isEqualToString:@"INSearchCallHistoryIntentResponseCodeFailureAppConfigurationRequired"];

  if (v6) {
    return 5;
  }
  else {
    return v5;
  }
}

- (int64_t)_intentResponseCode
{
  INSearchCallHistoryIntentResponseCode v2 = [(INSearchCallHistoryIntentResponse *)self code];
  if ((unint64_t)(v2 - 1) > 6) {
    return 0;
  }
  else {
    return qword_18CFC4310[v2 - 1];
  }
}

- (INSearchCallHistoryIntentResponse)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)INSearchCallHistoryIntentResponse;
  return [(INIntentResponse *)&v4 initWithCoder:a3];
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)INSearchCallHistoryIntentResponse;
  [(INIntentResponse *)&v3 encodeWithCoder:a3];
}

- (INSearchCallHistoryIntentResponseCode)code
{
  v3.receiver = self;
  v3.super_class = (Class)INSearchCallHistoryIntentResponse;
  return [(INIntentResponse *)&v3 code];
}

- (INSearchCallHistoryIntentResponse)initWithBackingStore:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)INSearchCallHistoryIntentResponse;
  return [(INIntentResponse *)&v4 initWithBackingStore:a3];
}

- (id)_initWithCode:(int64_t)a3 userActivity:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)INSearchCallHistoryIntentResponse;
  return [(INIntentResponse *)&v5 _initWithCode:a3 userActivity:a4];
}

- (INSearchCallHistoryIntentResponse)initWithCode:(INSearchCallHistoryIntentResponseCode)code userActivity:(NSUserActivity *)userActivity
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  int v6 = userActivity;
  v7 = (void *)INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
  {
    if ((unint64_t)code > INSearchCallHistoryIntentResponseCodeSuccess) {
      id v8 = 0;
    }
    else {
      id v8 = off_1E5517B58[code];
    }
    *(_DWORD *)buf = 136315906;
    v14 = "-[INSearchCallHistoryIntentResponse initWithCode:userActivity:]";
    __int16 v15 = 2048;
    INSearchCallHistoryIntentResponseCode v16 = code;
    __int16 v17 = 2112;
    v18 = v8;
    __int16 v19 = 2112;
    v20 = v6;
    v9 = v7;
    _os_log_impl(&dword_18CB2F000, v9, OS_LOG_TYPE_INFO, "%s code = %zd (%@), userActivity = %@", buf, 0x2Au);
  }
  v12.receiver = self;
  v12.super_class = (Class)INSearchCallHistoryIntentResponse;
  v10 = [(INIntentResponse *)&v12 _initWithCode:code userActivity:v6];

  return v10;
}

- (id)init
{
  return [(INSearchCallHistoryIntentResponse *)self initWithCode:0 userActivity:0];
}

+ (BOOL)_appLaunchRequestedFromCode:(int64_t)a3
{
  return a3 == 4;
}

+ (int)_errorCodeFromCode:(int64_t)a3
{
  if (a3 == 5) {
    return 1;
  }
  else {
    return 0x7FFFFFFF;
  }
}

+ (int)_typeFromCode:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 6) {
    return 3;
  }
  else {
    return dword_18CFC42F0[a3 - 1];
  }
}

+ (int64_t)_codeFromType:(int)a3 errorCode:(int)a4 appLaunchRequested:(BOOL)a5
{
  int64_t result = 0;
  switch(a3)
  {
    case 0:
      int64_t result = 7;
      break;
    case 1:
      int64_t v6 = 3;
      if (a5) {
        int64_t v6 = 4;
      }
      if (a4 == 1) {
        int64_t result = 5;
      }
      else {
        int64_t result = v6;
      }
      break;
    case 2:
      int64_t result = 6;
      break;
    case 4:
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