@interface INScanVisualCodeIntentResponse
+ (BOOL)_appLaunchRequestedFromCode:(int64_t)a3;
+ (BOOL)supportsSecureCoding;
+ (int)_errorCodeFromCode:(int64_t)a3;
+ (int)_typeFromCode:(int64_t)a3;
+ (int64_t)_codeFromType:(int)a3 errorCode:(int)a4 appLaunchRequested:(BOOL)a5;
- (INScanVisualCodeIntentResponse)init;
- (INScanVisualCodeIntentResponse)initWithBackingStore:(id)a3;
- (INScanVisualCodeIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4;
- (INScanVisualCodeIntentResponse)initWithCoder:(id)a3;
- (id)_dictionaryRepresentation;
- (id)_initWithCode:(int64_t)a3 userActivity:(id)a4;
- (int64_t)_codeWithName:(id)a3;
- (int64_t)_intentResponseCode;
- (int64_t)code;
- (void)encodeWithCoder:(id)a3;
@end

@implementation INScanVisualCodeIntentResponse

- (id)_dictionaryRepresentation
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v7 = @"code";
  unint64_t v2 = [(INScanVisualCodeIntentResponse *)self code];
  unint64_t v3 = v2;
  if (v2 <= 5)
  {
    v4 = off_1E551B0E8[v2];
  }
  else
  {
    v4 = [MEMORY[0x1E4F1CA98] null];
  }
  v8[0] = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
  if (v3 >= 6) {

  }
  return v5;
}

- (int64_t)_codeWithName:(id)a3
{
  id v3 = a3;
  [v3 isEqualToString:@"INScanVisualCodeIntentResponseCodeUnspecified"];
  uint64_t v4 = [v3 isEqualToString:@"INScanVisualCodeIntentResponseCodeReady"];
  if ([v3 isEqualToString:@"INScanVisualCodeIntentResponseCodeContinueInApp"]) {
    uint64_t v4 = 2;
  }
  if ([v3 isEqualToString:@"INScanVisualCodeIntentResponseCodeFailure"]) {
    uint64_t v4 = 3;
  }
  if ([v3 isEqualToString:@"INScanVisualCodeIntentResponseCodeFailureRequiringAppLaunch"])int64_t v5 = 4; {
  else
  }
    int64_t v5 = v4;
  int v6 = [v3 isEqualToString:@"INScanVisualCodeIntentResponseCodeFailureAppConfigurationRequired"];

  if (v6) {
    return 5;
  }
  else {
    return v5;
  }
}

- (int64_t)_intentResponseCode
{
  int64_t v2 = [(INScanVisualCodeIntentResponse *)self code];
  if ((unint64_t)(v2 - 1) > 4) {
    return 0;
  }
  else {
    return qword_18CFC4B98[v2 - 1];
  }
}

- (INScanVisualCodeIntentResponse)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)INScanVisualCodeIntentResponse;
  return [(INIntentResponse *)&v4 initWithCoder:a3];
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)INScanVisualCodeIntentResponse;
  [(INIntentResponse *)&v3 encodeWithCoder:a3];
}

- (int64_t)code
{
  v3.receiver = self;
  v3.super_class = (Class)INScanVisualCodeIntentResponse;
  return [(INIntentResponse *)&v3 code];
}

- (INScanVisualCodeIntentResponse)initWithBackingStore:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)INScanVisualCodeIntentResponse;
  return [(INIntentResponse *)&v4 initWithBackingStore:a3];
}

- (id)_initWithCode:(int64_t)a3 userActivity:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)INScanVisualCodeIntentResponse;
  return [(INIntentResponse *)&v5 _initWithCode:a3 userActivity:a4];
}

- (INScanVisualCodeIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v7 = (void *)INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
  {
    if ((unint64_t)a3 > 5) {
      v8 = 0;
    }
    else {
      v8 = off_1E551B0E8[a3];
    }
    *(_DWORD *)buf = 136315906;
    v14 = "-[INScanVisualCodeIntentResponse initWithCode:userActivity:]";
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
  v12.super_class = (Class)INScanVisualCodeIntentResponse;
  v10 = [(INIntentResponse *)&v12 _initWithCode:a3 userActivity:v6];

  return v10;
}

- (INScanVisualCodeIntentResponse)init
{
  return [(INScanVisualCodeIntentResponse *)self initWithCode:0 userActivity:0];
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
  if ((unint64_t)(a3 - 1) > 4) {
    return 3;
  }
  else {
    return dword_18CFC4B80[a3 - 1];
  }
}

+ (int64_t)_codeFromType:(int)a3 errorCode:(int)a4 appLaunchRequested:(BOOL)a5
{
  int64_t v5 = 3;
  if (a5) {
    int64_t v5 = 4;
  }
  if (a4 == 1) {
    int64_t v5 = 5;
  }
  int64_t v6 = 2;
  if (a3 != 4) {
    int64_t v6 = a3 == 5;
  }
  if (a3 == 1) {
    return v5;
  }
  else {
    return v6;
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end