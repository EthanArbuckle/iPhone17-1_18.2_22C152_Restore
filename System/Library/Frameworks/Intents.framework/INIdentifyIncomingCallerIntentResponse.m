@interface INIdentifyIncomingCallerIntentResponse
+ (BOOL)_appLaunchRequestedFromCode:(int64_t)a3;
+ (BOOL)supportsSecureCoding;
+ (int)_errorCodeFromCode:(int64_t)a3;
+ (int)_typeFromCode:(int64_t)a3;
+ (int64_t)_codeFromType:(int)a3 errorCode:(int)a4 appLaunchRequested:(BOOL)a5;
- (INIdentifyIncomingCallerIntentResponse)init;
- (INIdentifyIncomingCallerIntentResponse)initWithBackingStore:(id)a3;
- (INIdentifyIncomingCallerIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4;
- (INIdentifyIncomingCallerIntentResponse)initWithCoder:(id)a3;
- (NSArray)callRecords;
- (id)_dictionaryRepresentation;
- (id)_initWithCode:(int64_t)a3 userActivity:(id)a4;
- (int64_t)_codeWithName:(id)a3;
- (int64_t)_intentResponseCode;
- (int64_t)code;
- (int64_t)statusCode;
- (void)encodeWithCoder:(id)a3;
- (void)setCallRecords:(id)a3;
- (void)setStatusCode:(int64_t)a3;
@end

@implementation INIdentifyIncomingCallerIntentResponse

- (id)_dictionaryRepresentation
{
  v14[3] = *MEMORY[0x1E4F143B8];
  v13[0] = @"code";
  unint64_t v3 = [(INIdentifyIncomingCallerIntentResponse *)self code];
  unint64_t v4 = v3;
  if (v3 <= 6)
  {
    v5 = off_1E551F438[v3];
  }
  else
  {
    v5 = [MEMORY[0x1E4F1CA98] null];
  }
  v14[0] = v5;
  v13[1] = @"statusCode";
  int64_t v6 = [(INIdentifyIncomingCallerIntentResponse *)self statusCode];
  v7 = @"unknown";
  if (v6 == 2) {
    v7 = @"incomingCall";
  }
  if (v6 == 1) {
    v7 = @"noIncomingCall";
  }
  v8 = v7;
  v14[1] = v8;
  v13[2] = @"callRecords";
  v9 = [(INIdentifyIncomingCallerIntentResponse *)self callRecords];
  v10 = v9;
  if (!v9)
  {
    v10 = [MEMORY[0x1E4F1CA98] null];
  }
  v14[2] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:3];
  if (!v9) {

  }
  if (v4 >= 7) {

  }
  return v11;
}

- (void)setCallRecords:(id)a3
{
  id v4 = a3;
  v5 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  int64_t v6 = INIntentSlotValueTransformToCallRecordValues(v4);

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
  int64_t v6 = [(INIntentResponse *)self _responseMessagePBRepresentation];
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

- (NSArray)callRecords
{
  v2 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  unint64_t v3 = [v2 callRecords];
  unsigned int v4 = INIntentSlotValueTransformFromCallRecordValues(v3);

  return (NSArray *)v4;
}

- (int64_t)statusCode
{
  unint64_t v3 = [(INIntentResponse *)self _responseMessagePBRepresentation];
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
  [v3 isEqualToString:@"INIdentifyIncomingCallerIntentResponseCodeUnspecified"];
  uint64_t v4 = [v3 isEqualToString:@"INIdentifyIncomingCallerIntentResponseCodeReady"];
  if ([v3 isEqualToString:@"INIdentifyIncomingCallerIntentResponseCodeInProgress"]) {
    uint64_t v4 = 2;
  }
  if ([v3 isEqualToString:@"INIdentifyIncomingCallerIntentResponseCodeSuccess"]) {
    uint64_t v4 = 3;
  }
  if ([v3 isEqualToString:@"INIdentifyIncomingCallerIntentResponseCodeFailure"]) {
    int64_t v5 = 4;
  }
  else {
    int64_t v5 = v4;
  }
  int v6 = [v3 isEqualToString:@"INIdentifyIncomingCallerIntentResponseCodeFailureRequiringAppLaunch"];

  if (v6) {
    return 5;
  }
  else {
    return v5;
  }
}

- (int64_t)_intentResponseCode
{
  int64_t v2 = [(INIdentifyIncomingCallerIntentResponse *)self code];
  if ((unint64_t)(v2 - 1) > 4) {
    return 0;
  }
  else {
    return qword_18CFC5A10[v2 - 1];
  }
}

- (INIdentifyIncomingCallerIntentResponse)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)INIdentifyIncomingCallerIntentResponse;
  return [(INIntentResponse *)&v4 initWithCoder:a3];
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)INIdentifyIncomingCallerIntentResponse;
  [(INIntentResponse *)&v3 encodeWithCoder:a3];
}

- (int64_t)code
{
  v3.receiver = self;
  v3.super_class = (Class)INIdentifyIncomingCallerIntentResponse;
  return [(INIntentResponse *)&v3 code];
}

- (INIdentifyIncomingCallerIntentResponse)initWithBackingStore:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)INIdentifyIncomingCallerIntentResponse;
  return [(INIntentResponse *)&v4 initWithBackingStore:a3];
}

- (id)_initWithCode:(int64_t)a3 userActivity:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)INIdentifyIncomingCallerIntentResponse;
  return [(INIntentResponse *)&v5 _initWithCode:a3 userActivity:a4];
}

- (INIdentifyIncomingCallerIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = (void *)INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
  {
    if ((unint64_t)a3 > 6) {
      int64_t v8 = 0;
    }
    else {
      int64_t v8 = off_1E551F438[a3];
    }
    *(_DWORD *)buf = 136315906;
    v14 = "-[INIdentifyIncomingCallerIntentResponse initWithCode:userActivity:]";
    __int16 v15 = 2048;
    int64_t v16 = a3;
    __int16 v17 = 2112;
    v18 = v8;
    __int16 v19 = 2112;
    id v20 = v6;
    id v9 = v7;
    _os_log_impl(&dword_18CB2F000, v9, OS_LOG_TYPE_INFO, "%s code = %zd (%@), userActivity = %@", buf, 0x2Au);
  }
  v12.receiver = self;
  v12.super_class = (Class)INIdentifyIncomingCallerIntentResponse;
  v10 = [(INIntentResponse *)&v12 _initWithCode:a3 userActivity:v6];

  return v10;
}

- (INIdentifyIncomingCallerIntentResponse)init
{
  return [(INIdentifyIncomingCallerIntentResponse *)self initWithCode:0 userActivity:0];
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