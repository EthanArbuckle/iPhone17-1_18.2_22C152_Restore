@interface INSendMessageIntentResponse
+ (BOOL)_appLaunchRequestedFromCode:(int64_t)a3;
+ (BOOL)supportsSecureCoding;
+ (int)_errorCodeFromCode:(int64_t)a3;
+ (int)_typeFromCode:(int64_t)a3;
+ (int64_t)_codeFromType:(int)a3 errorCode:(int)a4 appLaunchRequested:(BOOL)a5;
- (INMessage)sentMessage;
- (INSendMessageIntentResponse)initWithBackingStore:(id)a3;
- (INSendMessageIntentResponse)initWithCode:(INSendMessageIntentResponseCode)code userActivity:(NSUserActivity *)userActivity;
- (INSendMessageIntentResponse)initWithCoder:(id)a3;
- (INSendMessageIntentResponseCode)code;
- (NSArray)sentMessages;
- (id)_dictionaryRepresentation;
- (id)_initWithCode:(int64_t)a3 userActivity:(id)a4;
- (id)init;
- (int64_t)_codeWithName:(id)a3;
- (int64_t)_intentResponseCode;
- (void)encodeWithCoder:(id)a3;
- (void)setSentMessage:(INMessage *)sentMessage;
- (void)setSentMessages:(NSArray *)sentMessages;
@end

@implementation INSendMessageIntentResponse

- (id)_dictionaryRepresentation
{
  v10[2] = *MEMORY[0x1E4F143B8];
  v9[0] = @"code";
  v3 = INSendMessageIntentResponseCodeGetName([(INSendMessageIntentResponse *)self code]);
  v4 = v3;
  if (!v3)
  {
    v4 = [MEMORY[0x1E4F1CA98] null];
  }
  v9[1] = @"sentMessages";
  v10[0] = v4;
  v5 = [(INSendMessageIntentResponse *)self sentMessages];
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

- (void)setSentMessages:(NSArray *)sentMessages
{
  v4 = sentMessages;
  v5 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  v6 = INIntentSlotValueTransformToMessages(v4);

  [v5 setSentMessages:v6];
  id v8 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  v7 = [v8 data];
  [(INIntentResponse *)self _setPayloadResponseMessageData:v7];
}

- (NSArray)sentMessages
{
  v2 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  v3 = [v2 sentMessages];
  v4 = INIntentSlotValueTransformFromMessages(v3);

  return (NSArray *)v4;
}

- (int64_t)_codeWithName:(id)a3
{
  id v3 = a3;
  [v3 isEqualToString:@"INSendMessageIntentResponseCodeUnspecified"];
  uint64_t v4 = [v3 isEqualToString:@"INSendMessageIntentResponseCodeReady"];
  if ([v3 isEqualToString:@"INSendMessageIntentResponseCodeInProgress"]) {
    uint64_t v4 = 2;
  }
  if ([v3 isEqualToString:@"INSendMessageIntentResponseCodeSuccess"]) {
    uint64_t v4 = 3;
  }
  if ([v3 isEqualToString:@"INSendMessageIntentResponseCodeFailure"]) {
    uint64_t v4 = 4;
  }
  if ([v3 isEqualToString:@"INSendMessageIntentResponseCodeFailureRequiringAppLaunch"])uint64_t v4 = 5; {
  if ([v3 isEqualToString:@"INSendMessageIntentResponseCodeFailureMessageServiceNotAvailable"])uint64_t v4 = 6;
  }
  if ([v3 isEqualToString:@"INSendMessageIntentResponseCodeFailureMessageAttachmentError"])uint64_t v4 = 1000; {
  if ([v3 isEqualToString:@"INSendMessageIntentResponseCodeFailureMessageLocationNotAllowed"])uint64_t v4 = 1001;
  }
  if ([v3 isEqualToString:@"INSendMessageIntentResponseCodeFailureScreenTimeRestrictionEnabled"])uint64_t v4 = 1002; {
  if ([v3 isEqualToString:@"INSendMessageIntentResponseCodeFailureNotAMemberOfConversation"])uint64_t v4 = 1003;
  }
  if ([v3 isEqualToString:@"INSendMessageIntentResponseCodeFailureMessageLocationAuthorizationNotDetermined"])uint64_t v4 = 1004; {
  if ([v3 isEqualToString:@"INSendMessageIntentResponseCodeFailureMessagePreciseLocationNotAuthorized"])int64_t v5 = 1005;
  }
  else {
    int64_t v5 = v4;
  }
  int v6 = [v3 isEqualToString:@"INSendMessageIntentResponseCodeFailureRequiringInAppAuthentication"];

  if (v6) {
    return 7;
  }
  else {
    return v5;
  }
}

- (int64_t)_intentResponseCode
{
  INSendMessageIntentResponseCode v2 = [(INSendMessageIntentResponse *)self code];
  if (!(!v4 & v3))
  {
    switch(v2)
    {
      case INSendMessageIntentResponseCodeReady:
        return 1;
      case INSendMessageIntentResponseCodeInProgress:
        return 3;
      case INSendMessageIntentResponseCodeSuccess:
        return 4;
      case INSendMessageIntentResponseCodeFailure:
      case INSendMessageIntentResponseCodeFailureMessageServiceNotAvailable:
      case INSendMessageIntentResponseCodeFailureRequiringInAppAuthentication:
        goto LABEL_5;
      case INSendMessageIntentResponseCodeFailureRequiringAppLaunch:
        return 6;
      default:
        JUMPOUT(0);
    }
  }
  switch(v2)
  {
    case 1000:
    case 1001:
    case 1002:
    case 1003:
    case 1004:
    case 1005:
LABEL_5:
      int64_t result = 5;
      break;
    default:
      int64_t result = 0;
      break;
  }
  return result;
}

- (INSendMessageIntentResponse)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)INSendMessageIntentResponse;
  return [(INIntentResponse *)&v4 initWithCoder:a3];
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)INSendMessageIntentResponse;
  [(INIntentResponse *)&v3 encodeWithCoder:a3];
}

- (INSendMessageIntentResponseCode)code
{
  v3.receiver = self;
  v3.super_class = (Class)INSendMessageIntentResponse;
  return [(INIntentResponse *)&v3 code];
}

- (INSendMessageIntentResponse)initWithBackingStore:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)INSendMessageIntentResponse;
  return [(INIntentResponse *)&v4 initWithBackingStore:a3];
}

- (id)_initWithCode:(int64_t)a3 userActivity:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)INSendMessageIntentResponse;
  return [(INIntentResponse *)&v5 _initWithCode:a3 userActivity:a4];
}

- (INSendMessageIntentResponse)initWithCode:(INSendMessageIntentResponseCode)code userActivity:(NSUserActivity *)userActivity
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  int v6 = userActivity;
  v7 = (void *)INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
  {
    id v8 = v7;
    v9 = INSendMessageIntentResponseCodeGetName(code);
    *(_DWORD *)buf = 136315906;
    v14 = "-[INSendMessageIntentResponse initWithCode:userActivity:]";
    __int16 v15 = 2048;
    INSendMessageIntentResponseCode v16 = code;
    __int16 v17 = 2112;
    v18 = v9;
    __int16 v19 = 2112;
    v20 = v6;
    _os_log_impl(&dword_18CB2F000, v8, OS_LOG_TYPE_INFO, "%s code = %zd (%@), userActivity = %@", buf, 0x2Au);
  }
  v12.receiver = self;
  v12.super_class = (Class)INSendMessageIntentResponse;
  v10 = [(INIntentResponse *)&v12 _initWithCode:code userActivity:v6];

  return v10;
}

- (id)init
{
  return [(INSendMessageIntentResponse *)self initWithCode:0 userActivity:0];
}

+ (BOOL)_appLaunchRequestedFromCode:(int64_t)a3
{
  return a3 == 5;
}

+ (int)_errorCodeFromCode:(int64_t)a3
{
  switch(a3)
  {
    case 1000:
      int result = 2;
      break;
    case 1001:
      int result = 3;
      break;
    case 1002:
      int result = 4;
      break;
    case 1003:
      int result = 5;
      break;
    case 1004:
      int result = 6;
      break;
    case 1005:
      int result = 7;
      break;
    default:
      if (a3 == 6) {
        int v4 = 1;
      }
      else {
        int v4 = 0x7FFFFFFF;
      }
      if (a3 == 7) {
        int result = 8;
      }
      else {
        int result = v4;
      }
      break;
  }
  return result;
}

+ (int)_typeFromCode:(int64_t)a3
{
  if (!(!v4 & v3))
  {
    switch(a3)
    {
      case 1:
        return 5;
      case 2:
        return 2;
      case 3:
        return 0;
      case 4:
      case 5:
      case 6:
      case 7:
        return 1;
      default:
        JUMPOUT(0);
    }
  }
  if ((unint64_t)(a3 - 1000) < 6) {
    return 1;
  }
  else {
    return 3;
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
      if ((a4 - 1) >= 8)
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
        int64_t result = qword_18CFC4B18[a4 - 1];
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

- (void)setSentMessage:(INMessage *)sentMessage
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v7 = sentMessage;
  char v4 = (void *)MEMORY[0x1E4F1C978];
  objc_super v5 = sentMessage;
  int v6 = [v4 arrayWithObjects:&v7 count:1];

  -[INSendMessageIntentResponse setSentMessages:](self, "setSentMessages:", v6, v7, v8);
}

- (INMessage)sentMessage
{
  char v3 = [(INSendMessageIntentResponse *)self sentMessages];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    objc_super v5 = [(INSendMessageIntentResponse *)self sentMessages];
    int v6 = [v5 objectAtIndexedSubscript:0];
  }
  else
  {
    int v6 = 0;
  }

  return (INMessage *)v6;
}

@end