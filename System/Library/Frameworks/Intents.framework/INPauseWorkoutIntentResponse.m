@interface INPauseWorkoutIntentResponse
+ (BOOL)_appLaunchRequestedFromCode:(int64_t)a3;
+ (BOOL)supportsSecureCoding;
+ (int)_errorCodeFromCode:(int64_t)a3;
+ (int)_typeFromCode:(int64_t)a3;
+ (int64_t)_codeFromType:(int)a3 errorCode:(int)a4 appLaunchRequested:(BOOL)a5;
- (BOOL)_shouldForwardIntentToApp;
- (INPauseWorkoutIntentResponse)initWithBackingStore:(id)a3;
- (INPauseWorkoutIntentResponse)initWithCode:(INPauseWorkoutIntentResponseCode)code userActivity:(NSUserActivity *)userActivity;
- (INPauseWorkoutIntentResponse)initWithCoder:(id)a3;
- (INPauseWorkoutIntentResponseCode)code;
- (id)_dictionaryRepresentation;
- (id)_initWithCode:(int64_t)a3 userActivity:(id)a4;
- (id)init;
- (int64_t)_codeWithName:(id)a3;
- (int64_t)_intentResponseCode;
- (void)encodeWithCoder:(id)a3;
@end

@implementation INPauseWorkoutIntentResponse

- (id)_dictionaryRepresentation
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v7 = @"code";
  INPauseWorkoutIntentResponseCode v2 = [(INPauseWorkoutIntentResponse *)self code];
  unint64_t v3 = v2;
  if ((unint64_t)v2 <= INPauseWorkoutIntentResponseCodeSuccess)
  {
    v4 = off_1E551BC88[v2];
  }
  else
  {
    v4 = [MEMORY[0x1E4F1CA98] null];
  }
  v8[0] = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
  if (v3 >= 8) {

  }
  return v5;
}

- (BOOL)_shouldForwardIntentToApp
{
  return [(INPauseWorkoutIntentResponse *)self code] == INPauseWorkoutIntentResponseCodeHandleInApp;
}

- (int64_t)_codeWithName:(id)a3
{
  id v3 = a3;
  [v3 isEqualToString:@"INPauseWorkoutIntentResponseCodeUnspecified"];
  uint64_t v4 = [v3 isEqualToString:@"INPauseWorkoutIntentResponseCodeReady"];
  if ([v3 isEqualToString:@"INPauseWorkoutIntentResponseCodeContinueInApp"]) {
    uint64_t v4 = 2;
  }
  if ([v3 isEqualToString:@"INPauseWorkoutIntentResponseCodeSuccess"]) {
    uint64_t v4 = 7;
  }
  if ([v3 isEqualToString:@"INPauseWorkoutIntentResponseCodeHandleInApp"]) {
    uint64_t v4 = 6;
  }
  if ([v3 isEqualToString:@"INPauseWorkoutIntentResponseCodeFailure"]) {
    uint64_t v4 = 3;
  }
  if ([v3 isEqualToString:@"INPauseWorkoutIntentResponseCodeFailureRequiringAppLaunch"])int64_t v5 = 4; {
  else
  }
    int64_t v5 = v4;
  int v6 = [v3 isEqualToString:@"INPauseWorkoutIntentResponseCodeFailureNoMatchingWorkout"];

  if (v6) {
    return 5;
  }
  else {
    return v5;
  }
}

- (int64_t)_intentResponseCode
{
  INPauseWorkoutIntentResponseCode v2 = [(INPauseWorkoutIntentResponse *)self code];
  if ((unint64_t)(v2 - 1) > 6) {
    return 0;
  }
  else {
    return qword_18CFC4C50[v2 - 1];
  }
}

- (INPauseWorkoutIntentResponse)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)INPauseWorkoutIntentResponse;
  return [(INIntentResponse *)&v4 initWithCoder:a3];
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)INPauseWorkoutIntentResponse;
  [(INIntentResponse *)&v3 encodeWithCoder:a3];
}

- (INPauseWorkoutIntentResponseCode)code
{
  v3.receiver = self;
  v3.super_class = (Class)INPauseWorkoutIntentResponse;
  return [(INIntentResponse *)&v3 code];
}

- (INPauseWorkoutIntentResponse)initWithBackingStore:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)INPauseWorkoutIntentResponse;
  return [(INIntentResponse *)&v4 initWithBackingStore:a3];
}

- (id)_initWithCode:(int64_t)a3 userActivity:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)INPauseWorkoutIntentResponse;
  return [(INIntentResponse *)&v5 _initWithCode:a3 userActivity:a4];
}

- (INPauseWorkoutIntentResponse)initWithCode:(INPauseWorkoutIntentResponseCode)code userActivity:(NSUserActivity *)userActivity
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  int v6 = userActivity;
  v7 = (void *)INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
  {
    if ((unint64_t)code > INPauseWorkoutIntentResponseCodeSuccess) {
      v8 = 0;
    }
    else {
      v8 = off_1E551BC88[code];
    }
    *(_DWORD *)buf = 136315906;
    v14 = "-[INPauseWorkoutIntentResponse initWithCode:userActivity:]";
    __int16 v15 = 2048;
    INPauseWorkoutIntentResponseCode v16 = code;
    __int16 v17 = 2112;
    v18 = v8;
    __int16 v19 = 2112;
    v20 = v6;
    v9 = v7;
    _os_log_impl(&dword_18CB2F000, v9, OS_LOG_TYPE_INFO, "%s code = %zd (%@), userActivity = %@", buf, 0x2Au);
  }
  v12.receiver = self;
  v12.super_class = (Class)INPauseWorkoutIntentResponse;
  v10 = [(INIntentResponse *)&v12 _initWithCode:code userActivity:v6];

  return v10;
}

- (id)init
{
  return [(INPauseWorkoutIntentResponse *)self initWithCode:0 userActivity:0];
}

+ (BOOL)_appLaunchRequestedFromCode:(int64_t)a3
{
  return a3 == 4;
}

+ (int)_errorCodeFromCode:(int64_t)a3
{
  if (a3 == 5) {
    return 0;
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
    return dword_18CFC4C34[a3 - 1];
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
      if (a4) {
        int64_t result = v6;
      }
      else {
        int64_t result = 5;
      }
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