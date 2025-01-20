@interface INHangUpCallIntentResponse
+ (BOOL)_appLaunchRequestedFromCode:(int64_t)a3;
+ (BOOL)supportsSecureCoding;
+ (int)_errorCodeFromCode:(int64_t)a3;
+ (int)_typeFromCode:(int64_t)a3;
+ (int64_t)_codeFromType:(int)a3 errorCode:(int)a4 appLaunchRequested:(BOOL)a5;
- (INHangUpCallIntentResponse)initWithBackingStore:(id)a3;
- (INHangUpCallIntentResponse)initWithCode:(INHangUpCallIntentResponseCode)code userActivity:(NSUserActivity *)userActivity;
- (INHangUpCallIntentResponse)initWithCoder:(id)a3;
- (INHangUpCallIntentResponseCode)code;
- (id)_dictionaryRepresentation;
- (id)_initWithCode:(int64_t)a3 userActivity:(id)a4;
- (id)init;
- (int64_t)_codeWithName:(id)a3;
- (int64_t)_intentResponseCode;
- (int64_t)hungUpCallType;
- (void)encodeWithCoder:(id)a3;
- (void)setHungUpCallType:(int64_t)a3;
@end

@implementation INHangUpCallIntentResponse

- (id)_dictionaryRepresentation
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v7 = @"code";
  INHangUpCallIntentResponseCode v2 = [(INHangUpCallIntentResponse *)self code];
  unint64_t v3 = v2;
  if ((unint64_t)v2 <= INHangUpCallIntentResponseCodeFailureNoCallToHangUp)
  {
    v4 = off_1E551F580[v2];
  }
  else
  {
    v4 = [MEMORY[0x1E4F1CA98] null];
  }
  v8[0] = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
  if (v3 >= 7) {

  }
  return v5;
}

- (void)setHungUpCallType:(int64_t)a3
{
  uint64_t v4 = 0x7FFFFFFFLL;
  if ((unint64_t)(a3 - 1) <= 7) {
    uint64_t v4 = dword_18CFC4600[a3 - 1];
  }
  v5 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  v6 = v5;
  if (v4 == 0x7FFFFFFF) {
    [v5 setHasHungUpCallType:0];
  }
  else {
    [v5 setHungUpCallType:v4];
  }

  id v8 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  v7 = [v8 data];
  [(INIntentResponse *)self _setPayloadResponseMessageData:v7];
}

- (int64_t)hungUpCallType
{
  unint64_t v3 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  int v4 = [v3 hasHungUpCallType];
  v5 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  int v6 = [v5 hungUpCallType];
  if (v4 && (v6 - 2) <= 8) {
    int64_t v7 = qword_18CFC4620[v6 - 2];
  }
  else {
    int64_t v7 = 0;
  }

  return v7;
}

- (int64_t)_codeWithName:(id)a3
{
  id v3 = a3;
  [v3 isEqualToString:@"INHangUpCallIntentResponseCodeUnspecified"];
  uint64_t v4 = [v3 isEqualToString:@"INHangUpCallIntentResponseCodeReady"];
  if ([v3 isEqualToString:@"INHangUpCallIntentResponseCodeInProgress"]) {
    uint64_t v4 = 2;
  }
  if ([v3 isEqualToString:@"INHangUpCallIntentResponseCodeSuccess"]) {
    uint64_t v4 = 3;
  }
  if ([v3 isEqualToString:@"INHangUpCallIntentResponseCodeFailure"]) {
    uint64_t v4 = 4;
  }
  if ([v3 isEqualToString:@"INHangUpCallIntentResponseCodeFailureRequiringAppLaunch"])int64_t v5 = 5; {
  else
  }
    int64_t v5 = v4;
  int v6 = [v3 isEqualToString:@"INHangUpCallIntentResponseCodeFailureNoCallToHangUp"];

  if (v6) {
    return 6;
  }
  else {
    return v5;
  }
}

- (int64_t)_intentResponseCode
{
  INHangUpCallIntentResponseCode v2 = [(INHangUpCallIntentResponse *)self code];
  if ((unint64_t)(v2 - 1) > 5) {
    return 0;
  }
  else {
    return qword_18CFC5118[v2 - 1];
  }
}

- (INHangUpCallIntentResponse)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)INHangUpCallIntentResponse;
  return [(INIntentResponse *)&v4 initWithCoder:a3];
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)INHangUpCallIntentResponse;
  [(INIntentResponse *)&v3 encodeWithCoder:a3];
}

- (INHangUpCallIntentResponseCode)code
{
  v3.receiver = self;
  v3.super_class = (Class)INHangUpCallIntentResponse;
  return [(INIntentResponse *)&v3 code];
}

- (INHangUpCallIntentResponse)initWithBackingStore:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)INHangUpCallIntentResponse;
  return [(INIntentResponse *)&v4 initWithBackingStore:a3];
}

- (id)_initWithCode:(int64_t)a3 userActivity:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)INHangUpCallIntentResponse;
  return [(INIntentResponse *)&v5 _initWithCode:a3 userActivity:a4];
}

- (INHangUpCallIntentResponse)initWithCode:(INHangUpCallIntentResponseCode)code userActivity:(NSUserActivity *)userActivity
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  int v6 = userActivity;
  int64_t v7 = (void *)INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
  {
    if ((unint64_t)code > INHangUpCallIntentResponseCodeFailureNoCallToHangUp) {
      id v8 = 0;
    }
    else {
      id v8 = off_1E551F580[code];
    }
    *(_DWORD *)buf = 136315906;
    v14 = "-[INHangUpCallIntentResponse initWithCode:userActivity:]";
    __int16 v15 = 2048;
    INHangUpCallIntentResponseCode v16 = code;
    __int16 v17 = 2112;
    v18 = v8;
    __int16 v19 = 2112;
    v20 = v6;
    v9 = v7;
    _os_log_impl(&dword_18CB2F000, v9, OS_LOG_TYPE_INFO, "%s code = %zd (%@), userActivity = %@", buf, 0x2Au);
  }
  v12.receiver = self;
  v12.super_class = (Class)INHangUpCallIntentResponse;
  v10 = [(INIntentResponse *)&v12 _initWithCode:code userActivity:v6];

  return v10;
}

- (id)init
{
  return [(INHangUpCallIntentResponse *)self initWithCode:0 userActivity:0];
}

+ (BOOL)_appLaunchRequestedFromCode:(int64_t)a3
{
  return a3 == 5;
}

+ (int)_errorCodeFromCode:(int64_t)a3
{
  if (a3 == 6) {
    return 1;
  }
  else {
    return 0x7FFFFFFF;
  }
}

+ (int)_typeFromCode:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 5) {
    return 3;
  }
  else {
    return dword_18CFC5100[a3 - 1];
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
      int64_t v6 = 4;
      if (a5) {
        int64_t v6 = 5;
      }
      if (a4 == 1) {
        int64_t result = 6;
      }
      else {
        int64_t result = v6;
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