@interface INAnswerCallIntentResponse
+ (BOOL)_appLaunchRequestedFromCode:(int64_t)a3;
+ (BOOL)supportsSecureCoding;
+ (int)_errorCodeFromCode:(int64_t)a3;
+ (int)_typeFromCode:(int64_t)a3;
+ (int64_t)_codeFromType:(int)a3 errorCode:(int)a4 appLaunchRequested:(BOOL)a5;
- (INAnswerCallIntentResponse)initWithBackingStore:(id)a3;
- (INAnswerCallIntentResponse)initWithCode:(INAnswerCallIntentResponseCode)code userActivity:(NSUserActivity *)userActivity;
- (INAnswerCallIntentResponse)initWithCoder:(id)a3;
- (INAnswerCallIntentResponseCode)code;
- (INConnectedCall)answeredCall;
- (NSArray)callRecords;
- (id)_dictionaryRepresentation;
- (id)_initWithCode:(int64_t)a3 userActivity:(id)a4;
- (id)init;
- (int64_t)_codeWithName:(id)a3;
- (int64_t)_intentResponseCode;
- (int64_t)statusCode;
- (void)encodeWithCoder:(id)a3;
- (void)setAnsweredCall:(id)a3;
- (void)setCallRecords:(NSArray *)callRecords;
- (void)setStatusCode:(int64_t)a3;
@end

@implementation INAnswerCallIntentResponse

- (id)_dictionaryRepresentation
{
  v11[2] = *MEMORY[0x1E4F143B8];
  v10[0] = @"code";
  INAnswerCallIntentResponseCode v3 = [(INAnswerCallIntentResponse *)self code];
  unint64_t v4 = v3;
  if ((unint64_t)v3 <= INAnswerCallIntentResponseCodeFailureRequiringAppLaunch)
  {
    v5 = off_1E551F470[v3];
  }
  else
  {
    v5 = [MEMORY[0x1E4F1CA98] null];
  }
  v10[1] = @"callRecords";
  v11[0] = v5;
  v6 = [(INAnswerCallIntentResponse *)self callRecords];
  v7 = v6;
  if (!v6)
  {
    v7 = [MEMORY[0x1E4F1CA98] null];
  }
  v11[1] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];
  if (!v6) {

  }
  if (v4 >= 7) {

  }
  return v8;
}

- (void)setAnsweredCall:(id)a3
{
  id v4 = a3;
  v5 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  v6 = INIntentSlotValueTransformToConnectedCall(v4);

  [v5 setAnsweredCall:v6];
  id v8 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  v7 = [v8 data];
  [(INIntentResponse *)self _setPayloadResponseMessageData:v7];
}

- (void)setCallRecords:(NSArray *)callRecords
{
  id v4 = callRecords;
  v5 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  v6 = INIntentSlotValueTransformToCallRecordValues(v4);

  [v5 setCallRecords:v6];
  id v8 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  v7 = [v8 data];
  [(INIntentResponse *)self _setPayloadResponseMessageData:v7];
}

- (void)setStatusCode:(int64_t)a3
{
  if (a3 == 1) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = 0x7FFFFFFF;
  }
  if (a3 == 2) {
    uint64_t v5 = 2;
  }
  else {
    uint64_t v5 = v4;
  }
  v6 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  v7 = v6;
  if (v5 == 0x7FFFFFFF) {
    [v6 setHasStatusCode:0];
  }
  else {
    [v6 setStatusCode:v5];
  }

  id v9 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  id v8 = [v9 data];
  [(INIntentResponse *)self _setPayloadResponseMessageData:v8];
}

- (INConnectedCall)answeredCall
{
  v2 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  INAnswerCallIntentResponseCode v3 = [v2 answeredCall];
  unsigned int v4 = INIntentSlotValueTransformFromConnectedCall(v3);

  return (INConnectedCall *)v4;
}

- (NSArray)callRecords
{
  v2 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  INAnswerCallIntentResponseCode v3 = [v2 callRecords];
  unsigned int v4 = INIntentSlotValueTransformFromCallRecordValues(v3);

  return (NSArray *)v4;
}

- (int64_t)statusCode
{
  INAnswerCallIntentResponseCode v3 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  int v4 = [v3 hasStatusCode];
  uint64_t v5 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  int v6 = [v5 statusCode];
  uint64_t v7 = 2 * (v6 == 2);
  if (v6 == 1) {
    uint64_t v7 = 1;
  }
  if (v4) {
    int64_t v8 = v7;
  }
  else {
    int64_t v8 = 0;
  }

  return v8;
}

- (int64_t)_codeWithName:(id)a3
{
  id v3 = a3;
  [v3 isEqualToString:@"INAnswerCallIntentResponseCodeUnspecified"];
  uint64_t v4 = [v3 isEqualToString:@"INAnswerCallIntentResponseCodeReady"];
  if ([v3 isEqualToString:@"INAnswerCallIntentResponseCodeContinueInApp"]) {
    uint64_t v4 = 2;
  }
  if ([v3 isEqualToString:@"INAnswerCallIntentResponseCodeInProgress"]) {
    uint64_t v4 = 3;
  }
  if ([v3 isEqualToString:@"INAnswerCallIntentResponseCodeSuccess"]) {
    uint64_t v4 = 4;
  }
  if ([v3 isEqualToString:@"INAnswerCallIntentResponseCodeFailure"]) {
    int64_t v5 = 5;
  }
  else {
    int64_t v5 = v4;
  }
  int v6 = [v3 isEqualToString:@"INAnswerCallIntentResponseCodeFailureRequiringAppLaunch"];

  if (v6) {
    return 6;
  }
  else {
    return v5;
  }
}

- (int64_t)_intentResponseCode
{
  int64_t result = [(INAnswerCallIntentResponse *)self code];
  if ((unint64_t)(result - 1) >= 6) {
    return 0;
  }
  return result;
}

- (INAnswerCallIntentResponse)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)INAnswerCallIntentResponse;
  return [(INIntentResponse *)&v4 initWithCoder:a3];
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)INAnswerCallIntentResponse;
  [(INIntentResponse *)&v3 encodeWithCoder:a3];
}

- (INAnswerCallIntentResponseCode)code
{
  v3.receiver = self;
  v3.super_class = (Class)INAnswerCallIntentResponse;
  return [(INIntentResponse *)&v3 code];
}

- (INAnswerCallIntentResponse)initWithBackingStore:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)INAnswerCallIntentResponse;
  return [(INIntentResponse *)&v4 initWithBackingStore:a3];
}

- (id)_initWithCode:(int64_t)a3 userActivity:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)INAnswerCallIntentResponse;
  return [(INIntentResponse *)&v5 _initWithCode:a3 userActivity:a4];
}

- (INAnswerCallIntentResponse)initWithCode:(INAnswerCallIntentResponseCode)code userActivity:(NSUserActivity *)userActivity
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  int v6 = userActivity;
  uint64_t v7 = (void *)INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
  {
    if ((unint64_t)code > INAnswerCallIntentResponseCodeFailureRequiringAppLaunch) {
      int64_t v8 = 0;
    }
    else {
      int64_t v8 = off_1E551F470[code];
    }
    *(_DWORD *)buf = 136315906;
    v14 = "-[INAnswerCallIntentResponse initWithCode:userActivity:]";
    __int16 v15 = 2048;
    INAnswerCallIntentResponseCode v16 = code;
    __int16 v17 = 2112;
    v18 = v8;
    __int16 v19 = 2112;
    v20 = v6;
    id v9 = v7;
    _os_log_impl(&dword_18CB2F000, v9, OS_LOG_TYPE_INFO, "%s code = %zd (%@), userActivity = %@", buf, 0x2Au);
  }
  v12.receiver = self;
  v12.super_class = (Class)INAnswerCallIntentResponse;
  v10 = [(INIntentResponse *)&v12 _initWithCode:code userActivity:v6];

  return v10;
}

- (id)init
{
  return [(INAnswerCallIntentResponse *)self initWithCode:0 userActivity:0];
}

+ (BOOL)_appLaunchRequestedFromCode:(int64_t)a3
{
  return a3 == 6;
}

+ (int)_errorCodeFromCode:(int64_t)a3
{
  return 0x7FFFFFFF;
}

+ (int)_typeFromCode:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 5) {
    return 3;
  }
  else {
    return dword_18CFC59E4[a3 - 1];
  }
}

+ (int64_t)_codeFromType:(int)a3 errorCode:(int)a4 appLaunchRequested:(BOOL)a5
{
  int64_t result = 0;
  switch(a3)
  {
    case 0:
      int64_t result = 4;
      break;
    case 1:
      if (a5) {
        int64_t result = 6;
      }
      else {
        int64_t result = 5;
      }
      break;
    case 2:
      int64_t result = 3;
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