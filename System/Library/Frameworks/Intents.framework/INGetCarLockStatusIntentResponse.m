@interface INGetCarLockStatusIntentResponse
+ (BOOL)_appLaunchRequestedFromCode:(int64_t)a3;
+ (BOOL)supportsSecureCoding;
+ (int)_errorCodeFromCode:(int64_t)a3;
+ (int)_typeFromCode:(int64_t)a3;
+ (int64_t)_codeFromType:(int)a3 errorCode:(int)a4 appLaunchRequested:(BOOL)a5;
- (INGetCarLockStatusIntentResponse)initWithBackingStore:(id)a3;
- (INGetCarLockStatusIntentResponse)initWithCode:(INGetCarLockStatusIntentResponseCode)code userActivity:(NSUserActivity *)userActivity;
- (INGetCarLockStatusIntentResponse)initWithCoder:(id)a3;
- (INGetCarLockStatusIntentResponseCode)code;
- (NSNumber)locked;
- (id)_dictionaryRepresentation;
- (id)_initWithCode:(int64_t)a3 userActivity:(id)a4;
- (id)init;
- (int64_t)_codeWithName:(id)a3;
- (int64_t)_intentResponseCode;
- (void)encodeWithCoder:(id)a3;
- (void)setLocked:(NSNumber *)locked;
@end

@implementation INGetCarLockStatusIntentResponse

- (id)_dictionaryRepresentation
{
  v11[2] = *MEMORY[0x1E4F143B8];
  v10[0] = @"code";
  INGetCarLockStatusIntentResponseCode v3 = [(INGetCarLockStatusIntentResponse *)self code];
  unint64_t v4 = v3;
  if ((unint64_t)v3 <= INGetCarLockStatusIntentResponseCodeFailureRequiringAppLaunch)
  {
    v5 = off_1E551B990[v3];
  }
  else
  {
    v5 = [MEMORY[0x1E4F1CA98] null];
  }
  v10[1] = @"locked";
  v11[0] = v5;
  v6 = [(INGetCarLockStatusIntentResponse *)self locked];
  v7 = v6;
  if (!v6)
  {
    v7 = [MEMORY[0x1E4F1CA98] null];
  }
  v11[1] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];
  if (!v6) {

  }
  if (v4 >= 6) {

  }
  return v8;
}

- (void)setLocked:(NSNumber *)locked
{
  v7 = locked;
  unint64_t v4 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  if (v7) {
    objc_msgSend(v4, "setLocked:", -[NSNumber BOOLValue](v7, "BOOLValue"));
  }
  else {
    [v4 setHasLocked:0];
  }

  v5 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  v6 = [v5 data];
  [(INIntentResponse *)self _setPayloadResponseMessageData:v6];
}

- (NSNumber)locked
{
  INGetCarLockStatusIntentResponseCode v3 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  if ([v3 hasLocked])
  {
    unint64_t v4 = NSNumber;
    v5 = [(INIntentResponse *)self _responseMessagePBRepresentation];
    v6 = objc_msgSend(v4, "numberWithBool:", objc_msgSend(v5, "locked"));
  }
  else
  {
    v6 = 0;
  }

  return (NSNumber *)v6;
}

- (int64_t)_codeWithName:(id)a3
{
  id v3 = a3;
  [v3 isEqualToString:@"INGetCarLockStatusIntentResponseCodeUnspecified"];
  uint64_t v4 = [v3 isEqualToString:@"INGetCarLockStatusIntentResponseCodeReady"];
  if ([v3 isEqualToString:@"INGetCarLockStatusIntentResponseCodeInProgress"]) {
    uint64_t v4 = 2;
  }
  if ([v3 isEqualToString:@"INGetCarLockStatusIntentResponseCodeSuccess"]) {
    uint64_t v4 = 3;
  }
  if ([v3 isEqualToString:@"INGetCarLockStatusIntentResponseCodeFailure"]) {
    int64_t v5 = 4;
  }
  else {
    int64_t v5 = v4;
  }
  int v6 = [v3 isEqualToString:@"INGetCarLockStatusIntentResponseCodeFailureRequiringAppLaunch"];

  if (v6) {
    return 5;
  }
  else {
    return v5;
  }
}

- (int64_t)_intentResponseCode
{
  INGetCarLockStatusIntentResponseCode v2 = [(INGetCarLockStatusIntentResponse *)self code];
  if ((unint64_t)(v2 - 1) > 4) {
    return 0;
  }
  else {
    return qword_18CFC5A10[v2 - 1];
  }
}

- (INGetCarLockStatusIntentResponse)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)INGetCarLockStatusIntentResponse;
  return [(INIntentResponse *)&v4 initWithCoder:a3];
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)INGetCarLockStatusIntentResponse;
  [(INIntentResponse *)&v3 encodeWithCoder:a3];
}

- (INGetCarLockStatusIntentResponseCode)code
{
  v3.receiver = self;
  v3.super_class = (Class)INGetCarLockStatusIntentResponse;
  return [(INIntentResponse *)&v3 code];
}

- (INGetCarLockStatusIntentResponse)initWithBackingStore:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)INGetCarLockStatusIntentResponse;
  return [(INIntentResponse *)&v4 initWithBackingStore:a3];
}

- (id)_initWithCode:(int64_t)a3 userActivity:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)INGetCarLockStatusIntentResponse;
  return [(INIntentResponse *)&v5 _initWithCode:a3 userActivity:a4];
}

- (INGetCarLockStatusIntentResponse)initWithCode:(INGetCarLockStatusIntentResponseCode)code userActivity:(NSUserActivity *)userActivity
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  int v6 = userActivity;
  v7 = (void *)INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
  {
    if ((unint64_t)code > INGetCarLockStatusIntentResponseCodeFailureRequiringAppLaunch) {
      v8 = 0;
    }
    else {
      v8 = off_1E551B990[code];
    }
    *(_DWORD *)buf = 136315906;
    v14 = "-[INGetCarLockStatusIntentResponse initWithCode:userActivity:]";
    __int16 v15 = 2048;
    INGetCarLockStatusIntentResponseCode v16 = code;
    __int16 v17 = 2112;
    v18 = v8;
    __int16 v19 = 2112;
    v20 = v6;
    v9 = v7;
    _os_log_impl(&dword_18CB2F000, v9, OS_LOG_TYPE_INFO, "%s code = %zd (%@), userActivity = %@", buf, 0x2Au);
  }
  v12.receiver = self;
  v12.super_class = (Class)INGetCarLockStatusIntentResponse;
  v10 = [(INIntentResponse *)&v12 _initWithCode:code userActivity:v6];

  return v10;
}

- (id)init
{
  return [(INGetCarLockStatusIntentResponse *)self initWithCode:0 userActivity:0];
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