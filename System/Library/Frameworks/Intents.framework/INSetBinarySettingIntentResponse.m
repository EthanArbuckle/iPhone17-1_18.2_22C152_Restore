@interface INSetBinarySettingIntentResponse
+ (BOOL)_appLaunchRequestedFromCode:(int64_t)a3;
+ (BOOL)supportsSecureCoding;
+ (int)_errorCodeFromCode:(int64_t)a3;
+ (int)_typeFromCode:(int64_t)a3;
+ (int64_t)_codeFromType:(int)a3 errorCode:(int)a4 appLaunchRequested:(BOOL)a5;
- (INSetBinarySettingIntentResponse)init;
- (INSetBinarySettingIntentResponse)initWithBackingStore:(id)a3;
- (INSetBinarySettingIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4;
- (INSetBinarySettingIntentResponse)initWithCoder:(id)a3;
- (NSString)errorDetail;
- (id)_dictionaryRepresentation;
- (id)_initWithCode:(int64_t)a3 userActivity:(id)a4;
- (int64_t)_codeWithName:(id)a3;
- (int64_t)_intentResponseCode;
- (int64_t)code;
- (int64_t)oldValue;
- (int64_t)updatedValue;
- (void)encodeWithCoder:(id)a3;
- (void)setErrorDetail:(id)a3;
- (void)setOldValue:(int64_t)a3;
- (void)setUpdatedValue:(int64_t)a3;
@end

@implementation INSetBinarySettingIntentResponse

- (id)_dictionaryRepresentation
{
  v17[4] = *MEMORY[0x1E4F143B8];
  v16[0] = @"code";
  unint64_t v3 = [(INSetBinarySettingIntentResponse *)self code];
  unint64_t v4 = v3;
  if (v3 <= 8)
  {
    v5 = *(&off_1E5520310 + v3);
  }
  else
  {
    v5 = [MEMORY[0x1E4F1CA98] null];
  }
  v17[0] = v5;
  v16[1] = @"oldValue";
  int64_t v6 = [(INSetBinarySettingIntentResponse *)self oldValue];
  if ((unint64_t)(v6 - 1) > 2) {
    v7 = @"unknown";
  }
  else {
    v7 = *(&off_1E5520240 + v6 - 1);
  }
  v8 = v7;
  v17[1] = v8;
  v16[2] = @"updatedValue";
  int64_t v9 = [(INSetBinarySettingIntentResponse *)self updatedValue];
  if ((unint64_t)(v9 - 1) > 2) {
    v10 = @"unknown";
  }
  else {
    v10 = *(&off_1E5520240 + v9 - 1);
  }
  v11 = v10;
  v17[2] = v11;
  v16[3] = @"errorDetail";
  v12 = [(INSetBinarySettingIntentResponse *)self errorDetail];
  v13 = v12;
  if (!v12)
  {
    v13 = [MEMORY[0x1E4F1CA98] null];
  }
  v17[3] = v13;
  v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:4];
  if (!v12) {

  }
  if (v4 >= 9) {

  }
  return v14;
}

- (void)setErrorDetail:(id)a3
{
  id v4 = a3;
  v5 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  [v5 setErrorDetail:v4];

  id v7 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  int64_t v6 = [v7 data];
  [(INIntentResponse *)self _setPayloadResponseMessageData:v6];
}

- (void)setUpdatedValue:(int64_t)a3
{
  unint64_t v4 = a3 - 1;
  v5 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  int64_t v6 = v5;
  if (v4 > 2) {
    [v5 setHasUpdatedValue:0];
  }
  else {
    objc_msgSend(v5, "setUpdatedValue:");
  }

  id v8 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  id v7 = [v8 data];
  [(INIntentResponse *)self _setPayloadResponseMessageData:v7];
}

- (void)setOldValue:(int64_t)a3
{
  unint64_t v4 = a3 - 1;
  v5 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  int64_t v6 = v5;
  if (v4 > 2) {
    [v5 setHasOldValue:0];
  }
  else {
    objc_msgSend(v5, "setOldValue:");
  }

  id v8 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  id v7 = [v8 data];
  [(INIntentResponse *)self _setPayloadResponseMessageData:v7];
}

- (NSString)errorDetail
{
  v2 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  unint64_t v3 = [v2 errorDetail];
  unint64_t v4 = (void *)[v3 copy];

  return (NSString *)v4;
}

- (int64_t)updatedValue
{
  unint64_t v3 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  int v4 = [v3 hasUpdatedValue];
  v5 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  uint64_t v6 = [v5 updatedValue] - 1;
  if (v6 <= 2) {
    int64_t v7 = v6 + 1;
  }
  else {
    int64_t v7 = 0;
  }
  if (v4) {
    int64_t v8 = v7;
  }
  else {
    int64_t v8 = 0;
  }

  return v8;
}

- (int64_t)oldValue
{
  unint64_t v3 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  int v4 = [v3 hasOldValue];
  v5 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  uint64_t v6 = [v5 oldValue] - 1;
  if (v6 <= 2) {
    int64_t v7 = v6 + 1;
  }
  else {
    int64_t v7 = 0;
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
  [v3 isEqualToString:@"INSetBinarySettingIntentResponseCodeUnspecified"];
  uint64_t v4 = [v3 isEqualToString:@"INSetBinarySettingIntentResponseCodeReady"];
  if ([v3 isEqualToString:@"INSetBinarySettingIntentResponseCodeInProgress"]) {
    uint64_t v4 = 2;
  }
  if ([v3 isEqualToString:@"INSetBinarySettingIntentResponseCodeSuccess"]) {
    uint64_t v4 = 3;
  }
  if ([v3 isEqualToString:@"INSetBinarySettingIntentResponseCodeFailure"]) {
    uint64_t v4 = 4;
  }
  if ([v3 isEqualToString:@"INSetBinarySettingIntentResponseCodeFailureRequiringAppLaunch"])uint64_t v4 = 5; {
  if ([v3 isEqualToString:@"INSetBinarySettingIntentResponseCodeFailureInvalidTrigger"])uint64_t v4 = 6;
  }
  if ([v3 isEqualToString:@"INSetBinarySettingIntentResponseCodeFailureUnsupported"])int64_t v5 = 7; {
  else
  }
    int64_t v5 = v4;
  int v6 = [v3 isEqualToString:@"INSetBinarySettingIntentResponseCodeFailureOtherWithReason"];

  if (v6) {
    return 8;
  }
  else {
    return v5;
  }
}

- (int64_t)_intentResponseCode
{
  int64_t v2 = [(INSetBinarySettingIntentResponse *)self code];
  if ((unint64_t)(v2 - 1) > 7) {
    return 0;
  }
  else {
    return qword_18CFC5638[v2 - 1];
  }
}

- (INSetBinarySettingIntentResponse)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)INSetBinarySettingIntentResponse;
  return [(INIntentResponse *)&v4 initWithCoder:a3];
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)INSetBinarySettingIntentResponse;
  [(INIntentResponse *)&v3 encodeWithCoder:a3];
}

- (int64_t)code
{
  v3.receiver = self;
  v3.super_class = (Class)INSetBinarySettingIntentResponse;
  return [(INIntentResponse *)&v3 code];
}

- (INSetBinarySettingIntentResponse)initWithBackingStore:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)INSetBinarySettingIntentResponse;
  return [(INIntentResponse *)&v4 initWithBackingStore:a3];
}

- (id)_initWithCode:(int64_t)a3 userActivity:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)INSetBinarySettingIntentResponse;
  return [(INIntentResponse *)&v5 _initWithCode:a3 userActivity:a4];
}

- (INSetBinarySettingIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  int64_t v7 = (void *)INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
  {
    if ((unint64_t)a3 > 8) {
      uint64_t v8 = 0;
    }
    else {
      uint64_t v8 = (uint64_t)*(&off_1E5520310 + a3);
    }
    *(_DWORD *)buf = 136315906;
    v14 = "-[INSetBinarySettingIntentResponse initWithCode:userActivity:]";
    __int16 v15 = 2048;
    int64_t v16 = a3;
    __int16 v17 = 2112;
    uint64_t v18 = v8;
    __int16 v19 = 2112;
    id v20 = v6;
    int64_t v9 = v7;
    _os_log_impl(&dword_18CB2F000, v9, OS_LOG_TYPE_INFO, "%s code = %zd (%@), userActivity = %@", buf, 0x2Au);
  }
  v12.receiver = self;
  v12.super_class = (Class)INSetBinarySettingIntentResponse;
  v10 = [(INIntentResponse *)&v12 _initWithCode:a3 userActivity:v6];

  return v10;
}

- (INSetBinarySettingIntentResponse)init
{
  return [(INSetBinarySettingIntentResponse *)self initWithCode:0 userActivity:0];
}

+ (BOOL)_appLaunchRequestedFromCode:(int64_t)a3
{
  return a3 == 5;
}

+ (int)_errorCodeFromCode:(int64_t)a3
{
  if ((unint64_t)(a3 - 6) < 3) {
    return a3 - 5;
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
    return dword_18CFC5618[a3 - 1];
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
      uint64_t v6 = (a4 - 1);
      int64_t v7 = 4;
      if (a5) {
        int64_t v7 = 5;
      }
      if (v6 >= 3) {
        int64_t result = v7;
      }
      else {
        int64_t result = v6 + 6;
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