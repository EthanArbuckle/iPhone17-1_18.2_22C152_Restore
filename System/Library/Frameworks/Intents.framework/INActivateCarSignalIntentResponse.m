@interface INActivateCarSignalIntentResponse
+ (BOOL)_appLaunchRequestedFromCode:(int64_t)a3;
+ (BOOL)supportsSecureCoding;
+ (int)_errorCodeFromCode:(int64_t)a3;
+ (int)_typeFromCode:(int64_t)a3;
+ (int64_t)_codeFromType:(int)a3 errorCode:(int)a4 appLaunchRequested:(BOOL)a5;
- (INActivateCarSignalIntentResponse)initWithBackingStore:(id)a3;
- (INActivateCarSignalIntentResponse)initWithCode:(INActivateCarSignalIntentResponseCode)code userActivity:(NSUserActivity *)userActivity;
- (INActivateCarSignalIntentResponse)initWithCoder:(id)a3;
- (INActivateCarSignalIntentResponseCode)code;
- (INCarSignalOptions)signals;
- (id)_dictionaryRepresentation;
- (id)_initWithCode:(int64_t)a3 userActivity:(id)a4;
- (id)init;
- (int64_t)_codeWithName:(id)a3;
- (int64_t)_intentResponseCode;
- (void)encodeWithCoder:(id)a3;
- (void)setSignals:(INCarSignalOptions)signals;
@end

@implementation INActivateCarSignalIntentResponse

- (id)_dictionaryRepresentation
{
  v11[2] = *MEMORY[0x1E4F143B8];
  v10[0] = @"code";
  INActivateCarSignalIntentResponseCode v3 = [(INActivateCarSignalIntentResponse *)self code];
  unint64_t v4 = v3;
  if ((unint64_t)v3 <= INActivateCarSignalIntentResponseCodeFailureRequiringAppLaunch)
  {
    v5 = off_1E5516000[v3];
  }
  else
  {
    v5 = [MEMORY[0x1E4F1CA98] null];
  }
  v10[1] = @"signals";
  v11[0] = v5;
  v6 = INCarSignalOptionsGetNames([(INActivateCarSignalIntentResponse *)self signals]);
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

- (void)setSignals:(INCarSignalOptions)signals
{
  v5 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  [v5 clearSignals];

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __48__INActivateCarSignalIntentResponse_setSignals___block_invoke;
  v8[3] = &unk_1E5520C28;
  v8[4] = self;
  INCarSignalOptionsEnumerateBackingTypes(signals, v8);
  v6 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  v7 = [v6 data];
  [(INIntentResponse *)self _setPayloadResponseMessageData:v7];
}

void __48__INActivateCarSignalIntentResponse_setSignals___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) _responseMessagePBRepresentation];
  [v3 addSignals:a2];
}

- (INCarSignalOptions)signals
{
  id v3 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  uint64_t v4 = [v3 signalsCount];

  INCarSignalOptions v5 = 0;
  if (v4)
  {
    for (uint64_t i = 0; i != v4; ++i)
    {
      v7 = [(INIntentResponse *)self _responseMessagePBRepresentation];
      int v8 = [v7 signalsAtIndex:i];
      uint64_t v9 = v5 | 1;
      if (v8 != 1) {
        uint64_t v9 = v5;
      }
      if (v8 == 2) {
        v5 |= 2uLL;
      }
      else {
        INCarSignalOptions v5 = v9;
      }
    }
  }
  return v5;
}

- (int64_t)_codeWithName:(id)a3
{
  id v3 = a3;
  [v3 isEqualToString:@"INActivateCarSignalIntentResponseCodeUnspecified"];
  uint64_t v4 = [v3 isEqualToString:@"INActivateCarSignalIntentResponseCodeReady"];
  if ([v3 isEqualToString:@"INActivateCarSignalIntentResponseCodeInProgress"]) {
    uint64_t v4 = 2;
  }
  if ([v3 isEqualToString:@"INActivateCarSignalIntentResponseCodeSuccess"]) {
    uint64_t v4 = 3;
  }
  if ([v3 isEqualToString:@"INActivateCarSignalIntentResponseCodeFailure"]) {
    int64_t v5 = 4;
  }
  else {
    int64_t v5 = v4;
  }
  int v6 = [v3 isEqualToString:@"INActivateCarSignalIntentResponseCodeFailureRequiringAppLaunch"];

  if (v6) {
    return 5;
  }
  else {
    return v5;
  }
}

- (int64_t)_intentResponseCode
{
  INActivateCarSignalIntentResponseCode v2 = [(INActivateCarSignalIntentResponse *)self code];
  if ((unint64_t)(v2 - 1) > 4) {
    return 0;
  }
  else {
    return qword_18CFC5A10[v2 - 1];
  }
}

- (INActivateCarSignalIntentResponse)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)INActivateCarSignalIntentResponse;
  return [(INIntentResponse *)&v4 initWithCoder:a3];
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)INActivateCarSignalIntentResponse;
  [(INIntentResponse *)&v3 encodeWithCoder:a3];
}

- (INActivateCarSignalIntentResponseCode)code
{
  v3.receiver = self;
  v3.super_class = (Class)INActivateCarSignalIntentResponse;
  return [(INIntentResponse *)&v3 code];
}

- (INActivateCarSignalIntentResponse)initWithBackingStore:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)INActivateCarSignalIntentResponse;
  return [(INIntentResponse *)&v4 initWithBackingStore:a3];
}

- (id)_initWithCode:(int64_t)a3 userActivity:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)INActivateCarSignalIntentResponse;
  return [(INIntentResponse *)&v5 _initWithCode:a3 userActivity:a4];
}

- (INActivateCarSignalIntentResponse)initWithCode:(INActivateCarSignalIntentResponseCode)code userActivity:(NSUserActivity *)userActivity
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  int v6 = userActivity;
  v7 = (void *)INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
  {
    if ((unint64_t)code > INActivateCarSignalIntentResponseCodeFailureRequiringAppLaunch) {
      int v8 = 0;
    }
    else {
      int v8 = off_1E5516000[code];
    }
    *(_DWORD *)buf = 136315906;
    v14 = "-[INActivateCarSignalIntentResponse initWithCode:userActivity:]";
    __int16 v15 = 2048;
    INActivateCarSignalIntentResponseCode v16 = code;
    __int16 v17 = 2112;
    v18 = v8;
    __int16 v19 = 2112;
    v20 = v6;
    uint64_t v9 = v7;
    _os_log_impl(&dword_18CB2F000, v9, OS_LOG_TYPE_INFO, "%s code = %zd (%@), userActivity = %@", buf, 0x2Au);
  }
  v12.receiver = self;
  v12.super_class = (Class)INActivateCarSignalIntentResponse;
  v10 = [(INIntentResponse *)&v12 _initWithCode:code userActivity:v6];

  return v10;
}

- (id)init
{
  return [(INActivateCarSignalIntentResponse *)self initWithCode:0 userActivity:0];
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