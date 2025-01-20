@interface INStartVideoCallIntentResponse
+ (BOOL)_appLaunchRequestedFromCode:(int64_t)a3;
+ (BOOL)supportsSecureCoding;
+ (int)_errorCodeFromCode:(int64_t)a3;
+ (int)_typeFromCode:(int64_t)a3;
+ (int64_t)_codeFromType:(int)a3 errorCode:(int)a4 appLaunchRequested:(BOOL)a5;
- (INStartVideoCallIntentResponse)initWithBackingStore:(id)a3;
- (INStartVideoCallIntentResponse)initWithCode:(INStartVideoCallIntentResponseCode)code userActivity:(NSUserActivity *)userActivity;
- (INStartVideoCallIntentResponse)initWithCoder:(id)a3;
- (INStartVideoCallIntentResponseCode)code;
- (double)timeToEstablishCall;
- (id)_dictionaryRepresentation;
- (id)_initWithCode:(int64_t)a3 userActivity:(id)a4;
- (id)init;
- (int64_t)_codeWithName:(id)a3;
- (int64_t)_intentResponseCode;
- (void)encodeWithCoder:(id)a3;
- (void)setTimeToEstablishCall:(double)a3;
@end

@implementation INStartVideoCallIntentResponse

- (id)_dictionaryRepresentation
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v7 = @"code";
  INStartVideoCallIntentResponseCode v2 = [(INStartVideoCallIntentResponse *)self code];
  unint64_t v3 = v2;
  if ((unint64_t)v2 <= INStartVideoCallIntentResponseCodeFailureInvalidNumber)
  {
    v4 = off_1E5519748[v2];
  }
  else
  {
    v4 = [MEMORY[0x1E4F1CA98] null];
  }
  v8[0] = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
  if (v3 >= 9) {

  }
  return v5;
}

- (void)setTimeToEstablishCall:(double)a3
{
  v9 = objc_alloc_init(_INPBCallMetricsValue);
  [(_INPBCallMetricsValue *)v9 setTimeToEstablish:a3];
  v5 = objc_alloc_init(_INPBCallMetrics);
  [(_INPBCallMetrics *)v5 setValue:v9];
  v6 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  [v6 setMetrics:v5];

  v7 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  v8 = [v7 data];
  [(INIntentResponse *)self _setPayloadResponseMessageData:v8];
}

- (double)timeToEstablishCall
{
  INStartVideoCallIntentResponseCode v2 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  unint64_t v3 = [v2 metrics];

  v4 = [v3 value];
  [v4 timeToEstablish];
  double v6 = v5;

  return v6;
}

- (int64_t)_codeWithName:(id)a3
{
  id v3 = a3;
  [v3 isEqualToString:@"INStartVideoCallIntentResponseCodeUnspecified"];
  uint64_t v4 = [v3 isEqualToString:@"INStartVideoCallIntentResponseCodeReady"];
  if ([v3 isEqualToString:@"INStartVideoCallIntentResponseCodeContinueInApp"]) {
    uint64_t v4 = 2;
  }
  if ([v3 isEqualToString:@"INStartVideoCallIntentResponseCodeFailure"]) {
    uint64_t v4 = 3;
  }
  if ([v3 isEqualToString:@"INStartVideoCallIntentResponseCodeFailureRequiringAppLaunch"])uint64_t v4 = 4; {
  if ([v3 isEqualToString:@"INStartVideoCallIntentResponseCodeFailureAppConfigurationRequired"])uint64_t v4 = 5;
  }
  if ([v3 isEqualToString:@"INStartVideoCallIntentResponseCodeFailureCallingServiceNotAvailable"])uint64_t v4 = 6; {
  if ([v3 isEqualToString:@"INStartVideoCallIntentResponseCodeFailureContactNotSupportedByApp"])int64_t v5 = 7;
  }
  else {
    int64_t v5 = v4;
  }
  int v6 = [v3 isEqualToString:@"INStartVideoCallIntentResponseCodeFailureInvalidNumber"];

  if (v6) {
    return 8;
  }
  else {
    return v5;
  }
}

- (int64_t)_intentResponseCode
{
  INStartVideoCallIntentResponseCode v2 = [(INStartVideoCallIntentResponse *)self code];
  if ((unint64_t)(v2 - 1) > 7) {
    return 0;
  }
  else {
    return qword_18CFC4930[v2 - 1];
  }
}

- (INStartVideoCallIntentResponse)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)INStartVideoCallIntentResponse;
  return [(INIntentResponse *)&v4 initWithCoder:a3];
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)INStartVideoCallIntentResponse;
  [(INIntentResponse *)&v3 encodeWithCoder:a3];
}

- (INStartVideoCallIntentResponseCode)code
{
  v3.receiver = self;
  v3.super_class = (Class)INStartVideoCallIntentResponse;
  return [(INIntentResponse *)&v3 code];
}

- (INStartVideoCallIntentResponse)initWithBackingStore:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)INStartVideoCallIntentResponse;
  return [(INIntentResponse *)&v4 initWithBackingStore:a3];
}

- (id)_initWithCode:(int64_t)a3 userActivity:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)INStartVideoCallIntentResponse;
  return [(INIntentResponse *)&v5 _initWithCode:a3 userActivity:a4];
}

- (INStartVideoCallIntentResponse)initWithCode:(INStartVideoCallIntentResponseCode)code userActivity:(NSUserActivity *)userActivity
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  int v6 = userActivity;
  v7 = (void *)INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
  {
    if ((unint64_t)code > INStartVideoCallIntentResponseCodeFailureInvalidNumber) {
      v8 = 0;
    }
    else {
      v8 = off_1E5519748[code];
    }
    *(_DWORD *)buf = 136315906;
    v14 = "-[INStartVideoCallIntentResponse initWithCode:userActivity:]";
    __int16 v15 = 2048;
    INStartVideoCallIntentResponseCode v16 = code;
    __int16 v17 = 2112;
    v18 = v8;
    __int16 v19 = 2112;
    v20 = v6;
    v9 = v7;
    _os_log_impl(&dword_18CB2F000, v9, OS_LOG_TYPE_INFO, "%s code = %zd (%@), userActivity = %@", buf, 0x2Au);
  }
  v12.receiver = self;
  v12.super_class = (Class)INStartVideoCallIntentResponse;
  v10 = [(INIntentResponse *)&v12 _initWithCode:code userActivity:v6];

  return v10;
}

- (id)init
{
  return [(INStartVideoCallIntentResponse *)self initWithCode:0 userActivity:0];
}

+ (BOOL)_appLaunchRequestedFromCode:(int64_t)a3
{
  return a3 == 4;
}

+ (int)_errorCodeFromCode:(int64_t)a3
{
  if ((unint64_t)(a3 - 5) < 4) {
    return a3 - 4;
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
    return dword_18CFC4910[a3 - 1];
  }
}

+ (int64_t)_codeFromType:(int)a3 errorCode:(int)a4 appLaunchRequested:(BOOL)a5
{
  uint64_t v5 = (a4 - 1);
  uint64_t v6 = 3;
  if (a5) {
    uint64_t v6 = 4;
  }
  if (v5 >= 4) {
    int64_t v7 = v6;
  }
  else {
    int64_t v7 = v5 + 5;
  }
  int64_t v8 = 2;
  if (a3 != 4) {
    int64_t v8 = a3 == 5;
  }
  if (a3 == 1) {
    return v7;
  }
  else {
    return v8;
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end