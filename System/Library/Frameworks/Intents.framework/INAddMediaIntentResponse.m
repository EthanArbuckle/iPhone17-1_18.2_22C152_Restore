@interface INAddMediaIntentResponse
+ (BOOL)_appLaunchRequestedFromCode:(int64_t)a3;
+ (BOOL)supportsSecureCoding;
+ (int)_errorCodeFromCode:(int64_t)a3;
+ (int)_typeFromCode:(int64_t)a3;
+ (int64_t)_codeFromType:(int)a3 errorCode:(int)a4 appLaunchRequested:(BOOL)a5;
- (BOOL)_shouldForwardIntentToApp;
- (INAddMediaIntentResponse)initWithBackingStore:(id)a3;
- (INAddMediaIntentResponse)initWithCode:(INAddMediaIntentResponseCode)code userActivity:(NSUserActivity *)userActivity;
- (INAddMediaIntentResponse)initWithCoder:(id)a3;
- (INAddMediaIntentResponseCode)code;
- (id)_dictionaryRepresentation;
- (id)_initWithCode:(int64_t)a3 userActivity:(id)a4;
- (id)init;
- (int64_t)_codeWithName:(id)a3;
- (int64_t)_intentResponseCode;
- (void)encodeWithCoder:(id)a3;
@end

@implementation INAddMediaIntentResponse

- (id)_dictionaryRepresentation
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v6 = @"code";
  v2 = INAddMediaIntentResponseCodeGetName([(INAddMediaIntentResponse *)self code]);
  v3 = v2;
  if (!v2)
  {
    v3 = [MEMORY[0x1E4F1CA98] null];
  }
  v7[0] = v3;
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  if (!v2) {

  }
  return v4;
}

- (BOOL)_shouldForwardIntentToApp
{
  return [(INAddMediaIntentResponse *)self code] == INAddMediaIntentResponseCodeHandleInApp;
}

- (int64_t)_codeWithName:(id)a3
{
  id v3 = a3;
  [v3 isEqualToString:@"INAddMediaIntentResponseCodeUnspecified"];
  uint64_t v4 = [v3 isEqualToString:@"INAddMediaIntentResponseCodeReady"];
  if ([v3 isEqualToString:@"INAddMediaIntentResponseCodeInProgress"]) {
    uint64_t v4 = 2;
  }
  if ([v3 isEqualToString:@"INAddMediaIntentResponseCodeSuccess"]) {
    uint64_t v4 = 3;
  }
  if ([v3 isEqualToString:@"INAddMediaIntentResponseCodeHandleInApp"]) {
    uint64_t v4 = 4;
  }
  if ([v3 isEqualToString:@"INAddMediaIntentResponseCodeFailure"]) {
    uint64_t v4 = 5;
  }
  if ([v3 isEqualToString:@"INAddMediaIntentResponseCodeFailureRequiringAppLaunch"])int64_t v5 = 6; {
  else
  }
    int64_t v5 = v4;
  int v6 = [v3 isEqualToString:@"INAddMediaIntentResponseCodeFailureAlreadyInLibrary"];

  if (v6) {
    return 1000;
  }
  else {
    return v5;
  }
}

- (int64_t)_intentResponseCode
{
  int64_t result = [(INAddMediaIntentResponse *)self code];
  switch(result)
  {
    case 1:
    case 5:
    case 6:
      return result;
    case 2:
      int64_t result = 3;
      break;
    case 3:
      int64_t result = 4;
      break;
    case 4:
      int64_t result = 7;
      break;
    default:
      if (result == 1000) {
        int64_t result = 5;
      }
      else {
        int64_t result = 0;
      }
      break;
  }
  return result;
}

- (INAddMediaIntentResponse)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)INAddMediaIntentResponse;
  return [(INIntentResponse *)&v4 initWithCoder:a3];
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)INAddMediaIntentResponse;
  [(INIntentResponse *)&v3 encodeWithCoder:a3];
}

- (INAddMediaIntentResponseCode)code
{
  v3.receiver = self;
  v3.super_class = (Class)INAddMediaIntentResponse;
  return [(INIntentResponse *)&v3 code];
}

- (INAddMediaIntentResponse)initWithBackingStore:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)INAddMediaIntentResponse;
  return [(INIntentResponse *)&v4 initWithBackingStore:a3];
}

- (id)_initWithCode:(int64_t)a3 userActivity:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)INAddMediaIntentResponse;
  return [(INIntentResponse *)&v5 _initWithCode:a3 userActivity:a4];
}

- (INAddMediaIntentResponse)initWithCode:(INAddMediaIntentResponseCode)code userActivity:(NSUserActivity *)userActivity
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  int v6 = userActivity;
  v7 = (void *)INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
  {
    v8 = v7;
    v9 = INAddMediaIntentResponseCodeGetName(code);
    *(_DWORD *)buf = 136315906;
    v14 = "-[INAddMediaIntentResponse initWithCode:userActivity:]";
    __int16 v15 = 2048;
    INAddMediaIntentResponseCode v16 = code;
    __int16 v17 = 2112;
    v18 = v9;
    __int16 v19 = 2112;
    v20 = v6;
    _os_log_impl(&dword_18CB2F000, v8, OS_LOG_TYPE_INFO, "%s code = %zd (%@), userActivity = %@", buf, 0x2Au);
  }
  v12.receiver = self;
  v12.super_class = (Class)INAddMediaIntentResponse;
  v10 = [(INIntentResponse *)&v12 _initWithCode:code userActivity:v6];

  return v10;
}

- (id)init
{
  return [(INAddMediaIntentResponse *)self initWithCode:0 userActivity:0];
}

+ (BOOL)_appLaunchRequestedFromCode:(int64_t)a3
{
  return a3 == 6;
}

+ (int)_errorCodeFromCode:(int64_t)a3
{
  if (a3 == 1000) {
    return 1;
  }
  else {
    return 0x7FFFFFFF;
  }
}

+ (int)_typeFromCode:(int64_t)a3
{
  switch(a3)
  {
    case 1:
      int result = 5;
      break;
    case 2:
      int result = 2;
      break;
    case 3:
      int result = 0;
      break;
    case 4:
    case 5:
    case 6:
      goto LABEL_4;
    default:
      if (a3 == 1000) {
LABEL_4:
      }
        int result = 1;
      else {
        int result = 3;
      }
      break;
  }
  return result;
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
      int64_t v6 = 5;
      if (a5) {
        int64_t v6 = 6;
      }
      if (a4 == 1) {
        int64_t result = 1000;
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