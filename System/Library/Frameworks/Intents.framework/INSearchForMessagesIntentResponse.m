@interface INSearchForMessagesIntentResponse
+ (BOOL)_appLaunchRequestedFromCode:(int64_t)a3;
+ (BOOL)supportsSecureCoding;
+ (int)_errorCodeFromCode:(int64_t)a3;
+ (int)_typeFromCode:(int64_t)a3;
+ (int64_t)_codeFromType:(int)a3 errorCode:(int)a4 appLaunchRequested:(BOOL)a5;
- (INSearchForMessagesIntentResponse)initWithBackingStore:(id)a3;
- (INSearchForMessagesIntentResponse)initWithCode:(INSearchForMessagesIntentResponseCode)code userActivity:(NSUserActivity *)userActivity;
- (INSearchForMessagesIntentResponse)initWithCoder:(id)a3;
- (INSearchForMessagesIntentResponseCode)code;
- (NSArray)messages;
- (id)_dictionaryRepresentation;
- (id)_initWithCode:(int64_t)a3 userActivity:(id)a4;
- (id)_redactedDictionaryRepresentation;
- (id)init;
- (int64_t)_codeWithName:(id)a3;
- (int64_t)_intentResponseCode;
- (void)encodeWithCoder:(id)a3;
- (void)setMessages:(NSArray *)messages;
@end

@implementation INSearchForMessagesIntentResponse

- (id)_dictionaryRepresentation
{
  v10[2] = *MEMORY[0x1E4F143B8];
  v9[0] = @"code";
  v3 = INSearchForMessagesIntentResponseCodeGetName([(INSearchForMessagesIntentResponse *)self code]);
  v4 = v3;
  if (!v3)
  {
    v4 = [MEMORY[0x1E4F1CA98] null];
  }
  v9[1] = @"messages";
  v10[0] = v4;
  v5 = [(INSearchForMessagesIntentResponse *)self messages];
  v6 = v5;
  if (!v5)
  {
    v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v10[1] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];
  if (!v5) {

  }
  if (!v3) {

  }
  return v7;
}

- (id)_redactedDictionaryRepresentation
{
  v2 = [(INSearchForMessagesIntentResponse *)self _dictionaryRepresentation];
  v3 = (void *)[v2 mutableCopy];

  [v3 setObject:@"<redacted>" forKey:@"messages"];

  return v3;
}

- (void)setMessages:(NSArray *)messages
{
  v4 = messages;
  v5 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  v6 = INIntentSlotValueTransformToMessages(v4);

  [v5 setMessages:v6];
  id v8 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  v7 = [v8 data];
  [(INIntentResponse *)self _setPayloadResponseMessageData:v7];
}

- (NSArray)messages
{
  v2 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  v3 = [v2 messages];
  v4 = INIntentSlotValueTransformFromMessages(v3);

  return (NSArray *)v4;
}

- (int64_t)_codeWithName:(id)a3
{
  id v3 = a3;
  [v3 isEqualToString:@"INSearchForMessagesIntentResponseCodeUnspecified"];
  uint64_t v4 = [v3 isEqualToString:@"INSearchForMessagesIntentResponseCodeReady"];
  if ([v3 isEqualToString:@"INSearchForMessagesIntentResponseCodeInProgress"]) {
    uint64_t v4 = 2;
  }
  if ([v3 isEqualToString:@"INSearchForMessagesIntentResponseCodeSuccess"]) {
    uint64_t v4 = 3;
  }
  if ([v3 isEqualToString:@"INSearchForMessagesIntentResponseCodeFailure"]) {
    uint64_t v4 = 4;
  }
  if ([v3 isEqualToString:@"INSearchForMessagesIntentResponseCodeFailureRequiringAppLaunch"])uint64_t v4 = 5; {
  if ([v3 isEqualToString:@"INSearchForMessagesIntentResponseCodeFailureMessageServiceNotAvailable"])uint64_t v4 = 6;
  }
  if ([v3 isEqualToString:@"INSearchForMessagesIntentResponseCodeFailureMessageTooManyResults"])uint64_t v4 = 7; {
  if ([v3 isEqualToString:@"INSearchForMessagesIntentResponseCodeFailureScreenTimeRestrictionEnabled"])int64_t v5 = 1000;
  }
  else {
    int64_t v5 = v4;
  }
  int v6 = [v3 isEqualToString:@"INSearchForMessagesIntentResponseCodeFailureRequiringInAppAuthentication"];

  if (v6) {
    return 8;
  }
  else {
    return v5;
  }
}

- (int64_t)_intentResponseCode
{
  INSearchForMessagesIntentResponseCode v2 = [(INSearchForMessagesIntentResponse *)self code];
  switch(v2)
  {
    case INSearchForMessagesIntentResponseCodeReady:
      int64_t result = 1;
      break;
    case INSearchForMessagesIntentResponseCodeInProgress:
      int64_t result = 3;
      break;
    case INSearchForMessagesIntentResponseCodeSuccess:
      int64_t result = 4;
      break;
    case INSearchForMessagesIntentResponseCodeFailure:
    case INSearchForMessagesIntentResponseCodeFailureMessageServiceNotAvailable:
    case INSearchForMessagesIntentResponseCodeFailureMessageTooManyResults:
    case INSearchForMessagesIntentResponseCodeFailureRequiringInAppAuthentication:
      int64_t result = 5;
      break;
    case INSearchForMessagesIntentResponseCodeFailureRequiringAppLaunch:
      int64_t result = 6;
      break;
    default:
      if (v2 == 1000) {
        int64_t result = 5;
      }
      else {
        int64_t result = 0;
      }
      break;
  }
  return result;
}

- (INSearchForMessagesIntentResponse)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)INSearchForMessagesIntentResponse;
  return [(INIntentResponse *)&v4 initWithCoder:a3];
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)INSearchForMessagesIntentResponse;
  [(INIntentResponse *)&v3 encodeWithCoder:a3];
}

- (INSearchForMessagesIntentResponseCode)code
{
  v3.receiver = self;
  v3.super_class = (Class)INSearchForMessagesIntentResponse;
  return [(INIntentResponse *)&v3 code];
}

- (INSearchForMessagesIntentResponse)initWithBackingStore:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)INSearchForMessagesIntentResponse;
  return [(INIntentResponse *)&v4 initWithBackingStore:a3];
}

- (id)_initWithCode:(int64_t)a3 userActivity:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)INSearchForMessagesIntentResponse;
  return [(INIntentResponse *)&v5 _initWithCode:a3 userActivity:a4];
}

- (INSearchForMessagesIntentResponse)initWithCode:(INSearchForMessagesIntentResponseCode)code userActivity:(NSUserActivity *)userActivity
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  int v6 = userActivity;
  v7 = (void *)INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
  {
    id v8 = v7;
    v9 = INSearchForMessagesIntentResponseCodeGetName(code);
    *(_DWORD *)buf = 136315906;
    v14 = "-[INSearchForMessagesIntentResponse initWithCode:userActivity:]";
    __int16 v15 = 2048;
    INSearchForMessagesIntentResponseCode v16 = code;
    __int16 v17 = 2112;
    v18 = v9;
    __int16 v19 = 2112;
    v20 = v6;
    _os_log_impl(&dword_18CB2F000, v8, OS_LOG_TYPE_INFO, "%s code = %zd (%@), userActivity = %@", buf, 0x2Au);
  }
  v12.receiver = self;
  v12.super_class = (Class)INSearchForMessagesIntentResponse;
  v10 = [(INIntentResponse *)&v12 _initWithCode:code userActivity:v6];

  return v10;
}

- (id)init
{
  return [(INSearchForMessagesIntentResponse *)self initWithCode:0 userActivity:0];
}

+ (BOOL)_appLaunchRequestedFromCode:(int64_t)a3
{
  return a3 == 5;
}

+ (int)_errorCodeFromCode:(int64_t)a3
{
  if (a3 == 1000) {
    int v3 = 3;
  }
  else {
    int v3 = 0x7FFFFFFF;
  }
  if (a3 == 8) {
    int v4 = 4;
  }
  else {
    int v4 = v3;
  }
  if (a3 == 7) {
    int v5 = 2;
  }
  else {
    int v5 = 0x7FFFFFFF;
  }
  if (a3 == 6) {
    int v5 = 1;
  }
  if (a3 <= 7) {
    return v5;
  }
  else {
    return v4;
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
    case 7:
    case 8:
      goto LABEL_2;
    default:
      if (a3 == 1000) {
LABEL_2:
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
      if ((a4 - 1) >= 4)
      {
        if (a5) {
          int64_t result = 5;
        }
        else {
          int64_t result = 4;
        }
      }
      else
      {
        int64_t result = qword_18CFC45E0[a4 - 1];
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