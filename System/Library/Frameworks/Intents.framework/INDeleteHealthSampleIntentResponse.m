@interface INDeleteHealthSampleIntentResponse
+ (BOOL)_appLaunchRequestedFromCode:(int64_t)a3;
+ (BOOL)supportsSecureCoding;
+ (int)_errorCodeFromCode:(int64_t)a3;
+ (int)_typeFromCode:(int64_t)a3;
+ (int64_t)_codeFromType:(int)a3 errorCode:(int)a4 appLaunchRequested:(BOOL)a5;
- (INDeleteHealthSampleIntentResponse)init;
- (INDeleteHealthSampleIntentResponse)initWithBackingStore:(id)a3;
- (INDeleteHealthSampleIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4;
- (INDeleteHealthSampleIntentResponse)initWithCoder:(id)a3;
- (id)_dictionaryRepresentation;
- (id)_initWithCode:(int64_t)a3 userActivity:(id)a4;
- (int64_t)_codeWithName:(id)a3;
- (int64_t)_intentResponseCode;
- (int64_t)code;
- (void)encodeWithCoder:(id)a3;
@end

@implementation INDeleteHealthSampleIntentResponse

- (id)_dictionaryRepresentation
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v7 = @"code";
  unint64_t v2 = [(INDeleteHealthSampleIntentResponse *)self code];
  unint64_t v3 = v2;
  if (v2 <= 6)
  {
    v4 = off_1E5519E28[v2];
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

- (int64_t)_codeWithName:(id)a3
{
  id v3 = a3;
  [v3 isEqualToString:@"INDeleteHealthSampleIntentResponseCodeUnspecified"];
  uint64_t v4 = [v3 isEqualToString:@"INDeleteHealthSampleIntentResponseCodeReady"];
  if ([v3 isEqualToString:@"INDeleteHealthSampleIntentResponseCodeInProgress"]) {
    uint64_t v4 = 2;
  }
  if ([v3 isEqualToString:@"INDeleteHealthSampleIntentResponseCodeSuccess"]) {
    uint64_t v4 = 3;
  }
  if ([v3 isEqualToString:@"INDeleteHealthSampleIntentResponseCodeFailure"]) {
    uint64_t v4 = 4;
  }
  if ([v3 isEqualToString:@"INDeleteHealthSampleIntentResponseCodeFailureRequiringAppLaunch"])int64_t v5 = 5; {
  else
  }
    int64_t v5 = v4;
  int v6 = [v3 isEqualToString:@"INDeleteHealthSampleIntentResponseCodeFailureUUIDNotFound"];

  if (v6) {
    return 6;
  }
  else {
    return v5;
  }
}

- (int64_t)_intentResponseCode
{
  int64_t v2 = [(INDeleteHealthSampleIntentResponse *)self code];
  if ((unint64_t)(v2 - 1) > 5) {
    return 0;
  }
  else {
    return qword_18CFC5118[v2 - 1];
  }
}

- (INDeleteHealthSampleIntentResponse)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)INDeleteHealthSampleIntentResponse;
  return [(INIntentResponse *)&v4 initWithCoder:a3];
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)INDeleteHealthSampleIntentResponse;
  [(INIntentResponse *)&v3 encodeWithCoder:a3];
}

- (int64_t)code
{
  v3.receiver = self;
  v3.super_class = (Class)INDeleteHealthSampleIntentResponse;
  return [(INIntentResponse *)&v3 code];
}

- (INDeleteHealthSampleIntentResponse)initWithBackingStore:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)INDeleteHealthSampleIntentResponse;
  return [(INIntentResponse *)&v4 initWithBackingStore:a3];
}

- (id)_initWithCode:(int64_t)a3 userActivity:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)INDeleteHealthSampleIntentResponse;
  return [(INIntentResponse *)&v5 _initWithCode:a3 userActivity:a4];
}

- (INDeleteHealthSampleIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v7 = (void *)INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
  {
    if ((unint64_t)a3 > 6) {
      v8 = 0;
    }
    else {
      v8 = off_1E5519E28[a3];
    }
    *(_DWORD *)buf = 136315906;
    v14 = "-[INDeleteHealthSampleIntentResponse initWithCode:userActivity:]";
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
  v12.super_class = (Class)INDeleteHealthSampleIntentResponse;
  v10 = [(INIntentResponse *)&v12 _initWithCode:a3 userActivity:v6];

  return v10;
}

- (INDeleteHealthSampleIntentResponse)init
{
  return [(INDeleteHealthSampleIntentResponse *)self initWithCode:0 userActivity:0];
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